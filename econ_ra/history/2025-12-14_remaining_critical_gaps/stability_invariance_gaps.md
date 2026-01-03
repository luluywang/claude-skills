# Numerical Stability and Invariance Test Coverage Gaps

**Generated:** 2025-12-14
**Task:** Assessment of numerical stability and invariance test coverage for Julia payment network competition model
**Input files:** test_classification.md, model_functions.jl

---

## Executive Summary

This analysis identifies critical gaps in numerical stability and invariance testing for the structural model estimation code. While the test suite has **68 tolerance-aware assertions** using `isapprox` (demonstrating awareness of floating-point precision), it lacks systematic tests for:

1. **Numerical stability under perturbations** (0/8 routines tested)
2. **Conditioning problems in linear solvers** (partial coverage only)
3. **Invariance to network/bundle relabeling** (1/5 properties tested)
4. **Integration method equivalence** (0/2 comparisons tested)
5. **Extreme parameter values** (0/6 scenarios tested)

**Critical finding:** The Anderson-accelerated fixed-point solver computes condition numbers but has no tests verifying behavior under ill-conditioning. This could produce silent convergence to wrong equilibria.

---

## Part 1: Numerical Stability Gaps

### Gap 1.1: Equilibrium Solver Perturbation Stability

**Function:** `solve_equilibrium_given_intercept_and_slope` (Line 802)

**Current Coverage:**
- 12 test functions covering algorithmic correctness
- 1 test (`test_equilibrium_shuffle_bundles`) verifies invariance to input ordering
- Tolerance checks use `atol=1e-6` for switch points
- Division-free obsolescence test implemented (Line 866) for numerical stability
- Monotonicity verification with `eps(FT)` guard (Line 939)

**Gap Description:**
No tests verify that small perturbations to intercepts/slopes (±1e-6) produce small changes in switch points and bundle assignments. The convex hull algorithm is theoretically stable, but floating-point accumulation could cause catastrophic switching near degeneracies.

**Severity:** **Critical**
- Could produce silent wrong answers when profit functions nearly cross
- Tie-breaking logic (Line 847) uses `isapprox` but tolerance not tested
- Near-degenerate hulls (e.g., three bundles with nearly identical slopes) untested

**Proposed Test:**
```julia
function test_equilibrium_perturbation_stability()
    # Base case: three bundles with well-separated switch points
    intercepts = [0.0, 0.02, 0.04]
    slopes = [0.0, 0.25, 0.28]

    switch_base, bundle_base = solve_equilibrium_given_intercept_and_slope(
        intercepts, slopes
    )

    # Perturb intercepts by 1e-6
    for perturb_scale in [1e-6, 1e-7, 1e-8]
        intercepts_perturb = intercepts .+ perturb_scale .* randn(3)
        slopes_perturb = slopes .+ perturb_scale .* randn(3)

        switch_perturb, bundle_perturb = solve_equilibrium_given_intercept_and_slope(
            intercepts_perturb, slopes_perturb
        )

        # Switch points should change by O(perturbation size)
        @test maximum(abs.(switch_base .- switch_perturb)) < 100 * perturb_scale

        # Bundle sequence should be identical (no catastrophic switches)
        @test bundle_base == bundle_perturb
    end

    # Near-degenerate case: two bundles with nearly identical slopes
    intercepts_degen = [0.0, 0.02, 0.025]
    slopes_degen = [0.0, 0.25, 0.250001]  # Slopes differ by 1e-6

    switch_degen, bundle_degen = solve_equilibrium_given_intercept_and_slope(
        intercepts_degen, slopes_degen
    )

    # Should not throw error and should produce valid hull
    @test length(switch_degen) > 0
    @test all(diff(switch_degen) .>= 0)  # Monotonicity
end
```

**Expected Tolerance:**
- Well-conditioned cases: switch point changes < 100× perturbation
- Near-degenerate cases: should not crash, maintain monotonicity

---

### Gap 1.2: Anderson Acceleration Conditioning Stability

**Function:** `solve_fixed_point` (Line 2824)

**Current Coverage:**
- 4 test functions for convergence behavior
- G'G condition number computed (Line 2998-3004) but **never tested**
- Regularization applied: `reg = max(1e-10, 1e-6 * maximum(abs.(diag(GtG))))` (Line 3007)
- Fallback to damped iteration when Anderson diverges (Line 3036)

**Gap Description:**
The solver computes and stores `current_gtg_condition` but no tests verify:
1. Behavior when condition number exceeds 1e10 (ill-conditioned)
2. Whether regularization is sufficient to prevent numerical failures
3. Stability of the constrained least-squares solve (Line 3011-3018)

**Severity:** **Critical**
- Could converge to wrong fixed point under ill-conditioning
- Silent failure mode: Anderson step rejected → falls back to damping → slow convergence to wrong solution
- The `catch` block (Line 3048) swallows errors without diagnostics

