# Verification Protocol

**At the end of EVERY task, verify the output works correctly.** Non-negotiable.

## For Quarto/HTML Slides:
1. Run sync/render script
2. Open HTML in browser
3. Verify images display
4. Check for overflow on dense slides
5. Verify environment parity
6. Report verification results

## For LaTeX/Beamer Slides:
1. Compile with xelatex and check for errors
2. Open PDF to verify figures render
3. Check for overfull hbox warnings

## For TikZ Diagrams in HTML/Quarto:
1. ALWAYS convert PDF to SVG (browsers cannot display PDF inline)
2. NEVER use PNG for diagrams (raster = blurry)
3. Verify SVG files contain valid markup
4. Freshness check: TikZ source must match current Beamer source

## For R Scripts:
1. Run Rscript
2. Verify output files created with non-zero size
3. Spot-check estimates for reasonable magnitude

## Verification Checklist:
```
[ ] Output file created successfully
[ ] No compilation/render errors
[ ] Images/figures display correctly
[ ] Paths resolve in deployment location
[ ] Opened in browser/viewer to confirm visual appearance
[ ] Reported results to user
```
