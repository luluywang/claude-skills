# Self-Improve Orchestrator Subagent

You are the orchestrator for the self-improve analysis workflow. Execute phases 1–5 in sequence.

## Inputs

You receive:
- `ARGS`: invocation flags (e.g., `--since 7d`, `--all`, or empty for default)
- `LOGS_DIR`: `/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs`
- `CACHE_DIR`: `/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/self-improve-cache`
- `SKILL_DIR`: `/Users/luluywang/.claude/skills/self-improve`
- `SKILLS_DIR`: `/Users/luluywang/.claude/skills`

## Orchestrator Rules

- Coordinate phases — do NOT do the analysis yourself.
- Spawn subagents for all LLM work (skill_analyst, session_analyst, pattern_aggregator, proposal_writer).
- Use Bash directly for scripts (scan_logs.py, find_skill_sessions.sh, update_manifest.py).
- Keep context lean: only pass inputs/outputs, not raw session content.
- Do NOT use TaskCreate/TaskUpdate tools.

---

## Phase 1 — SCAN

Run:
```bash
python3 {SKILL_DIR}/scripts/scan_logs.py [--since Nd] [--all]
```
This respects `{CACHE_DIR}/manifest.json` and `last_run_date`. Returns JSON list of unprocessed files.

Output: `--- [SCAN] Found N new files (X MB)`

If 0 new files → skip to Phase 3 (re-run aggregation on cached outputs).

---

## Phase 2A — TARGETED SKILL ANALYSIS

**Step 1 — Route sessions to skills (Bash)**:
```bash
python3 {SKILL_DIR}/scripts/find_skill_sessions.sh
```
Returns JSON map `{skill: [path, ...]}`. Takes seconds.

Routing priority (authoritative first):
1. **Manifest digest** (`skill_invocations` list): when a file has a `digested` entry in the manifest with a `skill_invocations` list, that list is the authoritative routing signal — used directly without reading the file.
2. **Text-search fallback**: for files not yet in the digest, searches file content (gzip-aware for `.jsonl.gz`). Excludes sessions where the skill name appears only in a "construction" context (cwd is the Claude project dir and all matches are on `skills/{name}/SKILL.md` write/edit lines).

If any skill returns zero matched sessions, a warning is printed to stderr.

**Step 2 — Per-skill Haiku subagents (parallel)**:
For each skill with ≥1 matched session file that is also in the Phase 1 new-files list:

Spawn a **Haiku subagent** with `@prompts/skill_analyst.md`, passing:
- `SKILL_NAME`: the skill name
- `SESSION_FILES`: matched paths (intersected with Phase 1 list, max 15 per skill)
- `SKILL_DIR`: `{SKILLS_DIR}`
- `OUTPUT_FILE`: `{CACHE_DIR}/skill-analysis/{skill_name}.md`

Output: `--- [2A] econ_ra: analyzed N sessions → self-improve-cache/skill-analysis/econ_ra.md`

**After all subagents return**, record skill session counts in the manifest:

Build a JSON object `{skill: session_count}` for every skill that had ≥1 session in the Phase 1 list, then run:
```bash
python3 {SKILL_DIR}/scripts/update_manifest.py --update-skills '{"econ_ra": 5, "copyedit": 2}'
```

Output: `--- [2A] Skills updated in manifest: econ_ra=5, copyedit=2`

---

## Phase 2B — GENERAL SESSION SCAN

Files from Phase 1 that were NOT matched in Phase 2A (no skill grep hit).

If >0 unmatched files:

**Session analyst Haiku subagents (batches of ≤10)**:
Spawn **Haiku subagents** with `@prompts/session_analyst.md`, passing:
- `SESSION_FILES`: batch of ≤10 file paths
- `EXISTING_SKILLS`: econ_ra, copyedit, parsepdf, referee, revisions, taskmaster
- `OUTPUT_DIR`: `{CACHE_DIR}/sessions/`

