#!/bin/bash
# state.sh - Read/check/summarize project_state.md for session continuity
# Usage:
#   ./state.sh check              # Check if project_state.md exists, return JSON
#   ./state.sh read               # Output project_state.md contents
#   ./state.sh init "<summary>"   # Create/update project_state.md with session entry

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Working directory: ECON_RA_WORKDIR env var, or $PWD/econ_ra_work/
WORK_DIR="${ECON_RA_WORKDIR:-$PWD/econ_ra_work}"
STATE_FILE="$WORK_DIR/project_state.md"

case "${1:-check}" in
    check)
        if [ -f "$STATE_FILE" ]; then
            # Extract key fields from the state file
            STATUS=$(grep -m1 "^**Status:**" "$STATE_FILE" 2>/dev/null | sed 's/\*\*Status:\*\* //' || echo "unknown")
            LAST_SESSION=$(grep -m1 "^**Last Session:**" "$STATE_FILE" 2>/dev/null | sed 's/\*\*Last Session:\*\* //' || echo "unknown")
            # Count open items
            OPEN_COUNT=$(grep -c "^- \[ \]" "$STATE_FILE" 2>/dev/null || echo "0")
            cat << EOF
{
  "exists": true,
  "path": "$STATE_FILE",
  "status": "$STATUS",
  "last_session": "$LAST_SESSION",
  "open_items": $OPEN_COUNT
}
EOF
        else
            cat << EOF
{
  "exists": false,
  "path": "$STATE_FILE"
}
EOF
        fi
        ;;
    read)
        if [ -f "$STATE_FILE" ]; then
            cat "$STATE_FILE"
        else
            echo "No project_state.md found at $STATE_FILE"
            exit 1
        fi
        ;;
    init)
        # Create minimal project_state.md if it doesn't exist
        SUMMARY="${2:-New session}"
        DATE=$(date +%Y-%m-%d)
        mkdir -p "$WORK_DIR"
        if [ ! -f "$STATE_FILE" ]; then
            cat > "$STATE_FILE" << EOF
# Project State

**Status:** active
**Last Session:** $DATE
**Project:** (pending interview)

## Current Status

Session initialized.

## Open Questions

(none yet)

## Key Files Modified

(none yet)

## What Was Tried

(nothing yet)

## Session History

| Date | Summary | Outcome |
|------|---------|---------|
| $DATE | $SUMMARY | in progress |
EOF
            echo "{\"created\": true, \"path\": \"$STATE_FILE\"}"
        else
            echo "{\"created\": false, \"exists\": true, \"path\": \"$STATE_FILE\"}"
        fi
        ;;
    *)
        echo "{\"error\": \"Unknown command: $1. Valid: check, read, init\"}"
        exit 1
        ;;
esac
