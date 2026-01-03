# Mechanical Test Coverage Gaps Analysis

**Generated:** 2025-12-14
**Purpose:** Identify functions lacking adequate mechanical correctness tests, prioritizing estimation-critical functions and algorithmically complex cases.

**Adequacy Standard:** A function is "adequately tested" if it has tests covering:
1. Happy path (basic correctness)
2. At least 1-2 edge cases relevant to production usage

**Severity Ratings:**
- **CRITICAL**: Could produce silent wrong answers that corrupt estimation
- **IMPORTANT**: Would fail loudly but block estimation
- **NICE-TO-HAVE**: Edge cases unlikely in practice

---

## Executive Summary

**Total Functions Analyzed:** 73+ functions in estimation critical path
**Adequately Tested:** 25 functions (34%)
**Partially Tested:** 12 functions (16%)
**Untested:** 36+ functions (49%)

**Critical Gaps:**
1. Main equilibrium solver (`solve_eqm_foc`, `robust_eqm_solver`) - **NO TESTS**
2. Envelope crossing functions (6 functions) - **NO TESTS**
3. Moment calculation wrappers (2 functions) - **NO TESTS**
4. FOC/SOC moment extractors (2 functions) - **NO TESTS**
5. Parameter construction (`build_param_from_vector`) - **NO TESTS**

---

## PART 1: CRITICAL GAPS (Silent Failure Risk)

These functions could produce plausible but incorrect results that would not be detected during estimation.

---

### 1.1 Switch Point Algorithm Edge Cases

#### GAP-001: `solve_equilibrium_given_intercept_and_slope` - Tie-Breaking with Identical Slopes

**Function:** Lines 802-947
**Current Coverage:** PARTIAL (12 tests, but missing critical edge case)
**Gap Description:** Missing test for **multiple bundles with identical slopes AND intercepts**

**Why Critical:**
- Lines 846-852 implement tie-breaking: "prefer higher index bundles (more cards)"
- If two bundles have identical (slope, intercept), only the one with higher index is kept
- Bug in tie-breaking could cause wrong bundle selection for merchants at specific gamma values
- **Silent failure mode:** Model would converge, moments would look plausible, but merchant acceptance patterns would be systematically wrong

**Existing Tests:**
- `test_equilibrium_tiebreak()` (Line 480): Tests identical slopes with DIFFERENT intercepts
- `test_equilibrium_same_fee_many_network()` (Line 486): Tests identical slopes, different intercepts
- **Missing:** Exact (slope, intercept) duplicates

**Proposed Test:**
```julia
function test_equilibrium_exact_duplicate_bundles()
    # Three bundles: [A, B_dup, C] where B has exact duplicate
    intercepts = [0.5, 1.0, 1.0, 2.0]  # B_dup has same (1.0, 1.5) as B
    slopes     = [0.5, 1.5, 1.5, 2.5]

    switches, bundles = solve_equilibrium_given_intercept_and_slope(
        intercepts, slopes)

    # Should keep bundle 3 (higher index), not bundle 2
    @test 3 in bundles  # Higher index preferred
    @test !(2 in bundles)  # Lower index eliminated
    @test length(bundles) == 3  # Not 4
end
```

**Severity:** CRITICAL
**Rationale:** Tie-breaking bug would systematically bias merchant acceptance toward wrong bundles. In real estimation with ~32 bundles, near-duplicate profit functions are plausible. Silent failure because moments would still be smooth.

---

#### GAP-002: `solve_equilibrium_given_intercept_and_slope` - Numerical Precision at Switch Points

**Function:** Lines 802-947
**Current Coverage:** PARTIAL (no precision boundary tests)
**Gap Description:** No tests for gamma values **very close to switch points** (within floating point epsilon)

**Why Critical:**
- Lines 875-890 handle switch point calculation: `x = (a[k] - a[j]) / (b[k] - b[j])`
- Line 880: `isapprox(x, xstart[end])` tie-breaking for coincident switch points
- Near-exact switch points could trigger wrong branch due to floating point error
- **Silent failure mode:** Merchant at gamma ≈ switch point uses wrong bundle

**Proposed Test:**
```julia
function test_equilibrium_switch_point_precision()
    # Design two bundles with switch point at exactly gamma=1.0
    intercepts = [0.0, 1.0]
    slopes     = [0.5, 1.5]
    # Switch at: (1.0 - 0.0)/(1.5 - 0.5) = 1.0 exactly

    switches, bundles = solve_equilibrium_given_intercept_and_slope(
        intercepts, slopes)

    @test switches[2] ≈ 1.0  # Verify switch point accuracy

    # Now test evaluation just below/above switch point
    # Evaluate quasi-profits at gamma = 1.0 ± eps
    eps_val = 100 * eps(1.0)

    gamma_below = 1.0 - eps_val
    profit_below_1 = -intercepts[1] + slopes[1] * gamma_below
    profit_below_2 = -intercepts[2] + slopes[2] * gamma_below
    @test profit_below_1 >= profit_below_2  # Bundle 1 optimal below

    gamma_above = 1.0 + eps_val
    profit_above_1 = -intercepts[1] + slopes[1] * gamma_above
    profit_above_2 = -intercepts[2] + slopes[2] * gamma_above
    @test profit_above_2 >= profit_above_1  # Bundle 2 optimal above
end
```

