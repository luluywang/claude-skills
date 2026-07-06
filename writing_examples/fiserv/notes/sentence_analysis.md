# Sentence Structure Analysis

## Executive Summary
- Mean sentence length across the paper: ~28 words (above the 15-25 healthy range; many sentences exceed 35 words)
- StdDev: ~14 words (healthy variation exists, but heavily skewed toward long sentences)
- McCloskey/Cochrane adherence: **Needs Work** -- passive voice is moderate, but sentence length monotony (consistently long) and lack of short punchy sentences are the main issues
- Priority improvements:
  1. Break up the many 40-60+ word sentences that dominate the introduction, results, and redistribution sections
  2. Add more short sentences (< 12 words) to create rhythm and emphasis; many sections have zero
  3. Reduce passive constructions and nominalizations in the methodology and appendix sections

## Overall Statistics

Approximate distribution across all prose files (excluding LaTeX commands, equations, comments):
- Total prose sentences: ~750
- Mean length: ~28 words
- Median length: ~26 words
- StdDev: ~14 words
- 10th percentile: ~12 words
- 25th percentile: ~18 words
- 75th percentile: ~36 words
- 90th percentile: ~48 words
- Sentences > 40 words: ~20% (high)
- Sentences < 12 words: ~5% (low -- ideally 10-15%)

## Section-by-Section

| File | Approx. Sentences | Mean | StdDev | Range | Assessment |
|------|------------------|------|--------|-------|------------|
| introduction.tex | ~120 | 30 | 14 | 5-65 | Long-heavy; some short sentences but rare |
| institutional_setting.tex | ~65 | 27 | 12 | 8-55 | Moderate; procedural monotony |
| payment_costs.tex | ~90 | 28 | 13 | 6-60 | Mixed; some good variation, many long |
| redistribution.tex | ~100 | 30 | 15 | 7-65 | Long and dense; methodology prose heavy |
| results.tex | ~95 | 29 | 14 | 6-60 | Dense; good paragraph openers but long runs |
| conclusion.tex | ~12 | 26 | 10 | 7-40 | Adequate but uniform |
| real_effects.tex | ~40 | 28 | 12 | 8-55 | Technical monotony |
| appendix_theory.tex | ~45 | 24 | 12 | 6-50 | Better variation; math-adjacent prose is tighter |
| appendix_data.tex | ~55 | 26 | 11 | 8-55 | Procedural; low variation |
| appendix_cash_model.tex | ~35 | 24 | 10 | 8-45 | Adequate |
| appendix_structural.tex | ~40 | 25 | 11 | 7-50 | Adequate |
| appendix_durbin.tex | ~50 | 28 | 13 | 8-60 | Similar to main real_effects section |

## McCloskey/Cochrane Assessment

### Active/Passive Voice
- Passive voice is moderate (~20-25% of sentences). Most common patterns:
  - "is/are determined by," "is driven by," "is measured," "is expressed," "is defined by"
  - "was designed to," "were hurt by," "are remitted to"
- Many instances use the acceptable academic passive ("rewards are then determined by"), but several could be stronger in active voice

### Nominalization
- Moderate use of nominalizations: "the redistribution effects," "the allocation of spending," "the composition of payments," "the distribution of..." are repeated heavily
- Some could be tightened: "conduct an analysis" -> "analyze," "make an assumption" -> "assume"

### S-V-O Clarity
- Many sentences delay the main verb with long introductory clauses or embed multiple subordinate clauses
- The introduction and results sections have the most convoluted sentence structures

### Tense Consistency
- Generally good; present tense dominates the empirical sections
- Minor shifts between "we find" and "we found" in some passages

### Parallel Structure
- Generally acceptable; some lists could be tightened

---

## High

### [introduction.tex]

### - [ ] Lines 11-11: Extremely long sentence with multiple embedded clauses

**Comment:**
This 60+ word sentence packs three distinct ideas into one structure (assumption failure, consumer sorting, merchant heterogeneity, and the implication for incidence). McCloskey advises against elaborating all parts of a sentence simultaneously.

**Original:**
```
This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs. In practice, however, both assumptions fail: consumers sort across merchants based on payment preferences, and merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts. As a result, the incidence of interchange fees cannot be inferred from average fees or representative consumers, but instead depends on the joint distribution of payment choices across merchants.
```

**Proposed Revision:**
```
This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs. Both assumptions fail in practice. Consumers sort across merchants based on payment preferences. Merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts. As a result, the incidence of interchange fees depends on the joint distribution of payment choices across merchants, not on average fees or representative consumers.
```

**Why better:**
- Breaks a 50-word sentence into three shorter ones, improving rhythm
- The short "Both assumptions fail in practice" provides punch
- Final sentence puts the positive claim first, then the contrast

### - [ ] Lines 25-25: 55+ word sentence with three nested clauses

**Comment:**
The sentence beginning "Instead, incidence depends on..." runs to ~55 words with three appositional phrases joined by "and." This is among the longest in the paper and tries to do too much.

**Original:**
```
Instead, incidence depends on the covariance between payment choices and merchant characteristics---a dimension that has been largely unobserved in prior work, and one that is central to determining the direction and magnitude of transfer, and therefore to understanding who ultimately bears the cost of interchange fees.
```

**Proposed Revision:**
```
Instead, incidence depends on the covariance between payment choices and merchant characteristics. This dimension has been largely unobserved in prior work, yet it is central to determining both the direction and magnitude of transfers---and therefore to understanding who ultimately bears the cost of interchange fees.
```

**Why better:**
- Splits one 55-word sentence into two
- The dash-interrupted clause at the end now serves as a single climactic point rather than a third clause in a chain

### - [ ] Lines 34-34: 50+ word sentence doing triple duty

**Comment:**
This sentence tries to (1) describe the approach, (2) state what it avoids, and (3) add a qualification about pass-through assumptions. McCloskey: do not elaborate all three parts of a sentence.

**Original:**
```
This approach allows us to quantify redistribution without estimating a full demand system, and to isolate the role of sorting and fee heterogeneity in shaping incidence, under empirically plausible pass-through assumptions that we examine in the data and in a structural model.
```

**Proposed Revision:**
```
This approach allows us to quantify redistribution without estimating a full demand system and to isolate how sorting and fee heterogeneity shape incidence. We examine the underlying pass-through assumptions both empirically and in a structural model.
```

**Why better:**
- Splits one overloaded sentence into two focused ones
- Replaces "the role of sorting and fee heterogeneity in shaping incidence" with a more direct verb phrase

### - [ ] Lines 85-90: Six consecutive medium-to-long sentences (structural model paragraph)

**Comment:**
Lines 85-93 form a paragraph where nearly every sentence is 25-40 words. The rhythm is flat. No sentence is shorter than 20 words. This creates a plodding, explanation-heavy passage.

**Original:**
```
Evaluating the welfare effects of interchange fees would typically require estimating a full demand system across consumers, merchants, and payment methods, along with modeling strategic pricing by firms.
This quickly becomes intractable in settings with rich heterogeneity.
We show that this complexity is unnecessary.
Under mild conditions on consumer demand and firms' pricing responses to cost shocks, the first-order welfare effects of interchange fees can be summarized by simple moments of the joint distribution of payment shares across merchants and the corresponding fee schedule.
```

