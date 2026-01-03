# Testing Architecture Report: Payment Network Competition Model

**Generated:** 2025-12-14
**Model:** `model_functions.jl` (6,433 lines, 158 functions)
**Tests:** `model_unit_tests.jl` (2,631 lines, 89 test functions, 22 testsets)

---

## Executive Summary

This report provides a comprehensive assessment of the testing architecture for the payment network competition model. The analysis organizes test coverage by three main categories (mechanical correctness, economic correctness, accounting identities) plus a supplementary section on numerical stability and invariance.

### Overall Coverage Statistics

| Metric | Value |
|--------|-------|
| Total functions in model | 158 |
| Directly tested | 93 (59%) |
| Indirectly tested (via estimation) | 48 (30%) |
| Untested | 17 (11%) |
| **Total effective coverage** | **89%** |

### Test Distribution by Category

| Category | Testsets | Tests | % of Suite |
|----------|----------|-------|------------|
| Mechanical correctness | 11 | 44 | 50% |
| Economic correctness | 5 | 18 | 20% |
| Accounting identities | 6 | 24 | 27% |
| Stability/Invariance | 0 | 3 | 3% |

### Gap Summary

| Category | Critical | Important | Nice-to-have | Total |
|----------|----------|-----------|--------------|-------|
| Mechanical | 11 | 13 | 6 | 30 |
| Economic | 6 | 8 | 5 | 19 |
| Accounting | 4 | 4 | 9 | 17 |
| Stability/Invariance | 3 | 6 | 4 | 13 |
| **Total** | **24** | **31** | **24** | **79** |

---

## Part 1: Mechanical Correctness Tests

### Current Coverage Assessment

**Adequacy Standard:** Function is adequately tested if it has:
1. Happy path (basic correctness test)
2. At least 1-2 edge cases relevant to production usage

**Current Status:**
- Adequately tested: 25 functions (34%)
- Partially tested: 12 functions (16%)
- Untested: 36+ functions (49%)

### Key Strengths

1. **Equilibrium solver** (`solve_equilibrium_given_intercept_and_slope`): 12 tests covering ties, dominated bundles, edge cases
2. **Fixed-point solver** (`solve_fixed_point`): 4 tests covering convergence, non-convergence, multidimensional
3. **Logit shares**: 3 tests including negative infinity utility handling
4. **Gauss-Hermite derivatives**: 3 tests verifying numerical differentiation accuracy

### Critical Gaps (11)

| Gap ID | Function | Lines | Status | Risk |
|--------|----------|-------|--------|------|
| GAP-001 | `solve_equilibrium_given_intercept_and_slope` (tie-breaking exact duplicates) | 846-852 | PARTIAL | Silent wrong bundle selection |
| GAP-002 | `solve_equilibrium_given_intercept_and_slope` (precision at boundaries) | 875-890 | PARTIAL | Switch point errors |
| GAP-005 | `find_envelope_crossing_internal` | 1119-1143 | UNTESTED | Wrong fixed cost estimates |
| GAP-006 | `find_two_envelope_crossing` | 1145-1198 | UNTESTED | Wrong fixed cost identification |
| GAP-007 | `compute_envelope_for_subset` | 1091-1117 | UNTESTED | Bundle ID corruption |
| GAP-008 | `calculate_first_acceptance_gamma` | 1012-1044 | UNTESTED | Wrong acceptance thresholds |
| GAP-009 | `find_line_envelope_crossing` | 1200-1237 | UNTESTED | Fixed cost calculation errors |
| GAP-010 | `find_zero_crossing_F1` | 1239-1278 | UNTESTED | Fixed cost identification |
| GAP-011 | `solve_fixed_point` (oscillation recovery) | 3036-3042 | PARTIAL | Solver hangs or wrong convergence |
| GAP-012 | `solve_fixed_point` (NaN detection) | 2901-2913 | UNTESTED | Silent NaN propagation |
| GAP-014 | `build_param_from_vector` | ~4667 | UNTESTED | Corrupt all moments |

### Important Gaps (13)

