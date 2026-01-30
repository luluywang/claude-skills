#!/bin/bash
# bootstrap.sh - Initialize directory and detect current phase
# Replaces the haiku bootstrap subagent for faster execution

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Working directory: ECON_RA_WORKDIR env var, or $PWD/econ_ra_work/
WORK_DIR="${ECON_RA_WORKDIR:-$PWD/econ_ra_work}"
CURRENT_DIR="$WORK_DIR/current"

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
DIAGNOSTIC_STATE_EXISTS="missing"
DIAGNOSTIC_MODE="false"

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
    [ -f "$CURRENT_DIR/diagnostic_state.json" ] && DIAGNOSTIC_STATE_EXISTS="exists"

    # Check for diagnostic mode (takes precedence over standard workflow)
    if [ "$DIAGNOSTIC_STATE_EXISTS" = "exists" ]; then
        DIAGNOSTIC_MODE="true"
    fi

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
            "paused")
                PHASE="paused"
                REASON="Execution paused - time limit reached"
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
            # Diagnostic mode phases
            "diagnostic_interview")
                PHASE="diagnostic_interview"
                REASON="Diagnostic interview in progress"
                DIAGNOSTIC_MODE="true"
                ;;
            "diagnostic_brainstorm")
                PHASE="diagnostic_brainstorm"
                REASON="Generating diagnostic hypotheses"
                DIAGNOSTIC_MODE="true"
                ;;
            "diagnostic_select")
                PHASE="diagnostic_select"
                REASON="Selecting hypothesis to test"
                DIAGNOSTIC_MODE="true"
                ;;
            "diagnostic_try")
                PHASE="diagnostic_try"
                REASON="Testing hypothesis"
                DIAGNOSTIC_MODE="true"
                ;;
            "diagnostic_ingest")
                PHASE="diagnostic_ingest"
                REASON="Processing test results"
                DIAGNOSTIC_MODE="true"
                ;;
            "diagnostic_checkpoint")
                PHASE="diagnostic_checkpoint"
                REASON="Checkpoint - awaiting user input"
                DIAGNOSTIC_MODE="true"
                ;;
            "diagnostic_wrapup")
                PHASE="diagnostic_wrapup"
                REASON="Diagnostic complete - generating summary"
                DIAGNOSTIC_MODE="true"
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
  "diagnostic_mode": $DIAGNOSTIC_MODE,
  "files": {
    "status": "$STATUS_EXISTS",
    "status_content": "$STATUS_CONTENT",
    "full_spec": "$FULL_SPEC_EXISTS",
    "tasks": "$TASKS_EXISTS",
    "checks": "$CHECKS_EXISTS",
    "session_log": "$SESSION_LOG_EXISTS",
    "diagnostic_state": "$DIAGNOSTIC_STATE_EXISTS"
  }
}
EOF
