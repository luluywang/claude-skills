# Wrapup Subagent (Copyedit)

You are completing the copyedit review. The orchestrator has verified all tasks have terminal status (complete/flagged).

---

## Your Context

Load:
- `notes/tasks.json` - All tasks with final status
- All `notes/*.md` output files

---

## Your Tasks

1. Verify all tasks complete
2. Run deduplication across output files
3. Generate review digest (severity-sorted consolidated view)
4. Mark status complete
5. Generate summary for user
6. Return to orchestrator

---

## Step 1: Verify Tasks

Read tasks.json and confirm:
- All `tasks` entries (file × task pairs) have status `complete` or `flagged`
- All `paper_tasks` entries have status `complete` or `flagged`

If any entry is still `pending` or `in_progress`:
- Return immediately with error
- Do NOT proceed to deduplication

---

## Step 2: Run Deduplication

### Read All Checklist Files

Scan these files if they exist:
- `notes/ai_detection.md`
- `notes/simplifications.md`
- `notes/writing_quality.md`
- `notes/word_choice_review.md`
- `notes/sentence_analysis.md`
- `notes/orality.md`

### Identify Duplicates

Two items are duplicates if:
- Same target .tex file AND
- Overlapping line numbers (within 3 lines of each other) AND
- Similar issue (same underlying problem)

**Common duplicate patterns:**
- "utilize -> use" in both ai_detection.md and word_choice_review.md
- Sentence rhythm issues in both ai_detection.md and sentence_analysis.md
- Passive voice flagged in multiple files

### Merge Duplicates

When duplicates found:
1. Keep the most specific/actionable version
2. Prefer versions with concrete replacement text
3. Add note: `[Also flagged in: other_file.md]`
4. Remove the duplicate from the other file

**Priority order for keeping:**
1. `writing_quality.md` (deepest paragraph-level judgment)
2. `word_choice_review.md` (most specific for individual words)
3. `sentence_analysis.md` (quantitative)
4. `orality.md` (read-aloud stumbles)
5. `simplifications.md` (general suggestions)
6. `ai_detection.md` (pattern identification)

**Note:** `writing_quality` takes precedence over `ai_detection` Part C for overlapping rhetorical/argument issues. If both flag the same passage, keep the `writing_quality` version (it has the actionable rewrite).

### Write Cleaned Files

