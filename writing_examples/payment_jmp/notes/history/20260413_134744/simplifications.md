# Suggested Simplifications

## [appendix_model.tex]

**Status:** No stylistic simplifications suggested.

**Assessment:** The mathematical exposition is appropriately concise and direct. Technical language is precise and necessary. Phrases like "Collecting terms yields" are economical for mathematical writing. No wordiness, no weak verbs, no nominalization. The structure and pacing match the content — short fragments for equation introductions, longer sentences for derivations and explanations. All prose serves the mathematical argument.

**Verdict:** No revisions needed.

---

## [conclusion.tex]

### Results-First Opening (Lines 9-12)

**Current:** Announces counterfactual results and their implications, then introduces the legal context.

**Issue:** Opens with what the paper found rather than why the reader should care (the legal/policy gap). Typical LLM pattern of results-first, reasoning-second.

**Suggested Revision:** Reorder to introduce Ohio v. American Express standard first, then present the surprising result that contradicts it.

---

### "Appeared supracompetitive" → "were believed to be supracompetitive" (Line 16)

**Current:** "Congress capped debit fees in 2010 because they appeared supracompetitive"

**Issue:** Vague about whether this reflects the legislative judgment ("appeared to the legislators") or the actual technical status. Softens the claim.

**Suggested Fix:** "Congress capped debit fees in 2010 based on the belief that they were supracompetitive" — more direct about legislative reasoning.

---

### Bare "these services" (Line 29)

**Current:** "Whether these services raise welfare depends on whether they shift competition toward merchants or simply open another front in the war for cardholders."

**Issue:** "These services" refers to Buy Now, Pay Later from the previous sentence; the reference is clear but the pronoun could be more explicit given the distance and topic shift.

**Suggested Fix:** "Whether BNPL services raise welfare depends on whether they shift competition toward merchants or simply open another front in the war for cardholders."

---

### Overall: Conclusion is tightly written

The section is economical and strong. The issues flagged are stylistic refinements, not structural problems. Word choice is direct, mechanisms are explained, and numbers serve evidentiary claims.

---

## [data.tex]

### "Rich demographic detail" → "Demographic detail" (Line 64)

**Current:** "The rich demographic detail in these surveys identifies income gradients in payment preferences."

**Issue:** "Rich" is a formulaic intensifier that adds no information. The claim stands stronger without it.

**Suggested Fix:** "The demographic detail in these surveys identifies income gradients in payment preferences."

**Why better:** Removes padding and sharpens focus. The data speak for themselves.

---

### Overall: Data section is well-written

The section is practical and direct throughout. Word choice is appropriately technical ("construct a panel," "measure," "split spending"). Active voice dominates. Numbers serve methodological claims. The one suggestion above (removing "rich") is a minor refinement; the section overall exhibits strong clarity and precision.

## [intro.tex]

### Explicit "First, Second, Third" enumeration (Lines 25-34)

**Current:** Three forces introduced with explicit ordinals:
```
First, consumer payment choices respond strongly to subsidies.
Second, accepting cards significantly increases merchant sales.
Third, while almost all card-accepting merchants accept all networks...
```

**Issue:** AI-typical template structure. The enumeration is unnecessary since the three forces are clearly presented as separate paragraphs.

**Suggested Fix:** Remove "First," "Second," "Third" and use implicit transitions based on content flow. Integrate each force as a natural argument point.

**Why better:** The list structure feels formulaic. Flowing argument feels more authoritative and human.

---

### Short sentence repetition (Lines 5-6)

**Current:** 
```
Payment markets are two-sided.
Networks simultaneously tax merchants and subsidize consumers.
```

**Issue:** Two very short sentences in sequence. The second sentence directly elaborates the first; combining them improves rhythm.

**Suggested Fix:** Merge into one: "Payment markets are two-sided: networks simultaneously tax merchants and subsidize consumers."

**Why better:** Better rhythm; the relationship between the sentences becomes clearer.

