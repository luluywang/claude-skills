# Quick Start Guide

## What You Have

A complete Claude Code-native PDF parser system for economics papers with:
- ✅ 7 Haiku prompt templates for different processing tasks
- ✅ `process_paper.sh` script for PDF preprocessing
- ✅ Automatic page splitting and text extraction
- ✅ Pre-generated processing task for the Buchak et al. (2018) example

## Getting Started in 5 Steps

### 1. Verify Setup

Check that everything is installed:
```bash
cd /Users/luluwang/Dropbox/Documents/Economics/Projects/Claude/parsepdf
pdfinfo --version          # Should show poppler version
ls prompts/                # Should show 7 .md files
ls process_paper.sh        # Should exist and be executable
```

### 2. Preprocess Your PDF

```bash
./process_paper.sh "path/to/your/paper.pdf"
```

This creates:
- Individual page PDFs in `pages/[paper_name]/`
- Extracted text files in `work/[paper_name]/text/` and `layout/`
- A segmentation task file: `work/[paper_name]/segment_task.md`
- A config.json with metadata

### 3. Run Segmentation (Claude Code)

For the Buchak example:

```bash
cat work/Buchak*/segment_task.md | head -100  # Preview the task
```

Then in Claude Code:
1. Copy the content of `work/Buchak*/segment_task.md`
2. Use this as input with the prompt `prompts/segment.md`
3. Get back a JSON structure of the document
4. Save it to `work/Buchak*/structure.json`

### 4. Parallel Processing

Once you have `structure.json`, use Claude Code to:

**Extract Tables:**
```bash
cat work/Buchak*/layout/page_15.txt | head -50
```
- Use `prompts/extract_tables.md`
- Process pages with tables → save to `work/Buchak*/tables/page_N.json`

**Describe Figures:**
```bash
cat work/Buchak*/text/page_22.txt
```
- Use `prompts/describe_figures.md`
- Process pages with figures → save to `work/Buchak*/figures/page_N.json`

**Clean Text:**
- Use `prompts/clean_text.md`
- Process each section → save to `work/Buchak*/cleaned/section_NAME.md`

### 5. Assemble & QA

Combine outputs into final markdown, then run QA check:
- Use `prompts/qa_check.md`
- Get back validation report → save to `output/[paper_name]_qa.json`

## Testing with Buchak et al. (2018)

The example PDF has already been preprocessed. Start here:

```bash
# View the preprocessing results
ls -la work/Buchak*
ls -la pages/Buchak*/page_*.pdf | head

# See what the first ~10 pages look like
head -200 work/Buchak*/text/page_1.txt

# Check the segmentation task that was created
head -300 work/Buchak*/segment_task.md
```

## Key Files Reference

| File | Purpose |
|------|---------|
| `process_paper.sh` | Preprocesses PDF: splits pages, extracts text |
| `prompts/segment.md` | Analyzes document structure |
| `prompts/extract_tables.md` | Extracts and converts tables to markdown |
| `prompts/validate_tables.md` | Cross-checks table values with text |
| `prompts/describe_figures.md` | Creates text descriptions of figures |
| `prompts/convert_equations.md` | Converts equations to LaTeX |
| `prompts/clean_text.md` | Cleans and formats section text |
| `prompts/qa_check.md` | Final validation and quality assurance |

## Output Structure

After processing a paper named `my_paper.pdf`:

```
work/my_paper/
├── config.json              # Processing configuration
├── segment_task.md          # Input for segmentation step
├── full_text.txt            # All extracted text combined
├── structure.json           # Document structure (after segmentation)
├── text/                    # Raw text per page
│   ├── page_1.txt
│   ├── page_2.txt
│   └── ...
├── layout/                  # Layout-preserved text (for tables)
│   ├── page_1.txt
│   └── ...
├── tables/                  # Extracted tables (after extraction)
│   ├── page_15.json
│   └── ...
├── figures/                 # Described figures (after description)
│   ├── page_22.json
│   └── ...
├── equations/               # Converted equations (after conversion)
│   ├── section_1.json
│   └── ...
├── cleaned/                 # Cleaned section text
│   ├── introduction.md
│   └── ...
└── validation/              # Table validation results
    ├── table_1.json
    └── ...

pages/my_paper/
├── page_1.pdf
├── page_2.pdf
└── ...

output/
├── my_paper.md              # Final markdown document
└── my_paper_qa.json         # QA validation report
```

## Example Commands

### View extracted text from page 15
```bash
cat "work/Buchak*/text/page_15.txt" | head -50
```

### View layout-preserved text (useful for tables)
```bash
cat "work/Buchak*/layout/page_15.txt"
```

### Check how many pages
```bash
ls "pages/Buchak*/page_*.pdf" | wc -l
```

### View the config created
```bash
cat "work/Buchak*/config.json" | jq .
```

### Open original PDF page for review
```bash
open "pages/Buchak*/page_22.pdf"
```

## Next Steps

1. **For the Buchak example**: Run segmentation on the pre-generated task
2. **For new papers**: Run `./process_paper.sh "path/to/paper.pdf"` first
3. **For understanding**: Read `README.md` for full documentation
4. **For debugging**: Check individual text files in `work/[paper]/text/` and `layout/`

## Tips

- **Start small**: Test on just the first few pages before processing entire paper
- **Use jq**: For viewing JSON files: `cat work/*/tables/page_15.json | jq .`
- **Parallel processing**: Multiple Claude calls can run simultaneously for different pages
- **Manual review**: QA report will flag tables/figures that need human checking
- **Iteration**: Reprocess specific pages without redoing entire document

## Common Issues

**"pdfinfo not found"**
```bash
brew install poppler
```

**"File not found"**
Check the PDF path exists:
```bash
ls -la "your/pdf/path.pdf"
```

**Text extraction looks wrong**
Check layout-preserved version:
```bash
cat work/[paper]/layout/page_N.txt
```

Need more help? See `README.md` for full documentation.
