#!/usr/bin/env bash
# /log_sync entry point: collect, pull, archive. Pass --dry-run to preview.
exec python3 "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/logsync.py" run "$@"
