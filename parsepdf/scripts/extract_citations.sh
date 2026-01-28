#!/bin/bash
# extract_citations.sh - Extract citations from .tex files
# Output: citations.json with structured citation data

set -e

usage() {
    echo "Usage: $0 [OPTIONS] <input_dir_or_file>"
    echo ""
    echo "Options:"
    echo "  -o, --output FILE    Output file (default: citations.json)"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 ./paper/           # Process all .tex files in directory"
    echo "  $0 ./paper/main.tex   # Process single file"
}

OUTPUT="citations.json"
INPUT=""

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
            INPUT="$1"
            shift
            ;;
    esac
done

if [ -z "$INPUT" ]; then
    echo "Error: No input specified"
    usage
    exit 1
fi

# Find all .tex files
if [ -d "$INPUT" ]; then
    FILES=$(find "$INPUT" -name "*.tex" -type f)
elif [ -f "$INPUT" ]; then
    FILES="$INPUT"
else
    echo "Error: Input not found: $INPUT"
    exit 1
fi

echo "Extracting citations from:"
echo "$FILES" | while read f; do echo "  - $f"; done

# Create temporary file for collected citations
TEMP_FILE=$(mktemp)

# Extract citations using multiple patterns
for FILE in $FILES; do
    echo "Processing: $FILE"

    # LaTeX citation commands: \cite{}, \citep{}, \citet{}, \citeauthor{}
    grep -oE '\\cite[pt]?\{[^}]+\}' "$FILE" 2>/dev/null | \
        sed 's/\\cite[pt]\?{//g; s/}//g' | \
        tr ',' '\n' | \
        sed 's/^[[:space:]]*//; s/[[:space:]]*$//' >> "$TEMP_FILE" || true

    # Parenthetical: (Smith 2020), (Smith and Jones 2019), (Smith et al. 2018)
    grep -oE '\([A-Z][a-zA-Z]+( (and|et al\.?) [A-Z][a-zA-Z]+)?,? (19|20)[0-9]{2}[a-z]?\)' "$FILE" 2>/dev/null | \
        sed 's/[()]//g' >> "$TEMP_FILE" || true

    # Narrative: Smith (2020), Smith and Jones (2019)
    grep -oE '[A-Z][a-zA-Z]+( (and|et al\.?) [A-Z][a-zA-Z]+)? \((19|20)[0-9]{2}[a-z]?\)' "$FILE" 2>/dev/null | \
        sed 's/[()]//g' >> "$TEMP_FILE" || true

done

# Deduplicate and count
echo "{"
echo '  "extracted_from": "'$INPUT'",'
echo '  "timestamp": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",'
echo '  "citations": ['

# Process unique citations
sort "$TEMP_FILE" | uniq -c | sort -rn | while read count citation; do
    # Skip empty lines
    [ -z "$citation" ] && continue

    # Try to parse author and year
    if [[ $citation =~ ^([A-Za-z]+).*([0-9]{4}) ]]; then
        author="${BASH_REMATCH[1]}"
        year="${BASH_REMATCH[2]}"
    else
        author="$citation"
        year="unknown"
    fi

    echo "    {"
    echo "      \"raw\": \"$citation\","
    echo "      \"author\": \"$author\","
    echo "      \"year\": \"$year\","
    echo "      \"count\": $count"
    echo "    },"
done

echo '  ]'
echo '}'

# Clean up
rm -f "$TEMP_FILE"

echo ""
echo "Citations extracted to: $OUTPUT"
echo "Total unique citations: $(sort "$TEMP_FILE" 2>/dev/null | uniq | wc -l | tr -d ' ')"
