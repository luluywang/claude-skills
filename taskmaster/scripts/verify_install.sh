#!/usr/bin/env bash
#
# Installation smoke test for Taskmaster.
# Checks that the hook script exists and is executable, that settings.json
# contains the Stop hook registration, and runs a mock stop invocation.
#
# Called automatically by install.sh after installation completes.
# Can also be run manually at any time to re-verify the setup.
#
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Delegate to the full verify.sh which implements all three checks:
#   (a) hook script exists and is executable
#   (b) settings.json has Stop hook registration
#   (c) mock stop invocation returns expected output
exec "$SKILL_DIR/verify.sh"
