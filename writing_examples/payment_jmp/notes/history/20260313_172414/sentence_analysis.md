# Sentence Structure Analysis

## [institutional_details.tex]

### Executive Summary
- Mean: 17.7 words, StdDev: 7.5 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Vary sentence openings in the walkthrough passage, (2) Break up the long sentence on line 42

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 13 |
| Mean length | 17.7 words |
| Median length | 14 words |
| StdDev | 7.5 words |
| Range | 9-31 words |
| 10th percentile | 12 |
| 25th percentile | 13 |
| 50th percentile | 14 |
| 75th percentile | 25 |
| 90th percentile | 30 |

Distribution: 5 short (<15), 4 medium (15-25), 4 long (>25). Good mix.

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good length variation; opening patterns could vary more in the walkthrough (lines 28-37) |
| S-V-O clarity | Strong throughout — subjects and verbs are close together |
| Active voice | 12 of 13 sentences active. One passive-adjacent: "were unchanged" (L42), which is natural |
| Nominalization | None detected |
| Tense consistency | Present tense throughout main description; past tense for regulatory events (L41-42). Appropriate shift |
| Parallel structure | Good — L42 uses parallel "rewards fell and annual fees... rose, while annual fees... and interest rates were unchanged" |

### Specific Passage Critiques

### - [ ] Lines 28-37: Five consecutive mid-range declarative sentences

**Comment:** The walkthrough of Figure 1 (lines 28-37) has five sentences in a row with similar declarative structure: subject pays/goes/pay/use + dollar amount. While each sentence is clear, the rhythm becomes predictable. The section benefits from one structural break.

**Original:**
```
When a consumer uses her credit card to buy $\$100$ of product at a large retailer, the merchant pays a $\$2.25$ merchant discount fee to her acquiring bank to process the transaction.
The acquirer can be a bank like Wells Fargo or a fintech firm like Square.
Of the merchant discount, around $\$2$ goes to the issuing bank (e.g., Chase) as interchange.
The issuer and the acquirer collectively pay around $\$0.14$ in network fees to Visa.
Issuers use interchange to fund cardholder rewards; on average, credit card rebates total~$\$1.45$.
```

**Proposed Revision:**
```
When a consumer uses her credit card to buy $\$100$ of product at a large retailer, the merchant pays a $\$2.25$ merchant discount fee to her acquiring bank. The acquirer can be a bank like Wells Fargo or a fintech firm like Square.
Of the merchant discount, around $\$2$ goes to the issuing bank (e.g., Chase) as interchange, and the issuer and acquirer each pay around $\$0.07$ in network fees to Visa.
Issuers use interchange to fund cardholder rewards; on average, credit card rebates total~$\$1.45$.
```

**Why better:**
- Combines the interchange and network fee sentences, reducing the count from five to four
- Eliminates "collectively" and "to process the transaction"
- Creates more varied sentence lengths (long, medium, long, medium)

### - [ ] Line 42: 30-word sentence with three parallel clauses

**Comment:** The sentence listing three outcomes of Australia's interchange cap (rewards fell, annual fees rose, annual fees and interest rates unchanged) is long and dense. The three-part parallel structure is effective but the sentence could be clearer if split.

**Original:**
```
Appendix Figure \ref{fig:aus-interchange-event-study} shows that after Australia capped credit card interchange, rewards fell and annual fees on rewards cards rose, while annual fees on non-reward cards and interest rates were unchanged.
```

**Proposed Revision:**
```
Appendix Figure \ref{fig:aus-interchange-event-study} shows the effects of Australia's credit card interchange cap. Rewards fell and annual fees on rewards cards rose, while annual fees on non-reward cards and interest rates were unchanged.
```

**Why better:**
- Splits a 30-word sentence into two manageable units
- The first sentence sets context; the second delivers the findings
- Adds a short sentence to break up the rhythm before line 43's 25-word sentence

### Priority Recommendations
1. Consider combining the interchange and network fee sentences (lines 33-35) to reduce the repetitive declarative rhythm
2. Consider splitting the long Australia sentence (line 42) for clarity
3. Overall the section reads well — sentence variety is good for an institutional details section that must be precise

## [appendix_mri.tex]

### Executive Summary
- Mean: 18.5 words, StdDev: 6.2 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None critical; minor monotony in mid-range sentence lengths in Bank type subsection

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 15 |
| Mean length | 18.5 words |
| Median length | 18 words |
| StdDev | 6.2 words |
| Range | 5--30 words |
| 10th percentile | 10 |
| 25th percentile | 14 |
| 50th percentile | 18 |
| 75th percentile | 22 |
| 90th percentile | 27 |

Distribution: 3 short (<15 words, 20%), 10 medium (15--25 words, 67%), 2 long (>25 words, 13%).

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro (lines 6--10) | 5 | 17.4 | 7.6 | 5--27 | Good variation |
| Payment method (lines 14--16) | 3 | 20.3 | 7.0 | 14--30 | Adequate |
| Bank type (lines 20--23) | 4 | 18.3 | 1.3 | 17--20 | Slightly monotonous |
| Share of consumers (lines 27--29) | 3 | 19.0 | 4.6 | 14--25 | Adequate |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good length variation overall; Bank type subsection slightly monotonous (StdDev 1.3) |
| S-V-O clarity | Strong throughout -- subjects are concrete, verbs specific, objects clear |
| Active voice | Excellent. Every methodological sentence uses first person active ("I draw on," "I classify," "I assign," "I compute") |
| Nominalization | None detected |
| Tense consistency | Present tense for data description; past tense for historical facts ("assets fell below"). Appropriate |
| Parallel structure | Line 29 uses clean parallel form: "48% credit, 38% debit, and 14% cash" |

### Specific Passage Critiques

### - [ ] Lines 20--23: Four consecutive sentences in 17--20 word range

**Comment:** The Bank type subsection has four sentences all within a 3-word length range (17, 17, 20, 18). StdDev of 1.3 is well below the healthy threshold of 8. This creates a metronomic rhythm. For a short subsection, this is a minor concern -- the content is clear and each sentence does different work.

**Original:**
```
The MRI data list each consumer's deposit institutions, which I use to sort consumers into small or large banks.
Small bank customers hold deposit accounts only at community banks and credit unions---institutions largely exempt from the Durbin Amendment because their assets fell below the \$10 billion threshold.
Large bank customers hold deposit accounts only at the four largest banks (Chase, Bank of America, Citibank, Wells Fargo) plus U.S. Bank.
Online Appendix~\ref{subsec:oa-durbin-robustness} uses this split to test whether consumers switched banks or gained credit card rewards after Durbin.
```

**Proposed Revision:**
```
The MRI data list each consumer's deposit institutions, which I use to sort consumers into small or large banks.
Small bank customers hold deposit accounts only at community banks and credit unions---institutions largely exempt from the Durbin Amendment because their assets fell below the \$10 billion threshold.
Large bank customers bank only at Chase, Bank of America, Citibank, Wells Fargo, or U.S. Bank.
Online Appendix~\ref{subsec:oa-durbin-robustness} uses this split to test whether consumers switched banks or gained credit card rewards after Durbin.
```

**Why better:**
- Shortening line 22 from 20 to ~14 words breaks the monotony
- "bank only at" is more direct than "hold deposit accounts only at the four largest banks ... plus"
- Removes the slightly awkward "four largest banks ... plus U.S. Bank" construction

### Priority Recommendations
1. Consider varying sentence length in the Bank type subsection (lines 20--23) to break the metronomic rhythm
2. No other structural concerns -- the file is well-written with strong active voice and clear S-V-O throughout

## [appendix_data.tex]

### Executive Summary
- Mean: 21.8 words, StdDev: 11.1 words
- McCloskey/Cochrane adherence: **Strong**
- Priority improvements: (1) Break the 57-word survey enumeration sentence (line 92), (2) Consider splitting the 43-word DCPC introductory sentence (line 69), (3) Minor colon constructions at lines 55 and 59

### Overall Statistics
| Metric | Value |
|--------|-------|
| Total sentences | 52 |
| Mean length | 21.8 words |
| Median length | 20.5 words |
| StdDev | 11.1 words |
| Min | 4 words |
| Max | 57 words |
| Range | 53 words |

**Percentiles:** P10=10, P25=15, P50=20, P75=30, P90=36

**Distribution:** Short (<15): 13 (25%), Medium (15-25): 23 (44%), Long (>25): 16 (31%)

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good — healthy mix of short (4w) to long (57w), StdDev=11.1 |
| S-V-O clarity | Strong — most sentences follow clear S-V-O order |
| Active voice | Excellent — consistent first person ("I build," "I exclude," "I use") throughout |
| Nominalization | One instance: "verticality" (line 79) |
| Tense consistency | Good — present tense used consistently for describing procedures |
| Clause complexity | Two heavily embedded sentences at lines 69 and 92 |
| Parallel structure | Good — parallel lists properly constructed |

**Active voice count:** ~48/52 sentences use active voice (92%). Passive appears at lines 18 ("is made continuous"), 60 ("are classified"), 70 ("acceptance is observed"), and 90 ("was approved"). All passive uses are appropriate.

**Monotonous patterns:** None detected. No runs of 4+ consecutive sentences within a 5-word length range.

### Specific Passage Critiques

### - [ ] Lines 69: Overloaded introductory sentence

**Comment:** The DCPC introduction sentence runs 43 words with two nested parentheticals and an appositive phrase, violating Cochrane's S-V-O clarity principle. The subject ("The Survey and Diary...") is separated from its verb ("provides") by 25 words of institutional attribution.

**Original:**
```
The Survey and Diary of Consumer Payment Choice (DCPC), conducted by the Federal Reserve Bank of Atlanta (2017--2019 waves) through the University of Southern California's Understanding America Study, provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance.
```

**Proposed Revision:**
```
The Survey and Diary of Consumer Payment Choice (DCPC) provides consumer demographics, payment preferences, and transaction-level data on payment choices and merchant card acceptance. The DCPC is conducted by the Federal Reserve Bank of Atlanta through the University of Southern California's Understanding America Study; I use the 2017--2019 waves.
```

**Why better:**
- Subject-verb distance drops from 25 words to 2 words
- Institutional provenance moves to a separate sentence where it does not interrupt the data description

### - [ ] Lines 86-95: 57-word enumeration sentence

**Comment:** The survey description sentence (line 92) at 57 words is by far the longest in the file and violates McCloskey's sentence variety principle by cramming all survey items into one breath. While data appendices tolerate longer sentences, this one could be split without loss.

