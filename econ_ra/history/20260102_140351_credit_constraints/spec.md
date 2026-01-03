# Full Specification: Credit Constraint Implementation

## Project Overview

Implement a credit constraint mechanism in the structural model of payment system competition. The baseline model explains credit card non-adoption through low utility preference. The constraint mechanism provides an alternative: some consumers have limited access to credit cards based on observable characteristics (income).

**Key Challenge**: Maintain logit structure conditional on random draws (4D MC integration) to preserve second-choice and diversion ratio calculations.

---

## Motivation & Existing Infrastructure

### Current State (Baseline)
- Model uses 4D Monte Carlo integration: 3D normal draws + uniform draws for constraint realization
- `credit_access_probability()` function exists in `model_functions.jl` using logistic function
- Environment variable `CREDIT_CONSTRAINT` exists to toggle the mechanism
- Parameter `credit_constraint_k` controls steepness of probability function
- Income gradient mechanism exists via `char_mean_income` coefficients
- Second choice code (lines 2006-2365) and diversion ratios (lines 2296-2365, 3851-3915) implemented

### Why This Matters
In the utility model:
- Average utility difference between credit and debit cards explains market share
- Income gradient in preferences explains income-conditional credit adoption

In the constraint model:
- No average utility difference (preferences equalized)
- Income gradient works entirely through credit access probability
- Same data moments matched, different structural interpretation

---

## Design Decisions & Rationale

### 1. Credit Card Utility When Constraints Active

**Decision**: Set all credit card utility intercepts equal to corresponding debit intercepts.

```
When CREDIT_CONSTRAINT=true:
  visa_credit_intercept = visa_debit_intercept
  mc_credit_intercept = mc_debit_intercept
  amex_credit_intercept = amex_debit_intercept
```

**Rationale**:
- Constraint mechanism fully replaces utility-based preference difference
- Ensures clean structural interpretation: credit non-adoption entirely via access, not taste
- When constraint removed, credit cards revert to baseline utility (same as debit)

**Implementation Point**: Parameter initialization in estimation setup

---

### 2. Income Gradient Handling

**Decision**: Zero out credit card income gradient parameter when constraints active.

```
When CREDIT_CONSTRAINT=true:
  char_mean_income[2] = 0.0  (credit characteristic)
```

**Rationale**:
- Prevents confounding between utility preference gradients and constraint gradients
- Income effects work exclusively through constraint probability: higher income → higher access
- Ensures structural parameters have clean interpretation (one mechanism per channel)

**Implementation Point**: Parameter initialization in estimation setup

---

### 3. Constraint Steepness Parameter

**Decision**: Estimate `credit_constraint_k` freely as a new parameter.

**Purpose**: Controls slope of logistic access probability function
- Higher k → steeper response to income
- Fitted to match observed credit card penetration patterns across income distribution

**Implementation Point**: Add to free parameter vector in estimation; initialize reasonably (e.g., 0.1-0.5)

---

### 4. Baseline Validation Tolerance

**Decision**: Use standard `SOLVE_TOL` (~1e-6) when validating step 3.

**Test**: Under baseline setup with equalized utilities and zeroed income gradient:
- All moment residuals should equal zero at `SOLVE_TOL` precision
- Constraint mechanism should not degrade fit

**Rationale**: Tight tolerance ensures framework doesn't introduce numerical issues

---

### 5. Second Choice Testing Strategy

**Decision**: Verify comparative static: higher volatility → more same-network substitution.

**What to Test**:
1. Increase MC volatility parameter
2. Measure share of second choices staying within same network (Visa→Visa, MC→MC)
3. Verify this increases (higher volatility = less exploration across networks)
4. Confirm logit structure preserved even with constrained choice set

**Why This Approach**:
- Directly tests the core requirement (logit conditional on draws)
- More robust than testing absolute substitution rates
- Natural to interpret economically

---

### 6. Unit Test Thresholds: Market Share Impact

**Decision**: Constraint implementation should reduce credit card market share by 5-15% (absolute points).

**Context**:
- Constraint mechanism is modest (not severe credit rationing)
- Income gradient allows higher-income consumers meaningful access
- 5-15% range is "ballpark" for sense-checking, not hard threshold

**Test Implementation**:
1. Initialize with moderate constraint parameters
2. Calculate baseline credit share
3. Apply constraints (same parameters)
4. Verify new share is 5-15 percentage points lower
5. Run test as sanity check during development

---

### 7. Configuration: Orthogonal Environment Variables

**Decision**: Use `CREDIT_CONSTRAINT` environment variable; keep orthogonal to `MODEL_CONFIG`.

**Structure**:
```
MODEL_CONFIG  ∈ {baseline, extension}
CREDIT_CONSTRAINT ∈ {true, false} [default: false]
```

