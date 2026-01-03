# Verification Checks

**Project:** Remaining Critical Test Gaps Implementation
**Date:** 2025-12-14
**Status:** Checks designed with confirmed thresholds

---

## Confirmed Thresholds

**Elasticity and Parameter Bounds:**
- ACC-001 elasticity range: σ ∈ [3, 8] (moderate range)
- ECON-001 parameter scope: Rewards + fees + one fixed cost (medium depth)
- Parameter perturbation magnitude: ±25% change

**Numerical Tolerances:**
- Network relabeling invariance tolerance: < 1e-8 (moderate precision)
- Jacobian condition number threshold: < 1e8 (moderate conditioning)
- Anderson acceleration consistency: Within 10 * SOLVE_TOL (strict convergence)
- Multi-homing reward allocation tolerance: Within 1e-6 (SOLVE_TOL precision)

**Test Coverage and Execution:**
- Fixed Point solver depths tested: Three depths (m=0, m=3, m=5)
- Expected full test execution time: < 5 minutes
- Minimum test cases per gap: 2-3 tests per gap
- Verify FOC symmetry for ECON-002: No, just verify FOC ≈ 0

---

## Task 1: Create synthetic test fixtures

### Technical
- [ ] Synthetic test fixtures created with calibrated parameters
- [ ] Network parameters specified: 4 networks (Visa, Mastercard, Amex, Discover)
- [ ] Consumer types defined: 2-3 consumer segments with distinct preferences
- [ ] Merchant types defined: 2-3 merchant categories with varying acceptance costs
- [ ] Fixtures enable isolated testing of specific mechanisms

### Quality
- [ ] Parameters are economically plausible (within σ ∈ [3, 8] for CES elasticities)
- [ ] Test data is deterministic and reproducible
- [ ] Fixtures support both mechanical and economic verification tests

---

## Task 2: Implement ACC-001 (CES Price Index Identity)

### Technical
- [ ] Test verifies: E[log P] ≈ log(σ/(σ-1)) + E[fee] holds within tolerance
- [ ] Test exists in model_unit_tests.jl with clear test name
- [ ] Test computes average log price index across merchants
- [ ] Test computes theoretical prediction using σ from CES model
- [ ] Test verifies absolute tolerance |difference| < 0.01

### Economic Sense
- [ ] Elasticity σ parameter used in identity is within [3, 8] range
- [ ] Price index identity is preserved under fee parameter variations
- [ ] Fee impact on log price is correctly captured

### Test Count
- [ ] At least 2-3 test cases covering different σ values and fee structures

---

## Task 3: Implement ECON-001 (Moment Comparative Statics)

### Technical
- [ ] Test verifies parameter changes produce expected directional moment changes
- [ ] Test uses sign checks only (no magnitude tolerance)
- [ ] Test covers: Rewards + fees + one fixed cost (medium scope)
- [ ] Parameter perturbation magnitude: ±25% change applied to each parameter
- [ ] Test uses synthetic calibrated data

### Economic Sense
- [ ] Increasing rewards increases card usage moments (directional check)
- [ ] Increasing fees reduces acceptance and usage (directional check)
- [ ] Fixed cost changes affect merchant entry/exit moments
- [ ] All sign patterns are consistent with economic theory

### Test Count
- [ ] At least 2-3 test cases covering different parameter combinations

---

## Task 4: Implement ACC-003 (Fixed Point Residual Verification)

### Technical
- [ ] Test verifies ||P(P*) - P*|| < SOLVE_TOL at returned equilibrium
- [ ] Test does NOT rely on convergence flag alone
- [ ] Test computes residual directly from fixed point map
- [ ] Tolerance used: SOLVE_TOL from settings.jl
- [ ] Test validates equilibrium quality (not just convergence declaration)

### Quality
- [ ] Residual verification independent of solver convergence report
- [ ] Results consistent across different equilibrium computation methods

### Test Count
- [ ] At least 2-3 test cases covering different parameter sets

---

## Task 5: Implement ECON-006 (Diversion Ratios & Substitution Patterns)

### Technical
- [ ] Test verifies diversion ratios remain in valid range [0, 1]
- [ ] Test checks substitution patterns show higher diversion to similar cards
- [ ] Similar cards defined by: higher diversion to cards with similar rewards/fees
- [ ] Meaningful difference threshold: ≥10% higher diversion to similar cards
- [ ] Test uses bounds verification + substitution pattern checks

### Economic Sense
- [ ] Diversion ratios respect elasticity bounds
- [ ] Substitution patterns match consumer preference model
- [ ] Higher diversion to reward/fee proximate alternatives (not random)
- [ ] Results consistent with second-choice survey data patterns

### Test Count
- [ ] At least 2-3 test cases covering different network reward/fee configurations

---

## Task 6: Implement STAB-003 (Network Relabeling Invariance)

### Technical
- [ ] Test uses one nontrivial permutation: Visa ↔ Mastercard swap
- [ ] Test verifies results are invariant to network label permutation
- [ ] Tolerance for invariance: < 1e-8 (moderate precision on difference)
- [ ] Test checks that equilibrium outputs match except for permuted labels
- [ ] Single permutation is sufficient to detect indexing bugs

### Quality
- [ ] Results invariant to label ordering (structural, not index-dependent)
- [ ] Demonstrates model is correctly implemented without label bias

