# AI Detection Review

## [main.tex]

No issues found.

---

## [intro.tex]

### Critical

### - [ ] Lines 26-35: Enumeration with "Three forces" + "First...Second...Third" structure `Critical`

**Comment:** Textbook AI enumeration pattern — signals LLM generation. "Three forces explain... First... Second... Third" is an extremely common LLM scaffolding device, rarely seen in human economic writing at this level.

**Original:**
```
Three forces explain why networks tax merchants to subsidize consumers.
First, consumer payment choices respond strongly to subsidies.
Networks charge merchants interchange fees and pay the revenue to banks, giving them incentives to promote the networks' cards through consumer rewards and other forms of steering.
A regulatory reduction in debit interchange fees --- the Durbin Amendment --- reduced debit card spending at regulated issuers by around 25\% relative to exempt issuers.
Second, accepting cards significantly increases merchant sales.
Event-study evidence shows that, for merchants on the margin of acceptance, beginning to accept credit cards raises sales from credit users by around \scalarpctinput{kilts_model_sales_event}\%.
Third, while almost all merchants accept every network's cards, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network (i.e., they ``single-home'').
Together, these facts produce a partial ``competitive bottleneck'' \parencite{Armstrong2006}: because enough consumers carry only one network's cards, merchants risk losing substantial sales by dropping a network, tilting competition toward rewards rather than fees.
```

**Proposed Revision:**
```
Networks tax merchants to subsidize consumers for three reasons.
Consumer payment choices respond strongly to subsidies: merchants promote networks' cards through consumer rewards to capture the interchange revenue paid by merchants.
A regulatory reduction in debit interchange fees --- the Durbin Amendment --- reduced debit card spending at regulated issuers by around 25\% relative to exempt issuers, demonstrating this sensitivity.
Accepting cards significantly increases merchant sales: event-study evidence shows merchants on the margin of acceptance raise credit card sales by around \scalarpctinput{kilts_model_sales_event}\%.
Yet while almost all merchants accept every network's cards, only around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network (i.e., they ``single-home'').
Because enough consumers single-home, merchants risk substantial sales losses from dropping a network, tilting competition toward rewards rather than fees.
```

**Why better:**
- Eliminates the "First... Second... Third" scaffolding entirely — moves forces into mechanism
- Converts isolated facts into causal flow ("for three reasons" followed by mechanisms)
- Tightens from 8 sentences to 5 sentences without losing substance
- Replaces announcement ("Together, these facts produce") with direct conclusion
- Reads like human argument-building, not enumeration template

---

### - [ ] Lines 43-45: Bare demonstratives with vague expansion `High`

**Comment:** Sentences 3-4 of the structural model setup use stacked bare pronouns ("A mix... which... who... which...") without clear noun anchors. This is a hallmark of LLM filler where the writer restates definitions instead of advancing argument.

**Original:**
```
A mix of single- and multi-homing consumers choose payment methods based on rewards, merchant acceptance, and exogenous non-price characteristics.
Merchants choose which cards to accept and set retail prices to maximize profits net of merchant fees.
```

**Proposed Revision:**
```
Consumers choose payment methods based on rewards and merchant acceptance; they mix single- and multi-homing across issuers.
Merchants choose which cards to accept and set prices to maximize profits net of merchant fees.
```

**Why better:**
- "Consumers mix single- and multi-homing" is stronger than "A mix of consumers single- and multi-home"
- Second sentence is strengthened by dropping the redundant "and set retail prices" clause that doesn't advance the model description
- Parallel structure is clearer: consumers choose methods, merchants choose acceptance

---

### High

### - [ ] Lines 54-59: "Revealed preference" construction + weak transition `High`

**Comment:** The opening "A revealed preference argument illustrates the inefficiency" is pure throat-clearing — it announces what the next paragraph will do rather than doing it. The paragraph that follows is substantive but the preface is LLM-filler language.

**Original:**
```
Credit card adoption is socially excessive because of price coherence.
Because merchants do not surcharge, each consumer who adopts a credit card raises retail prices for all other consumers.
Consumers individually face incentives to distort their payment choices to capture cross-subsidies, but collectively prefer lower credit card use.
A revealed preference argument illustrates the inefficiency.
Since credit cards pay rewards whereas cash and debit do not, the marginal user of credit cards must prefer the non-price characteristics of cash and debit.
```

