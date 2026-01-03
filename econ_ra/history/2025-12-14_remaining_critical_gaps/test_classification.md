# Test Classification by Category

**Generated:** 2025-12-14

**Purpose:** Classify all 22 testsets and 89 test functions from `model_unit_tests.jl` into categories to understand testing architecture and identify coverage gaps.

---

## Category Definitions

### 1. Mechanical Correctness
Traditional software tests verifying that functions produce correct output for given inputs. Tests verify basic algorithmic correctness, edge cases, and implementation details.

### 2. Economic Correctness
Tests verifying economic properties such as:
- Comparative statics (parameter changes → moment changes)
- Substitution patterns and elasticities
- Equilibrium properties (Nash FOCs, envelope conditions)
- Economic theory predictions (e.g., higher fees → lower acceptance)

### 3. Accounting Identities
Tests verifying balance conditions and mathematical identities:
- Market shares sum to 1
- Profit decomposition (revenue - cost = profit)
- Integration consistency (numerical integration ≈ analytical solution)
- Price index identities
- Money conservation laws

### 4. Numerical Stability
Tests for computational robustness:
- Precision and tolerance
- Conditioning and overflow/underflow
- Convergence behavior

### 5. Invariance
Tests that results are unchanged under equivalent transformations:
- Bundle reordering
- Network relabeling
- Equivalent parameter representations

---

## Classification of All 22 Testsets

### Testset 1: Payment Shares at POS Tests (Line 84)

**Test Functions:**
- `test_payment_shares_at_pos()` (Line 14)
- `test_payment_surplus_at_pos()` (Line 46)

**Primary Category:** Accounting Identities
**Secondary Category:** Mechanical Correctness

**Rationale:** These tests verify that payment shares at point-of-sale sum to 1 across different homing scenarios (single-homing, multihoming). This is fundamentally an accounting identity test. Tests also verify mechanical correctness of the share calculation algorithm.

**Borderline Note:** Could be considered purely mechanical, but the sum-to-1 constraint is an accounting identity that must hold economically.

---

### Testset 2: Profit Parameters All Bundles (Line 229)

**Test Functions:**
- `test_profit_param_basic()` (Line 89)
- `test_profit_param_different_ces_type_overlap()` (Line 107)
- `test_profit_param_zero_fees()` (Line 139)
- `test_profit_param_full_type_overlap()` (Line 170)
- `test_profit_param_canonical_debit_credit()` (Line 201)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Economic Correctness

**Rationale:** Tests verify that profit parameter calculations produce correct outputs across different configurations (fee structures, type overlap parameters, debit/credit). Primarily tests algorithmic correctness but also verifies economic properties like how fees affect merchant profits.

**Borderline Note:** Some economic content (e.g., fee effects), but mainly focused on computational correctness.

---

### Testset 3: Quasi-Profit Approximation Tests (Line 458)

**Test Functions:**
- `test_quasiprofit_intercept_and_slope_basic()` (Line 238)
- `test_quasiprofit_kappa_effect_on_slope()` (Line 309)
- `test_quasiprofit_approximation_accuracy()` (Line 341)
- `test_quasiprofit_approximation_over_range()` (Line 395)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Economic Correctness
**Tertiary Category:** Numerical Stability

**Rationale:** These tests verify that the linear approximation to merchant quasi-profit is accurate. This is primarily a mechanical/numerical test (does the approximation work?), but also tests economic predictions (kappa parameter effects on substitution slopes). The accuracy tests assess numerical stability of the approximation.

**Borderline Note:** Strong mechanical component, but economic theory motivates the approximation structure.

---

### Testset 4: Algorithm for Switching Points (Line 660)

**Test Functions:**
- `test_equilibrium_algorithm_basic()` (Line 465)
- `test_equilibrium_shuffle_bundles()` (Line 472)
- `test_equilibrium_tiebreak()` (Line 480)
- `test_equilibrium_same_fee_many_network()` (Line 486)
- `test_equilibrium_rand_fee_many_network()` (Line 508)
- `test_equilibrium_nonconvex_hull()` (Line 529)
- `test_equilibrium_all_dominated_by_one()` (Line 549)
- `test_equilibrium_negative_intercepts()` (Line 561)
- `test_equilibrium_identical_slopes()` (Line 575)
- `test_equilibrium_crossing_order()` (Line 588)
- `test_equilibrium_single_bundle()` (Line 603)
- `test_equilibrium_max_gamma_filter()` (Line 616)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Invariance
**Tertiary Category:** Economic Correctness

