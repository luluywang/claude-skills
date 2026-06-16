---
name: copyedit
description: |
  Comprehensive copyediting for text documents (md, tex, txt). Reviews grammar,
  AI patterns, word choice, sentence structure, flow, and methodology clarity.
  Only activate when user explicitly invokes '/copyedit'.
---

# Copyedit Skill

Comprehensive copyediting system for academic writing, following McCloskey and Cochrane principles.

**Rule registry:** All enforceable rules live in `references/writing_quality_standards.md` with stable IDs (`R-*`). Every reference in this skill — surface_critic, task prompts, the wrapup gate — cites rules by ID. To change a rule, edit the standards file. The five priority rules (`R-COLON`, `R-EMDASH`, `R-40WORD`, `R-THROAT-CLEAR`, `R-WEAK-FOR-WEAK`) additionally appear as one-line reminders at the top of `surface_critic.prompt`.

**Invariant:** Every prose-emitting task runs the surface-critic gate on new/changed sentences before writing to disk. No exceptions. Applies in apply context (text written to .tex files) and proposal context (proposed revisions written to notes files).

## Invocation

### Full Review (Default)

```
/copyedit review paper.tex          # Comprehensive review of single file
/copyedit review *.tex              # All tex files in current directory
/copyedit review paper/             # All tex/md files in directory
```

**Review proposes; it never edits in-line.** `review`/`full` write findings to `notes/*.md` and leave your source untouched. Applying is a separate, explicit step you run when ready: `/copyedit implement` (apply with judgment) or `/copyedit apply` (apply marked items). A request that asks to review **and** apply in-line at once (e.g. "full review … aggressively edit in-line") is **loudly refused** on the apply half — the skill runs the review-only pass and tells you to run `implement` next. This decoupling is intentional: you see the proposals before the manuscript changes.

### Task Edit — Catch-All (No Subagents)

```
/copyedit <any task> file.tex                  # Task edit: do task, follow principles
/copyedit <any task> file.tex:50-80            # Task edit on line range
/copyedit <any task> file.tex "Intro"          # Task edit on named section
/copyedit --aggressive <any task> *.tex        # Skip approval, apply directly (review via git diff)
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
/copyedit --aggressive rewrite *.tex "Conclusion"    # Rewrite + skip approval (git diff review)
```

Rewrites a section directly in the orchestrator context. No subagents, no notes files, no pipeline. Applies the 15 writing principles plus surface fixes (colons, em-dashes, transitions, hedging). Shows annotated diff, applies on approval.

### Implement Review — Apply With Judgment (No Subagents)

```
/copyedit implement                       # Implement the whole review across all proposed files
/copyedit implement intro.tex             # Implement only proposals for one file
/copyedit implement --dry-run             # Print the apply/adapt/skip/defer plan; change nothing
/copyedit implement --min-severity=High   # Only act on High and Critical items
/copyedit implement intro.tex "Model"     # Implement within a named section
```

Second half of a decoupled workflow: run `review` (or `full`) to **find and propose** (writes `notes/*.md`), then `implement` to **apply with judgment**. Implement runs in the orchestrator (active session model — not a Haiku/Sonnet subagent) so the strongest available model reads the consolidated proposals plus the source and decides what and how to apply: it follows the project voice, honors load-bearing terms, resolves conflicts between overlapping suggestions, adapts proposed wording rather than pasting it, revisits flag-only items, and skips suggestions that do not improve the text. Every changed sentence passes the surface-critic gate before it is written. **Applies directly** — review the result with `git diff`, revert with `git restore <file>`.

Reads `notes/review_digest.md` (preferred) or the individual proposal files (fallback). If no review has been run, it stops and asks you to run `/copyedit review` first. Does **not** touch grammar from `copy_edits.md` (already auto-applied during review).

**Distinct from `apply`:** `/copyedit apply` (Haiku) mechanically applies only items you pre-marked `[x]`, verbatim. `implement` requires no pre-marking and uses editorial judgment.

### Single Task

