# Claude Projects

This directory contains modular AI prompt systems for economics research, organized to support peer review, editorial workflows, and document processing.

## Structure

| Folder | Purpose |
|--------|---------|
| `shared/` | Components shared between referee and copyedit |
| `referee/` | Mock journal referee report generation |
| `copyedit/` | Writing review and copyediting |
| `parsepdf/` | PDF parsing and text extraction |
| `dist/` | Portable prompts only (no dev folders) |

## Project Pattern

Each project follows a consistent structure:
- `[project]/dev/` - Development materials (examples, notes, guides, test files)
- `[project]/prompts/` - Portable prompts for distribution (ready for production use)

This separation allows for iterative development while keeping deployable prompts clean and focused.

### Cross-Project References

When referencing another project from within a prompt file, use:
- **Source path**: `../../otherproject/prompts/file.prompt`
- **Dist path**: `../otherproject/file.prompt` (auto-converted by `package.sh`)

Example from `referee/prompts/master.prompt`:
```
@IMPORT: ../../copyedit/prompts/tasks/ai_detection.prompt
```
This becomes `../copyedit/tasks/ai_detection.prompt` in dist.

## Projects Overview

### Referee
**Location:** `referee/prompts/master.prompt`

Generates mock journal referee reports for academic papers. Capabilities include:
- Detailed critical analysis of methodology, contributions, and presentation
- Structured feedback following academic review standards
- Customizable review tone and depth
- Support for multiple review personas (harsh, balanced, encouraging)

### Copyedit
**Location:** `copyedit/prompts/master.prompt`

Comprehensive writing review and copyediting system. Features:
- Grammar, clarity, and style improvements
- Consistency checking across documents
- Tone and audience alignment analysis
- Detailed comments with explanations for each suggestion
- Preservation of original voice while enhancing readability

### Shared
**Location:** `shared/`

Reusable components utilized by multiple projects:
- Common formatting utilities
- Prompt fragments for standard tasks
- Helper functions for document processing
- Shared validation logic

These components reduce duplication and ensure consistency across projects.

### ParsePDF
**Location:** `parsepdf/prompts/`

PDF parsing and text extraction utilities:
- Extract text content from academic papers and documents
- Maintain document structure and formatting information
- Identify sections, citations, and key elements
- Prepare documents for downstream processing by Referee or Copyedit prompts

## Quick Start

### For Referee Reports
```
Input: Path to PDF file
Processing: Uses parsepdf/ to extract text from the PDF
Output: Referee report and editor letter saved to the same directory as the input PDF
```

### For Copyediting
```
Load the master prompt: copyedit/prompts/master.prompt
Provide: Document text to review
Output: Copyedited version with comments and suggestions
```

### For PDF Processing
```
Use scripts in: parsepdf/prompts/
Input: PDF file path
Output: Extracted text suitable for downstream analysis
```

## Setup and Prerequisites

### Requirements
- Claude API access (for dynamic prompt usage)
- Python 3.7+ (for PDF parsing utilities)
- Standard text processing tools

### Installation
1. Clone or copy this directory to your workspace
2. Install any required dependencies: `pip install -r requirements.txt` (if present)
3. Load prompts directly into Claude's interface or integrate via API

### Configuration
- Each project can be customized by modifying the development materials in `[project]/dev/`
- Shared components can be updated in `shared/` to affect all dependent projects
- Review examples and test cases in development folders before deploying

## Distribution

To create a distribution package with portable prompts only (excluding development materials):

```bash
./package.sh
```

This generates the `dist/` directory containing only production-ready prompts, suitable for sharing or deploying to other environments.

## Workflow Integration

### Typical Document Review Pipeline
1. **Input** - User provides path to a PDF file
2. **Extract text** - Use `parsepdf/` to extract content from the PDF
3. **Generate review** - Apply `referee/prompts/master.prompt` to create peer review feedback
4. **Save outputs** - Write `.tex` files to the **same directory as the input PDF**
5. **AI screen** - Automatically run AI detection from `copyedit/` and apply fixes directly (no approval needed)
6. **Final output** - Cleaned `.tex` files ready to compile to PDF

### Development Workflow
1. Modify prompts and components in `[project]/dev/`
2. Test with sample documents and expected outputs
3. Move finalized prompts to `[project]/prompts/`
4. Run `./package.sh` to update `dist/` for distribution

## Output File Locations

When processing a PDF for referee review:
- **Input**: `/path/to/paper.pdf`
- **Outputs** (saved to same directory as input PDF):
  - `{short_title}_{YYYYMMDD}_claude_referee_report.tex` - Detailed referee report (compiles to PDF)
  - `{short_title}_{YYYYMMDD}_claude_editor_letter.tex` - Cover letter to editor (compiles to PDF)

**Short title generation:**
- Take 2-3 key words from paper title (skip articles like "The", "A")
- Convert to lowercase, use underscores
- Example: "The Effect of Minimum Wage on Employment" → `minimum_wage_employment`

**Timestamp:** Use today's date in YYYYMMDD format to enable multiple reviews of the same paper without overwriting previous reports.
- Example: `minimum_wage_employment_20251231_claude_referee_report.tex`

The `_claude` suffix indicates AI-generated content. This ensures all files related to a paper review stay together with the source document.

## Post-Processing: AI Screen

After generating referee report and editor letter, **automatically** run the AI detection task on both `.tex` files:

- **Task**: `copyedit/prompts/tasks/ai_detection.prompt` (or `../copyedit/tasks/ai_detection.prompt` in dist)

1. Screen for AI tells (punctuation patterns, language patterns)
2. **Apply fixes directly** — do not wait for user approval
3. Save cleaned versions in place (overwrite the original `.tex` files)

This ensures outputs read naturally and don't contain obvious AI-generated patterns.

## File Organization Best Practices

- Keep development examples in `dev/` folders for reference
- Use `master.prompt` as the main entry point for each project
- Store shared utilities in `shared/` to avoid duplication
- Document customizations in project-specific README files
- Test changes before packaging with `./package.sh`

## Support

For questions about specific projects:
- Check the examples in `[project]/dev/`
- Review the master prompt structure in `[project]/prompts/master.prompt`
- Consult shared components in `shared/` for reusable patterns