**Original:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, primary bank and consideration set, second-choice payment if their primary method became unavailable, and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled), plus an attention check.
```

**Proposed Revision:**
```
The survey asked each respondent's primary payment method for in-person transactions (credit, debit, or cash), household income in eight brackets, and primary bank. It then elicited a second-choice payment if the primary method became unavailable and rewards sensitivity (whether credit users would switch if rewards halved; whether debit users would switch if credit rewards doubled). An attention check screened inattentive respondents.
```

**Why better:**
- Breaks a 57-word sentence into three manageable sentences (20w, 27w, 6w)
- Groups related items: demographics first, behavioral questions second, quality control third
- Introduces rhythm variation at the end of the section

### Priority Recommendations
1. **Break line 92** — the 57-word survey enumeration is the clearest structural improvement
2. **Unpack line 69** — the DCPC sentence buries its verb behind 25 words of attribution
3. The file is otherwise well-structured with strong active voice usage and healthy sentence length variation

## [estimation.tex]

### Executive Summary
- Total prose sentences: ~75 (excluding LaTeX tables, comments, labels)
- Mean length: ~21 words
- StdDev: ~10 words (healthy variation)
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) A few consecutive medium-length sentences in the Merchant Types subsection, (2) Minor passive voice clusters

### Overall Statistics
- Short sentences (<15 words): ~15 (e.g., "Three parameters measure wallet interactions." = 5 words; "High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed fees." split)
- Medium sentences (15-25 words): ~40
- Long sentences (>25 words): ~20
- Range: 5 to 48 words
- Distribution is healthy with good variation

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro (4-5) | 2 | 17 | 5 | 13-21 | OK |
| Estimation Procedure (10-16) | 7 | 20 | 8 | 10-30 | Good |
| Consumer Demand (18-55) | 22 | 22 | 11 | 5-48 | Good variation |
| Network Costs (56-59) | 2 | 17 | 4 | 14-20 | Short section, fine |
| Merchant Types (61-81) | 13 | 23 | 8 | 12-35 | Moderate; slight monotony 77-81 |
| Calibrated (83-87) | 3 | 25 | 12 | 12-48 | OK |
| Sensitivities (129-155) | 14 | 21 | 9 | 8-38 | Good |
| Goodness of Fit (157-205) | 15 | 22 | 10 | 7-40 | Good |

### McCloskey/Cochrane Assessment

**Active voice:** Dominant. The paper uses first person ("I estimate," "I recover," "I model," "I set," "I parameterize") consistently. Very few passive constructions.

**Passive instances:**
- Line 46: "are identified by" (could be "identify")
- Line 50: "Demographic data identify" (active, good)
- Line 64: "is an equilibrium outcome" (acceptable copula)
- Line 78: "Two moments identify its shape" (active, good)

**Nominalization:** Minimal. The writing is verb-driven.

**S-V-O clarity:** Strong throughout. Subjects are concrete (I, consumers, networks, merchants, the model).

**Tense consistency:** Present tense for results and model descriptions; past for data collection. Consistent.

### Specific Passage Critiques

### - [ ] Lines 77-81: Four consecutive medium-length sentences (monotonous run)

**Comment:** Lines 77-81 contain four sentences of similar length (18, 27, 16, 15 words) and similar S-V-O structure. The rhythm becomes slightly monotonous.

**Original:**
```
I parameterize $G$ as a two-parameter Gamma distribution.
Two moments identify its shape: the acceptance rate (share of merchants above the marginal type) and networks' first-order conditions on merchant fees (which depend on the density near the marginal type).
Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets.
Networks charge high fees to merchants and use the revenue to fund rewards for price-sensitive consumers, so merchants must be relatively insensitive to fees compared to consumers' sensitivity to rewards.
Given estimates of consumer sensitivity, merchant sensitivity comes from networks' first-order conditions.
```

**Proposed Revision:**
```
I parameterize $G$ as a two-parameter Gamma distribution.
Two moments identify its shape: the acceptance rate (share of merchants above the marginal type) and networks' first-order conditions on merchant fees (which depend on the density near the marginal type).
Given estimated consumer sensitivity, merchant sensitivity follows from those same first-order conditions.
```

**Why better:**
- Cuts the textbook explanation of two-sided pricing, which specialist readers know
- Breaks the monotonous run of similar-length declarative sentences
- "Those same first-order conditions" ties back cleanly to the prior sentence

### - [ ] Lines 46-48: Three consecutive declarative sentences with similar structure

**Comment:** Lines 46-48 are three sentences each starting with a noun phrase and following S-V-O. The rhythm is slightly uniform.

**Original:**
```
Wallet complementarity parameters are identified by multi-homing patterns in the 2017--2019 Homescan data.
Three parameters measure wallet interactions.
The parameter $\chi^{12}$ captures credit's value in the secondary position, $\chi^{21}$ captures a secondary card's value for credit-primary consumers, and $\chi^{22}$ captures the cost of managing two credit accounts.
```

**Proposed Revision:**
```
Multi-homing patterns in the 2017--2019 Homescan data identify the wallet complementarity parameters.
Three parameters measure wallet interactions: $\chi^{12}$ captures credit's value in the secondary position, $\chi^{21}$ captures a secondary card's value for credit-primary consumers, and $\chi^{22}$ captures the cost of managing two credit accounts.
```

**Why better:**
- Flips the passive "are identified by" to active voice
- Merges two sentences with a colon, varying sentence length
- Reduces the count of same-structure declarative sentences

### - [ ] Lines 4-5: Opening paragraph is two medium sentences

**Comment:** The opening is functional but both sentences are roughly the same length (12 and 17 words). A very short or punchy opener could add rhythm. Low priority since the content is fine.

**Original:**
```
Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
The key primitives are consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.
```

**Proposed Revision:**
```
Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
Three primitives matter: consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.
```

**Why better:**
- "Three primitives matter" is shorter and punchier, creating rhythm variation
- Eliminates the vague "key" modifier

### Priority Recommendations
1. Lines 77-81: Trim the two-sided market textbook explanation to improve rhythm and eliminate over-explanation
2. Lines 46-48: Flip passive to active voice for "are identified by"
3. Lines 159-160: Condense the road-mapping sentence for the Goodness of Fit section

## [appendix_model.tex]

### Executive Summary
- Mean: ~13 words, StdDev: ~7.5 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None critical. File is a mathematical derivation appendix with appropriately short, functional prose.

### Overall Statistics

Total prose sentences: ~34 (excluding pure LaTeX commands, equations, labels)
- Mean length: ~13 words
- Median length: ~11 words
- StdDev: ~7.5 words
- Range: 2--30 words
- 10th percentile: ~4 words
- 25th percentile: ~6 words
- 50th percentile: ~11 words
- 75th percentile: ~18 words
- 90th percentile: ~25 words

Distribution: Heavily skewed toward short sentences, appropriate for equation-connecting prose. Good variation between very short ("Collecting terms yields") and longer analytical sentences.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| CES Derivation (lines 15--40) | 14 | 13 | 7 | 4--30 | Good variation |
| Merchant Profits (lines 42--90) | 14 | 12 | 7 | 2--25 | Good variation |
| Linearizing Profits (lines 92--119) | 6 | 13 | 8 | 5--28 | Good variation |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Excellent. Mix of very short directive sentences and longer analytical ones. No monotonous stretches. |
| S-V-O clarity | Strong throughout. Subjects clearly identifiable, verbs concrete, objects follow directly. |
| Active voice | Almost entirely active. "Yields," "gives," "proves," "exploiting" --- no problematic passives. |
| Nominalization | None detected. Verbs used directly: "proves," "weights," "yields." |
| Tense consistency | Consistently present tense, appropriate for mathematical exposition. |
| Parallel structure | Good parallel structure in the profit derivation (lines 53--70). |

### Monotonous Patterns
No sequences of 4+ consecutive sentences within a 5-word range detected. The alternation between short setup sentences and longer explanatory sentences provides natural rhythm.

### Specific Passage Critiques

No passages flagged. The prose in this file is functional mathematical exposition connecting equations. Sentence lengths vary naturally, voice is consistently active, and structure is clear throughout.

### Priority Recommendations
1. No structural revisions needed. This is clean mathematical appendix prose.
2. The only potential improvement (line 95 throat-clearing) is flagged in ai_detection.md and simplifications.md as a low-priority suggestion.

## [reducedform.tex]

## Executive Summary
- Mean: 21.3 words, StdDev: 10.5 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Vary "Figure X shows" / "Online Appendix X presents" openings, (2) Break up long specification-description sentences, (3) Add short punchy sentences to Subsection 3.2

## Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | ~66 |
| Mean length | 21.3 words |
| Median length | 19.0 words |
| Std deviation | 10.5 words |
| Min | 4 words |
| Max | 60 words |
| Range | 56 words |

**Percentiles:** P10=9, P25=15, P50=19, P75=27, P90=33

**Distribution:** Short (<15): 16 (24%), Medium (15-25): 31 (47%), Long (>25): 19 (29%)

The overall statistics are healthy. Mean is within the 15-25 ideal range, standard deviation exceeds the 8-10 threshold, and there is a good mix of short, medium, and long sentences. The file includes several very short sentences (4-9 words) that provide rhythm, and long sentences (40-60 words) for technical specification descriptions.

## Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro (lines 4-6) | 3 | 17.0 | 6.6 | 11-24 | Adequate |
| Sec 3.1 Durbin (lines 10-43) | ~18 | 20.8 | 7.8 | 6-31 | Good |
| Sec 3.2 Acceptance (lines 48-93) | ~22 | 24.1 | 12.3 | 4-60 | Good variation but some very long sentences |
| Sec 3.3 Multi-homing (lines 97-165) | ~18 | 17.9 | 7.0 | 4-33 | Good |
| Sec 3.4 Bottleneck (lines 169-173) | 5 | 17.6 | 7.5 | 9-30 | Good |

## McCloskey/Cochrane Assessment

**Active/Passive voice:** Predominantly active. The author uses "I" consistently ("I use," "I estimate," "I identify," "I define," "I study"). Passive is rare and used appropriately for results descriptions ("Standard errors are clustered," "The treated group is fixed").

**Nominalization:** Minimal. One instance flagged in word choice review (line 48: "identify the causal effect" rather than "estimate how X affects Y").

**S-V-O clarity:** Generally strong. Technical specification sentences (lines 22, 63) are necessarily complex but follow standard econometric convention.

**Tense consistency:** Consistent. Present tense for describing methodology and results, past tense for the Durbin Amendment's historical effects. No jarring shifts.

**Parallel structure:** Good. The three-fact summary (lines 4-6) uses parallel construction. Subsection titles are parallel ("Issuer Incentives Drive...", "Card Acceptance Increases...", "Merchants Multi-home...").

## Monotonous Patterns

**Lines ~48-51 (Sec 3.2 opening):** Four consecutive sentences beginning with "I":
- "I identify the causal effect..." (17w)
- "Between 2014 and 2023, I identify..." (22w) -- note: also repeats "identify"
- "Homescan does not report..." (22w) -- breaks the "I" pattern
- "I then compare..." (29w)

Three of four sentences start with "I" and lengths are within a 12-word range. Mild monotony.

**Lines ~107-108:** Two consecutive "Figure \ref{...} shows" openings (33w, 22w). Template repetition.

**Lines ~42-43:** Two consecutive "Online Appendix \ref{...} presents" openings. Template repetition.

## Specific Passage Critiques

### - [ ] Lines 48-51: "I" sentence opening cluster

**Comment:** Three of four consecutive sentences begin with "I" and two use "identify." McCloskey advises varying sentence openings. The repetition of "identify" in adjacent sentences compounds the issue.

**Original:**
```
I identify the causal effect of credit card acceptance on sales using changes in merchant acceptance policies.
Between 2014 and 2023, I identify multiple instances in the Homescan data where a grocery store begins or stops accepting credit cards.
Homescan does not report acceptance directly, but I infer changes from large shifts in credit card payment shares, validated with news sources.
I then compare the shopping behavior of consumers with high and low credit card usage at treated merchants relative to control grocers that did not change their acceptance policy.
```

**Proposed Revision:**
```
I estimate how credit card acceptance affects sales using changes in merchant acceptance policies.
Between 2014 and 2023, the Homescan data reveal multiple instances where a grocery store begins or stops accepting credit cards.
Homescan does not report acceptance directly, but large shifts in credit card payment shares, validated with news sources, identify these changes.
I then compare the shopping behavior of consumers with high and low credit card usage at treated merchants relative to control grocers that did not change their acceptance policy.
```

**Why better:**
- Eliminates the "I identify" / "I identify" repetition
- Varies sentence subjects (I / data / shifts / I)
- Maintains active voice where it matters (first and last sentences)

### - [ ] Lines 63-66: Long specification description paragraph

**Comment:** Lines 63 and 66 are both very long sentences (60w and 50w+ respectively). Back-to-back long sentences weigh down the paragraph. McCloskey advises varying length.

**Original:**
```
where $y_{hjte}$ is the dollars spent by household $h$ at retailer $j$ in period $t$ of event $e$, $\delta_{ejtkq}$ are event-retailer-period-income quintile-zip code fixed effects, $T_{je} = 1$ for treated grocers that begin to accept credit cards, $T_{je} = -1$ for those that stop, and $C_h$ is household $h$'s credit card share of payments measured in the year prior to the event.
The treated group is fixed within each event based on whether merchants change their acceptance policy, and stores involved in each event do not serve as controls for each other.
The coefficients of interest, $\gamma_k$, capture the dynamic effects of credit card acceptance on sales to credit card users.
I use a Poisson specification following \textcite{Cohn.etal2022}, who show that Poisson regression is preferred for difference-in-differences designs with count-like outcomes bounded by zero.
```

**Proposed Revision:**
```
No full revision proposed — specification description sentences are long by necessity in econometrics. The key sentence lengths here (60w, 30w, 19w, 23w) actually show good variation after the initial variable-definition sentence. The long opener is standard for defining regression variables.
```

**Why better:** N/A — flagged for awareness. The declining sentence length (60 → 30 → 19 → 23) provides natural deceleration after the dense specification.

### - [ ] Lines 107-108: Template repetition "Figure X shows"

**Comment:** Consecutive sentences both open with "Figure \ref{...} shows." Sentence openings should vary per McCloskey.

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

**Why better:**
- Varies sentence opening
- Puts the claim first, figure reference parenthetically
- Reads as argument rather than figure walkthrough

## Priority Recommendations

1. **Vary figure/appendix reference openings (lines 42-43, 107-108):** The "Figure X shows" and "Online Appendix X presents" templates are the most noticeable structural repetition. Integrate references parenthetically for at least one of each pair.
2. **Break "I identify" repetition (lines 48-49):** Two consecutive uses of the same verb in adjacent sentences. Use a different verb or restructure the subject.
3. **Overall assessment is strong:** The file has good sentence length variation (StdDev 10.5), active voice throughout, clear S-V-O structure, and consistent tense. The issues are minor and localized.

## [conclusion.tex]

### Executive Summary
- Mean: 14.4 words, StdDev: 6.6 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Tighten the closing sentence (line 19) where a relative clause delays the main verb

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 15 |
| Mean length | 14.4 words |
| Median length | 13 words |
| StdDev | 6.6 words |
| Range | 5--28 words |
| 10th percentile | 5.4 |
| 25th percentile | 9.5 |
| 50th percentile | 13 |
| 75th percentile | 17.5 |
| 90th percentile | 23 |

**Sentence lengths (in order):** 11, 25, 16, 13, 21, 14, 13, 6, 11, 5, 15, 8, 19, 11, 28

**Distribution:**
- Short (< 12 words): 6 sentences (40%)
- Medium (12--25 words): 8 sentences (53%)
- Long (> 25 words): 1 sentence (7%)

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Excellent. Lengths range from 5 to 28 words with deliberate variation. Short punchy sentences alternate with longer analytical ones. |
| S-V-O clarity | Nearly every sentence follows clean subject-verb-object order. No convoluted embeddings except line 19. |
| Active voice | All 15 sentences use active voice. Zero passive constructions. |
| Nominalization | One instance: "offers a framework for quantifying" (line 19) could be "can quantify." |
| Tense consistency | Present tense throughout. Conditionals ("would raise," "would also raise") used appropriately for counterfactuals. |
| Parallel structure | Strong. Lines 7-8 ("Policies that steer... lower costs... Unfettered competition... raises them.") and lines 16-17 ("Price coherence creates..." / "The competitive bottleneck determines...") |

### Monotonous Patterns

No monotonous stretches detected. No run of 4+ consecutive sentences falls within a 5-word range. The StdDev of 6.6 is slightly below the ideal 8-10 range, but the 5-word minimum and 28-word maximum show the variation is real -- the slightly lower StdDev reflects consistently tight writing rather than robotic uniformity.

### Specific Passage Critiques

### - [ ] Lines 18-19: Closing sentence delays main verb with relative clause

**Comment:** The final sentence at 28 words carries a relative clause ("which uses variation on one side of the market to identify preferences on both sides") that separates the subject ("My empirical approach") from its main verb ("offers") by 14 words. This is the one place where S-V-O clarity weakens slightly.

**Original:**
```
My empirical approach, which uses variation on one side of the market to identify preferences on both sides, offers a framework for quantifying welfare effects in these settings.
```

**Proposed Revision:**
```
My empirical approach---using variation on one side of the market to identify preferences on both sides---can quantify welfare effects in these settings.
```

**Why better:**
- Converts the relative clause to a parenthetical, making the main S-V-O ("My approach can quantify") clearer
- Shortens the sentence from 28 to 25 words
- Replaces the indirect "offers a framework for quantifying" with the direct "can quantify"

### Priority Recommendations

1. **Line 19 closing sentence:** The only sentence where directness flags. Convert "offers a framework for quantifying" to "can quantify" and tighten the relative clause.
2. No other structural issues. The conclusion is an exemplar of varied, active, direct writing.

## [main.tex]

### Executive Summary
- Mean: 20.7 words, StdDev: 9.5 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Vary the three results sentences to break the parallel template

### Overall Statistics (Abstract only, lines 42-51)

| Metric | Value |
|--------|-------|
| Total sentences | 6 |
| Mean length | 20.7 words |
| Median length | 19.5 words |
| StdDev | 9.5 words |
| Range | 9-35 words |
| Short (<15) | 2 (33%) |
| Medium (15-25) | 2 (33%) |
| Long (>25) | 2 (33%) |

Sentence lengths: 9, 16, 11, 23, 17, 9

**Distribution:** Healthy variation. StdDev of 9.5 exceeds the 8-10 threshold. Good mix of short, medium, and long sentences. No monotonous runs of 4+ consecutive sentences within a 5-word range.

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Active voice | Strong -- all sentences use active voice ("networks fund," "I develop," "competition inflates") |
| S-V-O clarity | Strong -- subjects and verbs are close together throughout |
| Nominalization | None detected |
| Tense consistency | Good -- present tense throughout the abstract |
| Parallel structure | See critique below |

### Specific Passage Critiques

### - [ ] Lines 45-49: Three consecutive results sentences with parallel structure

**Comment:** Lines 45, 47, and 49 each follow the pattern "[Subject] [verb] welfare by $[N] billion." While individually clear, the three consecutive parallel constructions create a slightly list-like rhythm. McCloskey advises varying construction for better prose rhythm.

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

**Why better:**
- Breaks the three-way parallel template with a rhetorical question
- Third sentence now links causally to the second ("this competition") rather than standing independently
- Preserves the punchline closing sentence ("The direction of competition matters more than its intensity")

### Monotonous Patterns

No runs of 4+ consecutive sentences within a 5-word range detected.

### Priority Recommendations

1. Consider varying the three results sentences (lines 45-49) to break the parallel "[Policy] [verb] welfare by $N" template -- low priority since the abstract is otherwise strong.

## [intro.tex]

### Executive Summary
- Total sentences: 83
- Mean: 16.8 words, StdDev: 5.9 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Slightly low StdDev suggests some sentence-length uniformity; (2) Medium-length sentences (12-25 words) dominate at 75%; (3) A few monotonous runs in the model description and literature review paragraphs

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 83 |
| Mean length | 16.8 words |
| Median length | 17.0 words |
| Std deviation | 5.9 words |
| Min | 4 words |
| Max | 36 words |
| Range | 32 words |

**Percentiles:**
- P10: 10 words
- P25: 13 words
- P50: 17 words
- P75: 21 words
- P90: 23 words

**Distribution:**
- Short (<12 words): 16 sentences (19%)
- Medium (12-25 words): 62 sentences (75%)
- Long (>25 words): 5 sentences (6%)

### McCloskey/Cochrane Assessment

**Active Voice:** Strong. The author uses first-person active voice throughout ("I argue," "I quantify," "I build," "I estimate," "I simulate," "I find," "I model"). 9 sentences begin with "I." No passive constructions detected in the main text.

**S-V-O Clarity:** Strong. Most sentences follow clear subject-verb-object order. Complex sentences (e.g., lines 48, 95, 122) use parallel structure rather than deep embedding.

**Sentence Variety:** Moderate. StdDev of 5.9 is below the healthy threshold of 8-10. The introduction has good extremes (4-word and 36-word sentences) but the bulk clusters in the 13-22 range. The opening paragraph does well with a 7-word punch ("I argue that this view is backwards.") followed by longer analytical sentences. The model description paragraph (lines 40-43) is the weakest for variety (22, 17, 17, 15).

**Nominalization:** Clean. No "make a calculation" or "conduct an analysis" patterns. Verbs are concrete throughout.

**Tense Consistency:** Consistent. Present tense for model description and results; past tense not used inappropriately.

**Parallel Structure:** Good. Line 122 uses strong parallel construction ("Assuming X overstates...; merchant homogeneity rules out...; and ignoring Z understates..."). Line 84-91 uses "First... Second..." effectively.

### Monotonous Patterns

**Lines 40-43 (model description):** Four consecutive sentences with lengths 22, 17, 17, 15. All follow a similar "Subject [verb] [object] by/as/to [complement]" structure. This paragraph describes the model setup and naturally has a listing quality, but varying sentence length or merging two short sentences could improve rhythm.

**Lines 32-36 (reduced-form facts):** Four consecutive sentences with lengths 23, 18, 19, 18. The "Second... Third..." enumeration creates structural uniformity. This is somewhat inherent to enumerating facts.

**Lines 123-127 (literature review):** Four consecutive sentences with lengths 17, 14, 14, 16. The lit review closes with similarly sized sentences. This section is naturally compact, but some variation would help.

### Specific Passage Critiques

### - [ ] Lines 40-43: Model description paragraph has uniform rhythm

**Comment:** Four sentences all describe model agents (consumers, merchants, networks) and their actions. Each sentence is 15-22 words with nearly identical "Subject does X as a function of/to maximize Y" structure. This creates a list-like rhythm.

**Original:**
```
Consumers adopt the best bundle of payment methods as a function of rewards, payment acceptance, and exogenous non-price characteristics.
Merchants accept the combination of cards and set retail prices to maximize profits after paying merchant fees.
Multiproduct networks maximize profits by setting fees and rewards, balancing merchant acceptance against consumer adoption.
```

**Proposed Revision:**
```
Consumers adopt the best bundle of payment methods based on rewards, acceptance, and non-price characteristics.
Merchants choose which cards to accept and set retail prices to maximize profits net of merchant fees.
Networks set fees and rewards, balancing merchant acceptance against consumer adoption.
```

**Why better:**
- Varies sentence length more (14, 17, 11 vs. 17, 17, 15)
- "Networks" as short subject vs. "Multiproduct networks" trims padding
- "based on" is lighter than "as a function of" in an intro paragraph

### - [ ] Lines 125-127: Literature review ending has uniform sentence lengths

**Comment:** Three consecutive sentences of 14, 14, 16 words. The similar lengths create a metronomic effect at the close of the section.

**Original:**
```
My paper also contributes to the literature on platform pricing and off-platform outcomes.
Under price coherence, merchant fees strongly influence retail prices, explaining the welfare gains from fee caps.
Sullivan finds that commission caps reduce welfare in food delivery, where price coherence is absent.
```

**Proposed Revision:**
```
My paper also contributes to the literature on platform pricing and off-platform outcomes.
Under price coherence, merchant fees strongly influence retail prices, explaining the welfare gains from fee caps. By contrast, Sullivan finds that commission caps reduce welfare in food delivery, where price coherence is absent.
```

**Why better:**
- Merging the last two sentences creates a 14-word + 28-word pair rather than three ~15-word sentences
- "By contrast" makes the Sullivan comparison explicit rather than relying on juxtaposition

### Most Common Sentence Starters

| Starter | Count |
|---------|-------|
| I | 9 |
| The | 6 |
| This | 5 |
| In | 4 |
| Consumers | 4 |
| These | 3 |
| Networks | 3 |
| But | 3 |
| A | 3 |
| Under | 3 |

The variety of starters is healthy. "I" is most common but appropriate for a single-authored paper's introduction. No starter dominates excessively.

### Priority Recommendations

1. **Vary the model description paragraph (lines 40-43):** The three agent-description sentences have the most uniform structure. Vary sentence length and construction.
2. **Add more short punches in the middle sections:** The opening has a strong 4-word and 7-word sentence, but the middle paragraphs (model, estimation, counterfactuals) lack short emphatic sentences. Consider breaking up some 17-22 word sentences.
3. **Literature review closing (lines 125-127):** Three similarly-sized sentences in a row. Merge or vary.

## [appendix_sorting.tex]

## Executive Summary
- Mean: 18.6 words, StdDev: 8.4 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Vary sentence openings in concluding subsection, (2) Break up derivation passage monotony, (3) Reduce consecutive medium-length sentences in data description

## Overall Statistics
- Total sentences: 80
- Mean length: 18.6 words
- Median length: 18.0 words
- Standard deviation: 8.4 words
- Range: 4--36 words
- 10th percentile: 8 words
- 25th percentile: 13 words
- 75th percentile: 26 words
- 90th percentile: 30 words

Distribution:
- Short (<15 words): 28 (35%)
- Medium (15-25 words): 32 (40%)
- Long (>25 words): 20 (25%)

Assessment: Healthy distribution. StdDev of 8.4 is within the target range (>=8). Good mix of short punchy sentences and longer analytical ones. The 35% short-sentence share indicates the writing avoids AI-typical uniformity.

## Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Sorting Concern (lines 7-20) | 10 | 15.8 | 5.8 | 11-26 | Adequate; slightly low variation |
| Structure of Analysis (lines 22-27) | 4 | 14.5 | 6.1 | 5-19 | Good; nice short opener |
| Measuring Payment Shares (lines 29-43) | 16 | 19.1 | 7.9 | 8-35 | Good |
| Sufficient Statistics (lines 129-175) | 20 | 19.7 | 9.8 | 4-36 | Strong variation |
| Implementing (lines 177-197) | 18 | 17.5 | 8.7 | 4-36 | Strong variation |
| Implications (lines 243-253) | 8 | 19.9 | 8.2 | 7-31 | Good |

## McCloskey/Cochrane Assessment

**Active/Passive voice:** Predominantly active. "We measure," "We derive," "I classify," "I assume." Passive appears in technical derivation (lines 146-161) where it is appropriate ("welfare is measured using," "the welfare effect is"). No problematic passive constructions found.

**Nominalization:** Minimal. One instance: "understating sorting and overstating surviving redistribution" (line 41) -- flagged in word choice review. Otherwise the prose uses finite verbs.

**S-V-O clarity:** Strong throughout. Subject-verb distance is short in nearly all sentences. The derivation section necessarily has longer mathematical sentences but maintains clarity.

**Tense consistency:** Consistent. Present tense for describing data and results; conditional ("would") for hypotheticals about sorting. No jarring tense shifts.

**Parallel structure:** Good parallel construction in lines 24-27 ("First... Second... Third..."). The concluding subsection (lines 243-253) maintains parallel structure across its claims.

## Monotonous Patterns

### - [ ] Lines 9-16 (approx sentences 1-6): Mild monotony in opening

**Comment:** Six sentences with lengths [18, 21, 25, 14, 12, 16] -- four of the six (14, 12, 16, 11) fall within a 5-word range. The opening subsection has adequate variation overall but the cluster of short-to-medium sentences in lines 13-17 creates a mild rhythmic uniformity.

**Original:**
```
We measure payment shares across hundreds of merchants using Nielsen Homescan and MRI-Simmons data.
Some sorting exists, but no large merchant serves only one payment type.
Even merchants at the 90th percentile of credit card use receive 15\% of transactions from debit/cash.
We derive a sufficient statistic linking sorting patterns to redistribution magnitude.
```

**Proposed Revision:**
```
We measure payment shares across hundreds of merchants using Nielsen Homescan and MRI-Simmons data.
Some sorting exists, but no large merchant serves only one payment type: even at the 90th percentile of credit card use, 15\% of transactions come from debit and cash.
We derive a sufficient statistic linking sorting patterns to redistribution magnitude.
```

**Why better:**
- Combines two short sentences into one, breaking the run of similar-length sentences
- The combined sentence flows naturally since the second provides evidence for the first

### - [ ] Lines 187-196: String of medium-length declaratives in results discussion

**Comment:** The implementing subsection has a stretch of sentences (lines 187-196) that are predominantly medium-length declaratives, each beginning with a noun phrase and delivering one fact. While individually clear, the rhythm becomes somewhat flat. Lengths: [4, 22, 14, 36, 10, 30, 8, 23, 14, 25]. The variation is actually good numerically (StdDev 8.7), and the short sentences ("Sorting effects are small." and "These signs match...") provide welcome punches. Flagging only as awareness.

**Original:**
```
Sorting effects are small.
Table \ref{tab:welfare_ratio} shows ratios of welfare loss with actual sorting to welfare loss with homogeneous merchants; most ratios are close to 1.
Diagonal cells (row $l$ = column $m$) exceed 1, meaning sorting amplifies own-fee exposure.
```

**Proposed Revision:**
```
No revision proposed -- the short opener "Sorting effects are small." is effective and the passage has good numerical variation. The declarative style suits a results discussion.
```

**Why better:** N/A -- flagged for awareness only.

## Priority Recommendations
1. **Colon constructions:** The file has 5-6 colon constructions introducing independent clauses. Splitting the most prominent ones (lines 173-174, 245, 252) would reduce the AI-typical CLAUSE: LONGER CLAUSE pattern without changing the argument.
2. **Opening subsection rhythm:** The cluster of four similar-length sentences in lines 13-17 could be varied by combining two of them.
3. **Overall assessment:** The writing is strong. Sentence length variation is healthy, active voice dominates, and the derivation section balances mathematical precision with readable prose. The main structural improvement opportunity is the recurring colon pattern.

## [appendix_reduced.tex]

### Executive Summary
- Mean: 21.3 words, StdDev: 9.8 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Vary paragraph-heading sentence patterns, (2) Break the 57-word enumeration on line 294, (3) Add short punchy sentences to the mechanism subsection

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences (prose only) | 52 |
| Mean length | 21.3 words |
| Median length | 20 words |
| StdDev | 9.8 words |
| Range | 6-44 words |
| 10th percentile | 10 |
| 25th percentile | 14 |
| 50th percentile | 20 |
| 75th percentile | 27 |
| 90th percentile | 35 |

Distribution: 14 short (<15), 22 medium (15-25), 16 long (>25). Healthy mix with good variation.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Durbin Robustness (lines 6-106) | 16 | 22.1 | 10.2 | 6-44 | Good variation |
| Mechanism (lines 108-182) | 12 | 20.8 | 8.9 | 8-38 | Good |
| Discover Rewards (lines 184-305) | 10 | 21.5 | 10.1 | 9-39 | Good |
| Card Acceptance (lines 307-327) | 4 | 22.5 | 8.6 | 14-34 | Small sample; acceptable |
| Consumer Multi-homing (lines 328-346) | 4 | 23.8 | 7.2 | 16-33 | Slightly uniform |
| Second Choice Survey (lines 348-444) | 10 | 20.4 | 11.3 | 6-42 | Good variation |
| Credit Aversion (lines 446-477) | 6 | 19.7 | 8.4 | 10-30 | Good |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good overall. StdDev of 9.8 is healthy. Mix of short and long sentences. |
| S-V-O clarity | Strong throughout. Subjects and verbs are generally close together. |
| Active voice | Predominantly active ("I focus," "I compare," "I collect," "I restrict"). A few natural passives ("are classified," "have been dropped"). |
| Nominalization | Mild: "cross-subsidization" (line 110), "acquisitions or divestitures" (line 75). Both are standard economics terms. |
| Tense consistency | Present tense for describing results and data; past tense for policy events (Durbin). Appropriate shifts. |
| Parallel structure | Good. Line 310 uses clean parallel: "cash, then debit, then Visa/MC, then AmEx." |

### Specific Passage Critiques

### - [ ] Lines 293-294: Long specification sentence

**Comment:** The specification description "where $y_{it}$ is a spending or payment outcome with household and time fixed effects, standard errors clustered at the household level" is 20 words of prose plus math, but the trailing fragment "standard errors clustered at the household level" is appended without a verb. This is common in economics but technically a fragment.

**Original:**
```
where $y_{it}$ is a spending or payment outcome with household and time fixed effects, standard errors clustered at the household level.
```

**Proposed Revision:**
```
where $y_{it}$ is a spending or payment outcome. I include household and time fixed effects and cluster standard errors at the household level.
```

**Why better:**
- Eliminates the trailing fragment
- Gives the estimation details their own sentence with a subject and verb

### - [ ] Lines 310-314: Effective but dense pair of sentences

**Comment:** Lines 310-314 pack a lot of information into two sentences. The first (34 words) lists the hierarchy; the second (28 words) lists co-mention patterns. Both are substantive and well-structured, but reading them in sequence demands concentration. A short sentence between them would help the reader absorb the hierarchy before seeing the evidence.

**Original:**
```
Yelp reviews show a clear hierarchy in merchant acceptance: merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network.
Across roughly 3,000 reviews mentioning at least two payment methods, Figure \ref{fig:merchant-multihoming} documents the pattern: reviews mention debit and credit together, Visa with MC, Visa without AmEx, and debit without credit.
```

**Proposed Revision:**
```
Yelp reviews show a clear hierarchy in merchant acceptance: merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network.
The pattern is consistent.
Across roughly 3,000 reviews mentioning at least two payment methods, Figure \ref{fig:merchant-multihoming} documents: reviews mention debit and credit together, Visa with MC, Visa without AmEx, and debit without credit.
```

**Why better:**
- A three-word bridge sentence breaks the rhythm between two dense sentences
- Gives the reader a moment to absorb the hierarchy before the evidence

### - [ ] Lines 420-427: Dense technical paragraph with long sentences

**Comment:** The formal notation paragraph (lines 420-427) has four consecutive medium-to-long sentences defining notation. Each sentence introduces new symbols ($r_i$, $N_c$, $N_d$, $S_{i,1}$, etc.). This is standard for a technical appendix and not an error, but the paragraph could benefit from a short orienting sentence at the start.

**Original:**
```
Formally, let $r_{i}\in\left\{ \text{CC},\text{DC}\right\}$ denote the primary card of survey respondent $i$.
Let $N_{c}=\sum_{i}I\left\{ r_{i}=\text{CC}\right\}$ be the number of primary credit card consumers, $N_{d}=\sum_{i}I\left\{ r_{i}=\text{DC}\right\}$ be the number of debit card consumers, and $N=N_d + N_c$.
Primary cash consumers have already been dropped from the sample.
```

**Proposed Revision:**
```
No revision proposed. The notation block follows standard conventions for a technical appendix. The short sentence "Primary cash consumers have already been dropped from the sample" provides adequate rhythm variation.
```

**Why better:** N/A -- flagged for awareness only.

### Monotonous Patterns

No stretches of 4+ consecutive sentences within a 5-word range detected. The file maintains healthy variation throughout.

### Priority Recommendations
1. Consider splitting the specification description on line 294 to eliminate the trailing fragment
2. The Yelp hierarchy passage (lines 310-314) would benefit from a short bridging sentence
3. Overall the file reads well -- sentence variety is strong for an appendix that mixes empirical results with technical details

## [model.tex]

### Executive Summary
- Mean: 19.7 words, StdDev: 14.1 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Opening paragraph monotonous run, (2) Sequential "In the Nth stage" pattern, (3) Minor passive voice in assumptions section

### Overall Statistics
- Total sentences: 93
- Mean: 19.7, Median: 16.0, StdDev: 14.1
- Min: 4, Max: 88, Range: 84
- P10: 8, P25: 11, P50: 16, P75: 25, P90: 34
- Short (<15): 39 (42%), Medium (15-25): 31 (33%), Long (>25): 23 (25%)

The sentence length distribution is healthy. StdDev of 14.1 exceeds the 8-10 minimum. Good mix of short punchy sentences ("One card is the primary." 6 words; "Those without cards pay cash." 5 words) and longer analytical sentences. No robotic uniformity.

### McCloskey/Cochrane Assessment

**Active/Passive:** 89 active, 4 passive. Excellent. The author consistently uses "I" + active verb ("I develop," "I model," "I omit," "I adopt," "I assume," "I focus," "I set"). Passive instances are appropriate (e.g., "are segmented," "are fully informed").

**Nominalization:** Minimal. The text uses strong verbs throughout: "captures," "governs," "weights," "derives," "trades off," "sets," "incurs." No "make a calculation" or "conduct an analysis" patterns.

**S-V-O Clarity:** Strong throughout. Subjects are concrete (consumers, merchants, networks, the model), verbs are active, objects are specific.

**Tense Consistency:** Present tense used consistently for model description. No jarring shifts.

**Parallel Structure:** Generally strong. The assumption paragraphs follow a consistent pattern (name assumption, state it, give evidence, acknowledge alternatives).

### Monotonous Patterns

### - [ ] Lines 4-12: Opening run of similar-length sentences

**Comment:** Sentences 1-4 are 17, 22, 18, 17 words -- all within a 5-word range. The opening paragraph and first paragraph of "Structure of the Game" blend together in rhythm. The mechanical "In the first/second/third stage" pattern compounds this.

**Original:**
```
I develop a structural model of payment network competition with two-sided multi-homing, merchant competition, and price coherence.
The model quantifies how the mix of single-homing and multi-homing consumers shapes network competition, and evaluates fee caps, mergers, and routing mandates.
I model competition between card networks as a static game with three stages between networks, consumers, and merchants.
In the first stage, profit-maximizing networks set per-transaction fees for merchants and promised adoption utility for consumers.
```

**Proposed Revision:**
```
I develop a structural model of payment network competition with two-sided multi-homing, merchant competition, and price coherence.
The model quantifies how the mix of single-homing and multi-homing consumers shapes network competition, and evaluates fee caps, mergers, and routing mandates.

