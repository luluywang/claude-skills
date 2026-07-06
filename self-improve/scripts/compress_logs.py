#!/usr/bin/env python3
"""
compress_logs.py — DEPRECATED shim.

Log archival moved to the log_sync skill's two-tier pipeline
(zstd .jsonl.zst archive + .condensed.md readable digest):

    ~/.claude/skills/log_sync/scripts/archive_logs.py

This shim delegates there so existing invocations keep working.
"""

import os
import sys
from pathlib import Path

CANDIDATES = [
    Path.home() / ".claude/skills/log_sync/scripts/archive_logs.py",
    Path(__file__).resolve().parent.parent.parent / "log_sync/scripts/archive_logs.py",
]

for candidate in CANDIDATES:
    if candidate.exists():
        os.execv(sys.executable, [sys.executable, str(candidate)] + sys.argv[1:])

print("archive_logs.py not found; install the log_sync skill", file=sys.stderr)
sys.exit(1)
