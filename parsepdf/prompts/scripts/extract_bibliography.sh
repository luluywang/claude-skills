#!/bin/bash
# extract_bibliography.sh - Extract and parse bibliography from PDF
# Uses structure.json to identify reference pages, then parses entries

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHE_DIR="$SCRIPT_DIR/cache"
OUTPUT_DIR="$SCRIPT_DIR/output"

usage() {
    echo "Usage: $0 [OPTIONS] <paper_name>"
    echo ""
    echo "Options:"
    echo "  -o, --output FILE    Output file (default: output/<paper_name>_bibliography.json)"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Expects structure.json in cache/<paper_name>/"
    echo ""
    echo "Examples:"
    echo "  $0 my_paper"
}

OUTPUT=""
PAPER=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -o|--output)
            OUTPUT="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            PAPER="$1"
            shift
            ;;
    esac
done

if [ -z "$PAPER" ]; then
    echo "Error: No paper name specified"
    usage
    exit 1
fi

PAPER_CACHE="$CACHE_DIR/$PAPER"
STRUCTURE_FILE="$PAPER_CACHE/structure.json"

if [ ! -f "$STRUCTURE_FILE" ]; then
    echo "Error: structure.json not found at $STRUCTURE_FILE"
    echo "Run process_paper.sh first to create structure"
    exit 1
fi

[ -z "$OUTPUT" ] && OUTPUT="$OUTPUT_DIR/${PAPER}_bibliography.json"

echo "Extracting bibliography for: $PAPER"

# Find reference section from structure.json
REF_START=$(jq -r '.sections[] | select(.type == "references" or .title | test("reference|bibliography"; "i")) | .start_page' "$STRUCTURE_FILE" 2>/dev/null | head -1)
REF_END=$(jq -r '.sections[] | select(.type == "references" or .title | test("reference|bibliography"; "i")) | .end_page' "$STRUCTURE_FILE" 2>/dev/null | head -1)

if [ -z "$REF_START" ] || [ "$REF_START" == "null" ]; then
    echo "Warning: Reference section not found in structure.json"
    echo "Attempting to find references in text files..."

    # Fall back to searching for "References" heading
    REF_FILE=$(grep -l -i "^References$\|^Bibliography$" "$PAPER_CACHE"/page_*.txt 2>/dev/null | head -1)

    if [ -z "$REF_FILE" ]; then
        echo "Error: Could not locate reference section"
        exit 1
    fi

    REF_START=$(basename "$REF_FILE" | sed 's/page_//; s/\.txt//')
fi

echo "Reference section starts at page: $REF_START"

# Collect reference pages
REF_TEXT=""
for page in $(seq "$REF_START" "${REF_END:-999}"); do
    PAGE_FILE="$PAPER_CACHE/page_$(printf "%03d" $page).txt"
    [ -f "$PAGE_FILE" ] || break
    REF_TEXT="$REF_TEXT$(cat "$PAGE_FILE")\n"
done

if [ -z "$REF_TEXT" ]; then
    echo "Error: No reference text extracted"
    exit 1
fi

# Parse bibliography entries
# Look for patterns like:
# Author, A. (Year). Title. Journal.
# Author, A., and B. Author. Year. Title.

echo "{"
echo '  "paper": "'$PAPER'",'
echo '  "extracted_from_pages": "'$REF_START'-'${REF_END:-"end"}'",'
echo '  "timestamp": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",'
echo '  "entries": ['

# Simple parsing - each line starting with capital letter could be an entry
echo -e "$REF_TEXT" | grep -E '^[A-Z][a-z]+,' | head -100 | while read -r line; do
    # Try to extract author, year, title
    if [[ $line =~ ^([A-Za-z,.\s]+)\(([0-9]{4})\)\.(.+)$ ]] || \
       [[ $line =~ ^([A-Za-z,.\s]+)([0-9]{4})\.(.+)$ ]]; then
        author="${BASH_REMATCH[1]}"
        year="${BASH_REMATCH[2]}"
        rest="${BASH_REMATCH[3]}"

        # Clean up
        author=$(echo "$author" | sed 's/[,.]$//' | xargs)
        title=$(echo "$rest" | cut -d'.' -f1 | xargs)

        echo "    {"
        echo "      \"raw\": \"$(echo "$line" | sed 's/"/\\"/g')\","
        echo "      \"author\": \"$author\","
        echo "      \"year\": \"$year\","
        echo "      \"title\": \"$title\""
        echo "    },"
    fi
done

echo '  ]'
echo '}'

echo ""
echo "Bibliography extracted to: $OUTPUT"
