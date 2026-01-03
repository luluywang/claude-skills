# Accounting Identity Coverage Gaps Analysis

**Generated:** 2025-12-14
**Task:** Analyze test coverage for accounting identities in Julia payment network model
**Model:** `model_functions.jl` (6,433 lines)
**Tests:** `model_unit_tests.jl` (2,631 lines, 89 test functions)

---

## Executive Summary

The test suite has **strong partial coverage** of accounting identities (27% of testsets are primary accounting tests), but **critical gaps remain** in system-level validation and end-to-end identity verification. While individual components are well-tested, the full equilibrium's accounting properties lack comprehensive validation.

**Key Findings:**
- **Market share constraints**: Well-tested at component level, missing at system level
- **Profit decomposition**: Partial coverage, missing detailed revenue-cost breakdown verification
- **Integration consistency**: Good coverage for simple integrals, gaps in complex bundle-dependent integration
- **Price index identity**: NOT explicitly tested (critical gap)
- **Fixed point residuals**: Convergence tested, residual magnitude NOT verified

---

## 1. Market Share Constraints

### Identity Requirements
1. All probability distributions sum to 1.0
2. Market shares non-negative
3. Homing shares sum across all bundles = 1.0
4. Payment shares at POS ≤ 1.0 (with equality when type_overlap = 1.0)

### Current Test Coverage

**Existing Tests:**
- `test_payment_shares_at_pos()` (Line 14) - Tests individual POS share calculations
- `test_payment_shares_sum()` (Line 1961) - Tests share summing with type_overlap = 1.0
- `test_logit_shares()` (Line 1077) - Tests logit shares sum to 1.0 for simple case
- `test_income_weighted_share_one_draw()` (Line 1125) - Tests single draw summing

**Coverage Summary:**
- Component-level: GOOD (4 tests)
- System-level: MISSING

### Gaps Identified

#### Gap 1.1: System-Level Homing Share Verification
**Description:** No test verifies that `expected_wallet_shares_and_surplus()` produces shares that sum to 1.0 across all (primary, secondary) bundles for realistic parameter values.

**Current State:**
```julia
# In model_functions.jl line 2161
homing_shares, consumer_surplus = expected_wallet_shares_and_surplus(ces_util, char, cons_pref)
# Returns: (J+1) x (J+1) matrix
# Expected: sum(homing_shares) ≈ 1.0
# TESTED: NO
```

**Severity:** **Important** (would fail loudly)

**Rationale:** If integration over consumer heterogeneity is incorrect, homing shares might not sum to 1.0, but this would likely produce obviously wrong results (shares > 100% or negative profits) that would be caught during estimation.

**Proposed Test:**
```julia
function test_homing_shares_sum_to_one()
    # Use realistic parameters from estimation
    all_bundles = powerset_indices(4)
    payment_type = [1, 2, 2, 2]  # 1 debit, 3 credit
    fees = [0.01, 0.02, 0.02, 0.02]
    ces_util = realistic_ces_utilities()
    char = realistic_characteristics()
    cons_pref = realistic_consumer_preferences()

    homing_shares, surplus = expected_wallet_shares_and_surplus(
        ces_util, char, cons_pref
    )

    total_share = sum(homing_shares)
    @test isapprox(total_share, 1.0, atol=1e-6)
    @test all(homing_shares .>= -1e-10)  # Non-negativity
end
```

#### Gap 1.2: Income-Weighted Shares Sum Verification
**Description:** `income_weighted_wallet_shares()` should sum to 1.0 when weighted by income distribution, but this is never verified.

**Severity:** **Important** (would fail loudly)

**Rationale:** Incorrect income weighting would show up as dollar accounting errors, but not immediately fail. Could produce subtle bias in estimated parameters.

**Proposed Test:**
```julia
function test_income_weighted_shares_sum()
    # Create test scenario
    ces_util, char, cons_pref = setup_realistic_scenario()

    income_shares = income_weighted_wallet_shares(ces_util, char, cons_pref)

    # Income-weighted shares should sum to 1.0
    @test isapprox(sum(income_shares), 1.0, atol=1e-6)

    # Should also match unweighted shares when income variance = 0
    flat_cons_pref = set_income_variance_to_zero(cons_pref)
    income_shares_flat = income_weighted_wallet_shares(ces_util, char, flat_cons_pref)
    homing_shares_flat, _ = expected_wallet_shares_and_surplus(ces_util, char, flat_cons_pref)

    @test all(isapprox.(income_shares_flat, homing_shares_flat, atol=1e-6))
end
```

#### Gap 1.3: Dollar Shares Sum to 1.0
**Description:** `model_dollar_shares()` returns shares that should sum to 1.0, but this is not explicitly verified.

**Current State:**
```julia
# In model_functions.jl line 4064
function model_dollar_shares(alloc::Allocation)
    dollars_by_instrument = dropdims(sum(alloc.dollars, dims = (1, 2)), dims = (1, 2))
    shares = dollars_by_instrument ./ sum(dollars_by_instrument)
    return shares[2:end]  # Returns J elements (excludes cash)
end
# TESTED: NO
```

**Severity:** **Nice-to-have** (implementation guarantees this by construction)

**Rationale:** The normalization ensures shares sum correctly by construction. However, a test would catch refactoring errors.