**Proposed Revision:**
```
Credit card adoption is socially excessive because of price coherence.
Each consumer who adopts a credit card raises retail prices for all other consumers, yet consumers collectively prefer lower credit card use: they individually face incentives to distort payment choices to capture cross-subsidies.
The inefficiency is revealed in consumer revealed preference: marginal credit card users must prefer the non-price characteristics of cash and debit, since credit cards pay rewards while those alternatives do not.
```

**Why better:**
- Deletes "A revealed preference argument illustrates the inefficiency" — pure announcement
- Tightens the causal claim: the prisoner's dilemma is immediate, not a separate intellectual move
- Strengthens "Since credit cards pay rewards... must prefer cash/debit" by positioning it as direct evidence of the preference reversal
- Reduces from 5 sentences to 3 without losing substance

---

### Medium

### - [ ] Lines 13-23: Opening via negation "wrong diagnosis" without building tension first `Medium`

**Comment:** The opening "I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis" states the conclusion first. The tension (why would anyone think weak competition?) only emerges in the next sentence. A more human opening would establish what economists believed before revealing the puzzle.

**Original:**
```
I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.
Networks set rewards for consumers and fees for merchants.
The division of costs matters because merchants typically charge the same price for all payment methods, a phenomenon known as ``price coherence'' \parencite{Frankel1998, Stavins2018}.
```

**Proposed Revision:**
```
Merchant fees are indeed too high, yet the standard diagnosis --- weak competition --- is wrong.
The puzzle emerges from how networks set rewards for consumers and fees for merchants: the division of costs matters because merchants typically charge the same price for all payment methods, a phenomenon called ``price coherence''.
```

**Why better:**
- "yet the standard diagnosis is wrong" creates tension before resolution
- Drops announcement "I find" (Principle 8: no throat-clearing)
- Positions "Networks set rewards... fees for merchants" as the mechanism explaining why the diagnosis is wrong, rather than an isolated fact
- More concise and builds reader curiosity

---

### - [ ] Lines 77-82: Stacked hedges and "there is no trade-off" construction `Medium`

**Comment:** The passage "The gains from credit fee caps are also progressive. Reduced merchant fees pass through... whereas the reduction in rewards falls mostly on high-income consumers who are more likely to use credit cards." uses three hedging moves in sequence ("also," "mostly," "more likely") without clear mechanism connecting them. The concluding sentence "My results show that there is no trade-off" is weaker than the evidence warrants.

**Original:**
```
The gains from credit fee caps are also progressive.
Reduced merchant fees pass through to lower retail prices for all consumers, whereas the reduction in rewards falls mostly on high-income consumers who are more likely to use credit cards.
Consumer surplus rises by 48 bp of consumption for low-income consumers, compared to only 15 bp for high-income consumers.
My results show that there is no trade-off between equity and efficiency in regulating payment fees.
```

**Proposed Revision:**
```
The gains are progressive.
Reduced merchant fees lower retail prices for all consumers, but lost rewards hit high-income users harder — they use credit cards more.
Low-income consumers gain 48 bp of consumption against 15 bp for high-income consumers.
The cap achieves equity and efficiency simultaneously.
```

**Why better:**
- Cuts "also" (adds no information) and "mostly," "more likely" (hedges weaken the evidence unnecessarily when the numbers are provided)
- Removes "My results show that there is" — direct claim is stronger
- "The cap achieves equity and efficiency simultaneously" is more active and less hedge-laden than "there is no trade-off"
- Sharpens from 4 sentences to 3 without losing substance

---

### Low

### - [ ] Line 15: Footnote parenthetical on surcharging `Low`

**Comment:** The footnote opening "This occurs even though cash discounts and card surcharges are largely legal" uses "largely legal" which is a weak hedge. But the footnote is properly marginal, so this is a minor issue.

**Original:**
```
This occurs even though cash discounts and card surcharges are largely legal.
```

**Proposed Revision:**
```
This occurs despite the legality of cash discounts and card surcharges.
```

**Why better:** "Despite the legality" is more direct than "largely legal" — it acknowledges legal status without hedging

---

**Total AI Detection Flags: 5 (1 Critical, 1 High, 2 Medium, 1 Low)**

---

## [institutional_details.tex]

No issues found.

---

## [data.tex]

### Summary

AI detection scan complete. No critical or high-severity patterns detected.

### Medium

