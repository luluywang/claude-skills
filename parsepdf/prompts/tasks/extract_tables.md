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
      "continues_to_page": null
    }
  ]
}
```

## Conversion Rules
- Use pipe tables: `| Col1 | Col2 |`
- Align numbers properly (right-align numeric columns)
- Keep footnote markers (*, **, ***, †, etc.)
- Preserve parentheses for standard errors
- Set `"source": "pdfplumber"` or `"source": "layout_text"`
- If no tables found, return `{"page": {{PAGE_NUMBER}}, "tables": []}`