Networks, consumers, and merchants play a static game. Networks move first, setting per-transaction fees and promised adoption utility. Consumers and merchants then make adoption and pricing decisions. Finally, consumers make consumption decisions over merchants.
```

**Why better:**
- Breaks the monotonous 17-22-18-17 word pattern by introducing a short opener ("Networks, consumers, and merchants play a static game." -- 9 words)
- Removes the mechanical "In the Nth stage" enumeration
- Creates rhythmic variety: 9, 11, 10, 8 words in the stage descriptions

### Specific Passage Critiques

### - [ ] Lines 40-43: Four consecutive short sentences

**Comment:** Lines 40-43 have four consecutive short declarative sentences (varying 5-14 words). While individually fine, the sequence reads slightly staccato. This is within acceptable range for a model description that is defining cases, so no revision is strictly needed. Flagging for awareness only.

**Original:**
```
At the point of sale, consumers' primary and secondary cards and merchant acceptance determine payment behavior.
Consumers may use zero, one, or two cards.
Those without cards pay cash.
Those with one card pay with it if the merchant accepts it and otherwise pay cash.
```

**Proposed Revision:**
```
No revision proposed. The staccato rhythm is appropriate here: each sentence defines a case in the payment decision tree, and the short parallel structure aids comprehension.
```

**Why better:** N/A -- flagged for awareness only.

### - [ ] Lines 300-304: Long analytical sentence followed by another long sentence

**Comment:** Lines 300-304 contain two consecutive sentences of 29 and 30+ words, both describing alternative model specifications. The passage is dense but substantively necessary.

**Original:**
```
This assumption is at odds with the intuition that debit is a closer substitute to credit than cash.
Online Appendix \ref{subsec:oa-credit-debit-segmentation} estimates an alternative model allowing credit-debit substitution, at the cost of assuming debit generates no incremental sales relative to cash and that the cost of cash equals the merchant fee on debit cards.
```

**Proposed Revision:**
```
This assumption is at odds with the intuition that debit is a closer substitute to credit than cash.
Online Appendix \ref{subsec:oa-credit-debit-segmentation} relaxes it, allowing credit-debit substitution. That alternative requires assuming debit generates no incremental sales relative to cash and that the cost of cash equals the debit merchant fee.
```

**Why better:**
- Splits a 30+ word sentence into two shorter ones
- "Relaxes it" provides a cleaner verb than "estimates an alternative model allowing"
- The trade-off ("at the cost of assuming") becomes a separate sentence with its own emphasis

### Priority Recommendations
1. **Opening paragraph rhythm (Lines 4-12):** Break the monotonous 17-22-18-17 word pattern and remove mechanical stage enumeration. This is the reader's first impression of the model section.
2. **Throat-clearing (Line 287):** Cut "I discuss the evidence for these assumptions below." It adds nothing.
3. **Dense alternative-spec sentence (Lines 300-304):** Split the 30+ word sentence describing the alternative credit-debit specification for readability.

## [appendix_estimation.tex]

## Executive Summary
- Mean: 17.1 words, StdDev: 6.6 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Three uses of "directly" as filler adverb, (2) One passive construction on line 73, (3) StdDev slightly below 7 threshold

## Overall Statistics
- Total sentences: ~51 (prose only, excluding display math)
- Mean: 17.1 words
- Median: 17.0 words
- StdDev: 6.6 words
- Min: 4, Max: 35
- P10: 9, P25: 12, P75: 20, P90: 24
- Short (<15 words): 18 (35%)
- Medium (15-25 words): 28 (55%)
- Long (>25 words): 5 (10%)

## Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro + Bootstrap (7-13) | 5 | 12.8 | 4.1 | 7-18 | Good short/punchy mix |
| Second-Choice Survey (19-28) | 7 | 14.9 | 5.8 | 4-24 | Good variation |
| Durbin Event Study (32-34) | 4 | 17.3 | 5.4 | 11-24 | Adequate |
| DCPC + Income (38-50) | 8 | 19.5 | 8.6 | 7-31 | Strong variation |
| Homescan (54-75) | 13 | 16.8 | 6.3 | 8-31 | Good |
| Dollar Shares (79-86) | 4 | 16.5 | 3.7 | 12-20 | Slightly uniform |
| Merchant Side (90-99) | 10 | 18.7 | 5.6 | 12-35 | Adequate |

## McCloskey/Cochrane Assessment

**Active/Passive count:** Predominantly active voice throughout. The first person "I" is used consistently for author actions ("I estimate," "I match," "I compute," "I set," "I observe"). One notable passive: "It is pinned down by..." (line 73).

**Nominalization:** None detected. Verbs are concrete: "pins down," "redraws," "perturbs," "measures," "computes."

**S-V-O clarity:** Strong. Most sentences follow clear Subject-Verb-Object order. No convoluted embeddings.

**Tense consistency:** Present tense used consistently throughout for model descriptions and moment constructions. Past tense for the Durbin Amendment historical event (line 32: "cut"). Appropriate.

**Parallel structure:** Good. Lines 70 use parallel construction: "The averages ... identify ...; the differences ... identify ...."

## Specific Passage Critiques

### - [ ] Lines 22-26: Long sentence with nested parentheticals

**Comment:** Line 22 runs to ~40 words with "(debit)" parenthetical insertions creating a complex sentence. The main clause is clear but the parenthetical debit/credit alternation adds cognitive load.

**Original:**
```
The survey asks credit (debit) card users what they would use if credit (debit) cards did not exist. The data moments are the shares switching to cash. The model analogs drop all credit (debit) wallets from the choice set and compute the cash-switching share:
```

**Proposed Revision:**
```
The survey asks credit card users what they would use if credit cards did not exist; the debit question is analogous. The data moments are the shares switching to cash. The model analog drops all credit wallets from the choice set and computes the cash-switching share:
```

**Why better:**
- Removes the repeated "(debit)" parenthetical pattern that forces double-reading
- Semicolon handles the debit case concisely

### - [ ] Lines 90-91: 35-word sentence with enumeration

**Comment:** The merchant-side parameters sentence is the longest in the file at 35 words. It packs a list of parameters and their identification into a single sentence.

**Original:**
```
The merchant-side parameters are: network marginal costs $c_j$ for five networks, merchant benefit distribution parameters ($\bar{\gamma}$, $\nu_\gamma$, $\sigma_\gamma$), and additive fee adjustments for MC Credit and AmEx, all jointly identified by the following moment conditions.
```

**Proposed Revision:**
```
The merchant-side parameters include network marginal costs $c_j$ for five networks, merchant benefit distribution parameters ($\bar{\gamma}$, $\nu_\gamma$, $\sigma_\gamma$), and additive fee adjustments for MC Credit and AmEx. These are jointly identified by the following moment conditions.
```

**Why better:**
- Splits 35-word sentence into two manageable sentences
- Separates the enumeration from the identification claim

### - [ ] Lines 79-86: Slightly uniform section (StdDev 3.7)

**Comment:** The Dollar Shares subsection has four sentences with lengths 12, 14, 14, 20 -- StdDev of 3.7, below the 7-word threshold for healthy variation. All four sentences are medium-length declaratives.

**Original:**
```
From the Nilson Report (2019), I compute dollar spending shares by network.
The model analog uses Equation \ref{eq:dollars}:
These moments pin down mean unobserved characteristics $\bar{\xi}_j$.
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households, justifying the focus on dollar shares.
```

**Proposed Revision:**
```
From the Nilson Report (2019), I compute dollar spending shares by network.
The model analog uses Equation \ref{eq:dollars}:
These moments pin down mean unobserved characteristics $\bar{\xi}_j$.
Spending-weighted moments, not consumer counts, capture the concentration of card spending among high-income households. This justifies the focus on dollar shares.
```

**Why better:**
- Splitting the last sentence adds a short sentence (6 words) to break the uniformity
- StdDev improves with the addition of a short sentence

## Monotonous Patterns

No sequences of 4+ consecutive sentences within a 5-word range detected. The file has good natural variation across most sections. The Dollar Shares section (lines 79-86) is the closest to monotonous but has only 4 sentences total, which is acceptable for a short subsection.

## Priority Recommendations
1. **Split line 90 sentence** -- at 35 words, it is the longest in the file and packs enumeration with identification into one breath
2. **Vary Dollar Shares section** -- split the participial ending on line 86 to add a short sentence and improve rhythm
3. **Eliminate repeated "directly"** -- three occurrences (lines 45, 49, 99) of this filler adverb; cutting all three tightens the prose without losing meaning

## [appendix_model_oa.tex]

### Executive Summary
- Mean: 22.8 words, StdDev: 10.4 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Lines 171-174 monotonous medium-length sentences, (2) Lines 91 run-on with multiple semicolons, (3) Lines 263-276 algorithmic enumeration reads as list

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total prose sentences | 62 |
| Mean length | 22.8 words |
| Median length | 21 words |
| StdDev | 10.4 words |
| Range | 5-42 words |
| 10th percentile | 10 words |
| 25th percentile | 15 words |
| 75th percentile | 29 words |
| 90th percentile | 37 words |

Distribution: healthy mix of short (<15: 16 sentences), medium (15-25: 25 sentences), and long (>25: 21 sentences). StdDev of 10.4 indicates good variation.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Consumer Payment Probs (8-13) | 4 | 20.3 | 11.4 | 10-37 | Good variation |
| Acceptance Thresholds (41-62) | 8 | 20.5 | 8.9 | 10-35 | Good |
| Two Credit Cards (81-91) | 5 | 24.0 | 12.1 | 11-42 | Good variation |
| Credit-Debit Baseline (97-101) | 4 | 19.5 | 6.2 | 11-25 | Adequate |
| Credit-Debit POS (105-117) | 5 | 25.4 | 9.8 | 13-38 | Good |
| Empirical Evidence (123-157) | 14 | 22.1 | 9.2 | 10-35 | Good |
| Microfoundation (171-233) | 16 | 23.9 | 10.0 | 8-38 | Good |
| Conduct (237-250) | 8 | 19.6 | 8.5 | 6-30 | Good |
| Solution Algorithm (263-286) | 5 | 14.2 | 5.1 | 9-21 | Slightly short |
| Validation (291-296) | 4 | 13.5 | 5.0 | 8-20 | Short but appropriate for figure captions |

### McCloskey/Cochrane Assessment

**Active/Passive balance:** Mostly active voice throughout. The file uses "I introduce" (248), direct constructions like "A merchant already accepting card 1 decides..." (43), "Multi-homers switch..." (82). Passive appears sparingly and appropriately: "Second-order conditions are verified numerically" (285), "All caps are confirmed binding" (286). Balance is healthy.

**Nominalization:** Minimal. No instances of "make a calculation" or "conduct an analysis." Verbs are concrete.

**S-V-O clarity:** Strong. Sentences generally follow subject-verb-object order. Complex mathematical content is handled with clear referents.

**Tense consistency:** Present tense used consistently throughout, appropriate for describing model mechanics.

**Parallelism:** Good parallel structure in bullet lists (lines 46-48, 146-152). The merchant testimony list (146-152) uses appropriate parallel construction with company names as subjects.

### Specific Passage Critiques

### - [ ] Lines 91: Run-on with four semicolon-separated clauses

**Comment:** Line 91 contains four claims separated by semicolons, creating a 42-word compound sentence. Each clause makes a distinct comparative-statics point. This weakens readability -- the reader must hold four separate results in mind across one sentence.

**Original:**
```
By inspection, cutting $\tau_1$ raises $\underline{\gamma}_2$ by widening $\tau_2 - \tau_1$, which increases diversion drag without changing incremental sales; if $D = 0$ (no multi-homers) the threshold reduces to $\sigma\tau_2/(1-\sigma\tau_2)$; if $N \to 0$ (no single-homers) $\underline{\gamma}_2 \to \infty$; and if $\tau_2 = \tau_1$ the threshold collapses to $\underline{\gamma}_1$.
```

**Proposed Revision:**
```
By inspection, cutting $\tau_1$ raises $\underline{\gamma}_2$ by widening $\tau_2 - \tau_1$, which increases diversion drag without changing incremental sales. Special cases confirm the intuition: if $D = 0$ (no multi-homers), the threshold reduces to $\sigma\tau_2/(1-\sigma\tau_2)$; if $N \to 0$ (no single-homers), $\underline{\gamma}_2 \to \infty$; and if $\tau_2 = \tau_1$, the threshold collapses to $\underline{\gamma}_1$.
```

**Why better:**
- Splits the main comparative-static from the special cases
- The leading sentence now makes one point; the follow-up sentence groups the limit cases together

### - [ ] Lines 171-174: Four consecutive medium-length declarative sentences

**Comment:** Four sentences of 19, 28, 19, and 24 words, all in declarative "Subject verbs..." form, create a monotonous opening paragraph. All four describe what the section/microfoundation does rather than presenting content.

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

**Why better:**
- Varies sentence length (12 vs 38 words) instead of four mid-range sentences
- Opens with a short, punchy claim
- Cuts meta-commentary

### - [ ] Lines 267-276: Algorithmic enumeration

**Comment:** The six-step enumeration (lines 269-276) reads as a pure algorithm description. While appropriate for a "Solution Algorithm" subsection, the prose framing could be tighter. The sentence "The algorithm first solves for an allocation given $A_j$ and $\tau_j$, then jointly solves networks' first-order conditions" (line 263) already summarizes the two phases. The enumeration then restates Phase 1 in six steps. This is acceptable for a technical appendix.

**Original:**
```
Given network fees $A_j$ and $\tau_j$, the algorithm iterates:
\begin{enumerate}
    \item Conjecture consumer price indices $P^w$
    \item Compute consumer price indices $P^w$ from current acceptance decisions
    \item Solve consumer demand to obtain wallet shares $\tilde{\mu}^w_y$ conditional on $P^w$
    \item Solve merchant equilibrium: each merchant type $\gamma$ maximizes quasi-profit to determine optimal acceptance $M^*(\gamma)$
    \item Update price indices $P^w$ using new acceptance decisions $M^*(\gamma)$
    \item Repeat until convergence in $(P^w, \tilde{\mu}^w_y, M^*(\gamma))$