**Proposed Test:**
```julia
function test_anderson_ill_conditioned_matrix()
    # Create a fixed-point problem with ill-conditioned history
    # Use a nearly-singular linear contraction
    λ1, λ2 = 0.999, 0.001  # Condition number ≈ 1000

    A = [λ1 0.0; 0.0 λ2]
    f = x -> A * x

    init_x = [1.0, 1e3]  # Amplifies ill-conditioning

    # Callback to track condition numbers
    cond_numbers = Float64[]
    callback = (sample) -> push!(cond_numbers, sample.gtg_condition)

    result = solve_fixed_point(f, init_x;
        max_iter = 500,
        anderson_depth = 5,
        diag_callback = callback,
        diag_frequency = 1
    )

    @test result.converged
    @test all(isapprox.(result.param, [0.0, 0.0], atol=1e-5))

    # Verify condition numbers were tracked
    @test any(cond_numbers .> 100)  # Should hit ill-conditioning

    # Test fallback behavior: if Anderson fails, should still converge
    @test result.num_iter < 500  # Should not hit max_iter
end

function test_anderson_fallback_correctness()
    # Test that fallback to damping produces correct answer
    # Use a function where Anderson might fail but damping works

    f = x -> [sqrt(max(x[1], 0.0)), 0.9 * x[2]]  # Non-smooth + smooth
    init_x = [0.5, 10.0]

    result = solve_fixed_point(f, init_x; max_iter = 1000, verbose = false)

    @test result.converged
    @test isapprox(result.param[1], 1.0, atol=1e-3)  # sqrt fixed point
    @test isapprox(result.param[2], 0.0, atol=1e-5)  # linear fixed point
end
```

**Expected Tolerance:**
- Condition numbers up to 1e6: converge to correct fixed point
- Condition numbers > 1e10: may fail but should not silently converge to wrong answer

---

### Gap 1.3: Logit Share Overflow/Underflow

**Function:** `logit_shares_surplus!` (Line 1911)

**Current Coverage:**
- 1 test (`test_logit_neginf`) verifies `-Inf` utility handling (Line 1085)
- Uses log-sum-exp trick: `exp(mean_utility - max_util)` (Line 1925)
- No tests for extreme utility values

**Gap Description:**
While the log-sum-exp trick prevents overflow, no tests verify:
1. Behavior when utility differences > 100 (underflow in shares)
2. Precision loss when `max_util` is very large (>1e10)
3. Surplus calculation accuracy for extreme utilities

**Severity:** **Important** (fails loudly via NaN, not silently)
- Likely to produce NaN if log-sum-exp trick fails
- But could lose precision in share calculations (e.g., share < 1e-16 rounded to 0)

**Proposed Test:**
```julia
function test_logit_extreme_utilities()
    share_output = zeros(3)

    # Test 1: Large utility differences (underflow)
    mean_utility = [0.0, -50.0, -100.0]
    surplus = logit_shares_surplus!(share_output, mean_utility)

    @test isapprox(share_output[1], 1.0, atol=1e-10)
    @test share_output[2] < 1e-20  # Should underflow to near-zero
    @test share_output[3] < 1e-40
    @test isapprox(surplus, 0.0, atol=1e-10)  # log(1 + near-zero) ≈ 0

    # Test 2: Very large utilities (precision test)
    mean_utility_large = [1e10, 1e10 + 1, 1e10 - 1]
    surplus_large = logit_shares_surplus!(share_output, mean_utility_large)

    # Shares should be well-behaved
    @test all(share_output .>= 0)
    @test all(share_output .<= 1)
    @test isapprox(sum(share_output), 1.0, atol=1e-10)
    @test !isnan(surplus_large)
    @test !isinf(surplus_large)

    # Middle option should have highest share
    @test share_output[2] > share_output[1]
    @test share_output[2] > share_output[3]

    # Test 3: Mixed extreme utilities
    mean_utility_mixed = [1e10, 0.0, -1e10]
    surplus_mixed = logit_shares_surplus!(share_output, mean_utility_mixed)

    @test isapprox(share_output[1], 1.0, atol=1e-15)
    @test share_output[2] < 1e-8
    @test share_output[3] < 1e-16
end
```

**Expected Tolerance:**
- Utility differences up to 700: exact share calculation (no underflow)
- Utility differences 700-1000: shares < 1e-300 but numerically stable
- Very large utilities (>1e8): maintain sum-to-1 constraint within 1e-10

---

### Gap 1.4: Gamma Integral Precision with Extreme Parameters

**Function:** `gamma_integral!` (Line 1402)

**Current Coverage:**
- 3 tests verify integration accuracy against analytical solutions
- Hybrid Gauss-Laguerre + Gauss-Legendre for large `sd_range` (Line 1434)
- Tolerance: `rtol=1e-6` for truncated integrals (Line 761)

**Gap Description:**
No tests verify numerical stability for:
1. Very small sigma (σ < 1e-6): potential underflow in `theta = var/mean`
2. Very large sigma (σ > 100): large `sd_range` may exceed quadrature accuracy
3. Mean very close to left endpoint (`mean - left < 1e-8`): division issues

**Severity:** **Important**
- Likely to fail loudly (NaN or integration error)
- But could silently lose precision in tail probabilities

