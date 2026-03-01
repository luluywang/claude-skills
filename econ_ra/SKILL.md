---
name: econ_ra
description: |
  Econ RA workflow orchestrator for multi-phase economics research projects.
  Only activate when user explicitly invokes '/econ_ra', 'econ_ra', or says
  'use econ_ra to tackle'. Do NOT activate for general economics questions.
---

# Econ RA Workflow Orchestrator

This orchestrator manages a multi-phase workflow with context isolation between phases.

## Invocation

```
/econ_ra tackle @notes/my_project.md       # Start new project
/econ_ra tackle @notes/my_project.md --interactive  # Pause between phases
/econ_ra continue                          # Resume (active project or from project_state.md)
/econ_ra reset                             # Clear for new project
/econ_ra diagnose "my IV is weak"          # Start diagnostic mode
/econ_ra investigate "why are welfare numbers negative"  # Read-only investigation
/econ_ra investigate                       # Open-ended scan for issues
/econ_ra verify                            # Full cross-reference check
/econ_ra verify --numbers                  # Code outputs vs scalars vs LaTeX
/econ_ra verify --notation                 # Symbol consistency across .tex files
/econ_ra verify --claims                   # Referee response claims vs manuscript
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

The orchestrator coordinates—it does NOT do the work itself.

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

### Auto-Detection: Route to Correct Mode

If the user invokes `/econ_ra tackle` but their spec contains debugging or investigation language, suggest a more appropriate mode:

**Debugging language → suggest investigate or diagnose:**
- Keywords: "doesn't make sense", "wrong sign", "can't figure out why", "broken", "unexpected", "not working", "results are off", "numbers don't add up"
- Suggest: "This sounds like a debugging task. Would you prefer `/econ_ra investigate` (read-only report) or `/econ_ra diagnose` (iterative hypothesis testing)?"

**Verification language → suggest verify:**
- Keywords: "check if numbers match", "make sure LaTeX is correct", "verify consistency", "before I submit"
- Suggest: "This sounds like a verification task. Would you prefer `/econ_ra verify`?"

**Quick execution language → abbreviated interview:**
- Keywords: "just run", "quick change", "simple fix", "one thing"
- Proceed with tackle but note that the interview should be abbreviated (2-3 questions max)

Use AskUserQuestion to confirm the mode switch. If the user insists on tackle, proceed with tackle.

### The orchestrator CAN:
- Read skill files (SKILL.md, prompts/*.md, preferences.md)
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

### Run bootstrap script

```bash
./scripts/bootstrap.sh
```

Returns JSON:
```json
{
  "phase": "interview|planning|execution|cleanup|unknown",
  "reason": "Brief explanation",
  "directory_created": "yes|no",
  "files": {
    "status": "exists|missing",
    "status_content": "...",
    "full_spec": "exists|missing",
    "tasks": "exists|missing",
    "checks": "exists|missing",
    "session_log": "exists|missing"
  }
}
```

The script handles:
1. Creating `current/` directory if it doesn't exist
2. Reading `.status` file if present
3. Checking for existence of key files
4. Determining current phase based on the detection logic in `prompts/bootstrap.md`

**Phase actions (MANDATORY - follow exactly):**

| Phase | Action | First Step |
|-------|--------|------------|
| `interview` | Run interview phase | Spawn `interview_generate` subagent |
| `planning` | Run planning phase | Spawn `planning_verification_generate` subagent |
| `execution` | Run execution | Run `dispatcher.py`, spawn execution subagents |
| `cleanup` | Run wrapup scripts | Run `status.sh complete` then `archive.sh` |
| `investigate` | Run investigation | Spawn investigation subagent (Opus) |
| `investigate_complete` | Present report | Show findings, offer fixes |
| `verify` | Run verification | Run `verify_scan.sh`, spawn verification subagent |
| `verify_complete` | Present report | Show failures, offer fixes |
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

## Interview Phase (Iterative Loop)

When the phase is Interview, use an iterative loop that **continues until the user explicitly requests to move to planning**.

**CRITICAL: Your FIRST action in interview phase MUST be spawning `interview_generate`. Do NOT:**
- Read user project files (referee.tex, draft.tex, data files, etc.)
- Start analyzing the user's request yourself
- Spawn generic Task agents to "explore" or "create tables"

The interview_generate subagent handles all codebase exploration. Pass the user's request to it as context.

### Interview Loop

```
WHILE user has not selected "Move to planning":
    1. Spawn interview_generate subagent (generates clarifying questions)
       - Pass user's original request as context
       - Subagent reads files, explores codebase, generates questions
    2. Present questions to user via AskUserQuestion
    3. Spawn interview_process subagent (updates full_spec.md)
    4. Present spec summary to user
    5. Ask user what they want to do (AskUserQuestion)
       - IF "Move to planning" → update status, exit loop
       - IF "Continue interview" → loop again with more questions
       - IF "Show full spec" → display full_spec.md, loop again
