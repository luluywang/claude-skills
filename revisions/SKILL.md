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
/revisions strategy-only          # Run through STRATEGY phase only, then stop
/revisions sync-tables [table_file] [manuscript]  # Reconcile updated tables with manuscript text
/revisions scaffold [editor_letter] [ref1] [ref2] ...  # Build response doc scaffold from raw reports
```

## Table Sync

`/revisions sync-tables [table_file] [manuscript]` is a **standalone mode** for reconciling updated tables or data files with manuscript text. It is distinct from the main response-doc → manuscript alignment workflow and does not use claims, referee profiles, or the fixer-critic loop.

### When to Use

Use this mode after updating tables (e.g., re-running estimation, changing sample restrictions) when the manuscript text still references old observation counts, percentage effects, or test statistics. The main `/revisions` workflow handles response-doc alignment; this mode handles data-manuscript alignment.

### Inputs

- `[table_file]`: Path to updated table file(s) — `.tex` tables, `.csv`, or a directory containing multiple table files. May also be passed as a config key if multiple files are involved.
- `[manuscript]`: Path to the main manuscript `.tex` file (and optionally appendix files).

### What It Does

1. Runs `bootstrap.sh` to detect `table_sync` phase
2. Spawns a single subagent reading `revisions/prompts/table_sync.prompt`
3. The subagent reads the tables and manuscript, finds all numerical conflicts (obs counts, % effects, statistics), and writes `current/table_sync_report.md`
4. The orchestrator presents `current/table_sync_report.md` to the user

### Output

`current/table_sync_report.md` — a line-by-line diff of required text changes: what the manuscript currently says, what it should say based on the updated tables, and the exact file/line location.

### Phase Protocol

When bootstrap returns `table_sync`, the orchestrator MUST:
1. Confirm input paths with the user if not already provided as arguments
2. **IMMEDIATELY** spawn the table_sync subagent — do NOT read tables or manuscript yourself
3. After the subagent returns, read and present `current/table_sync_report.md` to the user

```
Task: [revisions:table_sync] Reconcile updated tables with manuscript text
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/table_sync.prompt for full instructions.

Context:
- Table file(s): {path(s) provided by user}
- Manuscript: {path(s) provided by user}

Your job:
1. Read all table files (LaTeX tables, CSV exports, or both)
2. Read the manuscript (and appendix if provided)
3. Find every obs count, % effect, and test statistic in the manuscript text
4. Compare each against the corresponding value in the updated tables
5. Write current/table_sync_report.md with line-by-line changes needed
6. Return: {status, conflicts_found, sections_affected}
```

## Scaffold Mode

`/revisions scaffold [editor_letter] [ref1] [ref2] ...` is a **standalone mode** for building a response document scaffold from raw referee/editor report files. It runs before any response document exists — once the user fills in replies, they run `/revisions` normally.

### When to Use

Use this mode at the start of a new revision round, when the user has raw referee/editor letters but no response document yet. The output is `current/response_scaffold.tex`, which the user fills in and then passes to `/revisions` as the response document.

### Inputs

- `[editor_letter]`: Path to the editor letter file (plain text or .tex). Optional — pass `none` or omit to skip.
- `[ref1]`, `[ref2]`, ...: Paths to referee report files in order.

If file paths are not provided as CLI arguments, use AskUserQuestion to collect them:
1. Ask which file is the editor letter (if any)
2. Ask for referee report files one by one (ref1, ref2, ...)

### Phase Protocol

When the invocation argument is `scaffold`, the orchestrator MUST:
1. Confirm input paths (from CLI args or via AskUserQuestion)
2. **IMMEDIATELY** spawn the scaffold subagent — do NOT read the report files yourself
3. After the subagent returns, present the output path and remind the user to fill in replies

```
Task: [revisions:scaffold] Build response document scaffold from raw reports
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/scaffold_response.prompt for full instructions.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.

Context:
- Editor letter: {path or "none"}
- Referee reports: {ref1: path, ref2: path, ...}

