---
name: revisions
description: Response-driven manuscript alignment. Reads the user's response document as source of truth, extracts claims, audits the manuscript, and fixes gaps via a fixer-critic loop. Only activate when user explicitly invokes '/revisions'. Do NOT activate for general questions about papers or referee reports.
---

# Revisions Workflow Orchestrator

This orchestrator ensures the manuscript matches what the user promised in their response document to referees. The response document is the **input** (source of truth) — the agent audits the manuscript against it and fixes gaps.

## Invocation

```
/revisions                        # Start new alignment (or resume)
/revisions continue               # Resume interrupted alignment
/revisions reset                  # Clear for new revision
/revisions strategy-only          # Run through STRATEGY phase only, then stop
/revisions sync-tables [table_file] [manuscript]  # Reconcile updated tables with manuscript text
/revisions scaffold [editor_letter] [ref1] [ref2] ...  # Build response doc scaffold from raw reports
/revisions grade <theme> [files...]  # Grade all responses on a thematic point
/revisions fix-theme <theme> [instructions...]  # Targeted cross-cutting edit on one theme
```

## Standalone Modes (Progressive Disclosure)

Each standalone mode has its own reference file with full inputs, phase protocol, and Task spawn block. When the user invokes one, read the matching file before doing anything else:

| Invocation | Trigger | One-line summary | Reference |
|---|---|---|---|
| `/revisions grade <theme>` | Argument starts with `grade` | Grade all responses on a thematic point (A-F across 5 dimensions). | `references/modes/grade.md` |
| `/revisions fix-theme <theme>` | Argument starts with `fix-theme` | Targeted cross-cutting edit on one theme across manuscript + response doc. | `references/modes/fix-theme.md` |
| `/revisions sync-tables [tables] [ms]` | Bootstrap returns `table_sync` | Reconcile updated tables with manuscript text (numerical conflicts). | `references/modes/table_sync.md` |
| `/revisions scaffold [editor] [ref1]…` | Argument is `scaffold` | Build response doc scaffold from raw referee/editor reports. | `references/modes/scaffold.md` |
| `/revisions strategy-only` | Argument is `strategy-only` | Run the pipeline through STRATEGY phase only, then stop. | `references/modes/strategy-only.md` |

When a standalone mode runs, it does NOT advance the main pipeline `.status` (except `strategy-only`, which uses the standard phase scripts and stops at the strategy boundary).

---

## How It Works (Main Pipeline)

1. Detect current phase from `current/` state via `scripts/bootstrap.sh`
2. Collect file paths (response doc, manuscript, appendix, .bib, referee reports)
3. Extract claims from response doc → `claims.json`
4. Profile referees → `souls/{key}_soul.md` + `referee_profiles.json`
5. **Strategy memo** → `current/strategy_memo.md` (high-level response narrative)
6. Audit claims against manuscript → `audit.json`
7. Fixer-critic loop: fix gaps, re-audit, iterate until clean
8. Present changelog + TODOs to user

```
/revisions → [INIT] → [EXTRACT] → [PROFILE] → [STRATEGY] → [AUDIT] → [FIX ↔ CRITIC loop] → [REVIEW] → [COMPLETE]
```

The key insight: subagents run autonomously and cannot interact with users. User interaction happens in the orchestrator (main context), kept lightweight by offloading analysis to subagents.

**File-first communication:** Subagents write detailed results to files and return only minimal summaries (status, counts). The orchestrator reads files when it needs details — it never consumes large results from inline returns.

## Progress Tracking

Progress is communicated via **text output** at phase transitions. The authoritative workflow state lives in `current/.status` (managed by `status.sh`).

At each phase transition, output a brief status line:
- Phase entry: `--- [PHASE] Spawning subagent...`
- Phase exit: `--- [PHASE] Done: <summary>`

Do NOT use TaskCreate or TaskUpdate — these tools consume context tokens on every call.

## Orchestrator Rules (Critical)

The orchestrator coordinates — it does NOT do the work itself.

### MANDATORY: Phase Protocol Enforcement

**After bootstrap returns a phase, you MUST follow the exact protocol for that phase.**