```

### Step 1: Spawn interview_generate subagent

```
Task: [econ_ra:interview:generate] Explore codebase and generate questions (round N)
model: "sonnet"
subagent_type: "Explore"

Instructions:
Read prompts/interview_generate.md for full instructions.

Context:
- User's project spec: [paste spec content here, or reference current/spec.md]
- Preferences file: preferences.md
- Interview round: [N]
- Prior clarifications: [if round > 1, paste current full_spec.md content]
- Prior Q&A: [if round > 1, paste questions and answers from previous rounds]

Your job:
1. IF round 1: Explore the codebase (directory structure, scripts, data files)
   ELSE: Skip exploration, use prior codebase_summary
2. Analyze spec for ambiguities NOT yet resolved by prior clarifications
3. Generate 3-7 targeted questions (fewer in later rounds, more specific)
4. Return codebase summary (round 1 only) + questions

Return format: Codebase summary + structured questions ready to present to user.
```

### Step 2: Present questions to user using AskUserQuestion

Display the codebase summary (first round), then use the **AskUserQuestion tool** to present questions interactively.

### Step 3: Spawn interview_process subagent (Haiku)

```
Task: [econ_ra:interview:process] Process user answers (round N)
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read prompts/interview_process.md for full instructions.

Context:
- Original spec: [content]
- Codebase summary: [from generate step or prior round]
- Questions asked: [from generate step]
- User answers: [collected responses]
- Prior full spec: [if round > 1, paste existing full_spec.md]
- Interview round: [N]

Your job:
1. Parse user answers
2. Merge with prior full spec (if any)
3. Identify remaining ambiguities that could affect implementation
4. Write/update current/full_spec.md
5. Write current/codebase_summary.md (round 1 only)
6. Copy spec to current/spec.md (round 1 only)
7. Return: { status, ambiguities: [...], preferences: [...], spec_summary: "..." }

Note: Do NOT commit internal workflow files (they are in .claude/ which is typically gitignored).
Note: Do NOT update status to "planning" - the orchestrator handles this after user confirmation.
```

### Step 4: Ask User Before Proceeding

After interview_process returns the spec summary, use AskUserQuestion:

```json
{
  "header": "Spec review",
  "question": "I've updated the project specification based on your answers. What would you like to do?",
  "multiSelect": false,
  "options": [
    {"label": "Move to planning (Recommended)", "description": "Spec is complete - generate the task list"},
    {"label": "Continue interview", "description": "Ask more clarifying questions about the project"},
    {"label": "Show full spec", "description": "Display the full specification for review"}
  ]
}
```

**If user selects "Move to planning":**
1. Update status: `echo "planning" > current/.status`
2. Proceed to Planning Phase

**If user selects "Continue interview":**
1. Loop back to Step 1 with round N+1

**If user selects "Show full spec":**
1. Read and display `current/full_spec.md`
2. Ask the same question again

### Key files created by Interview phase
- `spec.md` - Original user spec (preserved unchanged)
- `full_spec.md` - Consolidated specification with all clarifications, concerns, tradeoffs
- `codebase_summary.md` - Directory structure, scripts, data files

## Planning & Verification Phase (Two-Subagent Pattern)

When the phase is Planning, use the generate → interact → process pattern.

### Step 1: Spawn planning_verification_generate subagent

```
Task: [econ_ra:planning:generate] Generate task list and verification checks
model: "sonnet"
subagent_type: "Plan"

Instructions:
Read prompts/planning_verification_generate.md for full instructions.

Context:
- Full spec: current/full_spec.md
- Preferences: preferences.md

Your job:
1. Analyze the spec and clarifications
2. Create an abstract task list (describe WHAT, not WHERE)
3. Design verification checks for each task (technical + economic sense)
4. Identify thresholds needing user input
5. Return proposal with tasks, checks, and threshold questions (do NOT write files)
```

### Step 2: Task List Iteration Loop

**Loop until user requests execution:**

```
WHILE user has not selected "Move to execution":
    1. Output the full task list to user (table on first pass, full tasks.json after revisions)
    2. Ask user what they want to do next (AskUserQuestion)
    3. IF "Move to execution" → proceed to Step 3
       IF "Request changes" → collect feedback, re-spawn planning_verification_generate,
                              write revised tasks to tasks.json, output full tasks.json, loop
       IF "Show full spec" → display full_spec.md, loop
