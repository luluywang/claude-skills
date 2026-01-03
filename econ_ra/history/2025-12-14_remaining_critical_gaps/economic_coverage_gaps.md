# Economic Test Coverage Gaps Analysis

**Generated:** 2025-12-14
**Purpose:** Identify functions lacking economic correctness tests (comparative statics, substitution patterns, equilibrium properties)

---

## Executive Summary

This analysis identifies **19 critical gaps** in economic testing across the moment computation pipeline. The existing test suite has excellent mechanical correctness (53% of tests) but only **20% economic correctness tests**. Key gaps:

- **6 Critical gaps**: Functions that could produce silent wrong answers (equilibrium properties, moment aggregation)
- **8 Important gaps**: Functions that would fail loudly but lack verification of economic properties
- **5 Nice-to-have gaps**: Edge cases and comparative statics tests for completeness

**Priority:** Focus on moment computation pipeline functions called in every iteration (25 core functions from estimation_function_usage.md).

---

## Gap Classification Framework

### Severity Ratings

- **Critical**: Could produce silent wrong answers (e.g., wrong signs, incorrect elasticities, violated FOCs)
- **Important**: Would fail loudly (e.g., negative shares, divergence) but economic properties untested
- **Nice-to-have**: Edge cases unlikely in practice or redundant with other tests

### Economic Properties to Test

1. **Comparative statics**: Parameter changes → predictable moment changes
2. **Substitution patterns**: Cross-price elasticities, diversion ratios
3. **Equilibrium properties**: Nash FOCs = 0, SOCs < 0, envelope conditions
4. **Accounting identities**: Already well-tested (27% of test suite)

### Test Approaches

- **Analytical**: Use known formulas (logit elasticities, simple cases)
- **Numerical**: Verify against calibrated parameters, finite differences
- **Mixed**: Analytical for special cases, numerical for general verification

---

## CRITICAL GAPS (6 functions)

### Gap 1: `all_model_moments` - Moment Aggregation

**Function:** Line 4464 (estimation_function_usage.md)

**Current Economic Test Coverage:** NONE
- Called in every estimation iteration
- Orchestrates ~40 moments from 11 component functions
- No tests exist for this critical aggregation function

**Gap Description:**
- **Missing:** Comparative statics - how moments respond to parameter changes
  - Example: Increasing CES elasticity σ → merchant acceptance should increase (lower markups)
  - Example: Increasing debit kappa → debit usage should increase
- **Missing:** Moment consistency checks
  - Example: Dollar shares should sum to 1.0
  - Example: FOC moments should be near zero at estimated parameters
- **Missing:** Substitution pattern verification
  - Example: Increasing Visa fee → Mastercard usage should increase (cross-price effect)

**Severity Rationale:** **CRITICAL**
- This is the **main entry point** for all moment calculations
- Silent errors here propagate to all 40+ moments
- No existing tests verify economic sensibility of aggregated output
- Could produce nonsensical estimates that pass mechanical checks

**Proposed Test Approach:** **Mixed analytical/numerical**

1. **Analytical tests (special cases):**
   - Set σ → ∞: verify merchants accept all cards (competitive limit)
   - Set passthrough = 0: verify fees don't affect price index moments
   - Set type_overlap = 0: verify credit/debit are separate markets

2. **Numerical comparative statics:**
   - Increase σ by 10% → verify merchant acceptance moments increase
   - Increase debit_kappa by 10% → verify debit dollar share increases
   - Increase Visa fee by 10% → verify Visa dollar share decreases, MC share increases

3. **Moment consistency:**
   - Verify dollar shares sum to 1.0 ± 1e-6
   - Verify FOC moments near zero (|FOC| < 0.01) at estimated parameters
   - Verify reward moments match input rewards within tolerance

**Implementation sketch:**
```julia
@testset "all_model_moments economic properties" begin
    # Setup: calibrated parameters
    moments, alloc, _ = all_model_moments(...)

    # Test 1: Comparative statics - CES elasticity
    high_ces_param = deepcopy(merch_param)
    high_ces_param.ces *= 1.1
    moments_high_ces, _, _ = all_model_moments(...; merch_param=high_ces_param)
    dcpc_moments_idx = 1:4
    @test moments_high_ces[3] > moments[3]  # More merchant acceptance

    # Test 2: Dollar shares sum to 1
    dollar_share_idx = 18:22  # indices for dollar shares
    @test isapprox(sum(moments[dollar_share_idx]), 1.0, atol=1e-6)

    # Test 3: FOC moments near zero at optimum
    foc_idx = 28:35
    @test maximum(abs.(moments[foc_idx])) < 0.01
end
```

---

### Gap 2: `network_foc_all_entries` - Jacobian Matrix Computation

**Function:** Line 3742 (estimation_function_usage.md)

**Current Economic Test Coverage:** NONE
- Computes ∂π_i/∂x_j for all networks i, instruments j
- Called in iterations 3-6 (FOC estimation)
- Returns Jacobian matrix [num_pay × 2*num_pay]

**Gap Description:**
- **Missing:** Envelope theorem verification
  - FOC w.r.t. own instruments should equal zero at optimum
  - Off-diagonal derivatives (∂π_i/∂x_j for i≠j) should be small/zero for single-product firms
- **Missing:** Sign pattern tests
  - ∂π/∂rewards should be negative (rewards reduce profit)
  - ∂π/∂fees should have complex signs (merchant acceptance effects)
- **Missing:** Symmetry/reciprocity tests (Slutsky conditions)
  - In competitive models: ∂²profit/∂fee_i∂fee_j should be symmetric
- **Missing:** Cross-price effects
  - ∂π_Visa/∂fee_MC should be positive (substitution increases Visa volume)

**Severity Rationale:** **CRITICAL**
- FOC moments are **core identification** for passthrough, complementarity parameters
- Wrong Jacobian → wrong parameter estimates
- Existing test (test_network_foc_ownership, line 1600) only tests accounting (multiproduct aggregation)
- No verification that Jacobian satisfies economic theory

**Proposed Test Approach:** **Mixed analytical/numerical**

1. **Analytical tests (logit benchmark):**
   - Set σ → ∞, passthrough = 1, type_overlap = 0
   - Derive analytical FOC formulas for simple logit case
   - Verify Jacobian matches analytical derivatives

2. **Numerical envelope theorem:**
   - Solve for optimal fees/rewards using FOC = 0
   - Verify ∂π/∂(own reward) ≈ 0 within tolerance
   - Verify ∂π/∂(own fee) ≈ 0 for uncapped fees

3. **Sign pattern tests:**
   - Verify ∂π/∂rewards < 0 for all entries
   - Verify ∂π_i/∂fee_j > 0 for i ≠ j (same network type)

4. **Finite difference validation:**
   - Compute Jacobian via numerical differentiation (1e-4 perturbations)
   - Compare to Gauss-Hermite Jacobian
   - Verify agreement within 1% relative error

