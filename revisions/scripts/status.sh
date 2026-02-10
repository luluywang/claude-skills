#!/bin/bash
# status.sh - Get or set revision alignment status
# Usage:
#   ./status.sh              # Get current status
#   ./status.sh init         # Set status to "init"
#   ./status.sh extract      # Set status to "extract"
#   ./status.sh profile      # Set status to "profile"
#   ./status.sh audit        # Set status to "audit"
#   ./status.sh fix          # Set status to "fix"
#   ./status.sh review       # Set status to "review"
#   ./status.sh complete     # Set status to "complete"

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_DIR="$SKILL_DIR/current"
STATUS_FILE="$CURRENT_DIR/.status"

# Ensure current directory exists
mkdir -p "$CURRENT_DIR"

if [ $# -eq 0 ]; then
    # Get mode: read and return current status
    if [ -f "$STATUS_FILE" ]; then
        STATUS=$(cat "$STATUS_FILE" | tr -d '\n')
        echo "{\"status\": \"$STATUS\", \"exists\": true}"
    else
        echo "{\"status\": null, \"exists\": false}"
    fi
else
    # Set mode: validate and write status
    NEW_STATUS="$1"

    # Validate status value
    case "$NEW_STATUS" in
        init|extract|profile|audit|fix|review|complete)
            echo "$NEW_STATUS" > "$STATUS_FILE"
            echo "{\"status\": \"$NEW_STATUS\", \"set\": true}"
            ;;
        *)
            echo "{\"error\": \"Invalid status: $NEW_STATUS. Valid values: init, extract, profile, audit, fix, review, complete\", \"set\": false}"
            exit 1
            ;;
    esac
fi