- `init` → Collect file paths via AskUserQuestion, write `config.json`
- `extract` → **IMMEDIATELY** spawn extract subagent. Do NOT read the response doc.
- `profile` → **IMMEDIATELY** spawn profile subagent. Do NOT read referee reports yourself.
- `strategy` → **IMMEDIATELY** spawn strategy subagent. Do NOT read claims or profiles yourself.
- `audit` → **IMMEDIATELY** spawn audit subagent. Do NOT read manuscript files.
- `fix` → Run `fix_loop.sh status`, then spawn fixer/critic subagents
- `review` → Read changelog + todos, present to user
- `complete` → Inform user, offer reset

**NEVER** read the response document or manuscript yourself. Subagents do this.

### The orchestrator CAN:
- Read skill files (SKILL.md, prompts/*, references/*)
- Read state files (current/.status, current/config.json, current/claims.json summary, current/referee_profiles.json summary, current/strategy_memo.md, current/audit.json summary, current/fix_state.json, current/changelog.md, current/todos.md)
- Run scripts (bootstrap.sh, status.sh, fix_loop.sh)
- Spawn subagents with appropriate context
- Present questions to users and collect answers
- Update `.status` files

### The orchestrator MUST NOT:
- **Read the response document** — extract/profile subagents do this
- **Read referee reports** — profile subagent does this
- **Read manuscript .tex files** — audit/fixer/critic subagents do this
- **Write claims.json, referee_profiles.json, soul documents, strategy_memo.md, or audit.json** — subagents write these
- **Edit .tex files** — fixer subagent does this
- **Write fix iteration files** — fixer/critic subagents write these
- **Bypass the phase protocol** — even if user's request seems clear, follow the phases
- **Use TaskCreate or TaskUpdate** — each call consumes context; use text output for progress instead

### If you're tempted to read the response doc, referee reports, or manuscript:
STOP. You're probably in extract/profile/audit/fix phase and should spawn the appropriate subagent instead.

## Script Path Resolution

Scripts auto-detect the project root via git. Use `$PROJECT_ROOT` (git repo root) for the skill scripts location. When the working project differs from the skill repo (e.g., Overleaf), export `REVISIONS_PROJECT_DIR` so scripts can find `revisions/current/`:

```bash
# Standard
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/<name>.sh" [args]

# Overleaf or other external working project
REVISIONS_PROJECT_DIR="/path/to/overleaf/project" PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/<name>.sh" [args]
```

## Bootstrap Phase (Always First)

On every invocation, run the bootstrap script to detect the current phase.

```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)" && bash "$PROJECT_ROOT/revisions/scripts/bootstrap.sh"
```

Returns JSON with `phase`, `reason`, `directory_created`, and a `files` map (status/config/claims/referee_profiles/strategy_memo/audit/fix_state/changelog/todos each `exists|missing`).

**Phase actions (MANDATORY — follow exactly):**

| Phase | Action | First Step |
|-------|--------|------------|
| `init` | Collect file paths | AskUserQuestion for response doc, manuscript, etc. |
| `extract` | Parse response doc | Spawn extract subagent |
| `profile` | Build referee profiles | Spawn profile subagent |
| `strategy` | Produce strategy memo | Spawn strategy subagent; pause for user review if `--interactive` or `strategy-only` |
| `audit` | Cross-check claims | Spawn audit subagent |
| `fix` | Fixer-critic loop | Run `fix_loop.sh status`, dispatch accordingly |
| `review` | Present results | Read changelog + todos, display to user |
| `complete` | Done | Inform user, offer reset |

## Context Isolation (Critical)

**Maintain mental separation between phases.** Between phases, "forget" file contents from subagent work and intermediate analysis — anything not in the state files. Each phase starts fresh with ONLY its specified input files plus state from previous phases (JSON summaries, not raw content).

## Init Phase

When the phase is `init`, gather file paths from the user via AskUserQuestion:

1. **Response document** (.tex) — the user's response to referees (source of truth)
2. **AE letter** (.tex/.txt) — optional, separate Associate Editor letter file. If not provided, bootstrap.sh checks whether the response document opens with "Dear Associate Editor" and flags it automatically.
3. **Manuscript** (.tex) — main paper file(s)
4. **Appendix files** (.tex) — optional, supplementary material (including online appendix)
5. **Bibliography** (.bib) — optional, for citation checking
6. **Referee reports** (.tex/.txt/.pdf) — optional, raw referee letters for personality profiling
7. **Code files** (.jl/.py/.R/.m) — optional, estimation code for verifying math/numbers against implementation
8. **Referee grades** (`output/referee_grades.md`) — optional, pre-computed grading from `/referee grade`. If present, pass to the strategy subagent so it can skip re-prioritizing concerns and focus directly on response narrative.

### Using Referee Grades (Optional)

If the user has already run `/referee grade paper.pdf`, a graded priority list exists at `output/referee_grades.md` next to the paper. When this file is available:

- Ask the user during init whether to use it (or check for it automatically at the expected path)
- Add `"referee_grades": "path/to/output/referee_grades.md"` to `current/config.json`
- The strategy subagent reads this file to get pre-computed severity tags (MAJOR/MINOR/COSMETIC), recommended response approaches (AGREE/DISAGREE/ACKNOWLEDGE), and effort estimates — reducing duplicated analysis
- The profile subagent can use it as a supplementary signal when the grades contain referee-specific language patterns

### Write Config

After collecting inputs, write `current/config.json`:
```json
{
  "response_doc": "path/to/response_round2.tex",
  "ae_letter": "path/to/ae_letter.txt",
  "manuscript": ["paper.tex"],
  "appendix": ["online_appendix.tex"],
  "bib": ["Bibliography.bib"],
  "referee_reports": {
    "ref1": "path/to/ref1_report.txt",
    "ref2": "path/to/ref2_report.txt",
    "editor": "path/to/editor_letter.txt"
  },
  "code": ["code/model_functions.jl"],
  "referee_grades": "path/to/output/referee_grades.md",
  "created": "ISO timestamp"
}
```

`manuscript`, `appendix`, and `bib` are arrays to support multi-file projects. `ae_letter` and `referee_grades` are optional — omit the key if not provided.

Update status:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" extract
```

## Extract Phase (Single Sonnet Subagent)

When the phase is `extract`, spawn the extract subagent immediately. Do NOT read the response document. If bootstrap returned `ae_letter_detected: "yes"`, surface that in the subagent context.

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
- Config: current/config.json (contains response doc path and optional ae_letter path)
- AE letter detected by bootstrap: {yes|no}
```

After return: output summary "Extracted N claims (X verifiable, Y unverifiable) — AE letter: yes/no", then advance status to `profile`.

## Profile Phase (Single Opus Subagent)

When the phase is `profile`, spawn the profile subagent immediately. Do NOT read referee reports or the response document yourself.

```
Task: [revisions:profile] Build referee soul documents
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/profile_referees.prompt for full instructions.
Read revisions/prompts/components/response_patterns.prompt for response structure conventions.

Context:
- Config: current/config.json (contains response doc path + optional referee report paths)
- Claims: current/claims.json (contains referee identifiers)
```

After return: output summary "Profiled N referees (swing: RefX). Sources: ...", then advance status to `strategy`.

## Strategy Phase (Single Opus Subagent)

When the phase is `strategy`, spawn the strategy subagent immediately. Do NOT read claims or profiles yourself.

```
Task: [revisions:strategy] Produce strategy memo
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/strategy_memo.prompt for full instructions.

Context:
- Claims: current/claims.json
- Referee profiles: current/referee_profiles.json
- Referee soul documents: current/souls/{key}_soul.md (paths in current/referee_profiles.json)
- Config: current/config.json
```

### After Strategy Returns

1. Output summary: "Strategy memo written to current/strategy_memo.md"
2. **If `strategy-only` alias was used**: Read `current/strategy_memo.md`, present it to the user, stop. Do NOT advance to audit. (See `references/modes/strategy-only.md`.)
3. **If `--interactive`**: Read and present the memo, then ask via AskUserQuestion whether to proceed to audit or stop. If stop: do NOT advance status; inform user they can resume with `/revisions continue`.
4. **Otherwise (normal run)**: Advance status to `audit`:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" audit
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
```

After return: output summary "Audit complete: N found, M missing, P partial, T unverifiable". If `missing + partial == 0`: skip fix, advance to `review`. Otherwise: advance to `fix`.

## Fix Phase (Fixer-Critic Loop)

The fix phase uses an iterative loop: fixer makes edits, critic re-audits, repeat until clean or stopping condition.

```
[AUDIT] → fix_loop.sh init → FIXER(Opus) → CRITIC(Opus) → check stopping → loop or exit
                                    ↑                │
                                    └── still issues ─┘
```

### Step 1: Initialize Fix Loop

On first entry to fix phase (fix_state.json doesn't exist yet):
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/fix_loop.sh" init
```
Returns: `{initialized: true, issues_initial: N, max_iterations: 5}`

### Step 2: Check Loop Status

At the start of each iteration:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/fix_loop.sh" status
```
If `should_stop: true`, present the stop reason and advance to `review`. Otherwise continue to fixer.

### Step 3: Spawn Fixer Subagent (Opus)

```
Task: [revisions:fix:iter{N}] Fix manuscript gaps (iteration {N})
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/fixer.prompt for full instructions.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.
Read revisions/prompts/components/claim_taxonomy.prompt for claim type context.
Read revisions/prompts/components/writing_quality.prompt for writing standards (ALL 7 rules).
Read revisions/prompts/components/response_patterns.prompt for response document editing conventions.

Context:
- Claims: current/claims.json
- Issues: current/audit.json (iteration 1) OR current/fix_iterations/iteration_{N-1}_critic.json (later iterations)
- Referee soul documents: current/souls/{key}_soul.md (paths in current/referee_profiles.json)
- Referee index: current/referee_profiles.json (cross-referee analysis)
- Config: current/config.json (includes manuscript, appendix, response doc, and optional code file paths)
- Iteration: {N}
```

The fixer.prompt file owns the procedural steps (read issues, consult souls, verify notation, edit, tag with `\begin{llm}…\end{llm}`, write iteration JSON, append changelog, commit). Do not duplicate them here.

### Step 4: Spawn Critic Subagent (Opus)

```
Task: [revisions:critic:iter{N}] Re-audit after fixes (iteration {N})
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/critic.prompt for full instructions.
Read revisions/prompts/components/claim_taxonomy.prompt for verification rules.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.
Read revisions/prompts/components/writing_quality.prompt for writing standards (ALL 7 rules).

Context:
- Claims: current/claims.json
- Previous audit: current/audit.json (or prior critic)
- Fixer output: current/fix_iterations/iteration_{N}_fixes.json
- Referee soul documents: current/souls/{key}_soul.md (paths in current/referee_profiles.json)
- Referee index: current/referee_profiles.json (cross-referee analysis)
- Config: current/config.json (includes manuscript, appendix, response doc, and optional code file paths)
- Iteration: {N}
```

The critic.prompt file owns the procedural steps (re-verify, regression checks, write iteration_{N}_critic.json). Do not duplicate them here.

### Step 5: Update Loop State

After critic returns:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/fix_loop.sh" next {issues_remaining}
```

### Step 6: Check Stopping or Continue

```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/fix_loop.sh" status
```

**Stopping conditions:**
1. `resolved` — `issues_remaining == 0` → proceed to review
2. `max_iterations` — default 5 → proceed to review with remaining issues
3. `stagnation` — 2 consecutive iterations with same count → proceed to review

If stopped: advance status to `review`. If not: loop back to Step 3 (fixer).

### Escalation

If specific claims are structural/complex and unfixed after iteration 2, escalate to Opus with the same fixer instructions but only the escalated items in context.

## Review Phase

When the phase is `review`:

1. **Read `current/changelog.md`** and output to user
2. **Read `current/todos.md`** and output to user
3. **Read `current/fix_state.json`** and output summary (initial issues, final remaining, iterations used)
4. **Ask user via AskUserQuestion**: accept and complete, run another fix iteration, or reset.

If user accepts: advance status to `complete`. If user wants another iteration: advance to `fix` and re-enter the loop. If reset: see Reset section.

## Reset (Clear for New Revision)

When the user says "reset", "clear", or "new revision":
1. Check if current/ exists and has content
2. Ask user to confirm
3. Remove **all** contents of current/ (including any orphan files like `audit_in_progress.json`, `.bak`, or `.tmp` files)
4. Confirm ready for new revision

## Model Selection Summary

| Operation | Model | Rationale |
|---|---|---|
| Extract claims | Sonnet | Document parsing, classification |
| Profile referees | Opus | Narrative soul documents require high-quality writing |
| Strategy memo | Opus | Synthesizing referee concerns into high-level narrative |
| Audit claims | Sonnet | Cross-referencing, search |
| Fixer (standard + escalation) | Opus | Writing quality and structural alignment |
| Critic | Opus | Re-verification and quality assurance |
| Grade responses | Opus | Evaluative judgment requires high-quality reasoning |
| Fix-theme | Opus | Cross-cutting edits require consistency and writing quality |

## Files

### Directory Structure

```
revisions/
├── SKILL.md                              # This orchestrator
├── references/
│   └── modes/                            # Standalone-mode reference files
│       ├── grade.md
│       ├── fix-theme.md
│       ├── table_sync.md
│       ├── scaffold.md
│       └── strategy-only.md
├── scripts/
│   ├── bootstrap.sh                      # Phase detection
│   ├── status.sh                         # Get/set status
│   └── fix_loop.sh                       # Fixer-critic iteration management
├── prompts/
│   ├── extract_claims.prompt             # Parse response doc → claims.json
│   ├── profile_referees.prompt           # Build referee personality profiles
│   ├── strategy_memo.prompt              # High-level response strategy memo
│   ├── audit_claims.prompt               # Cross-check claims vs manuscript
│   ├── fixer.prompt                      # Make targeted edits to manuscript
│   ├── critic.prompt                     # Re-audit after fixes
│   ├── table_sync.prompt                 # Reconcile updated tables with manuscript text
│   ├── scaffold_response.prompt          # Build response doc scaffold from raw reports
│   ├── grade_responses.prompt            # Grade responses on a thematic point
│   ├── fix_theme.prompt                  # Targeted cross-cutting edits on one theme
│   └── components/
│       ├── claim_taxonomy.prompt         # Claim type definitions + verification rules
│       ├── latex_conventions.prompt       # LaTeX environments reference
│       ├── response_patterns.prompt      # Response document style conventions
│       └── writing_quality.prompt        # Human-like prose rules (7 rules)
├── templates/
│   └── response_document.tex             # Reference template
├── examples/                             # Exemplar response docs
└── current/                              # Runtime state (gitignored)
    ├── .status
    ├── config.json                       # File paths
    ├── claims.json                       # Extracted claims from response doc
    ├── referee_profiles.json             # Slim index with soul_file pointers + cross-referee analysis
    ├── souls/                            # Narrative referee soul documents
    │   ├── ref1_soul.md
    │   ├── ref2_soul.md
    │   └── ed_soul.md
    ├── strategy_memo.md                  # High-level response strategy
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
| `current/referee_profiles.json` | Slim index: soul_file pointers + cross-referee analysis | Profile subagent |
| `current/souls/{key}_soul.md` | Narrative referee soul documents | Profile subagent |
| `current/strategy_memo.md` | High-level response strategy | Strategy subagent |
| `current/audit.json` | Verification results | Audit subagent |
| `current/fix_state.json` | Loop iteration state | fix_loop.sh |
| `current/changelog.md` | Edit log | Fixer subagent (appends) |
| `current/todos.md` | User action items | Audit subagent |
| `current/fix_iterations/iteration_N_fixes.json` | Per-iteration fixes | Fixer subagent |
| `current/fix_iterations/iteration_N_critic.json` | Per-iteration re-audit | Critic subagent |
| `current/table_sync_report.md` | Line-by-line text changes to match updated tables | Table sync subagent |
| `current/response_scaffold.tex` | LaTeX scaffold with verbatim comments + blank Reply placeholders | Scaffold subagent |
| `current/grade_report.md` | Per-passage grades + recommended argument structure | Grade subagent |
