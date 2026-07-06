# Suggested Simplifications

## [institutional_details.tex]

### - [ ] Lines 26-27: Minor redundancy in figure reference

**Comment:** "payment flows" in line 27 slightly echoes the subject of the prior sentence. Could tighten.

**Original:**
```
Figure \ref{fig:payment-flow} shows the payment flows with representative prices.
```

**Proposed Revision:**
```
Figure \ref{fig:payment-flow} illustrates these flows with representative prices.
```

**Why better:** Avoids repeating "payment" when context is already established.

## [data.tex]

### - [ ] Lines 55-56: Split relative clause for emphasis

**Comment:** The "which shapes" relative clause buries an important point about merchant incentives.

**Original:**
```
The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets, which shapes merchants' incentives to accept high-fee cards.
```

**Proposed Revision:**
```
The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets. This allocation shapes merchants' incentives to accept high-fee cards.
```

**Why better:** The merchant-incentive point deserves its own sentence rather than being appended as a relative clause.

## [appendix_data.tex]

### - [ ] Lines 55: Split colon construction

**Comment:** CLAUSE: LONGER CLAUSE — colon introduces independent clause.

**Original:**
```
Table \ref{tab:spend-trip-correlation} shows that trip-based and spending-based rankings are highly correlated: the top-trip card is also the top-spending card for 91\% of consumers.
```

**Proposed Revision:**
```
Table \ref{tab:spend-trip-correlation} shows that trip-based and spending-based rankings are highly correlated. The top-trip card is also the top-spending card for 91\% of consumers.
```

**Why better:** Avoids colon-as-dramatic-reveal; the evidence stands alone.

### - [ ] Lines 59: Split colon construction

**Comment:** CLAUSE: LONGER CLAUSE — colon introduces a 30-word evidence clause.

**Original:**
```
The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors: at grocery chains known not to accept Visa (identified from stores that switched acceptance during the sample), Visa's residual measured share was about 1.5\%, arising entirely from misrecorded transactions.
```

**Proposed Revision:**
```
The 1.5\% threshold is an upper bound on measurement error at confirmed non-acceptors. At grocery chains known not to accept Visa (identified from stores that switched acceptance during the sample), Visa's residual measured share was about 1.5\%, arising entirely from misrecorded transactions.
```

**Why better:** Splits a 42-word sentence; the evidence clause reads better as an independent sentence.

### - [ ] Lines 69: Unpack long introductory sentence

**Comment:** 43-word sentence with nested parenthetical appositives.

**Original:**
```
The Survey and Diary of Consumer Payment Choice (DCPC), conducted by the Federal Reserve Bank of Atlanta (2017--2019 waves) through the University of Southern California's Understanding America Study, provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance.
```

**Proposed Revision:**
```
The Survey and Diary of Consumer Payment Choice (DCPC) provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance. The DCPC is conducted by the Federal Reserve Bank of Atlanta through the University of Southern California's Understanding America Study; I use the 2017--2019 waves.
```

**Why better:** Separates what-the-data-contains from provenance, reducing cognitive load.

### - [ ] Lines 92: Break up 57-word enumeration

**Comment:** Single sentence enumerating all survey items.

**Original:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, primary bank and consideration set, second-choice payment if their primary method became unavailable, and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled), plus an attention check.
```

**Proposed Revision:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, and primary bank. It then elicited a second-choice payment if the primary method became unavailable and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled). An attention check screened inattentive respondents.
```

**Why better:** Three sentences instead of one; each groups related survey items, improving scannability.

## [appendix_mri.tex]

No simplifications suggested. The prose is concise and direct throughout.

## [reducedform.tex]

### - [ ] Lines 4-6: Collapse throat-clearing opener

**Comment:** Section opens with three sentences that preview the three subsections. The section title and subsection titles already provide this structure.

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

**Why better:** Removes meta-commentary ("This section documents") and eliminates the restating third sentence. One sentence does the work of three.

### - [ ] Lines 42-43: Vary "Online Appendix presents" repetition

**Comment:** Two consecutive sentences with identical structure: "Online Appendix X presents Y."

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

**Why better:** Breaks the repetitive structure by varying the sentence opening.

### - [ ] Lines 107-108: Vary "Figure X shows" repetition

**Comment:** Two consecutive sentences opening with "Figure \ref{...} shows."

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

**Why better:** Varies sentence openings; integrates figure reference parenthetically.

