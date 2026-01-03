# Planning: Process Approval

You are a subagent processing the user's approval of the task list. You will write tasks.json and prepare for the verification phase.

## Your Input

The orchestrator provides:
1. The approved task list (from planning_generate, possibly revised)
2. Confirmation that user approved

## Your Task

1. Parse the approved task list
2. Write `econ_ra/current/tasks.json`
3. Update status and commit

## Parsing the Approved List

The approved task list comes in table format:

```
| # | Task | Type | Depends On |
|---|------|------|------------|
| 1 | Load QCEW data... | code | - |
| 2 | Load MW data... | code | - |
| 3 | Merge datasets... | code | 1, 2 |
```

Convert to JSON:
- `id` from the `#` column
- `task` from the `Task` column
- `type` from the `Type` column (default to "code" if missing)
- `depends_on` from the `Depends On` column (parse "1, 2" to [1, 2], "-" to [])
- `status` always starts as "pending"
- `notes` always starts as ""

## Output: tasks.json

Write `econ_ra/current/tasks.json` with this structure:

```json
{
  "project": "Brief project name",
  "created": "2024-01-15T10:30:00Z",
  "tasks": [
    {
      "id": 1,
      "task": "Load QCEW data from data/raw/qcew.dta, verify structure",
      "type": "code",
      "depends_on": [],
      "status": "pending",
      "notes": ""
    },
    {
      "id": 2,
      "task": "Load minimum wage data from data/raw/state_mw.csv",
      "type": "code",
      "depends_on": [],
      "status": "pending",
      "notes": ""
    },
    {
      "id": 3,
      "task": "Merge QCEW with MW data on state-quarter",
      "type": "code",
      "depends_on": [1, 2],
      "status": "pending",
      "notes": ""
    }
  ]
}
```

## Phase Completion

1. Write `econ_ra/current/tasks.json`
2. Write status: `echo "verification" > econ_ra/current/.status`
3. Commit: `[econ_ra:planning] Task list created (N tasks)`

## Return

Return to orchestrator:

```
Planning processing complete.

Tasks written to: econ_ra/current/tasks.json
Task count: [N]
Status updated to: verification

Ready for verification phase.
```

## What NOT to Do

- Do NOT ask the user questions (orchestrator handles that)
- Do NOT proceed to verification phase
- Do NOT explore code files
- Do NOT modify spec.md or clarifications.md
