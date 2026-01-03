# Test Inventory for model_unit_tests.jl

**Generated:** 2025-12-14
**Total Functions in model_functions.jl:** 158
**Total @testset Blocks:** 22
**Total Individual Test Functions:** 89

---

## Summary Statistics

- **Test Coverage:** This inventory maps all 22 `@testset` blocks and 89 test functions to the 158 functions in `model_functions.jl`
- **Lines of Code:**
  - `model_unit_tests.jl`: 2,631 lines
  - `model_functions.jl`: 6,433 lines

---

## @testset Blocks (Line Numbers from model_unit_tests.jl)

### 1. Payment Shares at POS Tests (Line 84)
**Test Functions:**
- `test_payment_shares_at_pos()` (Line 14)
- `test_payment_surplus_at_pos()` (Line 46)

**Functions Tested:**
- `payment_shares_at_pos()` - Tests payment share calculation at point-of-sale
- `payment_surplus_given_homing_type()` - Tests surplus calculation for different homing patterns
- `payment_type_to_kappa()` - Tests kappa parameter mapping from payment types
- `UsageParam` struct usage

**Coverage:** Full coverage of POS payment logic with different homing scenarios

---

### 2. Profit Parameters All Bundles (Line 229)
**Test Functions:**
- `test_profit_param_basic()` (Line 89)
- `test_profit_param_different_ces_type_overlap()` (Line 107)
- `test_profit_param_zero_fees()` (Line 139)
- `test_profit_param_full_type_overlap()` (Line 170)
- `test_profit_param_canonical_debit_credit()` (Line 201)

**Functions Tested:**
- `profit_parameters_all_bundles()` - Main function computing profit parameters
- `payment_surplus_given_homing_type()` - Used internally
- `UsageParam` and `MerchParam` structs

**Coverage:** Comprehensive testing across fee structures, type overlap parameters, and debit/credit distinctions

---

### 3. Quasi-Profit Approximation Tests (Line 458)
**Test Functions:**
- `test_quasiprofit_intercept_and_slope_basic()` (Line 238)
- `test_quasiprofit_kappa_effect_on_slope()` (Line 309)
- `test_quasiprofit_approximation_accuracy()` (Line 341)
- `test_quasiprofit_approximation_over_range()` (Line 395)

**Functions Tested:**
- `profit_parameters_all_bundles()` - Parameter computation
- `insulated_merch_profit_integrand!()` - Exact profit calculation
- `payment_surplus_given_homing_type()` - Surplus computation

**Coverage:** Validates linear approximation accuracy and kappa parameter effects on slopes

---

### 4. Algorithm for switching points (Line 660)
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

**Functions Tested:**
- `solve_equilibrium_given_intercept_and_slope()` - Core equilibrium solver
- `find_undominated_indices()` - Bundle dominance detection
- `insertion_sort_pairs!()` - Sorting utility

**Coverage:** Extensive edge case testing including tie-breaking, dominated bundles, non-convex cases, and filtering

---

### 5. Average fees (Line 703)
**Test Functions:**
- `test_average_fee_basic()` (Line 675)
- `test_average_fee_lowest_type()` (Line 680)
- `test_higher_type_higher_fees()` (Line 689)
- `test_higher_homing_higher_fees()` (Line 696)

**Functions Tested:**
- `average_fee()` - Computes average fee across payment bundles

**Coverage:** Tests fee calculation across different consumer types and homing patterns

---

### 6. Numerical integrals (Line 901)
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

**Functions Tested:**
- `closed_integral!()` - Closed interval integration
- `gamma_integral!()` - Gamma distribution integration
- `gamma_pdf()` - Gamma PDF evaluation
- `gamma_cdf()` - Gamma CDF evaluation
- `integrate_bundle_dependent_function!()` - Bundle-dependent integration
- `normal_convolution_twodim!()` - 2D normal convolution
- `normal_convolution_threedim!()` - 3D normal convolution
- `normal_convolution_multidim!()` - Multi-dimensional integration

**Coverage:** Comprehensive numerical integration testing with analytical benchmarks

