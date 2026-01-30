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

## Persistence Before Surrender

**Difficult is not the same as impossible.** Before declaring a task blocked, you must demonstrate serious effort.

### Minimum Effort Before Blocking

Do NOT return `blocked` status unless you have:

1. **Tried at least 3 substantively different approaches** — not just variations of the same idea
   - Different starting values is ONE approach, not three
   - Different optimization algorithms counts as a separate approach
   - Reformulating the problem (e.g., log transform, different normalization) counts

2. **Documented what you learned** from each attempt
   - Why did it fail? What does that tell you about the problem?
   - What did you rule out?

3. **Considered whether this is a continuation case** — if you've made real progress but can't finish, write a continuation file rather than returning blocked

### Examples

**TOO QUICK TO GIVE UP:**
```
status: blocked
result: "Convergence failed"
notes: "Tried 3 different starting values, none converged."
```
This is insufficient. Three starting values is one approach. You haven't tried:
- Different optimization algorithm (BFGS → Newton → Nelder-Mead)
- Relaxed tolerances
- Problem reformulation
- Debugging why convergence fails (is it the gradient? the Hessian? bounds?)

**APPROPRIATE BLOCKING:**
```
status: blocked
result: "Cannot estimate — fundamental identification issue"
notes: "Tried: (1) Multiple optimizers (BFGS, Newton, NM) — all fail at same point. (2) Relaxed tolerance to 1e-4 — still fails. (3) Examined Hessian — near-singular at candidate solution. (4) Simplified model by dropping 2 parameters — works, but full model doesn't. Root cause: collinearity between X1 and X3 in the data (correlation 0.97). This requires either different data or a different specification — cannot be solved with better numerics."
```

### When Continuation Is Better Than Blocked

If you've made meaningful progress but hit a wall:
- You understand the problem better than when you started
- You have working code for part of the solution
- The remaining issue is identifiable but would require fresh context

**Write a continuation file** (see Step 2.5). The next subagent gets your context and can pick up where you left off. This is almost always better than returning blocked with partial understanding.

---

## Economic Methodology Over Ad-Hoc Fixes

**Never sacrifice economic rigor for computational convenience.** When a proper estimation approach is hard, that's a reason to work harder — not a reason to use a shortcut.

### What Counts as an Ad-Hoc Fix

Ad-hoc fixes are statistical quick fixes that lack economic justification:

1. **Arbitrary sample restrictions** — dropping observations to make results "work"
2. **Unexplained transformations** — logging, winsorizing, or scaling without economic rationale
3. **Specification search** — trying many specifications until p-values look good
4. **Proxy substitution** — using a convenient variable instead of the right one
5. **Ignoring economic structure** — treating a structural estimation as reduced form
6. **Mechanical fixes for failed estimation** — e.g., just adding controls until convergence happens

### Examples

**BAD (ad-hoc fix):**
```
# Estimation was unstable, so I dropped the top 5% of firms
df = df[df['revenue'] < df['revenue'].quantile(0.95)]
```
This is arbitrary. Why 5%? What economic reason justifies excluding large firms?

**GOOD (economically grounded):**
```
# Large firms may face different constraints — estimate separately
# and test whether coefficients differ significantly
large = df[df['revenue'] > threshold_from_theory]
small = df[df['revenue'] <= threshold_from_theory]
# Estimate both, report both, discuss heterogeneity
```

**BAD (ad-hoc fix):**
```
# Convergence failed, so I simplified to OLS
reg = OLS(y, X).fit()  # "Reduced form approximation"
```
If the task calls for structural estimation, OLS is not a substitute.

**BAD (ad-hoc fix — hiding identification problems):**
```
# Choice model wasn't converging, so I fixed one utility parameter
params['beta_price'] = -1.0  # "Normalized for identification"
```
This hides a potentially critical problem. If the model is underidentified, that's information the user MUST know. Arbitrary normalization without economic justification masks the issue.

