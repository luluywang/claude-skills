#!/bin/bash
# loop.sh — Actor-critic iteration state for write-loop.
# Adapted from slides/scripts/qa_loop.sh. State + artifacts live under
# write-loop/current/ (relative to the invoked CWD by default).
#
# Usage:
#   ./loop.sh init [max_iterations]     # Initialize state (defaults: max=5)
#                                       # Takes SOURCE_PATH / GOAL / PERSONA / SCOPE env vars.
#   ./loop.sh status                    # Print current state + stopping recommendation
#   ./loop.sh next <issues_remaining>   # Record critic verdict, advance iteration counter
#   ./loop.sh finalize                  # Copy the last actor text to current/final.md
#
# State file (current/state.json) keys:
#   iteration, max_iterations, issues_remaining, issues_history, status,
#   goal, persona, scope, source_path, started_at

set -e

if [ -n "${WRITE_LOOP_WORK_DIR:-}" ]; then
    CURRENT_DIR="$WRITE_LOOP_WORK_DIR"
elif PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"; then
    CURRENT_DIR="$PROJECT_ROOT/write-loop/current"
else
    CURRENT_DIR="$(pwd)/write-loop/current"
fi
STATE_FILE="$CURRENT_DIR/state.json"

DEFAULT_MAX_ITERATIONS=5
STAGNATION_THRESHOLD=2

mkdir -p "$CURRENT_DIR"

json_escape() {
    python3 -c 'import json,sys; sys.stdout.write(json.dumps(sys.stdin.read()))'
}

get_json_value() {
    local file="$1" key="$2"
    grep "\"$key\":" "$file" | head -1 \
        | sed -E 's/.*"'"$key"'":[[:space:]]*"?([^",}]*)"?.*/\1/' \
        | tr -d ' \n\r'
}

get_issues_history() {
    if [ -f "$STATE_FILE" ]; then
        grep '"issues_history":' "$STATE_FILE" | head -1 \
            | sed -E 's/.*"issues_history":[[:space:]]*//' \
            | sed -E 's/[[:space:]]*,[[:space:]]*$//' \
            | tr -d '\n\r'
    else
        echo "[]"
    fi
}

