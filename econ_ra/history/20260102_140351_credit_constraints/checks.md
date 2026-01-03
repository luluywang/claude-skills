# Verification Checks: Credit Constraint Implementation

## Task 1: Modify credit_access_probability() to use logit formula

### Technical
- [ ] Function `credit_access_probability()` exists in `model_functions.jl`
- [ ] Function accepts `constraint_intercept`, `constraint_slope`, and `centered_log_income` parameters
- [ ] Implementation uses logit formula: `1 / (1 + exp(-(constraint_intercept + constraint_slope * centered_log_income)))`
- [ ] Function returns value in (0, 1) for all valid inputs
- [ ] Function handles edge cases (very large/small intercept values)

### Economic Sense
- [ ] Default (no constraint): intercept=+10, slope=0 → ~100% access
- [ ] Positive slope coefficient increases access probability with income
- [ ] Monotonicity preserved: dP/d(income) has constant sign determined by slope

---

## Task 2: Update ConsPref struct

### Technical
- [ ] ConsPref struct definition updated in `model_functions.jl`
- [ ] Field `credit_constraint_k` is removed
- [ ] Field `constraint_intercept` added (Float64)
- [ ] Field `constraint_slope` added (Float64)
- [ ] No other struct fields modified

### Code Quality
- [ ] All references to old field compile to completion
- [ ] No orphaned variable assignments remain

---

## Task 3: Update ConsPref constructor

### Technical
- [ ] Constructor accepts both old parameters (credit_constraint_k) and new parameters (constraint_intercept, constraint_slope)
- [ ] When old parameter provided, returns it unchanged
- [ ] When new parameters provided, uses them
- [ ] When neither provided, uses defaults: constraint_intercept=10.0, constraint_slope=0.0
- [ ] Constructor compiles without warnings

### Backward Compatibility
- [ ] Code using old constructor syntax continues to work
- [ ] Default behavior matches baseline (near 100% access, no income gradient)

---

## Task 4: Update parameter vector handling

### Technical
- [ ] Parameter vector includes both `constraint_intercept` and `constraint_slope`
- [ ] Old parameter `credit_constraint_k` removed from vector
- [ ] Vector extraction functions updated to remove old param position
- [ ] Vector construction functions updated to add new params at correct positions
- [ ] All unpacking/packing roundtrips preserve values

### Verification
- [ ] Test: Pack a known ConsPref → unpack → reconstruct → values match

---

## Task 5: Update parameter unpacking in all call sites

### Technical
- [ ] All functions that unpack parameters from vector are updated
- [ ] Functions that call `credit_access_probability()` pass correct parameters
- [ ] No function receives partially-unpacked parameters
- [ ] Code compiles without errors

### Coverage
- [ ] Estimation functions: `estimate_model_current_eqm_foc.jl`
- [ ] Solving functions: `solve_model_foc.jl`
- [ ] Unit test functions: `model_unit_tests.jl`
- [ ] Any other model evaluation function

---

## Task 6: Remove CREDIT_CONSTRAINT_MEDIAN_ACCESS from settings.jl

### Technical
- [ ] Constant `CREDIT_CONSTRAINT_MEDIAN_ACCESS` removed from `settings.jl`
- [ ] All references to this constant are removed from codebase
- [ ] Code compiles without undefined reference errors

### Verification
- [ ] Grep search for "CREDIT_CONSTRAINT_MEDIAN_ACCESS" returns no results

---

## Task 7: Unit test - Basic functional form verification

### Technical
- [ ] Test code exists in `model_unit_tests.jl`
- [ ] Test creates `credit_access_probability()` function calls
- [ ] Test verifies logit formula: P = 1/(1+exp(-(a+b*x)))
- [ ] Test checks parameter effects (intercept shifts function vertically, slope changes steepness)

### Functional Checks
- [ ] Intercept +10, slope 0 → probability ≈ 1.0 (within 1e-4)
- [ ] Intercept 0, slope 0 → probability = 0.5
- [ ] Intercept -10, slope 0 → probability ≈ 0.0 (within 1e-4)
- [ ] Positive slope: P(income=1) > P(income=0)
- [ ] Negative slope: P(income=1) < P(income=0)

---

## Task 8: Unit test - Income monotonicity

### Technical
- [ ] Test exists in `model_unit_tests.jl`
- [ ] Test sets slope parameter > 0
- [ ] Test evaluates `credit_access_probability()` at multiple income levels
- [ ] Test verifies strictly increasing pattern