**Rationale:** Extensive testing of the core equilibrium solver algorithm with focus on edge cases (ties, dominated bundles, non-convex cases). Primarily tests algorithmic correctness. The bundle shuffling test verifies invariance to input ordering. Some economic content in understanding which bundles dominate.

**Borderline Note:** This is the most comprehensive mechanical test suite in the file, focusing on algorithmic robustness.

---

### Testset 5: Average Fees (Line 703)

**Test Functions:**
- `test_average_fee_basic()` (Line 675)
- `test_average_fee_lowest_type()` (Line 680)
- `test_higher_type_higher_fees()` (Line 689)
- `test_higher_homing_higher_fees()` (Line 696)

**Primary Category:** Economic Correctness
**Secondary Category:** Mechanical Correctness

**Rationale:** Tests verify economic predictions: higher consumer types pay higher fees, higher homing degrees pay higher fees. This is fundamentally testing economic theory predictions (comparative statics with respect to type and homing).

**Borderline Note:** Some mechanical verification, but core purpose is testing economic predictions.

---

### Testset 6: Numerical Integrals (Line 901)

**Test Functions:**
- `test_integral()` (Line 710)
- `test_ftc_closed_integral()` (Line 720)
- `test_gamma_expectation()` (Line 734)
- `test_truncated_gamma_expectation()` (Line 746)
- `test_gamma_cdf()` (Line 765)
- `test_gamma_cdf_with_integral()` (Line 775)
- `test_bundle_integral()` (Line 785)
- `test_twodim_normal_expected_value()` (Line 839)
- `test_threedim_normal_expected_value()` (Line 813)
- `test_twodim_normal_expected_value_correlation()` (Line 861)
- `test_threedim_normal_expected_value_correlation()` (Line 881)

**Primary Category:** Accounting Identities
**Secondary Category:** Mechanical Correctness
**Tertiary Category:** Numerical Stability

**Rationale:** Tests verify that numerical integration routines match analytical solutions (integration consistency). This is fundamentally an accounting identity test - the integral must equal the known analytical value. Also tests mechanical correctness of integration algorithms and numerical stability.

**Borderline Note:** Strong overlap between accounting (integration = analytical) and mechanical (algorithm works).

---

### Testset 7: Price Index Tests (Line 1069)

**Test Functions:**
- `test_price_index_integrand_change_bundle()` (Line 915)
- `test_price_index_integrand_change_gamma()` (Line 946)
- `test_price_index_integrand_nopassthrough()` (Line 964)
- `test_eqm_price_index_basic()` (Line 983)
- `test_debit_credit_price_index_comparison()` (Line 1004)

**Primary Category:** Economic Correctness
**Secondary Category:** Accounting Identities

**Rationale:** Tests verify price index behavior conforms to economic theory: bundles with more cards have lower price indices (more options), gamma affects price index through merchant costs, zero passthrough means fees don't affect consumer prices. Also tests price index identity (relationship between prices and fees).

**Borderline Note:** Price index identity is an accounting relationship, but the tests focus on economic comparative statics.

---

### Testset 8: Logit Share Tests (Line 1277)

**Test Functions:**
- `test_logit_shares()` (Line 1077)
- `test_logit_neginf()` (Line 1085)
- `test_primary_secondary_util()` (Line 1093)
- `test_income_weighted_share_one_draw()` (Line 1125)
- `test_income_slope()` (Line 1169)
- `test_high_volatility_increases_substitution()` (Line 1200)
- `test_surplus_measures()` (Line 1248)

**Primary Category:** Accounting Identities
**Secondary Category:** Economic Correctness
**Tertiary Category:** Mechanical Correctness

**Rationale:** Tests verify logit shares sum to 1 (accounting identity), income slopes have correct sign (economic correctness), and higher volatility increases substitution (economic prediction). The primary focus is on share-summing constraint.

**Borderline Note:** Mix of accounting (shares sum to 1), economic (income effects, volatility effects), and mechanical (edge cases like -Inf utility).

