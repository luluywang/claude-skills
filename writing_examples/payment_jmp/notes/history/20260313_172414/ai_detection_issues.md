# AI Detection — Issues Only
<!-- Auto-generated: passes and clean sections suppressed. Source: ai_detection.md -->

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

**Comment:** Lines 28-37 walk the reader through the figure in a step-by-step manner. Each sentence introduces one flow with a dollar amount. This reads somewhat like a guided tour, which is a mild AI pattern (sequential description). However, for an institutional details section that explains payment flows, this is natural and appropriate.

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
No revision proposed — the walkthrough structure is appropriate for explaining institutional payment flows referenced in a figure.
```

**Why better:** N/A — flagged for awareness only.

## [data.tex]

### Low

### - [ ] Lines 55-56: Long relative clause slightly weakens directness `Low`

**Comment:** Line 56 uses a relative clause ("which shapes merchants' incentives to accept high-fee cards") tacked onto an already long sentence.

**Original:**
```
The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets, which shapes merchants' incentives to accept high-fee cards.
```

**Proposed Revision:**
```
The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets. This allocation shapes merchants' incentives to accept high-fee cards.
```

**Why better:** Splitting into two sentences gives the second idea its own emphasis rather than burying it in a relative clause.

## [appendix_data.tex]

### Medium

### - [ ] Lines 55: Colon construction `Medium`

**Comment:** CLAUSE: LONGER CLAUSE construction.

**Original:**
```
Table \ref{tab:spend-trip-correlation} shows that trip-based and spending-based rankings are highly correlated: the top-trip card is also the top-spending card for 91\% of consumers.
```

**Proposed Revision:**
```
Table \ref{tab:spend-trip-correlation} shows that trip-based and spending-based rankings are highly correlated. The top-trip card is also the top-spending card for 91\% of consumers.
```

**Why better:** Splitting at the colon avoids the AI-typical CLAUSE: LONGER CLAUSE construction.

### - [ ] Lines 59: Colon construction `Medium`

**Comment:** Second CLAUSE: LONGER CLAUSE construction.

**Original:**
```
The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors: at grocery chains known not to accept Visa (identified from stores that switched acceptance during the sample), Visa's residual measured share was about 1.5\%, arising entirely from misrecorded transactions.
```

**Proposed Revision:**
```
The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors. At grocery chains known not to accept Visa (identified from stores that switched acceptance during the sample), Visa's residual measured share was about 1.5\%, arising entirely from misrecorded transactions.
```

**Why better:** The evidence after the colon is a complete, independent sentence. Splitting avoids a 42-word sentence.

### Low

### - [ ] Lines 69: Long sentence with multiple embedded clauses `Low`

**Comment:** 43-word sentence with nested parenthetical qualifiers.

**Original:**
```
The Survey and Diary of Consumer Payment Choice (DCPC), conducted by the Federal Reserve Bank of Atlanta (2017--2019 waves) through the University of Southern California's Understanding America Study, provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance.
```

**Proposed Revision:**
```
The Survey and Diary of Consumer Payment Choice (DCPC) provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance. The DCPC is conducted by the Federal Reserve Bank of Atlanta through the University of Southern California's Understanding America Study; I use the 2017--2019 waves.
```

**Why better:** Separates the citation-heavy provenance from the substantive description.

### - [ ] Lines 92: Very long enumeration sentence `Low`

**Comment:** Single 57-word sentence enumerating all survey items.

**Original:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, primary bank and consideration set, second-choice payment if their primary method became unavailable, and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled), plus an attention check.
```

