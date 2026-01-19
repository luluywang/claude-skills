---
name: parsepdf
description: |
  PDF parsing for economics papers. Splits PDFs into pages, extracts text and tables,
  identifies document structure, and converts to markdown. Use when the PDF is too
  large for Claude's native PDF support. Only activate when user explicitly invokes
  '/parsepdf'.
---

# PDF Parser for Economics Papers

Convert economics research PDFs into structured markdown with tables, figures, and equations extracted.

> **Why this tool exists:** If you are using this skill, the PDF is too large to read directly with Claude's native PDF support. This tool splits the PDF into individual pages and extracts text, allowing Claude to process documents that would otherwise exceed context limits. Do NOT attempt to read the original PDF directly—use the extracted cache files instead.

## Invocation

```
/parsepdf process paper.pdf           # Full extraction workflow
/parsepdf tables paper.pdf            # Extract tables only
/parsepdf structure paper.pdf         # Identify document structure
/parsepdf cache status                # Show cached papers
/parsepdf cache clear                 # Clear all cache
```

---

## Workflow

1. **Extract PDF content** → Run shell script to split pages and extract text
2. **Segment document** → Identify structure (sections, page ranges)
3. **Process components** → Extract tables, figures, equations as needed
4. **Assemble output** → Combine into final markdown
5. **Quality check** → Validate output completeness

---

## Request Routing

| Request Pattern | Action |
|----------------|--------|
| "Process this PDF" / "Parse paper.pdf" / Full extraction | Full workflow below |
| "Extract tables from pages X-Y" | `assets/tasks/extract_tables.md` |
| "Describe figures" / "What figures are in this paper?" | `assets/tasks/describe_figures.md` |
| "Convert equations to LaTeX" | `assets/tasks/convert_equations.md` |
| "Clean up extracted text" | `assets/tasks/clean_text.md` |
| "What's the structure of this paper?" | `assets/tasks/segment.md` |
| "Validate table extraction" | `assets/tasks/validate_tables.md` |
| "Run QA on output" | `assets/tasks/qa_check.md` |

---

## Scripts

### process_paper.sh

Main orchestrator for PDF extraction.

```bash
./scripts/process_paper.sh /path/to/paper.pdf
./scripts/process_paper.sh --keep-cache /path/to/paper.pdf  # Debug mode
```

Creates:
- `cache/[PAPER]/text/page_*.txt` - Extracted text per page
- `cache/[PAPER]/layout/page_*.txt` - Layout-preserved text (for tables)
- `cache/[PAPER]/tables/page_*.json` - pdfplumber table extraction
- `cache/[PAPER]/segment_task.md` - Ready for segmentation

### batch_process.sh

Process multiple PDFs in a folder.

```bash
./scripts/batch_process.sh /path/to/folder
./scripts/batch_process.sh --keep-cache /path/to/folder
```

### cache.sh

Manage extracted cache.

```bash
./scripts/cache.sh status              # Show cached papers
./scripts/cache.sh clear               # Clear all cache
./scripts/cache.sh clear "Paper Name"  # Clear specific paper
```

### extract_tables.py

Extract tables using pdfplumber. Auto-installs pdfplumber if not present.

```bash
python3 ./scripts/extract_tables.py --input paper.pdf --output-dir ./tables/
python3 ./scripts/extract_tables.py --input paper.pdf --output-dir ./tables/ --pages 5-10
```

### extract_bibliography.sh

Extract bibliography section from a processed paper.

```bash
./scripts/extract_bibliography.sh paper_name
```

---

## Tasks Reference

| Task | Prompt | Input | Output |
|------|--------|-------|--------|
| Structure | `assets/tasks/segment.md` | segment_task.md | structure.json |
| Tables | `assets/tasks/extract_tables.md` | layout/page_N.txt | tables/page_N.json |
| Figures | `assets/tasks/describe_figures.md` | text/page_N.txt | figures/page_N.json |
| Equations | `assets/tasks/convert_equations.md` | text/page_N.txt | equations/section.json |
| Text | `assets/tasks/clean_text.md` | text/page_*.txt | cleaned/SECTION.md |
| Validate | `assets/tasks/validate_tables.md` | tables + context | validation/table_N.json |
| QA | `assets/tasks/qa_check.md` | assembled markdown | *_qa.json |
| Full run | `assets/tasks/orchestrate.md` | segment_task.md | output/*.md |

---

## Dependencies

### Required: poppler-utils (system package)

The shell scripts require `pdfinfo`, `pdftotext`, and `pdfseparate` from poppler-utils.

**Install:**
- **macOS:** `brew install poppler`
- **Ubuntu/Debian:** `sudo apt-get install poppler-utils`
- **Fedora:** `sudo dnf install poppler-utils`

### Optional: pdfplumber (Python package)

Used for advanced table extraction. **Auto-installed** when you run `extract_tables.py`.

If auto-install fails:
```bash
pip install pdfplumber>=0.10.0
```

---

## Cache Management

- **Default behavior:** Cache is cleared before each run (fresh start)
- **Debug mode:** Use `--keep-cache` to preserve intermediate files

Cache location: `.claude/skills/parsepdf/cache/[PAPER_NAME]/`

---

## Full Processing Example

```
User: "Process paper.pdf and extract everything"

1. Run extraction:
   ./scripts/process_paper.sh paper.pdf

2. Check cache created:
   ls cache/paper/

3. Load orchestrate.md for full processing:
   Read assets/tasks/orchestrate.md

4. Follow orchestration phases to completion

5. Output: output/paper.md + output/paper_qa.json
```

---

## Error Handling

| Problem | Solution |
|---------|----------|
| PDF extraction fails | Check PDF is not password-protected |
| Missing poppler tools | Install poppler-utils (see Dependencies) |
| pdfplumber not found | Will auto-install; if fails, run `pip install pdfplumber` |
| Structure unclear | Use segment.md with more context pages |
| Tables garbled | Use layout text instead of plain text |
| Missing content | Check QA report, re-extract specific pages |

---

## Directory Structure

```
.claude/skills/parsepdf/
├── SKILL.md                 ← This file (entry point)
├── scripts/                 ← Shell and Python scripts
│   ├── process_paper.sh     ← Main PDF extraction
│   ├── batch_process.sh     ← Batch processing
│   ├── cache.sh             ← Cache management
│   ├── extract_tables.py    ← pdfplumber table extraction
│   ├── extract_bibliography.sh
│   └── extract_citations.sh
├── assets/
│   └── tasks/               ← Task prompts
│       ├── segment.md
│       ├── extract_tables.md
│       ├── describe_figures.md
│       ├── convert_equations.md
│       ├── clean_text.md
│       ├── validate_tables.md
│       ├── qa_check.md
│       └── orchestrate.md
├── references/              ← Documentation
│   ├── README.md
│   └── QUICKSTART.md
├── cache/                   ← Runtime cache (generated)
└── output/                  ← Final output (generated)
```

---

## References

For detailed documentation:
- [README](references/README.md) - Full feature documentation
- [QUICKSTART](references/QUICKSTART.md) - Getting started guide