```

**CRITICAL: You MUST output the full task list to the user BEFORE calling AskUserQuestion.**

The user needs to see every task in the proposal, not just a count or summary. This is the orchestrator's responsibility—output the table directly as text in your response.

**Process:**
1. **Output the task table as text** — Copy the entire task table from the subagent's return and output it directly:
   ```
   ## Proposed Task List

   **Project:** [project name from proposal]

   | # | Task | Type | Depends On |
   |---|------|------|------------|
   | 1 | Load QCEW data from data/raw/qcew.dta, verify structure | code | - |
   | 2 | Load minimum wage data from data/raw/state_mw.csv | code | - |
   | 3 | Merge QCEW with MW data on state-quarter | code | 1, 2 |
   ...

   Total: [N] tasks
   ```

2. **Then use AskUserQuestion** for task list review:
   ```json
   {
     "header": "Task list",
     "question": "Review the task list above. What would you like to do?",
     "multiSelect": false,
     "options": [
       {"label": "Move to execution (Recommended)", "description": "Task list is complete - start working on tasks"},
       {"label": "Request changes", "description": "I want to modify, add, remove, or split tasks"},
       {"label": "Show full spec", "description": "Display the full project specification for reference"}
     ]
   }
   ```

3. **If user selects "Request changes":**
   - Ask: "What changes would you like?" (free text via AskUserQuestion with Other)
   - Re-spawn planning_verification_generate with revision context:
     ```
     Previous proposal: [paste prior task list]
     User feedback: [their requested changes]
     ```
   - **Write the revised task list to `current/tasks.json`** — Parse the subagent's revised task table and write it as JSON:
     ```json
     {
       "project": "Project name",
       "created": "2024-01-15T10:30:00Z",
       "tasks": [
         {"id": 1, "task": "...", "type": "code", "depends_on": [], "status": "pending", "notes": ""},
         {"id": 2, "task": "...", "type": "code", "depends_on": [1], "status": "pending", "notes": ""}
       ]
     }
     ```
   - **Output the ENTIRE `tasks.json` contents** to the user — show the full JSON, not a summary:
     ```
     ## Updated tasks.json

     [paste the complete JSON file contents here]

     Total: N tasks
     ```
   - Loop again with AskUserQuestion

4. **If user selects "Show full spec":**
   - Read and display `current/full_spec.md`
   - Ask the same question again

5. **If user selects "Move to execution":**
   - Use AskUserQuestion for threshold questions (from subagent JSON)
   - Update status: `echo "execution" > current/.status`
   - Proceed to Step 3

**DO NOT:**
- Summarize the tasks as "15 tasks across 3 phases" without showing them
- Skip outputting the table because it's "in the subagent's return"
- Assume the user can see subagent output (they cannot)
- Auto-proceed to execution without user explicitly selecting "Move to execution"
- After processing user feedback, fail to write the revised tasks to `tasks.json`
- After revisions, output only a summary instead of the full `tasks.json` contents

### Step 3: Spawn planning_verification_process subagent (Haiku)

```
Task: [econ_ra:planning:process] Process approved proposal
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read prompts/planning_verification_process.md for full instructions.

Context:
- Approved task list: [paste the approved task table]
- Proposed checks: [paste the checks with threshold placeholders]
- Threshold questions: [paste the questions]
- User threshold answers: [collected responses]

Your job:
1. Parse the approved task list
2. Write current/tasks.json
3. Resolve thresholds and write current/checks.md
4. Return status

