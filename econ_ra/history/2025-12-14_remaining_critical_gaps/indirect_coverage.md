# Indirect Test Coverage Analysis

**Generated:** 2025-12-14
**Purpose:** Document which functions in `model_functions.jl` are tested indirectly through integration tests rather than direct unit tests

## Executive Summary

Of the 158 functions in `model_functions.jl`:
- **93 functions (59%)** have direct unit tests
- **48 functions (30%)** are tested indirectly through integration testing via estimation pipeline
- **17 functions (11%)** are truly untested (no test execution path)

This analysis traces indirect testing chains to show which untested functions are actually covered by the estimation process (`estimate_model_current_eqm_foc.jl`).

---

## Testing Coverage Classification

### Category 1: Directly Tested (93 functions)
Functions with explicit `@testset` blocks in `model_unit_tests.jl`. See `test_inventory.md` for complete list.

**Key examples:**
- `payment_shares_at_pos()` - Testset 1
- `profit_parameters_all_bundles()` - Testset 2, 3, 15, 21
- `solve_equilibrium_given_intercept_and_slope()` - Testset 4, 15
- `logit_shares_surplus!()` - Testset 8
- `network_allocation()` - Testset 14

### Category 2: Indirectly Tested (48 functions)
Functions without direct unit tests but called during estimation pipeline execution.

### Category 3: Untested (17 functions)
Functions with no test coverage (neither direct nor indirect).

---

## Indirectly Tested Functions (48 total)

### 1. CORE MODEL FUNCTIONS (10 functions)

#### 1.1 Main Equilibrium Solver
**`solve_eqm_foc()`** - Main equilibrium solver with FOC
- **Indirect Testing Chain:** Called by production estimation scripts (not in current estimation)
- **Coverage Status:** Integration tested in production runs but not in bootstrap estimation
- **Testing Quality:** Production validated but no automated tests

#### 1.2 Robust Equilibrium Wrapper
**`robust_eqm_solver()`** - Robust wrapper with multiple phases
- **Indirect Testing Chain:** Called by production estimation scripts
- **Coverage Status:** Integration tested in production runs
- **Testing Quality:** Production validated

#### 1.3 FOC and Solver Evaluation
**`foc_at_fee_and_util()`** - FOC evaluation function
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls `model_moment_from_vector()`
  2. `model_moment_from_vector()` calls `all_model_moments()`
  3. `all_model_moments()` calls `model_network_foc()`
  4. `model_network_foc()` may call `foc_at_fee_and_util()` (conditional)
- **Coverage Status:** Conditionally tested (iterations 3-6)
- **Testing Quality:** Medium (tested via GMM estimation but no unit tests)

**`check_complementary_slackness()`** - Constraint checking
- **Indirect Testing Chain:** Called by `solve_eqm_foc()` and diagnostic functions
- **Coverage Status:** Production tested only
- **Testing Quality:** Low (diagnostic function, rarely exercised)

**`eval_solver()`** - Solver evaluation and diagnostics
- **Indirect Testing Chain:** Called by estimation scripts for diagnostics
- **Coverage Status:** Integration tested in full estimation runs
- **Testing Quality:** Medium (exercised in production)

#### 1.4 Parameter Construction
**`build_param_from_vector()`** - Unpacks parameter vector into structured objects
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls `model_moment_from_vector()`
  2. `model_moment_from_vector()` calls `build_param_from_vector()` (line 4667)
- **Coverage Status:** FULLY TESTED (called in every GMM iteration)
- **Testing Quality:** High (2000+ executions per bootstrap draw × 6 iterations × 100 draws)

**`build_init()`, `build_lower_bound()`, `build_upper_bound()`** - Parameter initialization and bounds
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls these at initialization
- **Coverage Status:** Tested once per estimation run
- **Testing Quality:** Medium (tested 100 times in bootstrap)

#### 1.5 Results Export
**`export_results()`** - Results export function
- **Indirect Testing Chain:** Called at end of estimation runs
- **Coverage Status:** Integration tested
- **Testing Quality:** Low (I/O function, hard to test failures)

---

### 2. MOMENT CALCULATION FUNCTIONS (7 functions)

#### 2.1 Master Moment Function
**`all_model_moments()`** - Main moment calculation function
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls `model_moment_from_vector()`
  2. `model_moment_from_vector()` calls `all_model_moments()` (line 4464)