---

### Inventory-style number reporting (Lines 44-47)

**Current:**
```
Consumers are ten times more sensitive to rewards than merchants are to fees.
A 1-bp increase in Visa credit rewards increases Visa's consumer market share by $3.7\%$, while a 1-bp increase in Visa credit merchant fees reduces merchant acceptance by only $0.4\%$.
```

**Issue:** The two quantitative claims (10x sensitivity ratio, then the per-bp asymmetry) read like separate inventory items rather than evidence for a unified argument.

**Suggested Fix:** Integrate into one sentence: "Consumers are ten times more sensitive to rewards than merchants are to fees: a 1-bp increase in Visa credit rewards increases market share by 3.7%, while the same increase in merchant fees reduces acceptance by only 0.4%."

**Why better:** Each comparison illustrates the same asymmetry; combining them clarifies the point.


## [appendix_reduced.tex]

### Wordiness & Nominalization

- **Lines 136-137**: "If these channels are substitutes, banks that relied on rewards to promote debit spent less on non-price promotion."
  - Replace: "banks that relied on rewards to promote debit" → "reward-reliant banks"
  - Cleaner: "If channels substitute, reward-reliant banks spent less on non-price promotion."

- **Lines 168-169**: "An alternative explanation for the debit volume decline is that consumers switched from large banks to small banks after Durbin, taking their debit volumes with them."
  - Replace: "taking their debit volumes with them" → "moving their debit usage"
  - Or delete as redundant after "switched to small banks"

- **Lines 172-173**: "The left panel uses the same Nilson Report panel and difference-in-differences design as the main specification, with log deposits as the outcome."
  - "with log deposits as the outcome" is passive nominalization
  - Replace: "with log deposits as the outcome variable" → or simply use as the dependent variable in a more direct framing

### Weak Transitions

- **Line 176**: "Together, these results rule out bank switching as the driver of the debit volume decline and point instead to within-bank payment substitution."
  - Delete "Together" (unnecessary connector)
  - Rewrite: "These results rule out bank switching: instead, debit volumes fall because consumers substitute payment methods within their existing banks."

- **Line 200**: "These patterns are inconsistent with cross-subsidization: large banks do not appear to have differentially improved credit card rewards."
  - The colon construction is AI-typical (CLAUSE: CONCLUSION)
  - Replace with: "These patterns show no evidence of cross-subsidization. Large banks do not differentially improve credit card rewards."

### Passive Voice Candidates

- **Lines 196-197**: "Consumers at large deposit institutions hold credit cards from large issuers at higher rates throughout the sample—as expected, since many hold credit and deposit accounts at the same bank—but this gap did not widen after Durbin."
  - "this gap did not widen" is passive-ish but acceptable
  - Stronger: "Large banks' credit card advantages persisted but did not grow."

### Over-Explanation & Lecturing

- **Lines 468-475** (Network Diversion Technical Details subsection): The entire subsection is over-explained for field experts. The formal equation and enumerated steps are appropriate, but lines like "I designed the question this way because consumers often do not know which cards are Visa or Mastercard" treat the reader as unfamiliar with survey design.
  - Consider: "Respondents may not know network affiliation; I correct for expected within-network bank switches using network composition at alternative banks."

### Concrete Over Abstract

- **Line 134**: "Banks fund debit promotion from interchange revenue, allocating across rewards, advertising, and teller incentives."
  - "teller incentives" is vague
  - Better: "Bank tellers incentives" or "in-branch promotions"
  - Or: "rewards, advertising, and branch-level incentives"

### Inventory-Style Number Reporting

- **Lines 196-200**: Paragraph lists four facts sequentially (credit card holding rates, gap did not widen, reward receipt rates, no differential increase).
  - Should group into 2-3 claims, not 4 separate observations


## [appendix_model_oa.tex]

**Status:** No stylistic simplifications suggested.

