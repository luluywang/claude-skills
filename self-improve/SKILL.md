---
name: self-improve
description: |
  Scan session logs, extract usage patterns, and generate ranked improvement
  proposals for existing skills or new skill ideas. Uses manifest-based caching
  so logs are never reprocessed.
  Only activate when user explicitly invokes '/self-improve'.
---

# Self-Improve Skill

Analyzes 900+ session logs (~694 MB) to find what to build or improve next.
Produces ranked, evidence-backed proposals. Applies them on demand.

## Key Paths

```
LOGS_DIR  = /Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/claude
SKILL_DIR = /Users/luluywang/.claude/skills/self-improve
SKILLS_DIR = /Users/luluywang/.claude/skills
```

## Invocation

```
/self-improve              # Analyze new logs since last run (default)
/self-improve --since 7d   # Only last 7 days
/self-improve --since 90d  # Last 90 days
/self-improve --all        # Reprocess all logs (full audit)
/self-improve --report     # Re-read last proposals without reprocessing
/self-improve apply P1     # Apply proposal P1 from most recent proposals file
/self-improve apply P1 P3  # Apply multiple proposals
/self-improve compress     # Gzip processed logs older than 90 days
/self-improve compress --older-than 30d
```

---

## Workflow

### `--report` Subcommand
Skip all analysis. Just:
1. Find the most recent `cache/proposals_*.md` (sort by date)
2. Read and present it to the user

---

### `apply` Subcommand
1. Find most recent `cache/proposals_*.md`
2. Read it; extract the specified proposal(s) by ID (P1, P2, ...)
3. For **Type A** or **Type C** (skill improvement / UX): spawn a **Sonnet subagent**
   with `@prompts/skill_editor.md` plus the proposal text and target skill path
4. For **Type B** (new skill): spawn a **Sonnet subagent**
   with `@prompts/skill_creator.md` plus the proposal text
5. Present the diff summary returned by the subagent

---

### `compress` Subcommand
Run:
```bash
python3 {SKILL_DIR}/scripts/compress_logs.py [--older-than DAYS]
```
Report files compressed and MB freed.

---

### Main Analysis Workflow (default / `--since` / `--all`)

#### Phase 1 — SCAN

Run:
```bash
python3 {SKILL_DIR}/scripts/scan_logs.py [--since Nd] [--all]
```
This respects `cache/manifest.json` and `last_run_date`. Returns JSON list of unprocessed files.

Output: `--- [SCAN] Found N new files (X MB)`

If 0 new files → skip to Phase 3 (re-run aggregation on cached outputs).

#### Phase 2A — TARGETED SKILL ANALYSIS

**Step 1 — Grep (Bash)**:
```bash
python3 {SKILL_DIR}/scripts/find_skill_sessions.sh
```
Returns JSON map `{skill: [path, ...]}`. Takes seconds.

**Step 2 — Per-skill Haiku subagents (parallel)**:
For each skill with ≥1 matched session file that is also in the Phase 1 new-files list:

Spawn a **Haiku subagent** with `@prompts/skill_analyst.md`, passing:
- `SKILL_NAME`: the skill name
- `SESSION_FILES`: matched paths (intersected with Phase 1 list, max 15 per skill)
- `SKILL_DIR`: `{SKILLS_DIR}`
- `OUTPUT_FILE`: `{SKILL_DIR}/cache/skill-analysis/{skill_name}.md`

Output: `--- [2A] econ_ra: analyzed N sessions → cache/skill-analysis/econ_ra.md`

#### Phase 2B — GENERAL SESSION SCAN

Files from Phase 1 that were NOT matched in Phase 2A (no skill grep hit).

If >0 unmatched files:

**Step 1 — Extract user messages (Bash, per file)**:
```bash
python3 {SKILL_DIR}/scripts/extract_user_messages.py "{path}" --max-kb 20
```

**Step 2 — Session analyst Haiku subagents (batches of ≤10)**:
Spawn **Haiku subagents** with `@prompts/session_analyst.md`, passing:
- `SESSION_FILES`: batch of ≤10 file paths
- `EXISTING_SKILLS`: econ_ra, copyedit, parsepdf, referee, revisions, taskmaster
- `OUTPUT_DIR`: `{SKILL_DIR}/cache/sessions/`

Each subagent returns a JSON list of `{rel_path, summary_file}` pairs.

After each batch: run `python3 {SKILL_DIR}/scripts/update_manifest.py --batch {entries_json}`.

Output: `--- [2B] Processed N sessions → M summaries written`

#### Phase 3 — AGGREGATE PATTERNS

Spawn a **Sonnet subagent** with `@prompts/pattern_aggregator.md`, passing:
- `SKILL_ANALYSIS_DIR`: `{SKILL_DIR}/cache/skill-analysis/`
- `SESSIONS_DIR`: `{SKILL_DIR}/cache/sessions/`
- `EXISTING_AGGREGATE`: `{SKILL_DIR}/cache/aggregate.md`
- `OUTPUT_FILE`: `{SKILL_DIR}/cache/aggregate.md`

Output: `--- [3] Aggregate updated → cache/aggregate.md`

#### Phase 4 — GENERATE PROPOSALS

Spawn an **Opus subagent** with `@prompts/proposal_writer.md`, passing:
- `AGGREGATE_FILE`: `{SKILL_DIR}/cache/aggregate.md`
- `SKILLS_DIR`: `{SKILLS_DIR}`
- `OUTPUT_FILE`: `{SKILL_DIR}/cache/proposals_{YYYYMMDD}.md`

Output: `--- [4] Proposals written → cache/proposals_{date}.md`

#### Phase 5 — UPDATE MANIFEST + PRESENT

Run:
```bash
python3 {SKILL_DIR}/scripts/update_manifest.py --set-last-run-date
```

Present a summary of the proposals file to the user:
- List each proposal by ID and title
- Show evidence count and effort
- Tell the user: "Run `/self-improve apply P1` to implement any proposal."

---

## Progress Output Convention

```
--- [SCAN] Found 23 new files (45.2 MB)
--- [2A] Skill grep: econ_ra=8, copyedit=3, parsepdf=1, revisions=2
--- [2A] econ_ra: analyzing 8 sessions...
--- [2A] econ_ra: done → cache/skill-analysis/econ_ra.md
--- [2B] Processing 12 general sessions (2 batches)...
--- [2B] Done: 12 sessions → 8 summaries
--- [3] Aggregating patterns...
--- [3] Done → cache/aggregate.md
--- [4] Writing proposals...
--- [4] Done → cache/proposals_20260227.md
--- [DONE] Manifest updated. 7 proposals generated.
```

---

## Orchestrator Rules

- Orchestrator coordinates — it does NOT do the analysis itself.
- Spawn subagents for all LLM work (skill_analyst, session_analyst, pattern_aggregator, proposal_writer).
- Use Bash directly for scripts (scan_logs.py, find_skill_sessions.sh, update_manifest.py).
- Keep orchestrator context lean: only pass inputs/outputs, not raw session content.
- Do NOT use TaskCreate/TaskUpdate tools.

---

## Cache Structure

```
cache/
├── manifest.json          # Processed files + last_run_date high-water mark
├── skill-analysis/
│   ├── econ_ra.md         # Per-skill findings (Phase 2A output)
│   ├── copyedit.md
│   └── ...
├── sessions/
│   └── {date}_{prefix}.md # Per-session discovery summaries (Phase 2B output)
├── aggregate.md           # Rolling aggregate (Phase 3 output, appended each run)
└── proposals_{date}.md    # Ranked proposals (Phase 4 output, one per run)
```
