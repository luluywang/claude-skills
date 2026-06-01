#!/usr/bin/env bash
# qa_loop.sh — Actor-critic QA loop manager for Beamer slides
# Tracks iteration state, renders PDF to slide images, detects stopping conditions.

set -euo pipefail

WORK_DIR="${BEAMER_WORK_DIR:-./beamer_work}"
STATE_FILE="$WORK_DIR/qa_state.json"
IMAGES_DIR="$WORK_DIR/slide_images"
STAGNATION_THRESHOLD=2  # stop if same issue count for this many consecutive iterations

# ── Helpers ───────────────────────────────────────────────────────
json_get() { python3 -c "import json,sys; d=json.load(open('$STATE_FILE')); print(d['$1'])"; }

json_set() {
  python3 -c "
import json
with open('$STATE_FILE') as f: d = json.load(f)
d['$1'] = $2
with open('$STATE_FILE','w') as f: json.dump(d, f, indent=2)
"
}

emit_status() {
  local iter max_iter issues status should_stop stop_reason
  iter=$(json_get iteration)
  max_iter=$(json_get max_iterations)
  issues=$(json_get issues_found)
  status=$(json_get status)
  should_stop=${1:-false}
  stop_reason=${2:-none}
  cat <<EOF
{"iteration":$iter,"max_iterations":$max_iter,"issues_found":$issues,"status":"$status","should_stop":$should_stop,"stop_reason":"$stop_reason"}
EOF
}

# ── Commands ──────────────────────────────────────────────────────
cmd_init() {
  local max_iter=${1:-5}
  mkdir -p "$WORK_DIR" "$IMAGES_DIR"
  cat > "$STATE_FILE" <<EOF
{
  "iteration": 0,
  "max_iterations": $max_iter,
  "issues_found": 0,
  "issues_history": [],
  "status": "in_progress"
}
EOF
  emit_status false none
}

cmd_status() {
  emit_status false none
}

cmd_render() {
  local pdf_path="$1"
  local iter
  iter=$(json_get iteration)
  local iter_dir="$IMAGES_DIR/iter_$iter"
  mkdir -p "$iter_dir"

  # Convert PDF pages to individual JPG images using poppler
  pdftoppm -jpeg -r 150 "$pdf_path" "$iter_dir/slide"

  # List generated images
  echo "Rendered slides to $iter_dir:"
  ls "$iter_dir"/slide-*.jpg 2>/dev/null | sort -V
}

cmd_next() {
  local issues_found=$1
  json_set issues_found "$issues_found"

  # Append to history
  python3 -c "
import json
with open('$STATE_FILE') as f: d = json.load(f)
d['issues_history'].append($issues_found)
d['iteration'] += 1
with open('$STATE_FILE','w') as f: json.dump(d, f, indent=2)
"

  local iter max_iter
  iter=$(json_get iteration)
  max_iter=$(json_get max_iterations)

  # Check stopping conditions
  if [ "$issues_found" -eq 0 ]; then
    json_set status '"clean"'
    emit_status true "clean"
    return
  fi

  if [ "$iter" -ge "$max_iter" ]; then
    json_set status '"max_iterations"'
    emit_status true "max_iterations"
    return
  fi

  # Check stagnation
  local stagnant
  stagnant=$(python3 -c "
import json
with open('$STATE_FILE') as f: d = json.load(f)
h = d['issues_history']
if len(h) >= $STAGNATION_THRESHOLD:
    recent = h[-$STAGNATION_THRESHOLD:]
    if len(set(recent)) == 1:
        print('true')
    else:
        print('false')
else:
    print('false')
")

  if [ "$stagnant" = "true" ]; then
    json_set status '"stagnation"'
    emit_status true "stagnation"
    return
  fi

  emit_status false none
}

# ── Main ──────────────────────────────────────────────────────────
case "${1:-help}" in
  init)   cmd_init "${2:-5}" ;;
  status) cmd_status ;;
  render) cmd_render "$2" ;;
  next)   cmd_next "$2" ;;
  *)
    echo "Usage: qa_loop.sh {init [max_iter]|status|render <pdf>|next <issues>}"
    exit 1
    ;;
esac
