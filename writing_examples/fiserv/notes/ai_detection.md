# AI Detection Review

## Critical

### introduction.tex

#### - [ ] Lines 24-25: Claims overshooting evidence — "no longer sufficient to determine" `Critical`

**Comment:** The phrase "average fee differences are no longer sufficient to determine redistribution" reads as a strong logical claim ("determine"), but the paper's evidence is empirical, not a formal impossibility proof. This overshoots the evidence.

**Original:**
```
If consumers using different payment methods sort into different merchants, or if merchants face heterogeneous fees, then average fee differences are no longer sufficient to determine redistribution.
```

**Proposed Revision:**
```
If consumers using different payment methods sort into different merchants, or if merchants face heterogeneous fees, then average fee differences misstate redistribution.
```

**Why better:** "Misstate" is direct and accurate without implying a formal sufficiency result the paper does not prove.

#### - [ ] Lines 111-112: Claims overshooting evidence — "the networks do so in a way that moderates" `Critical`

**Comment:** Attributing intentional moderation to Visa/Mastercard's pricing overshoots the evidence. The paper documents the pattern but does not identify the networks' intent. "Do so in a way that moderates" implies strategic design when the evidence is descriptive.

**Original:**
```
Even though fee heterogeneity suggests that Visa and Mastercard exert market power over merchants, the networks do so in a way that moderates the amount of redistribution in the payment system.
```

**Proposed Revision:**
```
Fee heterogeneity suggests that Visa and Mastercard exert market power over merchants, but the resulting fee structure moderates the amount of redistribution in the payment system.
```

**Why better:** Attributes the moderation to the fee structure rather than implying intentional network behavior, matching the descriptive evidence.

## High

### results.tex

#### - [ ] Line 218-219: "Moreover" transition opener + AI-typical incentive argument `High`

**Comment:** "Moreover, because all consumers face the same prices regardless of payment method, consumers have incentives to adopt the most expensive card offering the most generous rewards." Uses a sentence-initial "Moreover" (Part A transition tell). The sentence also introduces a new argument (adoption incentives) as an afterthought rather than developing it.

**Original:**
```
Moreover, because all consumers face the same prices regardless of payment method, consumers have incentives to adopt the most expensive card offering the most generous rewards.
```

**Proposed Revision:**
```
Because all consumers face the same prices regardless of payment method, each consumer has an incentive to adopt the card with the most generous rewards.
```

**Why better:** Removes "Moreover" transition. Simplifies "the most expensive card offering the most generous rewards" to focus on what matters to the consumer (rewards).

### introduction.tex

#### - [ ] Lines 85-90: Long sentence with stacked qualifications `High`

**Comment:** Lines 88-90 contain a single sentence of approximately 55 words with multiple nested qualifications ("remains valid even when," "avoids the need to," "allowing us to," "without imposing"). This reads as an LLM-generated sentence trying to cover all caveats at once.

**Original:**
```
Importantly, this approach avoids the need to estimate a full demand system or explicitly model strategic interactions among firms, allowing us to map observed heterogeneity directly into redistribution without imposing strong functional-form assumptions on demand.
```

**Proposed Revision:**
```
This approach bypasses estimating a full demand system or modeling strategic interactions among firms. It maps observed heterogeneity directly into redistribution without strong functional-form assumptions on demand.
```

**Why better:** Splits into two shorter sentences. Removes "Importantly" (transition opener) and "avoids the need to" (padding).

#### - [ ] Lines 112: Padding phrase — "highlighting how" `High`

**Comment:** "Highlighting how equilibrium pricing both reflects and mitigates cross-subsidization" is a sentence-final padding phrase that restates the point already made. The "both reflects and mitigates" construction is also AI-typical balanced phrasing.

**Original:**
```
These sector and negotiated discounts lead to a progressive redistribution of approximately \$\absinput{cash_regdebit_firm} billion per year to cash and regulated debit card users, thereby attenuating the overall transfer, highlighting how equilibrium pricing both reflects and mitigates cross-subsidization.
```

**Proposed Revision:**
```
These sector and negotiated discounts lead to a progressive redistribution of approximately \$\absinput{cash_regdebit_firm} billion per year to cash and regulated debit card users, attenuating the overall transfer.
```

**Why better:** Cuts the trailing restatement. The point about equilibrium pricing is already established by the preceding sentences.

#### - [ ] Line 90: "Importantly" transition opener `High`

**Comment:** "Importantly," at sentence start is a classic AI transition opener flagged in the pattern reference.

**Original:**
```
Importantly, this approach avoids the need to estimate a full demand system or explicitly model strategic interactions among firms, allowing us to map observed heterogeneity directly into redistribution without imposing strong functional-form assumptions on demand.
```

**Proposed Revision:**
```
(See revision above — merged with the long sentence fix at lines 85-90.)
```

**Why better:** Covered by the combined fix above.

#### - [ ] Lines 36-41: Inventory-style numbers `High`

**Comment:** Lines 36-41 present a sequence of dollar figures and percentage comparisons. The government program comparisons (SNAP, EITC, unemployment insurance) and financial market comparisons serve a "so what?" purpose, but the passage reads as a list of numbers rather than building an argument.

**Original:**
```
Overall, cash users pay the equivalent of \absinput{effective_tax}\% higher sales taxes than premium credit card users.
Because credit card use increases with income, this represents a \$\absinput{cap_high_income_loss_dollars} billion annual transfer from low- and middle-income households earning less than \$150,000 in annual income to higher-income households.
These transfers are economically significant, comparable in size (but opposite in direction) to major government programs such as SNAP (\$120bn), the Earned Income Tax Credit (\$57bn), and unemployment insurance (\$40bn).
```

**Proposed Revision:**
```
Cash users pay the equivalent of \absinput{effective_tax}\% higher sales taxes than premium credit card users.
Because credit card use increases with income, interchange fees transfer \$\absinput{cap_high_income_loss_dollars} billion annually from households earning less than \$150,000 to higher-income households --- comparable in magnitude to SNAP (\$120bn), the Earned Income Tax Credit (\$57bn), and unemployment insurance (\$40bn), but flowing in the opposite direction.
```

**Why better:** Tightens the inventory by folding the comparison into the claim sentence. Removes "Overall" opener and "These transfers are economically significant" padding.

### payment_costs.tex

#### - [ ] Lines 200-201: "Moreover" transition + paragraph-ending summary restatement `High`

**Comment:** The final paragraph of the section uses "Moreover" as a transition (AI-typical) and restates the section's three findings in summary form. The sentence "Moreover, at the merchants where consumers with different payment preferences overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating the magnitude of redistribution" is a restatement of facts already documented in the section.

**Original:**
```
Thus, dispersion in payment composition across merchants limits the extent of cross-subsidization. Moreover, at the merchants where consumers with different payment preferences overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating the magnitude of redistribution.
```

**Proposed Revision:**
```
Dispersion in payment composition across merchants limits cross-subsidization. Where consumers with different payment preferences do overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating redistribution.
```

**Why better:** Removes "Moreover" and "Thus." The logical connection is clear without signpost words.

### conclusion.tex

#### - [ ] Lines 12-16: Stacked claims with "More broadly" transition and trailing restatement `High`

**Comment:** Line 15 uses "More broadly" (flagged AI transition). Lines 15-16 contain "these results highlight how interchange policies affect not only banks and card networks, but also prices, market competition, and the distribution of economic surplus across consumers," which uses "highlight" (AI vocabulary), "not only... but also" (AI template structure), and serves as a paragraph-ending restatement that generalizes beyond the paper's evidence.

**Original:**
```
These trends illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
More broadly, these results highlight how interchange policies affect not only banks and card networks, but also prices, market competition, and the distribution of economic surplus across consumers.
```

**Proposed Revision:**
```
Network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
```

**Why better:** The "More broadly" sentence is pure padding that generalizes beyond the paper's specific findings. The prior sentence already makes the point. Cutting the final sentence tightens the conclusion.

### appendix_durbin.tex

#### - [ ] Lines 11: Stacked hedges `High`

**Comment:** "These findings help support our assumption" stacks two hedges ("help" + "support") and the sentence then adds "complement the findings from" as additional padding. Two claims in one sentence, both hedged.

