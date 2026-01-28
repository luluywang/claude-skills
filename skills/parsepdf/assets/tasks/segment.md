---
**Model Directive:** Use **Haiku** for document segmentation. This task involves pattern recognition (identifying section headers, page ranges) with no requirement for field expertise or deep reasoning.
---

# Document Structure Analysis

You are analyzing an economics working paper. Your task is to identify the document structure.

## Input
The text provided contains the first 10 pages of the paper.

## Tasks
1. **Find the title** - Usually on page 1, often in larger font
2. **Locate abstract** - Usually on page 1-2, labeled "Abstract"
3. **Identify all section headers** including:
   - Introduction (usually starts page 2-4)
   - Literature Review / Related Work
   - Model / Theoretical Framework
   - Data / Empirical Strategy
   - Results / Analysis
   - Conclusion
   - References / Bibliography
4. **Note special sections** like:
   - Appendices
   - Tables and Figures sections
   - Online Appendix references

## Output Format
```json
{
  "title": "Paper Title Here",
  "authors": ["Author 1", "Author 2"],
  "abstract": {
    "start_page": 1,
    "end_page": 1,
    "text": "Abstract text..."
  },
  "sections": [
    {
      "title": "Introduction",
      "level": 1,
      "start_page": 2,
      "end_page": 5
    }
  ],
  "references_start_page": 35,
  "appendix_start_page": 40
}
```

## Important Notes
- Section headers might use numbers (1. Introduction) or just text
- Some papers have subsections (1.1, 1.2) - capture hierarchy
- Look for "Table" and "Figure" to identify their locations