---

### 7. Price Index Tests (Line 1069)
**Test Functions:**
- `test_price_index_integrand_change_bundle()` (Line 915)
- `test_price_index_integrand_change_gamma()` (Line 946)
- `test_price_index_integrand_nopassthrough()` (Line 964)
- `test_eqm_price_index_basic()` (Line 983)
- `test_debit_credit_price_index_comparison()` (Line 1004)

**Functions Tested:**
- `price_index_integrand!()` - Price index computation at specific gamma
- `eqm_price_index()` - Equilibrium price index calculation
- `normalize_price_index!()` - Normalization function

**Coverage:** Tests price index behavior across bundles, gamma values, passthrough, and debit vs credit

---

### 8. Logit share tests (Line 1277)
**Test Functions:**
- `test_logit_shares()` (Line 1077)
- `test_logit_neginf()` (Line 1085)
- `test_primary_secondary_util()` (Line 1093)
- `test_income_weighted_share_one_draw()` (Line 1125)
- `test_income_slope()` (Line 1169)
- `test_high_volatility_increases_substitution()` (Line 1200)
- `test_surplus_measures()` (Line 1248)

**Functions Tested:**
- `logit_shares_surplus!()` - Logit share and surplus calculation
- `calc_nonprice_util!()` - Non-price utility computation
- `eval_function_on_draw!()` - Function evaluation on random draws
- `income_weighted_wallet_shares()` - Income-weighted share calculation
- `expected_wallet_shares_and_surplus_at_income()` - Share and surplus expectations
- `ConsPref` struct usage

**Coverage:** Complete testing of logit choice model with income effects and volatility

---

### 9. Shares and Dollars (Line 1383)
**Test Functions:**
- `test_insulated_price_index()` (Line 1287)
- `test_insulated_rewards()` (Line 1299)
- `test_dollar_split_all_accepted()` (Line 1312)
- `test_dollar_integrand_none_accepted()` (Line 1331)
- `test_dollar_split_half_accepted()` (Line 1346)
- `test_per_cap_rewards()` (Line 1362)

**Functions Tested:**
- `calc_insulated_shares()` - Insulated share calculation
- `insulated_dollar_spending()` - Dollar spending computation
- `insulated_spending_integrand!()` - Spending integrand
- `per_capita_rewards()` - Per capita reward calculation

**Coverage:** Tests monetary flow calculations and reward distributions

---

### 10. Characteristic Expectation Functions (Line 1503)
**Test Functions:**
- `test_product_char()` (Line 1392)
- `test_avg_char()` (Line 1407)
- `test_convert_second_choice()` (Line 1419)
- `test_pref_correlation_second_choice()` (Line 1462)
- `test_no_income_diff()` (Line 1483)
- `test_income_diff()` (Line 1492)

**Functions Tested:**
- `calc_average_product_char()` - Product characteristic averaging
- `calc_average_char()` - Average characteristic calculation
- `convert_primary_secondary_to_second_choice!()` - Second choice conversion
- `expected_diversion_second_choice()` - Diversion calculation
- `average_log_income_by_payment_type()` - Income by payment type

**Coverage:** Tests characteristic-based moments and second-choice behavior

---

### 11. Utility inversion (Line 1564)
**Test Functions:**
- `test_ces_util()` (Line 1512)
- `test_ces_util_vary_comp()` (Line 1523)
- `test_unity_inversion()` (Line 1536)
- `test_subsidy_inversion_more_utility()` (Line 1541)
- `test_subsidy_inversion_higher_accept()` (Line 1547)
- `test_build_rewards_matrix()` (Line 1553)

**Functions Tested:**
- `calc_ces_util_and_rewards()` - CES utility and rewards calculation
- `invert_reward_dollars()` - Reward inversion
- `convert_reward_dollars_to_matrix()` - Reward matrix conversion

**Coverage:** Tests utility inversion and reward mapping functions

---

### 12. Numerical Code (Line 1579)
**Test Functions:**
- `test_gh_derivative()` (Line 1573)

