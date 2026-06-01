---
name: beamer
description: |
  Build Beamer (LaTeX) lecture slides for teaching and classroom discussion.
  Uses the Kellogg Evergreen theme with an actor-critic visual QA loop.
  Generates .tex source, compiles to PDF, then iteratively inspects and fixes
  until visually clean. Only activate when user explicitly invokes '/beamer'.
  Do NOT activate for general LaTeX or presentation questions.
---

# Beamer Slide Builder

Build Beamer lecture slides with iterative visual refinement. The core loop:
**generate .tex -> compile -> render slide images -> critique -> fix -> recompile**
until the critic finds no issues or the iteration limit is reached.

## Contents

- [Invocation](#invocation)
- [Key Paths](#key-paths)
- [Dependencies](#dependencies)
- [Reference Files](#reference-files)
- [Workflow](#workflow)
  - [Phase 1: Plan](#phase-1-plan)
  - [Phase 2: Generate (Actor subagent)](#phase-2-generate-actor-subagent)
  - [Phase 3: Actor-Critic QA Loop](#phase-3-actor-critic-qa-loop)
  - [Phase 4: Deliver](#phase-4-deliver)
- [Fix Mode (`/beamer fix`)](#fix-mode-beamer-fix)
- [Deck Structure Template](#deck-structure-template)

## Invocation

```
/beamer <topic or outline>              # Create new deck from description
/beamer from <file>                     # Create deck from document/outline file
/beamer fix <path.tex>                  # Run QA loop on existing .tex file
```

## Key Paths

```
SKILL_DIR  = path to this skill (resolve at runtime)
WORK_DIR   = ./beamer_work              # Working directory (gitignored)
IMAGES_DIR = ./beamer_work/slide_images # Rendered slide images per iteration
```

## Dependencies

Check before starting -- install any that are missing:

```bash
# Required
command -v pdflatex || echo "WARN: Install TeX Live (brew install --cask mactex)"
command -v pdftoppm || echo "WARN: Install poppler (brew install poppler) for visual QA"

# The kellogg theme requires these LaTeX packages (all included in MacTeX):
# tikz, tcolorbox, sourcesanspro, amsmath, amssymb, graphicx, booktabs,
# hyperref, xcolor, array, multirow, textcomp, fontenc
```

## Reference Files

The skill body stays lean. Detailed material lives in dedicated files; load
them only when you need them.

- `references/slide_types.md` -- catalog of the 14 slide types with template
  snippets. **Read when planning Phase 1** and when an actor fix involves
  changing a slide's type.
- `references/theme.md` -- color palette, box environments, slide commands,
  required theme assets. **Read when picking colors or boxes.**
- `references/latex_conventions.md` -- critical LaTeX rules, design rules,
  and teaching-specific rules. **The actor reads this every run.**
- `prompts/actor.md` -- procedural steps for the actor subagent (generate
  and fix modes).
- `prompts/critic.md` -- inspection checklist and output format for the
  critic subagent.

---

## Workflow

### Phase 1: Plan

1. Read the user's input (topic, outline, document, or existing .tex file).
2. Read `references/slide_types.md` so you know the available slide types.
3. Design the deck structure:
   - **Assign a slide type** to every slide
   - Number of slides, titles, content per slide
   - Plan which custom macros are needed (returndecomp, custom TikZ, etc.)
   - Identify images or charts that need to be sourced or generated
   - Verify layout variety: no single type used for more than 40% of slides
   - Plan discussion prompts and interactive moments
4. Present the plan as a table (slide #, title, slide type, notes) and get
   approval before moving on.

### Phase 2: Generate (Actor subagent)

Spawn the actor as a fresh **Agent subagent**. The actor reads the conventions
and slide-type references, writes a single `.tex` file at `WORK_DIR`, and
compiles with pdflatex. Do NOT inline this work in the orchestrator.

```
Task: [beamer:actor] Generate .tex from approved outline
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read beamer/prompts/actor.md for the full procedure.

Mode: generate
WORK_DIR: <absolute path to ./beamer_work>
SKILL_DIR: <absolute path to this skill>
TEX_PATH: <absolute path to target .tex inside WORK_DIR>

Outline (approved in Phase 1):
[paste the slide table -- slide #, title, slide type, notes -- plus any
source material the actor needs]

Return: { mode, tex_path, pdf_path, notes[] }
```

When the subagent returns, capture `tex_path` and `pdf_path` for Phase 3.

### Phase 3: Actor-Critic QA Loop

This is the critical phase. Initialize and iterate:

```bash
export BEAMER_WORK_DIR="./beamer_work"
./beamer/scripts/qa_loop.sh init 5   # Max 5 iterations
```

**Each iteration:**

1. **Render** -- convert PDF to individual slide images:
   ```bash
   ./beamer/scripts/qa_loop.sh render output.pdf
   ```

2. **Critique** -- spawn the critic as a **fresh Agent subagent** (no prior
   context, no .tex source):
   ```
   Task: [beamer:critic] Visual QA inspection
   model: "sonnet"
   subagent_type: "general-purpose"

   Instructions:
   Read beamer/prompts/critic.md for the full inspection checklist.

   Inspect these slide images:
   [list all slide-*.jpg paths from the render output]

   Report ALL issues found. Assume there are problems.
   Return: {total_issues: N, critical: N, slides_needing_fixes: [numbers]}
   ```

3. **Record** -- feed the critic's total issue count to the loop:
   ```bash
   ./beamer/scripts/qa_loop.sh next <total_issues>
   ```

4. **Check stopping** -- parse the JSON output:
   - `should_stop: true` with `stop_reason: "clean"` -> done, all clear
   - `should_stop: true` with `stop_reason: "max_iterations"` -> present remaining issues
   - `should_stop: true` with `stop_reason: "stagnation"` -> same issues persist, ask user
   - `should_stop: false` -> continue to step 5

5. **Fix** -- spawn the actor as a **fresh Agent subagent** in fix mode. Do NOT
   apply fixes inline.

   ```
   Task: [beamer:actor] Apply critic fixes to .tex
   model: "opus"
   subagent_type: "general-purpose"

   Instructions:
   Read beamer/prompts/actor.md for the full procedure.

   Mode: fix
   WORK_DIR: <absolute path>
   SKILL_DIR: <absolute path>
   TEX_PATH: <absolute path to current .tex>

   Critic report (latest iteration):
   [paste the critic output verbatim -- per-slide issues with severity and fix
   suggestions]

   Return: { mode, tex_path, pdf_path, issues_addressed, notes[] }
   ```

   When the subagent returns, go back to step 1.

**Important:**

- The **critic** subagent must have **fresh eyes** -- it must NOT have seen the
  .tex source or previous critique. It inspects only the rendered images.
- The **actor** subagent runs in its own subagent on every cycle (generate and
  every fix iteration). The orchestrator never edits the .tex inline.

### Phase 4: Deliver

1. Present the final deck to the user with:
   - QA summary (iterations, issues found/fixed)
   - Any remaining minor issues
   - The output .tex and .pdf file paths
2. Clean up `beamer_work/` if user confirms.

---

## Fix Mode (`/beamer fix`)

Skip generation. Run the QA loop directly on an existing .tex file:

1. Copy the .tex file and its dependencies to the work directory.
2. Compile to PDF.
3. Initialize QA loop (`qa_loop.sh init`).
4. Render and critique (critic subagent, as in Phase 3 step 2).
5. Spawn the actor subagent in fix mode to apply fixes (as in Phase 3 step 5),
   recompile, re-verify.

The actor and critic remain subagents in this mode. Do not inline either.

---

## Deck Structure Template

A well-structured teaching deck follows this pattern:

```
1.  TITLE                    -- Course info
2.  AGENDA                   -- 3-5 topics
3.  SECTION DIVIDER          -- Part 1
4.  CONTENT                  -- Key concepts
5.  FULL IMAGE               -- Supporting evidence
6.  COLORED BOX COMPARISON   -- Two perspectives
7.  DISCUSSION               -- Student engagement
8.  SECTION DIVIDER          -- Part 2
9.  EQUATION                 -- Formal framework
10. RETURN DECOMPOSITION     -- Applied framework
11. PROGRESSIVE BUILD (x3)   -- Worked example
14. FULL IMAGE               -- "Is this realistic?"
15. DISCUSSION               -- Investment decision
16. SECTION DIVIDER          -- Conclusion
17. SUMMARY                  -- Key takeaways
```

Aim for 15-25 slides per 80-minute lecture. Include at least one discussion
prompt per major section. Alternate between dense content and breathing room
(images, dividers, discussion slides).