**Proposed Test:**
```julia
function test_dollar_shares_sum()
    alloc = solve_realistic_equilibrium()

    dollar_shares = model_dollar_shares(alloc)

    # Shares should be non-negative
    @test all(dollar_shares .>= 0.0)

    # Full shares (including cash) should sum to 1.0
    dollars_by_instrument = dropdims(sum(alloc.dollars, dims = (1, 2)), dims = (1, 2))
    full_shares = dollars_by_instrument ./ sum(dollars_by_instrument)
    @test isapprox(sum(full_shares), 1.0, atol=1e-10)

    # Returned shares (excluding cash) should sum to < 1.0
    @test sum(dollar_shares) < 1.0
    @test sum(dollar_shares) > 0.0
end
```

---

## 2. Profit Decomposition

### Identity Requirements
1. Network profits = Fee revenue - Costs - Rewards paid
2. Fee revenue = Sum over (dollars_i × fee_i)
3. Total rewards paid = Total rewards received (zero-sum)
4. Profit components non-negative where expected

### Current Test Coverage

**Existing Tests:**
- `test_network_profits()` (Line 1583) - Tests basic profit calculation
- `test_zero_sum_rewards()` (Line 1639) - Tests rewards are zero-sum
- `test_network_profit()` (Line 1751) - Tests profit computation in subgame

**Coverage Summary:**
- Zero-sum rewards: GOOD (1 comprehensive test)
- Basic profit calculation: GOOD (2 tests)
- Detailed decomposition: MISSING

### Gaps Identified

#### Gap 2.1: Explicit Revenue-Cost-Rewards Decomposition
**Description:** No test explicitly verifies the profit decomposition formula by computing revenue, costs, and rewards separately and checking they match the profit function output.

**Current State:**
```julia
# In model_functions.jl line 3693
profits_from_merchants = dollars_by_method .* (fees .- costs)
# Then subtract rewards (lines 3696-3704)
# TESTED: Only via black-box comparison
```

**Severity:** **Important** (would fail loudly)

**Rationale:** If the reward subtraction logic has bugs (e.g., wrong index, wrong usage share weighting), it would show up as profit miscalculation. However, subtle errors in multi-homing reward allocation could go undetected.

**Proposed Test:**
```julia
function test_profit_decomposition_identity()
    # Solve equilibrium
    alloc = solve_realistic_equilibrium()
    fees = [0.02, 0.02, 0.03, 0.03]
    costs = [0.01, 0.01, 0.01, 0.01]
    usage_param = UsageParam(0.7, 1.0, 1.0, 0.6)

    # Compute profits using model function
    model_profits = network_profits_given_dollars_and_shares(
        alloc.total_dollars, fees, costs,
        alloc.income_homing_shares, alloc.singlehome_rewards, usage_param
    )

    # Manually compute revenue
    num_pay = length(fees)
    manual_revenue = zeros(num_pay)
    for i in 1:num_pay
        manual_revenue[i] = sum(alloc.total_dollars[:, :, i+1]) * fees[i]
    end

    # Manually compute costs
    manual_costs = zeros(num_pay)
    for i in 1:num_pay
        manual_costs[i] = sum(alloc.total_dollars[:, :, i+1]) * costs[i]
    end

    # Manually compute rewards paid (replicate logic from lines 3696-3704)
    manual_rewards_paid = compute_rewards_paid_manually(
        alloc.income_homing_shares, alloc.singlehome_rewards, usage_param
    )

    # Verify decomposition
    manual_profits = manual_revenue .- manual_costs .- manual_rewards_paid

    @test all(isapprox.(model_profits, manual_profits, atol=1e-8))

    # Also verify components are sensible
    @test all(manual_revenue .> 0.0)
    @test all(manual_costs .>= 0.0)
    @test all(manual_rewards_paid .>= 0.0)
end
```

#### Gap 2.2: Multi-Homing Reward Allocation
**Description:** The reward allocation logic for multi-homers (primary_use_share weighting) is complex and not separately tested.

**Current State:**
```julia
# In model_functions.jl lines 3700-3701
profits_from_merchants[primary] -= rewards_vector[primary] * usage_param.primary_use_share * income_homing_shares[primary + 1, secondary + 1]
profits_from_merchants[secondary] -= rewards_vector[secondary] * (1 - usage_param.primary_use_share) * income_homing_shares[primary + 1, secondary + 1]
# TESTED: Only indirectly via test_zero_sum_rewards
```

**Severity:** **Critical** (could produce silent wrong answers)

**Rationale:** If the indexing is wrong (e.g., `secondary` should be `secondary + 1`), or if the usage share allocation is incorrect, the model would estimate wrong reward passthrough parameters. This would be silent because both sides of the zero-sum test would be equally wrong.

