# /slide-excellence [file] -- Multi-Agent Slide Review

Comprehensive multi-dimensional review orchestrating 6 parallel agents.

## Parallel Review Agents
1. **Visual Audit** -- layout, overflow, font consistency, spacing, imagery
2. **Pedagogical Review** -- 13 teaching patterns, narrative flow, pacing, notation
3. **Proofreading** -- grammar, typos, citation format, academic language
4. **TikZ Review** (conditional) -- diagram labels, geometry, visual semantics
5. **Content Parity** (conditional for QMD) -- frame counts, content alignment vs TEX
6. **Substance Review** (optional for TEX) -- domain-specific correctness

## Output
Each agent -> independent report in `quality_reports/` with dimension-specific filenames.
Synthesized summary consolidates findings with severity categorization.

## Quality Scale
| Tier | Critical Issues | Medium Issues |
|------|----------------|---------------|
| Excellent | 0-2 | 0-5 |
| Good | 3-5 | 6-15 |
| Needs Work | 6-10 | 16-30 |
| Poor | 11+ | 31+ |
