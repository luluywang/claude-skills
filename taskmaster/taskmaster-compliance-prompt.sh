#!/usr/bin/env bash
#
# Shared Taskmaster compliance prompt text.
# Verbose checklist lives in SKILL.md (loaded as system context).
#

build_taskmaster_compliance_prompt() {
  local done_signal="$1"

  cat <<EOF2
Follow the taskmaster completion checklist in SKILL.md. Done signal: ${done_signal}
EOF2
}
