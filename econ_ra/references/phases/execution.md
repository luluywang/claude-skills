# Execution Phase — Full Reference

During execution, use the dispatcher script to find ready tasks, then spawn execution subagents. The script is faster and cheaper than spawning a haiku subagent.

## Run dispatcher script

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

## Model Selection for Execution Tasks

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

### Implementation in orchestrator

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

## Spawn execution subagent(s)

```
Task: [econ_ra:task{id}] Execute task {id} - "{task.task}"
model: (dynamic — see Model Selection above)
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

**CRITICAL:** After all tasks complete, you MUST run the wrapup scripts (status.sh + archive.sh). Do NOT just output a summary and stop. Spawn a wrapup subagent only if you need a detailed retrospective or have flagged/blocked items to analyze.
