#!/usr/bin/env bash
# Usage: new_session.sh <paper_dir>
# Archives existing notes/ output and creates a clean notes/ directory.

dir="${1:-.}"
notes="$dir/notes"

# Nothing to do if notes/ doesn't exist or has no output files
if [ ! -d "$notes" ] || ! ls "$notes"/*.md "$notes"/tasks.json "$notes"/.copyedit_status 2>/dev/null | grep -q .; then
    mkdir -p "$notes"
    exit 0
fi

# Archive
ts=$(date +%Y%m%d_%H%M%S)
archive="$notes/history/$ts"
mkdir -p "$archive"
mv "$notes"/*.md "$notes"/.copyedit_status "$notes"/tasks.json "$archive/" 2>/dev/null
echo "Archived previous run → notes/history/$ts/"
