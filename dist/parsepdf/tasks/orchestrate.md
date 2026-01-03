# Master PDF Processing Orchestrator

You are orchestrating the complete processing of an economics paper PDF. This prompt will guide you through the entire workflow from segmentation to final assembly and QA.

## Setup: Input Files

Your working directory contains:
- **Processed PDF pages**: `pages/[PAPER_NAME]/page_*.pdf`
- **Extracted text**: `work/[PAPER_NAME]/text/page_*.txt`
- **Layout text**: `work/[PAPER_NAME]/layout/page_*.txt`
- **Config file**: `work/[PAPER_NAME]/config.json`
- **Segmentation task**: `work/[PAPER_NAME]/segment_task.md`

## Phase 1: Document Segmentation (IF NEEDED)

If `work/[PAPER_NAME]/structure.json` does NOT exist yet:

1. Read the segmentation task:
   ```
   work/[PAPER_NAME]/segment_task.md
   ```

2. Use the segment.md prompt with this text input

3. Generate `structure.json` containing:
   - title, authors
   - abstract (text + page range)
   - sections (with page ranges and hierarchy)
   - references_start_page
   - appendix_start_page (if exists)

4. Save as: `work/[PAPER_NAME]/structure.json`

## Phase 2: Identify Processing Needs

Read `work/[PAPER_NAME]/structure.json` and identify:

- **Pages with tables**: Look at section contents, usually in Results/Tables section
- **Pages with figures**: Look for Figure mentions in structure
- **Equations in sections**: Check Methods, Model, Results sections
- **All sections**: For text cleaning task

Note:
- You may need to sample several pages to find examples
- Create a checklist of which pages need processing

## Phase 3: Parallel Processing

Process the following in parallel (or sequentially based on context):

### 3a. Extract Tables
For each page identified as containing tables:

1. Read layout text:
   ```
   work/[PAPER_NAME]/layout/page_N.txt
   ```

2. Use `prompts/extract_tables.md` with this input

3. Save output to:
   ```
   work/[PAPER_NAME]/tables/page_N.json
   ```

Repeat for all pages with tables (typically pages 10-35).

### 3b. Describe Figures
For each page with figures:

1. Read text:
   ```
   work/[PAPER_NAME]/text/page_N.txt
   ```

2. Use `prompts/describe_figures.md` with this input

3. Save output to:
   ```
   work/[PAPER_NAME]/figures/page_N.json
   ```

Note: Reference the PDF page if needed: `pages/[PAPER_NAME]/page_N.pdf`

### 3c. Convert Equations
For each section with mathematical equations:

1. Read section text:
   ```
   work/[PAPER_NAME]/text/page_N.txt
   ```

2. Use `prompts/convert_equations.md` with this input

3. Save output to:
   ```
   work/[PAPER_NAME]/equations/section_NAME.json
   ```

### 3d. Clean Section Text
For each section from structure.json:

1. Extract pages for that section:
   ```
   cat work/[PAPER_NAME]/text/page_{START}..{END}.txt
   ```

2. Use `prompts/clean_text.md` with:
   - Section title
   - Page range
   - Raw text

3. Save cleaned markdown to:
   ```
   work/[PAPER_NAME]/cleaned/SECTION_NAME.md
   ```

## Phase 4: Validate Tables

For each extracted table:

1. Get context (surrounding pages):
   ```
   cat work/[PAPER_NAME]/text/page_{START}..{END}.txt
   ```

2. Use `prompts/validate_tables.md` with:
   - Table data from `work/[PAPER_NAME]/tables/page_N.json`
   - Context text

3. Save validation to:
   ```
   work/[PAPER_NAME]/validation/table_N.json
   ```

## Phase 5: Assembly

Combine all components into final markdown:

```bash
# Create output directory
mkdir -p output

# Build final document
cat > output/[PAPER_NAME].md << EOF
# [TITLE from structure.json]

By [AUTHORS from structure.json]

---

####################################################################
##                          ABSTRACT                              ##
####################################################################

[ABSTRACT TEXT from structure.json]

---

[FOR EACH SECTION, USE THIS FORMAT:]

####################################################################
##                    [SECTION TITLE CAPS]                        ##
####################################################################

[CLEANED SECTION TEXT]

[If section contains tables:]
### Table N: [Table Title]
[TABLE MARKDOWN]

[If section contains figures:]
### Figure N: [Figure Title]
[FIGURE DESCRIPTION]

---

[END SECTION FORMAT]

####################################################################
##                         FOOTNOTES                              ##
####################################################################

[COLLECTED FOOTNOTES from all cleaned sections]

---

####################################################################
##                         REFERENCES                             ##
####################################################################

[BIBLIOGRAPHY SECTION or reference URLs]

EOF
```