- [ ] Lines 46–51: Transition word + data intro structure `[Medium]`

**Comment:** "Issuer Payment Volumes (2007–2014):" followed by "The Nilson Report publishes..." is a standard introduction pattern, slightly formulaic but not AI-typical given the data context.

**Original:**
```
\noindent \textbf{Issuer Payment Volumes (2007--2014):} 
The Nilson Report publishes the dollar payment volumes of the top credit and debit card issuers annually.
```

**Proposed Revision:**
```
\noindent \textbf{Issuer Payment Volumes (2007--2014).} I use an annual panel of 39 issuers from the Nilson Report covering 2007--2014 to study how the Durbin Amendment affected payment volumes.
```

**Why better:** Moves directly to the analysis purpose rather than restating what the Nilson Report is; tightens the section opener.

### Low

No additional low-severity AI patterns detected. The document maintains a clear, direct data-driven voice without hedging, excessive transitions, or narrative padding.

---

# AI Detection Results

## [reducedform.tex]

No issues found.


---

## [model.tex]

### Critical
No critical AI patterns detected.

### High
No high-severity AI patterns detected.

### Medium
No medium-severity AI patterns detected.

### Low
No low-severity AI patterns detected.

---

**Summary:** model.tex contains primarily technical exposition of equations and model mechanics. The prose is terse and mechanism-focused, with clear causal explanations for mathematical setup. No characteristic LLM tells (hedging stacks, results-first openings without tension, inventory-style enumeration, or rhetorical em-dash/colon constructions) detected. Document passes AI detection review.

---

## [estimation.tex]

### Summary
Estimation.tex is human-written academic prose with strong technical voice. No critical AI patterns detected. Punctuation, transitions, and language all appropriate for economics paper. A few minor hedging phrases exist but are justified by methodological context.

### No issues found.

The prose demonstrates:
- Clear cause-and-effect language ("identifies," "recover," "reveal")
- Precise technical vocabulary (FOC, semi-elasticity, SMM, covariance matrix)
- Appropriate methodological humility in caveats (e.g., lines 79-81 on extrapolation beyond grocery)
- Varied sentence structure and length
- No smarmy hedging or stacked qualifications
- Citations properly integrated
- Numbers anchored to specific claims

---

# AI Detection

## [counterfactuals.tex]

### Critical
No critical AI-detection issues found.

### High
No high-severity AI-detection issues found.

### Medium
No medium-severity AI-detection issues found.

### Low
No low-severity AI-detection issues found.

---
**Summary:** No AI-typical punctuation, structure, or language patterns detected. The writing exhibits clear causal mechanisms, varied sentence structure, and concrete evidence-grounded claims throughout.

---

## [conclusion.tex]

### Critical

- [ ] Lines 21-22: Claims overshooting evidence `Critical`

**Comment:** The phrase "challenges a second piece of conventional wisdom" asserts a strong rhetorical claim ("challenges") without sufficient scope qualification. The evidence presented (merger causes lower aggregate merchant costs) describes an outcome in the model; whether this actually "challenges" real-world antitrust reasoning depends on contestable assumptions about what antitrust typically targets. The verb strength exceeds the descriptive evidence.

**Original:**
```
The merger counterfactual challenges a second piece of conventional wisdom: that high merchant fees reflect too little competition.
```

**Proposed Revision:**
```
The merger counterfactual complicates a second piece of conventional wisdom: that high merchant fees reflect too little competition.
```

**Why better:** "Complicates" matches the descriptive nature of the counterfactual evidence — it shows a possible tension in the logic without claiming the conventional wisdom is wrong overall.

---

### High

- [ ] Lines 21-22: Smarmy reframing pattern `High`

**Comment:** The construction "that high merchant fees reflect too little competition" after "conventional wisdom:" sets up a colon rhetorical device where the idea after the colon is a summary/restatement of the prior clause. This is an LLM-typical punctuation choice (CLAUSE: LONGER_CLAUSE). The passage would read more naturally as a direct statement.

**Original:**
```
The merger counterfactual challenges a second piece of conventional wisdom: that high merchant fees reflect too little competition.
```

**Proposed Revision:**
```
The merger counterfactual challenges the assumption that high merchant fees reflect too little competition.
```

**Why better:** Removes the rhetorical colon construction and places the key claim as a direct continuation rather than a revealed punchline. More direct, less formulaic.

---

### Medium