**Examples**:
```
MODEL_CONFIG=baseline CREDIT_CONSTRAINT=false    # Current baseline
MODEL_CONFIG=baseline CREDIT_CONSTRAINT=true     # Baseline with constraints
MODEL_CONFIG=extension CREDIT_CONSTRAINT=false   # Future extension, no constraints
MODEL_CONFIG=extension CREDIT_CONSTRAINT=true    # Future extension with constraints
```

**Backward Compatibility**: When `CREDIT_CONSTRAINT` not set, default to false (current behavior)

---

## Implementation Roadmap (4 Steps)

### Step 1: Unit Tests with Constraints
**Location**: `model_unit_tests.jl`

Add/enhance tests:

1. **Second-Choice Logit Check**
   - Create toy scenario with constraints active
   - Increase volatility parameter
   - Verify same-network substitution increases (logit property preserved)
   - Test passes: yes/no

2. **Market Share Constraint Effect**
   - Set up baseline parameters
   - Apply constraints (equalized utilities, zeroed income gradient, moderate k)
   - Calculate aggregate credit card share before/after
   - Verify reduction is in 5-15% range
   - Test passes if within range

3. **Income Gradient in Constraint**
   - Verify higher-income consumers have higher credit access probability
   - Verify relationship magnitude is economically sensible

### Step 2: Parameter Setup in Estimation
**Location**: Estimation initialization code

When `CREDIT_CONSTRAINT=true`:
1. Copy debit intercepts → credit intercepts (overwrite)
2. Set `char_mean_income[2] = 0.0`
3. Initialize `credit_constraint_k` in free parameter vector (e.g., 0.2)

### Step 3: Baseline Estimation Validation
**Location**: `estimate_model_current_eqm_foc.jl`

Run with `CREDIT_CONSTRAINT=true` and baseline utility parameters:
- Model should fit moment conditions perfectly (residuals ≤ SOLVE_TOL)
- Constraint parameters should not shift
- No other optimization needed
- **Success criterion**: All residuals < 1e-6

### Step 4: Model Solving with Constraints
**Location**: `solve_model_foc.jl`

If step 3 succeeds:
1. Solve equilibrium with constraints enabled
2. Compute counterfactual scenarios (fee changes, network entry, etc.)
3. Compare results to non-constraint baseline
4. Verify economic interpretation makes sense

---

## Testing & Validation Criteria

| Step | Criteria | Pass/Fail |
|------|----------|-----------|
| Step 1a | Second-choice logit structure preserved | Comparative static positive |
| Step 1b | Constraint reduces credit share | 5-15% reduction observed |
| Step 1c | Income gradient in constraints | Monotone increasing, sensible magnitude |
| Step 3 | Baseline estimation | All residuals < 1e-6 |
| Step 4 | Counterfactual solving | Equilibrium converges, economically sensible |

---

## Key Parameters & Their Roles

| Parameter | Controls | How Set |
|-----------|----------|---------|
| `visa_credit_intercept` | Visa credit utility | = `visa_debit_intercept` (when constrained) |
| `mc_credit_intercept` | Mastercard credit utility | = `mc_debit_intercept` (when constrained) |
| `char_mean_income[2]` | Credit income gradient | = 0.0 (when constrained) |
| `credit_constraint_k` | Constraint steepness | Estimate freely |
| `credit_constraint_intercept` | Average constraint level | Estimate freely |
| (others: debit utilities, other preferences) | Unchanged | Keep as-is |

---

## Code Locations & Modifications

**Existing Code to Leverage**:
- `credit_access_probability()` - logistic function, already implemented
- `CREDIT_CONSTRAINT` environment variable - already checked in code
- 4D MC integration - already in place
- Second choice code (lines 2006-2365) - should work unchanged
- Diversion ratios (lines 2296-2365, 3851-3915) - should work unchanged

**New Code Needed**:
1. Parameter initialization logic (step 2)
2. Unit tests (step 1)
3. Estimation wrapper with constraint settings (step 3)
4. Solving wrapper with constraint settings (step 4)

**No Structural Changes Needed**:
- Constraint mechanism already designed to preserve logit conditional on draws
- Choice set mechanism (-Inf utility) already implemented
- Environment variable framework already in place

---

## Success Definition

The implementation is successful when:

1. ✓ Unit tests pass (steps 1a-c)
2. ✓ Baseline estimation with constraints has residuals < 1e-6 (step 3)
3. ✓ Model solves equilibrium with constraints (step 4)
4. ✓ Counterfactual comparisons show sensible economic interpretation
5. ✓ Code is backward compatible (CREDIT_CONSTRAINT=false is default)

---

## Open Questions Resolved

All 7 clarification questions answered. No remaining structural ambiguities identified. Ready for planning phase.