**Original:**
```
These findings help support our assumption that firms pass on interchange fees into retail prices and complement the findings from \citet{Amiti.etal2019} that sector-level shocks like interchange fees are passed into retail prices.
```

**Proposed Revision:**
```
These estimates provide direct evidence that interchange fees pass through to retail prices, consistent with \citet{Amiti.etal2019}.
```

**Why better:** Removes the stacked "help support our assumption" hedge and the redundant restatement of the Amiti et al. finding.

## Medium

### redistribution.tex

#### - [ ] Lines 8-10: Meta-commentary / throat-clearing opening `Medium`

**Comment:** The section opens with three sentences describing what the section will do ("In this section, we describe..."; "These approaches allow us to..."; "We also evaluate...") rather than doing it. This is a classic meta-commentary pattern (Part B) and throat-clearing (Principle 8). Academic sections should begin with content.

**Original:**
```
In this section, we describe the development of two related approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model.
These approaches allow us to quantify how redistribution changes when accounting for consumer sorting and merchant fee heterogeneity.
We also evaluate different regulatory counterfactuals: European-style regulation and the consequences of the Durbin Amendment.
```

**Proposed Revision:**
```
We develop two approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model.
Both approaches quantify how redistribution changes when accounting for consumer sorting and merchant fee heterogeneity, and we apply them to evaluate European-style regulation and the Durbin Amendment.
```

**Why better:** Removes "In this section, we describe the development of" throat-clearing and collapses three sentences into two that do work rather than announce work. Eliminates the colon construction in line 10.

#### - [ ] Lines 8, 10: Colon constructions `Medium`

**Comment:** Two CLAUSE: LONGER CLAUSE constructions in the opening paragraph. Line 8: "two related approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model." Line 10: "different regulatory counterfactuals: European-style regulation and the consequences of the Durbin Amendment." While colons introducing lists are standard, the density of two in three sentences creates an AI-typical cadence.

**Original:**
```
In this section, we describe the development of two related approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model.
...
We also evaluate different regulatory counterfactuals: European-style regulation and the consequences of the Durbin Amendment.
```

**Proposed Revision:**
```
We develop two approaches to evaluate the redistributive consequences of interchange fees, a sufficient statistic approach and a structural model.
...
We also evaluate European-style regulation and the consequences of the Durbin Amendment.
```

**Why better:** Reduces colon density. The second revision also cuts the padding phrase "different regulatory counterfactuals" since the specific items already convey the idea.

#### - [ ] Lines 155-158: Paragraph opening with template structure `Medium`

**Comment:** "The structural model serves two purposes. First, ... Second, ..." is an enumerated-purposes template that reads as formulaic (Part A: "One is... A second is..."). The numbered structure is acceptable when needed but the framing sentence "serves two purposes" is padding.

**Original:**
```
The structural model serves two purposes. First, it allows us to assess whether the sufficient statistic's first-order approximation introduces a meaningful error by omitting second-order utility losses from consumer reallocation.
Second, it enables us to evaluate how imperfect pass-through, arising from strategic complementarities in merchant pricing, would affect our distributional conclusions, providing a disciplined way to quantify departures from the baseline assumptions.
```

**Proposed Revision:**
```
The structural model allows us to assess whether the sufficient statistic's first-order approximation introduces meaningful error by omitting second-order utility losses from consumer reallocation.
It also lets us evaluate how imperfect pass-through from strategic complementarities in merchant pricing would affect our distributional conclusions.
```

**Why better:** Removes the enumeration frame ("serves two purposes. First, ... Second, ...") and delivers both points directly. Also trims padding at the end of the second sentence.

#### - [ ] Line 12: Long paragraph (~130 words, 8 sentences) with repetitive phrasing `Medium`

**Comment:** The paragraph repeats "sufficient statistic approach" three times and "structural model" twice. The sentence "This is a feature because it avoids strong functional-form assumptions" is padding that restates what "imposes minimal structure" already conveys.

**Original:**
```
This is a feature because it avoids strong functional-form assumptions; however, without additional structure governing merchant competition, we must make an assumption about how interchange fees pass through to prices.
```

**Proposed Revision:**
```
Minimal structure avoids strong functional-form assumptions but requires an assumption about how interchange fees pass through to prices.
```

**Why better:** Cuts the self-referential "This is a feature because" and tightens the contrast.

#### - [ ] Line 167-168: Sentence-level repetition / over-explanation `Medium`

**Comment:** "Consumers with different payment methods have different tastes for merchants, and this heterogeneity matches the observed variation in the composition of payments across merchants, linking the model directly to the empirical dispersion documented in the data." This sentence restates what the preceding sentence already says ("allows for rich heterogeneity in shopping patterns across payment methods") and uses a bare "this" demonstrative.

**Original:**
```
We model consumer demand using a nested CES structure that allows for rich heterogeneity in shopping patterns across payment methods.
Consumers with different payment methods have different tastes for merchants, and this heterogeneity matches the observed variation in the composition of payments across merchants, linking the model directly to the empirical dispersion documented in the data.
```

**Proposed Revision:**
```
We model consumer demand using a nested CES structure that allows for rich heterogeneity in shopping patterns across payment methods, matching the observed variation in payment composition across merchants.
```

**Why better:** Collapses two sentences into one by eliminating the restatement. Removes bare "this" and the padding phrase "linking the model directly to the empirical dispersion documented in the data."

### results.tex

#### - [ ] Lines 6-14: Three-paragraph opening with enumerated previews `Medium`

**Comment:** The section opens with three paragraphs that each preview a result ("We first quantify..."; "We next use a counterfactual to show..."; "Finally, we show..."). This First/Next/Finally structure is a template pattern (Part A). Results sections in economics papers typically proceed to the results without extensive roadmapping.

**Original:**
```
We first quantify the distributional consequences of interchange fees by measuring redistribution relative to a zero-interchange benchmark, which corresponds to the regulatory environment in the E.U.
We also assess the degree to which the resulting redistribution is progressive or regressive across the income distribution.

We next use a counterfactual to show that the Durbin Amendment, the major regulation of U.S. interchange fees, results in regressive redistribution across consumers, benefiting higher-income households at the expense of lower-income ones.
...

Finally, we show that the largest losers from the rise of premiumization in the credit card market are debit card users, not cash users, because they frequently shop at the same merchants as premium card users.
```

**Proposed Revision:**
```
We quantify redistribution under several scenarios using the sufficient-statistics approach.
Our main exercise measures redistribution relative to a zero-interchange benchmark, corresponding to the E.U. regulatory environment.
```

**Why better:** Collapses three preview paragraphs into a concise two-sentence opening. The individual subsections already announce their content; the road map is redundant.

#### - [ ] Lines 13-14: "This highlights" bare demonstrative + padding `Medium`

**Comment:** "This highlights how merchant-level heterogeneity shapes cross-subsidization" uses a bare "this" and the AI-vocabulary word "highlights." The sentence restates the finding from line 13 rather than adding information.

**Original:**
```
Finally, we show that the largest losers from the rise of premiumization in the credit card market are debit card users, not cash users, because they frequently shop at the same merchants as premium card users.
This highlights how merchant-level heterogeneity shapes cross-subsidization.
```

**Proposed Revision:**
```
Finally, we show that the largest losers from the rise of premiumization in the credit card market are debit card users, not cash users, because they frequently shop at the same merchants as premium card users.
```

**Why better:** Deletes the restatement sentence entirely. The mechanism (merchant-level heterogeneity) is already implicit in "they frequently shop at the same merchants."

#### - [ ] Line 26: Em-dash usage `Medium`

**Comment:** "debit card users---not just cash users---subsidize credit card rewards" uses paired em-dashes. While this is a legitimate parenthetical, em-dashes are an AI punctuation tell when alternatives exist.

**Original:**
```
Second, debit card users---not just cash users---subsidize credit card rewards.
```

**Proposed Revision:**
```
Second, debit card users, not just cash users, subsidize credit card rewards.
```

**Why better:** Commas achieve the same parenthetical effect without the em-dash pattern.

#### - [ ] Lines 56-57: Throat-clearing paragraph opener `Medium`

