#!/bin/bash
# bootstrap.sh - Initialize directory and detect current phase for revisions skill
# Replaces a subagent for faster execution

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
COMMENTS_EXISTS="missing"
TRIAGE_EXISTS="missing"
RESPONSES_DIR_EXISTS="missing"
RESPONSES_COUNT=0
VERIFICATION_EXISTS="missing"

# Step 1: Create directory if needed
if [ ! -d "$CURRENT_DIR" ]; then
    mkdir -p "$CURRENT_DIR"
    DIR_CREATED="yes"
    PHASE="fresh"
    REASON="New revision - directory created"
else
    # Step 2: Check for key files
    [ -f "$CURRENT_DIR/config.json" ] && CONFIG_EXISTS="exists"
    [ -f "$CURRENT_DIR/comments.json" ] && COMMENTS_EXISTS="exists"
    [ -f "$CURRENT_DIR/triage.json" ] && TRIAGE_EXISTS="exists"
    if [ -d "$CURRENT_DIR/verification" ] && [ "$(find "$CURRENT_DIR/verification" -name "*.json" 2>/dev/null | wc -l | tr -d ' ')" -gt 0 ]; then
        VERIFICATION_EXISTS="exists"
    fi

    if [ -d "$CURRENT_DIR/responses" ]; then
        RESPONSES_DIR_EXISTS="exists"
        RESPONSES_COUNT=$(find "$CURRENT_DIR/responses" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    fi

    # Step 3: Read status file if present
    if [ -f "$CURRENT_DIR/.status" ]; then
        STATUS_EXISTS="exists"
        STATUS_CONTENT=$(cat "$CURRENT_DIR/.status" | tr -d '\n')

        # Phase detection based on status file
        case "$STATUS_CONTENT" in
            "fresh")
                PHASE="fresh"
                REASON="Awaiting input collection"
                ;;
            "parse")
                PHASE="parse"
                REASON="Parse phase - extracting comments from reports"
                ;;
            "triage")
                PHASE="triage"
                REASON="Triage phase - categorizing comments"
                ;;
            "draft")
                PHASE="draft"
                REASON="Draft phase - writing responses"
                ;;
            "verify")
                PHASE="verify"
                REASON="Verify phase - cross-checking claims"
                ;;
            "compile")
                PHASE="compile"
                REASON="Compile phase - assembling LaTeX document"
                ;;
            "complete")
                PHASE="complete"
                REASON="Revision response complete"
                ;;
            *)
                PHASE="unknown"
                REASON="Unrecognized status: $STATUS_CONTENT"
                ;;
        esac
    else
        # No status file - infer from files present
        if [ "$CONFIG_EXISTS" = "missing" ]; then
            PHASE="fresh"
            REASON="No config yet"
        elif [ "$COMMENTS_EXISTS" = "missing" ]; then
            PHASE="parse"
            REASON="Config exists but no comments extracted"
        elif [ "$TRIAGE_EXISTS" = "missing" ]; then
            PHASE="triage"
            REASON="Comments exist but not triaged"
        elif [ "$RESPONSES_COUNT" -eq 0 ]; then
            PHASE="draft"
            REASON="Triaged but no responses drafted"
        elif [ "$VERIFICATION_EXISTS" = "missing" ]; then
            PHASE="verify"
            REASON="Responses exist but not verified"
        else
            PHASE="compile"
            REASON="All files present, ready to compile"
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
    "comments": "$COMMENTS_EXISTS",
    "triage": "$TRIAGE_EXISTS",
    "responses_dir": "$RESPONSES_DIR_EXISTS",
    "responses_count": $RESPONSES_COUNT,
    "verification": "$VERIFICATION_EXISTS"
  }
}
EOF