```
/copyedit grammar intro.tex                      # Grammar only (auto-applied)
/copyedit ai_detection *.tex                     # AI tells check (full output)
/copyedit ai_detection --only-issues *.tex       # AI tells check (issues only, passes suppressed)
/copyedit word_choice methods.tex                # Word choice review
/copyedit sentence intro.tex                     # Sentence structure analysis
/copyedit orality intro.tex                      # Read-aloud pass (stumbles, misreadings)
/copyedit structure paper/                       # Paper structure analysis
/copyedit flow paper/                            # Flow extraction (opt-in; not in review/full)
/copyedit relevance paper/                       # Fractal relevance audit: every node earns its place
/copyedit relevance --level=subsection paper/    # Audit only subsections (dip-toes mode)
/copyedit relevance --level=section,subsection paper/   # Audit two levels
/copyedit --aggressive relevance paper/          # Audit + auto-apply all `fail`-verdict opener rewrites
/copyedit --aggressive relevance --level=subsection paper/   # Combine: subsection-only + auto-apply
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
/copyedit apply                     # Apply all marked [x] changes (mechanical, verbatim)
/copyedit implement                 # Apply the review with judgment (active model — see above)
/copyedit interactive notes/simplifications.md  # Walk through suggestions
/copyedit continue                  # Resume interrupted review
/copyedit ban "phrase"              # Add phrase to project banned list
```

### Banned Phrases (R-BANNED)

A project-local banned-phrases file is auto-loaded at the start of every session. Any match in new/changed text is a **Critical** violation that must be fixed before the edit is presented (R-BANNED).

**File locations (checked in order):**
- `notes/copyedit_banned_phrases.md` (primary)
- `notes/banned_phrases.md` (fallback)

**File format:**

```markdown
# Banned

- "phrase one" — optional rationale
- "phrase two"
```

**Adding phrases:** `/copyedit ban "phrase"` appends to `notes/copyedit_banned_phrases.md`, creating it if absent.

### Load-Bearing Terms (R-LOADBEARING)

The bootstrap auto-detects hyphenated multi-word phrases appearing 3+ times in source and writes them to `notes/copyedit_load_bearing_terms.md`. These are field-specific terms whose removal in a rewrite is a Test 1 fail in the Self-Critic Pass (R-LOADBEARING — paraphrasing them is a quality regression, not an improvement). The user may edit this file to add or remove terms.

**File format:**

```markdown
# Terms

- credit-aversion (N occurrences)
- price-coherence (N occurrences)
```

---

## Available Tasks

### Fast-Path Edits (No Subagents, Orchestrator-Direct)

| Task | Output | Description |
|------|--------|-------------|
| `task_edit` | Direct file edits | Execute any free-form task, then apply principle guardrails to new/changed text. Catch-all route. |
| `rewrite` | Direct file edits | Apply 15 writing principles + surface fixes to a specific section. No notes files. |
| `implement` | Direct file edits + digest markings | Read a prior review's proposals and apply them with editorial judgment (apply/adapt/skip/defer). Active model, not a subagent. Applies directly; review via `git diff`. |

### File-Level Tasks (Parallel, Haiku)

| Task | Output | Description |
|------|--------|-------------|
| `grammar` | notes/copy_edits.md | Auto-fix spelling, punctuation, syntax errors |
| `ai_detection` | notes/ai_detection.md, notes/simplifications.md | Flag AI-generated patterns; severity-sorted |
| `word_choice` | notes/word_choice_review.md | Anglo-Saxon over Latin, weak verbs, wordiness |
| `sentence` | notes/sentence_analysis.md | Length variation, rhythm, S-V-O clarity |
| `orality` | notes/orality.md | Read-aloud pass: stumbles, ambiguous parallelism, misreadings, noun pile-ups |

### Paper-Level Tasks (Sequential, Sonnet)

| Task | Output | Description |
|------|--------|-------------|
| `structure` | notes/structure_analysis.md | High-level paper organization |
| `relevance` | notes/relevance_audit.md, notes/relevance_rewrites.json | Fractal opener audit — every section, subsection, subsubsection, and paragraph judged against its parent goal. Supports `--aggressive` for auto-apply of `fail`-verdict rewrites. |
| `quality` | notes/writing_quality.md | Paragraph-level writing quality (focus, mechanism, precision) |
| `methodology` | notes/methodology_review.md | Identification strategy clarity |

