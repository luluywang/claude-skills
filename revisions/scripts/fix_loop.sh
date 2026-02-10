#!/bin/bash
# fix_loop.sh - Manage fixer-critic iteration loop
# Usage:
#   ./fix_loop.sh init [max_iterations]   # Initialize fix state
#   ./fix_loop.sh status                  # Get current loop status
#   ./fix_loop.sh next <issues_remaining> # Record iteration result, check stopping

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_DIR="$SKILL_DIR/current"
STATE_FILE="$CURRENT_DIR/fix_state.json"
ITERATIONS_DIR="$CURRENT_DIR/fix_iterations"

# Default configuration
DEFAULT_MAX_ITERATIONS=5
STAGNATION_THRESHOLD=2

# Ensure directories exist
mkdir -p "$CURRENT_DIR"

# Helper: Read JSON value (basic parsing)
get_json_value() {
    local file="$1"
    local key="$2"
    grep "\"$key\":" "$file" | head -1 | sed -E 's/.*"'"$key"'":[[:space:]]*"?([^",}]*)"?.*/\1/' | tr -d ' \n\r'
}

# Helper: Read JSON array (issues_history)
get_issues_history() {
    if [ -f "$STATE_FILE" ]; then
        grep '"issues_history":' "$STATE_FILE" | head -1 | sed -E 's/.*"issues_history":[[:space:]]*//' | sed -E 's/[[:space:]]*,[[:space:]]*$//' | tr -d '\n\r'
    else
        echo "[]"
    fi
}

