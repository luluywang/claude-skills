#!/usr/bin/env bash
# Claude Code hook for Stop, SessionEnd and SessionStart; logsync.py dispatches
# on the event name in the hook JSON (stdin). Resolves the installed copy even
# when invoked through the ~/.claude/hooks symlink.
exec python3 "$HOME/.claude/skills/log_sync/scripts/logsync.py" hook
