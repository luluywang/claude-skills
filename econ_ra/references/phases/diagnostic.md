# Diagnostic Mode — Full Reference

Diagnostic mode is for **iterative problem-solving** when the user has a problem but doesn't know how to fix it. Unlike the standard workflow (which executes a known sequence of tasks), diagnostic mode uses a Try-Ingest-Brainstorm-Select loop.

## When to Use Diagnostic Mode

Use diagnostic mode when the user:
- Has a problem they can't solve (e.g., "my IV is weak", "results don't make sense")
- Needs economically-grounded brainstorming, not just statistical fixes
- Wants iterative exploration with checkpoints

## Invocation

```
/econ_ra diagnose "my IV is weak"           # Start with problem statement
/econ_ra diagnose                           # Start with interview
/econ_ra continue                           # Resume diagnostic loop
```

**Auto-detection:** If bootstrap shows `diagnostic_state.json` exists, the project is in diagnostic mode.

## Architecture

```
[START] → [DIAGNOSTIC_INTERVIEW] → [INITIAL_BRAINSTORM (Opus)]
                                            ↓
                      ┌─────────────────[SELECT]
                      │                     ↓
                      │                [TRY (Haiku)]
                      │                     ↓
                      │              [INGEST (Haiku)]
                      │                     ↓
                      └──────────── [BRAINSTORM (Opus)]
                                            ↓
                              [RESOLVED or MAX_ITER or CHECKPOINT]
                                            ↓
                                        [WRAPUP]
```

## Model Routing for Diagnostic Mode

| Step | Model | Rationale |
|------|-------|-----------|
| Diagnostic interview | **Sonnet** | Domain knowledge for problem scoping |
| Brainstorm (all iterations) | **Opus + extended thinking** | Deep reasoning for hypothesis generation |
| Execute/try | **Haiku** | Cheap execution of well-defined tests |
| Ingest results | **Haiku** | Parse findings into structured format |

## Stopping Conditions

1. **Resolved**: Hypothesis confirmed and problem has a clear fix
2. **Max iterations**: Default 10 (configurable)
3. **User checkpoint**: Every 3 iterations (configurable)
4. **Stagnation**: Two consecutive inconclusive results

## Diagnostic Interview Phase

When the phase is `diagnostic_interview`:

1. **Spawn diagnostic_interview subagent (Sonnet)**

```
Task: [econ_ra:diagnostic:interview] Gather problem context
model: "sonnet"
subagent_type: "Explore"

Instructions:
Read prompts/diagnostic_interview.md for full instructions.

Context:
- Problem statement: [from user invocation, or "none provided"]
- Codebase summary: [current/codebase_summary.md if exists]
- Preferences: references/preferences.md

Your job:
1. Explore the codebase if not already summarized
2. Generate diagnostic interview questions
3. Return codebase summary + questions
```

2. **Present questions to user using AskUserQuestion**

3. **Initialize diagnostic state**

After collecting answers:
```bash
./scripts/diagnostic_loop.sh init "[problem statement]" [max_iterations]
```

This creates `current/diagnostic_state.json` and `current/findings/` directory.

4. **Update status and continue**
```bash
./scripts/status.sh diagnostic_brainstorm
```

## Brainstorm Phase (Opus + Extended Thinking)

When the phase is `diagnostic_brainstorm`:

1. **Check loop status first**
```bash
./scripts/diagnostic_loop.sh status
```

If `should_stop: true` or `needs_checkpoint: true`, handle appropriately (see Stopping & Checkpoints below).

2. **Spawn diagnostic_thinker subagent (Opus)**

```
Task: [econ_ra:diagnostic:brainstorm] Generate hypotheses (iteration N)
model: "opus"
subagent_type: "Plan"

Instructions:
Read prompts/diagnostic_thinker.md for full instructions.

Context:
- Diagnostic state: current/diagnostic_state.json
- Findings from previous iterations: current/findings/
- Interview answers: [from interview phase]

Your job:
1. IF first iteration: Generate 5 initial hypotheses
   ELSE: Read findings, refine hypotheses
2. Rank hypotheses by likelihood
3. Recommend first hypothesis to test
4. Return formatted hypotheses
```

3. **Update diagnostic_state.json with new hypotheses**

Parse the subagent's return and add hypotheses to the state file.

4. **Proceed to selection**
```bash
./scripts/status.sh diagnostic_select
```

## Selection Phase

When the phase is `diagnostic_select`:

**In interactive mode:** Present hypotheses to user using AskUserQuestion:
```json
{
  "header": "Hypothesis",
  "question": "Which hypothesis should we test next?",
  "multiSelect": false,
  "options": [
    {"label": "Hypothesis 1 (Recommended)", "description": "[brief description]"},
    {"label": "Hypothesis 2", "description": "[brief description]"},
    {"label": "Hypothesis 3", "description": "[brief description]"},
    {"label": "Stop here", "description": "End diagnostic loop with current findings"}
  ]
}
```