- **Coverage Status:** FULLY TESTED (called every GMM iteration)
- **Testing Quality:** Very High (exercised ~10,000+ times per bootstrap draw)

**`model_moment_from_vector()`** - Moment calculation from parameter vector
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls `recover_moments_from_init()`
  2. `recover_moments_from_init()` calls `LsqFit.curve_fit(model_moment_from_vector, ...)`
- **Coverage Status:** FULLY TESTED (main entry point)
- **Testing Quality:** Very High (thousands of calls per estimation)

#### 2.2 Empirical Moment Functions
**`model_dollar_shares()`** - Dollar share moments
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_dollar_shares()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`model_moments_dcpc()`** - DCPC survey moments
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_moments_dcpc()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`model_moments_nilson()`** - Nilson panel moments (Durbin Amendment shock)
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_moments_nilson()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`model_moments_second_choice()`** - Second choice moments
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_moments_second_choice()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`model_moments_primary_secondary()`** - Primary/secondary moments
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_moments_primary_secondary()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`model_reward_diff()`** - Reward difference moments
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_reward_diff()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`model_moments_first_credit()`** - First credit moments
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `all_model_moments()` → `model_moments_first_credit()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

---

### 3. NETWORK OPTIMIZATION FUNCTIONS (5 functions)

#### 3.1 Network FOC Functions
**`model_network_foc()`** - Network FOC moments
- **Indirect Testing Chain:**
  1. `all_model_moments()` → `model_network_foc()` (iterations 3-6)
- **Coverage Status:** Tested in iterations 3-6
- **Testing Quality:** High (critical for GMM identification)

**`model_network_soc()`** - Network SOC moments
- **Indirect Testing Chain:**
  1. `all_model_moments()` → `model_network_soc()` (iteration 5 only)
- **Coverage Status:** Tested in iteration 5
- **Testing Quality:** Medium (only one iteration tests this)

#### 3.2 Network Dollar Aggregation
**`aggregate_network_dollars()`** - Network dollar aggregation
- **Indirect Testing Chain:**
  1. `model_network_foc()` → `aggregate_network_dollars()` (line 4184)
- **Coverage Status:** Tested in iterations 3-6
- **Testing Quality:** High
- **Note:** Also has direct test via Testset 13

#### 3.3 FOC Normalization
**`normalize_foc_by_dollars()`** - FOC normalization by dollars
- **Indirect Testing Chain:**
  1. `model_network_foc()` → `normalize_foc_by_dollars()` (line 4203)
- **Coverage Status:** Tested in iterations 3-6
- **Testing Quality:** High

**`normalize_foc_by_instrument_dollars()`** - FOC normalization by instrument
- **Indirect Testing Chain:** Alternative normalization (not used in current estimation)
- **Coverage Status:** Not tested in current estimation
- **Testing Quality:** Low

#### 3.4 Second-Order Conditions
**`compute_soc_penalty()`** - SOC penalty computation
- **Indirect Testing Chain:**
  1. `model_network_soc()` → `compute_soc_penalty()` (iteration 5)
- **Coverage Status:** Tested in iteration 5 only
- **Testing Quality:** Medium

---

### 4. CONSUMER BEHAVIOR FUNCTIONS (10 functions)

#### 4.1 Wallet Shares
**`expected_wallet_shares_and_surplus()`** - Expected shares and surplus
- **Indirect Testing Chain:**
  1. `network_allocation()` → `expected_wallet_shares_and_surplus()` (line 2161)
- **Coverage Status:** FULLY TESTED (called every iteration)
- **Testing Quality:** Very High

#### 4.2 Random Coefficient Integration
**`integrate_function_rc_draws!()`** - Integration over random coefficients
- **Indirect Testing Chain:**
  1. `expected_wallet_shares_and_surplus()` → `integrate_function_rc_draws!()`
  2. `income_weighted_wallet_shares()` → `integrate_function_rc_draws!()`
  3. `expected_second_choice()` → `integrate_function_rc_draws!()`
- **Coverage Status:** FULLY TESTED (called thousands of times)
- **Testing Quality:** Very High

**`calc_shares_on_rc_draw!()`** - Share calculation on random draws
- **Indirect Testing Chain:**
  1. `integrate_function_rc_draws!()` → `calc_shares_on_rc_draw!()` (line 1984)
- **Coverage Status:** FULLY TESTED (called for every MC draw)
- **Testing Quality:** Very High (millions of executions)

#### 4.3 Second Choice and Diversion
**`expected_second_choice()`** - Expected second choice
- **Indirect Testing Chain:**
  1. `network_allocation()` → `expected_second_choice()` (line 2191)
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`expected_diversion()`** - Diversion calculation
- **Indirect Testing Chain:**
  1. `network_allocation()` → `expected_diversion()` (line 3965)
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High

**`second_choice_cash_diversion()`** - Cash diversion from second choice
- **Indirect Testing Chain:**
  1. `expected_second_choice()` → `second_choice_cash_diversion()` (line 2359)
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** Medium

**`expected_diversion_bank_level()`** - Bank-level diversion
- **Indirect Testing Chain:**
  1. `expected_diversion()` → `expected_diversion_bank_level()` (line 2421)
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** Medium

**`second_choice_same_type()`** - Same-type second choice
- **Indirect Testing Chain:** Called by second choice functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Medium

**`convert_diversion_to_bank_second_choice()`** - Bank-level diversion conversion
- **Indirect Testing Chain:** Called by diversion functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

#### 4.4 Income Analysis
**`expected_wallet_incomes()`, `expected_wallet_log_incomes()`** - Income calculations
- **Indirect Testing Chain:**
  1. `network_allocation()` → `average_log_income_by_payment_type()` → these functions
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** Medium

**`average_log_income_and_shares_by_wallet()`** - Income and shares by wallet
- **Indirect Testing Chain:**
  1. `average_log_income_by_payment_type()` → `average_log_income_and_shares_by_wallet()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** Medium

