---
name: plumber
description: |
  Data pipeline diagnostics for economics research projects. Traces file
  dependencies, detects staleness, audits Makefiles, finds duplicate data, and
  restructures project folders to the RA-guide layout. Only activate when user explicitly invokes '/plumber'.
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

Before running any of the bash blocks below, export `SKILL_DIR`:
```bash
export SKILL_DIR=~/.claude/skills/plumber
```

## Invocation

```
/plumber audit [dir]     — Full pipeline scan: staleness, orphans, missing Makefile targets
/plumber trace <file>    — Trace backwards from output to raw data
/plumber status [dir]    — Quick staleness check (no subagent, just mtime comparison)
/plumber makefile [dir]  — Generate/update Makefile from discovered DAG
/plumber dry [dirs...]   — Find duplicate data builds across directories
/plumber restructure [dir] — Plan, review, and apply moves to the RA-guide layout
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
   bash $SKILL_DIR/scripts/bootstrap.sh [dir]
   ```
2. Scan all code files for I/O:
   ```bash
   python3 $SKILL_DIR/scripts/scan_notebook.py <project_root>
   python3 $SKILL_DIR/scripts/scan_script.py <project_root>
   ```
3. Build the DAG:
   ```bash
   python3 $SKILL_DIR/scripts/build_dag.py <project_root>
   ```

### `reset` Command
Delete `current/dag.json` and `current/dag_meta.json`. Confirm to user.

### `status` Command (no subagent)
Run directly:
```bash
bash $SKILL_DIR/scripts/staleness.sh [dir]
```
Display the staleness report to the user.

### `dry` Command (no subagent)
Run directly:
```bash
python3 $SKILL_DIR/scripts/find_duplicates.py [dirs...]
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

### `restructure` Command (main agent; user approves before any move)

Target layout, from `~/Dropbox/Documents/Economics/Projects/RAGuide/ra_guide_lulu.pdf` §2.4–2.5 and §4:
```
code/                      all scripts and notebooks; one settings file holds the paths
data/raw_data/             inputs no project code produced (downloads, PDFs, vendor files)
data/intermediate_data/    anything project code or project agents wrote that a later step reads
output/graphs/  output/tables/  output/tables/scalars/   final figures and .tex tables
logs/                      logs from runs
.gitignore                 git covers code/ and output/, never data/
```
Also from the guide: lowercase file names with letters, digits, underscores; no
absolute paths outside one settings file; a Makefile. Root may keep README, CLAUDE.md,
PAPERCUTS.md, TODO.md, env files, and folders of notes, writing, literature, slides, spec.

1. **Plan (facts).** Run
   ```bash
   python3 $SKILL_DIR/scripts/layout_plan.py <project_root>
   ```
   It writes `current/layout_plan.csv` (action, src, dst, confidence, reason, evidence)
   and prints template checks: missing dirs, git, .gitignore, Makefile, settings file,
   absolute paths, bad code file names. Byte-identical `name (1).ext` copies get
   `trash` rows. It moves nothing.
2. **Review (judgment).** Settle every `low` and `review` row yourself by reading the
   code and README. Then edit the CSV. Rules:
   - The question for data is "did project code or a project agent write it?"
     Yes → `data/intermediate_data/`. No → `data/raw_data/`. Agent extraction
     output counts as written by the project.
   - Group loose raw files into one named subfolder of `data/raw_data/` by source
     (e.g. `lseg_reports/`). Lowercase folder names you create. Do not rename raw
     files: their names are provenance.
   - Search the code for globs or walks over the root (`ROOT.glob("**/...")`, `list.files(recursive=TRUE)`,
     `os.walk(ROOT)`). The rewriter cannot fix them; note them for step 4.
   - A data file under `output/` that later code reads belongs in `data/intermediate_data/`.
     Leave `output/` alone when unsure, and ask.
3. **Show the plan and ask.** Give the user a short table of the planned moves, grouped
   by destination, with counts for big groups. List the trash rows and the template gaps.
   Do not apply until the user approves.
4. **Apply.** Dry run first, then apply:
   ```bash
   python3 $SKILL_DIR/scripts/layout_apply.py <project_root>           # dry run
   python3 $SKILL_DIR/scripts/layout_apply.py <project_root> --apply
   ```
   It refuses unresolved rows and never overwrites. It moves trash to
   `current/layout_trash/` and does not delete it. It uses `git mv` for tracked files.
   It rewrites code string literals that name a moved path, backs up each edited file
   to `current/layout_backup/`, and writes `current/layout_undo.sh`. Then fix each
   MANUAL line by hand, along with the globs from step 2, README commands, and docs.
   Ignore MANUAL lines where the name is a dict key or enum value, not a path.
5. **Template gaps.** Offer each gap as its own step, and apply it only after the user agrees:
   `git init` plus a `.gitignore` with `data/`, `current/`, `*-env/`, `__pycache__/`,
   `.DS_Store`; one settings file in `code/` that replaces absolute paths with paths
   relative to the project root; and `/plumber makefile`.
6. **Verify.** Run `python -m py_compile` (or the language's parse check) on every edited
   script. Rebuild the DAG and compare its missing-input count with the count before
   the move; a new missing input means a broken path. Grep the code for the old top-level
   names again. Report the before and after tree to the user.

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