**Assessment:** The technical exposition is appropriately economical and direct. The prose serves the mathematical content with minimal elaboration. Phrases like "By inspection," "Substituting into," and "integrating the price-index integrand" are standard technical discourse patterns, not padding. Mathematical notation is integrated naturally. No wordiness, no weak verbs, no unnecessary nominalization. Sentence length varies appropriately: short sentences for setup ("Both $N$ and $D$ are weighted sums..."), longer sentences for derivations and algorithmic steps. All prose advances the technical argument.

**Verdict:** No revisions needed.

## [model.tex]

### Lines 268-274: Reduce wordiness in conduct description

**Original:**
```
Networks set transaction fees $\tau_j$ and pecuniary adoption benefits $A_j$, taking other networks' actions as given.
Equivalently, networks set consumers' expectations of their own acceptance, fees, and rewards given expectations for rival networks.
```

**Suggested Revision:**
```
Networks set transaction fees $\tau_j$ and adoption benefits $A_j$ to maximize expected profits, anticipating rivals' actions.
```

**Why:** Removes redundancy and weakens the passive "taking actions as given" → "anticipating rivals' actions."

---

### Lines 117-124: Streamline merchant pricing exposition

**Original:**
```
Conditional on acceptance $M$, merchants pass fees into prices.
Appendix \ref{subsec:appendix-merch-pricing} shows the optimal uniform price is
```

**Suggested Revision:**
```
Merchants pass all fees through to prices.
The optimal uniform price is:
```

**Why:** "Pass all fees through" is more active and concrete than "pass fees into prices." Removes appendix reference from the main expository flow.

---

### Lines 305-318: Replace softened language with direct limitations

**Original:**
```
The main disadvantage of this setup is that it does not allow us to study the welfare effects of changes in debit fees.
The model estimated under this restriction produces similar welfare effects as the baseline, because...
```

**Suggested Revision:**
```
The main cost: we cannot analyze debit fee policy changes.
But this does not affect the counterfactuals, which focus on credit network competition.
```

**Why:** "Main cost" is more honest than "main disadvantage." Removes the softened qualifier "produces similar" → names the tradeoff directly.

---


## [counterfactuals.tex]

**Lines 4-6:** Restructure to claim-first framing
- Change: "I use the estimated model to show that equilibrium fees and rewards are too high" → "Equilibrium fees and rewards are too high"
- This moves the claim forward and relegates the method to supporting role

**Lines 198-201:** Eliminate "the opposite holds" rhetorical pivot
- "the opposite holds" is a stylistic delay; replace with direct mechanism statement
- Suggested: "Increasing competition... does not substitute... it fuels the reward arms race..."

**Lines 213-220:** Integrate causal connectives into welfare sequencing
- Add "because" and "from" to connect numbers to their mechanisms
- Current: "Lower credit card use reduces... while high-income consumers lose..."
- Better: "...because lower rewards harm high-income cardholders while..."

**Lines 250-253:** Convert negation-heavy sentences to positive framing
- "requires that not be" → "restricts to"
- "This exclusion is unnecessary" → "This restriction is unnecessary"
- "may even be counterproductive" → "may backfire"

**Lines 257-263:** Replace hedged opener with question-form opening
- Current: "Proposals for CBDC and faster payments motivate the possibility that..."
- Better: "Can CBDC or faster payments discipline network pricing?"
- Remove stacked hedges: "motivate" + "possibility" + "could"

**Line 34-35:** Relocate normalization detail to footnote or table note
- This mechanical explanation belongs outside main text flow
- Readers will understand "each bp = \$1B" from context without needing the normalization justification in prose


## [appendix_estimation.tex]

**No simplifications suggested.**

The methods section is well-written and requires no stylistic revisions. The prose is direct and economical, focused on methodological transparency and parameter identification. All technical language is precisely deployed with appropriate context. Sentence structure is disciplined with healthy variation. Transitions are natural and embedded. Minimal hedging is load-bearing ("roughly" used once in proper context). No AI-typical patterns detected (no stacked hedges, no padding phrases, no template language, no meta-commentary, no smarmy reframing). Every sentence advances the methods exposition. This exemplifies strong technical methods writing.