\end{enumerate}
```

**Proposed Revision:**
```
No revision proposed -- algorithmic enumeration is appropriate for a solution algorithm subsection in a technical appendix.
```

**Why better:** N/A -- flagged for awareness only.

### Monotonous Patterns

- **Lines 171-174:** Four consecutive medium-length declarative sentences (19, 28, 19, 24 words). Flagged above.
- **Lines 285-286:** Two consecutive short passive sentences ("Second-order conditions... are verified numerically." / "All caps are confirmed binding..."). Acceptable in a brief algorithmic summary.

### Priority Recommendations

1. **Line 91:** Break the four-semicolon compound sentence into two sentences to improve readability of comparative statics.
2. **Lines 171-174:** Condense the four-sentence throat-clearing opening into a shorter, punchier introduction.
3. **Lines 285-286:** Minor -- consider varying the two consecutive passive constructions, though the algorithmic context makes passive natural here.

## [appendix_surcharging.tex]

### Executive Summary
- Mean: 19.8 words, StdDev: 9.2 words
- McCloskey/Cochrane adherence: Moderate
- Priority improvements: (1) Fix ambiguous sentence on line 53, (2) Vary sentence openings in the empirical evidence subsection, (3) Restore parallel structure in line 140

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences (prose only) | 32 |
| Mean length | 19.8 words |
| Median length | 18 words |
| StdDev | 9.2 words |
| Range | 7-37 words |
| 10th percentile | 9 |
| 25th percentile | 13 |
| 50th percentile | 18 |
| 75th percentile | 26 |
| 90th percentile | 32 |

Distribution: 9 short (<15), 13 medium (15-25), 10 long (>25). Good mix overall.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro (7-18) | 8 | 20.5 | 7.8 | 10-32 | Good variation |
| Legal Background (23-27) | 4 | 28.5 | 5.2 | 22-35 | Slightly long, low variation |
| Empirical Evidence (32-46) | 7 | 16.4 | 6.1 | 7-24 | Good |
| Theory prose (53-54, 66-67, 96, 100-101) | 6 | 18.2 | 8.4 | 9-30 | Good variation |
| Card-vs-Card (134-144) | 5 | 19.4 | 7.6 | 10-28 | Good |
| Limitations/LLM (150-154) | 5 | 22.0 | 5.5 | 15-29 | Slightly uniform |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good overall length variation (StdDev 9.2). Legal Background subsection is slightly monotonous with four consecutive long sentences. LLM section has uniform lengths. |
| S-V-O clarity | Generally strong. Line 53 is the main exception: long sentence with ambiguous modifier placement. |
| Active voice | Strong. First person active ("I show," "I extend," "I restrict," "I flag," "I quantify") throughout. One passive: "States are grouped by surcharging legality" (line 39), which is natural. |
| Nominalization | Minor: "ruling out within-trip substitution" (line 54) could be more direct. |
| Tense consistency | Consistent present tense for model results, past tense for legal history. Appropriate shifts. |
| Parallel structure | Broken on line 140: gerunds mixed with noun phrase in appositive list. |

### Specific Passage Critiques

### - [ ] Lines 23-27: Four consecutive long sentences in Legal Background

**Comment:** Sentence length variation is low in this subsection. All four sentences are 22-35 words. The section reads as a dense block.

**Original:**
```
Cash discounts have long been legal in the U.S., but card surcharges became permitted only gradually.
The Cash Discount Act of 1981 guarantees merchants' right to offer cash discounts \parencite{Chakravorti.Shah2001, Levitin2005, Prager.etal2009}.
The Durbin Amendment in 2010 granted merchants the right to offer debit discounts \parencite{Schuh.etal2011, Briglevics.Shy2014}.
A 2013 settlement between Visa, Mastercard, and the DOJ removed network-level no-surcharge rules, allowing surcharging in 40 states \parencite{Blakeley.Fagan2015}.
```

**Proposed Revision:**
```
Cash discounts have long been legal in the U.S., but card surcharges became permitted only gradually.
The Cash Discount Act of 1981 guaranteed cash discounts \parencite{Chakravorti.Shah2001, Levitin2005, Prager.etal2009}.
The Durbin Amendment (2010) added debit discounts \parencite{Schuh.etal2011, Briglevics.Shy2014}.
A 2013 Visa-Mastercard-DOJ settlement removed no-surcharge rules, allowing surcharging in 40 states \parencite{Blakeley.Fagan2015}.
```

**Why better:**
- Shortens the second and third sentences, creating more rhythm variation
- "Guaranteed cash discounts" is tighter than "guarantees merchants' right to offer cash discounts"
- Parenthetical year placement in the Durbin sentence is more compact

### - [ ] Line 53: Ambiguous modifier placement

**Comment:** S-V-O clarity violation. "When surcharging is allowed" could modify either the showing or the steering, creating a garden-path sentence. The sentence also repeats "surcharging/surcharge" twice.

**Original:**
```
I show merchants cannot steer consumers from card to cash when surcharging is allowed in a natural extension of the baseline model that allows surcharging.
```

**Proposed Revision:**
```
In a natural extension of the baseline model, I allow merchants to surcharge and show they still cannot steer consumers from card to cash.
```

**Why better:**
- Disambiguates the modifier by fronting "In a natural extension"
- Eliminates the redundant double mention of surcharging
- Subject-verb distance is shorter

### - [ ] Lines 150-154: Uniform sentence lengths in LLM block

**Comment:** Five sentences of 15, 27, 18, 26, 21 words. The middle three are all 18-27 words with similar compound structure. The paragraph would benefit from one short, punchy sentence.

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
In the limit, surcharging at the full merchant fee is profitable.
But the event-study evidence in Section~\ref{subsec:merchant-card-gains} shows card acceptance does increase sales at the margin, limiting the empirical relevance of this case.
The threat to surcharge could still discipline network pricing even if merchants rarely exercise it---a mechanism this paper does not model.
```