**Implementation sketch:**
```julia
@testset "network_foc_all_entries economic properties" begin
    # Test 1: Envelope theorem at estimated optimum
    alloc = network_allocation(...)
    jac = alloc.profit_jac  # [num_pay × 2*num_pay]

    # Own reward derivatives should be near zero
    for i in 1:num_pay
        @test abs(jac[i, i]) < 0.01  # ∂π_i/∂reward_i ≈ 0
    end

    # Test 2: Sign patterns
    for i in 1:num_pay
        @test jac[i, i] < 0  # ∂π/∂reward < 0 (always)
    end

    # Test 3: Cross-price substitution (Visa vs MC Credit)
    visa_credit_idx = 2
    mc_credit_idx = 4
    # ∂π_Visa/∂fee_MC should be positive (MC fee increase → Visa gains)
    @test jac[visa_credit_idx, num_pay + mc_credit_idx] > 0

    # Test 4: Finite difference validation
    function network_profit_wrapper(x)
        fees_temp = copy(fees)
        fees_temp[visa_credit_idx] = x
        profits = network_profits(...; fees=fees_temp)
        return profits[visa_credit_idx]
    end

    fd_deriv = (network_profit_wrapper(fees[visa_credit_idx] + 1e-4) -
                network_profit_wrapper(fees[visa_credit_idx] - 1e-4)) / 2e-4
    gh_deriv = jac[visa_credit_idx, num_pay + visa_credit_idx]
    @test isapprox(fd_deriv, gh_deriv, rtol=0.01)
end
```

---

### Gap 3: `solve_equilibrium_given_intercept_and_slope` - Envelope Algorithm

**Function:** Line 802 (model_functions.jl)

**Current Economic Test Coverage:** Extensive mechanical tests (12 tests in testset 4), **zero economic tests**
- Finds upper envelope of merchant profit functions
- Returns switch points (γ thresholds) and bundle indices
- Core equilibrium solver called in every subgame iteration

**Gap Description:**
- **Missing:** Monotonicity of switch points
  - Switch points should be weakly increasing: γ_1 ≤ γ_2 ≤ ... ≤ γ_n
  - Violation would indicate algorithm error or ill-posed problem
- **Missing:** Envelope dominance property
  - At γ = γ_k, bundles k and k+1 should have equal profit
  - Bundle k+1 should have higher slope than bundle k (else not on envelope)
- **Missing:** Economic interpretability
  - Higher γ merchants should accept more cards (lower fixed cost sensitivity)
  - First bundle should typically be empty or minimal (lowest γ)
- **Missing:** Fixed cost comparative statics
  - Increasing fixed costs → switch points shift right (fewer merchants accept cards)

**Severity Rationale:** **CRITICAL**
- Envelope algorithm is **heart of the model** (merchant acceptance decisions)
- Existing tests verify mechanical correctness (ties, dominated bundles, edge cases) - excellent coverage
- But **no verification** that envelope satisfies economic theory (monotonicity, dominance)
- Wrong envelope → wrong merchant acceptance → wrong all moments

**Proposed Test Approach:** **Analytical + numerical verification**

1. **Analytical monotonicity:**
   - After every call, verify γ_i ≤ γ_{i+1} (strict inequality unless tie)
   - Verify slopes satisfy b_i < b_{i+1} (steeper slope at higher γ)

2. **Envelope crossing property:**
   - At each switch point γ_k, verify profit_k(γ_k) = profit_{k+1}(γ_k)
   - Verify profit_{k+1}(γ_k + ε) > profit_k(γ_k + ε) for small ε

3. **Economic interpretability:**
   - Verify first bundle has fewer cards than last bundle (monotone in size)
   - Verify bundles on envelope are undominated (no bundle has higher intercept AND slope)

4. **Fixed cost comparative statics:**
   - Increase f1 by 10% → verify all switch points increase (shift right)
   - Verify number of bundles on envelope decreases or stays same

**Implementation sketch:**
```julia
@testset "solve_equilibrium economic properties" begin
    # Get envelope
    switches, bundles = solve_equilibrium_given_intercept_and_slope(
        all_intercept, all_slope)

    # Test 1: Monotonicity of switch points
    for i in 1:length(switches)-1
        @test switches[i] <= switches[i+1]
    end

    # Test 2: Slope monotonicity
    for i in 1:length(bundles)-1
        idx_current = bundles[i]
        idx_next = bundles[i+1]
        @test all_slope[idx_current] < all_slope[idx_next]
    end

    # Test 3: Envelope crossing property
    for i in 1:length(switches)-1
        gamma_switch = switches[i]
        idx_current = bundles[i]
        idx_next = bundles[i+1]

        profit_current = all_intercept[idx_current] + all_slope[idx_current] * gamma_switch
        profit_next = all_intercept[idx_next] + all_slope[idx_next] * gamma_switch

        @test isapprox(profit_current, profit_next, rtol=1e-6)
    end

    # Test 4: Fixed cost comparative statics
    high_f1_merch = deepcopy(merch_param)
    high_f1_merch.fixed_cost_f1 *= 1.1
    high_intercept, high_slope = profit_parameters_all_bundles(
        ...; merch_param=high_f1_merch)
    switches_high, _ = solve_equilibrium_given_intercept_and_slope(
        high_intercept, high_slope)

    # All switch points should shift right (increase)
    for i in 1:min(length(switches), length(switches_high))
        @test switches_high[i] >= switches[i]
    end
end
```

---

### Gap 4: `model_network_foc` - FOC Moment Extraction

**Function:** Line 4233 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Extracts 8 FOC moments for GMM estimation
- Normalizes by dollar volume
- Called in iterations 3-6

**Gap Description:**
- **Missing:** Verification that FOC moments ≈ 0 at estimated parameters
  - At true optimum, all FOCs should be zero (first-order conditions)
  - Non-zero FOCs indicate estimation error or model misspecification
- **Missing:** Comparative statics of FOC moments
  - Increasing fee → FOC w.r.t. that fee should become more negative (overshooting)
  - Increasing CES → FOC magnitudes should decrease (flatter profit functions)
- **Missing:** Ownership aggregation correctness
  - Multi-product firms should have aggregated FOCs
  - Single-product firms should have individual FOCs
  - Test that aggregation sums correctly

**Severity Rationale:** **CRITICAL**
- FOC moments are **core of estimation** (identify passthrough, complementarity)
- Wrong extraction → biased parameter estimates
- Existing test (test_network_foc_ownership) only verifies mechanical ownership aggregation
- No test verifies FOC moments have correct economic interpretation

**Proposed Test Approach:** **Numerical verification**

1. **Zero FOC at optimum:**
   - Load estimated parameters from bootstrap
   - Compute FOC moments at estimated (fee, reward) vector
   - Verify all normalized FOCs < 0.01 in absolute value

2. **Comparative statics:**
   - Perturb fee_Visa by +1% → verify FOC_Visa becomes more negative
   - Perturb reward_Visa by +1% → verify FOC_Visa becomes more positive

