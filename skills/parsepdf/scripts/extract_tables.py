#!/usr/bin/env python3
"""
Extract tables from PDF using pdfplumber.
Outputs structured JSON for each page with detected tables.

Usage:
    python extract_tables.py --input paper.pdf --output-dir ./tables/
    python extract_tables.py --input paper.pdf --output-dir ./tables/ --pages 5-10
"""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path


def ensure_pdfplumber():
    """Auto-install pdfplumber if missing."""
    try:
        import pdfplumber
        return True
    except ImportError:
        print("pdfplumber not found. Installing...", file=sys.stderr)
        try:
            subprocess.check_call([
                sys.executable, "-m", "pip", "install",
                "--user", "--quiet", "pdfplumber>=0.10.0"
            ])
            print("pdfplumber installed successfully.", file=sys.stderr)
            return True
        except subprocess.CalledProcessError as e:
            print(f"Failed to install pdfplumber: {e}", file=sys.stderr)
            print("Please run: pip install pdfplumber>=0.10.0", file=sys.stderr)
            return False


if not ensure_pdfplumber():
    sys.exit(1)

import pdfplumber  # noqa: E402 - import after ensuring installation


# Optimal settings for economics tables (often without visible grid lines)
TABLE_SETTINGS = {
    "vertical_strategy": "text",
    "horizontal_strategy": "text",
    "snap_tolerance": 3,
    "snap_x_tolerance": 3,
    "snap_y_tolerance": 3,
    "join_tolerance": 3,
    "join_x_tolerance": 3,
    "join_y_tolerance": 3,
    "edge_min_length": 3,
    "min_words_vertical": 3,
    "min_words_horizontal": 1,
    "intersection_tolerance": 3,
    "intersection_x_tolerance": 3,
    "intersection_y_tolerance": 3,
}


def classify_table_type(rows: list[list[str]]) -> str:
    """Classify the type of economics table based on content."""
    if not rows:
        return "unknown"

    all_text = " ".join(" ".join(str(cell) for cell in row) for row in rows).lower()

    # Regression table indicators
    regression_patterns = [
        r'\*\*\*', r'\*\*', r'\*',  # significance stars
        r'coefficient', r'std\.?\s*err', r'standard error',
        r'r-squared', r'r2', r'r²', r'observations',
        r'fixed effects', r'controls', r'\(se\)',
        r'dependent variable'
    ]

    # Summary statistics indicators
    summary_patterns = [
        r'\bmean\b', r'std\.?\s*dev', r'\bmedian\b',
        r'\bmin\b', r'\bmax\b', r'p25', r'p75',
        r'percentile', r'\bcount\b', r'\bs\.d\.\b'
    ]

    # Correlation matrix indicators
    correlation_patterns = [
        r'correlation', r'\b1\.00\b', r'\b1\.000\b'
    ]

    regression_score = sum(1 for p in regression_patterns if re.search(p, all_text))
    summary_score = sum(1 for p in summary_patterns if re.search(p, all_text))
    correlation_score = sum(1 for p in correlation_patterns if re.search(p, all_text))

    # Check for symmetric matrix pattern (correlation)
    if correlation_score > 0 and is_symmetric_like(rows):
        return "correlation_matrix"

    if regression_score > summary_score and regression_score > 0:
        return "regression"
    elif summary_score > 0:
        return "summary_statistics"
    else:
        return "data_table"


def is_symmetric_like(rows: list[list[str]]) -> bool:
    """Check if table might be a symmetric matrix (like correlation)."""
    if len(rows) < 3:
        return False

    # Check if diagonal has 1.00 or 1.000
    for i, row in enumerate(rows[1:], 1):  # Skip header
        if i < len(row):
            cell = str(row[i]).strip()
            if cell in ['1.00', '1.000', '1', '1.0']:
                return True
    return False


def clean_cell(cell) -> str:
    """Clean a table cell value."""
    if cell is None:
        return ""
    text = str(cell).strip()
    # Normalize whitespace
    text = re.sub(r'\s+', ' ', text)
    return text


