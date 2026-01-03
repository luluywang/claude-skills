# PDF Parser for Economics Papers

This tool converts economics research PDFs into structured markdown.

> **Why this tool exists:** If you are using this tool, the PDF is too large to read directly with Claude's native PDF support. This tool splits the PDF into individual pages and extracts text, allowing Claude to process documents that would otherwise exceed context limits. Do NOT attempt to read the original PDF directly—use the extracted cache files instead.

## Quick Start

**Entry point:** `master.prompt`

**Single PDF:**
```bash
./scripts/process_paper.sh /path/to/paper.pdf
```

**Multiple PDFs:**
```bash
./scripts/batch_process.sh /path/to/folder
```

## Directory Structure

```
parsepdf/
├── cache/               ← Runtime cache (not distributed)
├── output/              ← Generated output (not distributed)
├── dev/                 ← Development/examples/docs
└── prompts/
    ├── master.prompt    ← Main entry point
    ├── tasks/           ← Individual task prompts
    ├── components/      ← Reusable prompt components
    └── scripts/         ← Shell scripts
```

## Cache Behavior

- **Default:** Cache is cleared before each run (fresh start)
- **Debug mode:** Use `--keep-cache` to preserve intermediate files

```bash
./scripts/process_paper.sh paper.pdf              # Normal (clears cache)
./scripts/process_paper.sh --keep-cache paper.pdf # Debug (keeps cache)
```

## Cache Management

```bash
./scripts/cache.sh status              # Show cached papers
./scripts/cache.sh clear               # Clear all cache
./scripts/cache.sh clear "Paper Name"  # Clear specific paper
```

## Processing Workflow

1. Run `scripts/process_paper.sh` → creates `cache/[PAPER]/`
2. Use `master.prompt` to dispatch to appropriate task
3. Or use `tasks/orchestrate.md` for full end-to-end processing
4. Output: `output/[PAPER].md`

## Task Reference

| Task | Prompt | Purpose |
|------|--------|---------|
| Structure | `tasks/segment.md` | Identify sections and page ranges |
| Tables | `tasks/extract_tables.md` | Extract tables from layout text |
| Figures | `tasks/describe_figures.md` | Describe figures from PDF pages |
| Equations | `tasks/convert_equations.md` | Convert equations to LaTeX |
| Text | `tasks/clean_text.md` | Clean extracted text |
| Validate | `tasks/validate_tables.md` | Validate table extraction |
| QA | `tasks/qa_check.md` | Quality assurance check |
| Full | `tasks/orchestrate.md` | Complete processing pipeline |

## Navigating by Section

After `tasks/segment.md` creates `structure.json`:

1. Check section's `start_page` and `end_page`
2. Read from `cache/[PAPER]/text/page_N.txt`
3. For tables, use `cache/[PAPER]/layout/page_N.txt`