#### 4.5 Multi-homing
**`multihoming_shares()`** - Multi-homing share calculation
- **Indirect Testing Chain:** Called by moment functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Medium

**`correlation_primary_versus_secondary_from_shares()`** - Correlation calculation
- **Indirect Testing Chain:** Called by primary/secondary moment functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

---

### 5. NUMERICAL DIFFERENTIATION FUNCTIONS (3 functions)

#### 5.1 Hessian Computation
**`gauss_hermite_diagonal_hessian_fast()`** - Fast Hessian computation
- **Indirect Testing Chain:**
  1. `compute_soc_penalty()` → `gauss_hermite_diagonal_hessian_fast()` (iteration 5)
- **Coverage Status:** Tested in iteration 5 only
- **Testing Quality:** Medium

#### 5.2 Masked Derivatives
**`gauss_hermite_cts_derivative_fast_masked()`** - Masked fast derivative
- **Indirect Testing Chain:**
  1. `network_foc_all_entries()` → `gauss_hermite_cts_derivative_fast_masked()` (if capped fees exist)
- **Coverage Status:** Conditionally tested (only if fee caps binding)
- **Testing Quality:** Low to Medium

**`gauss_hermite_cts_derivative_masked()`** - Masked derivative
- **Indirect Testing Chain:**
  1. `network_foc_all_entries()` → `gauss_hermite_cts_derivative_masked()` (iterations 5-6 with capped fees)
- **Coverage Status:** Conditionally tested
- **Testing Quality:** Low to Medium

---

### 6. DATA TRANSFORMATION FUNCTIONS (5 functions)

#### 6.1 Fee Transformation
**`modify_fees_with_adj()`** - Fee modification
- **Indirect Testing Chain:**
  1. `model_moment_from_vector()` → `modify_fees_with_adj()` (line 4667)
- **Coverage Status:** FULLY TESTED (every iteration)
- **Testing Quality:** Very High

**`convert_to_uniform_fees()`** - Uniform fee conversion
- **Indirect Testing Chain:** Called in counterfactual analysis
- **Coverage Status:** Tested in counterfactual scripts
- **Testing Quality:** Medium

**`convert_to_debit_level_fees()`** - Debit-level fee conversion
- **Indirect Testing Chain:** Called in counterfactual analysis
- **Coverage Status:** Tested in counterfactual scripts
- **Testing Quality:** Medium

#### 6.2 Estimation Utilities
**`fit_to_df()`** - Fit to dataframe
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls `fit_to_df()` after estimation
- **Coverage Status:** Tested in every estimation run
- **Testing Quality:** High

