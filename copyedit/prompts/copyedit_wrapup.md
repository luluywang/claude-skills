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
4. `simplifications.md` (general suggestions)
5. `ai_detection.md` (pattern identification)

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

## Step 3: Generate Review Digest

After deduplication, create `notes/review_digest.md` — a single consolidated view of all actionable items across every checklist file, reorganized by severity then by file.

### Process

**CRITICAL: The digest must contain EVERY actionable item from every checklist file. Do NOT summarize, paraphrase, or drop items. Copy each item's full content (Comment, Original, Proposed Revision, Why better) verbatim into the digest. The only items you may skip are explicit passes (lines that say "no issues found", "clean", or "none detected"). If in doubt, INCLUDE the item.**

1. Read each deduplicated checklist file one at a time: `ai_detection.md`, `simplifications.md`, `word_choice_review.md`, `sentence_analysis.md`, `writing_quality.md`.
2. For each file, scan for every heading that starts with `### - [ ]`. Each such heading and everything below it until the next `### - [ ]` heading (or end of file section) is one item.
3. For each extracted item, determine severity:
   - `ai_detection.md` items already carry explicit severity labels (`Critical`, `High`, `Medium`, `Low`).
   - For items from other tasks, assign severity based on impact:
     - **Critical:** Factual errors, logical gaps, missing causal mechanisms, claims that overshoot evidence
     - **High:** Substantial rewrites needed — paragraph-level focus problems, repeated patterns (2+ instances), misleading framing
     - **Medium:** Individual word/phrase improvements, moderate structural issues, single-instance style problems
     - **Low:** Minor polish, optional alternatives, subjective preferences
4. Skip ONLY items that are explicit passes — lines containing "no issues found", "clean", or "none detected". Everything else is included.
5. Write to `notes/review_digest.md` using the format below. Count items as you write — the total in the digest must equal the total extracted minus passes.

### Output Format

```markdown
# Review Digest
<!-- Consolidated from all task output files. Sorted: severity → file. -->
<!-- Source files preserved in notes/ for full context. -->

## Critical

### [filename.tex]

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

### [other_file.tex]
...

## High

### [filename.tex]
...

## Medium
...

## Low
...
```

### Rules

- Include **every** actionable checklist item from every file (not just ai_detection)
- Preserve the full item content (Comment, Original, Proposed Revision, Why better) — do not summarize or paraphrase
- Add a `**Source:** filename.md` line to each item so the reader can trace it back
- Omit any severity tier heading that has no entries
- Within a severity tier, order files alphabetically
- Within a file, preserve document order (by line number)

### Verification

After writing `review_digest.md`, count the `### - [ ]` headings in the digest and compare to the total across all source files. If the digest has fewer items than the sources (minus passes and duplicates removed), you have dropped items — go back and find what's missing.

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

### Deduplication
- Duplicates merged: N

### Output Files
- notes/copy_edits.md - Grammar corrections (auto-applied)
- notes/ai_detection.md - AI pattern identification
- notes/simplifications.md - Style suggestions
- [etc. for each file that exists]

### Recommended Next Steps
1. Start with `review_digest.md` — all issues consolidated by severity
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

## Rules

- **DO**: Run deduplication on all checklist files
- **DO**: Generate review digest after deduplication
- **DO**: Mark status complete
- **DO**: Generate summary
- **DO NOT**: Ask user questions
- **DO NOT**: Spawn additional subagents
- **DO NOT**: Proceed to other phases