### - [ ] Lines 167-173: Reduce restating enumeration in concluding subsection

**Comment:** The "Competitive Bottleneck" subsection re-enumerates "(Fact 1), (Fact 2), (Fact 3)" which the reader just encountered. The value of this subsection is the theoretical framing and transition to the structural model.

**Original:**
```
Together, these three facts reveal a ``competitive bottleneck'' \parencite{Armstrong2006}. Issuer incentives drive consumer adoption (Fact 1), card acceptance increases merchant sales (Fact 2), and asymmetric multi-homing (Fact 3) tilts network competition toward the consumer side and away from merchants.
Networks should therefore compete for consumers through generous rewards funded by high merchant fees \parencite{Rochet.Tirole2003, Edelman.Wright2015}.
```

**Proposed Revision:**
```
These patterns constitute the ``competitive bottleneck'' of \textcite{Armstrong2006}: because merchants multi-home while many consumers do not, networks compete for consumers through generous rewards funded by high merchant fees \parencite{Rochet.Tirole2003, Edelman.Wright2015}.
```

**Why better:** Eliminates redundant re-enumeration of facts already established. States the mechanism directly. More concise.

## [estimation.tex]

### - [ ] Lines 159-160: Condense road-mapping sentence

**Comment:** Meta-commentary / throat-clearing. The sentence describes what will be examined rather than examining it.

**Original:**
```
I now assess fit by examining moments the model was not trained to match, including adoption shares across payment types, the joint distribution of primary and secondary cards, and merchant acceptance patterns.
```

**Proposed Revision:**
```
I now compare model predictions to untargeted moments: adoption shares, wallet composition, and merchant acceptance.
```

**Why better:** More concise; cuts road-mapping while preserving informational content.

### - [ ] Lines 79-81: Trim two-sided market explanation

**Comment:** Over-explanation of standard two-sided market insight for a specialist audience.

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

**Why better:** Eliminates textbook explanation; the reader knows two-sided pricing theory.

### - [ ] Line 87: Long sentence with multiple clauses

**Comment:** Wordiness. The sentence about normalizing the cost of cash and bootstrapping is 40+ words with nested clauses.

**Original:**
```
I normalize $\tau_0 = 0$ for cash using the \scalarinput{param_est_cashcost_pass_baseline.tex} bps cost-of-cash estimate from \textcite{Felt.etal2020} for the U.S., then bootstrap from a distribution centered at that value with a standard deviation of \scalarinput{param_est_cashcost_pass_baseline_se.tex} bps to incorporate uncertainty in the cost of cash into other parameter estimates.
```

**Proposed Revision:**
```
I normalize $\tau_0 = 0$ for cash at the \scalarinput{param_est_cashcost_pass_baseline.tex} bps cost-of-cash estimate from \textcite{Felt.etal2020}. Standard errors bootstrap from a distribution centered at that value (s.d.\ \scalarinput{param_est_cashcost_pass_baseline_se.tex} bps) to propagate cost-of-cash uncertainty.
```

**Why better:** Splits a long compound sentence into two shorter ones; easier to parse.

## [intro.tex]

### - [ ] Lines 27, 101: "In the absence of" → "Without"

**Comment:** Formal prepositional phrase used twice. "Without" is shorter and equally clear.

**Original (line 27):**
```
In the absence of regulatory limits on fees, policy should seek to increase rates of consumer multi-homing to force networks to compete for merchants rather than consumers.
```

**Proposed Revision:**
```
Without regulatory limits on fees, policy should seek to increase consumer multi-homing rates to force networks to compete for merchants rather than consumers.
```

**Original (line 101):**
```
In the absence of fee caps, policy can also redirect competition by increasing consumer multi-homing.
```

**Proposed Revision:**
```
Without fee caps, policy can redirect competition by increasing consumer multi-homing.
```

**Why better:** More direct; removes unnecessary padding ("also" on line 101 is low-information).

### - [ ] Lines 38: "Together, these facts show" → "These facts show"

**Comment:** "Together" is a low-information transition opener. The three facts were just enumerated; the reader already knows they work together.

**Original:**
```
Together, these facts show that networks can raise merchant fees to fund consumer adoption because merchants cannot afford to turn away cardholders.
```

**Proposed Revision:**
```
These facts show that networks can raise merchant fees to fund consumer adoption because merchants cannot afford to turn away cardholders.
```

