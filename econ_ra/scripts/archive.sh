#!/bin/bash
# archive.sh - Archive current project to history
# Handles the file operations portion of wrapup phase

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_DIR="$SKILL_DIR/current"
HISTORY_DIR="$SKILL_DIR/history"

# Check if current directory exists and has content
if [ ! -d "$CURRENT_DIR" ] || [ -z "$(ls -A "$CURRENT_DIR" 2>/dev/null)" ]; then
    echo '{"error": "No project to archive - current/ is empty or missing", "archived": false}'
    exit 0
fi

# Extract project name from spec.md title (line 2, after # header)
PROJECT_NAME=""
if [ -f "$CURRENT_DIR/spec.md" ]; then
    # Get line 2, convert to lowercase, replace spaces with underscore, remove special chars
    PROJECT_NAME=$(head -2 "$CURRENT_DIR/spec.md" 2>/dev/null | tail -1 | \
        tr '[:upper:]' '[:lower:]' | \
        tr ' ' '_' | \
        sed 's/[^a-z0-9_]//g' | \
        cut -c1-30)
fi

# Fallback project name
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="project"
fi

# Generate archive folder name with date
DATE=$(date +%Y-%m-%d)
ARCHIVE_NAME="${DATE}_${PROJECT_NAME}"
ARCHIVE_PATH="$HISTORY_DIR/$ARCHIVE_NAME"

# Ensure history directory exists
mkdir -p "$HISTORY_DIR"

# Handle case where archive folder already exists (multiple archives same day)
COUNTER=1
ORIGINAL_ARCHIVE_PATH="$ARCHIVE_PATH"
while [ -d "$ARCHIVE_PATH" ]; do
    ARCHIVE_PATH="${ORIGINAL_ARCHIVE_PATH}_${COUNTER}"
    ARCHIVE_NAME="${DATE}_${PROJECT_NAME}_${COUNTER}"
    COUNTER=$((COUNTER + 1))
done

# Count tasks by status from tasks.json
COMPLETE=0
FLAGGED=0
BLOCKED=0
PENDING=0
PARTIAL=0

if [ -f "$CURRENT_DIR/tasks.json" ]; then
    # Use python for reliable JSON parsing if available, else grep
    if command -v python3 &> /dev/null; then
        COUNTS=$(python3 -c "
import json
with open('$CURRENT_DIR/tasks.json') as f:
    data = json.load(f)
tasks = data.get('tasks', data) if isinstance(data, dict) else data
counts = {'complete': 0, 'flagged': 0, 'blocked': 0, 'pending': 0, 'partial': 0}
for t in tasks:
    s = t.get('status', 'pending')
    if s in counts:
        counts[s] += 1
print(f\"{counts['complete']} {counts['flagged']} {counts['blocked']} {counts['pending']} {counts['partial']}\")
" 2>/dev/null) || COUNTS="0 0 0 0 0"
        read COMPLETE FLAGGED BLOCKED PENDING PARTIAL <<< "$COUNTS"
    else
        # Fallback: grep for status strings (less reliable but works without python)
        COMPLETE=$(grep -o '"status": *"complete"' "$CURRENT_DIR/tasks.json" 2>/dev/null | wc -l | tr -d ' ')
        FLAGGED=$(grep -o '"status": *"flagged"' "$CURRENT_DIR/tasks.json" 2>/dev/null | wc -l | tr -d ' ')
        BLOCKED=$(grep -o '"status": *"blocked"' "$CURRENT_DIR/tasks.json" 2>/dev/null | wc -l | tr -d ' ')
        PENDING=$(grep -o '"status": *"pending"' "$CURRENT_DIR/tasks.json" 2>/dev/null | wc -l | tr -d ' ')
        PARTIAL=$(grep -o '"status": *"partial"' "$CURRENT_DIR/tasks.json" 2>/dev/null | wc -l | tr -d ' ')
    fi
fi

# Move current to archive
mkdir -p "$ARCHIVE_PATH"
mv "$CURRENT_DIR"/* "$ARCHIVE_PATH"/ 2>/dev/null || true
mv "$CURRENT_DIR"/.status "$ARCHIVE_PATH"/ 2>/dev/null || true

# Output JSON result
cat << EOF
{
  "archived": true,
  "archive_path": "$ARCHIVE_PATH",
  "archive_name": "$ARCHIVE_NAME",
  "project_name": "$PROJECT_NAME",
  "date": "$DATE",
  "counts": {
    "complete": $COMPLETE,
    "flagged": $FLAGGED,
    "blocked": $BLOCKED,
    "pending": $PENDING,
    "partial": $PARTIAL
  }
}
EOF
