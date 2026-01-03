# Verification Phase

You are designing the checks that will verify each task during execution.

## Your Context

Load ONLY:
- `econ_ra/current/tasks.json` - The task list to design checks for
- `econ_ra/current/clarifications.md` - User expectations and thresholds
- `econ_ra/preferences.md` - Default thresholds from past projects

**Do NOT load**: Code files, data files, spec.md (already incorporated into tasks).

## Your Task

Create `econ_ra/current/checks.md` with verification criteria for each task.

## Two Types of Checks

### Technical Checks
Does the code work correctly?
- Output file exists and loads without error
- Expected dimensions (rows, columns)
- No unexpected missing values
- Required variables present
- Calculations are mechanically correct

### Economic Sense Checks
Do the results make sense?
- Signs match economic intuition
- Magnitudes are plausible
- Standard errors are reasonable
- Results are internally consistent
- Patterns match expectations or prior literature

## Flagging Uncertain Thresholds

When you don't know what threshold to use, present **multiple-choice options**:

```markdown
### Economic Sense Checks

- [ ] Price coefficient is negative

- [ ] Price coefficient magnitude is reasonable
      **What range?**
      [A] 0.1 to 1.0 (small)
      [B] 0.5 to 3.0 (moderate) ← typical for this type of model
      [C] 1.0 to 5.0 (large)
      [D] Other: ___

- [ ] Pre-trend coefficients are near zero
      **How close to zero?**
      [A] |coef| < 0.005 (very strict)
      [B] |coef| < 0.01 (standard)  
      [C] |coef| < 0.02 (lenient)
      [D] Other: ___
```

User responds: `B, B` → thresholds confirmed.

## Output Format

```markdown
# Verification Checks

## Task 1: Load QCEW data

### Technical
- [ ] File loads without error
- [ ] Contains columns: county_fips, naics, quarter, employment, wages
- [ ] Date range spans 2010-2019

### Economic Sense
- [ ] Employment values are positive
- [ ] No county has employment > 10M (sanity check)

**Threshold needed:**
1. Expected row count?
   [A] ~1M rows
   [B] ~2M rows
   [C] ~5M rows
   [D] Other: ___

---

## Task 5: Estimate event study

### Technical
- [ ] Output file exists: output/estimates/event_study.json
- [ ] Contains coefficients for periods -4 to +4
- [ ] Contains standard errors for all coefficients
- [ ] Contains sample size

### Economic Sense
- [ ] Pre-period coefficients are not jointly significant (p > 0.05)
- [ ] Treatment effect (average of t=0 to t=4) is negative

**Thresholds needed:**

2. Pre-trend "near zero" means:
   [A] |coef| < 0.005
   [B] |coef| < 0.01 ← standard choice
   [C] |coef| < 0.02
   [D] Other: ___

3. Expected ATT magnitude:
   [A] -0.01 to -0.05 (small)
   [B] -0.02 to -0.10 (moderate) ← based on literature
   [C] -0.05 to -0.20 (large)
   [D] Other: ___

4. Standard error range:
   [A] 0.002 to 0.02
   [B] 0.005 to 0.05 ← typical
   [C] 0.01 to 0.10
   [D] Other: ___
```

User responds: `B, B, B, B` → all thresholds confirmed.

## Using Prior Information

When generating options, pull from:
1. `clarifications.md` - User already specified some expectations
2. `preferences.md` - Defaults from similar past projects
3. Economic intuition - Standard ranges for this type of analysis

**Always put the most likely option first** (marked with ←), so user can quickly confirm defaults.

## Output

1. Create `econ_ra/current/checks.md` with proposed checks
2. Present to user, highlighting all thresholds needing confirmation
3. User confirms or adjusts thresholds
4. Update checks.md with confirmed values
5. Commit: `[econ_ra:verification] Checks designed`
6. Report ready for execution phase

---

## Phase Completion

After user confirms thresholds:

1. ✅ Write `econ_ra/current/checks.md` with confirmed thresholds
2. ✅ Write status file: `echo "execution" > econ_ra/current/.status`
3. ✅ Commit: `[econ_ra:verification] Checks designed`
4. ✅ **MENTAL RESET**: Forget clarifications, threshold reasoning. Clear working memory.
5. ✅ Continue to Execution phase (read `econ_ra/prompts/execution.md`)

**Context isolation**: Before starting execution, only carry forward: tasks.json, checks.md. This is when you finally get to explore code—with maximum context available.
