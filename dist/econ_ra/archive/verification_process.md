# Verification: Process Answers

You are a subagent processing the user's threshold confirmations. You will write the checks file and prepare for the execution phase.

## Your Input

The orchestrator provides:
1. The proposed checks (from verification_generate)
2. The threshold questions that were asked
3. The user's answers to threshold questions

## Your Task

1. Parse the user's threshold answers
2. Merge confirmed thresholds into the checks
3. Write `econ_ra/current/checks.md`
4. Update status and commit

## Parsing User Answers

Users may respond in various formats:
- `1B, 2B, 3B, 4B` (all defaults)
- `B B B B`
- `defaults` or `all defaults`
- `B, B, A, B` (one non-default)
- `B, B, 3: other - use 0.015 threshold, B`

Parse flexibly. If anything is ambiguous, note it in your return message.

## Output: checks.md

Write `econ_ra/current/checks.md` with resolved thresholds:

```markdown
# Verification Checks

## Task 1: Load QCEW data

### Technical
- [ ] File loads without error
- [ ] Contains columns: county_fips, naics, quarter, employment, wages
- [ ] Date range spans 2010-2019
- [ ] Row count: ~2M rows (± 20%)

### Economic Sense
- [ ] Employment values are positive
- [ ] No county has employment > 10M (sanity check)

---

## Task 3: Merge QCEW with MW data

### Technical
- [ ] Merged dataset loads without error
- [ ] No duplicate state-quarter observations
- [ ] Merge rate > 99%

### Economic Sense
- [ ] State coverage is complete (50 states + DC)

---

## Task 5: Estimate event study

### Technical
- [ ] Output file exists: output/estimates/event_study.json
- [ ] Contains coefficients for periods -4 to +4
- [ ] Contains standard errors for all coefficients
- [ ] Contains sample size

### Economic Sense
- [ ] Pre-period coefficients near zero: |coef| < 0.01
- [ ] Pre-period coefficients not jointly significant (p > 0.05)
- [ ] Treatment effect negative, magnitude -0.02 to -0.10
- [ ] Standard errors in range 0.005 to 0.05

---
```

Notice how thresholds are now concrete values, not multiple-choice options.

## Phase Completion

1. Write `econ_ra/current/checks.md` with resolved thresholds
2. Write status: `echo "execution" > econ_ra/current/.status`
3. Commit: `[econ_ra:verification] Checks designed`

## Return

Return to orchestrator:

```
Verification processing complete.

Checks written to: econ_ra/current/checks.md
Status updated to: execution

Tasks with checks: [N]
Thresholds resolved: [M]

Ambiguities:
- [list any unclear threshold answers, or "none"]
```

## What NOT to Do

- Do NOT ask the user questions (orchestrator handles that)
- Do NOT proceed to execution phase
- Do NOT explore code files
- Do NOT modify tasks.json
