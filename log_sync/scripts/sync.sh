#!/usr/bin/env bash
# sync.sh
# Rsyncs Claude Code session logs to ~/Dropbox/claude-logs/claude/ and
# appends a timestamped entry to ~/Dropbox/claude-logs/sync.log.
#
# Usage:
#   bash sync.sh             # Perform sync
#   bash sync.sh --dry-run   # Preview only (no files transferred, no log written)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Parse args ────────────────────────────────────────────────────────────────
DRY_RUN=0
for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=1 ;;
        *) echo "[log_sync] Unknown argument: $arg" >&2; exit 1 ;;
    esac
done

# ── Detect machine (sets LOG_SOURCE_DIR, MACHINE_TYPE, MACHINE_NAME) ─────────
# Allow caller to override LOG_SOURCE_DIR via environment.
if [ -z "${LOG_SOURCE_DIR:-}" ]; then
    # shellcheck source=detect_machine.sh
    source "${SCRIPT_DIR}/detect_machine.sh"
fi

DEST_DIR="${HOME}/Dropbox/claude-logs/claude/"
SYNC_LOG="${HOME}/Dropbox/claude-logs/sync.log"

# ── Validate source ───────────────────────────────────────────────────────────
if [ ! -d "$LOG_SOURCE_DIR" ]; then
    echo "[log_sync] Warning: source directory does not exist: $LOG_SOURCE_DIR"
    echo "[log_sync] Nothing to sync."
    exit 0
fi

# ── Ensure destination exists (unless dry-run) ────────────────────────────────
if [ "$DRY_RUN" -eq 0 ]; then
    mkdir -p "$DEST_DIR"
    mkdir -p "$(dirname "$SYNC_LOG")"
fi

# ── Build rsync flags ─────────────────────────────────────────────────────────
RSYNC_FLAGS=(--archive --compress --update --human-readable)
if [ "$DRY_RUN" -eq 1 ]; then
    RSYNC_FLAGS+=(--dry-run --verbose)
fi

# ── Run rsync ─────────────────────────────────────────────────────────────────
echo "[log_sync] Machine:  ${MACHINE_NAME} (${MACHINE_TYPE})"
echo "[log_sync] Source:   ${LOG_SOURCE_DIR}"
echo "[log_sync] Dest:     ${DEST_DIR}"
if [ "$DRY_RUN" -eq 1 ]; then
    echo "[log_sync] Mode:     dry-run (no files will be transferred)"
fi

# Capture rsync output to count transferred files
RSYNC_OUTPUT="$(rsync "${RSYNC_FLAGS[@]}" "${LOG_SOURCE_DIR}" "${DEST_DIR}" 2>&1)" || {
    echo "[log_sync] rsync failed:" >&2
    echo "$RSYNC_OUTPUT" >&2
    exit 1
}

# Count lines that represent transferred files (non-empty, non-summary lines)
# rsync --human-readable prints one filename per line for transferred files.
FILE_COUNT="$(echo "$RSYNC_OUTPUT" | grep -c '^[^[:space:]]' || true)"

if [ "$DRY_RUN" -eq 1 ]; then
    echo "[log_sync] Would transfer: ${FILE_COUNT} file(s)"
    if [ -n "$RSYNC_OUTPUT" ]; then
        echo ""
        echo "$RSYNC_OUTPUT"
    fi
else
    echo "[log_sync] Synced:   ${FILE_COUNT} file(s)"

    # ── Append to sync.log ────────────────────────────────────────────────────
    TIMESTAMP="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    LOG_LINE="${TIMESTAMP}  machine=${MACHINE_NAME}(${MACHINE_TYPE})  source=${LOG_SOURCE_DIR}  dest=${DEST_DIR}  files=${FILE_COUNT}"
    echo "$LOG_LINE" >> "$SYNC_LOG"
    echo "[log_sync] Log:      ${SYNC_LOG}"
fi
