#!/bin/bash
# DEPRECATED (2026-07-06). This jq-based SessionEnd hook was replaced by
# session_log.sh, which is jq-free and wired to BOTH Stop (continuous, every
# turn) and SessionEnd. See SKILL.md section 1.
#
# Two problems with the old approach lived here:
#   1. It fired only on graceful exit, so killed sessions (e.g. /remote-control
#      bridges) were never logged.
#   2. It parsed the hook input with jq, which is module-only on this HPC and
#      absent from the default PATH — so it silently logged nothing.
#
# Kept only as a shim: anything still pointing at this path keeps working and
# gets the new behavior. Forwards stdin (the hook JSON) unchanged.
exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/session_log.sh" "$@"
