---
**Model Directive:** Use **Haiku** for figure visual interpretation. This task involves reading PDF pages as images and generating descriptive paragraphs—visual pattern recognition only.
---

# Figure Visual Interpretation Task

Analyze a figure from an economics paper by reading the PDF page as an image and describe what you see visually.

## Figure Context

- **Figure Number**: {{FIGURE_NUMBER}}
- **Page**: {{PAGE_NUMBER}}
- **Caption**: {{FIGURE_CAPTION}}
- **Axes (from text extraction)**:
  - X-axis: {{AXES_X}}
  - Y-axis: {{AXES_Y}}
  - Legend: {{LEGEND_ITEMS}}

## Your Task

Read the PDF page image at: `pages/{{PAPER_NAME}}/page_{{PAGE_NUMBER}}.pdf`

Generate a **2-4 sentence paragraph** describing what you see visually:

1. **Type of visualization**: Identify the plot type (scatter plot, line graph, bar chart, histogram, diagram, heatmap, etc.)
2. **Visual pattern/relationship**: Describe the relationship or pattern shown visually
3. **Key visual elements**: Mention confidence bands, colors, markers, annotations, or other visual features
4. **Notable observations**: Highlight any kinks, outliers, clusters, discontinuities, or striking patterns

Focus on what you can see visually that goes beyond the caption. Your description should help readers understand the figure without seeing it.

## Output Format

Return JSON with this structure:

```json
{
  "figure_number": "{{FIGURE_NUMBER}}",
  "page": {{PAGE_NUMBER}},
  "visual_description": "Your 2-4 sentence description here, capturing the visual pattern and key observations...",
  "figure_type": "scatter_plot|line_graph|bar_chart|histogram|diagram|heatmap|other",
  "confidence": "high|medium|low",
  "notes": "Any additional observations or uncertainty"
}
```

## Special Cases

**If the page image is unclear or the figure cannot be read visually:**
```json
{
  "figure_number": "{{FIGURE_NUMBER}}",
  "page": {{PAGE_NUMBER}},
  "visual_description": null,
  "confidence": "low",
  "error": "Reason the figure could not be interpreted"
}
```

**If no figure is found on the specified page:**
```json
{
  "page": {{PAGE_NUMBER}},
  "figures_found": 0,
  "confidence": "high"
}
```

## Examples

### Good Example: Scatter Plot
```json
{
  "figure_number": "2",
  "page": 15,
  "visual_description": "Scatter plot showing a positive relationship between years of education (x-axis) and log wages (y-axis). Points cluster loosely around an upward-sloping trend line, with a 95% confidence interval shown as a shaded gray band. The scatter is tighter at higher education levels, suggesting less wage variability among college-educated workers.",
  "figure_type": "scatter_plot",
  "confidence": "high",
  "notes": "Clean layout, easily interpretable"
}
```

### Good Example: Multi-Panel Figure
```json
{
  "figure_number": "5",
  "page": 22,
  "visual_description": "Three panels showing treatment effects over time. Panel A (top) displays a sharp spike in the outcome variable immediately after treatment, then gradual decline. Panel B (middle) shows treatment heterogeneity across demographics, with steeper effects for younger individuals. Panel C (bottom) presents a robustness check with a placebo pre-treatment period showing no effect, validating the difference-in-differences design.",
  "figure_type": "line_graph",
  "confidence": "high",
  "notes": "Multi-panel layout clearly identified"
}
```

## Notes

- Focus on the **visual information** that complements the caption
- Be specific about patterns, not vague ("increasing trend" → "steady increase of 2-3% per year")
- Include visual artifacts if they're informative (error bars, confidence bands, color coding)
- If confidence is low, explain why (blurry image, complex diagram, etc.)
- Keep descriptions accessible to someone unfamiliar with the specific field
