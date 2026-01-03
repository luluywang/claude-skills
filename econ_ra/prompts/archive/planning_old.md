# ARCHIVED: Planning Phase (Main Context)

> **This file is archived.** Planning now uses the two-subagent pattern:
> - `planning_generate.md` - Generate task list proposal
> - `planning_process.md` - Process user approval and write tasks.json
>
> See `master.prompt` for the updated workflow.

---

# Planning Phase

You are creating the task list. Work from spec and clarifications ONLY—do not explore code files.

**Note:** This phase runs in the main context (not as a subagent) because it's lightweight and requires user approval anyway.

## Your Context

Load ONLY:
- `econ_ra/current/spec.md` - Project description
- `econ_ra/current/clarifications.md` - Q&A from interview
- `econ_ra/preferences.md` - User's general preferences

**Do NOT load**: Code files, data files, or anything else. Stay abstract.

## Your Task

Create `econ_ra/current/tasks.json` with a task list derived from the spec.

## Critical: Stay Abstract

**Wrong approach:**
```
Read spec → Read 10 R files to understand code structure → Create tasks referencing specific functions
```

**Right approach:**
```
Read spec → Create tasks describing what to accomplish → Execution agent finds the code
```

Example:

Bad task (too specific, requires code exploration):
```json
{"task": "Modify create_four_way_table() in four_way_table.R lines 45-80 to transpose the matrix"}
```

Good task (abstract, describes outcome):
```json
{"task": "Transpose four_way_comparison tables: change from payment types as rows to payment types as columns, scenarios as rows"}
```

The execution agent will find the right files. Your job is to describe WHAT, not WHERE.

## Task Structure

```json
{
  "project": "Brief project name",
  "created": "ISO timestamp",
  "tasks": [
    {
      "id": 1,
      "task": "Specific description of what to do",
      "type": "code",
      "input": ["list", "of", "input", "files"],
      "output": "path/to/output/file",
      "depends_on": [],
      "status": "pending",
      "notes": ""
    }
  ]
}
```

## Task Types

Tag each task by type to enable appropriate context loading during execution:

| Type | Example | Execution Behavior |
|------|---------|-------------------|
| `code` | "Merge datasets on state-quarter" | Default, no extra loading |
| `analysis` | "Run regression with controls" | Default |
| `writing` | "Draft results paragraph for Table 3" | Loads writing_style.prompt |
| `table` | "Create summary statistics table" | Loads writing_style.prompt |

**Default:** If `type` is omitted, assume `code`.

## Guidelines

**Granularity**
- Each task should be 5-30 minutes of work
- "Clean the data" is too big → split into loading, merging, filtering, etc.
- "Print a number" is too small → combine with related work

**Ordering**
- Order by dependencies
- Data tasks before estimation
- Estimation before post-estimation
- Tables/figures last

**Specificity**
- Task descriptions should be unambiguous
- Include specific variable names, file paths, parameters
- Reference clarifications: "using state-level clustering as specified"

**Completeness**
- Every step from raw data to final deliverables
- Include all robustness checks mentioned
- Include all tables and figures

## Do NOT Include

- Verification criteria (that's the next phase)
- Detailed code (the execution agent writes code)
- Multiple alternatives for the same task

## Output

1. Create `econ_ra/current/tasks.json`
2. **Present task list to user for approval**
   - Display the full task list in a readable format
   - Ask: "Does this task list look right? Say 'looks good' to proceed, or suggest changes."
3. Make any requested adjustments
4. When approved, commit: `[econ_ra:planning] Task list created (N tasks)`
5. Continue to verification phase (orchestrator handles this)

## Example Task Breakdown

Bad (too vague):
```json
{"id": 1, "task": "Prepare the data"}
```

Bad (too granular):
```json
{"id": 1, "task": "Import pandas"}
```

Good:
```json
{"id": 1, "task": "Load QCEW data from data/raw/qcew.dta, verify structure: should be county-industry-quarter with ~2M rows for 2010-2019"}
{"id": 2, "task": "Load minimum wage data from data/raw/state_mw.csv, reshape to state-quarter panel"}
{"id": 3, "task": "Merge QCEW with MW data on state-quarter, verify merge rate >99%", "depends_on": [1,2]}
{"id": 4, "task": "Apply sample restrictions: drop NAICS 92 (government), drop 2020, drop counties with <100 establishments", "depends_on": [3]}
```

---

## Phase Completion

After user approves task list:

1. ✅ Write `econ_ra/current/tasks.json`
2. ✅ Write status file: `echo "verification" > econ_ra/current/.status`
3. ✅ Commit: `[econ_ra:planning] Task list created (N tasks)`
4. ✅ **MENTAL RESET**: Forget the spec details, any reasoning you did. Clear working memory.
5. ✅ Continue to Verification phase

**Context isolation**: Before starting verification, only carry forward: tasks.json, clarifications.md. Do NOT carry forward spec.md contents or any other context.

**Note:** Verification uses the two-subagent pattern (see master.prompt). The orchestrator will spawn verification_generate and verification_process subagents.
