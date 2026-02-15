# Single Source of Truth

**Beamer `.tex` files are the authoritative source.** All other formats derive from them.

## TikZ Freshness Protocol
Before using any TikZ diagram in Quarto, verify it matches current Beamer source. Compare coordinates, labels, colors. If different, update extraction and regenerate SVGs.

## Environment Parity
All custom Beamer environments require corresponding CSS equivalents before translation.

## Content Fidelity Checklist
- Frame counts match
- Mathematical notation identical
- Citations have corresponding keys
- No content added or dropped during translation

## Re-extraction Triggers
- Beamer source modified
- Starting new Quarto translation
- Addressing quality issues
- Before commits involving QMD changes

Changes flow from Beamer (source) to derived formats, never the reverse.