Note: Do NOT commit internal workflow files (they are in .claude/ which is typically gitignored).
Note: Do NOT update status to "execution" - the orchestrator handles this after user confirms "Move to execution".
```

## Execution Phase (Parallel by Default)

During execution, use the dispatcher script to find ready tasks, then spawn execution subagents. The script is faster and cheaper than spawning a haiku subagent.

### Run dispatcher script

```bash
python3 ./scripts/dispatcher.py              # Parallel mode (all ready tasks) - DEFAULT
python3 ./scripts/dispatcher.py --sequential # Sequential mode (first ready task only)
```

Returns JSON:
```json
{
  "ready_tasks": [
    {"id": 3, "task": "Description", "type": "code", "depends_on": [1, 2]},
    {"id": 5, "task": "Description", "type": "analysis", "depends_on": []}
  ],
  "counts": {
    "complete": 2,
    "flagged": 0,
    "blocked": 0,
    "pending": 3,
    "partial": 0,
    "total": 5
  }
}
```

### Model Selection for Execution Tasks

Select model based on task complexity (three tiers):

**Use Haiku ($0.25/task) for:**
- Data loading and basic filtering
- Simple merges (left/inner join on 1-2 keys)
- Descriptive statistics (mean, SD, counts)
- File I/O operations
- Table formatting (given results)

**Use Sonnet ($2/task) for:**
- Standard estimation (OLS, DiD, IV, RD, panel methods)
- Standard robustness checks
- Event studies
- Bootstrap or simulation (standard methods)
- Figure generation with analysis
- Writing tasks (draft text, interpret results)

**Use Opus ($6/task) for:**
- Novel/complex structural estimation
- Non-standard or custom methods
- Difficult debugging (convergence issues, numerical instability)
- Tasks requiring deep economic reasoning
- First-time implementations of new approaches

**Implementation in orchestrator:**
When spawning execution subagent, inspect task description:

```python
simple_keywords = ['load', 'filter', 'save', 'merge on', 'format table',
                   'descriptive statistics', 'summary stats']

complex_keywords = ['structural', 'novel', 'custom', 'debug convergence',
                    'non-standard', 'new method', 'first-time']

if any(keyword in task['task'].lower() for keyword in simple_keywords):
    model = 'haiku'
elif any(keyword in task['task'].lower() for keyword in complex_keywords):
    model = 'opus'
else:
    model = 'sonnet'  # Default to Sonnet for standard work
```

Pass model to Task tool: `model="haiku"`, `model="sonnet"`, or `model="opus"`

---

### Spawn execution subagent(s)

```
Task: [econ_ra:task{id}] Execute task {id} - "{task.task}"
model: (dynamic — see Model Selection for Execution Tasks above)
subagent_type: "general-purpose"

Instructions:
Read prompts/execution.md for full instructions.

Context:
- Task: {task.task}
- Checks: [relevant checks from checks.md for this task]
- Continuation: {task.continuation OR "Starting fresh"}

Your job:
1. IF continuation provided: Review progress, continue from where left off
   ELSE: Find relevant code files, start fresh
2. Implement the task (or remaining portion)
3. Verify against checks
4. Update tasks.json (your entry only)
5. Append to session_log.md
6. Commit user's project code changes: [econ_ra:task{id}] Brief description, key results
7. Return status: complete/flagged/blocked/partial

Note: Only commit code changes to the user's project. Do NOT commit internal workflow files (tasks.json, session_log.md, etc.) - they are in .claude/ which is typically gitignored.
```

**CRITICAL: After all tasks complete, you MUST run the wrapup scripts (status.sh + archive.sh).** Do NOT just output a summary and stop. Spawn a wrapup subagent only if you need a detailed retrospective or have flagged/blocked items to analyze.

## Wrapup Phase (Script + Subagent)

When all tasks have terminal status (complete/flagged/blocked), use the archive script for file operations and optionally spawn a subagent for retrospective creation.

### Step 1: Set status to complete

```bash
./scripts/status.sh complete
```

### Step 2: Archive to history

```bash
./scripts/archive.sh
```

Returns JSON:
```json
{
  "archived": true,
  "archive_path": "/path/to/history/2025-01-05_project_name",
  "archive_name": "2025-01-05_project_name",
  "project_name": "project_name",
  "date": "2025-01-05",
  "counts": {"complete": 10, "flagged": 1, "blocked": 0, "pending": 0, "partial": 0}
}
```

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
2. Identify lessons for preferences.md
3. Return flagged/blocked item details with severity
```

For simple projects with no flagged/blocked items, you can skip the subagent. Do NOT commit internal workflow files (they are in .claude/ which is typically gitignored).

## Reset (Clear for New Project)

When the user says "reset", "clear", "start fresh", or "new project":

1. Check if current/ exists
2. IF current/ exists AND has content:
   - Ask user: "Archive current project before clearing, or discard?"
3. Archive or discard as requested, then confirm ready for new project

---

## Session State Persistence

Every econ_ra session (any mode) saves state to `$WORK_DIR/project_state.md` at wrapup. This file persists across sessions and archives, enabling continuity.

