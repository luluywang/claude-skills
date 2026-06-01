# Planning & Verification Phase — Full Reference

When the phase is Planning, use the generate → interact → process pattern.

## Step 1: Spawn planning_verification_generate subagent

```
Task: [econ_ra:planning:generate] Generate task list and verification checks
model: "sonnet"
subagent_type: "Plan"

Instructions:
Read prompts/planning_verification_generate.md for full instructions.

Context:
- Full spec: current/full_spec.md
- Preferences: references/preferences.md

Your job:
1. Analyze the spec and clarifications
2. Create an abstract task list (describe WHAT, not WHERE)
3. Design verification checks for each task (technical + economic sense)
4. Identify thresholds needing user input
5. Return proposal with tasks, checks, and threshold questions (do NOT write files)
```

## Step 2: Task List Iteration Loop

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

The user needs to see every task in the proposal, not just a count or summary. This is the orchestrator's responsibility — output the table directly as text in your response.

### Process

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

### DO NOT

- Summarize the tasks as "15 tasks across 3 phases" without showing them
- Skip outputting the table because it's "in the subagent's return"
- Assume the user can see subagent output (they cannot)
- Auto-proceed to execution without user explicitly selecting "Move to execution"
- After processing user feedback, fail to write the revised tasks to `tasks.json`
- After revisions, output only a summary instead of the full `tasks.json` contents

## Step 3: Spawn planning_verification_process subagent (Haiku)

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