## [appendix_surcharging.tex]

### Throat-Clearing Opening (Lines 7-8)

**Current:** Announces what the appendix will cover before diving in.

**Issue:** Meta-commentary that delays the substantive content. Section titles signal purpose; opening should begin with substance.

**Suggested Revision:** Delete the explanatory sentences. Start with: "Cash discounts have long been legal..." or begin the empirical evidence section directly.

---

### Inventory-Style Results (Lines 10-14)

**Current:** Strings together three results with "Second" and "Third" enumeration.

**Issue:** Results feel itemized rather than woven into narrative. Reads like a list.

**Suggested Fix:** Integrate with "I extend the baseline model and derive three key results. First, ..."

---

### Redundant Phrase (Line 57)

**Current:** "I show merchants cannot steer consumers from card to cash when surcharging is allowed in a natural extension of the baseline model that allows surcharging."

**Issue:** "Allows surcharging" appears twice. Awkward embedding of relative clause.

**Suggested Fix:** "I show that when surcharging is allowed, merchants cannot steer consumers from card to cash."

---

### Pedagogical Footnote (Line 23)

**Current:** Long footnote on shrouding effects (behavioral economics context).

**Issue:** While substantive, it's not essential to the legal history. Interrupts narrative.

**Suggested Fix:** Move to appendix or delete. The core legal fact (discounts legal, surcharges permitted only gradually) stands alone.


## [appendix_robustness.tex]

**Status:** No stylistic simplifications needed.

**Assessment:** The prose is economical and direct. Each section follows a clear structure: (1) model modification, (2) parameter impacts, (3) counterfactual results with mechanism explanation. No wordiness, no redundancy, no AI-typical hedging or softening. Hedges where present ("less plausible," "roughly") are load-bearing and specific to technical implausibility or approximation. No padding phrases. Transitions are implicit and natural; no "Moreover," "Additionally," "Furthermore" overuse. Numbers are integrated into causal claims, not listed inventory-style.

**Verdict:** Tight and well-structured technical writing — no revisions needed.

## [appendix_credit_debit.tex]

**Status:** No stylistic simplifications suggested.

**Assessment:** The appendix is tightly written with economical exposition throughout. The microfoundation (lines 19-89) uses natural language to build intuition before and after equations. The evidence section (lines 94-115) is selective and well-integrated, not verbose. The generalization (lines 122-248) is mathematically precise with minimal elaboration. The Durbin analysis (lines 349-382) chains evidence naturally without padding. Technical language is appropriate and necessary for the institutional and economic context. No wordiness, no nominalization, no weak verbs. Numbers serve specific evidentiary claims. Prose structure matches argument structure.

**Verdict:** No revisions needed.


## [estimation.tex]

### Enumeration and Structural Patterns

**Lines 10–13: "First... Second... Third" structure (Enumeration)**

**Current:**
```
I estimate all parameters jointly, but the identification argument has three components.
First, I estimate consumer demand using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Second, I recover network costs by inverting first-order conditions.
Third, I recover merchant types from event-study evidence on card acceptance effects and acceptance rates.
```

**Issue:** Formulaic enumeration structure. The numbered steps announce structure without adding substance to the argument.

**Suggested Fix:** Rewrite to flow as integrated identification argument without explicit "First, Second, Third":

```
The identification proceeds through three approaches: consumer demand is estimated using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}; network costs are recovered by inverting first-order conditions; and merchant types are recovered from event-study evidence on acceptance changes.
```

**Why better:** Flows as a single integrated claim about identification sources; removes artificial enumeration.

---

### Implicit Mechanism Issues

**Lines 140–155: Results-first structure lacking tension**