case "${1:-status}" in
    init)
        # Initialize fix state
        # Read audit.json to count initial issues
        MAX_ITER="${2:-$DEFAULT_MAX_ITERATIONS}"

        ISSUES_INITIAL=0
        if [ -f "$CURRENT_DIR/audit.json" ]; then
            # Count entries with status "missing" or "partial"
            MISSING=$(grep -c '"status": "missing"' "$CURRENT_DIR/audit.json" 2>/dev/null || echo "0")
            PARTIAL=$(grep -c '"status": "partial"' "$CURRENT_DIR/audit.json" 2>/dev/null || echo "0")
            ISSUES_INITIAL=$((MISSING + PARTIAL))
        fi

        mkdir -p "$ITERATIONS_DIR"

        cat > "$STATE_FILE" << EOF
{
  "iteration": 0,
  "max_iterations": $MAX_ITER,
  "issues_initial": $ISSUES_INITIAL,
  "issues_remaining": $ISSUES_INITIAL,
  "issues_history": [],
  "status": "in_progress"
}
EOF
        echo "{\"initialized\": true, \"issues_initial\": $ISSUES_INITIAL, \"max_iterations\": $MAX_ITER}"
        ;;

    status)
        # Return current loop status
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No fix state found. Run init first.", "exists": false}'
            exit 0
        fi

        ITERATION=$(get_json_value "$STATE_FILE" "iteration")
        MAX_ITER=$(get_json_value "$STATE_FILE" "max_iterations")
        ISSUES_REMAINING=$(get_json_value "$STATE_FILE" "issues_remaining")
        ISSUES_INITIAL=$(get_json_value "$STATE_FILE" "issues_initial")
        LOOP_STATUS=$(get_json_value "$STATE_FILE" "status")
        ISSUES_HISTORY=$(get_issues_history)

        # Check stopping conditions
        SHOULD_STOP="false"
        STOP_REASON=""

        # Already stopped
        if [ "$LOOP_STATUS" != "in_progress" ]; then
            SHOULD_STOP="true"
            STOP_REASON="$LOOP_STATUS"
        fi

        # Check resolved
        if [ "$ISSUES_REMAINING" -eq 0 ] 2>/dev/null; then
            SHOULD_STOP="true"
            STOP_REASON="resolved"
        fi

        # Check max iterations
        if [ "$ITERATION" -ge "$MAX_ITER" ] 2>/dev/null; then
            SHOULD_STOP="true"
            STOP_REASON="max_iterations"
        fi

        # Check stagnation (2 consecutive iterations with same issues_remaining)
        if [ "$ITERATION" -ge "$STAGNATION_THRESHOLD" ] 2>/dev/null; then
            # Parse last N values from issues_history array
            HISTORY_VALUES=$(echo "$ISSUES_HISTORY" | tr -d '[]' | tr ',' '\n' | tail -"$STAGNATION_THRESHOLD" | tr -d ' ')
            UNIQUE_VALUES=$(echo "$HISTORY_VALUES" | sort -u | wc -l | tr -d ' ')
            if [ "$UNIQUE_VALUES" -eq 1 ] && [ -n "$HISTORY_VALUES" ]; then
                SHOULD_STOP="true"
                STOP_REASON="stagnation"
            fi
        fi

        cat << EOF
{
  "iteration": $ITERATION,
  "max_iterations": $MAX_ITER,
  "issues_initial": $ISSUES_INITIAL,
  "issues_remaining": $ISSUES_REMAINING,
  "issues_history": $ISSUES_HISTORY,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "status": "$LOOP_STATUS"
}
EOF
        ;;

    next)
        # Record iteration result and check stopping conditions
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No fix state found. Run init first.", "exists": false}'
            exit 1
        fi

        ISSUES_NOW="${2:-}"
        if [ -z "$ISSUES_NOW" ]; then
            echo '{"error": "Usage: fix_loop.sh next <issues_remaining>"}'
            exit 1
        fi

        # Read current state
        CURRENT_ITER=$(get_json_value "$STATE_FILE" "iteration")
        MAX_ITER=$(get_json_value "$STATE_FILE" "max_iterations")
        ISSUES_INITIAL=$(get_json_value "$STATE_FILE" "issues_initial")
        ISSUES_HISTORY=$(get_issues_history)

        NEW_ITER=$((CURRENT_ITER + 1))

        # Build new history array
        OLD_HISTORY=$(echo "$ISSUES_HISTORY" | tr -d '[]' | tr -d ' ')
        if [ -z "$OLD_HISTORY" ]; then
            NEW_HISTORY="[$ISSUES_NOW]"
        else
            NEW_HISTORY="[$OLD_HISTORY, $ISSUES_NOW]"
        fi

        # Determine new status
        NEW_STATUS="in_progress"
        STOP_REASON=""

        if [ "$ISSUES_NOW" -eq 0 ] 2>/dev/null; then
            NEW_STATUS="resolved"
            STOP_REASON="resolved"
        elif [ "$NEW_ITER" -ge "$MAX_ITER" ] 2>/dev/null; then
            NEW_STATUS="max_iterations"
            STOP_REASON="max_iterations"
        else
            # Check stagnation
            HISTORY_WITH_NEW=$(echo "$NEW_HISTORY" | tr -d '[]' | tr ',' '\n' | tail -"$STAGNATION_THRESHOLD" | tr -d ' ')
            COUNT=$(echo "$HISTORY_WITH_NEW" | wc -l | tr -d ' ')
            if [ "$COUNT" -ge "$STAGNATION_THRESHOLD" ]; then
                UNIQUE=$(echo "$HISTORY_WITH_NEW" | sort -u | wc -l | tr -d ' ')
                if [ "$UNIQUE" -eq 1 ]; then
                    NEW_STATUS="stagnation"
                    STOP_REASON="stagnation"
                fi
            fi
        fi

        # Write updated state
        cat > "$STATE_FILE" << EOF
{
  "iteration": $NEW_ITER,
  "max_iterations": $MAX_ITER,
  "issues_initial": $ISSUES_INITIAL,
  "issues_remaining": $ISSUES_NOW,
  "issues_history": $NEW_HISTORY,
  "status": "$NEW_STATUS"
}
EOF

        SHOULD_STOP="false"
        [ "$NEW_STATUS" != "in_progress" ] && SHOULD_STOP="true"

        cat << EOF
{
  "iteration": $NEW_ITER,
  "issues_remaining": $ISSUES_NOW,
  "issues_history": $NEW_HISTORY,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "status": "$NEW_STATUS"
}
EOF
        ;;

    *)
        echo '{"error": "Unknown command. Use: init, status, or next"}'
        exit 1
        ;;
esac