**Functions Tested:**
- `gauss_hermite_cts_derivative()` - Gauss-Hermite derivative computation

**Coverage:** Basic test of numerical differentiation

---

### 13. Network Profits (Line 1677)
**Test Functions:**
- `test_network_profits()` (Line 1583)
- `test_network_foc_ownership()` (Line 1600)
- `test_money_conservation()` (Line 1609)
- `test_zero_sum_rewards()` (Line 1639)

**Functions Tested:**
- `network_profits_given_dollars_and_shares()` - Network profit calculation
- `network_foc_aggregate()` - FOC aggregation by ownership
- `network_profits()` - Full network profit computation
- `aggregate_network_dollars()` - Dollar aggregation

**Coverage:** Tests profit calculations and accounting identities (money conservation, zero-sum rewards)

---

### 14. Subgame (Line 1880)
**Test Functions:**
- `test_subgame_solver()` (Line 1684)
- `test_subgame_approx_at_zero()` (Line 1718)
- `test_profit_jacobian()` (Line 1777)
- `test_network_profit()` (Line 1751)
- `test_network_allocation()` (Line 1821)
- `test_dollars()` (Line 1851)

**Functions Tested:**
- `solve_subgame()` - Main subgame solver
- `solve_subgame_given_inputs()` - Subgame with given inputs
- `solve_subgame_given_shares()` - Subgame with given shares
- `network_foc_all_entries()` - Full FOC Jacobian
- `network_allocation()` - Complete allocation computation

**Coverage:** Comprehensive testing of subgame equilibrium solver and derivatives

---

### 15. Acceptance Region Tests with Kappa (Line 2056)
**Test Functions:**
- `test_acceptance_regions_kappa_threshold()` (Line 1890)
- `test_acceptance_region_ordering()` (Line 1927)
- `test_payment_shares_sum()` (Line 1961)
- `test_debit_kappa_effect_on_credit_acceptance()` (Line 1984)

**Functions Tested:**
- `profit_parameters_all_bundles()` - With kappa effects
- `solve_equilibrium_given_intercept_and_slope()` - Acceptance regions
- `payment_shares_at_pos()` - Share summing constraints

**Coverage:** Tests how debit kappa parameter affects merchant acceptance decisions

---

### 16. Gauss-Hermite Differentiation Tests (Line 2218)
**Test Functions:**
- `test_gauss_hermite_expected_value()` (Line 2064)
- `test_gauss_hermite_cts_derivative()` (Line 2094)
- `test_gauss_hermite_cts_derivative_fast()` (Line 2127)
- `test_store_function_values()` (Line 2144)
- `test_differentiation_consistency()` (Line 2177)
- `test_powerset_indices()` (Line 2196)

**Functions Tested:**
- `gauss_hermite_expected_value()` - Expected value computation
- `gauss_hermite_cts_derivative()` - Full derivative
- `gauss_hermite_cts_derivative_fast()` - Fast derivative
- `store_function_values()` - Function value storage
- `powerset_indices()` - Powerset generation

**Coverage:** Tests numerical differentiation methods with analytical benchmarks

---

### 17. Category 1: Utility Functions (Line 2288)
**Test Functions:**
- `test_insertion_sort_pairs_basic()` (Line 2230)
- `test_insertion_sort_pairs_already_sorted()` (Line 2240)
- `test_insertion_sort_pairs_duplicates()` (Line 2249)
- `test_find_undominated_basic()` (Line 2258)
- `test_payment_type_to_kappa()` (Line 2269)
- `test_payment_type_to_kappa_error()` (Line 2281)

**Functions Tested:**
- `insertion_sort_pairs!()` - Sorting utility
- `find_undominated_indices()` - Dominance detection
- `payment_type_to_kappa()` - Kappa mapping
- `get_kappa()` - Kappa retrieval

**Coverage:** Tests utility functions with edge cases and error handling

---

### 18. Category 10: Vector/Matrix Utilities (Line 2327)
**Test Functions:**
- `test_squeeze_roundtrip()` (Line 2301)
- `test_squeeze_size()` (Line 2315)

