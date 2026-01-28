#!/bin/bash
# time_limit.sh - Manage execution time limits
#
# Usage:
#   ./time_limit.sh set [1|3|infinite|N]  # Set time limit (N = hours)
#   ./time_limit.sh check                  # Check if limit exceeded
#   ./time_limit.sh start                  # Start the clock (call when execution begins)
#   ./time_limit.sh status                 # Get current time info
#   ./time_limit.sh extend [N]             # Extend by N hours (default: 1)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
TIME_FILE="$SKILL_DIR/current/.time_limit"

# Ensure current/ exists
mkdir -p "$SKILL_DIR/current"

command="${1:-status}"

case "$command" in
    set)
        limit="${2:-3}"

        # Parse limit
        if [[ "$limit" == "infinite" || "$limit" == "none" || "$limit" == "no" ]]; then
            limit_hours=-1
            limit_type="no limit"
        else
            limit_hours="$limit"
            if [[ "$limit" == "1" ]]; then
                limit_type="1 hour"
            else
                limit_type="$limit hours"
            fi
        fi

        # Write time limit file (start_time will be set when execution begins)
        # Use local time (not UTC) for consistent parsing
        cat > "$TIME_FILE" << EOF
{
  "limit_hours": $limit_hours,
  "limit_type": "$limit_type",
  "start_time": null,
  "created_at": "$(date +"%Y-%m-%dT%H:%M:%S")"
}
EOF

        echo '{"status": "set", "limit_hours": '$limit_hours', "limit_type": "'"$limit_type"'"}'
        ;;

    start)
        # Start the execution clock
        if [[ ! -f "$TIME_FILE" ]]; then
            echo '{"error": "No time limit set. Run: ./time_limit.sh set [hours]"}'
            exit 1
        fi

        # Read current settings
        limit_hours=$(grep -o '"limit_hours": *-*[0-9]*' "$TIME_FILE" | grep -o '\-*[0-9]*$')
        limit_type=$(grep -o '"limit_type": *"[^"]*"' "$TIME_FILE" | sed 's/"limit_type": *"//' | sed 's/"$//')

        # Update with start time (use local time for consistent parsing)
        start_time=$(date +"%Y-%m-%dT%H:%M:%S")
        cat > "$TIME_FILE" << EOF
{
  "limit_hours": $limit_hours,
  "limit_type": "$limit_type",
  "start_time": "$start_time",
  "created_at": "$(date +"%Y-%m-%dT%H:%M:%S")"
}
EOF

        echo '{"status": "started", "start_time": "'"$start_time"'", "limit_hours": '$limit_hours'}'
        ;;

    check)
        if [[ ! -f "$TIME_FILE" ]]; then
            # No time limit set - always OK
            echo '{"status": "ok", "exceeded": false, "limit_hours": -1, "elapsed_hours": 0, "remaining_hours": -1, "message": "No time limit set"}'
            exit 0
        fi

        # Read settings
        limit_hours=$(grep -o '"limit_hours": *-*[0-9]*' "$TIME_FILE" | grep -o '\-*[0-9]*$')
        start_time=$(grep -o '"start_time": *"[^"]*"' "$TIME_FILE" | sed 's/"start_time": *"//' | sed 's/"$//')

        # If no limit (infinite), always OK
        if [[ "$limit_hours" == "-1" ]]; then
            echo '{"status": "ok", "exceeded": false, "limit_hours": -1, "elapsed_hours": 0, "remaining_hours": -1, "message": "No time limit"}'
            exit 0
        fi

        # If clock not started yet, start it now
        if [[ "$start_time" == "null" || -z "$start_time" ]]; then
            "$0" start > /dev/null
            echo '{"status": "ok", "exceeded": false, "limit_hours": '$limit_hours', "elapsed_hours": 0, "remaining_hours": '$limit_hours', "message": "Clock started"}'
            exit 0
        fi

        # Calculate elapsed time (handle both macOS and Linux date formats)
        if [[ "$(uname)" == "Darwin" ]]; then
            start_epoch=$(date -j -f "%Y-%m-%dT%H:%M:%S" "$start_time" +%s 2>/dev/null)
        else
            start_epoch=$(date -d "$start_time" +%s)
        fi
        now_epoch=$(date +%s)
        elapsed_seconds=$((now_epoch - start_epoch))
        elapsed_hours=$(echo "scale=2; $elapsed_seconds / 3600" | bc)
        remaining_hours=$(echo "scale=2; $limit_hours - $elapsed_hours" | bc)

        # Check if exceeded
        exceeded="false"
        status="ok"
        if (( $(echo "$elapsed_hours >= $limit_hours" | bc -l) )); then
            exceeded="true"
            status="exceeded"
        fi

        echo '{"status": "'"$status"'", "exceeded": '$exceeded', "limit_hours": '$limit_hours', "elapsed_hours": '$elapsed_hours', "remaining_hours": '$remaining_hours'}'
        ;;

    extend)
        extend_by="${2:-1}"

        if [[ ! -f "$TIME_FILE" ]]; then
            echo '{"error": "No time limit set"}'
            exit 1
        fi

        # Read current limit
        current_limit=$(grep -o '"limit_hours": *-*[0-9]*' "$TIME_FILE" | grep -o '\-*[0-9]*$')

        if [[ "$current_limit" == "-1" ]]; then
            echo '{"status": "unchanged", "limit_hours": -1, "message": "Already unlimited"}'
            exit 0
        fi

        # Calculate new limit
        new_limit=$((current_limit + extend_by))

        # Read other fields
        start_time=$(grep -o '"start_time": *"[^"]*"' "$TIME_FILE" | sed 's/"start_time": *"//' | sed 's/"$//')

        # Update file (use local time for consistent parsing)
        cat > "$TIME_FILE" << EOF
{
  "limit_hours": $new_limit,
  "limit_type": "$new_limit hours",
  "start_time": "$start_time",
  "created_at": "$(date +"%Y-%m-%dT%H:%M:%S")"
}
EOF

        echo '{"status": "extended", "previous_limit": '$current_limit', "new_limit": '$new_limit', "extended_by": '$extend_by'}'
        ;;

    status|*)
        if [[ ! -f "$TIME_FILE" ]]; then
            echo '{"exists": false, "message": "No time limit configured"}'
            exit 0
        fi

        cat "$TIME_FILE"
        ;;
esac