**Proposed Revision:**
```
Evaluating the welfare effects of interchange fees would typically require estimating a full demand system across consumers, merchants, and payment methods, along with modeling strategic pricing by firms.
In settings with rich heterogeneity, this quickly becomes intractable.
We show that this complexity is unnecessary.
Under mild conditions on consumer demand and pricing responses, the first-order welfare effects of interchange fees reduce to simple moments: the joint distribution of payment shares across merchants and the corresponding fee schedule.
```

**Why better:**
- "We show that this complexity is unnecessary" is already excellent -- a short, punchy sentence
- The long fourth sentence is tightened by using "reduce to simple moments:" with a colon to introduce the specifics
- "firms' pricing responses to cost shocks" simplified to "pricing responses"

### - [ ] Lines 117-117: 60+ word sentence packing two examples and a generalization

**Comment:**
The sentence beginning "Similarly, we find that the increase in credit card premiumization..." runs over 60 words, embedding two findings and a broad lesson in a single construction.

**Original:**
```
Similarly, we find that the increase in credit card premiumization has been regressive, since higher-income consumers are the most likely to use premium cards. These two examples illustrate how distinguishing between different types of debit and credit cards is essential to understanding the effects of interchange in modern payment systems, and more broadly how policy and innovation can reshape the incidence of platform fees.
```

**Proposed Revision:**
```
Similarly, we find that credit card premiumization has been regressive, since higher-income consumers are the most likely to use premium cards. These two examples illustrate a broader point: distinguishing between different types of debit and credit cards is essential to understanding interchange in modern payment systems. More broadly, policy and innovation can reshape the incidence of platform fees.
```

**Why better:**
- Breaks the second 50+ word sentence into two
- Uses a colon to introduce the main claim
- Separates the "more broadly" generalization into its own sentence for emphasis

### - [ ] Lines 142-145: Three consecutive 35+ word sentences in financial products discussion

**Comment:**
This passage comparing payment system redistribution to financial product pooling has three long sentences back-to-back without variation. The contrast is important but gets buried in dense prose.

**Original:**
```
Our findings on redistribution through the payment system contrast significantly with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products.
In contrast, redistribution arises in our setting when naifs and sophisticates choose different financial products but pool at the same merchants.
This leads to qualitatively different recommendations for reducing redistribution.
Whereas in most traditional settings separating contracts (between consumer types) can reduce redistribution, in our setting, it is precisely this separation across financial instruments (i.e., payment methods) that drives redistribution, shifting attention from financial contract design to the interaction between consumer sorting and merchant pricing.
```

**Proposed Revision:**
```
Our findings contrast with prior work on how unsophisticated consumers cross-subsidize sophisticated ones when both pool on the same financial products.
In our setting, redistribution arises from the opposite pattern: naifs and sophisticates choose different financial products but pool at the same merchants.
The policy implications differ accordingly.
In traditional settings, separating contracts between consumer types can reduce redistribution. In our setting, it is precisely this separation across payment methods that drives redistribution. The relevant margin shifts from financial contract design to the interaction between consumer sorting and merchant pricing.
```

**Why better:**
- "The policy implications differ accordingly" is a short bridge sentence
- Breaks the final 50-word sentence into three focused statements
- Removes "Our findings on redistribution through the payment system" (wordy)

### [institutional_setting.tex]

### - [ ] Lines 42-42: 50-word sentence with throat-clearing

**Comment:**
"While public schedules illustrate potential fee variation, to the best of our knowledge, we are the first to use data on the actual fees merchants pay to quantify how this heterogeneity shapes redistribution." The hedging phrase "to the best of our knowledge" and the long setup clause delay the main claim.

**Original:**
```
While public schedules illustrate potential fee variation, to the best of our knowledge, we are the first to use data on the actual fees merchants pay to quantify how this heterogeneity shapes redistribution.
```

**Proposed Revision:**
```
Public schedules illustrate potential fee variation, but we are the first to use data on the actual fees merchants pay to quantify how this heterogeneity shapes redistribution.
```

**Why better:**
- Removes the hedging "to the best of our knowledge" (a common academic tic that weakens the claim)
- "but" is more direct than the "While... to the best of our knowledge, we are" construction

### [payment_costs.tex]

### - [ ] Lines 22-23: 55-word sentence with parenthetical and multiple clauses

**Comment:**
The sentence beginning "In contrast, for the one-third of merchants..." runs over 50 words with embedded percentage thresholds and a final appositive clause. Too much data in one sentence.

**Original:**
```
For approximately two thirds of merchant-year observations, cash accounts for less than 2\% of transactions.
In contrast, for the one-third of merchants for which cash represents at least 2\% of sales, it accounts for more than 30\% of their transactions---and for merchants in the 90th percentile, over 80\%, highlighting the concentration of cash usage among a subset of merchants.
```

**Proposed Revision:**
```
For approximately two-thirds of merchant-year observations, cash accounts for less than 2\% of transactions.
Among the remaining third, where cash represents at least 2\% of sales, it accounts for more than 30\% of transactions. At the 90th percentile, cash exceeds 80\%. This concentration of cash usage among a subset of merchants is striking.
```

**Why better:**
- Breaks the 55-word sentence into three
- "This concentration... is striking" is a short emphatic sentence
- Removes the dangling participial "highlighting..."

### - [ ] Lines 196-196: 90+ word paragraph-sentence on the Durbin Amendment

**Comment:**
Line 196 contains a single paragraph-sentence that is approximately 90 words, describing the Durbin Amendment's effects, an IV design, and a finding, all in one breathless construction. This is the longest sentence in the paper and violates nearly every McCloskey/Cochrane guideline.

**Original:**
```
In Appendix \ref{sec:appendix_durbin}, we present novel evidence that interchange fees have real effects on merchant sales. To do this, we exploit variation in the effects of the 2011 Durbin Amendment across merchants, which has been exploited in other work such as \citet{Mukharlyamov.Sarin2025}. The Durbin Amendment capped interchange fees only on debit cards issued by large banks, but not on debit cards issued by small banks, nor on credit cards. It also inadvertently increased debit card interchange fees for merchants with small average transaction sizes, while creating significant savings for merchants with large transaction sizes. We implement an instrumental variables design that compares sales growth across merchants with different predicted savings from the Durbin Amendment, using variation in local exposure to large banks to isolate causal effects. We find evidence suggesting that the Durbin Amendment led to a decline in prices and, ultimately, find that every one percentage point in interchange expense saved causes around a \absinput{durbin_iv_2Y_Sales_IV}\% increase in card sales.
```

**Proposed Revision:**
```
In Appendix \ref{sec:appendix_durbin}, we present causal evidence that interchange fees affect merchant sales. We exploit variation in the 2011 Durbin Amendment's effects across merchants, following \citet{Mukharlyamov.Sarin2025}. The Durbin Amendment capped interchange fees only on debit cards issued by large banks---not on those from small banks or on credit cards. It also inadvertently raised fees for merchants with small average transaction sizes while creating savings for those with large transactions. Using an instrumental variables design that compares sales growth across merchants with different predicted savings, we find that every one percentage point saved in interchange expense causes around a \absinput{durbin_iv_2Y_Sales_IV}\% increase in card sales.
```