**Comment:** "The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs." This is meta-commentary that describes the contribution rather than delivering content.

**Original:**
```
The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs.
```

**Proposed Revision:**
```
We quantify how interchange fees transfer welfare across consumer groups.
```

**Why better:** Removes the meta-commentary frame ("The first contribution of our framework is that it allows us to") and delivers the point directly.

#### - [ ] Lines 102-105: Inventory-style numbers `Medium`

**Comment:** Four consecutive numerical comparisons listed in sequence: "$10 billion... $18 billion... $15 billion... $20 billion." This inventory pattern (Part C) reads like a table caption, not an argument. Each number would benefit from a "so what" framing.

**Original:**
```
For credit cards, the consumer losses from shrouded credit card fees are estimated at \$10 billion \citep{agarwal2015regulating,Hurst.etal2016}; transfers arising from credit card interest rates are estimated to redistribute \$18 billion from low credit score consumers to high credit score consumers \citep{Agarwal.etal2022}.
Inter-regional transfers due to the GSEs' lack of risk-based pricing amount to \$15 billion, and consumers' losses from high-fee index funds amount to \$20 billion \citep{agarwal2015regulating,Hurst.etal2016}.
```

**Proposed Revision:**
```
The interchange fee transfers we estimate exceed other well-known financial transfers: shrouded credit card fees cost consumers \$10 billion \citep{agarwal2015regulating,Hurst.etal2016}, and credit card interest rate redistribution amounts to \$18 billion \citep{Agarwal.etal2022}.
They also exceed the \$15 billion in inter-regional mortgage transfers and \$20 billion in losses from high-fee index funds \citep{agarwal2015regulating,Hurst.etal2016}.
```

**Why better:** Gives the numbers an argumentative purpose (interchange transfers exceed these benchmarks) rather than listing them as inventory. Note: this revision uses a colon, which is borderline; an alternative would be to use a period and start the list as a new sentence.

#### - [ ] Line 109: Long sentence (~65 words) `Medium`

**Comment:** "We find that ignoring these two forces inflates the estimated amount of redistribution by roughly one-third. Specifically, we examine the welfare effects of interchange fees relative to a homogeneous benchmark in which: (i) all firms have the same composition of payment methods, and (ii) all firms pay the same interchange fees for a given payment method (i.e., eliminating sectoral variation in interchange fees and negotiated rates)." The second sentence runs long with nested parenthetical enumeration.

**Original:**
```
Specifically, we examine the welfare effects of interchange fees relative to a homogeneous benchmark in which: (i) all firms have the same composition of payment methods, and (ii) all firms pay the same interchange fees for a given payment method (i.e., eliminating sectoral variation in interchange fees and negotiated rates).
```

**Proposed Revision:**
```
We compare to a homogeneous benchmark where all firms have the same payment composition and pay the same interchange fees for a given payment method, eliminating sectoral variation and negotiated rates.
```

**Why better:** Removes "Specifically" transition and the (i)/(ii) enumeration, which is an AI structural tell when only two items are listed. Cuts from ~50 words to ~30.

#### - [ ] Line 175: "These scenarios illustrate" bare demonstrative + padding `Medium`

**Comment:** "These scenarios illustrate that the balance between price and rewards pass-through fundamentally shapes distributional consequences." Uses bare "these" and the verb "illustrate" to restate what the preceding sentences already showed.

**Original:**
```
These scenarios illustrate that the balance between price and rewards pass-through fundamentally shapes distributional consequences.
```

**Proposed Revision:**
```
The balance between price and rewards pass-through shapes the distributional consequences.
```

**Why better:** Removes the padding frame "These scenarios illustrate that" and the hedge "fundamentally." The preceding paragraph already established this point through three concrete scenarios.

### real_effects.tex

#### - [ ] Lines 7-8: Throat-clearing opening `Medium`

**Comment:** "In this section, we show that payment costs have real effects on retail sales and prices." is a meta-commentary opener (Part B: "In this section..."). The section title already conveys this.

**Original:**
```
In this section, we show that payment costs have real effects on retail sales and prices.
The pass-through of fees into prices is essential to cross-subsidization among cash, credit, and debit users.
```

**Proposed Revision:**
```
Payment costs have real effects on retail sales and prices.
The pass-through of fees into prices is essential to cross-subsidization among cash, credit, and debit users.
```

**Why better:** Removes "In this section, we show that" throat-clearing while preserving the claim.

#### - [ ] Lines 45-46: Long sentence (~45 words) `Medium`

**Comment:** "We implement an instrumented difference-in-differences design that compares restaurants varying in their expected gains from the Durbin Amendment based on pre-regulation characteristics across areas with differential exposure to regulated banks." This sentence runs long and packs too many qualifiers.

**Original:**
```
We implement an instrumented difference-in-differences design that compares restaurants varying in their expected gains from the Durbin Amendment based on pre-regulation characteristics across areas with differential exposure to regulated banks.
```

**Proposed Revision:**
```
We implement an instrumented difference-in-differences design.
The design compares restaurants with different expected gains from the Durbin Amendment, based on pre-regulation characteristics, across areas with differential exposure to regulated banks.
```

**Why better:** Splits the long sentence at the natural break, improving readability.

### introduction.tex

#### - [ ] Line 7: Opening sentence announces topic rather than creating tension `Medium`

**Comment:** "Payment systems redistribute across consumers who choose different payment methods but shop at the same stores" is a summary-first opening. It announces the result rather than creating curiosity. For a specialized paper (Type B), this is acceptable as a framing device, but it lacks the tension that would hook a reader.

**Original:**
```
Payment systems redistribute across consumers who choose different payment methods but shop at the same stores.
```

**Proposed Revision:**
```
Consumers who pay cash, swipe a debit card, or tap a premium credit card all see the same price at the register, yet each transaction imposes different costs on the merchant.
```

**Why better:** Creates tension by juxtaposing uniform prices with heterogeneous costs, inviting the reader to ask "so what happens?"

#### - [ ] Line 18: "Both views overlook" — smarmy reframing variant `Medium`

**Comment:** "Both views overlook that interchange fees primarily redistribute" uses a "the real issue is" construction. It frames prior work as missing the point, a pattern that is AI-typical when used to position the paper's contribution.

**Original:**
```
Both views overlook that interchange fees primarily redistribute consumption across consumers, and that the magnitude and direction of this redistribution depend on how consumers and merchants are matched in equilibrium.
```

**Proposed Revision:**
```
Neither view accounts for the fact that interchange fees redistribute consumption across consumers, with the magnitude and direction depending on how consumers and merchants are matched in equilibrium.
```

**Why better:** "Neither view accounts for" is a factual statement rather than a rhetorical "overlook" framing.

#### - [ ] Line 24: "More broadly" transition opener `Medium`

**Comment:** "More broadly, the existing literature treats..." is flagged as an AI-typical pivot to generalization.

**Original:**
```
More broadly, the existing literature treats the incidence of interchange fees as a representative-agent problem, abstracting from heterogeneity in both merchant characteristics and consumer sorting.
```

**Proposed Revision:**
```
The existing literature treats the incidence of interchange fees as a representative-agent problem, abstracting from heterogeneity in both merchant characteristics and consumer sorting.
```

**Why better:** Removing "More broadly" loses nothing; the sentence already generalizes.

#### - [ ] Line 25: "This abstraction is consequential" — bare demonstrative + padding `Medium`

**Comment:** "This abstraction is consequential" uses a bare demonstrative ("this") and the evaluative adjective "consequential" as a meta-commentary sentence that could be cut entirely. The following sentence already explains why.

**Original:**
```
This abstraction is consequential.
```

**Proposed Revision:**
```
(Delete this sentence. The following sentence beginning "If consumers using different payment methods..." already explains the consequence.)
```

**Why better:** Removes a meta-commentary sentence that adds no information.

#### - [ ] Line 30: "We proceed in three parts" — meta-commentary `Medium`

**Comment:** "We proceed in three parts" is a road-mapping sentence flagged under meta-commentary. The three-part enumeration that follows ("First... Second... Third...") is a template structure.

**Original:**
```
We proceed in three parts.
```