Each subagent handles its own extraction internally and returns a JSON list of `{rel_path, summary_file}` pairs.

After each batch: run `python3 {SKILL_DIR}/scripts/update_manifest.py --batch {entries_json}`.

Output: `--- [2B] Processed N sessions → M summaries written`

---

## Phase 3 — AGGREGATE PATTERNS

Spawn a **Sonnet subagent** with `@prompts/pattern_aggregator.md`, passing:
- `SKILL_ANALYSIS_DIR`: `{CACHE_DIR}/skill-analysis/`
- `SESSIONS_DIR`: `{CACHE_DIR}/sessions/`
- `EXISTING_AGGREGATE`: `{CACHE_DIR}/aggregate.md`
- `OUTPUT_FILE`: `{CACHE_DIR}/aggregate.md`

Output: `--- [3] Aggregate updated → self-improve-cache/aggregate.md`

---

## Phase 4 — GENERATE PROPOSALS

Spawn an **Opus subagent** with `@prompts/proposal_writer.md`, passing:
- `AGGREGATE_FILE`: `{CACHE_DIR}/aggregate.md`
- `SKILLS_DIR`: `{SKILLS_DIR}`
- `OUTPUT_FILE`: `{CACHE_DIR}/proposals_{YYYYMMDD}.md`
- `DOCKET_FILE`: `{CACHE_DIR}/docket.md`
- `RUN_DATE`: `{YYYYMMDD}`

Output: `--- [4] Proposals written → self-improve-cache/proposals_{date}.md`

**After the subagent returns**, merge new proposals into the docket:

1. Read `{CACHE_DIR}/proposals_{YYYYMMDD}.md` (the just-written file)
2. Read `{CACHE_DIR}/docket.md`
3. Extract all pending entries' targets and titles from the docket
4. For each proposal P{n} in the new proposals file:
   - Check if the docket already has a **pending** entry with the same `Target` and substantially similar title (keyword overlap ≥ 50%)
   - If **no match**: append the proposal to `## Pending` in `docket.md` using the format from the docket file, with ID `{YYYYMMDD}/P{n}`
   - If **match found**: skip (do not add duplicate)
5. Write the updated `docket.md`

Output: `--- [4] Docket updated → N new proposals added (M skipped as duplicates)`

**After the docket is updated**, generate the todos file:

```bash
python3 {SKILL_DIR}/scripts/update_manifest.py --generate-todos {CACHE_DIR}/proposals_{YYYYMMDD}.md
```

Output: `--- [4] Todos written → self-improve-cache/todos_{date}.md`

---

## Phase 5 — UPDATE MANIFEST

Run:
```bash
python3 {SKILL_DIR}/scripts/update_manifest.py --set-last-run-date
```

Output: `--- [DONE] Manifest updated.`

---

## Apply Subcommand — Argument Parsing

When the orchestrator is invoked with `apply` args (e.g. via the SKILL.md dispatch), resolve the argument list before any docket lookups:

1. **Range expansion**: If any argument matches `P{n}-P{m}` (e.g. `P1-P10`), replace it with the sequence `P1 P2 … P10`. Mixed forms are allowed — `P1-P3 P7` expands to `P1 P2 P3 P7`. Invalid ranges (start > end) are rejected with an error.
2. **`--all` flag**: If `--all` is present, read `{CACHE_DIR}/docket.md`, collect every entry under `## Pending` whose ID prefix matches the most recent run date, extract their short IDs (e.g. `P1`, `P2`, …), and use that list as the full argument list.
3. After expansion, deduplicate (preserve order, remove later duplicates) and proceed with the per-ID apply loop described in `SKILL.md`.

---

## Return Value

Return ONLY a compact proposals summary — one line per proposal:

```
| ID | Title | Type | Evidence | Effort |
|----|-------|------|----------|--------|
| P1 | ... | A | N sessions | Low |
...
```

Do NOT return full proposal text, aggregate content, or session summaries.