**Proposed Revision:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, and primary bank. It then elicited a second-choice payment if the primary method became unavailable and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled). An attention check screened inattentive respondents.
```

**Why better:** Three sentences instead of one; each groups related survey items.

## [reducedform.tex]

### Medium

### - [ ] Lines 4-6: Section opens with throat-clearing summary `Medium`

**Comment:** The opening three sentences summarize the section's three facts before presenting any of them. Mild road-mapping pattern.

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

**Why better:** Collapses three sentences into one, removing the throat-clearing opener and the restating closer.

### - [ ] Lines 167-173: Concluding subsection restates all three facts `Medium`

**Comment:** The subsection re-summarizes all three facts with "(Fact 1)", "(Fact 2)", "(Fact 3)" labels. Close to formulaic recap pattern.

**Original:**
```
Together, these three facts reveal a ``competitive bottleneck'' \parencite{Armstrong2006}. Issuer incentives drive consumer adoption (Fact 1), card acceptance increases merchant sales (Fact 2), and asymmetric multi-homing (Fact 3) tilts network competition toward the consumer side and away from merchants.
```

**Proposed Revision:**
```
These patterns constitute the ``competitive bottleneck'' of \textcite{Armstrong2006}: because merchants multi-home while many consumers do not, networks compete for consumers through generous rewards funded by high merchant fees.
```

**Why better:** Removes the inventory-style "(Fact 1), (Fact 2), (Fact 3)" enumeration. States the mechanism directly.

### Low

### - [ ] Lines 42-43: Consecutive "Online Appendix" references `Low`

**Comment:** Two consecutive sentences begin with "Online Appendix" and use the same verb "presents."

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

**Why better:** Varies the sentence structure by moving the appendix reference to the end.

### - [ ] Lines 107-108: Consecutive "Figure X shows" pattern `Low`

**Comment:** Two consecutive sentences begin "Figure \ref{...} shows."

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

**Why better:** Varies the sentence opening by integrating the figure reference parenthetically.

## [main.tex]

### Medium

### - [ ] Lines 42-43: Formulaic abstract opener `Medium`

**Comment:** The opening two sentences follow a textbook-summary pattern: state how the system works, then state the market failure. Reads as a neutral description rather than creating tension or curiosity. Part C: results-first opening with no tension.

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

**Comment:** Three consecutive sentences each follow the pattern "[Policy/force] [verb] welfare by $[N] billion." Part C: mild inventory-style numbers.

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

**Why better:** Breaks the three-sentence template pattern with a rhetorical question that creates tension.
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

## [appendix_sorting.tex]

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

## [model.tex]

### Medium

### - [ ] Lines 9-13: Sequential "In the first/second/third stage" enumeration `Medium`

**Comment:** Three consecutive sentences beginning "In the first stage... In the second stage... In the third stage..." is an artificial enumeration pattern (Part A).

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

**Why better:** Removes the mechanical "In the Nth stage" enumeration.

### - [ ] Line 287: Throat-clearing sentence `Medium`

**Comment:** "I discuss the evidence for these assumptions below" is meta-commentary (Part B).

**Original:**
```
The model makes several simplifying assumptions for tractability. I discuss the evidence for these assumptions below.
```

**Proposed Revision:**
```
The model makes several simplifying assumptions for tractability.
```

**Why better:** The section title already signals what follows.

### Low

### - [ ] Line 72: Chained participial phrases `Low`

**Comment:** Two participial phrases chain the causal mechanism into one sentence.

**Original:**
```
Card consumers reallocate consumption toward merchants that accept cards, increasing demand at those merchants and incentivizing acceptance.
```

**Proposed Revision:**
```
Card consumers reallocate consumption toward merchants that accept cards. The resulting demand increase incentivizes acceptance.
```

**Why better:** Splitting makes the causal chain explicit.

### - [ ] Line 338: Formal hedge "could be attenuated" `Low`

**Comment:** "Attenuated" is slightly formal; the hedge is warranted but could be more concrete.

**Original:**
```
If networks use regulated fee levels as focal points for tacit coordination, welfare benefits of fee caps could be attenuated.
```

**Proposed Revision:**
```
If networks use regulated fee levels as focal points for tacit coordination, fee caps would deliver smaller welfare gains.
```

**Why better:** "Smaller welfare gains" is more concrete than "could be attenuated."

## [appendix_estimation.tex]

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

**Comment:** "It is pinned down by the gap between..." is passive where active would be more direct. Part B language tell.

**Original:**
```
It is pinned down by the gap between Visa's share among primary and secondary credit cards: a higher $\omega$ makes network identity matter more for the primary card, widening this gap.
```

**Proposed Revision:**
```
The gap between Visa's share among primary and secondary credit cards pins down $\omega$: a higher $\omega$ makes network identity matter more for the primary card, widening this gap.
```

**Why better:** Active voice puts the identifying variation (the gap) as the grammatical subject.

### - [ ] Line 86: Participial ending `Low`

**Comment:** "justifying the focus on dollar shares" is a participial clause tacked onto a sentence. Mild AI pattern.

**Original:**
```
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households, justifying the focus on dollar shares.
```

**Proposed Revision:**
```
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households. This justifies the focus on dollar shares.
```

**Why better:** Splitting gives the justification its own sentence rather than appending it as a participial afterthought.

## [appendix_model_oa.tex]

### Medium

### - [ ] Lines 41: Colon construction introducing two-part elaboration `Medium`

**Comment:** Uses the CLAUSE: LONGER CLAUSE pattern where a colon introduces elaboration that could be restructured.

**Original:**
```
Every acceptance decision hinges on the same two forces: how consumers multihome across cards and how the fees on those cards differ.
```

**Proposed Revision:**
```
Every acceptance decision hinges on consumer multihoming and fee differences across cards.
```

**Why better:** More concise; eliminates the colon-introduced elaboration pattern.

### - [ ] Lines 171-174: Throat-clearing opening paragraph `Medium`

**Comment:** Four sentences of meta-commentary: "This section derives...," "The microfoundation also provides...," "The main-text model assumes...; the microfoundation rationalizes..."

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

**Why better:** Cuts from four sentences to two. Opens with the substantive claim rather than "This section derives."

### Low

### - [ ] Lines 250: "essentially" as non-load-bearing hedge `Low`

**Comment:** "The match is essentially exact." The hedge "essentially" weakens a claim that the figure demonstrates.

**Original:**
```
The match is essentially exact.
```

**Proposed Revision:**
```
The match is exact.
```

**Why better:** Removes a hedge that adds nothing.

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

## [appendix_surcharging.tex]

### Medium

### - [ ] Lines 7-8: Throat-clearing opening announces section contents `Medium`

**Comment:** "This appendix asks..." / "It covers..." is meta-commentary (Part B). The section title already signals the topic.

**Original:**
```
This appendix asks why merchants almost never surcharge despite legal ability to do so.
It covers the legal history of surcharging rules, empirical evidence on differential pricing, and a theoretical framework for price coherence.
```

**Proposed Revision:**
```
Merchants almost never surcharge despite legal ability to do so. Three facts explain why: surcharges cannot steer consumers from card to cash, the profit loss from uniform pricing is second-order in fee dispersion, and fee differences across card networks are an order of magnitude below the cash-card gap.
```

**Why better:** Removes meta-commentary and replaces the road-map sentence with the actual argument.

### - [ ] Lines 10-14: Enumerated list with "Second" / "Third" without explicit "First" `Medium`

**Comment:** Artificial enumeration pattern (Part A). Three points read as a summary restating what subsequent subsections prove.

**Original:**
```
In this extension, I show that surcharges cannot steer consumers from card to cash.
Card-preferring consumers require a surcharge above the merchant fee before switching.
Second, because surcharges do not shift payment behavior, the profit loss from uniform pricing is second-order in fee dispersion by the envelope theorem.
Third, returns to surcharging across card networks are even smaller, since fee differences across networks are an order of magnitude below the cash-card gap.
```

**Proposed Revision:**
```
Surcharges cannot steer consumers from card to cash: card-preferring consumers require a surcharge above the merchant fee before switching.
Because surcharges do not shift payment behavior, the profit loss from uniform pricing is second-order in fee dispersion by the envelope theorem.
Returns to surcharging across card networks are even smaller, since fee differences across networks are an order of magnitude below the cash-card gap.
```

**Why better:** Drops enumeration markers; removes redundant framing sentence.

### - [ ] Line 153: Colon construction in LLM block `Medium`

**Comment:** CLAUSE: LONGER CLAUSE construction (Part A).

**Original:**
```
The empirical relevance of this case is limited: the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin.
```

**Proposed Revision:**
```
But the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin, limiting the empirical relevance of this case.
```

**Why better:** Leads with the evidence instead of a throat-clearing lead-in.

### Low

### - [ ] Lines 146-156: LLM-tagged section with adequate but formulaic structure `Low`

**Comment:** Already wrapped in `\begin{llm}...\end{llm}`. Uniform sentence lengths (~20-25 words each). "Nevertheless" transition opener on line 154 is a mild Part B flag.

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

**Why better:** Tightens colon construction; replaces "Nevertheless" with embedded "still"; varies sentence length more.

## [appendix_robustness.tex]

### Medium

### - [ ] Lines 67-68: Inventory-style number sequence `Medium`

**Comment:** Three counterfactual results listed in a single sentence with parenthetical baseline comparisons. Part C: inventory-style numbers.

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

**Comment:** Four paragraphs in this section follow a repeating pattern: state a welfare number, parenthetical comparison to baseline. Part C: inventory-style numbers.

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

**Why better:** Converts the raw comparison into an interpretive claim ("about 15\% more").

### - [ ] Lines 211-212: Results-first opening followed by raw numbers `Medium`

**Comment:** Drops immediately into raw numbers without communicating the relative scale. Part C: missing interpretive framing before numbers.

**Original:**
```
Under these model assumptions, fee caps raise total welfare by \$15B (SE \$1.5B), versus \$27B at baseline (Table~\ref{tab:welfare-robustness-debit}).
```

**Proposed Revision:**
```
Fee caps raise total welfare by \$15B (SE \$1.5B), about half the baseline gain of \$27B (Table~\ref{tab:welfare-robustness-debit}).
```

**Why better:** "About half" immediately communicates scale.
