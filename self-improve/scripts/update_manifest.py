#!/usr/bin/env python3
"""
update_manifest.py — Record one or more processed files in the manifest.

Usage:
    python3 update_manifest.py <rel_path> [--summary-file cache/sessions/xyz.md]
    python3 update_manifest.py --batch entries.json       # JSON list of {rel_path, summary_file?}
    python3 update_manifest.py --set-last-run-date        # Update last_run_date to now
    python3 update_manifest.py --update-skills '{...}'   # Merge skill session counts

Writes atomically (writes to .tmp then renames).
"""

import argparse
import json
import os
import sys
from datetime import datetime, timezone
from pathlib import Path

CACHE_DIR = Path("/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/self-improve-cache")
MANIFEST_PATH = CACHE_DIR / "manifest.json"


def load_manifest():
    if MANIFEST_PATH.exists():
        with open(MANIFEST_PATH) as f:
            return json.load(f)
    return {"version": 1, "last_updated": None, "last_run_date": None, "skills": {}, "processed": {}}


def save_manifest(manifest):
    tmp = MANIFEST_PATH.with_suffix(".json.tmp")
    with open(tmp, "w") as f:
        json.dump(manifest, f, indent=2)
        f.write("\n")
    os.replace(tmp, MANIFEST_PATH)


def record_entry(manifest, rel_path, summary_file=None, compressed=False):
    now = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
    manifest["processed"][rel_path] = {
        "processed_at": now,
        "summary_file": summary_file,
        "compressed": compressed,
    }
    manifest["last_updated"] = now


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("rel_path", nargs="?", help="Relative path key (e.g. filename.jsonl)")
    parser.add_argument("--summary-file", default=None)
    parser.add_argument("--batch", default=None, help="Path to JSON file with list of entries")
    parser.add_argument("--set-last-run-date", action="store_true",
                        help="Set last_run_date to current UTC time")
    parser.add_argument("--update-skills", default=None,
                        help='JSON object of {skill: session_count} to merge, e.g. \'{"econ_ra": 5}\'')
    args = parser.parse_args()

    manifest = load_manifest()
    if "skills" not in manifest:
        manifest["skills"] = {}

    if args.set_last_run_date:
        now = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
        manifest["last_run_date"] = now
        manifest["last_updated"] = now

    if args.update_skills:
        skills_data = json.loads(args.update_skills)
        today = datetime.now(timezone.utc).strftime("%Y-%m-%d")
        now = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
        for skill, count in skills_data.items():
            entry = manifest["skills"].setdefault(skill, {"sessions": 0, "last_seen": None})
            entry["sessions"] += int(count)
            entry["last_seen"] = today
        manifest["last_updated"] = now

    if args.batch:
        with open(args.batch) as f:
            entries = json.load(f)
        for entry in entries:
            record_entry(
                manifest,
                entry["rel_path"],
                summary_file=entry.get("summary_file"),
                compressed=entry.get("compressed", False),
            )
    elif args.rel_path:
        record_entry(manifest, args.rel_path, summary_file=args.summary_file)
    elif not args.set_last_run_date and not args.update_skills:
        print("Error: provide rel_path, --batch, --set-last-run-date, or --update-skills",
              file=sys.stderr)
        sys.exit(1)

    save_manifest(manifest)
    print(f"Manifest updated: {len(manifest['processed'])} entries total")


if __name__ == "__main__":
    main()
