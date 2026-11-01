# List Readability Standards

Rules for **sets of parallel short items** that a reader scans rather than reads: bullet
lists, slide bullets, table cells, figure and table titles in a series, theme or summary
cards, dashboard text, referee-response item headers, commit or session titles.

Source: Shankar et al., "Five Principles for Generating Readable AI Text in Bulk"
(fsdatalab.github.io/blog/agent-text-at-scale, Oct 2026), which builds on Bever (1970),
Frazier et al. (1984), Nielsen (2006, 2009) and Mackinlay (1986).

**Scope.** These rules apply to items the reader compares side by side. They do NOT
apply to running prose. In paragraphs, `economics_writing.md` still asks for varied
sentence length and end-position emphasis. In a list, sameness is the goal, because
the reader scans down the list and any difference reads as a signal.

---

## L1. Start each item with its subject or its verb

Readers parse a noun, then a verb, then a noun as actor, action, object (Bever's NVN
strategy). An item that opens with the object or a passive forces a second pass.

- If every item has the same subject (the agent, "we", "users"), drop the subject and
  start with the verb.
- Pick one tense for the first verb and keep it: past for finished work, continuous
  for work in progress, present for findings, imperative for instructions.

| Bad | Good |
|---|---|
| "Login bug fixed by the agent" | "Fixed the login bug" |
| "KV persistence" / "Switching to main" / "Fine-tune model" (mixed) | "Adding KV persistence" / "Switching to main" / "Fine-tuning the model" |
| "Pass-through to fees: estimated at 0.4" | "Fees pass through 0.4 of the cap" |

## L2. Put the distinguishing words first

Readers of a list often see only the first two words of each item (Nielsen). Find the
words that make each item different from its neighbors and move them to the front.

| Bad | Good |
|---|---|
| "Your order #1001 has shipped" / "Your order #1002 was delivered" | "Shipped: order #1001" / "Delivered: order #1002" |
| "Results for the effect of the cap on large banks" / "Results for the effect of the cap on small banks" | "Large banks: the cap cuts fees 12%" / "Small banks: no effect on fees" |

## L3. Use one structure and one vocabulary across items

Readers read a clause faster when it repeats the structure of the one before it
(Frazier et al. 1984). So in one list:

- Every item uses the same grammatical template.
- Every concept keeps one name. Do not call the same object "issue" in one row and
  "page" in the next, or "merchants" here and "sellers" there.
- No item opens with filler ("The issue reports that...", "This slide shows...") that
  the other items lack.

## L4. Vary an item only to show a real difference

Readers assume any difference between items means something (Mackinlay's
expressiveness rule, applied to text). A difference in length, structure, detail type,
or wording invites the question "why is this one different?"

- Give every item the same components (e.g., one claim sentence + one example, or one
  estimate + its standard error).
- If one item names a version, a sample, a subgroup, or a caveat, either give the
  same field for every item or drop it from the one.
- Put a quantity that varies across items (counts, effect sizes) in a consistent slot
  or a chart, not scattered through the text.

## L5. Match verb connotation to the list's purpose

When a list exists to report one kind of thing (complaints, praise, risks, findings
that go against the prior), the first verb should carry that sign so the reader knows
the direction from the verb alone.

| Bad | Good |
|---|---|
| "Chess is a popular new draw" (card lists complaints) | "Users complain that chess ..." |
| "The cap affects small-bank fees" | "The cap raises small-bank fees" |

This rule is the list version of `voice_spec.md`'s "commit the sign."

---

## Self-check for a list

1. Read only the first two words of each item. Can you tell the items apart?
2. Does every item start with the same part of speech, in the same tense?
3. Does any concept have two names across items?
4. Does any item carry a field the others lack? If yes, is that difference real?
5. Can you tell the sign of each item from its first verb?
