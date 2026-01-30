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
/econ_ra continue                          # Resume interrupted project
/econ_ra reset                             # Clear for new project
/econ_ra diagnose "my IV is weak"          # Start diagnostic mode
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

## Orchestrator Rules (Critical)

The orchestrator coordinates—it does NOT do the work itself.

### MANDATORY: Phase Protocol Enforcement

**After bootstrap returns a phase, you MUST follow the exact protocol for that phase.**

- `interview` → **IMMEDIATELY** spawn `interview_generate` subagent. Do NOT read user files first.
- `planning` → **IMMEDIATELY** spawn `planning_verification_generate` subagent.
- `execution` → Check time limit, then run dispatcher and spawn execution subagents.
- `paused` → Prompt user to extend time or stop.
- `cleanup` → Run wrapup scripts.

**NEVER** attempt to understand the user's request by reading their files yourself. The interview_generate subagent does this. Even if the user provides detailed instructions, the orchestrator's job is to route to the correct phase protocol, not to start working directly.

### MANDATORY: Always Complete the Workflow

**After all tasks reach terminal status (complete/flagged/blocked), you MUST spawn the wrapup subagent.**
- Do NOT just output a summary and stop
- Do NOT consider the project "done" until wrapup has archived to history/
- The wrapup subagent handles archival, retrospective creation, and cleanup

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

## Time Limit (Ask Once Per Project)

After bootstrap, if this is a NEW project (phase is "interview" and no `current/.time_limit` file exists), ask the user about time limits using AskUserQuestion:

```json
{
  "header": "Time limit",
  "question": "How long should the RA work before pausing for your review?",
  "multiSelect": false,
  "options": [
    {"label": "1 hour", "description": "Short session - good for quick tasks or when you want frequent check-ins"},
    {"label": "3 hours (Recommended)", "description": "Standard session - enough time for most analyses"},
    {"label": "No limit", "description": "Run until all tasks complete - you'll check back when done"}
  ]
}
```

After the user answers, record the start time and limit:
```bash
./scripts/time_limit.sh set [1|3|infinite|N]  # N = custom hours
```

This creates `current/.time_limit` with:
```json
{
  "start_time": "2025-01-05T10:30:00",
  "limit_hours": 3,
  "limit_type": "3 hours"
}
```

**Important:** The time limit applies to EXECUTION phase only (not interview/planning). The clock starts when execution begins, not when the project starts.

Returns JSON:
```json
{
  "phase": "interview|planning|execution|paused|cleanup|unknown",
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
| `execution` | Check time limit, run execution | Run `dispatcher.py`, spawn execution subagents |
| `paused` | Prompt user to extend | Use AskUserQuestion |
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
Model: haiku

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
Model: haiku

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

### Check Time Limit First

**Before spawning any execution subagent**, check if the time limit has been reached:

```bash
./scripts/time_limit.sh check
```

Returns JSON:
```json
{
  "limit_hours": 3,
  "elapsed_hours": 1.5,
  "remaining_hours": 1.5,
  "exceeded": false,
  "status": "ok"
}
```

**If `exceeded: true`**, do NOT spawn more tasks. Instead:
1. Update status to "paused": `./scripts/status.sh paused`
2. Notify the user: "Time limit reached (X hours elapsed). Y tasks complete, Z remaining. Resume with `/econ_ra continue` or extend time."
3. Stop execution and wait for user

**If `status: "ok"`**, proceed with dispatcher.

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
Model: haiku

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

## Resume After Time Limit

When the user says "continue" and the status is "paused" (from time limit):

1. Check time limit status: `./scripts/time_limit.sh check`
2. Ask user using AskUserQuestion:

```json
{
  "header": "Resume",
  "question": "Time limit was reached. How would you like to proceed?",
  "multiSelect": false,
  "options": [
    {"label": "Extend 1 hour (Recommended)", "description": "Add 1 more hour and continue execution"},
    {"label": "Extend 3 hours", "description": "Add 3 more hours for larger remaining work"},
    {"label": "Remove limit", "description": "Run until all tasks complete"},
    {"label": "Stop here", "description": "Keep current progress, don't run more tasks"}
  ]
}
```

3. If extending:
   - `./scripts/time_limit.sh extend [N]` (N = hours to add)
   - `./scripts/status.sh execution`
   - Continue with normal execution flow

4. If stopping:
   - Proceed to wrapup phase with partial results

## Reset (Clear for New Project)

When the user says "reset", "clear", "start fresh", or "new project":

1. Check if current/ exists
2. IF current/ exists AND has content:
   - Ask user: "Archive current project before clearing, or discard?"
3. Archive or discard as requested, then confirm ready for new project

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
Model: opus

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
Model: haiku

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

## Model Selection & Scripts

Some operations are now handled by scripts instead of LLM subagents for faster execution and lower cost:

| Operation | Type | Rationale |
|-----------|------|-----------|
| **bootstrap** | **script** | `./scripts/bootstrap.sh` - Pure file/directory checks |
| **task_dispatcher** | **script** | `./scripts/dispatcher.py` - JSON parsing for ready tasks |
| **archive** | **script** | `./scripts/archive.sh` - File operations for wrapup |
| **status** | **script** | `./scripts/status.sh` - Get/set status file |
| **time_limit** | **script** | `./scripts/time_limit.sh` - Track execution time, pause when exceeded |
| **diagnostic_loop** | **script** | `./scripts/diagnostic_loop.sh` - Track diagnostic iterations, check stopping |
| interview_generate | subagent (default) | Needs domain knowledge for question design |
| **interview_process** | **subagent (haiku)** | Structured parsing only |
| planning_verification_generate | subagent (default) | Needs domain + technical expertise |
| **planning_verification_process** | **subagent (haiku)** | Structured parsing only |
| execution tasks | subagent (default) | Full code understanding required |
| **wrapup** (retrospective) | **subagent (haiku)** | Summarizes session log, optional |
| **diagnostic_interview** | **subagent (sonnet)** | Domain knowledge for problem scoping |
| **diagnostic_thinker** | **subagent (opus)** | Deep reasoning for hypothesis generation |
| **diagnostic_executor** | **subagent (haiku)** | Cheap execution of defined tests |

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
│   ├── time_limit.sh                 # Execution time tracking
│   └── diagnostic_loop.sh            # Diagnostic iteration tracking
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
│   └── diagnostic_executor.md        # Hypothesis testing (Haiku)
├── templates/                        # Project templates
└── references/                       # Reference materials

# Working directory ($ECON_RA_WORKDIR or $PWD/econ_ra_work/)
econ_ra_work/
├── current/                          # Active project
│   ├── .status                       # Current phase status
│   ├── .time_limit                   # Execution time tracking
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