**Section Separator Format**: Use the prominent `####` banner blocks between major sections (Introduction, Literature Review, Model, Data, Results, Conclusion, etc.) to make document navigation easy. Use `---` horizontal rules for subsection breaks.

## Phase 6: Quality Assurance

1. Collect statistics:
   - Total pages processed: [from config.json]
   - Sections found: [count]
   - Tables extracted: [count]
   - Figures described: [count]
   - Footnotes: [count]

2. Use `prompts/qa_check.md` with the assembled markdown

3. Save QA report to:
   ```
   output/[PAPER_NAME]_qa.json
   ```

4. Review QA report for any issues:
   - Missing footnote references
   - Broken table/figure references
   - Section hierarchy issues

## What To Do Next

Based on the QA report:

- **If QA passes**: Document is complete! ✅
  - Final markdown: `output/[PAPER_NAME].md`
  - QA report: `output/[PAPER_NAME]_qa.json`

- **If QA fails**: Fix indicated issues:
  - Missing footnotes: Add to cleaned sections
  - Broken references: Check table/figure numbers
  - Bad hierarchy: Adjust markdown heading levels

## Output Summary

After completing all phases, you should have:

```
output/
├── [PAPER_NAME].md           ← Final markdown document
└── [PAPER_NAME]_qa.json      ← Quality assurance report

work/[PAPER_NAME]/
├── structure.json            ← Document structure
├── tables/                   ← Extracted tables (JSON)
├── figures/                  ← Figure descriptions (JSON)
├── equations/                ← Equations in LaTeX (JSON)
├── cleaned/                  ← Cleaned sections (markdown)
└── validation/               ← Table validation results (JSON)
```

## Important Notes

1. **Work Directory**: All intermediate files go in `work/[PAPER_NAME]/`

2. **Page References**: Always include PDF page number in comments/notes for manual review

3. **Naming Convention**:
   - Cleaned sections: Use section title lowercase with underscores
   - E.g., `introduction.md`, `literature_review.md`, `results.md`

4. **Parallel Processing**: Steps 3a-3d can run in any order or in parallel

5. **Error Handling**: If any step fails:
   - Don't stop, continue with other components
   - Note the failure in comments
   - The QA step will flag issues

6. **Context Length**:
   - If paper > 50 pages, process in sections (e.g., intro, methods, results)
   - If document is very long, you may need to split processing across multiple Claude calls

## Quick Reference

| Phase | Prompt | Input | Output |
|-------|--------|-------|--------|
| 1 | segment.md | segment_task.md | structure.json |
| 3a | extract_tables.md | layout/page_N.txt | tables/page_N.json |
| 3b | describe_figures.md | text/page_N.txt | figures/page_N.json |
| 3c | convert_equations.md | text/page_N.txt | equations/section_N.json |
| 3d | clean_text.md | text/page_*.txt | cleaned/SECTION.md |
| 4 | validate_tables.md | tables + context | validation/table_N.json |
| 6 | qa_check.md | assembled markdown | output/*_qa.json |

## Example: Processing the Buchak Paper

```
Starting with: work/Buchak*/segment_task.md

1. Run segment.md → get structure.json (77 pages)

2. Identify processing needs:
   - Tables likely on pages 10-35
   - Figures throughout (sample pages 15, 22, 30)
   - Equations in Model section (pages 5-12)

3. Run in parallel:
   - extract_tables.md for pages with tables
   - describe_figures.md for pages with figures
   - convert_equations.md for model section
   - clean_text.md for each major section

4. Run validate_tables.md for each extracted table

5. Assemble all components into final markdown

6. Run qa_check.md for final validation

Output: output/buchak_2018.md (final document)
```

## Tips for Success

1. **Start with structure**: Understanding document structure first makes everything else easier
2. **Focus on key sections**: Don't need to process every page, focus on sections with tables/figures
3. **Test first**: Run one extraction (table, figure, equation) before doing all of them
4. **Save intermediates**: Always save outputs to work directory for debugging
5. **Check formats**: Validate table markdown and LaTeX equations before assembly
6. **Use PDF reference**: When in doubt about extracted content, check original PDF page

---

You are ready to begin! Start with Phase 1 if structure.json doesn't exist, or jump to Phase 3 if it does.