- [ ] Lines 31-34: Bare demonstrative "these" without clear referent `Medium`

**Comment:** The phrase "Whether these services raise welfare" uses "these services" without a specific antecedent in the prior sentence. The nearest reference is "Buy Now, Pay Later," but the sentence structure makes the referent ambiguous. A reader may wonder: "these services" or "their merchant models"? The reference should be explicit.

**Original:**
```
Buy Now, Pay Later is the latest technology to woo consumers with generous terms funded by high merchant fees \parencite{Berg.etal2024}.
Whether these services raise welfare depends on whether they shift competition toward merchants or simply open another front in the war for cardholders.
```

**Proposed Revision:**
```
Buy Now, Pay Later is the latest technology to woo consumers with generous terms funded by high merchant fees \parencite{Berg.etal2024}.
Whether these programs raise welfare depends on whether they shift competition toward merchants or simply open another front in the war for cardholders.
```

**Why better:** "These programs" is more specific and avoids the ambiguity of "these services," which could refer to multiple entities in the passage.

---

### Low

- [ ] Lines 4-7: Enumeration of outcomes without explicit causal chaining `Low`

**Comment:** The first paragraph lists outcomes ("rising credit card use," "rising merchant costs," "rewards draw more consumers," "increasing merchants' costs") without fully chaining the causal mechanism step-by-step. While the logic is present, a more mechanistic exposition would trace: competition → reward arms race → consumer migration → increased merchant costs. The current phrasing reports results.

**Original:**
```
Rising credit card use and rising merchant costs both follow from intense network competition channeled toward the wrong side of the market.
Because consumers are far more sensitive to rewards than merchants are to fees, networks compete for cardholders with generous rewards funded by merchant fees.
Price coherence ensures that these fees pass through to higher retail prices borne by all consumers, including those who pay with cash and debit. 
The rewards draw more consumers to credit cards, increasing merchants' costs.
```

**Proposed Revision:**
```
Intense network competition channeled toward the wrong side of the market creates a chain: networks vie for cardholders with rewards, funded by merchant fees that pass through to retail prices; these rewards draw consumers to credit cards, raising merchant costs for all customers.
```

**Why better:** Traces the mechanism more explicitly in one coherent chain rather than listing outcomes sequentially.

---

**No additional critical or high-severity issues found. Passage reads cleanly overall with disciplined prose and strong causal reasoning.**

---

## [appendix_data.tex]

No issues found.

The writing is direct, technical, and appropriately hedged where empirical claims are made. No AI-typical punctuation patterns (stacked hedges, smarmy reframing, unnecessary transitions, or results-first openings) detected. The prose uses clear causal reasoning, appropriate caveating without excessive hedging, and well-structured explanations of technical choices and data handling procedures. This is clean, human-written technical documentation.

---

## [appendix_model.tex]

No issues found.

---

## [appendix_estimation.tex]

### Summary
No AI-detected patterns found.

The writing is direct, technical, and instrumental. No smarmy reframing, stacked hedges, dramatic colons, or AI vocabulary clusters detected. Language is clear and precise throughout.

### Part A (Punctuation/Structure)
No issues found.

### Part B (Language)
No issues found.

### Part C (Rhetorical/Argument)
No issues found.

### Verdict
Pass. This section meets standards for human-authored technical prose.

---

# AI Detection Review

## [appendix_tables.tex]

No issues found.

This file is composed almost entirely of LaTeX table environment structures (\begin{table}...\end{table}) with brief, factual captions and tablenotes. The prose content is minimal—mostly metadata descriptions of data sources (e.g., "Homescan panel, 2017–2019") and methodological notes.

The few prose sentences present are direct, technical, and clear. No AI-characteristic patterns detected:
- No unnecessary hedging or filler
- No smarmy reframing
- No stacked hedge qualifiers
- No results-first without mechanism
- No artificial transition phrases
- No vague noun phrases substituting for specificity

The writing is factual and appropriately sparse for an appendix table document.

---

## [appendix_figures.tex]

File contains primarily LaTeX structural commands with minimal prose. Prose appears in figure captions and table notes only.

AI detection review: No critical or high-severity AI patterns detected. The table notes use straightforward, data-focused language typical of human-written academic documentation.

- Captions are brief and direct ("Australian credit card market after interchange regulation")
- Table notes use simple reporting structure without hedging or smarmy framing
- No transition padding or unnecessary elaboration
- No stacked hedges or overcautious language
- No rhetorical inflation