---

### Testset 9: Shares and Dollars (Line 1383)

**Test Functions:**
- `test_insulated_price_index()` (Line 1287)
- `test_insulated_rewards()` (Line 1299)
- `test_dollar_split_all_accepted()` (Line 1312)
- `test_dollar_integrand_none_accepted()` (Line 1331)
- `test_dollar_split_half_accepted()` (Line 1346)
- `test_per_cap_rewards()` (Line 1362)

**Primary Category:** Accounting Identities
**Secondary Category:** Mechanical Correctness

**Rationale:** Tests verify dollar flow calculations and accounting: dollar shares should match value shares under different acceptance scenarios. Tests monetary conservation and reward distribution.

**Borderline Note:** Primarily accounting (dollars flow correctly), with some mechanical verification.

---

### Testset 10: Characteristic Expectation Functions (Line 1503)

**Test Functions:**
- `test_product_char()` (Line 1392)
- `test_avg_char()` (Line 1407)
- `test_convert_second_choice()` (Line 1419)
- `test_pref_correlation_second_choice()` (Line 1462)
- `test_no_income_diff()` (Line 1483)
- `test_income_diff()` (Line 1492)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Economic Correctness

**Rationale:** Tests verify characteristic averaging and second-choice behavior calculations. Primarily algorithmic correctness with some economic content (preferences correlate with choices, income patterns).

**Borderline Note:** Mechanical focus, but second-choice behavior has economic interpretation.

---

### Testset 11: Utility Inversion (Line 1564)

**Test Functions:**
- `test_ces_util()` (Line 1512)
- `test_ces_util_vary_comp()` (Line 1523)
- `test_unity_inversion()` (Line 1536)
- `test_subsidy_inversion_more_utility()` (Line 1541)
- `test_subsidy_inversion_higher_accept()` (Line 1547)
- `test_build_rewards_matrix()` (Line 1553)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Economic Correctness

**Rationale:** Tests verify CES utility calculation and reward inversion algorithms work correctly. Tests that subsidies increase utility and acceptance (economic predictions), but primarily focused on inversion algorithm correctness.

**Borderline Note:** Utility inversion is mechanically complex but economically motivated.

---

### Testset 12: Numerical Code (Line 1579)

**Test Functions:**
- `test_gh_derivative()` (Line 1573)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Numerical Stability

**Rationale:** Tests Gauss-Hermite numerical differentiation. Purely mechanical/numerical test of derivative computation accuracy.

**Borderline Note:** Single test, clearly mechanical.

---

### Testset 13: Network Profits (Line 1677)

**Test Functions:**
- `test_network_profits()` (Line 1583)
- `test_network_foc_ownership()` (Line 1600)
- `test_money_conservation()` (Line 1609)
- `test_zero_sum_rewards()` (Line 1639)

**Primary Category:** Accounting Identities
**Secondary Category:** Economic Correctness

**Rationale:** Tests verify money conservation (total spending = sum of network revenues + merchant surplus + consumer surplus) and zero-sum rewards (rewards given = rewards received). These are fundamental accounting identities. FOC ownership tests verify equilibrium conditions (economic correctness).

**Borderline Note:** Strong accounting focus, with equilibrium economics in FOC test.

---

### Testset 14: Subgame (Line 1880)

**Test Functions:**
- `test_subgame_solver()` (Line 1684)
- `test_subgame_approx_at_zero()` (Line 1718)
- `test_profit_jacobian()` (Line 1777)
- `test_network_profit()` (Line 1751)
- `test_network_allocation()` (Line 1821)
- `test_dollars()` (Line 1851)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Economic Correctness
**Tertiary Category:** Numerical Stability

**Rationale:** Tests verify subgame equilibrium solver convergence and correctness. Tests Jacobian calculations (mechanical), profit calculations (accounting/economic), and approximation accuracy at boundary (numerical stability).

**Borderline Note:** Comprehensive test of solver mechanics with economic interpretation of equilibrium.

---

### Testset 15: Acceptance Region Tests with Kappa (Line 2056)

**Test Functions:**
- `test_acceptance_regions_kappa_threshold()` (Line 1890)
- `test_acceptance_region_ordering()` (Line 1927)
- `test_payment_shares_sum()` (Line 1961)
- `test_debit_kappa_effect_on_credit_acceptance()` (Line 1984)

