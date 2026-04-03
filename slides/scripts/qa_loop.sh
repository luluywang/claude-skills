#!/bin/bash
# qa_loop.sh - Manage actor-critic visual QA iteration loop for slides
# Usage:
#   ./qa_loop.sh init [max_iterations]   # Initialize QA state
#   ./qa_loop.sh status                  # Get current loop status
#   ./qa_loop.sh next <issues_found>     # Record iteration result, check stopping
#   ./qa_loop.sh render <pptx_path>      # Convert pptx to slide images

set -e

WORK_DIR="${SLIDES_WORK_DIR:-$(pwd)/slides_work}"
STATE_FILE="$WORK_DIR/qa_state.json"
IMAGES_DIR="$WORK_DIR/slide_images"

DEFAULT_MAX_ITERATIONS=5
STAGNATION_THRESHOLD=2

mkdir -p "$WORK_DIR"

get_json_value() {
    local file="$1" key="$2"
    grep "\"$key\":" "$file" | head -1 | sed -E 's/.*"'"$key"'":[[:space:]]*"?([^",}]*)"?.*/\1/' | tr -d ' \n\r'
}

get_issues_history() {
    if [ -f "$STATE_FILE" ]; then
        grep '"issues_history":' "$STATE_FILE" | head -1 | sed -E 's/.*"issues_history":[[:space:]]*//' | sed -E 's/[[:space:]]*,[[:space:]]*$//' | tr -d '\n\r'
    else
        echo "[]"
    fi
}

case "${1:-status}" in
    init)
        MAX_ITER="${2:-$DEFAULT_MAX_ITERATIONS}"
        mkdir -p "$IMAGES_DIR"

        cat > "$STATE_FILE" << EOF
{
  "iteration": 0,
  "max_iterations": $MAX_ITER,
  "issues_found": 0,
  "issues_history": [],
  "status": "in_progress"
}
EOF
        echo "{\"initialized\": true, \"max_iterations\": $MAX_ITER, \"images_dir\": \"$IMAGES_DIR\"}"
        ;;

    render)
        PPTX_PATH="${2:-}"
        if [ -z "$PPTX_PATH" ] || [ ! -f "$PPTX_PATH" ]; then
            echo "{\"error\": \"Usage: qa_loop.sh render <pptx_path>\"}"
            exit 1
        fi

        mkdir -p "$IMAGES_DIR"
        ITERATION=$(get_json_value "$STATE_FILE" "iteration" 2>/dev/null || echo "0")
        ITER_DIR="$IMAGES_DIR/iter_${ITERATION}"
        mkdir -p "$ITER_DIR"

        # Convert PPTX -> PDF -> JPG images
        PDF_PATH="$ITER_DIR/slides.pdf"

        # Try LibreOffice conversion
        if command -v soffice &>/dev/null; then
            soffice --headless --convert-to pdf --outdir "$ITER_DIR" "$PPTX_PATH" 2>/dev/null
            # soffice names the PDF after the input file
            SOFFICE_PDF="$ITER_DIR/$(basename "${PPTX_PATH%.*}").pdf"
            [ -f "$SOFFICE_PDF" ] && mv "$SOFFICE_PDF" "$PDF_PATH"
        elif python3 -c "from scripts.office.soffice import convert" 2>/dev/null; then
            python3 -c "
