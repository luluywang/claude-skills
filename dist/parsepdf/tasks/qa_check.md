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

### 4. Missing Content
Check page coverage - any pages not represented in output?

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
    "pages_processed": 45,
    "pages_total": 45,
    "completeness": "100%"
  }
}
```

## Notes
- qa_status should be "pass" if no critical issues, "fail" if there are missing/broken references
- Warnings are helpful feedback but don't block output
- Coverage should be as close to 100% as possible