**Proposed Test:**
```julia
function test_multihoming_reward_allocation()
    # Create simple scenario with one primary-secondary pair
    num_pay = 2
    income_homing_shares = zeros(3, 3)
    income_homing_shares[2, 3] = 1.0  # 100% on (primary=1, secondary=2)

    rewards_vector = [0.01, 0.02]
    usage_param = UsageParam(0.7, 1.0, 1.0, 0.6)

    # Compute rewards paid per network
    rewards_paid = zeros(num_pay)
    for primary in 1:num_pay
        rewards_paid[primary] += rewards_vector[primary] * income_homing_shares[primary + 1, 1]
        for secondary in 2:num_pay
            if secondary != primary
                rewards_paid[primary] += rewards_vector[primary] * usage_param.primary_use_share * income_homing_shares[primary + 1, secondary + 1]
                rewards_paid[secondary] += rewards_vector[secondary] * (1 - usage_param.primary_use_share) * income_homing_shares[primary + 1, secondary + 1]
            end
        end
    end

    # For this scenario:
    # Network 1 pays: 0.01 * 0.7 * 1.0 = 0.007
    # Network 2 pays: 0.02 * 0.3 * 1.0 = 0.006

    @test isapprox(rewards_paid[1], 0.007, atol=1e-10)
    @test isapprox(rewards_paid[2], 0.006, atol=1e-10)

    # Total rewards received by consumers
    rewards_received = sum(income_homing_shares .*
        [0.0 0.0 0.0; 0.0 0.0 usage_param.primary_use_share*0.01 + (1-usage_param.primary_use_share)*0.02; 0.0 0.0 0.0]
    )

    @test isapprox(sum(rewards_paid), rewards_received, atol=1e-10)
end
```

#### Gap 2.3: Merchant Profit Accounting
**Description:** Merchant profits (not network profits) are computed in `insulated_merch_profit_integrand!` but never verified against merchant surplus identity.

**Severity:** **Nice-to-have** (merchant profits not directly used in estimation)

**Rationale:** Merchant profits are intermediate calculations used in moment conditions, but not a primary model output. However, testing them would increase confidence in the moment calculations.

---

## 3. Integration Consistency

### Identity Requirements
1. Numerical integrals match analytical solutions when available
2. Bundle-dependent integration sums correctly across regimes
3. Monte Carlo and Gauss-Hermite integration agree
4. Truncated integrals sum to full integral

### Current Test Coverage

**Existing Tests:**
- `test_integral()` (Line 710) - Gaussian integral
- `test_ftc_closed_integral()` (Line 720) - Fundamental theorem of calculus
- `test_gamma_expectation()` (Line 734) - Gamma distribution expectation
- `test_truncated_gamma_expectation()` (Line 746) - Truncated gamma
- `test_gamma_cdf()` (Line 765) - CDF consistency
- `test_gamma_cdf_with_integral()` (Line 775) - CDF via integration
- `test_bundle_integral()` (Line 785) - Bundle-dependent function
- `test_twodim_normal_expected_value()` (Line 839) - 2D normal
- `test_threedim_normal_expected_value()` (Line 813) - 3D normal
- `test_twodim_normal_expected_value_correlation()` (Line 861) - 2D with correlation
- `test_threedim_normal_expected_value_correlation()` (Line 881) - 3D with correlation

**Coverage Summary:**
- Basic integration: EXCELLENT (11 comprehensive tests)
- Bundle-dependent integration: PARTIAL (1 test)
- Complex equilibrium integrals: MISSING

### Gaps Identified

#### Gap 3.1: Price Index Integration Consistency
**Description:** The price index calculation involves nested integration (over gamma, then over consumer types). No test verifies that the numerical integration produces consistent results across different merchant type distributions.

**Current State:**
```julia
# In model_functions.jl line 1698
integrate_bundle_dependent_function!(integrand!, price_index_to_power, integrand_buffer, eqm_switch, eqm_bundles, merch_param)
# This integrates price_index_integrand! over gamma distribution
# TESTED: NO
```

**Severity:** **Important** (would fail loudly)

**Rationale:** If integration over merchant types is incorrect, the price index fixed point would not converge or would converge to wrong values. This would cause obvious failures. However, subtle errors in regime switching could go undetected.

**Proposed Test:**
```julia
function test_price_index_integration_consistency()
    # Create simple scenario with known price index
    payment_type = [2, 2]  # Two credit cards
    fees = [0.02, 0.02]
    all_bundles = [0 0; 1 0; 0 1; 1 1]
    insulated_shares = ones(3, 3) / 9

    # Test with zero gamma variance (deterministic gamma = mean)
    merch_param_deterministic = MerchParam(5.0, 1.0, 0.10, 0.0, 0.0, 0.0, 0.0)
    usage_param = UsageParam(1.0, 0.0, 1.0, 0.5)

    price_index_det, switch_det, bundles_det = eqm_price_index(
        all_bundles, payment_type, fees, insulated_shares,
        usage_param, merch_param_deterministic
    )

    # Test with positive gamma variance
    merch_param_stochastic = MerchParam(5.0, 1.0, 0.10, 0.05, 0.0, 0.0, 0.0)

    price_index_stoch, switch_stoch, bundles_stoch = eqm_price_index(
        all_bundles, payment_type, fees, insulated_shares,
        usage_param, merch_param_stochastic
    )

    # Price index should be positive
    @test all(price_index_det .> 0.0)
    @test all(price_index_stoch .> 0.0)

    # Stochastic case should have higher price index (more merchant variation)
    @test all(price_index_stoch .>= price_index_det)

    # Verify integration by comparing to direct calculation at mean
    # (when sigma=0, integral = f(mean))
    manual_price_index = compute_price_index_at_gamma(
        0.10, all_bundles, payment_type, fees, insulated_shares, usage_param
    )

    @test all(isapprox.(price_index_det, manual_price_index, rtol=1e-3))
end
```

#### Gap 3.2: Dollar Spending Integration
**Description:** `insulated_dollar_spending()` integrates over merchant types to compute dollar flows. No test verifies that integration matches direct calculation.

**Severity:** **Important** (would fail loudly)

