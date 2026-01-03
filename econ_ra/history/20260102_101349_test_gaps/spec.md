# Remaining Critical Test Gaps

**Date:** 2025-12-14
**Status:** Tests implemented cover mechanical correctness; economic/accounting theory verification remains incomplete.

---

## Summary

The testing audit identified **24 critical gaps** across all categories. The implementation phase addressed primarily mechanical gaps. The following critical gaps in **economic correctness** and **accounting identity** testing remain unaddressed.

---

## Economic Correctness Gaps

*Reference: `economic_coverage_gaps.md`*

### ECON-001: `all_model_moments` (Critical)
**Location:** `model_functions.jl:4200-4350`
**Current tests:** 0
**Missing:**
- Comparative statics: verify that parameter changes produce expected moment changes
- Consistency: moments should be internally consistent across bootstrap draws
- Sign patterns: certain moments should have predictable signs

**Suggested test approach:** Numerical verification with calibrated parameters (see `economic_coverage_gaps.md` Section 3.1)

### ECON-002: `network_foc_all_entries` (Critical)
**Location:** `model_functions.jl:3800-3900`
**Current tests:** 0 economic tests
**Missing:**
- Envelope theorem verification: ∂π/∂f should equal direct effect at optimum
- Sign patterns: FOC entries should have interpretable signs
- Symmetry: owned networks should have symmetric FOC structure

**Suggested test approach:** Mixed analytical/numerical (see `economic_coverage_gaps.md` Section 3.2)

### ECON-004: `model_network_foc` (Critical)
**Location:** `model_functions.jl:4100-4150`
**Current tests:** 0
**Missing:**
- FOC ≈ 0 at estimated optimum
- Ownership aggregation correctness

**Suggested test approach:** Numerical verification at known equilibrium

### ECON-006: `model_moments_second_choice` (Critical)
**Location:** `model_functions.jl:4050-4100`
**Current tests:** 0
**Missing:**
- Elasticity bounds (diversion ratios ∈ [0,1])
- Sign patterns (substitution to similar products positive)
- Adding-up constraints (diversion ratios sum correctly)

**Suggested test approach:** Analytical bounds verification

---

## Accounting Identity Gaps

*Reference: `accounting_coverage_gaps.md`*

### ACC-001: Price Index CES Identity (Critical)
**Location:** `model_functions.jl:1500-1600` (price index calculation)
**Current tests:** 0
**Missing:**
- E[log P] ≈ log(σ/(σ-1)) + E[fee] should hold approximately
- This is a core CES theory prediction

**Tolerance:** |difference| < 0.01 (per `checks.md`)

**Suggested test:**
```julia
# Compute average log price index across merchants
avg_log_price = mean(log.(price_index))
# Compute theoretical prediction
theoretical = log(σ/(σ-1)) + mean(fees)
# Verify
@test abs(avg_log_price - theoretical) < 0.01
```

### ACC-002: Multi-homing Reward Allocation (Critical)
**Location:** `model_functions.jl:3700-3701`
**Current tests:** Indirect only
**Missing:**
- Verify `primary_use_share` weighting is correctly applied
- Rewards should sum correctly across primary/secondary usage

**Risk:** Silent errors in reward passthrough calculations

### ACC-003: Subgame Fixed Point Residual (Critical)
**Location:** `model_functions.jl:3299-3400`
**Current tests:** Partial (convergence flag checked, residual magnitude not verified)
**Missing:**
- ||P(P*) - P*|| should be below `SOLVE_TOL` at returned equilibrium
- Currently only checks convergence flag, not actual residual

**Suggested test:**
```julia
# After solve_subgame returns:
residual = maximum(abs.(P_function(P_star) .- P_star))
@test residual < SOLVE_TOL
```

### ACC-004: Jacobian Rank Condition (Critical)
**Location:** Used in GMM estimation
**Current tests:** 0
**Missing:**
- Jacobian of moments w.r.t. parameters should have full column rank
- Ensures model is identified

**Risk:** Weak identification undetected

---

## Stability/Invariance Gaps

*Reference: `stability_invariance_gaps.md`*

### STAB-002: Anderson Acceleration Conditioning (Critical)
**Location:** `model_functions.jl:2998-3004`
**Current tests:** 0 (diagnostics computed but never tested)
**Missing:**
- Behavior under ill-conditioned iteration matrix
- Code computes condition numbers but doesn't act on them in tests

### STAB-003: Network Relabeling Invariance (Critical)
**Location:** Throughout equilibrium solver
**Current tests:** 0
**Missing:**
- Results should be invariant to permutation of network labels
- Violations would indicate indexing bugs that threaten identification

---

## Implementation Priority

Based on failure mode analysis (silent wrong answers = critical):

| Priority | Gap | Estimated Lines | Risk if Unfixed |
|----------|-----|-----------------|-----------------|
| 1 | ACC-001 (CES identity) | 40 | Wrong merchant surplus |
| 2 | ECON-001 (moment comparative statics) | 80 | Undetected estimation bugs |
| 3 | ACC-003 (FP residual verification) | 30 | Wrong equilibrium accepted |
| 4 | ECON-006 (second choice bounds) | 50 | Invalid substitution patterns |
| 5 | STAB-003 (network relabeling) | 60 | Identification failure |
| 6 | ECON-002 (envelope theorem) | 80 | FOC Jacobian errors |

**Total estimated:** ~340 lines of test code

---

## References

- `testing_architecture_report.md` - Full architecture analysis
- `economic_coverage_gaps.md` - Detailed economic gap analysis (19 gaps)
- `accounting_coverage_gaps.md` - Detailed accounting gap analysis (17 gaps)
- `stability_invariance_gaps.md` - Stability/invariance analysis (13 gaps)
- `checks.md` - Verification thresholds and tolerances
