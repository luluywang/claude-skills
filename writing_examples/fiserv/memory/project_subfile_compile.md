---
name: Always compile appendix subfiles standalone
description: When editing a subfile appendix (e.g. appendix_endogenous_choice.tex, appendix_theory.tex), compile it on its own via pdflatex on the subfile, not by building main.tex
type: feedback
---

When editing any subfile in `draft_202511/` (files starting with `\documentclass[main.tex]{subfiles}`), verify changes by compiling the subfile standalone:

```
cd draft_202511 && pdflatex -interaction=nonstopmode <subfile>.tex
```

Do not compile `main.tex` to check edits to a single appendix — build the subfile directly.

**Why:** the user explicitly asked for this workflow ("Always compile to its own document"). Building main.tex is slow and produces a huge PDF; the subfile PDF is the right unit for iterating on a single appendix.

**How to apply:** default to subfile-only compile after any edit to an appendix subfile. Cross-reference and citation warnings to labels defined in other subfiles (e.g. `thm:sufficient-stat`, `lem:price-mapping`) are expected when compiling in isolation — do not report them as errors. Only flag LaTeX compile errors and undefined references to labels defined within the same subfile.
