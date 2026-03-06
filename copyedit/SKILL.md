---
name: copyedit
description: |
  Comprehensive copyediting for text documents (md, tex, txt). Reviews grammar,
  AI patterns, word choice, sentence structure, flow, and methodology clarity.
  Only activate when user explicitly invokes '/copyedit'.
---

# Copyedit Skill

Comprehensive copyediting system for academic writing, following McCloskey and Cochrane principles.

## Invocation

### Full Review (Default)

```
/copyedit review paper.tex          # Comprehensive review of single file
/copyedit review *.tex              # All tex files in current directory
/copyedit review paper/             # All tex/md files in directory
```

### Task Edit — Catch-All (No Subagents)

```
/copyedit <any task> file.tex                  # Task edit: do task, follow principles
/copyedit <any task> file.tex:50-80            # Task edit on line range
/copyedit <any task> file.tex "Intro"          # Task edit on named section
```

Examples:

```
/copyedit make sure the notation for the estimator is consistent in main.tex
/copyedit add a sentence explaining the intuition after equation 3 in results.tex
/copyedit move the limitations paragraph before the conclusion in discussion.tex
/copyedit tighten the second paragraph of the intro in main.tex
```

Task-first editing in the orchestrator context. No subagents, no notes files, no pipeline. Accomplishes the user's task, then applies principle guardrails (surface fixes + AI tell check) to every new or changed sentence. Shows annotated diff, applies on approval.

### Targeted Rewrite (No Subagents)

```
/copyedit rewrite intro.tex:50-80                    # Rewrite lines 50-80
/copyedit rewrite intro.tex "Model"                  # Rewrite named section
/copyedit rewrite intro.tex:50-80 --principles 2,5   # Apply only principles 2 and 5
/copyedit rewrite results.tex "Counterfactuals"       # Rewrite by section name
```

Rewrites a section directly in the orchestrator context. No subagents, no notes files, no pipeline. Applies the 14 writing principles plus surface fixes (colons, em-dashes, transitions, hedging). Shows annotated diff, applies on approval.

### Single Task

```
/copyedit grammar intro.tex                      # Grammar only (auto-applied)
/copyedit ai_detection *.tex                     # AI tells check (full output)
/copyedit ai_detection --only-issues *.tex       # AI tells check (issues only, passes suppressed)
/copyedit word_choice methods.tex                # Word choice review
/copyedit sentence intro.tex                     # Sentence structure analysis
/copyedit structure paper/                       # Paper structure analysis
/copyedit flow paper/                            # Flow extraction
/copyedit quality paper/                         # Writing quality assessment
/copyedit methodology paper/                     # Methodology clarity
```

### Number Management

```
/copyedit number_fix mode=A intro.tex            # Annotate hard-coded numbers (run once after writing)
/copyedit number_fix mode=B *.tex                # Refresh all annotated numbers after pipeline reruns
/copyedit number_fix intro.tex                   # Auto-detect mode (Mode B if HARDCODED annotations exist)
```

**Workflow:** Run Mode A once to tag every hard-coded number with its source (scalar file or table cell). After each data pipeline rerun, run Mode B to refresh all tagged numbers automatically.

### Utility Commands

```
/copyedit apply                     # Apply all marked [x] changes
/copyedit interactive notes/simplifications.md  # Walk through suggestions
/copyedit continue                  # Resume interrupted review
```

---

## Available Tasks

### Fast-Path Edits (No Subagents, Orchestrator-Direct)

| Task | Output | Description |
|------|--------|-------------|
| `task_edit` | Direct file edits | Execute any free-form task, then apply principle guardrails to new/changed text. Catch-all route. |
| `rewrite` | Direct file edits | Apply 14 writing principles + surface fixes to a specific section. No notes files. |

### File-Level Tasks (Parallel, Haiku)

| Task | Output | Description |
|------|--------|-------------|
| `grammar` | notes/copy_edits.md | Auto-fix spelling, punctuation, syntax errors |
| `ai_detection` | notes/ai_detection.md, notes/ai_detection_issues.md, notes/simplifications.md | Flag AI-generated patterns; severity-sorted; issues-only file auto-generated |
| `word_choice` | notes/word_choice_review.md | Anglo-Saxon over Latin, weak verbs, wordiness |
| `sentence` | notes/sentence_analysis.md | Length variation, rhythm, S-V-O clarity |

### Paper-Level Tasks (Sequential, Sonnet)

| Task | Output | Description |
|------|--------|-------------|
| `structure` | notes/structure_analysis.md | High-level paper organization |
| `flow` | notes/flow_extraction.md | Paragraph skeleton and flow analysis |
| `quality` | notes/writing_quality.md | Paragraph-level writing quality (focus, mechanism, precision) |
| `methodology` | notes/methodology_review.md | Identification strategy clarity |

### Number Management (Opt-In, Sonnet)