**Proposed Revision:**
```
(Delete this sentence. The "First," "Second," "Third" sentences that follow are self-explanatory.)
```

**Why better:** Removes throat-clearing. The structure is clear without announcing it.

#### - [ ] Line 34: Long sentence exceeding ~40 words `Medium`

**Comment:** The sentence beginning "This approach allows us to quantify redistribution..." runs approximately 45 words with multiple clauses connected by "and to isolate" and "under empirically plausible."

**Original:**
```
This approach allows us to quantify redistribution without estimating a full demand system, and to isolate the role of sorting and fee heterogeneity in shaping incidence, under empirically plausible pass-through assumptions that we examine in the data and in a structural model.
```

**Proposed Revision:**
```
This approach quantifies redistribution without estimating a full demand system, isolating the role of sorting and fee heterogeneity in shaping incidence. We examine the plausibility of the required pass-through assumptions in the data and in a structural model.
```

**Why better:** Splits the long sentence. Replaces "allows us to quantify" with the direct verb "quantifies."

#### - [ ] Lines 92-93: "We find that" + trailing restatement `Medium`

**Comment:** "We find that our sufficient-statistics framework closely approximates the full structural model, indicating that the key forces driving redistribution are well captured by the empirical moments we use, and suggesting that our main results are robust." The trailing participial phrases ("indicating that... and suggesting that...") restate the same point three ways.

**Original:**
```
We find that our sufficient-statistics framework closely approximates the full structural model, indicating that the key forces driving redistribution are well captured by the empirical moments we use, and suggesting that our main results are robust.
```

**Proposed Revision:**
```
The sufficient-statistics framework closely approximates the full structural model, so the empirical moments we use capture the key forces driving redistribution.
```

**Why better:** Eliminates the triple restatement. One sentence, one point.

#### - [ ] Line 128: "Our paper contributes to the literature" — formulaic opener `Medium`

**Comment:** "Our paper contributes to the literature on two-sided markets" is a standard but AI-typical formulaic lit-review opener.

**Original:**
```
Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
```

**Proposed Revision:**
```
We quantify how payment platform fees redistribute consumption among consumers, connecting to the two-sided markets literature.
```

**Why better:** Leads with the action rather than the formulaic "contributes to the literature" construction.

#### - [ ] Line 136: "Our analysis also highlights" — AI vocabulary `Medium`

**Comment:** "Highlights" is flagged AI vocabulary. Combined with "also," it reads as a transition filler.

**Original:**
```
Our analysis also highlights the redistributive potential of payment system innovations.
```

**Proposed Revision:**
```
Payment system innovations also have redistributive potential.
```

**Why better:** Removes "Our analysis highlights" padding. The sentence says the same thing in fewer words.

### institutional_setting.tex

#### - [ ] Lines 7-11: Throat-clearing opening paragraph `Medium`

**Comment:** "In this section, we outline the institutional details and describe our data" is meta-commentary. The four-sentence opening paragraph describes what the section will do rather than doing it.

**Original:**
```
In this section, we outline the institutional details and describe our data.
We explain how credit and debit card payment systems operate, focusing on key participants, costs, benefits, and transfers.
We then introduce our two primary merchant-level payment datasets from Fiserv, which allow us to observe how the types and costs of payment methods vary across merchants.
These data show which payments merchants receive and what fees they pay.
Together, these data allow us to link merchant-level payment composition and costs to redistribution across consumers.
```

**Proposed Revision:**
```
Credit and debit card payments involve three financial intermediaries between the consumer and the merchant: the issuer, the acquirer, and the card network.
```

**Why better:** Jumps straight into the institutional description. The section title already tells the reader the topic; no road map is needed.

#### - [ ] Line 24: "As a result" + summary restatement `Medium`

**Comment:** "As a result, variation in interchange fees is central to understanding cross-subsidization within the payment system" restates a point already established in the preceding sentences. This is a paragraph-ending restatement.

**Original:**
```
As a result, variation in interchange fees is central to understanding cross-subsidization within the payment system.
```

**Proposed Revision:**
```
(Delete this sentence. The preceding sentences already establish that interchange fee variation drives cross-subsidization.)
```

**Why better:** Eliminates redundant summary. The paragraph's logic is already clear.

#### - [ ] Line 42: "To the best of our knowledge, we are the first to" — formulaic claim `Medium`

**Comment:** "To the best of our knowledge, we are the first to use data on the actual fees merchants pay" is a formulaic novelty claim with a hedged preamble. The hedge "to the best of our knowledge" is standard but reads as a stacked qualification.

**Original:**
```
While public schedules illustrate potential fee variation, to the best of our knowledge, we are the first to use data on the actual fees merchants pay to quantify how this heterogeneity shapes redistribution.
```

**Proposed Revision:**
```
While public schedules illustrate potential fee variation, we are the first to use data on actual merchant fees to quantify how fee heterogeneity shapes redistribution.
```

**Why better:** Removes the non-load-bearing hedge. If the claim is wrong, a referee will say so regardless of the caveat.

#### - [ ] Line 46: "A key feature of these data is that" — throat-clearing `Medium`

**Comment:** "A key feature of these data is that we observe both the composition and price of transactions at the merchant level" uses a "key feature is that" construction, which announces importance rather than demonstrating it.

**Original:**
```
A key feature of these data is that we observe both the composition and price of transactions at the merchant level, which is critical for measuring heterogeneity in payment costs and its implications for redistribution.
```

**Proposed Revision:**
```
We observe both the composition and price of transactions at the merchant level, which is necessary for measuring heterogeneity in payment costs and its redistributive implications.
```

**Why better:** Removes the "key feature is that" frame and "critical" (AI vocabulary). Leads with what the data contain.

#### - [ ] Line 52: "Making it an ideal source for studying" — evaluative padding `Medium`

**Comment:** "Making it an ideal source for studying" is self-promotional padding.

**Original:**
```
Fiserv is a merchant acquirer responsible for processing transactions and calculating the interchange fees owed to issuers, making it an ideal source for studying how the composition and cost of payments vary across merchants.
```

**Proposed Revision:**
```
Fiserv processes transactions and calculates the interchange fees owed to issuers, so the data capture the composition and cost of payments at the merchant level.
```

**Why better:** States what the data contain rather than evaluating the data source as "ideal."

#### - [ ] Line 70: "While the Clover sample skews toward smaller merchants, it provides valuable insight" — hedge + evaluative `Medium`

**Comment:** "Provides valuable insight" is evaluative padding. Combined with "While... skews toward," this reads as a defensive qualification.

**Original:**
```
While the Clover sample skews toward smaller merchants, it provides valuable insight into cash usage and variation in payment composition that informs redistribution, particularly for merchants where cash remains a meaningful share of transactions.
```

**Proposed Revision:**
```
The Clover sample skews toward smaller merchants but captures cash usage and payment composition variation at merchants where cash remains a meaningful share of transactions.
```

**Why better:** Drops "provides valuable insight" (evaluative) and tightens the concession.

### payment_costs.tex

#### - [ ] Lines 7-11: Opening paragraph with meta-commentary `Medium`

**Comment:** "In this section, we document novel facts about the variation in payment composition and costs across merchants" is throat-clearing. The paragraph then previews two forces, which is standard for a section opener in economics, but "novel facts" is self-promotional.

**Original:**
```
In this section, we document novel facts about the variation in payment composition and costs across merchants.
```

**Proposed Revision:**
```
We document the variation in payment composition and costs across merchants.
```

**Why better:** Removes "In this section" and "novel facts" (self-promotional padding). The section title already announces the topic.

#### - [ ] Line 23: Long sentence with trailing participial — "highlighting the concentration" `Medium`

**Comment:** "Highlighting the concentration of cash usage among a subset of merchants" is a trailing participial that restates what the numbers already show.

**Original:**
```
In contrast, for the one-third of merchants for which cash represents at least 2\% of sales, it accounts for more than 30\% of their transactions---and for merchants in the 90th percentile, over 80\%, highlighting the concentration of cash usage among a subset of merchants.
```

**Proposed Revision:**
```
For the one-third of merchants where cash represents at least 2\% of sales, it accounts for more than 30\% of transactions, and over 80\% at the 90th percentile.
```

