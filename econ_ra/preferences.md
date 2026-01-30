# User Preferences

This file accumulates your preferences from past projects. The long-running agent reads this before each interview to provide better defaults and ask fewer questions.

---

## Data Handling

- Use left join to preserve all records when merging (avoid losing observations silently)
- Set J*=0 for sectors without large firms (e.g., sectors 0, 5, 13, 15 in payment network model)
- Verify merge rates >99% before proceeding; investigate any unmatched records

## Estimation Defaults

- ForwardDiff type compatibility: ensure type signatures match autodiff requirements
- Parameter bounds matter: if optimizer pushes parameters to bounds, investigate (e.g., constraint_slope near 5.0 indicates issue)
- Convergence tolerance: 1e-6 for residuals in structural models is standard
- Backward compatibility: keep legacy constructors with sensible defaults when adding parameters
- Initial values should match economic specification (e.g., intercept=0.847 for 70% median access)

## Coding Style (Julia)

- Type safety: use explicit types to prevent bugs (Matrix{Int64} vs Matrix{Float64} matters)
- Always include round-trip tests for parameter packing/unpacking
- Commit after each logical change with descriptive messages
- Prefer small, focused commits over large multi-change commits
- Document parameter ranges and economic interpretation in docstrings

## Output Formatting

- LaTeX tables with booktabs package
- Figures as PDF, 6 inches wide
- Three decimal places for coefficients, two for standard errors
- Include Table A.X showing constraint parameters and economic interpretation for structural models
- Wrap all LLM-written LaTeX content in \begin{llm}...\end{llm} for review tracking

## Sense Check Defaults

- Pre-trends: coefficients should be <50% of post-treatment effect
- Credit market share: constraints should reduce by 5-15 percentage points
- Income gradient: ~20pp across IQR for credit access is reasonable
- Weak identification is informative, not a failure—document and report
- Standard errors suspicious if <1% or >100% of point estimate

## Testing Philosophy

- Always include: functional form verification, monotonicity, round-trip tests
- Testing structural models requires economic intuition, not just mechanical checks
- Incremental testing catches issues early (especially ForwardDiff compatibility)
- 345+ test assertions for a single feature change is appropriate for structural models

## Interview Preferences

- Prefer fewer questions (5-8) with sensible defaults
- Don't ask about table formatting unless project requires something unusual
- Always ask about sample restrictions and time periods
- For structural model changes: ask about parameter interpretation and expected ranges

---

## Project-Specific Lessons

### 2025-12-10: Bootstrap Audit, J*=0 Fix
- Set J*=0 for non-large-firm sectors (0, 5, 13, 15) to correctly model absence of large firms
- Used left join to preserve all QCEW records when merging
- Clean project: 7 tasks, 0 flagged, 0 blocked

### 2025-12-14: Payment Network Testing
- Added 72 new tests (415→487 total), 100% pass rate
- Type safety caught Matrix{Float64} vs Matrix{Int64} mismatch immediately
- Weak identification in simplified models (26/34 parameters identified) is expected
- Anderson solver bug: anderson_depth=0 causes division by zero, use anderson_stop=0 instead
- Comprehensive documentation multiplies impact for future researchers

### 2026-01-02: Credit Constraint Implementation
- Task decomposition pattern: signature → struct → constructor → parameters → call sites → tests
- ForwardDiff type incompatibility was critical bug—caught by incremental testing
- Backward compatibility approach (9-arg constructor with defaults) reduced risk
- Parameter bounds and initial values chosen to match economic specification
- 345+ test assertions, all passing; 6 clean git commits
- Deferred SLURM tasks should be marked "scheduled-for-later" not "pending"
