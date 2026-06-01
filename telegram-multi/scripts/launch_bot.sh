#!/usr/bin/env bash
# launch_bot.sh — launch a named telegram bot in a detached tmux session.
#
# Usage: launch_bot.sh <name> <tmux_session> <working_dir>
#
# Spawns: cd <working_dir>, exports TELEGRAM_STATE_DIR + PATH, and runs
# `claude --channels plugin:telegram@claude-plugins-official` in a detached
# tmux session. After Claude exits the shell pauses on read so the user
# can attach and inspect the tail.

set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <name> <tmux_session> <working_dir>" >&2
  exit 2
fi

name="$1"
tmux_session="$2"
working_dir="$3"

if ! command -v tmux >/dev/null 2>&1; then
  echo "Error: tmux not found in PATH." >&2
  exit 1
fi

state_dir="$HOME/.claude/channels/telegram-$name"
if [[ ! -d "$state_dir" ]]; then
  echo "Error: state dir $state_dir does not exist. Run create_bot.sh first." >&2
  exit 1
fi

if tmux has-session -t "$tmux_session" 2>/dev/null; then
  echo "Error: tmux session '$tmux_session' already exists. Kill it or pick a new name." >&2
  exit 1
fi

tmux new-session -d -s "$tmux_session" \
  "cd $working_dir; \
   export TELEGRAM_STATE_DIR=$state_dir; \
   export PATH=\"\$HOME/.bun/bin:\$HOME/.local/bin:\$PATH\"; \
   claude --channels plugin:telegram@claude-plugins-official; \
   echo 'Claude exited. Press Enter.'; read"

echo "Launched bot '$name' in tmux session '$tmux_session'."
echo "Attach: tmux attach -t $tmux_session"
