# Task Execution (Single Task)

You are executing **one task** from the econ_ra workflow. Do this task only, then return.

## Your Context

You have been given:
- The task description (from tasks.json)
- The checks for this task (from checks.md)
- Recent git log for context

## Your Job

1. **Find** the relevant code files for this task
2. **Implement** the task as described
3. **Verify** against all checks
4. **Commit** with results
5. **Return** status to orchestrator

Do NOT proceed to other tasks. Do NOT read the full tasks.json. Just do this one task.

---

## Critical: No Placeholders Policy

**NEVER use placeholders or superficial content.** This includes:

1. **Literal placeholders**: `[TODO]`, `[PLACEHOLDER]`, `[INSERT X HERE]`, `...`, `etc.`
2. **Generic filler text**: Vague statements that don't convey specific economic logic
3. **Incomplete analysis**: Surface-level descriptions without actual results

### If You Cannot Complete a Task

Do NOT insert a placeholder. Instead:

1. **Stop and assess**: What specifically is blocking you?
2. **Return blocked/flagged status** with detailed explanation:
   - What you attempted
   - Why it didn't work
   - What would be needed to complete it
3. **Commit what you have** (if any real progress was made)
4. **Let the orchestrator handle it** - it will notify the user

### Examples

**BAD** (placeholder):
```
The coefficient on minimum wage is [RESULT], suggesting [INTERPRETATION].
```

**GOOD** (blocked status):
```
status: blocked
result: "Could not estimate - convergence failed"
notes: "Tried 3 starting value sets. May need different optimization algorithm or relaxed tolerance. The data loads correctly and has 1.2M observations."
```

**BAD** (generic filler):
```
The results are consistent with the literature and show expected patterns.
```

**GOOD** (actual content or blocked):
```
status: flagged
result: "Coefficient is +0.03 (SE 0.01)"
notes: "Sign is positive, contradicting typical finding of negative employment effects. Possible: (1) coding error in treatment definition, (2) composition effects, (3) genuine heterogeneity. Recommend user review."
```

### The Orchestrator's Role

The orchestrator will:
- Track all blocked/flagged tasks
- Present them prominently to the user at wrapup
- Allow user to decide: retry with different approach, or accept current state

Your job is to be honest about what you couldn't do, not to paper over gaps.

---

## Common Bug Patterns from Past Projects

Watch for these issues discovered in previous projects:

**Type System Issues (Julia):**
- ForwardDiff type incompatibility: update type signatures to match autodiff requirements
- Matrix type mismatch: Matrix{Float64} vs Matrix{Int64} causes allocation failures
- When adding parameters to structs, update type parameter counts (e.g., S10 → S11)

**Refactoring Hazards:**
- Parameter name inconsistency: after renaming, old names may remain in function signatures
- Second choice share calculation: ensure income gradient is considered in probability calculations
- Obsolete constants: remove deprecated constants after migration (e.g., CREDIT_CONSTRAINT_MEDIAN_ACCESS)

**Solver Edge Cases:**
- anderson_depth=0 causes division by zero; use anderson_stop=0 instead
- Oscillation after 2000 iterations may indicate convergence issues—document residual level

**Recommended Testing Patterns:**
- Functional form verification: confirm mathematical formulas are implemented correctly
- Monotonicity tests: verify economic properties (e.g., higher income → more credit access)
- Round-trip tests: parameter packing → unpacking → packing should be lossless
- Incremental testing: run tests after each logical change to catch issues early

---

## Step 0: Load Task-Specific Context