**Severity:** CRITICAL
**Rationale:** Merchants exactly at switch points represent identified moments. Wrong bundle choice corrupts identification. Silent because error is localized to small gamma interval.

---

#### GAP-003: `solve_equilibrium_given_intercept_and_slope` - Empty Bundle Set

**Function:** Lines 802-947
**Current Coverage:** PARTIAL (has single bundle test, but not empty)
**Gap Description:** No test for **zero bundles** (all dominated or empty input)

**Why Critical:**
- Line 833: `N == 0 && return Float64[], UInt8[]` early return
- If all bundles are filtered out by domination check, returns empty arrays
- Downstream integration code (Lines 1665-1704 `eqm_price_index`) may not handle empty switch/bundle arrays
- **Silent failure mode:** Integration over empty envelope might return zeros (which look like "no acceptance")

**Proposed Test:**
```julia
function test_equilibrium_empty_bundle_set()
    # All bundles dominated by last one (pathological case)
    intercepts = Float64[]
    slopes = Float64[]

    switches, bundles = solve_equilibrium_given_intercept_and_slope(
        intercepts, slopes)

    @test length(switches) == 0
    @test length(bundles) == 0
    @test switches isa Vector{Float64}
    @test bundles isa Vector{UInt8}
end
```

**Severity:** IMPORTANT
**Rationale:** Would fail loudly in `integrate_bundle_dependent_function!` (line 1506), but good to have explicit test. Not critical because empty bundles shouldn't occur in valid parameter space.

---

#### GAP-004: `find_undominated_indices` - No Undominated Bundles Exist

**Function:** Lines 683-703
**Current Coverage:** PARTIAL (basic test exists, edge case missing)
**Gap Description:** No test for case where **all bundles are dominated** (only one survives)

**Why Critical:**
- Line 702: `return findall(sorted_indices .> 0)` could return single-element array
- If pathological parameters cause all but one bundle to be dominated, algorithm must handle correctly
- Edge case: what if the surviving bundle has index 1 (cash-only)?

**Proposed Test:**
```julia
function test_find_undominated_all_dominated_by_one()
    # Bundle 3 dominates all others (highest slope, lowest intercept)
    sorted_intercepts = [5.0, 4.0, 0.0]  # Bundle 3 has lowest
    sorted_slopes     = [1.0, 2.0, 3.0]  # Bundle 3 has highest
    sorted_indices    = UInt8[1, 2, 3]

    undom_idx = find_undominated_indices(sorted_intercepts, sorted_slopes,
                                         sorted_indices)

    @test length(undom_idx) == 1  # Only bundle 3 survives
    @test sorted_indices[undom_idx[1]] == 3
end
```

**Severity:** IMPORTANT
**Rationale:** Unlikely with reasonable parameters (would mean only one acceptance pattern is ever optimal). But algorithm should handle gracefully.

---

### 1.2 Envelope Crossing Functions (Fixed Cost Identification)

#### GAP-005: `find_envelope_crossing_internal` - No Tests

**Function:** Lines 1119-1143
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for function that finds active bundle at given gamma

**Why Critical:**
- Used in fixed cost moment calculation (envelope crossing identifies fixed costs)
- Lines 1128-1136: Binary search logic to find which segment contains gamma
- Bug here would cause **wrong fixed cost estimates** (parameter identification failure)
- **Silent failure mode:** Returns plausible gamma value, but from wrong segment

**Proposed Test:**
```julia
function test_find_envelope_crossing_basic()
    # Simple envelope: 2 bundles switching at gamma=1.0
    switches = [0.0, 1.0]
    bundles = UInt8[1, 2]
    intercepts = [0.0, 1.0]
    slopes = [0.5, 1.5]

    # Query gamma=0.5 (in first segment)
    result = find_envelope_crossing_internal(switches, bundles,
                                             intercepts, slopes, 0.5)
    @test !isnothing(result)
    a, b, idx = result
    @test idx == 1
    @test a ≈ intercepts[1]
    @test b ≈ slopes[1]

    # Query gamma=2.0 (in second segment)
    result = find_envelope_crossing_internal(switches, bundles,
                                             intercepts, slopes, 2.0)
    a, b, idx = result
    @test idx == 2
    @test a ≈ intercepts[2]
    @test b ≈ slopes[2]
end

function test_find_envelope_crossing_at_boundary()
    # Query exactly at switch point
    switches = [0.0, 1.0]
    bundles = UInt8[1, 2]
    intercepts = [0.0, 1.0]
    slopes = [0.5, 1.5]

    result = find_envelope_crossing_internal(switches, bundles,
                                             intercepts, slopes, 1.0)
    a, b, idx = result
    # At boundary, should return second segment (line 1131: gamma >= switches[i])
    @test idx == 2
end

function test_find_envelope_crossing_empty()
    # Empty envelope
    result = find_envelope_crossing_internal(Float64[], UInt8[],
                                             Float64[], Float64[], 1.0)
    @test isnothing(result)
end
```

