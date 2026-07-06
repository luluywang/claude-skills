#!/usr/bin/env python3
"""
archive_logs.py — Two-tier archival of Claude Code session logs.

For every transcript under the log directory:
  1. Condensed tier: write <basename>.condensed.md alongside it (via
     condense_log.py) — readable without decompression.
  2. Archive tier: compress the raw .jsonl to .jsonl.zst (zstd -19 --long),
     verify the round-trip by size and hash, then delete the original.
     Existing .jsonl.gz files are transcoded to .jsonl.zst the same way.

Idempotent: filesystem state is the manifest. A file is skipped when its
.condensed.md exists and it is already .zst. Also migrates key names in the
self-improve manifest (.jsonl/.jsonl.gz -> .jsonl.zst) so scan caching survives.

Usage:
    python3 archive_logs.py [--logs-dir DIR] [--dry-run] [--no-condense] [--limit N]
"""

import argparse
import gzip
import hashlib
import json
import os
import subprocess
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_LOGS_DIR = Path.home() / "Dropbox/claude-logs"
ZSTD_ARGS = ["zstd", "-19", "--long=27", "-T0", "-q"]

sys.path.insert(0, str(SCRIPT_DIR))
from condense_log import condense, default_output  # noqa: E402


def sha256_stream(fobj):
    h = hashlib.sha256()
    for chunk in iter(lambda: fobj.read(1 << 20), b""):
        h.update(chunk)
    return h.hexdigest()


def sha256_file(path: Path):
    with open(path, "rb") as f:
        return sha256_stream(f)


def sha256_gz(path: Path):
    with gzip.open(path, "rb") as f:
        return sha256_stream(f)


def sha256_zst(path: Path):
    proc = subprocess.Popen(
        ["zstd", "-dc", "--long=31", str(path)], stdout=subprocess.PIPE
    )
    digest = sha256_stream(proc.stdout)
    proc.stdout.close()
    if proc.wait() != 0:
        raise RuntimeError(f"zstd decompress failed for {path}")
    return digest


def compress_to_zst(src: Path, dst: Path, src_is_gz: bool):
    """Compress (or transcode gz->zst) with verified round-trip."""
    if src_is_gz:
        gunzip = subprocess.Popen(["gzip", "-dc", str(src)], stdout=subprocess.PIPE)
        zstd = subprocess.Popen(
            ZSTD_ARGS + ["-o", str(dst), "-f"], stdin=gunzip.stdout
        )
        gunzip.stdout.close()
        if zstd.wait() != 0 or gunzip.wait() != 0:
            raise RuntimeError(f"transcode failed for {src}")
        original_hash = sha256_gz(src)
    else:
        subprocess.run(ZSTD_ARGS + ["-f", "-o", str(dst), str(src)], check=True)
        original_hash = sha256_file(src)

    if sha256_zst(dst) != original_hash:
        dst.unlink(missing_ok=True)
        raise RuntimeError(f"round-trip hash mismatch for {src}")


def migrate_manifest(logs_dir: Path, renames: dict):
    """Rewrite self-improve manifest keys for files renamed to .zst."""
    manifest_path = logs_dir / "self-improve-cache/manifest.json"
    if not manifest_path.exists() or not renames:
        return
    with open(manifest_path) as f:
        manifest = json.load(f)
    processed = manifest.get("processed", {})
    changed = False
    for old_rel, new_rel in renames.items():
        if old_rel in processed:
            processed[new_rel] = processed.pop(old_rel)
            processed[new_rel]["compressed"] = True
            changed = True
    if changed:
        tmp = manifest_path.with_suffix(".json.tmp")
        with open(tmp, "w") as f:
            json.dump(manifest, f, indent=2)
            f.write("\n")
        os.replace(tmp, manifest_path)
        print(f"Migrated {len(renames)} manifest keys in {manifest_path.name}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--logs-dir", type=Path, default=DEFAULT_LOGS_DIR)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--no-condense", action="store_true")
    parser.add_argument("--limit", type=int, help="Process at most N files")
    # Accepted for backward compat with self-improve's old compress_logs.py; ignored
    parser.add_argument("--older-than", type=int, help=argparse.SUPPRESS)
    args = parser.parse_args()

    logs_dir = args.logs_dir.resolve()
    if not logs_dir.is_dir():
        print(f"Not a directory: {logs_dir}", file=sys.stderr)
        return 1

    targets = sorted(logs_dir.rglob("*.jsonl")) + sorted(logs_dir.rglob("*.jsonl.gz"))
    # Never touch the self-improve cache or hidden dirs
    targets = [
        p for p in targets
        if "self-improve-cache" not in p.parts
        and not any(part.startswith(".") for part in p.relative_to(logs_dir).parts)
    ]
    if args.limit:
        targets = targets[: args.limit]

    n_done = n_skip = n_err = 0
    bytes_before = bytes_after = 0
    renames = {}

    for src in targets:
        is_gz = src.suffix == ".gz"
        dst = src.with_name(src.name[:-3] + ".zst") if is_gz \
            else src.with_suffix(".jsonl.zst")
        md = default_output(src)

        if args.dry_run:
            print(f"would archive: {src.relative_to(logs_dir)}")
            n_done += 1
            continue

        try:
            if not args.no_condense and not md.exists():
                with open(md.with_suffix(".tmp"), "w", encoding="utf-8") as out:
                    condense(src, out)
                md.with_suffix(".tmp").replace(md)

            if dst.exists():
                # Archive already present; just remove the redundant original
                src.unlink()
                n_skip += 1
            else:
                before = src.stat().st_size
                compress_to_zst(src, dst, is_gz)
                after = dst.stat().st_size
                bytes_before += before
                bytes_after += after
                src.unlink()
                n_done += 1
                print(f"  {src.relative_to(logs_dir)}: "
                      f"{before // 1024}KB -> {after // 1024}KB")
            renames[str(src.relative_to(logs_dir))] = str(dst.relative_to(logs_dir))
        except (RuntimeError, subprocess.CalledProcessError, OSError) as e:
            n_err += 1
            print(f"  ERROR {src.relative_to(logs_dir)}: {e}", file=sys.stderr)

    if not args.dry_run:
        migrate_manifest(logs_dir, renames)

    mb = (bytes_before - bytes_after) / (1024 * 1024)
    print(f"\nDone: {n_done} archived, {n_skip} deduped, {n_err} errors, "
          f"{mb:.0f} MB freed")
    return 1 if n_err else 0


if __name__ == "__main__":
    sys.exit(main())