**Why better:** Cuts a word without losing meaning.

### - [ ] Lines 72: "A complementary perspective is that" → direct statement

**Comment:** Meta-framing that announces a perspective instead of stating it.

**Original:**
```
A complementary perspective is that lower rewards resolve a prisoner's dilemma among consumers.
```

**Proposed Revision:**
```
Lower rewards also resolve a prisoner's dilemma among consumers.
```

**Why better:** The paragraph break already signals a new angle; no need to announce it.

### - [ ] Lines 121: Colon-list restructuring

**Comment:** "X combines three Y: A, B, and C" is a template pattern. Can be restructured to lead with the content.

**Original:**
```
My model combines three ingredients that prior work treats separately: consumer multi-homing, merchant heterogeneity, and merchant competition.
```

**Proposed Revision:**
```
My model combines consumer multi-homing, merchant heterogeneity, and merchant competition---three ingredients that prior work treats separately.
```

**Why better:** Places the concrete items first; avoids the telegraphed colon enumeration.

## [appendix_model.tex]

### - [ ] Line 95: Throat-clearing opener in linearization section

**Comment:** "This section proves that..." is meta-commentary. Could lead directly with the claim.

**Original:**
```
This section proves that merchant profits are approximately linear in $\gamma$, exploiting the envelope theorem to show that optimal price adjustments contribute only second-order error in fee rates.
```

**Proposed Revision:**
```
Merchant profits are approximately linear in $\gamma$: optimal price adjustments contribute only second-order error in fee rates, by the envelope theorem.
```

**Why better:** Removes meta-commentary and leads with the mathematical content. The original is defensible in a theorem-proof appendix where previewing the result is conventional.

## [conclusion.tex]

### - [ ] Lines 18-19: "Offers a framework for quantifying" is abstract

**Comment:** "Offers a framework for" is a padding phrase that distances the subject from its action. The rest of the conclusion is concrete and direct; this sentence drifts into generality.

**Original:**
```
My empirical approach, which uses variation on one side of the market to identify preferences on both sides, offers a framework for quantifying welfare effects in these settings.
```

**Proposed Revision:**
```
My empirical approach---using variation on one side of the market to identify preferences on both sides---can quantify welfare effects in these settings.
```

**Why better:** Eliminates the abstract noun "framework" and the padding phrase "offers a framework for." The direct verb "can quantify" is more concrete.

## [main.tex]

### - [ ] Lines 42-43: Abstract opener could create more tension

**Comment:** The opening describes the mechanism neutrally. Leading with the tension (consumers pay nothing, merchants bear the cost) would be more engaging.

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

**Why better:** Opens with the concrete asymmetry that motivates the paper rather than a neutral description of how funding works.

### - [ ] Lines 45-49: Three parallel "[Policy] raises/reduces welfare by $N" sentences

**Comment:** The abstract's three main results use a repetitive template. Varying the structure would improve rhythm.

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

**Why better:** Breaks the template pattern; the rhetorical question creates a natural transition from cap results to competition results.

## [model.tex]

### - [ ] Lines 9-13: Remove mechanical stage enumeration

**Comment:** "In the first stage... In the second stage... In the third stage..." is a template pattern.

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

**Why better:** Removes the mechanical enumeration while preserving sequential structure through natural transitions.

### - [ ] Line 72: Split chained participial phrases

**Comment:** Two participial phrases chain the causal mechanism into a single sentence.

**Original:**
```
Card consumers reallocate consumption toward merchants that accept cards, increasing demand at those merchants and incentivizing acceptance.
```

**Proposed Revision:**
```
Card consumers reallocate consumption toward merchants that accept cards. The resulting demand increase incentivizes acceptance.
```

**Why better:** Splitting makes each step of the causal chain its own sentence.

### - [ ] Line 287: Cut throat-clearing sentence

**Comment:** "I discuss the evidence for these assumptions below" is meta-commentary.

**Original:**
```
The model makes several simplifying assumptions for tractability. I discuss the evidence for these assumptions below.
```

**Proposed Revision:**
```
The model makes several simplifying assumptions for tractability.
```

**Why better:** Section title already signals what follows.

### - [ ] Line 338: Replace formal hedge "could be attenuated"

**Comment:** "Attenuated" is formal; more direct phrasing available.

**Original:**
```
If networks use regulated fee levels as focal points for tacit coordination, welfare benefits of fee caps could be attenuated.
```