### How It Works

1. **Auto-save at wrapup:** The wrapup subagent writes/updates `project_state.md` (Step 3.5 in wrapup.md). Contents include: current status, what was accomplished, what failed, what was tried, open questions, key files modified, and a session history table.

2. **project_state.md lives at `$WORK_DIR/project_state.md`** — NOT inside `current/`. The `current/` directory gets archived to `history/` on wrapup, but the state file persists so the next session can find it.

3. **State accumulates:** Each session appends a row to the session history table and updates the status sections.

### Enhanced `/econ_ra continue` Semantics

When the user invokes `/econ_ra continue`:

1. **Run `bootstrap.sh` as normal** — check for active `current/` project
2. **If `current/` has an active project:** Resume normally (existing behavior)
3. **If no active project but `project_state.md` exists:**
   - Run `./scripts/state.sh check` to read state summary
   - Run `./scripts/state.sh read` to get full contents
   - Present the project state summary to the user
   - Use AskUserQuestion:
     ```json
     {
       "header": "Resume",
       "question": "Found state from your last session. What would you like to do?",
       "multiSelect": false,
       "options": [
         {"label": "Resume open items (Recommended)", "description": "Continue working on unfinished items from last session"},
         {"label": "Start related task", "description": "New task in the same project context"},
         {"label": "Full new project", "description": "Start fresh (state file will be archived)"}
       ]
     }
     ```
   - **If "Resume open items":** Extract open items from state file, create a spec from them, proceed to interview (abbreviated — skip codebase exploration since state file has context)
   - **If "Start related task":** Proceed to interview with state file as context (subagent reads it for background)
   - **If "Full new project":** Archive state file to `history/`, proceed as new project

4. **If no active project and no project_state.md:** Start new project (existing behavior)

### Bootstrap Integration

The bootstrap script checks for `project_state.md` and reports its existence:

```bash
./scripts/state.sh check
```

Returns JSON with `exists`, `status`, `last_session`, `open_items` count.

---

## Diagnostic Mode

Diagnostic mode is for **iterative problem-solving** when the user has a problem but doesn't know how to fix it. Unlike the standard workflow (which executes a known sequence of tasks), diagnostic mode uses a Try-Ingest-Brainstorm-Select loop.

### When to Use Diagnostic Mode

Use diagnostic mode when the user:
- Has a problem they can't solve (e.g., "my IV is weak", "results don't make sense")
- Needs economically-grounded brainstorming, not just statistical fixes
- Wants iterative exploration with checkpoints

### Invocation

```
/econ_ra diagnose "my IV is weak"           # Start with problem statement
/econ_ra diagnose                           # Start with interview
/econ_ra continue                           # Resume diagnostic loop
```

**Auto-detection:** If bootstrap shows `diagnostic_state.json` exists, the project is in diagnostic mode.

### Architecture

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

### Model Routing for Diagnostic Mode

| Step | Model | Rationale |
|------|-------|-----------|
| Diagnostic interview | **Sonnet** | Domain knowledge for problem scoping |
| Brainstorm (all iterations) | **Opus + extended thinking** | Deep reasoning for hypothesis generation |
| Execute/try | **Haiku** | Cheap execution of well-defined tests |
| Ingest results | **Haiku** | Parse findings into structured format |

### Stopping Conditions

1. **Resolved**: Hypothesis confirmed and problem has a clear fix
2. **Max iterations**: Default 10 (configurable)
3. **User checkpoint**: Every 3 iterations (configurable)
4. **Stagnation**: Two consecutive inconclusive results

### Diagnostic Interview Phase

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
- Preferences: preferences.md

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

### Brainstorm Phase (Opus + Extended Thinking)

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

### Selection Phase

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

### Try Phase (Haiku)

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

### Stopping & Checkpoints

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

### Diagnostic Wrapup

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

### Diagnostic State File

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

### Example Flow: "My IV is Weak"

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

**Brainstorm 2** (Opus): Reads findings. First-stage is 23 for manufacturing, 4 for services. Confirms hypothesis 1 was partially right—instrument is weak in services.

Proposes refinement: restrict sample to manufacturing, or find a better instrument for services.

**Try 2** (Haiku): Restricts to manufacturing, re-runs IV.

**Result**: First-stage F = 23, coefficient now has expected negative sign and reasonable magnitude.

**Wrapup**: "Problem was weak instrument in services sector. Fix: restrict to manufacturing where instrument has bite. This is economically justified because service firms adjust through hours, not headcount."