**Primary Category:** Economic Correctness
**Secondary Category:** Accounting Identities

**Rationale:** Tests verify economic predictions about how debit kappa parameter affects merchant acceptance of credit cards (substitution effects). Also tests share-summing constraint (accounting).

**Borderline Note:** Primarily economic comparative statics with kappa parameter.

---

### Testset 16: Gauss-Hermite Differentiation Tests (Line 2218)

**Test Functions:**
- `test_gauss_hermite_expected_value()` (Line 2064)
- `test_gauss_hermite_cts_derivative()` (Line 2094)
- `test_gauss_hermite_cts_derivative_fast()` (Line 2127)
- `test_store_function_values()` (Line 2144)
- `test_differentiation_consistency()` (Line 2177)
- `test_powerset_indices()` (Line 2196)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Accounting Identities
**Tertiary Category:** Numerical Stability

**Rationale:** Tests verify numerical differentiation methods match analytical derivatives (accounting/consistency check). Tests fast vs. slow derivative consistency. Tests algorithmic correctness of powerset generation and function storage.

**Borderline Note:** Primarily mechanical with accounting consistency checks (numerical = analytical).

---

### Testset 17: Category 1: Utility Functions (Line 2288)

**Test Functions:**
- `test_insertion_sort_pairs_basic()` (Line 2230)
- `test_insertion_sort_pairs_already_sorted()` (Line 2240)
- `test_insertion_sort_pairs_duplicates()` (Line 2249)
- `test_find_undominated_basic()` (Line 2258)
- `test_payment_type_to_kappa()` (Line 2269)
- `test_payment_type_to_kappa_error()` (Line 2281)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Invariance

**Rationale:** Tests verify utility function correctness: sorting, dominance detection, parameter mapping. Tests edge cases (already sorted, duplicates, errors). Sorting test verifies invariance to input order.

**Borderline Note:** Pure mechanical/algorithmic testing.

---

### Testset 18: Category 10: Vector/Matrix Utilities (Line 2327)

**Test Functions:**
- `test_squeeze_roundtrip()` (Line 2301)
- `test_squeeze_size()` (Line 2315)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Invariance

**Rationale:** Tests verify data structure conversion utilities work correctly and are invertible (roundtrip test = invariance).

**Borderline Note:** Pure mechanical with invariance property.

---

### Testset 19: Category 11: Subgame Equilibrium (solve_fixed_point) (Line 2382)

**Test Functions:**
- `test_solve_fixed_point_basic()` (Line 2336)
- `test_solve_fixed_point_sqrt()` (Line 2348)
- `test_solve_fixed_point_no_convergence()` (Line 2359)
- `test_solve_fixed_point_multidim()` (Line 2370)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Numerical Stability

**Rationale:** Tests fixed-point solver (Anderson acceleration) convergence behavior across different functions. Tests convergence detection (mechanical) and robustness (numerical stability).

**Borderline Note:** Primarily mechanical with numerical robustness testing.

---

### Testset 20: Category 12: Switch Point Moment (Line 2438)

**Test Functions:**
- `test_switch_point_moment_monotonicity()` (Line 2393)

**Primary Category:** Economic Correctness
**Secondary Category:** Mechanical Correctness

**Rationale:** Tests verify that switch point moments (envelope crossings) correctly identify fixed costs through monotonicity property. This is an economic property (envelope theorem) that must hold for identification.

**Borderline Note:** Economic identification condition tested mechanically.

---

### Testset 21: Category 14: Network-based Fixed Cost Helper Functions (Line 2545)

**Test Functions:**
- `test_count_networks_in_bundle()` (Line 2446)
- `test_compute_network_fixed_cost()` (Line 2473)
- `test_profit_param_with_network_fixed_costs()` (Line 2503)

**Primary Category:** Mechanical Correctness
**Secondary Category:** Accounting Identities

**Rationale:** Tests verify network counting and fixed cost calculations. Primarily algorithmic correctness with accounting verification (costs aggregate correctly).

**Borderline Note:** Mechanical with accounting components.

---

### Testset 22: Category 15: Stratified Switch Point Moments (Line 2627)