**Proposed Revision:**
```
If networks use regulated fee levels as focal points for tacit coordination, fee caps would deliver smaller welfare gains.
```

**Why better:** More concrete and direct.

## [appendix_sorting.tex]

### - [ ] Lines 37: Split colon construction

**Comment:** "This classification captures real variation: consumers concentrate..." -- colon introduces independent clause.

**Original:**
```
This classification captures real variation: consumers concentrate spending on their preferred method, with most credit-preferring consumers putting over 80\% of card spending on credit cards (Figure \ref{fig:distribution_cc}).
```

**Proposed Revision:**
```
This classification captures real variation. Most credit-preferring consumers put over 80\% of card spending on credit cards (Figure \ref{fig:distribution_cc}).
```

**Why better:** Removes restated definition; leads with concrete evidence.

### - [ ] Lines 43: Split colon construction

**Comment:** "Homescan provides a cross-check: it records actual payment choices" -- colon introduces independent clause.

**Original:**
```
Homescan provides a cross-check: it records actual payment choices (not imputed), and its covariance estimates are similar to MRI, suggesting imputation bias is small.
```

**Proposed Revision:**
```
Homescan provides a cross-check. It records actual payment choices (not imputed), and its covariance estimates are similar to MRI, suggesting imputation bias is small.
```

**Why better:** Period instead of colon; both clauses are independent.

### - [ ] Lines 173-174: Split two consecutive colon constructions

**Comment:** Two back-to-back colon constructions in the formula interpretation passage.

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

**Why better:** Periods replace colons; avoids clustered CLAUSE: LONGER CLAUSE pattern.

### - [ ] Lines 245: Split colon construction

**Comment:** "The evidence validates the main text's 'integrated' market assumption: consumers with different payment preferences..."

**Original:**
```
The evidence validates the main text's ``integrated'' market assumption: consumers with different payment preferences shop at overlapping merchants where uniform pricing passes through the average cost of all accepted payment methods.
```

**Proposed Revision:**
```
The evidence validates the main text's ``integrated'' market assumption. Consumers with different payment preferences shop at overlapping merchants where uniform pricing passes through the average cost of all accepted payment methods.
```

**Why better:** 31-word clause after colon stands alone as a sentence.

### - [ ] Lines 252: Split colon construction

**Comment:** "The 91--96\% figure validates this assumption: sorting does not meaningfully segment the market."

**Original:**
```
The 91--96\% figure validates this assumption: sorting does not meaningfully segment the market, so policy-induced fee changes generate the cross-consumer redistribution the integrated economy framework captures.
```

**Proposed Revision:**
```
The 91--96\% figure validates this assumption. Sorting does not meaningfully segment the market, so policy-induced fee changes generate the cross-consumer redistribution the integrated economy framework captures.
```

**Why better:** Avoids colon construction; explanation stands alone.

## [appendix_reduced.tex]

### - [ ] Line 9: Throat-clearing section opener

**Comment:** "This section checks..." is meta-commentary. Replace with content that does the work.

**Original:**
```
This section checks the main specification's sensitivity and identifies the mechanism behind the debit volume decline.
```

**Proposed Revision:**
```
Two questions arise about the baseline estimates: how sensitive are they to specification choices, and what mechanism drives the debit volume decline?
```

**Why better:** Motivates rather than announces.

### - [ ] Line 110: Abstract noun subject

**Comment:** "The estimated effect comes from" uses an abstract noun as the sentence subject.

**Original:**
```
The estimated effect comes from within-bank payment switching, not bank switching or cross-subsidization through credit rewards.
```

**Proposed Revision:**
```
Consumers at affected banks switched from debit to credit rather than switching banks or responding to improved credit rewards.
```

**Why better:** Concrete actors and actions instead of abstract "effect comes from."

### - [ ] Lines 349-351: Enumerated preview sentence

**Comment:** "The results bear on whether X, whether Y, and how Z" is a mild announce-then-deliver pattern.

**Original:**
```
A second-choice survey measures substitution patterns across payment types and networks. The results bear on whether credit and debit are distinct product categories, whether higher-income consumers are more reward-sensitive, and how consumers divert across networks.
```

**Proposed Revision:**
```
A second-choice survey measures substitution patterns across payment types and networks: are credit and debit distinct product categories, are higher-income consumers more reward-sensitive, and how do consumers divert across networks?
```

