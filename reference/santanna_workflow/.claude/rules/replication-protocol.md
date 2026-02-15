# Replication-First Protocol

**Replicate original results BEFORE extending.**

## Phase 1: Inventory & Baseline
Document replication package contents. Record target values from tables and figures.

## Phase 2: Translate & Execute
Convert original code (often Stata) to R. Maintain exact specification fidelity.
Note: Stata clusters df-adjust differently from some R packages.

## Phase 3: Verify Match
| Quantity | Tolerance |
|----------|-----------|
| Integers | Exact match |
| Point estimates | < 0.01 |
| Standard errors | < 0.05 |
| P-values | Match significance levels |

Document mismatches before proceeding. Investigate and record even if unresolved.

## Phase 4: Only Then Extend
Commit confirming all targets match before introducing changes.
Save reports to `quality_reports/`.
