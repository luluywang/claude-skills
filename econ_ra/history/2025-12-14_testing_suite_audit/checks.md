# Verification Checks

**Confirmed Thresholds:**
- Mechanical test adequacy: happy path + 1-2 edge cases
- Gap severity: by failure mode (critical = silent wrong answers, important = fails loudly, nice-to-have = unlikely edge cases)
- Implementation scope: critical + important gaps
- Economic test tolerance: relative error < 1e-4
- Accounting identity tolerance: absolute error < 1e-6
- Price index identity tolerance: |diff| < 0.01
- Stability perturbation size: 1e-6
- Test failure handling: ALL tests must pass

---

## Task 1: Inventory existing tests

### Technical
- [ ] Output file `test_inventory.md` created
- [ ] Lists all `@testset` blocks from model_unit_tests.jl
- [ ] Lists all exported functions from model_functions.jl
- [ ] Creates mapping: test name → function(s) tested

### Completeness
- [ ] Every `@testset` block is catalogued
- [ ] Every exported function is listed (even if untested)

---

## Task 2: Trace estimation call graph

### Technical
- [ ] Output file `estimation_function_usage.md` created
- [ ] Documents which functions are called from estimate_model_current_eqm_foc.jl
- [ ] Includes both direct calls and nested calls (transitive closure)

### Completeness
- [ ] Call graph covers main estimation entry points
- [ ] Identifies critical path functions (equilibrium solver, moment computation)

---

## Task 3: Classify existing tests

### Technical
- [ ] Output file `test_classification.md` created
- [ ] Every test from inventory is assigned to at least one category
- [ ] Categories used: mechanical, economic, accounting

### Quality
- [ ] Classification rationale is documented
- [ ] Borderline cases are noted with explanation

---

## Task 4: Mechanical coverage gaps

### Technical
- [ ] Output file `mechanical_coverage_gaps.md` created
- [ ] Lists functions with missing/inadequate mechanical tests

### Coverage Focus
- [ ] Switch point algorithm edge cases identified
- [ ] Equilibrium solver boundary conditions assessed
- [ ] Convergence condition tests evaluated

### Adequacy Standard
- Function is "adequately tested" if it has tests covering happy path + 1-2 edge cases

---

## Task 5: Economic coverage gaps

### Technical
- [ ] Output file `economic_coverage_gaps.md` created
- [ ] Lists functions lacking comparative statics tests
- [ ] Lists functions lacking substitution pattern tests
- [ ] Lists functions lacking equilibrium property tests

### Quality
- [ ] High-level test descriptions provided (not full implementations)
- [ ] Analytical vs numerical approach noted for each proposed test

---

## Task 6: Accounting identity gaps

### Technical
- [ ] Output file `accounting_coverage_gaps.md` created
- [ ] Evaluates coverage for each identity type:
  - Market share constraints (sum to 1, non-negative)
  - Profit decomposition
  - Integration consistency
  - Price index identity (log(σ/(σ-1)) + avg fee)
  - Fixed point residuals

### Completeness
- [ ] Additional identities brainstormed beyond the specified ones

---

## Task 7: Stability/invariance gaps

### Technical
- [ ] Output file `stability_invariance_gaps.md` created
- [ ] Numerical stability assessment for key routines
- [ ] Invariance properties identified (bundle reordering, network relabeling)

### Focus Areas
- [ ] Equilibrium solver precision evaluated
- [ ] Integration routines conditioning assessed

---

## Task 8: Indirect coverage documentation

### Technical
- [ ] Output file `indirect_coverage.md` created
- [ ] Lists functions tested only through integration tests
- [ ] Documents the indirect testing chain

### Quality
- [ ] Distinguishes between: directly tested, indirectly tested, untested

---

## Task 9: Architecture report

### Technical
- [ ] Output file `testing_architecture_report.md` created
- [ ] Organized by 3 main categories (mechanical, economic, accounting)
- [ ] Includes numerical stability/invariance as supplementary section

### Content
- [ ] Each function has: name, current coverage, assessment, gaps
- [ ] Severity ratings applied using failure mode criteria:
  - **Critical**: could produce silent wrong answers
  - **Important**: would fail loudly
  - **Nice-to-have**: edge cases unlikely in practice
- [ ] Summary statistics: % functions with adequate coverage per category

---

## Task 10: Implement mechanical tests

### Technical
- [ ] New tests added to model_unit_tests.jl
- [ ] Tests run without errors
- [ ] Tests target critical + important gaps from mechanical_coverage_gaps.md

### Quality
- [ ] Switch point edge cases covered (tie-breaking, degenerate cases)
- [ ] Equilibrium solver boundary conditions tested
- [ ] Tests verify correct output values (not just "runs without error")

---

## Task 11: Implement economic tests

### Technical
- [ ] New tests added to model_unit_tests.jl
- [ ] Tests run without errors
- [ ] Tests use mixed analytical/numerical verification as specified

### Economic Properties Tested
- [ ] At least one comparative static test (parameter change → moment change)
- [ ] At least one substitution pattern test
- [ ] At least one equilibrium property test (FOC or envelope condition)

### Tolerance
- Numerical comparisons use relative error < 1e-4

---

## Task 12: Implement accounting identity tests

### Technical
- [ ] New tests added to model_unit_tests.jl
- [ ] Tests run without errors

### Identities Tested
- [ ] Market shares sum to 1 (within tolerance)
- [ ] Market shares non-negative
- [ ] Profit decomposition: revenue - cost = profit
- [ ] Price index identity approximately holds
- [ ] Fixed point residuals near zero at equilibrium

### Tolerances
- General accounting identities: absolute error < 1e-6
- Price index identity: |diff| < 0.01 (tight tolerance)

---

## Task 13: Implement stability/invariance tests

### Technical
- [ ] New tests added to model_unit_tests.jl
- [ ] Tests run without errors

### Properties Tested
- [ ] Numerical stability: results stable under small perturbations
- [ ] Invariance: results unchanged under bundle reordering
- [ ] Invariance: results unchanged under network relabeling (where applicable)

### Tolerance
- Perturbation size: 1e-6

---

## Task 14: Run full test suite

### Technical
- [ ] **ALL tests pass (0 failures)** - required for completion
- [ ] Output file `test_run_results.md` documents results
- [ ] Test execution completes without timeout

### Documentation
- [ ] Number of tests run reported
- [ ] Any warnings or deprecation notices documented
- [ ] Execution time recorded
