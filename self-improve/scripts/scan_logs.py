#!/usr/bin/env python3
"""
scan_logs.py — Find unprocessed JSONL files in claude-logs.

Usage:
    python3 scan_logs.py [--since Nd] [--all]

Options:
    --since Nd    Override last_run_date; look back N days (e.g. 7d, 30d)
    --all         Reprocess everything (ignore manifest + last_run_date)

Output: JSON list of {path, rel_path, size_kb} to stdout
"""

import argparse
import json
import os
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path

LOGS_DIR = Path("/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/claude")
SKILL_DIR = Path("/Users/luluywang/.claude/skills/self-improve")
MANIFEST_PATH = SKILL_DIR / "cache" / "manifest.json"
MIN_SIZE_KB = 10


def load_manifest():
    if MANIFEST_PATH.exists():
        with open(MANIFEST_PATH) as f:
            return json.load(f)
    return {"version": 1, "last_updated": None, "last_run_date": None, "processed": {}}


def parse_since(since_str):
    """Parse '7d', '30d', '90d' into a datetime cutoff."""
    since_str = since_str.strip().lower()
    if since_str.endswith("d"):
        days = int(since_str[:-1])
        return datetime.now(timezone.utc) - timedelta(days=days)
    raise ValueError(f"Unknown --since format: {since_str!r}. Use Nd (e.g. 7d).")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--since", default=None, help="Look back N days (e.g. 7d)")
    parser.add_argument("--all", dest="all_files", action="store_true",
                        help="Reprocess all files (ignore manifest)")
    args = parser.parse_args()

    manifest = load_manifest()
    processed_keys = set(manifest.get("processed", {}).keys())

    # Determine cutoff datetime
    cutoff = None
    if args.all_files:
        cutoff = None  # no cutoff
    elif args.since:
        cutoff = parse_since(args.since)
    elif manifest.get("last_run_date"):
        cutoff = datetime.fromisoformat(manifest["last_run_date"].replace("Z", "+00:00"))
    else:
        # Default: last 30 days on first run
        cutoff = datetime.now(timezone.utc) - timedelta(days=30)

    if not LOGS_DIR.exists():
        print(json.dumps([]), flush=True)
        sys.exit(0)

    results = []
    for p in sorted(LOGS_DIR.glob("*.jsonl")) + sorted(LOGS_DIR.glob("*.jsonl.gz")):
        size_kb = p.stat().st_size / 1024
        if size_kb < MIN_SIZE_KB:
            continue

        rel_path = p.name
        if not args.all_files and rel_path in processed_keys:
            continue

        if cutoff is not None:
            mtime = datetime.fromtimestamp(p.stat().st_mtime, tz=timezone.utc)
            if mtime < cutoff:
                continue

        results.append({
            "path": str(p),
            "rel_path": rel_path,
            "size_kb": round(size_kb, 1),
        })

    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
