#!/usr/bin/env python3
"""
find_duplicates.py — Find duplicate data files across project + server_copy dirs.

Usage: python3 find_duplicates.py <project_dir> [extra_dir1 extra_dir2 ...]
Output: Markdown duplicate report to stdout, also writes current/duplicate_report.md

For files under 50MB: SHA256 comparison (identical vs divergent).
For files over 50MB: size + mtime comparison only.
"""

import hashlib
import json
import os
import sys
from collections import defaultdict
from datetime import datetime
from pathlib import Path

SIZE_THRESHOLD = 50 * 1024 * 1024  # 50MB
DATA_EXTENSIONS = {
    ".csv", ".dta", ".rds", ".rda", ".parquet", ".feather", ".arrow",
    ".xlsx", ".xls", ".sas7bdat", ".json", ".tsv", ".fst",
}


def hash_file(path: Path) -> str:
    """SHA256 hash of file contents (first 50MB for large files)."""
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while True:
            chunk = f.read(8192)
            if not chunk:
                break
            h.update(chunk)
            if f.tell() >= SIZE_THRESHOLD:
                break
    return h.hexdigest()[:16]


def scan_dir(directory: Path) -> list[dict]:
    """Scan a directory for data files, return metadata."""
    files = []
    if not directory.exists():
        return files

    for p in directory.rglob("*"):
        if not p.is_file():
            continue
        if p.suffix.lower() not in DATA_EXTENSIONS:
            continue
        # Skip hidden dirs
        if any(part.startswith(".") for part in p.parts):
            continue

        stat = p.stat()
        files.append({
            "path": str(p),
            "name": p.name,
            "size": stat.st_size,
            "mtime": stat.st_mtime,
            "dir": str(directory),
        })

    return files


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 find_duplicates.py <project_dir> [extra_dirs...]", file=sys.stderr)
        sys.exit(1)

    project_dir = Path(sys.argv[1]).resolve()
    extra_dirs = [Path(d).resolve() for d in sys.argv[2:]]

    # Auto-discover server_copy dirs
    server_copies = sorted(project_dir.glob("server_copy*"))
    all_dirs = [project_dir] + server_copies + extra_dirs

    # Scan all directories
    all_files = []
    for d in all_dirs:
        all_files.extend(scan_dir(d))

    # Group by filename
    by_name: dict[str, list[dict]] = defaultdict(list)
    for f in all_files:
        by_name[f["name"]].append(f)

    # Find duplicates (same name, 2+ locations)
    duplicates = {name: files for name, files in by_name.items() if len(files) > 1}

    # Compute hashes for comparison
    for name, files in duplicates.items():
        for f in files:
            p = Path(f["path"])
            if p.exists():
                if f["size"] <= SIZE_THRESHOLD:
                    f["hash"] = hash_file(p)
                    f["comparison"] = "sha256"
                else:
                    f["hash"] = f"size:{f['size']}"
                    f["comparison"] = "size_only"

    # Generate report
    lines = []
    lines.append("# Duplicate Data Report")
    lines.append(f"\nProject: {project_dir}")
    lines.append(f"Directories scanned: {len(all_dirs)}")
    lines.append(f"Total data files: {len(all_files)}")
    lines.append(f"Files with duplicates: {sum(len(v) for v in duplicates.values())}")
    lines.append(f"Scan date: {datetime.now().strftime('%Y-%m-%d %H:%M')}")

    if not duplicates:
        lines.append("\nNo duplicate data files found.")
    else:
        # Categorize: identical vs divergent
        identical = []
        divergent = []

        for name, files in sorted(duplicates.items()):
            hashes = set(f.get("hash", "") for f in files)
            if len(hashes) == 1:
                identical.append((name, files))
            else:
                divergent.append((name, files))

        if divergent:
            lines.append(f"\n## DIVERGENT copies ({len(divergent)} files)")
            lines.append("These files have the same name but different content!")
            for name, files in divergent:
                lines.append(f"\n### {name}")
                for f in sorted(files, key=lambda x: x["mtime"], reverse=True):
                    mtime_str = datetime.fromtimestamp(f["mtime"]).strftime("%Y-%m-%d %H:%M")
                    size_mb = f["size"] / (1024 * 1024)
                    comparison = f.get("comparison", "unknown")
                    rel_path = os.path.relpath(f["path"], project_dir)
                    lines.append(f"- `{rel_path}` — {size_mb:.1f}MB, modified {mtime_str} "
                                 f"[{f.get('hash', '?')[:8]}] ({comparison})")

        if identical:
            lines.append(f"\n## Identical copies ({len(identical)} files)")
            lines.append("These are exact duplicates that could potentially be deduplicated.")
            total_waste = 0
            for name, files in identical:
                lines.append(f"\n### {name}")
                waste = sum(f["size"] for f in files[1:])
                total_waste += waste
                for f in sorted(files, key=lambda x: x["mtime"], reverse=True):
                    mtime_str = datetime.fromtimestamp(f["mtime"]).strftime("%Y-%m-%d %H:%M")
                    size_mb = f["size"] / (1024 * 1024)
                    rel_path = os.path.relpath(f["path"], project_dir)
                    lines.append(f"- `{rel_path}` — {size_mb:.1f}MB, modified {mtime_str}")

            lines.append(f"\nPotential space savings from dedup: {total_waste / (1024*1024):.1f}MB")

    report = "\n".join(lines) + "\n"
    print(report)

    # Write to file
    out_dir = project_dir / "current"
    out_dir.mkdir(exist_ok=True)
    (out_dir / "duplicate_report.md").write_text(report)
    print(f"\nReport written to: {out_dir / 'duplicate_report.md'}", file=sys.stderr)


if __name__ == "__main__":
    main()
