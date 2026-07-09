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


def resolve(plans_dir, projects_dir, repo=None):
    plans = dedupe(from_plans_dir(plans_dir) + from_transcripts(projects_dir))
    if not plans:
        return None, []
    if repo:
        repo = os.path.realpath(repo)
        scoped = [p for p in plans if p["cwd"] and os.path.realpath(p["cwd"]).startswith(repo)]
        if scoped:
            return scoped[0], plans
    return plans[0], plans


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", help="prefer plans authored in this working directory")
    ap.add_argument("--any-repo", action="store_true", help="ignore --repo scoping")
    ap.add_argument("--text", action="store_true", help="print the plan body only")
    ap.add_argument("--out", help="write the plan body to this file, print its path")
    ap.add_argument("--list", action="store_true", help="list recent plans, newest first")
    ap.add_argument("--plans-dir", default=os.environ.get("CLAUDE_PLANS_DIR", os.path.expanduser("~/.claude/plans")))
    ap.add_argument("--projects-dir", default=os.path.expanduser("~/.claude/projects"))
    a = ap.parse_args()

    best, allp = resolve(a.plans_dir, a.projects_dir, None if a.any_repo else a.repo)
    if not best:
        print("no plan found (looked in %s and %s)" % (a.plans_dir, a.projects_dir), file=sys.stderr)
        return 1

    if a.list:
        for p in allp[:10]:
            where = p["cwd"] or p["path"] or "?"
            print(f"{p['when'].isoformat()}  {p['source']:10}  {len(p['text']):6}c  {where}")
        return 0

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
        "path": best["path"],
        "when": best["when"].isoformat(),
        "cwd": best["cwd"],
        "chars": len(best["text"]),
        "title": best["text"].strip().splitlines()[0][:100] if best["text"].strip() else "",
    }
    print(json.dumps(meta, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