case "${1:-status}" in
    init)
        MAX_ITER="${2:-$DEFAULT_MAX_ITERATIONS}"
        SOURCE_PATH="${SOURCE_PATH:-}"
        if [ -z "$SOURCE_PATH" ] || [ ! -f "$SOURCE_PATH" ]; then
            echo "{\"error\": \"init requires SOURCE_PATH env var pointing to an existing file\"}"
            exit 1
        fi
        GOAL_JSON=$(printf "%s" "${GOAL:-unspecified}" | json_escape)
        PERSONA_JSON=$(printf "%s" "${PERSONA:-harsh senior editor}" | json_escape)
        SCOPE_JSON=$(printf "%s" "${SCOPE:-whole file}" | json_escape)
        SRC_JSON=$(printf "%s" "$SOURCE_PATH" | json_escape)
        STARTED=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

        # Seed iter_0 with the source text so the actor can diff against it.
        ITER0="$CURRENT_DIR/iter_0"
        mkdir -p "$ITER0"
        cp "$SOURCE_PATH" "$ITER0/text.md"

        cat > "$STATE_FILE" << EOF
{
  "iteration": 0,
  "max_iterations": $MAX_ITER,
  "issues_remaining": -1,
  "issues_history": [],
  "status": "in_progress",
  "goal": $GOAL_JSON,
  "persona": $PERSONA_JSON,
  "scope": $SCOPE_JSON,
  "source_path": $SRC_JSON,
  "started_at": "$STARTED"
}
EOF
        echo "{\"initialized\": true, \"max_iterations\": $MAX_ITER, \"iter0_dir\": \"$ITER0\"}"
        ;;

    status)
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No state. Run init first.", "exists": false}'
            exit 0
        fi
        ITERATION=$(get_json_value "$STATE_FILE" "iteration")
        MAX_ITER=$(get_json_value "$STATE_FILE" "max_iterations")
        ISSUES_REMAINING=$(get_json_value "$STATE_FILE" "issues_remaining")
        LOOP_STATUS=$(get_json_value "$STATE_FILE" "status")
        ISSUES_HISTORY=$(get_issues_history)

        SHOULD_STOP="false"
        STOP_REASON=""

        if [ "$LOOP_STATUS" != "in_progress" ]; then
            SHOULD_STOP="true"
            STOP_REASON="$LOOP_STATUS"
        fi
        if [ "$ISSUES_REMAINING" -eq 0 ] 2>/dev/null && [ "$ITERATION" -gt 0 ] 2>/dev/null; then
            SHOULD_STOP="true"; STOP_REASON="clean"
        fi
        if [ "$ITERATION" -ge "$MAX_ITER" ] 2>/dev/null; then
            SHOULD_STOP="true"; STOP_REASON="max_iterations"
        fi
        if [ "$ITERATION" -ge "$STAGNATION_THRESHOLD" ] 2>/dev/null; then
            LAST=$(echo "$ISSUES_HISTORY" | tr -d '[]' | tr ',' '\n' | tail -"$STAGNATION_THRESHOLD" | tr -d ' ')
            UNIQ=$(echo "$LAST" | sort -u | wc -l | tr -d ' ')
            if [ "$UNIQ" -eq 1 ] && [ -n "$LAST" ]; then
                SHOULD_STOP="true"; STOP_REASON="stagnation"
            fi
        fi

        cat << EOF
{
  "iteration": $ITERATION,
  "max_iterations": $MAX_ITER,
  "issues_remaining": $ISSUES_REMAINING,
  "issues_history": $ISSUES_HISTORY,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "status": "$LOOP_STATUS"
}
EOF
        ;;

    next)
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No state. Run init first."}'; exit 1
        fi
        ISSUES_NOW="${2:-}"
        if [ -z "$ISSUES_NOW" ]; then
            echo '{"error": "Usage: loop.sh next <issues_remaining>"}'; exit 1
        fi

        CUR=$(get_json_value "$STATE_FILE" "iteration")
        MAX_ITER=$(get_json_value "$STATE_FILE" "max_iterations")
        HIST=$(get_issues_history)
        NEW_ITER=$((CUR + 1))

        OLD=$(echo "$HIST" | tr -d '[]' | tr -d ' ')
        if [ -z "$OLD" ]; then
            NEW_HIST="[$ISSUES_NOW]"
        else
            NEW_HIST="[$OLD, $ISSUES_NOW]"
        fi

        NEW_STATUS="in_progress"; STOP_REASON=""
        if [ "$ISSUES_NOW" -eq 0 ] 2>/dev/null; then
            NEW_STATUS="clean"; STOP_REASON="clean"
        elif [ "$NEW_ITER" -ge "$MAX_ITER" ] 2>/dev/null; then
            NEW_STATUS="max_iterations"; STOP_REASON="max_iterations"
        else
            HN=$(echo "$NEW_HIST" | tr -d '[]' | tr ',' '\n' | tail -"$STAGNATION_THRESHOLD" | tr -d ' ')
            C=$(echo "$HN" | wc -l | tr -d ' ')
            if [ "$C" -ge "$STAGNATION_THRESHOLD" ]; then
                U=$(echo "$HN" | sort -u | wc -l | tr -d ' ')
                if [ "$U" -eq 1 ]; then
                    NEW_STATUS="stagnation"; STOP_REASON="stagnation"
                fi
            fi
        fi

        # Preserve goal/persona/scope/source_path/started_at fields.
        GOAL=$(grep '"goal":' "$STATE_FILE" | head -1 | sed -E 's/.*"goal":[[:space:]]*//; s/,$//')
        PERSONA=$(grep '"persona":' "$STATE_FILE" | head -1 | sed -E 's/.*"persona":[[:space:]]*//; s/,$//')
        SCOPE=$(grep '"scope":' "$STATE_FILE" | head -1 | sed -E 's/.*"scope":[[:space:]]*//; s/,$//')
        SRC=$(grep '"source_path":' "$STATE_FILE" | head -1 | sed -E 's/.*"source_path":[[:space:]]*//; s/,$//')
        STARTED=$(grep '"started_at":' "$STATE_FILE" | head -1 | sed -E 's/.*"started_at":[[:space:]]*"([^"]+)".*/\1/')

        cat > "$STATE_FILE" << EOF
{
  "iteration": $NEW_ITER,
  "max_iterations": $MAX_ITER,
  "issues_remaining": $ISSUES_NOW,
  "issues_history": $NEW_HIST,
  "status": "$NEW_STATUS",
  "goal": $GOAL,
  "persona": $PERSONA,
  "scope": $SCOPE,
  "source_path": $SRC,
  "started_at": "$STARTED"
}
EOF

        SHOULD_STOP="false"
        [ "$NEW_STATUS" != "in_progress" ] && SHOULD_STOP="true"

        cat << EOF
{
  "iteration": $NEW_ITER,
  "issues_remaining": $ISSUES_NOW,
  "issues_history": $NEW_HIST,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "status": "$NEW_STATUS"
}
EOF
        ;;

    finalize)
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No state. Run init first."}'; exit 1
        fi
        ITERATION=$(get_json_value "$STATE_FILE" "iteration")
        LAST_TEXT="$CURRENT_DIR/iter_${ITERATION}/text.md"
        if [ ! -f "$LAST_TEXT" ]; then
            # Fall back to the highest-numbered iter_*/text.md that exists
            LAST_TEXT=$(ls -d "$CURRENT_DIR"/iter_*/text.md 2>/dev/null | sort -V | tail -1)
        fi
        if [ -z "$LAST_TEXT" ] || [ ! -f "$LAST_TEXT" ]; then
            echo '{"error": "No iteration text found to finalize"}'; exit 1
        fi
        cp "$LAST_TEXT" "$CURRENT_DIR/final.md"
        echo "{\"finalized\": true, \"final\": \"$CURRENT_DIR/final.md\", \"source_iter\": $ITERATION}"
        ;;

    *)
        echo '{"error": "Usage: loop.sh init|status|next|finalize"}'
        exit 1
        ;;
esac