| Task | Output | Description |
|------|--------|-------------|
| `number_fix` | notes/number_fix_report.md | Annotate or refresh hard-coded numbers from scalars/tables |

**Does not run in `review` or `full` — must be invoked explicitly.** Requires data pipeline output to be current.

| Mode | Description |
|------|-------------|
| `mode=A` | Annotate hard-coded numbers with `% HARDCODED[source]` comments (run once) |
| `mode=B` | Update annotated numbers to match current source data (run after pipeline reruns) |

---

## AI Detection: Severity Tiers and Flags

### Severity Tiers

Every flagged entry in `ai_detection.md` carries one of four severity labels. Output is sorted Critical → High → Medium → Low within each file section.

| Tier | Label | Examples |
|------|-------|---------|
| 1 | **Critical** | Smarmy reframing ("It's not X, it's Y"), stacked hedges (2+ per sentence), missing causal mechanism |
| 2 | **High** | AI vocabulary used 2+ times; results-first openings with no tension; inventory-style numbers |
| 3 | **Medium** | Transition overuse (Moreover, Furthermore); template structures; meta-commentary; padding phrases |
| 4 | **Low** | Single-instance AI vocabulary; minor parentheticals; minor hedging; low-confidence Part C flags |

### --only-issues Flag

```
/copyedit ai_detection --only-issues *.tex
```

Suppresses entries where the verdict is "pass" or "no issues found." The full `ai_detection.md` is always written. The wrapup step always generates `ai_detection_issues.md` as an issues-only filtered view regardless of whether the flag is used.

### Resume Behavior

When an `ai_detection` run is interrupted mid-way (e.g., context exhausted after processing some files), the skill tracks which files completed in `.copyedit_status`:

```
ai_detection_complete: [intro.tex, methods.tex]
ai_detection_pending: [results.tex, conclusion.tex]
```

On the next `/copyedit ai_detection` invocation (or any `/copyedit` invocation), the orchestrator checks `ai_detection_pending`. If the list is non-empty, it automatically routes to the resume path — skipping already-completed files and running only the remaining ones. No re-processing of completed files occurs.

To force a full re-run from scratch, start a new session: `/copyedit review` will archive prior output and reset all state.

---

## Request Mapping

| User Says | Tasks Invoked |
|-----------|---------------|
| any free-form task + file (not a known keyword) | task_edit (catch-all fast-path, no subagents) |
| "rewrite this section", "rewrite lines" | rewrite (fast-path, no subagents) |
| "fix grammar", "check for errors" | grammar |
| "check for AI tells", "sound less AI" | ai_detection |
| "improve word choice", "make it punchier" | word_choice |
| "check sentence rhythm" | sentence |
| "improve structure", "paper flow" | structure |
| "extract flow", "first sentences" | flow |
| "grade writing quality", "improve writing" | quality |
| "comprehensive review" | grammar + ai_detection + word_choice + sentence |
| "full review" | All tasks (including quality) |

---

## Task Aliases

| Alias | Expands To |
|-------|------------|
| `<any task>` | task_edit catch-all (no subagents) — when not a known keyword |
| `rewrite` | Targeted principle rewrite (no subagents) |
| `review` | grammar + ai_detection + word_choice + sentence |
| `full` | All tasks including paper-level |
| `quick` | grammar + ai_detection |
| `quality` | writing_quality |

---

## How It Works

Read the orchestration instructions from `@prompts/master.prompt` and follow its workflow:

1. **Bootstrap** - Detect state (fresh or resume from `notes/.copyedit_status`)
2. **Interpret request** - Map user request to task list
3. **Diagnostic questions** - Determine paper type (A/B/C/D) and file scope
4. **Task enumeration** - Generate (file, task) pairs
5. **Output setup** - Initialize `notes/` directory with headers
6. **Execute** - Spawn Haiku subagents in parallel for file-level tasks
7. **Wrapup** - Run deduplication and summarize findings
8. **Deliver** - Present results with output file locations

---

## Paper Types

The skill adapts advice based on paper type:

- **Type A**: Intuitive topic, complex identification (e.g., EITC labor supply)
- **Type B**: Specialized topic needing institutional context (e.g., securitization)
- **Type C**: Methodological innovation
- **Type D**: Theory applied to data

Ask user to identify their paper type if doing structure/methodology review.

---

## Output Location

All output goes to a `notes/` directory alongside input files:

```
paper/
├── intro.tex
├── methods.tex
└── notes/                          # Created by copyedit
    ├── .copyedit_status
    ├── tasks.json
    ├── copy_edits.md               # Grammar log (auto-applied)
    ├── ai_detection.md             # AI pattern flags (full, severity-sorted)
    ├── ai_detection_issues.md      # Issues-only view (passes suppressed, severity-sorted)
    ├── simplifications.md          # Style suggestions
    ├── word_choice_review.md
    ├── sentence_analysis.md
    ├── structure_analysis.md
    ├── flow_extraction.md
    ├── writing_quality.md
    └── number_fix_report.md        # Number annotation/update log (opt-in)
```

