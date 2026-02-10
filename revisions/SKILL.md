---
name: revisions
description: |
  Response-driven manuscript alignment. Reads the user's response document as
  source of truth, extracts claims, audits the manuscript, and fixes gaps via
  a fixer-critic loop. Only activate when user explicitly invokes '/revisions'.
  Do NOT activate for general questions about papers or referee reports.
---

# Revisions Workflow Orchestrator

This orchestrator ensures the manuscript matches what the user promised in their response document to referees. The response document is the **input** (source of truth) — the agent audits the manuscript against it and fixes gaps.

## Invocation

```
/revisions                        # Start new alignment (or resume)
/revisions continue               # Resume interrupted alignment
/revisions reset                  # Clear for new revision
```

## How It Works

1. Detect current phase from `current/` state via `scripts/bootstrap.sh`
2. Collect file paths (response doc, manuscript, appendix, .bib)
3. Extract claims from response doc → `claims.json`
4. Audit claims against manuscript → `audit.json`
5. Fixer-critic loop: fix gaps, re-audit, iterate until clean
6. Present changelog + TODOs to user

```
/revisions → [INIT] → [EXTRACT] → [AUDIT] → [FIX ↔ CRITIC loop] → [REVIEW] → [COMPLETE]
```

The key insight: subagents run autonomously and cannot interact with users. User interaction happens in the orchestrator (main context), kept lightweight by offloading analysis to subagents.

**File-first communication:** Subagents write detailed results to files and return only minimal summaries (status, counts). The orchestrator reads files when it needs details — it never consumes large results from inline returns.

## Progress Tracking

Native Tasks (TaskCreate/TaskUpdate) provide **real-time UX feedback** while `current/.status` tracks the **authoritative workflow state**.

**Phase-level tracking:** At bootstrap, create one native Task per remaining phase. Mark each in_progress at entry and completed at transition.

```
# After bootstrap returns "init":
TaskCreate: "Collect file paths"              activeForm: "Collecting file paths"
TaskCreate: "Extract claims from response"    activeForm: "Extracting claims"
TaskCreate: "Audit claims against manuscript" activeForm: "Auditing claims"
TaskCreate: "Fix manuscript gaps"             activeForm: "Fixing gaps"
TaskCreate: "Review changes"                  activeForm: "Reviewing changes"
```

**Fix-loop tracking:** During the fix phase, create a native Task per iteration:

```
TaskCreate: "Fix iteration 1"    activeForm: "Running fix iteration 1"
TaskCreate: "Critic iteration 1" activeForm: "Running critic iteration 1"
```

**Rules:**
- Native Tasks are a UX layer only — never read them back to determine workflow state
- Always update `.status` or `fix_state.json` first, then update the corresponding native Task

## Orchestrator Rules (Critical)

The orchestrator coordinates — it does NOT do the work itself.

### MANDATORY: Phase Protocol Enforcement

**After bootstrap returns a phase, you MUST follow the exact protocol for that phase.**

- `init` → Collect file paths via AskUserQuestion, write `config.json`
- `extract` → **IMMEDIATELY** spawn extract subagent. Do NOT read the response doc.
- `audit` → **IMMEDIATELY** spawn audit subagent. Do NOT read manuscript files.
- `fix` → Run `fix_loop.sh status`, then spawn fixer/critic subagents
- `review` → Read changelog + todos, present to user
- `complete` → Inform user, offer reset

**NEVER** read the response document or manuscript yourself. Subagents do this.

