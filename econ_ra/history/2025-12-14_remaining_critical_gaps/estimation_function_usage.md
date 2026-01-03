# Model Estimation Function Usage Analysis

**Generated:** 2025-12-14
**Purpose:** Document which functions from `model_functions.jl` are called during model estimation via `estimate_model_current_eqm_foc.jl`

## Executive Summary

The estimation script `estimate_model_current_eqm_foc.jl` performs a 6-iteration GMM estimation of the payment network competition model. It calls **73+ distinct functions** from `model_functions.jl`, organized into five major subsystems:

1. **Parameter Management** (3 functions)
2. **Moment Computation Pipeline** (11 functions)
3. **Equilibrium Solution** (15 functions)
4. **Consumer Behavior** (18 functions)
5. **Network Optimization** (12 functions)
6. **Numerical Methods** (14+ functions)

## Critical Path Functions

The estimation relies on these **core functions** that form the critical execution path:

### Top-Level Entry Points
1. `model_moment_from_vector` - Main entry point that converts parameter vector to moment vector
2. `recover_moments_from_init` - Iterative GMM estimation wrapper (calls LsqFit.curve_fit)
3. `fit_to_df` - Evaluates fit and converts to DataFrame for reporting

### Central Computation Functions
4. `all_model_moments` - Orchestrates all moment calculations
5. `network_allocation` - Computes full equilibrium allocation
6. `solve_subgame` - Solves merchant acceptance equilibrium (fixed-point iteration)
7. `solve_fixed_point` - Anderson-accelerated fixed-point solver

### Equilibrium Solver Core
8. `eqm_price_index` - Computes CES price indices from merchant acceptance
9. `solve_equilibrium_given_intercept_and_slope` - Finds envelope of merchant profit functions
10. `profit_parameters_all_bundles` - Calculates merchant profit slopes/intercepts

### Consumer Demand Functions
11. `expected_wallet_shares_and_surplus` - Computes consumer card holdings
12. `income_weighted_wallet_shares` - Income-weighted adoption shares
13. `integrate_function_rc_draws` - Integrates over consumer heterogeneity

### Network First-Order Conditions
14. `network_foc_all_entries` - Computes full Jacobian matrix (∂π/∂fees, ∂π/∂rewards)
15. `gauss_hermite_cts_derivative_fast` - Numerical derivatives via Gauss-Hermite quadrature

---

## Complete Function Call Graph

### 1. PARAMETER MANAGEMENT (3 functions)

#### Entry Point Functions
- **`build_param_from_vector`** - Unpacks parameter vector into structured objects
  - Input: parameter vector `x` (length 36-38 depending on NUM_FIXED_COSTS)
  - Output: `UsageParam`, `MerchParam`, `ConsPref`, `ces_util`, `costs`, `fee_adj`
  - Called by: `model_moment_from_vector`

#### Initialization Functions
- **`build_init`** - Creates initial parameter guess
- **`build_lower_bound`**, **`build_upper_bound`** - Parameter bounds for constrained optimization

---

### 2. MOMENT COMPUTATION PIPELINE (11 functions)

#### Main Wrapper
- **`model_moment_from_vector(x, own, bundles, payment_type, fees, char_mat, cash_cost; ...)`**
  - **Purpose:** Main entry point - converts parameter vector to moment vector
  - **Calls:** `build_param_from_vector`, `modify_fees_with_adj`, `all_model_moments`
  - **Returns:** moments (vector), allocation, external data
  - **Line:** 4667

#### Master Moment Function
- **`all_model_moments(ownership, all_bundles, payment_type, fees, adoption_ces_utilities, ...)`**
  - **Purpose:** Orchestrates all moment calculations (~40 moments)
  - **Calls:**
    - `network_allocation` - Compute equilibrium allocation
    - `model_moments_dcpc` - DCPC survey moments
    - `model_moments_nilson` - Durbin Amendment shock
    - `model_moments_second_choice` - Payment substitution elasticities
    - `model_moments_primary_secondary` - Multi-homing patterns
    - `model_moments_first_credit` - First credit card acceptance threshold
    - `model_dollar_shares` - Dollar shares by payment method
    - `model_reward_diff` - Reward rate spreads
    - `model_network_foc` - First-order conditions (FOCs)
    - `model_moments_envelope_crossing_for_card` - Fixed cost moments (conditional)
    - `model_network_soc` - Second-order conditions (conditional, iteration 5 only)
  - **Returns:** moment vector, allocation, external
  - **Line:** 4464