**Rationale:** Dollar accounting errors would show up as violations of the zero-sum rewards test or money conservation test. However, errors specific to multi-homing dollar splits could be missed.

**Proposed Test:**
```julia
function test_dollar_spending_integration()
    # Create scenario with deterministic gamma
    all_bundles = [0 0; 1 1]  # Cash-only or both cards
    payment_type = [2, 2]
    fees = [0.02, 0.02]
    insulated_shares = ones(3, 3) / 9
    usage_param = UsageParam(0.8, 0.0, 1.0, 0.5)

    # Deterministic merchant type
    merch_param = MerchParam(5.0, 1.0, 0.10, 0.0, 0.0, 0.0, 0.0)

    # Compute equilibrium
    price_index, switch, bundles = eqm_price_index(
        all_bundles, payment_type, fees, insulated_shares,
        usage_param, merch_param
    )

    # Compute dollar spending via integration
    dollars_integrated = insulated_dollar_spending(
        all_bundles, payment_type, fees, insulated_shares,
        switch, bundles, usage_param, merch_param
    )

    # Compute dollars directly at gamma = mean
    dollars_direct = insulated_spending_integrand_at_gamma(
        0.10, all_bundles, payment_type, fees, insulated_shares,
        usage_param, merch_param
    )

    # When gamma deterministic, integration = direct calculation
    @test all(isapprox.(dollars_integrated, dollars_direct, rtol=1e-3))

    # Dollars should sum across payment methods for each (primary, secondary)
    for primary in 1:3
        for secondary in 1:3
            total_dollars = sum(dollars_integrated[primary, secondary, :])
            @test total_dollars >= 0.0
        end
    end
end
```

#### Gap 3.3: Monte Carlo vs. Gauss-Hermite Agreement
**Description:** The code supports both Monte Carlo (`RC_MATRIX` mode) and Gauss-Hermite quadrature for consumer heterogeneity integration, but no test verifies they agree.

**Current State:**
```julia
# In model_functions.jl line 2043
# Uses normal_convolution_threedim_mc! (default) or normal_convolution_threedim!
# TESTED: Each separately, not agreement
```

**Severity:** **Nice-to-have** (MC is default in production)

**Rationale:** Estimation uses Monte Carlo by default. Gauss-Hermite is slower but deterministic. Verifying agreement would increase confidence that Monte Carlo has enough draws.

**Proposed Test:**
```julia
function test_mc_vs_gauss_hermite_agreement()
    # Create realistic scenario
    ces_util = realistic_ces_utilities()
    char = realistic_characteristics()
    cons_pref = realistic_consumer_preferences()

    # Compute with Monte Carlo (2000 draws)
    RC_MATRIX_SAVE = RC_MATRIX
    set_rc_matrix(2000)  # Use many draws for accuracy

    shares_mc, surplus_mc = expected_wallet_shares_and_surplus(
        ces_util, char, cons_pref
    )

    # Compute with Gauss-Hermite (deterministic)
    set_rc_matrix(nothing)  # Force Gauss-Hermite

    shares_gh, surplus_gh = expected_wallet_shares_and_surplus(
        ces_util, char, cons_pref
    )

    # Restore original
    set_rc_matrix(RC_MATRIX_SAVE)

    # Methods should agree to Monte Carlo error
    @test all(isapprox.(shares_mc, shares_gh, rtol=0.01))  # 1% tolerance for MC error
    @test isapprox(surplus_mc, surplus_gh, rtol=0.01)
end
```

---

## 4. Price Index Identity

### Identity Requirements
The CES price index should satisfy:
```
E[log(P)] ≈ log(σ/(σ-1)) + E[average_fee]
```

Where:
- σ = merchant CES parameter (merch_param.ces)
- P = price index from merchant's perspective
- average_fee = fee paid by merchant weighted by usage

**Mathematical Derivation:**
From CES preferences with σ substitution elasticity:
```
P^(1-σ) = (1 + γ × surplus)^(1-σ) × (σ/(σ-1) - τ)^(1-σ)
```

Taking logs and expectations:
```
(1-σ) E[log P] ≈ (1-σ) E[log(σ/(σ-1) - τ)]
E[log P] ≈ E[log(σ/(σ-1) - τ)]
         ≈ log(σ/(σ-1)) - E[τ]  # for small τ
```

### Current Test Coverage

**Existing Tests:**
- `test_price_index_integrand_change_bundle()` (Line 915)
- `test_price_index_integrand_change_gamma()` (Line 946)
- `test_price_index_integrand_nopassthrough()` (Line 964)
- `test_eqm_price_index_basic()` (Line 983)
- `test_debit_credit_price_index_comparison()` (Line 1004)

**Coverage Summary:**
- Price index behavior: GOOD (5 tests)
- Price index identity: NOT TESTED

### Gap Identified

#### Gap 4.1: Price Index Identity Not Verified
**Description:** No test verifies the fundamental relationship between average log prices and average fees predicted by CES theory.

**Current State:**
```julia
# Price index is computed but identity never checked
# TESTED: NO
```

**Severity:** **Critical** (could produce silent wrong answers)

**Rationale:** If the price index calculation is wrong (e.g., wrong CES formula, wrong passthrough parameter), the model would still "work" but estimate wrong primitives. This is a critical economic identity that should hold in theory. Violations would indicate fundamental implementation errors.

