# Long-Running Agent for Economics Work

A workflow for Claude Code that handles multi-step economics projects autonomously.

## Setup

1. Copy the `econ_ra/` folder to your project root (or home directory if you want it global)

2. The folder structure:
```
econ_ra/
├── econ_ra.md              # Orchestrator (detects phase, routes to correct prompt)
├── prompts/             # Separate prompt for each phase
│   ├── interview.md     # Clarification questions
│   ├── planning.md      # Task list creation
│   ├── verification.md  # Check design
│   ├── execution.md     # Autonomous execution
│   └── wrapup.md        # Summary and retrospective
├── preferences.md       # Your accumulated preferences (builds over time)
├── current/             # Active project workspace (created automatically)
├── history/             # Past project logs (for learning)
└── templates/           # Optional: templates for common project types
```

## Architecture

The workflow runs **autonomously** through all phases, only pausing when user input is needed. Context isolation is maintained via "mental resets" between phases.

| Phase | Loads | Does NOT Load | Pauses For |
|-------|-------|---------------|------------|
| Interview | spec, preferences | code files | Answering questions |
| Planning | spec, clarifications, preferences | code files | Approving task list + thresholds |
| Execution | checks.md, task descriptions (via dispatcher) | tasks.json directly, spec, preferences | Nothing (runs autonomously) |
| Wrap-up | tasks.json, session_log | everything else | Reviewing flagged items |

**Key principles**:
- No phase explores code except execution. This preserves context for actual work.
- **Parallel execution by default**: Tasks with satisfied dependencies run simultaneously.
- **Context conservation**: Orchestrator never reads tasks.json directly—a lightweight haiku dispatcher returns only the task info needed.

## Usage

In Claude Code, type:
```
Use @econ_ra/econ_ra.md to tackle @notes/my_project.md
```

Or if `econ_ra/` is in your home directory:
```
Use @~/econ_ra/econ_ra.md to tackle @notes/my_project.md
```

To continue an interrupted project:
```
Use @econ_ra/econ_ra.md to continue
```

## What Happens

The orchestrator detects your current phase and loads the appropriate prompt:

| If this exists... | Phase | Prompt loaded |
|-------------------|-------|---------------|
| Nothing in current/ | Interview | `prompts/interview.md` |
| spec.md only | Interview (resume) | `prompts/interview.md` |
| clarifications.md | Planning | `prompts/planning.md` |
| tasks.json | Verification | `prompts/verification.md` |
| checks.md | Execution | `prompts/execution.md` |
| All tasks done | Wrap-up | `prompts/wrapup.md` |

## Context Isolation via Mental Resets

The problem without isolation:
```
Agent reads spec
Agent explores code files to understand context  ← wastes context
Agent does interview
Agent explores more code files for planning ← wastes more context
Agent creates tasks
...execution starts with context already 50% full
```

With mental resets between phases:
```
[INTERVIEW]
Loads: spec, preferences (small)
Asks questions, writes clarifications.md
--- MENTAL RESET: forget everything except output files ---

[PLANNING]  
Loads: spec, clarifications (fresh read, small)
Creates abstract task list (NO code exploration)
--- MENTAL RESET ---

[EXECUTION]
Loads: checks.md, task descriptions from dispatcher (minimal)
tasks.json stays in haiku dispatcher context, not orchestrator
NOW explores code, with ~85% context available for actual work
```

The workflow continues automatically—no manual re-invocation needed between phases.

## The Feedback Loop

The system gets better over time:

```
Project 1 → preferences.md updated with your defaults
Project 2 → fewer questions asked, better defaults assumed  
Project 3 → Claude references what worked in similar past projects
...
Project N → minimal interview, accurate task planning, calibrated checks
```

## Key Files

### Your Project Spec
Write this however you want—plain text, bullet points, whatever. Put it somewhere like `notes/project_name.md`:

```markdown
# Effect of X on Y

Data: Some data files
Goal: Estimate something
Approach: Some methods
Output: Tables and figures
```

### preferences.md
Accumulates over time. After each project, add lessons learned:
- Default methodological choices
- Sense check thresholds that worked
- Interview questions that were/weren't useful

### session_log.md
Created for each project in `econ_ra/current/`. Records:
- What was done
- Key results
- Which checks passed/failed
- Notes and flags