#### Individual Moment Functions
- **`model_moments_dcpc(allocation)`** - DCPC survey moments
  - Computes merchant acceptance rates

- **`model_moments_nilson(allocation; reward_shock)`** - Durbin debit fee shock
  - Models effect of Durbin Amendment on debit usage

- **`model_moments_second_choice(allocation)`** - Second-choice elasticities
  - Uses `convert_primary_secondary_to_second_choice!`

- **`model_moments_primary_secondary(allocation)`** - Multi-homing statistics
  - Primary/secondary card usage patterns

- **`model_moments_first_credit(allocation, payment_type)`** - Merchant acceptance threshold
  - Uses `calculate_first_acceptance_gamma`

- **`model_dollar_shares(alloc)`** - Dollar share vector

- **`model_reward_diff(allocation)`** - Reward rate spreads

#### FOC and SOC Moments
- **`model_network_foc(allocation, ownership; estim=true, ...)`**
  - **Purpose:** Extracts FOC moments for GMM
  - **Calls:** `network_foc_aggregate`, `aggregate_network_dollars`, `normalize_foc_by_dollars`
  - **Returns:** 8 FOC moments (5 reward + 3 fee FOCs)
  - **Line:** 4233

- **`model_network_soc(allocation, ownership; tremble_vol)`** (Iteration 5 only)
  - **Purpose:** Second-order condition moments
  - **Calls:** `compute_soc_penalty`
  - **Returns:** 8 SOC moments
  - **Line:** 4283

#### Fixed Cost Moments
- **`model_moments_envelope_crossing_for_card(allocation, card_index; ...)`**
  - Computes envelope crossing moment for fixed cost identification
  - Uses `compute_envelope_for_subset`, `find_envelope_crossing_internal`

---

### 3. EQUILIBRIUM SOLUTION (15 functions)

#### Top-Level Allocation
- **`network_allocation(all_bundles, payment_type, fees, adoption_ces_util, char, ...)`**
  - **Purpose:** Computes full equilibrium allocation (observable quantities)
  - **Calls:**
    - `solve_subgame` - Solve merchant acceptance equilibrium
    - `insulated_dollar_spending` - Dollar spending by acceptance regime
    - `network_profits_given_dollars_and_shares` - Network profits
    - `expected_wallet_shares_and_surplus` - Consumer wallet shares
    - `network_foc_all_entries` - Jacobian matrix
    - `average_log_income_by_payment_type` - Income sorting
    - `expected_second_choice` - Substitution patterns
    - `expected_diversion` - Diversion ratios
  - **Returns:** `Allocation` struct (contains all equilibrium quantities)
  - **Line:** 3977

#### Merchant Equilibrium
- **`solve_subgame(all_bundles, payment_type, fees, adoption_ces_util, char, ...)`**
  - **Purpose:** Solves merchant acceptance equilibrium via fixed-point iteration
  - **Calls:**
    - `calc_ces_util_and_rewards` - Initialize CES utilities
    - `income_weighted_wallet_shares` - Consumer shares
    - `solve_subgame_given_inputs` - Inner equilibrium solver
    - `solve_fixed_point` - Anderson-accelerated solver
    - `print_oscillation_diagnostics` - Diagnostics on failure
  - **Returns:** `SubgameResult`, solver status
  - **Line:** 3299

- **`solve_subgame_given_inputs(price_index_to_power, ...)`**
  - **Calls:** `solve_subgame_given_shares` (always), or recalculates shares if accept_comp > 0

- **`solve_subgame_given_shares(price_index_to_power, ...)`**
  - **Purpose:** Given price indices and shares, compute new price indices
  - **Calls:**
    - `invert_reward_dollars` - Back out rewards from CES utilities
    - `calc_ces_util_and_rewards` - Compute CES utilities
    - `calc_insulated_shares` - Merchant shares by homing type
    - `eqm_price_index` - Compute equilibrium price indices
    - `insulated_dollar_spending` - Dollar allocation
  - **Returns:** `SubgameResult`
  - **Line:** 2747