**Why better:** Questions create curiosity; merging into one sentence reduces word count.

### - [ ] Lines 449-450: Double modifier

**Comment:** "actively prefer...for substantive reasons" stacks two modifiers where one suffices.

**Original:**
```
SCPC and marketing surveys show that many consumers actively prefer debit over credit for substantive reasons, not because they are unaware of credit card rewards.
```

**Proposed Revision:**
```
SCPC and marketing surveys show that many consumers prefer debit over credit as a deliberate choice, not because they are unaware of credit card rewards.
```

**Why better:** One precise phrase replaces two vague modifiers.

## [appendix_model_oa.tex]

### - [ ] Lines 41: Condense colon construction

**Comment:** The colon introduces two parallel "how..." clauses that can be stated more compactly.

**Original:**
```
Every acceptance decision hinges on the same two forces: how consumers multihome across cards and how the fees on those cards differ.
```

**Proposed Revision:**
```
Every acceptance decision hinges on consumer multihoming and fee differences across cards.
```

**Why better:** Tighter. The two forces are clear without spelling them out in parallel clauses.

### - [ ] Lines 171-174: Cut throat-clearing in microfoundation introduction

**Comment:** Four sentences of meta-commentary ("This section derives...," "The microfoundation also provides...," etc.) can be condensed to two.

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

**Why better:** Opens with the substantive claim. Removes self-referential framing.

### - [ ] Line 250: Remove "essentially"

**Comment:** Non-load-bearing hedge.

**Original:**
```
The match is essentially exact.
```

**Proposed Revision:**
```
The match is exact.
```

**Why better:** If the match is exact, say so directly.

## [appendix_estimation.tex]

### - [ ] Line 90: Restructure colon enumeration

**Comment:** The colon in "The merchant-side parameters are:" introduces a long list that runs to 35 words. Restructuring avoids the CLAUSE: LIST pattern.

**Original:**
```
The merchant-side parameters are: network marginal costs $c_j$ for five networks, merchant benefit distribution parameters ($\bar{\gamma}$, $\nu_\gamma$, $\sigma_\gamma$), and additive fee adjustments for MC Credit and AmEx, all jointly identified by the following moment conditions.
```

**Proposed Revision:**
```
The merchant-side parameters include network marginal costs $c_j$ for five networks, merchant benefit distribution parameters ($\bar{\gamma}$, $\nu_\gamma$, $\sigma_\gamma$), and additive fee adjustments for MC Credit and AmEx. These are jointly identified by the following moment conditions.
```

**Why better:** Splits a 35-word sentence into two; removes the colon-as-list-introducer pattern.

### - [ ] Lines 72-73: Flip to active voice

**Comment:** "It is pinned down by the gap" is passive. The identifying variation should be the subject.

**Original:**
```
It is pinned down by the gap between Visa's share among primary and secondary credit cards: a higher $\omega$ makes network identity matter more for the primary card, widening this gap.
```

**Proposed Revision:**
```
The gap between Visa's share among primary and secondary credit cards pins down $\omega$: a higher $\omega$ makes network identity matter more for the primary card, widening this gap.
```

**Why better:** Active voice; the identifying variation is now the grammatical subject.

### - [ ] Line 86: Split participial ending

**Comment:** "justifying the focus on dollar shares" appends a justification as a participle rather than giving it its own sentence.

**Original:**
```
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households, justifying the focus on dollar shares.
```

**Proposed Revision:**
```
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households. This justifies the focus on dollar shares.
```

**Why better:** The justification stands alone as its own claim rather than trailing as an afterthought.

## [appendix_surcharging.tex]

### - [ ] Lines 7-8: Remove throat-clearing opener

**Comment:** Meta-commentary ("This appendix asks..." / "It covers...") should be replaced with the argument itself.

**Original:**
```
This appendix asks why merchants almost never surcharge despite legal ability to do so.
It covers the legal history of surcharging rules, empirical evidence on differential pricing, and a theoretical framework for price coherence.
```

**Proposed Revision:**
```
Merchants almost never surcharge despite legal ability to do so. Three facts explain why: surcharges cannot steer consumers from card to cash, the profit loss from uniform pricing is second-order in fee dispersion, and fee differences across card networks are an order of magnitude below the cash-card gap.
```

**Why better:** Leads with the claim and argument rather than announcing section contents.

### - [ ] Lines 10-14: Drop "Second" / "Third" enumeration