---

## Investigate Mode

Investigate mode is for **autonomous exploration** when the user has a question about their project ("why don't my welfare numbers add up?") or wants a general consistency scan. Unlike diagnostic mode (iterative hypothesis testing with user checkpoints), investigate mode is a single read-only pass that produces a report.

### When to Use Investigate Mode

Use investigate mode when the user:
- Has a specific question about their code or results
- Wants to understand what normalization or methodology is used
- Wants a general scan for issues before submitting a paper
- Needs a code path trace from data to output

**Investigate vs. Diagnose:** Investigate is read-only and produces a report. Diagnose is interactive and tries fixes.

### Invocation

```
/econ_ra investigate "why are my welfare numbers negative"   # With question
/econ_ra investigate                                        # Open-ended scan
```

### Architecture

```
[START] → [BOOTSTRAP] → set status "investigate"
                              ↓
                    [SPAWN INVESTIGATION SUBAGENT (Opus)]
                    - Reads code, outputs, LaTeX, scalars
                    - Traces computation paths
                    - Cross-references values
                    - Checks economic sense
                              ↓
                    [SAVE investigation_report.md]
                              ↓
                    [PRESENT FINDINGS TO USER]
                              ↓
                    "Want me to fix any issues found?"
                         ↓              ↓
                    [YES: quick-run]  [NO: done]
```

### Orchestrator Protocol

1. **Run bootstrap.sh** to check for existing `current/` state

2. **Set status:**
   ```bash
   ./scripts/status.sh investigate
   ```

3. **Spawn investigation subagent (Opus):**
   ```
   Task: [econ_ra:investigate] Investigate: "[user's question]"
   model: "opus"
   subagent_type: "general-purpose"

   Instructions:
   Read prompts/investigate.md for full instructions.

   Context:
   - Question: [user's question, or "General consistency scan"]
   - Project state: [project_state.md contents if exists]
   - Codebase summary: [current/codebase_summary.md if exists]
   - Preferences: preferences.md

   Your job:
   1. Explore the project end-to-end (orientation → focused → cross-reference)
   2. Trace computation paths relevant to the question
   3. Check consistency across code, outputs, scalars, and LaTeX
   4. Produce a structured investigation_report.md
   5. Do NOT modify any files
   ```

4. **Save report:** Write the subagent's output to `current/investigation_report.md`

5. **Set status:**
   ```bash
   ./scripts/status.sh investigate_complete
   ```

6. **Present findings to user:** Show the executive summary and top issues from the report

7. **Offer fixes:** Use AskUserQuestion:
   ```json
   {
     "header": "Fix issues",
     "question": "Investigation found [N] issues. Would you like me to fix any?",
     "multiSelect": false,
     "options": [
       {"label": "Fix HIGH severity issues", "description": "Spawn execution subagents for critical fixes"},
       {"label": "Fix all issues", "description": "Address all findings from the report"},
       {"label": "No fixes needed", "description": "I'll handle this myself"}
     ]
   }
   ```

8. **If fixes requested:** For each fix, create a lightweight execution task (no full interview/planning cycle). Spawn execution subagents directly with the fix instructions from the report. Update project_state.md at completion.

9. **Wrapup:** Archive investigation report, update project_state.md.

### Model Selection

| Step | Model | Rationale |
|------|-------|-----------|
| Investigation subagent | **Opus** | Needs cross-file reasoning and economic understanding |

---

## Verify Mode

Verify mode performs **systematic cross-reference checking** across code outputs, scalar files, and LaTeX documents. It catches number hallucination, stale values, notation drift, and unsupported claims.

### When to Use Verify Mode

Use verify mode when the user:
- Is about to submit a paper and wants a final consistency check
- Has edited LaTeX and wants to make sure numbers still match
- Wants to check that referee response claims are backed by the manuscript
- Has regenerated results and wants to verify LaTeX is up to date

**Verify vs. Investigate:** Verify is systematic checking with pass/fail results. Investigate is exploratory analysis.

### Invocation

```
/econ_ra verify                   # Full cross-reference check (all categories)
/econ_ra verify --numbers         # Code outputs vs scalar files vs LaTeX prose
/econ_ra verify --notation        # Symbol consistency across .tex files
/econ_ra verify --claims          # Referee response claims vs manuscript support
```

### Architecture

