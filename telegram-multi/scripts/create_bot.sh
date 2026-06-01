#!/usr/bin/env bash
# create_bot.sh — provision a named telegram bot state directory.
#
# Usage: create_bot.sh <name> <token> [working_dir]
#
# Creates ~/.claude/channels/telegram-<name>/ with approved/, inbox/,
# .env (chmod 600), and a default access.json (only if not already present).
# Prints a summary line with masked token. Exits non-zero on failure.

set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <name> <token> [working_dir]" >&2
  exit 2
fi

name="$1"
token="$2"
working_dir="${3:-$PWD}"

# Validate name
if [[ "$name" == "default" ]]; then
  echo "Error: bot name 'default' is reserved (use the unnamed bot instead)." >&2
  exit 1
fi
if [[ ! "$name" =~ ^[a-z0-9][a-z0-9-]*$ ]]; then
  echo "Error: bot name '$name' must match [a-z0-9][a-z0-9-]* (lowercase, hyphens ok, can't start with hyphen)." >&2
  exit 1
fi

state_dir="$HOME/.claude/channels/telegram-$name"

# Create directory tree
mkdir -p "$state_dir/approved" "$state_dir/inbox"
chmod 700 "$state_dir"

# Write .env (chmod 600). Always rewrite — token may have rotated.
env_file="$state_dir/.env"
umask 077
printf 'TELEGRAM_BOT_TOKEN=%s\n' "$token" > "$env_file"
chmod 600 "$env_file"

# Write default access.json only if it doesn't exist (don't clobber server updates)
access_file="$state_dir/access.json"
if [[ ! -f "$access_file" ]]; then
  cat > "$access_file" <<'JSON'
{
  "dmPolicy": "pairing",
  "allowFrom": [],
  "groups": {},
  "pending": {}
}
JSON
fi

# Mask token: everything up to colon + one char + "..."
if [[ "$token" == *:* ]]; then
  prefix="${token%%:*}"
  after_colon="${token#*:}"
  first_char="${after_colon:0:1}"
  masked="${prefix}:${first_char}..."
else
  masked="${token:0:3}..."
fi

echo "Bot '$name' ready."
echo "  State dir:     $state_dir"
echo "  Token:         $masked"
echo "  Policy:        pairing (default)"
echo "  Working dir:   $working_dir"