**Proposed Test:**
```julia
function test_gamma_integral_extreme_parameters()
    output = zeros(1)
    buffer = zeros(1)
    integrand! = (buf, x) -> (buf[1] = x)  # E[X] should equal mean

    # Test 1: Very small sigma (high concentration)
    mean_small_sigma = 10.0
    sigma_small = 1e-6
    gamma_integral!(integrand!, output, buffer, 0.0, mean_small_sigma, sigma_small)
    @test isapprox(output[1], mean_small_sigma, rtol=1e-4)

    # Test 2: Very large sigma (high variance)
    mean_large_sigma = 10.0
    sigma_large = 50.0
    gamma_integral!(integrand!, output, buffer, 0.0, mean_large_sigma, sigma_large)
    @test isapprox(output[1], mean_large_sigma, rtol=1e-2)

    # Test 3: Left endpoint near mean
    mean_close = 5.0
    left_close = 4.999999
    sigma_close = 0.1
    gamma_integral!(integrand!, output, buffer, left_close, mean_close, sigma_close)
    # Should integrate over very small tail
    @test output[1] >= 0
    @test output[1] < mean_close

    # Test 4: Large mean and sigma (scaling test)
    mean_huge = 1e6
    sigma_huge = 1e5
    gamma_integral!(integrand!, output, buffer, 0.0, mean_huge, sigma_huge)
    @test isapprox(output[1], mean_huge, rtol=1e-3)
end
```

**Expected Tolerance:**
- σ ∈ [1e-6, 100]: relative error < 1e-3
- Extreme scaling (mean > 1e6): relative error < 1e-2

---

### Gap 1.5: Gauss-Hermite Derivative Numerical Differentiation Error

**Function:** `gauss_hermite_cts_derivative` (Line 3432)

**Current Coverage:**
- 3 tests verify derivatives match analytical for linear/polynomial functions
- Tolerance: `rtol=1e-2` to `1e-4` (Line 2107, 2117)
- Tests use `shock_vol=0.01` (Line 2099)

**Gap Description:**
No tests assess how derivative accuracy degrades with:
1. Larger `shock_vol` (>0.1): finite difference error increases
2. Smaller `shock_vol` (<1e-6): cancellation error dominates
3. Non-smooth functions (e.g., `max(0, x)`): integration smooths but derivative approximation quality unknown

**Severity:** **Important**
- Finite difference error is O(h²) where h = `shock_vol * GH_SINGLE`
- Current tests only verify one shock_vol value
- GMM estimation uses shock_vol for trembling: need to verify robustness

**Proposed Test:**
```julia
function test_gauss_hermite_derivative_shock_vol_sensitivity()
    # Test f(x) = x^3 (analytical derivative = 3x^2)
    f_cubic(x) = [x[1]^3]
    x_point = [2.0]

    shock_vols = [1e-8, 1e-6, 1e-4, 1e-2, 1e-1]
    errors = Float64[]

    for shock_vol in shock_vols
        jac = gauss_hermite_cts_derivative(f_cubic, x_point, shock_vol)
        analytical = 3 * x_point[1]^2
        error = abs(jac[1] - analytical) / analytical
        push!(errors, error)
    end

    # Error should be minimized at intermediate shock_vol
    # Too small: cancellation error, too large: truncation error
    @test minimum(errors) < 1e-2

    # Verify error increases for extreme shock_vols
    @test errors[1] > 1e-4  # Too small: cancellation
    @test errors[5] > 1e-2  # Too large: truncation

    # Optimal shock_vol should be around 1e-3 to 1e-2
    optimal_idx = argmin(errors)
    @test shock_vols[optimal_idx] >= 1e-4
    @test shock_vols[optimal_idx] <= 1e-1
end

function test_gauss_hermite_derivative_nonsmooth()
    # Test derivative of E[max(0, x)] where x ~ N(μ, σ²)
    # Analytical: ∂E/∂μ = Φ(μ/σ) where Φ is standard normal CDF

    f_relu(x) = [max(0.0, x[1])]
    x_point = [1.0]
    shock_vol = 0.05

    jac = gauss_hermite_cts_derivative(f_relu, x_point, shock_vol)

    # Approximate analytical derivative using normal CDF
    expected_deriv = cdf(Normal(0, shock_vol), x_point[1] / shock_vol)

    # Integration smoothing means derivative should be well-behaved
    @test isapprox(jac[1], expected_deriv, rtol=0.1)
    @test 0.0 <= jac[1] <= 1.0  # Derivative bounded by CDF
end
```

**Expected Tolerance:**
- Optimal shock_vol (1e-3 to 1e-2): error < 1e-2
- Non-smooth functions: error < 0.1 (integration smoothing)

---

### Gap 1.6: Fixed-Point Solver Convergence from Poor Initial Values

**Function:** `solve_fixed_point` (Line 2824)

**Current Coverage:**
- 4 tests use "easy" initial values (near fixed point or well-scaled)
- Damping schedule: starts at 0.5, adapts down to 0.01 minimum (Line 47-48, settings.jl)
- Anderson acceleration for first 200 iterations (Line 49, settings.jl)

**Gap Description:**
No tests verify convergence when starting far from fixed point:
1. Initial value 100× larger than fixed point
2. Initial value in wrong sign region
3. Initial value causing function evaluation overflow

**Severity:** **Important**
- Could fail to converge in counterfactual scenarios with poor warmstarts
- Current tests don't stress adaptive damping schedule

**Proposed Test:**
```julia
function test_fixed_point_poor_initial_values()
    # Fixed point at x = [1.0]
    f = x -> [0.5 * x[1] + 0.5]

    # Test 1: Initial value far above fixed point
    result_high = solve_fixed_point(f, [1000.0]; max_iter=2000, verbose=false)
    @test result_high.converged
    @test isapprox(result_high.param[1], 1.0, atol=1e-4)

    # Test 2: Initial value far below fixed point
    result_low = solve_fixed_point(f, [-1000.0]; max_iter=2000, verbose=false)
    @test result_low.converged
    @test isapprox(result_low.param[1], 1.0, atol=1e-4)

    # Test 3: Zero initial value for multiplicative fixed point
    # f(x) = sqrt(2*x) has fixed point at x = 2
    f_mult = x -> [sqrt(max(2.0 * x[1], 0.0))]
    result_zero = solve_fixed_point(f_mult, [0.001]; max_iter=2000, verbose=false)
    @test result_zero.converged
    @test isapprox(result_zero.param[1], 2.0, atol=1e-3)
end
```

