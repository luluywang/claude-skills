# AI Detection Review

## [institutional_details.tex]

### Low

### - [ ] Lines 26-27: Formulaic "shows" construction `Low`

**Comment:** "Figure X shows Y" is a common template structure. Not strongly AI-typical here since it is a standard way to reference a figure, but two consecutive sentences both use plain declarative structure with "connect" and "shows" as their main verbs.

**Original:**
```
Visa and MC connect merchants, merchants' banks (acquirers), consumers' banks (issuers), and consumers \parencite{Benson.etal2017}.
Figure \ref{fig:payment-flow} shows the payment flows with representative prices.
```

**Proposed Revision:**
```
Visa and MC connect merchants, merchants' banks (acquirers), consumers' banks (issuers), and consumers \parencite{Benson.etal2017}.
Figure \ref{fig:payment-flow} illustrates these flows with representative prices.
```

**Why better:** Avoids repeating the pattern of subject-verb-object declaratives and removes the slight redundancy of "payment flows" after the prior sentence already established the payment context.

### - [ ] Lines 28-37: Walkthrough sequence `Low`

**Comment:** Lines 28-37 walk the reader through the figure in a step-by-step manner: consumer pays merchant, merchant pays acquirer, acquirer pays issuer, issuer pays network, issuer funds rewards. Each sentence introduces one flow with a dollar amount. This reads somewhat like a guided tour, which is a mild AI pattern (sequential description). However, for an institutional details section that explains payment flows, this is natural and appropriate. Flagging at low severity only because the sequence of five consecutive declarative sentences with dollar amounts is close to inventory-style numbers.

**Original:**
```
When a consumer uses her credit card to buy $\$100$ of product at a large retailer,
the merchant pays a $\$2.25$ merchant discount fee to her acquiring bank to process the transaction.
The acquirer can be a bank like Wells Fargo or a fintech firm like Square.
Of the merchant discount, around $\$2$ goes to the issuing bank (e.g., Chase) as interchange.
The issuer and the acquirer collectively pay around $\$0.14$ in network fees to Visa.
Issuers use interchange to fund cardholder rewards; on average, credit card rebates total~$\$1.45$.
```

**Proposed Revision:**
```
No revision proposed — the walkthrough structure is appropriate for explaining institutional payment flows referenced in a figure. The numbers here are descriptive (explaining a figure), not argumentative, so inventory-style concerns are muted.
```

**Why better:** N/A — flagged for awareness only.

## [data.tex]

### Low

### - [ ] Lines 55-56: Long relative clause slightly weakens directness `Low`

**Comment:** Line 56 uses a relative clause ("which shapes merchants' incentives to accept high-fee cards") tacked onto an already long sentence. This is a minor structural tell -- LLMs tend to chain relative clauses to pack multiple ideas into one sentence. Here the connection is substantive and the sentence is not excessively long, so severity is low.

**Original:**
```
The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets, which shapes merchants' incentives to accept high-fee cards.
```

**Proposed Revision:**
```
The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets. This allocation shapes merchants' incentives to accept high-fee cards.
```

**Why better:** Splitting into two sentences gives the second idea -- that allocation patterns shape merchant incentives -- its own emphasis rather than burying it in a relative clause.

## [appendix_mri.tex]

No issues found. The file is a short data-description appendix (31 lines) written in direct, factual prose. Active voice throughout ("I draw on," "I classify," "I assign," "I compute"). No AI-typical patterns detected: no smarmy reframing, no stacked hedges, no transition openers, no colon constructions, no AI vocabulary, no inventory-style numbers, no meta-commentary. The writing reads as straightforward human-authored data documentation.

## [appendix_data.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 55: Colon construction `Medium`

**Comment:** CLAUSE: LONGER CLAUSE construction — "Table REF shows that trip-based and spending-based rankings are highly correlated: the top-trip card is also the top-spending card for 91\% of consumers." The colon introduces a dramatic elaboration that could be its own sentence. Part A punctuation tell.

**Original:**
```
Table \ref{tab:spend-trip-correlation} shows that trip-based and spending-based rankings are highly correlated: the top-trip card is also the top-spending card for 91\% of consumers.
```

**Proposed Revision:**
```
Table \ref{tab:spend-trip-correlation} shows that trip-based and spending-based rankings are highly correlated. The top-trip card is also the top-spending card for 91\% of consumers.
```

**Why better:** Splitting at the colon avoids the AI-typical CLAUSE: LONGER CLAUSE construction while improving readability. The second sentence can stand alone as evidence.

### - [ ] Lines 59: Colon construction `Medium`

**Comment:** Second CLAUSE: LONGER CLAUSE construction — "The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors: at grocery chains known not to accept Visa..." The colon introduces a full clause that could be a separate sentence. Part A punctuation tell.

**Original:**
```
The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors: at grocery chains known not to accept Visa (identified from stores that switched acceptance during the sample), Visa's residual measured share was about 1.5\%, arising entirely from misrecorded transactions.
```

**Proposed Revision:**
```
The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors. At grocery chains known not to accept Visa (identified from stores that switched acceptance during the sample), Visa's residual measured share was about 1.5\%, arising entirely from misrecorded transactions.
```

**Why better:** The evidence after the colon is a complete, independent sentence describing a measurement exercise. Splitting avoids a 42-word sentence and removes the colon-as-dramatic-reveal pattern.

### Low

### - [ ] Lines 69: Long sentence with multiple embedded clauses `Low`

**Comment:** The DCPC introductory sentence (line 69) runs to 43 words with multiple parenthetical qualifiers. This is not AI-typical per se but could be flagged for readability. The inline parenthetical "(2017--2019 waves)" and the long appositive "through the University of Southern California's Understanding America Study" clutter the main clause. Minor flag.

**Original:**
```
The Survey and Diary of Consumer Payment Choice (DCPC), conducted by the Federal Reserve Bank of Atlanta (2017--2019 waves) through the University of Southern California's Understanding America Study, provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance.
```

**Proposed Revision:**
```
The Survey and Diary of Consumer Payment Choice (DCPC) provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance. The DCPC is conducted by the Federal Reserve Bank of Atlanta through the University of Southern California's Understanding America Study; I use the 2017--2019 waves.
```

**Why better:** Separates the citation-heavy provenance from the substantive description. The reader learns what the data contains before wading through administrative details.

### - [ ] Lines 92: Very long enumeration sentence `Low`

