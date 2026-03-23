---
name: plumber
description: |
  Data pipeline diagnostics for economics research projects. Traces file
  dependencies, detects staleness, audits Makefiles, and finds duplicate data.
  Only activate when user explicitly invokes '/plumber'.
---

# Plumber — Data Pipeline Diagnostics

Scans economics project directories to build a dependency DAG from code I/O,
then provides staleness checks, dependency tracing, Makefile auditing, and
duplicate detection across `server_copy*` directories.

## Key Paths

```
SKILL_DIR  = ~/.claude/skills/plumber
DAG_CACHE  = {project_root}/current/dag.json
DAG_META   = {project_root}/current/dag_meta.json
```

## Invocation

```
/plumber audit [dir]     — Full pipeline scan: staleness, orphans, missing Makefile targets
/plumber trace <file>    — Trace backwards from output to raw data
/plumber status [dir]    — Quick staleness check (no subagent, just mtime comparison)
/plumber makefile [dir]  — Generate/update Makefile from discovered DAG
/plumber dry [dirs...]   — Find duplicate data builds across directories
/plumber reset           — Clear cached DAG
```

---

## Command Dispatch

Parse the user's invocation to extract `COMMAND` and `ARGS`.

### Step 0 — Ensure DAG exists (for commands that need it)

Commands `audit`, `trace`, `status`, `makefile` require a DAG. If `current/dag.json`
does not exist or is older than 1 hour, rebuild it:

1. Run bootstrap to detect project:
   ```bash
   bash ~/.claude/skills/plumber/scripts/bootstrap.sh [dir]
   ```
2. Scan all code files for I/O:
   ```bash
   python3 ~/.claude/skills/plumber/scripts/scan_notebook.py <project_root>
   python3 ~/.claude/skills/plumber/scripts/scan_script.py <project_root>
   ```
3. Build the DAG:
   ```bash
   python3 ~/.claude/skills/plumber/scripts/build_dag.py <project_root>
   ```

### `reset` Command
Delete `current/dag.json` and `current/dag_meta.json`. Confirm to user.

### `status` Command (no subagent)
Run directly:
```bash
bash ~/.claude/skills/plumber/scripts/staleness.sh [dir]
```
Display the staleness report to the user.

### `dry` Command (no subagent)
Run directly:
```bash
python3 ~/.claude/skills/plumber/scripts/find_duplicates.py [dirs...]
```
Display the duplicate report to the user.

### `trace` Command (subagent)
Spawn a **Sonnet subagent** with `@prompts/trace.md`, passing:
- `DAG_FILE`: path to `current/dag.json`
- `TARGET_FILE`: the file argument from the user
- `PROJECT_ROOT`: detected project root

### `audit` Command (subagent)
First run `status` to generate staleness report, then spawn a **Sonnet subagent**
with `@prompts/audit.md`, passing:
- `DAG_FILE`: path to `current/dag.json`
- `STALENESS_REPORT`: output from staleness.sh
- `PROJECT_ROOT`: detected project root
- `MAKEFILE_PATH`: path to project Makefile (if exists)

### `makefile` Command (subagent)
Spawn a **Sonnet subagent** with `@prompts/makefile_gen.md`, passing:
- `DAG_FILE`: path to `current/dag.json`
- `PROJECT_ROOT`: detected project root
- `MAKEFILE_PATH`: path to existing Makefile (if exists)

---

## DAG Schema (dag.json)

```json
{
  "project_root": "/path/to/project",
  "project_type": "notebook|julia|R|python|mixed",
  "settings_files": ["code/settings.R"],
  "nodes": [
    {"id": "code/ncua_build.ipynb", "type": "script", "language": "R"},
    {"id": "data/intermediate_data/panel.csv", "type": "data", "subtype": "intermediate"}
  ],
  "edges": [
    {"from": "code/ncua_build.ipynb", "to": "data/intermediate_data/panel.csv", "relation": "produces"},
    {"from": "data/raw_data/input.csv", "to": "code/ncua_build.ipynb", "relation": "consumed_by"}
  ],
  "makefile_targets": {
    "data/intermediate_data/panel.csv": {"recipe": "ncua_build.ipynb", "declared": true}
  },
  "warnings": [],
  "unresolved": [],
  "scan_timestamp": "2026-03-23T..."
}
```
