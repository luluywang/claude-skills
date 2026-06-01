# Kellogg Evergreen Theme Reference

Color palette, box environments, slide commands, and required assets for the
Kellogg Evergreen Beamer theme. Consult when picking colors, choosing a box
environment, or wiring up theme assets.

## Available Colors

| Name | Hex | Use |
|------|-----|-----|
| `kelloggpurple` | #4E2A84 | Primary brand, titles, structure |
| `kelloggdarkpurple` | #472580 | Darker variant |
| `kelloggdeeppurple` | #3B1F6E | Deep shade |
| `kelloggteal` | #177392 | Accent |
| `kellogggreen` | #0E7D52 | Positive, examples |
| `kelloggolive` | #6BA04B | Secondary green |
| `kellogggold` | #E0A42E | Highlights |
| `kelloggcoral` | #D74B3D | Alerts, emphasis, key numbers |
| `kelloggmagenta` | #A22663 | Dark accent |
| `kelloggcream` | #E9E9E5 | Light background |

## Available Box Environments

| Environment | Background | Left Rule | Use |
|-------------|-----------|-----------|-----|
| `bluebox` | Light blue | Purple | Neutral content, comparisons |
| `greenbox` | Light green | Green | Positive, alternative view |
| `pinkbox` | Light pink | Coral | Warnings, quotes, caution |
| `purplebox` | Light purple | Purple | Emphasis, takeaways |
| `columnheader` | Pink, centered | None | Column headers in comparisons |

All boxes accept an optional `[title={...}]` parameter.

## Available Slide Commands

| Command | Description |
|---------|-------------|
| `\sectionslide{Title}` | Purple full-bleed section divider |
| `\sectionslide[subtitle]{Title}` | Section divider with subtitle label |
| `\subsectionslide{Title}` | Light subsection divider |
| `\statementslide{text}` | Purple quote/statement slide |
| `\whitetitlepage` | Alternative white title page |
| `\returndecomp{A}{B}{C}{D}` | 4-component return decomposition |

## Required Theme Assets

The theme needs these files accessible via `\graphicspath`:

- `kellogg-bg-purple.png` -- purple geometric background
- `kellogg-bg-white.png` -- white geometric background
- `kellogg-logo-purple.jpg` -- purple logo for content slides
- `kellogg-logo-white-small.png` -- white logo for dark slides

All four are bundled in `SKILL_DIR/theme/`.
