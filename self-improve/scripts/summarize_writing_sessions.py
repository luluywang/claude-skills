#!/usr/bin/env python3
"""
summarize_writing_sessions.py — Roll turns+loops into a human-readable brief.

Reads the JSONL outputs of extract_writing_turns.py and tag_iteration_loops.py
for one or more projects and writes a markdown brief:
  - per-session table (session, file, goal signal, critic-voice cues, iter count, stop)
  - aggregate signal histogram
  - top ten loops by iteration_count

Usage:
    python3 summarize_writing_sessions.py --project crosssell
    python3 summarize_writing_sessions.py \\
        --projects crosssell,payment-network-competition,fiserv_interchange \\
        --out writing-loop-evidence.md
"""

import argparse
import json
import sys
from collections import Counter
from pathlib import Path

LOGS_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs"
DEFAULT_CACHE = LOGS_DIR / "self-improve-cache/writing-loop-mining"

GOAL_SIGNALS = {"goal_language", "more_human", "ai_tell", "mccloskey", "voice_request"}
CRITIC_SIGNALS = {"ask_critic", "verdict", "ban_phrase", "mccloskey"}


def read_jsonl(p: Path) -> list[dict]:
    if not p.exists():
        return []
    out = []
    with open(p, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                out.append(json.loads(line))
            except json.JSONDecodeError:
                continue
    return out


def first_of(turns: list[dict], tags: set) -> str:
    for t in turns:
        sigs = set(t.get("signals", []))
        if sigs & tags:
            return t["user_excerpt"][:120]
    return ""


def per_session_rows(turns: list[dict], loops: list[dict]) -> list[dict]:
    by_session: dict[str, list[dict]] = {}
    for t in turns:
        by_session.setdefault(t["session"], []).append(t)
    loops_by_session: dict[str, list[dict]] = {}
    for l in loops:
        loops_by_session.setdefault(l["session"], []).append(l)

    rows = []
    for session, items in by_session.items():
        files = Counter((t.get("edit_target") or "?") for t in items)
        top_file = files.most_common(1)[0][0]
        goal_excerpt = first_of(items, GOAL_SIGNALS)
        critic_excerpt = first_of(items, CRITIC_SIGNALS)
        session_loops = loops_by_session.get(session, [])
        max_iter = max((l["iteration_count"] for l in session_loops), default=0)
        stop = ", ".join(sorted({l["satisfaction"] for l in session_loops})) or "—"
        rows.append({
            "session": session[:8],
            "file": Path(top_file).name if top_file and top_file != "?" else "?",
            "goal": goal_excerpt,
            "critic_voice": critic_excerpt,
            "max_iter": max_iter,
            "stop": stop,
            "turn_count": len(items),
        })
    rows.sort(key=lambda r: (-r["max_iter"], -r["turn_count"]))
    return rows


def render_markdown(project_data: dict[str, tuple[list, list]]) -> str:
    lines: list[str] = []
    lines.append("# Writing-loop evidence brief")
    lines.append("")
    lines.append(f"Source: self-improve-cache/writing-loop-mining/")
    lines.append("")

    agg_sigs: Counter = Counter()
    agg_satisfaction: Counter = Counter()
    all_loops: list[tuple[str, dict]] = []

    for project, (turns, loops) in project_data.items():
        for t in turns:
            agg_sigs.update(t.get("signals", []))
        for l in loops:
            agg_satisfaction[l.get("satisfaction", "unclear")] += 1
            all_loops.append((project, l))

        lines.append(f"## Project: {project}")
        lines.append("")
        lines.append(f"- Turns with writing signals: {len(turns)}")
        lines.append(f"- Iteration loops detected: {len(loops)}")
        lines.append("")
        rows = per_session_rows(turns, loops)
        if rows:
            lines.append("| Session | File | Goal excerpt | Critic-voice excerpt | Max iter | Stop |")
            lines.append("|---|---|---|---|---|---|")
            for r in rows[:25]:
                goal = r["goal"].replace("|", "\\|")[:80]
                critic = r["critic_voice"].replace("|", "\\|")[:80]
                lines.append(
                    f"| {r['session']} | {r['file']} | {goal} | {critic} | {r['max_iter']} | {r['stop']} |"
                )
        lines.append("")

    lines.append("## Aggregate signal histogram")
    lines.append("")
    lines.append("| Signal | Count |")
    lines.append("|---|---|")
    for tag, n in agg_sigs.most_common():
        lines.append(f"| {tag} | {n} |")
    lines.append("")

    lines.append("## Termination distribution")
    lines.append("")
    for k, n in agg_satisfaction.most_common():
        lines.append(f"- {k}: {n}")
    lines.append("")

    lines.append("## Top iteration loops (by iteration count)")
    lines.append("")
    all_loops.sort(key=lambda pl: -pl[1]["iteration_count"])
    for project, l in all_loops[:10]:
        target = Path(l.get("target") or "?").name
        sig_list = ", ".join(f"{k}={v}" for k, v in l["signal_histogram"].items())
        term = l["terminating_excerpt"][:120].replace("\n", " ")
        lines.append(
            f"- **{project} / {l['session'][:8]}** — {target} — {l['iteration_count']} iter — "
            f"stop={l['satisfaction']} — signals: {sig_list}"
        )
        lines.append(f"  - terminating: _{term}_")
    lines.append("")
    return "\n".join(lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--project", default=None, help="Single project name")
    ap.add_argument("--projects", default=None,
                    help="Comma-separated list of project names")
    ap.add_argument("--cache", default=str(DEFAULT_CACHE),
                    help="Mining cache root (default: self-improve-cache/writing-loop-mining)")
    ap.add_argument("--out", default=None,
                    help="Output markdown path; default prints to stdout")
    args = ap.parse_args()

    if args.projects:
        projects = [p.strip() for p in args.projects.split(",") if p.strip()]
    elif args.project:
        projects = [args.project]
    else:
        print("[error] pass --project or --projects", file=sys.stderr)
        sys.exit(2)

    cache = Path(args.cache)
    data: dict[str, tuple[list, list]] = {}
    for p in projects:
        turns = read_jsonl(cache / p / "turns.jsonl")
        loops = read_jsonl(cache / p / "loops.jsonl")
        data[p] = (turns, loops)

    md = render_markdown(data)
    if args.out:
        out = Path(args.out)
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(md, encoding="utf-8")
        print(json.dumps({"out": str(out), "projects": projects}, indent=2))
    else:
        sys.stdout.write(md)


if __name__ == "__main__":
    main()