| Gap ID | Function | Status | Impact |
|--------|----------|--------|--------|
| GAP-003 | Empty bundle set handling | PARTIAL | Fails loudly |
| GAP-004 | All bundles dominated | PARTIAL | Fails loudly |
| GAP-013 | `normalize_price_index!` | UNTESTED | Divergence |
| GAP-015 | `model_moment_from_vector` | UNTESTED | Integration test needed |
| GAP-016 | `all_model_moments` | UNTESTED | Integration test needed |
| GAP-017 | `model_network_foc` | UNTESTED | FOC extraction errors |
| GAP-018 | `model_network_soc` | UNTESTED | SOC penalty errors |
| GAP-019 | `calc_insulated_shares` | UNTESTED | Share calculation errors |
| GAP-020 | `invert_reward_dollars` | UNTESTED | CES inversion errors |
| GAP-021 | `integrate_bundle_dependent_function!` | UNTESTED | Integration errors |
| GAP-022 | `gamma_integral!` | INDIRECT | Numerical integration |
| GAP-023 | `payment_type_to_kappa` | PARTIAL | Edge case |
| GAP-024 | Bundle filter functions | UNTESTED | Simple logic |

### Recommendations for Mechanical Tests

**Immediate Actions:**
1. Add switch point algorithm edge case tests (GAP-001, GAP-002) - ~50 lines
2. Add envelope crossing test suite (GAP-005 to GAP-010) - ~150 lines
3. Add fixed-point solver robustness tests (GAP-011, GAP-012) - ~80 lines
4. Add parameter construction test (GAP-014) - ~60 lines

**Estimated Effort:** ~340 lines of test code

---

## Part 2: Economic Correctness Tests

### Current Coverage Assessment

**Focus Areas:**
1. Comparative statics (parameter changes → moment changes)
2. Substitution patterns (cross-price elasticities, diversion ratios)
3. Equilibrium properties (Nash FOCs, envelope conditions)

**Current Status:**
- Economic tests: 20% of test suite (5 testsets, 18 tests)
- Critical gaps: Functions that could produce silent wrong answers

### Key Strengths

1. **Price index behavior**: 5 tests verifying price index properties
2. **Substitution effects**: `test_high_volatility_increases_substitution` verifies RC volatility effect
3. **Second-choice conversion**: 2 tests verify mechanical correctness

### Critical Gaps (6)

| Gap ID | Function | Current Tests | Missing |
|--------|----------|---------------|---------|
| ECON-001 | `all_model_moments` | 0 | Comparative statics, consistency checks |
| ECON-002 | `network_foc_all_entries` | 0 | Envelope theorem, sign patterns, symmetry |
| ECON-003 | `solve_equilibrium_given_intercept_and_slope` | 12 (mechanical only) | Monotonicity, envelope dominance, economic interpretability |
| ECON-004 | `model_network_foc` | 0 | FOC ≈ 0 at optimum, ownership aggregation |
| ECON-005 | `profit_parameters_all_bundles` | 5 (mechanical only) | Comparative statics, slope ordering, fixed cost effects |
| ECON-006 | `model_moments_second_choice` | 0 | Elasticity bounds, sign patterns, adding-up constraints |

### Important Gaps (8)

| Gap ID | Function | Missing Tests |
|--------|----------|---------------|
| ECON-007 | `eqm_price_index` | Monotonicity in fees, CES functional form |
| ECON-008 | `expected_wallet_shares_and_surplus` | Utility monotonicity, income effects |
| ECON-009 | `convert_primary_secondary_to_second_choice!` | Diversion ratio interpretation, asymmetry |
| ECON-010 | `solve_subgame` | Fixed point property, uniqueness |
| ECON-011 | `calc_insulated_shares` | Share normalization, price index effects |
| ECON-012 | `network_foc_aggregate` | Envelope theorem, internalization |
| ECON-013 | `model_moments_nilson` | Sign verification, elasticity bounds |
| ECON-014 | `model_moments_first_credit` | Fixed cost monotonicity, fee monotonicity |

### Economic Test Strategy

