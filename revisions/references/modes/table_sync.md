# Table Sync Mode

`/revisions sync-tables [table_file] [manuscript]` is a **standalone mode** for reconciling updated tables or data files with manuscript text. It is distinct from the main response-doc → manuscript alignment workflow and does not use claims, referee profiles, or the fixer-critic loop.

## When to Use

Use this mode after updating tables (e.g., re-running estimation, changing sample restrictions) when the manuscript text still references old observation counts, percentage effects, or test statistics. The main `/revisions` workflow handles response-doc alignment; this mode handles data-manuscript alignment.

## Inputs

- `[table_file]`: Path to updated table file(s) — `.tex` tables, `.csv`, or a directory containing multiple table files. May also be passed as a config key if multiple files are involved.
- `[manuscript]`: Path to the main manuscript `.tex` file (and optionally appendix files).

## What It Does

1. Runs `bootstrap.sh` to detect `table_sync` phase
2. Spawns a single subagent reading `revisions/prompts/table_sync.prompt`
3. The subagent reads the tables and manuscript, finds all numerical conflicts (obs counts, % effects, statistics), and writes `current/table_sync_report.md`
4. The orchestrator presents `current/table_sync_report.md` to the user

## Output

`current/table_sync_report.md` — a line-by-line diff of required text changes: what the manuscript currently says, what it should say based on the updated tables, and the exact file/line location.

## Phase Protocol

When bootstrap returns `table_sync`, the orchestrator MUST:
1. Confirm input paths with the user if not already provided as arguments
2. **IMMEDIATELY** spawn the table_sync subagent — do NOT read tables or manuscript yourself
3. After the subagent returns, read and present `current/table_sync_report.md` to the user

```
Task: [revisions:table_sync] Reconcile updated tables with manuscript text
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/table_sync.prompt for full instructions.

Context:
- Table file(s): {path(s) provided by user}
- Manuscript: {path(s) provided by user}
```