```
[START] → [BOOTSTRAP] → set status "verify"
                              ↓
                    [RUN verify_scan.sh]
                    - Extracts .tex files, scalar files
                    - Finds code output writers
                    - Locates output directories
                    - Identifies referee response files
                              ↓
                    [SPAWN VERIFICATION SUBAGENT (Sonnet)]
                    - Reads scan results + all target files
                    - Performs systematic checks per category
                    - Produces verification_report.md
                              ↓
                    [PRESENT REPORT TO USER]
                              ↓
                    Per FAIL: "Want me to fix this?"
                         ↓              ↓
                    [YES: quick-run]  [NO: skip]
```

### Orchestrator Protocol

1. **Run bootstrap.sh** to check for existing `current/` state

2. **Set status:**
   ```bash
   ./scripts/status.sh verify
   ```

3. **Determine check type** from user invocation:
   - `--numbers` → check_type = "numbers"
   - `--notation` → check_type = "notation"
   - `--claims` → check_type = "claims"
   - No flag → check_type = "all"

4. **Run verify_scan.sh** to extract targets:
   ```bash
   ./scripts/verify_scan.sh [project_root]
   ```
   Returns JSON with tex_files, scalar_files, output_writers, output_directories, referee_files.

   If scan finds zero .tex files, inform user and ask for the project root directory.

5. **Spawn verification subagent (Sonnet):**
   ```
   Task: [econ_ra:verify] Verify consistency (check_type: [type])
   model: "sonnet"
   subagent_type: "general-purpose"

   Instructions:
   Read prompts/verify.md for full instructions.

   Context:
   - Check type: [numbers/notation/claims/all]
   - Scan results: [JSON from verify_scan.sh]
   - Preferences: preferences.md (especially Economic Sanity Check Library)

   Your job:
   1. Read all target files from the scan results
   2. Perform systematic checks per the requested category
   3. Produce a verification_report.md with pass/fail/warn for each check
   4. Do NOT modify any files
   ```

6. **Save report:** Write the subagent's output to `current/verification_report.md`

7. **Set status:**
   ```bash
   ./scripts/status.sh verify_complete
   ```

8. **Present report to user:** Show the summary table and all FAIL items

9. **Offer fixes per FAIL item:** For each failure, offer a quick-run fix:
   ```json
   {
     "header": "Fix issues",
     "question": "Found [N] verification failures. How should I proceed?",
     "multiSelect": false,
     "options": [
       {"label": "Fix all failures (Recommended)", "description": "Auto-fix all FAIL items"},
       {"label": "Fix one at a time", "description": "Review and approve each fix individually"},
       {"label": "No fixes", "description": "I'll fix these myself"}
     ]
   }
   ```

10. **If fixes requested:** For each fix, spawn a lightweight execution subagent (Haiku for simple scalar updates, Sonnet for notation fixes). Update project_state.md at completion.

11. **Wrapup:** Archive verification report, update project_state.md.

### Model Selection

| Step | Model | Rationale |
|------|-------|-----------|
| verify_scan.sh | **script** | File system scanning, no LLM needed |
| Verification subagent | **Sonnet** | Systematic checking, doesn't need deep reasoning |
| Fix subagents | **Haiku/Sonnet** | Simple fixes use Haiku; notation fixes use Sonnet |

---

## Model Selection & Scripts

Some operations are now handled by scripts instead of LLM subagents for faster execution and lower cost:

| Operation | Type | Subagent Type | Rationale |
|-----------|------|---------------|-----------|
| **bootstrap** | **script** | — | `./scripts/bootstrap.sh` - Pure file/directory checks |
| **task_dispatcher** | **script** | — | `./scripts/dispatcher.py` - JSON parsing for ready tasks |
| **archive** | **script** | — | `./scripts/archive.sh` - File operations for wrapup |
| **status** | **script** | — | `./scripts/status.sh` - Get/set status file |
| **diagnostic_loop** | **script** | — | `./scripts/diagnostic_loop.sh` - Track diagnostic iterations, check stopping |
| interview_generate | subagent (sonnet) | Explore | Reads codebase, no file writes |
| **interview_process** | **subagent (haiku)** | general-purpose | Writes full_spec.md |
| planning_verification_generate | subagent (sonnet) | Plan | Designs task list, no file writes |
| **planning_verification_process** | **subagent (haiku)** | general-purpose | Writes tasks.json, checks.md |
| execution tasks | subagent (dynamic) | general-purpose | Full tool access for code changes |
| **wrapup** (retrospective) | **subagent (haiku)** | general-purpose | Writes retrospective |
| **diagnostic_interview** | **subagent (sonnet)** | Explore | Explores codebase, no file writes |
| **diagnostic_thinker** | **subagent (opus)** | Plan | Deep reasoning, no file writes |
| **diagnostic_executor** | **subagent (haiku)** | general-purpose | Writes findings files |
| **investigation** | **subagent (opus)** | general-purpose | Cross-file reasoning, no file writes |
| **verify_scan** | **script** | — | `./scripts/verify_scan.sh` - Extract .tex, scalar, output files |
| **verification** | **subagent (sonnet)** | general-purpose | Systematic checks, no file writes |
| **state** | **script** | — | `./scripts/state.sh` - Session state persistence |

