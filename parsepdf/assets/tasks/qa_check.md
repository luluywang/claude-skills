---
**Model Directive:** Use **Haiku** for QA checks. This task involves structure verification and mechanical validation—no domain reasoning needed.
---

# Quality Assurance Check

Perform final validation of the assembled markdown document.

## Document Stats
- Total pages processed: {{TOTAL_PAGES}}
- Sections found: {{NUM_SECTIONS}}
- Tables extracted: {{NUM_TABLES}}
- Figures described: {{NUM_FIGURES}}
- Footnotes: {{NUM_FOOTNOTES}}

## Checks to Perform

### 1. Footnote Completeness
Check that every [^N] reference has a corresponding definition.

```
{{FOOTNOTE_SECTION}}
```

### 2. Structure Validation
Verify heading hierarchy (# → ## → ### → ####)

```
{{HEADING_LIST}}
```

### 3. Table/Figure References
Confirm all "(Table N)" and "(Figure N)" references are valid.

### 4. Missing Content (CRITICAL — this is a fail condition, not a warning)

Content completeness is checked mechanically by `scripts/verify_coverage.sh` in
Phase 5.5, which must already have exited 0 before you run. Your job here is to
confirm that and to catch anything it cannot see.

Paste the gate's result into `coverage.gate` below. Then check, against
`work/[PAPER_NAME]/headers.tsv`:

- Does every body header in the inventory appear as a heading in the output?
- Does any section's rendered text look truncated — ending mid-sentence, ending
  immediately after its heading, or conspicuously shorter than its page range
  implies?
- Are there placeholder or elision markers anywhere in the output
  (`[remaining text omitted]`, `[see original]`, a bare `...`)?

**Any missing header, any truncated section, and any placeholder marker is
`qa_status: "fail"`.** Missing content is the most consequential defect this
pipeline can produce and the hardest for a reader to notice: a parse that loses a
section still looks like a complete paper. It is strictly worse than a broken
table reference, which is visible on sight.

## Output Format
```json
{
  "qa_status": "pass|fail",
  "issues": [
    {
      "type": "missing_footnote",
      "details": "Footnote [^7] referenced but not defined"
    }
  ],
  "warnings": [
    {
      "type": "figure_needs_review",
      "details": "Figures 3, 5, 8 flagged for manual review",
      "pdf_pages": [15, 22, 31]
    }
  ],
  "coverage": {
    "gate": "pass",
    "gate_command": "./scripts/verify_coverage.sh work/[PAPER_NAME] output/[PAPER_NAME].md",
    "inventory_headers": 39,
    "headers_present_in_output": 39,
    "missing_headers": [],
    "pages_processed": 81,
    "pages_total": 81,
    "completeness": "100%"
  },
  "accepted_gate_exceptions": []
}
```

## Notes
- `qa_status` is "fail" if there are missing/broken references, **or if any
  content is missing**: a header from `headers.tsv` absent from the output, a
  truncated section, or a placeholder marker
- Warnings are helpful feedback and don't block output
- **Coverage must be 100%, not "as close as possible".** An earlier version of
  this prompt asked for coverage "as close to 100% as possible" and made
  `qa_status` depend only on references. A parse that had silently dropped three
  sections — including the source of its paper's headline result — passed QA
  cleanly. Coverage is now pass/fail
- If `coverage.gate` is anything other than "pass", `qa_status` is "fail",
  regardless of what else looks fine
- `accepted_gate_exceptions` is for headers the extractor picked up in error (a
  table caption, say). Each entry needs the header text and a one-line
  justification checked against `layout/page_N.txt`. Never use it for a section
  you confirmed is real and missing