**Approach:**
- 21% analytical tests (known cases, simple logit)
- 63% numerical tests (calibrated parameters, finite differences)
- 16% mixed analytical/numerical

**Priority Tests:**
1. Comparative statics for `all_model_moments` - verify parameter→moment mapping
2. Envelope theorem verification for FOC Jacobian
3. Substitution pattern tests for second-choice moments
4. Fixed point property verification for subgame equilibrium

**Estimated Effort:** ~400 lines of test code

---

## Part 3: Accounting Identity Tests

### Current Coverage Assessment

**Identity Categories:**
1. Market share constraints (shares sum to 1, non-negative)
2. Profit decomposition (revenue - cost = profit)
3. Integration consistency (numerical = analytical where available)
4. Price index identity (CES theory)
5. Fixed point residuals (equilibrium property)
6. Payment network identities (fee balance, welfare decomposition)

**Current Status:**
- Accounting tests: 27% of test suite (6 testsets, 24 tests)
- Strong component-level coverage
- Weak system-level validation

### Key Strengths

1. **Zero-sum rewards**: 1 comprehensive test
2. **Basic profit calculation**: 2 tests
3. **Integration accuracy**: 11 tests for numerical integration
4. **Logit share sum**: Tests verify shares sum to 1.0

### Critical Gaps (4)

| Gap ID | Identity | Current Status | Risk |
|--------|----------|----------------|------|
| ACC-001 | Price index CES identity: E[log P] ≈ log(σ/(σ-1)) + E[fee] | NOT TESTED | Silent wrong merchant surplus parameters |
| ACC-002 | Multi-homing reward allocation (primary_use_share weighting) | INDIRECT | Silent reward passthrough errors |
| ACC-003 | Subgame fixed point residual (||P(P*) - P*|| < tol) | PARTIAL (flag only) | Wrong equilibrium accepted |
| ACC-004 | Jacobian rank condition for identification | NOT TESTED | Weak identification undetected |

### Important Gaps (4)

| Gap ID | Identity | Missing Test |
|--------|----------|--------------|
| ACC-005 | System-level homing shares sum to 1 | Full integration test |
| ACC-006 | Income-weighted shares sum | Dollar accounting foundation |
| ACC-007 | Fixed point residual magnitude verification | Solver tolerance check |
| ACC-008 | Revenue-cost-rewards decomposition | Profit calculation verification |

### Nice-to-have Gaps (9)

| Gap ID | Identity | Priority |
|--------|----------|----------|
| ACC-009 | Dollar shares sum to 1 | By construction |
| ACC-010 | Merchant profit accounting | Not directly used |
| ACC-011 | MC vs. GH agreement | Method comparison |
| ACC-012 | Network-merchant fee balance | Would fail loudly |
| ACC-013 | Welfare decomposition | Not estimated |
| ACC-014 | Acceptance complementarity | Economic property |
| ACC-015 | Price index integration consistency | Regime switching |
| ACC-016 | Dollar spending integration | Multi-homing splits |
| ACC-017 | FOC residuals at equilibrium | Estimation diagnostic |

### Tolerance Standards

| Identity Type | Tolerance | Rationale |
|---------------|-----------|-----------|
| Market shares | `atol = 1e-6` | Probability constraints |
| Profit decomposition | `atol = 1e-8` | Exact accounting |
| Integration consistency | `rtol = 1e-3` | Numerical error |
| Price index identity | `atol = 0.01` | Theory approximate |
| Fixed point residuals | `< SOLVE_TOL` | Solver tolerance |

**Estimated Effort:** ~300 lines of test code

---

## Part 4: Numerical Stability and Invariance (Supplementary)

### Current Coverage Assessment

**Key Finding:** The test suite has 68 tolerance-aware assertions using `isapprox`, demonstrating awareness of floating-point precision. However, systematic stability testing is absent.

**Current Status:**
- Perturbation stability: 0/8 routines tested
- Conditioning tests: Partial (diagnostics computed but not tested)
- Invariance tests: 1/5 properties tested (bundle reordering only)

### Critical Gaps (3)