**Current:**
```
The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants.
The estimates also reveal substantial credit aversion, which drives the welfare gains from reducing credit card use.
Table \ref{tab:param-est} reports parameter estimates.

The consumer substitution matrix in Table \ref{tab:cross-sub} shows that consumers view credit cards, debit cards, and cash as distinct segments.
A 1-bp increase in Visa credit rewards raises Visa's share by $3.7\%$, drawn mostly from MC credit (down $3.5\%$), while MC debit falls only $0.3\%$ and cash $0.3\%$.
```

**Issue:** Opens with conclusion (parameter estimates support competitive bottleneck) before establishing evidence. Results-first structure typical of LLM prose.

**Suggested Fix:** Lead with mechanism or evidence:

```
Consumers respond ten times more sharply to rewards than merchants respond to fees.
A 1-bp increase in Visa credit rewards raises Visa's share by 3.7% (mostly from MC credit at 3.5%), while merchant acceptance falls only 0.4% per 1-bp fee increase.
This asymmetry is the competitive bottleneck: networks must compete for consumers rather than merchants because merchants cannot credibly threaten to drop cards that consumers demand.
Table \ref{tab:param-est} shows the full parameter estimates.
```

**Why better:** Leads with evidence; lets the bottleneck mechanism emerge from the data rather than announcing it upfront.

---

### Hedging and Qualification Issues

**Lines 157–163: Smarmy framing with stacked hedging ("credit aversion" discussion)**

**Current:**
```
The parameters reveal substantial consumer ``credit aversion.''
The median consumer would pay with debit if credit cards did not pay rewards.
A consumer with median income is indifferent between a Visa debit card and a Visa credit card paying \scalarinput{param_est_credit_penalty_pass_baseline}\% in rewards.\footnote{...}
While the model estimates are the consequence of assuming that payment choices reflect revealed preference, survey evidence confirms that consumers who avoid credit cards do so for substantive reasons, including budget control, debt aversion, and the hassle of managing revolving accounts (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
This credit aversion is central to the welfare analysis.
```

**Issue:** Multiple hedging layers: quoted term, hedge phrase ("the consequence of assuming..."), survey backup, meta-commentary. This reads as uncertain rather than confident in the finding.

**Suggested Fix:**
```
The estimated parameters imply substantial non-pecuniary costs to credit: the median consumer would pay with debit if cards did not offer rewards.
At median income, a consumer is indifferent between Visa debit and credit at \scalarinput{param_est_credit_penalty_pass_baseline}\% rewards.
This cost gap reflects substantive consumer concerns—budget control, debt aversion, account management—documented in the consumer preference survey (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
These non-pecuniary costs are central to the welfare analysis.
```

**Why better:** States findings directly; integrates survey evidence as support rather than as a hedge; removes meta-commentary.

---

### Vague Transitional Language

**Lines 52–54: "Three parameters measure" throat-clearing**

**Current:**
```
Wallet complementarity parameters are identified by multi-homing patterns in the Homescan data.
Three parameters measure wallet interactions.
The parameter $\chi^{12}$ captures credit's value in the secondary position...
```

**Issue:** The sentence "Three parameters measure wallet interactions" previews what the next sentence will enumerate. This is redundant and formulaic.

**Suggested Fix:** Delete the preview sentence and move directly to parameter definitions.

**Why better:** Removes unnecessary announcement sentence; gets straight to substantive content.

---

## [reducedform.tex]

**Status:** No stylistic issues or AI-typical simplifications needed.

**Assessment:** The reduced-form section demonstrates clean, direct writing with appropriate hedging, clear causal logic, and evidence-based claims. Word choice is precise, sentences are varied in length (short punchy claims interspersed with methodological detail), and every number serves a specific evidentiary purpose. No wordiness, no weak verbs, no smarmy framing, no stacked hedges. Mechanisms are explicit throughout, limitations are acknowledged directly (control group validity, sample selection, co-branded campaign risk), and causal claims are scoped to the identification strategy.