**Why better:**
- Creates a short punchy sentence ("In the limit, surcharging at the full merchant fee is profitable." -- 11 words)
- Varies the lengths more: 10, 14, 11, 23, 20 words
- Removes "Nevertheless" transition opener

### Monotonous Patterns

- **Legal Background (lines 23-27):** Four consecutive sentences in the 22-35 word range. StdDev only 5.2 for this section. Recommendation: shorten the middle two sentences for rhythm.
- **LLM block (lines 150-154):** Five sentences in the 15-27 word range with similar compound structures. Recommendation: insert one short sentence (under 12 words) to break the pattern.

### Priority Recommendations
1. Fix the ambiguous sentence on line 53 -- this is a clarity issue, not just style
2. Shorten the Legal Background sentences for better rhythm
3. Restore parallel structure on line 140 (gerund/noun phrase mismatch)

## [data.tex]

### Executive Summary
- Mean: 22.6 words, StdDev: 9.8 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Tighten the 38-word DCPC sentence (line 64), (2) Add rhythm variation in the survey paragraph (lines 64-69)

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 18 |
| Mean length | 22.6 words |
| Median length | 20 words |
| StdDev | 9.8 words |
| Range | 7-38 words |
| 10th percentile | 10 |
| 25th percentile | 15 |
| 50th percentile | 20 |
| 75th percentile | 29 |
| 90th percentile | 35 |