**Comment:** Line 92 is a 57-word sentence listing all survey contents in a single breath. While not an AI tell specifically, the enumeration style ("primary payment method... household income... primary bank and consideration set... second-choice payment... rewards sensitivity... plus an attention check") resembles inventory-style listing. Low severity because this is a data appendix where such enumeration is conventional.

**Original:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, primary bank and consideration set, second-choice payment if their primary method became unavailable, and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled), plus an attention check.
```

**Proposed Revision:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, and primary bank. It then elicited a second-choice payment if the primary method became unavailable and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled). An attention check screened inattentive respondents.
```

**Why better:** Breaking a 57-word enumeration into three sentences improves readability without losing any content. Each sentence groups related survey items.

## [reducedform.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 4-6: Section opens with throat-clearing summary `Medium`

**Comment:** The opening three sentences summarize the section's three facts before presenting any of them. This is a mild "road-mapping" pattern (Part B: meta-commentary). The section title already signals the content, and the three facts are presented in the subsections that follow. However, this is borderline acceptable as a framing device for a section with three parallel subsections.

**Original:**
```
This section documents three reduced-form facts that shape the structural model.
Issuers' incentives to promote cards drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.
Together, these facts explain why networks tax merchants to subsidize the issuing side of the market.
```

**Proposed Revision:**
```
Three reduced-form facts explain why networks tax merchants to subsidize the issuing side of the market: issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to those choices.
```

**Why better:** Collapses three sentences into one, removing the throat-clearing opener ("This section documents") and the restating closer ("Together, these facts explain"). The colon here introduces a list rather than a rhetorical punchline, so it is standard usage.

### - [ ] Lines 167-173: Concluding subsection restates all three facts `Medium`

**Comment:** The "Competitive Bottleneck" subsection re-summarizes all three facts with "(Fact 1)", "(Fact 2)", "(Fact 3)" labels. This is close to a formulaic recap pattern (Part A: paragraph-ending restatements). The enumeration in prose is also a mild AI tell (Part A: artificial enumeration). However, this subsection does add the theoretical framing via Armstrong (2006) and the transition to the structural model, so it is not pure restatement.

**Original:**
```
Together, these three facts reveal a ``competitive bottleneck'' \parencite{Armstrong2006}. Issuer incentives drive consumer adoption (Fact 1), card acceptance increases merchant sales (Fact 2), and asymmetric multi-homing (Fact 3) tilts network competition toward the consumer side and away from merchants.
```

**Proposed Revision:**
```
These patterns constitute the ``competitive bottleneck'' of \textcite{Armstrong2006}: because merchants multi-home while many consumers do not, networks compete for consumers through generous rewards funded by high merchant fees.
```

**Why better:** Removes the inventory-style "(Fact 1), (Fact 2), (Fact 3)" enumeration that re-summarizes what was just established. Instead, states the mechanism directly.

### Low

### - [ ] Lines 42-43: Consecutive "Online Appendix" references `Low`

**Comment:** Two consecutive sentences begin with "Online Appendix" and use the same verb "presents." This is a mild template repetition. Not strongly AI-typical since referencing appendix material is natural, but the parallel structure is noticeable.

**Original:**
```
Online Appendix \ref{subsubsec:oa-durbin-rewards} presents mechanism evidence that the effect reflects within-bank payment switching, with consumers shifting from debit to credit, rather than switching banks or benefiting from improved credit card rewards at large issuers.
Online Appendix \ref{subsec:oa-durbin-robustness} presents robustness checks addressing pre-trends, merger exclusions, and asset cutoffs.
```

**Proposed Revision:**
```
Online Appendix \ref{subsubsec:oa-durbin-rewards} presents mechanism evidence that the effect reflects within-bank payment switching, with consumers shifting from debit to credit, rather than switching banks or benefiting from improved credit card rewards at large issuers.
Robustness checks addressing pre-trends, merger exclusions, and asset cutoffs appear in Online Appendix \ref{subsec:oa-durbin-robustness}.
```

**Why better:** Varies the sentence structure by moving the appendix reference to the end and using a different verb.

### - [ ] Lines 107-108: Consecutive "Figure X shows" pattern `Low`

**Comment:** Lines 107 and 108 both begin "Figure \ref{...} shows." This is a mild template repetition (Part A: template structures).

**Original:**
```
Figure \ref{fig:fees-history} shows that the gap between AmEx's and Visa's credit card merchant fees fell by around \absinput{amex_visa_fee_diff} bps over the past decade, driven by AmEx's OptBlue program that cut fees for small businesses \parencite{Glasheen2020}.
Figure \ref{fig:merchant-amex-visa} shows the acceptance gap closed in tandem; by 2019 the number of merchants accepting AmEx approximately equals the number accepting Visa.
```

**Proposed Revision:**
```
Figure \ref{fig:fees-history} shows that the gap between AmEx's and Visa's credit card merchant fees fell by around \absinput{amex_visa_fee_diff} bps over the past decade, driven by AmEx's OptBlue program that cut fees for small businesses \parencite{Glasheen2020}.
The acceptance gap closed in tandem (Figure \ref{fig:merchant-amex-visa}); by 2019 the number of merchants accepting AmEx approximately equals the number accepting Visa.
```

**Why better:** Varies the sentence opening by integrating the figure reference parenthetically rather than repeating the "Figure X shows" template.

## [model.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 9-13: Sequential "In the first/second/third stage" enumeration `Medium`

**Comment:** Three consecutive sentences beginning "In the first stage... In the second stage... In the third stage..." is an artificial enumeration pattern (Part A: "One is... A second is... A third is..."). Numbered sequential walkthroughs are a common AI template structure.

**Original:**
```
I model competition between card networks as a static game with three stages between networks, consumers, and merchants.
In the first stage, profit-maximizing networks set per-transaction fees for merchants and promised adoption utility for consumers.
In the second stage, consumers and merchants make adoption and pricing decisions.
In the third stage, consumers make consumption decisions over merchants.
```

**Proposed Revision:**
```
I model competition between card networks as a static game. Networks move first, setting per-transaction fees and promised adoption utility. Consumers and merchants then make adoption and pricing decisions. Finally, consumers make consumption decisions over merchants.
```

**Why better:** Removes the mechanical "In the Nth stage" enumeration. The sequence is still clear from "first," "then," and "finally" without the template structure.

### - [ ] Line 287: Throat-clearing sentence `Medium`

**Comment:** "I discuss the evidence for these assumptions below" is meta-commentary that adds no information beyond what the section title and the following paragraphs already convey (Part B: meta-commentary).