**Example of Silent Failure:**
- If `price_index_integrand!` uses wrong formula (e.g., forgets to include gamma term)
- Model would still converge to equilibrium
- But estimated merchant surplus parameters would be biased
- Only way to detect: verify theoretical identity holds

**Proposed Test:**
```julia
function test_price_index_identity()
    # Create simple scenario with known parameters
    payment_type = [2, 2]  # Two credit cards
    fees = [0.02, 0.03]
    all_bundles = [0 0; 1 0; 0 1; 1 1]

    # Merchant parameters
    merch_param = MerchParam(5.0, 1.0, 0.10, 0.05, 0.0, 0.0, 0.0)
    usage_param = UsageParam(1.0, 0.0, 1.0, 0.5)

    # Consumer parameters (for insulated shares)
    ces_util = realistic_ces_utilities()
    char = realistic_characteristics()
    cons_pref = realistic_consumer_preferences()

    # Solve for equilibrium
    alloc = solve_realistic_equilibrium(
        all_bundles, payment_type, fees, ces_util, char,
        usage_param, merch_param, cons_pref
    )

    # Extract price index
    price_index_to_power = alloc.price_index_to_power
    ces = merch_param.ces

    # Convert to log prices
    log_price_index = log.(price_index_to_power) ./ (1 - ces)

    # Compute average log price (weighted by merchant type distribution)
    avg_log_price = compute_weighted_avg_log_price(
        log_price_index, alloc.insulated_shares,
        alloc.switch, alloc.bundles, merch_param
    )

    # Compute average fee paid by merchants
    avg_fee = compute_weighted_avg_fee(
        fees, payment_type, alloc.insulated_shares,
        alloc.switch, alloc.bundles, usage_param, merch_param
    )

    # Theoretical prediction
    theoretical_avg_log_price = log(ces / (ces - 1)) + avg_fee

    # Verify identity holds (allowing tolerance for numerical integration)
    @test isapprox(avg_log_price, theoretical_avg_log_price, atol=0.01)

    # Also test component price indices
    for primary in 1:(length(fees)+1)
        for secondary in 1:(length(fees)+1)
            if primary == 1 && secondary == 1
                # Cash-only: price index should be 1.0
                @test isapprox(price_index_to_power[1, 1], 1.0, atol=1e-10)
            else
                # Card bundles: price index should decrease with more cards
                @test price_index_to_power[primary, secondary] >= 1.0
            end
        end
    end
end
```

**Alternative Simpler Test:**
```julia
function test_price_index_zero_fee_identity()
    # When fees = 0, price index should equal σ/(σ-1) exactly
    payment_type = [2, 2]
    fees = [0.0, 0.0]
    all_bundles = [0 0; 1 1]  # Just cash and both cards

    merch_param = MerchParam(5.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0)  # gamma = 0
    usage_param = UsageParam(1.0, 0.0, 1.0, 0.5)
    insulated_shares = ones(3, 3) / 9

    price_index, switch, bundles = eqm_price_index(
        all_bundles, payment_type, fees, insulated_shares,
        usage_param, merch_param
    )

    ces = merch_param.ces

    # For both-cards bundle with zero fees and zero gamma
    # P^(1-σ) = (σ/(σ-1))^(1-σ)
    # P = σ/(σ-1)
    expected_price = ces / (ces - 1)
    expected_price_to_power = expected_price ^ (1 - ces)

    # Check (2, 2) bundle (both cards accepted)
    @test isapprox(price_index[3, 3], expected_price_to_power, rtol=1e-3)
end
```

---

## 5. Fixed Point Residuals

### Identity Requirements
At equilibrium convergence:
1. `||f(x) - x|| < tol` (fixed point residual)
2. Residual should be reported and logged
3. Residual magnitude should be checked not just convergence flag

### Current Test Coverage

**Existing Tests:**
- `test_solve_fixed_point_basic()` (Line 2336) - Tests convergence flag
- `test_solve_fixed_point_sqrt()` (Line 2348) - Tests convergence to known FP
- `test_solve_fixed_point_no_convergence()` (Line 2359) - Tests non-convergence detection
- `test_solve_fixed_point_multidim()` (Line 2370) - Tests multidim convergence

**Coverage Summary:**
- Convergence flag: GOOD (4 tests)
- Residual magnitude: NOT TESTED

### Gaps Identified

#### Gap 5.1: Fixed Point Residual Magnitude
**Description:** Tests check `solver.converged` but not `solver.resid`. If convergence tolerance is too loose, wrong equilibria could be accepted.

**Current State:**
```julia
# In model_functions.jl line 3183
return (param = current_x, converged = converged, resid = resid, num_iter = num_iter)
# Tests check .converged but not .resid
```

**Severity:** **Important** (would fail loudly in most cases)

**Rationale:** If `SOLVE_TOL` is set too loose (e.g., 1e-2 instead of 1e-6), the model would converge to approximate equilibria. This would show up as moment misfits during estimation, but subtle errors could accumulate. Testing residual magnitude ensures the solver actually achieves the advertised tolerance.