**Severity:** CRITICAL
**Rationale:** Directly affects fixed cost parameter identification. Wrong segment selection means wrong fixed cost estimate. Silent failure because moments would still match (wrong model).

---

#### GAP-006: `find_two_envelope_crossing` - No Tests

**Function:** Lines 1145-1198
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for envelope-envelope intersection finder

**Why Critical:**
- Finds gamma where two envelopes (e.g., with/without a card) intersect
- Lines 1176-1193: Nested loop over segments with validity checks
- Used for fixed cost identification moments
- **Silent failure mode:** Returns NaN when crossing exists, or wrong gamma

**Proposed Test:**
```julia
function test_find_two_envelope_crossing_basic()
    # Envelope 1: switches at gamma=1, Envelope 2: switches at gamma=2
    # Design so they cross at gamma=1.5
    switches_F1 = [0.0, 1.0]
    bundles_F1 = UInt8[1, 2]
    intercepts_F1 = [0.0, 1.5]
    slopes_F1 = [0.5, 1.5]

    switches_F2 = [0.0, 2.0]
    bundles_F2 = UInt8[1, 2]
    intercepts_F2 = [0.5, 3.0]
    slopes_F2 = [0.8, 2.0]

    gamma_cross = find_two_envelope_crossing(
        switches_F1, bundles_F1, intercepts_F1, slopes_F1,
        switches_F2, bundles_F2, intercepts_F2, slopes_F2)

    @test !isnan(gamma_cross)
    @test gamma_cross > 0
    # Verify crossing: F1(gamma) ≈ F2(gamma)
    f1_val = -intercepts_F1[2] + slopes_F1[2] * gamma_cross
    f2_val = -intercepts_F2[1] + slopes_F2[1] * gamma_cross
    @test f1_val ≈ f2_val atol=1e-6
end

function test_find_two_envelope_crossing_no_crossing()
    # Parallel envelopes (F1 always above F2)
    switches_F1 = [0.0]
    bundles_F1 = UInt8[1]
    intercepts_F1 = [0.0]
    slopes_F1 = [1.0]

    switches_F2 = [0.0]
    bundles_F2 = UInt8[1]
    intercepts_F2 = [1.0]  # Higher intercept, same slope
    slopes_F2 = [1.0]

    gamma_cross = find_two_envelope_crossing(
        switches_F1, bundles_F1, intercepts_F1, slopes_F1,
        switches_F2, bundles_F2, intercepts_F2, slopes_F2)

    @test isnan(gamma_cross)  # No crossing exists
end
```

**Severity:** CRITICAL
**Rationale:** Core of fixed cost identification strategy. Wrong crossing point = wrong fixed cost. Used in production estimation when NUM_FIXED_COSTS > 0.

---

#### GAP-007: `compute_envelope_for_subset` - No Tests

**Function:** Lines 1091-1117
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for subset envelope computation

**Why Critical:**
- Computes envelope restricted to bundles without a specific card
- Lines 1101-1116: Extracts subset, delegates to main solver, returns
- Used for "what if card X didn't exist" counterfactual in fixed cost moments
- **Silent failure mode:** Wrong subset indexing could corrupt bundle IDs

**Proposed Test:**
```julia
function test_compute_envelope_for_subset_basic()
    # Full bundle set: 4 bundles
    all_intercept = [0.0, 0.5, 1.0, 1.5]
    all_slope = [0.5, 1.0, 1.5, 2.0]

    # Subset: bundles 1 and 3 only
    subset_indices = [1, 3]

    switches, bundle_ids, subset_int, subset_slp =
        compute_envelope_for_subset(all_intercept, all_slope, subset_indices)

    @test length(switches) > 0
    @test length(bundle_ids) == length(switches)
    # bundle_ids should refer to positions in subset (1 or 2)
    @test all(bundle_ids .<= 2)
    @test subset_int == all_intercept[[1, 3]]
    @test subset_slp == all_slope[[1, 3]]
end

function test_compute_envelope_for_subset_empty()
    all_intercept = [0.0, 0.5]
    all_slope = [0.5, 1.0]

    switches, bundle_ids, subset_int, subset_slp =
        compute_envelope_for_subset(all_intercept, all_slope, Int[])

    @test length(switches) == 0
    @test length(bundle_ids) == 0
end
```

