# User Preferences

This file accumulates your preferences from past projects. The long-running agent reads this before each interview to provide better defaults and ask fewer questions.

---

## Data Handling

<!-- Example entries:
- Always winsorize continuous variables at 1/99 unless specified
- Prefer parquet for intermediate files, dta for final analysis files
- Drop observations with missing key variables rather than imputing
-->

## Estimation Defaults

<!-- Example entries:
- Cluster standard errors at the highest level of treatment variation
- Prefer Callaway-Sant'Anna over Sun-Abraham for staggered DiD
- For IV, always report first-stage F-stat
-->

## Coding Style

<!-- Example entries:
- Use tidyverse in R, pandas in Python
- Separate scripts for data cleaning vs estimation
- Name output files with date prefix: YYYYMMDD_filename
-->

## Output Formatting

<!-- Example entries:
- LaTeX tables with booktabs package
- Figures as PDF, 6 inches wide
- Three decimal places for coefficients, two for standard errors
-->

## Sense Check Defaults

<!-- Example entries:
- Price elasticities: typically -0.5 to -3.0
- Standard errors suspicious if <1% or >100% of point estimate
- Pre-trends: coefficients should be <50% of post-treatment effect
-->

## Interview Preferences

<!-- Example entries:
- Prefer fewer questions (5-8) with sensible defaults
- Don't ask about table formatting unless project requires something unusual
- Always ask about sample restrictions and time periods
-->

---

## Project-Specific Lessons

<!-- Entries added from retrospectives:

### 2024-01-10: Minimum Wage Project
- State-level clustering was right choice
- Should have asked about industry exclusions upfront

### 2024-01-15: Demand Estimation  
- BLP instruments worked well
- Convergence tolerance of 1e-14 was too tight, 1e-12 is fine
-->
