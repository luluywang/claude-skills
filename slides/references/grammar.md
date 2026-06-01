# Slide Grammar

Every slide in a deck is one of these types. During Phase 1 planning, assign a
type to each slide. Use at least 4 different types per deck to avoid monotony.
No single type should be used for more than 40% of slides.

## Type 1: TITLE

Full-bleed dark/branded background. Centered title, subtitle, author, date.
One per deck, always first. Optional: institution logo, copyright line.

## Type 2: SECTION DIVIDER

Dark/branded background. Large text ("Part N: Title") right-of-center or centered.
Minimal — no bullets, no body text. Used to separate major sections.

## Type 3: CONTENT (Bullet Points)

The workhorse slide. Structure:
- Optional module/section label centered above title (smaller, muted)
- Bold title left-aligned with decorative rule beneath
- Bullet points (square L1, diamond/arrow L2)
- Thin accent bar at top edge
- Logo or footer centered at bottom

**Avoid overusing** — if more than 40% of slides are this type, convert some to
Type 5 (split), Type 8 (colored box), or Type 10 (stat callout).

## Type 4: FULL IMAGE

Title + decorative rule at top, then a single image filling the remaining space.
No bullets, minimal text. The image should be **as large as possible** — target
~9" × 4" on a 16:9 slide, leaving only the title area and margins above.
Use `sizing: { type: 'contain' }` to preserve aspect ratio while maximizing size.
Use for: charts, screenshots, infographics, memes, word clouds, QR codes.

## Type 5: IMAGE + TEXT SPLIT

Two-column layout using the full slide width:
- Column A (~4.5"): bullet points or short text
- Column B (~4.5"): image(s), sized to fill the column height

The image column should be at least 45% of the slide width — never a small
thumbnail in a sea of whitespace. Can be text-left/image-right (default) or
reversed. Use for: "About Me" slides, case study intros, data + explanation pairs.

## Type 6: TABLE

Content slide with a styled data table. Table styling:
- Dark header row (branded color) with white text
- Alternating row shading (light tint of brand color)
- Clean borders, no gridlines overload

Use for: comparisons, data summaries, specifications.

## Type 7: EQUATION / FORMULA

Title + rule, then a centered displayed equation (large). Optional: brief
explanation text or small table below. Keep surrounding text minimal so the
equation is the focal point.

## Type 8: COLORED BOX

Uses colored content boxes to group related information. Variants:
- **Single box**: one full-width colored box containing bullets
- **Side-by-side**: two boxes in columns (e.g., pros/cons, two categories)
- **Stacked**: 2-3 boxes vertically with labels between them (e.g., principles)

Each box should have a distinct color from the palette. Use 4-6 box color
variants for variety (e.g., blue, green, pink, orange, purple, lavender).

## Type 9: DISCUSSION / INTERACTIVE

Title with a question or prompt. Body is intentionally sparse — lots of whitespace
for live interaction. May include 1-2 bullet points or a provocative quote.
Use for: poll questions, discussion prompts, think-pair-share moments.

## Type 10: STAT CALLOUT

Large number (60-72pt, bold, accent color) with a small label below (14-16pt).
Can show 1-3 stats in columns. Minimal other content. Use for: key findings,
impact numbers, before/after comparisons.

## Type 11: QR CODE / LINK

Title + rule, centered QR code image, URL below, brief instruction text.
Use for: interactive tools, surveys, enrollment links.

## Type 12: ATTENTION / VISUAL BREAK

Large centered icon or image (warning triangle, lightbulb, etc.) with minimal
or no text. Acts as a visual pause or transition marker between content sections.

## Type 13: TIMELINE / PROCESS

Horizontal or vertical flow showing sequential steps. Each step: number/icon +
label + brief description. Connected by arrows or lines. Use for: workflows,
historical sequences, methodology steps.

## Type 14: COMPARISON

Side-by-side columns or rows contrasting two things. Clear visual separation
(different background colors, dividing line). Headers for each side.
Use for: before/after, old/new, option A/option B.

---

## Cross-cutting Visual Elements

These elements appear across multiple slide types and should be consistent:

- **Accent bar**: thin colored bar at top edge of content slides (Types 3-14)
- **Title rule**: decorative line beneath the title on content slides
- **Footer**: logo or institution mark centered at bottom with rule above
- **Module label**: optional "Module X -- N" centered above title (smaller, muted)
- **Colored boxes**: maintain a consistent set of 4-6 box colors throughout the deck