**Severity:** CRITICAL
**Rationale:** Used in fixed cost identification. Wrong indexing would corrupt moment calculation. Silent because returns plausible arrays.

---

#### GAP-008: `calculate_first_acceptance_gamma` - No Tests

**Function:** Lines 1012-1044
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for first acceptance threshold finder

**Why Critical:**
- Finds gamma where specific card is FIRST accepted (identification moment)
- Line 1032: Delegates to `solve_equilibrium_given_intercept_and_slope`
- Lines 1036-1041: Walks switch points to find first bundle containing card
- **Silent failure mode:** Returns wrong gamma (e.g., second acceptance instead of first)

**Proposed Test:**
```julia
function test_calculate_first_acceptance_basic()
    # Card 2 first accepted in bundle 2 at gamma=1.0
    all_intercept = [0.0, 1.0, 2.0]
    all_slope = [0.5, 1.5, 2.5]

    # Bundles: [cash, card1, card2]
    potential_bundles = [0 0; 1 0; 0 1]

    gamma_first = calculate_first_acceptance_gamma(
        all_intercept, all_slope, potential_bundles, 2)  # Card 2

    @test gamma_first ≈ 1.0  # Bundle 2 becomes optimal at switch point 1
end

function test_calculate_first_acceptance_never_accepted()
    # Card 2 never optimal (always dominated)
    all_intercept = [0.0, 10.0]  # Bundle with card 2 has huge intercept
    all_slope = [0.5, 0.6]

    potential_bundles = [0 0; 1 0; 0 1]

    gamma_first = calculate_first_acceptance_gamma(
        all_intercept, all_slope, potential_bundles, 2)

    @test isinf(gamma_first)  # Never accepted
end
```

**Severity:** IMPORTANT
**Rationale:** Used in `model_moments_first_credit` (estimation function). Wrong threshold affects moment fit. Less critical than envelope crossing because empirical analogue is less precise.

---

#### GAP-009: `find_line_envelope_crossing` - No Tests

**Function:** Lines 1200-1237
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for line-envelope intersection

**Why Critical:**
- Finds where single profit line crosses envelope
- Lines 1219-1234: Iterates segments, solves for crossing
- Bug would affect fixed cost moments

**Proposed Test:**
```julia
function test_find_line_envelope_crossing_basic()
    # Line: -1.0 + 2.0*gamma crosses envelope at gamma=1.0
    a_line = 1.0
    b_line = 2.0

    # Envelope: single segment from gamma=0 to inf
    switches = [0.0]
    bundles = UInt8[1]
    intercepts = [0.0]
    slopes = [1.0]

    # Crossing: -1.0 + 2.0*gamma = -0.0 + 1.0*gamma => gamma = 1.0
    gamma_cross = find_line_envelope_crossing(
        a_line, b_line, switches, bundles, intercepts, slopes)

    @test gamma_cross ≈ 1.0
end

function test_find_line_envelope_crossing_parallel()
    # Parallel (same slope) - no crossing
    a_line = 1.0
    b_line = 1.0

    switches = [0.0]
    bundles = UInt8[1]
    intercepts = [0.0]
    slopes = [1.0]

    gamma_cross = find_line_envelope_crossing(
        a_line, b_line, switches, bundles, intercepts, slopes)

    @test isinf(gamma_cross)
end
```

**Severity:** IMPORTANT
**Rationale:** Used in fixed cost calculations. Less critical than envelope-envelope crossing.

---

#### GAP-010: `find_zero_crossing_F1` - No Tests

**Function:** Lines 1239-1278
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for zero-crossing finder

**Severity:** IMPORTANT
**Rationale:** Used in fixed cost identification. Needs basic + edge case tests.

---

### 1.3 Fixed-Point Solver Convergence

#### GAP-011: `solve_fixed_point` - Missing Convergence Boundary Tests

**Function:** Lines 2824-3120
**Current Coverage:** PARTIAL (4 basic tests, missing critical edge cases)
**Gap Description:** No tests for **oscillating near-convergence** or **Anderson failure recovery**

**Why Critical:**
- Lines 3036-3042: Anderson fallback when `test_error > 3 * error` (divergence detection)
- Line 3041: `hist_count = 0` resets history - critical for escaping bad trajectory
- **Silent failure mode:** Solver oscillates forever but never triggers max_iter warning
- Used in every model evaluation during estimation (Line 3299 `solve_subgame`)

**Existing Tests:**
- `test_solve_fixed_point_basic()` - Happy path
- `test_solve_fixed_point_sqrt()` - Smooth convergence
- `test_solve_fixed_point_no_convergence()` - Divergence detection
- `test_solve_fixed_point_multidim()` - Multidimensional convergence