#### Price Index Calculation
- **`eqm_price_index(all_bundles, payment_type, fees, insulated_shares, usage_param, merch_param; ...)`**
  - **Purpose:** Computes CES price index P^(1-σ) from merchant acceptance
  - **Calls:**
    - `profit_parameters_all_bundles` - Profit slopes/intercepts
    - `solve_equilibrium_given_intercept_and_slope` - Find envelope
    - `integrate_bundle_dependent_function!` - Integrate price index
    - `price_index_integrand!` - Price index integrand
    - `normalize_price_index!` - Normalize irrelevant entries
  - **Returns:** price_index_to_power, switch points, bundle indices
  - **Line:** 1665

#### Merchant Profit Envelope
- **`profit_parameters_all_bundles(all_bundles, payment_type, fees, insulated_shares, ...)`**
  - **Purpose:** Computes intercepts and slopes for merchant profit as function of gamma
  - **Calls:** `payment_shares_at_pos`, `average_fee`, `payment_type_to_kappa`
  - **Returns:** all_intercept, all_slope vectors
  - **Line:** 558

- **`solve_equilibrium_given_intercept_and_slope(all_intercept, all_slope; ...)`**
  - **Purpose:** Finds envelope of merchant profit functions (upper frontier)
  - **Calls:**
    - `insertion_sort_pairs!` - Sort by slope
    - `find_undominated_indices` - Filter dominated bundles
  - **Returns:** switch points (γ thresholds), bundle indices
  - **Line:** 802

- **`find_undominated_indices(sorted_intercept, sorted_slope, sorted_indices; ...)`**
  - **Purpose:** Identifies bundles on upper envelope
  - Uses dynamic programming over sorted profit functions
  - **Line:** 683

#### Integration Over Merchants
- **`integrate_bundle_dependent_function!(f_bundle!, output, buffer, switch, bundle_indices, merch_param)`**
  - **Purpose:** Integrates functions over merchant type γ, accounting for regime switches
  - **Calls:** `gamma_integral!`, `closed_integral!`
  - **Line:** 1506

- **`gamma_integral!(f!, output, buffer, left, mean, sigma; ...)`**
  - **Purpose:** Numerical integration using Gauss-Hermite quadrature
  - Uses lognormal distribution for γ
  - **Line:** 1402

- **`price_index_integrand!(buffer, gamma, payment_bundle, payment_type, fees, ...)`**
  - **Purpose:** Computes integrand for CES price index calculation
  - **Calls:** `payment_shares_at_pos`, `average_fee`
  - **Line:** 1604

#### Dollar Spending
- **`insulated_dollar_spending(all_bundles, payment_type, fees, insulated_shares, switch, bundle, ...)`**
  - **Purpose:** Computes dollar spending by (primary, secondary, payment) triple
  - **Calls:** `insulated_spending_integrand!`, `integrate_bundle_dependent_function!`
  - **Returns:** 3D array [primary × secondary × payment]
  - **Line:** 2543

- **`insulated_spending_integrand!(total_spending, gamma, payment_bundle, ...)`**
  - **Purpose:** Integrand for dollar spending calculation
  - **Line:** 2501

---

### 4. CONSUMER BEHAVIOR (18 functions)

#### Wallet Shares and Surplus
- **`expected_wallet_shares_and_surplus(ces_utility, char, cons_pref; ...)`**
  - **Purpose:** Computes consumer card holdings (homing shares) and surplus
  - **Calls:** `integrate_function_rc_draws!`, `calc_shares_on_rc_draw!`
  - **Returns:** homing_shares (matrix), consumer_surplus
  - **Line:** 2161

- **`income_weighted_wallet_shares(ces_util, char, cons_pref)`**
  - **Purpose:** Income-weighted version of wallet shares
  - **Calls:** `integrate_function_rc_draws!`
  - **Returns:** income_homing_shares matrix
  - **Line:** 2244