**Total flags: 0**

---

## [appendix_data_oa.tex]

No issues found.

This is straightforward technical documentation of data sources. Prose is direct, fact-based, and data-focused. No AI-typical punctuation patterns (em-dash overuse, colon-list constructions, semicolon overuse). No smarmy reframing, stacked hedges, or meta-commentary. Language is precise and appropriate throughout.

---

## [appendix_reduced.tex]

### Summary

This appendix is human-written with careful argumentation, strong mechanisms, and appropriate claim-evidence matching. The writing shows:
- Proper mechanism explanation throughout (not results-first)
- Careful use of verbs ("suggests," "shows," "rules out") matched to evidence type
- Varied paragraph and sentence structure
- Clear causal chains even in complex sections
- Proper hedging discipline

No Critical or High severity AI patterns detected.

### Medium Severity

- [ ] Lines 142-147: Multi-item description **`[Medium]`**

**Comment:** Lines 142-147 present three alternative mechanisms in rapid succession without individual elaboration. This "Three Explanations" template is LLM-typical, though in this context it's functional.

**Original:**
```
The debit volume decline could reflect three mechanisms: bank switching by consumers fleeing Durbin-exposed institutions, a pull toward credit from improved large-bank rewards, or within-bank substitution driven by loss of debit rewards.
```

**Proposed Revision:**
```
The debit volume decline could reflect three mechanisms. First, bank switching by consumers fleeing Durbin-exposed institutions. Second, a pull toward credit from improved large-bank rewards. Third, within-bank substitution driven by loss of debit rewards.
```

**Why better:** Breaks the rule-of-three list into separate statements, allowing each mechanism its own introductory heft and making the subsequent evidence for each clearer.

---

### Low Severity

- [ ] Line 243-244: Bare demonstrative **`[Low]`**

**Comment:** "The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale (Online Appendix~\ref{sec:oa-credit-debit})."

The parenthetical cross-reference is long (~15 words) and could be a footnote to streamline the sentence.

**Original:**
```
The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale (Online Appendix~\ref{sec:oa-credit-debit}).
```

**Proposed Revision:**
```
The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale.\footnote{For analysis of credit-debit substitution margins, see Online Appendix \ref{sec:oa-credit-debit}.}
```

**Why better:** Footnotes minor cross-references, keeping the main argument tighter and the supporting detail accessible without inline clutter.

---

**Overall Assessment:** The appendix demonstrates strong human writing. Mechanisms are explicit, evidence is substantial, and claims are appropriately scoped. No systematic AI tells detected.

**Total Flags: 2** (both are stylistic suggestions, not revisions required)

---

## [appendix_model_oa.tex]

### Low

- [ ] Lines 80-81: Repetition of "by inspection" in consecutive sentences `Low`

**Comment:** The phrase "by inspection" appears twice within the same sentence pair, creating a minor stutter.

**Original:**
```
By inspection, cutting $\tau_1$ raises $\underline{\gamma}_2$ by widening $\tau_2 - \tau_1$, which increases diversion drag without changing incremental sales. Three special cases follow by inspection: $D = 0$ (no multi-homers) gives $\underline{\gamma}_2 = \sigma\tau_2/(1-\sigma\tau_2)$; $N \to 0$ (no single-homers) sends $\underline{\gamma}_2 \to \infty$; and $\tau_2 = \tau_1$ collapses the threshold to $\underline{\gamma}_1$.
```

**Proposed Revision:**
```
By inspection, cutting $\tau_1$ raises $\underline{\gamma}_2$ by widening $\tau_2 - \tau_1$, which increases diversion drag without changing incremental sales. Three special cases follow: $D = 0$ (no multi-homers) gives $\underline{\gamma}_2 = \sigma\tau_2/(1-\sigma\tau_2)$; $N \to 0$ (no single-homers) sends $\underline{\gamma}_2 \to \infty$; and $\tau_2 = \tau_1$ collapses the threshold to $\underline{\gamma}_1$.
```

**Why better:** Removes the redundant "by inspection" and streamlines the second sentence.

---

## [appendix_credit_debit.tex]

### High

- [ ] Lines 204–204: Unclear/awkward clause structure `[High]`

**Comment:** Sentence abruptly cuts off mid-thought and restarts. Looks like incomplete revision.