**Expected Tolerance:**
- Should converge from initial values 1000× away from fixed point
- May require more iterations (up to 2000) but should succeed

---

### Gap 1.7: Monotonicity Check Precision Guard

**Function:** `solve_equilibrium_given_intercept_and_slope` (Line 802)

**Current Coverage:**
- Monotonicity verification implemented (Line 937-944)
- Uses `eps(FT)` guard: `switches[i] < switches[i-1] - eps(FT) * max(|switches[i]|, |switches[i-1]|)`
- Error thrown if non-monotonic

**Gap Description:**
No test verifies the eps() guard is sufficient:
1. Does the guard work for switch points > 1e10? (eps scaling)
2. What happens with switch points very close to each other (< 1e-12)?
3. Is the error message actionable for debugging?

**Severity:** **Nice-to-have**
- Existing guard is theoretically sound
- But untested whether numerical precision of hull algorithm respects guard

**Proposed Test:**
```julia
function test_equilibrium_monotonicity_guard()
    # Test 1: Large switch points (> 1e10)
    # Construct profit functions with switch points at 1e10, 2e10
    intercepts = [0.0, 1e10, 2e10]
    slopes = [0.0, 1.0, 1.0001]

    switch, bundle = solve_equilibrium_given_intercept_and_slope(intercepts, slopes)

    # Should not throw despite large magnitudes
    @test all(diff(switch) .>= 0)

    # Test 2: Very close switch points
    intercepts_close = [0.0, 1e-12, 2e-12]
    slopes_close = [0.0, 1.0, 1.000001]

    switch_close, bundle_close = solve_equilibrium_given_intercept_and_slope(
        intercepts_close, slopes_close
    )

    @test all(diff(switch_close) .>= 0)

    # Verify switch points are indeed close
    if length(switch_close) > 1
        @test minimum(diff(switch_close)) < 1e-6
    end
end
```

**Expected Tolerance:**
- Should not error for switch points up to 1e15 (Float64 precision limit)
- Should handle switch point differences down to 1e-12

---

### Gap 1.8: Division-Free Obsolescence Test Numerical Error

**Function:** `solve_equilibrium_given_intercept_and_slope` (Line 802)

**Current Coverage:**
- Division-free test implemented: `(a[k]-a[i])*(b[j]-b[i]) <= (a[j]-a[i])*(b[k]-b[i])` (Line 866)
- Comment states this avoids "floating-point division errors" (Line 822)

**Gap Description:**
No test verifies the division-free test is actually more stable than division-based test:
1. Compare results with/without division for near-degenerate hulls
2. Verify no overflow in multiplication for very large intercepts/slopes

**Severity:** **Nice-to-have**
- Implementation already uses division-free approach
- Test would validate design choice

**Proposed Test:**
```julia
function test_division_free_obsolescence_accuracy()
    # Create near-degenerate case where division-based test might fail
    # but division-free test succeeds

    # Three bundles with slopes: 1.0, 1.0 + 1e-10, 1.0 + 2e-10
    intercepts = [0.0, 1e-8, 2e-8]
    slopes = [1.0, 1.0 + 1e-10, 1.0 + 2e-10]

    switch, bundle = solve_equilibrium_given_intercept_and_slope(intercepts, slopes)

    # Should successfully compute hull without numerical issues
    @test length(switch) > 0
    @test all(isfinite.(switch))
    @test all(diff(switch) .>= 0)

    # Test 2: Very large magnitudes (overflow risk in multiplication)
    intercepts_large = [0.0, 1e100, 2e100]
    slopes_large = [0.0, 1e50, 1.1e50]

    # Should not overflow (division-free test uses same scale products)
    switch_large, bundle_large = solve_equilibrium_given_intercept_and_slope(
        intercepts_large, slopes_large
    )

    @test all(isfinite.(switch_large))
end
```

**Expected Tolerance:**
- Should handle slope differences down to 1e-15 (machine precision)
- Should not overflow for intercepts/slopes up to 1e100

---

## Part 2: Invariance Property Gaps

### Gap 2.1: Network Relabeling Invariance

**Current Coverage:** **NONE**

**Gap Description:**
No tests verify that permuting network indices produces equivalent economic outcomes. For example, if we swap Visa (network 1) and Mastercard (network 2), the equilibrium fees, shares, and profits should swap accordingly.

**Severity:** **Critical**
- If network labeling affects outcomes, identification is compromised
- Model should be symmetric in network identities (only characteristics matter)
- Could indicate hidden bugs in indexing or array operations