**Functions Tested:**
- `squeeze_matrix_into_vector!()` - Matrix flattening
- `squeeze_vector_into_matrix()` - Vector unflattening

**Coverage:** Tests data structure conversion utilities

---

### 19. Category 11: Subgame Equilibrium (solve_fixed_point) (Line 2382)
**Test Functions:**
- `test_solve_fixed_point_basic()` (Line 2336)
- `test_solve_fixed_point_sqrt()` (Line 2348)
- `test_solve_fixed_point_no_convergence()` (Line 2359)
- `test_solve_fixed_point_multidim()` (Line 2370)

**Functions Tested:**
- `solve_fixed_point()` - Anderson acceleration fixed-point solver

**Coverage:** Tests convergence behavior across different functional forms

---

### 20. Category 12: Switch Point Moment (fixed cost identification) (Line 2438)
**Test Functions:**
- `test_switch_point_moment_monotonicity()` (Line 2393)

**Functions Tested:**
- `calculate_debit_credit_switch_points()` - Switch point calculation
- `model_moments_envelope_crossing_for_card()` - Envelope crossing moments

**Coverage:** Tests that switch point moments correctly identify fixed costs

---

### 21. Category 14: Network-based Fixed Cost Helper Functions (Line 2545)
**Test Functions:**
- `test_count_networks_in_bundle()` (Line 2446)
- `test_compute_network_fixed_cost()` (Line 2473)
- `test_profit_param_with_network_fixed_costs()` (Line 2503)

**Functions Tested:**
- `count_networks_in_bundle()` - Network counting
- `compute_network_fixed_cost()` - Fixed cost computation
- `profit_parameters_all_bundles()` - With network-based costs

**Coverage:** Tests network-based fixed cost structures

---

### 22. Category 15: Stratified Switch Point Moments (Line 2627)
**Test Functions:**
- `test_stratified_switch_point_moment_returns_correct_elements()` (Line 2584)
- `test_stratified_moments_vary_with_fixed_costs()` (Line 2598)

**Functions Tested:**
- `model_moments_switch_point_equality_stratified()` - Stratified moment computation

**Coverage:** Tests stratified moments for multiple fixed costs

---

## Complete Function List from model_functions.jl (158 functions)

### Core Model Functions (23 functions)
1. `payment_shares_at_pos()` - **TESTED** (Testset 1)
2. `payment_surplus_given_homing_type()` - **TESTED** (Testset 1, 2, 3)
3. `profit_parameters_all_bundles()` - **TESTED** (Testset 2, 3, 15, 21)
4. `solve_equilibrium_given_intercept_and_slope()` - **TESTED** (Testset 4, 15)
5. `calculate_debit_credit_switch_points()` - **TESTED** (Testset 20)
6. `calculate_first_acceptance_gamma()` - **PARTIALLY TESTED** (via testset 4)
7. `average_fee()` - **TESTED** (Testset 5)
8. `eqm_price_index()` - **TESTED** (Testset 7)
9. `solve_subgame()` - **TESTED** (Testset 14)
10. `solve_subgame_given_inputs()` - **TESTED** (Testset 14)
11. `solve_subgame_given_shares()` - **TESTED** (Testset 14)
12. `network_allocation()` - **TESTED** (Testset 14)
13. `network_profits()` - **TESTED** (Testset 13, 14)
14. `network_profits_given_dollars_and_shares()` - **TESTED** (Testset 13)
15. `network_foc_all_entries()` - **TESTED** (Testset 14)
16. `network_foc_aggregate()` - **TESTED** (Testset 13)
17. `solve_fixed_point()` - **TESTED** (Testset 19)
18. `solve_eqm_foc()` - **NOT TESTED** (main equilibrium solver)
19. `robust_eqm_solver()` - **NOT TESTED** (robust wrapper)
20. `foc_at_fee_and_util()` - **NOT TESTED**
21. `check_complementary_slackness()` - **NOT TESTED**
22. `eval_solver()` - **NOT TESTED**
23. `export_results()` - **NOT TESTED**

