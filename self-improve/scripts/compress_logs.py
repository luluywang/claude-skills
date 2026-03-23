#!/usr/bin/env python3
"""
compress_logs.py — Gzip processed JSONL logs older than a threshold.

Usage:
    python3 compress_logs.py [--older-than DAYS]

Default: compress logs older than 90 days.
Updates manifest entries with compressed=true and records size savings.
"""

import argparse
import gzip
import json
import os
import shutil
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path

LOGS_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs"
CACHE_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs/self-improve-cache"
MANIFEST_PATH = CACHE_DIR / "manifest.json"


def load_manifest():
    if MANIFEST_PATH.exists():
        with open(MANIFEST_PATH) as f:
            return json.load(f)
    return {"version": 1, "last_updated": None, "last_run_date": None, "processed": {}}


def save_manifest(manifest):
    tmp = MANIFEST_PATH.with_suffix(".json.tmp")
    with open(tmp, "w") as f:
        json.dump(manifest, f, indent=2)
        f.write("\n")
    os.replace(tmp, MANIFEST_PATH)


def gzip_file(src: Path) -> Path:
    """Gzip src in-place, returning the .gz path."""
    dst = src.with_suffix(src.suffix + ".gz")
    with open(src, "rb") as f_in, gzip.open(dst, "wb") as f_out:
        shutil.copyfileobj(f_in, f_out)
    src.unlink()
    return dst


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--older-than", type=int, default=90,
                        help="Compress logs older than N days (default: 90)")
    args = parser.parse_args()

    cutoff = datetime.now(timezone.utc) - timedelta(days=args.older_than)
    manifest = load_manifest()
    processed = manifest.get("processed", {})

    compressed_count = 0
    bytes_saved = 0

    for rel_path, entry in list(processed.items()):
        if entry.get("compressed"):
            continue  # already compressed

        src = LOGS_DIR / rel_path
        if not src.exists():
            continue

        mtime = datetime.fromtimestamp(src.stat().st_mtime, tz=timezone.utc)
        if mtime > cutoff:
            continue

        original_size = src.stat().st_size
        try:
            dst = gzip_file(src)
        except OSError as e:
            print(f"  Error compressing {rel_path}: {e}", file=sys.stderr)
            continue

        compressed_size = dst.stat().st_size
        saved = original_size - compressed_size
        bytes_saved += saved
        compressed_count += 1

        now = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
        entry["compressed"] = True
        entry["original_size_kb"] = round(original_size / 1024, 1)
        entry["compressed_size_kb"] = round(compressed_size / 1024, 1)
        entry["compressed_at"] = now

        # Update key to reflect new .gz extension
        new_rel = rel_path + ".gz"
        processed[new_rel] = entry
        del processed[rel_path]

        print(f"  Compressed {rel_path}: {original_size//1024}KB -> {compressed_size//1024}KB "
              f"({saved//1024}KB saved)")

    manifest["processed"] = processed
    now = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
    manifest["last_updated"] = now
    save_manifest(manifest)

    mb_saved = bytes_saved / (1024 * 1024)
    print(f"\nDone: {compressed_count} files compressed, {mb_saved:.1f} MB freed")


if __name__ == "__main__":
    main()
