#!/usr/bin/env bash
# bootstrap.sh — Detect project type, settings files, and structure.
#
# Usage: bash bootstrap.sh [project_dir]
# Output: JSON with project metadata to stdout.
#
# Walks up from the given directory looking for Makefile + code/ + data/.
# Auto-detects project type by file extensions.

set -euo pipefail

PROJECT_DIR="${1:-$PWD}"

# Resolve to absolute path
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

# Walk up to find project root (needs code/ + data/ or code/ + Makefile)
find_project_root() {
    local dir="$1"
    while [ "$dir" != "/" ]; do
        if [ -d "$dir/code" ] && { [ -d "$dir/data" ] || [ -f "$dir/Makefile" ]; }; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    # Fallback: use the original directory
    echo "$1"
}

PROJECT_ROOT="$(find_project_root "$PROJECT_DIR")"

# Detect project type by file extensions
detect_type() {
    local root="$1"
    local has_ipynb=false has_jl=false has_R=false has_py=false has_do=false

    # Search in code/ if it exists, otherwise root
    local search_dir="$root"
    [ -d "$root/code" ] && search_dir="$root/code"

    [ -n "$(find "$search_dir" -maxdepth 3 -name '*.ipynb' -print -quit 2>/dev/null)" ] && has_ipynb=true
    [ -n "$(find "$search_dir" -maxdepth 3 -name '*.jl' -print -quit 2>/dev/null)" ] && has_jl=true
    [ -n "$(find "$search_dir" -maxdepth 3 -name '*.R' -print -quit 2>/dev/null)" ] && has_R=true
    [ -n "$(find "$search_dir" -maxdepth 3 -name '*.py' -print -quit 2>/dev/null)" ] && has_py=true
    [ -n "$(find "$search_dir" -maxdepth 3 -name '*.do' -print -quit 2>/dev/null)" ] && has_do=true

    local count=0
    local type="unknown"
    $has_ipynb && { type="notebook"; count=$((count+1)); }
    $has_jl && { type="julia"; count=$((count+1)); }
    $has_R && { type="R"; count=$((count+1)); }
    $has_py && { type="python"; count=$((count+1)); }
    $has_do && { type="stata"; count=$((count+1)); }

    [ "$count" -gt 1 ] && type="mixed"
    echo "$type"
}

# Find settings files
find_settings() {
    local root="$1"
    local settings=()

    for name in settings.R settings.jl config.py settings.py; do
        while IFS= read -r -d '' f; do
            settings+=("$(python3 -c "import os; print(os.path.relpath('$f', '$root'))")")
        done < <(find "$root" -maxdepth 4 -name "$name" -print0 2>/dev/null)
    done

    # Check Makefile for variable definitions
    if [ -f "$root/Makefile" ]; then
        settings+=("Makefile")
    fi
    if [ -f "$root/code/Makefile" ]; then
        settings+=("code/Makefile")
    fi

    # Output as JSON array
    printf '['
    local first=true
    if [ ${#settings[@]} -gt 0 ]; then
        for s in "${settings[@]}"; do
            $first || printf ','
            printf '"%s"' "$s"
            first=false
        done
    fi
    printf ']'
}

# Find server_copy directories
find_server_copies() {
    local root="$1"
    local copies=()
    while IFS= read -r -d '' d; do
        copies+=("$(python3 -c "import os; print(os.path.relpath('$d', '$root'))")")
    done < <(find "$root" -maxdepth 1 -type d -name 'server_copy*' -print0 2>/dev/null)

    printf '['
    local first=true
    if [ ${#copies[@]} -gt 0 ]; then
        for c in "${copies[@]}"; do
            $first || printf ','
            printf '"%s"' "$c"
            first=false
        done
    fi
    printf ']'
}

# Check DAG freshness
dag_status="missing"
dag_file="$PROJECT_ROOT/current/dag.json"
if [ -f "$dag_file" ]; then
    dag_age=$(( $(date +%s) - $(stat -f %m "$dag_file" 2>/dev/null || stat -c %Y "$dag_file" 2>/dev/null || echo 0) ))
    if [ "$dag_age" -lt 3600 ]; then
        dag_status="fresh"
    else
        dag_status="stale"
    fi
fi

PROJECT_TYPE="$(detect_type "$PROJECT_ROOT")"
SETTINGS="$(find_settings "$PROJECT_ROOT")"
SERVER_COPIES="$(find_server_copies "$PROJECT_ROOT")"

HAS_MAKEFILE=false
MAKEFILE_PATH=""
if [ -f "$PROJECT_ROOT/code/Makefile" ]; then
    HAS_MAKEFILE=true
    MAKEFILE_PATH="code/Makefile"
elif [ -f "$PROJECT_ROOT/Makefile" ]; then
    HAS_MAKEFILE=true
    MAKEFILE_PATH="Makefile"
fi

HAS_CODE_DIR=false
[ -d "$PROJECT_ROOT/code" ] && HAS_CODE_DIR=true
HAS_DATA_DIR=false
[ -d "$PROJECT_ROOT/data" ] && HAS_DATA_DIR=true

cat <<EOF
{
  "project_root": "$PROJECT_ROOT",
  "project_type": "$PROJECT_TYPE",
  "has_code_dir": $HAS_CODE_DIR,
  "has_data_dir": $HAS_DATA_DIR,
  "has_makefile": $HAS_MAKEFILE,
  "makefile_path": "$MAKEFILE_PATH",
  "settings_files": $SETTINGS,
  "server_copies": $SERVER_COPIES,
  "dag_status": "$dag_status"
}
EOF