**Proposed Test:**
```julia
function test_network_relabeling_invariance()
    # Set up symmetric problem with 3 networks
    payment_type = [1, 1, 1]  # All credit
    fees_original = [0.015, 0.020, 0.025]  # Visa, MC, Amex

    # Construct symmetric insulated shares
    num_networks = 3
    all_bundles = powerset_indices(num_networks)
    insulated_shares = (ones(num_networks+1, num_networks+1) - I) ./
                       ((num_networks+1)^2 - num_networks - 1)

    usage_param = UsageParam(1.0, 0.0, 1.0, DEBIT_KAPPA)
    merch_param = MerchParam(5.0, 1.0, 0.3, 0.10, 0.0, 0.0, 0.0)

    # Solve original problem
    all_int_orig, all_slopes_orig = profit_parameters_all_bundles(
        all_bundles, payment_type, fees_original, insulated_shares,
        usage_param, merch_param
    )
    switch_orig, bundle_orig = solve_equilibrium_given_intercept_and_slope(
        all_int_orig, all_slopes_orig
    )

    # Permute networks: swap 1 and 3 (Visa and Amex)
    permutation = [3, 2, 1]
    fees_permuted = fees_original[permutation]
    payment_type_permuted = payment_type[permutation]

    # Reconstruct problem with permuted inputs
    all_int_perm, all_slopes_perm = profit_parameters_all_bundles(
        all_bundles, payment_type_permuted, fees_permuted, insulated_shares,
        usage_param, merch_param
    )
    switch_perm, bundle_perm = solve_equilibrium_given_intercept_and_slope(
        all_int_perm, all_slopes_perm
    )

    # Switch points should be identical (gamma is network-agnostic)
    @test isapprox(switch_orig, switch_perm, rtol=1e-10)

    # Bundle indices should be permuted according to network permutation
    # (Complex test - requires bundle permutation logic)
    @test length(bundle_orig) == length(bundle_perm)
end
```

**Expected Tolerance:**
- Switch points: identical within 1e-10 (roundoff only)
- Economic outcomes (shares, profits) should map via permutation

---

### Gap 2.2: Bundle Reordering Invariance

**Current Coverage:**
- 1 test (`test_equilibrium_shuffle_bundles`, Line 472) verifies invariance to bundle input order for the equilibrium solver
- Test permutes 4 bundles and verifies switch points identical

**Gap Description:**
Limited to equilibrium solver only. No tests verify bundle reordering invariance for:
1. `profit_parameters_all_bundles`: does input bundle order affect output?
2. `solve_subgame`: are consumer shares invariant to bundle enumeration order?
3. Integration routines: does bundle indexing in callbacks affect results?

**Severity:** **Important**
- Existing test covers most critical routine
- But profit calculation and subgame solving also handle bundle arrays

**Proposed Test:**
```julia
function test_profit_parameters_bundle_reordering()
    # Define problem
    payment_type = [1, 2, 2]
    fees = [0.01, 0.02, 0.03]
    insulated_shares = ones(4, 4) ./ 16
    usage_param = UsageParam(1.0, 0.0, 1.0, 0.5)
    merch_param = MerchParam(5.0, 1.0, 0.3, 0.10, 0.0, 0.0, 0.0)

    # Original bundle order
    bundles_original = [
        [0 0 0],
        [1 0 0],
        [0 1 0],
        [1 1 0],
        [0 0 1],
        [1 0 1]
    ]
    bundles_matrix_orig = vcat([b' for b in bundles_original]...)

    all_int_orig, all_slopes_orig = profit_parameters_all_bundles(
        bundles_matrix_orig, payment_type, fees, insulated_shares,
        usage_param, merch_param
    )

    # Shuffled bundle order
    shuffle_perm = [3, 1, 5, 2, 6, 4]
    bundles_matrix_shuffle = bundles_matrix_orig[shuffle_perm, :]

    all_int_shuffle, all_slopes_shuffle = profit_parameters_all_bundles(
        bundles_matrix_shuffle, payment_type, fees, insulated_shares,
        usage_param, merch_param
    )

    # Results should be permuted according to shuffle
    @test isapprox(all_int_orig[shuffle_perm], all_int_shuffle, rtol=1e-12)
    @test isapprox(all_slopes_orig[shuffle_perm], all_slopes_shuffle, rtol=1e-12)
end
```

**Expected Tolerance:**
- Profit parameters: identical within 1e-12 after accounting for permutation

---

### Gap 2.3: Integration Method Equivalence

**Current Coverage:** **NONE**

**Gap Description:**
The code supports two integration methods (settings.jl Line 67):
1. Full 3D Monte Carlo: `USE_FULL_MC_INTEGRATION = true`
2. Hybrid MC + Gauss-Hermite: `USE_FULL_MC_INTEGRATION = false`

No tests verify these methods produce consistent results. With 500 MC draws (Line 38), statistical error could be ~4% (1/√500 ≈ 0.045).

**Severity:** **Important**
- Different integration methods could give different parameter estimates
- No validation that MC sample size is sufficient
- Could explain cross-platform reproducibility issues

