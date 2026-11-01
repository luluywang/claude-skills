# Risk × Severity Triage

Every open review item gets two labels. The labels decide who handles the item.

| | **Low risk** | **High risk** |
|---|---|---|
| **High severity** (Critical, High) | `auto`: the machine applies it, if it improves the text | `decide`: the author picks A or B |
| **Low severity** (Medium, Low) | `auto`: the machine applies it, if it improves the text | `drop`: not applied, listed in `notes/triage.json` |

One more filter applies to low-risk items: the edit must improve the text. A low-risk edit that only swaps one fine wording for another ("demonstrates" to "shows" where both read well) goes to `drop`, whatever its severity. It would only lengthen the author's `git diff`. The judge marks it `"gain": false`.

The author reads only the `decide` queue. `/copyedit auto` applies the `auto` queue in one command. The `drop` queue stays available if the author wants to pull an item back.

## Severity

Severity comes from the digest label: Critical and High are **high**, Medium and Low are **low**. Triage does not re-grade severity.

## Risk

**Risk asks one question: could applying this edit change what the paper claims, or undo a choice the author already made?** Whether the edit improves the text is a separate question, the `gain` judgment above. A small improvement counts as a gain.

### Low risk (the machine applies it)

The edit keeps every claim, number, citation, and caveat. Examples from past reviews:

- **Grammar fixes.** "is because those banks increased" → "is that those banks increased". "informative of" → "informative about". "Current proposed legislation" → "Currently proposed". Supplying a missing noun: "on the primary or secondary" → "on the primary or secondary card".
- **Swaps of equal strength.** "exacerbate" → "worsen". "demonstrates" → "shows". "a phenomenon known as" → "a practice called".
- **Passive to active, in the project voice.** "AmEx is dropped" → "I drop AmEx".
- **Splits that keep every word of content.** One long sentence becomes two, with nothing added or removed.
- **A vague pronoun replaced by the noun it already points to.** The noun must come from the sentence before. "would shrink it" → "would shrink the entrant's footprint" is safe when "footprint" is the antecedent. "Market share" is not safe if the text said "footprint".
- **Dropping an empty intensifier that carries no claim.** "clearly", "actively", "Reassuringly", "indeed".

### High risk (the author decides, or the item is dropped)

Mark an item high risk when any of these holds:

1. **Strength changes.** The edit adds or removes a hedge ("deter" → "can deter", "confirms" → "supports the view"). It adds or removes a scope word ("just", "only", "all"). It softens or sharpens intensity ("collapses" → "falls", dropping "sharply").
2. **Content changes.** The edit adds a claim, mechanism, number, or citation, or removes a caveat ("so this result should be interpreted with caution"). It deletes a sentence. It says what a figure shows when the original did not.
3. **Definitions and notation.** A rewrite of how an estimator, fixed effect, or model object is defined. For example, "event-retailer-period-income quintile-zip fixed effects" are *interacted* effects. Listing them as separate effects reads as additive and changes the specification.
4. **Theme words and load-bearing terms.** The edit rephrases a phrase that carries the paper's argument ("redirect competition", "price coherence", "credit aversion"), even with a synonym.
5. **High-exposure text.** The abstract, the title, the first paragraph of the introduction, and the main result sentences. Wording there is the author's call.
6. **Prior decisions.** The author already chose A or B on this sentence (`notes/copyedit_decisions.jsonl`). Never propose the same change again, and never propose undoing it.
7. **The proposal has a defect.** It creates a dangling construction ("To evaluate X, see Appendix Y"), an unclear "it", or a sentence that is wordier than the original. The proposal also needs fixing when its noun does not match the surrounding text. Fix the proposal (`adapted`) and judge the fixed text. If no clean fix exists, mark it high risk.
8. **Letters to editors and referees.** Tone and thanks are the author's call. Grammar fixes in a letter are still low risk.

### Hard signals (from `scripts/triage.py`)

The script computes signals before the model looks at an item. These signals act as a floor, and the model can never lower an item below them.

- **BLOCK.** These can never be overridden: the protected tokens differ (numbers, `$...$` math, `\ref`, citation and scalar macros), the text is in the abstract, the author already decided on the sentence, or there is no rewrite.
- **REVIEW.** These are the hedge or modal words, the negation and scope words, the length ratio outside 0.6–1.6, and a dropped load-bearing term. The model may override a REVIEW signal only with a one-line reason that names why the meaning is unchanged. Example: "drops 'not' by rephrasing 'not accepting' as 'acceptance'; same meaning".

When in doubt, mark the item high risk. A wrong `auto` changes the paper without the author seeing it. A wrong `drop` only loses a small polish.

## The `decide` list (A/B format)

The author reads `notes/review_decide.md`. Each entry has:

- **A:** the current text, quoted from the source and not from the review.
- **B:** a concrete rewrite. Never an abstract critique label. If no rewrite is possible (the author must supply content), say so and ask one specific question.
- **Why it needs you:** one line naming the risk.

Rank entries by the Top 20 rules in `prompts/copyedit_wrapup.md` Step 3.6: claims that outrun the evidence first, then correctness, then project rules, then structure.

## Reading the author's reply

- Only an explicit letter applies a change. "D3B" applies B. "D3A" keeps A.
- "Fine", "ok", "leave", or "all fine" for a group, with no letter, means **keep A**. Do not read it as approval of B.
- An item the reply does not mention stays unchanged and stays in the queue.
- When the author writes their own wording ("A but take out the cite"), apply that wording, and record it as the choice.
- Record every reply in `notes/copyedit_decisions.jsonl`, including the A choices, so a later review does not re-ask.