### Test Count
- [ ] 1 comprehensive test with Visa↔Mastercard permutation

---

## Task 7: Implement ECON-002 (Envelope Theorem Verification)

### Technical
- [ ] Test verifies FOC ≈ 0 at calibrated equilibrium (analytical verification)
- [ ] Test does NOT verify FOC symmetry (answer: No, just verify FOC ≈ 0)
- [ ] Test checks that ∂π/∂f equals direct effect at optimum
- [ ] FOC entries tested for being approximately zero
- [ ] Tolerance used: SOLVE_TOL from settings.jl
- [ ] Verification is analytical (not numerical optimization)

### Economic Sense
- [ ] At optimal equilibrium, first-order conditions hold
- [ ] Envelope theorem: second-order crossings vanish at optimum
- [ ] Network profit optimization conditions are satisfied

### Test Count
- [ ] At least 2-3 test cases covering different network configurations

---

## Task 8: Implement ACC-002 (Multi-homing Reward Allocation)

### Technical
- [ ] Test verifies primary_use_share weighting is correctly applied
- [ ] Test verifies rewards sum correctly across primary/secondary usage
- [ ] Tolerance: Within 1e-6 (SOLVE_TOL precision)
- [ ] Test checks allocation across consumer multi-homing choices
- [ ] Test validates reward passthrough calculations

### Quality
- [ ] Reward allocation reflects multi-homing behavior correctly
- [ ] No silent errors in weighted reward summation
- [ ] Primary vs secondary usage weights applied correctly

### Test Count
- [ ] At least 2-3 test cases covering different multi-homing scenarios

---

## Task 9: Implement ACC-004 (Jacobian Rank Condition)

### Technical
- [ ] Test computes Jacobian of moments w.r.t. parameters
- [ ] Test verifies Jacobian has full column rank (model identification)
- [ ] Test uses condition number threshold: < 1e8 (moderate conditioning)
- [ ] Test checks rank = number of parameters
- [ ] Test detects weak identification issues

### Quality
- [ ] Model is locally identified (not under-identified)
- [ ] Parameter variation produces independent moment variation
- [ ] Jacobian is well-conditioned (not singular or near-singular)

### Test Count
- [ ] At least 2-3 test cases with different parameter configurations

---

## Task 10: Implement STAB-002 (Anderson Acceleration Conditioning)

### Technical
- [ ] Test evaluates solver with different acceleration depths: m=0, m=3, m=5
- [ ] Test verifies consistent results across depth variations
- [ ] Consistency tolerance: Within 10 * SOLVE_TOL (strict convergence standard)
- [ ] Test detects ill-conditioning from acceleration parameter choice
- [ ] Test uses systematic depth parameter variation

### Quality
- [ ] Solver results robust to Anderson acceleration depth selection
- [ ] No convergence instabilities at different acceleration depths
- [ ] Acceleration mechanism does not degrade solution quality

### Test Count
- [ ] 1 comprehensive test covering all three depths (m=0, m=3, m=5)

---

## Task 11: Run full test suite and document results

### Technical
- [ ] **ALL tests pass (0 failures)** - required for completion
- [ ] Test execution time < 5 minutes (confirmed threshold)
- [ ] model_unit_tests.jl runs without errors
- [ ] Output file test_run_results.md created

### Documentation
- [ ] Total number of tests run reported
- [ ] Tests count verified: at least 2-3 tests per gap across all 10 gaps
- [ ] Any warnings or deprecation notices documented
- [ ] Execution time recorded
- [ ] Each test set clearly identified with pass/fail status

### Success Criteria
- [ ] All 11 prior tasks complete successfully
- [ ] All 10 gap test implementations included
- [ ] Test suite executes in < 5 minutes
- [ ] Total test count: 20-30 tests (at 2-3 per gap, 10 gaps)
- [ ] Zero test failures

---

## Summary of Thresholds by Task

| Task | Threshold Category | Confirmed Value | Source |
|------|-------------------|-----------------|--------|
| 2 (ACC-001) | Elasticity range | σ ∈ [3, 8] | Q1-B |
| 2 (ACC-001) | Tolerance | ±0.01 absolute | Q1-B (from clarifications) |
| 3 (ECON-001) | Parameter scope | Rewards + fees + 1 fixed cost | Q2-B |
| 3 (ECON-001) | Perturbation | ±25% change | Q3-B |
| 5 (ECON-006) | Substitution threshold | ≥10% higher diversion | Q5-B |
| 6 (STAB-003) | Tolerance | < 1e-8 | Q4-C |
| 7 (ECON-002) | FOC symmetry check | No, just verify FOC ≈ 0 | Q12-B |
| 8 (ACC-002) | Tolerance | Within 1e-6 (SOLVE_TOL) | Q8-D |
| 9 (ACC-004) | Condition number | < 1e8 | Q6-B |
| 10 (STAB-002) | Consistency tolerance | Within 10 * SOLVE_TOL | Q7-A |
| 10 (STAB-002) | Solver depths | m=0, m=3, m=5 (three) | Q9-B |
| 11 (Full suite) | Execution time | < 5 minutes | Q10-B |
| All tasks | Test cases per gap | 2-3 tests per gap | Q11-B |

