# Clarifications

## Testing Scope & Coverage

**Function prioritization:**
- Focus on all functions that are called during model estimation (estimate_model_current_eqm_foc.jl)
- Prioritize functions in the estimation pipeline over internal utilities

**Edge case coverage for mechanical tests:**
- Basic happy path (correct inputs → correct outputs)
- HOWEVER: Pay special attention to tricky algorithmic cases
- Example: Switch point solving algorithm needs tests for edge cases like tie-breaking, bundle ordering, degenerate cases
- Other algorithmic complexity: equilibrium uniqueness, convergence conditions, boundary cases

## Test Architecture & Reporting

**Report organization:**
- Group by the 3 main test categories (mechanical, economic, accounting)
- Within each category, list functions with:
  - Function name
  - Current test coverage
  - Coverage assessment (adequate/inadequate)
  - Specific gaps identified

**Economic correctness test detail:**
- Provide high-level descriptions only
- Example: "test that increasing variance of random coefficients increases substitution to similar products"
- No need for full implementations, just clear descriptions of what should be tested

## Economic Moment Tests

**Important properties to test:**
- Comparative statics (increasing X increases/decreases Y)
- Substitution patterns (elasticities, cross-price effects)
- Equilibrium properties (Nash FOCs, envelope conditions)
- **All of the above** are important

**Analytical benchmarks:**
- Mixed approach:
  - Use analytical solutions when feasible (e.g., simple logit cases, known elasticity formulas)
  - Otherwise use numerical verification against known parameter configurations
- Document which approach is used for each test

## Accounting Identity Tests

**Beyond "total dollars = baseline income + rewards", test:**
- Market share constraints (shares sum to 1, non-negative)
- Profit decomposition (revenues - costs = profits)
- Integration consistency (integrals over gamma match discrete approximations)
- **Price index identities**: Average log prices should be approximately log(σ/(σ-1)) + average fee
- Other identities to brainstorm:
  - Network fee revenue = merchant fee payments
  - Consumer surplus + merchant profit + network profit = total welfare
  - Acceptance complementarity: price index relationships across bundles
  - Fixed point residuals should be zero at equilibrium
  - Jacobian rank conditions for identification

## Implementation Scope

**Test implementation:**
- Implement high-priority tests for functions with inadequate coverage
- Focus on critical gaps where current testing is weak or nonexistent
- Provide recommendations for lower-priority gaps

**Investigate untested functions:**
- Yes - determine if functions are truly untested or tested indirectly through other tests
- Document indirect test coverage where it exists
- Only flag as "missing" if there's no direct or indirect coverage

## Additional Test Categories

**Beyond the 3 main categories, also consider:**
- **Numerical stability tests**: Check for precision issues, conditioning problems, overflow/underflow
- **Invariance tests**: Results should be unchanged under equivalent transformations (e.g., bundle reordering, network relabeling)
- These are important for the equilibrium solver and integration routines

## Priority Focus Areas

Based on the model structure:
1. **Equilibrium solver** (solve_equilibrium_given_intercept_and_slope, solve_subgame, solve_fixed_point)
2. **Moment functions** (all_model_moments and its components)
3. **Integration routines** (gamma_integral!, normal_convolution_*)
4. **FOC computations** (network_foc_*, foc_at_fee_and_util)
5. **Profit calculations** (profit_parameters_all_bundles, network_profits)

## Deliverables

1. **Report on testing architecture** organized by the 3 categories
2. **List of gaps** with severity assessment (critical/important/nice-to-have)
3. **Implementation of high-priority missing tests** (where coverage is inadequate)
4. **Documentation of indirect test coverage** (functions tested via integration tests)
