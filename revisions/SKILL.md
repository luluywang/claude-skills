---
name: revisions
description: |
  Referee response orchestrator for drafting structured responses to referee reports.
  Only activate when user explicitly invokes '/revisions'. Do NOT activate for general
  questions about papers or referee reports.
---

# Revisions Workflow Orchestrator

This orchestrator manages a multi-phase workflow for responding to referee comments on academic papers. It parses referee reports, triages comments, drafts responses in the user's voice, verifies manuscript claims, and compiles a LaTeX response document.

## Invocation

```
/revisions parse reports/                # Parse referee reports into structured comments
/revisions triage                        # Categorize extracted comments
/revisions draft                         # Draft responses for all comments
/revisions draft ref1                    # Draft for one referee only
/revisions draft ref1:3                  # Draft for a single comment
/revisions verify                        # Cross-check responses against manuscript
/revisions compile                       # Assemble LaTeX response document
/revisions full reports/ paper.tex       # Full pipeline: parse → triage → draft → verify → compile
/revisions continue                      # Resume from last phase
/revisions reset                         # Clear for new revision
```

## How It Works

1. Detect current phase from `current/` state via `scripts/bootstrap.sh`
2. Map user command to task sequence
3. Collect inputs (report files, manuscript, prior response doc)
4. Parse reports → Triage → Draft → Verify → Compile
5. Each phase spawns subagents at appropriate model tiers

The key insight: subagents run autonomously and cannot interact with users. User interaction happens in the orchestrator (main context), kept lightweight by offloading analysis to subagents.

**File-first communication:** Subagents write detailed results to files and return only minimal summaries (status, counts). The orchestrator reads files when it needs details — it never consumes large results from inline returns. This keeps the orchestrator's context window small and focused on coordination.

## Progress Tracking

Native Tasks (TaskCreate/TaskUpdate) provide **real-time UX feedback** while `current/.status` tracks the **authoritative workflow state**.

**Phase-level tracking:** At bootstrap, create one native Task per remaining phase. Mark each in_progress at entry and completed at transition.

```
# After bootstrap returns "fresh":
TaskCreate: "Parse referee reports"          activeForm: "Parsing reports"
TaskCreate: "Triage comments"                activeForm: "Triaging comments"
TaskCreate: "Draft responses"                activeForm: "Drafting responses"
TaskCreate: "Verify claims"                  activeForm: "Verifying claims"
TaskCreate: "Compile LaTeX document"         activeForm: "Compiling document"
```

**Comment-level tracking (draft phase):** When spawning draft subagents, create a native Task per comment or per referee.

## Orchestrator Rules (Critical)

The orchestrator coordinates—it does NOT do the work itself.

### MANDATORY: Phase Protocol Enforcement

**After bootstrap returns a phase, you MUST follow the exact protocol for that phase.**

- `fresh` → Collect inputs, then parse
- `parse` → Spawn parse subagents
- `triage` → Spawn triage subagent
- `draft` → Spawn draft subagents
- `verify` → Spawn verify subagents
- `compile` → Spawn compile subagent

