# Test Implementation Clarifications

**Date:** 2025-12-14
**Interview Status:** Complete
**Next Phase:** Planning

---

## Gap Coverage Decision

**Q1: Which gaps should be implemented?**
**Answer:** A - All critical gaps (ECON-001, ECON-002, ECON-004, ECON-006, ACC-001-004, STAB-002, STAB-003)

**Resolved:** Comprehensive test implementation covering all 7 critical gap categories with sign of economic/accounting theory verification.

---

## Test Organization Decision

**Q2: Where should tests be added?**
**Answer:** A - Extend existing `model_unit_tests.jl`

**Resolved:** All new tests will be appended to the existing test suite in `/gpfs/kellogg/proj/kdb5009/payments/model_unit_tests.jl`, maintaining a single authoritative test file. Tests will be organized into logical sections matching gap categories (Economic, Accounting, Stability).

---

## Economic Verification Decisions

### ECON-001: Moment Comparative Statics

**Q3: What verification level?**
**Answer:** A - Sign checks only (increasing params → expected moment changes)

**Resolved:** Test will verify that:
- Increasing key parameters produces expected directional changes in moments
- Sign patterns are consistent with economic theory
- No tolerance checks on magnitude, only direction verification
- Approach: Calibrated parameter variations with synthetic data

### ECON-002: Envelope Theorem

**Q5: Which approach?**
**Answer:** A - Analytical: verify FOC = 0 at calibrated equilibrium

**Resolved:** Test will verify:
- At estimated equilibrium, FOC entries should equal (approximately) zero
- Envelope theorem: ∂π/∂f equals direct effect at optimum
- Check symmetry of FOC structure for owned networks
- Approach: Analytical verification at known equilibrium point

### ECON-004: Network FOC ≈ 0

**Q9: What tolerance?**
**Answer:** A - SOLVE_TOL from settings.jl

**Resolved:** FOC residuals will be tested against `SOLVE_TOL` constant from `settings.jl`, ensuring consistency with the solver convergence criterion. This maintains alignment with the model's numerical precision standards.

### ECON-006: Diversion Ratios & Substitution

**Q8: Which constraints?**
**Answer:** C - Substitution patterns: higher diversion to cards with similar rewards/fees

**Resolved:** Test will verify:
- Diversion ratios remain in valid range [0, 1] (elasticity bounds)
- Substitution patterns show higher diversion to similar products (reward/fee proximity)
- Economic intuition: consumers substitute to similar alternatives preferentially
- Approach: Analytical bounds verification with substitution pattern checks

---

## Accounting Identity Decisions

### ACC-001: CES Price Index Identity

**Q4: What tolerance?**
**Answer:** A - 0.01 as specified in checks.md

**Resolved:** The identity E[log P] ≈ log(σ/(σ-1)) + E[fee] will be tested with absolute tolerance |difference| < 0.01. This matches the specification in checks.md and reflects acceptable numerical precision for economic identities.

**Implementation:**
```julia
# Compute average log price index across merchants
avg_log_price = mean(log.(price_index))
# Compute theoretical prediction (σ from CES model)
theoretical = log(σ/(σ-1)) + mean(fees)
# Verify tolerance
@test abs(avg_log_price - theoretical) < 0.01
```

### ACC-002, ACC-003, ACC-004

**Resolution:** All four accounting gaps (ACC-001 through ACC-004) will be implemented:
- ACC-002: Multi-homing reward allocation verification
- ACC-003: Subgame fixed point residual below SOLVE_TOL
- ACC-004: Jacobian rank condition (full column rank verification)

---

## Stability & Invariance Decisions

### STAB-002: Anderson Acceleration Conditioning

**Q10: What action?**
**Answer:** C - Test different Anderson acceleration depths, verify consistent results

**Resolved:** Test will:
- Evaluate solver behavior under different Anderson acceleration depth settings
- Verify that results remain consistent (within tolerance) across depth variations
- Detect ill-conditioning issues that could affect numerical stability
- Approach: Systematic testing of acceleration depth parameter with convergence diagnostics

### STAB-003: Network Relabeling Invariance

**Q7: How many permutations?**
**Answer:** A - One nontrivial permutation (e.g., swap Visa/Mastercard)

**Resolved:** Test will verify:
- Results are invariant to permutation of network labels
- Specific test: Swap Visa and Mastercard labels and verify equilibrium output matches (except for permuted labels)
- Single permutation is sufficient to detect indexing bugs
- Approach: Nontrivial permutation test (e.g., Visa↔Mastercard swap)

---

## Test Data Decision

**Q6: What data should tests use?**
**Answer:** B - Simplified synthetic parameters (faster, deterministic)

**Resolved:** All tests will use:
- Synthetic calibrated parameters (not bootstrap samples)
- Deterministic, reproducible test cases
- Simplified parameter sets that isolate specific mechanisms
- Benefits: Fast execution, deterministic results, easier debugging
- Bootstrap/real data testing deferred to integration testing phase

---

## Summary of Resolutions

| Gap | Category | Verification Level | Tolerance/Method | Test Data |
|-----|----------|-------------------|------------------|-----------|
| ECON-001 | Moments | Sign checks | Direction only | Synthetic |
| ECON-002 | Envelope Theorem | Analytical | FOC ≈ 0 at equilibrium | Synthetic |
| ECON-004 | Network FOC | Numerical | SOLVE_TOL | Synthetic |
| ECON-006 | Diversion Ratios | Bounds + patterns | [0,1] + substitution logic | Synthetic |
| ACC-001 | CES Identity | Numerical | ±0.01 | Synthetic |
| ACC-002 | Multi-homing | Allocation | Reward sum correctness | Synthetic |
| ACC-003 | Fixed Point | Residual | < SOLVE_TOL | Synthetic |
| ACC-004 | Jacobian | Rank | Full column rank | Synthetic |
| STAB-002 | Anderson Accel | Depth sweep | Consistent results | Synthetic |
| STAB-003 | Relabeling | Invariance | One nontrivial permutation | Synthetic |

---

## Implementation Notes

1. **Test Location:** All tests extend `model_unit_tests.jl`
2. **Test Data:** Synthetic calibrated parameters for speed and reproducibility
3. **Organization:** Tests grouped by gap category with clear documentation
4. **Execution:** `julia -t 4 model_unit_tests.jl` (as per test configuration)
5. **Scope:** Focused on core economic/accounting/stability verification (not exhaustive edge cases)

---

## Preferences Noted

No new general preferences identified. All decisions are project-specific to this test implementation task.
