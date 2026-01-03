#!/bin/bash
# verify_citations.sh - Automate citation verification using Claude
# Reads citations.json and verifies each via web search

set -e

usage() {
    echo "Usage: $0 [OPTIONS] <citations.json>"
    echo ""
    echo "Options:"
    echo "  -o, --output FILE    Output file (default: notes/citation_verification.md)"
    echo "  -h, --help           Show this help message"
    echo ""
    echo "Requires: jq, claude CLI"
}

OUTPUT="notes/citation_verification.md"
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
    echo "Error: No input file specified"
    usage
    exit 1
fi

if [ ! -f "$INPUT" ]; then
    echo "Error: File not found: $INPUT"
    exit 1
fi

# Check dependencies
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed"
    exit 1
fi

echo "# Citation Verification Report" > "$OUTPUT"
echo "" >> "$OUTPUT"
echo "**Generated:** $(date)" >> "$OUTPUT"
echo "**Source:** $INPUT" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "---" >> "$OUTPUT"
echo "" >> "$OUTPUT"

VERIFIED=0
PARTIAL=0
NOT_FOUND=0
TOTAL=0

# Process each citation
jq -r '.citations[] | "\(.raw)|\(.author)|\(.year)"' "$INPUT" 2>/dev/null | while IFS='|' read -r raw author year; do
    [ -z "$raw" ] && continue

    TOTAL=$((TOTAL + 1))
    echo "Verifying: $raw"

    # Build search query
    QUERY="$author $year economics paper"

    # Use gemini for verification (or claude if available)
    if command -v gemini &> /dev/null; then
        RESULT=$(gemini -p "Search for economics paper by $author published in $year. Return: VERIFIED if found with exact match, PARTIAL_MATCH if similar but different year/spelling, NOT_FOUND if no match. Include full citation if found." 2>/dev/null || echo "NOT_FOUND: Search failed")
    else
        RESULT="NOT_FOUND: No search tool available (install gemini CLI)"
    fi

    # Parse result
    if [[ "$RESULT" == *"VERIFIED"* ]]; then
        STATUS="✓ VERIFIED"
        VERIFIED=$((VERIFIED + 1))
    elif [[ "$RESULT" == *"PARTIAL"* ]]; then
        STATUS="? PARTIAL_MATCH"
        PARTIAL=$((PARTIAL + 1))
    else
        STATUS="✗ NOT_FOUND"
        NOT_FOUND=$((NOT_FOUND + 1))
    fi

    echo "### $STATUS: $raw" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "**Search:** $QUERY" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "**Result:** $RESULT" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"

    # Rate limiting
    sleep 1
done

# Add summary at top
TEMP=$(mktemp)
{
    echo "# Citation Verification Report"
    echo ""
    echo "**Generated:** $(date)"
    echo "**Source:** $INPUT"
    echo ""
    echo "## Summary"
    echo ""
    echo "| Status | Count |"
    echo "|--------|-------|"
    echo "| ✓ Verified | $VERIFIED |"
    echo "| ? Partial Match | $PARTIAL |"
    echo "| ✗ Not Found | $NOT_FOUND |"
    echo "| **Total** | **$TOTAL** |"
    echo ""
    echo "---"
    echo ""
    tail -n +8 "$OUTPUT"
} > "$TEMP"
mv "$TEMP" "$OUTPUT"

echo ""
echo "Verification complete: $OUTPUT"
echo "  Verified: $VERIFIED"
echo "  Partial:  $PARTIAL"
echo "  Not Found: $NOT_FOUND"
