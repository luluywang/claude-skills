# Text Cleaning Task

Clean and format section text for the final markdown document.

## Section: {{SECTION_TITLE}}
## Pages: {{START_PAGE}} to {{END_PAGE}}

## Raw Text
```
{{RAW_TEXT}}
```

## Cleaning Tasks
1. **Remove artifacts**:
   - Page numbers
   - Headers/footers
   - Line break hyphens (recon-nect → reconnect)

2. **Preserve structure**:
   - Paragraph breaks (double newline)
   - Footnote markers as [^N]
   - Citations as (Author, Year)

3. **Mark references**:
   - Tables: `(Table N)`
   - Figures: `(Figure N)`
   - Equations: `(Equation N)` or `(N)`

4. **Format special elements**:
   - Bullet points as markdown lists
   - Block quotes with `>`
   - Emphasis with *italics* or **bold**

## Output Format
Return cleaned markdown with a prominent section header banner:

```markdown
####################################################################
##                    [SECTION TITLE CAPS]                        ##
####################################################################

[Cleaned section text here...]

---
```

This banner format makes sections easy to find when scrolling through long documents.

## Example Input
```
The coefficient in column (1) of Ta-
ble 2 shows that a one standard devia-
tion increase in X leads to...^5

5. This finding is consistent with...
```

## Example Output
```
The coefficient in column (1) of Table 2 shows that a one standard deviation increase in X leads to...[^5]
```

## Important Notes
- Preserve ALL mathematical notation and special characters
- Don't remove superscript numbers that are footnote references - convert to markdown [^N] format
- Keep citations exactly as written in the original text