3. **Ownership aggregation:**
   - Compare single-product vs. multi-product ownership structures
   - Verify that multi-product FOC = sum of constituent single-product FOCs

**Implementation sketch:**
```julia
@testset "model_network_foc economic properties" begin
    # Test 1: FOC ≈ 0 at estimated parameters
    # (requires loading estimated parameters from file)
    param_vec = CSV.read("../data/.../fit_foc_base_1_1_param.csv").value
    alloc = network_allocation(...; fees=param_vec[6:10], ...)
    foc_moments = model_network_foc(alloc, ownership; estim=true)

    @test maximum(abs.(foc_moments)) < 0.05  # Loose tolerance

    # Test 2: Comparative statics - fee perturbation
    perturbed_fees = copy(fees)
    perturbed_fees[2] += 0.001  # Increase Visa credit fee
    alloc_pert = network_allocation(...; fees=perturbed_fees)
    foc_pert = model_network_foc(alloc_pert, ownership; estim=true)

    # FOC w.r.t. Visa credit fee should become more negative
    @test foc_pert[num_pay + 1] < foc_moments[num_pay + 1]

    # Test 3: Ownership aggregation
    single_own = [[i] for i in 1:num_pay]  # Each card separate
    multi_own = [[1,2], [3,4], [5]]  # Visa, MC, Amex

    foc_single = model_network_foc(alloc, single_own; estim=false)
    foc_multi = model_network_foc(alloc, multi_own; estim=false)

    # Multi-product Visa FOC should equal sum of VD + VC single FOCs
    @test isapprox(foc_multi[1], foc_single[1] + foc_single[2], rtol=1e-6)
end
```

---

### Gap 5: `profit_parameters_all_bundles` - Merchant Profit Calculations

**Function:** Line 558 (model_functions.jl)

**Current Economic Test Coverage:** 5 tests (testset 2), mostly mechanical
- Computes intercepts a_m and slopes b_m for each bundle m
- Profit function: π_m(γ) = a_m + b_m × γ
- Tests verify correct values for specific configurations, but no economic properties

**Gap Description:**
- **Missing:** Comparative statics of slopes and intercepts
  - Increasing fee → intercept should decrease (merchant gets less per transaction)
  - Increasing CES elasticity → slope should increase (more sensitive to convenience)
  - Adding cards to bundle → slope should increase (more consumer convenience)
- **Missing:** Slope ordering across bundles
  - Bundles with more cards should generally have higher slopes (more convenience value)
  - Exception: if fees vary significantly, high-fee bundles may have lower intercepts
- **Missing:** Fixed cost effects
  - Increasing f1 → intercepts for all non-empty bundles decrease by f1
  - Increasing f2 → intercepts for 2+ network bundles decrease by f2

**Severity Rationale:** **CRITICAL**
- Profit parameters directly determine merchant acceptance equilibrium
- Wrong slopes/intercepts → wrong envelope → wrong acceptance rates → wrong all moments
- Existing tests verify specific numerical values but not economic properties
- Could have sign errors or wrong formulas that pass mechanical tests

**Proposed Test Approach:** **Mixed analytical/numerical**

1. **Analytical tests (known cases):**
   - Zero fees: intercept should equal -fixed_cost only
   - Single card bundle: slope = κ × (share of that card type)
   - Full bundle: slope = sum of all convenience values weighted by shares

2. **Comparative statics (numerical):**
   - Increase fee on card j → verify intercept decreases for all bundles containing j
   - Increase CES → verify slopes increase (more consumer surplus from variety)
   - Increase type_overlap → verify slopes change (cross-type substitution)

3. **Bundle size ordering:**
   - Fix fees constant: verify larger bundles have higher slopes
   - Vary fees: verify sign patterns consistent with economic theory

**Implementation sketch:**
```julia
@testset "profit_parameters_all_bundles economic properties" begin
    all_int, all_slope = profit_parameters_all_bundles(
        all_bundles, payment_type, fees, insulated_shares, usage_param, merch_param)

    # Test 1: Zero fees → intercept = -fixed_cost
    zero_fees = zeros(num_pay)
    all_int_zero, _ = profit_parameters_all_bundles(
        all_bundles, payment_type, zero_fees, insulated_shares, usage_param, merch_param)

    grand_bundle_idx = 32  # All cards
    expected_intercept = -(merch_param.fixed_cost_f1 + merch_param.fixed_cost_f2)
    @test isapprox(all_int_zero[grand_bundle_idx], expected_intercept, rtol=1e-6)

    # Test 2: Fee increase → intercept decreases
    high_fee = copy(fees)
    high_fee[2] += 0.01  # Visa credit
    all_int_high, _ = profit_parameters_all_bundles(
        all_bundles, payment_type, high_fee, insulated_shares, usage_param, merch_param)

    # All bundles containing Visa credit should have lower intercept
    for (idx, bundle) in enumerate(eachrow(all_bundles))
        if bundle[2] == 1  # Contains Visa credit
            @test all_int_high[idx] < all_int[idx]
        end
    end

    # Test 3: CES increase → slope increases
    high_ces_merch = deepcopy(merch_param)
    high_ces_merch.ces += 1.0
    _, all_slope_high = profit_parameters_all_bundles(
        all_bundles, payment_type, fees, insulated_shares, usage_param, high_ces_merch)

    # All slopes should increase (more consumer surplus)
    for idx in 2:32  # Skip empty bundle
        if all_slope[idx] > 0
            @test all_slope_high[idx] > all_slope[idx]
        end
    end

    # Test 4: Bundle size ordering (fixed fees)
    uniform_fees = fill(0.02, num_pay)
    all_int_unif, all_slope_unif = profit_parameters_all_bundles(
        all_bundles, payment_type, uniform_fees, insulated_shares, usage_param, merch_param)

    # Bundles with more cards should have higher slopes (generally)
    bundle_sizes = [sum(all_bundles[i, :]) for i in 1:32]
    # Check that mean slope increases with bundle size
    for size in 1:4
        idx_size = findall(bundle_sizes .== size)
        idx_size_plus = findall(bundle_sizes .== size + 1)
        if !isempty(idx_size) && !isempty(idx_size_plus)
            mean_slope_size = mean(all_slope_unif[idx_size])
            mean_slope_plus = mean(all_slope_unif[idx_size_plus])
            @test mean_slope_plus >= mean_slope_size
        end
    end
end
```

---

### Gap 6: `model_moments_second_choice` - Substitution Elasticities

**Function:** Line 4120 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Extracts second-choice substitution moments
- Returns [log_price_sens_income, credit_cash_divert, debit_cash_divert, same_type_divert]
- Core identification for price sensitivity

**Gap Description:**
- **Missing:** Elasticity bounds and sign patterns
  - log_price_sens_income should be negative (higher income → less price sensitive)
  - Diversion ratios should be in [0, 1] range
  - Same-type diversion should be higher than cross-type (closer substitutes)