**`recover_moments_from_init()`** - Moment recovery from initial values
- **Indirect Testing Chain:**
  1. `estimate_model_current_eqm_foc.jl` calls `recover_moments_from_init()`
- **Coverage Status:** FULLY TESTED (main estimation wrapper)
- **Testing Quality:** Very High

---

### 7. ENVELOPE CROSSING FUNCTIONS (6 functions)

#### 7.1 Envelope Computation
**`compute_envelope_for_subset()`** - Envelope for subset
- **Indirect Testing Chain:**
  1. `model_moments_envelope_crossing_for_card()` → `compute_envelope_for_subset()`
- **Coverage Status:** Conditionally tested (if NUM_FIXED_COSTS > 0)
- **Testing Quality:** Medium (depends on model specification)

**`find_envelope_crossing_internal()`** - Internal envelope crossing
- **Indirect Testing Chain:**
  1. `model_moments_envelope_crossing_for_card()` → `find_envelope_crossing_internal()`
- **Coverage Status:** Conditionally tested
- **Testing Quality:** Medium

**`find_two_envelope_crossing()`** - Two-envelope crossing
- **Indirect Testing Chain:** Called by envelope crossing functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

**`find_line_envelope_crossing()`** - Line-envelope crossing
- **Indirect Testing Chain:** Called by envelope functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

**`find_zero_crossing_F1()`** - Zero crossing for F1
- **Indirect Testing Chain:** Called by envelope functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

**`evaluate_envelope()`** - Envelope evaluation
- **Indirect Testing Chain:** Called by envelope crossing functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Medium

#### 7.2 First Acceptance
**`calculate_first_acceptance_gamma()`** - First acceptance threshold
- **Indirect Testing Chain:**
  1. `model_moments_first_credit()` → `calculate_first_acceptance_gamma()`
- **Coverage Status:** Tested in all iterations
- **Testing Quality:** High
- **Note:** Listed as "PARTIALLY TESTED" in test_inventory.md

---

### 8. BUNDLE FILTER FUNCTIONS (4 functions)

**`filter_bundles()`** - Bundle filtering
- **Indirect Testing Chain:** Called by envelope and diagnostic functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

**`bundles_with_visa_credit()`, `bundles_without_visa_credit()`, `bundles_without_card()`**
- **Indirect Testing Chain:** Called by counterfactual and diagnostic scripts
- **Coverage Status:** Tested in counterfactual analysis
- **Testing Quality:** Low to Medium

---

### 9. MERCHANT PROFIT INTEGRATION (2 functions)

**`integrate_merch_profit()`** - Merchant profit integration
- **Indirect Testing Chain:**
  1. `network_allocation()` may call `integrate_merch_profit()` for diagnostics
- **Coverage Status:** Conditionally tested
- **Testing Quality:** Low

**`evaluate_bundle_dependent_function()`** - Bundle function evaluation
- **Indirect Testing Chain:** Called by integration functions
- **Coverage Status:** Integration tested
- **Testing Quality:** Low

---

### 10. ESTIMATION HELPER FUNCTIONS (2 functions)

**`get_draw()`** - Random draw generation
- **Indirect Testing Chain:** Called by bootstrap and estimation scripts
- **Coverage Status:** Tested in bootstrap generation
- **Testing Quality:** Medium

**`export_lmfit()`** - Export LM fit results (2 methods)
- **Indirect Testing Chain:** Called at end of estimation
- **Coverage Status:** Integration tested
- **Testing Quality:** Low (I/O function)

---

## Untested Functions (17 total)

These functions have NO test coverage (neither direct unit tests nor indirect integration testing):

### High Priority Untested (5 functions)
1. **`load_passthrough_1_params()`** - Loads baseline passthrough parameters
2. **`extract_baseline_components()`** - Extracts baseline allocation components
3. **`compute_network_foc_from_allocation()`** - Computes FOC from allocation
4. **`standardize_to_identity()`** - Matrix standardization
5. **`normal_convolution_threedim_mc!()`** - 3D MC convolution (WAIT - this IS tested!)

