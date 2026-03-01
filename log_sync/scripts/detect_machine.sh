#!/usr/bin/env bash
# detect_machine.sh
# Detects machine type (local Mac vs HPC cluster) and sets LOG_SOURCE_DIR.
#
# Usage (sourced — sets variables in caller's shell):
#   source detect_machine.sh
#   echo "$LOG_SOURCE_DIR"   # path to Claude Code logs on this machine
#   echo "$MACHINE_TYPE"     # "local" or "hpc"
#   echo "$MACHINE_NAME"     # hostname (short form)
#
# Usage (executed directly — prints machine summary and recommended install command):
#   bash detect_machine.sh

MACHINE_NAME="$(hostname -s 2>/dev/null || hostname)"

# HPC detection: match hostname patterns common to university/research clusters.
# Patterns: contains cluster|hpc|slurm, or ends in .edu/.cluster/.hpc
_is_hpc=0

# Pattern 1: hostname contains known HPC keywords
if echo "$MACHINE_NAME" | grep -qiE '(cluster|hpc|slurm|node[0-9]|login[0-9]|compute)'; then
    _is_hpc=1
fi

# Pattern 2: full hostname ends with a known HPC domain suffix
_full_hostname="$(hostname 2>/dev/null)"
if echo "$_full_hostname" | grep -qiE '\.(cluster|hpc|rc\.fas\.harvard\.edu|sherlock\.stanford\.edu|bridges|expanse|stampede|frontera)'; then
    _is_hpc=1
fi

# Pattern 3: SLURM environment variable present (strongest signal)
if [ -n "${SLURM_JOB_ID:-}" ] || [ -n "${SLURM_CLUSTER_NAME:-}" ]; then
    _is_hpc=1
fi

if [ "$_is_hpc" -eq 1 ]; then
    MACHINE_TYPE="hpc"
    # On HPC clusters, Claude Code (if installed) writes logs here
    LOG_SOURCE_DIR="${HOME}/.claude/logs/"
else
    MACHINE_TYPE="local"
    # On macOS, Claude Code stores session logs under Application Support
    LOG_SOURCE_DIR="${HOME}/Library/Application Support/Claude/logs/"
fi

export MACHINE_TYPE
export MACHINE_NAME
export LOG_SOURCE_DIR

# ── When executed directly (not sourced), print summary + install command ─────
# $0 == bash or the script path; use $BASH_SOURCE to detect sourcing.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "[detect_machine] Machine:  ${MACHINE_NAME} (${MACHINE_TYPE})"
    echo "[detect_machine] Log dir:  ${LOG_SOURCE_DIR}"
    echo ""
    if [ "$MACHINE_TYPE" = "hpc" ]; then
        echo "Detected: HPC cluster (no Dropbox). Recommended setup:"
        echo ""
        echo "  # 1. Copy skill files from your laptop (run on your laptop):"
        echo "  rsync -az ~/.claude/skills/log_sync/ ${MACHINE_NAME}:~/.claude/skills/log_sync/"
        echo ""
        echo "  # 2. Run installer on this cluster:"
        echo "  bash ~/.claude/skills/log_sync/install.sh"
        echo ""
        echo "  # 3. Pull logs back to laptop (run on your laptop):"
        echo "  /log_sync   # inside Claude Code, or:"
        echo "  bash ~/.claude/skills/log_sync/scripts/sync.sh"
        echo ""
        echo "  See docs/install_guide.md section 2 for full HPC instructions."
    else
        echo "Detected: local Mac. Recommended setup:"
        echo ""
        echo "  # Run the installer:"
        echo "  bash ~/.claude/skills/log_sync/install.sh"
        echo ""
        echo "  # (Optional) Configure HPC pull in ~/.claude/hooks/log_sync.conf:"
        echo "  #   HPC_HOST=username@cluster.university.edu"
        echo "  #   HPC_LOG_DIR=~/claude-logs"
        echo ""
        echo "  See docs/install_guide.md section 1 for full Mac instructions."
    fi
fi
