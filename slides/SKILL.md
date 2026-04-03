---
name: slides
description: |
  Build polished presentation slides (pptx) with an actor-critic visual QA loop.
  Generates slides via pptxgenjs, then iteratively renders, critiques, and fixes
  until visually clean. Only activate when user explicitly invokes '/slides'.
  Do NOT activate for general presentation questions.
---

# Slide Builder

Build presentation slides with iterative visual refinement. The core loop:
**generate → render → critique → fix → re-render** until the critic finds no issues
or the iteration limit is reached.

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

Check before starting — install any that are missing:

```bash
# Required
npm list -g pptxgenjs || npm install -g pptxgenjs
command -v soffice || echo "WARN: Install LibreOffice for visual QA"
command -v pdftoppm || echo "WARN: Install poppler (brew install poppler) for visual QA"

# Optional (for icons)
npm list -g react-icons react react-dom sharp 2>/dev/null || echo "Install for icon support: npm install -g react-icons react react-dom sharp"
```

---

## Workflow

### Phase 1: Plan

1. Read the user's input (topic, outline, document, or template)
2. Design the deck structure:
   - **Assign a grammar type** (see Slide Grammar below) to every slide
   - Number of slides, titles, content per slide
   - **Pick a bold color palette** — not generic blue. Match the topic.
   - Define cross-cutting elements: accent bar color, title rule style, footer content
   - If using colored boxes (Type 8), define the 4-6 box color set
   - Select font pairing (header + body)
   - Verify layout variety: no single type used for more than 40% of slides