**Why better:**
- Splits and tightens; removes the near-redundant "novel evidence... we find evidence suggesting"
- Shortens the IV design sentence by moving the key finding into it
- Eliminates "which has been exploited in other work such as" (wordy)

### [redistribution.tex]

### - [ ] Lines 12-12: 130+ word paragraph-sentence explaining approaches

**Comment:**
The paragraph at line 12 contains what reads as a single extended thought spanning over 130 words. While technically multiple sentences, they all stay within a narrow 30-40 word range and follow the same structure: "The sufficient statistic approach [does X]. A key feature... This is a feature because... however... we must make an assumption... In our baseline... We view this as..." This is the most monotonous passage in the paper.

**Original:**
```
Each approach rests on different assumptions. The sufficient statistic approach applies broadly across utility functions and market structures, and highlights the first-order determinants of redistribution from interchange fees. A key feature of the sufficient statistic approach is that it imposes minimal structure on the problem. This is a feature because it avoids strong functional-form assumptions; however, without additional structure governing merchant competition, we must make an assumption about how interchange fees pass through to prices. In our baseline implementation of the sufficient statistic approach, we assume full pass-through of interchange fees to prices. We view this as a reasonable approximation for industry-wide cost shocks, but relax it in the structural model. In the structural model, we impose more parametric assumptions on consumer utility functions and the nature of competition between firms. Because the estimates from the two methods are quantitatively similar, we present the more intuitive sufficient statistic approach first.
```

**Proposed Revision:**
```
Each approach rests on different assumptions. The sufficient-statistics approach applies broadly across utility functions and market structures, highlighting the first-order determinants of redistribution. Its key feature is minimal structure---it avoids strong functional-form assumptions. The tradeoff is that without a model of merchant competition, we must assume how interchange fees pass through to prices. We assume full pass-through in our baseline, a reasonable approximation for industry-wide cost shocks. The structural model imposes more parametric assumptions on utility functions and competition, and allows us to relax full pass-through. Because the two methods yield quantitatively similar estimates, we present the sufficient-statistics approach first.
```

**Why better:**
- Reduces from 8 sentences to 7, with better length variation (8, 18, 8, 22, 16, 20, 15 words)
- Eliminates repetition of "sufficient statistic approach" (three times in original)
- "Its key feature is minimal structure" is a short, clear sentence
- "The tradeoff is that..." is more direct than "This is a feature because..."

### [appendix_data.tex]

### - [ ] Lines 7-7: 50-word opening sentence listing five datasets

**Comment:**
The opening sentence lists five datasets in a parenthetical enumeration within a single sentence. This overwhelms the reader before the section has begun.

**Original:**
```
This section describes the cleaning procedures applied to five key datasets that form the backbone of our empirical analysis: (1) the aggregate time series, (2) the Clover merchant data, (3) the merchant cross-section from the settlement dataset, (4) the Diary of Consumer Payment Choice, and (5) the MRI survey data.
```

**Proposed Revision:**
```
This section describes the cleaning procedures for five key datasets: the aggregate time series, the Clover merchant data, the settlement cross-section, the Diary of Consumer Payment Choice, and the MRI survey data.
```

**Why better:**
- Removes "applied to... that form the backbone of our empirical analysis" (throat-clearing)
- Drops the numbered parenthetical format for a cleaner list after the colon

### [appendix_structural.tex]

### - [ ] Lines 58-63: Six sentences of similar length describing calibration fit

**Comment:**
Lines 58-63 describe three panels of a figure with sentences averaging 35 words each. Each follows the pattern "Panel X shows that the model [verb]..." This is the same "Figure description monotony" seen in institutional_setting.tex.

**Original:**
```
Figure \ref{fig:calibration-fit} demonstrates the quality of the calibration fit.
Panel \ref{fig:calibration-moments} shows that the model successfully replicates the revenue-weighted second moments of payment shares across sectors---the key statistics that govern the extent of cross-subsidization in our sufficient-statistics framework.
The close alignment between model-generated moments (y-axis) and data moments (x-axis) confirms that the calibration captures the observed covariance structure of payment methods across merchants.
Panel \ref{fig:markups-by-sector} shows that the model generates realistic markups by sector, which is important for ensuring that merchant pricing behavior is empirically grounded.
Finally, Panel \ref{fig:calibration-passthrough} regresses the change in each firm's average fees as a result of capping fees to zero in the counterfactual against the change in the firm's average price with market fixed effects.
```

**Proposed Revision:**
```
Figure \ref{fig:calibration-fit} summarizes the calibration fit across three dimensions.
Panel \ref{fig:calibration-moments} shows that the model replicates the revenue-weighted second moments of payment shares across sectors---the key statistics governing cross-subsidization. Model-generated and data moments align closely.
Panel \ref{fig:markups-by-sector} confirms realistic markups by sector.
Panel \ref{fig:calibration-passthrough} regresses each firm's change in average fees (from capping fees to zero) against its change in average price, with market fixed effects.
```

**Why better:**
- Adds a short sentence: "Model-generated and data moments align closely" (7 words)
- "confirms realistic markups by sector" is a short, punchy sentence (6 words after "Panel X")
- Reduces the wordy descriptions while preserving all content

---

## Medium

### [introduction.tex]

### - [ ] Lines 16-16: 45-word sentence with parenthetical disruption

**Comment:**
Long sentence with an embedded relative clause ("which has capped interchange fees at less than one-sixth of the highest fees charged in the U.S.") that delays the main point about regulatory variation. Cochrane recommends keeping S-V-O clear.

**Original:**
```
The U.S. regulatory environment strongly contrasts with the European Union's interchange fee regulation, which has capped interchange fees at less than one-sixth of the highest fees charged in the U.S., highlighting the wide variation in regulatory approaches across jurisdictions.
```

**Proposed Revision:**
```
The U.S. regulatory environment stands in sharp contrast with the European Union, which has capped interchange fees at less than one-sixth of the highest U.S. rates. This gap highlights the wide variation in regulatory approaches across jurisdictions.
```

**Why better:**
- Splits one 40+ word sentence into two clearer ones
- Removes the dangling participial phrase ("highlighting...")
- Tightens "interchange fee regulation, which has capped interchange fees" (repetition of "interchange fees")

### - [ ] Lines 24-25: Two consecutive 40+ word sentences create monotonous density

**Comment:**
Lines 24-25 contain two consecutive sentences averaging over 40 words each. The paragraph has no short sentence to break the rhythm. This creates a wall-of-text effect that weakens both claims. McCloskey: vary length and construction.

**Original:**
```
More broadly, the existing literature treats the incidence of interchange fees as a representative-agent problem, abstracting from heterogeneity in both merchant characteristics and consumer sorting. This abstraction is consequential. If consumers using different payment methods sort into different merchants, or if merchants face heterogeneous fees, then average fee differences are no longer sufficient to determine redistribution.
```

**Proposed Revision:**
```
More broadly, the existing literature treats interchange fee incidence as a representative-agent problem, abstracting from heterogeneity in merchant characteristics and consumer sorting. This abstraction is consequential. When consumers with different payment methods sort into different merchants, or when merchants face heterogeneous fees, average fee differences no longer suffice to determine redistribution.
```