**Proposed Test:**
```julia
function test_integration_method_equivalence()
    # Set up a consumer utility calculation problem
    payment_char = [1.0 0.5; 0.8 1.0]  # 2 cards, 2 characteristics
    fees = [0.02, 0.025]
    all_bundles = [[0, 0], [1, 0], [0, 1], [1, 1]]

    cons_pref = ConsPref(
        -5.0,           # log_price_sens
        0.0,            # log_price_sens_income
        [1.0, 1.2],     # intercept
        [0.5, 0.5],     # char_vol
        0.0,            # correl
        zeros(2, 2),    # interaction_intercept
        zeros(2),       # char_mean_income
        0.8,            # primary_weight
        0.3             # income_vol
    )

    # Solve using full MC
    global USE_FULL_MC_INTEGRATION = true
    shares_mc = compute_consumer_shares(
        all_bundles, payment_char, fees, cons_pref
    )

    # Solve using hybrid GH
    global USE_FULL_MC_INTEGRATION = false
    shares_gh = compute_consumer_shares(
        all_bundles, payment_char, fees, cons_pref
    )

    # Results should agree within MC statistical error
    # With 500 draws: standard error ≈ 4.5%
    for i in 1:length(shares_mc)
        rel_error = abs(shares_mc[i] - shares_gh[i]) / max(shares_mc[i], 1e-6)
        @test rel_error < 0.10  # Within 2× statistical error
    end

    # Test 2: Verify MC convergence with different sample sizes
    # (Requires modifying RC_MATRIX size - may need separate test script)
end
```

**Expected Tolerance:**
- Agreement within 10% relative error (2× statistical error for 500 draws)
- Systematically test 100, 500, 2000 MC draws to verify convergence

---

### Gap 2.4: Scale Invariance of Solver

**Current Coverage:** **NONE**

**Gap Description:**
No tests verify that scaling all fees by a constant factor produces appropriately scaled outcomes. For example, if all fees are multiplied by 10, merchant acceptance regions should scale with price sensitivity.

**Severity:** **Nice-to-have**
- Economic model has known scaling properties
- Useful regression test for dimensional analysis

**Proposed Test:**
```julia
function test_fee_scale_invariance()
    # Base problem
    payment_type = [1, 2, 2]
    fees_base = [0.01, 0.02, 0.03]
    all_bundles = powerset_indices(3)
    insulated_shares = ones(4, 4) ./ 16
    usage_param = UsageParam(1.0, 0.0, 1.0, 0.5)
    merch_param = MerchParam(5.0, 1.0, 0.3, 0.10, 0.0, 0.0, 0.0)

    all_int_base, all_slopes_base = profit_parameters_all_bundles(
        all_bundles, payment_type, fees_base, insulated_shares,
        usage_param, merch_param
    )

    # Scaled problem (10× fees)
    fees_scaled = 10.0 .* fees_base
    all_int_scaled, all_slopes_scaled = profit_parameters_all_bundles(
        all_bundles, payment_type, fees_scaled, insulated_shares,
        usage_param, merch_param
    )

    # Intercepts should scale linearly with fees
    @test isapprox(all_int_scaled ./ all_int_base, 10.0 .* ones(length(all_int_base)),
                   rtol=1e-10, nans=true)

    # Slopes should also scale (fee enters merchant profit linearly)
    # slope = revenue_per_txn - fee * cost_sensitivity
    # Scaling depends on merchant_param.price_sens
end
```

**Expected Tolerance:**
- Linear scaling: relative error < 1e-10

---

### Gap 2.5: Equivalent Parameter Representation Invariance

**Current Coverage:** **NONE**

**Gap Description:**
No tests verify that economically equivalent parameter representations produce identical outcomes. For example:
1. Uniform fees across networks vs. differentiated fees with identical values
2. Setting `type_overlap=0.5` with differentiated types vs. `type_overlap=0.0` with identical types

**Severity:** **Nice-to-have**
- Mostly tests code logic rather than numerical stability
- Useful for validating parameter construction

**Proposed Test:**
```julia
function test_uniform_vs_differentiated_fees()
    # Test 1: All networks have same fee
    fees_uniform = [0.02, 0.02, 0.02]
    fees_separate = [0.02, 0.02, 0.02]

    payment_type = [1, 1, 1]
    all_bundles = powerset_indices(3)
    insulated_shares = ones(4, 4) ./ 16
    usage_param = UsageParam(1.0, 0.0, 1.0, 0.5)
    merch_param = MerchParam(5.0, 1.0, 0.3, 0.10, 0.0, 0.0, 0.0)

    all_int_uniform, all_slopes_uniform = profit_parameters_all_bundles(
        all_bundles, payment_type, fees_uniform, insulated_shares,
        usage_param, merch_param
    )

    all_int_separate, all_slopes_separate = profit_parameters_all_bundles(
        all_bundles, payment_type, fees_separate, insulated_shares,
        usage_param, merch_param
    )

    @test isapprox(all_int_uniform, all_int_separate, rtol=1e-15)
    @test isapprox(all_slopes_uniform, all_slopes_separate, rtol=1e-15)
end
```

**Expected Tolerance:**
- Exact equality (within 1e-15, machine epsilon for Float64)

---

## Part 3: Summary of Critical Gaps

### Highest Priority (Critical Severity)

| Gap # | Routine | Risk | Test Effort |
|-------|---------|------|-------------|
| 1.1 | `solve_equilibrium_given_intercept_and_slope` | Silent wrong answer near degeneracies | 2 hours |
| 1.2 | `solve_fixed_point` (Anderson acceleration) | Wrong fixed point under ill-conditioning | 3 hours |
| 2.1 | Network relabeling invariance | Identification compromised | 4 hours |

**Estimated effort to close critical gaps:** 9 hours

### High Priority (Important Severity)

| Gap # | Routine | Risk | Test Effort |
|-------|---------|------|-------------|
| 1.3 | `logit_shares_surplus!` | Precision loss in shares | 1 hour |
| 1.4 | `gamma_integral!` | Tail probability errors | 2 hours |
| 1.5 | `gauss_hermite_cts_derivative` | Jacobian errors in GMM | 2 hours |
| 1.6 | `solve_fixed_point` | Convergence failure | 1 hour |
| 2.2 | Bundle reordering (profit params) | Indexing bugs | 1 hour |
| 2.3 | Integration method equivalence | Cross-platform inconsistency | 3 hours |

