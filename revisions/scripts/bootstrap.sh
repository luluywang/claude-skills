#!/bin/bash
# bootstrap.sh - Initialize directory and detect current phase for revisions skill
# Phases: init, extract, profile, audit, fix, review, complete

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_DIR="$SKILL_DIR/current"

# Initialize output variables
DIR_CREATED="no"
PHASE=""
REASON=""
STATUS_CONTENT=""
STATUS_EXISTS="missing"
CONFIG_EXISTS="missing"
CLAIMS_EXISTS="missing"
AUDIT_EXISTS="missing"
FIX_STATE_EXISTS="missing"
REFEREE_PROFILES_EXISTS="missing"
CHANGELOG_EXISTS="missing"
TODOS_EXISTS="missing"

# Step 1: Create directory if needed
if [ ! -d "$CURRENT_DIR" ]; then
    mkdir -p "$CURRENT_DIR"
    DIR_CREATED="yes"
    PHASE="init"
    REASON="New revision - directory created"
else
    # Step 2: Check for key files
    [ -f "$CURRENT_DIR/config.json" ] && CONFIG_EXISTS="exists"
    [ -f "$CURRENT_DIR/claims.json" ] && CLAIMS_EXISTS="exists"
    [ -f "$CURRENT_DIR/referee_profiles.json" ] && REFEREE_PROFILES_EXISTS="exists"
    [ -f "$CURRENT_DIR/audit.json" ] && AUDIT_EXISTS="exists"
    [ -f "$CURRENT_DIR/fix_state.json" ] && FIX_STATE_EXISTS="exists"
    [ -f "$CURRENT_DIR/changelog.md" ] && CHANGELOG_EXISTS="exists"
    [ -f "$CURRENT_DIR/todos.md" ] && TODOS_EXISTS="exists"

    # Step 3: Read status file if present
    if [ -f "$CURRENT_DIR/.status" ]; then
        STATUS_EXISTS="exists"
        STATUS_CONTENT=$(cat "$CURRENT_DIR/.status" | tr -d '\n')

        # Phase detection based on status file
        case "$STATUS_CONTENT" in
            "init")
                PHASE="init"
                REASON="Awaiting file path collection"
                ;;
            "extract")
                PHASE="extract"
                REASON="Extract phase - parsing response doc into claims"
                ;;
            "profile")
                PHASE="profile"
                REASON="Profile phase - building referee personality profiles"
                ;;
            "audit")
                PHASE="audit"
                REASON="Audit phase - cross-checking claims against manuscript"
                ;;
            "fix")
                PHASE="fix"
                REASON="Fix phase - fixer-critic loop in progress"
                ;;
            "review")
                PHASE="review"
                REASON="Review phase - presenting changelog and TODOs"
                ;;
            "complete")
                PHASE="complete"
                REASON="Revision alignment complete"
                ;;
            *)
                PHASE="unknown"
                REASON="Unrecognized status: $STATUS_CONTENT"
                ;;
        esac
    else
        # No status file - infer from files present
        if [ "$CONFIG_EXISTS" = "missing" ]; then
            PHASE="init"
            REASON="No config yet"
        elif [ "$CLAIMS_EXISTS" = "missing" ]; then
            PHASE="extract"
            REASON="Config exists but no claims extracted"
        elif [ "$REFEREE_PROFILES_EXISTS" = "missing" ]; then
            PHASE="profile"
            REASON="Claims exist but referees not profiled"
        elif [ "$AUDIT_EXISTS" = "missing" ]; then
            PHASE="audit"
            REASON="Claims exist but not audited"
        elif [ "$FIX_STATE_EXISTS" = "missing" ]; then
            PHASE="fix"
            REASON="Audit exists but fix loop not started"
        elif [ "$CHANGELOG_EXISTS" = "missing" ]; then
            PHASE="review"
            REASON="Fix loop done but no changelog"
        else
            PHASE="complete"
            REASON="All files present"
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
    "config": "$CONFIG_EXISTS",
    "claims": "$CLAIMS_EXISTS",
    "referee_profiles": "$REFEREE_PROFILES_EXISTS",
    "audit": "$AUDIT_EXISTS",
    "fix_state": "$FIX_STATE_EXISTS",
    "changelog": "$CHANGELOG_EXISTS",
    "todos": "$TODOS_EXISTS"
  }
}
EOF