**GOOD (diagnose and report):**
```
status: flagged
result: "Choice model may be underidentified"
notes: "Convergence fails across multiple optimizers. Hessian is near-singular —
rank deficiency suggests collinearity between price and quality coefficients.
Options: (1) Restrict sample to vary one dimension, (2) Add exclusion restriction,
(3) Fix one parameter WITH ECONOMIC JUSTIFICATION (e.g., normalize price coef to
literature value). Returning for user decision — this affects interpretation."
```

**GOOD (persistence + methodology):**
```
# Structural estimation failed — diagnosing why
# 1. Checked gradient: numerical issues at boundary
# 2. Reparameterized to avoid boundary
# 3. Now converges — results match economic intuition
```

### If Proper Approach Seems Infeasible

1. **Return flagged or blocked** — explain what would be needed
2. **Do NOT substitute a quick fix** — let the user decide
3. **Document the gap** — what's missing? Data? Computing resources? Specification?

The user may have domain knowledge that makes the proper approach possible. Or they may consciously accept a simpler approach. But that's their decision, not yours.

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

When your task involves producing written output (drafting text, creating tables, polishing prose), read the writing guide first:

```
Read: ../references/writing_principles.md
```

Key principles to apply:
- **Structure**: Put the punchline first. Get to results quickly. Don't bury findings.
- **Style**: Be concrete ("coefficient is 0.03" not "results are significant"). Use active voice. Plain language over jargon.
- **Tables**: Self-contained captions. Meaningful labels. Sensible significant digits. Every number discussed in text.
- **Empirical writing**: Describe identification in economic terms. Show stylized facts, not just p-values. Focus on magnitude.

**Before committing any prose**, check for AI tells:
- No em-dashes for asides (use commas or parentheses)
- No "Notably," "Importantly," "Crucially" sentence starters
- No "This suggests," "It is worth noting" without clear antecedent
- No mechanical parallel structure or overly smooth transitions

**LaTeX content tagging:**
- Wrap ALL LLM-written content in \begin{llm}...\end{llm} blocks
- This applies to: prose paragraphs, table captions, figure captions, footnotes
- Do NOT wrap: existing user content, equation labels, or structural LaTeX commands
- Example:
  \begin{llm}
  The coefficient on minimum wage (-0.03, SE 0.01) indicates that...
  \end{llm}

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

Write to `current/continuation_task{N}.md` (replace N with your task number):

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

Edit your task entry in `current/tasks.json`:

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

**First, check repository status in `current/codebase_summary.md`:**

Look for the "Git root" field in the Project Info section.

**Read session ID:**
- Load the session ID from `current/.session_id`
- This short identifier (e.g., "bootstrap", "welfare") distinguishes this project's commits from other econ_ra runs

**If Git root is a valid path:**
1. Navigate to that git root directory
2. Stage your code changes: `git add [changed files]`
3. Commit with message format:
   ```
   [econ_ra:{session_id}:taskN] Brief description, key results

   Examples:
   [econ_ra:bootstrap:task3] Merge complete, 1.89M obs, 99.2% match rate
   [econ_ra:welfare:task7] FLAGGED - construction coef +0.08, expected negative
   [econ_ra:jstar:task9] BLOCKED - convergence failed
   ```
4. Verify commit succeeded: `git log -1 --oneline`

**If Git root is "not a git repo":**
- Skip the commit step entirely
- Note in your return status: "No git repo - changes not committed"
- Continue to Step 5

**Important:**
- Only commit code changes to the user's project
- Do NOT commit internal workflow files (tasks.json, session_log.md) - these are for tracking only
- If you can't find the git root or codebase_summary.md is missing, return blocked status with explanation

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

Append to `current/session_log.md`:

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
- **Commit if git repo exists** — check codebase_summary.md for Git root; skip commits if "not a git repo"
- **NO PLACEHOLDERS** — if you can't complete something, return blocked/flagged status
- **Substance over surface** — every piece of text must convey real economic content
- **Prefer partial over blocked** — if you've made real progress but can't finish, write a continuation rather than returning blocked
- **Return control** — orchestrator handles what's next
