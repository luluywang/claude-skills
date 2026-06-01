---
name: econ_ra
description: Econ RA workflow orchestrator for multi-phase economics research projects. Only activate when user explicitly invokes '/econ_ra', 'econ_ra', or says 'use econ_ra to tackle'. Do NOT activate for general economics questions.
---

# Econ RA Workflow Orchestrator

This orchestrator manages a multi-phase workflow with context isolation between phases.

## Table of Contents

- [Invocation](#invocation)
- [Modes](#modes)
- [How It Works](#how-it-works)
- [Progress Tracking](#progress-tracking)
- [Task Operations](#task-operations)
- [Orchestrator Rules (Critical)](#orchestrator-rules-critical)
- [Bootstrap Phase (Always First)](#bootstrap-phase-always-first)
- [Context Isolation (Critical)](#context-isolation-critical)
- [Interview Phase](#interview-phase)
- [Planning & Verification Phase](#planning--verification-phase)
- [Execution Phase](#execution-phase)
- [Wrapup Phase](#wrapup-phase)
- [Consistency Check (`/econ_ra check`)](#consistency-check-econ_ra-check)
- [Reset (Clear for New Project)](#reset-clear-for-new-project)
- [Diagnostic Mode](#diagnostic-mode)
- [Campaign Mode (Long-Horizon Work)](#campaign-mode-long-horizon-work)
- [Model Selection & Scripts](#model-selection--scripts)
- [Memory Integration](#memory-integration)
- [Files](#files)

## Invocation

```
/econ_ra tackle @notes/my_project.md       # Start new project
/econ_ra tackle @notes/my_project.md --interactive  # Pause between phases
/econ_ra continue                          # Resume interrupted project
/econ_ra reset                             # Clear for new project
/econ_ra diagnose "my IV is weak"          # Start diagnostic mode
/econ_ra check                             # Run internal consistency check on current project
/econ_ra campaign start "<objective>"      # Start a new long-horizon campaign
/econ_ra campaign resume                   # Import state from reality, show "where we are"
/econ_ra campaign status                   # Show campaign state files
/econ_ra campaign log "<decision>"         # Append a decision to the log
/econ_ra campaign job submit <jobid> "<purpose>"
/econ_ra campaign job update <jobid> <status> [note]
/econ_ra campaign job list
/econ_ra campaign end                      # Archive campaign to .econ_ra/history/
```

## Modes

**Autonomous (default)**: After each phase completes, automatically continue to the next phase. Only pause for user input when questions need answering (interview, verification thresholds, planning approval).

**Interactive**: Pause between phases for user review. Use `--interactive` or say "stop after each phase".

## How It Works

1. Detect current phase from `current/` state
2. For phases requiring user input: spawn generate subagent → collect answers → spawn process subagent
3. For execution: spawn one subagent per task
4. **Clear working memory** between phases (don't carry forward code exploration, intermediate reasoning)
5. Automatically continue to next phase (in autonomous mode)

The key insight: subagents run autonomously and cannot interact with users. User interaction happens in the orchestrator (main context), kept lightweight by offloading analysis to subagents.

## Progress Tracking

Progress is communicated via **text output** at phase transitions. The authoritative workflow state lives in `current/.status` (managed by `status.sh`) and `current/tasks.json` (for execution task status).

At each phase transition, output a brief status line:
- Phase entry: `--- [PHASE] Spawning subagent...`
- Phase exit: `--- [PHASE] Done: <summary>`

During execution, output task dispatch/completion lines:
- `--- [TASK 3] Spawning: Merge QCEW with MW data`
- `--- [TASK 3] Done: complete`

Do NOT use TaskCreate or TaskUpdate — these tools consume context tokens on every call.

## Task Operations

All task state changes MUST go through `scripts/task_ops.sh`. **Never edit `tasks.json` directly.**

Direct JSON editing is error-prone and leaves the file in inconsistent states. The script performs atomic writes (write to `.tmp`, then `os.replace`) so a crash cannot corrupt the file.

### Available commands

```bash
# Set the status of a task by id
./scripts/task_ops.sh set-status <id> <status>
# Valid statuses: pending, partial, complete, flagged, blocked

# Append a new task to tasks.json
./scripts/task_ops.sh add-task '<json>'
# JSON must include: id, task, type, status
# Example: ./scripts/task_ops.sh add-task '{"id": 6, "task": "Run robustness check", "type": "analysis", "status": "pending", "depends_on": [5], "notes": ""}'

# Replace one task with multiple tasks (split a task into subtasks)
./scripts/task_ops.sh split-task <id> '<new_tasks_json>'
# new_tasks_json must be a JSON array with at least 2 task objects
```

All commands print JSON and exit 0 on success, 1 on error.

### When to use each command

| Situation | Command |
|-----------|---------|
| Execution subagent finishes a task | `set-status <id> complete` |
| Task is blocked by an external dependency | `set-status <id> blocked` |
| Task partially complete (context limit hit) | `set-status <id> partial` |
| Task has issues requiring user review | `set-status <id> flagged` |
| User requests a new task during planning | `add-task '<json>'` |
| User requests splitting a large task | `split-task <id> '<subtasks>'` |

### MANDATORY: Orchestrator must use task_ops.sh

The orchestrator MUST call `task_ops.sh` for every task state change. Do NOT:
- Edit `tasks.json` with a text editor or Write tool
- Use `jq` or `python3` inline to modify `tasks.json` directly
- Ask execution subagents to update their own status via JSON editing

Execution subagents MAY call `task_ops.sh set-status` directly to update their own task entry after completing work.

## Orchestrator Rules (Critical)

The orchestrator coordinates — it does NOT do the work itself.

### MANDATORY: Phase Protocol Enforcement

**After bootstrap returns a phase, you MUST follow the exact protocol for that phase.**

- `interview` → **IMMEDIATELY** spawn `interview_generate` subagent. Do NOT read user files first.
- `planning` → **IMMEDIATELY** spawn `planning_verification_generate` subagent.
- `execution` → Run dispatcher and spawn execution subagents.
- `cleanup` → Run wrapup scripts.

**NEVER** attempt to understand the user's request by reading their files yourself. The interview_generate subagent does this. Even if the user provides detailed instructions, the orchestrator's job is to route to the correct phase protocol, not to start working directly.

### MANDATORY: Always Complete the Workflow

**After all tasks reach terminal status (complete/flagged/blocked), you MUST spawn the wrapup subagent.**
- Do NOT just output a summary and stop
- Do NOT consider the project "done" until wrapup has archived to history/
- The wrapup subagent handles archival, retrospective creation, and cleanup

### The orchestrator CAN:
- Read skill files (SKILL.md, prompts/*.md, references/preferences.md)
- Read state files (current/.status, current/tasks.json, current/full_spec.md)
- Run scripts (bootstrap.sh, dispatcher.py, status.sh, etc.)
- Spawn subagents with appropriate context
- Present questions to users and collect answers
- Update `.status` files
- Verify commits via `git log`

### The orchestrator MUST NOT:
- **Read user project files** — subagents do this (interview_generate explores the codebase)
- **Write or modify code files** — only execution subagents do this
- **Write full_spec.md** — interview_process subagent writes this
- **Write checks.md** — verification_process subagent writes this
- **Run data analysis or scripts** — execution subagents do this
- **Make commits for code changes** — subagents commit their own work
- **Bypass the phase protocol** — even if user's request seems clear, follow the phases
- **Use TaskCreate or TaskUpdate** — each call consumes context; use text output for progress instead

### If you're tempted to read a user file directly:
STOP. You're probably in interview phase and should spawn interview_generate instead.

### If you're tempted to make a code change directly:
STOP. Instead:
1. Identify which task should handle it
2. Spawn an execution subagent with clear instructions
3. Let the subagent make the change, log it, verify it, and commit

## Bootstrap Phase (Always First)

On every invocation, run the bootstrap script to detect the current phase. This is faster and cheaper than spawning a subagent.

```bash
./scripts/bootstrap.sh
```

Returns JSON with `phase`, `reason`, `directory_created`, and a `files` map (status, full_spec, tasks, checks, session_log). The script handles creating `current/` if missing, reading `.status`, checking key files, and applying the detection logic in `prompts/bootstrap.md`.

**Phase actions (MANDATORY — follow exactly):**

| Phase | Action | First Step |
|-------|--------|------------|
| `interview` | Run interview phase | Spawn `interview_generate` subagent |
| `planning` | Run planning phase | Spawn `planning_verification_generate` subagent |
| `execution` | Run execution | Run `dispatcher.py`, spawn execution subagents |
| `cleanup` | Run wrapup scripts | Run `status.sh complete` then `archive.sh` |
| `unknown` | Ask user for clarification | Use AskUserQuestion |

**CRITICAL: When phase is `interview`, your FIRST action MUST be spawning `interview_generate`. Do NOT read user files. Do NOT start working on the user's request. The interview_generate subagent handles codebase exploration.**

## Context Isolation (Critical)

Even in autonomous mode, **maintain mental separation between phases**:

### Between phases, "forget":
- Code files you explored
- Data structures you analyzed
- Intermediate reasoning
- Anything not in the output files

### Each phase starts fresh with ONLY:
- Its specified input files
- User responses from that phase

## Interview Phase

When the phase is Interview, run an iterative loop that **continues until the user explicitly requests to move to planning**. Each round: spawn `interview_generate` (Sonnet, Explore) → present questions via AskUserQuestion → spawn `interview_process` (Haiku) → ask user whether to move on.

**FIRST action MUST be spawning `interview_generate`. Do NOT read user project files yourself.**

Outputs created in this phase:
- `spec.md` — Original user spec (preserved unchanged)
- `full_spec.md` — Consolidated specification with clarifications
- `codebase_summary.md` — Directory structure, scripts, data files

Read `references/phases/interview.md` for the full Task specs (interview_generate and interview_process), the AskUserQuestion JSON for spec review, and the loop pseudocode.

## Planning & Verification Phase

When the phase is Planning, use the generate → interact → process pattern:

1. Spawn `planning_verification_generate` (Sonnet, Plan) — designs task list, checks, and threshold questions. Does NOT write files.
2. **Output the full task table to the user as text**, then loop with AskUserQuestion (Move to execution / Request changes / Show full spec). On revisions, write the revised tasks to `current/tasks.json` and output the entire JSON.
3. Once the user selects "Move to execution", collect threshold answers, then spawn `planning_verification_process` (Haiku) to write `tasks.json` and `checks.md`. Update `.status` to `execution`.

**Critical:** the user cannot see subagent output. The orchestrator must paste the task table (and revised JSON) directly in its own response. Never auto-proceed to execution without explicit user selection.

Read `references/phases/planning.md` for the full Task specs, the iteration loop, the AskUserQuestion JSON, and the revised-tasks JSON schema.

## Execution Phase

During execution, run `python3 ./scripts/dispatcher.py` to find ready tasks (parallel by default; `--sequential` for one at a time). The script returns `ready_tasks` and `counts`.

For each ready task, spawn an execution subagent with model selected by task complexity:
- **Haiku** — data loading, simple merges, descriptive stats, file I/O, table formatting
- **Sonnet** (default) — OLS / DiD / IV / RD, robustness checks, event studies, figures, writing
- **Opus** — novel/structural estimation, custom methods, hard debugging, deep economic reasoning

The subagent reads `prompts/execution.md`, implements the task, verifies against `checks.md`, updates its own `tasks.json` entry via `task_ops.sh`, appends to `session_log.md`, and commits user code changes (never internal workflow files).

**CRITICAL:** After all tasks reach terminal status, you MUST run wrapup (status.sh + archive.sh). Do not stop with a summary.

Read `references/phases/execution.md` for the full dispatcher JSON schema, model-selection keyword logic, and the execution subagent Task spec.

## Wrapup Phase

When all tasks have terminal status (complete/flagged/blocked), use the archive script for file operations and optionally spawn a subagent for retrospective creation.

### Step 1: Set status to complete

```bash
./scripts/status.sh complete
```

### Step 2: Archive to history

```bash
./scripts/archive.sh
```

Returns JSON with `archived`, `archive_path`, `archive_name`, `project_name`, `date`, and `counts`.

### Step 3: Create retrospective (optional subagent)

If you need a detailed retrospective with lessons learned, spawn a wrapup subagent:

```
Task: [econ_ra:wrapup] Create retrospective and identify lessons
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read prompts/wrapup.md for full instructions.

Context:
- Archive path: [from archive.sh output]
- Tasks: [archive_path]/tasks.json
- Session log: [archive_path]/session_log.md
- Checks: [archive_path]/checks.md

Your job:
1. Create retrospective.md in archive folder
2. Identify lessons for references/preferences.md
3. Return flagged/blocked item details with severity
```

For simple projects with no flagged/blocked items, you can skip the subagent. Do NOT commit internal workflow files (they are in `.claude/` which is typically gitignored).

## Consistency Check (`/econ_ra check`)

When the user invokes `/econ_ra check`, run the internal numerical consistency checker on the current project. This is a standalone task — it does **not** advance the workflow phase.

### When to Use

- Summary statistics have been generated and regression tables exist
- The user wants to confirm % effects, observation counts, and reported magnitudes are internally coherent
- Tables have been regenerated and the user wants to verify no discrepancies were introduced

### Protocol

Spawn the consistency_check subagent (Sonnet, general-purpose) reading `prompts/consistency_check.prompt`. Pass `current/full_spec.md`, `current/codebase_summary.md`, and `current/session_log.md` (if they exist). The subagent locates all tables and numerical results, runs consistency checks, and writes `current/consistency_report.md`. Return: `{ pass_count, fail_count, warning_count, summary }`.

After it returns, output: `--- [CHECK] Done: N passed, M failed, K warnings`, then display key failures/warnings and direct the user to `current/consistency_report.md`.

**Do NOT change workflow phase.** The check runs in-place and the project continues from wherever it was.

## Reset (Clear for New Project)

When the user says "reset", "clear", "start fresh", or "new project":

1. Check if `current/` exists
2. IF `current/` exists AND has content:
   - Ask user: "Archive current project before clearing, or discard?"
3. Archive or discard as requested, then confirm ready for new project

## Diagnostic Mode

Diagnostic mode is for **iterative problem-solving** when the user has a problem but doesn't know how to fix it. Unlike the standard workflow (which executes a known sequence of tasks), diagnostic mode uses a Try-Ingest-Brainstorm-Select loop.

Auto-detection: if bootstrap shows `diagnostic_state.json` exists, the project is in diagnostic mode.

Loop architecture: `DIAGNOSTIC_INTERVIEW (Sonnet) → INITIAL_BRAINSTORM (Opus) → SELECT → TRY (Haiku) → INGEST (Haiku) → BRAINSTORM (Opus) → ...` until resolved, max iterations (default 10), stagnation (two inconclusive in a row), or user checkpoint (every 3 iterations).

Status values cycle through `diagnostic_interview`, `diagnostic_brainstorm`, `diagnostic_select`, `diagnostic_try`, `diagnostic_wrapup`. State lives in `current/diagnostic_state.json`; per-iteration evidence lives in `current/findings/iteration_N_*.md`. Driver script: `./scripts/diagnostic_loop.sh {init|status|next}`.

Read `references/phases/diagnostic.md` for the full phase-by-phase Task specs, the AskUserQuestion JSON for hypothesis selection and checkpoints, the `diagnostic_state.json` schema, and a worked example ("My IV is weak").

## Campaign Mode (Long-Horizon Work)

Campaign mode is the connective tissue **between** many small plan-sessions stretched over days or weeks. It tracks cross-session state (decisions, SLURM jobs, shifting focus) without replacing or touching the interview/planning/execution phases.

**What campaign mode is NOT:** a replacement for plan/interview/execution phases (those run as normal within each session); a SLURM monitoring daemon (job updates are manual); a fit for one-shot projects; or auto-activated.

State lives in `.econ_ra/campaign/` inside the **project directory** (not under `$ECON_RA_WORKDIR`) — campaign state is project-scoped and committed with the code:
- `campaign.md` — objective, current focus, open questions (commit)
- `decisions.md` — timestamped decision log (commit)
- `jobs.json` — SLURM job list (gitignore)

Subcommands all delegate to `./scripts/campaign.sh`:
- `start "<objective>"` → `init` — show `campaign_md` path, remind user to gitignore `jobs.json`
- `resume` → spawn Haiku subagent reading `prompts/campaign_resume.md` to import state from git/squeue/logs
- `status`, `log`, `job submit/update/list`, `end` → corresponding `campaign.sh` subcommands

Valid job statuses: `submitted`, `running`, `succeeded`, `failed`, `oom`, `cancelled`. `end` refuses if jobs are still active.

Read `references/phases/campaign.md` for the full subcommand protocols and a multi-day worked example.

## Model Selection & Scripts

Some operations are now handled by scripts instead of LLM subagents for faster execution and lower cost:

| Operation | Type | Subagent Type | Rationale |
|-----------|------|---------------|-----------|
| **bootstrap** | **script** | — | `./scripts/bootstrap.sh` — pure file/directory checks |
| **task_dispatcher** | **script** | — | `./scripts/dispatcher.py` — JSON parsing for ready tasks |
| **archive** | **script** | — | `./scripts/archive.sh` — file operations for wrapup |
| **status** | **script** | — | `./scripts/status.sh` — get/set status file |
| **diagnostic_loop** | **script** | — | `./scripts/diagnostic_loop.sh` — track iterations, check stopping |
| **campaign** | **script** | — | `./scripts/campaign.sh` — campaign state operations |
| interview_generate | subagent (sonnet) | Explore | Reads codebase, no file writes |
| interview_process | subagent (haiku) | general-purpose | Writes full_spec.md |
| planning_verification_generate | subagent (sonnet) | Plan | Designs task list, no file writes |
| planning_verification_process | subagent (haiku) | general-purpose | Writes tasks.json, checks.md |
| execution tasks | subagent (dynamic) | general-purpose | Full tool access for code changes |
| wrapup (retrospective) | subagent (haiku) | general-purpose | Writes retrospective |
| diagnostic_interview | subagent (sonnet) | Explore | Explores codebase, no file writes |
| diagnostic_thinker | subagent (opus) | Plan | Deep reasoning, no file writes |
| diagnostic_executor | subagent (haiku) | general-purpose | Writes findings files |
| consistency_check | subagent (sonnet) | general-purpose | Reads outputs, writes consistency_report.md |
| campaign_resume | subagent (haiku) | general-purpose | Imports state from git/squeue/logs |

## Memory Integration

The skill uses a dual-memory pattern:

**`references/preferences.md` (skill-specific):** Domain research preferences accumulated across projects — clustering defaults, preferred estimators, data handling conventions, output format preferences. Read by subagents at the start of each phase. Updated by the wrapup subagent when new preferences are identified.

**`MEMORY.md` (project-level):** Meta-knowledge about using econ_ra effectively — orchestrator debugging notes, common failure modes, workflow optimizations. Lives in the Claude Code auto-memory directory. Updated by the orchestrator (not subagents) when patterns emerge across projects.

| Memory | Scope | Updated by | Read by |
|--------|-------|------------|---------|
| `references/preferences.md` | Research domain | Wrapup subagent | All subagents |
| `MEMORY.md` | Tool/workflow | Orchestrator | Orchestrator |

## Files

### Working Directory Configuration

The working directory (where `current/` and `history/` are created) is configurable:

1. **Environment variable**: Set `ECON_RA_WORKDIR` to an absolute path
2. **Default**: `$PWD/econ_ra_work/` (project-local, visible)

This allows the skill to work across different machines and projects:
- On server: `export ECON_RA_WORKDIR=/data/projects/myproject/econ_ra_work`
- Locally: Just run from your project directory, files go to `./econ_ra_work/`

**Note:** Campaign state uses a separate project-local directory (`.econ_ra/`) that is NOT under `$ECON_RA_WORKDIR`. See [Campaign Mode](#campaign-mode-long-horizon-work) for details.

### Directory Structure

```
# Skill directory (where SKILL.md lives)
econ_ra/
├── SKILL.md                          # This orchestrator
├── scripts/                          # Automation scripts
│   ├── bootstrap.sh                  # Phase detection
│   ├── dispatcher.py                 # Find ready tasks
│   ├── archive.sh                    # Archive to history
│   ├── status.sh                     # Get/set status
│   ├── task_ops.sh                   # Atomic task state operations
│   ├── diagnostic_loop.sh            # Diagnostic iteration tracking
│   └── campaign.sh                   # Campaign state operations
├── prompts/                          # Phase instructions (for subagents)
│   ├── bootstrap.md                  # (reference only, use script)
│   ├── interview_generate.md
│   ├── interview_process.md
│   ├── planning_verification_generate.md
│   ├── planning_verification_process.md
│   ├── task_dispatcher.md            # (reference only, use script)
│   ├── execution.md
│   ├── wrapup.md
│   ├── diagnostic_interview.md       # Diagnostic problem scoping
│   ├── diagnostic_thinker.md         # Hypothesis generation (Opus)
│   ├── diagnostic_executor.md        # Hypothesis testing (Haiku)
│   ├── consistency_check.prompt      # Internal numerical consistency checks
│   └── campaign_resume.md            # Campaign state import (Haiku subagent)
├── templates/                        # Project templates
│   └── campaign.md                   # Campaign file template
└── references/                       # Reference materials (progressive disclosure)
    ├── preferences.md                # Accumulated user preferences
    ├── writing_principles.md
    └── phases/                       # Per-phase Task specs and worked examples
        ├── interview.md
        ├── planning.md
        ├── execution.md
        ├── diagnostic.md
        └── campaign.md

# Working directory ($ECON_RA_WORKDIR or $PWD/econ_ra_work/)
# Used by standard interview/planning/execution workflow
econ_ra_work/
├── current/                          # Active project
│   ├── .status                       # Current phase status
│   ├── spec.md                       # Original user spec (preserved)
│   ├── full_spec.md                  # Consolidated specification
│   ├── codebase_summary.md           # Directory structure, scripts, data
│   ├── tasks.json
│   ├── checks.md
│   ├── session_log.md
│   ├── diagnostic_state.json         # Diagnostic mode state (if in diagnostic)
│   ├── consistency_report.md         # Output of /econ_ra check (if run)
│   └── findings/                     # Diagnostic test results
│       └── iteration_N_*.md          # Findings from each hypothesis test
└── history/                          # Archived projects
    └── YYYY-MM-DD_project_name/

# Campaign directory (project-local, in the user's project repo)
# Used by campaign mode — DIFFERENT from econ_ra_work/
.econ_ra/
├── campaign/                         # Active campaign (one at a time)
│   ├── campaign.md                   # Objective, focus, questions — commit this
│   ├── decisions.md                  # Timestamped decision log — commit this
│   └── jobs.json                     # SLURM job list — add to .gitignore
└── history/                          # Archived campaigns
    └── YYYY-MM-DD_<objective-slug>/
```
