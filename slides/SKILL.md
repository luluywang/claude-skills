---
name: slides
description: |
  Build polished presentation slides (pptx) with an actor-critic visual QA loop.
  Generates slides via pptxgenjs, then iteratively renders, critiques, and fixes
  until visually clean. Only activate when user explicitly invokes '/slides'.
  Do NOT activate for general presentation questions.
---

# Slide Builder

Iterative loop: **generate -> render -> critique -> fix -> re-render** until the
critic finds no issues or the iteration limit is reached. Both the actor
(generate/fix) and the critic (inspect) run as Agent subagents — the
orchestrator does not write pptxgenjs code or grade images inline.

## Invocation

```
/slides <topic or outline>              # Create new deck from description
/slides from <file>                     # Create deck from document/outline file
/slides fix <path.pptx>                 # Run QA loop on existing pptx
/slides template <template.pptx> <content>  # Build from existing template
```

## Key Paths

```
SKILL_DIR  = path to this skill (resolve at runtime)
WORK_DIR   = ./slides_work              # Working directory (gitignored)
IMAGES_DIR = ./slides_work/slide_images # Rendered slide images per iteration
```

## Dependencies

```bash
npm list -g pptxgenjs || npm install -g pptxgenjs
command -v soffice  || echo "WARN: install LibreOffice for visual QA"
command -v pdftoppm || echo "WARN: install poppler (brew install poppler)"
# Optional icons: npm install -g react-icons react react-dom sharp
```

Template Mode also requires the `document-skills:pptx` skill (provides
`scripts/office/{unpack,pack}.py`, `scripts/clean.py`, `scripts/thumbnail.py`).
See [Template Mode](#template-mode-slides-template).

---

## Workflow

### Phase 1: Plan (orchestrator, inline)

1. Read the user's input (topic, outline, document, or template).
2. Read `references/grammar.md` (14 slide types) and `references/design.md`
   (palettes, fonts, typography, spacing) — the planner needs both.
3. Design the deck: assign a grammar type to every slide, pick a bold palette
   and font pairing, define cross-cutting elements (accent bar, title rule,
   footer, optional 4-6 box color set), and verify layout variety (no single
   type used for more than 40% of slides).
4. Present the plan as a table (slide #, title, grammar type, notes) and get
   user approval before generating.

### Phase 2: Generate (Actor subagent)

Spawn the actor as a subagent. Do NOT write pptxgenjs code inline.

```
Task: [slides:actor] Generate slides
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read prompts/actor.md in the slides skill. You are in GENERATE mode.

Context:
- SKILL_DIR: <absolute path to this skill>
- OUTPUT_PATH: <absolute path for the .pptx>
- SCRIPT_PATH: <absolute path for generate_slides.js>
- PLAN: <approved plan from Phase 1>
- THEME: <chosen palette + font pairing>

Return the JSON line specified in actor.md.
```

The actor reads `references/pptxgenjs.md`, `references/grammar.md`,
`references/design.md`, writes the script, runs `node <SCRIPT_PATH>`, and
returns the output path.

### Phase 3: Actor-Critic QA Loop

Initialize:

```bash
export SLIDES_WORK_DIR="./slides_work"
./slides/scripts/qa_loop.sh init 5   # max 5 iterations
```

**Each iteration:**

1. **Render** — convert pptx to slide images:
   ```bash
   ./slides/scripts/qa_loop.sh render <output.pptx>
   ```

2. **Critique** — spawn the critic as a fresh-eyes subagent (no prior context):
   ```
   Task: [slides:critic] Visual QA inspection
   model: "sonnet"
   subagent_type: "general-purpose"

   Instructions:
   Read slides/prompts/critic.md for the full inspection checklist.
   Inspect these slide images: [list all slide-*.jpg paths]
   Report ALL issues. Assume there are problems.
   Return: {total_issues: N, critical: N, slides_needing_fixes: [numbers]}
   ```

3. **Record**:
   ```bash
   ./slides/scripts/qa_loop.sh next <total_issues>
   ```

4. **Check stopping** from the JSON output:
   - `stop_reason: "clean"` -> done
   - `stop_reason: "max_iterations"` -> present remaining issues to user
   - `stop_reason: "stagnation"` -> same issues persist, ask user
   - `should_stop: false` -> continue to step 5

5. **Fix (Actor subagent)** — spawn the actor again in FIX mode. Do NOT edit
   the script inline.
   ```
   Task: [slides:actor] Fix slides per critic feedback
   model: "opus"
   subagent_type: "general-purpose"

   Instructions:
   Read prompts/actor.md in the slides skill. You are in FIX mode.

   Context:
   - SKILL_DIR: <absolute path to this skill>
   - OUTPUT_PATH, SCRIPT_PATH: <as in Phase 2>
   - ITERATION: <current iteration>
   - CRITIC_FEEDBACK: <full critic report from step 2>

   Apply fixes critical-first, re-run the script, return the JSON line.
   ```
   Then go back to step 1.

**Fresh-eyes invariant:** the critic must NOT have seen the generation code or
previous critique — it inspects only the rendered images. Actor and critic are
separate Tasks for this reason.

### Phase 4: Deliver

Present the final deck with QA summary (iterations, issues found/fixed),
remaining minor issues, and the output path. Clean up `slides_work/` if user
confirms.

---

## Template Mode (`/slides template`)

When building from an existing pptx template, the actor needs scripts from the
`document-skills:pptx` skill. Verify it is installed:

```bash
PPTX_SKILL_DIR="$(find ~/.claude/plugins/cache/anthropic-agent-skills -type d -name pptx -path '*/skills/pptx' 2>/dev/null | head -1)"
[ -n "$PPTX_SKILL_DIR" ] || echo "ERROR: install document-skills:pptx first"
```

Pass `PPTX_SKILL_DIR` to the actor in the Task context. The actor uses
`$PPTX_SKILL_DIR/scripts/thumbnail.py` to map the template, then edits via
`scripts/office/unpack.py` -> Edit slide XML -> `scripts/clean.py` ->
`scripts/office/pack.py ... --original template.pptx`. Then run the QA loop
(Phase 3) on the output, same as from-scratch mode.

---

## Fix Mode (`/slides fix`)

Skip generation. Initialize the QA loop, render and critique, then spawn the
actor in FIX mode — the actor decides whether the pptx was made with pptxgenjs
(regenerate) or from a template (unpack/edit/repack).

---

## References

- `references/grammar.md` — 14 slide grammar types. Read during Phase 1 and
  inside the actor when building each slide.
- `references/design.md` — color palettes, font pairings, typography, spacing.
- `references/pptxgenjs.md` — file-corrupting rules and formatting gotchas.
  The actor must read this before writing a single line of pptxgenjs.
- `prompts/actor.md` — actor procedure (generate and fix modes).
- `prompts/critic.md` — critic visual QA checklist.