Distribution: 4 short (<15), 7 medium (15-25), 7 long (>25). Slight skew toward long sentences, but StdDev is healthy.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Aggregate Prices (L11-21) | 5 | 18.8 | 5.6 | 12-25 | Good variation |
| Issuer Volumes (L43-49) | 3 | 25.3 | 5.5 | 20-31 | Slightly long but varied |
| Homescan (L55-60) | 3 | 22.0 | 8.5 | 13-30 | Good variation |
| Consumer Surveys (L64-71) | 7 | 23.7 | 11.0 | 7-38 | Good variation; short sentences at L67-68 help |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good length variation (range 7-38). Short punchy sentences at L67-68 ("Cards are accepted..." / "Debit cards are the most popular...") break up longer analytical sentences effectively |
| S-V-O clarity | Strong -- "I use," "I collect," "I construct," "I combine" keep subjects and verbs together |
| Active voice | 16 of 18 active. One passive: "Cards are accepted" (L67), natural since the agent is implicit |
| Nominalization | None detected |
| Tense consistency | Present tense for data description throughout. Appropriate |
| Parallel structure | Good -- L60 uses parallel "overrepresents... while underrepresenting" |

### Specific Passage Critiques

### - [ ] Lines 64-65: Two consecutive long sentences (38 and 29 words)

