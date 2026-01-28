# Economics Paper PDF Parser

A Claude Code-native workflow for converting economics working papers from PDF to structured markdown format with extracted tables, described figures, and validated content.

## Features

- **PDF Splitting**: Automatically splits PDFs into individual pages for precise reference and parallel processing
- **Text Extraction**: Extracts both regular and layout-preserved text from each page
- **Document Structure Analysis**: Identifies document structure (title, abstract, sections, references)
- **Table Extraction**: Extracts tables and converts them to markdown format with value validation
- **Figure Description**: Creates text descriptions of figures for accessibility
- **Equation Conversion**: Converts mathematical equations to LaTeX markdown
- **Text Cleaning**: Removes artifacts and formats text for markdown output
- **Quality Assurance**: Validates footnotes, references, structure, and completeness
- **Traceable Processing**: Every extraction links back to specific PDF page for verification

## Directory Structure

```
parsepdf/
├── prompts/                 # Haiku prompt templates
│   ├── segment.md          # Document structure analysis
│   ├── extract_tables.md   # Table extraction
│   ├── validate_tables.md  # Table validation
│   ├── describe_figures.md # Figure description
│   ├── convert_equations.md # Equation conversion
│   ├── clean_text.md       # Text cleaning
│   └── qa_check.md         # Quality assurance
├── input/                  # Input PDFs (optional)
├── pages/                  # Split PDF pages
├── work/                   # Working files and temporary data
├── output/                 # Final markdown output + QA reports
├── process_paper.sh        # Main orchestration script
└── README.md              # This file
```

## Installation

### Prerequisites

- macOS or Linux system
- `poppler-utils` (for PDF processing)
- Claude Code with access to Haiku model

#### Install poppler-utils

**macOS:**
```bash
brew install poppler
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install poppler-utils
```

## Usage

### Step 1: Preprocessing

Run the preprocessing script to split the PDF and extract text:

```bash
./process_paper.sh "path/to/paper.pdf"
```

This will:
- Split the PDF into individual page files
- Extract text from each page (regular and layout-preserved)
- Create a combined text file from the first ~10 pages
- Create a `segment_task.md` file for structure analysis
- Generate a `config.json` with processing details

### Step 2: Document Segmentation (Claude Code)

Use Claude Code with the Haiku model to analyze the document structure:

1. Open the generated `work/[paper_name]/segment_task.md`
2. Use `prompts/segment.md` as your prompt template
3. Claude will return a JSON structure containing:
   - Paper title and authors
   - Abstract location and text
   - Section headers with page ranges
   - Reference section page
   - Appendix location (if exists)

Save the output as `work/[paper_name]/structure.json`

### Step 3: Parallel Processing

Once you have the document structure, process components in parallel:

#### Extract Tables
For each page identified as containing tables:
- Use `prompts/extract_tables.md`
- Input: Layout-preserved text from `work/[paper_name]/layout/page_N.txt`
- Output: JSON with extracted tables in markdown format
- Save to: `work/[paper_name]/tables/page_N.json`

#### Describe Figures
For each page with figures:
- Use `prompts/describe_figures.md`
- Input: Text from page + reference to original PDF
- Output: JSON with figure descriptions and metadata
- Save to: `work/[paper_name]/figures/page_N.json`

#### Convert Equations
For sections with mathematical equations:
- Use `prompts/convert_equations.md`
- Input: Raw equation text from section
- Output: JSON with LaTeX-formatted equations
- Save to: `work/[paper_name]/equations/section_N.json`

#### Clean Section Text
For each major section:
- Use `prompts/clean_text.md`
- Input: Raw text from section's page range
- Output: Cleaned markdown text
- Save to: `work/[paper_name]/cleaned/section_NAME.md`

### Step 4: Table Validation

After extracting tables, validate them against surrounding text:

- Use `prompts/validate_tables.md`
- Input: Extracted table + context from surrounding pages
- Output: Validation report with value locations and inconsistencies
- Save to: `work/[paper_name]/validation/table_N.json`

### Step 5: Assembly

Combine all processed components into final markdown:

```bash
cat > output/[paper_name].md << EOF
# [Title from structure.json]

## Abstract
[Abstract text]

[Cleaned sections in order with tables and figures]

---
## Footnotes
[Collected footnotes]

## References
[Bibliography section]
EOF
```

### Step 6: Quality Assurance

Final validation step:

- Use `prompts/qa_check.md`
- Input: Assembled markdown + statistics
- Output: QA report with any issues or warnings
- Save to: `output/[paper_name]_qa.json`

## Output Formats

### structure.json
```json
{
  "title": "Paper Title",
  "authors": ["Author 1", "Author 2"],
  "abstract": {
    "start_page": 1,
    "end_page": 2,
    "text": "Abstract text..."
  },
  "sections": [
    {
      "title": "Introduction",
      "level": 1,
      "start_page": 2,
      "end_page": 5
    }
  ],
  "references_start_page": 35,
  "appendix_start_page": 40
}
```