Overwrite each notes/*.md file with deduplicated content.

Add summary at end of each cleaned file:

```markdown
---
## Deduplication Summary
- Items reviewed: X
- Duplicates removed: Y
```

---

## Step 3: Generate Review Digest (P10)

After deduplication, create `notes/review_digest.md` — a single consolidated view of all actionable items across every checklist file. The digest has two top-level sections: **Flags** (items with no Proposed Revision) and **Proposed Rewrites** (items that include a Proposed Revision). Within each section, items are sorted by severity then by file.

### Process

**CRITICAL: The digest must contain EVERY actionable item from every checklist file. Do NOT summarize, paraphrase, or drop items. Copy each item's full content (Comment, Original, Proposed Revision, Why better) verbatim into the digest. The only items you may skip are explicit passes (lines that say "no issues found", "clean", or "none detected"). If in doubt, INCLUDE the item.**

1. Read each deduplicated checklist file one at a time: `ai_detection.md`, `simplifications.md`, `word_choice_review.md`, `sentence_analysis.md`, `orality.md`, `writing_quality.md`.
2. For each file, scan for every heading that starts with `### - [ ]`. Each such heading and everything below it until the next `### - [ ]` heading (or end of file section) is one item.
3. For each extracted item, determine severity:
   - `ai_detection.md` items already carry explicit severity labels (`Critical`, `High`, `Medium`, `Low`).
   - For items from other tasks, assign severity based on impact:
     - **Critical:** Factual errors, logical gaps, missing causal mechanisms, claims that overshoot evidence
     - **High:** Substantial rewrites needed — paragraph-level focus problems, repeated patterns (2+ instances), misleading framing
     - **Medium:** Individual word/phrase improvements, moderate structural issues, single-instance style problems
     - **Low:** Minor polish, optional alternatives, subjective preferences
4. Classify each item: does it contain a `**Proposed Revision:**` block? If yes → Proposed Rewrite. If no (flag-only shape, or items with only Comment/Original/Why no rewrite) → Flag.
5. Skip ONLY items that are explicit passes — lines containing "no issues found", "clean", or "none detected". Everything else is included.
6. Write to `notes/review_digest.md` using the format below. Count flags and rewrites separately.

### Output Format (P10)

```markdown
# Review Digest
<!-- Consolidated from all task output files. -->
<!-- Layout: Flags first, then Proposed Rewrites. Within each section: severity → file. -->
<!-- Source files preserved in notes/ for full context. -->

## Flags (no rewrite proposed) — N items
<!-- Items where no Proposed Revision was emitted (flag-only shape or self-screened). -->
<!-- Sorted: severity → file alphabetically → document order within file. -->

### Critical — [filename.tex]

#### - [ ] Lines X-Y: [Brief description] `Critical`
**Source:** ai_detection.md
**Comment:** [Why this is problematic]
**Original:**
```
[text]
```
**Why no rewrite:** [reason]
**Self-screen:** rewrite withheld — [reason] ← present only if self-screened

### High — [filename.tex]
...

### Medium — [filename.tex]
...

### Low — [filename.tex]
...

---

## Proposed Rewrites — M items
<!-- Items that include a Proposed Revision block. -->
<!-- Sorted: severity → file alphabetically → document order within file. -->

### Critical — [filename.tex]

#### - [ ] Lines X-Y: [Brief description] `Critical`
**Source:** ai_detection.md
**Comment:** [Why this is problematic]
**Original:**
```
[text]
```
**Proposed Revision:**
```
[text]
```
**Why better:** [explanation]

...
```

### Rules

- Include **every** actionable checklist item from every file (not just ai_detection)
- Preserve the full item content verbatim — do not summarize or paraphrase
- Add a `**Source:** filename.md` line to each item so the reader can trace it back
- Omit any severity tier heading that has no entries
- Within a severity tier, order files alphabetically
- Within a file, preserve document order (by line number)
- Flag-only items include `**Why no rewrite:**` and optionally `**Self-screen:**` lines

### Verification

After writing `review_digest.md`, count the `#### - [ ]` headings in the digest (items use 4th-level headings inside the section/severity hierarchy) and compare to the total across all source files. If the digest has fewer items than the sources (minus passes and duplicates removed), you have dropped items — go back and find what's missing.

---

## Step 3.5: Self-Screen Pass on Digest (P11)

After `review_digest.md` is written and before marking status complete, re-scan every `**Proposed Revision:**` block in the digest. This catches rewrites that passed the per-task surface check but still violate structural constraints when viewed as a whole.

**Run the digest-mode wrapper from `prompts/shared/components/surface_critic.prompt` (§ "Digest-mode wrapper").** The full procedure is specified there. Summary:

1. For each item in `## Proposed Rewrites`, run the Self-Critic Pass (Tests 1–6) using the item's `**Original:**` block as the source sentence.
2. Decision:
   - **Pass** → keep as-is.
   - **Fixable surface fail** (single em-dash, single banned word) → fix in place in the digest, log it.
   - **Structural fail** (Test 1–6: length budget breach, voice mismatch, load-bearing jargon dropped, new claim introduced, intensity inflation added, weak-for-weak swap) → strip the `**Proposed Revision:**` and `**Why better:**` blocks. Add `**Self-screen:** rewrite withheld — [reason]`. Move item to `## Flags` section on re-grouping.
3. After processing all items, re-group: any newly downgraded items move from `## Proposed Rewrites` to `## Flags`. Update the counts in both section headers.
4. Log at the end of the digest file:

```markdown
---
## Self-Screen Log
Self-screen: kept R, fixed F, downgraded D to flag.
Downgrade reasons cite rule IDs (e.g., "R-WEAK-FOR-WEAK", "R-LENGTH-DELTA", "R-NEW-CLAIMS").
```

The Step 5 summary table gains a `Rewrites withheld by self-screen` row (see Step 5 below).

---

## Step 4: Mark Complete

```bash
echo "complete" > notes/.copyedit_status
```

---

## Step 5: Generate Summary

Create a summary for the orchestrator to present:

```markdown
## Copyedit Review Complete

**Files analyzed:** [list from tasks.json]
**Tasks performed:** [list task names]

### Findings Summary

| Category | Items |
|----------|-------|
| Grammar corrections | X applied |
| AI patterns | Y flagged |
| Word choice | Z suggestions |
| Sentence structure | W suggestions |
| Flags (no rewrite proposed) | N items |
| Proposed rewrites | M items |
| Rewrites withheld by self-screen | D items |

### Deduplication
- Duplicates merged: N

### Output Files
- notes/copy_edits.md - Grammar corrections (auto-applied)
- notes/ai_detection.md - AI pattern identification
- notes/simplifications.md - Style suggestions
- [etc. for each file that exists]

### Recommended Next Steps
1. Start with `review_digest.md` — flags first, then proposed rewrites, sorted by severity
2. Check individual task files for full context if needed
3. Run interactive review to accept/reject changes
```

---

## Step 6: Return to Orchestrator

```
status: wrapup_complete
summary:
  tasks_complete: [N]
  tasks_flagged: [M]
  duplicates_merged: [P]
flagged_items:
  - task: [name]
    reason: [why flagged]
output_files: [list]
```

---

## Gate Coverage Checklist (P8)

For each prose-emitting task that ran, verify the surface-critic gate logged its results. Check the task's output file for gate evidence (surface-fix log lines or "Max new-sentence word count" entries).

The gate covers both **Proposed Revision** text and **rationale fields** (Comment, Why better, Why no rewrite). Rationale fields must also satisfy the same surface rules — notably R-EMDASH, R-COLON, R-TRANSITION, R-40WORD — plus the smarmy-reframing language tells.

| Task | Output File | Gate Required | Gate Evidence Found |
|------|-------------|---------------|---------------------|
| rewrite | (diff shown to user) | yes — apply context | — confirm gate ran before diff was presented |
| task_edit | (diff shown to user) | yes — apply context | — confirm gate ran before diff was presented |
| apply_marked | (edits to .tex) | yes — apply context | — confirm gate ran on each new_string |
| ai_detection | notes/simplifications.md | yes — proposal context + Self-Critic Pass | check each Proposed Revision and rationale |
| word_choice | notes/word_choice_review.md | yes — proposal context + Self-Critic Pass | check each Proposed Revision and rationale |
| writing_quality | notes/writing_quality.md | yes — proposal context + Self-Critic Pass | check each Proposed Revision and rationale |
| orality | notes/orality.md | yes — proposal context + Self-Critic Pass | check each Proposed Revision and rationale |
| sentence_analysis | notes/sentence_analysis.md | yes — proposal context + Self-Critic Pass | check each Proposed Revision and rationale |
| relevance | notes/relevance_audit.md | yes — proposal context | check each proposed rewrite |
| review_digest.md | (digest) | yes — Self-Screen Pass (Step 3.5) | check Self-Screen Log at end of digest |

Tasks exempt from the gate (no prose emitted): grammar, structure, methodology, flow_extraction, deduplication, number_fix, interactive_review, strip_llm, reflow, reflow_verify.

If any in-scope task is missing gate evidence, log it in the summary as a quality warning.

---

## Rules

- **DO**: Run deduplication on all checklist files
- **DO**: Generate review digest after deduplication
- **DO**: Check gate coverage for all prose-emitting tasks
- **DO**: Mark status complete
- **DO**: Generate summary
- **DO NOT**: Ask user questions
- **DO NOT**: Spawn additional subagents
- **DO NOT**: Proceed to other phases
