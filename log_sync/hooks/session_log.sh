#!/bin/bash
# Claude Code continuous session logger.
# Wired to BOTH the Stop hook (fires every assistant turn) and the SessionEnd
# hook (fires on graceful exit). Because Stop fires continuously, a session that
# is later KILLED (e.g. a /remote-control bridge whose login-node connection
# drops, SIGHUP/SIGKILL) still has its transcript captured up to the last
# completed turn — instead of being lost entirely, which is what happened when
# logging depended on SessionEnd alone.
#
# Idempotent: the destination filename is keyed on the session id (no copy-time
# in the name), so every turn OVERWRITES the same file in place rather than
# piling up one duplicate per turn.
#
# Output: <dest>/<project>/<host>_<session>.jsonl
#
# Config (~/.claude/hooks/log_sync.conf or export-session.conf):
#   CLAUDE_LOG_DIR=/path/to/logs   # overrides destination root

INPUT=$(cat)

# NB: jq is deliberately NOT used. On this cluster jq is only an HPC module
# (module load jq), not a system binary, so it is absent from the default PATH
# a hook usually runs under. The old hook's jq calls silently returned empty,
# tripped the "no transcript -> exit 0" guard, and logged nothing. The hook
# input is a small flat JSON object, so extract fields with pure bash instead.
json_field() {  # $1 = key name; reads global $INPUT
  echo "$INPUT" | grep -o "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" | head -1 \
    | sed -E "s/.*:[[:space:]]*\"([^\"]*)\"/\1/"
}
TRANSCRIPT=$(json_field transcript_path)
SESSION=$(json_field session_id)
# Both Stop and SessionEnd payloads carry cwd directly — far more reliable than
# scraping it out of the transcript body (which /remote-control sessions bury).
CWD=$(json_field cwd)

# Nothing to copy if the transcript is missing.
[ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ] && exit 0

# Load config if present (prefer log_sync.conf, fall back to export-session.conf).
CONF="$HOME/.claude/hooks/log_sync.conf"
[ ! -f "$CONF" ] && CONF="$HOME/.claude/hooks/export-session.conf"
[ -f "$CONF" ] && . "$CONF"

# Destination root.
if [ -n "$CLAUDE_LOG_DIR" ]; then
  DEST="$CLAUDE_LOG_DIR"
elif [ -d "$HOME/Library/CloudStorage/Dropbox" ]; then
  DEST="$HOME/Library/CloudStorage/Dropbox/claude-logs"
else
  DEST="$HOME/claude-logs"
fi

# Fall back to transcript-embedded cwd only if the hook input didn't carry one.
[ -z "$CWD" ] && CWD=$(grep -m1 -o '"cwd":"[^"]*"' "$TRANSCRIPT" 2>/dev/null | head -1 | sed -E 's/"cwd":"([^"]*)"/\1/')

# Project name: git root basename, else cwd basename, else encoded dir tail.
PROJECT=""
if [ -n "$CWD" ]; then
  if [ -d "$CWD" ]; then
    GIT_ROOT=$(git -C "$CWD" rev-parse --show-toplevel 2>/dev/null)
    [ -n "$GIT_ROOT" ] && PROJECT=$(basename "$GIT_ROOT")
  fi
  [ -z "$PROJECT" ] && PROJECT=$(basename "$CWD")
fi
if [ -z "$PROJECT" ]; then
  ENCODED=$(basename "$(dirname "$TRANSCRIPT")")
  PROJECT=$(echo "$ENCODED" | sed -E 's/^-Users-[^-]+-//; s/^Library-CloudStorage-Dropbox-//; s/^Documents-Economics-//')
fi
PROJECT=$(echo "$PROJECT" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-_' | sed -E 's/-{2,}/-/g; s/^-//; s/-$//')
[ -z "$PROJECT" ] && PROJECT="unknown"

HOST=$(hostname -s)
mkdir -p "$DEST/$PROJECT"
# Backgrounded so the copy never adds latency to the turn (transcripts get large).
cp -f "$TRANSCRIPT" "$DEST/$PROJECT/${HOST}_${SESSION}.jsonl" 2>/dev/null &

exit 0