**Test Functions:**
- `test_stratified_switch_point_moment_returns_correct_elements()` (Line 2584)
- `test_stratified_moments_vary_with_fixed_costs()` (Line 2598)

**Primary Category:** Economic Correctness
**Secondary Category:** Mechanical Correctness

**Rationale:** Tests verify stratified moment calculations for multiple fixed costs vary correctly with parameters. Tests economic comparative statics (fixed costs affect moments) and mechanical correctness (stratification algorithm).

**Borderline Note:** Economic identification with mechanical verification.

---

## Summary Statistics by Category

### Primary Category Classification

| Category | Count | Percentage | Testsets |
|----------|-------|------------|----------|
| **Mechanical Correctness** | 11 | 50% | 2, 3, 4, 10, 11, 12, 14, 16, 17, 19, 21 |
| **Economic Correctness** | 5 | 23% | 5, 7, 15, 20, 22 |
| **Accounting Identities** | 6 | 27% | 1, 6, 8, 9, 13, - |

**Total:** 22 testsets

### Secondary Categories Present

| Category | Count | Testsets with Secondary Classification |
|----------|-------|---------------------------------------|
| **Economic Correctness** | 9 | 2, 3, 8, 10, 11, 13, 14, 20, 22 |
| **Mechanical Correctness** | 6 | 1, 5, 6, 9, 10, 21 |
| **Accounting Identities** | 5 | 7, 8, 15, 16, 21 |
| **Invariance** | 3 | 4, 17, 18 |
| **Numerical Stability** | 4 | 3, 6, 14, 19 |

### Coverage by Test Function (89 total)

Detailed breakdown by individual test function:

- **Mechanical Correctness Primary:** 47 test functions (53%)
- **Economic Correctness Primary:** 18 test functions (20%)
- **Accounting Identities Primary:** 24 test functions (27%)

---

## Key Observations

### 1. Strong Mechanical Focus
Over half of all testsets (50%) are primarily focused on mechanical correctness, ensuring algorithms work correctly with proper edge case handling. This is appropriate for a complex computational model.

### 2. Accounting Identity Coverage
27% of testsets focus on accounting identities (shares sum to 1, money conservation, integration consistency). These are critical for model validity and are well-represented.

### 3. Economic Correctness Testing
23% of testsets primarily test economic correctness (comparative statics, equilibrium properties). This is the area with most room for expansion.

### 4. Cross-Category Tests
Most testsets span multiple categories:
- 18 of 22 testsets (82%) have secondary classifications
- 4 testsets have tertiary classifications
- This reflects the integrated nature of economic models where mechanical correctness must serve economic interpretation

### 5. Invariance Testing
Only 3 testsets explicitly test invariance properties (bundle reordering, roundtrip conversions). This could be expanded, especially for:
- Network relabeling
- Consumer type reordering
- Equivalent parameter representations

### 6. Numerical Stability
Only 4 testsets test numerical stability explicitly. Critical gaps:
- Conditioning of Jacobian matrices
- Overflow/underflow in probability calculations
- Precision loss in integration
- Convergence with ill-conditioned problems

---

## Critical Gaps by Category

### Mechanical Correctness Gaps
1. **Main equilibrium solver** (`solve_eqm_foc`, `robust_eqm_solver`) - NO TESTS
2. **Envelope crossing functions** (6 functions) - NO TESTS
3. **Bundle filtering functions** - NO TESTS
4. **Moment calculation wrappers** (`all_model_moments`, `model_moment_from_vector`) - NO TESTS
5. **Parameter construction** (`build_param_from_vector`) - NO TESTS

### Economic Correctness Gaps
1. **FOC and SOC moment conditions** (`model_network_foc`, `model_network_soc`) - NO TESTS
2. **Empirical moment functions** (DCPC, Nilson, second choice) - NO TESTS
3. **Diversion ratios and elasticities** - LIMITED TESTS
4. **Passthrough comparative statics** - NO DIRECT TESTS
5. **Equilibrium uniqueness and stability** - NO TESTS