**Missing Edge Cases:**
1. Function that oscillates near tolerance (e.g., error cycles 0.001 → 0.0015 → 0.001)
2. Anderson acceleration makes things worse (need fallback)
3. Convergence exactly at max_iter (boundary case)

**Proposed Test:**
```julia
function test_solve_fixed_point_oscillating_near_convergence()
    # Function oscillates with amplitude decaying slowly
    oscillation_phase = Ref(0)

    function oscillating_map(x)
        oscillation_phase[] += 1
        phase = oscillation_phase[]
        # Oscillate around fixed point 0.5 with decaying amplitude
        amplitude = 0.01 / sqrt(phase)
        return [0.5 + amplitude * sin(phase)]
    end

    result = solve_fixed_point(oscillating_map, [0.0];
                               tol=1e-3, max_iter=500)

    # Should eventually converge as amplitude decays
    @test result.converged
    @test result.param[1] ≈ 0.5 atol=2e-3
end

function test_solve_fixed_point_anderson_makes_worse()
    # Pathological case where Anderson acceleration overshoots
    function bad_for_anderson(x)
        # Highly nonlinear map where linear extrapolation fails
        return [tanh(3*x[1])]  # Fixed point at 0, but steep
    end

    result = solve_fixed_point(bad_for_anderson, [0.1];
                               anderson_depth=5, anderson_stop=100)

    # Should fall back to damped iteration and converge
    @test result.converged
    @test result.param[1] ≈ 0.0 atol=1e-4
end

function test_solve_fixed_point_converge_at_max_iter()
    # Design to converge exactly at iteration N
    target_iter = 50
    function converge_at_N(x)
        # Error decreases geometrically
        return [x[1] * 0.95]  # Fixed point at 0
    end

    result = solve_fixed_point(converge_at_N, [1.0];
                               max_iter=target_iter, tol=1e-10)

    # May or may not converge depending on tolerance
    # Test that it doesn't crash at boundary
    @test result.num_iter <= target_iter
end
```

**Severity:** CRITICAL
**Rationale:** Solver is called 100-1000+ times per moment evaluation. Oscillation would cause estimation to hang. Anderson fallback is critical for robustness but untested.

---

#### GAP-012: `solve_fixed_point` - NaN Propagation

**Function:** Lines 2824-3120
**Current Coverage:** UNTESTED (no NaN tests)
**Gap Description:** No test for **NaN detection and diagnostics** (lines 2901-2913)

**Why Critical:**
- Lines 2901-2913: Explicit NaN detection with diagnostic printout
- NaN in iteration would corrupt all subsequent iterations
- **Silent failure mode:** NaN could propagate through model without triggering detection

**Proposed Test:**
```julia
function test_solve_fixed_point_nan_detection()
    # Map that produces NaN after a few iterations
    iter_count = Ref(0)

    function nan_after_three(x)
        iter_count[] += 1
        if iter_count[] > 3
            return [NaN]
        else
            return [0.9 * x[1]]
        end
    end

    # Capture stdout to verify diagnostic printed
    result = solve_fixed_point(nan_after_three, [1.0]; max_iter=10)

    @test !result.converged
    @test any(isnan, result.param)  # Should return NaN state
end
```

**Severity:** IMPORTANT
**Rationale:** Would fail loudly with NaN printout, but good to have explicit test to ensure diagnostic works.

---

### 1.4 Price Index and Normalization

#### GAP-013: `normalize_price_index!` - No Tests

**Function:** Lines 1642-1663
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for price index normalization

**Why Critical:**
- Lines 1647-1662: Sets irrelevant entries to 1.0 to prevent numerical issues in fixed point
- Comment: "Prevents numerical issues in fixed point iteration"
- Wrong normalization could cause **divergence** in `solve_fixed_point`
- **Silent failure mode:** Unnormalized entries cause slow convergence or oscillation

**Proposed Test:**
```julia
function test_normalize_price_index_basic()
    # 3 payment methods + cash
    num_pay = 3
    price_index = rand(num_pay+1, num_pay+1)

    normalize_price_index!(price_index, num_pay)

    # Diagonal (primary=secondary) should be unchanged
    # Off-diagonal with primary=0 or secondary=0 should be 1.0
    @test price_index[1, 1] == 1.0  # Cash-cash
    @test all(price_index[1, 2:end] .== 1.0)  # Cash primary
    @test all(price_index[2:end, 1] .== 1.0)  # Cash secondary
end

function test_normalize_price_index_preserves_relevant()
    num_pay = 2
    price_index = [1.0 1.0 1.0;
                   1.0 0.8 0.9;
                   1.0 0.9 0.7]
    original_22 = price_index[2, 2]
    original_33 = price_index[3, 3]

    normalize_price_index!(price_index, num_pay)

    # Relevant entries should be unchanged
    @test price_index[2, 2] == original_22
    @test price_index[3, 3] == original_33
end
```

