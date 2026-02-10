#!/usr/bin/env bash
# Install skills to ~/.claude/skills/
# Usage: ./install.sh           (all skills)
#        ./install.sh econ_ra   (single skill)

set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="$HOME/.claude/skills"

# Skills = directories containing SKILL.md
if [[ $# -gt 0 ]]; then
    SKILLS=("$@")
else
    SKILLS=()
    for d in "$SRC_DIR"/*/; do
        [[ -f "$d/SKILL.md" ]] && SKILLS+=("$(basename "$d")")
    done
fi

if [[ ${#SKILLS[@]} -eq 0 ]]; then
    echo "No skills found."
    exit 1
fi

for skill in "${SKILLS[@]}"; do
    if [[ ! -f "$SRC_DIR/$skill/SKILL.md" ]]; then
        echo "SKIP  $skill (no SKILL.md)"
        continue
    fi
    mkdir -p "$DEST_DIR/$skill"
    rsync -a --delete \
        --exclude='current/' \
        --exclude='history/' \
        --exclude='.DS_Store' \
        "$SRC_DIR/$skill/" "$DEST_DIR/$skill/"
    echo "OK    $skill"
done

echo "Installed ${#SKILLS[@]} skill(s) to $DEST_DIR"