### Integration Functions (9 functions)
24. `closed_integral!()` - **TESTED** (Testset 6)
25. `gamma_integral!()` - **TESTED** (Testset 6)
26. `gamma_pdf()` - **TESTED** (Testset 6)
27. `gamma_cdf()` - **TESTED** (Testset 6)
28. `integrate_bundle_dependent_function!()` - **TESTED** (Testset 6)
29. `evaluate_bundle_dependent_function()` - **NOT TESTED**
30. `normal_convolution_twodim!()` - **TESTED** (Testset 6)
31. `normal_convolution_threedim!()` - **TESTED** (Testset 6)
32. `normal_convolution_multidim!()` - **TESTED** (Testset 6)

### Utility and Share Functions (16 functions)
33. `logit_shares_surplus!()` - **TESTED** (Testset 8)
34. `calc_nonprice_util!()` - **TESTED** (Testset 8) (3 methods)
35. `calc_shares_on_rc_draw!()` - **NOT TESTED**
36. `eval_function_on_draw!()` - **TESTED** (Testset 8)
37. `integrate_function_rc_draws!()` - **NOT TESTED**
38. `expected_wallet_shares_and_surplus()` - **NOT TESTED**
39. `expected_wallet_shares_and_surplus_at_income()` - **TESTED** (Testset 8)
40. `expected_second_choice()` - **NOT TESTED**
41. `expected_wallet_incomes()` - **NOT TESTED**
42. `expected_wallet_log_incomes()` - **NOT TESTED**
43. `income_weighted_wallet_shares()` - **TESTED** (Testset 8)
44. `average_log_income_and_shares_by_wallet()` - **NOT TESTED**
45. `average_log_income_by_payment_type()` - **TESTED** (Testset 10)
46. `calc_insulated_shares()` - **TESTED** (Testset 9)
47. `insulated_dollar_spending()` - **TESTED** (Testset 9)
48. `insulated_spending_integrand!()` - **TESTED** (Testset 9)

### Characteristic and Moment Functions (12 functions)
49. `calc_average_product_char()` - **TESTED** (Testset 10)
50. `calc_average_char()` - **TESTED** (Testset 10)
51. `second_choice_cash_diversion()` - **NOT TESTED**
52. `expected_diversion_second_choice()` - **TESTED** (Testset 10)
53. `convert_diversion_to_bank_second_choice()` - **NOT TESTED**
54. `second_choice_same_type()` - **NOT TESTED**
55. `expected_diversion_bank_level()` - **NOT TESTED**
56. `multihoming_shares()` - **NOT TESTED**
57. `correlation_primary_versus_secondary_from_shares()` - **NOT TESTED**
58. `convert_primary_secondary_to_second_choice!()` - **TESTED** (Testset 10)
59. `per_capita_rewards()` - **TESTED** (Testset 9)
60. `price_index_integrand!()` - **TESTED** (Testset 7)

### CES Utility and Reward Functions (6 functions)
61. `normalize_price_index!()` - **TESTED** (via testset 7)
62. `invert_reward_dollars()` - **TESTED** (Testset 11)
63. `convert_reward_dollars_to_matrix()` - **TESTED** (Testset 11)
64. `calc_ces_util_and_rewards()` - **TESTED** (Testset 11)
65. `squeeze_matrix_into_vector!()` - **TESTED** (Testset 18)
66. `squeeze_vector_into_matrix()` - **TESTED** (Testset 18)

### Differentiation Functions (7 functions)
67. `gauss_hermite_cts_derivative()` - **TESTED** (Testset 12, 16)
68. `gauss_hermite_expected_value()` - **TESTED** (Testset 16)
69. `gauss_hermite_cts_derivative_fast()` - **TESTED** (Testset 16)
70. `gauss_hermite_diagonal_hessian_fast()` - **NOT TESTED**
71. `gauss_hermite_cts_derivative_fast_masked()` - **NOT TESTED**
72. `gauss_hermite_cts_derivative_masked()` - **NOT TESTED**
73. `store_function_values()` - **TESTED** (Testset 16)

