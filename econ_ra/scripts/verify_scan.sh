#!/bin/bash
# verify_scan.sh - Extract verification targets from a project
# Usage:
#   ./verify_scan.sh [project_root]
#
# Scans for .tex files, scalar files, code output writers, and output directories.
# Returns JSON with categorized file lists for the verification subagent.

set -e

PROJECT_ROOT="${1:-.}"

# Resolve to absolute path
PROJECT_ROOT="$(cd "$PROJECT_ROOT" && pwd)"

# Find .tex files (excluding build artifacts)
TEX_FILES=$(find "$PROJECT_ROOT" -name "*.tex" \
    -not -path "*/build/*" \
    -not -path "*/.git/*" \
    -not -path "*/node_modules/*" \
    -not -path "*/__pycache__/*" \
    -not -path "*/econ_ra_work/*" \
    -not -path "*/.claude/*" \
    2>/dev/null | sort)

# Find potential scalar/snippet files (small .tex files that are \input'd)
# These are typically <1KB and contain just a number or a \newcommand
SCALAR_FILES=""
if [ -n "$TEX_FILES" ]; then
    for f in $TEX_FILES; do
        SIZE=$(wc -c < "$f" 2>/dev/null || echo "0")
        if [ "$SIZE" -lt 1024 ]; then
            SCALAR_FILES="$SCALAR_FILES$f
"
        fi
    done
fi

# Find \input{} references in .tex files to identify scalar dependencies
INPUT_REFS=""
if [ -n "$TEX_FILES" ]; then
    INPUT_REFS=$(grep -rh '\\input{' $TEX_FILES 2>/dev/null | \
        sed 's/.*\\input{//' | sed 's/}.*//' | sort -u || true)
fi

# Find code files that write output (Julia, Python, R, Stata)
# Look for write patterns: open(..., "w"), writedlm, to_csv, esttab, etc.
OUTPUT_WRITERS=""
for ext in jl py R do; do
    FILES=$(find "$PROJECT_ROOT" -name "*.$ext" \
        -not -path "*/.git/*" \
        -not -path "*/econ_ra_work/*" \
        -not -path "*/.claude/*" \
        2>/dev/null || true)
    if [ -n "$FILES" ]; then
        # Search for write patterns
        WRITERS=$(grep -l \
            -e 'open.*"w"' \
            -e 'writedlm' \
            -e 'write(' \
            -e 'to_csv' \
            -e 'savefig' \
            -e 'esttab' \
            -e 'estout' \
            -e 'outreg' \
            -e 'texdoc' \
            -e 'file\.write' \
            -e 'writerows' \
            -e 'to_latex' \
            -e 'stargazer' \
            -e 'save.*\.dta' \
            -e 'saveRDS' \
            -e 'write\.csv' \
            -e 'CSV\.write' \
            $FILES 2>/dev/null || true)
        if [ -n "$WRITERS" ]; then
            OUTPUT_WRITERS="$OUTPUT_WRITERS$WRITERS
"
        fi
    fi
done

# Find output directories (common patterns)
OUTPUT_DIRS=""
for dir in output outputs results tables figures scalars generated tex_snippets; do
    FOUND=$(find "$PROJECT_ROOT" -type d -name "$dir" \
        -not -path "*/.git/*" \
        -not -path "*/econ_ra_work/*" \
        -not -path "*/.claude/*" \
        2>/dev/null || true)
    if [ -n "$FOUND" ]; then
        OUTPUT_DIRS="$OUTPUT_DIRS$FOUND
"
    fi
done

# Find referee response files
REFEREE_FILES=$(find "$PROJECT_ROOT" -type f \( \
    -name "response*.tex" -o \
    -name "reply*.tex" -o \
    -name "revision_notes*.tex" -o \
    -name "referee*.tex" -o \
    -name "rebuttal*.tex" \
    \) -not -path "*/.git/*" 2>/dev/null | sort || true)

# Build JSON output
# Helper: convert newline-separated list to JSON array
to_json_array() {
    local input="$1"
    if [ -z "$input" ]; then
        echo "[]"
        return
    fi
    echo "$input" | grep -v '^$' | \
        awk 'BEGIN{printf "["} NR>1{printf ","} {printf "\"%s\"", $0} END{printf "]"}'
}

TEX_JSON=$(to_json_array "$TEX_FILES")
SCALAR_JSON=$(to_json_array "$SCALAR_FILES")
INPUT_JSON=$(to_json_array "$INPUT_REFS")
WRITER_JSON=$(to_json_array "$OUTPUT_WRITERS")
OUTDIR_JSON=$(to_json_array "$OUTPUT_DIRS")
REFEREE_JSON=$(to_json_array "$REFEREE_FILES")

cat << EOF
{
  "project_root": "$PROJECT_ROOT",
  "tex_files": $TEX_JSON,
  "scalar_files": $SCALAR_JSON,
  "input_references": $INPUT_JSON,
  "output_writers": $WRITER_JSON,
  "output_directories": $OUTDIR_JSON,
  "referee_files": $REFEREE_JSON,
  "counts": {
    "tex": $([ -n "$TEX_FILES" ] && echo "$TEX_FILES" | grep -c . || echo 0),
    "scalars": $([ -n "$SCALAR_FILES" ] && echo "$SCALAR_FILES" | grep -c . || echo 0),
    "writers": $([ -n "$OUTPUT_WRITERS" ] && echo "$OUTPUT_WRITERS" | grep -c . || echo 0),
    "output_dirs": $([ -n "$OUTPUT_DIRS" ] && echo "$OUTPUT_DIRS" | grep -c . || echo 0),
    "referee": $([ -n "$REFEREE_FILES" ] && echo "$REFEREE_FILES" | grep -c . || echo 0)
  }
}
EOF