**Original:**
```
The generalized threshold yields two testable predictions for the case when there is substitution and debit cards generate incremental sales relative to cash..
```

**Proposed Revision:**
```
The generalized threshold yields two testable predictions: (1) credit acceptance should depend on credit-debit multi-homing rates, and (2) debit fee caps should discipline credit fees.
```

**Why better:** The original trails off with ".." — appears incomplete. The revision provides the actual two predictions that follow in the next sections, making the sentence complete and directing the reader.

### Medium

- [ ] Lines 236–243: Incomplete transition, abrupt restart `[Medium]`

**Comment:** Paragraph starts with "In the main text, I focus on the baseline model because it most accurately captures the effects of the D" and then restarts with different phrasing. Suggests incomplete editing or copy-paste error.

**Original:**
```
In the main text, I focus on the baseline model because it most accurately captures the effects of the D
The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
```

**Proposed Revision:**
```
In the main text, I focus on the baseline model because it most accurately captures actual policy responses. The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
```

**Why better:** Connects the two sentences coherently instead of restarting. The original sentence fragment "effects of the D" is incomplete (possibly "Durbin"?), while the revision completes the thought and flows into the justification.


---

## [appendix_robustness.tex]

### Medium

- [ ] Lines 57-59: Colon-list inventory of results `[Medium]`

**Comment:** Uses colon to introduce enumerated comparisons in inventory style. Technically acceptable but AI-typical punctuation pattern.

**Original:**
```
Counterfactuals with small fee and reward changes are robust: uncapping debit raises total welfare by \$8B (versus \$7B at baseline), dual routing raises \$2.9B (versus \$3.8B, both net of the mechanical $\chi^{22}$ adjustment described in Section~\ref{subsubsec:counterfactual-welfare}), and CBDC raises \$1.4B (versus \$1.6B).
```

**Proposed Revision:**
```
Uncapping debit raises total welfare by \$8B (versus \$7B at baseline), dual routing by \$2.9B (versus \$3.8B, net of the mechanical $\chi^{22}$ adjustment in Section~\ref{subsubsec:counterfactual-welfare}), and CBDC by \$1.4B (versus \$1.6B). All three counterfactuals are robust to the removal of pass-through.
```

**Why better:** Eliminates the colon-list construction and inventory structure by embedding the comparisons directly in the verbs. Removes the "robust:" framing (already implied by "are robust") and states the result more fluidly.

---

- [ ] Lines 61-62: Results-first with inventory structure `[Medium]`

**Comment:** Announces the conclusion ("exception") before supporting it, then uses inventory comparisons (X falls to A from B, Y falls to C from D). Part C pattern: results-first with no tension.

**Original:**
```
Counterfactuals with large net fee changes are the exception. The credit fee cap welfare gain falls to \$17B from \$27B, and the monopoly gain falls to \$8B from \$15B.
```

**Proposed Revision:**
```
Large fee changes drive divergence. The credit fee cap welfare gain shrinks to \$17B from \$27B, monopoly to \$8B from \$15B.
```

**Why better:** Removes results-first framing and streamlines the comparison. "Divergence" creates more specificity than abstract "exception," and collapsing the parallel structure tightens the inventory.

---

### Low

- [ ] Lines 114-116: Word repetition in close proximity `[Low]`

**Comment:** "Credit card" appears twice in quick succession in a short passage: "cannot have a credit card as a primary or secondary card." Ear stumbles on the repetition.

**Original:**
```
Constrained customers cannot have a credit card as a primary or secondary card.
```

**Proposed Revision:**
```
Constrained customers cannot hold credit cards as a primary or secondary account.
```

**Why better:** Replaces the repeated "card" with "account" and changes "have" to "hold" for variety. Reduces auditory stumble without changing meaning.

---


---

## [appendix_surcharging.tex]

No issues found.

---

## [appendix_sorting.tex]

No AI detection issues found.

The writing demonstrates strong empirical voice with:
- Clear causal mechanisms explained throughout (e.g., lines 18-22 on the sufficient statistic)
- Direct presentation of findings with supporting logic
- Appropriate first-person methodology description
- Well-scoped hedging (one hedge per claim, only where genuinely uncertain)
- No excessive transition words or template structures
- Numbers embedded as evidence within arguments, not as inventories
- Limitations discussed directly and early (lines 48-50)
- Consistent academic register throughout


---

