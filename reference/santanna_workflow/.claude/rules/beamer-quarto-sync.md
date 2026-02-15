# Beamer -> Quarto Auto-Sync

**Every edit to a Beamer `.tex` file MUST be immediately synced to the corresponding Quarto `.qmd` file -- automatically, without the user asking.**

## Translation Reference
- Color/emphasis commands: `\muted`, `\key`, `\textcolor` -> CSS equivalents
- Structural elements: `\item`, highlight boxes, method boxes -> markdown
- Mathematical notation: preserved identically

## Workflow
1. Modify the Beamer file
2. Apply equivalent changes to Quarto immediately
3. Compile Beamer (xelatex, 3-pass)
4. Render Quarto via script
5. Report completion only after all steps finish

## Exceptions
- Quarto file doesn't exist yet
- Changes are LaTeX infrastructure-only
- Explicitly instructed otherwise

## Enforcement Checkpoint
Before task completion: "Did I also update the Quarto file?"