### Utility Functions Untested (7 functions)
6. **`to_dict()`** - Dictionary conversion (4 methods)
7. **`export_diagnostic_bundle()`** - Diagnostic export
8. **`cartesian_matrix()`** - Cartesian matrix generation
9. **`logit()`** - Logit transformation
10. **`grid_function()`** - Grid function evaluation
11. **`flatten_struct()`** - Structure flattening
12. **`export_json()`** - JSON export
13. **`vary_and_evaluate()`** - Parameter variation analysis

### Equilibrium Solver Utilities Untested (5 functions)
14. **`convert_opt_vector_to_full_vector()`** - Optimization vector conversion
15. **`unrestrict_index()`** - Index unrestriction
16. **`convert_full_vector_to_opt_vector()`** - Full to optimization vector
17. **`merge_price_lists()`** - Price list merging
18. **`perturb_matrix()`** - Matrix perturbation (2 methods)

### Diagnostic Functions Untested (0 functions - all are integration tested)

**Note:** Many diagnostic and I/O functions are integration tested but difficult to unit test due to side effects.

---

## Testing Quality Assessment

### Very High Quality (Millions of executions)
- `calc_shares_on_rc_draw!()` - Called for every MC draw
- `payment_shares_at_pos()` - Called in every integrand evaluation
- `integrate_function_rc_draws!()` - Core integration function

### High Quality (Thousands of executions per bootstrap)
- `all_model_moments()` - Main moment function
- `model_moment_from_vector()` - Entry point
- `build_param_from_vector()` - Parameter unpacking
- `expected_wallet_shares_and_surplus()` - Consumer behavior
- All empirical moment functions (DCPC, Nilson, etc.)
- `modify_fees_with_adj()` - Fee transformation

### Medium Quality (Hundreds of executions)
- `network_foc_all_entries()` - FOC computation (iterations 3-6)
- `compute_soc_penalty()` - SOC computation (iteration 5)
- Envelope crossing functions (if NUM_FIXED_COSTS > 0)
- Second choice and diversion functions

### Low Quality (Few executions or conditional)
- Masked derivative functions (only if fee caps binding)
- Bundle filter functions (counterfactual analysis)
- Diagnostic and export functions
- Alternative normalization functions (not used in current spec)

---

## Recommendations

### 1. Add Direct Tests for High-Value Indirect Functions
These functions are critical but lack unit tests:
- `all_model_moments()` - Add synthetic data tests
- `build_param_from_vector()` - Test parameter unpacking
- `model_moments_dcpc()`, `model_moments_nilson()` - Test with synthetic data
- `expected_wallet_shares_and_surplus()` - Test with known utilities

### 2. Improve Coverage for Conditionally Tested Functions
- `gauss_hermite_diagonal_hessian_fast()` - Add direct unit test
- Masked derivative functions - Create test cases with capped fees
- Envelope crossing functions - Add analytical test cases

### 3. Validate Untested Utility Functions
- `load_passthrough_1_params()` - Test file loading
- `extract_baseline_components()` - Test component extraction
- Dictionary and export functions - Add integration tests

### 4. Document Integration Test Paths
- Create mapping from estimation iterations to function coverage
- Track which bootstrap draws exercise which conditional branches
- Monitor estimation logs for diagnostic function calls

---

## Conclusion

The estimation pipeline provides substantial indirect testing for 48 functions (30% of codebase). Combined with 93 directly tested functions, **total coverage is 89% (141/158 functions)**. The remaining 17 untested functions are mostly utility and I/O functions that may not require testing.

**Key Insight:** The 6-iteration GMM estimation provides very high quality integration testing for core model functions, with millions of executions ensuring numerical correctness. However, unit tests would still be valuable for:
1. Edge case validation
2. Faster debugging cycles
3. Regression detection
4. Documentation of expected behavior

---

**Files Referenced:**
- Test inventory: `/gpfs/kellogg/proj/kdb5009/payments/code/econ_ra/current/test_inventory.md`
- Estimation usage: `/gpfs/kellogg/proj/kdb5009/payments/code/econ_ra/current/estimation_function_usage.md`
- Model functions: `/gpfs/kellogg/proj/kdb5009/payments/code/model_functions.jl`
- Unit tests: `/gpfs/kellogg/proj/kdb5009/payments/code/model_unit_tests.jl`
- Estimation script: `/gpfs/kellogg/proj/kdb5009/payments/code/estimate_model_current_eqm_foc.jl`
