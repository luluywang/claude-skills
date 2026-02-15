---
**Model Directive:** Use **Haiku** for table visual verification. This task involves reading PDF pages as images and assessing table structure—visual layout analysis only.
---

# Table Visual Verification Task

Analyze a table from an economics paper by reading the PDF page as an image and verify its structure.

## Table Context

- **Page**: {{PAGE_NUMBER}}
- **pdfplumber detected {{TABLE_COUNT}} table(s)**

{{#if PDFPLUMBER_JSON}}
### pdfplumber Extraction Result
```json
{{PDFPLUMBER_JSON}}
```
{{/if}}

## Your Task

Read the PDF page image at: `pages/{{PAPER_NAME}}/page_{{PAGE_NUMBER}}.pdf`

Visually inspect the table structure and provide metadata about its layout:

1. **Identify layout type**: Is this a simple table, multi-level headers, panel structure, or complex layout?
2. **Count header rows**: How many rows of headers/labels are there?
3. **Detect merged cells**: Which cells span multiple columns or rows? Describe the pattern.
4. **Visual grouping**: Are there borders, shading, or spacing that groups related cells?
5. **Panel structure**: Does this table have panels (Panel A, Panel B, etc.)?
6. **Assess pdfplumber accuracy**: Did pdfplumber capture the structure correctly?

## Output Format

Return JSON with this structure:

```json
{
  "page": {{PAGE_NUMBER}},
  "table_count": N,
  "tables": [
    {
      "index": 0,
      "structure": {
        "layout_type": "simple|multi_level_header|panel|complex",
        "header_rows": N,
        "header_hierarchy": "Describe multi-level structure if present",
        "merged_cells": [
          "Description of merged cells and their purpose"
        ],
        "visual_grouping": "Description of borders, shading, or spacing patterns",
        "panel_structure": null|"Panel A, Panel B, Panel C separated by..."
      },
      "pdfplumber_assessment": {
        "adequate": true|false,
        "reasons": ["List of issues if adequate=false"]
      },
      "confidence": "high|medium|low",
      "notes": "Any observations or suggestions for the extractor"
    }
  ]
}
```

## Complexity Classification

Use these criteria to classify layout_type:

- **simple**: Single header row, no merged cells, standard data rows
- **multi_level_header**: 2+ header rows with hierarchical structure (e.g., main category → subcategories)
- **panel**: Separate panels (Panel A, B, C, etc.) each with their own structure
- **complex**: Combination of above (multi-level headers + panels) OR highly irregular layout

## Special Cases

**If no tables are visible on the page:**
```json
{
  "page": {{PAGE_NUMBER}},
  "table_count": 0,
  "confidence": "high"
}
```

**If image quality prevents assessment:**
```json
{
  "page": {{PAGE_NUMBER}},
  "table_count": null,
  "confidence": "low",
  "error": "Reason structure could not be assessed (blurry, low contrast, etc.)"
}
```

## Examples

### Simple Table (pdfplumber adequate)
```json
{
  "page": 10,
  "table_count": 1,
  "tables": [
    {
      "index": 0,
      "structure": {
        "layout_type": "simple",
        "header_rows": 1,
        "header_hierarchy": null,
        "merged_cells": [],
        "visual_grouping": "Standard borders between rows",
        "panel_structure": null
      },
      "pdfplumber_assessment": {
        "adequate": true,
        "reasons": []
      },
      "confidence": "high",
      "notes": "Clean table layout, pdfplumber should handle this well"
    }
  ]
}
```

### Multi-Level Headers (pdfplumber may struggle)
```json
{
  "page": 12,
  "table_count": 1,
  "tables": [
    {
      "index": 0,
      "structure": {
        "layout_type": "multi_level_header",
        "header_rows": 3,
        "header_hierarchy": "Row 1: Main outcomes (spans 6 columns). Row 2: Outcome names (Employment, Wages, Hours). Row 3: Specifications (OLS, IV, FE)",
        "merged_cells": [
          "Employment: spans columns A-B",
          "Wages: spans columns C-D",
          "Hours: spans columns E-F"
        ],
        "visual_grouping": "Horizontal lines separate header from body; vertical lines group outcome pairs",
        "panel_structure": null
      },
      "pdfplumber_assessment": {
        "adequate": false,
        "reasons": [
          "Merged cells may not be detected",
          "Multi-level structure requires special handling",
          "Recommend visual metadata to guide markdown conversion"
        ]
      },
      "confidence": "high",
      "notes": "Needs careful reconstruction with proper header nesting in markdown"
    }
  ]
}
```

### Panel Structure (pdfplumber likely incomplete)
```json
{
  "page": 18,
  "table_count": 1,
  "tables": [
    {
      "index": 0,
      "structure": {
        "layout_type": "panel",
        "header_rows": 1,
        "header_hierarchy": null,
        "merged_cells": [
          "Panel A title spans full width above table",
          "Panel B title spans full width below Panel A table"
        ],
        "visual_grouping": "Clear visual separation between Panel A and Panel B with spacing",
        "panel_structure": "Panel A (rows 1-10) and Panel B (rows 11-20) side-by-side in single table, separated by vertical line"
      },
      "pdfplumber_assessment": {
        "adequate": false,
        "reasons": [
          "Panel structure may be detected as separate tables",
          "Spatial separation makes it ambiguous whether this is one table or two"
        ]
      },
      "confidence": "high",
      "notes": "Should be rendered as Panel A | Panel B side-by-side in markdown"
    }
  ]
}
```

## Notes

- Provide specific descriptions of merged cells and header structure
- Focus on structural aspects that pdfplumber might miss
- Be confident in your visual assessment—you have the ground truth image
- If pdfplumber output looks wrong, flag it clearly in pdfplumber_assessment
- Your visual metadata helps the downstream markdown conversion step