**Severity:** IMPORTANT
**Rationale:** Affects fixed-point convergence. Wrong normalization would cause divergence (loud failure), but good to test explicitly.

---

### 1.5 Parameter Construction

#### GAP-014: `build_param_from_vector` - No Tests

**Function:** Line 4667 (referenced), likely ~100 lines
**Current Coverage:** UNTESTED
**Gap Description:** **Zero tests** for parameter unpacking

**Why Critical:**
- Converts parameter vector (length 36-38) into structured objects
- Called at start of every moment evaluation (Line 4670 in `model_moment_from_vector`)
- Wrong unpacking would **corrupt all moments**
- **Silent failure mode:** Parameters go to wrong places (e.g., fee adj → consumer pref)

**Proposed Test:**
```julia
function test_build_param_from_vector_basic()
    # Build a parameter vector with known values
    x = zeros(38)
    x[1] = 0.7  # Primary share
    x[5] = 1.5  # CES sigma
    # ... (fill in all 38 positions)

    usage, merch, cons, ces_util, costs, fee_adj =
        build_param_from_vector(x, ownership, bundles, payment_type, ...)

    # Verify correct unpacking
    @test usage.primary_share ≈ 0.7
    @test cons.ces_sigma ≈ 1.5
    # ... (check all parameters)
end

function test_build_param_from_vector_bounds()
    # Test that parameter bounds are respected
    x = build_init()  # Initial guess

    # All parameters should be within bounds
    lower = build_lower_bound()
    upper = build_upper_bound()

    @test all(x .>= lower)
    @test all(x .<= upper)
end
```

**Severity:** CRITICAL
**Rationale:** Every moment evaluation goes through this. Wrong parameter mapping would corrupt entire estimation. Silent because model would still run.

---

## PART 2: IMPORTANT GAPS (Loud Failure, But Blocks Estimation)

These functions would fail loudly but prevent estimation from running.

---

### 2.1 Moment Calculation Wrappers

#### GAP-015: `model_moment_from_vector` - No Tests

**Function:** Line 4667
**Current Coverage:** UNTESTED
**Severity:** IMPORTANT
**Rationale:** Main entry point for estimation. Integration test needed to verify full pipeline.

**Proposed Test:**
```julia
function test_model_moment_from_vector_runs()
    # Integration test: verify it runs without error
    x = build_init()

    moments, alloc, external = model_moment_from_vector(
        x, ownership, bundles, payment_type, fees, char_mat, cash_cost)

    @test length(moments) > 0
    @test !any(isnan, moments)
    @test !any(isinf, moments)
end
```

---

#### GAP-016: `all_model_moments` - No Tests

**Function:** Line 4464
**Current Coverage:** UNTESTED
**Severity:** IMPORTANT
**Rationale:** Orchestrates all moment calculations. Integration test needed.

---

### 2.2 FOC and SOC Moments

#### GAP-017: `model_network_foc` - No Tests

**Function:** Line 4233
**Current Coverage:** UNTESTED
**Gap Description:** No tests for FOC moment extraction (8 moments)

**Why Important:**
- Extracts 8 FOC moments from Jacobian
- Calls `normalize_foc_by_dollars` (also untested)
- Used in iterations 3-6 of estimation
- Wrong normalization would affect GMM objective

**Proposed Test:**
```julia
function test_model_network_foc_basic()
    # Create simple allocation
    alloc = create_test_allocation()
    ownership = [1, 1, 2, 2, 3]  # 3 firms

    foc_moments = model_network_foc(alloc, ownership)

    @test length(foc_moments) == 8
    @test !any(isnan, foc_moments)
    # FOC should be close to zero at equilibrium
    # (not exactly zero because we're using numerical derivatives)
end
```

**Severity:** IMPORTANT
**Rationale:** Affects GMM objective from iteration 3 onward. Wrong FOC moments would bias parameter estimates.

---

#### GAP-018: `model_network_soc` - No Tests

**Function:** Line 4283
**Current Coverage:** UNTESTED
**Gap Description:** No tests for SOC penalty computation

**Severity:** IMPORTANT
**Rationale:** Used only in iteration 5. Wrong SOC would affect constraint enforcement.

---

### 2.3 Insulated Shares and Rewards

#### GAP-019: `calc_insulated_shares` - No Tests

**Function:** Line 2480
**Current Coverage:** UNTESTED
**Gap Description:** No tests for merchant acceptance share calculation

**Why Important:**
- Adjusts shares for price indices and reward complementarities
- Used in subgame solver (Line 2747)
- Wrong calculation would affect equilibrium

**Severity:** IMPORTANT

---