**Why better:** Cuts "In contrast" transition and "highlighting" padding. The numbers demonstrate concentration without meta-commentary.

#### - [ ] Line 42: "Again limiting the potential for cross-subsidization, as many merchants are dominated by a single payment type" — restatement `Medium`

**Comment:** Trailing restatement that repeats the point made in the preceding sentence about bimodality.

**Original:**
```
The bimodal nature of the distribution suggests that variation in card payment mix is significant at the merchant level---again limiting the potential for cross-subsidization, as many merchants are dominated by a single payment type.
```

**Proposed Revision:**
```
The bimodal distribution of card payment mix at the merchant level limits cross-subsidization, because many merchants are dominated by a single payment type.
```

**Why better:** Removes "again" (which signals repetition) and the em-dash. Tightens to one direct claim.

#### - [ ] Line 66: Long sentence exceeding 40 words with trailing participial `Medium`

**Comment:** The sentence at line 66 runs approximately 55 words and ends with "linking payment choice directly to the distribution of rewards and fees," another trailing restatement.

**Original:**
```
Figure \ref{fig:payment_income} illustrates the key pattern: at low levels of income, consumers prefer using debit cards and cash, while at higher levels of income, consumers increasingly use credit cards, and in particular, premium credit cards with higher interchange fees, linking payment choice directly to the distribution of rewards and fees.
```

**Proposed Revision:**
```
Figure \ref{fig:payment_income} shows that low-income consumers prefer debit cards and cash, while higher-income consumers increasingly use credit cards, especially premium cards with higher interchange fees.
```

**Why better:** Removes "illustrates the key pattern:" (colon construction), the trailing "linking" participial, and trims to under 30 words.

#### - [ ] Line 105: "Mirroring the distribution of rewards tied to high-fee payment instruments" — trailing restatement `Medium`

**Comment:** Another trailing participial ("mirroring") that restates what the sentence already established.

**Original:**
```
Reinforcing the individual-level income patterns we showed earlier, credit card usage is more prevalent in wealthier, older, more educated, and more urban areas, mirroring the distribution of rewards tied to high-fee payment instruments.
```

**Proposed Revision:**
```
Credit card usage is more prevalent in wealthier, older, more educated, and more urban areas, consistent with the individual-level income patterns documented above.
```

**Why better:** Cuts both the "Reinforcing" opener and the "mirroring" trail. One reference to the pattern is sufficient.

#### - [ ] Line 113: "But this average masks considerable variation" — formulaic `Medium`

**Comment:** "But this average masks considerable variation" is a stock phrase in empirical economics that borders on cliche.

**Original:**
```
On average, merchants pay around \absinput{icg_summary_mean}\% of sales to accept cards, but this average masks considerable variation.
```

**Proposed Revision:**
```
Merchants pay around \absinput{icg_summary_mean}\% of sales on average to accept cards, though fees range from \absinput{icg_summary_p10}\% at the 10th percentile to \absinput{icg_summary_p90}\% at the 90th.
```

**Why better:** Replaces the cliche with the actual numbers, letting the data demonstrate the variation.

#### - [ ] Line 170: "Reflects Visa's and Mastercard's attempts to balance" — imputing motive `Medium`

**Comment:** Attributes strategic intent ("attempts to balance merchant acceptance versus issuer incentives, trading off participation on both sides of the platform") based on observed fee patterns. The evidence is descriptive.

**Original:**
```
Fee variation across sectors reflects Visa's and Mastercard's attempts to balance merchant acceptance versus issuer incentives, trading off participation on both sides of the platform.
```

**Proposed Revision:**
```
Fee variation across sectors is consistent with networks balancing merchant acceptance against issuer incentives.
```

**Why better:** "Is consistent with" matches the descriptive evidence better than "reflects attempts to balance."

### conclusion.tex

#### - [ ] Lines 11-12: "Our analysis of policy counterfactuals reveals that" — formulaic opener `Medium`

**Comment:** "Our analysis of policy counterfactuals reveals that recent changes in the payment system have had significant regressive impacts" is a meta-commentary sentence that announces what the analysis does rather than stating the finding. "Significant" is also an empty intensifier here.

**Original:**
```
Our analysis of policy counterfactuals reveals that recent changes in the payment system have had significant regressive impacts.
```

**Proposed Revision:**
```
Recent changes in the payment system have had regressive impacts.
```

**Why better:** Removes "Our analysis of policy counterfactuals reveals that" throat-clearing and the empty intensifier "significant."

#### - [ ] Line 13: "Despite being designed to help consumers" — template structure `Medium`

**Comment:** "Despite being designed to help consumers, primarily benefited credit card users rather than the intended debit card users" uses a "despite" concession structure that is common in AI writing. The contrast is valid but could be stated more directly.

**Original:**
```
The Durbin Amendment, despite being designed to help consumers, primarily benefited credit card users rather than the intended debit card users, creating regressive wealth transfers from middle-income to high-income households.
```

**Proposed Revision:**
```
The Durbin Amendment primarily benefited credit card users rather than the intended debit card users, creating regressive transfers from middle-income to high-income households.
```

**Why better:** Removes the "despite" parenthetical. The contrast between "intended debit card users" and "primarily benefited credit card users" already conveys the irony.

### appendix_theory.tex

#### - [ ] Lines 7: Throat-clearing opening `Medium`

**Comment:** The opening sentence is meta-commentary describing what the appendix will do rather than doing it. "This appendix formally demonstrates that" is a classic throat-clearing pattern (Principle 8).

**Original:**
```
This appendix formally demonstrates that the sufficient statistic in Equation~\ref{eq:sufficient-stat-formula} captures the first-order welfare effects of interchange fees, even when consumers are allowed to change their consumption in response to prices.
```

**Proposed Revision:**
```
The sufficient statistic in Equation~\ref{eq:sufficient-stat-formula} captures the first-order welfare effects of interchange fees even when consumers adjust consumption in response to prices.
```

**Why better:** Removes "This appendix formally demonstrates that" throat-clearing. The section title already tells the reader this is the theory appendix with proofs.

---

#### - [ ] Lines 59: Throat-clearing paragraph opening `Medium`

**Comment:** "We establish two preliminary results used throughout the proofs" is meta-commentary announcing what comes next rather than beginning the content.

**Original:**
```
We establish two preliminary results used throughout the proofs.
```

**Proposed Revision:**
```
Two identities simplify the proofs below.
```

**Why better:** Shorter, less formulaic. Removes the meta-commentary pattern.

---

#### - [ ] Lines 97-98: Throat-clearing before lemma `Medium`

**Comment:** "The following lemma characterizes the rewards that consumers receive from card networks" describes what the next object is, rather than letting the lemma speak for itself. The lemma title already says "Rewards Approximation."

**Original:**
```
The following lemma characterizes the rewards that consumers receive from card networks.
```

**Proposed Revision:**
```
[Delete sentence. The lemma title ``Rewards Approximation'' is sufficient.]
```

**Why better:** The lemma statement immediately follows. The sentence is pure throat-clearing.

---

#### - [ ] Lines 115-116: Throat-clearing before lemma `Medium`

**Comment:** Same pattern as line 98. "The following lemma shows that..." restates what the lemma title and statement already convey.

**Original:**
```
The following lemma shows that composition feedback is second-order, so prices respond approximately one-for-one to direct fee changes.
```

**Proposed Revision:**
```
Composition feedback is second-order, so prices respond approximately one-for-one to direct fee changes.
```

**Why better:** Removes "The following lemma shows that" while preserving the economic intuition that motivates the formal result.

---

#### - [ ] Lines 143: Em-dash usage `Medium`

**Comment:** Em-dash used as punctuation connector. Part A flags em-dash overuse.

**Original:**
```
Combined with $\|F\| = O(\tau_{\max})$ from Lemma~\ref{lem:F-bound}, the income feedback term $FG\,dy$ is $O(\tau_{\max}^2)$---second-order in fees.
```

**Proposed Revision:**
```
Combined with $\|F\| = O(\tau_{\max})$ from Lemma~\ref{lem:F-bound}, the income feedback term $FG\,dy$ is $O(\tau_{\max}^2)$, which is second-order in fees.
```

