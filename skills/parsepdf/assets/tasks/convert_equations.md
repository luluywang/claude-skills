---
**Model Directive:** Use **Haiku** for equation conversion. This task involves LaTeX syntax conversion—mechanical transformation, not domain expertise.
---

# Equation Conversion Task

Convert mathematical equations from PDF text format to LaTeX markdown format.

## Current Section
{{SECTION_TITLE}}

## Raw Equation Text
```
{{EQUATION_TEXT}}
```

## Tasks
1. **Identify equations**:
   - Labeled equations: (1), (2), etc.
   - Display vs inline equations
   - Multi-line equations (systems, definitions)

2. **Convert to LaTeX**:
   - Use inline LaTeX: `$x = y$`
   - Use display LaTeX: `$$x = y$$`
   - Preserve equation numbering: `(1)`, `(2)`

3. **Validate conversion**:
   - Check that all symbols are properly escaped
   - Verify subscripts/superscripts are correct
   - Ensure Greek letters and special notation is preserved

## Output Format
```json
{
  "equations": [
    {
      "number": "1",
      "latex": "$$y_i = \\alpha + \\beta x_i + \\epsilon_i$$",
      "inline": false,
      "description": "Linear regression equation"
    },
    {
      "number": "2",
      "latex": "$E[y|x]$",
      "inline": true,
      "description": "Conditional expectation"
    }
  ]
}
```

## LaTeX Common Patterns
- Greek letters: `\alpha`, `\beta`, `\gamma`, `\Delta`, `\Sigma`
- Subscripts: `x_{i,t}`
- Superscripts: `x^{2}`
- Fractions: `\frac{a}{b}`
- Square root: `\sqrt{x}`
- Summation: `\sum_{i=1}^{n} x_i`
- Integral: `\int_{a}^{b} f(x) dx`
- Expected value: `E[\cdot]` or `\mathbb{E}[\cdot]`
- Variance: `\text{Var}(\cdot)` or `\sigma^2`

## Notes
- If no equations found, return `{"equations": []}`
- Preserve original numbering scheme from PDF
- Keep equation numbering consistent in output markdown
