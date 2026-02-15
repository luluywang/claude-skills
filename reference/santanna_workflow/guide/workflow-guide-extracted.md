# Sant'Anna Workflow Guide -- Extracted Content

**Source:** https://psantanna.com/claude-code-my-workflow/workflow-guide.html
**Repo:** https://github.com/pedrohcgs/claude-code-my-workflow
**Title:** My Claude Code Setup: A Comprehensive Guide to Multi-Agent Slide Development,
Code Review, and Research Automation
**Author:** Pedro H. C. Sant'Anna
**Date:** 2026-02-06

---

## Document Structure

1. Why This Workflow Exists
2. Getting Started
3. The System in Action
4. The Building Blocks
5. Workflow Patterns
6. Customizing for Your Domain
7. Appendix: File Reference

---

## 1. Why This Workflow Exists

### The Problem
- Context loss between sessions (notation choices, approvals, bug fixes)
- Inconsistent quality across slides (spacing, citations, figure rendering)
- Manual, exhausting review processes prone to errors
- Lack of mathematical verification in slides

### What Makes Claude Code Different
- Read & edit files with surgical precision
- Execute shell commands (compile, render, execute scripts)
- Access git history (commits, PRs, branches)
- Persistent memory across sessions (CLAUDE.md, MEMORY.md)
- Orchestrator mode for autonomous coordination
- Multi-agent workflows (10 specialized agents)
- Automated quality scoring with gates

### Case Study
Econ 730 at Emory: PhD causal panel data course with 6+ complete lectures
(140+ slides each), dual Beamer/Quarto versions, interactive Plotly charts,
TikZ diagrams, and R replication scripts.

---

## 2. Getting Started

### Setup Steps
1. Fork repository
2. Clone locally
3. Open terminal in project directory
4. Run `claude`
5. Paste starter prompt (fill bracketed placeholders)
6. Claude reads CLAUDE.md and all rules
7. Claude proposes configuration adaptations
8. User approves
9. Claude updates all config files

### Starter Prompt Template
Includes placeholders for: project name, description (2-3 sentences), tool stack
(LaTeX/Beamer, R, Quarto), and configuration file adaptation.

---

## 3. The System in Action

### Why Specialized Agents Beat One-Size-Fits-All
Each agent has a focused mandate with specific tools and model assignment.
Prevents scope creep and enables parallel execution.

### The Adversarial Pattern: Critic + Fixer
Read-only critic -> write fixer -> read-only re-audit. Prevents downplaying issues.
- Round 1: Critic finds 12 issues (3 critical)
- Round 2: Fixer addresses 12/12
- Round 3: Critic re-audits, finds 2 remaining
- Up to 5 rounds maximum

### The Orchestrator: 7-Step Loop
1. IMPLEMENT (execute plan)
2. VERIFY (compile/render check)
3. REVIEW (parallel agents by file type)
4. FIX (priority-ordered corrections)
5. RE-VERIFY (confirmation)
6. SCORE (quality gates assessment)
7. Loop or Present (if <80, iterate; else done)

### Agent Selection Logic
- `.tex` only -> proofreader, slide-auditor, pedagogy-reviewer
- `.qmd` only -> same agents
- `.qmd` + matching `.tex` -> above plus quarto-critic
- `.R` scripts -> r-reviewer
- TikZ present -> tikz-reviewer
- Domain content -> domain-reviewer
- Multiple formats -> verifier for cross-format parity

### Quality Scoring: The 80/90/95 System
- 80+ = Safe to commit
- 90+ = Ready for PR/deployment
- 95+ = Excellence target
- <80 = Blocked until fixed

Deduction schedule:
- Equation overflow: -20
- Broken citation: -15
- Equation typo: -10
- Text overflow: -5
- Label overlap: -5
- Notation inconsistency: -3

### Creating Your Own Domain Reviewer
Template: 5-lens framework (assumption audit, derivation check, citation fidelity,
code-theory alignment, logic chain). Customize lenses for your field.

---

## 4. The Building Blocks

### CLAUDE.md -- Project Constitution
- ~120 lines target
- Core principles (4-5 bullets)
- Folder structure
- Commands (compilation, deployment, tools)
- Customization tables (Beamer, CSS)
- Current state (progress tracking)
- Skill quick reference

Critical constraint: Claude reliably follows about 100-150 custom instructions.
System prompt uses ~50, leaving ~100-150 for project config. CLAUDE.md + always-on
rules must stay within this budget.

### Rules -- Domain Knowledge That Auto-Loads
Path-scoped rules use YAML `paths:` frontmatter. Load conditionally based on
file patterns being worked on.

Always-on rules (~100 lines total):
- plan-first-workflow.md
- orchestrator-protocol.md
- session-logging.md

Path-scoped rules (14): load on relevance to keep instruction budget conservative.

### Skills -- Reusable Slash Commands
20 skills total, each in `.claude/skills/[name]/SKILL.md`.

### Agents -- Specialized Reviewers
10 agents, each in `.claude/agents/[name].md`.

Multi-model strategy:
- Opus: Complex translation requiring dual document understanding
- Sonnet: Fast, bounded-scope work
- Inherit: Default (uses session model)

Cost optimization example: quarto-critic on Opus, quarto-fixer on Sonnet = 40-60% savings.

