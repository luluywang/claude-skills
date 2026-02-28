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
LOGS_DIR   = /Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/claude
CACHE_DIR  = /Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/self-improve-cache
SKILL_DIR  = /Users/luluywang/.claude/skills/self-improve
SKILLS_DIR = /Users/luluywang/.claude/skills
```

## Invocation

```
/self-improve              # Analyze new logs since last run (default)
/self-improve --since 7d   # Only last 7 days
/self-improve --since 90d  # Last 90 days
/self-improve --all        # Reprocess all logs (full audit)
/self-improve --report     # Re-read last proposals without reprocessing
/self-improve docket       # Show all pending docket items (no re-scan)
/self-improve apply P1     # Apply proposal P1 from docket (marks as applied)
/self-improve apply P1 P3  # Apply multiple proposals
/self-improve close P1     # Close/reject a docket item without applying
/self-improve compress     # Gzip processed logs older than 90 days
/self-improve compress --older-than 30d
```

IDs accept either short form (`P1`) resolved against the most recent proposals file,
or full docket form (`20260227/P1`).

---

## Workflow

### `--report` Subcommand
Skip all analysis. Just:
1. Find the most recent `{CACHE_DIR}/proposals_*.md` (sort by date)
2. Read and present it to the user

---

### `docket` Subcommand
1. Read `{CACHE_DIR}/docket.md`
2. Extract all entries under `## Pending`
3. Display as a compact table (ID | Title | Type | Target | Effort | Added) plus item count

---

### `close` Subcommand
Usage: `/self-improve close P1` or `/self-improve close 20260227/P1`

1. Resolve the ID: short form `P1` → find matching entry in docket whose ID ends in `/P1` from the most recent run date
2. Read `{CACHE_DIR}/docket.md`
3. Move the matching entry from `## Pending` to `## Closed`, prepending `**Closed**: {today's date}` to its metadata line
4. Write the updated docket
5. Confirm: "Closed 20260227/P1: {title}"

---

### `apply` Subcommand
1. Resolve the ID: short form `P1` → match entry in `{CACHE_DIR}/docket.md` whose ID ends in `/P1` from the most recent run date; full form `20260227/P1` → direct lookup
2. Read the full proposal text from `{CACHE_DIR}/docket.md` (under `## Pending`)
3. For **Type A** or **Type C** (skill improvement / UX): spawn a **Sonnet subagent**
   with `@prompts/skill_editor.md` plus the proposal text and target skill path
4. For **Type B** (new skill): spawn a **Sonnet subagent**
   with `@prompts/skill_creator.md` plus the proposal text
5. On success: move the entry in `{CACHE_DIR}/docket.md` from `## Pending` to `## Applied`, prepending `**Applied**: {today's date}`
6. Present the diff summary returned by the subagent

---

### `compress` Subcommand
Run:
```bash
python3 {SKILL_DIR}/scripts/compress_logs.py [--older-than DAYS]
```
Report files compressed and MB freed.

---

### Main Analysis Workflow (default / `--since` / `--all`)

Spawn a **general-purpose subagent** with `@prompts/orchestrator.md`, passing:
- `ARGS`: the invocation flags (e.g., `--since 7d`, `--all`, or empty)
- `LOGS_DIR`: `/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/claude`
- `CACHE_DIR`: `/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs/self-improve-cache`
- `SKILL_DIR`: `/Users/luluywang/.claude/skills/self-improve`
- `SKILLS_DIR`: `/Users/luluywang/.claude/skills`

Present the subagent's return value (compact proposals table) to the user.

Tell the user: "Run `/self-improve apply P1` to implement any proposal."

---

## Cache Structure

Stored in `CACHE_DIR` (`~/Dropbox/claude-logs/self-improve-cache/`), separate from the
skill directory so upgrades to the skill never lose processed state.

```
self-improve-cache/
├── manifest.json          # Processed files, last_run_date, and skills usage registry
├── docket.md              # Persistent backlog: all proposals with status tracking
├── skill-analysis/
│   ├── econ_ra.md         # Per-skill findings (Phase 2A output)
│   ├── copyedit.md
│   └── ...
├── sessions/
│   └── {date}_{prefix}.md # Per-session discovery summaries (Phase 2B output)
├── aggregate.md           # Rolling aggregate (Phase 3 output, appended each run)
└── proposals_{date}.md    # Ranked proposals snapshot (Phase 4 output, one per run)
```

### Manifest Schema

```json
{
  "version": 1,
  "last_updated": "2026-02-27T...",
  "last_run_date": "2026-02-27T...",
  "skills": {
    "econ_ra":  {"sessions": 42, "last_seen": "2026-02-27"},
    "copyedit": {"sessions": 18, "last_seen": "2026-01-15"}
  },
  "processed": {
    "filename.jsonl": {"processed_at": "...", "summary_file": "...", "compressed": false}
  }
}
```

`skills` is populated by Phase 2A and persists across runs, making it easy to see which
skills are actively used without re-scanning logs.

### Docket IDs
Format: `YYYYMMDD/P{n}` — run date plus proposal number within that run.
Short form `P1` resolves to the most recent run's `P1` entry in the docket.