def extract_table_data(table_obj) -> dict:
    """Extract and structure data from a pdfplumber table object."""
    rows = table_obj.extract()
    if not rows:
        return None

    # Clean all cells
    cleaned_rows = []
    for row in rows:
        cleaned_row = [clean_cell(cell) for cell in row]
        # Skip completely empty rows
        if any(cell for cell in cleaned_row):
            cleaned_rows.append(cleaned_row)

    if not cleaned_rows:
        return None

    # Determine column count (max across all rows)
    max_cols = max(len(row) for row in cleaned_rows)

    # Pad rows to have consistent column count
    for row in cleaned_rows:
        while len(row) < max_cols:
            row.append("")

    # Identify header row (first non-empty row)
    header_row = cleaned_rows[0] if cleaned_rows else None

    # Classify table type
    table_type = classify_table_type(cleaned_rows)

    # Extract notes (look for rows with *, Note:, Source:, etc.)
    notes = []
    data_rows = []
    for row in cleaned_rows:
        row_text = " ".join(row).lower()
        if any(marker in row_text for marker in ['note:', 'source:', 'notes:', '***', '** ', '* ']):
            if row_text.startswith('note') or row_text.startswith('source'):
                notes.append(" ".join(row).strip())
            else:
                data_rows.append(row)
        else:
            data_rows.append(row)

    # Get bounding box for position info
    bbox = table_obj.bbox if hasattr(table_obj, 'bbox') else None

    return {
        "header_row": header_row,
        "rows": data_rows,
        "dimensions": {
            "rows": len(data_rows),
            "cols": max_cols
        },
        "table_type": table_type,
        "notes_detected": notes if notes else None,
        "bbox": list(bbox) if bbox else None
    }


def extract_tables_from_page(page, page_num: int) -> dict:
    """Extract all tables from a single PDF page."""
    results = []

    # Try finding tables with optimized settings for economics papers
    try:
        found_tables = page.find_tables(table_settings=TABLE_SETTINGS)
    except Exception as e:
        # Fallback to default settings if custom settings fail
        try:
            found_tables = page.find_tables()
        except Exception:
            found_tables = []

    for table_idx, table_obj in enumerate(found_tables):
        table_data = extract_table_data(table_obj)
        if table_data:
            table_data["table_index"] = table_idx
            results.append(table_data)

    # Also try direct extraction if find_tables found nothing
    if not results:
        try:
            raw_tables = page.extract_tables(table_settings=TABLE_SETTINGS)
            for table_idx, raw_table in enumerate(raw_tables):
                if raw_table and any(any(cell for cell in row) for row in raw_table):
                    cleaned_rows = []
                    for row in raw_table:
                        cleaned_row = [clean_cell(cell) for cell in row]
                        if any(cell for cell in cleaned_row):
                            cleaned_rows.append(cleaned_row)

                    if cleaned_rows:
                        max_cols = max(len(row) for row in cleaned_rows)
                        for row in cleaned_rows:
                            while len(row) < max_cols:
                                row.append("")

                        results.append({
                            "table_index": table_idx,
                            "header_row": cleaned_rows[0] if cleaned_rows else None,
                            "rows": cleaned_rows,
                            "dimensions": {
                                "rows": len(cleaned_rows),
                                "cols": max_cols
                            },
                            "table_type": classify_table_type(cleaned_rows),
                            "notes_detected": None,
                            "bbox": None
                        })
        except Exception:
            pass

    return {
        "page": page_num,
        "tables_found": len(results),
        "tables": results,
        "extraction_method": "pdfplumber",
        "extraction_settings": "text_based"
    }


