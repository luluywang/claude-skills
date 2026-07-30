---
name: pangram
description: >
  Check text for AI-generated writing using the Pangram detection API. Returns a
  verdict (AI / AI-assisted / human), an AI-vs-human mix, and the specific
  passages that were flagged. Use when the user invokes '/pangram', pastes text
  and asks "does this read as AI?", "is this AI-detectable?", "run this through
  Pangram", or wants to verify a draft after a rewrite pass. Do NOT activate for
  general questions about AI writing style — use the writing_standards or
  copyedit skills for that.
---

# Pangram AI-writing check

Runs text through [Pangram](https://docs.pangram.com)'s detection API and reports
which passages read as machine-written.

## Usage

```bash
python3 scripts/pangram_check.py draft.md              # check a file
pbpaste | python3 scripts/pangram_check.py             # check the clipboard
python3 scripts/pangram_check.py --text "..."          # check inline text
python3 scripts/pangram_check.py draft.md --chunk-words 300   # per-section verdicts
python3 scripts/pangram_check.py draft.md --dashboard  # get a shareable link
python3 scripts/pangram_check.py draft.md --json       # raw API response
python3 scripts/pangram_check.py --models              # list available models
```

Options: `--model` (`default` or `pangram-4`), `--show-human` to also print
human-labeled passages, `--chunk-words N` to split a long document and get a
separate verdict per chunk, `--poll` / `--timeout` for the async poll loop.

`pangram_check.py` makes one API call per chunk, so it fits quick checks. For a
whole manuscript or a directory of drafts, use the bulk script instead — it
packs everything into a single job.

```bash
python3 scripts/pangram_bulk.py chapter*.md              # one row per file
python3 scripts/pangram_bulk.py paper.tex --chunk-words 400   # one row per chunk
python3 scripts/pangram_bulk.py drafts/*.md --csv out.csv     # spreadsheet
python3 scripts/pangram_bulk.py paper.tex --chunk-words 400 --dry-run  # cost first
python3 scripts/pangram_bulk.py --resume blk_123         # refetch a past job
```

Bulk prints a table (item, verdict, AI%, top score, confidence), then the most
AI-like items with excerpts. Add `--detail` for the full per-item report,
`--json` for raw output. Item IDs are `<file>#<chunk>`, so every row maps back
to its source.

Always `--dry-run` first on anything large: it prints the item count and
billable units without spending them. A unit is one started word block per item
— 1,000 words for `default`, 100 words for `pangram-4`, minimum one unit per
item — capped at 1,000 units per job. The script splits oversized runs across
multiple jobs automatically. Note the chunking interaction: 88 chunks of a
40k-word paper cost 88 units under `default`, not 40, because each short item
still bills a full unit. Coarser chunks cost less.

Both scripts use only the Python standard library — no `pip install` needed.
Shared helpers live in `scripts/pangram_api.py`.

## Auth

The API key is read in this order: `--api-key`, `$PANGRAM_API_KEY`,
`$PANGRAM_API_KEY_FILE`, then `~/Dropbox/Claude/pangram/pangram.api`. The key
file is already in place, so no setup is normally required. Never print the key
or paste it into a commit.

## Reading the output

- **Verdict** — `headline` plus Pangram's sentence-long call on the document.
  Headlines are not just AI/Human: observed values include `Human Written`,
  `Mostly Human Written`, `Mostly Human, AI Assisted`, `Mostly Human, AI
  Detected`, `AI Assisted`, `AI Detected`, and `AI Generated`. The middle
  categories are the common outcome on real edited prose — read them as "some
  passages scored above threshold," not as a finding that the author used AI.
- **Mix** — share of the text labeled AI, AI-assisted, and human.
- **Flagged passages** — each window's label, `ai_assistance_score` (0–1,
  higher = more AI-like), confidence, character range, and an excerpt.

The per-window labels are **not** a reliable map of which parts are AI. Tested
locally on a document with a known seam: 2,279 chars of human prose (0.01 alone)
followed by an AI paragraph. Pangram split at char 2,740 — not the real boundary
— and labeled both windows AI-Generated at 0.99/High, reporting 0% human for a
document that was ~79% human by length. Read `windows` as evidence about
*whether* a document contains AI text, not *where*. To localize, chunk and
submit the pieces separately.

Scores near 0.99 with High confidence are strong calls; Medium confidence on a
short passage is weak evidence. Pangram needs roughly 50+ words for a usable
verdict, and the script refuses shorter input rather than reporting noise.

## Working with the result

When the user is trying to make a draft read as less AI-generated:

1. Run the check with `--chunk-words 300` to localize the problem rather than
   getting one verdict for the whole document. This matters more than it looks:
   the model reads the whole submission at once, so a few AI paragraphs can drag
   the surrounding human prose into an AI label. Verified locally — human
   paragraphs that scored 0.01 on their own came back at 0.99 once AI text was
   appended to the same document. Chunk before concluding a section is AI.
2. Report the flagged passages verbatim — the character ranges map back into the
   source file.
3. Rewrite only the flagged spans. The `writing_standards` skill
   (`ai_detection_rules.md`, `vocabulary_ban_list.md`) has the concrete tells to
   remove; `/write-loop` runs a rewrite/critique loop against them.
4. Re-run the check on the revision to confirm the score moved.

Do not treat a "Human Written" verdict as a goal in itself — a detector score is
not a proxy for good writing, and text can pass Pangram while still being badly
argued. Say what changed, not just that the number dropped.

## Notes and limits

- The API is asynchronous: the script POSTs to `/task`, then polls
  `GET /task/{id}` until `STAGE_SUCCESS` or `STAGE_FAILED`.
- Text is sent to Pangram's servers. Don't run unpublished confidential
  material through it without checking with the user first.
- `--dashboard` produces a **public** link to the analysis. Only pass it when
  the user asks for something shareable.
- Detectors have false positives. Heavily edited human prose, translated text,
  and formulaic academic boilerplate all skew AI-ward. Report the verdict as
  evidence, not proof.