**Proposed Test:**
```julia
function test_fixed_point_residual_magnitude()
    # Test that solver respects tolerance
    f = x -> 0.5 .* x .+ 0.1
    init_x = [10.0]

    # Solve with strict tolerance
    tol = 1e-8
    result = solve_fixed_point(f, init_x; tol = tol, max_iter = 10000)

    @test result.converged
    @test result.resid < tol  # KEY TEST

    # Verify residual matches manual calculation
    manual_resid = norm(f(result.param) .- result.param)
    @test isapprox(result.resid, manual_resid, rtol=1e-6)

    # Test that loose tolerance is also respected
    tol_loose = 1e-3
    result_loose = solve_fixed_point(f, init_x; tol = tol_loose, max_iter = 100)

    @test result_loose.converged
    @test result_loose.resid < tol_loose
    @test result_loose.num_iter < result.num_iter  # Should converge faster
end
```

#### Gap 5.2: Subgame Equilibrium Residual
**Description:** `solve_subgame()` calls `solve_fixed_point()` but doesn't verify that the returned price index is actually a fixed point.

**Current State:**
```julia
# In model_functions.jl line 3365
solver = solve_fixed_point(model, init_val; tol = tol, max_iter = max_iter, ...)
# Solver status checked but residual not re-verified
```

**Severity:** **Critical** (could produce silent wrong answers)

**Rationale:** If the fixed point solver has a bug (e.g., reports convergence prematurely), the subgame solution would be wrong. Since equilibrium is used throughout estimation, this would bias all parameter estimates. This is especially critical because the subgame is solved thousands of times during bootstrap estimation.

**Proposed Test:**
```julia
function test_subgame_fixed_point_residual()
    # Solve subgame
    all_bundles = powerset_indices(4)
    payment_type = [2, 2, 2, 2]
    fees = 0.02 * ones(4)
    ces_util = realistic_ces_utilities()
    char = realistic_characteristics()
    usage_param = UsageParam(1.0, 1.0, 1.0, 0.5)
    merch_param = MerchParam(5.0, 1.0, 0.3, 0.1, 0.0, 0.0, 0.0)
    cons_pref = realistic_consumer_preferences()

    eqm, solver = solve_subgame(
        all_bundles, payment_type, fees, ces_util, char,
        usage_param, merch_param, cons_pref;
        tol = SOLVE_TOL
    )

    # Check solver converged
    @test solver.converged
    @test solver.resid < SOLVE_TOL

    # Manually verify fixed point
    # Extract price index from equilibrium
    price_index_solution = eqm.price_index_to_power

    # Recompute what price index should be given this price index
    # (this is the fixed point mapping)
    income_shares = income_weighted_wallet_shares(ces_util, char, cons_pref)
    rewards = invert_reward_dollars(ces_util, merch_param.ces, price_index_solution)
    insulated_shares = calc_insulated_shares(income_shares, price_index_solution, rewards)

    price_index_recomputed, switch, bundles = eqm_price_index(
        all_bundles, payment_type, fees, insulated_shares,
        usage_param, merch_param
    )

    # Verify fixed point: price_index_recomputed should equal price_index_solution
    residual = maximum(abs.(price_index_recomputed .- price_index_solution))
    @test residual < SOLVE_TOL

    # Also verify normalized entries haven't changed
    @test isapprox(price_index_solution[1, 1], 1.0, atol=1e-10)
end
```

#### Gap 5.3: FOC Residual Verification
**Description:** In estimation, FOCs are matched to zero but the actual residual magnitude is never logged or tested.

**Severity:** **Important** (caught during estimation review)

**Rationale:** During GMM estimation, the FOC moments should be near zero at the optimum. However, if the optimizer stops prematurely or if the model is misspecified, FOCs might have large residuals. Testing FOC residuals would catch these issues.

**Proposed Test:**
```julia
function test_foc_residuals_at_equilibrium()
    # Solve for Nash equilibrium fees and rewards
    ownership = [[1, 2], [3, 4]]  # Two firms, each owns two networks

    # Solve equilibrium (should have FOCs = 0)
    alloc, params = solve_nash_equilibrium(ownership)

    # Compute FOC moments
    foc_moments = model_network_foc(alloc, ownership; estim=true)

    # At Nash equilibrium, FOCs should be zero
    @test all(abs.(foc_moments) .< 0.01)  # Allow small numerical error

    # Test that perturbing parameters increases FOC residuals
    perturbed_fees = params.fees .+ 0.001
    alloc_perturbed = compute_allocation_with_fees(perturbed_fees, params)
    foc_moments_perturbed = model_network_foc(alloc_perturbed, ownership; estim=true)

    @test maximum(abs.(foc_moments_perturbed)) > maximum(abs.(foc_moments))
end
```

---

## 6. Additional Payment-Network-Specific Identities

Beyond the standard identities, this payment network model has additional structural constraints that should be tested:

### Gap 6.1: Network Fee Revenue = Merchant Fee Payments
**Description:** Total fees collected by networks should equal total fees paid by merchants (zero-sum).

**Identity:**
```
Sum_i (fee_i × dollars_i) = Sum_merchants (merchant_fee_paid)
```

**Severity:** **Important** (would fail loudly)

**Current State:** NOT TESTED

**Proposed Test:**
```julia
function test_network_merchant_fee_balance()
    alloc = solve_realistic_equilibrium()
    fees = [0.02, 0.02, 0.03, 0.03]

    # Network fee revenue
    network_revenue = zeros(length(fees))
    for i in 1:length(fees)
        network_revenue[i] = sum(alloc.total_dollars[:, :, i+1]) * fees[i]
    end

    # Merchant fee payments (integrate over merchant types)
    merchant_payments = compute_total_merchant_fee_payments(
        alloc.switch, alloc.bundles, alloc.insulated_shares,
        fees, payment_type, usage_param, merch_param
    )

    # Should be exactly equal
    @test isapprox(sum(network_revenue), merchant_payments, atol=1e-8)
end
```

