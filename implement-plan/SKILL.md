---
name: implement-plan
description: >-
  Implements Claude Code plan documents from ~/.claude/plans/. Discovers the
  most recent plan (or a user-specified path), confirms scope for optional
  tiers, executes items in order, and runs verification. Use when the user
  says implement plan, execute plan, /implement-plan, or wants to carry out
  a Claude Code plan in Cursor.
disable-model-invocation: true
---

# Implement Plan

Execute a Claude Code plan document in Cursor agent mode. Plans live in
`~/.claude/plans/*.md` and are produced by Claude Code plan mode.

## Invocation

```
/implement-plan                          # latest plan
/implement-plan @~/.claude/plans/foo.md  # specific plan
implement the latest Claude Code plan
execute plan
```

## Workflow

```
Resolve plan → Read structure → Scope gate → Execute → Verify → Report
```

### Step 1 — Resolve plan path

1. If the user passed a path or `@file`, use it.
2. Otherwise run:

```bash
bash ~/.cursor/skills/implement-plan/scripts/latest_plan.sh
```

3. If the script returns nothing, stop and tell the user no plans exist in
   `~/.claude/plans/`.
4. Echo the resolved path and plan title (first `#` heading) before proceeding.

Override the plans directory with `CLAUDE_PLANS_DIR` if needed.

### Step 2 — Read and extract structure

Read the full plan and bucket content heuristically:

| Section pattern | Treatment |
|-----------------|-----------|
| `## Context` | Background only — do not implement |
| `## Scope` + `Tier A/B/C` | Actionable work items |
| `### A1`, `### B6`, numbered `## Changes` | Individual todos |
| `## Out of scope` / `preserve` | Hard constraints — never violate |
| `## Critical files` | Read before editing |
| `## Verification` | Mandatory final checklist |

### Step 3 — Scope gate (tiered plans)

Before any code changes:

1. List detected tiers and classify each as **required**, **core**, or
   **optional** based on plan wording (`optional`, `if risk-averse`,
   `separate commit`, `if Tier B is in scope`).
2. Use **AskQuestion** (or ask conversationally) when optional tiers exist.
   Defaults:
   - **Implement**: all non-optional tiers and items not explicitly marked optional
   - **Ask about**: tiers/items labeled optional, conditional branches, or
     items marked "separate commit"
3. Record chosen scope in a short in-chat checklist. Do not edit the source
   plan file.

### Step 4 — Build and execute task list

1. Create todos from scoped items (one per `A1`/`B6`/numbered change).
2. Read every file listed under **Critical files** before the first edit.
3. Implement items **in plan order** — dependencies are often implicit.
4. Respect **Out of scope** constraints throughout.
5. Minimize diff scope; match existing code style.
6. Do **not** commit unless the user asks.
7. When the plan touches a Makefile pipeline, prefer `make` targets over
   direct `Rscript`/`julia` invocations.
8. Execute — do not re-plan. If a step is ambiguous, pick the smallest
   reasonable interpretation and note it in the completion report.

**Execution discipline** (from taskmaster): do not narrate remaining work —
open files, write code, run commands. Progress is not completion; every
scoped item and verification step must finish before reporting done.

### Step 5 — Verification (mandatory)

1. Run **every** command in the plan's `## Verification` section.
2. If no verification section exists, run a minimal smoke check relevant to
   the plan (e.g. `make -n <target>` for Makefile plans).
3. A failing step blocks "done" — fix it or report the blocker with evidence.

### Step 6 — Completion report

End with:

1. Plan path and title
2. Scope implemented (tiers/items)
3. Items skipped and why
4. Files changed
5. Verification results (pass/fail per step)
6. Assumptions or deviations from the plan

## Example

```
User: /implement-plan

Agent:
  → latest_plan.sh → ~/.claude/plans/can-you-audit-the-polished-stream.md
  → "Makefile Audit & Simplification Plan"
  → Ask: Tier A only / A+B (core) / A+B+C (full)?
  → User: A+B
  → Todos: A1–A5, B6–B8 (skip B9, B-stamps unless asked)
  → Edit code/Makefile; update CLAUDE.md if help text changes
  → Run verification: make -n model, make help, grep MODEL_GOF, etc.
  → Report
```

## Out of scope for this skill

- Plan authoring (Claude Code plan mode handles that)
- Persistent state / resume (v1 — add `continue` later if needed)
- Subagent orchestration (plans are fully specified; single agent is enough)