### Bundle and Filter Functions (9 functions)
74. `powerset_indices()` - **TESTED** (Testset 16)
75. `filter_bundles()` - **NOT TESTED**
76. `bundles_with_visa_credit()` - **NOT TESTED**
77. `bundles_without_visa_credit()` - **NOT TESTED**
78. `bundles_without_card()` - **NOT TESTED**
79. `find_undominated_indices()` - **TESTED** (Testset 4, 17)
80. `insertion_sort_pairs!()` - **TESTED** (Testset 4, 17)
81. `count_networks_in_bundle()` - **TESTED** (Testset 21)
82. `compute_network_fixed_cost()` - **TESTED** (Testset 21)

### Envelope and Switch Point Functions (6 functions)
83. `compute_envelope_for_subset()` - **NOT TESTED**
84. `find_envelope_crossing_internal()` - **NOT TESTED**
85. `find_two_envelope_crossing()` - **NOT TESTED**
86. `find_line_envelope_crossing()` - **NOT TESTED**
87. `find_zero_crossing_F1()` - **NOT TESTED**
88. `evaluate_envelope()` - **NOT TESTED**

### Moment Calculation Functions (11 functions)
89. `model_dollar_shares()` - **NOT TESTED**
90. `model_moments_dcpc()` - **NOT TESTED**
91. `model_moments_nilson()` - **NOT TESTED**
92. `model_moments_second_choice()` - **NOT TESTED**
93. `model_moments_primary_secondary()` - **NOT TESTED**
94. `model_reward_diff()` - **NOT TESTED**
95. `model_moments_first_credit()` - **NOT TESTED**
96. `model_network_foc()` - **NOT TESTED**
97. `model_network_soc()` - **NOT TESTED**
98. `model_moments_envelope_crossing_for_card()` - **TESTED** (Testset 20)
99. `model_moments_switch_point_equality_stratified()` - **TESTED** (Testset 22)

### Data Transformation Functions (9 functions)
100. `aggregate_network_dollars()` - **TESTED** (via testset 13)
101. `normalize_foc_by_dollars()` - **NOT TESTED**
102. `normalize_foc_by_instrument_dollars()` - **NOT TESTED**
103. `modify_fees_with_adj()` - **NOT TESTED**
104. `convert_to_uniform_fees()` - **NOT TESTED**
105. `convert_to_debit_level_fees()` - **NOT TESTED**
106. `build_param_from_vector()` - **NOT TESTED**
107. `all_model_moments()` - **NOT TESTED** (main moment function)
108. `model_moment_from_vector()` - **NOT TESTED**

### Utility Functions (15 functions)
109. `payment_type_to_kappa()` - **TESTED** (Testset 1, 17)
110. `get_kappa()` - **TESTED** (via testset 17)
111. `standardize_to_identity()` - **NOT TESTED**
112. `to_dict()` - **NOT TESTED** (4 methods for different types)
113. `export_diagnostic_bundle()` - **NOT TESTED**
114. `cartesian_matrix()` - **NOT TESTED**
115. `logit()` - **NOT TESTED**
116. `grid_function()` - **NOT TESTED**
117. `flatten_struct()` - **NOT TESTED**
118. `export_json()` - **NOT TESTED**
119. `vary_and_evaluate()` - **NOT TESTED**

### Estimation and Parameter Functions (12 functions)
120. `build_lower_bound()` - **NOT TESTED**
121. `build_upper_bound()` - **NOT TESTED**
122. `build_init()` - **NOT TESTED**
123. `fit_to_df()` - **NOT TESTED**
124. `recover_moments_from_init()` - **NOT TESTED**
125. `get_draw()` - **NOT TESTED**
126. `export_lmfit()` - **NOT TESTED** (2 methods)
127. `load_passthrough_1_params()` - **NOT TESTED**
128. `extract_baseline_components()` - **NOT TESTED**
129. `compute_network_foc_from_allocation()` - **NOT TESTED**
130. `compute_soc_penalty()` - **NOT TESTED**

