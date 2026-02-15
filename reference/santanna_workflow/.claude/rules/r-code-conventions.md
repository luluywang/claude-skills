# R Code Standards

## Reproducibility
- All packages loaded at top via `library()` (not `require()`)
- Single `set.seed()` call at script top (YYYYMMDD format)
- Relative paths only
- Explicit `dir.create()` calls

## Function Standards
- snake_case naming with verb-noun patterns
- Roxygen documentation
- Parameterized magic numbers
- Named return structures (lists or tibbles)

## Visual Consistency
- Institutional color palette (customize: primary, accent, etc.)
- Custom minimal ggplot2 theme
- Transparent backgrounds for Beamer (`bg = "transparent"`)
- Standardized dimensions in `ggsave()`
- base_size >= 14 for readability
- Sentence-case axis labels with units

## Computational Efficiency
- RDS serialization for expensive operations
- Slides load precomputed results rather than recalculating

## Line Length Exception
Lines > 100 chars permitted for mathematical formulas where breaking would compromise readability. Requires inline comment explaining the operation.

## Quality Checklist
1. Packages organized at top
2. set.seed() present for stochastic code
3. No absolute paths
4. Functions documented
5. Figures use consistent theme
6. RDS files saved for expensive computations
7. Relative paths throughout
8. Figure dimensions specified