### The orchestrator CAN:
- Read skill files (SKILL.md, prompts/*)
- Read state files (current/.status, current/config.json, current/claims.json summary, current/audit.json summary, current/fix_state.json, current/changelog.md, current/todos.md)
- Run scripts (bootstrap.sh, status.sh, fix_loop.sh)
- Spawn subagents with appropriate context
- Present questions to users and collect answers
- Update `.status` files

### The orchestrator MUST NOT:
- **Read the response document** — extract subagent does this
- **Read manuscript .tex files** — audit/fixer/critic subagents do this
- **Write claims.json or audit.json** — subagents write these
- **Edit .tex files** — fixer subagent does this
- **Write fix iteration files** — fixer/critic subagents write these
- **Bypass the phase protocol** — even if user's request seems clear, follow the phases

### If you're tempted to read the response doc or manuscript:
STOP. You're probably in extract/audit/fix phase and should spawn the appropriate subagent instead.

## Bootstrap Phase (Always First)

On every invocation, run the bootstrap script to detect the current phase.

### Run bootstrap script

```bash
bash revisions/scripts/bootstrap.sh
```

Returns JSON:
```json
{
  "phase": "init|extract|audit|fix|review|complete",
  "reason": "Brief explanation",
  "directory_created": "yes|no",
  "files": {
    "status": "exists|missing",
    "status_content": "...",
    "config": "exists|missing",
    "claims": "exists|missing",
    "audit": "exists|missing",
    "fix_state": "exists|missing",
    "changelog": "exists|missing",
    "todos": "exists|missing"
  }
}
```

**Phase actions (MANDATORY — follow exactly):**

| Phase | Action | First Step |
|-------|--------|------------|
| `init` | Collect file paths | AskUserQuestion for response doc, manuscript, etc. |
| `extract` | Parse response doc | Spawn extract subagent |
| `audit` | Cross-check claims | Spawn audit subagent |
| `fix` | Fixer-critic loop | Run `fix_loop.sh status`, dispatch accordingly |
| `review` | Present results | Read changelog + todos, display to user |
| `complete` | Done | Inform user, offer reset |

## Context Isolation (Critical)

**Maintain mental separation between phases:**

### Between phases, "forget":
- File contents from subagent work
- Intermediate analysis
- Anything not in the state files

### Each phase starts fresh with ONLY:
- Its specified input files
- State from previous phases (JSON summaries, not raw content)

## Init Phase

When the phase is `init`, gather file paths from the user.

### Required Inputs

Use AskUserQuestion:

1. **Response document** (.tex) — the user's response to referees (source of truth)
2. **Manuscript** (.tex) — main paper file
3. **Appendix files** (.tex) — optional, supplementary material
4. **Bibliography** (.bib) — optional, for citation checking

### Write Config

After collecting inputs, write `current/config.json`:
```json
{
  "response_doc": "path/to/response_round2.tex",
  "manuscript": ["paper.tex"],
  "appendix": ["online_appendix.tex"],
  "bib": ["Bibliography.bib"],
  "created": "ISO timestamp"
}
```

Note: `manuscript`, `appendix`, and `bib` are arrays to support multi-file projects.

Update status:
```bash
bash revisions/scripts/status.sh extract
```

## Extract Phase (Single Sonnet Subagent)

When the phase is `extract`, spawn the extract subagent immediately. Do NOT read the response document.

```
Task: [revisions:extract] Parse response document into claims
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/extract_claims.prompt for full instructions.
Read revisions/prompts/components/response_patterns.prompt for response structure conventions.
Read revisions/prompts/components/claim_taxonomy.prompt for claim type definitions.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.

Context:
- Config: current/config.json (contains response doc path)

Your job:
1. Read the response document
2. Parse all \textbf{Reply:} blocks
3. Extract each claim, classify by taxonomy type
4. Write current/claims.json
5. Return: {status, total_claims, by_type, verifiable, unverifiable}
```

### After Extract Returns

1. Output summary: "Extracted N claims (X verifiable, Y unverifiable)"
2. Update status:
```bash
bash revisions/scripts/status.sh audit
```

## Audit Phase (Single Sonnet Subagent)

When the phase is `audit`, spawn the audit subagent immediately. Do NOT read manuscript files.

```
Task: [revisions:audit] Cross-check claims against manuscript
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/audit_claims.prompt for full instructions.
Read revisions/prompts/components/claim_taxonomy.prompt for verification rules.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.

Context:
- Claims: current/claims.json
- Config: current/config.json (contains manuscript/appendix/bib paths)

Your job:
1. Read claims.json and all manuscript files
2. Verify each claim against the actual manuscript
3. Write current/audit.json with results
4. Write current/todos.md with unverifiable/unfixable items
5. Return: {status, total_claims, found, missing, partial, todo, fixable_issues}
```

### After Audit Returns

1. Output summary: "Audit complete: N found, M missing, P partial, T unverifiable"
2. If `missing + partial == 0`: Skip fix phase, go directly to review
   ```bash
   bash revisions/scripts/status.sh review
   ```
3. Otherwise: Proceed to fix phase
   ```bash
   bash revisions/scripts/status.sh fix
   ```

## Fix Phase (Fixer-Critic Loop)

The fix phase uses an iterative loop: fixer makes edits, critic re-audits, repeat until clean or stopping condition.

```
[AUDIT] → fix_loop.sh init → FIXER(Sonnet) → CRITIC(Sonnet) → check stopping → loop or exit
                                    ↑                │
                                    └── still issues ─┘
```

### Step 1: Initialize Fix Loop

On first entry to fix phase (fix_state.json doesn't exist yet):
```bash
bash revisions/scripts/fix_loop.sh init
```

Returns: `{initialized: true, issues_initial: N, max_iterations: 5}`

### Step 2: Check Loop Status

At the start of each iteration:
```bash
bash revisions/scripts/fix_loop.sh status
```

If `should_stop: true`:
- Present stop reason to user
- Move to review: `bash revisions/scripts/status.sh review`

If `should_stop: false`: continue to fixer.

### Step 3: Spawn Fixer Subagent (Sonnet)

```
Task: [revisions:fix:iter{N}] Fix manuscript gaps (iteration {N})
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/fixer.prompt for full instructions.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.
Read revisions/prompts/components/claim_taxonomy.prompt for claim type context.

Context:
- Claims: current/claims.json
- Issues: current/audit.json (iteration 1) OR current/fix_iterations/iteration_{N-1}_critic.json (later iterations)
- Config: current/config.json
- Iteration: {N}

Your job:
1. Read remaining issues (missing/partial with fixable:true)
2. Make targeted edits to manuscript files
3. Tag all edits with \begin{llm}...\end{llm}
4. Write current/fix_iterations/iteration_{N}_fixes.json
5. Append to current/changelog.md
6. Commit: [revisions:fix:iter{N}] Fix M manuscript gaps
7. Return: {status, iteration, fixed, skipped, escalated}
```

### Step 4: Spawn Critic Subagent (Sonnet)

```
Task: [revisions:critic:iter{N}] Re-audit after fixes (iteration {N})
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/critic.prompt for full instructions.
Read revisions/prompts/components/claim_taxonomy.prompt for verification rules.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.

Context:
- Claims: current/claims.json
- Previous audit: current/audit.json (or prior critic)
- Fixer output: current/fix_iterations/iteration_{N}_fixes.json
- Config: current/config.json
- Iteration: {N}

Your job:
1. Re-read manuscript files (with fixes applied)
2. Re-verify all previously failing claims
3. Spot-check previously passing claims for regressions
4. Check for new problems introduced by fixes
5. Write current/fix_iterations/iteration_{N}_critic.json
6. Return: {status, iteration, resolved, still_missing, partial, regressions, new_issues, issues_remaining}
```

### Step 5: Update Loop State

After critic returns, record the result:
```bash
bash revisions/scripts/fix_loop.sh next {issues_remaining}
```

### Step 6: Check Stopping or Continue

Check the loop status:
```bash
bash revisions/scripts/fix_loop.sh status
```

**Stopping conditions:**
1. `resolved` — `issues_remaining == 0` → proceed to review
2. `max_iterations` — default 5 → proceed to review with remaining issues
3. `stagnation` — 2 consecutive iterations with same count → proceed to review

If stopped:
```bash
bash revisions/scripts/status.sh review
```

If not stopped: loop back to Step 3 (fixer).

### Escalation

If specific claims are structural/complex and unfixed after iteration 2, escalate to Opus:

```
Task: [revisions:fix:iter{N}:escalate] Fix complex gaps (Opus escalation)
model: "opus"
subagent_type: "general-purpose"

[Same instructions as fixer, but only for escalated items]
```

## Review Phase

When the phase is `review`:

1. **Read `current/changelog.md`** and output to user
2. **Read `current/todos.md`** and output to user
3. **Read `current/fix_state.json`** and output summary:
   - Initial issues, final remaining, iterations used
4. **Ask user:**

```json
{
  "header": "Review",
  "question": "Review the changes above. What would you like to do?",
  "multiSelect": false,
  "options": [
    {"label": "Accept and complete (Recommended)", "description": "Mark revision alignment as complete"},
    {"label": "Run another fix iteration", "description": "Try to resolve remaining issues"},
    {"label": "Reset", "description": "Clear everything and start over"}
  ]
}
```

If user accepts:
```bash
bash revisions/scripts/status.sh complete
```

If user wants another iteration:
```bash
bash revisions/scripts/status.sh fix
```
Then re-enter the fix loop.

## Reset (Clear for New Revision)

When the user says "reset", "clear", or "new revision":
1. Check if current/ exists and has content
2. Ask user to confirm
3. Remove current/ contents
4. Confirm ready for new revision

## Model Selection Summary

| Operation | Model | Rationale |
|---|---|---|
| Extract claims | Sonnet | Document parsing, classification |
| Audit claims | Sonnet | Cross-referencing, search |
| Fixer (standard) | Sonnet | Targeted edits, style matching |
| Fixer (escalation) | Opus | Complex structural changes |
| Critic | Sonnet | Independent verification |

## Files

### Directory Structure

```
revisions/
├── SKILL.md                              # This orchestrator
├── scripts/
│   ├── bootstrap.sh                      # Phase detection
│   ├── status.sh                         # Get/set status
│   └── fix_loop.sh                       # Fixer-critic iteration management
├── prompts/
│   ├── extract_claims.prompt             # Parse response doc → claims.json
│   ├── audit_claims.prompt               # Cross-check claims vs manuscript
│   ├── fixer.prompt                      # Make targeted edits to manuscript
│   ├── critic.prompt                     # Re-audit after fixes
│   └── components/
│       ├── claim_taxonomy.prompt         # Claim type definitions + verification rules
│       ├── latex_conventions.prompt       # LaTeX environments reference
│       └── response_patterns.prompt      # Response document style conventions
├── templates/
│   └── response_document.tex             # Reference template
├── examples/                             # Exemplar response docs
└── current/                              # Runtime state (gitignored)
    ├── .status
    ├── config.json                       # File paths
    ├── claims.json                       # Extracted claims from response doc
    ├── audit.json                        # Claim verification results
    ├── fix_state.json                    # Fix loop iteration state
    ├── changelog.md                      # Human-readable edit log
    ├── todos.md                          # Items requiring user action
    └── fix_iterations/                   # Per-iteration results
        ├── iteration_1_fixes.json
        ├── iteration_1_critic.json
        └── ...
```

### State Files Reference

| File | Purpose | Written By |
|---|---|---|
| `current/.status` | Current phase | Orchestrator (via status.sh) |
| `current/config.json` | Input file paths | Orchestrator |
| `current/claims.json` | Extracted claims | Extract subagent |
| `current/audit.json` | Verification results | Audit subagent |
| `current/fix_state.json` | Loop iteration state | fix_loop.sh |
| `current/changelog.md` | Edit log | Fixer subagent (appends) |
| `current/todos.md` | User action items | Audit subagent |
| `current/fix_iterations/iteration_N_fixes.json` | Per-iteration fixes | Fixer subagent |
| `current/fix_iterations/iteration_N_critic.json` | Per-iteration re-audit | Critic subagent |