### Settings -- Permissions and Hooks
`.claude/settings.json` controls allowed operations + hook definitions.
See hooks/ directory for implementations.

### Memory -- Cross-Session Persistence

Four layers:
1. `CLAUDE.md` -- persists, rarely updated, ~150 lines max
2. `MEMORY.md` -- survives compression, updated on [LEARN] tags
3. `quality_reports/plans/` -- timestamps task strategy
4. `quality_reports/session_logs/` -- captures reasoning incrementally

---

## 5. Workflow Patterns

### Pattern 1: Plan-First Development (8 Steps)
1. Enter Plan Mode
2. Draft plan (approach, files, verification)
3. Save to quality_reports/plans/YYYY-MM-DD_description.md
4. Present plan to user
5. User approves or revises
6. Save initial session log
7. Orchestrator activates
8. Update log + mark COMPLETED

### Pattern 2: Contractor Mode (Orchestrator)
User is client, plan is blueprint, orchestrator implements autonomously.
Only surfaces decisions requiring human judgment.

"Just Do It" syntax: "Translate Lecture 5. Just do it."
- Runs full verify-review-fix loop
- Skips final approval pause
- Auto-commits if score >= 80
- Still presents summary

### Pattern 3: Creating a New Lecture
Full lecture creation workflow from topic specification through compilation.

### Pattern 4: Translating Beamer to Quarto
Beamer PDF is the FLOOR, not the ceiling. Content parity, environment parity,
notation fidelity. NO PDF images in Quarto (convert to SVG).

### Pattern 5: Replication-First Coding
4 phases: Inventory -> Translate -> Verify -> Only then extend.
Tolerance: <0.01 for estimates, <0.05 for SEs.

### Pattern 6: Multi-Agent Review
Parallel execution of up to 3 agents for independent subtasks.
Agents cannot see each other's output; sequential for dependent tasks.

### Pattern 7: Self-Improvement Loop
[LEARN] tags in MEMORY.md persist corrections across sessions.

### Pattern 8: Devil's Advocate
"Create a Devil's Advocate. Have it challenge this design with 5-7 questions."
Catches unstated assumptions, alternative orderings, notation confusion.

### Research Workflows

**Pattern 9: Parallel Agents for Research**
3 agents simultaneously for independent subtasks: multi-paper review,
independent figure generation, comparative estimator simulations.

**Pattern 10: Research Exploration**
Work in explorations/ folder. 60/100 quality. No plan needed.
Decision: keep exploring, graduate (80/100), or archive.

**Pattern 11: Research Skills**
- /lit-review -- search, synthesize, identify gaps
- /research-ideation -- generate questions, hypotheses, strategies
- /interview-me -- formalize vague ideas into specifications
- /review-paper -- full manuscript review with objections
- /data-analysis -- end-to-end R analysis with automation

### Fast-Track vs Plan-First Decision Tree
| Question | Answer | Workflow |
|----------|--------|----------|
| Will this ship? | YES | Plan-First (80/100) |
| Am I testing an idea? | YES | Fast-Track (60/100) |
| Improves project? | NO | Don't build |

---

## 6. Customizing for Your Domain

### Step 1: Build Your Knowledge Base
- Notation registry (symbol, meaning, lecture, anti-patterns)
- Applications database (paper, dataset, package, lecture)
- Validated design principles
- Beamer environments / CSS classes
- R code pitfalls

### Step 2: Create Your Domain Reviewer
Adapt the 5-lens framework for your field.

### Step 3: Adapt Your Theme
Custom SCSS for Quarto, institutional colors/fonts.

### Step 4: Add Project-Specific Skills
Start with just CLAUDE.md and 2-3 skills (/compile-latex, /proofread, /commit).
Add rules and agents as you discover what you need.

### Tips from 6+ Sessions
- Context preservation: avoid /clear, prefer auto-compression
- Plans on disk enable instant recovery after compression
- Session logs capture reasoning before it's lost
- Quality gates prevent shipping broken work
- Instruction budget is real: stay under ~150 custom instructions

---

## 7. Appendix: File Reference

### All Agents (10)
proofreader, slide-auditor, pedagogy-reviewer, r-reviewer, domain-reviewer,
tikz-reviewer, quarto-critic, quarto-fixer, beamer-translator, verifier

### All Skills (20)
compile-latex, deploy, extract-tikz, proofread, visual-audit, pedagogy-review,
review-r, qa-quarto, slide-excellence, translate-to-quarto, validate-bib,
devils-advocate, create-lecture, commit, lit-review, research-ideation,
interview-me, review-paper, data-analysis

### All Rules (17)
orchestrator-protocol, plan-first-workflow, session-logging (always-on)
quality-gates, verification-protocol, replication-protocol, r-code-conventions,
knowledge-base-template, beamer-quarto-sync, no-pause-beamer,
single-source-of-truth, proofreading-protocol, pdf-processing,
tikz-visual-quality, orchestrator-research, exploration-fast-track,
exploration-folder-protocol (path-scoped)

### Hooks (4)
notify.sh (Notification/Stop), protect-files.sh (PreToolUse/Edit|Write),
pre-compact.sh (PreCompact), log-reminder.py (Stop)