import subprocess, sys
subprocess.run([sys.executable, 'scripts/office/soffice.py', '--headless', '--convert-to', 'pdf', '$PPTX_PATH'], check=True)
" 2>/dev/null
        else
            echo "{\"error\": \"LibreOffice (soffice) not found. Install it for visual QA.\"}"
            exit 1
        fi

        if [ ! -f "$PDF_PATH" ]; then
            echo "{\"error\": \"PDF conversion failed\"}"
            exit 1
        fi

        # PDF -> individual slide JPGs
        if command -v pdftoppm &>/dev/null; then
            pdftoppm -jpeg -r 150 "$PDF_PATH" "$ITER_DIR/slide"
            SLIDE_COUNT=$(ls "$ITER_DIR"/slide-*.jpg 2>/dev/null | wc -l | tr -d ' ')
            echo "{\"rendered\": true, \"iteration\": $ITERATION, \"slide_count\": $SLIDE_COUNT, \"images_dir\": \"$ITER_DIR\"}"
        else
            echo "{\"error\": \"pdftoppm not found. Install poppler: brew install poppler\"}"
            exit 1
        fi
        ;;

    status)
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No QA state found. Run init first.", "exists": false}'
            exit 0
        fi

        ITERATION=$(get_json_value "$STATE_FILE" "iteration")
        MAX_ITER=$(get_json_value "$STATE_FILE" "max_iterations")
        ISSUES_FOUND=$(get_json_value "$STATE_FILE" "issues_found")
        LOOP_STATUS=$(get_json_value "$STATE_FILE" "status")
        ISSUES_HISTORY=$(get_issues_history)

        SHOULD_STOP="false"
        STOP_REASON=""

        if [ "$LOOP_STATUS" != "in_progress" ]; then
            SHOULD_STOP="true"
            STOP_REASON="$LOOP_STATUS"
        fi

        if [ "$ISSUES_FOUND" -eq 0 ] 2>/dev/null && [ "$ITERATION" -gt 0 ] 2>/dev/null; then
            SHOULD_STOP="true"
            STOP_REASON="clean"
        fi

        if [ "$ITERATION" -ge "$MAX_ITER" ] 2>/dev/null; then
            SHOULD_STOP="true"
            STOP_REASON="max_iterations"
        fi

        if [ "$ITERATION" -ge "$STAGNATION_THRESHOLD" ] 2>/dev/null; then
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
  "issues_found": $ISSUES_FOUND,
  "issues_history": $ISSUES_HISTORY,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "status": "$LOOP_STATUS"
}
EOF
        ;;

    next)
        if [ ! -f "$STATE_FILE" ]; then
            echo '{"error": "No QA state found. Run init first."}'
            exit 1
        fi

        ISSUES_NOW="${2:-}"
        if [ -z "$ISSUES_NOW" ]; then
            echo '{"error": "Usage: qa_loop.sh next <issues_found>"}'
            exit 1
        fi

        CURRENT_ITER=$(get_json_value "$STATE_FILE" "iteration")
        MAX_ITER=$(get_json_value "$STATE_FILE" "max_iterations")
        ISSUES_HISTORY=$(get_issues_history)

        NEW_ITER=$((CURRENT_ITER + 1))

        OLD_HISTORY=$(echo "$ISSUES_HISTORY" | tr -d '[]' | tr -d ' ')
        if [ -z "$OLD_HISTORY" ]; then
            NEW_HISTORY="[$ISSUES_NOW]"
        else
            NEW_HISTORY="[$OLD_HISTORY, $ISSUES_NOW]"
        fi

        NEW_STATUS="in_progress"
        STOP_REASON=""

        if [ "$ISSUES_NOW" -eq 0 ] 2>/dev/null; then
            NEW_STATUS="clean"
            STOP_REASON="clean"
        elif [ "$NEW_ITER" -ge "$MAX_ITER" ] 2>/dev/null; then
            NEW_STATUS="max_iterations"
            STOP_REASON="max_iterations"
        else
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

        cat > "$STATE_FILE" << EOF
{
  "iteration": $NEW_ITER,
  "max_iterations": $MAX_ITER,
  "issues_found": $ISSUES_NOW,
  "issues_history": $NEW_HISTORY,
  "status": "$NEW_STATUS"
}
EOF

        SHOULD_STOP="false"
        [ "$NEW_STATUS" != "in_progress" ] && SHOULD_STOP="true"

        cat << EOF
{
  "iteration": $NEW_ITER,
  "issues_found": $ISSUES_NOW,
  "issues_history": $NEW_HISTORY,
  "should_stop": $SHOULD_STOP,
  "stop_reason": "$STOP_REASON",
  "status": "$NEW_STATUS"
}
EOF
        ;;

    *)
        echo '{"error": "Unknown command. Use: init, status, next, or render"}'
        exit 1
        ;;
esac
