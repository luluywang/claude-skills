#!/usr/bin/env bash
#
# Log sync installer for Claude Code.
# Copies skill files to ~/.claude/skills/log_sync/ and symlinks the
# SessionEnd hook. Modeled on taskmaster/install.sh.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

CLAUDE_ROOT="$HOME/.claude"
SKILL_DIR="$CLAUDE_ROOT/skills/log_sync"
HOOKS_DIR="$CLAUDE_ROOT/hooks"
SETTINGS_PATH="$CLAUDE_ROOT/settings.json"

HOOK_LINK="$HOOKS_DIR/log-sync-session-end.sh"
HOOK_COMMAND="~/.claude/hooks/log-sync-session-end.sh"

OLD_HOOK_LINK="$HOOKS_DIR/export-session.sh"

safe_copy() {
  local src="$1"
  local dst="$2"

  if [[ "$(cd "$(dirname "$src")" && pwd)/$(basename "$src")" == "$(cd "$(dirname "$dst")" && pwd)/$(basename "$dst")" ]]; then
    return 0
  fi
  cp "$src" "$dst"
}

# ── Copy skill files ─────────────────────────────────────────────────────────

echo "Installing log_sync..."

mkdir -p "$SKILL_DIR/hooks"
mkdir -p "$SKILL_DIR/scripts"

safe_copy "$SCRIPT_DIR/SKILL.md"                  "$SKILL_DIR/SKILL.md"
safe_copy "$SCRIPT_DIR/install.sh"                 "$SKILL_DIR/install.sh"
safe_copy "$SCRIPT_DIR/hooks/session_end.sh"       "$SKILL_DIR/hooks/session_end.sh"
safe_copy "$SCRIPT_DIR/scripts/detect_machine.sh"  "$SKILL_DIR/scripts/detect_machine.sh"
safe_copy "$SCRIPT_DIR/scripts/sync.sh"            "$SKILL_DIR/scripts/sync.sh"

chmod +x "$SKILL_DIR/install.sh"
chmod +x "$SKILL_DIR/hooks/session_end.sh"
chmod +x "$SKILL_DIR/scripts/detect_machine.sh"
chmod +x "$SKILL_DIR/scripts/sync.sh"

echo "  Installed skill files to $SKILL_DIR"

# ── Symlink SessionEnd hook ──────────────────────────────────────────────────

mkdir -p "$HOOKS_DIR"
ln -sf "$SKILL_DIR/hooks/session_end.sh" "$HOOK_LINK"
chmod +x "$HOOK_LINK"

echo "  Linked SessionEnd hook at $HOOK_LINK"

# ── Clean up old export-session.sh symlink ───────────────────────────────────

if [ -L "$OLD_HOOK_LINK" ]; then
  rm "$OLD_HOOK_LINK"
  echo "  Removed old symlink $OLD_HOOK_LINK"
fi

# ── Ensure SessionEnd hook in settings.json ──────────────────────────────────

ensure_session_end_hook() {
  local settings_path="$1"
  local hook_command="$2"

  if ! command -v python3 >/dev/null 2>&1; then
    echo "  python3 not found; add SessionEnd hook manually -> $hook_command" >&2
    return 0
  fi

  python3 - "$settings_path" "$hook_command" <<'PY'
import json
import os
import sys

settings_path = sys.argv[1]
hook_command = sys.argv[2]

if os.path.exists(settings_path):
    try:
        with open(settings_path, "r", encoding="utf-8") as f:
            data = json.load(f)
    except json.JSONDecodeError:
        print(f"  settings is not valid JSON ({settings_path}); add SessionEnd hook manually.", file=sys.stderr)
        sys.exit(0)
else:
    data = {}

if not isinstance(data, dict):
    print(f"  settings root is not an object ({settings_path}); add SessionEnd hook manually.", file=sys.stderr)
    sys.exit(0)

container = None
if isinstance(data.get("hooks"), dict):
    container = data["hooks"]
else:
    container = data

session_end_hooks = container.get("SessionEnd")
if not isinstance(session_end_hooks, list):
    session_end_hooks = []
    container["SessionEnd"] = session_end_hooks

# Check if hook already exists (with old or new command)
old_command = "~/.claude/hooks/export-session.sh"
exists = False
for entry in session_end_hooks:
    if not isinstance(entry, dict):
        continue
    hooks = entry.get("hooks")
    if not isinstance(hooks, list):
        continue
    for hook in hooks:
        if not isinstance(hook, dict):
            continue
        cmd = hook.get("command", "")
        if cmd == hook_command:
            exists = True
            break
        # Update old command to new one
        if cmd == old_command:
            hook["command"] = hook_command
            exists = True
            print("  Updated SessionEnd hook command in settings")
            break
    if exists:
        break

if not exists:
    session_end_hooks.append(
        {
            "hooks": [
                {
                    "type": "command",
                    "command": hook_command,
                    "timeout": 30,
                }
            ],
        }
    )

os.makedirs(os.path.dirname(settings_path), exist_ok=True)
with open(settings_path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)
    f.write("\n")

if exists:
    print("  SessionEnd hook already configured")
else:
    print("  Added SessionEnd hook to settings")
PY
}

ensure_session_end_hook "$SETTINGS_PATH" "$HOOK_COMMAND"

echo ""
echo "Done."
echo ""
echo "The SessionEnd hook will export transcripts to Dropbox automatically."
echo "Use /log_sync for manual bulk sync of raw logs."
