#!/usr/bin/env python3
"""Compatibility shim: archival now lives in `logsync.py archive`.

Kept for self-improve's compress_logs.py. --logs-dir maps to CLAUDE_LOG_DIR;
--limit, --no-condense and --older-than are accepted and ignored.
"""
import argparse
import os
import sys
from pathlib import Path

ap = argparse.ArgumentParser()
ap.add_argument("--logs-dir")
ap.add_argument("--dry-run", action="store_true")
ap.add_argument("--min-age-days", default="3")
ap.add_argument("--no-condense", action="store_true")
ap.add_argument("--limit")
ap.add_argument("--older-than")
args = ap.parse_args()
if args.logs_dir:
    os.environ["CLAUDE_LOG_DIR"] = args.logs_dir
cmd = [sys.executable, str(Path(__file__).resolve().parent / "logsync.py"), "archive",
       "--min-age-days", args.min_age_days] + (["--dry-run"] if args.dry_run else [])
os.execv(sys.executable, cmd)
