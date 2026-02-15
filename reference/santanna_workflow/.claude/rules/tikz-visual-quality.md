# TikZ Visual Quality Standards

## Label Management
Labels must NEVER overlap with curves, lines, dots, braces, or other labels.
Stagger labels near same height. Group labels right of final data points. Axis labels at arrow tips.

## Visual Conventions
- Solid dots/lines = observed outcomes
- Hollow circles/dashed lines = counterfactual/unrealized
- Consistent color usage for semantic meaning

## Technical Standards
- Axes and data lines: `thick`
- Annotation arrows: `thick` (NOT `very thick`)
- Grid lines: `dashed, gray!40`
- Standard scale: `[scale=1.1]`
- Data point radius: `4pt`

## Spacing
Minimum 0.2-unit gap between labels and graphical elements.
Axes extend beyond all data points.

## Authority
The Beamer `.tex` file is the authoritative source for ALL TikZ diagrams.