#### Integration Over Consumer Heterogeneity
- **`integrate_function_rc_draws!(output, f!, ces_utility, char, cons_pref; ...)`**
  - **Purpose:** Integrates arbitrary functions over consumer random coefficients
  - **Calls:** `normal_convolution_threedim_mc!` or `normal_convolution_threedim!`
  - Uses Monte Carlo (RC_MATRIX) or Gauss-Hermite quadrature
  - **Line:** 2043

- **`normal_convolution_threedim_mc!(f!, output, buffer, avg, stddev, correl; ...)`**
  - **Purpose:** 3D Monte Carlo integration (default: 2000 draws)
  - Integrates over (log_income, pref_draw_1, pref_draw_2)
  - Uses Cholesky decomposition for correlation
  - **Line:** 1810

- **`normal_convolution_threedim!(f!, output, buffer, avg, stddev, correl; ...)`**
  - **Purpose:** 3D Gauss-Hermite quadrature (fallback)
  - **Line:** 1764

#### Utility and Share Calculation
- **`calc_shares_on_rc_draw!(util_buffer, share_buffer, ces_utility, log_income_draw, pref_draw, ...)`**
  - **Purpose:** Computes card choice shares for a single consumer draw
  - **Calls:**
    - `calc_nonprice_util!` - Non-price utility components
    - `logit_shares_surplus!` - Logit shares and surplus
  - **Line:** 1984

- **`calc_nonprice_util!(util_buffer, log_income_draw, pref_draw, char, cons_pref; ...)`**
  - **Purpose:** Calculates base utility (intercepts + income effects + random coefficients)
  - Handles perturbed utilities for numerical derivatives
  - **Line:** 1939

- **`logit_shares_surplus!(share_output, mean_utility)`**
  - **Purpose:** Computes logit choice probabilities and expected surplus
  - Uses exp-normalize trick for numerical stability
  - **Line:** 1911

#### Second-Choice and Diversion
- **`expected_second_choice(ces_utility, char, cons_pref, payment_types)`**
  - **Purpose:** Computes second-choice substitution matrix
  - **Calls:** `integrate_function_rc_draws!`, `convert_primary_secondary_to_second_choice!`
  - **Line:** 2191

- **`convert_primary_secondary_to_second_choice!(shares, payment_types)`**
  - **Purpose:** Converts (primary, secondary) shares to conditional second-choice probabilities
  - **Line:** 2092

- **`expected_diversion(ces_util, char, cons_pref)`**
  - **Purpose:** Computes bank-level diversion ratios
  - **Calls:** `integrate_function_rc_draws!`
  - **Line:** 3965

- **`second_choice_cash_diversion(share_matrix, char)`**
  - **Purpose:** Extracts cash diversion statistics
  - **Line:** 2359

- **`expected_diversion_bank_level(ces_utility, char, cons_pref, payment_types)`**
  - **Purpose:** Bank-level diversion matrix
  - **Line:** 2421

#### Income Analysis
- **`average_log_income_by_payment_type(ces_utility, char, cons_pref, payment_types)`**
  - **Purpose:** Computes average log income by card type (sorting analysis)
  - **Calls:** `average_log_income_and_shares_by_wallet`, `integrate_function_rc_draws!`
  - **Line:** 2264

- **`expected_wallet_incomes(ces_utility, char, cons_pref)`**, **`expected_wallet_log_incomes(...)`**
  - Income calculations by wallet type
  - **Lines:** 2216, 2231

#### Reward Calculations
- **`calc_ces_util_and_rewards(rewards_vector, ces, price_index_to_power, usage_param)`**
  - **Purpose:** Converts reward dollars to CES utilities using price indices
  - **Calls:** `convert_reward_dollars_to_matrix`, `per_capita_rewards`
  - **Returns:** ces_util, rewards_rate matrix
  - **Line:** 2679

- **`invert_reward_dollars(adoption_ces_util, ces, price_index_to_power)`**
  - **Purpose:** Inverts CES formula to back out reward dollars from utilities
  - Inverse of `calc_ces_util_and_rewards`
  - **Line:** 2649

- **`calc_insulated_shares(income_weighted_shares, price_index_to_power, bundle_rewards)`**
  - **Purpose:** Computes merchant acceptance shares by consumer type
  - Adjusts for price indices and reward complementarities
  - **Line:** 2480