**Why better:** Replaces em-dash with a relative clause.

---

#### - [ ] Lines 150: Bare "This" + meta-commentary `Medium`

**Comment:** "This justifies the sufficient statistic's focus on mechanical effects" uses a bare "This" and is meta-commentary explaining the motivation rather than stating the result.

**Original:**
```
This justifies the sufficient statistic's focus on mechanical effects, as we do not need to solve for the full general equilibrium of prices and compositions.
```

**Proposed Revision:**
```
The sufficient statistic therefore needs only mechanical effects, not the full general equilibrium of prices and compositions.
```

**Why better:** Removes bare "This" and the meta-commentary verb "justifies." States the implication directly.

---

### appendix_data.tex

#### - [ ] Lines 7: Long sentence with meta-commentary + colon construction `Medium`

**Comment:** The opening sentence is 47 words, includes throat-clearing ("This section describes the cleaning procedures applied to...that form the backbone of our empirical analysis"), and uses a CLAUSE: LONGER CLAUSE colon construction to introduce the numbered list.

**Original:**
```
This section describes the cleaning procedures applied to five key datasets that form the backbone of our empirical analysis: (1) the aggregate time series, (2) the Clover merchant data, (3) the merchant cross-section from the settlement dataset, (4) the Diary of Consumer Payment Choice, and (5) the MRI survey data.
```

**Proposed Revision:**
```
We clean five datasets: the aggregate time series, the Clover merchant data, the settlement merchant cross-section, the Diary of Consumer Payment Choice (DCPC), and the MRI survey.
```

**Why better:** Removes "This section describes the cleaning procedures applied to...that form the backbone of our empirical analysis" throat-clearing. Cuts from 47 words to 26. The colon here is retained because it introduces a genuine list, which is standard.

---

#### - [ ] Lines 52-53: Two-sentence meta-commentary opening with bare "This" `Medium`

**Comment:** Lines 52-53 open the subsection with meta-commentary: "We use two consumer survey datasets to analyze..." followed by "This allows us to move beyond..." The second sentence uses a bare "This" demonstrative.

**Original:**
```
We use two consumer survey datasets to analyze household payment preferences and card ownership patterns.
This allows us to move beyond redistribution across consumers of different payment methods and instead study how interchange fees redistribute across households with different income levels.
```

**Proposed Revision:**
```
Two consumer surveys link payment preferences to household income, letting us measure redistribution across income levels rather than just across payment methods.
```

**Why better:** Collapses two sentences of meta-commentary into one direct statement. Fixes bare "This" demonstrative. Cuts from 42 words to 24.

---

#### - [ ] Lines 88-89: Padding restatement with bare "This" `Medium`

**Comment:** "This re-weighting preserves the correlation between income and payment preferences observed in the surveys while ensuring that the overall payment method shares align with the settlement data" restates the preceding sentence and uses a bare "This."

**Original:**
```
This re-weighting preserves the correlation between income and payment preferences observed in the surveys while ensuring that the overall payment method shares align with the settlement data.
```

**Proposed Revision:**
```
The re-weighting preserves within-bin correlations between income and payment preferences while matching aggregate shares to the settlement data.
```

**Why better:** Fixes bare "This," tightens the restatement.

---

#### - [ ] Lines 98: Over-explanation of Nilson Report `Medium`

**Comment:** "a leading industry trade publication that compiles payment statistics across the U.S. payment system" lectures the reader about the Nilson Report. Readers of this paper know what it is (Principle 9: no lecturing experts).

**Original:**
```
To assess the external validity of our datasets, we compare key metrics from the Fiserv data against independent measures from the Nilson Report, a leading industry trade publication that compiles payment statistics across the U.S. payment system.
```

**Proposed Revision:**
```
We validate the Fiserv data against independent benchmarks from the Nilson Report.
```

**Why better:** Removes the over-explanation and the throat-clearing opener "To assess the external validity of our datasets."

---

### appendix_cash_model.tex

#### - [ ] Lines 8-10: Three-sentence throat-clearing opening with AI vocabulary `Medium`

**Comment:** Lines 8-10 open the section with three largely redundant sentences. "The Clover dataset sheds light on..." uses flagged AI vocabulary ("sheds light on," Part B). The section title already says "Cash Extrapolation Model: From Clover to Settlement."

**Original:**
```
The Clover dataset sheds light on the distribution of cash usage across merchants, which is not directly observable in the settlement dataset.
However, Clover merchants are not representative of the composition of the broader economy.
We therefore build a model to extrapolate cash usage from Clover to the broader settlement sample.
```

**Proposed Revision:**
```
Cash usage is unobserved in the settlement data. Because Clover merchants differ from the broader economy in size and sector composition, we build a predictive model rather than applying Clover averages directly.
```

**Why better:** Collapses three sentences into two. Removes "sheds light on" (AI vocabulary) and eliminates redundancy with the section title.

---

#### - [ ] Lines 15: Restatement of section title `Medium`

**Comment:** "We use a two-part model to extrapolate cash usage from Clover to the broader settlement sample" repeats what was just stated and what appears in the section title.

**Original:**
```
We use a two-part model to extrapolate cash usage from Clover to the broader settlement sample.
```

**Proposed Revision:**
```
The model has two parts:
```

**Why better:** Removes redundancy. The reader already knows the goal.

---

#### - [ ] Lines 30-31: Self-congratulatory framing + restatement `Medium`

**Comment:** Two sentences that both announce the model works well before showing evidence: "We find that our two-stage approach effectively captures..." and "The resulting model matches key features..." Near-restatements of each other.

**Original:**
```
We find that our two-stage approach effectively captures the variation in cash usage across merchants in the Clover data.
The resulting model matches key features of the distribution of cash use in the Clover data and is consistent with several pieces of external evidence.
```

**Proposed Revision:**
```
The two-stage model fits the Clover data well and is consistent with external benchmarks.
```

**Why better:** Collapses two redundant sentences into one. Removes "We find that" and "effectively captures" padding.

---

#### - [ ] Lines 131: Paragraph-ending self-validation `Medium`

**Comment:** "validating that the model captures the relevant variation in cash usage" is a self-congratulatory restatement tacked onto a sentence that already says the figure "shows the fit."

**Original:**
```
Figure~\ref{fig:condl_distribution_fit} shows the fit of the predicted conditional cash share distribution to the actual distribution in the Clover data, validating that the model captures the relevant variation in cash usage.
```

**Proposed Revision:**
```
Figure~\ref{fig:condl_distribution_fit} compares the predicted and actual conditional cash share distributions in the Clover data.
```

**Why better:** Removes the self-validating clause. The figure speaks for itself.

---

#### - [ ] Lines 145-146: "It is important that" padding `Medium`

**Comment:** "Therefore, it is important that our cash extrapolation model accurately captures the overall level of cash usage in the economy and its variation across merchants" is padding that restates the preceding sentence about relying on second moments.

**Original:**
```
Therefore, it is important that our cash extrapolation model accurately captures the overall level of cash usage in the economy and its variation across merchants.
```

**Proposed Revision:**
```
Accurate prediction of both the level and cross-merchant variation in cash usage is therefore essential.
```

**Why better:** Removes "it is important that our cash extrapolation model" padding while preserving the point.

---

#### - [ ] Lines 149: "We find that" self-congratulatory opener `Medium`

**Comment:** "We find that our model accurately recovers both the overall level of cash usage and its variation" is self-congratulatory framing before presenting the evidence.

**Original:**
```
We find that our model accurately recovers both the overall level of cash usage and its variation across merchants in the settlement data.
```

**Proposed Revision:**
```
The model matches both the level and dispersion of cash usage in the settlement data.
```

**Why better:** Removes "We find that our model accurately recovers" throat-clearing.

---

### appendix_structural.tex

#### - [ ] Lines 7-9: Three-sentence throat-clearing opening `Medium`

**Comment:** The first three lines are pure meta-commentary: "This appendix provides technical details for... The main text presents... This appendix contains..." Road-mapping that the section title already conveys.

**Original:**
```
This appendix provides technical details for the structural model presented in Section \ref{sec:redistribution}.
The main text presents the model specification, calibration strategy, and welfare comparison.
This appendix contains the calibration goodness-of-fit diagnostics and detailed parameter values.
```