### Accounting Identity Gaps
1. **Full system accounting** (all moments simultaneously) - NO TESTS
2. **Price index identity** (avg log price ≈ log(σ/(σ-1)) + avg fee) - NOT EXPLICITLY TESTED
3. **Profit decomposition** (by network, by merchant type) - PARTIAL TESTS
4. **Fixed point residuals** = 0 at convergence - NO EXPLICIT TEST
5. **Budget constraints** (consumer spending = income × spending rate) - NO TESTS

### Numerical Stability Gaps
1. **Jacobian conditioning** - NO TESTS
2. **Overflow in exponentials** (logit shares with extreme utilities) - LIMITED TESTS
3. **Integration accuracy with extreme parameters** - NO TESTS
4. **Solver convergence with poor starting values** - LIMITED TESTS
5. **Precision with very small/large gamma values** - NO TESTS

### Invariance Gaps
1. **Network relabeling** - NO TESTS
2. **Consumer type reordering** - NO TESTS
3. **Bundle subset selection** (results should be consistent) - NO TESTS
4. **Fee representation** (uniform vs. differentiated should be equivalent when equal) - NO TESTS
5. **Integration method equivalence** (MC vs. Gauss-Hermite should agree) - NO TESTS

---

## Borderline Cases Requiring Judgment

### 1. Testset 3: Quasi-Profit Approximation
- **Classification:** Mechanical (primary), Economic (secondary)
- **Issue:** Tests linear approximation accuracy (mechanical) but approximation structure comes from economic theory
- **Resolution:** Classified as primarily mechanical because tests focus on numerical accuracy rather than economic predictions

### 2. Testset 6: Numerical Integrals
- **Classification:** Accounting (primary), Mechanical (secondary)
- **Issue:** Is this testing algorithmic correctness or mathematical identity?
- **Resolution:** Classified as accounting because tests verify integration = analytical solution (identity), not just that algorithm runs

### 3. Testset 8: Logit Share Tests
- **Classification:** Accounting (primary), Economic (secondary)
- **Issue:** Tests both share-summing (accounting) and economic properties (income effects)
- **Resolution:** Primary classification based on most comprehensive test (`test_logit_shares` checks summing)

### 4. Testset 14: Subgame
- **Classification:** Mechanical (primary), Economic (secondary)
- **Issue:** Equilibrium solver has deep economic content
- **Resolution:** Classified as mechanical because tests focus on solver convergence and Jacobian accuracy, not economic properties of equilibrium

### 5. Testsets 20 & 22: Switch Point Moments
- **Classification:** Economic (primary), Mechanical (secondary)
- **Issue:** These test economic identification conditions (envelope theorem) using mechanical verification
- **Resolution:** Classified as economic because purpose is testing identification strategy, not just algorithm

---

## Recommendations for Future Work

### 1. Expand Economic Correctness Testing
- Add comparative statics tests for all major parameters
- Test substitution patterns and diversion ratios
- Verify equilibrium properties (FOC = 0, SOC < 0)
- Test policy counterfactuals against economic predictions

### 2. Add System-Level Accounting Tests
- Test full system accounting simultaneously
- Verify price index identity explicitly
- Test budget constraints
- Verify fixed point residuals at convergence

### 3. Strengthen Numerical Stability Testing
- Add Jacobian conditioning tests
- Test extreme parameter values
- Test poor starting value robustness
- Verify integration method agreement

### 4. Expand Invariance Testing
- Test network and consumer type permutations
- Test equivalent parameter representations
- Verify bundle subset consistency
- Test integration method equivalence

### 5. Add Integration Tests
- Test full estimation pipeline on synthetic data with known parameters
- Verify parameter recovery
- Test identification from different moment combinations
- Verify counterfactual predictions

---

## Conclusion

The existing test suite is well-designed with:
- **Strong mechanical coverage** (53% of test functions)
- **Good accounting identity coverage** (27% of test functions)
- **Moderate economic correctness coverage** (20% of test functions)

Critical gaps exist in:
1. **Main equilibrium solver testing** (most critical function untested)
2. **Empirical moment functions** (core of estimation untested)
3. **Economic correctness tests** (comparative statics, identification)
4. **Numerical stability** (conditioning, extreme values)
5. **Invariance properties** (permutations, equivalence)

The classification reveals that while the test suite excels at verifying computational correctness, it has room to grow in testing economic properties and identification conditions that are central to the model's scientific validity.