def detect_continuations(all_pages_data: list[dict]) -> list[dict]:
    """Detect tables that may span multiple pages."""
    for i in range(len(all_pages_data) - 1):
        curr_page = all_pages_data[i]
        next_page = all_pages_data[i + 1]

        if not curr_page["tables"] or not next_page["tables"]:
            continue

        # Check last table of current page vs first table of next page
        last_table = curr_page["tables"][-1]
        first_table = next_page["tables"][0]

        # Same column count suggests continuation
        if last_table["dimensions"]["cols"] == first_table["dimensions"]["cols"]:
            # Check if first row of next table looks like data, not a new header
            if first_table["rows"]:
                first_row = first_table["rows"][0]
                # If first row is mostly numeric, likely continuation
                numeric_count = sum(1 for cell in first_row
                                   if re.match(r'^[\d\.\-\+\*\(\)]+$', cell.replace(',', '').replace(' ', '')))
                if numeric_count > len(first_row) / 2:
                    last_table["continues_to_page"] = next_page["page"]
                    first_table["continues_from_page"] = curr_page["page"]

    return all_pages_data


def process_pdf(pdf_path: str, output_dir: str, page_range: tuple = None) -> None:
    """Process a PDF file and extract tables from all pages."""
    pdf_path = Path(pdf_path)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    all_pages_data = []

    with pdfplumber.open(pdf_path) as pdf:
        total_pages = len(pdf.pages)

        # Determine which pages to process
        if page_range:
            start, end = page_range
            pages_to_process = range(max(1, start) - 1, min(end, total_pages))
        else:
            pages_to_process = range(total_pages)

        for page_idx in pages_to_process:
            page = pdf.pages[page_idx]
            page_num = page_idx + 1  # 1-indexed

            page_data = extract_tables_from_page(page, page_num)
            all_pages_data.append(page_data)

            # Write individual page JSON
            output_file = output_dir / f"page_{page_num}.json"
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(page_data, f, indent=2, ensure_ascii=False)

            if page_data["tables_found"] > 0:
                print(f"  Page {page_num}: {page_data['tables_found']} table(s) found")

    # Detect multi-page tables
    all_pages_data = detect_continuations(all_pages_data)

    # Re-write files with continuation info
    for page_data in all_pages_data:
        output_file = output_dir / f"page_{page_data['page']}.json"
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(page_data, f, indent=2, ensure_ascii=False)

    # Write summary file
    summary = {
        "total_pages": total_pages,
        "pages_processed": len(all_pages_data),
        "pages_with_tables": sum(1 for p in all_pages_data if p["tables_found"] > 0),
        "total_tables": sum(p["tables_found"] for p in all_pages_data),
        "table_types": {}
    }

    # Count table types
    for page_data in all_pages_data:
        for table in page_data["tables"]:
            t_type = table.get("table_type", "unknown")
            summary["table_types"][t_type] = summary["table_types"].get(t_type, 0) + 1

    summary_file = output_dir / "summary.json"
    with open(summary_file, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)

    print(f"\nSummary: {summary['total_tables']} tables found across {summary['pages_with_tables']} pages")


def parse_page_range(range_str: str) -> tuple:
    """Parse a page range string like '5-10' or '5'."""
    if '-' in range_str:
        start, end = range_str.split('-')
        return int(start), int(end)
    else:
        page = int(range_str)
        return page, page


def main():
    parser = argparse.ArgumentParser(
        description='Extract tables from PDF using pdfplumber'
    )
    parser.add_argument(
        '--input', '-i',
        required=True,
        help='Path to input PDF file'
    )
    parser.add_argument(
        '--output-dir', '-o',
        required=True,
        help='Output directory for JSON files'
    )
    parser.add_argument(
        '--pages', '-p',
        help='Page range to process (e.g., "5-10" or "5")'
    )

    args = parser.parse_args()

    if not Path(args.input).exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    page_range = None
    if args.pages:
        try:
            page_range = parse_page_range(args.pages)
        except ValueError:
            print(f"Error: Invalid page range: {args.pages}", file=sys.stderr)
            sys.exit(1)

    process_pdf(args.input, args.output_dir, page_range)


if __name__ == '__main__':
    main()