### tables/page_N.json
```json
{
  "page": 15,
  "tables": [
    {
      "number": "1",
      "title": "Summary Statistics",
      "markdown": "| Variable | Mean | Std Dev |\n|----------|------|---------|\n| Income | 45,231 | 32,145 |",
      "key_values": {
        "sample_size": "10,432",
        "mean_income": "45,231"
      },
      "notes": "Standard errors in parentheses"
    }
  ]
}
```

### figures/page_N.json
```json
{
  "figure_number": "1",
  "page": 15,
  "title": "Figure 1: Relationship between X and Y",
  "type": "scatter_plot",
  "description": {
    "axes": {
      "x": "Years of Education",
      "y": "Log Wages"
    },
    "content": "Scatter plot showing positive correlation...",
    "key_points": ["Upward sloping trend", "Steeper slope after 12 years"]
  },
  "confidence": "high",
  "needs_review": false,
  "pdf_reference": "page_15.pdf"
}
```

## Workflow Diagram

```
PDF Input
    ↓
[process_paper.sh] → Split into pages + Extract text
    ↓
segment_task.md
    ↓
[Claude + segment.md] → structure.json
    ↓
Parallel Processing:
├─→ [Claude + extract_tables.md] → tables/page_N.json
├─→ [Claude + describe_figures.md] → figures/page_N.json
├─→ [Claude + convert_equations.md] → equations/section_N.json
└─→ [Claude + clean_text.md] → cleaned/section_NAME.md
    ↓
[Claude + validate_tables.md] → validation/table_N.json
    ↓
[Assembly Script] → output/[paper_name].md
    ↓
[Claude + qa_check.md] → output/[paper_name]_qa.json
    ↓
Final Markdown Document + QA Report
```

## Example: Processing the Buchak et al. (2018) Paper

```bash
# Step 1: Preprocess
./process_paper.sh "Buchak et al. - 2018 - Beyond the Balance Sheet Model of Banking Implica.pdf"

# This creates:
# - 77 individual page PDFs in pages/
# - Text files for each page in work/Buchak.../text/ and work/Buchak.../layout/
# - A segmentation task in work/Buchak.../segment_task.md
# - A config.json with processing details
```

Then use Claude Code to:
1. Analyze `segment_task.md` with `prompts/segment.md` → `structure.json`
2. Extract tables from pages 15-25 with `prompts/extract_tables.md`
3. Describe figures found on pages 10, 18, 22 with `prompts/describe_figures.md`
4. Clean and format each section with `prompts/clean_text.md`
5. Validate table values with `prompts/validate_tables.md`
6. Run final QA with `prompts/qa_check.md`

## Manual Review Reference

If the QA report indicates figures or tables needing manual review:

```bash
# View the original PDF page directly
open "pages/[paper_name]/page_15.pdf"

# Check extracted text
cat "work/[paper_name]/text/page_15.txt"

# Check layout-preserved text
cat "work/[paper_name]/layout/page_15.txt"

# View extraction results
cat "work/[paper_name]/tables/page_15.json" | jq '.'
```

## Tips for Best Results

1. **PDF Quality**: Works best with text-based PDFs. Scanned/image-based PDFs will need OCR preprocessing.

2. **Large Papers**: For papers > 100 pages, consider processing sections in batches to manage context better.

3. **Complex Tables**: Very complex multi-part tables might need manual review. The QA report will flag these.

4. **Equations**: LaTeX conversion works well for standard mathematical notation. Unusual or custom notation may need adjustment.

5. **Figures**: Text descriptions work well for simple plots and charts. Complex diagrams benefit from keeping the PDF reference.

## Troubleshooting

### Missing poppler-utils
```bash
brew install poppler  # macOS
sudo apt-get install poppler-utils  # Linux
```

### "File not found" error
Check that the PDF path is correct and the file exists:
```bash
ls -la "path/to/paper.pdf"
```

### Text extraction issues
Some PDFs may have encoding issues. Check the extracted text:
```bash
head -100 "work/[paper_name]/text/page_1.txt"
```

### Table extraction incomplete
If tables are missing, check the layout-preserved text:
```bash
cat "work/[paper_name]/layout/page_15.txt"
```

This may reveal spacing or formatting issues that need Claude to interpret more carefully.

## Notes

- **Page References**: All outputs maintain exact page numbers from the original PDF, enabling precise verification
- **Parallel Processing**: Most steps (table extraction, figure description, equation conversion) can be run in parallel using multiple Claude calls
- **Cost-Effective**: Uses Haiku model for most tasks, which is significantly cheaper than larger models
- **Iterative**: If initial extraction quality is low, can reprocess specific pages without redoing entire document
- **Version Control**: Prompt templates are markdown files - easy to version control and modify

## Future Enhancements

- Automated assembly and QA without manual steps
- Support for OCR on scanned PDFs
- Bibliography parsing and citation linking
- Automatic LaTeX to MathML conversion
- Integration with academic databases for enriching paper metadata
