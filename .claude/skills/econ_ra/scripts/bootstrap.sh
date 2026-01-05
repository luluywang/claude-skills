#!/bin/bash
# bootstrap.sh - Initialize directory and detect current phase
# Replaces the haiku bootstrap subagent for faster execution

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_DIR="$SKILL_DIR/current"

# Initialize output variables
DIR_CREATED="no"
PHASE=""
REASON=""
STATUS_CONTENT=""
STATUS_EXISTS="missing"
FULL_SPEC_EXISTS="missing"
TASKS_EXISTS="missing"
CHECKS_EXISTS="missing"
SESSION_LOG_EXISTS="missing"

# Step 1: Create directory if needed
if [ ! -d "$CURRENT_DIR" ]; then
    mkdir -p "$CURRENT_DIR"
    DIR_CREATED="yes"
    PHASE="interview"
    REASON="New project - directory created"
else
    # Step 2: Check for key files
    [ -f "$CURRENT_DIR/full_spec.md" ] && FULL_SPEC_EXISTS="exists"
    [ -f "$CURRENT_DIR/tasks.json" ] && TASKS_EXISTS="exists"
    [ -f "$CURRENT_DIR/checks.md" ] && CHECKS_EXISTS="exists"
    [ -f "$CURRENT_DIR/session_log.md" ] && SESSION_LOG_EXISTS="exists"

    # Step 3: Read status file if present
    if [ -f "$CURRENT_DIR/.status" ]; then
        STATUS_EXISTS="exists"
        STATUS_CONTENT=$(cat "$CURRENT_DIR/.status" | tr -d '\n')

        # Phase detection based on status file
        case "$STATUS_CONTENT" in
            "complete")
                PHASE="cleanup"
                REASON="Project marked complete, needs archival"
                ;;
            "execution")
                PHASE="execution"
                REASON="Execution in progress"
                ;;
            "verification")
                PHASE="execution"
                REASON="Legacy verification status - treat as execution"
                ;;
            "planning")
                PHASE="planning"
                REASON="Planning phase"
                ;;
            "interview")
                PHASE="interview"
                REASON="Interview in progress"
                ;;
            *)
                PHASE="unknown"
                REASON="Unrecognized status: $STATUS_CONTENT"
                ;;
        esac
    else
        # No status file - infer from files present
        if [ "$FULL_SPEC_EXISTS" = "missing" ]; then
            PHASE="interview"
            REASON="No full spec yet"
        elif [ "$TASKS_EXISTS" = "missing" ] || [ "$CHECKS_EXISTS" = "missing" ]; then
            PHASE="planning"
            REASON="Full spec exists but no tasks/checks"
        else
            PHASE="execution"
            REASON="All planning files present"
        fi
    fi
fi

# Output JSON result
cat << EOF
{
  "phase": "$PHASE",
  "reason": "$REASON",
  "directory_created": "$DIR_CREATED",
  "files": {
    "status": "$STATUS_EXISTS",
    "status_content": "$STATUS_CONTENT",
    "full_spec": "$FULL_SPEC_EXISTS",
    "tasks": "$TASKS_EXISTS",
    "checks": "$CHECKS_EXISTS",
    "session_log": "$SESSION_LOG_EXISTS"
  }
}
EOF
