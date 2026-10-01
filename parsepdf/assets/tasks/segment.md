---
**Model Directive:** Use **Haiku** for document segmentation. This task involves pattern recognition (identifying section headers, page ranges) with no requirement for field expertise or deep reasoning.
---

# Document Structure Analysis

Produce `structure.json` for an economics working paper.

## Input

`work/[PAPER_NAME]/segment_task.md`, which contains:

1. **An authoritative header inventory** (`headers.tsv`) extracted deterministically
   from **every page** of the PDF by `scripts/extract_headers.sh`. Columns:
   `page`, `kind`, `label`, `title`. Rows with `kind=toc` come from a
   table-of-contents page and serve as a cross-check on the body rows.
2. **A short prose sample** of the front matter — use it for title, authors and
   abstract only.
3. **The total page count.**

## The one rule that matters

**Your `sections` list must contain one entry for every body row of the inventory
(every row whose `kind` is not `toc`). Never omit one. Never invent one.**

If a row looks wrong — a mis-parsed title, a header that seems to be a table
caption — keep it and add a `"note"` field explaining your doubt. Downstream
steps read `structure.json` to decide what text to process, so a section you drop
here is content that will be missing from the final document with no error raised
anywhere.

> **This is not a hypothetical.** On MS AER-2026-1101 the segmenter was shown the
> line `5.5  Quantification` and left it out of `structure.json` anyway, then
> extended section 5.4's range to cover 5.5's pages. The cleaner was told it was
> cleaning 5.4, so it dropped 5.5 — including the paper's headline quantitative
> result — and the parse was reported as successful. The same run collapsed a
> 27-page internet appendix into one section and lost Appendices G and H. The
> inventory exists so that structure is read off the document, not recalled from
> a prose sample.

Do not consult the introduction's roadmap paragraph ("Section 2 describes…") for
the section list. It names sections but not subsections, and it is written in
prose that invites paraphrase — that roadmap is how a section title became
"Data and Institutional Setting" when the paper's actual header reads
"Institutional Setting and Data". Take titles verbatim from the inventory.

## Page-range rules

These are checked mechanically by `scripts/verify_coverage.sh`, which blocks
delivery when they fail.

1. **Total coverage.** Every page from 1 to `total_pages` must fall inside at
   least one section's `[start_page, end_page]`. That means explicit entries for
   front matter, references, standalone figure blocks, standalone table blocks,
   and every appendix. A page in no range is a page no cleaning step will read.
2. **Start pages come from the inventory.** A section starts on the page its
   header appears on. Never shift a start page earlier to paper over a section
   you left out.
3. **Nesting.** A level-1 section's `end_page` is one before the next level-1
   section's `start_page`. Subsections nest within their parent and may share
   pages with it and with each other.
4. **Six-page cap.** No section entry may span more than 6 pages. Split anything
   longer into `"5-part1"`, `"5-part2"`, … of at most 6 pages each, each with a
   descriptive title. This cap is the structural fix for the 27-page-unit failure
   described above: cleaning quality degrades with input length, and the
   degradation is silent.

## Output Format

```json
{
  "title": "Paper Title Here",
  "authors": ["Author 1", "Author 2"],
  "total_pages": 81,
  "abstract": { "start_page": 5, "end_page": 5, "text": "Abstract text..." },
  "sections": [
    { "id": "front",   "title": "Front Matter",  "level": 1, "start_page": 1,  "end_page": 4 },
    { "id": "1",       "title": "Introduction",  "level": 1, "start_page": 6,  "end_page": 11 },
    { "id": "5",       "title": "Model",         "level": 1, "start_page": 24, "end_page": 29 },
    { "id": "5-part2", "title": "Model (cont.)", "level": 1, "start_page": 30, "end_page": 35 },
    { "id": "5.5",     "title": "Quantification","level": 2, "start_page": 37, "end_page": 38 },
    { "id": "G",       "title": "Numerical Simulation", "level": 1, "start_page": 76, "end_page": 79 }
  ],
  "references_start_page": 40,
  "appendix_start_page": 55
}
```

Return ONLY valid JSON, no other text.

## Self-check before returning

- [ ] Count the body rows in the inventory. Count your `sections` entries with a
      matching `id`. The first number must not exceed the second.
- [ ] Sort your sections by `start_page` and walk 1..`total_pages`: no gaps.
- [ ] No entry spans more than 6 pages.
- [ ] Every title is verbatim from the inventory, not paraphrased.

## Notes

- The inventory's `label` column is the natural `id`: `1`, `5.5`, `A2`, `G`, `IV`.
- Roman-numeral labels (`I`, `IV`) are used by finance and Management Science
  house styles; treat them as level-1 sections.
- If the inventory has very few rows, the paper likely uses a heading style the
  extractor does not recognise. Say so in a `"warning"` field, and derive the
  structure by reading `work/[PAPER_NAME]/layout/page_*.txt` directly rather than
  guessing from the prose sample.