### Economic Sense
- [ ] Positive slope → monotonically increasing access with income
- [ ] Negative slope → monotonically decreasing access with income
- [ ] Magnitude check: slope = 1.0, income range [0, 2] → probability increase ≥ 20 percentage points

---

## Task 9: Unit test - Second-choice logit structure

### Technical
- [ ] Test sets CREDIT_CONSTRAINT=true in environment
- [ ] Test creates consumption preferences with constraints active
- [ ] Test increases volatility parameter (MC_VOLATILITY_PARAM)
- [ ] Test calculates second-choice distribution before/after volatility change

### Economic Sense
- [ ] Higher volatility → more same-network substitution observed
- [ ] Logit structure preserved: choice probabilities remain well-defined on constrained set
- [ ] Test verifies comparative static: d(same-network share)/d(volatility) > 0

---

## Task 10: Unit test - Market share constraint effect

### Technical
- [ ] Test initializes baseline parameters with CREDIT_CONSTRAINT=true
- [ ] Test sets constraint_intercept = 0.847 (70% access at median income)
- [ ] Test sets constraint_slope = 1.0
- [ ] Test sets credit card utility equal to debit card utility
- [ ] Test calculates aggregate credit card market share
- [ ] Test compares to baseline (no constraints)

### Acceptance Criteria
- [ ] Measured market share reduction: 5-15 percentage points
- [ ] Test reports absolute share values before/after
- [ ] Test passes if within 5-15pp range

---

## Task 11: Unit test - Income gradient magnitude

### Technical
- [ ] Test calculates credit access probability at 25th percentile income
- [ ] Test calculates credit access probability at 75th percentile income
- [ ] Test uses constraint_slope = 1.0, centered_log_income scaling
- [ ] Test reports percentage point difference

### Acceptance Criteria
- [ ] Income gradient: 10-30 percentage points from 25th to 75th percentile
- [ ] Gradient is positive (higher income → higher access)
- [ ] Test passes if within 10-30pp range

---

## Task 12: Parameter initialization in estimation scripts

### Technical
- [ ] Estimation script `estimate_model_current_eqm_foc.jl` checks CREDIT_CONSTRAINT environment variable
- [ ] When CREDIT_CONSTRAINT=true:
  - [ ] Credit card utility intercepts set equal to debit intercepts
  - [ ] Income gradient coefficient for credit cards set to 0.0
  - [ ] Constraint parameters initialized: intercept=0.847, slope=1.0
- [ ] When CREDIT_CONSTRAINT=false: no changes (baseline behavior)

### Verification
- [ ] Initialization code runs without error
- [ ] Parameter values match expected defaults
- [ ] Baseline with constraints initializes to same utility intercepts (credit=debit)

---

## Task 13: Run baseline estimation with constraints

### Technical
- [ ] Estimation runs with environment variables: `CREDIT_CONSTRAINT=true MODEL_CONFIG=baseline`
- [ ] Estimation completes without numerical errors
- [ ] Output includes residual values for all moment conditions

### Acceptance Criteria
- [ ] All residuals < 1e-6 (SOLVE_TOL tolerance)
- [ ] Optimization message: "Optimization converged" or similar
- [ ] Parameter estimates are finite (no NaN, Inf)
- [ ] Output file exists: `baseline_1_1.json` or similar

---

## Task 14: Run solve_model_foc.jl with constraints

### Technical
- [ ] Model solving runs with `CREDIT_CONSTRAINT=true MODEL_CONFIG=baseline`
- [ ] Equilibrium solver converges
- [ ] Counterfactual scenarios compute without numerical errors

### Economic Sense
- [ ] Equilibrium prices and market shares are economically sensible
- [ ] Constraint mechanism reduces credit card market share relative to baseline
- [ ] Counterfactual comparisons show clear differential effects

### Verification
- [ ] Output files generated successfully
- [ ] Solution check: equilibrium conditions satisfied to tolerance
- [ ] No divergence from baseline when constraints are inactive

---

## Summary

**Total checks**: 90+ verification items
**Critical path**: Tasks 1→2→3→4→5→9,10→12→13→14
**Threshold values locked**:
- Default (no constraint): intercept=10, slope=0
- Initial estimation: intercept=0.847, slope=1
- Residual tolerance: < 1e-6
- Market share reduction: 5-15%
- Income gradient: 10-30 pp (25th to 75th percentile)
