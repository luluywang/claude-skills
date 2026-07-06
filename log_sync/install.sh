#!/usr/bin/env bash
#
# Log sync installer for Claude Code.
# Copies skill files to ~/.claude/skills/log_sync/ and wires the jq-free
# session logger to BOTH the Stop hook (fires every turn -> continuous, so
# killed sessions are still captured) and the SessionEnd hook.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

CLAUDE_ROOT="$HOME/.claude"
SKILL_DIR="$CLAUDE_ROOT/skills/log_sync"
HOOKS_DIR="$CLAUDE_ROOT/hooks"
SETTINGS_PATH="$CLAUDE_ROOT/settings.json"

HOOK_LINK="$HOOKS_DIR/log-sync-session-log.sh"
HOOK_COMMAND="~/.claude/hooks/log-sync-session-log.sh"

# Old hook links/commands to retire on upgrade.
OLD_HOOK_LINKS=("$HOOKS_DIR/export-session.sh" "$HOOKS_DIR/log-sync-session-end.sh")
OLD_HOOK_COMMANDS=("~/.claude/hooks/export-session.sh" "~/.claude/hooks/log-sync-session-end.sh")

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

safe_copy "$SCRIPT_DIR/SKILL.md"                   "$SKILL_DIR/SKILL.md"
safe_copy "$SCRIPT_DIR/install.sh"                 "$SKILL_DIR/install.sh"
safe_copy "$SCRIPT_DIR/hooks/session_log.sh"       "$SKILL_DIR/hooks/session_log.sh"
safe_copy "$SCRIPT_DIR/hooks/session_end.sh"       "$SKILL_DIR/hooks/session_end.sh"  # deprecated shim
safe_copy "$SCRIPT_DIR/scripts/detect_machine.sh"  "$SKILL_DIR/scripts/detect_machine.sh"
safe_copy "$SCRIPT_DIR/scripts/sync.sh"            "$SKILL_DIR/scripts/sync.sh"

chmod +x "$SKILL_DIR/install.sh" "$SKILL_DIR/hooks/session_log.sh" \
         "$SKILL_DIR/hooks/session_end.sh" "$SKILL_DIR/scripts/detect_machine.sh" \
         "$SKILL_DIR/scripts/sync.sh"

echo "  Installed skill files to $SKILL_DIR"

# ── Symlink the logger hook ──────────────────────────────────────────────────

mkdir -p "$HOOKS_DIR"
ln -sf "$SKILL_DIR/hooks/session_log.sh" "$HOOK_LINK"
chmod +x "$HOOK_LINK"
echo "  Linked hook at $HOOK_LINK"

# ── Clean up retired symlinks ────────────────────────────────────────────────

for old in "${OLD_HOOK_LINKS[@]}"; do
  if [ -L "$old" ]; then
    rm "$old"
    echo "  Removed old symlink $old"
  fi
done

# ── Ensure Stop + SessionEnd hooks in settings.json ──────────────────────────

ensure_hooks() {
  local settings_path="$1"
  local hook_command="$2"
  shift 2
  local old_commands=("$@")

  if ! command -v python3 >/dev/null 2>&1; then
    echo "  python3 not found; add Stop + SessionEnd hooks manually -> $hook_command" >&2
    return 0
  fi

  OLD_COMMANDS_CSV="$(IFS=,; echo "${old_commands[*]}")" \
  python3 - "$settings_path" "$hook_command" <<'PY'
import json, os, sys

settings_path = sys.argv[1]
hook_command = sys.argv[2]
old_commands = [c for c in os.environ.get("OLD_COMMANDS_CSV", "").split(",") if c]

if os.path.exists(settings_path):
    try:
        with open(settings_path, encoding="utf-8") as f:
            data = json.load(f)
    except json.JSONDecodeError:
        print(f"  settings is not valid JSON ({settings_path}); add hooks manually.", file=sys.stderr)
        sys.exit(0)
else:
    data = {}

if not isinstance(data, dict):
    print(f"  settings root is not an object ({settings_path}); add hooks manually.", file=sys.stderr)
    sys.exit(0)

container = data["hooks"] if isinstance(data.get("hooks"), dict) else data

for event in ("Stop", "SessionEnd"):
    entries = container.get(event)
    if not isinstance(entries, list):
        entries = []
        container[event] = entries

    exists = False
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        for hook in entry.get("hooks", []) if isinstance(entry.get("hooks"), list) else []:
            if not isinstance(hook, dict):
                continue
            cmd = hook.get("command", "")
            if cmd == hook_command:
                exists = True
            elif cmd in old_commands:      # migrate stale command in place
                hook["command"] = hook_command
                exists = True
                print(f"  Migrated {event} hook command in settings")
        if exists:
            break

    if not exists:
        entries.append({"hooks": [{"type": "command", "command": hook_command, "timeout": 30}]})
        print(f"  Added {event} hook to settings")
    else:
        print(f"  {event} hook already configured")

os.makedirs(os.path.dirname(settings_path), exist_ok=True)
with open(settings_path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
PY
}

ensure_hooks "$SETTINGS_PATH" "$HOOK_COMMAND" "${OLD_HOOK_COMMANDS[@]}"

echo ""
echo "Done."
echo ""
echo "Transcripts are logged continuously (Stop hook) and on exit (SessionEnd),"
echo "so sessions that are killed rather than ended cleanly are still captured."
echo "Use /log_sync for manual bulk sync of raw logs."
