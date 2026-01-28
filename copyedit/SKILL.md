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

### Single Task

```
/copyedit grammar intro.tex         # Grammar only (auto-applied)
/copyedit ai_detection *.tex        # AI tells check
/copyedit word_choice methods.tex   # Word choice review
/copyedit sentence intro.tex        # Sentence structure analysis
/copyedit structure paper/          # Paper structure analysis
/copyedit flow paper/               # Flow extraction
/copyedit methodology paper/        # Methodology clarity
```

### Utility Commands

```
/copyedit apply                     # Apply all marked [x] changes
/copyedit interactive notes/simplifications.md  # Walk through suggestions
/copyedit continue                  # Resume interrupted review
```

---

## Available Tasks

### File-Level Tasks (Parallel, Haiku)

| Task | Output | Description |
|------|--------|-------------|
| `grammar` | notes/copy_edits.md | Auto-fix spelling, punctuation, syntax errors |
| `ai_detection` | notes/ai_detection.md, notes/simplifications.md | Flag AI-generated patterns |
| `word_choice` | notes/word_choice_review.md | Anglo-Saxon over Latin, weak verbs, wordiness |
| `sentence` | notes/sentence_analysis.md | Length variation, rhythm, S-V-O clarity |

### Paper-Level Tasks (Sequential, Sonnet)

| Task | Output | Description |
|------|--------|-------------|
| `structure` | notes/structure_analysis.md | High-level paper organization |
| `flow` | notes/flow_extraction.md | Paragraph skeleton and flow analysis |
| `methodology` | notes/methodology_review.md | Identification strategy clarity |

---

## Request Mapping

| User Says | Tasks Invoked |
|-----------|---------------|
| "fix grammar", "check for errors" | grammar |
| "check for AI tells", "sound less AI" | ai_detection |
| "improve word choice", "make it punchier" | word_choice |
| "check sentence rhythm" | sentence |
| "improve structure", "paper flow" | structure |
| "extract flow", "first sentences" | flow |
| "comprehensive review" | grammar + ai_detection + word_choice + sentence |
| "full review" | All tasks |

---

## Task Aliases

| Alias | Expands To |
|-------|------------|
| `review` | grammar + ai_detection + word_choice + sentence |
| `full` | All tasks including paper-level |
| `quick` | grammar + ai_detection |

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
    ├── ai_detection.md             # AI pattern flags
    ├── simplifications.md          # Style suggestions
    ├── word_choice_review.md
    ├── sentence_analysis.md
    ├── structure_analysis.md
    └── flow_extraction.md
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

### Example 1: Quick Grammar Check

```
/copyedit grammar paper.tex
```

Output: Auto-corrected `paper.tex` + `notes/copy_edits.md` log

### Example 2: AI Detection

```
/copyedit ai_detection *.tex
```

Output: `notes/ai_detection.md` and `notes/simplifications.md`

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

## Task Prompts

Individual task prompts are located at:

- `prompts/tasks/grammar.prompt`
- `prompts/tasks/ai_detection.prompt`
- `prompts/tasks/word_choice.prompt`
- `prompts/tasks/sentence_analysis.prompt`
- `prompts/tasks/structure.prompt`
- `prompts/tasks/flow_extraction.prompt`
- `prompts/tasks/methodology.prompt`
- `prompts/tasks/apply_marked.prompt`
- `prompts/tasks/interactive_review.prompt`
- `prompts/tasks/deduplication.prompt`