| Gap ID | Property | Current Status | Risk |
|--------|----------|----------------|------|
| STAB-001 | Equilibrium solver perturbation stability | UNTESTED | Silent wrong answers near degeneracies |
| STAB-002 | Anderson acceleration ill-conditioning | UNTESTED (diagnostics computed) | Wrong fixed point under ill-conditioning |
| STAB-003 | Network relabeling invariance | UNTESTED | Identification compromised |

### Important Gaps (6)

| Gap ID | Property | Risk |
|--------|----------|------|
| STAB-004 | Logit share overflow/underflow | Precision loss |
| STAB-005 | Gamma integral extreme parameters | Tail probability errors |
| STAB-006 | Gauss-Hermite derivative accuracy | Jacobian errors in GMM |
| STAB-007 | Fixed-point poor initialization | Convergence failure |
| STAB-008 | Bundle reordering (profit params) | Indexing bugs |
| STAB-009 | Integration method equivalence | Cross-platform inconsistency |

### Tolerance Recommendations

| Test Type | Perturbation Size | Expected Error Bound |
|-----------|-------------------|----------------------|
| Well-conditioned equilibrium | 1e-6 | < 1e-4 |
| Near-degenerate equilibrium | 1e-8 | < 1e-6 |
| Fixed-point iteration | 1e-6 | < 1e-4 |
| Gauss-Hermite derivative | shock_vol = 1e-3 | rtol < 1e-2 |
| MC vs. GH integration | 500 draws | rtol < 0.10 |

**Estimated Effort:** ~200 lines of test code

---

## Part 5: Function-by-Function Assessment

### Priority 1: Estimation-Critical Functions (25 functions)

These functions are called in every GMM iteration. All should have adequate testing.

| Function | Direct Tests | Indirect | Gaps | Priority |
|----------|--------------|----------|------|----------|
| `model_moment_from_vector` | 0 | Yes (entry point) | Integration test | HIGH |
| `all_model_moments` | 0 | Yes (every iter) | Comparative statics | CRITICAL |
| `build_param_from_vector` | 0 | Yes (every iter) | Parameter unpacking | CRITICAL |
| `network_allocation` | 6 | Yes | Adequate | - |
| `solve_subgame` | 6 | Yes | FP property verification | IMPORTANT |
| `solve_fixed_point` | 4 | Yes | Oscillation, conditioning | CRITICAL |
| `solve_equilibrium_given_intercept_and_slope` | 12 | Yes | Tie-breaking, precision | CRITICAL |
| `profit_parameters_all_bundles` | 5 | Yes | Comparative statics | CRITICAL |
| `eqm_price_index` | 5 | Yes | CES identity | IMPORTANT |
| `expected_wallet_shares_and_surplus` | 1 | Yes | Utility monotonicity | IMPORTANT |
| `logit_shares_surplus!` | 3 | Yes | Extreme utilities | IMPORTANT |
| `gauss_hermite_cts_derivative` | 3 | Yes | Shock vol sensitivity | IMPORTANT |
| `integrate_function_rc_draws!` | 0 | Yes (millions) | Method equivalence | LOW |
| `calc_shares_on_rc_draw!` | 0 | Yes (millions) | Adequate via volume | LOW |
| `income_weighted_wallet_shares` | 1 | Yes | Adequate | - |

### Priority 2: FOC/SOC Functions (12 functions, iterations 3-6)

| Function | Direct Tests | Gaps |
|----------|--------------|------|
| `network_foc_all_entries` | 0 | Envelope theorem, sign patterns |
| `model_network_foc` | 0 | FOC ≈ 0 verification |
| `model_network_soc` | 0 | SOC penalty |
| `network_foc_aggregate` | 1 | Internalization |
| `normalize_foc_by_dollars` | 0 | Indirect only |
| `compute_soc_penalty` | 0 | Indirect (iter 5) |
| `gauss_hermite_cts_derivative_fast_masked` | 0 | Conditional |
| `gauss_hermite_diagonal_hessian_fast` | 0 | Indirect (iter 5) |