- **`per_capita_rewards(reward_rate, dollars, income_weighted_shares)`**
  - **Purpose:** Calculates per-capita reward dollars
  - **Line:** 2594

---

### 5. NETWORK OPTIMIZATION (12 functions)

#### Network Profits
- **`network_profits_given_dollars_and_shares(dollars_spent, fees, costs, income_homing_shares, rewards_vector, usage_param)`**
  - **Purpose:** Computes network profits from equilibrium quantities
  - Profit = (fee - cost) × volume - reward_payouts
  - **Returns:** profit vector (length num_pay)
  - **Line:** 3683

- **`network_profits(all_bundles, payment_type, fees, adoption_ces_util, char, network_costs, ...)`**
  - **Purpose:** Wrapper that solves for allocation then computes profits
  - **Calls:** `network_allocation`
  - **Line:** 3709

- **`network_profits_with_allocation(...)`** - Returns both profits and allocation
  - **Line:** 3724

#### First-Order Conditions (Jacobian)
- **`network_foc_all_entries(all_bundles, payment_type, fees, profits, ...)`**
  - **Purpose:** Computes full Jacobian matrix (∂π_i/∂x_j for all networks i, instruments j)
  - **Calls:**
    - `gauss_hermite_cts_derivative_fast` (if easy_grad=true, default)
    - `gauss_hermite_cts_derivative` (if easy_grad=false)
    - `gauss_hermite_cts_derivative_fast_masked` (if capped fees exist)
  - **Returns:** Jacobian matrix [num_pay × 2*num_pay]
  - **Line:** 3742

- **`network_foc_aggregate(ownership_bundles, full_jacobian)`**
  - **Purpose:** Aggregates FOCs for multi-product firms
  - Sums ∂π_i/∂x_j over networks i owned by same firm
  - **Returns:** aggregated FOC vector
  - **Line:** 3817

#### Normalization
- **`normalize_foc_by_dollars(foc_vector, dollars, ownership)`**
  - **Purpose:** Normalizes FOCs by network dollar volume
  - Makes FOCs dimensionless and comparable across networks
  - **Line:** 4203

- **`normalize_foc_by_instrument_dollars(foc_vector, instrument_dollars)`**
  - **Purpose:** Alternative normalization (by instrument, not network)
  - **Line:** 4218

- **`aggregate_network_dollars(dollars, ownership)`**
  - **Purpose:** Aggregates dollar spending by network and instrument
  - **Returns:** network_dollars, instrument_dollars
  - **Line:** 4184

#### Second-Order Conditions
- **`compute_soc_penalty(ownership, all_bundles, payment_type, fees, adoption_ces_util, ...)`**
  - **Purpose:** Computes diagonal Hessian entries (d²π/dx²) for SOC verification
  - **Calls:** `gauss_hermite_diagonal_hessian_fast`
  - **Returns:** SOC penalty vector (max(0, d²π/dx²))
  - **Line:** 5209

#### Merchant Profit Functions
- **`integrate_merch_profit(all_bundles, payment_type, fees, insulated_shares, switch, bundle, ...)`**
  - **Purpose:** Integrates merchant profits over γ distribution
  - **Calls:** `insulated_merch_profit_integrand!`, `integrate_bundle_dependent_function!`
  - **Line:** 3895

- **`insulated_merch_profit_integrand!(profit_buffer, gamma, payment_bundle, ...)`**
  - **Purpose:** Merchant profit integrand
  - **Line:** 3842

#### Envelope Crossing Analysis
- **`compute_envelope_for_subset(all_intercept, all_slope, subset_indices, ...)`**
  - **Purpose:** Computes envelope for bundle subset (used in fixed cost moments)
  - **Calls:** `solve_equilibrium_given_intercept_and_slope`
  - **Line:** 1091

- **`find_envelope_crossing_internal(switches, bundles, all_intercept, all_slope, ...)`**
  - **Purpose:** Finds gamma where two envelopes cross
  - Uses bisection search
  - **Line:** 1119

