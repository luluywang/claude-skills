---
**Model Directive:** Use **Haiku** for text cleaning. This task involves text normalization and artifact removal—mechanical operations only.
---

# Text Cleaning Task

Reformat section text for the final markdown document.

**This is a transcription task, not a summarisation task.** Every paragraph,
sentence, equation and footnote in the input must appear in the output. You are
changing formatting only: fixing hyphenation, stripping page furniture, marking
footnotes. You are not selecting, condensing, or deciding what matters.

## Section: {{SECTION_TITLE}}
## Pages: {{START_PAGE}} to {{END_PAGE}}

## Raw Text
```
{{RAW_TEXT}}
```

## Completeness contract

Read this before you start writing.

1. **Reproduce everything.** Output length should be close to input length once
   page numbers and running heads are removed. If your output is materially
   shorter than the input, you have summarised — go back and transcribe.
2. **Finish the input.** Work through to the last line of `{{RAW_TEXT}}`. Do not
   stop early because the section feels complete, and do not treat the tail of a
   long input as less important than the head.
3. **Transcribe headers you were not expecting.** If the raw text contains a
   heading that is not `{{SECTION_TITLE}}` — a later subsection, an appendix that
   begins mid-page — **include it and its text anyway**, with its own markdown
   heading. Do not drop content because it falls outside the label you were given.
   Page ranges are sometimes slightly wrong; when they are, the correct response
   is to keep the extra content, never to discard it.
4. **Never write a placeholder.** No "[remaining text omitted]", no "[see
   original]", no "...". If you cannot render something (a complex table, an
   unusual glyph), reproduce it as best you can and add a brief `<!-- note -->`.
5. **Preserve every equation**, including displayed equations and their numbers.

> **Why this section exists.** On MS AER-2026-1101 this step was handed a 27-page
> appendix as one unit and returned a summary of roughly its first two thirds.
> Appendices G and H — 1,500 words including 36 numbered equations — were dropped
> without comment. Separately, a unit labelled "5.4" whose page range also covered
> section 5.5 came back with 5.5 absent, because the cleaner treated the label as
> a filter on what to keep. Both failures were invisible until a reader went
> looking for the paper's headline result and could not find it.

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

## Before returning

- [ ] The last paragraph of my output corresponds to the last paragraph of the input.
- [ ] Every heading present in the input appears in my output, including any that
      fall outside `{{SECTION_TITLE}}`.
- [ ] Every numbered equation in the input appears in my output.
- [ ] My output contains no placeholder or elision markers.
- [ ] My output is not materially shorter than the input.
