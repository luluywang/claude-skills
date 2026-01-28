#!/bin/bash
# diagnostic_loop.sh - Check diagnostic loop status and iteration count
# Usage:
#   ./diagnostic_loop.sh status   # Get current loop status
#   ./diagnostic_loop.sh next     # Increment iteration, check stopping conditions
#   ./diagnostic_loop.sh init     # Initialize diagnostic state

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_DIR="$SKILL_DIR/current"
STATE_FILE="$CURRENT_DIR/diagnostic_state.json"
FINDINGS_DIR="$CURRENT_DIR/findings"

# Default configuration
DEFAULT_MAX_ITERATIONS=10
DEFAULT_CHECKPOINT_INTERVAL=3
STAGNATION_THRESHOLD=2

# Ensure directories exist
mkdir -p "$CURRENT_DIR"
mkdir -p "$FINDINGS_DIR"

# Helper: Read JSON value (basic parsing for simple cases)
# Works for both "key": "value" and "key": number formats
get_json_value() {
    local file="$1"
    local key="$2"
    # Match "key": value (with or without quotes around value)
    # Handle both "iteration": 0 and "iteration": "0"
    grep "\"$key\":" "$file" | head -1 | sed -E 's/.*"'"$key"'":[[:space:]]*"?([^",}]*)"?.*/\1/' | tr -d ' \n\r'
}

# Helper: Get iteration count
get_iteration() {
    if [ -f "$STATE_FILE" ]; then
        get_json_value "$STATE_FILE" "iteration"
    else
        echo "0"
    fi
}

# Helper: Get max iterations
get_max_iterations() {
    if [ -f "$STATE_FILE" ]; then
        local max=$(get_json_value "$STATE_FILE" "max_iterations")
        echo "${max:-$DEFAULT_MAX_ITERATIONS}"
    else
        echo "$DEFAULT_MAX_ITERATIONS"
    fi
}

# Helper: Count consecutive inconclusive results
count_stagnation() {
    local count=0
    # Check last N findings for inconclusive results
    for f in $(ls -t "$FINDINGS_DIR"/iteration_*.md 2>/dev/null | head -$STAGNATION_THRESHOLD); do
        if grep -q "\[X\] INCONCLUSIVE" "$f" 2>/dev/null || grep -q "INCONCLUSIVE" "$f" 2>/dev/null; then
            ((count++))
        else
            break
        fi
    done
    echo "$count"
}

# Helper: Count hypotheses by status
count_hypotheses() {
    if [ ! -f "$STATE_FILE" ]; then
        echo '{"tested": 0, "pending": 0, "confirmed": 0, "refuted": 0}'
        return
    fi

    local tested=$(grep -o '"status": "tested"' "$STATE_FILE" | wc -l | tr -d ' ')
    local pending=$(grep -o '"status": "pending"' "$STATE_FILE" | wc -l | tr -d ' ')
    local confirmed=$(grep -o '"result": "confirmed"' "$STATE_FILE" | wc -l | tr -d ' ')
    local refuted=$(grep -o '"result": "refuted"' "$STATE_FILE" | wc -l | tr -d ' ')

    echo "{\"tested\": $tested, \"pending\": $pending, \"confirmed\": $confirmed, \"refuted\": $refuted}"
}

case "${1:-status}" in
    init)
        # Initialize diagnostic state with problem statement
        PROBLEM="${2:-No problem statement provided}"
        MAX_ITER="${3:-$DEFAULT_MAX_ITERATIONS}"

        cat > "$STATE_FILE" << EOF
{
  "mode": "diagnostic",
  "problem_statement": "$PROBLEM",
  "iteration": 0,
  "max_iterations": $MAX_ITER,
  "checkpoint_interval": $DEFAULT_CHECKPOINT_INTERVAL,
  "hypotheses": [],
  "selected_hypothesis": null,
  "status": "initialized",
  "created_at": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
EOF
        echo '{"initialized": true, "state_file": "'"$STATE_FILE"'"}'
        ;;

    status)
        # Return current loop status
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No diagnostic state found. Run init first.", "exists": false}'
            exit 0
        fi

        ITERATION=$(get_iteration)
        MAX_ITER=$(get_max_iterations)
        STAGNATION=$(count_stagnation)
        CHECKPOINT_INTERVAL=$DEFAULT_CHECKPOINT_INTERVAL

        # Check stopping conditions
        SHOULD_STOP="false"
        STOP_REASON=""
        NEEDS_CHECKPOINT="false"

        # Check max iterations
        if [ "$ITERATION" -ge "$MAX_ITER" ]; then
            SHOULD_STOP="true"
            STOP_REASON="max_iterations"
        fi

        # Check stagnation
        if [ "$STAGNATION" -ge "$STAGNATION_THRESHOLD" ]; then
            SHOULD_STOP="true"
            STOP_REASON="stagnation"
        fi

        # Check checkpoint
        if [ "$ITERATION" -gt 0 ] && [ $((ITERATION % CHECKPOINT_INTERVAL)) -eq 0 ]; then
            NEEDS_CHECKPOINT="true"
        fi

        # Check for resolution (any confirmed hypothesis)
        if grep -q '"result": "confirmed"' "$STATE_FILE" 2>/dev/null; then
            RESOLVED="true"
        else
            RESOLVED="false"
        fi

        HYPOTHESIS_COUNTS=$(count_hypotheses)

        cat << EOF
{
  "iteration": $ITERATION,
  "max_iterations": $MAX_ITER,
  "remaining_iterations": $((MAX_ITER - ITERATION)),
  "stagnation_count": $STAGNATION,
  "stagnation_threshold": $STAGNATION_THRESHOLD,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "needs_checkpoint": $NEEDS_CHECKPOINT,
  "resolved": $RESOLVED,
  "hypothesis_counts": $HYPOTHESIS_COUNTS,
  "status": "ok"
}
EOF
        ;;

    next)
        # Increment iteration and check stopping conditions
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No diagnostic state found. Run init first.", "exists": false}'
            exit 1
        fi

        # Read current iteration
        CURRENT=$(get_iteration)
        NEW_ITER=$((CURRENT + 1))

        # Update iteration in state file (simple sed replacement)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/\"iteration\": $CURRENT/\"iteration\": $NEW_ITER/" "$STATE_FILE"
        else
            sed -i "s/\"iteration\": $CURRENT/\"iteration\": $NEW_ITER/" "$STATE_FILE"
        fi

        # Return updated status
        "$0" status
        ;;

    *)
        echo '{"error": "Unknown command. Use: init, status, or next"}'
        exit 1
        ;;
esac
