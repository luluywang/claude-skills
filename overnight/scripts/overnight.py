#!/usr/bin/env python3
"""Run state and Stop hook for /overnight.

A run is one JSON file in ~/.claude/overnight/<run_id>.json. `start` prints the
marker OVERNIGHT_RUN::<run_id>; that line lands in the session transcript, which
is how the Stop hook knows which session owns which run. Sessions without a
marker are never touched.

Subcommands:
  start   --hours H --project DIR [--doc URL] --goal TEXT
  wait    --run ID --minutes M --on TEXT   allow idle stops while a background watcher runs
  finish  --run ID [--reason TEXT]         end the run (a reason is required before the deadline)
  status  --run ID
  hook                                     Stop hook: reads the hook JSON on stdin
  install-hook                             register the Stop hook in ~/.claude/settings.json
"""
import argparse
import json
import os
import secrets
import shutil
import sys
import tempfile
from datetime import datetime, timedelta
from pathlib import Path

REGISTRY = Path.home() / ".claude" / "overnight"
# Skips quietly on a machine that shares settings.json but lacks the skill.
HOOK_COMMAND = ("f=~/.claude/skills/overnight/scripts/overnight.py; "
                "[ -f \"$f\" ] && python3 \"$f\" hook || true")
MAX_WAIT_MIN = 180          # one wait may not exceed this; silence must have a bound
STALL_LIMIT = 3             # blocked stops in a row with no tool call -> let the session stop
POST_DEADLINE_BLOCKS = 2    # reminders to write the report after the deadline


def now():
    return datetime.now().astimezone()


def path_for(run_id):
    return REGISTRY / f"{run_id}.json"


def load(run_id):
    p = path_for(run_id)
    if not p.exists():
        sys.exit(f"no overnight run {run_id} in {REGISTRY}")
    return json.loads(p.read_text())


def save(run):
    REGISTRY.mkdir(parents=True, exist_ok=True)
    fd, tmp = tempfile.mkstemp(dir=REGISTRY)
    with os.fdopen(fd, "w") as f:
        json.dump(run, f, indent=1)
    os.replace(tmp, path_for(run["run_id"]))


def left(run):
    secs = (datetime.fromisoformat(run["deadline"]) - now()).total_seconds()
    sign = "-" if secs < 0 else ""
    secs = abs(int(secs))
    return f"{sign}{secs // 3600}h{(secs % 3600) // 60:02d}m"


def cmd_start(a):
    if not 0.25 <= a.hours <= 12:
        sys.exit("--hours must be between 0.25 and 12")
    project = Path(a.project).expanduser().resolve()
    run_id = now().strftime("%Y%m%d-%H%M") + "-" + secrets.token_hex(2)
    run_dir = project / ".overnight" / run_id
    run_dir.mkdir(parents=True, exist_ok=True)
    exclude = project / ".git" / "info" / "exclude"
    if exclude.parent.is_dir():
        text = exclude.read_text() if exclude.exists() else ""
        if ".overnight/" not in text.split():
            exclude.write_text(text + ("" if text.endswith("\n") or not text else "\n") + ".overnight/\n")
    deadline = now() + timedelta(hours=a.hours)
    run = dict(run_id=run_id, project=str(project), run_dir=str(run_dir), goal=a.goal,
               doc=a.doc or "", started=now().isoformat(), deadline=deadline.isoformat(),
               status="active", session_id="", wait_until="", wait_on="",
               last_tool_count=-1, stalls=0, post_deadline_blocks=0, finish_reason="")
    save(run)
    print(f"OVERNIGHT_RUN::{run_id}")
    print(f"deadline {deadline:%a %H:%M} ({a.hours:g} h); run dir {run_dir}")


def cmd_wait(a):
    run = load(a.run)
    minutes = min(a.minutes, MAX_WAIT_MIN)
    run.update(status="waiting", wait_until=(now() + timedelta(minutes=minutes)).isoformat(), wait_on=a.on)
    save(run)
    print(f"waiting up to {minutes} min on: {a.on}. End the turn now; the watcher's exit wakes the session.")


def cmd_finish(a):
    run = load(a.run)
    early = now() < datetime.fromisoformat(run["deadline"])
    if early and not a.reason:
        sys.exit(f"{left(run)} left before the deadline: pass --reason to finish early")
    run.update(status="finished", finish_reason=a.reason or "deadline reached", finished=now().isoformat())
    save(run)
    print(f"run {a.run} finished ({run['finish_reason']})")


def cmd_status(a):
    run = load(a.run)
    print(json.dumps({k: run[k] for k in ("run_id", "status", "deadline", "wait_until", "wait_on", "doc", "run_dir")}, indent=1))
    print("time left:", left(run))


def tool_count(transcript):
    try:
        data = Path(transcript).read_bytes()
    except OSError:
        return -1
    return data.count(b'"type":"tool_use"') + data.count(b'"type": "tool_use"')