**Comment:** Artificial enumeration markers without a matching "First." The framing sentence "In this extension, I show that" is also redundant.

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

**Why better:** Flowing prose reads better than incomplete enumeration. Removes redundant framing.

### - [ ] Lines 53: Ambiguous sentence structure

**Comment:** "I show merchants cannot steer consumers from card to cash when surcharging is allowed in a natural extension of the baseline model that allows surcharging" is hard to parse. "When surcharging is allowed" could modify the showing or the steering, and "allows surcharging" repeats the concept.

**Original:**
```
I show merchants cannot steer consumers from card to cash when surcharging is allowed in a natural extension of the baseline model that allows surcharging.
```

**Proposed Revision:**
```
In a natural extension of the baseline model, I allow merchants to surcharge and show they still cannot steer consumers from card to cash.
```

**Why better:** Disambiguates the sentence structure. Eliminates the redundant double mention of surcharging.

### - [ ] Lines 150-154: Tighten LLM-tagged limitations section

**Comment:** Colon construction ("The empirical relevance of this case is limited:") and "Nevertheless" transition opener.

**Original:**
```
The empirical relevance of this case is limited: the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin.
Nevertheless, the threat to surcharge could discipline network pricing even if merchants rarely exercise it---a mechanism this paper does not model.
```

**Proposed Revision:**
```
But the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows that card acceptance does increase sales at the margin, limiting the empirical relevance of this case.
The threat to surcharge could still discipline network pricing even if merchants rarely exercise it---a mechanism this paper does not model.
```

**Why better:** Removes colon construction; replaces "Nevertheless" with embedded "still"; leads with the evidence.

## [counterfactuals.tex]

### - [ ] Lines 96-99: Template enumeration of decomposition rows

**Comment:** Mechanical label-then-describe pattern for table rows. Throat-clearing opener.

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

**Why better:** Removes throat-clearing opener and redundant row labels already visible in the table.

### - [ ] Lines 148-159: Consolidate inventory-style number sequence

**Comment:** Numbers presented sequentially without each answering a "so what?"

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

**Why better:** Consolidates causal chain; embeds numbers as evidence for claims rather than listing them.

## [appendix_robustness.tex]

### - [ ] Lines 67-68: Inventory-style number reporting

**Comment:** Three counterfactual results listed in a single sentence with parenthetical baseline comparisons. Reads like a table caption.

**Original:**
```
Uncapping debit raises total welfare by \$8B (versus \$7B), the monopoly counterfactual yields \$9B (versus \$16B), and dual routing yields \$7B (versus \$8B).
```

**Proposed Revision:**
```
The other counterfactuals are qualitatively similar to baseline, with total welfare gains within \$2B of the baseline estimate for uncapping debit (\$8B versus \$7B) and dual routing (\$7B versus \$8B). The monopoly counterfactual yields smaller gains (\$9B versus \$16B) because the merged network cannot pass fee savings to consumers through lower retail prices.
```

**Why better:** Separates the "similar to baseline" results from the one that differs, and adds a mechanism for the divergent case.

### - [ ] Lines 211-212: Lead with interpretation, not raw numbers

**Comment:** The paragraph opens with raw dollar figures without foregrounding the relative scale.

**Original:**
```
Under these model assumptions, fee caps raise total welfare by \$15B (SE \$1.5B), versus \$27B at baseline (Table~\ref{tab:welfare-robustness-debit}).
```

**Proposed Revision:**
```
Fee caps raise total welfare by \$15B (SE \$1.5B), about half the baseline gain of \$27B (Table~\ref{tab:welfare-robustness-debit}).
```

**Why better:** "About half" immediately communicates scale; the reader does not need to compute 15/27.

### - [ ] Line 340: Long sentence with embedded mechanism

**Comment:** A 37-word sentence that both states the result and explains the mechanism in a trailing "because" clause.

**Original:**
```
The 120 bps cap achieves 80\% of the planner's gains (\$27 billion vs.\ \$34 billion) without directly regulating rewards, because the dominant distortion is the excessive adoption of credit cards and not network market power.
```

**Proposed Revision:**
```
The 120 bps cap achieves 80\% of the planner's gains (\$27 billion vs.\ \$34 billion) without directly regulating rewards. The dominant distortion is excessive credit card adoption, not network market power.
```

**Why better:** Two shorter sentences; the mechanism gets its own sentence and lands harder.