### Opt-In Paper-Level Tasks (NOT in review/full; explicit invocation only)

| Task | Output | Description |
|------|--------|-------------|
| `flow` | notes/flow_extraction.md | Paragraph skeleton and flow analysis. Kept available for debugging; `relevance` is the actionable version. |

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

Suppresses entries where the verdict is "pass" or "no issues found." The full `ai_detection.md` is always written regardless of this flag.

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
| "implement the review", "apply the suggestions with judgment", "implement" | implement (fast-path, active model, no subagents) |
| "fix grammar", "check for errors" | grammar |
| "check for AI tells", "sound less AI" | ai_detection |
| "improve word choice", "make it punchier" | word_choice |
| "check sentence rhythm" | sentence |
| "read aloud", "sounds stumbly", "orality", "prep for talk" | orality |
| "improve structure", "paper flow" | structure |
| "extract flow", "first sentences" | flow |
| "RAP relevance", "section opener motivation", "section earns its place", "tie back to intro" | relevance |
| "grade writing quality", "improve writing" | quality |
| "comprehensive review" | grammar + ai_detection + word_choice + sentence + orality |
| "full review" | All tasks (including quality) |

---

## Task Aliases

| Alias | Expands To |
|-------|------------|
| `<any task>` | task_edit catch-all (no subagents) — when not a known keyword |
| `rewrite` | Targeted principle rewrite (no subagents) |
| `implement` | Judgment-based apply of a prior review's proposals (active model, no subagents) |
| `review` | grammar + ai_detection + word_choice + sentence + orality |
| `full` | All tasks including paper-level **except** `flow` (flow is opt-in only — `relevance` replaces it in the default pipeline) |
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

## Output Location

All output goes to a `notes/` directory alongside input files:

```
paper/
├── intro.tex
├── methods.tex
└── notes/                          # Created by copyedit
    ├── .copyedit_status            # Phase + voice detection result (voice: I/we/mixed)
    ├── tasks.json
    ├── copyedit_load_bearing_terms.md  # Auto-detected load-bearing jargon (user-editable)
    ├── copyedit_banned_phrases.md  # Project-local banned phrases (user-editable)
    ├── copy_edits.md               # Grammar log (auto-applied)
    ├── ai_detection.md             # AI pattern flags (full, severity-sorted)
    ├── simplifications.md          # Style suggestions
    ├── word_choice_review.md
    ├── sentence_analysis.md
    ├── orality.md                  # Read-aloud pass flags
    ├── structure_analysis.md
    ├── flow_extraction.md          # opt-in; only when `/copyedit flow` is invoked explicitly
    ├── relevance_audit.md          # Fractal opener audit (purpose tree + violations + dashboard)
    ├── relevance_rewrites.json     # Machine-parseable rewrites for --aggressive apply
    ├── writing_quality.md
    ├── review_digest.md            # Flags first, then proposed rewrites; self-screened (wrapup)
    └── number_fix_report.md        # Number annotation/update log (opt-in)
```

---

## Output Format

All output files use one of two checklist entry shapes (except copy_edits.md):

**Standard entry** (Self-Critic Pass passed):

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

**Flag-only entry** (Self-Critic Pass failed — no rewrite proposed; rule IDs identify which test failed) (P2):

```markdown
### - [ ] Lines X-Y: [Brief description]

**Comment:** [Why this is problematic]

**Original:**
```
[Full sentence(s)]
```

**Why no rewrite:** [One sentence: which test failed and why]

**Self-screen:** rewrite withheld — [reason]
```

The flag-only shape surfaces the problem to the author without offering a rewrite that would fail quality tests. The author decides whether and how to fix it.

**Exception:** `copy_edits.md` uses log format: `File:Line -> Previous -> New`

## Review Digest Layout (P10)