**Original:**
```
The model makes several simplifying assumptions for tractability. I discuss the evidence for these assumptions below.
```

**Proposed Revision:**
```
The model makes several simplifying assumptions for tractability.
```

**Why better:** The section title ("Discussion of Key Assumptions") already signals what follows. The second sentence is pure throat-clearing.

### Low

### - [ ] Line 72: Chained participial phrases `Low`

**Comment:** "increasing demand at those merchants and incentivizing acceptance" chains two participial phrases onto the main clause. This is a mild LLM pattern of packing multiple causal steps into one sentence via participial chaining.

**Original:**
```
Card consumers reallocate consumption toward merchants that accept cards, increasing demand at those merchants and incentivizing acceptance.
```

**Proposed Revision:**
```
Card consumers reallocate consumption toward merchants that accept cards. The resulting demand increase incentivizes acceptance.
```

**Why better:** Splitting makes the causal chain explicit rather than burying it in participial phrases.

### - [ ] Line 338: Formal hedge "could be attenuated" `Low`

**Comment:** "could be attenuated" is mildly hedged. Flagging only because "attenuated" is slightly formal; the hedge itself is warranted since this is a genuinely speculative scenario.

**Original:**
```
If networks use regulated fee levels as focal points for tacit coordination, welfare benefits of fee caps could be attenuated.
```

**Proposed Revision:**
```
If networks use regulated fee levels as focal points for tacit coordination, fee caps would deliver smaller welfare gains.
```

**Why better:** "Smaller welfare gains" is more concrete than "could be attenuated." Replaces a passive construction with a direct statement.

## [estimation.tex]

### Medium

### - [ ] Line 166: Colon construction for inventory-style numbers `Medium`

**Comment:** Line 166 uses a CLAUSE: LONGER CLAUSE construction ("debit cards are the most popular primary payment method: 45\% of consumers have a primary debit card, around 30\% have a primary credit card, and the rest use cash for all transactions"). The colon introduces an inventory of three numbers. However, the numbers here do serve as evidence for the claim that debit is most popular, and the colon usage is natural rather than rhetorical setup. Borderline.

**Original:**
```
As in the DCPC data (Table \ref{tab:dcpc-summary}), debit cards are the most popular primary payment method: 45\% of consumers have a primary debit card, around 30\% have a primary credit card, and the rest use cash for all transactions.
```

**Proposed Revision:**
```
As in the DCPC data (Table \ref{tab:dcpc-summary}), debit cards are the most popular primary payment method. About 45\% of consumers have a primary debit card, around 30\% have a primary credit card, and the rest use cash for all transactions.
```

**Why better:** Avoids the CLAUSE: LONGER CLAUSE construction; the period creates a cleaner break and avoids the rhetorical setup feel. However, the original is also defensible since the colon legitimately introduces elaboration of "most popular."

### - [ ] Lines 159-160: Mild throat-clearing / meta-commentary `Medium`

**Comment:** "I now assess fit by examining moments the model was not trained to match, including adoption shares across payment types, the joint distribution of primary and secondary cards, and merchant acceptance patterns." This is a road-mapping sentence that describes what the section will do rather than doing it. The section title "Goodness of Fit" already signals this. However, the sentence does add information (which moments are untargeted), so it is mildly informative rather than pure throat-clearing.

**Original:**
```
The estimation targets aggregate spending shares, multi-homing patterns, and the Durbin debit volume response.
I now assess fit by examining moments the model was not trained to match, including adoption shares across payment types, the joint distribution of primary and secondary cards, and merchant acceptance patterns.
```

**Proposed Revision:**
```
The estimation targets aggregate spending shares, multi-homing patterns, and the Durbin debit volume response.
I now compare model predictions to untargeted moments: adoption shares, wallet composition, and merchant acceptance.
```

**Why better:** More concise; reduces the road-mapping feel while preserving the informational content about which moments are examined.

### Low

### - [ ] Lines 79-81: Mild over-explanation of two-sided market intuition `Low`

**Comment:** Lines 79-81 explain the standard two-sided market insight that networks charge the inelastic side and subsidize the elastic side. This is Econ 101 for IO/payments economists and may read as lecturing experts. However, it does serve as motivation for why merchant sensitivity is recovered from network FOCs rather than estimated directly, so it has a functional role.

**Original:**
```
Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets.
Networks charge high fees to merchants and use the revenue to fund rewards for price-sensitive consumers, so merchants must be relatively insensitive to fees compared to consumers' sensitivity to rewards.
Given estimates of consumer sensitivity, merchant sensitivity comes from networks' first-order conditions.
```

**Proposed Revision:**
```
Given estimated consumer sensitivity, merchant sensitivity follows from networks' first-order conditions: competition drives fees toward the inelastic side.
```

**Why better:** Eliminates the textbook explanation while retaining the identification logic. The reader already knows two-sided pricing theory. However, the author may prefer the longer version for accessibility to non-specialist readers.

## [counterfactuals.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 96-99: Template enumeration of decomposition rows `Medium`

**Comment:** Lines 97-99 enumerate "The network effect (first row)... The price passthrough row... The merchant adoption row..." in a mechanical label-then-describe pattern. Each sentence announces a row label and then states what it holds fixed. This reads like a table caption rather than an argument. Part A: template/enumeration structure.

**Original:**
```
To understand the sources of these gains, Table~\ref{tab:cap-credit-channel-decomp} decomposes welfare by sequentially allowing more merchant responses.
The network effect (first row) holds merchant prices and acceptance fixed while networks re-optimize fees and rewards and consumers adopt new payment methods.
The price passthrough row allows merchants to adjust retail prices, holding acceptance fixed.
The merchant adoption row allows merchants to adjust acceptance decisions.
```

**Proposed Revision:**
```
Table~\ref{tab:cap-credit-channel-decomp} decomposes welfare by sequentially allowing more merchant responses.
The first row holds merchant prices and acceptance fixed while networks re-optimize fees and rewards and consumers adopt new payment methods.
The second row lets merchants adjust retail prices, holding acceptance fixed.
The third row lets merchants adjust acceptance decisions.
```

**Why better:** Removes the throat-clearing opener ("To understand the sources of these gains") and the repetitive naming of each row by its label. The row labels are already in the table; prose should explain what each row reveals, not re-announce the label.

### - [ ] Lines 148-159: Inventory-style number sequence `Medium`

