# Proposals: Adopting Ideas from Sant'Anna's Claude Code Workflow

**Date:** 2026-02-10
**Source:** https://psantanna.com/claude-code-my-workflow/workflow-guide.html
**Repo:** https://github.com/pedrohcgs/claude-code-my-workflow

---

## Context

Pedro Sant'Anna built a comprehensive Claude Code workflow for academic slide
development (Beamer/Quarto), R code review, and research automation. His system
uses 10 specialized agents, 20 skills, 17 path-scoped rules, 4 hooks, and a
multi-layer memory system. We reviewed the full guide and repo to identify ideas
worth adopting into our own skills repository (copyedit, econ_ra, parsepdf,
referee, revisions).

This document summarizes what we found, what we already do well, and concrete
proposals for what to adopt.

---

## 1. What We Already Do Well (No Action Needed)

These capabilities in Sant'Anna's system are already present (or better) in ours:

| Capability | Our Implementation |
|---|---|
| Multi-agent orchestration | 5 skills with SKILL.md orchestrators |
| Dynamic model routing | Haiku/Sonnet/Opus/Extended Thinking per task |
| Script-first optimization | bash bootstrap, dispatcher.py, status.sh |
| File-first communication | revisions & econ_ra write to files, return summaries |
| Adversarial critic-fixer loops | revisions has fixer-critic (max 5 rounds) |
| Paper type diagnostics | A/B/C/D classification shared by copyedit & referee |
| Phase enforcement | Strict bootstrap -> phase -> subagent dispatch |
| Context isolation | Subagents work autonomously; orchestrator coordinates |

---

## 2. High-Value Gaps to Fill

### Proposal A: Project-Level CLAUDE.md

**What it is.** A ~100-line "constitution" that Claude reads every session. It
defines the project's principles, folder structure, available commands, and a
quick-reference table of all skills.

**Why it matters.** Right now Claude starts each session with no project-level
context. Each SKILL.md only activates when its skill is invoked. A CLAUDE.md
gives Claude immediate orientation: what this repo is, how the skills relate,
and what conventions to follow.

**What to include:**
- Core principles (plan first, verify after, file-first communication)
- Folder structure (5 skills + reference/)
- Quick-reference table of all skills with invocation syntax
- Common conventions (LLM tagging with `\begin{llm}`, paper type A/B/C/D)
- Cross-skill dependencies (referee -> parsepdf -> copyedit)

**Reference:** `santanna_workflow/CLAUDE.md`

---

### Proposal B: MEMORY.md Conventions with [LEARN] Tags

**What it is.** A structured auto-memory file using `[LEARN:category]` entries
that persist corrections across sessions.

