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

# Configuration
PDF_FILE="$1"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
CACHE_DIR="$(pwd)/parsepdf/cache/$BASE_NAME"
OUTPUT_DIR="$(pwd)/parsepdf/output"

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

# Step 4b: Build the deterministic header inventory.
#
# This is the ground truth for document structure. It exists because inferring
# structure from an LLM's reading of a prose sample loses sections: on
# MS AER-2026-1101 the segmenter dropped section 5.5, and the appendix collapsed
# into a single 27-page "section" that the text cleaner then summarised, silently
# discarding Appendices G and H.
echo -e "${BLUE}Building deterministic header inventory...${NC}"
if [ -x "$SCRIPT_DIR/extract_headers.sh" ]; then
    "$SCRIPT_DIR/extract_headers.sh" "$CACHE_DIR" || true
    HEADER_COUNT=$(( $(wc -l < "$CACHE_DIR/headers.tsv" 2>/dev/null || echo 1) - 1 ))
    echo -e "${GREEN}   $HEADER_COUNT headers found -> $CACHE_DIR/headers.tsv${NC}"
    if [ "$HEADER_COUNT" -lt 3 ]; then
        echo -e "${YELLOW}   WARNING: very few headers detected. This paper may use an${NC}"
        echo -e "${YELLOW}   unusual heading style. Inspect headers.tsv before trusting${NC}"
        echo -e "${YELLOW}   the coverage gate, and segment from layout/ pages directly.${NC}"
    fi
else
    echo -e "${YELLOW}   extract_headers.sh not executable; skipping (coverage gate will not run)${NC}"
fi

# Step 5: Create initial segmentation task
echo -e "${BLUE}Creating segmentation task file...${NC}"
SEGMENT_TASK="$CACHE_DIR/segment_task.md"
cat > "$SEGMENT_TASK" << 'TASK_EOF'
# Document Segmentation Task

Produce `structure.json` for this paper.

## Authoritative header inventory

The table below was extracted deterministically from EVERY page of the PDF by
`scripts/extract_headers.sh`. It is the ground truth for this document's
structure. Rows with kind=toc come from a table-of-contents page and are a
cross-check on the body rows.

**Your section list must contain one entry for every body row below (every row
whose kind is not `toc`). Do not omit any. Do not invent sections that are not
listed.** If a row looks wrong, keep it and add a `"note"` field saying why —
never silently drop it. A dropped row here becomes content missing from the
final document, which is the specific failure this inventory exists to prevent.

```tsv
TASK_EOF

if [ -f "$CACHE_DIR/headers.tsv" ]; then
    cat "$CACHE_DIR/headers.tsv" >> "$SEGMENT_TASK"
else
    echo "(header inventory unavailable — segment from the prose sample below)" >> "$SEGMENT_TASK"
fi

cat >> "$SEGMENT_TASK" << 'TASK_EOF'
```

## Prose sample (front matter, for title / authors / abstract only)

TASK_EOF

printf '```\n' >> "$SEGMENT_TASK"
# awk rather than head: head closes the pipe early, which makes xargs report
# "cat: terminated with signal 13" on every run. awk drains its input quietly.
find "$CACHE_DIR/text" -name "page_*.txt" -print0 | sort -zV | xargs -0 cat | \
    sed -E '/^[0-9]{1,3}$/d' | \
    cat -s | \
    awk 'NR <= 400' >> "$SEGMENT_TASK" 2>/dev/null
printf '```\n' >> "$SEGMENT_TASK"

cat >> "$SEGMENT_TASK" << TASK_EOF

## Document facts

- Total pages: $TOTAL_PAGES

## Required Output

Return ONLY valid JSON, no other text:

- \`title\`, \`authors\` (list)
- \`abstract\`: page number and text
- \`sections\`: one object per body row of the inventory, each with
  \`id\` (the inventory label), \`title\`, \`level\` (1 for "5", 2 for "5.1",
  3 for "5.1.1"), \`start_page\`, \`end_page\`
- \`references_start_page\`, \`appendix_start_page\` (if present)
- \`total_pages\`: $TOTAL_PAGES

### Page-range rules (checked mechanically by scripts/verify_coverage.sh)

1. Every page from 1 to $TOTAL_PAGES must fall inside at least one section's
   [start_page, end_page]. Front matter, references, standalone figure and table
   blocks, and appendices all need explicit entries. A page in no range is a page
   no cleaning step will read.
2. A section's \`start_page\` is the page its header appears on, from the
   inventory. Never move a start page to cover a section you have omitted.
3. A level-1 section's \`end_page\` is one before the next level-1 section's
   start. Subsections nest inside their parent and may share pages with it.
4. **No section may span more than 6 pages.** If a real section is longer, split
   it into entries \`id\` + "-part1", "-part2", ... of at most 6 pages each. This
   cap exists because a 27-page cleaning unit is where this pipeline previously
   lost three sections: the cleaner returned a summary of the head of its input.
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
  "visual_interpretation": {
    "figures": "always",
    "tables": "always"
  },
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