## Memory Integration

The skill uses a dual-memory pattern:

**`preferences.md` (skill-specific):** Domain research preferences accumulated across projects — clustering defaults, preferred estimators, data handling conventions, output format preferences. Read by subagents at the start of each phase. Updated by the wrapup subagent when new preferences are identified.

**`MEMORY.md` (project-level):** Meta-knowledge about using econ_ra effectively — orchestrator debugging notes, common failure modes, workflow optimizations. Lives in the Claude Code auto-memory directory. Updated by the orchestrator (not subagents) when patterns emerge across projects.

| Memory | Scope | Updated by | Read by |
|--------|-------|------------|---------|
| `preferences.md` | Research domain | Wrapup subagent | All subagents |
| `MEMORY.md` | Tool/workflow | Orchestrator | Orchestrator |

## Files

### Working Directory Configuration

The working directory (where `current/` and `history/` are created) is configurable:

1. **Environment variable**: Set `ECON_RA_WORKDIR` to an absolute path
2. **Default**: `$PWD/econ_ra_work/` (project-local, visible)

This allows the skill to work across different machines and projects:
- On server: `export ECON_RA_WORKDIR=/data/projects/myproject/econ_ra_work`
- Locally: Just run from your project directory, files go to `./econ_ra_work/`

### Directory Structure

```
# Skill directory (where SKILL.md lives)
econ_ra/
├── SKILL.md                          # This orchestrator
├── preferences.md                    # Accumulated user preferences
├── scripts/                          # Automation scripts
│   ├── bootstrap.sh                  # Phase detection
│   ├── dispatcher.py                 # Find ready tasks
│   ├── archive.sh                    # Archive to history
│   ├── status.sh                     # Get/set status
│   ├── task_ops.sh                   # Atomic task state operations
│   ├── diagnostic_loop.sh            # Diagnostic iteration tracking
│   ├── state.sh                      # Session state persistence (read/check/init)
│   └── verify_scan.sh                # Extract verification targets from project
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
│   ├── investigate.md                # Investigation subagent prompt
│   └── verify.md                     # Verification subagent prompt
├── templates/                        # Project templates
└── references/                       # Reference materials

# Working directory ($ECON_RA_WORKDIR or $PWD/econ_ra_work/)
econ_ra_work/
├── project_state.md                  # Session continuity (persists across archives)
├── current/                          # Active project
│   ├── .status                       # Current phase status
│   ├── spec.md                       # Original user spec (preserved)
│   ├── full_spec.md                  # Consolidated specification
│   ├── codebase_summary.md           # Directory structure, scripts, data
│   ├── tasks.json
│   ├── checks.md
│   ├── session_log.md
│   ├── diagnostic_state.json         # Diagnostic mode state (if in diagnostic)
│   └── findings/                      # Diagnostic test results
│       └── iteration_N_*.md           # Findings from each hypothesis test
└── history/                          # Archived projects
    └── YYYY-MM-DD_project_name/
```

For detailed phase instructions, see the files in `prompts/`:
- [bootstrap.md](prompts/bootstrap.md)
- [interview_generate.md](prompts/interview_generate.md)
- [interview_process.md](prompts/interview_process.md)
- [planning_verification_generate.md](prompts/planning_verification_generate.md)
- [planning_verification_process.md](prompts/planning_verification_process.md)
- [task_dispatcher.md](prompts/task_dispatcher.md)
- [execution.md](prompts/execution.md)
- [wrapup.md](prompts/wrapup.md)
- [diagnostic_interview.md](prompts/diagnostic_interview.md)
- [diagnostic_thinker.md](prompts/diagnostic_thinker.md)
- [diagnostic_executor.md](prompts/diagnostic_executor.md)
- [investigate.md](prompts/investigate.md)
- [verify.md](prompts/verify.md)