**Why it matters.** We have the auto-memory file at
`~/.claude/projects/.../memory/MEMORY.md` but it's empty with no conventions.
Sant'Anna uses entries like `[LEARN:citation] Post-LASSO is Belloni (2013), NOT
Belloni (2014)` to prevent recurring mistakes.

**What to include:**
- Convention: `[LEARN:category] wrong -> right` format
- Categories: citation, notation, workflow, tooling, debugging
- Keep under 200 lines (system prompt truncates after that)
- Link to separate topic files for detailed notes

**Reference:** `santanna_workflow/MEMORY.md`

---

### Proposal C: Hooks (4 Types)

**What it is.** Shell/Python scripts that fire on Claude Code events (Stop,
PreToolUse, PreCompact, Notification).

**Why it matters.** We have zero hooks. These provide:
1. **Notification** (macOS alert when Claude finishes a task)
2. **File protection** (block accidental edits to SKILL.md, settings.json, etc.)
3. **Pre-compact** (save context snapshot before auto-compression)
4. **Log reminder** (nudge Claude to update session logs)

**Priority:** Start with notification + file protection. Add pre-compact and log
reminder if we adopt session logging.

**Implementation notes:**
- Notification hook: ~10 lines, uses `osascript` for macOS
- File protection: customizable list of protected file patterns
- Pre-compact: appends timestamped marker to session log
- Log reminder: Python script that counts responses since last log update

**Reference:** `santanna_workflow/.claude/hooks/`

---

### Proposal D: Session Logging / Context Persistence

**What it is.** Structured session logs saved to disk at three trigger points:
post-plan, incremental updates, and end-of-session.

**Why it matters.** Plans, decisions, and reasoning currently evaporate between
sessions. Saving them to disk enables:
- Recovery after context compression
- Continuity across sessions
- Audit trail for design decisions

**What to include:**
- Directory: `quality_reports/session_logs/YYYY-MM-DD_description.md`
- Template: status, objectives, file changes, decisions, learnings, open items
- Three triggers: post-plan, incremental (every N responses), wrap-up

**Adaptation needed:** Our skills already have state files (.status, tasks.json,
claims.json, etc.). Session logging would complement these with human-readable
narrative context. Consider whether this should be project-level or per-skill.

**Reference:** `santanna_workflow/templates/session-log.md`

---

### Proposal E: WORKFLOW_QUICK_REF.md

**What it is.** A concise reference defining when Claude asks vs. just executes,
quality gates, and non-negotiable conventions.

**Why it matters.** Establishes a clear "contractor" interaction model. Claude
knows to ask at design forks but just execute for obvious fixes, verification,
and documentation.

**What to include:**
- The ask/execute boundary
- Quality gates (adapt from our existing per-skill thresholds)
- Non-negotiable preferences (path conventions, figure standards, etc.)
- Exploration mode for experimental work

**Reference:** `santanna_workflow/.claude/WORKFLOW_QUICK_REF.md`

---

### Proposal F: Expanded Settings Permissions

**What it is.** Pre-approve common bash commands to reduce permission friction.

**Current state:** Our `.claude/settings.local.json` allows basic git, python,
and a few scripts.

**What to add:**
- Full git suite (fetch, checkout, merge, stash)
- GitHub CLI (gh pr, gh run, gh api)
- LaTeX compilation (xelatex, bibtex, latexmk)
- R execution (Rscript)
- Quarto (quarto render)
- File utilities (ls, wc, sort, mkdir, open, chmod)
- Project scripts by pattern

**Reference:** `santanna_workflow/.claude/settings.json`

---

## 3. Interesting but Lower Priority

### Quality Scoring with Deduction Schedules

Sant'Anna assigns numerical scores (80/90/95 thresholds) with specific point
deductions per issue type (equation overflow: -20, broken citation: -15, etc.).
A `quality_score.py` script automates this.

**Assessment:** Useful for slide development but less clear how to adapt for our
use cases (copyediting, research projects, referee reports). Could adapt the
concept with domain-specific rubrics later.

### Exploration Folder with Fast-Track Workflow

A dedicated `explorations/` folder with relaxed quality thresholds (60/100),
no planning required, and structured archiving.

**Assessment:** Nice sandbox concept. Our econ_ra already has a working directory
pattern. Could adopt the archiving discipline (README explaining why abandoned).

### "Just Do It" Mode

Syntax: "Translate X. Just do it." Runs full verify-review-fix loop, skips
final approval, auto-commits if score >= 80.

**Assessment:** Our orchestrators already have autonomous execution. The explicit
trigger phrase is a nice UX pattern but not critical.

### Path-Scoped Rules

Rules that auto-load based on file patterns (e.g., `.tex` files trigger
beamer-specific rules). Uses YAML `paths:` frontmatter.

**Assessment:** Powerful for large projects with many file types. Our skills
already scope their own rules internally. Worth considering if we add more
file-type-specific behavior.

---

## 4. Agent and Rule Inventory (For Reference)

### Sant'Anna's 10 Agents

| Agent | Focus | Relevance to Us |
|---|---|---|
| proofreader | Grammar, typos, consistency | Overlaps with our copyedit |
| slide-auditor | Layout, overflow, spacing | Slide-specific, low priority |
| pedagogy-reviewer | Narrative arc, notation | Teaching-specific |
| r-reviewer | R code quality | Useful if we add R review |
| domain-reviewer | Substantive correctness | Adaptable template |
| tikz-reviewer | TikZ diagram quality | Niche |
| quarto-critic | Beamer-Quarto parity (read) | Niche |
| quarto-fixer | Apply critic fixes (write) | Niche |
| beamer-translator | Beamer -> Quarto | Niche |
| verifier | End-to-end compilation check | Useful pattern |

**Most transferable:** domain-reviewer (5-lens framework: assumption audit,
derivation check, citation fidelity, code-theory alignment, logic chain) and
verifier (end-to-end output verification).

### Sant'Anna's 17 Rules (Path-Scoped + Always-On)

**Always-on (3):** plan-first-workflow, orchestrator-protocol, session-logging

**Path-scoped (14):** quality-gates, verification-protocol, replication-protocol,
r-code-conventions, knowledge-base-template, beamer-quarto-sync, no-pause-beamer,
single-source-of-truth, proofreading-protocol, pdf-processing, tikz-visual-quality,
orchestrator-research, exploration-fast-track, exploration-folder-protocol

**Most transferable:** plan-first-workflow (save plans to disk), quality-gates
(scoring rubric concept), replication-protocol (4-phase replication approach).

---

## 5. Recommended Implementation Order

| Priority | Proposal | Effort | Impact |
|---|---|---|---|
| 1 | A: CLAUDE.md | Low (1 file) | High - session orientation |
| 2 | C: Hooks (notify + protect) | Low (2 scripts + settings) | High - quality of life |
| 3 | B: MEMORY.md conventions | Low (seed + document) | Medium - prevents recurring errors |
| 4 | F: Expanded settings | Low (edit 1 file) | Medium - reduces friction |
| 5 | E: WORKFLOW_QUICK_REF.md | Medium (design decisions) | Medium - interaction clarity |
| 6 | D: Session logging | Medium (templates + hooks) | Medium - context persistence |

---

## 6. Files Downloaded

All reference files from Sant'Anna's repo are saved in this directory:

```
reference/santanna_workflow/
├── PROPOSALS.md              <- This document
├── CLAUDE.md                 <- Project constitution template
├── MEMORY.md                 <- Auto-memory with [LEARN] tags
├── .claude/
│   ├── settings.json         <- Full permissions + hooks config
│   ├── WORKFLOW_QUICK_REF.md <- Ask vs execute contract
│   ├── hooks/
│   │   ├── notify.sh         <- macOS notification on Stop
│   │   ├── protect-files.sh  <- Block edits to critical files
│   │   ├── pre-compact.sh    <- Save context before compression
│   │   └── log-reminder.py   <- Nudge to update session logs
│   ├── agents/               <- 10 agent definitions
│   │   ├── proofreader.md
│   │   ├── domain-reviewer.md
│   │   ├── slide-auditor.md
│   │   ├── r-reviewer.md
│   │   ├── quarto-critic.md
│   │   ├── quarto-fixer.md
│   │   ├── pedagogy-reviewer.md
│   │   ├── beamer-translator.md
│   │   ├── tikz-reviewer.md
│   │   └── verifier.md
│   ├── rules/                <- 17 rule definitions
│   │   ├── orchestrator-protocol.md
│   │   ├── plan-first-workflow.md
│   │   ├── session-logging.md
│   │   ├── quality-gates.md
│   │   ├── exploration-fast-track.md
│   │   ├── verification-protocol.md
│   │   ├── replication-protocol.md
│   │   ├── knowledge-base-template.md
│   │   ├── r-code-conventions.md
│   │   ├── beamer-quarto-sync.md
│   │   ├── no-pause-beamer.md
│   │   ├── single-source-of-truth.md
│   │   ├── proofreading-protocol.md
│   │   ├── pdf-processing.md
│   │   ├── tikz-visual-quality.md
│   │   ├── orchestrator-research.md
│   │   └── exploration-folder-protocol.md
│   └── skills/               <- 4 representative skill definitions
│       ├── commit/SKILL.md
│       ├── lit-review/SKILL.md
│       ├── research-ideation/SKILL.md
│       └── slide-excellence/SKILL.md
├── templates/
│   ├── session-log.md
│   ├── quality-report.md
│   ├── archive-readme.md
│   └── exploration-readme.md
└── guide/
    └── workflow-guide-extracted.md   <- Full guide content extraction
```

**Note:** Most files contain comprehensive descriptions extracted via WebFetch
rather than byte-for-byte copies, due to the way the content was retrieved. The
hooks, settings.json, CLAUDE.md, MEMORY.md, and WORKFLOW_QUICK_REF.md are
closest to verbatim. The original source is always available at the repo URL.
