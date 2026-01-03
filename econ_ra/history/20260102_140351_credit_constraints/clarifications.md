# Clarifications: Credit Constraint Implementation

## Round 1 Answers

### Q1: Credit Card Utility Intercepts with Constraints
**Answer: "Equalize to debit"**

When credit constraints are enabled, set credit card utility intercepts equal to their corresponding debit card intercepts:
- Visa Credit intercept = Visa Debit intercept
- Mastercard Credit intercept = Mastercard Debit intercept
- Amex Credit intercept = Amex Debit intercept

**Rationale**: The constraint mechanism fully replaces the utility-based preference difference. This ensures that:
- Without constraints, utilities are equal
- With constraints, only the probability of access varies (controlled by income gradient in constraint probability)
- The model rationalizes credit card non-adoption entirely through lack of access, not preference

### Q2: Income Gradient Parameters with Constraints
**Answer: "Zero out"**

When credit constraints are enabled, zero out `char_mean_income[2]` (the credit characteristic income gradient parameter).

**Rationale**: Income effects work entirely through the constraint probability function (which has an income gradient), not through utility preferences. This:
- Eliminates confounding between utility preference for credit and income effects on constraint
- Makes structural interpretation clean: income gradient works only through credit access, not taste

### Q3: Constraint Steepness Parameter (credit_constraint_k)
**Answer: "Estimate freely"**

Estimate `credit_constraint_k` freely as a new free parameter in step 3 (estimation with constraints).

**Purpose**: This parameter controls how steeply the credit access probability varies with income. It's fitted to match observed credit card usage patterns across the income distribution.

### Q4: Residual Tolerance in Baseline Check (Step 3)
**Answer: "1e-6 (tight)"**

Use standard `SOLVE_TOL` (tight numerical tolerance ~1e-6) when verifying that residuals equal zero in step 3 under the baseline setup.

**Rationale**: The baseline utility-income-gradient setup should produce zero residuals at tighter tolerances, ensuring the constraint framework doesn't break the model's matching properties.

### Q5: Testing Second Choice with Constraints (Step 1)
**Answer: "Just test the comparative static"**

For unit tests of second choice with constraints, verify:
- Higher volatility leads to more same-type substitution (e.g., Visa Credit → Visa Debit more than Visa Credit → Mastercard)
- Logit structure is preserved conditional on random draws

**Rationale**: This is the core requirement—the 4D MC integration must maintain the logit conditional-on-draws property even when constraints remove options from the choice set.

### Q6: Expected Credit Card Market Share Reduction (Unit Test)
**Answer: "5-15% reduction"**

When constraints are initially implemented, expect the credit card market share to be modest: a **5-15% absolute reduction** from baseline.

**Purpose**: Ballpark for unit test—setting up the test to accept values in this range validates that the constraint mechanism is working without being too lenient or too strict.

### Q7: Constraint vs. Baseline via Config
**Answer: "Use existing env variable"**

Use the existing `CREDIT_CONSTRAINT` environment variable to toggle between constraint and baseline utility models.

**Keep orthogonal to**: The `MODEL_CONFIG` variable (baseline vs. extension) should remain independent. A user can run:
- `MODEL_CONFIG=baseline CREDIT_CONSTRAINT=true`
- `MODEL_CONFIG=extension CREDIT_CONSTRAINT=false`
- etc.

**Implementation**: Update code to check `CREDIT_CONSTRAINT` environment variable; maintain backward compatibility when it is not set.

---

## Implementation Roadmap

### Step 1: Unit Tests
**Location**: `model_unit_tests.jl`

1. **Test second choice under constraints**: Verify logit structure preserved
   - Higher volatility → more same-network substitution

2. **Test constraint effect on market share**:
   - Default constraint parameters → 5-15% reduction in credit card share
   - Income gradient in constraints → higher income = higher credit share

### Step 2: Parameter Setup
When `CREDIT_CONSTRAINT=true`:
- Set credit intercepts = debit intercepts (e.g., `params[:visa_credit_intercept] = params[:visa_debit_intercept]`)
- Zero out credit income gradient: `params[:char_mean_income][2] = 0.0`
- Initialize `credit_constraint_k` for estimation

### Step 3: Baseline Estimation Check
Run `estimate_model_current_eqm_foc.jl` with constraints enabled, using the baseline utility setup.
- All residuals should be ≤ `SOLVE_TOL` (~1e-6)
- No other parameters should change
- Constraint parameters should be sensible

### Step 4: Full Model Solving
If step 3 is successful, run `solve_model_foc.jl` with constraints enabled.
- Compute counterfactuals with the constraint mechanism active
- Verify economic interpretation makes sense

---

## Remaining Assumptions (For Confirmation)

1. **Constraint functional form**: Using logistic function as currently implemented in `credit_access_probability()`
2. **Choice set handling**: When constraint is active, credit cards get utility = -Inf (removed from choice set)
3. **MC integration**: 4D approach continues (3D normal + 1D uniform for constraint shock)
4. **Other constraints**: Debit cards (Visa, Mastercard) remain accessible to all consumers

---

## Preferences Noted

1. **Estimation defaults**: Use tight tolerance (SOLVE_TOL ~1e-6) for residual checks
2. **Environment variable handling**: Prefer orthogonal configuration variables over nested flags
3. **Testing philosophy**: Verify comparative statics rather than absolute thresholds where possible