def find_run(session_id, transcript):
    """Return the live run this session owns, or None."""
    if not REGISTRY.is_dir():
        return None
    live = []
    for p in REGISTRY.glob("*.json"):
        try:
            run = json.loads(p.read_text())
        except (OSError, ValueError):
            continue
        if run.get("status") in ("active", "waiting"):
            live.append(run)
    if not live:
        return None
    for run in live:
        if run["session_id"] == session_id:
            return run
    try:
        data = Path(transcript).read_bytes()
    except OSError:
        return None
    for run in live:
        if not run["session_id"] and f"OVERNIGHT_RUN::{run['run_id']}".encode() in data:
            run["session_id"] = session_id
            save(run)
            return run
    return None


def block(reason):
    print(json.dumps({"decision": "block", "reason": reason}))


def cmd_hook(_):
    try:
        inp = json.load(sys.stdin)
    except ValueError:
        return
    run = find_run(inp.get("session_id", ""), inp.get("transcript_path", ""))
    if run is None:
        return
    t = now()
    tool = f"python3 ~/.claude/skills/overnight/scripts/overnight.py"
    rid = run["run_id"]

    if t >= datetime.fromisoformat(run["deadline"]):
        if run["post_deadline_blocks"] >= POST_DEADLINE_BLOCKS:
            run.update(status="expired")
            save(run)
            return
        run["post_deadline_blocks"] += 1
        save(run)
        block(f"Overnight run {rid}: the deadline has passed. Stop starting new work. Finish the "
              f"morning report{' in ' + run['doc'] if run['doc'] else ''} (verdict first, assumptions "
              f"to confirm, questions), commit, then run `{tool} finish --run {rid}` and end the turn.")
        return

    if run["status"] == "waiting" and run["wait_until"] and t < datetime.fromisoformat(run["wait_until"]):
        return  # idle on purpose; a background watcher will wake the session
    if run["status"] == "waiting":
        run.update(status="active", wait_until="", wait_on="")

    n = tool_count(inp.get("transcript_path", ""))
    run["stalls"] = run["stalls"] + 1 if n == run["last_tool_count"] else 0
    run["last_tool_count"] = n
    if run["stalls"] >= STALL_LIMIT:
        run.update(status="stalled")
        save(run)
        return
    save(run)
    block(f"Overnight run {rid} is still active: {left(run)} left (deadline "
          f"{datetime.fromisoformat(run['deadline']):%H:%M}). The user is asleep, so do not end the run "
          f"and do not ask questions. Re-read {run['run_dir']}/PLAN.md and continue with the next item. "
          f"If the core answer is done, use the time to verify it, test the riskiest assumption, or take a "
          f"stretch item. To wait for jobs, start a background watcher, run `{tool} wait --run {rid} "
          f"--minutes M --on '<what>'`, then end the turn. To end early with a reason, run "
          f"`{tool} finish --run {rid} --reason '<why>'` after the report is written.")


def cmd_install_hook(_):
    settings = Path(os.path.realpath(Path.home() / ".claude" / "settings.json"))
    data = json.loads(settings.read_text()) if settings.exists() else {}
    entries = data.setdefault("hooks", {}).setdefault("Stop", [])
    ours = [h for e in entries for h in e.get("hooks", []) if "overnight.py" in h.get("command", "")]
    if ours and all(h["command"] == HOOK_COMMAND for h in ours):
        print("  overnight Stop hook already configured")
        return
    if ours:
        for h in ours:
            h["command"] = HOOK_COMMAND
    else:
        entries.append({"hooks": [{"type": "command", "command": HOOK_COMMAND, "timeout": 30}]})
    if settings.exists():
        shutil.copy2(settings, str(settings) + ".overnight-backup")
    fd, tmp = tempfile.mkstemp(dir=settings.parent)
    with os.fdopen(fd, "w") as f:
        json.dump(data, f, indent=2)
        f.write("\n")
    os.replace(tmp, settings)
    print("  added overnight Stop hook to", settings)


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("start"); s.add_argument("--hours", type=float, required=True)
    s.add_argument("--project", default="."); s.add_argument("--doc"); s.add_argument("--goal", required=True)
    s = sub.add_parser("wait"); s.add_argument("--run", required=True)
    s.add_argument("--minutes", type=int, required=True); s.add_argument("--on", required=True)
    s = sub.add_parser("finish"); s.add_argument("--run", required=True); s.add_argument("--reason")
    s = sub.add_parser("status"); s.add_argument("--run", required=True)
    sub.add_parser("hook"); sub.add_parser("install-hook")
    a = p.parse_args()
    {"start": cmd_start, "wait": cmd_wait, "finish": cmd_finish, "status": cmd_status,
     "hook": cmd_hook, "install-hook": cmd_install_hook}[a.cmd](a)


if __name__ == "__main__":
    main()