**Comment:** Lines 149-159 present a sequence of numbers (debit fees, credit rewards down 6 bps, credit fees down 3.3 bps, total fees up $4.4B, total rewards up $0.5B) with each number getting its own sentence or fragment. Part C: inventory-style numbers where some numbers do not directly answer a "so what?"

**Original:**
```
If the debit fee cap were lifted by 25 bps, merchant fees would rise and networks would increase debit rewards.
Consumers would switch to debit, especially reward-sensitive ones.
As the marginal credit card consumer becomes less reward-sensitive, networks would reduce credit card reward competition, triggering the see-saw principle and lowering credit merchant fees.
Credit card rewards and fees would fall 6
and 3.3 bps respectively.
The net effect is that repealing the Durbin Amendment increases total merchant fees by \$4.4 billion
and increases total rewards by \$0.5 billion.
```

**Proposed Revision:**
```
If the debit fee cap were lifted by 25 bps, networks would increase debit rewards, drawing reward-sensitive consumers away from credit.
As the marginal credit card consumer becomes less reward-sensitive, networks reduce credit card reward competition, lowering credit rewards by 6 bps and fees by 3.3 bps.
On net, total merchant fees rise \$4.4 billion while total rewards rise only \$0.5 billion.
```

**Why better:** Consolidates the causal chain into fewer sentences, embeds numbers as evidence for claims rather than listing them sequentially.

### Low

### - [ ] Lines 222-223: "robust" as AI vocabulary `Low`

**Comment:** "I find robust benefits from fee caps and dual-routing mandates" uses "robust," which is on the AI vocabulary watch list. Here it has technical meaning (robustness across specifications), so it passes, but noting for awareness.

**Original:**
```
Across a wide range of alternative specifications, I find robust benefits from fee caps and dual-routing mandates.
```

**Proposed Revision:**
No revision needed. "Robust" is used in its technical econometric sense.

**Why better:** N/A --- pass.

## [intro.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 121: Colon list construction `Medium`

**Comment:** Line 121 uses "three ingredients... : consumer multi-homing, merchant heterogeneity, and merchant competition." This is a CLAUSE: LIST colon construction. While not the dramatic "CLAUSE: PUNCHLINE" pattern, it is a template-like enumeration structure that can read as mechanical. The rule-of-three enumeration is natural here (exactly three modeling ingredients), so the colon itself is functional. Borderline.

**Original:**
```
My model combines three ingredients that prior work treats separately: consumer multi-homing, merchant heterogeneity, and merchant competition.
```

**Proposed Revision:**
```
My model combines consumer multi-homing, merchant heterogeneity, and merchant competition---three ingredients that prior work treats separately.
```

**Why better:** Removes the telegraphed colon-list structure; places the enumeration first and the framing second, which is less formulaic.

### Low

### - [ ] Lines 27: "In the absence of" opening `Low`

**Comment:** "In the absence of regulatory limits on fees, policy should seek to increase rates of consumer multi-homing" uses a somewhat formal prepositional phrase opening. Not strongly AI-typical, but slightly bureaucratic. The same construction reappears on line 101.

**Original:**
```
In the absence of regulatory limits on fees, policy should seek to increase rates of consumer multi-homing to force networks to compete for merchants rather than consumers.
```

**Proposed Revision:**
```
Without regulatory limits on fees, policy should seek to increase consumer multi-homing rates to force networks to compete for merchants rather than consumers.
```

**Why better:** "Without" is more direct than "In the absence of"; "consumer multi-homing rates" is tighter than "rates of consumer multi-homing."

### - [ ] Lines 101: Repeated "In the absence of" `Low`

**Comment:** Same construction as line 27. Two occurrences in the same file makes the pattern more noticeable.

**Original:**
```
In the absence of fee caps, policy can also redirect competition by increasing consumer multi-homing.
```

**Proposed Revision:**
```
Without fee caps, policy can redirect competition by increasing consumer multi-homing.
```

**Why better:** Same rationale as above. Also removes "also" which is low-information here.

### - [ ] Lines 38: "Together, these facts show" transition opener `Low`

**Comment:** "Together, these facts show that..." is a mild summarizing transition. It is functional here (concluding the three reduced-form facts), but "Together" as a sentence opener is slightly template-like.

**Original:**
```
Together, these facts show that networks can raise merchant fees to fund consumer adoption because merchants cannot afford to turn away cardholders.
```

**Proposed Revision:**
```
These facts show that networks can raise merchant fees to fund consumer adoption because merchants cannot afford to turn away cardholders.
```

**Why better:** "Together" adds no information since the paragraph already presented the three facts in sequence.

### - [ ] Lines 72: "A complementary perspective" framing `Low`

**Comment:** "A complementary perspective is that..." is a meta-framing construction. It announces a perspective rather than just stating it. Mildly template-like.

**Original:**
```
A complementary perspective is that lower rewards resolve a prisoner's dilemma among consumers.
```

**Proposed Revision:**
```
Lower rewards also resolve a prisoner's dilemma among consumers.
```

**Why better:** Cuts the meta-framing; the paragraph break already signals a new angle.

## [appendix_model.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Low

### - [ ] Line 95: Throat-clearing section opener `Low`

**Comment:** "This section proves that..." is meta-commentary (Part B). In a theorem-proof appendix, previewing the theorem statement is standard mathematical convention, so this is defensible in context. Flagging at Low severity.

**Original:**
```
This section proves that merchant profits are approximately linear in $\gamma$, exploiting the envelope theorem to show that optimal price adjustments contribute only second-order error in fee rates.
```

**Proposed Revision:**
```
Merchant profits are approximately linear in $\gamma$: optimal price adjustments contribute only second-order error in fee rates, by the envelope theorem.
```

**Why better:** Removes meta-commentary ("This section proves") and leads with the mathematical claim. However, the original is acceptable in a proof-oriented appendix.

---

**Overall assessment:** This file is clean. It is terse, mathematical, and functional --- characteristic of human-written derivation appendices. No stacked hedges, no AI vocabulary, no smarmy reframing, no transition overuse, no inventory-style numbers. The prose serves to connect equations and is appropriately minimal.

## [conclusion.tex]

### Medium

### - [ ] Lines 18-19: Generic "offers a framework" closing `Medium`

**Comment:** "Offers a framework for quantifying welfare effects in these settings" is a template closer common in LLM-generated text. It shifts from the concrete, punchy style of the rest of the conclusion into a vague generalization. The phrase "offers a framework" is abstract where the rest of the paragraph names specific mechanisms. Part B: padding phrase / Part C: missing concreteness.

