#!/bin/bash
# process_paper.sh - Main orchestrator script for Claude Code
# Usage: ./process_paper.sh [--keep-cache] <path_to_pdf>

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Show help
show_help() {
    echo "Usage: $0 [OPTIONS] <path_to_pdf>"
    echo ""
    echo "Options:"
    echo "  --keep-cache    Preserve existing cache (for debugging)"
    echo "  --help, -h      Show this help message"
    echo ""
    echo "By default, cache is cleared before each run."
}

# Check for required tools with helpful install instructions
check_dependencies() {
    local missing=()

    command -v pdfinfo >/dev/null 2>&1 || missing+=("pdfinfo")
    command -v pdftotext >/dev/null 2>&1 || missing+=("pdftotext")
    command -v pdfseparate >/dev/null 2>&1 || missing+=("pdfseparate")

    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${RED}Error: Missing required tools: ${missing[*]}${NC}"
        echo ""
        echo "These tools are part of poppler-utils. Install with:"
        echo ""
        echo "  macOS:   brew install poppler"
        echo "  Ubuntu:  sudo apt-get install poppler-utils"
        echo "  Fedora:  sudo dnf install poppler-utils"
        echo ""
        exit 1
    fi
}

# Parse arguments
KEEP_CACHE=false

while [[ "$1" == --* ]]; do
    case "$1" in
        --keep-cache)
            KEEP_CACHE=true
            shift
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

# Configuration - SKILL_DIR is the parsepdf skill root (parent of scripts/)
PDF_FILE="$1"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILL_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

# Validate input
if [ -z "$PDF_FILE" ]; then
    echo -e "${RED}Error: Please provide a PDF file as argument${NC}"
    show_help
    exit 1
fi

if [ ! -f "$PDF_FILE" ]; then
    echo -e "${RED}Error: File not found: $PDF_FILE${NC}"
    exit 1
fi

# Check dependencies before proceeding
check_dependencies

BASE_NAME=$(basename "$PDF_FILE" .pdf)
PDF_DIR="$(cd "$(dirname "$PDF_FILE")" && pwd)"
CACHE_DIR="$SKILL_DIR/cache/$BASE_NAME"
OUTPUT_DIR="$SKILL_DIR/output"

# Clear cache by default
if [ "$KEEP_CACHE" = false ] && [ -d "$CACHE_DIR" ]; then
    echo -e "${YELLOW}Clearing previous cache for: $BASE_NAME${NC}"
    rm -rf "$CACHE_DIR"
fi

echo -e "${BLUE}Processing: $BASE_NAME${NC}"
echo "===================================="

# Step 1: Get total page count
echo -e "${BLUE}Getting PDF information...${NC}"
TOTAL_PAGES=$(pdfinfo "$PDF_FILE" | grep Pages | awk '{print $2}')
echo -e "${GREEN}   Found $TOTAL_PAGES pages${NC}"

# Step 2: Split PDF into individual pages
echo -e "${BLUE}Splitting PDF into individual pages...${NC}"
mkdir -p "$CACHE_DIR/pages"
pdfseparate "$PDF_FILE" "$CACHE_DIR/pages/page_%d.pdf"
echo -e "${GREEN}   PDF split into $TOTAL_PAGES page files${NC}"

# Step 3: Extract text from each page (preserving layout)
echo -e "${BLUE}Extracting text from pages...${NC}"
mkdir -p "$CACHE_DIR/text"
mkdir -p "$CACHE_DIR/layout"

PAGE_COUNT=0
for page in "$CACHE_DIR/pages"/page_*.pdf; do
    PAGE_NUM=$(basename "$page" .pdf | sed 's/page_//')

    # Regular text extraction
    pdftotext "$page" "$CACHE_DIR/text/page_$PAGE_NUM.txt" 2>/dev/null || true

    # Layout-preserved extraction (for tables)
    pdftotext -layout "$page" "$CACHE_DIR/layout/page_$PAGE_NUM.txt" 2>/dev/null || true

    PAGE_COUNT=$((PAGE_COUNT + 1))
    if [ $((PAGE_COUNT % 10)) -eq 0 ]; then
        echo -e "${YELLOW}   Processed $PAGE_COUNT/$TOTAL_PAGES pages${NC}"
    fi
