#!/bin/bash
# batch_process.sh - Process multiple PDFs in a folder
# Usage: ./batch_process.sh [--keep-cache] [folder_path]
# If no folder specified, defaults to ./input/

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Show help
show_help() {
    echo "Usage: $0 [OPTIONS] [folder_path]"
    echo ""
    echo "Options:"
    echo "  --keep-cache    Preserve existing cache for each paper (for debugging)"
    echo "  --help, -h      Show this help message"
    echo ""
    echo "If no folder specified, defaults to ./input/"
    echo "By default, cache is cleared before processing each paper."
}

# Parse arguments
EXTRA_FLAGS=""
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        --keep-cache)
            EXTRA_FLAGS="--keep-cache"
            shift
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

# Configuration - SKILL_DIR is the parsepdf skill root (parent of scripts/)
INPUT_DIR="${POSITIONAL_ARGS[0]:-input}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILL_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

# Validate input directory
if [ ! -d "$INPUT_DIR" ]; then
    echo -e "${RED}Error: Directory not found: $INPUT_DIR${NC}"
    exit 1
fi

# Find all PDFs
shopt -s nullglob
PDF_FILES=("$INPUT_DIR"/*.pdf)
shopt -u nullglob

TOTAL=${#PDF_FILES[@]}

if [ $TOTAL -eq 0 ]; then
    echo -e "${YELLOW}No PDF files found in $INPUT_DIR${NC}"
    echo "Place your PDF files in the input/ folder and run again."
    exit 0
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Batch PDF Processing${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "Found ${GREEN}$TOTAL${NC} PDF file(s) in $INPUT_DIR"
if [ -n "$EXTRA_FLAGS" ]; then
    echo -e "Mode: ${YELLOW}--keep-cache${NC} (preserving intermediate files)"
else
    echo -e "Mode: ${GREEN}default${NC} (clearing cache for each paper)"
fi
echo ""

# Process each PDF
COUNT=0
FAILED=0
SUCCEEDED=0

for pdf in "${PDF_FILES[@]}"; do
    COUNT=$((COUNT + 1))
    BASENAME=$(basename "$pdf")

    echo -e "${BLUE}----------------------------------------${NC}"
    echo -e "${YELLOW}[$COUNT/$TOTAL]${NC} Processing: $BASENAME"
    echo -e "${BLUE}----------------------------------------${NC}"

    if "$SCRIPT_DIR/process_paper.sh" $EXTRA_FLAGS "$pdf"; then
        SUCCEEDED=$((SUCCEEDED + 1))
        echo -e "${GREEN}Completed: $BASENAME${NC}"
    else
        FAILED=$((FAILED + 1))
        echo -e "${RED}Failed: $BASENAME${NC}"
    fi
    echo ""
done

# Summary
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Batch Processing Complete${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "Total:     $TOTAL"
echo -e "Succeeded: ${GREEN}$SUCCEEDED${NC}"
if [ $FAILED -gt 0 ]; then
    echo -e "Failed:    ${RED}$FAILED${NC}"
fi
echo ""
echo "Next steps:"
echo "1. Review cache/<paper_name>/segment_task.md for each paper"
echo "2. Use Claude with prompts/ templates to process content"
echo "3. Assemble final markdown in output/"
echo ""