**Proposed Revision:**
```
[Delete paragraph. The section title ``Technical Details for Structural Model and Parametric Bootstrap'' already conveys the scope.]
```

**Why better:** Three sentences of pure meta-commentary. The section title and subsection headings are sufficient.

---

#### - [ ] Lines 60-61: Self-validating restatement `Medium`

**Comment:** "The close alignment between model-generated moments (y-axis) and data moments (x-axis) confirms that the calibration captures the observed covariance structure of payment methods across merchants" uses "confirms" to restate what the figure already shows.

**Original:**
```
The close alignment between model-generated moments (y-axis) and data moments (x-axis) confirms that the calibration captures the observed covariance structure of payment methods across merchants.
```

**Proposed Revision:**
```
Model-generated moments closely track data moments across sectors.
```

**Why better:** States the observation without self-validating commentary. The reader draws conclusions from the figure.

---

#### - [ ] Lines 63: "Together, these panels confirm" template conclusion `Medium`

**Comment:** "Together, these panels confirm that the calibrated model provides a credible quantitative laboratory for evaluating the welfare effects of interchange fee policies" is a template conclusion sentence. "Together" is an AI-typical transition (Part A: "Taken together"), "these panels" is a bare demonstrative, and "credible quantitative laboratory" is padding.

**Original:**
```
Together, these panels confirm that the calibrated model provides a credible quantitative laboratory for evaluating the welfare effects of interchange fee policies.
```

**Proposed Revision:**
```
[Delete sentence. The figures speak for themselves.]
```

**Why better:** Removes a self-congratulatory concluding sentence with an AI-typical "Together" opener.

---

#### - [ ] Lines 91: Figure note restatement `Medium`

**Comment:** The figure caption note ends with "Together, these figures provide visual evidence that the calibration is working as intended." Same "Together" template pattern as line 63, and a restatement of the figure's purpose.

**Original:**
```
Together, these figures provide visual evidence that the calibration is working as intended.
```

**Proposed Revision:**
```
[Delete sentence from caption note.]
```

**Why better:** The figures are the visual evidence. Announcing that they provide it is redundant.

---

### appendix_durbin.tex

#### - [ ] Lines 7-8: Throat-clearing opening `Medium`

**Comment:** "This appendix provides empirical evidence that small restaurants pass interchange fees through to higher retail prices" is meta-commentary. The section title already says "Causal Evidence on Interchange Fee Pass-Through."

**Original:**
```
This appendix provides empirical evidence that small restaurants pass interchange fees through to higher retail prices.
```

**Proposed Revision:**
```
Small restaurants pass interchange fees through to higher retail prices.
```

**Why better:** Removes "This appendix provides empirical evidence that" throat-clearing. States the finding directly.

---

#### - [ ] Lines 65: Colon construction with bare "this" `Medium`

**Comment:** "In practice, this is not a major issue: our first-stage F-statistics exceed 20,000" uses a CLAUSE: LONGER CLAUSE pattern and a bare "this."

**Original:**
```
In practice, this is not a major issue: our first-stage F-statistics exceed 20,000, indicating that pre-Durbin characteristics remain highly predictive of fee changes.
```

**Proposed Revision:**
```
In practice, first-stage F-statistics exceed 20,000, so pre-Durbin characteristics remain highly predictive of fee changes.
```

**Why better:** Removes the colon construction and bare "this." The F-statistic speaks for itself.

---

#### - [ ] Lines 73-74: Em-dash + bare "This" `Medium`

**Comment:** "This elasticity is large---higher than the elasticity of around $5$ found in..." uses an em-dash and bare "This."

**Original:**
```
This elasticity is large---higher than the elasticity of around $5$ found in \citet{Sullivan2024}'s study of restaurants using detailed transaction data.
```

**Proposed Revision:**
```
The implied elasticity exceeds the value of roughly 5 that \citet{Sullivan2024} estimates for restaurants using detailed transaction data.
```

**Why better:** Fixes bare "This," removes em-dash, tightens the comparison.

---

#### - [ ] Lines 82-84: Three-sentence over-explanation of proxy logic `Medium`

**Comment:** Three sentences explain why average transaction size is a price proxy. The first sentence's parenthetical "(e.g., a rise in the quality-adjusted price)" restates "decline in product quality." The third sentence elaborates the conditions under which the proxy works, which is mildly didactic.

**Original:**
```
This decline in sales could reflect either a price increase or a decline in product quality (e.g., a rise in the quality-adjusted price).
Although we do not observe the prices set by the restaurants, we do observe average transaction sizes as a proxy for price.
Average transaction size is a potential proxy for price if consumers respond to higher restaurant prices by going to a restaurant less often while ordering the same quantities for any given trip.
```

**Proposed Revision:**
```
The sales decline could reflect higher prices or lower quality.
We use average transaction size as a price proxy, which is valid if consumers adjust visit frequency rather than order size in response to price changes.
```

**Why better:** Collapses three sentences into two. Removes the parenthetical restatement and bare "This."

---

## Low

### redistribution.tex

#### - [ ] Line 61: Minor formulaic opener `Low`

**Comment:** "We can justify this pricing function in several ways." is a mild throat-clearing sentence that announces justification before providing it. The justifications that follow (lines 62-67) are well-written and could stand on their own.

**Original:**
```
We can justify this pricing function in several ways.
```

**Proposed Revision:**
```
Several features justify this pricing function.
```

**Why better:** Slightly less meta; the original is mild and could be left as-is.

#### - [ ] Line 89: "framework" used loosely `Low`

**Comment:** "We develop sufficient statistics to conduct an equilibrium welfare evaluation" is followed by "We use this framework to calculate..." The word "framework" is flagged when used loosely (Part B vocabulary), though here it refers to a specific analytical approach. Borderline.

**Original:**
```
We use this framework to calculate the welfare and redistributive effects of eliminating interchange fees in Section \ref{sec:Results}.
```

**Proposed Revision:**
```
We use these sufficient statistics to calculate the welfare and redistributive effects of eliminating interchange fees in Section \ref{sec:Results}.
```

**Why better:** More precise referent than "framework."

### results.tex

#### - [ ] Line 14: "This highlights" AI vocabulary `Low`

**Comment:** "highlights" is flagged AI vocabulary (Part B). Single instance; addressed in the Medium entry above.

#### - [ ] Line 129: "Our findings help explain" mild hedge `Low`

**Comment:** "Our findings help explain why high-income consumers may resist adopting new low-cost payment innovations" stacks "help explain" with "may resist." Two hedges in one claim.

**Original:**
```
Our findings help explain why high-income consumers may resist adopting new low-cost payment innovations, such as FedNow or central bank digital currencies: because they benefit from current reward structures, they have weak incentives to switch to low-cost alternatives.
```

**Proposed Revision:**
```
High-income consumers have weak incentives to adopt low-cost payment innovations like FedNow or central bank digital currencies because they benefit from the current reward structure.
```

**Why better:** Removes stacked hedges ("help explain why...may resist") and the colon construction. States the point directly.

#### - [ ] Line 185: "Our framework also sheds light on" AI vocabulary `Low`

**Comment:** "sheds light on" is flagged AI vocabulary (Part B).

**Original:**
```
Our framework also sheds light on the redistributive impact of the Durbin Amendment.
```

**Proposed Revision:**
```
We also quantify the redistributive impact of the Durbin Amendment.
```

**Why better:** Replaces "sheds light on" with a concrete verb.

### real_effects.tex

#### - [ ] Line 11: "Documenting... motivates our subsequent analysis" mild meta-commentary `Low`

**Comment:** "Documenting the real effects of interchange fees motivates our subsequent analysis of cross-subsidization" is forward-referencing meta-commentary. Mild, but reads as roadmapping.

**Original:**
```
Documenting the real effects of interchange fees motivates our subsequent analysis of cross-subsidization in \ref{sec:redistribution}.
```

**Proposed Revision:**
```
The real effects of interchange fees on prices motivate our analysis of cross-subsidization in \ref{sec:redistribution}.
```

**Why better:** Removes the gerund "Documenting" that makes the sentence about the act of documenting rather than the substance.