**Comment:** The DCPC paragraph opens with two long sentences back-to-back. The first (38 words) is the longest in the file. The second (29 words) also runs long. Together they create a dense opening before the short relief sentences on L67-68.

**Original:**
```
I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) to build a transaction-level dataset on consumers' payment choices over three-day windows.
Whereas Homescan oversamples large stores that accept cards, the DCPC captures transactions at small stores, allowing me to better estimate the share of transactions at merchants that accept cards.
```

**Proposed Revision:**
```
I combine the 2017--2019 waves of the Atlanta Fed's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) into a transaction-level dataset covering three-day windows.
Whereas Homescan oversamples large stores that accept cards, the DCPC captures transactions at small stores, allowing me to better estimate the share of transactions at merchants that accept cards.
```

**Why better:**
- Tightens the opening from 38 to ~28 words
- Removes redundant "on consumers' payment choices"
- Creates better contrast with the 29-word second sentence

### - [ ] Lines 45-47: Dense sample-construction passage

**Comment:** The exclusion criterion ("excluding those with acquisitions exceeding 50% of equity") is appended as a participial phrase to a sentence already carrying numerical detail (39 issuers, 18 above, 21 below). Splitting it out improves clarity.

**Original:**
```
The difference-in-differences analysis focuses on 39 issuers, 18 above $\$10$ billion in assets and 21 below, excluding those with acquisitions exceeding $50\%$ of equity.
```

**Proposed Revision:**
```
The difference-in-differences analysis focuses on 39 issuers: 18 above $\$10$ billion in assets and 21 below. I exclude issuers with acquisitions exceeding $50\%$ of equity.
```

**Why better:**
- Splits one 24-word sentence into two shorter ones (16 + 10)
- The exclusion criterion gets its own sentence, making the sample construction steps clearer
- Active voice "I exclude" is more direct than the dangling participial "excluding"

### Monotonous Patterns

No runs of 4+ consecutive sentences within a 5-word range detected.

### Priority Recommendations
1. Tighten the 38-word DCPC sentence (line 64) by cutting redundant phrases
2. Consider splitting the exclusion criterion (line 47) into its own sentence for clarity
3. The section reads well overall -- active voice, clear S-V-O structure, and effective use of short sentences for key facts (lines 67-68)

## [counterfactuals.tex]

### Executive Summary
- Mean: 17.1 words, StdDev: 6.9 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: (1) Break the monotonous decomposition passage (lines 96-99), (2) Consolidate the Durbin repeal number inventory (lines 148-159), (3) Vary the "row shows" repetition (lines 101-103)

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 114 |
| Mean length | 17.1 words |
| Median length | 16.0 words |
| StdDev | 6.9 words |
| Range | 4-35 words |
| 10th percentile | 8 |
| 25th percentile | 12 |
| 50th percentile | 16 |
| 75th percentile | 22 |
| 90th percentile | 25 |

Distribution: 46 short (<15, 40%), 55 medium (15-25, 48%), 13 long (>25, 11%). Healthy skew toward short and medium. Good use of very short sentences (4-8 words) for emphasis.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro (L4-11) | 8 | 16.8 | 8.0 | 4-27 | Good variation |
| Prices/Shares (L25-33) | 5 | 18.4 | 3.5 | 15-22 | Slightly uniform |
| Welfare (L78-119) | 25 | 17.5 | 7.5 | 6-35 | Good variation |
| Distributional (L124-134) | 6 | 19.3 | 8.1 | 9-35 | Good variation |
| Durbin (L139-166) | 12 | 15.3 | 7.5 | 4-33 | Good; short punchy sentences |
| Competition (L168-199) | 13 | 16.0 | 7.2 | 6-30 | Good variation |
| Dual Routing (L201-217) | 8 | 14.6 | 7.4 | 4-26 | Good; short sentences |
| Discussion (L219-260) | 16 | 16.5 | 6.1 | 5-28 | Good variation |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Strong. Excellent use of very short sentences for emphasis: "The gains are progressive" (4w), "This exclusion is unnecessary" (4w), "In payment markets, the opposite holds" (6w), "Profits decline by only $1.5 billion" (6w). These punctuate longer analytical passages effectively. |
| S-V-O clarity | Strong throughout. Subjects and verbs are close together. Active first-person construction ("I use," "I test," "I model," "I measure") anchors each subsection. |
| Active voice | ~90% active. A few passives are natural: "imprecisely estimated" (L187), "Credit card adoption drops" (pseudo-passive, L28). No "it is assumed" constructions. |
| Nominalization | Minimal. "The presence of exogenous constraints" (L231) is one instance; flagged in word_choice_review. |
| Tense consistency | Present tense for model results throughout. Conditional ("would") for Durbin repeal counterfactual (L148-159). Appropriate shift. |
| Parallel structure | Good overall. The decomposition passage (L97-99) uses parallel "The X row [verb]" structure, which is functional but slightly mechanical. |

### Specific Passage Critiques

### - [ ] Lines 97-99: Three consecutive template sentences

**Comment:** Three sentences with identical structure: "[Row label] [verb]s merchants to [action], holding [condition] fixed." The parallel structure is functional for a decomposition, but the identical sentence length (23, 13, 10 words) and construction create monotony. The passage reads like a table caption rather than prose.

**Original:**
```
The network effect (first row) holds merchant prices and acceptance fixed while networks re-optimize fees and rewards and consumers adopt new payment methods.
The price passthrough row allows merchants to adjust retail prices, holding acceptance fixed.
The merchant adoption row allows merchants to adjust acceptance decisions.
```