- **Missing:** Comparative statics
  - Increasing type_overlap → cross-type diversion should increase
  - Increasing char_corr → diversion to similar cards should increase
- **Missing:** Adding-up constraints
  - Diversion matrix rows should sum to 1.0 (must substitute somewhere)

**Severity Rationale:** **CRITICAL**
- Second-choice moments **identify price sensitivity** (key parameter)
- Wrong diversion → wrong elasticities → wrong counterfactuals
- No existing tests verify economic properties of these moments
- Could return nonsensical values that pass mechanical checks

**Proposed Test Approach:** **Analytical + numerical**

1. **Analytical bounds:**
   - Verify log_price_sens_income < 0 (economic theory)
   - Verify all diversion ratios ∈ [0, 1]
   - Verify same_type_diversion > cross_type_diversion (IIA relaxation test)

2. **Comparative statics:**
   - Set type_overlap = 0 → verify cross-type diversion ≈ 0
   - Set type_overlap = 1 → verify cross-type diversion > 0
   - Increase char_corr → verify within-brand diversion increases

3. **Matrix properties:**
   - Extract full diversion matrix from allocation
   - Verify rows sum to 1.0 ± 1e-6
   - Verify symmetry where expected (e.g., Visa Debit ↔ MC Debit)

**Implementation sketch:**
```julia
@testset "model_moments_second_choice economic properties" begin
    alloc = network_allocation(...)
    sc_moments = model_moments_second_choice(alloc)

    # Test 1: Sign patterns and bounds
    @test sc_moments[1] < 0  # log_price_sens_income negative
    @test all(0 .<= sc_moments[2:4] .<= 1)  # Diversion ratios in [0,1]

    # Test 2: Same-type diversion higher than cross-type
    credit_cash_divert = sc_moments[2]
    same_type_divert = sc_moments[4]
    @test same_type_divert > credit_cash_divert

    # Test 3: Type overlap comparative statics
    no_overlap_param = deepcopy(usage_param)
    no_overlap_param.type_overlap = 0.0
    alloc_no_overlap = network_allocation(...; usage_param=no_overlap_param)
    sc_no_overlap = model_moments_second_choice(alloc_no_overlap)

    # With zero overlap, cross-type diversion should be minimal
    @test sc_no_overlap[2] < 0.1  # Credit to cash (some cash, but no debit)
    @test sc_no_overlap[3] < 0.1  # Debit to cash

    # Test 4: Full diversion matrix adding-up
    full_diversion = alloc.diversion  # Bank-level diversion matrix
    # Each row should sum to 1.0 (diversion from bank i goes somewhere)
    for i in 1:size(full_diversion, 1)
        row_sum = sum(full_diversion[i, :])
        @test isapprox(row_sum, 1.0, atol=1e-6)
    end
end
```

---

## IMPORTANT GAPS (8 functions)

### Gap 7: `eqm_price_index` - CES Price Index Calculation

**Function:** Line 1665 (model_functions.jl)

**Current Economic Test Coverage:** 5 tests (testset 7), mixed mechanical/economic
- Tests verify some economic properties (bundle size effects, passthrough)
- Missing comprehensive comparative statics and elasticity tests

**Gap Description:**
- **Missing:** Price index monotonicity in fees
  - With passthrough > 0: higher fees → higher price index (P increases)
  - With passthrough = 0: fees shouldn't affect price index
- **Missing:** CES functional form verification
  - Price index should satisfy P^{1-σ} = sum of p_i^{1-σ} shares
  - Test against analytical formula for simple cases
- **Missing:** γ (merchant type) effects
  - Higher γ → lower price index (more merchant surplus reduces effective prices)
  - Verify this relationship holds across merchant distribution

**Severity Rationale:** **IMPORTANT**
- Price index is central to consumer utility calculation
- Wrong price index → wrong consumer choices → wrong moments
- Would likely fail loudly (negative price indices, divergence)
- But existing tests provide partial coverage (5 tests)

**Proposed Test Approach:** **Analytical + numerical**

1. **Analytical tests:**
   - Two-card case: derive analytical price index formula
   - Verify numerical output matches analytical prediction
   - Test boundary cases: σ → 1 (Cobb-Douglas), σ → ∞ (perfect substitutes)

2. **Comparative statics:**
   - Increase all fees by 10% → verify price index increases proportionally (full passthrough)
   - Set passthrough = 0.5 → verify price index increases by ~5% (half passthrough)
   - Increase γ_mean → verify price index decreases (more merchant surplus)

3. **Functional form verification:**
   - For simple bundle: compute P^{1-σ} directly from formula
   - Compare to integrated output from eqm_price_index
   - Verify agreement within numerical integration tolerance

**Implementation sketch:**
```julia
@testset "eqm_price_index comparative statics" begin
    # Test 1: Fee increase with full passthrough
    pi_baseline, _, _ = eqm_price_index(all_bundles, payment_type, fees,
        insulated_shares, usage_param, merch_param)

    high_fees = fees .* 1.1
    pi_high_fees, _, _ = eqm_price_index(all_bundles, payment_type, high_fees,
        insulated_shares, usage_param, merch_param)

    # Price index should increase (approximately proportionally)
    # P^{1-σ} increases with fees, so raw price index increases
    @test all(pi_high_fees .>= pi_baseline)

    # Test 2: Zero passthrough
    zero_passthrough_merch = deepcopy(merch_param)
    zero_passthrough_merch.passthrough = 0.0
    pi_no_pass, _, _ = eqm_price_index(all_bundles, payment_type, high_fees,
        insulated_shares, usage_param, zero_passthrough_merch)
    pi_baseline_no_pass, _, _ = eqm_price_index(all_bundles, payment_type, fees,
        insulated_shares, usage_param, zero_passthrough_merch)

    # With zero passthrough, fees shouldn't affect price index
    @test isapprox(pi_no_pass, pi_baseline_no_pass, rtol=1e-3)

    # Test 3: Gamma mean increase
    high_gamma_merch = deepcopy(merch_param)
    high_gamma_merch.gamma_mean *= 1.2
    pi_high_gamma, _, _ = eqm_price_index(all_bundles, payment_type, fees,
        insulated_shares, usage_param, high_gamma_merch)

    # Higher gamma → more merchant surplus → lower effective price
    # P^{1-σ} incorporates (1 + γv) term, which increases with γ
    # So raw price index should increase
    @test all(pi_high_gamma .>= pi_baseline)
end
```

---

### Gap 8: `expected_wallet_shares_and_surplus` - Consumer Homing Decisions

**Function:** Line 2161 (model_functions.jl)

**Current Economic Test Coverage:** Limited (part of testset 8)
- test_high_volatility_increases_substitution verifies RC volatility effect
- Missing comprehensive utility and choice tests

**Gap Description:**
- **Missing:** Utility monotonicity tests
  - Increasing CES utility for card j → homing share for j increases
  - Increasing reward for card j → multihoming share (j + other) increases
