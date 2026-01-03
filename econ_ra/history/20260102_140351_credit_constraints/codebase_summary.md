# Codebase Summary: Credit Constraint Implementation

## Existing Infrastructure for Constraint Implementation

The codebase already has substantial infrastructure for credit constraints. This section documents what exists and what needs to be added.

---

## 1. Existing Functions & Parameters

### Credit Access Probability Function

**Location**: `model_functions.jl` - `credit_access_probability(income, params)`

**Status**: ✓ Implemented and working

**Functionality**:
- Takes consumer income and parameter vector
- Returns probability of credit card access via logistic function
- Used in 4D MC integration (uniform draw converted to access/no-access)
- Signature: `credit_access_probability(income, params) -> [0, 1]`

**Key Parameters**:
- `credit_constraint_intercept` - average access level
- `credit_constraint_k` - steepness (to be estimated freely)
- Consumer `income` - feature used in probability calculation

### 4D Monte Carlo Integration

**Status**: ✓ Implemented

**Structure**:
- 3D normal draws: three dimensions of unobserved preference heterogeneity
- 1D uniform draws: constraint realization (converted to binary access via `credit_access_probability()`)
- Conditional on all 4 draws, choice probabilities are logit
- Essential for preserving second choice and diversion ratio calculations

**Code Location**: Expectation operators and integration setup in `model_functions.jl`

### CREDIT_CONSTRAINT Environment Variable

**Status**: ✓ Implemented and checked in code

**Current Usage**:
```julia
if haskey(ENV, "CREDIT_CONSTRAINT") && ENV["CREDIT_CONSTRAINT"] == "true"
    # constraint mode logic
else
    # baseline mode logic
end
```

**Backward Compatibility**: Default is false (baseline mode) when not set

---

## 2. Existing Code for Second Choices & Diversion

### Second Choice Calculations

**Location**: `model_functions.jl` lines 2006-2365

**Status**: ✓ Implemented

**What It Does**:
- Calculates probability of second choice given first choice
- Relies on logit structure conditional on random draws
- Maintains full choice set substitution matrix

**Key Property**: Conditional on the 4D random draws, remaining choice probabilities are logit, enabling valid second-choice calculation even with constrained choice sets.

### Diversion Ratio Calculations

**Locations**:
- `model_functions.jl` lines 2296-2365
- `model_functions.jl` lines 3851-3915

**Status**: ✓ Implemented

**What It Does**:
- Calculates diversion ratios (market share reallocation when a payment method removed)
- Built on second-choice probabilities
- Used in counterfactual analysis

**Key Property**: Same as second choice - conditional logit structure enables valid diversion calculations with constraints.

---

## 3. Existing Income-Gradient Mechanism

### char_mean_income Coefficients

**Status**: ✓ Implemented

**How It Works**:
- Preference parameters vary linearly with consumer income
- `char_mean_income` vector contains income gradients for different card types
- Index 2 is credit card gradient (to be zeroed when constraints active)

**Current Role**: In baseline model, captures income effect on credit card preference

**Modified Role**: When constraints active, income gradient stays in constraint probability, not utility

---

## 4. Parameters: Baseline vs. Constraint Modes

### Baseline Model Parameters (Current)

Key utility intercepts:
- `visa_debit_intercept`
- `visa_credit_intercept`
- `mastercard_debit_intercept`
- `mastercard_credit_intercept`
- `amex_credit_intercept`
- (etc. for other cards)

Income gradient:
- `char_mean_income[2]` (credit card income effect)

### Constraint Model Parameters (To Be Implemented)

Same utility intercepts, but:
- `visa_credit_intercept = visa_debit_intercept` (equalized)
- `mastercard_credit_intercept = mastercard_debit_intercept` (equalized)
- `amex_credit_intercept = amex_debit_intercept` (equalized)

Zeroed gradient:
- `char_mean_income[2] = 0.0`

New constraint parameters:
- `credit_constraint_intercept` - average access probability
- `credit_constraint_k` - steepness of income gradient in access (to estimate freely)

---

## 5. Code Locations: What Needs Modification

### Parameter Initialization

**File**: Estimation setup code (location TBD, likely in estimation script)

**Current**: Parameters loaded from baseline specification

**Needed**: Logic to detect `CREDIT_CONSTRAINT=true` and:
1. Override credit intercepts with debit values
2. Zero out `char_mean_income[2]`
3. Initialize `credit_constraint_k` for estimation

---

### Constraint Mechanism Activation

**File**: `model_functions.jl` (choice probability calculation)

**Current**: Already has conditional check for `CREDIT_CONSTRAINT`

**Needed**: Verify that when constraint is active:
- Credit cards set to utility = -Inf if consumer doesn't have access
- Non-credit cards (debit) remain in choice set
- Logit structure is preserved conditional on draws

---

### Unit Tests

**File**: `model_unit_tests.jl`

**Current Tests** (per codebase summary):
- `test_credit_access_probability` - verifies logistic function works
- `test_credit_constraint_reduces_credit_share` - verifies effect on aggregate share

**Needed Tests**:
1. **Second-choice with constraints** - verify logit conditional structure
2. **Market share reduction magnitude** - expect 5-15% reduction under baseline settings
3. **Income gradient in constraints** - verify higher income → higher access

---

### Estimation Script

**File**: `estimate_model_current_eqm_foc.jl`

**Current**: Estimates baseline utility model