### Gap 6.2: Consumer Surplus + Merchant Surplus + Network Profit = Total Welfare
**Description:** Welfare decomposition should be internally consistent.

**Identity:**
```
Total_Welfare = Consumer_Surplus + Merchant_Profit + Network_Profit
```

**Severity:** **Nice-to-have** (welfare not directly estimated)

**Current State:**
- Consumer surplus computed (line 2161)
- Merchant profit computed (line 3895)
- Network profit computed (line 3683)
- Never summed or verified

**Proposed Test:**
```julia
function test_welfare_decomposition()
    alloc = solve_realistic_equilibrium()
    fees = [0.02, 0.02, 0.03, 0.03]
    costs = [0.01, 0.01, 0.01, 0.01]

    # Consumer surplus (already computed in allocation)
    consumer_surplus = alloc.consumer_surplus

    # Network profits
    network_profits = network_profits_given_dollars_and_shares(
        alloc.total_dollars, fees, costs,
        alloc.income_homing_shares, alloc.singlehome_rewards,
        usage_param
    )

    # Merchant surplus (need to compute)
    merchant_surplus = compute_total_merchant_surplus(
        alloc.switch, alloc.bundles, alloc.insulated_shares,
        fees, payment_type, usage_param, merch_param
    )

    # Total welfare
    total_welfare = consumer_surplus + sum(network_profits) + merchant_surplus

    # Verify welfare is positive
    @test total_welfare > 0.0

    # Verify welfare increases when fees decrease (efficiency gain)
    alloc_low_fees = solve_equilibrium_with_fees(fees .- 0.01)
    welfare_low_fees = compute_total_welfare(alloc_low_fees, fees .- 0.01, costs)

    @test welfare_low_fees > total_welfare
end
```

### Gap 6.3: Acceptance Complementarity Identity
**Description:** For debit-credit systems, acceptance of credit should be weakly increasing in debit acceptance (complementarity via kappa parameter).

**Identity:**
```
If debit_kappa < 1, then:
P(accept credit | accept debit) >= P(accept credit | not accept debit)
```

**Severity:** **Nice-to-have** (economic property, not accounting)

**Current State:** Tested indirectly via `test_debit_kappa_effect_on_credit_acceptance()` but not as formal identity

**Proposed Test:**
```julia
function test_acceptance_complementarity_identity()
    # Simple two-card model: debit + credit
    payment_type = [1, 2]  # Debit (kappa=0.6), Credit (kappa=1.0)
    fees = [0.01, 0.02]

    # Low kappa implies complementarity
    usage_param = UsageParam(0.8, 0.0, 1.0, 0.6)
    merch_param = MerchParam(5.0, 1.0, 0.10, 0.05, 0.0, 0.0, 0.0)

    # Compute acceptance probabilities
    prob_accept_credit_given_debit = compute_prob_accept(
        credit_index=2,
        conditional_on_debit=true,
        fees, payment_type, usage_param, merch_param
    )

    prob_accept_credit_given_no_debit = compute_prob_accept(
        credit_index=2,
        conditional_on_debit=false,
        fees, payment_type, usage_param, merch_param
    )

    # Complementarity: credit more likely when debit accepted
    @test prob_accept_credit_given_debit >= prob_accept_credit_given_no_debit
end
```

### Gap 6.4: Jacobian Rank Condition for Identification
**Description:** The Jacobian of moments with respect to parameters should have full rank for identification.

**Identity:**
```
rank(∂moments/∂params) = num_params
```

**Severity:** **Critical** (could produce silent wrong answers via weak identification)

**Current State:** NOT TESTED

**Proposed Test:**
```julia
function test_jacobian_rank_identification()
    # Compute Jacobian at estimated parameters
    params_estimated = load_estimated_parameters()

    # Compute numerical Jacobian
    jacobian = compute_moment_jacobian(params_estimated)

    # Check rank
    num_params = length(params_estimated)
    estimated_rank = rank(jacobian, atol=1e-6)

    @test estimated_rank == num_params

    # Check condition number (should not be too large)
    condition_num = cond(jacobian)
    @test condition_num < 1e8  # Rule of thumb for numerical stability

    # Identify which parameters are weakly identified
    U, S, V = svd(jacobian)
    weak_params = findall(S .< 0.01 * maximum(S))

    if !isempty(weak_params)
        @warn "Weakly identified parameters: $weak_params"
    end
end
```

---

## Summary Table: Accounting Identity Gaps