**Proposed Revision:**
```
The first row holds merchant prices and acceptance fixed while networks re-optimize fees and rewards and consumers adopt new payment methods.
The second row lets merchants adjust retail prices, holding acceptance fixed.
The third row lets merchants adjust acceptance decisions.
```

**Why better:**
- Removes mechanical row-label naming (labels are in the table)
- "Lets" varies from "holds" and "allows"
- Still parallel, but less rigidly templated

### - [ ] Lines 101-103: "Row shows" repetition

**Comment:** Three consecutive sentences use "The [ordinal] row shows that..." as the opener. This creates a mechanical feel where the prose is walking through table rows rather than building an argument.

**Original:**
```
The first row shows that merchants benefit from lower fees, but the second row shows that they dissipate these profits by lowering retail prices to compete for consumers.
The first row shows that lower rewards reduce profits as networks lose consumers.
The third row shows that networks recover a substantial share when merchants increase card acceptance in response to lower fees.
```

**Proposed Revision:**
```
Merchants initially benefit from lower fees (first row) but dissipate these profits by lowering retail prices to compete for consumers (second row).
Lower rewards reduce network profits as networks lose consumers.
Networks recover a substantial share when merchants increase card acceptance in response to lower fees (third row).
```

**Why better:**
- Moves row references to parenthetical positions
- Varies sentence openings: "Merchants," "Lower rewards," "Networks"
- Each sentence foregrounds the economic actor rather than the table row

### - [ ] Lines 148-154: Six sentences of similar length in Durbin repeal

**Comment:** Sentences 58-62 (in the analysis) run: 20, 8, 25, 12, 23 words. The 8-word sentence provides good relief, but the remaining four are all in the 20-25 range. The passage reads slightly like a walkthrough.

**Original:**
```
If the debit fee cap were lifted by 25 bps, merchant fees would rise and networks would increase debit rewards.
Consumers would switch to debit, especially reward-sensitive ones.
As the marginal credit card consumer becomes less reward-sensitive, networks would reduce credit card reward competition, triggering the see-saw principle and lowering credit merchant fees.
Credit card rewards and fees would fall 6
and 3.3 bps respectively.
```

**Proposed Revision:**
```
If the debit fee cap were lifted by 25 bps, networks would increase debit rewards, drawing reward-sensitive consumers away from credit.
As the marginal credit card consumer becomes less reward-sensitive, networks reduce credit card reward competition, lowering credit rewards by 6 bps and fees by 3.3 bps.
```

**Why better:**
- Merges five sentences into two that trace the causal chain
- Each sentence carries both the action and the number, embedding data as evidence
- Eliminates the orphaned "Credit card rewards and fees would fall 6 / and 3.3 bps respectively" which is awkwardly split across lines

### - [ ] Lines 124-131: Distributional effects passage

**Comment:** The distributional passage opens with two short sentences (9w, 12w), then delivers a long 35-word sentence with three income groups and their basis-point gains, then two more medium sentences. The 35-word sentence (line 126-131) packs three groups into one sentence with embedded parenthetical clarifications at both ends.

**Original:**
```
Consumer surplus rises by 48 basis points of consumption for low-income consumers (log income at $-2$ SD),
37 basis points for medium-income consumers,
and 15 basis points for high-income consumers (log income at $+2$ SD).
```

**Proposed Revision:**
```
Consumer surplus rises by 48 basis points for low-income consumers, 37 for medium-income, and 15 for high-income consumers.
```

**Why better:**
- Tighter (18 words vs 35)
- Moves income-definition parentheticals to the table note (they are already there in Table \ref{tab:welfare-decomp})
- The three numbers in parallel are clear without repeating "basis points of consumption"

### Monotonous Patterns

- **Lines 97-99 (decomposition):** Three consecutive sentences with identical "[Label] [verb]" structure and lengths of 23, 13, 10 words. The StdDev of 6.5 within this passage is acceptable, but the identical construction creates functional monotony.
- **Lines 101-103:** Three "row shows" sentences of lengths 28, 13, 20 words. Identical opener dominates the rhythm.

### Priority Recommendations
1. Restructure the "row shows" repetition (lines 101-103) -- this is the most noticeable mechanical pattern in the file
2. Consolidate the Durbin repeal number inventory (lines 148-154) to embed numbers as evidence rather than listing
3. Tighten the distributional 35-word sentence (lines 126-131) by removing parenthetical income definitions redundant with the table note

## [appendix_robustness.tex]

### Executive Summary
- Mean: 21.4 words, StdDev: 9.8 words
- McCloskey/Cochrane adherence: Moderate
- Priority improvements: (1) Vary the "(versus X at baseline)" comparison pattern, (2) Break the 37-word sentence on line 340, (3) Restructure the noun pile-up on line 142

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 58 |
| Mean length | 21.4 words |
| Median length | 20 words |
| StdDev | 9.8 words |
| Range | 6--37 words |
| 10th percentile | 10 |
| 25th percentile | 14 |
| 50th percentile | 20 |
| 75th percentile | 28 |
| 90th percentile | 33 |

Distribution: 14 short (<15), 24 medium (15-25), 20 long (>25). Good mix.

### Section-by-Section

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Intro (lines 7-9) | 3 | 24.3 | 8.5 | 15--37 | Good variation |
| No Passthrough (lines 18-68) | 16 | 21.1 | 9.2 | 6--35 | Good variation |
| Credit Constrained (lines 91-161) | 15 | 22.8 | 9.0 | 10--37 | Good variation |
| Reduced Durbin (lines 172-222) | 10 | 20.5 | 10.1 | 8--34 | Good variation |
| POS Substitution (lines 236-252) | 8 | 22.9 | 8.3 | 12--36 | Adequate |
| Social Optimum (lines 319-340) | 12 | 20.8 | 9.4 | 10--37 | Good variation |

### McCloskey/Cochrane Assessment

| Principle | Assessment |
|-----------|------------|
| Sentence variety | Good length variation overall; the repetitive "(versus X at baseline)" comparison pattern creates structural monotony despite varied lengths |
| S-V-O clarity | Mostly strong; line 142 has a noun pile-up that obscures the subject |
| Active voice | Good. Mix of first-person active and passive where appropriate. "I impose" (line 238), "I set" (line 239) |
| Nominalization | Line 337: "lower rewards penalties" corrected to "lower reward penalties" |
| Tense consistency | Present tense throughout. Consistent and appropriate |
| Parallel structure | The "(versus X at baseline)" pattern is parallel but over-repeated |

**Active voice count:** ~50/58 sentences use active voice (86%). Passive appears in a few places ("is unchanged," "are unchanged") where it is natural.

**Monotonous patterns:** The "(versus X)" parenthetical comparison pattern repeats across all four robustness sections (lines 51, 56, 60, 68, 140, 143, 149, 155, 159, 211-222, 241-249). While sentence lengths vary, the structural template creates a monotonous reading experience.

### Specific Passage Critiques

### - [ ] Lines 49-65: Six consecutive comparison sentences

**Comment:** Lines 49-65 contain six sentences that all follow the same template: "[Quantity] is [value] (versus [baseline value])." While each sentence has a different length, the identical rhetorical structure creates a metronomic reading experience. The paragraph on lines 63-65 provides welcome mechanism-driven prose that breaks the pattern.

**Original:**
```
The main difference is that consumers no longer gain from lower merchant fees.
Instead, merchants keep the savings as higher profits.
Under the fee cap, consumer welfare falls by \$31B (versus a \$28B gain at baseline), while merchants gain \$49B (versus \$0.4B).
The price and share responses are nearly identical to baseline: the credit share drops 21 percentage points and total fees fall \$59B (versus \$58B), because the cap mechanically forces the same fee cut regardless of pass-through.
Total welfare gains from fee caps are also smaller: \$17B versus \$27B.
```

**Proposed Revision:**
```
The main difference is that consumers no longer gain from lower merchant fees.
Merchants keep the savings as higher profits: consumer welfare falls by \$31B under the fee cap (versus a \$28B gain at baseline), while merchants gain \$49B.
Price and share responses are nearly identical to baseline because the cap mechanically forces the same fee cut regardless of pass-through.
Total welfare gains from fee caps shrink from \$27B to \$17B.
```

**Why better:**
- Consolidates the comparison into fewer sentences
- Removes the redundant "(versus \$0.4B)" where the baseline difference is minor
- The mechanism ("mechanically forces the same fee cut") gets its own clause instead of being appended after a colon

### - [ ] Lines 155-159: Short sequence of bare comparisons

**Comment:** Three counterfactual results presented in a single sentence with six numbers. The sentence has adequate length (32 words) but packs too many comparisons into one breath without any interpretive framing.

**Original:**
```
The monopoly counterfactual is more beneficial here: \$22B versus \$16B at baseline.
The unconstrained consumers who drive adoption are more reward-sensitive, so a merged network that raises rewards can attract more volume.
Uncapping debit yields \$6B (versus \$7B) and dual routing \$8B (versus \$8B), both close to baseline.
```

**Proposed Revision:**
```
The monopoly counterfactual is more beneficial here (\$22B versus \$16B at baseline) because the unconstrained consumers who drive adoption are more reward-sensitive, allowing a merged network to attract more volume through higher rewards.
Uncapping debit and dual routing both yield gains close to baseline (\$6B and \$8B, respectively).
```

**Why better:**
- Merges the monopoly result and its mechanism into one sentence, giving the number its "so what"
- The near-baseline results are compressed since they convey no surprise

### - [ ] Line 340: 37-word sentence combining result and mechanism

**Comment:** The longest sentence in the social optimum section tries to deliver both the achievement (80% of planner's gains) and the explanation (dominant distortion is credit card adoption) in one breath. Splitting would give the punchline more emphasis.

**Original:**
```
The 120 bps cap achieves 80\% of the planner's gains (\$27 billion vs.\ \$34 billion) without directly regulating rewards, because the dominant distortion is the excessive adoption of credit cards and not network market power.
```

**Proposed Revision:**
```
The 120 bps cap achieves 80\% of the planner's gains (\$27 billion vs.\ \$34 billion) without directly regulating rewards. The dominant distortion is excessive credit card adoption, not network market power.
```

**Why better:**
- Splits into two sentences (22w + 11w), creating rhythm contrast
- The short second sentence delivers the key insight with emphasis

### Monotonous Patterns

- **"(versus X at baseline)" template:** Used 11+ times across the four robustness subsections. While sentence lengths vary (6-37 words), the identical parenthetical comparison structure creates functional monotony. Consider interpreting the relative scale ("about half," "15% more") rather than presenting raw numbers.
- **Lines 67-68:** Three counterfactual results in one sentence, each with a "(versus X)" parenthetical. Six numbers in 32 words.

### Priority Recommendations
1. **Vary the comparison template** -- the "(versus X at baseline)" parenthetical is structurally monotonous across all four robustness sections. Interpret the relative scale rather than presenting raw numbers side by side
2. **Split line 340** -- the result and mechanism deserve separate sentences for emphasis
3. **Fix line 142** -- the noun pile-up "cap fees price responses" obscures the subject
