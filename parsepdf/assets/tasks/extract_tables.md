---
**Model Directive:** Use **Haiku** for table extraction. This task involves parsing JSON and converting structured data to markdown—no field expertise needed.
---

# Table Extraction Task

You are extracting and converting tables from an economics paper.

## Current Page
Page {{PAGE_NUMBER}} of {{TOTAL_PAGES}}

## Structured Table Data (from pdfplumber)
{{#if PDFPLUMBER_JSON}}
```json
{{PDFPLUMBER_JSON}}
```
{{else}}
No structured table data available for this page.
{{/if}}

## Layout-Preserved Text (for verification/fallback)
```
{{LAYOUT_TEXT}}
```

## Complexity Assessment (NEW)

Before extracting, assess layout complexity:

- **Simple**: Single header row, no merged cells, standard data layout
- **Moderate**: 2-3 header rows OR some merged cells OR clear data grouping
- **High**: Multi-level headers (3+ rows) OR complex merged cell patterns OR panel structure (Panel A/B/C) OR pdfplumber found 0 tables but layout text clearly contains table data

**Examples**:
- High complexity: "Panel A:", "Panel B:" detected, OR table titles suggest multi-panel structure
- High complexity: Text shows repeated patterns like "Specification (1)", "Specification (2)" → suggests multi-level header structure
- Moderate complexity: Phrases like "Robustness check:" indicate data grouping within single table

## Tasks

### If pdfplumber data is available (tables_found > 0):
1. **Use structured data as primary source**
   - Convert each table to clean markdown format
   - Verify key values against layout text if anything looks incorrect

2. **Identify table type** (should match pdfplumber classification):
   - `regression`: Coefficients, standard errors, significance stars, R², N
   - `summary_statistics`: Mean, std dev, min, max, percentiles
   - `correlation_matrix`: Symmetric matrix with 1.00 on diagonal
   - `data_table`: Other structured data

3. **Clean and format**:
   - Align columns properly in markdown
   - Preserve significance stars (*, **, ***)
   - Keep parentheses for standard errors
   - Extract table title from surrounding text or header

4. **Handle multi-page tables**:
   - If `continues_from_page` is set, this is a continuation
   - If `continues_to_page` is set, table continues on next page
   - Note this in the output

### If no pdfplumber data (fallback):
1. **Identify tables** from layout text
   - Look for "Table X:" labels
   - Look for column headers with data below
   - Multi-column numerical data arrangements

2. **Extract manually** following the same formatting rules

## Output Format
```json
{
  "page": {{PAGE_NUMBER}},
  "tables": [
    {
      "number": "1",
      "title": "Summary Statistics",
      "type": "summary_statistics",
      "markdown": "| Variable | Mean | Std Dev |\n|----------|------|---------|\n| Income | 45,231 | 32,145 |",
      "key_values": {
        "sample_size": "10,432",
        "mean_income": "45,231",
        "r_squared": "0.34"
      },
      "notes": "Standard errors in parentheses. *** p<0.01",
      "source": "pdfplumber",
      "continues_from_page": null,
      "continues_to_page": null,
      "layout_complexity": "simple|moderate|high",
      "needs_visual_verification": false,
      "visual_metadata": null
    }
  ]
}
```

**New Fields**:
- `layout_complexity`: Set based on complexity assessment above
- `needs_visual_verification`: Set to `true` if:
  - `layout_complexity` is "high"
  - OR pdfplumber found 0 tables but layout text suggests tables exist
  - Otherwise `false`
- `visual_metadata`: Initially null; will be populated by visual verification subagent (if triggered)

## Conversion Rules
- Use pipe tables: `| Col1 | Col2 |`
- Align numbers properly (right-align numeric columns)
- Keep footnote markers (*, **, ***, †, etc.)
- Preserve parentheses for standard errors
- Set `"source": "pdfplumber"` or `"source": "layout_text"`
- If no tables found, return `{"page": {{PAGE_NUMBER}}, "tables": []}`