**Original:**
```
My empirical approach, which uses variation on one side of the market to identify preferences on both sides, offers a framework for quantifying welfare effects in these settings.
```

**Proposed Revision:**
```
My empirical approach---using variation on one side of the market to identify preferences on both sides---can quantify welfare effects in these settings.
```

**Why better:** Cuts the abstract "offers a framework for" and replaces with the direct verb "can quantify." Converts the relative clause to a tighter parenthetical.

## [main.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 42-43: Formulaic abstract opener `Medium`

**Comment:** The opening two sentences follow a textbook-summary pattern: state how the system works, then state the market failure. This is competent but reads as a neutral description rather than creating tension or curiosity. A human-written opener might lead with the surprise (the scale of the distortion or the asymmetry between consumer and merchant costs) before explaining the mechanism. Part C: results-first opening with no tension.

**Original:**
```
Credit card networks fund consumer rewards through merchant fees.
Because merchants rarely surcharge, consumers fail to internalize payment costs, making credit card use socially excessive.
```

**Proposed Revision:**
```
Consumers pay nothing to swipe a credit card, but merchants pay 2\% per transaction, inflating retail prices for everyone.
Because merchants rarely surcharge, credit card use is socially excessive.
```

**Why better:** Opens with the concrete tension (free for consumers, costly for merchants) rather than a neutral description of the funding mechanism.

### Low

### - [ ] Lines 45-49: Mild template pattern in results reporting `Low`

**Comment:** Three consecutive sentences each follow the pattern "[Policy/force] [verb] welfare by $[N] billion." While each number answers a "so what" (good), the repeating template gives a slightly list-like cadence. Part C: mild inventory-style numbers. Borderline and low severity because the abstract is short and each sentence carries distinct content.

**Original:**
```
Capping credit card fees at 120 basis points raises welfare by \$27 billion.
Because networks compete for consumers through greater rewards rather than for merchants with lower fees, competition inflates credit card use and reduces welfare by \$16 billion.
Dual-routing mandates increase consumer multihoming, redirect competition toward merchants, and raise welfare by \$8 billion.
```

**Proposed Revision:**
```
Capping credit card fees at 120 basis points raises welfare by \$27 billion.
Why not rely on competition instead? Because networks compete for consumers through greater rewards rather than for merchants with lower fees, competition inflates credit card use and reduces welfare by \$16 billion.
Dual-routing mandates redirect this competition toward merchants, raising welfare by \$8 billion.
```

**Why better:** Breaks the three-sentence template pattern with a rhetorical question that creates tension. The third sentence links causally to the second rather than standing as a parallel list item.

## [appendix_sorting.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 37: Colon construction `Medium`

**Comment:** CLAUSE: LONGER CLAUSE construction -- "This classification captures real variation: consumers concentrate spending on their preferred method." The colon introduces a full independent clause that could stand on its own. Part A punctuation tell.

**Original:**
```
This classification captures real variation: consumers concentrate spending on their preferred method, with most credit-preferring consumers putting over 80\% of card spending on credit cards (Figure \ref{fig:distribution_cc}).
```

**Proposed Revision:**
```
This classification captures real variation. Most credit-preferring consumers put over 80\% of card spending on credit cards (Figure \ref{fig:distribution_cc}).
```

**Why better:** Splits at the colon, removes the vague "consumers concentrate spending on their preferred method" (which restates the classification definition), and leads with the concrete evidence.

### - [ ] Lines 43: Colon construction `Medium`

**Comment:** CLAUSE: LONGER CLAUSE -- "Homescan provides a cross-check: it records actual payment choices (not imputed)." The colon introduces an independent clause. Part A punctuation tell.

**Original:**
```
Homescan provides a cross-check: it records actual payment choices (not imputed), and its covariance estimates are similar to MRI, suggesting imputation bias is small.
```

**Proposed Revision:**
```
Homescan provides a cross-check. It records actual payment choices (not imputed), and its covariance estimates are similar to MRI, suggesting imputation bias is small.
```

**Why better:** Splitting at the colon avoids the AI-typical CLAUSE: LONGER CLAUSE pattern and lets both sentences breathe.

### - [ ] Lines 173-174: Cluster of colon constructions `Medium`

**Comment:** Lines 173 and 174 each contain a colon introducing an independent clause. Two consecutive colon constructions in a passage is a noticeable pattern. Part A punctuation tell (elevated because of clustering).

**Original:**
```
If all stores have identical payment mixes (zero covariance), a debit consumer's welfare loss from a 1pp credit fee increase equals the economy-wide credit share $\mathbb{E}_R[\mu_{jm}]$: all consumers bear the same burden regardless of payment choice.
With perfect segmentation, credit and debit consumers shop at disjoint stores ($\mu_{jm} \times \mu_{jl} = 0$ for all $j$), yielding $w_{lm}=0$: debit consumers bear no burden from credit fee increases.
```

**Proposed Revision:**
```
If all stores have identical payment mixes (zero covariance), a debit consumer's welfare loss from a 1pp credit fee increase equals the economy-wide credit share $\mathbb{E}_R[\mu_{jm}]$. All consumers bear the same burden regardless of payment choice.
With perfect segmentation, credit and debit consumers shop at disjoint stores ($\mu_{jm} \times \mu_{jl} = 0$ for all $j$), so $w_{lm}=0$. Debit consumers bear no burden from credit fee increases.
```

**Why better:** Replaces two consecutive colon constructions with periods. The colons were introducing independent clauses that stand alone as sentences.

### - [ ] Lines 245: Colon construction `Medium`

**Comment:** "The evidence validates the main text's 'integrated' market assumption: consumers with different payment preferences shop at overlapping merchants..." The colon introduces a 31-word independent clause. Part A punctuation tell.

**Original:**
```
The evidence validates the main text's ``integrated'' market assumption: consumers with different payment preferences shop at overlapping merchants where uniform pricing passes through the average cost of all accepted payment methods.
```

**Proposed Revision:**
```
The evidence validates the main text's ``integrated'' market assumption. Consumers with different payment preferences shop at overlapping merchants where uniform pricing passes through the average cost of all accepted payment methods.
```

**Why better:** The clause after the colon is a full sentence. Splitting avoids the colon-as-dramatic-reveal pattern.

### - [ ] Lines 252: Colon construction `Medium`

**Comment:** "The 91--96\% figure validates this assumption: sorting does not meaningfully segment the market." Another colon introducing an independent clause.

