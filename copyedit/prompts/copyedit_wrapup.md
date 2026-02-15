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
3. Mark status complete
4. Generate summary for user
5. Return to orchestrator

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
- `notes/word_choice_review.md`
- `notes/sentence_analysis.md`
- `notes/writing_quality.md`

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

## Step 3: Mark Complete

```bash
echo "complete" > notes/.copyedit_status
```

---

## Step 4: Generate Summary

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
1. Review suggestions in simplifications.md
2. Run interactive review to accept/reject changes
```

---

## Step 5: Return to Orchestrator

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
- **DO**: Mark status complete
- **DO**: Generate summary
- **DO NOT**: Ask user questions
- **DO NOT**: Spawn additional subagents
- **DO NOT**: Proceed to other phases
