#!/usr/bin/env bash
set -euo pipefail
PLANS_DIR="${CLAUDE_PLANS_DIR:-$HOME/.claude/plans}"
ls -t "$PLANS_DIR"/*.md 2>/dev/null | head -1
