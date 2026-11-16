#!/usr/bin/env bash
# Register the /overnight Stop hook in ~/.claude/settings.json (idempotent).
# The top-level ./install.sh copies the skill files first, then runs this.
set -euo pipefail
command -v python3 >/dev/null || { echo "python3 is required" >&2; exit 1; }
python3 "$(cd "$(dirname "$0")" && pwd)/scripts/overnight.py" install-hook
