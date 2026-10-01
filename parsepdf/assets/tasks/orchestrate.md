---
**Model Directive:** Use **Haiku** for orchestration. This task coordinates the PDF processing workflow—methodical task dispatching with no deep reasoning required.
---

# Master PDF Processing Orchestrator

You are orchestrating the complete processing of an economics paper PDF. This prompt will guide you through the entire workflow from segmentation to final assembly and QA.

## Table of Contents

- [Setup: Capture Calling Directory and Input Files](#setup-capture-calling-directory-and-input-files)
- [Phase 1: Document Segmentation (IF NEEDED)](#phase-1-document-segmentation-if-needed)
- [Phase 2: Identify Processing Needs](#phase-2-identify-processing-needs)
- [Phase 3: Parallel Processing](#phase-3-parallel-processing)
  - [3a. Extract Tables (with optional visual verification)](#3a-extract-tables-with-optional-visual-verification)
  - [3b. Describe Figures (with visual interpretation)](#3b-describe-figures-with-visual-interpretation)
  - [3c. Convert Equations](#3c-convert-equations)
  - [3d. Clean Section Text](#3d-clean-section-text)
- [Phase 4: Validate Tables](#phase-4-validate-tables)
- [Phase 5: Assembly](#phase-5-assembly)
- [Phase 5.5: Coverage Gate (HARD, BLOCKING)](#phase-55-coverage-gate-hard-blocking)
- [Phase 6: Quality Assurance](#phase-6-quality-assurance)
- [Phase 7: Findings Summary](#phase-7-findings-summary)
- [Phase 8: Copy Output to Calling Directory](#phase-8-copy-output-to-calling-directory)
- [What To Do Next](#what-to-do-next)
- [Output Summary](#output-summary)
- [Important Notes](#important-notes)
- [Quick Reference](#quick-reference)
- [Example: Processing the Buchak Paper](#example-processing-the-buchak-paper)
- [Tips for Success](#tips-for-success)

## Setup: Capture Calling Directory and Input Files

**First action**: Run `pwd` and save the result as `CALLING_DIR`. This is where output files will be copied at the end so the user doesn't lose them.

Your working directory contains:
- **Processed PDF pages**: `pages/[PAPER_NAME]/page_*.pdf`
- **Extracted text**: `work/[PAPER_NAME]/text/page_*.txt`
- **Layout text**: `work/[PAPER_NAME]/layout/page_*.txt`
- **Config file**: `work/[PAPER_NAME]/config.json`
- **Segmentation task**: `work/[PAPER_NAME]/segment_task.md`

## Phase 1: Document Segmentation (IF NEEDED)

If `work/[PAPER_NAME]/structure.json` does NOT exist yet:

1. Confirm the header inventory exists — it is the ground truth for structure:
   ```bash
   wc -l work/[PAPER_NAME]/headers.tsv
   ```
   If it is missing, build it before doing anything else:
   ```bash
   ./scripts/extract_headers.sh work/[PAPER_NAME]
   ```

2. Read the segmentation task:
   ```
   work/[PAPER_NAME]/segment_task.md
   ```

3. Use the segment.md prompt with this input

4. Generate `structure.json` containing:
   - title, authors, total_pages
   - abstract (text + page range)
   - sections — **one entry per body row of `headers.tsv`**, with page ranges and
     hierarchy, no entry spanning more than 6 pages
   - references_start_page
   - appendix_start_page (if exists)

5. Save as: `work/[PAPER_NAME]/structure.json`

6. **Verify the structure before spending any tokens on Phase 3.** Compare the
   body-row count in `headers.tsv` against the section count in `structure.json`:

   ```bash
   echo "inventory: $(awk -F'\t' 'NR>1 && $2!="toc"' work/[PAPER_NAME]/headers.tsv | wc -l)"
   echo "structure: $(grep -c '"id"' work/[PAPER_NAME]/structure.json)"
   ```

   If structure has fewer entries than the inventory has body rows, re-run
   segmentation — do not proceed. Every missing entry is a section that will be
   absent from the final document. Finding this now costs one cheap re-run;
   finding it in Phase 6 costs the whole pipeline.

## Phase 2: Identify Processing Needs

Read `work/[PAPER_NAME]/structure.json` and identify:

- **Pages with tables**: Look at section contents, usually in Results/Tables section
- **Pages with figures**: Look for Figure mentions in structure
- **Equations in sections**: Check Methods, Model, Results sections
- **All sections**: For text cleaning task

Also read configuration (`work/[PAPER_NAME]/config.json` or create default):

```json
{
  "paper_name": "[PAPER_NAME]",
  "visual_interpretation": {
    "figures": "always|low_confidence|never",
    "tables": "always|complex|never"
  }
}
```

**Configuration defaults**:
- `visual_interpretation.figures`: "always" (interpret all figures visually)
- `visual_interpretation.tables`: "always" (verify all tables visually)

Note:
- You may need to sample several pages to find examples
- Create a checklist of which pages need processing
- Use config settings to determine which pages trigger visual interpretation

## Phase 3: Parallel Processing

Process the following in parallel (or sequentially based on context):

### 3a. Extract Tables (with optional visual verification)

For each page identified as containing tables:

1. Read layout text:
   ```
   work/[PAPER_NAME]/layout/page_N.txt
   ```

2. Use `prompts/extract_tables.md` with this input
   - Assesses `layout_complexity`
   - Sets `needs_visual_verification` flag
   - Save to: `work/[PAPER_NAME]/tables/page_N_extracted.json`

3. Check visual verification trigger:
   - If `config.visual_interpretation.tables == "always"`, OR
   - If `config.visual_interpretation.tables == "complex" AND needs_visual_verification == true`
   - Then proceed to step 4, else skip to step 5

4. Spawn visual verification subagent (IF triggered):
   - Use `prompts/visual_interpret_table.md`
   - Input: `pages/[PAPER_NAME]/page_N.pdf` (read as image)
   - Context: `work/[PAPER_NAME]/tables/page_N_extracted.json`
   - Save output to: `work/[PAPER_NAME]/tables/page_N_visual.json`

5. Merge outputs (if visual exists):
   - Read extracted JSON + visual JSON (if it exists)
   - For each table in extracted: add `visual_metadata` from visual JSON
   - Save final: `work/[PAPER_NAME]/tables/page_N.json`

Repeat for all pages with tables (typically pages 10-35).

### 3b. Describe Figures (with visual interpretation)

For each page with figures:

1. Read text:
   ```
   work/[PAPER_NAME]/text/page_N.txt
   ```

2. Use `prompts/describe_figures.md` with this input
   - Extracts captions, axes, legends
   - Sets `needs_visual_interpretation` flag
   - Save to: `work/[PAPER_NAME]/figures/page_N_text.json`

3. Check visual interpretation trigger:
   - If `config.visual_interpretation.figures == "always"`, OR
   - If `config.visual_interpretation.figures == "low_confidence" AND needs_visual_interpretation == true`
   - Then proceed to step 4, else skip to step 5

4. Spawn visual interpretation subagent (IF triggered):
   - Use `prompts/visual_interpret_figure.md`
   - Input: `pages/[PAPER_NAME]/page_N.pdf` (read as image)
   - Context: `work/[PAPER_NAME]/figures/page_N_text.json` (text extraction results)
   - Save output to: `work/[PAPER_NAME]/figures/page_N_visual.json`

5. Merge outputs (if visual exists):
   - Read text JSON + visual JSON (if it exists)
   - For each figure in text: add `visual_description` from visual JSON
   - Save final: `work/[PAPER_NAME]/figures/page_N.json`

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

**This is the step where content gets lost. Follow it exactly.**

Three rules, all load-bearing:

- **One cleaning unit per `structure.json` section entry.** Do not merge entries.
  Do not invent your own chunking scheme.
- **No unit may exceed 6 pages.** If an entry somehow spans more, split it and
  process each part separately.
- **Name each output file after the section `id`** so the mapping back to
  `structure.json` stays mechanical: `05.5_quantification.md`, not
  `05b_model_discussion_conclusion.md`.

> **Why these rules.** On MS AER-2026-1101 the orchestrator ignored
> `structure.json`'s entries and improvised its own chunks. It merged §5.4, §5.5
> and the Conclusion into one file called `05b_model_discussion_conclusion.md`,
> and merged Appendices B through H into one file called
> `13_appendix_proofs.md` covering nine dense pages. Section 5.5 disappeared from
> the first; Appendices G and H disappeared from the second. Ad-hoc merging is
> what converts a structure error into lost content, and it defeats every
> downstream check that works by comparing sections in to sections out.

For each section entry in `structure.json`:

1. Extract that entry's pages:
   ```bash
   for p in $(seq START END); do cat work/[PAPER_NAME]/text/page_$p.txt; done
   ```

2. Use `prompts/clean_text.md` with:
   - Section title (verbatim from `structure.json`)
   - Page range
   - Raw text

3. Save cleaned markdown to:
   ```
   work/[PAPER_NAME]/cleaned/[ID]_[slug].md
   ```

4. **Check the output is proportionate to the input.** Compare word counts:
   ```bash
   echo "in:  $(for p in $(seq START END); do cat work/[PAPER_NAME]/text/page_$p.txt; done | wc -w)"
   echo "out: $(wc -w < work/[PAPER_NAME]/cleaned/[ID]_[slug].md)"
   ```
   Cleaning removes page numbers and running heads, so expect output at roughly
   80–100% of input. **Below 70% means the cleaner summarised — re-run that unit,
   splitting it further if needed.** This single check would have caught both
   failures above: the appendix unit came back at well under half its input.

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

[If visual_description exists:]
**Description**: [visual_description from visual interpretation - full paragraph]

**Technical details**:
- X-axis: [axes.x]
- Y-axis: [axes.y]
- Legend: [legend items]

[Else: use existing text-only format]
Description: [Combined text from description.content and description.key_points]

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

## Phase 5.5: Coverage Gate (HARD, BLOCKING)

**Run this before Phase 6 and before showing the user anything. It is not
advisory and it is not optional.**

```bash
./scripts/verify_coverage.sh work/[PAPER_NAME] output/[PAPER_NAME].md
```

The gate makes two deterministic checks:

1. **Header coverage** — every body header in `headers.tsv` appears as a heading
   in the assembled markdown.
2. **Page coverage** — the section ranges in `structure.json` tile every page.

**If it exits non-zero, the parse is incomplete. Do not proceed to Phase 6, do
not copy anything to the calling directory, and do not tell the user the parse
succeeded.** Instead:

1. Read the list of missing headers. Each line gives a page number.
2. Re-run `clean_text.md` (Phase 3d) on those pages, in units of **at most 6
   pages**, saving to correctly-named files.
3. Re-assemble (Phase 5).
4. Re-run the gate. Repeat until it exits 0.

If a header is genuinely spurious — the extractor picked up a table caption — you
may record it in `output/[PAPER_NAME]_qa.json` under `accepted_gate_exceptions`
with a one-line justification, and proceed. **Verify it against the page first:**

```bash
grep -n "TITLE" work/[PAPER_NAME]/layout/page_N.txt
```

Confirming a real section is missing and then waving it through as an exception is
the one thing this gate exists to prevent. When in doubt, re-clean the pages.

> **Why this gate exists.** Every stage of the MS AER-2026-1101 parse reported
> success while the output was missing §5.5 (Quantification — the source of the
> paper's headline result), Appendix G, and Appendix H. The page text had been
> extracted correctly and was sitting unused in `layout/`. Nothing in the pipeline
> compared what went in against what came out, so a reader discovered the loss
> only by going looking for a result the paper's abstract advertised. The gate is
> that comparison, made mechanical.

## Phase 6: Quality Assurance

1. Collect statistics:
   - Total pages processed: [from config.json]
   - Sections found: [count]
   - Tables extracted: [count]
   - Figures described: [count]
   - Footnotes: [count]

2. Collect visual interpretation statistics (NEW):
   - Figures with visual descriptions: [count]
   - Figures with visual descriptions / Total figures: [percentage]
   - Tables with visual metadata: [count]
   - Cost estimate increase: $[amount] (visual interpretation adds ~$0.11 per paper)

3. Use `prompts/qa_check.md` with the assembled markdown

3. Save QA report to:
   ```
   output/[PAPER_NAME]_qa.json
   ```

4. Review QA report for any issues:
   - Missing footnote references
   - Broken table/figure references
   - Section hierarchy issues

## Phase 7: Findings Summary

Generate a structured summary of all tables and key quantitative findings. Skip this phase only if the user invoked with `--no-summary`.

1. Use `prompts/findings_summary.md` with:
   - Assembled markdown: `output/[PAPER_NAME].md`
   - Document structure: `work/[PAPER_NAME]/structure.json`

2. Save findings summary to:
   ```
   output/[PAPER_NAME]_findings.md
   ```

The findings summary contains:
- Table-by-table inventory (what each table shows, key estimates)
- Key quantitative findings (5-10 most important numerical results)
- Notes for future agents pointing to relevant files

## Phase 8: Copy Output to Calling Directory

**Precondition: Phase 5.5's coverage gate exited 0.** If it did not, go back and
fix the parse. Copying an incomplete document into the user's working directory is
how a silent extraction failure becomes a downstream analysis error — a referee
report was written against a copy of this output that was missing the paper's
headline result.

Re-run the gate now if you are not certain it passed:

```bash
./scripts/verify_coverage.sh work/[PAPER_NAME] output/[PAPER_NAME].md || echo "DO NOT COPY"
```

Copy the final output files back to `CALLING_DIR` (captured at setup) so the user has them in the directory where they invoked the skill:

```bash
cp output/[PAPER_NAME].md "$CALLING_DIR/[PAPER_NAME].md"
cp output/[PAPER_NAME]_findings.md "$CALLING_DIR/[PAPER_NAME]_findings.md" 2>/dev/null || true
```

Then tell the user:
> Output saved to:
> - `[CALLING_DIR]/[PAPER_NAME].md`
> - `[CALLING_DIR]/[PAPER_NAME]_findings.md` (if generated)

Skip the QA JSON — it's a debug artifact, not useful to the user.

---

## What To Do Next

Based on the QA report:

- **If QA passes**: Document is complete!
  - Final markdown: `output/[PAPER_NAME].md`
  - QA report: `output/[PAPER_NAME]_qa.json`
  - Findings summary: `output/[PAPER_NAME]_findings.md`

- **If QA fails**: Fix indicated issues:
  - Missing footnotes: Add to cleaned sections
  - Broken references: Check table/figure numbers
  - Bad hierarchy: Adjust markdown heading levels

## Output Summary

After completing all phases, you should have:

```
output/
├── [PAPER_NAME].md             ← Final markdown document
├── [PAPER_NAME]_qa.json        ← Quality assurance report
└── [PAPER_NAME]_findings.md    ← Table inventory and key quantitative findings

work/[PAPER_NAME]/
├── headers.tsv               ← Deterministic header inventory (structure ground truth)
├── structure.json            ← Document structure (must cover every headers.tsv row)
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
   - For tables, figures and equations: don't stop, continue with other
     components, note the failure, and let QA flag it
   - **For text cleaning and the Phase 5.5 coverage gate: stop and fix.** These
     govern whether the document is complete. "Continue and let QA flag it" is how
     three sections were lost on MS AER-2026-1101 — QA passed anyway, because it
     had no mechanical coverage check at the time

6. **Context Length**:
   - If paper > 50 pages, process in sections (e.g., intro, methods, results)
   - If document is very long, you may need to split processing across multiple Claude calls

## Quick Reference

| Phase | Prompt | Input | Output |
|-------|--------|-------|--------|
| 0 | `scripts/extract_headers.sh` | layout/page_*.txt | headers.tsv |
| 1 | segment.md | segment_task.md + headers.tsv | structure.json |
| 3a | extract_tables.md | layout/page_N.txt | tables/page_N_extracted.json |
| 3a-v | visual_interpret_table.md | pages/[PAPER]/page_N.pdf | tables/page_N_visual.json |
| 3b | describe_figures.md | text/page_N.txt | figures/page_N_text.json |
| 3b-v | visual_interpret_figure.md | pages/[PAPER]/page_N.pdf | figures/page_N_visual.json |
| 3c | convert_equations.md | text/page_N.txt | equations/section_N.json |
| 3d | clean_text.md | text/page_*.txt | cleaned/SECTION.md |
| 4 | validate_tables.md | tables + context | validation/table_N.json |
| 5.5 | `scripts/verify_coverage.sh` (blocking) | headers.tsv + assembled md | exit 0/1 |
| 6 | qa_check.md | assembled markdown | output/*_qa.json |
| 7 | findings_summary.md | output/[PAPER].md | output/*_findings.md |

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

7. Run findings_summary.md to generate table inventory and key results

Output: output/buchak_2018.md + output/buchak_2018_findings.md
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
