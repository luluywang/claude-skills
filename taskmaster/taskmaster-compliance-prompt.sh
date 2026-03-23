#!/usr/bin/env bash
#
# Shared Taskmaster compliance prompt text.
#

build_taskmaster_compliance_prompt() {
  local done_signal="$1"

  cat <<EOF2
Verify every request is done, fix any errors, then emit on its own line:
${done_signal}
EOF2
}