**Original:**
```
The 91--96\% figure validates this assumption: sorting does not meaningfully segment the market, so policy-induced fee changes generate the cross-consumer redistribution the integrated economy framework captures.
```

**Proposed Revision:**
```
The 91--96\% figure validates this assumption. Sorting does not meaningfully segment the market, so policy-induced fee changes generate the cross-consumer redistribution the integrated economy framework captures.
```

**Why better:** Avoids the colon construction. The second sentence carries the explanation and stands alone.

### Low

### - [ ] Lines 9-11: Opening sets up concern before resolving it `Low`

**Comment:** The opening paragraph announces the sorting concern and states the finding. This is borderline results-first, but the section is an appendix validation exercise, and lines 9-11 create genuine tension about whether sorting undermines the welfare analysis before resolving it in lines 13-20. Flagging at low severity only.

**Original:**
```
If consumers with different payment preferences shop at different merchants, card fees may not redistribute across consumer types.
Under perfect sorting, credit card users shop only at high-end merchants while cash/debit users shop at discount retailers, eliminating cross-consumer redistribution.
This would undermine the redistributive channel central to the welfare analysis, since fee changes would affect only consumers who already use the relevant payment method.
```

**Proposed Revision:**
```
No revision proposed -- the structure effectively sets up the concern before resolving it. The opening creates genuine tension about whether sorting undermines the welfare analysis.
```

**Why better:** N/A -- flagged for awareness only.

## [appendix_reduced.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Line 9: Throat-clearing topic sentence `Medium`

**Comment:** "This section checks the main specification's sensitivity and identifies the mechanism behind the debit volume decline." is meta-commentary announcing what the section does rather than doing it (Part B: Meta-Commentary). The subsection titles already convey this structure.

**Original:**
```
This section checks the main specification's sensitivity and identifies the mechanism behind the debit volume decline.
```

**Proposed Revision:**
```
Two questions arise about the baseline estimates: how sensitive are they to specification choices, and what mechanism drives the debit volume decline?
```

**Why better:** Replaces a topic-announcement sentence with a motivation sentence that creates questions the reader wants answered.

### - [ ] Line 110: Abstract noun subject hides concrete actors `Medium`

**Comment:** "The estimated effect comes from within-bank payment switching, not bank switching or cross-subsidization through credit rewards." uses an abstract noun ("the estimated effect") as the sentence subject and relies on three nominalized concepts. Mild AI pattern (Part B: nominalization, Part C: missing concrete mechanism).

**Original:**
```
The estimated effect comes from within-bank payment switching, not bank switching or cross-subsidization through credit rewards.
```

**Proposed Revision:**
```
Consumers at affected banks switched from debit to credit rather than switching banks or responding to improved credit rewards.
```

**Why better:** Concrete actors ("consumers at affected banks") and concrete actions replace abstract "effect comes from."

### Low

### - [ ] Lines 349-351: Enumerated preview sentence `Low`

**Comment:** "The results bear on whether X, whether Y, and how Z" is a mild announce-then-deliver pattern with three-item enumeration. The content is substantive and the list is genuinely three distinct questions, so severity is low.

**Original:**
```
A second-choice survey measures substitution patterns across payment types and networks. The results bear on whether credit and debit are distinct product categories, whether higher-income consumers are more reward-sensitive, and how consumers divert across networks.
```

**Proposed Revision:**
```
A second-choice survey measures substitution patterns across payment types and networks: are credit and debit distinct product categories, are higher-income consumers more reward-sensitive, and how do consumers divert across networks?
```

**Why better:** Converting the list into questions creates more forward momentum and curiosity.

### - [ ] Lines 449-450: Stacked descriptor phrasing `Low`

**Comment:** "many consumers actively prefer debit over credit for substantive reasons" contains two modifiers ("actively," "substantive") that are mildly padding. Low severity since "actively" does carry meaning (conscious choice vs. inertia).

**Original:**
```
SCPC and marketing surveys show that many consumers actively prefer debit over credit for substantive reasons, not because they are unaware of credit card rewards.
```

**Proposed Revision:**
```
SCPC and marketing surveys show that many consumers prefer debit over credit as a deliberate choice, not because they are unaware of credit card rewards.
```

**Why better:** "Deliberate choice" is more precise than "actively...for substantive reasons" and avoids the double-modifier pattern.

## [appendix_model_oa.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 41: Colon construction introducing two-part elaboration `Medium`

**Comment:** "Every acceptance decision hinges on the same two forces: how consumers multihome across cards and how the fees on those cards differ." Uses the CLAUSE: LONGER CLAUSE pattern where a colon introduces elaboration that could be restructured. Part A punctuation tell.

**Original:**
```
Every acceptance decision hinges on the same two forces: how consumers multihome across cards and how the fees on those cards differ.
```

**Proposed Revision:**
```
Every acceptance decision hinges on consumer multihoming and fee differences across cards.
```

**Why better:** More concise; eliminates the colon-introduced elaboration pattern. The two forces are clear without parallel clauses.

### - [ ] Lines 171-174: Throat-clearing opening paragraph `Medium`

**Comment:** The microfoundation subsection opens with four sentences that describe what the section does rather than doing it. Three of the four are meta-commentary: "This section derives...," "The microfoundation also provides...," "The main-text model assumes...; the microfoundation rationalizes..." Part B: meta-commentary / throat-clearing.

**Original:**
```
This section derives a microfoundation showing how payment methods can be substitutes at adoption yet poor substitutes at the point of sale.
The microfoundation also provides a natural origin for the complementarity parameters $\chi^{lm}$ in the main text: carrying two different card types generates option value, while carrying two cards of the same type generates diminishing returns.
The main-text model assumes consumers do not substitute between credit and debit at the point of sale; the microfoundation rationalizes this assumption.
The setup builds on \textcite{Koulayev.etal2016} and \textcite{Huynh.etal2022}, separating usage from adoption to show that segmentation at the usage stage is independent of segmentation at adoption.
```

**Proposed Revision:**
```
Payment methods can be substitutes at adoption yet poor substitutes at the point of sale. The microfoundation below, building on \textcite{Koulayev.etal2016} and \textcite{Huynh.etal2022}, separates usage from adoption to rationalize the main-text assumption of no credit-debit substitution at the point of sale and to provide a natural origin for the complementarity parameters $\chi^{lm}$.
```

**Why better:** Cuts from four sentences to two. Opens with the substantive claim rather than "This section derives." Removes self-referential meta-commentary.

