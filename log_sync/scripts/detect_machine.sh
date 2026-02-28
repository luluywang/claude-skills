#!/usr/bin/env bash
# detect_machine.sh
# Detects machine type (local Mac vs HPC cluster) and sets LOG_SOURCE_DIR.
# Source this file; do not execute directly.
#
# Usage:
#   source detect_machine.sh
#   echo "$LOG_SOURCE_DIR"   # path to Claude Code logs on this machine
#   echo "$MACHINE_TYPE"     # "local" or "hpc"
#   echo "$MACHINE_NAME"     # hostname (short form)

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