#### - [ ] Line 83: "consistent with findings in" mild hedging `Low`

**Comment:** "The pass-through of costs in this setting is consistent with findings in \citet{Amiti.etal2019} that small firms tend to pass through costs one-for-one to prices." Uses "consistent with findings in" which is mild hedging. Acceptable in context since it genuinely describes an empirical comparison.

**Original:**
```
The pass-through of costs in this setting is consistent with findings in \citet{Amiti.etal2019} that small firms tend to pass through costs one-for-one to prices.
```

**Proposed Revision:**
```
This pass-through rate matches \citet{Amiti.etal2019}'s finding that small firms pass through costs one-for-one to prices.
```

**Why better:** "Matches" is more direct than "is consistent with findings in." Also replaces bare "This" with a noun-backed phrase, though "This pass-through rate" is acceptable given the clear referent.

### introduction.tex

#### - [ ] Line 9: Em-dash usage `Low`

**Comment:** "interchange fees---the major component of acceptance costs---flow back" uses em-dashes as parenthetical markers. Single usage is acceptable in academic prose, but worth flagging for the pattern.

**Original:**
```
Since interchange fees---the major component of acceptance costs---flow back to consumers as rewards, a cross-subsidy emerges: all consumers pay higher retail prices, but the users of high-interchange-fee credit cards capture most of the rewards.
```

**Proposed Revision:**
```
Since interchange fees, the major component of acceptance costs, flow back to consumers as rewards, a cross-subsidy emerges. All consumers pay higher retail prices, but users of high-interchange-fee credit cards capture most of the rewards.
```

**Why better:** Replaces em-dashes with commas and splits the colon construction into two sentences.

#### - [ ] Line 134: "Whereas" transition opener `Low`

**Comment:** "Whereas sufficient statistics are typically used..." starts with a formal contrastive transition. Acceptable in academic prose, but flagging as it occurs in a paragraph that also uses "we show that" framing.

**Original:**
```
Whereas sufficient statistics are typically used in settings without market power to quantify the social efficiency of government policies, we show that a sufficient-statistics approach can also be applied to quantify redistribution in an industry model with imperfect competition, and in environments with rich heterogeneity across both consumers and firms.
```

**Proposed Revision:**
```
Sufficient statistics are typically used in settings without market power. We extend this approach to quantify redistribution in an industry model with imperfect competition and rich heterogeneity across consumers and firms.
```

**Why better:** Splits a long contrastive sentence into two direct statements.

#### - [ ] Line 142: "Significantly" intensifier `Low`

**Comment:** "Contrast significantly with prior work" uses "significantly" as an intensifier rather than a statistical term.

**Original:**
```
Our findings on redistribution through the payment system contrast significantly with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products.
```

**Proposed Revision:**
```
Our findings on redistribution through the payment system contrast with prior work on how unsophisticated consumers cross-subsidize sophisticated consumers when both types pool on the same financial products.
```

**Why better:** Removes the empty intensifier.

### institutional_setting.tex

#### - [ ] Line 35: "Our analysis connects" — formulaic framing `Low`

**Comment:** "Our analysis connects the level and heterogeneity of interchange fees across payment methods and merchants to redistribution across consumers" is a framing sentence that restates the paper's objective rather than advancing the argument.

**Original:**
```
Our analysis connects the level and heterogeneity of interchange fees across payment methods and merchants to redistribution across consumers.
```

**Proposed Revision:**
```
(Delete this sentence. The next sentence immediately begins the substantive description of fee variation.)
```

**Why better:** Removes a meta-commentary sentence that repeats what the introduction already established.

#### - [ ] Line 80: "Highly representative" — evaluative intensifier `Low`

**Comment:** "The Fiserv data are highly representative" uses an evaluative intensifier. The figures that follow demonstrate representativeness; the adjective is unnecessary.

**Original:**
```
The Fiserv data are highly representative of the broader U.S. economy in terms of sectoral coverage, firm size (based on card sales), and geographic distribution.
```

**Proposed Revision:**
```
The Fiserv data are representative of the broader U.S. economy in sectoral coverage, firm size (based on card sales), and geographic distribution.
```

**Why better:** Drops "highly" — the evidence speaks for itself.

### payment_costs.tex

#### - [ ] Line 15: "One notable feature of the data is that" — throat-clearing `Low`

**Comment:** "One notable feature" is a mild evaluative frame. The sentence works fine starting with "Payment composition varies..."

**Original:**
```
One notable feature of the data is that payment composition varies significantly across merchants.
```

**Proposed Revision:**
```
Payment composition varies significantly across merchants.
```

**Why better:** Removes the evaluative frame; the statement is stronger without it.

#### - [ ] Line 128: "These differences generate the scope for redistribution" — bare demonstrative `Low`

**Comment:** "These differences" — the referent is clear from context (fee differences across card types), so this is a low-severity flag.

**Original:**
```
These differences generate the scope for redistribution, as users of low-fee payment methods cross-subsidize the users of high-fee methods.
```

**Proposed Revision:**
```
Fee differences across card types generate the scope for redistribution, as users of low-fee methods cross-subsidize users of high-fee methods.
```

**Why better:** Makes the referent explicit.

### conclusion.tex

#### - [ ] Line 15: "These trends illustrate how" — bare demonstrative + "illustrate" `Low`

**Comment:** "These trends" is a bare demonstrative, and "illustrate how" is mild AI vocabulary. Low severity because the referent is clear from context.

**Original:**
```
These trends illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
```

**Proposed Revision:**
```
The rise of premium credit cards and Durbin's unintended effects illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
```

**Why better:** Replaces bare "these trends" with specific referent.

### appendix_theory.tex

#### - [ ] Lines 156: Road-mapping opener `Low`

**Comment:** "Below, we show that" is a minor road-mapping phrase.

**Original:**
```
Below, we show that the first-order equilibrium welfare effect of a change in interchange fees for payment method $l$ on a type-$k$ consumer is given by aggregating the mechanical effects of changes in interchange fees on merchant-level prices.
```

**Proposed Revision:**
```
The first-order welfare effect of a change in interchange fees for payment method $l$ on a type-$k$ consumer equals the aggregated mechanical effects on merchant-level prices.
```

**Why better:** Removes "Below, we show that" road-mapping and tightens the sentence.

### appendix_cash_model.tex

#### - [ ] Lines 25-26: Mild over-explanation `Low`

**Comment:** "Thus, we cannot simply take the average cash share in Clover and apply it to the settlement data. Instead, we need to model how cash usage varies with observable merchant characteristics..." is mildly didactic but acceptable in a methodological appendix.

**Original:**
```
Thus, we cannot simply take the average cash share in Clover and apply it to the settlement data.
Instead, we need to model how cash usage varies with observable merchant characteristics and then use that model to predict cash usage in the settlement data.
```

**Proposed Revision:**
```
Raw Clover averages would misstate cash usage in the settlement sample, so the model conditions on observable merchant characteristics.
```

**Why better:** Collapses two didactic sentences into one direct statement.

### appendix_structural.tex

#### - [ ] Lines 29: Minor over-explanation `Low`

**Comment:** "Since networks mechanically pass through fees to rewards and do not earn economic profits in our model" stacks two clauses when one suffices.

**Original:**
```
Since networks mechanically pass through fees to rewards and do not earn economic profits in our model, the welfare analysis focuses on consumers and merchants.
```

**Proposed Revision:**
```
Networks earn zero profits in the model, so the welfare analysis covers only consumers and merchants.
```

**Why better:** Tighter. "Zero profits" implies mechanical pass-through.

### appendix_durbin.tex

#### - [ ] Lines 30-31: Road-mapping sentence `Low`

**Comment:** "We can then use this panel to illustrate the heterogeneous effects of the Durbin Amendment across restaurants" is mild road-mapping after the panel has just been described.

**Original:**
```
We can then use this panel to illustrate the heterogeneous effects of the Durbin Amendment across restaurants.
```

**Proposed Revision:**
```
[Delete sentence. The following figures illustrate the heterogeneous effects directly.]
```

**Why better:** The figures that follow immediately make the point. The sentence is pure road-mapping.