### Low

### - [ ] Lines 44: Colon construction before itemize `Low`

**Comment:** "The incremental quasi-profit ... depends on two consumer groups:" followed by a bulleted list. Colon-into-itemize is standard LaTeX formatting, so this is not an AI tell. Flagging only for completeness.

**Original:**
```
The incremental quasi-profit (Theorem~\ref{thm:quasiprofit-approx}) depends on two consumer groups:
```

**Proposed Revision:**
```
No revision proposed -- colon before \begin{itemize} is standard.
```

**Why better:** N/A -- flagged for awareness only.

### - [ ] Lines 250: "essentially" as non-load-bearing hedge `Low`

**Comment:** "The match is essentially exact." The hedge "essentially" weakens a claim that the figure demonstrates. Part B: non-load-bearing hedge.

**Original:**
```
The match is essentially exact.
```

**Proposed Revision:**
```
The match is exact.
```

**Why better:** Removes a hedge that adds nothing. If the match were not exact, state the approximation error instead of hedging.

## [appendix_estimation.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Line 90: Colon construction introducing long enumeration `Medium`

**Comment:** CLAUSE: LONGER CLAUSE construction -- "The merchant-side parameters are: network marginal costs..." The colon introduces a 30+ word enumeration that could be restructured. Part A punctuation tell.

**Original:**
```
The merchant-side parameters are: network marginal costs $c_j$ for five networks, merchant benefit distribution parameters ($\bar{\gamma}$, $\nu_\gamma$, $\sigma_\gamma$), and additive fee adjustments for MC Credit and AmEx, all jointly identified by the following moment conditions.
```

**Proposed Revision:**
```
The merchant-side parameters include network marginal costs $c_j$ for five networks, merchant benefit distribution parameters ($\bar{\gamma}$, $\nu_\gamma$, $\sigma_\gamma$), and additive fee adjustments for MC Credit and AmEx. These are jointly identified by the following moment conditions.
```

**Why better:** Removes the CLAUSE: LONGER CLAUSE pattern by integrating the list directly and splitting the identification statement into its own sentence.

### Low

### - [ ] Lines 72-73: Passive "It is pinned down" `Low`

**Comment:** "It is pinned down by the gap between..." is passive where active would be more direct. Mild flag; passive is common in technical appendices. Part B language tell.

**Original:**
```
It is pinned down by the gap between Visa's share among primary and secondary credit cards: a higher $\omega$ makes network identity matter more for the primary card, widening this gap.
```

**Proposed Revision:**
```
The gap between Visa's share among primary and secondary credit cards pins down $\omega$: a higher $\omega$ makes network identity matter more for the primary card, widening this gap.
```

**Why better:** Active voice puts the identifying variation (the gap) as the grammatical subject, which is more direct.

### - [ ] Line 86: Participial ending `Low`

**Comment:** "justifying the focus on dollar shares" is a participial clause tacked onto a sentence. Mild AI pattern of chaining a justification via participle rather than making it a direct statement.

**Original:**
```
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households, justifying the focus on dollar shares.
```

**Proposed Revision:**
```
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households. This justifies the focus on dollar shares.
```

**Why better:** Splitting gives the justification its own sentence rather than appending it as a participial afterthought.

## [appendix_surcharging.tex]
<!-- Entries sorted: Critical -> High -> Medium -> Low; document order within tier -->

### Medium

### - [ ] Lines 7-8: Throat-clearing opening announces section contents `Medium`

**Comment:** Lines 7-8 are a two-sentence preamble describing what the appendix covers rather than beginning with the content. "This appendix asks..." / "It covers..." is meta-commentary (Part B). The section title "Price Coherence" already signals the topic. The road-map sentence enumerates three items in a rule-of-three pattern.

**Original:**
```
This appendix asks why merchants almost never surcharge despite legal ability to do so.
It covers the legal history of surcharging rules, empirical evidence on differential pricing, and a theoretical framework for price coherence.
```

**Proposed Revision:**
```
Merchants almost never surcharge despite legal ability to do so. Three facts explain why: surcharges cannot steer consumers from card to cash, the profit loss from uniform pricing is second-order in fee dispersion, and fee differences across card networks are an order of magnitude below the cash-card gap.
```

**Why better:** Removes meta-commentary ("This appendix asks..." / "It covers...") and replaces the road-map sentence with the actual argument.

### - [ ] Lines 10-14: Enumerated list with "Second" / "Third" without explicit "First" `Medium`

**Comment:** The paragraph uses "Second" (line 13) and "Third" (line 14) but the first point (line 11) has no "First" marker. This creates an artificial enumeration pattern (Part A: lists & enumeration). The three points also read as a summary restating what subsequent subsections prove.

**Original:**
```
I extend the baseline model to allow merchants to set different prices for card and cash consumers.
In this extension, I show that surcharges cannot steer consumers from card to cash.
Card-preferring consumers require a surcharge above the merchant fee before switching.
Second, because surcharges do not shift payment behavior, the profit loss from uniform pricing is second-order in fee dispersion by the envelope theorem.
Third, returns to surcharging across card networks are even smaller, since fee differences across networks are an order of magnitude below the cash-card gap.
```

**Proposed Revision:**
```
I extend the baseline model to allow merchants to set different prices for card and cash consumers.
Surcharges cannot steer consumers from card to cash: card-preferring consumers require a surcharge above the merchant fee before switching.
Because surcharges do not shift payment behavior, the profit loss from uniform pricing is second-order in fee dispersion by the envelope theorem.
Returns to surcharging across card networks are even smaller, since fee differences across networks are an order of magnitude below the cash-card gap.
```

**Why better:** Drops the "Second/Third" enumeration markers and integrates the points as flowing prose. Removes the redundant "In this extension, I show that" framing sentence.

### - [ ] Line 153: Colon construction in LLM block `Medium`

**Comment:** "The empirical relevance of this case is limited: the event-study evidence..." uses a CLAUSE: LONGER CLAUSE construction (Part A punctuation tell). The colon introduces what could be an independent sentence.

**Original:**
```
The empirical relevance of this case is limited: the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin.
```

**Proposed Revision:**
```
But the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin, limiting the empirical relevance of this case.
```

**Why better:** Removes the colon construction and the throat-clearing lead-in ("The empirical relevance of this case is limited"). Leads with the evidence instead.

### Low

### - [ ] Lines 146-156: LLM-tagged section with adequate but formulaic structure `Low`