### Priority 3: Envelope Crossing Functions (6 functions)

**All UNTESTED** - Critical for fixed cost identification:
- `find_envelope_crossing_internal`
- `find_two_envelope_crossing`
- `compute_envelope_for_subset`
- `find_line_envelope_crossing`
- `find_zero_crossing_F1`
- `calculate_first_acceptance_gamma`

### Priority 4: Moment Functions (9 functions)

| Function | Direct Tests | Status |
|----------|--------------|--------|
| `model_dollar_shares` | 0 | Indirect |
| `model_moments_dcpc` | 0 | Indirect |
| `model_moments_nilson` | 0 | Needs sign verification |
| `model_moments_second_choice` | 0 | Needs bounds/signs |
| `model_moments_primary_secondary` | 0 | Indirect |
| `model_reward_diff` | 0 | Trivial |
| `model_moments_first_credit` | 0 | Needs monotonicity |

---

## Part 6: Indirect Coverage Quality Assessment

### Very High Quality (Millions of executions)

Functions exercised millions of times through estimation provide de facto validation:

- `calc_shares_on_rc_draw!` - Every MC draw
- `payment_shares_at_pos` - Every integrand evaluation
- `integrate_function_rc_draws!` - Core integration
- `logit_shares_surplus!` - Every utility evaluation

**Assessment:** These functions are unlikely to have bugs given execution volume. Unit tests would primarily serve as documentation.

### High Quality (Thousands of executions per bootstrap)

- `all_model_moments` - Every GMM iteration
- `build_param_from_vector` - Every GMM iteration
- `expected_wallet_shares_and_surplus` - Every subgame
- Empirical moment functions (DCPC, Nilson, etc.)

**Assessment:** Production-validated but unit tests would catch edge cases faster.

### Medium Quality (Hundreds of executions)

- `network_foc_all_entries` - Iterations 3-6
- `compute_soc_penalty` - Iteration 5 only
- Envelope crossing functions (conditional on NUM_FIXED_COSTS)

**Assessment:** Less thoroughly exercised. Unit tests recommended.

### Low Quality (Few executions or conditional)

- Masked derivative functions (only if fee caps binding)
- Bundle filter functions (counterfactual only)
- Alternative normalization functions (not used)

**Assessment:** May never be exercised. Need explicit unit tests.

---

## Part 7: Implementation Priorities

### Tier 1: Critical (Must Implement)

**Silent failure risk - could produce wrong answers without errors**

| ID | Test | Estimated Lines | Effort |
|----|------|-----------------|--------|
| GAP-014 | `build_param_from_vector` basic test | 60 | 2 hrs |
| GAP-011 | Fixed-point oscillation recovery | 50 | 2 hrs |
| GAP-005-010 | Envelope crossing test suite | 150 | 4 hrs |
| ECON-001 | `all_model_moments` comparative statics | 80 | 3 hrs |
| ACC-001 | Price index CES identity | 60 | 2 hrs |
| ACC-003 | Subgame FP residual verification | 50 | 2 hrs |
| STAB-002 | Anderson acceleration conditioning | 60 | 2 hrs |

**Total Tier 1:** ~510 lines, ~17 hours

### Tier 2: Important (Should Implement)

**Would fail loudly but blocks estimation or affects accuracy**

| ID | Test | Estimated Lines |
|----|------|-----------------|
| GAP-001-002 | Switch point edge cases | 100 |
| ECON-002-006 | Economic property tests | 200 |
| ACC-005-008 | System-level accounting | 100 |
| STAB-004-009 | Stability tests | 150 |

**Total Tier 2:** ~550 lines, ~20 hours

### Tier 3: Nice-to-have (Can Defer)

**Low risk or redundant with existing coverage**

- Bundle filter functions
- Alternative normalization
- Utility and I/O functions
- Redundant accounting tests

**Total Tier 3:** ~200 lines, ~8 hours

---

## Part 8: Recommended Test Organization

### New Testsets to Add