**Why better:**
- "This abstraction is consequential" is already a good short sentence -- preserve it
- Tightens "the incidence of interchange fees" to "interchange fee incidence" (nominalization reduction)
- "no longer suffice" is more direct than "are no longer sufficient" (nominalization)

### - [ ] Lines 40-41: Two consecutive 45+ word sentences (dollar comparisons)

**Comment:**
The two sentences listing comparable government programs and financial market transfers are each 40-50 words with internal parentheticals. While the content is important for context, the back-to-back long enumerations create monotony. Varying sentence length would improve rhythm.

**Original:**
```
These transfers are economically significant, comparable in size (but opposite in direction) to major government programs such as SNAP ($120bn), the Earned Income Tax Credit ($57bn), and unemployment insurance ($40bn).
The transfers here are also large relative to other transfers in consumer financial markets, such as the inter-regional transfer due to the GSE's lack of risk-based pricing ($15 billion), consumer losses from shrouded credit card fees ($10 billion), and consumer losses from high-fee index funds ($20 billion).
```

**Proposed Revision:**
```
These transfers are economically significant---comparable in size, though opposite in direction, to SNAP ($120bn), the Earned Income Tax Credit ($57bn), and unemployment insurance ($40bn). They are also large relative to other transfers in consumer financial markets: inter-regional GSE transfers ($15 billion), consumer losses from shrouded credit card fees ($10 billion), and losses from high-fee index funds ($20 billion).
```

**Why better:**
- Tightens "major government programs such as" (unnecessary throat-clearing)
- Uses a colon to introduce the financial market list, reducing word count
- Removes repetitive "consumer losses from" in the second item

### - [ ] Lines 128-131: Consecutive long sentences in literature review

**Comment:**
The literature review paragraph starting at line 128 contains four consecutive sentences all exceeding 30 words. The paragraph has no rhythmic variation. Each sentence follows the pattern "Prior work has... We show that..." which creates structural monotony.

**Original:**
```
Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
Prior theoretical work has focused on whether high interchange fees encourage efficient payment choices.
These papers typically assume that consumers using different payment methods shop at the same merchants, and that all merchants pay the same interchange fees.
In contrast, we document substantial heterogeneity in both payment composition and interchange fees across merchants and show that this has important implications for redistribution across consumers, implying that incidence cannot be characterized using representative consumers or average fees.
```

**Proposed Revision:**
```
Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
Prior theoretical work asks whether high interchange fees encourage efficient payment choices.
These papers typically assume common shopping patterns and uniform merchant fees.
We document that neither holds. Both payment composition and interchange fees vary substantially across merchants, with important implications for redistribution. Incidence cannot be characterized using representative consumers or average fees.
```

**Why better:**
- Introduces a short, punchy sentence: "We document that neither holds."
- Compresses two assumptions into one shorter sentence
- Breaks the final 50-word sentence into three, each with a distinct point

### [institutional_setting.tex]

### - [ ] Lines 7-11: Five consecutive medium-length sentences with uniform structure

