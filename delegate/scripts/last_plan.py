#!/usr/bin/env python3
"""Resolve the most recent Claude Code plan.

Two sources, newest wins:
  1. $CLAUDE_PLANS_DIR (default ~/.claude/plans)/*.md -- where plan mode writes
     plans. Canonical, but the directory is often absent or pruned.
  2. ExitPlanMode tool_use blocks in ~/.claude/projects/**/*.jsonl transcripts.
     The plan text is embedded in `input.plan`, so it survives the file's deletion.

With --repo, plans authored in that working directory are preferred over newer
plans from unrelated projects; pass --any-repo to disable that.
"""
import argparse
import datetime as dt
import glob
import hashlib
import json
import os
import sys


def _utc(ts):
    """Parse a transcript ISO timestamp into an aware UTC datetime."""
    try:
        return dt.datetime.fromisoformat(ts.replace("Z", "+00:00"))
    except Exception:
        return None


def from_plans_dir(plans_dir):
    out = []
    for p in glob.glob(os.path.join(plans_dir, "*.md")):
        try:
            st = os.stat(p)
            text = open(p, errors="replace").read()
        except OSError:
            continue
        out.append(
            {
                "source": "plans-dir",
                "path": p,
                "when": dt.datetime.fromtimestamp(st.st_mtime, dt.timezone.utc),
                "cwd": None,
                "text": text,
            }
        )
    return out


def from_transcripts(projects_dir):
    out = []
    for f in glob.glob(os.path.join(projects_dir, "**", "*.jsonl"), recursive=True):
        try:
            fh = open(f, errors="replace")
        except OSError:
            continue
        with fh:
            for line in fh:
                # Cheap prefilter: the tool name must appear as a JSON string.
                if '"ExitPlanMode"' not in line:
                    continue
                try:
                    e = json.loads(line)
                except json.JSONDecodeError:
                    continue
                content = (e.get("message") or {}).get("content")
                if not isinstance(content, list):
                    continue
                for b in content:
                    if not isinstance(b, dict):
                        continue
                    if b.get("type") != "tool_use" or b.get("name") != "ExitPlanMode":
                        continue
                    plan = (b.get("input") or {}).get("plan")
                    if not plan:
                        continue
                    when = _utc(e.get("timestamp") or "")
                    if when is None:
                        continue
                    out.append(
                        {
                            "source": "transcript",
                            "path": (b.get("input") or {}).get("planFilePath"),
                            "when": when,
                            "cwd": e.get("cwd"),
                            "text": plan,
                            "transcript": f,
                        }
                    )
    return out


def dedupe(plans):
    """Transcripts get copied around (claude-logs); collapse identical plans."""
    seen, out = set(), []
    for p in sorted(plans, key=lambda x: x["when"], reverse=True):
        key = hashlib.sha1(p["text"].strip().encode()).hexdigest()
        if key in seen:
            continue
        seen.add(key)
        out.append(p)
    return out


def enrich_cwd(plans):
    """Plan files carry no cwd; their transcript twin does. Match on planFilePath's
    basename, since CLAUDE_PLANS_DIR may point somewhere other than the recorded path."""
    by_name = {
        os.path.basename(p["path"]): p["cwd"]
        for p in plans
        if p["source"] == "transcript" and p["path"] and p["cwd"]
    }
    for p in plans:
        if p["source"] == "plans-dir" and p["cwd"] is None and p["path"]:
            p["cwd"] = by_name.get(os.path.basename(p["path"]))
    return plans


def resolve(plans_dir, projects_dir, repo=None, logs_dir=None):
    """Return (best, all, kind).

    kind is why `best` was chosen:
      scoped     -- authored in `repo`; the only unambiguously safe answer
      unknown    -- no cwd recorded, so it can't be attributed to any repo
      mismatch   -- newest plan was authored somewhere else entirely
      unscoped   -- caller didn't ask for a repo
    """
    found = from_plans_dir(plans_dir) + from_transcripts(projects_dir)
    if logs_dir:
        found += from_transcripts(logs_dir)
    plans = enrich_cwd(dedupe(found))
    if not plans:
        return None, [], None
    if not repo:
        return plans[0], plans, "unscoped"

    repo = os.path.realpath(repo)
    scoped = [p for p in plans if p["cwd"] and os.path.realpath(p["cwd"]).startswith(repo)]
    if scoped:
        return scoped[0], plans, "scoped"
    unknown = [p for p in plans if not p["cwd"]]
    if unknown:
        return unknown[0], plans, "unknown"
    return plans[0], plans, "mismatch"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", help="prefer plans authored in this working directory")
    ap.add_argument("--any-repo", action="store_true", help="ignore --repo scoping")
    ap.add_argument("--text", action="store_true", help="print the plan body only")
    ap.add_argument("--out", help="write the plan body to this file, print its path")
    ap.add_argument("--list", action="store_true", help="list recent plans, newest first")
    ap.add_argument("--require-scope", action="store_true",
                    help="exit 2 rather than return a plan authored for another repo")
    ap.add_argument("--plans-dir", default=os.environ.get("CLAUDE_PLANS_DIR", os.path.expanduser("~/.claude/plans")))
    ap.add_argument("--projects-dir", default=os.path.expanduser("~/.claude/projects"))
    ap.add_argument("--logs-dir", default=os.environ.get("CLAUDE_LOGS_DIR"),
                    help="also scan an archived-transcript tree (e.g. ~/Dropbox/claude-logs). "
                         "Off by default: the archive is synced across machines, so its plans "
                         "often name working directories that do not exist here.")
    a = ap.parse_args()

    best, allp, kind = resolve(a.plans_dir, a.projects_dir,
                               None if a.any_repo else a.repo, a.logs_dir)
    if not best:
        where = f"{a.plans_dir} and {a.projects_dir}" + (f" and {a.logs_dir}" if a.logs_dir else "")
        print(f"no plan found (looked in {where})", file=sys.stderr)
        return 1

    if a.list:
        for p in allp[:10]:
            where = p["cwd"] or p["path"] or "?"
            here = "" if (p["cwd"] and os.path.isdir(p["cwd"])) else "  [cwd missing here]"
            print(f"{p['when'].isoformat()}  {p['source']:10}  {len(p['text']):6}c  {where}{here}")
        return 0

    if a.require_scope and kind == "mismatch":
        print(f"refusing: newest plan was authored in {best['cwd']}, not under {a.repo}.\n"
              f"Pass an explicit plan file, or --any-repo to override.", file=sys.stderr)
        return 2

    if a.text:
        sys.stdout.write(best["text"])
        return 0

    if a.out:
        with open(a.out, "w") as fh:
            fh.write(best["text"])
        print(a.out)
        return 0

    meta = {
        "source": best["source"],
        "match": kind,
        "path": best["path"],
        "when": best["when"].isoformat(),
        "cwd": best["cwd"],
        "cwd_exists": bool(best["cwd"] and os.path.isdir(best["cwd"])),
        "chars": len(best["text"]),
        "title": best["text"].strip().splitlines()[0][:100] if best["text"].strip() else "",
    }
    print(json.dumps(meta, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