```julia
# Tier 1: Critical tests
@testset "Parameter Construction                              " begin
    test_build_param_from_vector_basic()
    test_build_param_from_vector_bounds()
end

@testset "Envelope Crossing Functions                         " begin
    test_find_envelope_crossing_basic()
    test_find_envelope_crossing_at_boundary()
    test_find_envelope_crossing_empty()
    test_find_two_envelope_crossing_basic()
    test_find_two_envelope_crossing_no_crossing()
    test_compute_envelope_for_subset_basic()
end

@testset "Economic Properties: Moment Functions               " begin
    test_all_model_moments_comparative_statics()
    test_all_model_moments_consistency()
    test_model_network_foc_envelope_theorem()
end

@testset "Accounting Identities (System-Level)                " begin
    test_price_index_identity()
    test_subgame_fixed_point_residual()
    test_homing_shares_sum_to_one()
end

@testset "Numerical Stability: Perturbations                  " begin
    test_equilibrium_perturbation_stability()
    test_anderson_ill_conditioned_matrix()
end

@testset "Invariance: Network Relabeling                      " begin
    test_network_relabeling_invariance()
end
```

---

## Part 9: Risk Assessment Summary

### Silent Failure Risks (Critical Priority)

| Function | Probability | Impact | Detection |
|----------|-------------|--------|-----------|
| `build_param_from_vector` | Low | Catastrophic | Silent |
| Envelope crossing functions | Medium | High | Silent |
| Anderson acceleration | Low | Very High | Silent |
| Price index formula | Medium | High | Silent |

### Loud Failure Risks (Important Priority)

| Function | Probability | Impact | Detection |
|----------|-------------|--------|-----------|
| Switch point precision | Medium | Medium | May be silent |
| Logit overflow | Very Low | Medium | NaN |
| Fixed-point non-convergence | Low | Medium | Timeout |

### Low Risks (Nice-to-have)

| Function | Probability | Impact | Detection |
|----------|-------------|--------|-----------|
| Bundle filter functions | Very Low | Low | Loud |
| Utility functions | Very Low | Low | Loud |

---

## Appendix A: Gap Severity Criteria

### Critical
- Could produce **silent wrong answers** that corrupt estimation
- Failure mode: model converges, moments look plausible, but parameters are biased
- Examples: wrong bundle selection, wrong fixed costs, wrong parameter mapping

### Important
- Would **fail loudly** (error, NaN, non-convergence) but block estimation
- Failure mode: estimation crashes or hangs
- Examples: solver divergence, invalid shares, integration error

### Nice-to-have
- **Edge cases unlikely in practice** or redundant with other tests
- Failure mode: very specific parameter configurations
- Examples: extreme utilities, unusual fee patterns, boundary conditions

---

## Appendix B: Verification Checklist Summary

From `checks.md`, the following verification criteria apply:

**Thresholds:**
- Mechanical test adequacy: happy path + 1-2 edge cases
- Economic test tolerance: relative error < 1e-4
- Accounting identity tolerance: absolute error < 1e-6
- Price index identity tolerance: |diff| < 0.01
- Stability perturbation size: 1e-6
- **ALL tests must pass (0 failures)**

---

## Conclusion

The testing suite demonstrates strong mechanical correctness coverage (50% of tests) with excellent equilibrium solver testing (12 tests) and good numerical integration coverage (11 tests). Economic correctness testing is the weakest area (20% of tests) with critical gaps in moment computation verification. Accounting identities have good component coverage (27%) but lack system-level validation.

**Key Recommendations:**

1. **Immediately implement** 7 critical tests (~510 lines) to prevent silent failures
2. **Add economic property tests** for the 6 critical moment functions
3. **Verify price index CES identity** - core theory not tested
4. **Test network relabeling invariance** - threatens identification if violated
5. **Add fixed-point residual verification** - ensure equilibrium is equilibrium

**Investment Required:**
- Tier 1 (Critical): ~17 developer-hours
- Tier 2 (Important): ~20 developer-hours
- Total: ~37 developer-hours to close major gaps

This investment would increase test coverage from 89% to ~95% effective coverage while dramatically reducing silent failure risk for the core estimation pipeline.