#### GAP-020: `invert_reward_dollars` - No Tests

**Function:** Line 2649
**Current Coverage:** UNTESTED
**Gap Description:** No tests for CES utility inversion

**Why Important:**
- Inverse of `calc_ces_util_and_rewards`
- Used in subgame to back out reward dollars from utilities
- Wrong inversion would corrupt fixed-point iteration

**Severity:** IMPORTANT

---

### 2.4 Integration Functions

#### GAP-021: `integrate_bundle_dependent_function!` - No Tests

**Function:** Line 1506
**Current Coverage:** UNTESTED
**Gap Description:** No tests for bundle-specific integration

**Why Important:**
- Integrates over merchant type γ with regime switches
- Used for price index and dollar spending calculations
- Wrong integration would corrupt moments

**Severity:** IMPORTANT

---

#### GAP-022: `gamma_integral!` - No Tests

**Function:** Line 1402
**Current Coverage:** UNTESTED (but `test_gamma_expectation` tests related function)
**Severity:** NICE-TO-HAVE (numerical integration tested indirectly)

---

## PART 3: NICE-TO-HAVE GAPS (Edge Cases Unlikely in Practice)

---

### 3.1 Utility Helper Functions

#### GAP-023: `payment_type_to_kappa` - PARTIAL

**Current Coverage:** PARTIAL (has basic test and error test, missing edge case)
**Missing:** Multiple payment types in array

**Severity:** NICE-TO-HAVE

---

### 3.2 Bundle Filtering

#### GAP-024: `bundles_with_visa_credit`, `bundles_without_visa_credit`, `bundles_without_card` - No Tests

**Functions:** Lines 1050-1089
**Current Coverage:** UNTESTED
**Severity:** NICE-TO-HAVE (simple filtering logic)

---

### 3.3 Numerical Derivatives

#### GAP-025: `gauss_hermite_cts_derivative_fast_masked` - No Tests

**Function:** Line 3581
**Current Coverage:** UNTESTED
**Gap Description:** No tests for masked derivatives (capped fees)

**Severity:** NICE-TO-HAVE (used only with fee caps, which are rare)

---

#### GAP-026: `gauss_hermite_diagonal_hessian_fast` - No Tests

**Function:** Line 3539
**Current Coverage:** UNTESTED
**Gap Description:** No tests for diagonal Hessian computation

**Severity:** NICE-TO-HAVE (used only in iteration 5 for SOC)

---

## PART 4: SUMMARY AND PRIORITIZATION

---

### Critical Priority (Must Add - Silent Failure Risk)

**Total:** 11 gaps

1. **GAP-001**: Switch point tie-breaking with exact duplicates
2. **GAP-002**: Switch point numerical precision at boundaries
3. **GAP-005**: `find_envelope_crossing_internal` - zero tests
4. **GAP-006**: `find_two_envelope_crossing` - zero tests
5. **GAP-007**: `compute_envelope_for_subset` - zero tests
6. **GAP-011**: Fixed-point solver oscillation recovery
7. **GAP-014**: `build_param_from_vector` - parameter unpacking

**Rationale:** These could produce wrong answers without triggering errors. Highest risk to estimation validity.

---

### Important Priority (Should Add - Loud Failure)

**Total:** 13 gaps

8. **GAP-003**: Empty bundle set handling
9. **GAP-004**: All bundles dominated edge case
10. **GAP-008**: `calculate_first_acceptance_gamma` - zero tests
11. **GAP-009**: `find_line_envelope_crossing` - zero tests
12. **GAP-010**: `find_zero_crossing_F1` - zero tests
13. **GAP-012**: Fixed-point NaN detection
14. **GAP-013**: `normalize_price_index!` - zero tests
15. **GAP-015**: `model_moment_from_vector` - integration test
16. **GAP-016**: `all_model_moments` - integration test
17. **GAP-017**: `model_network_foc` - FOC moment extraction
18. **GAP-018**: `model_network_soc` - SOC penalty
19. **GAP-019**: `calc_insulated_shares` - zero tests
20. **GAP-020**: `invert_reward_dollars` - zero tests

**Rationale:** Would prevent estimation from running, but failures are detectable.

---

### Nice-to-Have Priority (Low Risk)

**Total:** 6 gaps

21. **GAP-021**: `integrate_bundle_dependent_function!`
22. **GAP-022**: `gamma_integral!`
23. **GAP-023**: `payment_type_to_kappa` edge case
24. **GAP-024**: Bundle filtering functions
25. **GAP-025**: `gauss_hermite_cts_derivative_fast_masked`
26. **GAP-026**: `gauss_hermite_diagonal_hessian_fast`

**Rationale:** Edge cases unlikely in production parameter space, or functions with simple logic.

---

## PART 5: TESTING STRATEGY RECOMMENDATIONS

---

### Immediate Actions (Critical Gaps)