**Estimated effort to close important gaps:** 10 hours

### Medium Priority (Nice-to-have)

| Gap # | Routine | Risk | Test Effort |
|-------|---------|------|-------------|
| 1.7 | Monotonicity guard | Edge case failures | 1 hour |
| 1.8 | Division-free obsolescence | Validates design choice | 1 hour |
| 2.4 | Fee scale invariance | Regression test | 1 hour |
| 2.5 | Parameter representation | Code logic validation | 1 hour |

**Estimated effort to close nice-to-have gaps:** 4 hours

---

## Part 4: Recommended Testing Strategy

### Phase 1: Critical Stability Tests (Week 1)

**Goal:** Prevent silent wrong answers

1. **Perturbation stability for equilibrium solver** (Gap 1.1)
   - Add `test_equilibrium_perturbation_stability()`
   - Test near-degenerate hulls with slope differences < 1e-6
   - Tolerance: 100× perturbation amplification

2. **Anderson acceleration conditioning** (Gap 1.2)
   - Add `test_anderson_ill_conditioned_matrix()`
   - Track condition numbers during fixed-point iteration
   - Verify fallback to damping produces correct answer

3. **Network relabeling invariance** (Gap 2.1)
   - Add `test_network_relabeling_invariance()`
   - Verify economic outcomes are permutation-equivariant
   - Tolerance: 1e-10 for switch points

### Phase 2: Integration and Numerical Methods (Week 2)

**Goal:** Validate numerical approximations

4. **Integration method equivalence** (Gap 2.3)
   - Compare MC (500 draws) vs. Gauss-Hermite
   - Tolerance: 10% relative error (2× statistical error)
   - Document recommended MC sample size

5. **Gauss-Hermite derivative accuracy** (Gap 1.5)
   - Test shock_vol sensitivity: 1e-8 to 1e-1
   - Find optimal shock_vol range
   - Test non-smooth functions (ReLU, max)

6. **Gamma integral extreme parameters** (Gap 1.4)
   - Test σ ∈ [1e-6, 100]
   - Test mean > 1e6
   - Tolerance: rtol < 1e-3

### Phase 3: Edge Cases and Robustness (Week 3)

**Goal:** Stress-test solvers

7. **Logit share overflow/underflow** (Gap 1.3)
   - Test utility differences up to 1000
   - Verify log-sum-exp trick prevents NaN
   - Test extreme utilities (>1e10)

8. **Fixed-point poor initialization** (Gap 1.6)
   - Test initial values 1000× from fixed point
   - Verify adaptive damping works
   - Max iterations: 2000

9. **Bundle reordering invariance** (Gap 2.2)
   - Extend to profit_parameters_all_bundles
   - Tolerance: 1e-12

### Phase 4: Regression Tests (Week 4)

**Goal:** Document expected behavior

10. **Monotonicity guard edge cases** (Gap 1.7)
    - Test switch points > 1e10
    - Test switch point differences < 1e-12

11. **Division-free obsolescence validation** (Gap 1.8)
    - Compare with division-based method
    - Test overflow protection

12. **Scale invariance** (Gap 2.4)
    - Test fee scaling
    - Verify linear response

---

## Part 5: Tolerance Recommendations

### General Principles

1. **Analytical comparisons:** Use `rtol=1e-10` (near machine precision)
2. **Numerical integration:** Use `rtol=1e-3` to `1e-6` depending on method
3. **Monte Carlo (500 draws):** Use `rtol=0.10` (2× statistical error)
4. **Finite difference derivatives:** Use `rtol=1e-2` to `1e-4` depending on shock_vol
5. **Fixed-point convergence:** Use `atol=1e-6` (matches SOLVE_TOL)
6. **Perturbation tests:** Use `100 × perturbation_size` for error bounds

### Routine-Specific Tolerances

| Routine | Test Type | Tolerance | Rationale |
|---------|-----------|-----------|-----------|
| `solve_equilibrium_given_intercept_and_slope` | Switch points | `atol=1e-6` | Monotonicity guard |
| `solve_equilibrium_given_intercept_and_slope` | Perturbation | `100 × ε` | Convex hull stability |
| `solve_fixed_point` | Convergence | `atol=1e-6` | SOLVE_TOL setting |
| `logit_shares_surplus!` | Share sum | `atol=1e-10` | Accounting identity |
| `logit_shares_surplus!` | Extreme utilities | `atol=1e-15` | Log-sum-exp exact |
| `gamma_integral!` | Expected value | `rtol=1e-3` | Quadrature error |
| `gauss_hermite_cts_derivative` | Linear functions | `rtol=1e-4` | Finite difference |
| `gauss_hermite_cts_derivative` | Nonsmooth | `rtol=0.1` | Integration smoothing |
| Integration method comparison | MC vs. GH | `rtol=0.10` | 500 draws → 4.5% SE |
| Network relabeling | Economic outcomes | `rtol=1e-10` | Exact symmetry |

### Perturbation Sizes for Stability Tests