**Comment:**
The opening paragraph has five sentences ranging from 18-30 words, all following a similar "We [verb]" or "These data [verb]" pattern. This creates starting-pattern uniformity.

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
This section outlines the institutional setting and introduces our data.
Credit and debit card payment systems involve key participants, costs, benefits, and transfers, which we describe in turn.
We then introduce two merchant-level datasets from Fiserv that reveal how the types and costs of payment methods vary across merchants---which payments they receive and what fees they pay.
Together, these data link merchant-level payment composition and costs to redistribution across consumers.
```

**Why better:**
- Reduces five sentences to four, eliminating the redundant "These data show" sentence
- Varies sentence openings ("This section," "Credit and debit," "We then," "Together")
- Tightens "we outline the institutional details and describe" to "outlines the institutional setting and introduces"

### - [ ] Lines 15-19: Four consecutive 30+ word sentences describing payment flow

**Comment:**
These sentences describing the payment processing chain are all similarly structured: "[Entity], [appositive], [verb phrase]." The passage reads like a list in paragraph form, with no variation in rhythm.

**Original:**
```
A typical card payment involves the customer making a purchase, the merchant accepting the payment, and three key financial intermediaries: the merchant acquirer, the issuer, and the card network.
The issuer, effectively the consumer's bank (e.g., Chase), facilitates the transaction from the consumer's perspective by providing the card and processing the payment.
Merchants, in turn, accept card payments by contracting with a merchant acquirer.
This can be a bank (e.g., Wells Fargo) or a fintech firm (e.g., Fiserv, Square), which supplies payment terminals and facilitates settlement and fund transfers.
```

**Proposed Revision:**
```
A typical card payment involves three financial intermediaries: the merchant acquirer, the issuer, and the card network.
The issuer---the consumer's bank (e.g., Chase)---provides the card and processes the payment.
Merchants accept cards by contracting with a merchant acquirer, which can be a bank (e.g., Wells Fargo) or a fintech firm (e.g., Fiserv, Square).
The acquirer supplies payment terminals and facilitates settlement.
```

**Why better:**
- The original first sentence front-loads "the customer making a purchase, the merchant accepting the payment" before reaching the main point (three intermediaries). Reversed.
- Short final sentence ("The acquirer supplies payment terminals and facilitates settlement") adds rhythm
- Merges the "Merchants" and "This can be a bank" sentences to avoid the vague "This"

### - [ ] Lines 80-85: Five consecutive sentences of similar length describing data validation

**Comment:**
Lines 80-85 contain five sentences all in the 25-35 word range, each following the pattern "Figure X compares Y to Z. We observe/find [alignment]." This is monotonous.

**Original:**
```
The Fiserv data are highly representative of the broader U.S. economy in terms of sectoral coverage, firm size (based on card sales), and geographic distribution.
Figure \ref{fig:data-representative-sector} compares the sector composition of card transactions in the Fiserv data to that reported in the Diary of Consumer Payment Choice.
We observe close alignment across major retail categories, such as restaurants, grocery stores, merchandise retailers, gas stations, and travel.
Figure \ref{fig:data-representative-geo} compares the state-level distribution of card transactions in the Fiserv data with states' shares of GDP.
Most points lie along the 45-degree line, indicating strong geographic representativeness.
Figure \ref{fig:data-representative-size} compares firm size distributions in the Fiserv dataset with those reported by the IRS Statistics of Income, again showing close correspondence across revenue categories.
```

**Proposed Revision:**
```
The Fiserv data are highly representative of the broader U.S. economy.
Figure \ref{fig:data-representative-sector} compares the sector composition of card transactions in the Fiserv data to the Diary of Consumer Payment Choice, showing close alignment across restaurants, grocery stores, merchandise retailers, gas stations, and travel.
Figure \ref{fig:data-representative-geo} compares state-level card transaction shares with GDP shares; most points lie along the 45-degree line.
Figure \ref{fig:data-representative-size} compares firm size distributions with IRS Statistics of Income data, again showing close correspondence across revenue categories.
```

**Why better:**
- Opens with a short declarative sentence (11 words)
- Merges each "Figure X compares" with its finding, avoiding the repetitive pattern of "Figure compares. We find."
- Uses a semicolon to compress two short related ideas

### [payment_costs.tex]

### - [ ] Lines 7-11: Five-sentence opening with similar structure

**Comment:**
The section opens with five medium sentences (20-35 words each) that all follow "We show / We document / We also document" patterns. Low variation in sentence openers.

**Original:**
```
Redistribution in the payment system requires consumers who use different payment methods to shop at the same stores.
The magnitude of redistribution at each merchant depends on the differences in the fees for these payment methods.
In this section, we document novel facts about the variation in payment composition and costs across merchants.
We show that payment methods vary significantly in their fees, which generates the potential for redistribution.
However, we also document two forces---consumer sorting and merchant fee heterogeneity---that cause aggregate data to overstate the extent of redistribution in the payment system, by limiting the overlap between consumers using different payment methods and compressing fee differences where such overlap occurs.
```

**Proposed Revision:**
```
Redistribution in the payment system requires consumers who use different payment methods to shop at the same stores. The magnitude depends on fee differences across payment methods at each merchant. This section documents novel facts about the variation in payment composition and costs across merchants. Payment methods vary significantly in their fees, generating the potential for redistribution. But two forces moderate this potential: consumer sorting limits the overlap between payment types at individual merchants, and merchant fee heterogeneity compresses fee differences where overlap does occur.
```

**Why better:**
- Shortens the second sentence for rhythm variation
- Eliminates "We show" / "We document" repetition
- Restructures the final sentence using a colon to introduce the two forces, making the parallel structure explicit

### - [ ] Lines 200-201: Long summary paragraph with monotonous rhythm

**Comment:**
The "Summarizing the Facts" paragraph (lines 200-201) contains three long sentences without variation. It reads as a dense wall of text.

**Original:**
```
Our reduced-form analysis highlights one fact that suggests substantial redistribution between consumers who use different payment methods, and two facts that moderate this redistribution. First, card types vary substantially in their interchange fees. By itself, this raises the potential for substantial redistribution through the payment system. However, redistribution only happens when consumers who choose different payment methods shop at the same stores. Thus, dispersion in payment composition across merchants limits the extent of cross-subsidization. Moreover, at the merchants where consumers with different payment preferences overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating the magnitude of redistribution.
```

**Proposed Revision:**
```
Our reduced-form analysis highlights one fact that raises the potential for redistribution, and two that moderate it. First, card types vary substantially in their interchange fees---suggesting scope for large transfers. But redistribution only occurs when consumers who choose different payment methods shop at the same stores. Dispersion in payment composition across merchants limits cross-subsidization. Moreover, where different payment types do overlap, interchange fees tend to be lower due to sector discounts and negotiation, further attenuating redistribution.
```

**Why better:**
- Tightens the opening from 25 to 18 words
- "But redistribution only occurs when..." is more direct than "However, redistribution only happens when..."
- Eliminates "By itself, this raises the potential for substantial redistribution through the payment system" (redundant with the opening sentence)

### [redistribution.tex]

### - [ ] Lines 55-58: Dense merchant pricing passage

**Comment:**
Lines 55-58 contain a passage where the pricing equation is introduced by a 45-word sentence followed by another 35-word sentence with nested subscripts and variable definitions. The prose is hard to parse because the verbal description competes with the equation.

**Original:**
```
Rather than explicitly modeling merchant competition or imposing functional forms on the demand side, we assume that prices are log-linear in weighted interchange fees, such that merchants pass through interchange fees to prices one-for-one, as calculated below:
```

**Proposed Revision:**
```
Rather than explicitly modeling merchant competition, we assume that prices are log-linear in weighted interchange fees. Merchants pass through interchange fees one-for-one:
```

**Why better:**
- Splits a 40-word setup into two sentences
- Removes "or imposing functional forms on the demand side" (redundant with the opening clause) and "as calculated below" (the equation follows immediately)

### [results.tex]

### - [ ] Lines 24-26: Extended paragraph with five 30+ word sentences on benchmarking

**Comment:**
The "Existing Benchmarks" passage (lines 19-26) has five long sentences averaging over 30 words. After the initial framing, every sentence is medium-to-long with no short sentence to punctuate the argument.

**Original:**
```
Academic research has attempted to quantify this transfer. Following the logic of \citet{schuh2010gains}, if we focus on credit card versus cash users and assume homogeneous shopping behavior, the calculation is straightforward. U.S. merchants paid approximately \$80 billion in credit card interchange fees in 2022. With credit cards representing roughly half of payment volume, cash users cross-subsidize credit users by approximately \$40 billion annually.
```

**Proposed Revision:**
```
Academic research has attempted to quantify this transfer. The logic of \citet{schuh2010gains} is straightforward: focus on credit versus cash, assume homogeneous shopping, and compute. U.S. merchants paid approximately \$80 billion in credit card interchange fees in 2022. With credit cards representing roughly half of payment volume, the implied cross-subsidy is about \$40 billion annually.
```

**Why better:**
- "The logic... is straightforward: focus..., assume..., and compute." is more active and punchy
- Removes "if we" and "Following" constructions

### - [ ] Lines 109-113: Dense decomposition paragraph with no short sentences

**Comment:**
Lines 109-113 contain a paragraph on consumer sorting where every sentence exceeds 30 words. The passage is crucial but reads as a dense block. StdDev within this paragraph is under 7 (monotonous).

**Original:**
```
We decompose the effects of consumer sorting and fee heterogeneity across merchants in Table \ref{tab:redist}. Assuming homogeneous shopping behavior and homogeneous fees across merchants inflates redistribution losses to cash consumers by about one-third and overestimates gains to premium credit card users by about one-half. Formally, under the homogeneity assumption, cash users would lose approximately \$\absinput{combined_dollar_cash_naive} billion from interchange fees. Similarly, premium credit card users would gain approximately \$\absinput{combined_dollar_premium_credit_naive} billion. The homogeneity assumption also significantly overstates the effects on debit card consumers, especially exempt debit users, for whom losses are overstated by a factor of three.
```

**Proposed Revision:**
```
Table \ref{tab:redist} decomposes the effects of consumer sorting and fee heterogeneity. Assuming homogeneous shopping and uniform fees inflates redistribution losses to cash consumers by one-third and overestimates gains to premium credit card users by one-half. Under homogeneity, cash users would lose approximately \$\absinput{combined_dollar_cash_naive} billion; premium credit card users would gain approximately \$\absinput{combined_dollar_premium_credit_naive} billion. The effect on debit card users is also overstated---for exempt debit users, by a factor of three.
```

**Why better:**
- Opens by putting the table reference first (readers want to know where to look)
- Uses a semicolon to merge two parallel findings
- "The effect on debit card users is also overstated---for exempt debit users, by a factor of three" is shorter and more emphatic

### - [ ] Lines 137-138: Two consecutive 40-word sentences on the structural model comparison

**Comment:**
The structural model comparison passage has two similarly structured, similarly long sentences. Both begin with "Our sufficient statistic assumes..." / "We systematically evaluate..."

**Original:**
```
Our sufficient statistic assumes that interchange fees are fully passed through to retail prices and that the effects of a discrete change in interchange fees are well approximated by the local effects of small changes in fees.
We systematically evaluate these two potential sources of error with our structural model and find that relaxing these assumptions does not change our finding of substantial redistribution.
```

**Proposed Revision:**
```
Our sufficient statistic assumes full pass-through of interchange fees to retail prices and that discrete fee changes are well approximated by local effects. We evaluate both assumptions with our structural model. Relaxing them does not change our finding of substantial redistribution.
```

**Why better:**
- Tightens the first sentence from 40 to 25 words
- Splits the second sentence for punch: "Relaxing them does not change our finding" is a strong, short conclusion

### [real_effects.tex]

### - [ ] Lines 18-19: Two 40+ word sentences opening the Durbin discussion

**Comment:**
Lines 18-19 both exceed 35 words and share a similar structure: "The Durbin Amendment [description], [relative clause]." No short sentence punctuates the transition.

**Original:**
```
The 2011 Durbin Amendment, passed as part of the Dodd-Frank Act, imposed a binding cap on debit card interchange fees for banks with over \$10 billion in assets that had highly heterogeneous effects across merchants.
As illustrated in Figure \ref{fig:interchange_ts}, the Durbin Amendment had a substantial impact on debit interchange fees while having no effect on credit interchange.
```

**Proposed Revision:**
```
The 2011 Durbin Amendment, part of the Dodd-Frank Act, capped debit card interchange fees for banks with over \$10 billion in assets. Its effects across merchants were highly heterogeneous.
As Figure \ref{fig:interchange_ts} shows, the amendment substantially reduced debit interchange fees while leaving credit interchange unchanged.
```

**Why better:**
- Splits the first 40-word sentence into two, with a short second sentence
- "Its effects across merchants were highly heterogeneous" is a clear 8-word sentence
- "As Figure X shows" is more direct than "As illustrated in Figure X"

### [appendix_theory.tex]

### - [ ] Lines 7-7: 40-word opening sentence

**Comment:**
The appendix opens with a 40-word sentence that tries to state both the subject and the scope in one construction.

**Original:**
```
This appendix formally demonstrates that the sufficient statistic in Equation~\ref{eq:sufficient-stat-formula} captures the first-order welfare effects of interchange fees, even when consumers are allowed to change their consumption in response to prices.
```

**Proposed Revision:**
```
This appendix proves that the sufficient statistic in Equation~\ref{eq:sufficient-stat-formula} captures the first-order welfare effects of interchange fees. The result holds even when consumers adjust consumption in response to prices.
```

**Why better:**
- Splits into two sentences; the second highlights the non-obvious scope
- "proves" is more direct than "formally demonstrates"
- "adjust consumption" is more active than "are allowed to change their consumption"

### [appendix_data.tex]

### - [ ] Lines 69-71: Three consecutive 40+ word bullet items reading as sentences

**Comment:**
The three bullet items in lines 69-71 each run 40-60 words. While bullets, they are effectively long sentences and would benefit from being broken up for readability.

**Original:**
```
We code a household as owning a credit (or debit) card if it reports owning at least one of that type. We also track multiple ownership and identify network-level ownership (Visa, Mastercard, Amex, Discover). We exclude households reporting neither credit nor debit spending and not preferring cash (17\% of the MRI households), as they provide no information on payment preferences.
```

**Proposed Revision:**
```
A household owns a credit (or debit) card if it reports at least one of that type. We track multiple ownership and network-level affiliations (Visa, Mastercard, Amex, Discover). We drop households that report neither card spending nor a cash preference (17\% of MRI respondents), as they provide no information on payment choice.
```

**Why better:**
- "A household owns" is more direct than "We code a household as owning"
- "network-level affiliations" is tighter than "network-level ownership"
- "We drop" is more direct than "We exclude"

### - [ ] Lines 87-90: Four consecutive 30+ word sentences on re-weighting

**Comment:**
The passage describing the re-weighting procedure has four sentences averaging 35 words, with no variation. Each sentence explains one aspect of the adjustment in a similar syntactic pattern.

**Original:**
```
Relative to the aggregate payment patterns in the settlement data (approximately 11\% cash, 45\% debit, 44\% credit), consumers in the DCPC report a higher preference for cash (around 20\% in the survey), and consumers in the MRI survey report a higher preference for debit cards from large banks and for regular credit cards.
To address this bias, we proportionally re-weight shares of payment methods within each income bin to match the aggregate shares observed in the settlement data.
This re-weighting preserves the correlation between income and payment preferences observed in the surveys while ensuring that the overall payment method shares align with the settlement data.
This proportional rescaling is equivalent to a logit adjustment: we solve for method-specific constants that shift aggregate predicted shares to match the settlement data while preserving relative preferences across income bins.
```

**Proposed Revision:**
```
Survey respondents overstate cash use (20\% in the DCPC vs. 11\% in settlement data) and overweight debit cards from large banks and regular credit cards. We re-weight payment shares within each income bin to match the settlement data's aggregate composition (approximately 11\% cash, 45\% debit, 44\% credit). This preserves the income-payment correlation while aligning overall shares. Formally, the rescaling is equivalent to a logit adjustment with method-specific constants.
```

**Why better:**
- Opens with the discrepancy directly, rather than burying it in a relative clause
- Reduces four sentences to four shorter, more varied sentences
- Eliminates redundancy between "re-weighting" and "proportional rescaling" descriptions

### [appendix_cash_model.tex]

### - [ ] Lines 8-11: Four consecutive sentences of similar length and structure

**Comment:**
The opening of this appendix has four sentences in the 15-25 word range, all following "The [noun] [verb]..." or "We therefore [verb]..." patterns. The rhythm is functional but flat.

**Original:**
```
The Clover dataset sheds light on the distribution of cash usage across merchants, which is not directly observable in the settlement dataset.
However, Clover merchants are not representative of the composition of the broader economy.
We therefore build a model to extrapolate cash usage from Clover to the broader settlement sample.
This section details the modeling approach, estimation results, and validation exercises.
```

**Proposed Revision:**
```
The Clover dataset reveals the distribution of cash usage across merchants---information not directly available in the settlement data. But Clover merchants are unrepresentative of the broader economy. We therefore build a model to extrapolate cash usage to the settlement sample. This section details the approach, results, and validation.
```

**Why better:**
- "reveals" is more active than "sheds light on"
- Em-dash replaces a relative clause
- Final sentence is tightened from 11 to 8 words

### - [ ] Lines 23-27: Five sentences in the "motivation" paragraph all starting with subject-verb

**Comment:**
Lines 23-27 each open with a subject-verb pattern: "An important motivation... They are... Thus, we cannot... Instead, we need... "

**Original:**
```
An important motivation for using the regression model is that Clover merchants are very different from the merchants in the broader Fiserv settlement sample.
They are much smaller and much more likely to be in the restaurant and retail sectors.
Thus, we cannot simply take the average cash share in Clover and apply it to the settlement data.
Instead, we need to model how cash usage varies with observable merchant characteristics and then use that model to predict cash usage in the settlement data.
```

**Proposed Revision:**
```
Clover merchants differ substantially from those in the broader settlement sample---they are much smaller and concentrated in restaurants and retail. Simply applying Clover's average cash share to the settlement data would be misleading. Instead, we model how cash usage varies with observable merchant characteristics and use those estimates to predict cash usage in the settlement data.
```

**Why better:**
- Merges the first two sentences (the second just elaborates the first)
- "Simply applying... would be misleading" is more direct than "we cannot simply take... and apply"
- Reduces five sentences to three without losing content

---

## Low

### [introduction.tex]

### - [ ] Lines 128-131: Consecutive long sentences in literature review

**Comment:**
The literature review paragraph starting at line 128 contains four consecutive sentences all exceeding 30 words. The paragraph has no rhythmic variation. Each sentence follows the pattern "Prior work has... We show that..." which creates structural monotony.

**Original:**
```
Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
Prior theoretical work has focused on whether high interchange fees encourage efficient payment choices.
These papers typically assume that consumers using different payment methods shop at the same merchants, and that all merchants pay the same interchange fees.
In contrast, we document substantial heterogeneity in both payment composition and interchange fees across merchants and show that this has important implications for redistribution across consumers, implying that incidence cannot be characterized using representative consumers or average fees.
```

**Proposed Revision:**
```
Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
Prior theoretical work asks whether high interchange fees encourage efficient payment choices.
These papers typically assume common shopping patterns and uniform merchant fees.
We document that neither holds. Both payment composition and interchange fees vary substantially across merchants, with important implications for redistribution. Incidence cannot be characterized using representative consumers or average fees.
```

**Why better:**
- Introduces a short, punchy sentence: "We document that neither holds."
- Compresses two assumptions into one shorter sentence
- Breaks the final 50-word sentence into three, each with a distinct point

### [redistribution.tex]

### - [ ] Lines 88-90: Three consecutive 35+ word sentences in the sufficient statistics subsection

**Comment:**
The passage introducing the sufficient statistics contains three long sentences without any short sentence to anchor the reader's attention. The rhythm is flat.

**Original:**
```
We develop sufficient statistics to conduct an equilibrium welfare evaluation of interchange fees across consumer groups when payment choices are fixed, but prices and consumption can re-adjust.
The key insight is that first-order consumer welfare effects depend on the variation in the composition and cost of payments across merchants, rather than on demand elasticities. We use this framework to calculate the welfare and redistributive effects of eliminating interchange fees in Section \ref{sec:Results}.
```

**Proposed Revision:**
```
We develop sufficient statistics for an equilibrium welfare evaluation of interchange fees across consumer groups. Payment choices are fixed, but prices and consumption can readjust. The key insight: first-order welfare effects depend on the variation in payment composition and costs across merchants, not on demand elasticities. Section \ref{sec:Results} applies this framework to calculate the effects of eliminating interchange fees.
```

**Why better:**
- "Payment choices are fixed, but prices and consumption can readjust" becomes its own short sentence, clearly stating the key assumption
- "The key insight:" with a colon is more direct than embedding it in a 40-word sentence
- Final sentence is reordered to lead with the section reference

### [results.tex]

### - [ ] Lines 157-159: Three consecutive 30-35 word sentences with passive constructions

**Comment:**
The passage on strategic complementarity uses passive or indirect constructions: "the structural model finds," "strategic complementarity implies that," "This mechanism 'socializes.'" The passage could be more active.

**Original:**
```
Surprisingly, the structural model finds even greater redistribution from cash and debit card users to credit card users.
Intuitively, strategic complementarity implies that even merchants that do not serve premium credit consumers may raise their prices in response to premium credit interchange fees simply because competitors are raising prices.
This mechanism ``socializes'' the cost of premium credit rewards across all consumers, including those shopping at stores at which premium cards are rarely used.
```

**Proposed Revision:**
```
Surprisingly, the structural model finds even greater redistribution from cash and debit card users to credit card users.
The intuition involves strategic complementarity: even merchants that do not serve premium credit consumers raise prices because competitors are raising theirs.
This ``socializes'' the cost of premium credit rewards across all consumers, even those at stores where premium cards are rarely used.
```

**Why better:**
- "The intuition involves strategic complementarity:" is more direct than "Intuitively, strategic complementarity implies that"
- "raise prices because competitors are raising theirs" is more active than "may raise their prices in response to... simply because competitors are raising prices"
- Removes "mechanism" (unnecessary nominalization)

### [conclusion.tex]

### - [ ] Lines 7-10: Four consecutive sentences in the 20-30 word range

**Comment:**
The conclusion's opening paragraph has four sentences all in the 20-30 word range. While individually fine, the uniform length creates a flat rhythm for what should be a strong closing section. Adding one very short sentence would improve punch.

**Original:**
```
Interchange fees shape retail activity and redistribute consumption.
Using merchant-level data, we document substantial heterogeneity in the composition and cost of payments across stores, with critical implications for merchants' costs and redistribution.
By combining the results of a sufficient-statistics framework with a calibrated structural model, we quantify the overall impact of interchange pricing.
Specifically, we find that interchange fees redistribute approximately \$\absinput{combined_dollar_headline} billion per year from cash and debit users to credit card users, with consumer sorting attenuating these transfers by about \absinput{pct_reduction} percent.
```

**Proposed Revision:**
```
Interchange fees shape retail activity and redistribute consumption.
Using merchant-level data, we document substantial heterogeneity in both the composition and cost of payments across stores. This heterogeneity matters. Combining a sufficient-statistics framework with a calibrated structural model, we estimate that interchange fees redistribute approximately \$\absinput{combined_dollar_headline} billion per year from cash and debit users to credit card users. Consumer sorting attenuates these transfers by about \absinput{pct_reduction} percent.
```

**Why better:**
- "This heterogeneity matters." is a two-word punchy sentence that anchors the paragraph
- Splits the final 40-word sentence into two
- Removes "By combining the results of" (wordy for "Combining")

### - [ ] Lines 15-16: Two 30+ word sentences closing the paper

**Comment:**
The final two sentences of the paper are both over 30 words. The very last sentence of a paper should ideally be memorable and concise. McCloskey: end with a punch.

**Original:**
```
These trends illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
More broadly, these results highlight how interchange policies affect not only banks and card networks, but also prices, market competition, and the distribution of economic surplus across consumers.
```

**Proposed Revision:**
```
These trends illustrate how network competition---richer rewards funded by higher fees---amplifies transfers from low- to high-income households.
Interchange policies affect far more than banks and card networks. They shape prices, competition, and the distribution of economic surplus across consumers.
```

**Why better:**
- "Interchange policies affect far more than banks and card networks." is shorter and more emphatic
- The final sentence is focused and ends on the key phrase: "distribution of economic surplus across consumers"
- Removes "More broadly, these results highlight how" (throat-clearing)

### [real_effects.tex]

### - [ ] Lines 34-36: Three consecutive 30-35 word sentences describing interchange mechanics

**Comment:**
Lines 34-36 describe the pre/post fee structure with three sentences of similar length and parallel structure. The reader processes dense numerical information without a pause.

**Original:**
```
We measure firm-level interchange fees as the dollar value of interchange fees divided by the total dollar volume of transactions, and we measure transaction size as the total dollar volume of debit transactions divided by the total number of debit transactions.
By comparing the two curves, we see that the regulation increased interchange fees for restaurants with low ticket sizes and decreased them for restaurants with large ticket sizes.
```

**Proposed Revision:**
```
We measure firm-level interchange fees as total interchange dollars divided by total transaction dollars, and transaction size as total debit dollars divided by debit transaction count.
The two curves reveal a clear pattern: the regulation raised fees for restaurants with low ticket sizes and lowered them for restaurants with large ticket sizes.
```

**Why better:**
- Tightens the variable definitions
- "The two curves reveal a clear pattern:" replaces "By comparing the two curves, we see that" (more direct, less wordy)

### [appendix_theory.tex]

### - [ ] Lines 116-117: Passive voice in lemma description

**Comment:**
"The following lemma shows that composition feedback is second-order, so prices respond approximately one-for-one to direct fee changes." This is good, but the preceding sentence ("The following lemma characterizes the rewards that consumers receive from card networks") uses passive nominalization.

**Original:**
```
The following lemma characterizes the rewards that consumers receive from card networks.
```

**Proposed Revision:**
```
The next lemma characterizes consumer rewards from card networks.
```

**Why better:**
- Shorter (8 vs. 12 words)
- "consumer rewards" is more direct than "the rewards that consumers receive"

### [appendix_structural.tex]

### - [ ] Lines 7-9: Three sentences averaging 30 words with similar structure

**Comment:**
The opening has three sentences each beginning with "This appendix / The main text / This appendix." The repetitive opening pattern is monotonous.

**Original:**
```
This appendix provides technical details for the structural model presented in Section \ref{sec:redistribution}.
The main text presents the model specification, calibration strategy, and welfare comparison.
This appendix contains the calibration goodness-of-fit diagnostics and detailed parameter values.
```

**Proposed Revision:**
```
This appendix provides technical details for the structural model in Section \ref{sec:redistribution}, supplementing the specification, calibration, and welfare comparison in the main text. It covers goodness-of-fit diagnostics and detailed parameter values.
```

**Why better:**
- Merges three sentences into two, eliminating the "This appendix" / "The main text" / "This appendix" repetition
- "It covers" varies the sentence opener

### [appendix_durbin.tex]

### - [ ] Lines 7-11: Opening paragraph with passive constructions and long sentences

**Comment:**
The opening paragraph uses passive voice ("are passed through," "is provided") and has two 35+ word sentences.

**Original:**
```
This appendix provides empirical evidence that small restaurants pass interchange fees through to higher retail prices.
We use the 2011 Durbin Amendment as a natural experiment to estimate the causal effects of interchange fees on merchant prices and sales among restaurants.
We focus on restaurants because the Durbin Amendment created econometrically convenient cross-sectional variation in this sector.
```

**Proposed Revision:**
```
This appendix estimates the causal effects of interchange fees on merchant prices and sales, using the 2011 Durbin Amendment as a natural experiment.
We focus on restaurants because the Durbin Amendment created the most econometrically useful cross-sectional variation in this sector.
```

**Why better:**
- Merges the first two sentences (the first merely previews the second)
- "estimates the causal effects" is more direct than "provides empirical evidence that... pass through"
- Adds "most" before "econometrically useful" for precision

### - [ ] Lines 15-16: Two 35-word sentences with similar structure

**Comment:**
Both sentences follow "One challenge... Using our data, we exploit..." Both are over 30 words with subordinate clauses.

**Original:**
```
One challenge in studying the real effects of interchange fees is that it requires both granular data---at the merchant level---on interchange fees and merchant outcomes and exogenous variation in interchange fees.
Using our detailed merchant-level data, we exploit heterogeneity in the impact of the Durbin Amendment across merchants to show that interchange fees affect the allocation of consumption and retail prices.
```

**Proposed Revision:**
```
Studying the real effects of interchange fees requires both granular merchant-level data on fees and outcomes, and exogenous variation in fees. Our Fiserv data provide both. We exploit heterogeneity in the Durbin Amendment's impact across merchants to show that interchange fees affect consumption and retail prices.
```

**Why better:**
- "Our Fiserv data provide both" is a short, confident sentence (6 words)
- Eliminates "One challenge in... is that it requires" (nominalization + vague pronoun)
- "consumption and retail prices" is tighter than "the allocation of consumption and retail prices"

### - [ ] Lines 63-65: Three consecutive 30-word sentences on instrument validity

**Comment:**
The passage discussing the potential concern about Durbin shifting payment behavior has three similarly structured sentences without variation. All begin with conditional or hypothetical framings.

**Original:**
```
One potential concern is that the Durbin Amendment may have shifted aggregate payment behavior toward debit cards, since regulated debit became cheaper for merchants.
If so, pre-Durbin payment composition would be less predictive of post-Durbin fee changes, weakening the instrument.
In practice, this is not a major issue: our first-stage F-statistics exceed 20,000, indicating that pre-Durbin characteristics remain highly predictive of fee changes.
```

**Proposed Revision:**
```
A potential concern is that the Durbin Amendment shifted payment behavior toward debit cards, weakening the instrument's predictive power. In practice, this is not an issue. Our first-stage F-statistics exceed 20,000, confirming that pre-Durbin characteristics remain highly predictive of fee changes.
```

**Why better:**
- Merges the concern and its implication into one sentence
- "In practice, this is not an issue." is short and direct (7 words)
- Removes hedging: "may have shifted" -> "shifted"; "not a major issue" -> "not an issue"

---

## Monotonous Patterns

The following passages contain 4+ consecutive sentences within a 5-word range:

1. **introduction.tex, lines 85-93**: Six sentences in the 25-40 word range (sufficient statistics paragraph). Only one sentence ("This quickly becomes intractable") falls below 25.

2. **introduction.tex, lines 128-131**: Four consecutive sentences all in the 30-40 word range (literature review).

3. **institutional_setting.tex, lines 80-85**: Five sentences all in the 25-35 word range (data validation).

4. **payment_costs.tex, lines 15-23**: Five sentences in the 25-40 word range (payment composition description).

5. **redistribution.tex, lines 12-12**: Eight sentences all in the 25-40 word range (approach comparison paragraph).

6. **results.tex, lines 109-115**: Six sentences in the 30-45 word range (sorting decomposition).

7. **appendix_data.tex, lines 87-90**: Four sentences all in the 30-40 word range (re-weighting procedure).

8. **appendix_structural.tex, lines 58-63**: Five sentences in the 30-40 word range (calibration fit description).

---

## Priority Recommendations

1. **Break long sentences in the introduction and results sections.** These are the sections most readers will engage with first and most carefully. Currently, ~25% of sentences in these files exceed 40 words. Target: no more than 10-15% of sentences above 40 words, achieved by splitting compound constructions.

2. **Add short sentences (< 12 words) for emphasis and rhythm.** The paper has very few short sentences. Good candidates already exist ("This quickly becomes intractable," "This abstraction is consequential") but they are rare. Aim for one short sentence every 4-5 sentences, especially at key argumentative turns: after stating a finding, before introducing a qualification, or when transitioning between topics.

3. **Eliminate figure/table description monotony.** Multiple passages follow the pattern "Figure X shows... We find alignment. Figure Y shows... We observe correspondence." Vary this by merging figure references with findings, using semicolons, or leading with the conclusion rather than the figure number.
