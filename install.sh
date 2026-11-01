#!/usr/bin/env bash
# Install skills and mods to ~/.claude/skills/ (and global/CLAUDE.md to ~/.claude/CLAUDE.md on a full run),
# then wire the hooks of skills that have them. Safe to re-run: this is the one update button.
# Usage: ./install.sh           (all skills)
#        ./install.sh econ_ra   (single skill)

set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="$HOME/.claude/skills"

# Skills whose own install.sh registers hooks in settings.json; each is re-run from its
# installed copy (file copies are then no-ops) and is idempotent. taskmaster is left out on
# purpose: its Stop hook forces sessions to continue and stays opt-in.
HOOK_SKILLS=(log_sync)

# Installable = a skill (has SKILL.md) or a mod/plugin (has .claude-plugin/plugin.json).
is_installable() { [[ -f "$1/SKILL.md" || -f "$1/.claude-plugin/plugin.json" ]]; }

if [[ $# -gt 0 ]]; then
    SKILLS=("$@")
else
    SKILLS=()
    for d in "$SRC_DIR"/*/; do
        is_installable "$d" && SKILLS+=("$(basename "$d")")
    done
fi

if [[ ${#SKILLS[@]} -eq 0 ]]; then
    echo "No skills found."
    exit 1
fi

for skill in "${SKILLS[@]}"; do
    if ! is_installable "$SRC_DIR/$skill"; then
        echo "SKIP  $skill (no SKILL.md or .claude-plugin/plugin.json)"
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

# Global CLAUDE.md (user-level instructions) lives in global/ and is installed
# only on a full run, so single-skill installs stay narrow.
if [[ $# -eq 0 && -f "$SRC_DIR/global/CLAUDE.md" ]]; then
    mkdir -p "$HOME/.claude"
    cp "$SRC_DIR/global/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
    echo "OK    global/CLAUDE.md -> ~/.claude/CLAUDE.md"
fi

for skill in "${HOOK_SKILLS[@]}"; do
    if [[ " ${SKILLS[*]} " == *" $skill "* && -f "$DEST_DIR/$skill/install.sh" ]]; then
        echo "HOOKS $skill"
        bash "$DEST_DIR/$skill/install.sh" | sed 's/^/      /'
    fi
done

echo "Installed ${#SKILLS[@]} skill(s) to $DEST_DIR"
