#!/usr/bin/env python3
"""
scan_logs.py — Find unprocessed JSONL files in claude-logs.

Usage:
    python3 scan_logs.py [--since Nd] [--all] [--project-filter a,b,c]

Options:
    --since Nd             Override last_run_date; look back N days (e.g. 7d, 30d)
    --all                  Reprocess everything (ignore manifest + last_run_date)
    --project-filter CSV   Restrict scan to these top-level project dirs under LOGS_DIR.
                           Also widens manifest-skip: when a filter is given, files
                           NOT under the filter's dirs are excluded, and files that
                           ARE under it but already processed can be force-included
                           with --all.

Output: JSON list of {path, rel_path, size_kb} to stdout
"""

import argparse
import json
import os
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path

LOGS_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs"
CACHE_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs/self-improve-cache"
MANIFEST_PATH = CACHE_DIR / "manifest.json"
MIN_SIZE_KB = 10
EXCLUDE_DIRS = {"self-improve-cache", "config", ".claude"}


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
    parser.add_argument("--project-filter", dest="project_filter", default=None,
                        help="CSV of top-level project dirs under LOGS_DIR to restrict scan")
    args = parser.parse_args()

    project_filter = None
    if args.project_filter:
        project_filter = {p.strip() for p in args.project_filter.split(",") if p.strip()}

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

    all_files = []
    patterns = ("*.jsonl", "*.jsonl.gz", "*.jsonl.zst")
    for p in sorted(q for pat in patterns for q in LOGS_DIR.rglob(pat)):
        top = p.relative_to(LOGS_DIR).parts[0]
        if top in EXCLUDE_DIRS:
            continue
        if project_filter is not None and top not in project_filter:
            continue
        all_files.append(p)

    results = []
    for p in all_files:
        size_kb = p.stat().st_size / 1024
        if size_kb < MIN_SIZE_KB:
            continue

        rel_path = str(p.relative_to(LOGS_DIR))
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