`notes/review_digest.md` is the consolidated view of all actionable items. It has two top-level sections:

```
## Flags (no rewrite proposed) — N items
[severity-sorted, file-grouped; items with no Proposed Revision]

## Proposed Rewrites — M items
[severity-sorted, file-grouped; items with a Proposed Revision]
```

After the wrapup self-screen pass (Step 3.5), any proposed revision that fails the Self-Critic Pass is stripped and its item moves to the Flags section. The summary table reports: Flags (no rewrite), Proposed rewrites, and Rewrites withheld by self-screen.

## Rationale Fields Gate (P8)

The surface critic also runs on rationale fields — `**Comment:**`, `**Why better:**`, `**Why no rewrite:**` — in every notes/*.md entry. These fields must satisfy the same surface rules as proposed revision text: R-EMDASH, R-COLON, R-TRANSITION, R-40WORD, plus the smarmy-reframing language tells. The wrapup gate coverage checklist verifies this for each prose-emitting task.

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

To skip the marking step entirely and let the active model apply the whole review with editorial judgment, use `/copyedit implement` instead (see *Implement Review* above).

---

## Quality Standards

Follows McCloskey and Cochrane writing principles:

- Anglo-Saxon over Latin vocabulary (use -> utilize)
- Concrete over abstract language
- Active voice, strong verbs
- Sentence variety for rhythm
- Clear S-V-O structure
- Avoid AI-typical patterns (R-EMDASH, R-TRANSITION, smarmy reframing)

The full enforceable rule set with stable IDs lives in `references/writing_quality_standards.md`. Reference for the underlying writing standards: `prompts/economics_writing_prompt.md` (comprehensive guide).

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
- `prompts/tasks/implement.prompt` **(fast-path, active model, no subagents)** — judgment-based apply of a prior review's proposals
- `prompts/tasks/grammar.prompt`
- `prompts/tasks/ai_detection.prompt`
- `prompts/tasks/word_choice.prompt`
- `prompts/tasks/sentence_analysis.prompt`
- `prompts/tasks/orality.prompt` — read-aloud pass (stumbles, ambiguous parallelism)
- `prompts/tasks/structure.prompt`
- `prompts/tasks/flow_extraction.prompt`
- `prompts/tasks/relevance.prompt` — fractal opener audit (every node earns its place)
- `prompts/tasks/writing_quality.prompt`
- `prompts/tasks/methodology.prompt`
- `prompts/tasks/apply_marked.prompt`
- `prompts/tasks/interactive_review.prompt`
- `prompts/tasks/deduplication.prompt`
- `prompts/tasks/number_fix.prompt`
- `prompts/tasks/reflow.prompt` — Phase 0 pre-processing: runs `scripts/reflow_sentences.py` to place one sentence per line
- `prompts/tasks/reflow_verify.prompt` — Phase 0b: inspects reflowed .tex for suspicious sentence breaks
- `prompts/tasks/strip_llm.prompt` — finalization: removes `\begin{llm}...\end{llm}` wrappers after review

---

## Background References (Do Not Load)

Three corpus files live in `references/` for citation by `writing_quality_standards.md` only. **They must not be loaded whole-file by any prompt** (combined ~3,650 lines — context-window risk). Use grep against them when a stylistic question arises:

- `references/deirdre-mccloskey-economical-writing.txt` — McCloskey, *Economical Writing* (2nd ed.). Stylistic patterns and word-choice guidance. Do not load whole-file. Example: `grep -in "concrete\|abstract" references/deirdre-mccloskey-economical-writing.txt | head -20`.
- `references/phd_paper_writing.txt` — Cochrane, *Writing Tips for Ph.D. Students*. Triangular/newspaper structure. Do not load whole-file. Example: `grep -in "introduction\|first sentence" references/phd_paper_writing.txt | head -20`.
- `references/Chaubey_Research_Writing.txt` — Chaubey, *Research Writing* (Minto's Pyramid). Paragraph-level argument structure. Do not load whole-file. Example: `grep -in "pyramid\|topic sentence" references/Chaubey_Research_Writing.txt | head -20`.