### The orchestrator CAN:
- Read skill files (SKILL.md, prompts/*)
- Read state files (current/.status, current/config.json, current/comments.json, current/triage.json)
- Run scripts (bootstrap.sh)
- Spawn subagents with appropriate context
- Present questions to users and collect answers
- Update `.status` files

### The orchestrator MUST NOT:
- **Read referee reports or manuscript directly** — subagents do this
- **Write response drafts** — draft subagents do this
- **Write LaTeX output** — compile subagent does this
- **Bypass the phase protocol** — even if user's request seems clear, follow the phases

## Bootstrap Phase (Always First)

On every invocation, run the bootstrap script to detect the current phase.

### Run bootstrap script

```bash
bash revisions/scripts/bootstrap.sh
```

Returns JSON:
```json
{
  "phase": "fresh|parse|triage|draft|verify|compile|complete",
  "reason": "Brief explanation",
  "directory_created": "yes|no",
  "files": {
    "status": "exists|missing",
    "status_content": "...",
    "config": "exists|missing",
    "comments": "exists|missing",
    "triage": "exists|missing",
    "responses_dir": "exists|missing",
    "responses_count": 0,
    "verification": "exists|missing"
  }
}
```

**Phase actions (MANDATORY - follow exactly):**

| Phase | Action | First Step |
|-------|--------|------------|
| `fresh` | Collect inputs | AskUserQuestion for report files, manuscript, round |
| `parse` | Parse reports | Spawn parse subagents |
| `triage` | Triage comments | Spawn triage subagent |
| `draft` | Draft responses | Spawn draft subagents |
| `verify` | Verify claims | Spawn verify subagents |
| `compile` | Compile LaTeX | Spawn compile subagent |
| `complete` | Already done | Inform user, offer reset |

## Input Collection Phase

When phase is `fresh`, gather inputs via AskUserQuestion:

1. **Referee report files** (.txt/.pdf) and editor letter — REQUIRED
2. **Manuscript path** (.tex) — REQUIRED (used for cross-referencing, claim verification, and section/table/figure references in drafts)
3. **Prior response document** (.tex) — optional (for style extraction)
4. **Revision round number** — default 2

After collecting inputs, write `current/config.json`:
```json
{
  "reports": ["reports/ref1.txt", "reports/ref2.txt", "reports/editor.txt"],
  "manuscript": "paper.tex",
  "prior_response": "response_round1.tex",
  "round": 2,
  "created": "ISO timestamp"
}
```

Update status: `echo "parse" > current/.status`

## Parse Phase (Parallel Haiku Subagents)

Spawn **one Haiku subagent per report** in parallel. Each subagent writes its results to a file to keep the orchestrator's context lightweight.

```
Task: [revisions:parse] Parse {report_filename}
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/tasks/parse_comments.prompt for full instructions.

Context:
- Report file: {absolute_path}
- Source label: {referee_label} (e.g., "Referee 1", "Editor")

Your job:
1. Read the report file
2. Extract each individual comment
3. Structure as JSON array
4. Write to current/comments_{prefix}.json
5. Return: {source, file, count} (minimal)
```

After all parse subagents return:
1. Read `current/comments_*.json` files and merge into `current/comments.json`
2. Output summary: "Extracted N comments from M reports"
3. Update status: `echo "triage" > current/.status`

## Triage Phase (Single Sonnet Subagent)

Single **Sonnet subagent** reads all comments + editor letter. Writes results to files to keep the orchestrator's context lightweight.

```
Task: [revisions:triage] Categorize and cross-reference all comments
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/tasks/triage.prompt for full instructions.

Context:
- Comments: current/comments.json
- Config: current/config.json

Your job:
1. Read all comments
2. Assign type, difficulty, priority to each
3. Identify cross-references across referees
4. Group into thematic clusters
5. Write current/triage.json
6. Write current/triage_summary.md (human-readable table)
7. Return: {status, total, by_type, cluster_count} (minimal)
```

**CRITICAL: Read `current/triage_summary.md` and output it to the user BEFORE calling AskUserQuestion.**

Present triage table, then confirm before drafting:
```json
{
  "header": "Triage review",
  "question": "Review the comment triage above. What would you like to do?",
  "multiSelect": false,
  "options": [
    {"label": "Proceed to drafting (Recommended)", "description": "Start drafting responses for all comments"},
    {"label": "Modify triage", "description": "Change priority or categorization before drafting"},
    {"label": "Draft subset only", "description": "Draft responses for specific referees or comments"}
  ]
}
```

Update status: `echo "draft" > current/.status`

## Draft Phase (Model-Routed Subagents)

Spawn subagents per comment, model routed by difficulty:

| Comment Type | Model | Rationale |
|---|---|---|
| minor, already_addressed | Haiku | Simple acknowledgments |
| clarification | Sonnet | Needs economic understanding |
| substantive (standard) | Sonnet | Domain expertise, evidence synthesis |
| substantive (hard/escalate) | Opus | Deep reasoning, novel analysis design |

```
Task: [revisions:draft:{comment_id}] Draft response for {source} comment {number}
model: {routed_model}
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/tasks/draft_response.prompt for full instructions.
Read revisions/prompts/components/response_patterns.prompt for style conventions.

Context:
- Comment: {comment text from triage.json}
- Cross-refs: {related comments}
- Manuscript path: {from config.json}
- Triage info: {type, difficulty, priority}

Your job:
1. Read the manuscript sections relevant to this comment
2. Draft a response in the user's voice/style
3. Include specific \ref{}, \textcite{}, \parencite{} references
4. Flag items needing user action with [TODO: ...]
5. Write response to current/responses/{comment_id}.md
6. Return: {status, model_used, todo_count}
```

After all draft subagents return, update status: `echo "verify" > current/.status`

## Verify Phase (Parallel Haiku Subagents)

Spawn **Haiku subagents** in parallel to cross-check each response's manuscript claims. Each subagent writes its results to files to keep the orchestrator's context lightweight.

```
Task: [revisions:verify:{comment_id}] Verify claims in response {comment_id}
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/tasks/verify_claims.prompt for full instructions.

Context:
- Response: current/responses/{comment_id}.md
- Manuscript path: {from config.json}

Your job:
1. Read the response draft
2. Read referenced manuscript sections
3. Verify each claim (section exists, content matches, figures/tables exist)
4. Write detailed results to current/verification/{comment_id}.json
5. Write human-readable issues to current/verification/{comment_id}.md
6. Return: {comment_id, verified: true/false, issue_count: N} (minimal)
```

After all verify subagents return:
1. Read `current/verification/*.md` files to build consolidated summary
2. Write `current/verification_summary.md`
3. Present verification summary to user
4. Update status: `echo "compile" > current/.status`

## Compile Phase (Single Haiku Subagent)

Single **Haiku subagent** assembles all responses into a `.tex` file.

```
Task: [revisions:compile] Assemble LaTeX response document
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/tasks/compile_latex.prompt for full instructions.
Read revisions/prompts/components/latex_template.prompt for document skeleton.

Context:
- Config: current/config.json
- Triage: current/triage.json
- Responses: current/responses/*.md
- Verification: current/verification/*.json (per-comment results)
- Template: revisions/templates/response_document.tex

Your job:
1. Read all responses
2. Assemble into LaTeX document matching template structure
3. Save alongside manuscript
4. Return: {output_path, referee_count, comment_count}
```

Update status: `echo "complete" > current/.status`

## State Management

| File | Purpose |
|---|---|
| `current/.status` | Current phase |
| `current/config.json` | Input paths, round number |
| `current/comments_{prefix}.json` | Per-report parsed comments (subagent output) |
| `current/comments.json` | All extracted comments (merged by orchestrator) |
| `current/triage.json` | Categorized comments + clusters |
| `current/triage_summary.md` | Human-readable triage table (subagent output) |
| `current/responses/{id}.md` | Individual draft responses |
| `current/verification/{id}.json` | Per-comment verification results (subagent output) |
| `current/verification/{id}.md` | Per-comment issues in markdown (subagent output) |
| `current/verification_summary.md` | Consolidated verification issues (orchestrator output) |

## Reset (Clear for New Revision)

When the user says "reset", "clear", or "new revision":
1. Check if current/ exists
2. IF current/ exists AND has content: Ask user to confirm
3. Remove current/ contents, confirm ready for new revision

## Model Selection Summary

| Operation | Model | Rationale |
|---|---|---|
| Parse reports | Haiku | Structured extraction |
| Triage + cross-ref | Sonnet | Domain knowledge for categorization |
| Draft (minor) | Haiku | Simple acknowledgments |
| Draft (clarification) | Sonnet | Economic understanding |
| Draft (substantive) | Sonnet | Evidence synthesis |
| Draft (hard/escalate) | Opus | Deep reasoning |
| Verify claims | Haiku | Mechanical cross-checking |
| Compile LaTeX | Haiku | Template assembly |

## Files

### Directory Structure

```
revisions/
├── SKILL.md                              # This orchestrator
├── prompts/
│   ├── master.prompt                     # Orchestration (8-step workflow)
│   ├── tasks/
│   │   ├── parse_comments.prompt         # Extract comments from reports
│   │   ├── triage.prompt                 # Categorize + cross-reference
│   │   ├── draft_response.prompt         # Draft response per comment
│   │   ├── verify_claims.prompt          # Cross-check against manuscript
│   │   └── compile_latex.prompt          # Assemble .tex output
│   └── components/
│       ├── response_patterns.prompt      # Style conventions from examples
│       └── latex_template.prompt         # Document skeleton + custom commands
├── scripts/
│   └── bootstrap.sh                      # Phase detection (fresh/resume)
├── templates/
│   └── response_document.tex             # LaTeX template
├── examples/                             # Example reports and response
└── current/                              # Runtime state (gitignored)
    ├── .status
    ├── config.json
    ├── comments_{prefix}.json            # Per-report parse output
    ├── comments.json                     # Merged comments
    ├── triage.json
    ├── triage_summary.md                 # Human-readable triage table
    ├── responses/
    ├── verification/                     # Per-comment verification
    │   ├── {id}.json
    │   └── {id}.md
    └── verification_summary.md           # Consolidated issues
```