1. **Add switch point algorithm edge case tests** (GAP-001, GAP-002)
   - Exact duplicate bundles
   - Precision at switch points
   - Estimated effort: 2 test functions, ~50 lines

2. **Add envelope crossing test suite** (GAP-005, GAP-006, GAP-007)
   - `find_envelope_crossing_internal`: basic + boundary + empty
   - `find_two_envelope_crossing`: basic + no crossing + multiple crossings
   - `compute_envelope_for_subset`: basic + empty
   - Estimated effort: 3 testsets, ~150 lines

3. **Add fixed-point solver robustness tests** (GAP-011, GAP-012)
   - Oscillating near convergence
   - Anderson fallback
   - NaN detection
   - Estimated effort: 1 testset, ~80 lines

4. **Add parameter construction test** (GAP-014)
   - Basic unpacking
   - Bounds verification
   - Estimated effort: 1 testset, ~60 lines

**Total Immediate Effort:** ~340 lines of test code, ~8-12 hours

---

### Near-Term Actions (Important Gaps)

5. **Add moment calculation integration tests** (GAP-015, GAP-016, GAP-017)
   - End-to-end moment vector generation
   - FOC moment extraction
   - Estimated effort: 2 testsets, ~100 lines

6. **Add subgame helper function tests** (GAP-019, GAP-020)
   - Insulated share calculation
   - Reward dollar inversion
   - Estimated effort: 2 testsets, ~80 lines

7. **Add remaining envelope function tests** (GAP-008, GAP-009, GAP-010)
   - First acceptance gamma
   - Line-envelope crossing
   - Zero crossing
   - Estimated effort: 3 testsets, ~120 lines

**Total Near-Term Effort:** ~300 lines, ~6-8 hours

---

### Long-Term Actions (Nice-to-Have)

8. **Add integration and numerical derivative tests** (GAP-021 through GAP-026)
   - Estimated effort: ~150 lines, ~3-4 hours

---

### Coverage Goal

**Current Coverage:** 34% adequately tested
**After Immediate Actions:** ~55% adequately tested
**After Near-Term Actions:** ~75% adequately tested
**After Long-Term Actions:** ~90% adequately tested

**Remaining Gaps:** Empirical moment functions (DCPC, Nilson, second choice) - not addressed in this analysis (data processing, not algorithmic)

---

## PART 6: APPENDIX - TESTING COMPLEXITY NOTES

---

### Switch Point Algorithm Complexity

The `solve_equilibrium_given_intercept_and_slope` function implements a **monotone chain algorithm** with division-free comparisons (lines 820-822):

```julia
# Obsolescence test (division-free for numerical stability)
@inline function obsolete(i::Int, j::Int, k::Int)
    (a[k] - a[i]) * (b[j] - b[i]) <= (a[j] - a[i]) * (b[k] - b[i])
end
```

**Why Division-Free?**
- Avoids computing intersection points `x = (a[k]-a[i])/(b[k]-b[i])`
- Prevents division-by-zero when slopes are identical
- More numerically stable (no floating-point division errors)

**Test Implication:** Need tests that verify this works correctly when:
1. Slopes are nearly identical (near-division-by-zero)
2. Intercepts are vastly different scales (numerical cancellation)
3. Both intercepts and slopes have same sign (all positive or all negative)

---

### Anderson Acceleration Failure Modes

The `solve_fixed_point` function uses Anderson acceleration with adaptive fallback (lines 2976-3053):

**Failure Mode 1: Ill-conditioned G'G matrix** (line 2996-3004)
- Computes condition number before regularization
- Could fail if all residuals are nearly parallel
- Test needed: residuals that are linearly dependent

**Failure Mode 2: Anderson overshoots** (lines 3036-3042)
- Detects when Anderson step increases error by >3x
- Resets history and falls back to damped iteration
- Test needed: function where linear extrapolation diverges

**Failure Mode 3: Oscillation without convergence** (not tested)
- Error cycles but never exceeds 3x previous error
- Doesn't trigger Anderson fallback, doesn't converge
- Test needed: oscillating function with slow amplitude decay

---

### Fixed Cost Identification Geometry

The envelope crossing functions implement a **geometric identification strategy**:

1. Compute envelope F1 (all bundles)
2. Compute envelope F2 (bundles without card X)
3. Find gamma where F1 crosses F2
4. At crossing: marginal merchant is indifferent between accepting card X or not
5. This gamma identifies the fixed cost of accepting card X

**Critical Edge Cases:**
- F1 and F2 never cross (card X never marginal)
- F1 and F2 cross multiple times (non-monotonic benefits)
- F1 and F2 are identical (fixed cost = 0)
- Crossing occurs at gamma → ∞ (fixed cost = ∞)

All 4 edge cases are **UNTESTED**.

---

**End of Report**