### Retrospective
After each project, briefly note:
- What worked
- What didn't  
- Preferences to add for next time

## Resuming Interrupted Work

If you close Claude Code mid-project, just invoke again:
```
Use @econ_ra/econ_ra.md to continue
```

Claude will detect the in-progress project and offer to resume.

## Tips

- **Write specs naturally**: Don't try to be formal—write like you're explaining to a smart RA
- **Answer interview questions concisely**: "Cluster at state level" not a paragraph
- **Review the task list**: This is your best chance to catch misunderstandings
- **Let flags accumulate**: Review flagged tasks in batches, don't interrupt execution
- **Do the retrospective**: 2 minutes of reflection compounds into much better future runs

## Example Session

```
You: Use @econ_ra/econ_ra.md to tackle @notes/minwage_project.md

Claude: [INTERVIEW PHASE - Loading: spec, preferences]

Here's what I found in your codebase:
- data/raw/qcew_2010_2020.dta (450MB) - QCEW employment data
- code/03_estimate.R - Has basic TWFE, no staggered DiD yet
...

[AskUserQuestion UI appears with clickable options]

┌─────────────────────────────────────────────────────────┐
│ Time period: Should we use the full range or drop COVID?│
│ ○ 2010-2019 (Recommended)                               │
│ ○ 2010-2020 full sample                                 │
│ ○ Other...                                              │
├─────────────────────────────────────────────────────────┤
│ Exclusions: Additional industry exclusions?             │
│ ○ Keep current (Recommended)                            │
│ ○ Also drop agriculture                                 │
│ ○ Other...                                              │
└─────────────────────────────────────────────────────────┘

You: [Select "2010-2019 (Recommended)" and "Keep current (Recommended)"]

[More AskUserQuestion batches for methodology, verification...]

Claude: [Writes clarifications.md, commits, MENTAL RESET]
        [PLANNING PHASE - Loading: spec, clarifications, preferences]

Task list (12 tasks):
1. Load QCEW data
2. Merge with MW data
...
12. Generate tables

[AskUserQuestion UI appears]
┌─────────────────────────────────────────────────────────┐
│ Task list: Approve the proposed task list?              │
│ ○ Approve as-is (Recommended)                           │
│ ○ Request changes                                       │
└─────────────────────────────────────────────────────────┘

You: [Select "Approve as-is"]

[AskUserQuestion UI for thresholds]
┌─────────────────────────────────────────────────────────┐
│ Pre-trends: How strict should the pre-trend check be?   │
│ ○ |coef| < 0.01 (Recommended)                           │
│ ○ |coef| < 0.005                                        │
│ ○ |coef| < 0.02                                         │
├─────────────────────────────────────────────────────────┤
│ ATT range: Expected treatment effect magnitude?         │
│ ○ -0.02 to -0.10 (Recommended)                          │
│ ○ -0.01 to -0.05                                        │
│ ○ -0.05 to -0.20                                        │
└─────────────────────────────────────────────────────────┘

You: [Select recommended options]

Claude: [Writes tasks.json + checks.md, commits, MENTAL RESET]
        [EXECUTION PHASE - Parallel execution]

[Wave 1: Tasks 1-2 running in parallel]
Task 1: Loading QCEW... ✓ 2.1M rows
Task 2: Loading MW data... ✓ 50 states

[Wave 2: Task 3 (depends on 1,2)]
Task 3: Merging... ✓ 99.2% match

[Wave 3: Tasks 4-6 in parallel]
...

[Wave 5: Task 8]
Task 8: Heterogeneity... ⚠️ FLAGGED: Construction +0.03 (expected negative)

[Final wave]
Task 12: Tables... ✓

All complete. 1 flagged.

[WRAP-UP PHASE]
[AskUserQuestion UI appears]
┌─────────────────────────────────────────────────────────┐
│ Flagged: Construction effect is positive. How to handle?│
│ ○ Accept and continue                                   │
│ ○ Investigate further                                   │
│ ○ Note as caveat in paper                               │
└─────────────────────────────────────────────────────────┘

You: [Select "Accept and continue"]

Claude: [Updates preferences, archives]
Done. Ready for next project.
```
