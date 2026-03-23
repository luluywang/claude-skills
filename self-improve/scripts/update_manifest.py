#!/usr/bin/env python3
"""
update_manifest.py — Record one or more processed files in the manifest.

Usage:
    python3 update_manifest.py <rel_path> [--summary-file cache/sessions/xyz.md]
    python3 update_manifest.py --batch entries.json       # JSON list of {rel_path, summary_file?}
    python3 update_manifest.py --set-last-run-date        # Update last_run_date to now
    python3 update_manifest.py --update-skills '{...}'   # Merge skill session counts
    python3 update_manifest.py --generate-todos <proposals_file>
        # Read proposals file, write todos_{YYYYMMDD}.md alongside it

Writes atomically (writes to .tmp then renames).
"""

import argparse
import json
import os
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

CACHE_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs/self-improve-cache"
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


def generate_todos(proposals_file: Path) -> Path:
    """Read a proposals_{YYYYMMDD}.md file and write a todos_{YYYYMMDD}.md alongside it.

    Proposal entries are expected in the format written by proposal_writer.md:
        ## P{n}: {title}
        - **Type**: ...
        - **Target**: {target}
        - **Effort**: {effort}
        ...

    Output format (grouped by target skill, sorted by proposal number):
        ## {skill}
        - [ ] P{n}: {title} (Effort: {effort}, Target: {target})
    """
    text = proposals_file.read_text()

    # Extract date from filename, e.g. proposals_20260301.md → 20260301
    date_match = re.search(r"proposals_(\d{8})\.md", proposals_file.name)
    date_str = date_match.group(1) if date_match else datetime.now().strftime("%Y%m%d")

    # Parse each proposal block
    # Match headings like "## P3: Some Title" (with optional leading spaces)
    proposal_blocks = re.split(r"\n(?=##\s+P\d+:)", text)

    proposals = []
    for block in proposal_blocks:
        heading = re.match(r"##\s+(P(\d+)):\s+(.+)", block)
        if not heading:
            continue
        pid = heading.group(1)       # e.g. "P3"
        pnum = int(heading.group(2)) # e.g. 3
        title = heading.group(3).strip()

        target_m = re.search(r"\*\*Target\*\*:\s*(.+)", block)
        effort_m = re.search(r"\*\*Effort\*\*:\s*(.+)", block)

        target = target_m.group(1).strip() if target_m else "unknown"
        effort = effort_m.group(1).strip() if effort_m else "unknown"

        proposals.append({"pid": pid, "pnum": pnum, "title": title,
                          "target": target, "effort": effort})

    if not proposals:
        print("Warning: no proposals parsed from file", file=sys.stderr)

    # Group by target, preserving insertion order within each group
    groups: dict[str, list] = {}
    for p in sorted(proposals, key=lambda x: x["pnum"]):
        groups.setdefault(p["target"], []).append(p)

    lines = [f"# Todos — {date_str}\n"]
    for skill_target in sorted(groups.keys()):
        lines.append(f"\n## {skill_target}\n")
        for p in groups[skill_target]:
            lines.append(
                f"- [ ] {p['pid']}: {p['title']} (Effort: {p['effort']}, Target: {p['target']})\n"
            )

    todos_path = proposals_file.parent / f"todos_{date_str}.md"
    todos_path.write_text("".join(lines))
    return todos_path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("rel_path", nargs="?", help="Relative path key (e.g. filename.jsonl)")
    parser.add_argument("--summary-file", default=None)
    parser.add_argument("--batch", default=None, help="Path to JSON file with list of entries")
    parser.add_argument("--set-last-run-date", action="store_true",
                        help="Set last_run_date to current UTC time")
    parser.add_argument("--update-skills", default=None,
                        help='JSON object of {skill: session_count} to merge, e.g. \'{"econ_ra": 5}\'')
    parser.add_argument("--generate-todos", default=None, metavar="PROPOSALS_FILE",
                        help="Read proposals file and write todos_{YYYYMMDD}.md alongside it")
    args = parser.parse_args()

    # --generate-todos is self-contained; run it and exit without touching the manifest
    if args.generate_todos:
        proposals_path = Path(args.generate_todos)
        if not proposals_path.exists():
            print(f"Error: proposals file not found: {proposals_path}", file=sys.stderr)
            sys.exit(1)
        todos_path = generate_todos(proposals_path)
        print(f"Todos written: {todos_path}")
        return

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