---

## Output Format

All output files use checklist format (except copy_edits.md):

```markdown
### - [ ] Lines X-Y: [Brief description]

**Comment:** [Why this is problematic]

**Original:**
```
[Full sentence(s)]
```

**Proposed Revision:**
```
[Complete revision]
```

**Why better:** [Concrete improvements]
```

**Exception:** `copy_edits.md` uses log format: `File:Line -> Previous -> New`

---

## Interactive Review

After running a review, use interactive mode to walk through suggestions:

```
/copyedit interactive notes/simplifications.md
```

For each item:
- **Accept** - Mark with `[x]`
- **Reject** - Mark with `[-]`
- **Accept All Similar** - Mark all like items

Then apply accepted changes:

```
/copyedit apply
```

---

## Quality Standards

Follows McCloskey and Cochrane writing principles:

- Anglo-Saxon over Latin vocabulary (use -> utilize)
- Concrete over abstract language
- Active voice, strong verbs
- Sentence variety for rhythm
- Clear S-V-O structure
- Avoid AI-typical patterns (em-dashes, "Moreover", smarmy reframing)

Reference: `prompts/economics_writing_prompt.md` (comprehensive guide)

---

## Examples

### Example 0a: Task Edit (Catch-All, Fast)

```
/copyedit make sure the notation for the estimator is consistent in main.tex
```

Reads main.tex, normalizes estimator notation throughout, scans every changed sentence for principle violations (no AI tells, no em-dashes, no stacked hedges, etc.). Shows annotated diff with task changes and any principle fixes. Applies on approval. No subagents, no notes files.

```
/copyedit add a sentence explaining the intuition after equation 3 in results.tex
```

Reads results.tex, drafts the intuition sentence at the correct location, checks new text against surface fixes and AI tell patterns. Shows diff and applies on approval.

```
/copyedit tighten the second paragraph of the intro in main.tex "Introduction"
```

Reads the Introduction section, tightens the second paragraph, applies guardrails to changed sentences. Confirms before applying.

### Example 0b: Targeted Rewrite (Fast)

```
/copyedit rewrite intro.tex:50-80
```

Reads lines 50-80, applies all 14 writing principles plus surface fixes (colons, em-dashes, transitions, hedging). Shows annotated diff with principle citations. Applies on approval. No subagents, no notes files.

```
/copyedit rewrite results.tex "Counterfactuals" --principles 2,5,7
```

Rewrites the Counterfactuals section focusing on mechanism (#2), motivation (#5), and numbers (#7) only.

### Example 1: Quick Grammar Check

```
/copyedit grammar paper.tex
```

Output: Auto-corrected `paper.tex` + `notes/copy_edits.md` log

### Example 2: AI Detection

```
/copyedit ai_detection *.tex
```

Output: `notes/ai_detection.md`, `notes/ai_detection_issues.md`, and `notes/simplifications.md`

### Example 2a: AI Detection — Issues Only

```
/copyedit ai_detection --only-issues *.tex
```

Suppresses entries where the agent's verdict is "pass" or "no issues found." The raw `ai_detection.md` is still written; only the console output and `ai_detection_issues.md` reflect the filtered view. Entries are sorted by severity (Critical → High → Medium → Low).

### Example 3: Full Paper Review

```
/copyedit full paper/
```

Output: All notes/*.md files with comprehensive analysis

### Example 4: Apply Approved Changes

```
# After reviewing notes/simplifications.md and marking items [x]
/copyedit apply
```

Applies all `[x]` marked changes to source files

---

## Session History

Old copyedit runs are archived automatically when a new session starts:

```
notes/history/20250211_183000/   ← timestamped snapshot of prior run
notes/history/20250212_091500/   ← another prior run
```

The archival script (`scripts/new_session.sh`) moves `.md` files, `tasks.json`, and `.copyedit_status` into `notes/history/{timestamp}/`. It is idempotent — safe to run when no prior output exists.

To manually reset instead: `rm -rf notes/`

---

## Task Prompts

Individual task prompts are located at:

- `prompts/tasks/task_edit.prompt` **(catch-all fast-path, no subagents)**
- `prompts/tasks/rewrite.prompt` **(fast-path, no subagents)**
- `prompts/tasks/grammar.prompt`
- `prompts/tasks/ai_detection.prompt`
- `prompts/tasks/word_choice.prompt`
- `prompts/tasks/sentence_analysis.prompt`
- `prompts/tasks/structure.prompt`
- `prompts/tasks/flow_extraction.prompt`
- `prompts/tasks/writing_quality.prompt`
- `prompts/tasks/methodology.prompt`
- `prompts/tasks/apply_marked.prompt`
- `prompts/tasks/interactive_review.prompt`
- `prompts/tasks/deduplication.prompt`
- `prompts/tasks/number_fix.prompt`
