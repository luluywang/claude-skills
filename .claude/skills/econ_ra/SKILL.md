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

1. Detect current phase from `econ_ra/current/` state
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

On every invocation, spawn a lightweight bootstrap subagent to handle directory setup and phase detection.

### Spawn bootstrap subagent (Haiku)

```
Task: [econ_ra:bootstrap] Initialize and detect phase
Model: haiku

Instructions:
Read prompts/bootstrap.md for full instructions.

Context:
- User command: [paste user's invocation, e.g., "tackle @notes/project.md" or "continue"]

Your job:
1. Create econ_ra/current/ directory if it doesn't exist
2. Read .status file if present
3. Check for existence of key files (full_spec.md, tasks.json, checks.md)
4. Determine current phase
5. Return: { phase: "interview|planning|execution|wrapup|cleanup", status_details: "..." }

Do NOT write any files except creating the directory. Just detect and report.
```

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
- User's project spec: [paste spec content here, or reference econ_ra/current/spec.md]
- Preferences file: econ_ra/preferences.md
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
4. Write/update econ_ra/current/full_spec.md
5. Write econ_ra/current/codebase_summary.md (round 1 only)
6. Copy spec to econ_ra/current/spec.md (round 1 only)
7. IF no remaining ambiguities:
   - Write status: echo "planning" > econ_ra/current/.status
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
- Full spec: econ_ra/current/full_spec.md
- Preferences: econ_ra/preferences.md

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
2. Write econ_ra/current/tasks.json
3. Resolve thresholds and write econ_ra/current/checks.md
4. Write status: echo "execution" > econ_ra/current/.status
5. Commit: [econ_ra:planning] Task list and checks created (N tasks)
6. Return status
```

## Execution Phase (Parallel by Default)

During execution, use a task_dispatcher (haiku) to find ready tasks, then spawn execution subagents in parallel.

### Spawn task_dispatcher subagent (haiku)

```
Task: [econ_ra:dispatch] Find ready tasks
Model: haiku

Instructions:
Read prompts/task_dispatcher.md for full instructions.

Context:
- Mode: parallel (default) OR sequential (if --sequential flag)

Return: {ready_tasks: [...], counts: {...}}
```

### Spawn execution subagents IN PARALLEL

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

**CRITICAL: After all tasks complete, you MUST spawn the wrapup subagent.** Do NOT just output a summary and stop.

## Wrapup Phase (Subagent)

When all tasks have terminal status (complete/flagged/blocked), spawn the wrapup subagent:

```
Task: [econ_ra:wrapup] Complete project and archive

Instructions:
Read prompts/wrapup.md for full instructions.

Context:
- Tasks: econ_ra/current/tasks.json
- Session log: econ_ra/current/session_log.md
- Checks: econ_ra/current/checks.md

Your job:
1. Mark status as "complete"
2. Archive current/ to history/
3. Create retrospective.md
4. Update preferences.md if lessons learned
5. Commit: [econ_ra:complete] Project archived
6. Return status with flagged/blocked item details
```

## Reset (Clear for New Project)

When the user says "reset", "clear", "start fresh", or "new project":

1. Check if econ_ra/current/ exists
2. IF current/ exists AND has content:
   - Ask user: "Archive current project before clearing, or discard?"
3. Archive or discard as requested, then confirm ready for new project

## Model Selection

| Subagent Type | Model | Rationale |
|---------------|-------|-----------|
| **bootstrap** | **haiku** | Lightweight directory/status check only |
| interview_generate | default | Needs domain knowledge for question design |
| **interview_process** | **haiku** | Structured parsing only |
| planning_verification_generate | default | Needs domain + technical expertise |
| **planning_verification_process** | **haiku** | Structured parsing only |
| **task_dispatcher** | **haiku** | Reads tasks.json, returns ready tasks |
| execution tasks | default | Full code understanding required |
| **wrapup** | **haiku** | Summarizes session log for retrospective |

## Files

```
econ_ra/                              # Runtime data (in project root)
├── preferences.md                    # Accumulated user preferences
├── current/                          # Active project
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
