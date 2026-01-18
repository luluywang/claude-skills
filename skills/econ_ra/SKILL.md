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

### MANDATORY: Always Complete the Workflow

**After all tasks reach terminal status (complete/flagged/blocked), you MUST spawn the wrapup subagent.**
- Do NOT just output a summary and stop
- Do NOT consider the project "done" until wrapup has archived to history/
- The wrapup subagent handles archival, retrospective creation, and cleanup

### The orchestrator CAN:
- Read files to detect phase and state
- Spawn subagents with appropriate context
- Present questions to users and collect answers
- Update `.status` files
- Update `preferences.md` (only after a subagent recommends it)
- Verify commits via `git log`

### The orchestrator MUST NOT:
- **Write or modify code files** — only execution subagents do this
- **Write full_spec.md** — interview_process subagent writes this
- **Write checks.md** — verification_process subagent writes this
- **Run data analysis or scripts** — execution subagents do this
- **Explore the codebase** — execution subagents do this
- **Make commits for code changes** — subagents commit their own work

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

**Phase actions:**
- `interview` → Run interview phase
- `planning` → Run planning phase
- `execution` → Check time limit, then run execution
- `paused` → Prompt user to extend time or stop (see "Resume After Time Limit")
- `cleanup` → Run wrapup scripts
- `unknown` → Ask user for clarification

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

## Interview Phase (Multi-Round Loop)

When the phase is Interview, use an iterative loop that continues until ambiguities are resolved.

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
7. IF no remaining ambiguities:
   - Write status: echo "planning" > current/.status
   - Commit: [econ_ra:interview] Full spec complete (N rounds)
8. Return: { status, ambiguities: [...], preferences: [...] }
```

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

### Step 2: Present proposal to user using AskUserQuestion

Display the proposed task list and verification checks, then use AskUserQuestion for thresholds and approval.

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
4. Write status: echo "execution" > current/.status
5. Commit: [econ_ra:planning] Task list and checks created (N tasks)
6. Return status
```

## Execution Phase (Sequential by Default)

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
python3 ./scripts/dispatcher.py              # Sequential mode (first ready task only) - DEFAULT
python3 ./scripts/dispatcher.py --parallel   # Parallel mode (all ready tasks) - use with git worktrees
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
6. Commit: [econ_ra:task{id}] Brief description, key results
7. Return status: complete/flagged/blocked/partial
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

For simple projects with no flagged/blocked items, you can skip the subagent and just commit:
```
[econ_ra:complete] Project archived to history/YYYY-MM-DD_project_name
```

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

## Model Selection & Scripts

Some operations are now handled by scripts instead of LLM subagents for faster execution and lower cost:

| Operation | Type | Rationale |
|-----------|------|-----------|
| **bootstrap** | **script** | `./scripts/bootstrap.sh` - Pure file/directory checks |
| **task_dispatcher** | **script** | `./scripts/dispatcher.py` - JSON parsing for ready tasks |
| **archive** | **script** | `./scripts/archive.sh` - File operations for wrapup |
| **status** | **script** | `./scripts/status.sh` - Get/set status file |
| **time_limit** | **script** | `./scripts/time_limit.sh` - Track execution time, pause when exceeded |
| interview_generate | subagent (default) | Needs domain knowledge for question design |
| **interview_process** | **subagent (haiku)** | Structured parsing only |
| planning_verification_generate | subagent (default) | Needs domain + technical expertise |
| **planning_verification_process** | **subagent (haiku)** | Structured parsing only |
| execution tasks | subagent (default) | Full code understanding required |
| **wrapup** (retrospective) | **subagent (haiku)** | Summarizes session log, optional |

## Files

All paths are relative to this skill directory (`.claude/skills/econ_ra/`):

```
./                                    # Skill directory
├── SKILL.md                          # This orchestrator
├── preferences.md                    # Accumulated user preferences
├── scripts/                          # Automation scripts (faster than subagents)
│   ├── bootstrap.sh                  # Phase detection
│   ├── dispatcher.py                 # Find ready tasks
│   ├── archive.sh                    # Archive to history
│   ├── status.sh                     # Get/set status
│   └── time_limit.sh                 # Execution time tracking
├── prompts/                          # Phase instructions (for subagents)
│   ├── bootstrap.md                  # (reference only, use script)
│   ├── interview_generate.md
│   ├── interview_process.md
│   ├── planning_verification_generate.md
│   ├── planning_verification_process.md
│   ├── task_dispatcher.md            # (reference only, use script)
│   ├── execution.md
│   └── wrapup.md
├── templates/                        # Project templates
├── current/                          # Active project
│   ├── .status                       # Current phase status
│   ├── .time_limit                   # Execution time tracking
│   ├── spec.md                       # Original user spec (preserved)
│   ├── full_spec.md                  # Consolidated specification
│   ├── codebase_summary.md           # Directory structure, scripts, data
│   ├── tasks.json
│   ├── checks.md
│   └── session_log.md
└── history/                          # Archived projects
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