**In autonomous mode:** Auto-select the recommended hypothesis (first in the thinker's ranking).

After selection:
1. Update `selected_hypothesis` in `diagnostic_state.json`
2. Update status: `./scripts/status.sh diagnostic_try`

## Try Phase (Haiku)

When the phase is `diagnostic_try`:

1. **Spawn diagnostic_executor subagent (Haiku)**

```
Task: [econ_ra:diagnostic:try] Test hypothesis N
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read prompts/diagnostic_executor.md for full instructions.

Context:
- Selected hypothesis: [from diagnostic_state.json]
- Hypothesis details: [name, test steps, confirm/refute criteria]
- Codebase: current/codebase_summary.md

Your job:
1. Execute the test plan exactly as specified
2. Collect evidence
3. Write findings to current/findings/iteration_N_[name].md
4. Update hypothesis status in diagnostic_state.json
5. Return: {status: "tested", result: "confirmed/refuted/inconclusive"}
```

2. **Update status after test**
```bash
./scripts/status.sh diagnostic_brainstorm
./scripts/diagnostic_loop.sh next  # Increment iteration counter
```

This returns to brainstorm phase for the next iteration.

## Stopping & Checkpoints

**Check loop status at the start of each brainstorm phase:**
```bash
./scripts/diagnostic_loop.sh status
```

**If `needs_checkpoint: true`:**
Present checkpoint to user:
```json
{
  "header": "Checkpoint",
  "question": "We've completed N iterations. How should we proceed?",
  "multiSelect": false,
  "options": [
    {"label": "Continue (Recommended)", "description": "Keep testing hypotheses"},
    {"label": "Review findings", "description": "Show me what we've learned so far"},
    {"label": "Stop here", "description": "End diagnostic loop with current findings"}
  ]
}
```

**If `should_stop: true`:**

Check `stop_reason`:
- `max_iterations`: "Reached maximum iterations (10). Proceeding to wrapup."
- `stagnation`: "Two consecutive inconclusive results. May need user guidance."

Update status and proceed to wrapup:
```bash
./scripts/status.sh diagnostic_wrapup
```

**If `resolved: true` (confirmed hypothesis):**
Proceed to wrapup with the solution.

## Diagnostic Wrapup

When the phase is `diagnostic_wrapup`:

1. **Summarize findings**

Read all `current/findings/iteration_*.md` files and `diagnostic_state.json`.

2. **Present summary to user**

```markdown
## Diagnostic Summary

**Problem:** [original problem statement]
**Iterations:** N
**Result:** [Resolved / Unresolved]

### Hypotheses Tested
| # | Hypothesis | Result | Key Finding |
|---|------------|--------|-------------|
| 1 | Weak instrument in services | Confirmed | F-stat drops from 23 to 4 in services |
| 2 | ... | ... | ... |

### Resolution
[If resolved: Describe the fix and why it's economically justified]
[If unresolved: Summarize what was learned and recommend next steps]

### Files Created
- findings/iteration_1_*.md
- findings/iteration_2_*.md
- ...
```

3. **Archive and cleanup**
```bash
./scripts/archive.sh
./scripts/status.sh complete
```

## Diagnostic State File

`current/diagnostic_state.json` structure:
```json
{
  "mode": "diagnostic",
  "problem_statement": "IV is weak, results don't make sense",
  "iteration": 3,
  "max_iterations": 10,
  "checkpoint_interval": 3,
  "hypotheses": [
    {
      "id": 1,
      "name": "Weak instrument in services sector",
      "category": "Identification",
      "economic_rationale": "Service firms adjust hours not headcount...",
      "confirm_criteria": ["First-stage F < 10 for services", "Hours response significant"],
      "refute_criteria": ["F-stat similar across sectors"],
      "test_steps": ["Run first-stage by sector", "Check hours adjustment"],
      "status": "tested",
      "result": "confirmed",
      "evidence": "findings/iteration_1_weak_iv_services.md"
    }
  ],
  "selected_hypothesis": 2,
  "status": "in_progress",
  "created_at": "2025-01-15T10:30:00Z"
}
```

## Example Flow: "My IV is Weak"

**User:** `/econ_ra diagnose "my IV is weak, wrong sign on coefficient"`

**Interview** (Sonnet): Asks about instrument, expected sign, what user tried.

**Brainstorm 1** (Opus): Generates 5 hypotheses:
1. Instrument relevance (Z doesn't affect X for this population)
2. Exclusion violation (Z affects Y directly)
3. Weak instrument bias (small F, biased toward OLS)
4. Treatment heterogeneity (LATE ≠ ATE)
5. Data/coding issue

**Select**: User picks Hypothesis 1 (or auto-selected).

**Try 1** (Haiku): Runs first-stage by subgroup, writes `findings/iteration_1_relevance.md`.

**Brainstorm 2** (Opus): Reads findings. First-stage is 23 for manufacturing, 4 for services. Confirms hypothesis 1 was partially right — instrument is weak in services.

Proposes refinement: restrict sample to manufacturing, or find a better instrument for services.

**Try 2** (Haiku): Restricts to manufacturing, re-runs IV.

**Result**: First-stage F = 23, coefficient now has expected negative sign and reasonable magnitude.

**Wrapup**: "Problem was weak instrument in services sector. Fix: restrict to manufacturing where instrument has bite. This is economically justified because service firms adjust through hours, not headcount."
