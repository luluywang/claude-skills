#!/usr/bin/env bash
# Install / refresh copyedit skill into Claude's skills directory.
set -euo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${1:-$HOME/.claude/skills/copyedit}"
mkdir -p "$(dirname "$DEST")"
rsync -av --exclude 'notes/history' "$SRC/" "$DEST/"
chmod +x "$DEST/scripts/"*.py "$DEST/scripts/"*.sh 2>/dev/null || true
echo "Installed copyedit skill to $DEST"
