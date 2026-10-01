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
python3 scripts/pangram_check.py draft.md --dashboard  # get a shareable link
python3 scripts/pangram_check.py draft.md --json       # raw API response
python3 scripts/pangram_check.py --models              # list available models
```

Options: `--model` (`pangram-4` or `default`), `--show-human` to also print
human-labeled passages, `--poll` / `--timeout` for the async poll loop.

Documents are always submitted whole. There is no chunking option: `pangram-4`
scores per token and returns labelled windows, so localization comes from the
model. Do not hand-split input to try to improve it.

**Use `pangram-4`.** It is the default in both scripts. The older `default`
model is roughly ten times cheaper per word and much less sensitive — on a
2,000-word document that was half machine-written with one clean seam, it
returned "Human Written" and missed the AI half entirely, while `pangram-4`
found the seam within 19 characters. Only reach for `default` when cost
genuinely dominates and you just want a coarse screen.

`pangram_check.py` makes one API call, so it fits single-document checks. For a
directory of drafts, use the bulk script instead — it packs every file into as
few jobs as the unit limit allows.

```bash
python3 scripts/pangram_bulk.py chapter*.md              # one row per file
python3 scripts/pangram_bulk.py drafts/*.md --csv out.csv     # spreadsheet
python3 scripts/pangram_bulk.py drafts/*.md --dry-run     # cost first
python3 scripts/pangram_bulk.py --resume blk_123         # refetch a past job
```

Bulk prints a table (item, verdict, AI%, top score, confidence), then the most
AI-like items with excerpts. Add `--detail` for the full per-item report,
`--json` for raw output. Item IDs are file labels, so every row maps back to its
source.

Always `--dry-run` first on anything large: it prints the item count and
billable units without spending them. A unit is one started word block per item
— 100 words for `pangram-4`, 1,000 words for `default`, minimum one unit per
item — capped at 1,000 units per job. The script splits oversized runs across
multiple jobs automatically.

`pangram-4` costs about ten times what `default` does for the same text: a
40k-word paper is 400 units rather than 40. That is the price of the
localization, and it is usually worth paying.

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

Under `pangram-4` the per-window labels **do** localize, and localize well.
The model scores every token and aggregates over overlapping 512-token windows,
so a single submission can come back split into correctly-labeled spans. Tested
locally on a document with a known seam at char 8,724 — 1,300 words of human
prose followed by 670 words of AI: `pangram-4` split at 8,705, labeled the human
side 0.02 and the AI side 0.98 both at High confidence, and reported 32% AI
against a true 34% by word count. This is the main reason to prefer it.

Under the older `default` model the windows are *not* a reliable map, which is
why earlier versions of this skill said so. On that same seam document `default`
called the whole thing Human Written across six windows and located nothing.

The failure mode that survives in `pangram-4` runs the *opposite* direction from
the one you would expect: short AI passages embedded in longer human prose get
smoothed into a human window. Tested on ten alternating paragraphs, the last
five localized essentially perfectly — window boundaries within a character or
two of every real paragraph break — but three earlier AI paragraphs of 74 to 150
words were absorbed into one 0.09 "Human Written" window. Submitted on their own
those three came back AI-Generated at 0.75/High. Reported AI share was 22%
against a true 45%.

So the bias is toward false negatives on short embedded spans, not false
positives on surrounding human text. Read a clean "Human Written" verdict on a
long, mixed-provenance document as weak evidence rather than a clearance. The
flagged windows are reliable when they fire; silence about a short passage is
not evidence that passage is human.

Scores near 0.99 with High confidence are strong calls; Medium confidence on a
short passage is weak evidence. Pangram needs roughly 50+ words for a usable
verdict, and the script refuses shorter input rather than reporting noise.

## Working with the result

When the user is trying to make a draft read as less AI-generated:

1. Submit the whole document. One `pangram-4` call gives both the verdict and
   the locations, and the contamination this skill used to warn about — human
   prose dragged into an AI label by neighbouring AI text — does not reproduce
   under it.
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