The three reduced-form facts (Durbin effect on volumes, card acceptance effect on sales, merchant multi-homing asymmetry) are presented in evidence-first order without announcing results upfront. Transitions are implicit in the argument structure. Appropriate use of loaded terms like "competitive bottleneck" (line 183) as standard Armstrong (2006) terminology, not as AI puffery.

**Verdict:** No simplifications needed. The section meets the writing standards for clarity, precision, and mechanism-forward exposition.

## [appendix_data.tex]

**Status:** No stylistic issues or AI-typical simplifications needed.

**Assessment:** The data documentation section uses clear, direct technical language appropriate for the genre. Word choice is precise and economical throughout: "proxy interchange income," "drop households," "classify," "define," "remove," "focus on stores." Every sentence serves a methodological purpose. Hedging is minimal and load-bearing: "roughly half" (line 11) acknowledges approximation; "about 38 bps," "about 15 bps" (lines 40, 44) indicate rounded numbers. No weak verbs, no excessive nominalizations, no wordiness. The document is transparent about data restrictions and their rationales rather than apologetic.

One potential stylistic note (not a flag):
- Lines 70–75 use "drop," "remove," and "dropped" in close succession (3 instances in 6 lines), which creates minor verb repetition. Could vary with "exclude" or "filter," but the repetition is not excessive in technical writing where "drop" is a standard econometrics term for sample restriction.

**Verdict:** No simplifications needed. The data documentation meets the standards for clarity, transparency, and technical precision.

## [reducedform.tex]

### - [ ] Lines 4-6: Tighten the section opening

**Current:**
```
Three reduced-form facts characterize the two-sided structure of the payment market.
Issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and a mix of single- and multi-homing consumers limits merchants' ability to steer consumers between networks.
Together, these facts point toward a competitive bottleneck---but the degree of multi-homing leaves the net effect of competition on fees and welfare an open question.
```

**Proposed:**
```
Three reduced-form facts characterize the two-sided structure of the payment market.
Issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and a mix of single- and multi-homing consumers limits merchants' ability to steer consumers between networks.
These facts point toward a competitive bottleneck, but the degree of multi-homing leaves the net effect of competition on fees and welfare an open question.
```

**Why better:** Drops "Together" transition opener and replaces em-dash with comma.

### - [ ] Lines 165-166: Compress the conditional framing

**Current:**
```
Whether merchants can steer consumers between networks depends on how many consumers carry cards from more than one network.
If most consumers single-home, a merchant that declines a network loses those consumers entirely; if most multi-home, the merchant can redirect them to a rival.
```

**Proposed:**
```
Whether merchants can steer consumers between networks depends on how many consumers carry cards from more than one network.
A merchant that declines a network loses single-homers entirely but can redirect multi-homers to a rival.
```

**Why better:** Cuts the parallel conditional in favor of a direct statement. The reader already knows both types exist from the subsection heading and the preceding subsection on merchant multi-homing.

### - [ ] Line 176: Em-dash to relative clause

**Current:**
```
When a merchant declines a network's cards, it risks losing these single-homers---consumers who cannot substitute to a rival.
```

**Proposed:**
```
When a merchant declines a network's cards, it risks losing these single-homers, who cannot substitute to a rival.
```

**Why better:** Relative clause is less visually heavy.

### - [ ] Lines 184-185: Eliminate restated enumeration in bottleneck wrap-up

**Current:**
```
Together, these three facts provide evidence for a ``competitive bottleneck'' in which networks compete primarily for consumers, not merchants \parencite{Armstrong2006}.
Consumers respond to rewards, card acceptance increases merchant sales, and single-homing limits merchants' ability to steer consumers between networks.
```

**Proposed:**
```
These patterns are consistent with a ``competitive bottleneck'' \parencite{Armstrong2006} in which networks compete primarily for consumers, not merchants.
```

**Why better:** The reader just read three subsections on these facts. Restating all three is redundant. One sentence names the bottleneck.