done
echo -e "${GREEN}   Text extraction complete${NC}"

# Step 3b: Extract tables using pdfplumber (if available)
echo -e "${BLUE}Extracting tables with pdfplumber...${NC}"
mkdir -p "$CACHE_DIR/tables"

if command -v python3 >/dev/null 2>&1; then
    # Try running the script - it will auto-install pdfplumber if missing
    if python3 "$SCRIPT_DIR/extract_tables.py" \
        --input "$PDF_FILE" \
        --output-dir "$CACHE_DIR/tables" 2>/dev/null; then
        echo -e "${GREEN}   Table extraction complete${NC}"
    else
        echo -e "${YELLOW}   Table extraction failed or pdfplumber unavailable${NC}"
        echo -e "${YELLOW}   Falling back to layout-based extraction only${NC}"
    fi
else
    echo -e "${YELLOW}   Python3 not found. Skipping pdfplumber extraction${NC}"
fi

# Step 4: Create combined text file for structure analysis
echo -e "${BLUE}Preparing document for structure analysis...${NC}"
find "$CACHE_DIR/text" -name "page_*.txt" -print0 | sort -zV | xargs -0 cat | \
    sed -E '/^[0-9]{1,3}$/d' | \
    cat -s > "$CACHE_DIR/full_text.txt"
cp "$CACHE_DIR/full_text.txt" "$PDF_DIR/${BASE_NAME}_full_text.txt"
echo -e "${GREEN}   Text file saved to: $PDF_DIR/${BASE_NAME}_full_text.txt${NC}"

# Step 5: Create initial segmentation task
echo -e "${BLUE}Creating segmentation task file...${NC}"
SEGMENT_TASK="$CACHE_DIR/segment_task.md"
cat > "$SEGMENT_TASK" << 'TASK_EOF'
# Document Segmentation Task

Analyze the provided text (first ~10 pages of the paper) and identify the document structure.

## Text to Analyze:
```
TASK_EOF

# Append first ~10 pages of text
find "$CACHE_DIR/text" -name "page_*.txt" -print0 | sort -zV | xargs -0 cat | \
    sed -E '/^[0-9]{1,3}$/d' | \
    cat -s | \
    head -n 2000 >> "$SEGMENT_TASK" 2>/dev/null

cat >> "$SEGMENT_TASK" << 'TASK_EOF'
```

## Required Output:
Create a JSON structure with:
- title
- authors (list)
- abstract location and text (page numbers)
- sections with page ranges (with hierarchy level)
- references start page
- appendix start page (if exists)

Return ONLY valid JSON, no other text.
TASK_EOF

echo -e "${GREEN}   Segmentation task created at: $SEGMENT_TASK${NC}"

# Step 6: Create a configuration file for next steps
CONFIG_FILE="$CACHE_DIR/config.json"
cat > "$CONFIG_FILE" << JSON_EOF
{
  "pdf_file": "$PDF_FILE",
  "base_name": "$BASE_NAME",
  "total_pages": $TOTAL_PAGES,
  "cache_dir": "$CACHE_DIR",
  "output_dir": "$OUTPUT_DIR",
  "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
JSON_EOF

echo -e "${GREEN}   Configuration saved${NC}"

# Step 7: Summary
echo ""
echo -e "${BLUE}===================================${NC}"
echo -e "${GREEN}PDF preprocessing complete!${NC}"
echo -e "${BLUE}===================================${NC}"
echo ""
echo "Next steps:"
echo "1. Review: $SEGMENT_TASK"
echo "2. Run segmentation with Claude Code using prompts/segment.md"
echo "3. Use the structure output to process remaining components"
echo ""
echo "Text output: $PDF_DIR/${BASE_NAME}_full_text.txt"
echo "Cache directory: $CACHE_DIR/"
echo ""
