#!/bin/bash
# Claude Code session export hook (SessionEnd)
# Copies session transcripts to a central log directory.
# Works on laptops (Dropbox) and HPC (shared filesystem) alike.
# On laptops, also pulls any new logs from HPC if reachable.
#
# Output format: <project>/<hostname>_<date>_<session>.jsonl
#
# Config (set in ~/.claude/hooks/log_sync.conf or export-session.conf):
#   HPC_HOST=user@cluster.edu
#   HPC_LOG_DIR=~/claude-logs
#   HPC_SSH_TIMEOUT=3

INPUT=$(cat)
TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
SESSION=$(echo "$INPUT" | jq -r '.session_id // empty')

# Exit early if no transcript
[ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ] && exit 0

# Load config if it exists (prefer log_sync.conf, fall back to export-session.conf)
CONF="$HOME/.claude/hooks/log_sync.conf"
[ ! -f "$CONF" ] && CONF="$HOME/.claude/hooks/export-session.conf"
[ -f "$CONF" ] && . "$CONF"

# Determine destination root
if [ -n "$CLAUDE_LOG_DIR" ]; then
  DEST="$CLAUDE_LOG_DIR"
elif [ -d "$HOME/Library/CloudStorage/Dropbox" ]; then
  DEST="$HOME/Library/CloudStorage/Dropbox/claude-logs"
else
  DEST="$HOME/claude-logs"
fi

# Extract project name from the transcript (machine-independent)
# Strategy: read cwd from the JSONL, then use git root name or dir basename
# Only read first 20 lines — cwd appears early, avoids slow reads on large files
CWD=$(head -20 "$TRANSCRIPT" | jq -r '.cwd // empty' 2>/dev/null | grep -m1 .)

PROJECT=""
if [ -n "$CWD" ]; then
  # Try git repo root basename (stable across machines)
  if [ -d "$CWD" ]; then
    GIT_ROOT=$(git -C "$CWD" rev-parse --show-toplevel 2>/dev/null)
    if [ -n "$GIT_ROOT" ]; then
      PROJECT=$(basename "$GIT_ROOT")
    fi
  fi
  # Fall back to working directory basename (works even if dir is gone)
  [ -z "$PROJECT" ] && PROJECT=$(basename "$CWD")
fi

# Final fallback: extract from the encoded project directory name
# e.g. ...-Dropbox-Overleaf-Payment-Network-Competition → payment-network-competition
# Strip known prefixes, keep the meaningful tail
if [ -z "$PROJECT" ]; then
  ENCODED=$(basename "$(dirname "$TRANSCRIPT")")
  # Remove user home prefix and common cloud storage path
  PROJECT=$(echo "$ENCODED" | sed -E 's/^-Users-[^-]+-//' | sed -E 's/^Library-CloudStorage-Dropbox-//' | sed -E 's/^Documents-Economics-//')
fi

# Sanitize project name (lowercase, replace spaces with hyphens, collapse runs)
PROJECT=$(echo "$PROJECT" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-_' | sed -E 's/-{2,}/-/g; s/^-//; s/-$//')
[ -z "$PROJECT" ] && PROJECT="unknown"

# Save transcript into project subdirectory
mkdir -p "$DEST/$PROJECT"
HOST=$(hostname -s)
DATE=$(date +%Y%m%d_%H%M%S)
cp "$TRANSCRIPT" "$DEST/$PROJECT/${HOST}_${DATE}_${SESSION}.jsonl"

# On laptops: pull HPC logs if server is reachable
if [ -n "$HPC_HOST" ] && [ -d "$HOME/Library/CloudStorage/Dropbox" ]; then
  TIMEOUT="${HPC_SSH_TIMEOUT:-3}"
  REMOTE_DIR="${HPC_LOG_DIR:-~/claude-logs}"
  HPC_DEST="$DEST/hpc"
  mkdir -p "$HPC_DEST"

  # Quick connectivity check + rsync, both in background to avoid blocking
  HPC_LOG="$HPC_DEST/.rsync.log"
  (ssh -o ConnectTimeout="$TIMEOUT" -o BatchMode=yes "$HPC_HOST" true 2>/dev/null && \
    rsync -az "$HPC_HOST:$REMOTE_DIR/" "$HPC_DEST/" >> "$HPC_LOG" 2>&1 && \
    echo "$(date '+%Y-%m-%d %H:%M:%S') rsync ok" >> "$HPC_LOG" || \
    echo "$(date '+%Y-%m-%d %H:%M:%S') rsync failed or hpc unreachable" >> "$HPC_LOG") &
fi

exit 0