- **`calculate_first_acceptance_gamma(all_intercept, all_slope, payment_type, ...)`**
  - **Purpose:** Finds first γ where merchants accept credit cards
  - **Line:** 1012

---

### 6. NUMERICAL METHODS (14+ functions)

#### Fixed-Point Solver
- **`solve_fixed_point(f, init_x; learn_rate, tol, max_iter, anderson_depth, ...)`**
  - **Purpose:** Anderson-accelerated fixed-point solver
  - **Algorithm:**
    1. Anderson acceleration (iterations 1-ANDERSON_STOP)
    2. Adaptive damping (iterations ANDERSON_STOP+1 to max_iter)
  - **Calls:** `print_oscillation_diagnostics` on failure
  - **Returns:** FixedPointResult (param, converged, num_iter, error)
  - **Line:** 2824

#### Gauss-Hermite Derivatives (Easy Grad)
- **`gauss_hermite_cts_derivative_fast(f, x, shock_vol)`**
  - **Purpose:** Fast Gauss-Hermite numerical derivatives (diagonal independence)
  - Uses 2-point Gauss-Hermite per dimension (2^n evaluations for n-dim)
  - **Returns:** Jacobian matrix
  - **Line:** 3501

- **`gauss_hermite_cts_derivative_fast_masked(f, x, shock_vol, fixed_indices)`**
  - **Purpose:** Fast derivatives with some parameters held constant
  - Used for capped fees (don't perturb capped parameters)
  - **Line:** 3581

- **`gauss_hermite_diagonal_hessian_fast(f, x, shock_vol)`**
  - **Purpose:** Fast diagonal Hessian computation (for SOC)
  - Uses 3-point Gauss-Hermite per dimension
  - **Line:** 3539

#### Gauss-Hermite Derivatives (Full Grad)
- **`gauss_hermite_cts_derivative(f, x, shock_vol)`**
  - **Purpose:** Full Gauss-Hermite derivatives (slower, more accurate)
  - Accounts for correlations via tensor product
  - **Line:** 3432

- **`gauss_hermite_cts_derivative_masked(f, x, shock_vol, fixed_indices)`**
  - **Purpose:** Masked version of full derivatives
  - **Line:** 3626

- **`gauss_hermite_expected_value(f, x, shock_vol)`**
  - **Purpose:** Computes E[f(x + ε)] via Gauss-Hermite quadrature
  - **Line:** 3477

- **`store_function_values(f, x, shock_vol)`**
  - **Purpose:** Evaluates function at all Gauss-Hermite nodes
  - Used internally by derivative functions
  - **Line:** 3402

#### Utility Functions
- **`powerset_indices(num_options)`**
  - **Purpose:** Generates all binary combinations (2^n rows)
  - Used for Gauss-Hermite node generation
  - **Line:** 179

- **`insertion_sort_pairs!(arr1, arr2)`**
  - **Purpose:** Sorts profit functions by slope
  - In-place sort for performance
  - **Line:** 645

- **`normalize_price_index!(price_index, num_pay)`**
  - **Purpose:** Sets irrelevant price index entries to 1.0
  - Prevents numerical issues in fixed-point iteration
  - **Line:** 1642

#### Helper Functions
- **`payment_shares_at_pos(primary, secondary, payment_bundle, char, usage_param)`**
  - **Purpose:** Computes payment shares conditional on wallet and merchant acceptance
  - **Line:** 408

- **`payment_surplus_given_homing_type(primary, secondary, payment_bundle, ...)`**
  - **Purpose:** Consumer surplus for given homing type at merchant
  - **Line:** 480

- **`average_fee(gamma, payment_bundle, payment_type, fees, usage_param, merch_param)`**
  - **Purpose:** Average fee paid at merchant with type gamma
  - **Line:** 1306

- **`payment_type_to_kappa(payment_type, usage_param)`**, **`get_kappa(...)`**
  - Convert payment type to usage cost parameter
  - **Lines:** 379, 399

---

## Function Call Dependencies (Transitive Closure)

### Level 1: Entry Points (Called by estimate_model_current_eqm_foc.jl)
1. `model_moment_from_vector` - Main wrapper
2. `recover_moments_from_init` - GMM estimation
3. `fit_to_df` - Moment evaluation
4. `build_init`, `build_lower_bound`, `build_upper_bound` - Parameter setup

### Level 2: Core Computation (Called by Level 1)
5. `all_model_moments` - Moment orchestration
6. `build_param_from_vector` - Parameter unpacking
7. Individual moment functions (11 functions)

### Level 3: Equilibrium Solution (Called by Level 2)
8. `network_allocation` - Full allocation
9. `solve_subgame` - Merchant equilibrium
10. `network_foc_all_entries` - Jacobian computation
11. `compute_soc_penalty` - Hessian computation (iteration 5/6 only)

### Level 4: Subgame Solver (Called by Level 3)
12. `solve_fixed_point` - Anderson acceleration
13. `solve_subgame_given_inputs`, `solve_subgame_given_shares`
14. `eqm_price_index` - Price index calculation
15. `insulated_dollar_spending` - Dollar allocation

### Level 5: Price Index and Envelope (Called by Level 4)
16. `profit_parameters_all_bundles` - Merchant profit parameters
17. `solve_equilibrium_given_intercept_and_slope` - Envelope calculation
18. `integrate_bundle_dependent_function!` - Integration over merchants
19. `price_index_integrand!` - Price index integrand

### Level 6: Consumer Behavior (Called by Levels 3-5)
20. `expected_wallet_shares_and_surplus` - Wallet shares
21. `income_weighted_wallet_shares` - Income-weighted shares
22. `integrate_function_rc_draws!` - Consumer heterogeneity integration
23. `normal_convolution_threedim_mc!` - 3D Monte Carlo integration
24. `calc_shares_on_rc_draw!` - Logit share calculation
25. `calc_nonprice_util!`, `logit_shares_surplus!` - Utility calculations

### Level 7: Numerical Methods (Called by Levels 3-6)
26. `gauss_hermite_cts_derivative_fast` - Fast Jacobian (easy_grad=true)
27. `gauss_hermite_cts_derivative` - Full Jacobian (easy_grad=false)
28. `gauss_hermite_diagonal_hessian_fast` - Diagonal Hessian (SOC)
29. `gamma_integral!` - Merchant type integration
30. `closed_integral!` - Closed-form integrals

### Level 8: Utilities (Called throughout)
31. Helper functions: `payment_shares_at_pos`, `average_fee`, `normalize_price_index!`, etc.

---

## Iteration-Specific Function Calls

The 6-iteration estimation strategy varies which functions are called:

### Iteration 1 (Warmstart: no overlap, no FOC, TREMBLE_COARSE)
- **Skip:** `network_foc_all_entries`, `compute_soc_penalty`
- **Skip:** All Gauss-Hermite derivative functions
- **Use:** `diff_type_overlap = 0.0` (no payment type switching)

### Iteration 2 (Overlap, no FOC, TREMBLE_COARSE)
- **Add:** `diff_type_overlap = DIFF_TYPE_OVERLAP` (enables type switching)
- **Still skip:** FOC/SOC functions

### Iteration 3 (Overlap, easy grad FOC, single-product, TREMBLE_COARSE)
- **Add:** `network_foc_all_entries` with `easy_grad=true`
- **Add:** `gauss_hermite_cts_derivative_fast` (not full)
- **Use:** `singleproduct=true` (each network treated independently)

### Iteration 4 (Overlap, easy grad FOC, multi-product, TREMBLE_COARSE)
- **Same as Iteration 3** but `singleproduct=false` (firms optimize portfolios)
- **Add:** `network_foc_aggregate` becomes relevant

### Iteration 5 (Overlap, full grad FOC, multi-product, TREMBLE_COARSE, SOC)
- **Add:** `gauss_hermite_cts_derivative` (slow but accurate)
- **Add:** `compute_soc_penalty`, `gauss_hermite_diagonal_hessian_fast`
- **Add:** 8 SOC moments to target vector
- **Switch:** From `easy_grad=true` to `easy_grad=false`

### Iteration 6 (Fine refinement, TREMBLE_FINE, no SOC)
- **Change:** `tremble_vol = TREMBLE_FINE` (0.001 instead of 0.005)
- **Remove:** SOC moments (back to base moment vector)
- **Purpose:** Fine-tune parameter estimates with tighter numerical derivatives

---

## Critical Path Analysis

### Essential Functions (Always Called)
These 25 functions are called in **every iteration**:

**Parameter Management:**
1. `build_param_from_vector`
2. `modify_fees_with_adj`

**Moment Computation:**
3. `all_model_moments`
4. `model_moments_dcpc`
5. `model_moments_nilson`
6. `model_moments_second_choice`
7. `model_moments_primary_secondary`
8. `model_moments_first_credit`
9. `model_dollar_shares`
10. `model_reward_diff`

**Equilibrium Solution:**
11. `network_allocation`
12. `solve_subgame`
13. `solve_subgame_given_inputs`
14. `solve_subgame_given_shares`
15. `solve_fixed_point`
16. `eqm_price_index`
17. `profit_parameters_all_bundles`
18. `solve_equilibrium_given_intercept_and_slope`
19. `find_undominated_indices`
20. `insulated_dollar_spending`

**Consumer Behavior:**
21. `expected_wallet_shares_and_surplus`
22. `income_weighted_wallet_shares`
23. `integrate_function_rc_draws!`
24. `normal_convolution_threedim_mc!`
25. `calc_shares_on_rc_draw!`

### Conditional Functions (Iteration-Dependent)

**FOC Functions (Iterations 3-6):**
- `network_foc_all_entries`
- `network_foc_aggregate`
- `gauss_hermite_cts_derivative_fast` (iterations 3-4)
- `gauss_hermite_cts_derivative` (iterations 5-6)

**SOC Functions (Iteration 5 only):**
- `compute_soc_penalty`
- `gauss_hermite_diagonal_hessian_fast`
- `model_network_soc`

**Fixed Cost Functions (If NUM_FIXED_COSTS > 0):**
- `model_moments_envelope_crossing_for_card`
- `compute_envelope_for_subset`
- `find_envelope_crossing_internal`

---

## Performance Notes

### Computational Bottlenecks
1. **`solve_fixed_point`** - Iterates 100-1000+ times, calls `solve_subgame_given_shares` repeatedly
2. **`normal_convolution_threedim_mc!`** - 2000 Monte Carlo draws × integration calls
3. **`gauss_hermite_cts_derivative`** - Evaluates model 2^(2n) times (easy_grad=false)
4. **`insulated_dollar_spending`** - Integrates over merchant types for each (primary, secondary) pair

### Optimization Strategies Used
- **Anderson acceleration** in `solve_fixed_point` (speeds up convergence 10-100x)
- **Easy grad mode** (iterations 3-4): uses diagonal Jacobian approximation
- **Monte Carlo integration** (default): faster than tensor Gauss-Hermite for 3D
- **Caching** in Anderson solver: avoids duplicate function evaluations
- **Multi-threading** in `store_function_values` (Gauss-Hermite evaluations)

---

## Summary Statistics

- **Total unique functions called:** 73+
- **Functions called in all iterations:** 25
- **Functions called in FOC iterations (3-6):** +12
- **Functions called in SOC iteration (5):** +3
- **Fixed cost functions (conditional):** +3
- **Maximum call depth:** 8 levels
- **Most frequently called:** `payment_shares_at_pos` (called millions of times via integration loops)

---

## File Locations

**Main Files:**
- Estimation script: `/gpfs/kellogg/proj/kdb5009/payments/code/estimate_model_current_eqm_foc.jl`
- Model functions: `/gpfs/kellogg/proj/kdb5009/payments/code/model_functions.jl` (6,433 lines)
- Settings: `/gpfs/kellogg/proj/kdb5009/payments/code/settings.jl` (configuration constants)

**Output Files:**
- Bootstrap allocation: `../data/intermediate_data/bootstrap_data/baseline_{BOOT_DRAW}_1.jls`
- Parameters: `../data/intermediate_data/bootstrap_data/fit_foc_base_{BOOT_DRAW}_1_param.csv`
- Moment fit: `../data/intermediate_data/bootstrap_data/model_base_estimate_{BOOT_DRAW}_1.csv`

---

**End of Report**