- **Missing:** Substitution pattern verification
  - Cards with similar characteristics should have higher cross-shares
  - Increasing correlation → multihoming on correlated cards increases
- **Missing:** Income effects
  - Higher income consumers should hold more cards (from estimation)
  - Verify income sorting matches empirical patterns

**Severity Rationale:** **IMPORTANT**
- Consumer homing drives all demand-side moments
- Wrong shares → wrong dollar allocation → wrong profits
- Would likely fail loudly (shares outside [0,1], negative surplus)
- Existing test provides partial coverage (volatility effect)

**Proposed Test Approach:** **Numerical verification**

1. **Utility monotonicity:**
   - Increase CES utility for Visa by 10% → verify single-homing Visa share increases
   - Verify multihoming shares (Visa + X) also increase

2. **Substitution patterns:**
   - Increase char_corr → verify within-network multihoming increases (Visa D + Visa C)
   - Verify cross-network multihoming decreases (substitution effect)

3. **Income effects:**
   - Compute wallet shares by income quintile
   - Verify higher income → more multihoming
   - Verify pattern consistent with empirical moments

**Implementation sketch:**
```julia
@testset "expected_wallet_shares economic properties" begin
    homing_shares, surplus = expected_wallet_shares_and_surplus(
        ces_util, char, cons_pref)

    # Test 1: Utility monotonicity
    high_util = copy(ces_util)
    high_util[2, :] .+= 0.5  # Increase Visa credit utility
    homing_high, _ = expected_wallet_shares_and_surplus(
        high_util, char, cons_pref)

    # Single-homing Visa credit share should increase
    visa_credit_idx = 2
    @test homing_high[visa_credit_idx + 1, 1] > homing_shares[visa_credit_idx + 1, 1]

    # Test 2: Correlation effect on within-network multihoming
    high_corr_pref = deepcopy(cons_pref)
    high_corr_pref.char_corr = 0.8  # Increase correlation
    homing_high_corr, _ = expected_wallet_shares_and_surplus(
        ces_util, char, high_corr_pref)

    # Visa Debit + Visa Credit multihoming should increase
    # (both have char[, 1] = 1, so correlated in RC draw)
    visa_debit_idx = 1
    visa_credit_idx = 2
    @test homing_high_corr[visa_debit_idx + 1, visa_credit_idx + 1] >
          homing_shares[visa_debit_idx + 1, visa_credit_idx + 1]
end
```

---

### Gap 9: `convert_primary_secondary_to_second_choice!` - Substitution Matrix

**Function:** Line 2092 (model_functions.jl)

**Current Economic Test Coverage:** 2 tests (testset 10)
- test_convert_second_choice, test_pref_correlation_second_choice
- Tests verify mechanical correctness but not economic properties

