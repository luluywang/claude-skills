# Planning & Verification: Process Approval

You are a subagent processing the user's approval of the task list and threshold confirmations. You will write both tasks.json and checks.md, then prepare for execution.

## Your Input

The orchestrator provides:
1. The approved task list (table format from planning_verification_generate)
2. The proposed checks (from planning_verification_generate)
3. The threshold questions that were asked
4. The user's answers to threshold questions (e.g., "B, B, B" or "defaults")
5. Confirmation that user approved the task list

## Your Task

1. Parse the approved task list → write `current/tasks.json`
2. Parse threshold answers → resolve checks → write `current/checks.md`
3. Update status to "execution"
4. Commit both files together

---

## Step 1: Parse Task List → tasks.json

The approved task list comes in table format:

```
| # | Task | Type | Depends On |
|---|------|------|------------|
| 1 | Load QCEW data... | code | - |
| 2 | Load MW data... | code | - |
| 3 | Merge datasets... | code | 1, 2 |
```

Convert to JSON:
- `id` from the `#` column
- `task` from the `Task` column
- `type` from the `Type` column (default to "code" if missing)
- `depends_on` from the `Depends On` column (parse "1, 2" to [1, 2], "-" to [])
- `status` always starts as "pending"
- `notes` always starts as ""

### Output: tasks.json

Write `current/tasks.json`:

```json
{
  "project": "Brief project name",
  "created": "2024-01-15T10:30:00Z",
  "tasks": [
    {
      "id": 1,
      "task": "Load QCEW data from data/raw/qcew.dta, verify structure",
      "type": "code",
      "depends_on": [],
      "status": "pending",
      "notes": ""
    },
    {
      "id": 2,
      "task": "Load minimum wage data from data/raw/state_mw.csv",
      "type": "code",
      "depends_on": [],
      "status": "pending",
      "notes": ""
    },
    {
      "id": 3,
      "task": "Merge QCEW with MW data on state-quarter",
      "type": "code",
      "depends_on": [1, 2],
      "status": "pending",
      "notes": ""
    }
  ]
}
```

---

## Step 2: Parse Threshold Answers → checks.md

### Parsing User Answers

Users may respond in various formats:
- `B, B, B` (answer for each question)
- `1B, 2B, 3B` (numbered)
- `defaults` or `all defaults` (use all recommended options)
- `B, B, 3: other - use 0.015 threshold` (one custom)
- `approved` or `looks good` (implies defaults for thresholds)

Parse flexibly. If anything is ambiguous, note it in your return message.

### Resolving Thresholds

Replace `[THRESHOLD: Q1]` placeholders in checks with the confirmed values.

Example threshold question:
```
**Q1. Acceptable merge rate? (Task 3)**
- [A] > 95%
- [B] > 99% ← typical expectation
- [C] > 99.5%
```

If user answered "B" for Q1, replace:
- `Merge rate > [THRESHOLD: Q1]` → `Merge rate > 99%`

### Output: checks.md

Write `current/checks.md` with resolved thresholds:

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

### Economic Sense
- [ ] Pre-period coefficients near zero: |coef| < 0.01
- [ ] Pre-period coefficients not jointly significant (p > 0.05)
- [ ] Treatment effect negative, magnitude -0.02 to -0.10

---
```

Notice: thresholds are now concrete values, not multiple-choice options or placeholders.

---

## Step 3: Phase Completion

1. Write `current/tasks.json`
2. Write `current/checks.md`
3. Do NOT update status to "execution" — the orchestrator will do this after user confirms "Move to execution"

**Do NOT commit internal workflow files.** Files in `current/` (tasks.json, checks.md, .status, etc.) are internal tracking files and should not be committed. The `.claude/` directory is typically gitignored.

---

## Return

Return to orchestrator:

```
Planning and verification processing complete.

Tasks written to: current/tasks.json
Task count: [N]

Checks written to: current/checks.md
Thresholds resolved: [M]

Status updated to: execution

Ambiguities:
- [list any unclear threshold answers, or "none"]

Ready for execution phase.
```

---

## What NOT to Do

- Do NOT ask the user questions (orchestrator handles that)
- Do NOT proceed to execution phase
- Do NOT explore code files
- Do NOT modify spec.md or full_spec.md
- Do NOT add extra fields to tasks.json (no `execution_context`, `model`, `time_budget`, etc.)
  - Model selection is handled by the orchestrator per the model selection table in SKILL.md
  - Only use the exact schema shown above: project, created, tasks array with id/task/type/depends_on/status/notes
