# Clarifications

## Task 1: Bootstrap Standard Errors

- **Scope**: Bootstrap sufficient statistics (R code) AND redistribution table outputs
- **Replications**: 200 (fast, rough CIs)
- **Approach**: Resample within each sector independently, then aggregate
- **Goal**: Understand uncertainty propagation through sufficient statistics

## Task 2: Sector Effects Explanation

- **Deliverable**: Written explanation/note resolving the puzzle
- **If result is correct**: Write up why the intuition was wrong
- **Context**: Plot shows sectors with higher cash/debit usage have smaller credit-debit fee gaps due to sector effects. Need to explain why removing sector negotiations appears to benefit debit holders (opposite of initial prediction).

## Task 3: J*=1 Calibration

- **Sectors**: All 6 sectors (0, 5, 7, 9, 13, 15)
- **Outputs**: Calibration parameters + RMSE comparison table
- **If poor fit**: Report as-is to show robustness bounds
- **Purpose**: Amplify incomplete pass-through, demonstrate robustness to market power
