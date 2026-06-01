# pptxgenjs Critical Rules

Hard-won rules for generating slides with pptxgenjs without corrupting the
output file. Violating any of these tends to either crash pptxgenjs or
produce a `.pptx` that PowerPoint refuses to open.

## File-corrupting mistakes (never do these)

- **Never use `#` in hex colors.** pptxgenjs expects raw 6-char hex
  (`'1E2761'`, not `'#1E2761'`). The `#` character corrupts the file.
- **Never encode opacity in 8-char hex colors.** Use `transparency` /
  `alpha` options instead. An 8-char hex (`'1E2761FF'`) corrupts the file.
- **Never reuse option objects across calls.** pptxgenjs mutates them in
  place. Construct a fresh object per call (or deep-clone before passing).

## Formatting gotchas

- **Use `bullet: true`**, never unicode `•`. Hand-rolled bullet glyphs
  break alignment and screen readers.
- **Use `breakLine: true`** between text-array items rather than embedding
  `\n`.
- **Use `margin: 0`** when aligning text with shapes. The default text
  margin shifts the visible content off the shape edge.
- **Shadow `offset` must be non-negative.** For upward shadows, set
  `angle: 270` rather than a negative offset.
- **Don't use `ROUNDED_RECTANGLE` with rectangular accent overlays.** The
  rounding shifts pixels at the edges and the overlay no longer aligns.

## Reference

See the bundled document-skills:pptx skill for the canonical pptxgenjs
reference (`pptxgenjs.md`) — that file has fuller API coverage.