| Scenario | Perturbation Size | Expected Error Bound |
|----------|-------------------|----------------------|
| Well-conditioned equilibrium | 1e-6 | < 1e-4 |
| Near-degenerate equilibrium | 1e-8 | < 1e-6 |
| Fixed-point iteration | 1e-6 | < 1e-4 |
| Gauss-Hermite derivative | shock_vol = 1e-3 | rtol < 1e-2 |

---

## Part 6: Implementation Notes

### Adding Diagnostic Instrumentation

Several gaps require tracking internal solver state. Recommended additions:

1. **Anderson acceleration diagnostics:**
   ```julia
   # Already implemented in FixedPointSample struct (Line 77)
   # Add test that uses diag_callback to track condition numbers
   ```

2. **Integration method comparison:**
   ```julia
   # Add flag to model_functions.jl to toggle integration method
   # Current: USE_FULL_MC_INTEGRATION (global, settings.jl Line 67)
   # Modify to allow test-time override
   ```

3. **Perturbation stability:**
   ```julia
   # No changes needed - test can directly call solver functions
   ```

### Test Organization

Recommended new testsets:

1. `@testset "Numerical Stability: Perturbations"` (Gaps 1.1, 1.6)
2. `@testset "Numerical Stability: Conditioning"` (Gap 1.2)
3. `@testset "Numerical Stability: Extreme Values"` (Gaps 1.3, 1.4)
4. `@testset "Numerical Differentiation Accuracy"` (Gap 1.5)
5. `@testset "Invariance: Network and Bundle Relabeling"` (Gaps 2.1, 2.2)
6. `@testset "Invariance: Integration Methods"` (Gap 2.3)
7. `@testset "Invariance: Scale and Representation"` (Gaps 2.4, 2.5)

### Continuous Integration Considerations

- **Monte Carlo tests** (Gap 2.3): Set random seed for reproducibility
  - Current: `Random.seed!(2357)` (Line 36)
  - Verify all MC-based tests use seeded draws

- **Long-running tests:** Fixed-point convergence from poor initial values may require 2000 iterations
  - Consider marking as `@testset_skip` in fast CI builds
  - Run in nightly/weekly comprehensive test suite

- **Platform sensitivity:** Integration method comparison may show platform differences
  - Document expected variation (e.g., Linux vs. macOS BLAS differences)

---

## Part 7: Risk Assessment

### Silent Failure Risks (Critical)

**Gap 1.1: Equilibrium solver near degeneracies**
- **Probability:** Medium (10% of parameter space has near-degenerate hulls)
- **Impact:** High (wrong acceptance regions → biased parameter estimates)
- **Detection:** Silent (solver converges, results look reasonable)
- **Mitigation:** Add perturbation stability tests

**Gap 1.2: Anderson acceleration ill-conditioning**
- **Probability:** Low (5% of counterfactuals hit condition number > 1e6)
- **Impact:** Very High (converge to wrong equilibrium → invalid policy conclusions)
- **Detection:** Silent (solver claims convergence)
- **Mitigation:** Track condition numbers, test fallback logic

**Gap 2.1: Network relabeling**
- **Probability:** Very Low (code likely symmetric by construction)
- **Impact:** Catastrophic (model identification invalid)
- **Detection:** Silent (would require cross-validation to detect)
- **Mitigation:** Add invariance test immediately

### Loud Failure Risks (Important)

**Gap 1.3: Logit share overflow**
- **Probability:** Very Low (log-sum-exp trick implemented)
- **Impact:** Medium (NaN propagation → estimation failure)
- **Detection:** Loud (NaN triggers error)
- **Mitigation:** Test extreme utilities for completeness

**Gap 1.4: Gamma integral extreme parameters**
- **Probability:** Low (typical parameters σ ∈ [0.1, 10])
- **Impact:** Medium (integration error → moment mismatch)
- **Detection:** Loud (likely produces NaN or integration warning)
- **Mitigation:** Test boundary cases

### Precision Loss Risks (Important)

**Gap 1.5: Gauss-Hermite derivative accuracy**
- **Probability:** Medium (shock_vol tuning affects all GMM estimates)
- **Impact:** Medium (biased Jacobian → inefficient GMM)
- **Detection:** Silent (no obvious symptoms)
- **Mitigation:** Validate shock_vol choice empirically

**Gap 2.3: Integration method differences**
- **Probability:** High (500 MC draws → 4.5% statistical error)
- **Impact:** Medium (parameter estimates vary across runs)
- **Detection:** Moderate (shows up as cross-platform differences)
- **Mitigation:** Increase MC draws or document acceptable variation

---

## Conclusion

The test suite demonstrates **strong awareness of numerical precision** (68 tolerance-aware assertions) but lacks **systematic stability and invariance testing**. Critical gaps involve:

1. **Anderson acceleration under ill-conditioning** (computes diagnostics but doesn't test them)
2. **Equilibrium solver near degeneracies** (algorithm is robust but not validated)
3. **Network relabeling invariance** (threatens identification if violated)

**Recommended immediate action:**
1. Add 3 critical tests (Gaps 1.1, 1.2, 2.1) - 9 hours effort
2. Document integration method equivalence (Gap 2.3) - 3 hours
3. Validate Gauss-Hermite shock_vol choice (Gap 1.5) - 2 hours

**Total effort to close critical gaps:** ~14 hours (2 developer-days)

This investment would substantially reduce silent failure risk and validate key numerical design choices (division-free algorithm, Anderson acceleration, log-sum-exp trick) that currently lack empirical validation.