3. Present the plan as a table (slide #, title, grammar type, notes) and get approval

### Phase 2: Generate (Actor)

Write a single Node.js script using pptxgenjs that generates the entire deck.

**Critical rules** (from the pptxgenjs reference):
- Never use `#` in hex colors (corrupts file)
- Never encode opacity in 8-char hex colors (corrupts file)
- Never reuse option objects across calls (pptxgenjs mutates them)
- Use `bullet: true`, never unicode `•`
- Use `breakLine: true` between array text items
- Use `margin: 0` when aligning text with shapes
- Shadow `offset` must be non-negative; use `angle: 270` for upward shadows
- Don't use `ROUNDED_RECTANGLE` with rectangular accent overlays

**Design rules:**
- Every slide needs a visual element — no text-only slides
- Vary layouts across slides (two-column, icon rows, stat callouts, etc.)
- Dark backgrounds for title/conclusion, light for content ("sandwich")
- Titles 36–44pt bold, body 14–16pt, captions 10–12pt
- 0.5" minimum margins, 0.3–0.5" between content blocks
- No accent lines under titles (AI hallmark)
- Left-align body text; center only titles
- **Use the full slide width** — 16:9 slides are 10" wide; do not leave large
  gutters. Content area should span at least 9" of the 10" width.
- **Images must be large** — on a FULL IMAGE slide (Type 4), the image should
  fill the area below the title (~9" × 4"). On a SPLIT slide (Type 5), the
  image column should be at least 4.5" wide. Never shrink images to leave
  decorative whitespace — fill the available space and let the image breathe.

Run the script:
```bash
node generate_slides.js
```

### Phase 3: Actor-Critic QA Loop

This is the critical phase. Initialize and iterate:

```bash
export SLIDES_WORK_DIR="./slides_work"
./slides/scripts/qa_loop.sh init 5   # Max 5 iterations
```

**Each iteration:**

1. **Render** — convert pptx to individual slide images:
   ```bash
   ./slides/scripts/qa_loop.sh render output.pptx
   ```

2. **Critique** — spawn a **Sonnet subagent** (fresh eyes, no prior context):
   ```
   Task: [slides:critic] Visual QA inspection
   model: "sonnet"
   subagent_type: "general-purpose"

   Instructions:
   Read slides/prompts/critic.md for the full inspection checklist.

   Inspect these slide images:
   [list all slide-*.jpg paths from the render output]

   Report ALL issues found. Assume there are problems.
   Return: {total_issues: N, critical: N, slides_needing_fixes: [numbers]}
   ```

3. **Record** — feed the critic's total issue count to the loop:
   ```bash
   ./slides/scripts/qa_loop.sh next <total_issues>
   ```

4. **Check stopping** — parse the JSON output:
   - `should_stop: true` with `stop_reason: "clean"` → done, all clear
   - `should_stop: true` with `stop_reason: "max_iterations"` → present remaining issues to user
   - `should_stop: true` with `stop_reason: "stagnation"` → same issues persist, ask user
   - `should_stop: false` → continue to step 5

5. **Fix** (Actor) — apply fixes to the generation script based on critic feedback:
   - Fix critical issues first, then major, then minor
   - Re-run the generation script
   - Go back to step 1

**Important:** The critic subagent must have **fresh eyes** — it must NOT have
seen the generation code or previous critique. It inspects only the rendered images.

### Phase 4: Deliver

1. Present the final deck to the user with:
   - QA summary (iterations, issues found/fixed)
   - Any remaining minor issues
   - The output file path
2. Clean up `slides_work/` if user confirms

---

## Template Mode (`/slides template`)

When building from an existing pptx template:

1. **Analyze the template:**
   ```bash
   python3 -m markitdown template.pptx        # Text content
   python3 scripts/thumbnail.py template.pptx  # Visual layout overview
   ```

2. **Map content to template slides** — match content types to available layouts.
   Use varied layouts; don't repeat title+bullets.

3. **Edit via unpack/pack workflow:**
   ```bash
   python3 scripts/office/unpack.py template.pptx unpacked/
   # Edit slide XML files (use Edit tool, not sed)
   python3 scripts/clean.py unpacked/
   python3 scripts/office/pack.py unpacked/ output.pptx --original template.pptx
   ```

4. **Run the QA loop** (Phase 3) on the output — same as from-scratch mode.

---

## Fix Mode (`/slides fix`)

Skip generation. Run the QA loop directly on an existing pptx:

1. Initialize QA loop
2. Render and critique
3. If issues found, determine whether the pptx was made with pptxgenjs (regenerate)
   or from a template (unpack/edit/repack)
4. Fix and re-verify

---

## Slide Grammar

Every slide in a deck is one of these types. During Phase 1, assign a type to each
slide. Use at least 4 different types per deck to avoid monotony.

### Type 1: TITLE

Full-bleed dark/branded background. Centered title, subtitle, author, date.
One per deck, always first. Optional: institution logo, copyright line.

### Type 2: SECTION DIVIDER

Dark/branded background. Large text ("Part N: Title") right-of-center or centered.
Minimal — no bullets, no body text. Used to separate major sections.

### Type 3: CONTENT (Bullet Points)

The workhorse slide. Structure:
- Optional module/section label centered above title (smaller, muted)
- Bold title left-aligned with decorative rule beneath
- Bullet points (square L1, diamond/arrow L2)
- Thin accent bar at top edge
- Logo or footer centered at bottom

**Avoid overusing** — if more than 40% of slides are this type, convert some to
Type 5 (split), Type 8 (colored box), or Type 10 (stat callout).

### Type 4: FULL IMAGE

Title + decorative rule at top, then a single image filling the remaining space.
No bullets, minimal text. The image should be **as large as possible** — target
~9" × 4" on a 16:9 slide, leaving only the title area and margins above.
Use `sizing: { type: 'contain' }` to preserve aspect ratio while maximizing size.
Use for: charts, screenshots, infographics, memes, word clouds, QR codes.

### Type 5: IMAGE + TEXT SPLIT

Two-column layout using the full slide width:
- Column A (~4.5"): bullet points or short text
- Column B (~4.5"): image(s), sized to fill the column height

The image column should be at least 45% of the slide width — never a small
thumbnail in a sea of whitespace. Can be text-left/image-right (default) or
reversed. Use for: "About Me" slides, case study intros, data + explanation pairs.

### Type 6: TABLE

Content slide with a styled data table. Table styling:
- Dark header row (branded color) with white text
- Alternating row shading (light tint of brand color)
- Clean borders, no gridlines overload

Use for: comparisons, data summaries, specifications.

### Type 7: EQUATION / FORMULA

Title + rule, then a centered displayed equation (large). Optional: brief
explanation text or small table below. Keep surrounding text minimal so the
equation is the focal point.

### Type 8: COLORED BOX

Uses colored content boxes to group related information. Variants:
- **Single box**: one full-width colored box containing bullets
- **Side-by-side**: two boxes in columns (e.g., pros/cons, two categories)
- **Stacked**: 2-3 boxes vertically with labels between them (e.g., principles)

Each box should have a distinct color from the palette. Use 4-6 box color
variants for variety (e.g., blue, green, pink, orange, purple, lavender).

### Type 9: DISCUSSION / INTERACTIVE

Title with a question or prompt. Body is intentionally sparse — lots of whitespace
for live interaction. May include 1-2 bullet points or a provocative quote.
Use for: poll questions, discussion prompts, think-pair-share moments.

### Type 10: STAT CALLOUT

Large number (60-72pt, bold, accent color) with a small label below (14-16pt).
Can show 1-3 stats in columns. Minimal other content. Use for: key findings,
impact numbers, before/after comparisons.

### Type 11: QR CODE / LINK

Title + rule, centered QR code image, URL below, brief instruction text.
Use for: interactive tools, surveys, enrollment links.

### Type 12: ATTENTION / VISUAL BREAK

Large centered icon or image (warning triangle, lightbulb, etc.) with minimal
or no text. Acts as a visual pause or transition marker between content sections.

### Type 13: TIMELINE / PROCESS

Horizontal or vertical flow showing sequential steps. Each step: number/icon +
label + brief description. Connected by arrows or lines. Use for: workflows,
historical sequences, methodology steps.

### Type 14: COMPARISON

Side-by-side columns or rows contrasting two things. Clear visual separation
(different background colors, dividing line). Headers for each side.
Use for: before/after, old/new, option A/option B.

---

### Cross-cutting Visual Elements

These elements appear across multiple slide types and should be consistent:

- **Accent bar**: thin colored bar at top edge of content slides (Types 3-14)
- **Title rule**: decorative line beneath the title on content slides
- **Footer**: logo or institution mark centered at bottom with rule above
- **Module label**: optional "Module X -- N" centered above title (smaller, muted)
- **Colored boxes**: maintain a consistent set of 4-6 box colors throughout the deck

---

## Design Reference

### Color Palettes (pick one that matches the topic)

| Theme | Primary | Secondary | Accent |
|-------|---------|-----------|--------|
| Midnight Executive | `1E2761` | `CADCFC` | `FFFFFF` |
| Forest & Moss | `2C5F2D` | `97BC62` | `F5F5F5` |
| Coral Energy | `F96167` | `F9E795` | `2F3C7E` |
| Warm Terracotta | `B85042` | `E7E8D1` | `A7BEAE` |
| Ocean Gradient | `065A82` | `1C7293` | `21295C` |
| Charcoal Minimal | `36454F` | `F2F2F2` | `212121` |
| Teal Trust | `028090` | `00A896` | `02C39A` |
| Berry & Cream | `6D2E46` | `A26769` | `ECE2D0` |
| Sage Calm | `84B59F` | `69A297` | `50808E` |
| Cherry Bold | `990011` | `FCF6F5` | `2F3C7E` |

### Font Pairings

| Header | Body |
|--------|------|
| Georgia | Calibri |
| Arial Black | Arial |
| Trebuchet MS | Calibri |
| Palatino | Garamond |
| Cambria | Calibri Light |