**Gap Description:**
- **Missing:** Diversion ratio interpretation
  - Second-choice matrix should represent P(card j | card i unavailable)
  - Rows should sum to 1.0 (conditional probability)
  - Diagonal should be zero (can't substitute to self)
- **Missing:** Substitution asymmetry tests
  - Small card → large card diversion ≠ large card → small card diversion
  - Amex → Visa should be high (limited acceptance → broad acceptance)
  - Visa → Amex should be low (why downgrade to less accepted card?)
- **Missing:** Cash diversion bounds
  - Diversion to cash should be in [0, 1]
  - Cards with high fees → higher cash diversion

**Severity Rationale:** **IMPORTANT**
- Second-choice behavior identifies switching costs, network effects
- Wrong substitution → wrong cross-price elasticities → wrong merger analysis
- Would likely fail loudly (probabilities outside [0,1])
- Existing tests verify conversion algorithm works but not economic validity

**Proposed Test Approach:** **Numerical verification**

1. **Probability properties:**
   - Verify rows sum to 1.0 ± 1e-6 (conditional probabilities)
   - Verify diagonal = 0 (can't substitute to self)
   - Verify all entries ∈ [0, 1]

2. **Substitution asymmetry:**
   - Verify Amex → Visa > Visa → Amex (acceptance asymmetry)
   - Verify within-network diversion > cross-network (brand loyalty)

3. **Fee effects on cash diversion:**
   - Increase fees → verify cash diversion increases
   - Set fees = 0 → verify cash diversion minimal (only convenience-driven)

**Implementation sketch:**
```julia
@testset "convert_primary_secondary_to_second_choice economic properties" begin
    alloc = network_allocation(...)
    second_choice_matrix = alloc.second_choices

    # Test 1: Probability properties
    num_types = size(second_choice_matrix, 1)
    for i in 1:num_types
        # Row sum to 1 (must substitute somewhere)
        @test isapprox(sum(second_choice_matrix[i, :]), 1.0, atol=1e-6)
        # Diagonal is zero (can't substitute to self)
        @test second_choice_matrix[i, i] == 0.0
        # All entries non-negative
        @test all(second_choice_matrix[i, :] .>= 0.0)
    end

    # Test 2: Substitution asymmetry (Amex → Visa vs Visa → Amex)
    # Need to map payment types to second-choice matrix indices
    # Assume indices: 1=cash, 2=Visa, 3=MC, 4=Amex (simplified)
    amex_type_idx = 4
    visa_type_idx = 2

    # Amex → Visa should be higher (Amex holders need backup)
    @test second_choice_matrix[amex_type_idx, visa_type_idx] >
          second_choice_matrix[visa_type_idx, amex_type_idx]

    # Test 3: Fee effects on cash diversion
    high_fee = copy(fees)
    high_fee .+= 0.02
    alloc_high_fee = network_allocation(...; fees=high_fee)
    second_choice_high_fee = alloc_high_fee.second_choices

    # Cash diversion should increase (first column typically)
    cash_diversion_baseline = second_choice_matrix[:, 1]
    cash_diversion_high_fee = second_choice_high_fee[:, 1]
    @test mean(cash_diversion_high_fee) > mean(cash_diversion_baseline)
end
```

---

### Gap 10: `solve_subgame` - Merchant Acceptance Equilibrium

**Function:** Line 3299 (model_functions.jl)

**Current Economic Test Coverage:** 6 tests (testset 14), mostly mechanical
- Tests verify solver convergence, Jacobian accuracy, profit calculations
- Missing equilibrium property verification

**Gap Description:**
- **Missing:** Fixed point property verification
  - At convergence: P(P*) = P* (price index is fixed point)
  - Test that residual ||P(P*) - P*|| < tolerance
- **Missing:** Uniqueness tests
  - Try multiple starting points → should converge to same equilibrium
  - Verify equilibrium is locally unique (small perturbations converge back)
- **Missing:** Comparative statics on equilibrium
  - Increase fees → merchant acceptance should decrease (fewer cards accepted)
  - Increase CES → merchant acceptance should increase (more consumer value)

**Severity Rationale:** **IMPORTANT**
- Subgame solver is called hundreds of times per estimation
- Wrong equilibrium → wrong all moments
- Would fail loudly (non-convergence, negative shares)
- Existing tests verify solver mechanics but not equilibrium properties

**Proposed Test Approach:** **Numerical verification**

1. **Fixed point verification:**
   - After solve_subgame converges, verify residual < tolerance
   - Verify price index unchanged after one more iteration

2. **Multiple starting points:**
   - Solve from random initial guesses (10 different starts)
   - Verify all converge to same equilibrium (within tolerance)

3. **Comparative statics:**
   - Increase all fees → verify merchant acceptance decreases
   - Increase CES → verify merchant acceptance increases
   - Increase fixed costs → verify merchant acceptance decreases

**Implementation sketch:**
```julia
@testset "solve_subgame equilibrium properties" begin
    # Test 1: Fixed point property
    subgame, solver = solve_subgame(all_bundles, payment_type, fees,
        adoption_ces_util, char, usage_param, merch_param, cons_pref)

    @test solver.converged
    final_price_index = subgame.price_index

    # One more iteration should not change price index
    one_more = eqm_price_index(all_bundles, payment_type, fees,
        subgame.insulated_shares, usage_param, merch_param)
    @test isapprox(one_more[1], final_price_index, rtol=1e-4)

    # Test 2: Multiple starting points
    equilibria = []
    for trial in 1:5
        init_guess = rand(num_pay + 1, num_pay + 1) .* 10.0
        subgame_trial, solver_trial = solve_subgame(...;
            init_guess_price_index=init_guess)
        if solver_trial.converged
            push!(equilibria, subgame_trial.price_index)
        end
    end

    # All converged equilibria should be the same
    if length(equilibria) >= 2
        for i in 2:length(equilibria)
            @test isapprox(equilibria[1], equilibria[i], rtol=1e-3)
        end
    end

    # Test 3: Fee increase → lower acceptance
    high_fees = fees .* 1.2
    subgame_high_fee, _ = solve_subgame(...; fees=high_fees)

    # Measure acceptance: sum of dollars at card-accepting merchants
    baseline_card_acceptance = sum(subgame.card_dollars) / sum(subgame.total_dollars)
    high_fee_card_acceptance = sum(subgame_high_fee.card_dollars) /
                                sum(subgame_high_fee.total_dollars)

    @test high_fee_card_acceptance < baseline_card_acceptance
end
```

---

### Gap 11: `calc_insulated_shares` - Merchant Acceptance Shares

**Function:** Line 2480 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Computes merchant acceptance shares by consumer type
- No tests exist for this function

**Gap Description:**
- **Missing:** Share normalization
  - Insulated shares should sum appropriately across dimensions
  - Verify normalization constant is computed correctly
- **Missing:** Price index effects
  - Higher price index → lower insulated share (less attractive)
  - Verify relationship holds across consumer types
- **Missing:** Reward effects
  - Higher rewards → higher insulated share (more attractive)
  - Verify effect is stronger for price-sensitive consumers

**Severity Rationale:** **IMPORTANT**
- Insulated shares drive dollar allocation across bundles
- Wrong shares → wrong merchant profits → wrong equilibrium
- Would likely fail visibly (shares outside [0,1], wrong totals)
- No existing tests provide any coverage

**Proposed Test Approach:** **Numerical verification**

1. **Normalization:**
   - Verify shares sum correctly across primary/secondary dimensions
   - Verify normalization constant computed correctly

2. **Comparative statics:**
   - Increase price index → verify insulated shares decrease
   - Increase rewards → verify insulated shares increase

3. **Cross-consumer heterogeneity:**
   - High-income vs low-income shares respond differently to price changes
   - Verify income-weighted shares incorporate sorting correctly

**Implementation sketch:**
```julia
@testset "calc_insulated_shares economic properties" begin
    insulated_shares, norm_const = calc_insulated_shares(
        income_homing_shares, price_index_to_power, bundle_rewards)

    # Test 1: Normalization
    # Sum over primary/secondary should match income_homing_shares structure
    # (complex test, depends on model structure)
    total_insulated = sum(insulated_shares)
    @test total_insulated > 0  # Shares are positive

    # Test 2: Price index increase → shares decrease
    high_price_index = price_index_to_power .* 1.1
    insulated_high_pi, _ = calc_insulated_shares(
        income_homing_shares, high_price_index, bundle_rewards)

    # Total insulated shares should decrease (higher prices less attractive)
    @test sum(insulated_high_pi) < sum(insulated_shares)

    # Test 3: Reward increase → shares increase
    high_rewards = bundle_rewards .+ 0.01
    insulated_high_rew, _ = calc_insulated_shares(
        income_homing_shares, price_index_to_power, high_rewards)

    # Total insulated shares should increase (higher rewards more attractive)
    @test sum(insulated_high_rew) > sum(insulated_shares)
end
```

---

### Gap 12: `network_foc_aggregate` - Multi-Product FOC Aggregation

**Function:** Line 3817 (model_functions.jl)

**Current Economic Test Coverage:** 1 test (test_network_foc_ownership, line 1600)
- Existing test verifies multi-product aggregation works mechanically
- Missing economic property verification

**Gap Description:**
- **Missing:** Envelope theorem for multi-product firms
  - For firm owning cards {i, j}: ∂π_firm/∂x_k = ∂π_i/∂x_k + ∂π_j/∂x_k
  - Verify aggregation sums correctly across owned products
- **Missing:** Internalization of business-stealing effects
  - Single-product firm: only considers own profit
  - Multi-product firm: internalizes cannibalization (∂π_i/∂x_j ≠ 0)
  - Verify multi-product FOC accounts for cross-effects

**Severity Rationale:** **IMPORTANT**
- Multi-product ownership is central to policy analysis (mergers)
- Wrong aggregation → wrong merger predictions
- Existing test provides mechanical coverage
- Economic interpretation not verified

**Proposed Test Approach:** **Numerical verification**

1. **Aggregation identity:**
   - Compute single-product FOCs for all cards
   - Manually sum FOCs for multi-product firm
   - Verify equals aggregated FOC from function

2. **Internalization test:**
   - Compare single-product vs multi-product FOCs
   - Verify multi-product firm has smaller FOC magnitudes (internalizes cross-effects)

**Implementation sketch:**
```julia
@testset "network_foc_aggregate economic properties" begin
    # Get full Jacobian
    full_jac = network_foc_all_entries(...)  # [num_pay × 2*num_pay]

    # Test 1: Manual aggregation matches function
    single_own = [[i] for i in 1:num_pay]
    multi_own = [[1, 2], [3, 4], [5]]  # Visa, MC, Amex

    foc_agg = network_foc_aggregate(multi_own, full_jac)

    # Manually compute Visa aggregation: sum of VD + VC rows
    manual_visa_foc = full_jac[1, :] + full_jac[2, :]
    @test isapprox(foc_agg[1, :], manual_visa_foc, rtol=1e-10)

    # Test 2: Multi-product has smaller FOC (internalization)
    foc_single = network_foc_aggregate(single_own, full_jac)

    # Visa Debit fee FOC should be smaller in magnitude for multi-product
    # (internalizes cannibalization of Visa Credit)
    vd_fee_idx = num_pay + 1
    @test abs(foc_agg[1, vd_fee_idx]) < abs(foc_single[1, vd_fee_idx])
end
```

---

### Gap 13: `model_moments_nilson` - Durbin Amendment Shock

**Function:** Line 4086 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Computes debit usage change from reward shock (Durbin Amendment)
- No tests exist for this moment function

**Gap Description:**
- **Missing:** Sign verification
  - Decreasing debit rewards (Durbin shock) → debit usage should decrease
  - debit_change should be positive (log(low) - log(high) > 0)
  - credit_change should be negative (substitution to credit)
- **Missing:** Elasticity bounds
  - Debit change should be ≈ 30% (empirical target)
  - Credit change should be smaller (not all debit goes to credit)
- **Missing:** Substitution pattern
  - Cash should also increase (not just credit)
  - Verify total spending unchanged (pure substitution)

**Severity Rationale:** **IMPORTANT**
- Nilson moment identifies debit/credit substitution elasticity
- Wrong sign → wrong parameter estimates
- Would fail visibly (wrong sign pattern in estimation)
- No existing tests verify economic properties

**Proposed Test Approach:** **Numerical verification**

1. **Sign pattern:**
   - Verify debit_change > 0 (debit usage falls after negative shock)
   - Verify credit_change < 0 (credit usage rises)

2. **Magnitude:**
   - Verify debit_change ≈ 0.3 (30% decrease from Durbin)
   - Verify credit_change < debit_change in absolute value

3. **Total spending:**
   - Verify sum of pre-Durbin dollars = sum of post-Durbin dollars (pure substitution)

**Implementation sketch:**
```julia
@testset "model_moments_nilson economic properties" begin
    alloc = network_allocation(...)
    debit_change, credit_change = model_moments_nilson(alloc; reward_shock=0.0025)

    # Test 1: Sign pattern
    @test debit_change > 0  # Debit usage decreases (log(high) - log(low) > 0)
    @test credit_change < 0  # Credit usage increases

    # Test 2: Magnitude reasonable
    @test 0.1 < debit_change < 0.5  # Debit drops 10-50%
    @test abs(credit_change) < debit_change  # Not all debit → credit

    # Test 3: Total spending unchanged (compute manually)
    # This requires re-running full allocation, so check total dollar sums
    # are similar before/after shock
end
```

---

### Gap 14: `model_moments_first_credit` - Merchant Acceptance Threshold

**Function:** Line 4158 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Finds γ threshold where merchants first accept credit cards
- No tests exist for this moment function

**Gap Description:**
- **Missing:** Monotonicity in fixed costs
  - Increasing f1 → first_credit threshold increases (fewer merchants accept)
  - Increasing f2 → first_credit threshold increases (if 2+ networks)
- **Missing:** Monotonicity in fees
  - Increasing credit card fees → first_credit threshold increases (less profitable)
  - Decreasing fees → more merchants accept (threshold decreases)
- **Missing:** Bundle interpretation
  - First bundle with credit should typically be Visa/MC only (most accepted)
  - Last bundle should be all 3 credit cards

**Severity Rationale:** **IMPORTANT**
- First credit moment identifies fixed costs (key parameter)
- Wrong threshold → wrong fixed cost estimates → wrong entry analysis
- Would fail visibly (Inf or nonsensical values)
- No existing tests verify economic properties

**Proposed Test Approach:** **Numerical verification**

1. **Fixed cost monotonicity:**
   - Increase f1 by 10% → verify first_credit increases

2. **Fee monotonicity:**
   - Increase all credit fees → verify first_credit increases

3. **Bundle interpretation:**
   - Verify first bundle accepting credit has 1 credit card
   - Verify last bundle accepting credit has all 3 credit cards

**Implementation sketch:**
```julia
@testset "model_moments_first_credit economic properties" begin
    alloc = network_allocation(...)
    first_credit_baseline = model_moments_first_credit(alloc, payment_type)

    # Test 1: Fixed cost increase → threshold increases
    high_f1_alloc = network_allocation(...;
        merch_param=MerchParam(..., fixed_cost_f1=merch_param.fixed_cost_f1 * 1.1, ...))
    first_credit_high_f1 = model_moments_first_credit(high_f1_alloc, payment_type)

    @test first_credit_high_f1 > first_credit_baseline

    # Test 2: Fee increase → threshold increases
    high_credit_fees = copy(fees)
    credit_idx = findall(payment_type .== 2)
    high_credit_fees[credit_idx] .+= 0.01
    high_fee_alloc = network_allocation(...; fees=high_credit_fees)
    first_credit_high_fee = model_moments_first_credit(high_fee_alloc, payment_type)

    @test first_credit_high_fee > first_credit_baseline

    # Test 3: Bundle interpretation (requires inspecting alloc.bundle)
    # Find first bundle index that accepts any credit
    cc_index = findall(payment_type .== 2)
    accepted_bundles = view(alloc.potential_bundles, alloc.bundle, :)
    total_cc_accepted = dropdims(sum(view(accepted_bundles, :, cc_index), dims=2), dims=2)
    first_cc_indices = findall(total_cc_accepted .>= 1)

    # Verify first bundle has 1 credit card (not all 3)
    if !isempty(first_cc_indices)
        first_bundle_idx = alloc.bundle[first_cc_indices[1]]
        num_cc_in_first = sum(alloc.potential_bundles[first_bundle_idx, cc_index])
        @test num_cc_in_first >= 1
        @test num_cc_in_first < 3  # Not all credit cards immediately
    end
end
```

---

## NICE-TO-HAVE GAPS (5 functions)

### Gap 15: `payment_shares_at_pos` - POS Payment Splitting

**Function:** Line 408 (model_functions.jl)

**Current Economic Test Coverage:** 2 tests (testset 1) - good coverage
- test_payment_shares_at_pos, test_payment_surplus_at_pos
- Tests verify shares sum to ≤ 1.0 and handle multihoming

**Gap Description:**
- **Missing:** Type overlap comparative statics
  - Set type_overlap = 0 → verify no cross-type usage (credit ≠ debit)
  - Set type_overlap = 1 → verify full cross-type substitution
- **Missing:** Primary use share verification
  - Set primary_use_share = 1 → verify secondary never used when both accepted
  - Set primary_use_share = 0.5 → verify 50-50 split when both accepted

**Severity Rationale:** **NICE-TO-HAVE**
- Existing tests provide good mechanical coverage
- Function is simple and deterministic
- Additional tests would verify parameter interpretation but unlikely to find bugs

**Proposed Test Approach:** **Analytical**

1. Verify type_overlap = 0 → no cross-type usage
2. Verify primary_use_share effects on splitting

---

### Gap 16: `integrate_function_rc_draws!` - Consumer Heterogeneity Integration

**Function:** Line 2043 (model_functions.jl)

**Current Economic Test Coverage:** NONE directly (tested indirectly via wallet shares)
- Integration method tested in testset 6 (numerical integrals)
- Consumer choices tested in testset 8 (logit shares)
- But no direct test of this wrapper function

**Gap Description:**
- **Missing:** Monte Carlo vs Gauss-Hermite agreement
  - Compute same integral with both methods
  - Verify outputs agree within MC sampling error
- **Missing:** Number of draws sensitivity
  - Test convergence as number of MC draws increases
  - Verify Gauss-Hermite is more efficient (fewer evaluations for same accuracy)

**Severity Rationale:** **NICE-TO-HAVE**
- Numerical integration tested extensively in testset 6
- This is a wrapper that dispatches to tested functions
- Additional tests would verify integration method consistency but unlikely to find bugs
- Would be useful for performance tuning (MC vs GH comparison)

**Proposed Test Approach:** **Numerical**

1. Compute wallet shares with USE_FULL_MC_INTEGRATION = true
2. Compute wallet shares with USE_FULL_MC_INTEGRATION = false (hybrid)
3. Verify outputs agree within 1% (MC sampling tolerance)

---

### Gap 17: `model_reward_diff` - Reward Rate Spreads

**Function:** Line 4153 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Trivial function: just returns allocation.singlehome_rewards
- No tests exist

**Gap Description:**
- **Missing:** Verification that returned rewards match input adoption_ces_util
  - Rewards should equal what was inverted from CES utilities
  - Test round-trip: adoption_ces_util → rewards → ces_util should match

**Severity Rationale:** **NICE-TO-HAVE**
- Function is trivial (one line)
- Unlikely to contain bugs
- Test would verify parameter passing but not economic content

**Proposed Test Approach:** **Numerical**

1. Verify returned rewards match input rewards (round-trip test)
2. Verify reward spreads have reasonable magnitudes (e.g., 0-5%)

---

### Gap 18: `model_moments_primary_secondary` - Multihoming Patterns

**Function:** Line 4143 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Extracts multihoming probabilities and correlations
- No tests exist for this moment function

**Gap Description:**
- **Missing:** Bounds on multihoming probability
  - Should be in [0, 1]
  - Should increase with card variety (more cards → more multihoming)
- **Missing:** Correlation bounds
  - primary_secondary_correl should be in [-1, 1]
  - Should be positive (similar consumers hold similar cards)

**Severity Rationale:** **NICE-TO-HAVE**
- Moments are mechanically extracted from homing shares
- Would fail visibly if out of bounds
- Additional tests would verify moment interpretation but unlikely to find bugs

**Proposed Test Approach:** **Numerical**

1. Verify all multihoming probabilities ∈ [0, 1]
2. Verify primary_secondary_correl ∈ [-1, 1]
3. Verify increasing utility → higher multihoming

---

### Gap 19: `model_dollar_shares` - Payment Dollar Shares

**Function:** Line 4064 (model_functions.jl)

**Current Economic Test Coverage:** NONE
- Trivial function: sums dollar allocation across dimensions
- No tests exist

**Gap Description:**
- **Missing:** Verification that shares sum to 1.0
  - Dollar shares should be in [0, 1]
  - Sum should equal 1.0 (all dollars allocated)
- **Missing:** Monotonicity in fees
  - Increasing fee for card j → dollar share for j decreases

**Severity Rationale:** **NICE-TO-HAVE**
- Function is simple aggregation
- Accounting identity (shares sum to 1) already tested extensively in testset 9
- Additional test would be redundant with existing coverage

**Proposed Test Approach:** **Numerical**

1. Verify shares sum to 1.0 ± 1e-6 (accounting identity)
2. Verify all shares ∈ [0, 1]
3. Verify fee increase → share decreases

---

## Priority Ranking for Implementation

### Tier 1: Critical Gaps (Must Have)

1. **Gap 1: `all_model_moments`** - Main entry point, no coverage
2. **Gap 2: `network_foc_all_entries`** - FOC Jacobian, core identification
3. **Gap 5: `profit_parameters_all_bundles`** - Merchant profit functions
4. **Gap 3: `solve_equilibrium_given_intercept_and_slope`** - Envelope algorithm

### Tier 2: Important Gaps (Should Have)

5. **Gap 4: `model_network_foc`** - FOC moment extraction
6. **Gap 6: `model_moments_second_choice`** - Substitution elasticities
7. **Gap 8: `expected_wallet_shares_and_surplus`** - Consumer homing
8. **Gap 7: `eqm_price_index`** - Price index calculation (partial coverage exists)

### Tier 3: Nice-to-Have (Could Have)

9. **Gap 9: `convert_primary_secondary_to_second_choice!`** - Has partial coverage
10. **Gap 10: `solve_subgame`** - Has mechanical coverage
11. **Gaps 11-14:** Lower priority (smaller scope or less central)
12. **Gaps 15-19:** Lowest priority (trivial functions or good existing coverage)

---

## Implementation Recommendations

### Short-term (1-2 weeks)

Implement Tier 1 tests (Gaps 1-5):
- Focus on **comparative statics** (parameter changes → moment changes)
- Use **numerical verification** (easier to implement than analytical)
- Target **moment computation pipeline** (called in every iteration)

### Medium-term (1 month)

Add Tier 2 tests (Gaps 6-8):
- Include **equilibrium property tests** (FOCs = 0, SOCs < 0)
- Add **substitution pattern tests** (cross-price effects, diversion)
- Verify **envelope theorem** (optimality conditions)

### Long-term (ongoing)

Add Tier 3 tests as needed:
- Lower priority but useful for completeness
- Can defer until bugs found or refactoring needed

---

## Summary Statistics

- **Total gaps identified:** 19
- **Critical gaps:** 6 (32%)
- **Important gaps:** 8 (42%)
- **Nice-to-have gaps:** 5 (26%)

**Test approach breakdown:**
- **Analytical tests:** 4 functions (21%)
- **Numerical tests:** 12 functions (63%)
- **Mixed analytical/numerical:** 3 functions (16%)

**Coverage by function category:**
- **Moment computation (11 functions):** 7 gaps (64% missing tests)
- **Equilibrium solution (15 functions):** 5 gaps (33% missing tests)
- **Consumer behavior (18 functions):** 4 gaps (22% missing tests)
- **Network FOCs (12 functions):** 3 gaps (25% missing tests)

---

## Conclusion

The existing test suite has **excellent mechanical correctness coverage** (53% of tests) but only **20% economic correctness tests**. The identified gaps focus on:

1. **Comparative statics:** How moments respond to parameter changes
2. **Equilibrium properties:** FOCs, envelope conditions, fixed points
3. **Substitution patterns:** Cross-price effects, diversion ratios

**Highest priority:** The 6 critical gaps in the moment computation pipeline (Gaps 1-6), which could produce silent wrong answers that propagate throughout estimation.

**Recommended approach:** Start with numerical comparative statics tests (easier to implement than analytical), focusing on functions called in every estimation iteration.
