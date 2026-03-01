#!/bin/bash
# bootstrap.sh - Initialize directory and detect current phase for revisions skill
# Phases: init, extract, profile, strategy, audit, fix, review, complete

set -e

CURRENT_DIR="$(pwd)/revisions/current"

# Initialize output variables
DIR_CREATED="no"
PHASE=""
REASON=""
STATUS_CONTENT=""
STATUS_EXISTS="missing"
CONFIG_EXISTS="missing"
CLAIMS_EXISTS="missing"
STRATEGY_MEMO_EXISTS="missing"
AUDIT_EXISTS="missing"
FIX_STATE_EXISTS="missing"
REFEREE_PROFILES_EXISTS="missing"
CHANGELOG_EXISTS="missing"
TODOS_EXISTS="missing"
AE_LETTER_DETECTED="no"

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
    [ -f "$CURRENT_DIR/strategy_memo.md" ] && STRATEGY_MEMO_EXISTS="exists"
    [ -f "$CURRENT_DIR/audit.json" ] && AUDIT_EXISTS="exists"
    [ -f "$CURRENT_DIR/fix_state.json" ] && FIX_STATE_EXISTS="exists"
    [ -f "$CURRENT_DIR/changelog.md" ] && CHANGELOG_EXISTS="exists"
    [ -f "$CURRENT_DIR/todos.md" ] && TODOS_EXISTS="exists"

    # Step 2b: Detect AE letter in response document
    # Check if config.json names an ae_letter file, or if the response doc starts with
    # a "Dear Associate Editor" salutation
    if [ "$CONFIG_EXISTS" = "exists" ]; then
        AE_FILE=$(python3 -c "import json,sys; d=json.load(open('$CURRENT_DIR/config.json')); print(d.get('ae_letter',''))" 2>/dev/null || true)
        if [ -n "$AE_FILE" ] && [ -f "$AE_FILE" ]; then
            AE_LETTER_DETECTED="yes"
        else
            RESPONSE_FILE=$(python3 -c "import json,sys; d=json.load(open('$CURRENT_DIR/config.json')); print(d.get('response_doc',''))" 2>/dev/null || true)
            if [ -n "$RESPONSE_FILE" ] && [ -f "$RESPONSE_FILE" ]; then
                if grep -qiE "^[[:space:]]*(Dear Associate Editor|Dear Action Editor)" "$RESPONSE_FILE" 2>/dev/null; then
                    AE_LETTER_DETECTED="yes"
                fi
            fi
        fi
    fi

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
            "strategy")
                PHASE="strategy"
                REASON="Strategy phase - producing high-level response strategy memo"
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
        elif [ "$STRATEGY_MEMO_EXISTS" = "missing" ]; then
            PHASE="strategy"
            REASON="Referee profiles exist but strategy memo not produced"
        elif [ "$AUDIT_EXISTS" = "missing" ]; then
            PHASE="audit"
            REASON="Strategy memo exists but claims not audited"
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
  "ae_letter_detected": "$AE_LETTER_DETECTED",
  "files": {
    "status": "$STATUS_EXISTS",
    "status_content": "$STATUS_CONTENT",
    "config": "$CONFIG_EXISTS",
    "claims": "$CLAIMS_EXISTS",
    "referee_profiles": "$REFEREE_PROFILES_EXISTS",
    "strategy_memo": "$STRATEGY_MEMO_EXISTS",
    "audit": "$AUDIT_EXISTS",
    "fix_state": "$FIX_STATE_EXISTS",
    "changelog": "$CHANGELOG_EXISTS",
    "todos": "$TODOS_EXISTS"
  }
}
EOF
