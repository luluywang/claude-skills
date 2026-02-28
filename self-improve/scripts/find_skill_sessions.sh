#!/usr/bin/env python3
# find_skill_sessions.sh — grep logs for skill invocations, output JSON map by skill.
#
# Usage: python3 find_skill_sessions.sh [logs_dir]
# Output: JSON object {"econ_ra": ["path1", ...], "copyedit": [...], ...}
#
# Renamed .sh for backward compat; invocable as python3 find_skill_sessions.sh

import json
import subprocess
import sys
from pathlib import Path

LOGS_DIR = Path(sys.argv[1]) if len(sys.argv) > 1 else \
    Path("/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/claude")

SKILLS = ["econ_ra", "copyedit", "parsepdf", "referee", "revisions", "taskmaster"]

if not LOGS_DIR.exists():
    print("{}", file=sys.stderr)
    sys.exit(1)

result = {}
for skill in SKILLS:
    pattern = f"/{skill}"
    proc = subprocess.run(
        ["grep", "-rl", pattern, str(LOGS_DIR),
         "--include=*.jsonl", "--include=*.jsonl.gz"],
        capture_output=True, text=True
    )
    matches = [p.strip() for p in proc.stdout.splitlines() if p.strip()]
    result[skill] = sorted(matches)

print(json.dumps(result, indent=2))