**Comment:** This section is already wrapped in `\begin{llm}...\end{llm}`. The prose is serviceable but follows a template progression: limitation stated, conditional explored, limit case, empirical rebuttal, caveat. Sentence lengths are fairly uniform (~20-25 words each). The "Nevertheless" transition opener on line 154 is a mild Part B flag.

**Original:**
```
The results above rely on every card transaction generating incremental sales for the merchant.
If some card transactions do not boost sales---for instance, because a consumer would have purchased regardless of card acceptance---merchants would face stronger incentives to surcharge those transactions.
In the limit where no card transaction generates incremental sales, surcharging at the full merchant fee would be profitable.
The empirical relevance of this case is limited: the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin.
Nevertheless, the threat to surcharge could discipline network pricing even if merchants rarely exercise it---a mechanism this paper does not model.
```

**Proposed Revision:**
```
The results above rely on every card transaction generating incremental sales.
If some transactions would occur regardless of card acceptance, merchants gain more from surcharging them.
In the limit where no card transaction generates incremental sales, surcharging at the full merchant fee is profitable.
But the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows card acceptance does increase sales at the margin, limiting the empirical relevance of this case.
The threat to surcharge could still discipline network pricing even if merchants rarely exercise it---a mechanism this paper does not model.
```

**Why better:** Tightens the colon construction; replaces "Nevertheless" transition opener with "still" embedded in the clause; varies sentence length more.

## [appendix_robustness.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 67-68: Inventory-style number sequence `Medium`

**Comment:** Three counterfactual results listed in a single sentence with parenthetical baseline comparisons: "Uncapping debit raises total welfare by \$8B (versus \$7B), the monopoly counterfactual yields \$9B (versus \$16B), and dual routing yields \$7B (versus \$8B)." This reads like a table caption rather than an argument. Part C: inventory-style numbers.

**Original:**
```
The other counterfactuals are qualitatively similar to baseline.
Uncapping debit raises total welfare by \$8B (versus \$7B), the monopoly counterfactual yields \$9B (versus \$16B), and dual routing yields \$7B (versus \$8B).
```

**Proposed Revision:**
```
The other counterfactuals are qualitatively similar to baseline, with total welfare gains within \$2B of the baseline estimate for uncapping debit (\$8B versus \$7B) and dual routing (\$7B versus \$8B). The monopoly counterfactual yields smaller gains (\$9B versus \$16B) because the merged network cannot pass fee savings to consumers through lower retail prices.
```

**Why better:** Embeds numbers as evidence for a claim rather than listing them; adds a mechanism for the one result that differs materially.

### - [ ] Lines 140-143: Repeated "(versus baseline)" inventory pattern `Medium`

**Comment:** Lines 140-153 follow a repeating pattern: state a welfare number, parenthetical comparison to baseline, state another number, parenthetical comparison. Four paragraphs in this section use this pattern. Each number is individually useful, but the accumulation across paragraphs reads as inventory. Part C: inventory-style numbers.

**Original:**
```
Fee caps raise total welfare by \$31B (SE \$2.9B), versus \$27B at baseline (Table~\ref{tab:welfare-credit-constrained}).
The cap fees price responses are close to baseline.
The credit share drops 18 percentage points (versus 21), total fees fall \$59B (versus \$58B), and total rewards fall \$50B (versus \$57B).
```

**Proposed Revision:**
```
Fee caps raise total welfare by \$31B (SE \$2.9B), about 15\% more than at baseline (Table~\ref{tab:welfare-credit-constrained}).
Under the fee cap, price responses are close to baseline: the credit share drops 18 percentage points (versus 21), total fees fall \$59B, and total rewards fall \$50B.
```

**Why better:** Converts the raw comparison into an interpretive claim ("about 15\% more"); reduces the number of parenthetical baseline comparisons where the differences are small.

### - [ ] Lines 211-212: Results-first opening followed by raw numbers `Medium`

**Comment:** Line 211 drops immediately into raw numbers ("fee caps raise total welfare by \$15B (SE \$1.5B), versus \$27B at baseline") without first communicating the relative scale. Part C: missing interpretive framing before numbers.

**Original:**
```
Under these model assumptions, fee caps raise total welfare by \$15B (SE \$1.5B), versus \$27B at baseline (Table~\ref{tab:welfare-robustness-debit}).
```

**Proposed Revision:**
```
Fee caps raise total welfare by \$15B (SE \$1.5B), about half the baseline gain of \$27B (Table~\ref{tab:welfare-robustness-debit}).
```

**Why better:** "About half" immediately communicates scale; the reader does not need to compute 15/27.

### Low

### - [ ] Lines 7-9: Appendix roadmap opener `Low`

**Comment:** The opening paragraph describes what each section does. This is standard for appendix openers and expected by readers navigating supplementary material. Not AI-typical in this context.

**Original:**
```
This appendix tests the robustness of the counterfactual analysis in the main text to different modeling assumptions and types of fee caps.
```

**Proposed Revision:**
```
No revision proposed --- roadmapping is conventional for appendix openers.
```

**Why better:** N/A --- flagged for awareness only.

### - [ ] Lines 152: Colon construction `Low`

**Comment:** "Both specifications match the same Durbin Amendment moment: constrained consumers cannot respond..." Single instance, colon introduces an explanation naturally.

**Original:**
```
Both specifications match the same Durbin Amendment moment: constrained consumers cannot respond to rewards, so unconstrained consumers must be more reward-sensitive to fit the same aggregate shift.
```

**Proposed Revision:**
```
Both specifications match the same Durbin Amendment moment. Constrained consumers cannot respond to rewards, so unconstrained consumers must be more reward-sensitive to fit the same aggregate shift.
```

**Why better:** Replaces the colon with a period. Minor improvement; the colon is acceptable here.

### - [ ] Line 340: Long sentence with embedded "because" clause `Low`

**Comment:** 37-word sentence combining the result and its mechanism in one breath. Not strongly AI-typical, but the sentence could land harder if split.

**Original:**
```
The 120 bps cap achieves 80\% of the planner's gains (\$27 billion vs.\ \$34 billion) without directly regulating rewards, because the dominant distortion is the excessive adoption of credit cards and not network market power.
```

**Proposed Revision:**
```
The 120 bps cap achieves 80\% of the planner's gains (\$27 billion vs.\ \$34 billion) without directly regulating rewards. The dominant distortion is excessive credit card adoption, not network market power.
```

**Why better:** Two shorter sentences; the mechanism gets its own sentence and stands out more.