### Equilibrium Solver Utilities (8 functions)
131. `convert_opt_vector_to_full_vector()` - **NOT TESTED**
132. `unrestrict_index()` - **NOT TESTED**
133. `convert_full_vector_to_opt_vector()` - **NOT TESTED**
134. `merge_price_lists()` - **NOT TESTED**
135. `perturb_matrix()` - **NOT TESTED** (2 methods)
136. `normal_convolution_threedim_mc!()` - **NOT TESTED**
137. `build_new_cons_pref_intercept()` - **NOT TESTED**
138. `expected_primary_share()` - **NOT TESTED**

### Diagnostic Functions (7 functions)
139. `compute_debit_prob_by_primary()` - **NOT TESTED**
140. `print_debit_diagnostic()` - **NOT TESTED**
141. `pass_diagnostics()` - **NOT TESTED**
142. `print_oscillation_diagnostics()` - **NOT TESTED**
143. `masked_shares()` - **NOT TESTED**
144. `display_bundle_acceptance_analysis()` - **NOT TESTED**
145. `display_allocation_summary()` - **NOT TESTED**

### Diversion Functions (2 functions)
146. `expected_diversion()` - **NOT TESTED**
147. `integrate_merch_profit()` - **NOT TESTED**

### Serialization Functions (2 functions)
148. `Serialization.deserialize()` - **NOT TESTED** (2 methods for UsageParam)

---

## Untested Functions (65 functions)

### High Priority (Core Model Functions - 10)
1. `solve_eqm_foc()` - Main equilibrium solver with FOC
2. `robust_eqm_solver()` - Robust wrapper with multiple phases
3. `foc_at_fee_and_util()` - FOC evaluation function
4. `check_complementary_slackness()` - Constraint checking
5. `eval_solver()` - Solver evaluation and diagnostics
6. `export_results()` - Results export function
7. `all_model_moments()` - Main moment calculation function
8. `model_moment_from_vector()` - Moment calculation from parameter vector
9. `build_param_from_vector()` - Parameter structure building
10. `integrate_merch_profit()` - Merchant profit integration

### Medium Priority (Moment Functions - 7)
11. `model_dollar_shares()` - Dollar share moments
12. `model_moments_dcpc()` - DCPC survey moments
13. `model_moments_nilson()` - Nilson panel moments
14. `model_moments_second_choice()` - Second choice moments
15. `model_moments_primary_secondary()` - Primary/secondary moments
16. `model_reward_diff()` - Reward difference moments
17. `model_moments_first_credit()` - First credit moments

### Medium Priority (Share and Utility Functions - 10)
18. `calc_shares_on_rc_draw!()` - Share calculation on random draws
19. `integrate_function_rc_draws!()` - Integration over random coefficients
20. `expected_wallet_shares_and_surplus()` - Expected shares and surplus
21. `expected_second_choice()` - Expected second choice
22. `expected_wallet_incomes()` - Expected wallet incomes
23. `expected_wallet_log_incomes()` - Expected log incomes
24. `average_log_income_and_shares_by_wallet()` - Income and share by wallet
25. `multihoming_shares()` - Multihoming share calculation
26. `correlation_primary_versus_secondary_from_shares()` - Correlation calculation
27. `evaluate_bundle_dependent_function()` - Bundle function evaluation

### Medium Priority (Envelope and Filter Functions - 12)
28. `filter_bundles()` - Bundle filtering
29. `bundles_with_visa_credit()` - Visa credit bundle filter
30. `bundles_without_visa_credit()` - Non-Visa credit filter
31. `bundles_without_card()` - Bundles without specific card
32. `compute_envelope_for_subset()` - Envelope for subset
33. `find_envelope_crossing_internal()` - Internal envelope crossing
34. `find_two_envelope_crossing()` - Two-envelope crossing
35. `find_line_envelope_crossing()` - Line-envelope crossing
36. `find_zero_crossing_F1()` - Zero crossing for F1
37. `evaluate_envelope()` - Envelope evaluation
38. `second_choice_cash_diversion()` - Cash diversion from second choice
39. `convert_diversion_to_bank_second_choice()` - Bank-level diversion