Your job:
1. Read each raw report file
2. Segment each into individual comments/points
3. Wrap each in \begin{refcommentnoclear}...\end{refcommentnoclear} + \textbf{Reply:} placeholder
4. Structure into a LaTeX response document with one refsection per referee
5. Write current/response_scaffold.tex
6. Return: {status, editor_comments, referees: [{key, label, comment_count}], total_comments, output_file}
```

### After Subagent Returns

1. Output summary: "Scaffold written to `current/response_scaffold.tex` — N total comments (editor: X, ref1: Y, ref2: Z)"
2. Remind user: "Fill in the `\textbf{Reply:}` placeholders, then run `/revisions` with `current/response_scaffold.tex` as the response document."
3. **Do NOT advance `.status`** — workflow stays at `init` so the user can run `/revisions` normally after filling in replies.

---

## How It Works

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

With `/revisions strategy-only`, the workflow stops after `[STRATEGY]` and presents `current/strategy_memo.md` to the user.

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
- Read skill files (SKILL.md, prompts/*)
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

All script paths use `$PROJECT_ROOT` which resolves to the git repo root. Since shell
state does not persist between Bash tool calls, **every script invocation must inline
the resolution**:

```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/<name>.sh" [args]
```

Every code block below follows this pattern.

## Bootstrap Phase (Always First)

On every invocation, run the bootstrap script to detect the current phase.

### Run bootstrap script

```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)" && bash "$PROJECT_ROOT/revisions/scripts/bootstrap.sh"
```

Returns JSON:
```json
{
  "phase": "init|extract|profile|strategy|audit|fix|review|complete",
  "reason": "Brief explanation",
  "directory_created": "yes|no",
  "files": {
    "status": "exists|missing",
    "status_content": "...",
    "config": "exists|missing",
    "claims": "exists|missing",
    "referee_profiles": "exists|missing",
    "strategy_memo": "exists|missing",
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
| `profile` | Build referee profiles | Spawn profile subagent |
| `strategy` | Produce strategy memo | Spawn strategy subagent; pause for user review if `--interactive` or `strategy-only` |
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

Note: `manuscript`, `appendix`, and `bib` are arrays to support multi-file projects. `ae_letter` is optional — omit the key if not provided. If `ae_letter` is omitted, bootstrap.sh will automatically detect an embedded AE section in the response document. `referee_grades` is optional — omit the key if the user has not run `/referee grade`.

Update status:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" extract
```

## Extract Phase (Single Sonnet Subagent)

When the phase is `extract`, spawn the extract subagent immediately. Do NOT read the response document.

If bootstrap returned `ae_letter_detected: "yes"`, surface that in the subagent context so it knows to look for an AE section.

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

Your job:
1. Read the AE letter (if config.json has ae_letter key) or detect an embedded AE section
2. Read the response document
3. Parse all \textbf{Reply:} blocks across all sections (AE + referees)
4. Extract each claim, classify by taxonomy type, tag with source ("ae" or "referee_N")
5. Write current/claims.json
6. Return: {status, total_claims, ae_letter_present, by_type, by_source, verifiable, unverifiable}
```

### After Extract Returns

1. Output summary: "Extracted N claims (X verifiable, Y unverifiable) — AE letter: yes/no"
2. Update status:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" profile
```

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

Your job:
1. Identify referees from claims.json
2. Read referee reports (primary) or response doc refcommentnoclear blocks (fallback)
3. Profile each referee across 8 personality dimensions
4. Synthesize into narrative soul documents
5. Write current/souls/{key}_soul.md for each referee
6. Write current/referee_profiles.json (slim index with soul_file pointers + cross-referee analysis)
7. Return: {status, referees_profiled, referee_keys, sources_used, swing_referee, soul_files}
```

### After Profile Returns

1. Output summary: "Profiled N referees (swing: RefX). Sources: referee_reports|response_doc_comments. Soul files: current/souls/"
2. Update status:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" strategy
```

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

Your job:
1. Read claims.json to understand all referee concerns and promised changes
2. Read referee_profiles.json and each soul document to understand referee priorities
3. Identify the most serious concerns and the swing referee
4. Draft the overall response narrative and prioritization
5. Identify which manuscript sections need the most work
6. Write current/strategy_memo.md
7. Return: {status, referees_addressed, top_concerns, sections_flagged}
```

### After Strategy Returns

1. Output summary: "Strategy memo written to current/strategy_memo.md"
2. **If `strategy-only` alias was used**: Read `current/strategy_memo.md` and present it to the user. Stop here — do NOT advance to audit.
3. **If `--interactive`**: Read `current/strategy_memo.md`, present it to the user, and ask:

```json
{
  "header": "Strategy Memo Review",
  "question": "Review the strategy memo above. How would you like to proceed?",
  "multiSelect": false,
  "options": [
    {"label": "Proceed to audit", "description": "Continue with claim-by-claim audit"},
    {"label": "Stop here", "description": "Keep the strategy memo and stop for now"}
  ]
}
```

If user chooses to stop: do NOT advance status. Inform user they can resume with `/revisions continue`.

4. **Otherwise (normal run)**: Advance status automatically:
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
   PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" review
   ```
3. Otherwise: Proceed to fix phase
   ```bash
   PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" fix
   ```

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

If `should_stop: true`:
- Present stop reason to user
- Move to review: `PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" review`

If `should_stop: false`: continue to fixer.

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

Your job:
1. Read remaining issues (missing/partial with fixable:true)
2. Consult referee soul documents to calibrate edits per referee
3. Verify notation against existing manuscript definitions before writing
4. Make targeted edits to manuscript files AND response document where needed
5. NEVER insert specific numbers without verifying them against tables/figures/scalarinput
6. Tag all edits with \begin{llm}...\end{llm}
7. Write current/fix_iterations/iteration_{N}_fixes.json
8. Append to current/changelog.md
9. Commit: [revisions:fix:iter{N}] Fix M manuscript gaps
10. Return: {status, iteration, fixed, skipped, escalated}
```

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

Your job:
1. Re-read manuscript files (with fixes applied)
2. Re-verify all previously failing claims
3. Spot-check previously passing claims for regressions
4. Check for new problems: number hallucination, notation errors, over-deletion, content placement, verbosity, artificial structure, missing takeaways, regression from prior version
5. Write current/fix_iterations/iteration_{N}_critic.json
6. Return: {status, iteration, resolved, still_missing, partial, regressions, new_issues, issues_remaining}
```

### Step 5: Update Loop State

After critic returns, record the result:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/fix_loop.sh" next {issues_remaining}
```

### Step 6: Check Stopping or Continue

Check the loop status:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/fix_loop.sh" status
```

**Stopping conditions:**
1. `resolved` — `issues_remaining == 0` → proceed to review
2. `max_iterations` — default 5 → proceed to review with remaining issues
3. `stagnation` — 2 consecutive iterations with same count → proceed to review

If stopped:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" review
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
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" complete
```

If user wants another iteration:
```bash
PROJECT_ROOT="$(git rev-parse --show-toplevel)" && bash "$PROJECT_ROOT/revisions/scripts/status.sh" fix
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
| Profile referees | Opus | Narrative soul documents require high-quality writing |
| Strategy memo | Opus | Synthesizing referee concerns into high-level narrative |
| Audit claims | Sonnet | Cross-referencing, search |
| Fixer (standard) | Opus | Writing quality and structural alignment |
| Fixer (escalation) | Opus | Complex structural changes |
| Critic | Opus | Re-verification and quality assurance |

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
│   ├── profile_referees.prompt           # Build referee personality profiles
│   ├── strategy_memo.prompt              # High-level response strategy memo
│   ├── audit_claims.prompt               # Cross-check claims vs manuscript
│   ├── fixer.prompt                      # Make targeted edits to manuscript
│   ├── critic.prompt                     # Re-audit after fixes
│   ├── table_sync.prompt                 # Reconcile updated tables with manuscript text
│   ├── scaffold_response.prompt          # Build response doc scaffold from raw reports
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