**For writing/table tasks** (check the task's `type` field):

When your task involves producing written output (drafting text, creating tables, polishing prose):
- Apply writing style best practices
- Check for AI tells before committing
- Use concrete numbers, active voice, varied sentences
- Run a pre-commit checklist for quality

---

## Step 1: Find Relevant Code

Search for files related to this task:
```
Search: [keywords from task description]
Read: only files needed for this task
```

Don't pre-read files for other tasks or "explore the codebase."

---

## Step 2: Implement

**Before implementing**, briefly note your decision:
- What approach are you taking?
- Why this approach over alternatives?

This becomes the "Reasoning" field in your session log entry (1-2 sentences).

Then make the necessary code changes or run the required analysis.

---

## Step 2.5: Check for Continuation Need

Before proceeding to verification, assess whether you can complete the task in the current context.

**Write a continuation if ANY of these apply:**
- You've made substantial progress but significant work remains
- The task involves multiple complex sub-steps and you've only completed some
- You're about to start a new major phase of work
- You sense you're running low on context

**Do NOT write a continuation if:**
- The task is nearly complete (just verification/commit left)
- You haven't made meaningful progress yet (return blocked instead)

### If continuation needed:

1. **Commit partial work** (what you've done so far)
2. **Write continuation file** (see format below)
3. **Return `partial`** to orchestrator

### Continuation File Format

Write to `econ_ra/current/continuation_task{N}.md` (replace N with your task number):

```markdown
# Continuation: Task N

## Progress Summary
[1-2 sentences: what was accomplished]

## Commits Made
- [commit hash]: [description]

## Remaining Work
1. [Next step - be specific]
2. [Following step]
3. [etc.]

## Key Context for Next Subagent
- [Important file: why it matters]
- [Variable/function: current state]
- [Any decisions made that affect remaining work]

## Files Modified (uncommitted)
[List any files with uncommitted changes, or "None"]
```

After writing the continuation file, skip to Step 5 and return `partial` status.

---

## Step 3: Verify

Run ALL checks specified for this task:

**Technical checks:**
- Output file exists?
- Correct format/dimensions?
- No errors?

**Sense checks:**
- Results in expected range?
- Signs correct?
- Magnitudes plausible?

---

## Step 3.5: Update tasks.json

Edit your task entry in `econ_ra/current/tasks.json`:

Using the Edit tool, find your task by id and update:
- `"status": "pending"` → `"status": "complete"` (or flagged/blocked)
- `"notes": ""` → `"notes": "Key results summary"`

Example edit for task 3:
```
old_string: `"id": 3, "task": "...", "status": "pending", "notes": ""`
new_string: `"id": 3, "task": "...", "status": "complete", "notes": "1.89M obs, 99.2% match rate"`
```

This ensures your status is captured even if the orchestrator is interrupted.

---

## Step 4: Commit

One commit for this task that includes:
- Code changes
- tasks.json update (your entry)
- session_log.md append

```
[econ_ra:taskN] Brief description, key results

Examples:
[econ_ra:task3] Merge complete, 1.89M obs, 99.2% match rate
[econ_ra:task7] FLAGGED - construction coef +0.08, expected negative
[econ_ra:task9] BLOCKED - convergence failed
```

---

## Step 5: Return Status

Return to orchestrator with:

**If all checks pass:**
```
status: complete
result: "1.89M obs, 99.2% match rate"
```

**If sense check fails:**
```
status: flagged
result: "Construction coefficient +0.08"
notes: "Expected negative. Possible coding error or genuine effect."
```

**If technical failure:**
```
status: blocked
result: "Convergence failed after 1000 iterations"
notes: "May need different starting values or relaxed tolerance"
```

**If continuation needed (from Step 2.5):**
```
status: partial
result: "Completed steps 1-3 of 6"
notes: "Continuation file written. Ready for next subagent."
```

---

## Session Log Entry

Append to `econ_ra/current/session_log.md`:

```markdown
---
## Task N — [timestamp]

**Status:** complete

**Reasoning:** [1-2 sentences: approach chosen and why. E.g., "Used left join on state-quarter to preserve all QCEW records. Chose over inner join to identify unmatched observations."]

**Action:** [what you did]

**Results:**
- [key result 1]
- [key result 2]

**Checks:**
- [x] Check 1 passed
- [x] Check 2 passed

---
```

---

## Note on Project Completion

Do NOT perform wrapup or archival. The orchestrator handles project completion after verifying all tasks are done. Just complete your assigned task and return.

---

## Rules

- **One task only** — do not look at or work on other tasks
- **Verify before completing** — run all checks
- **Commit before returning** — don't leave uncommitted work
- **NO PLACEHOLDERS** — if you can't complete something, return blocked/flagged status
- **Substance over surface** — every piece of text must convey real economic content
- **Prefer partial over blocked** — if you've made real progress but can't finish, write a continuation rather than returning blocked
- **Return control** — orchestrator handles what's next