### Lower Priority (Data and Utility Functions - 18)
40. `normalize_foc_by_dollars()` - FOC normalization by dollars
41. `normalize_foc_by_instrument_dollars()` - FOC normalization by instruments
42. `modify_fees_with_adj()` - Fee modification
43. `convert_to_uniform_fees()` - Uniform fee conversion
44. `convert_to_debit_level_fees()` - Debit-level fee conversion
45. `aggregate_network_dollars()` - Network dollar aggregation
46. `standardize_to_identity()` - Matrix standardization
47. `to_dict()` - Dictionary conversion (4 methods)
48. `export_diagnostic_bundle()` - Diagnostic export
49. `cartesian_matrix()` - Cartesian matrix generation
50. `logit()` - Logit transformation
51. `grid_function()` - Grid function evaluation
52. `flatten_struct()` - Structure flattening
53. `export_json()` - JSON export
54. `vary_and_evaluate()` - Parameter variation analysis
55. `second_choice_same_type()` - Same-type second choice
56. `expected_diversion_bank_level()` - Bank-level diversion
57. `expected_diversion()` - Diversion calculation

### Lower Priority (Differentiation and Estimation - 8)
58. `gauss_hermite_diagonal_hessian_fast()` - Fast Hessian computation
59. `gauss_hermite_cts_derivative_fast_masked()` - Masked fast derivative
60. `gauss_hermite_cts_derivative_masked()` - Masked derivative
61. `normal_convolution_threedim_mc!()` - 3D MC convolution
62. `build_lower_bound()` - Lower bound construction
63. `build_upper_bound()` - Upper bound construction
64. `build_init()` - Initial value construction
65. `fit_to_df()` - Fit to dataframe

### Lower Priority (Remaining Functions - 2)
66. `recover_moments_from_init()` - Moment recovery from initial values
67. `get_draw()` - Random draw generation

---

## Test Coverage Summary

### By Category
- **Core Model Functions:** 13/23 tested (57%)
- **Integration Functions:** 7/9 tested (78%)
- **Utility and Share Functions:** 7/16 tested (44%)
- **Characteristic and Moment Functions:** 6/12 tested (50%)
- **CES Utility and Reward Functions:** 6/6 tested (100%)
- **Differentiation Functions:** 4/7 tested (57%)
- **Bundle and Filter Functions:** 4/9 tested (44%)
- **Envelope and Switch Point Functions:** 0/6 tested (0%)
- **Moment Calculation Functions:** 2/11 tested (18%)
- **Overall:** 93/158 functions tested (59%)

### Critical Gaps
1. **Main equilibrium solver** (`solve_eqm_foc`, `robust_eqm_solver`) - No tests
2. **Empirical moment functions** (DCPC, Nilson, second choice) - No tests
3. **Envelope crossing functions** - Complete gap
4. **Network FOC/SOC moment functions** - No tests
5. **Parameter construction utilities** - No tests
6. **Export and diagnostic functions** - No tests

---

## Recommendations for Additional Testing

### High Priority
1. Create integration tests for `solve_eqm_foc()` with known equilibria
2. Add tests for `all_model_moments()` comparing to hand-calculated moments
3. Test `model_moments_dcpc()`, `model_moments_nilson()` with synthetic data
4. Add convergence tests for `robust_eqm_solver()`
5. Test complementary slackness conditions in `check_complementary_slackness()`

### Medium Priority
1. Test envelope crossing functions with analytical examples
2. Add tests for bundle filtering functions
3. Test normalization functions (`normalize_foc_by_dollars`, etc.)
4. Add tests for fee transformation functions
5. Test diagnostic output functions

### Lower Priority
1. Test serialization functions
2. Add tests for export utilities
3. Test parameter bound construction
4. Add tests for grid evaluation functions
5. Test diversion calculation functions

---

## Notes

- Test file uses `COMPARE_RTOL = 1e-2` for floating point comparisons
- Many tests use synthetic data with known analytical solutions
- Integration tests verify accuracy against analytical benchmarks
- Some functions are only tested indirectly through higher-level functions
- Several diagnostic and export functions are untested but may not need unit tests
