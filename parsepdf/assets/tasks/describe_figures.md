---
**Model Directive:** Use **Haiku** for figure descriptions. This task involves caption extraction and basic visual element annotation—pattern matching only.
---

# Figure Description Task

Create text descriptions of figures for accessibility and reference.

## Current Page
Page {{PAGE_NUMBER}}

## Figure Region Text
```
{{FIGURE_TEXT}}
```

## Tasks
1. **Identify the figure**:
   - Figure number
   - Title/caption
   - Type (graph, chart, diagram, map)

2. **Describe visual elements**:
   - Axes labels (X and Y)
   - Variables plotted
   - Legend items
   - Trends or patterns shown

3. **Extract key insights**:
   - Main relationship shown
   - Notable data points
   - Statistical significance indicators

4. **Assessment**:
   - Can this be fully described in text? (confidence: high/medium/low)
   - Does it need manual review?

5. **Flag for visual interpretation** (NEW):
   - Set `needs_visual_interpretation: true` if:
     - Confidence is medium or low
     - Figure is multi-panel and complex structure isn't obvious from text
     - Figure shows spatial relationships that are hard to convey in text (scatter, clustering)
     - Otherwise set to `false`

## Output Format
```json
{
  "figure_number": "1",
  "page": {{PAGE_NUMBER}},
  "title": "Figure 1: Relationship between X and Y",
  "type": "scatter_plot",
  "description": {
    "axes": {
      "x": "Years of Education",
      "y": "Log Wages"
    },
    "legend": ["Treatment", "Control"],
    "content": "Scatter plot showing positive correlation between education and wages",
    "key_points": [
      "Upward sloping trend",
      "Steeper slope after 12 years",
      "95% confidence interval shown as shaded area"
    ]
  },
  "confidence": "high",
  "needs_review": false,
  "needs_visual_interpretation": false,
  "visual_description": null,
  "pdf_reference": "page_{{PAGE_NUMBER}}.pdf"
}
```

**New Fields**:
- `needs_visual_interpretation`: Set to `true` if confidence is low/medium OR if text extraction alone cannot fully capture the figure
- `visual_description`: Initially null; will be populated by visual interpretation subagent (if triggered)

## If Description is Uncertain
Mark as:
```json
{
  "figure_number": "1",
  "page": {{PAGE_NUMBER}},
  "title": "Figure description unclear",
  "needs_review": true,
  "reason": "Complex mathematical diagram",
  "partial_description": "What can be determined...",
  "confidence": "low",
  "pdf_reference": "page_{{PAGE_NUMBER}}.pdf"
}
```

## Notes
- If no figures found on this page, return `{"page": {{PAGE_NUMBER}}, "figures": []}`
- Complex diagrams may have low confidence - that's okay
