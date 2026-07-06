# Why LLM Sections Read Differently — and How to Fix It

This document identifies recurring stylistic gaps between the LLM-generated (`\begin{llm}...\end{llm}`) sections and the human-written prose in this paper. Use it as a checklist when writing or revising appendix text, counterfactual discussions, or any new prose.

---

## 1. The author builds tension; LLM sections summarize

**Human pattern:** The author sets up puzzles, contradictions, or counter-intuitive results *before* resolving them. Sentences like "But because payment markets are two-sided, standard intuitions may not apply" invite the reader to update their priors. The payoff comes later.

**LLM pattern:** LLM sections tend to state the result and then explain it. There is no surprise, no tension. The reader is told what to think before they have a reason to care.

**Fix:** Open paragraphs with the puzzle or the surprising fact. Let the explanation follow. "A merger to monopoly would *increase* total welfare" lands harder than "Monopoly can be welfare-improving because of the competitive bottleneck."

---

## 2. The author writes short, punchy sentences; LLM prose is metronomic

**Human pattern:** Sentence length varies sharply. A long sentence establishing context is followed by a short declarative one that delivers the point: "This creates a 'competitive bottleneck.'" The rhythm is deliberate.

**LLM pattern:** LLM sentences hover around the same medium length (15-25 words). The effect is a flat, textbook cadence — correct but monotonous.

**Fix:** Vary sentence length intentionally. After a complex sentence, follow with something blunt. After listing facts, land with a short sentence that draws the conclusion.

---

## 3. The author explains *why*; LLM sections describe *what*

**Human pattern:** The writing is mechanism-focused. After stating a result, the author traces the causal chain: "Adding an expensive card incurs fees from both multi-homers and single-homers but increases sales only from single-homers. Thus, if all consumers multi-home, merchants would accept only the lowest-fee network."

**LLM pattern:** LLM sections are more likely to state comparative facts ("the intermediate cap reduces fees by 100 bps and rewards by 132 bps") without unpacking the mechanism that produces the gap. The prose *reports* rather than *explains*.

**Fix:** After any numerical comparison, add a sentence that starts with "because" or "since" — or structure the sentence so the mechanism is embedded: "Credit share declines by 24 pp because the cap only binds for credit, pushing consumers toward debit rather than cash."

---

## 4. The author hedges sparingly; LLM sections hedge reflexively

**Human pattern:** The author makes strong claims and qualifies only where the data or model genuinely warrant it. "Fee regulation aligns private and social incentives" — no hedge, no softening.

**LLM pattern:** LLM sections over-hedge with "roughly," "essentially," "appears to," "unlikely to be sufficient," sometimes stacking two hedges in one sentence. This reads as uncertain rather than careful.

**Fix:** Remove hedges that aren't load-bearing. If the model says X, say X. Reserve "roughly" for true approximations (rounding $29Bn to "about $30Bn") and "appears" for genuinely uncertain empirical claims. One hedge per claim, maximum.

---

## 5. The author uses transitions implicitly; LLM sections signpost

**Human pattern:** Logical flow is carried by sentence structure and argument ordering, not by transition words. Two consecutive sentences relate through shared concepts, not through "Moreover" or "In contrast."

**LLM pattern:** LLM sections lean on explicit connectives — "This contrasts with," "More broadly," "In contrast," "Taken together" — often at the start of sentences. These are not wrong but they accumulate into a recognizable LLM cadence.

**Fix:** Delete the transition word and see if the paragraph still flows. If it does, leave it out. When a transition is truly needed, prefer subordinate clauses ("Because only credit fees are capped, consumers substitute from credit to debit") over sentence-initial signposts ("In contrast, when only credit fees are capped...").

---

## 6. The author embeds numbers in arguments; LLM sections list numbers

**Human pattern:** Data appears mid-sentence as evidence for a specific claim: "a 25 basis point reduction in debit rewards reduced debit card spending by around 30%." The number *is* the argument.

**LLM pattern:** LLM sections sometimes present numbers in inventory style — fees change by X, rewards change by Y, share changes by Z — without connecting each number to a claim. The effect is closer to reading a table caption than an argument.

**Fix:** Every number in the prose should answer a "so what?" If you write "debit fees are essentially unchanged," immediately say why: "because the 95 bps cap does not bind for debit." If the number doesn't advance an argument, it belongs in the table, not the text.

---

## 7. The author addresses limitations head-on; LLM sections bury or omit them

**Human pattern:** The author names data limitations explicitly and early: "Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation." This builds credibility.

**LLM pattern:** LLM sections tend either to omit limitations entirely or to soften them with hedging language rather than confronting them directly.

**Fix:** If the analysis has a known weakness, name it in plain language. Then explain what the analysis does despite the limitation. Readers of economics papers respect honest accounting more than apparent completeness.

---

## 8. The author reserves footnotes for caveats; LLM sections put everything inline

**Human pattern:** The main text carries the core logic; footnotes handle institutional detail, alternative explanations, and minor caveats. This keeps the argument streamlined.

**LLM pattern:** LLM sections tend to pack everything into the main text, producing long parenthetical asides or multi-clause sentences that interrupt the argument's flow.

**Fix:** If a sentence adds context that's useful but not essential to the argument, move it to a footnote. If you find yourself writing a parenthetical longer than 10 words, it's probably a footnote.

---

## 9. Avoid these specific LLM tells

| Tell | Example | Fix |
|---|---|---|
| "It is worth noting that..." | Throat-clearing; adds nothing | Delete the phrase, keep what follows |
| "This is because..." as a standalone opener | Reads as explanatory FAQ | Integrate the reason into the prior sentence |
| Three-item lists with parallel structure | "consumers' established habits, network effects from existing acceptance, and the convenience advantages of incumbent infrastructure" | Break the parallelism; vary clause length |
| "More broadly" to widen scope | Signals pivot to generalization | Either the general point follows naturally or it doesn't belong |
| Wrapping up with a restatement | "indicating that simple interchange regulation comes close to the constrained optimum" after already saying this | End on the evidence, not the summary |

---

## Summary checklist

Before finalizing any LLM-written section, ask:

- [ ] Does the opening create tension or curiosity, or does it just announce the topic?
- [ ] Is sentence length varied, or is every sentence roughly the same length?
- [ ] Does every number in the text answer a "so what?"
- [ ] Are there more than two hedges in any paragraph?
- [ ] Can any sentence-initial transition be deleted without losing flow?
- [ ] Is the causal mechanism explicit, or does the text only report outcomes?
- [ ] Are minor caveats in footnotes rather than inline?
- [ ] Would a reader familiar with LLM writing recognize this as AI-generated?