**Needed**:
1. Read `CREDIT_CONSTRAINT` environment variable
2. If true, apply parameter constraints (equalize utilities, zero gradient)
3. Initialize `credit_constraint_k` in free parameter vector
4. Run estimation (should have residuals → 0 under baseline)

---

### Solving Script

**File**: `solve_model_foc.jl`

**Current**: Solves baseline model for counterfactuals

**Needed**:
1. Read `CREDIT_CONSTRAINT` environment variable
2. If true, use constraint parameters in equilibrium computation
3. Compute counterfactuals with constraints active

---

## 6. Key Files Summary

| File | Purpose | Modification Needed |
|------|---------|-------------------|
| `model_functions.jl` | Core model logic | Verify constraint activation; no structural changes |
| `model_unit_tests.jl` | Testing suite | Add 3 new unit tests (step 1) |
| `estimate_model_current_eqm_foc.jl` | Parameter estimation | Add constraint mode parameter initialization |
| `solve_model_foc.jl` | Equilibrium solving | Add constraint mode activation |
| `settings.jl` | Configuration | May need documentation of new parameter initialization |

---

## 7. Workflow Dependencies

### Step 1 → Step 2
- Unit tests confirm logit structure and market share impact
- Parameter initialization code written

### Step 2 → Step 3
- Parameters initialized correctly when `CREDIT_CONSTRAINT=true`
- Estimation script updated to read environment variable

### Step 3 → Step 4
- Baseline residuals confirm zero at tight tolerance
- Solving script updated with constraint mode

### Step 4 (Counterfactuals)
- Equilibrium solver works with constraints
- Results economically sensible

---

## 8. Environment Variable Architecture

**Design**: Keep `CREDIT_CONSTRAINT` orthogonal to `MODEL_CONFIG`

```
MODEL_CONFIG          [baseline, extension]
CREDIT_CONSTRAINT     [true, false]  default: false

Decision Matrix:
├─ MODEL_CONFIG=baseline, CREDIT_CONSTRAINT=false  → Baseline utility model (current)
├─ MODEL_CONFIG=baseline, CREDIT_CONSTRAINT=true   → Baseline utility with constraints
├─ MODEL_CONFIG=extension, CREDIT_CONSTRAINT=false → Extension without constraints (future)
└─ MODEL_CONFIG=extension, CREDIT_CONSTRAINT=true  → Extension with constraints (future)
```

**Implementation**: Check `ENV["CREDIT_CONSTRAINT"]` at parameter initialization and in `credit_access_probability()` activation

---

## 9. Current Testing Coverage

**Existing Tests** (per codebase summary):
- ✓ `test_credit_access_probability` - function works correctly
- ✓ `test_credit_constraint_reduces_credit_share` - aggregate effect tested

**New Tests Needed** (per specification):
- ⚪ Second-choice logit structure with constraints
- ⚪ Market share reduction (5-15% range)
- ⚪ Income gradient in constraint probability

---

## 10. Backward Compatibility

**Current Behavior**: Utility-based model (no constraints)
- Set `CREDIT_CONSTRAINT` environment variable not set or `false`
- All parameters as currently calibrated
- Code paths unchanged

**Constraint Behavior**: Access-based model
- Set `CREDIT_CONSTRAINT=true`
- Parameters adjusted (equalized utilities, zeroed gradient)
- New `credit_constraint_k` estimated
- Code checks for environment variable; uses constraint paths

**Risk**: Low - conditional checks on `CREDIT_CONSTRAINT` isolate changes

---

## 11. Parameter Estimation Details

### Free Parameters for Constraint Mode

When estimating with `CREDIT_CONSTRAINT=true`:
- All baseline parameters (debit utilities, other preferences, etc.) remain free
- Credit intercepts constrained to equal debit (not free)
- `char_mean_income[2]` constrained to 0 (not free)
- `credit_constraint_intercept` free (new parameter)
- `credit_constraint_k` free (new parameter)

### Initialization Strategy

Default initialization for new parameters:
- `credit_constraint_intercept`: Start at -0.5 (moderate baseline access ~0.4)
- `credit_constraint_k`: Start at 0.2 (moderate income gradient)

These will be refined by GMM estimation.

---

## 12. Success Criteria Summary

| Criterion | Evidence | Location |
|-----------|----------|----------|
| Logit conditional structure preserved | Unit tests pass | `model_unit_tests.jl` |
| Market share impact sensible | 5-15% reduction observed | Unit tests |
| Income gradient works | Monotone, magnitude reasonable | Unit tests |
| Baseline residuals tight | All < 1e-6 | `estimate_model_current_eqm_foc.jl` output |
| Equilibrium solvable | Model converges | `solve_model_foc.jl` output |

---

## 13. Known Constraints & Assumptions

**Constraint Functional Form**: Logistic function (already implemented)
- `P(access | income) = 1 / (1 + exp(-constraint_intercept - constraint_k * income))`

**Choice Set Mechanism**: Utility = -Inf for inaccessible cards
- Preserves logit structure
- Debit cards assumed always accessible

**MC Integration**: 4D with constraint realization uniform
- Standard approach in microeconometrics
- Allows valid second-choice calculations

---

## 14. Code Quality Notes

**Existing Code**: Generally well-documented with clear variable names
**Integration Risk**: Low - environment variable approach isolates changes
**Testing Philosophy**: Comparative statics preferred over absolute thresholds
**Parameter Estimation**: Standard GMM, no new solvers needed
