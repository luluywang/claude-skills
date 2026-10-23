#!/usr/bin/env bash
#
# Log sync installer for Claude Code.
# Copies skill files to ~/.claude/skills/log_sync/ and wires one hook script to
# Stop (every turn, so killed sessions are still captured), SessionEnd, and
# SessionStart (background collect + pull + archive). Per-machine settings live
# in ~/.claude/hooks/log_sync.conf (see references/setup.md).
#
set -euo pipefail
command -v python3 >/dev/null || { echo "python3 is required" >&2; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

CLAUDE_ROOT="$HOME/.claude"
SKILL_DIR="$CLAUDE_ROOT/skills/log_sync"
HOOKS_DIR="$CLAUDE_ROOT/hooks"
SETTINGS_PATH="$CLAUDE_ROOT/settings.json"

HOOK_LINK="$HOOKS_DIR/log-sync-session-log.sh"
HOOK_COMMAND="~/.claude/hooks/log-sync-session-log.sh"

# Old hook links/commands to retire on upgrade.
OLD_HOOK_LINKS=("$HOOKS_DIR/export-session.sh" "$HOOKS_DIR/log-sync-session-end.sh"
                "$HOOKS_DIR/log-sync-hpc-pull.sh")
OLD_HOOK_COMMANDS=("~/.claude/hooks/export-session.sh" "~/.claude/hooks/log-sync-session-end.sh"
                   "~/.claude/hooks/log-sync-hpc-pull.sh")

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

safe_copy "$SCRIPT_DIR/SKILL.md"   "$SKILL_DIR/SKILL.md"
safe_copy "$SCRIPT_DIR/install.sh" "$SKILL_DIR/install.sh"
for file in "$SCRIPT_DIR"/hooks/*.sh; do
  safe_copy "$file" "$SKILL_DIR/hooks/$(basename "$file")"
done
for file in "$SCRIPT_DIR"/scripts/*.py "$SCRIPT_DIR"/scripts/*.sh; do
  safe_copy "$file" "$SKILL_DIR/scripts/$(basename "$file")"
done
mkdir -p "$SKILL_DIR/references"
for file in "$SCRIPT_DIR"/references/*; do
  safe_copy "$file" "$SKILL_DIR/references/$(basename "$file")"
done
# Retired by logsync.py.
rm -f "$SKILL_DIR/scripts/sync_transcripts.py" "$SKILL_DIR/scripts/pull_hpc.sh" \
      "$SKILL_DIR/hooks/hpc_pull.sh"
chmod +x "$SKILL_DIR"/install.sh "$SKILL_DIR"/hooks/*.sh "$SKILL_DIR"/scripts/*.sh \
         "$SKILL_DIR"/scripts/*.py

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

# ── Ensure Stop + SessionEnd + SessionStart hooks in settings.json ──────────────────────────

ensure_hooks() {
  local settings_path="$1"
  local hook_command="$2"
  shift 2
  local old_commands=("$@")

  if ! command -v python3 >/dev/null 2>&1; then
    echo "  python3 not found; add Stop, SessionEnd and SessionStart hooks manually -> $hook_command" >&2
    return 0
  fi

  OLD_COMMANDS_CSV="$(IFS=,; echo "${old_commands[*]}")" \
  python3 - "$settings_path" "$hook_command" <<'PY'
import json, os, sys, shutil, tempfile

settings_path = sys.argv[1]
hook_command = sys.argv[2]
old_commands = [c for c in os.environ.get("OLD_COMMANDS_CSV", "").split(",") if c]

if os.path.exists(settings_path):
    try:
        with open(settings_path, encoding="utf-8") as f:
            data = json.load(f)
    except json.JSONDecodeError:
        print(f"  settings is not valid JSON ({settings_path}); add hooks manually.", file=sys.stderr)
        sys.exit(1)
else:
    data = {}

if not isinstance(data, dict):
    print(f"  settings root is not an object ({settings_path}); add hooks manually.", file=sys.stderr)
    sys.exit(1)

container = data.setdefault("hooks", {})
if not isinstance(container, dict):
    raise ValueError("settings.hooks must be an object")

for event in ("Stop", "SessionEnd", "SessionStart"):
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
if os.path.exists(settings_path):
    shutil.copy2(settings_path, settings_path + ".log-sync-backup")
fd, temp = tempfile.mkstemp(dir=os.path.dirname(settings_path))
with os.fdopen(fd, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
os.replace(temp, settings_path)
PY
}

ensure_hooks "$SETTINGS_PATH" "$HOOK_COMMAND" "${OLD_HOOK_COMMANDS[@]}"

echo ""
echo "Done."
echo ""
echo "Each turn (Stop) and exit (SessionEnd) backs up the current session; each"
echo "SessionStart runs collect + pull + archive in the background (at most every"
echo "RUN_INTERVAL_HOURS). /log_sync runs the same pipeline in the foreground."