| Identity | Current Coverage | Gap Severity | Primary Risk | Recommended Priority |
|----------|-----------------|--------------|--------------|---------------------|
| **Market Share Constraints** |
| Component shares sum to 1 | GOOD | - | - |
| System-level shares sum | MISSING | Important | Would fail loudly | HIGH |
| Income-weighted shares sum | MISSING | Important | Would fail loudly | HIGH |
| Dollar shares sum | MISSING | Nice-to-have | By construction | LOW |
| **Profit Decomposition** |
| Basic profit calculation | GOOD | - | - | - |
| Zero-sum rewards | GOOD | - | - | - |
| Revenue-cost-rewards identity | MISSING | Important | Would fail loudly | MEDIUM |
| Multi-homing reward allocation | MISSING | **Critical** | Silent wrong answers | **VERY HIGH** |
| Merchant profit accounting | MISSING | Nice-to-have | Not directly used | LOW |
| **Integration Consistency** |
| Basic integration | EXCELLENT | - | - | - |
| Price index integration | MISSING | Important | Would fail loudly | MEDIUM |
| Dollar spending integration | MISSING | Important | Would fail loudly | MEDIUM |
| MC vs. GH agreement | MISSING | Nice-to-have | MC is default | LOW |
| **Price Index Identity** |
| Price index behavior | GOOD | - | - | - |
| CES identity E[log P] ≈ log(σ/(σ-1)) + E[fee] | **MISSING** | **Critical** | Silent wrong answers | **VERY HIGH** |
| **Fixed Point Residuals** |
| Convergence flag | GOOD | - | - | - |
| Residual magnitude | MISSING | Important | Would fail during estimation | HIGH |
| Subgame FP residual | MISSING | **Critical** | Silent wrong answers | **VERY HIGH** |
| FOC residuals | MISSING | Important | Caught during estimation | MEDIUM |
| **Payment Network Identities** |
| Network-merchant fee balance | MISSING | Important | Would fail loudly | MEDIUM |
| Welfare decomposition | MISSING | Nice-to-have | Welfare not estimated | LOW |
| Acceptance complementarity | PARTIAL | Nice-to-have | Economic property | LOW |
| Jacobian rank | **MISSING** | **Critical** | Weak identification | **VERY HIGH** |

---

## Recommended Testing Priorities

### Tier 1: CRITICAL (implement immediately)
1. **Price index CES identity** (Gap 4.1) - Could produce fundamentally wrong estimates
2. **Multi-homing reward allocation** (Gap 2.2) - Silent errors in reward passthrough
3. **Subgame fixed point residual** (Gap 5.2) - Equilibrium might not be equilibrium
4. **Jacobian rank identification** (Gap 6.4) - Weak identification undetected

### Tier 2: IMPORTANT (implement soon)
5. **System-level homing shares sum** (Gap 1.1) - Core probability constraint
6. **Income-weighted shares sum** (Gap 1.2) - Dollar accounting foundation
7. **Fixed point residual magnitude** (Gap 5.1) - Solver tolerance verification
8. **Revenue-cost-rewards decomposition** (Gap 2.1) - Profit calculation verification

### Tier 3: MEDIUM (implement when time allows)
9. **Price index integration consistency** (Gap 3.1) - Regime switching errors
10. **Dollar spending integration** (Gap 3.2) - Multi-homing splits
11. **FOC residuals at equilibrium** (Gap 5.3) - Estimation diagnostic
12. **Network-merchant fee balance** (Gap 6.1) - Fee accounting

### Tier 4: NICE-TO-HAVE (low priority)
13. **Dollar shares sum to 1** (Gap 1.3) - By construction
14. **Merchant profit accounting** (Gap 2.3) - Not directly used
15. **MC vs. GH agreement** (Gap 3.3) - Method comparison
16. **Welfare decomposition** (Gap 6.2) - Not estimated
17. **Acceptance complementarity** (Gap 6.3) - Economic property

---

## Implementation Notes

### Tolerance Recommendations
Based on `settings.jl`:
- **General accounting identities**: `atol = 1e-6` (matches `SOLVE_TOL`)
- **Integration consistency**: `rtol = 1e-3` to `1e-4` (numerical integration error)
- **Price index identity**: `atol = 0.01` (theory is approximate for nonlinear case)
- **Fixed point residuals**: Must be `< tol` where `tol` is solver tolerance
- **Market shares**: `atol = 1e-6` for sums, `atol = -1e-10` for non-negativity

### Test Organization
Recommended to create new testset:
```julia
@testset "Accounting Identities (System-Level)                       " begin
    test_homing_shares_sum_to_one()
    test_income_weighted_shares_sum()
    test_profit_decomposition_identity()
    test_multihoming_reward_allocation()
    test_price_index_identity()
    test_fixed_point_residual_magnitude()
    test_subgame_fixed_point_residual()
    test_jacobian_rank_identification()
end
```

### Helper Functions Needed
Several tests require helper functions not currently in codebase:
- `compute_weighted_avg_log_price()` - Integrate log price over merchant distribution
- `compute_weighted_avg_fee()` - Average fee weighted by usage
- `compute_total_merchant_surplus()` - Integrate merchant surplus
- `compute_total_welfare()` - Sum all welfare components
- `compute_moment_jacobian()` - Numerical Jacobian for identification test

---

## Conclusion

The test suite has **strong component-level accounting coverage** but **critical gaps in system-level validation**. The most serious risks are:

1. **Price index identity** (Gap 4.1) - Core CES theory not verified
2. **Multi-homing rewards** (Gap 2.2) - Complex allocation logic untested
3. **Fixed point verification** (Gap 5.2) - Equilibrium might not be equilibrium
4. **Identification** (Gap 6.4) - Weak identification undetected

These gaps could lead to **silent wrong answers** where the model runs successfully but estimates biased parameters. Implementing the Tier 1 tests would significantly increase confidence in the model's economic validity and numerical accuracy.

The existing test suite excels at mechanical correctness (50% of tests) and has good coverage of basic accounting identities (27% of tests). Expanding system-level accounting tests would complement this foundation and provide end-to-end validation of the model's theoretical consistency.
