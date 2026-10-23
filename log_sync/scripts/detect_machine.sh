#!/usr/bin/env bash
# Claude Code uses ~/.claude on both macOS and Linux.
MACHINE_NAME="$(hostname -s)"
MACHINE_TYPE="local"
LOG_SOURCE_DIR="${LOG_SOURCE_DIR:-$HOME/.claude}"
export MACHINE_NAME MACHINE_TYPE LOG_SOURCE_DIR
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "Source: $LOG_SOURCE_DIR"
  echo "Install: bash ~/.claude/skills/log_sync/install.sh"
fi
