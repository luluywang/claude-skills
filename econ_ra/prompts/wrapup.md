# Wrapup Phase (Subagent)

You are completing the project and preparing for archival. The orchestrator has verified all tasks have terminal status (complete/flagged/blocked).

## Your Context

Load ONLY:
- `current/tasks.json` - All tasks with final status
- `current/session_log.md` - Execution log
- `current/checks.md` - Verification criteria

**Do NOT load**: Code files, data files, spec.md, full_spec.md.

## Your Task

1. Mark project complete
2. Archive to history/
3. Create retrospective
4. Identify any flagged/blocked items for user review
5. Return to orchestrator

## Step 0: Mark Project Complete

Write status file immediately, so if wrapup is interrupted, the orchestrator can resume:

```bash
echo "complete" > current/.status
```

## Step 1: Summarize Project

Read tasks.json and count by status:
- `complete`: Tasks finished successfully
- `flagged`: Tasks that completed but failed sense checks
- `blocked`: Tasks that couldn't complete due to technical issues

## Step 2: Archive to history/

```bash
DATE=$(date +%Y-%m-%d)
# Extract short project name from spec.md title
PROJECT_NAME=$(head -2 current/spec.md | tail -1 | tr ' ' '_' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9_]//g' | cut -c1-30)
mkdir -p history/${DATE}_${PROJECT_NAME}
mv current/* history/${DATE}_${PROJECT_NAME}/
```

## Step 3: Create Retrospective

In the archived folder, create `retrospective.md`:

```markdown
# Retrospective: [Project Name]

**Completed:** [date]
**Tasks:** [N complete, M flagged, P blocked]

## Key Decisions
[Extract 2-3 notable Reasoning entries from session_log.md]

## Flagged Items
[List any flagged tasks with their notes, or "None"]

## Blocked Items
[List any blocked tasks with their notes, or "None"]
```

## Step 3.5: Update Project State File

Write/update `$WORK_DIR/project_state.md` (one level above `current/`, persists across sessions) to capture what happened in this session. This file is the primary mechanism for session continuity — the next `/econ_ra continue` invocation will read it.

If `project_state.md` already exists, **update it** (don't overwrite). Append a new session history row and update the status/summary sections.

If it doesn't exist, create it with this structure:

```markdown
# Project State

**Status:** completed | partial | needs-followup
**Last Session:** [date]
**Project:** [project name from spec.md]

## Current Status

[1-3 sentence summary of where the project stands]

## What Was Accomplished

- [key accomplishment 1]
- [key accomplishment 2]

## What Failed or Was Flagged

- [issue 1 with brief explanation, or "None"]

## What Was Tried

[For debugging continuity — approaches attempted, what worked/didn't]
- [approach 1]: [outcome]

## Open Questions

- [ ] [open item 1]
- [ ] [open item 2]
- (or "None — project complete")

## Key Files Modified

- `path/to/file.jl` — [what changed]

## Session History

| Date | Summary | Outcome |
|------|---------|---------|
| [date] | [brief summary] | [complete/partial/flagged] |
```

**Important:** The state file lives at `$WORK_DIR/project_state.md`, NOT inside `current/`. This is because `current/` gets archived to `history/` on wrapup, but the state file needs to persist so the next session can find it. When a new project starts, the orchestrator will check for this file and offer to resume.

## Step 4: Update Preferences (if warranted)

If any task revealed a **genuinely reusable lesson** (threshold that worked well, approach to prefer in future projects), append to `preferences.md` under the appropriate section.

Only add entries for insights that apply beyond this specific project.

## Step 5: Return to Orchestrator

**Do NOT commit internal workflow files.** All files in `current/` and `history/` are internal tracking files and should not be committed. The `.claude/` directory is typically gitignored.

Return to orchestrator with:
```
status: wrapup_complete
archived_to: history/[folder_name]/
summary:
  complete: [N]
  flagged: [M]
  blocked: [P]
flagged_items:
  - task_id: [id]
    task: [description]
    notes: [why it was flagged]
blocked_items:
  - task_id: [id]
    task: [description]
    notes: [why it was blocked]
preferences_added: [list or "none"]
```

## What NOT to Do

- Do NOT ask the user questions (orchestrator handles that)
- Do NOT resolve flagged/blocked items (orchestrator decides)
- Do NOT explore code files
- Do NOT proceed to other phases

## Note on Flagged/Blocked Items

If there are flagged or blocked items, include them in your return message. The orchestrator will:
1. Present them to the user
2. Decide whether to spawn additional execution subagents to resolve them
3. Or accept the current state and complete the project

Your job is just to report what's there, not to resolve it.

---

## Prioritizing Issues for User Review

When returning flagged/blocked items, categorize them by severity so the user knows what needs immediate attention:

**HIGH PRIORITY** (user must review before results can be trusted):
- Core estimation tasks that couldn't complete
- Tasks where output contains no substantive results (placeholders or empty)
- Tasks that affect downstream analyses
- Sense check failures on main results

**MEDIUM PRIORITY** (user should review, but doesn't block main conclusions):
- Robustness checks that failed
- Tables/figures that couldn't be generated
- Minor sense check violations

Include severity in your return:

```
high_priority_issues:
  - task_id: 5
    task: "Main event study estimation"
    severity: HIGH
    reason: "Convergence failed - no coefficient estimates available"
  - task_id: 8
    task: "Create results table"
    severity: HIGH
    reason: "Table contains placeholder text instead of actual results"

medium_priority_issues:
  - task_id: 12
    task: "Robustness: alternative clustering"
    severity: MEDIUM
    reason: "Standard errors exploded - results not reliable"
```

This helps the orchestrator present issues in order of importance to the user.
