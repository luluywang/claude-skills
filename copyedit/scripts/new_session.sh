#!/usr/bin/env bash
# Usage: new_session.sh <paper_dir>
# Archives the previous copyedit run and leaves a clean notes/ directory.
#
# Layout: notes/review_digest.md is the single review surface; per-task outputs
# live in notes/raw/. Only copyedit's own outputs are archived. User-editable
# inputs (banned phrases, load-bearing terms) and any other files the author
# keeps in notes/ are left in place.

dir="${1:-.}"
notes="$dir/notes"
mkdir -p "$notes"

# Copyedit outputs: current layout plus legacy top-level task files.
outputs=(
    review_digest.md tasks.json .copyedit_status relevance_rap_seed.md
    copy_edits.md ai_detection.md simplifications.md word_choice_review.md
    sentence_analysis.md orality.md structure_analysis.md flow_extraction.md
    relevance_audit.md writing_quality.md methodology_review.md reflow_verify.md
)

found=()
for f in "${outputs[@]}"; do
    [ -e "$notes/$f" ] && found+=("$f")
done
[ -d "$notes/raw" ] && found+=("raw")

# Nothing to archive
if [ ${#found[@]} -eq 0 ]; then
    exit 0
fi

ts=$(date +%Y%m%d_%H%M%S)
archive="$notes/history/$ts"
mkdir -p "$archive"
for f in "${found[@]}"; do
    mv "$notes/$f" "$archive/"
done
echo "Archived previous run → notes/history/$ts/"
