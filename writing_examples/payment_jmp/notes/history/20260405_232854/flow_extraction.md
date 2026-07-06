# Flow Extraction

## [response_round2.tex]

# Flow Extraction

## Section Skeleton

### Editor Letter (pp. E-1 to E-end)
The letter opens by thanking the editor and announcing the structure: a summary of main changes followed by detailed point-by-point replies. The summary of changes (shared with all referees) lists five revision clusters: Reduced Form, Modeling, Credit-Debit Substitution, Counterfactuals, and Exposition.

#### Summary of Main Changes
Five numbered changes are presented:
1. **Reduced Form** — Durbin evidence reframed around multiple steering channels; new bank-level debit rewards data; selected nature of merchant studies clarified.
2. **Modeling** — New "Key Assumptions" discussion; merchant estimation reframed as calibration; fixed costs acknowledged; counterfactuals framed as short-run.
3. **Credit-Debit Substitution** — New extension with full point-of-sale substitution; qualitatively similar results.
4. **Counterfactuals** — Main cap moved to 120 bps; decomposition by channel; dual-routing mandate; robustness checks on reward sensitivity and credit constraints.
5. **Exposition** — Introduction rewritten for broad audience; appendix reorganized per AE's recommendation; footnotes shortened.

#### Detailed Response to the Editor

Ten referee/editor comments are addressed in order:

1. *Durbin evidence sensitivity and reward sensitivity* — Reframing + new data + robustness halving the Durbin moment.
2. *Merchant event study selection and Discover interpretation* — Clarified that 98% of Homescan trips are at credit-accepting stores; two interpretive points narrowed.
3. *Nielsen/Kilts data disclosure* — Paper cleared disclosure review; pooling events to avoid revealing single-retailer series.
4. *Data limitations and modeling flexibility* — Merchant estimation now labeled a calibration; fixed costs explicitly unidentified; short-run framing added.
5. *Credit-debit substitution* — Baseline retains segmentation; new extension with full substitution; four motivating points in main text.
6. *Credit constraints* — Constrained robustness estimated; similar welfare results ($27 bn vs. $31 bn).
7. *Consumer information environment* — Full information clarified in model; card acceptance as quality shifter.
8. *More moderate fee cap* — Main cap moved to 120 bps; sequence in appendix; welfare is concave in cap strictness.
9. *Welfare decomposition by channel* — New table decomposes fee cap welfare into network effect, price passthrough, merchant adoption.
10. *New payment methods and multihoming* — Discussion added; Dual Routing counterfactual added.
11. *Unregulated baseline clarification* — Status quo is baseline; each counterfactual perturbs it.
12. *Exposition* — Introduction rewritten; assumption discussion expanded; appendix reorganized; footnotes shortened.
13. *Tacit collusion risk* — Knittel-Stango (2003) caveat added; binding vs. non-binding caps distinguished.

### Detailed Response to Referee 1

Opening organizes responses into three blocks: previously unaddressed/unsatisfactory comments, new comments, and satisfactory follow-ups.

#### Previously Unaddressed and Unsatisfactory Comments

Four previously flagged issues:

1. *Merchant incentive to accept credit when most credit holders also have debit* — Addressed by distinguishing card ownership from active usage; primary-secondary classification; segmentation assumption; extension allows substitution.
2. *Rewards modeled as lump-sum even if card never used* — Clarified: in equilibrium consumers always use their preferred card at accepting merchants; lump-sum vs. per-transaction rewards are equivalent under Roy's identity.
3. *CES demand governs both markup and pass-through* — Acknowledged; language corrected to say Online Appendix considers zero-pass-through polar case, not arbitrary pass-through.
4. *Entry/monopoly logit shock concern* — Entry concern valid but does not apply to monopoly counterfactual (no new products introduced, only ownership change).

#### New Comments from Referee 1

Five new comments:

1. *Welfare decomposition by channel* — Full decomposition table added; merchants compete away $49bn of $50bn fee savings into lower prices; consumer gains come mainly from reduced credit aversion.
2. *Multihoming and competition* — Dual Routing counterfactual added; credit fees -13 bps; rewards -15 bps; consumer welfare +$8bn.
3. *How was the large retailer chosen?* — Screening for large credit-share shifts; only two events in sample; warehouse events excluded.
4. *Log revenue vs. trips as outcome* — Main text now uses dollar purchases; Poisson preferred over OLS in levels/logs.
5. *Poisson vs. linear model* — OLS triple-difference yields similar estimates shown in figure.
6. *Non-zero pre-period credit share* — Reflects misreporting (signature debit confusion), not actual credit use.
7. *Interpret Section III.B.1 sentence* — Typo fixed; now refers to Discover evidence section.
8. *Margin consistency (15.6% vs 20% breakeven)* — Back-of-envelope removed from reduced form; structural margin reported with SE.
9. *Surcharging equivalence needs explanation* — Main counterfactual now 120 bps (above cost of cash); surcharging equivalence holds only at cost-of-cash benchmark.
10. *Section title "Reducing Competition"* — Revised to "Welfare Effects of Reducing Network Competition."

#### Remaining Follow-up Points

Three previously-satisfactory points with additional clarification:

1. *DCPC/SCPC data combination* — Diary and survey share same panel respondents within each wave.
2. *Merchant acceptance data* — DCPC measures acceptance transaction by transaction in real time; Yelp validation shows 95.8% vs. 96.3% agreement.
3. *Incomplete appendix text* — Fixed incomplete sentences and missing cutoff values.
4. *Hold merchant actions fixed in Durbin moment* — DiD differences out merchant-side equilibrium effects; model simulates holding acceptance fixed.

### Detailed Response to Referee 2

Opening groups responses thematically: merchant-side, consumer-side, market structure, data.

#### Merchant Side

1. *Fixed costs of acceptance* — Cannot identify fixed costs separately from sales benefit heterogeneity; explicitly acknowledged; main cap moved to 120 bps to avoid extrapolation into cascade territory.
2. *Sequence of equilibria* — Appendix traces 120 bps, tourist test, and Ramsey planner; concave welfare-cap relationship.
3. *Merchant competition when benefit is the same for first and last adopter* — Merchants differ in γ; threshold equilibrium in pure strategies.

#### Consumer Side

1. *Income-dependent unobserved utility* — Random coefficient β_i varies with income; income-dependent complementarity χ added; full income variation in Ξ not identifiable given data.
2. *Information sets and business stealing* — Full information assumed; CES preferences generate imperfect sorting; business stealing captured through price index P^w.
3. *Debit-credit substitution* — Two polar specifications (full segmentation baseline; full substitution extension); combined model generates rejected predictions; evidence supports segmentation.
4. *Footnote 12 on Discover evidence* — Narrowed role clarified (store choice, not credit-debit substitution); Discover-only subsample added showing 2.2 pp vs. 7.1 pp in full sample.
5. *Enforced debit adoption with credit* — Usage-based classification justified by consumers who never use debit in practice.

#### Market Structure

1. *Three- vs. four-party systems* — Effective marginal cost representation valid for fees/rewards/shares; profits split not modeled; Australian experience shows Visa/MC did not exit.
2. *Eliminate credit cards entirely* — Consumers estimated worse off by [scalar] billion; caution about extreme counterfactual; concavity of welfare in cap level makes extreme counterfactual unnecessary.
3. *Unobserved quality* — Short-run model holds characteristics fixed; Australia shows no deterioration in annual fees/interest rates post-cap; acknowledged as limitation.
4. *New payment methods* — Poor debit-credit substitutes means new methods won't displace credit via fees alone; barriers are non-price characteristics.
5. *Cash cost* — Not inferred from physical properties; backed out from FOCs; revealed preference from cash-only merchants.

#### Data and Measurement

1. *Data years* — Years for each source stated; identification table added.
2. *Contactless vs. signature data* — Data does not distinguish; ξ absorbs 2019 mix; time variation not relevant for cross-sectional estimation.
3. *Tracing equilibria to zero* — Appendix compares 120 bps, tourist test, Ramsey planner; concavity again noted.
4. *Income and price sensitivity* — Log utility means reward rate enters additively; α_y captures genuine preference difference, not volume effect.
5. *Trips by payment type in Figure 4* — Triple-difference conditions on credit users vs. non-credit users; control group already absorbs common trends; decomposition by payment type would conflate demand shocks.
6. *AmEx-only survival* — Merger counterfactual preferred: holds product set fixed, isolates competition channel cleanly.

### Detailed Response to Referee 3

No thematic grouping announced; responses follow comment order.

1. *No-substitution assumption unintuitive* — Discussed at length; extension estimated; combined model generates rejected predictions; segmentation supported by reduced form; adoption-level substitution compatible with transaction-level segmentation.
2. *Single grocer limitation and advertising confound* — Only two events in Homescan; key assumption stated explicitly; no advertising campaigns verified against news reports.
3. *Consumer preferences at adoption vs. point of sale* — Complementarity parameter χ microfounded from transaction shocks realized at POS; adoption integrates over future shocks; bifurcated preference → positive χ.
4. *No-passthrough counterfactuals* — Zero-passthrough model re-estimated; results reported; large-fee-change counterfactuals diverge (fee cap $17bn vs $27bn; monopoly $8bn vs $15bn); surplus shifts to merchants under zero passthrough.
5. *Table 1 dataset and observations* — Caption updated; observation counts added.
6. *Sun-Abraham staggered DiD* — Does not apply; control group never treated; two events averaged directly.
7. *"Carrying" a card in Homescan* — Usage-based measure; primary = most trips; secondary = second-most trips.
8. *P^w superscript* — Clarified: price index depends on wallet because acceptance decisions affect utility differently by card type.
9. *y indexed by i* — Notation kept as is; i subscript suppressed for readability.
10. *PCE acronym* — Spelled out at first use.
11. *Appendix incomplete sentences* — Fixed.
12. *Proof of Theorem 1* — First sentence revised.
13. *Figure A.6 overlapping lines* — Lines very close but not identical; would diverge at much higher fees.
14. *Section C.4.0 unnamed figure* — Explicit reference added.
15. *Bibliography coauthors* — All coauthors listed in bibliography; "et al." only in in-text citations.

### Detailed Response to Referee 4

Opening groups three related comments on debit-credit substitution.

1. *Durbin interpretation: reward sensitivity overstated?* — Bank-level variation shows 29% decline; rewards-only banks show ~30% decline; Mukharlyamov-Sarin (2025) finds geographic debit-to-credit migration; 70-80% of debit households hold credit; 47% of debit users would switch to credit if debit unavailable; aggregate trends consistent with substitution; Australian comparison as out-of-sample plausibility check.
2. *Model misspecification from Durbin interpretation* — Limitation acknowledged; if non-price steering also cut, reward sensitivity overstated; but non-rewards steering without consumer benefits means baseline understates true losses; halving Durbin moment as robustness check.
3. *Establish social optimum benchmark first* — Rochet-Tirole and Edelman-Wright results referenced; cost-of-cash = tourist test; 120 bps cap captures 80% of Ramsey planner gains.
4. *Credit-only cap not shown* — Main counterfactual is now credit-only 120 bps cap; tourist test adds only $2bn; Ramsey planner sets optimal computationally.
5. *Optimal number and composition of networks* — Model not suited to optimal network count (logit shocks from new products); public debit not intended as network count statement; dual routing more informative (multihoming intensity, not network count, drives welfare).
6. *Lucas critique: issuers adjusting characteristics* — Short-run framing; Australian experience shows no deterioration in observable card characteristics; non-price quality changes cannot be ruled out.

---

## Paragraph Skeleton

1. Thank you for granting me the opportunity to re-submit my paper "Regulating Competing Payment Networks" to the American Economic Review.
2. I deeply appreciate your comments on how to revise the paper in order to maximize its potential.
3. This letter has two sections: [summary of changes; detailed answers].
4. I also discuss and — whenever possible — address empirically all the points raised by the referees.
5. This revision strengthens the reduced-form evidence, clarifies data limitations and modeling assumptions, estimates an alternative specification with debit-credit substitution, expands the counterfactual analysis, and rewrites the exposition for a broader audience. [Summary of Changes]
6. The Durbin evidence is reframed: interchange fees steer payment choices through multiple channels.
7. A new "Key Assumptions" discussion clarifies what the data can and cannot identify.
8. An alternative specification allows debit-credit substitution at the point of sale.
9. The main fee cap is now 120 bps, capturing about 80% of the Ramsey planner's welfare gains.
10. The introduction is rewritten for a broader audience.
11. [Editor Comment (a)/(b): Durbin sensitivity and reward sensitivity]
12. I address these concerns with a substantive reframing of the reduced-form evidence, new data on the rewards channel, and a robustness check that halves the targeted Durbin moment.
13. Section [ref] now presents the Durbin evidence as showing that interchange fees steer consumer payment choices, without requiring the reader to accept a specific interpretation through rewards.
14. To discipline the structural decomposition, I collected bank-level data from archived bank websites on which issuers paid debit rewards before and after Durbin.
15. Appendix Section [ref] halves the targeted Durbin moment, so the model matches only half the observed decline in debit volumes.
16. [Editor Comment: Merchant event study selection]
17. Thank you for the suggestions on how to make the merchant results more compelling.
18. I now clarify early on in Section [ref] that the merchants I study are highly selected: 98% of trips in Homescan occur at stores above this threshold.
19. I have narrowed the interpretation of my event study results around two main points.
20. I agree that the Discover evidence alone is not sufficiently conclusive to rule out debit-credit substitution.
21. [Editor Comment: Nielsen disclosure]
22. The Kilts data use agreement imposes two disclosure restrictions relevant to the grocery store analysis.
23. [Editor Comment: Data limitations and modeling flexibility]
24. Thank you for this advice.
25. The merchant-type estimation is now framed as a calibration exercise anchored by the grocery-chain event studies.
26. [Editor Comment: Credit-debit substitution]
27. I share the referees' discomfort with the no-substitution assumption.
28. Following your suggestion to provide a more detailed motivation, the main text now discusses four points.
29. [Editor Comment: Credit constraints]
30. Your conjecture is correct: ignoring credit constraints understates the relative value of credit cards.
31. However, the welfare results are very similar ($27 bn in the baseline and $31 bn in the credit-constrained specification).
32. [Editor Comment: Consumer information environment]
33. I have clarified the information environment in Section [ref].
34. [Editor Comment: Moderate fee cap]
35. Thank you for this advice on the fee cap.
36. I have now changed the main fee cap counterfactual to a more moderate 120 bps cap, which is in line with Canadian merchant fees.
37. [Editor Comment: Welfare decomposition]
38. I have adopted R1's suggestion and decompose welfare effects by sequentially allowing more merchant responses.
39. [Editor Comment: New payment methods]
40. I have added a discussion in Section [ref] of how the substitution assumption limits the effect of new payment types.
41. [Editor Comment: Multihoming]
42. I have taken this suggestion and added a "Dual Routing" counterfactual in Section [ref].
43. [Editor Comment: Unregulated baseline]
44. The baseline is the status quo equilibrium in which debit cards are regulated but credit cards are not.
45. [Editor Comment: Exposition]
46. I have substantially streamlined the paper.
47. [Editor Comment: Tacit collusion]
48. [Knittel-Stango 2003] show that state-level non-binding interest rate ceilings served as focal points for tacit collusion.
49. [R1 Response opener] I organize my responses as follows: previously unaddressed/unsatisfactory comments, then new comments, then follow-ups.
50. You are correct that γ is the same for credit and debit transactions, and that most credit card holders also own a debit card.
51. There are two reasons merchants still have an incentive to accept credit in the model.
52. In the model, consumers always use their preferred payment method at merchants that accept it.
53. From the consumer's perspective, the only difference between a per-transaction reward and a lump-sum reward of equal monetary value is that a lump-sum reward has no effect on the allocation of spending across merchants.
54. I apologize for the confusion.
55. Your original concern about the entry counterfactual was valid: adding a new credit card network introduces new logit shocks that mechanically increase credit card adoption.
56. However, the concern does not apply to the monopoly counterfactual.
57. This was a very helpful suggestion that pushed me to think carefully about the mechanisms behind the welfare results.
58. Your intuition is exactly right: merchants compete away nearly all of their direct gains from lower fees.
59. The more surprising finding is why consumers gain $28Bn overall.
60. Thank you for this suggestion. I have added a "Dual Routing" counterfactual.
61. The exercise varies multihoming under the competitive market structure rather than under monopoly as you suggested.
62. At the time of the event studies, nearly all large retailers already accepted credit cards, so the grocers I study are highly selected.
63. The main text regression now uses dollar purchases at the consumer level as the main outcome.
64. I use a Poisson specification following [Cohn et al. 2022].
65. An appropriately designed linear model does yield similar estimates.
66. I infer acceptance from large shifts in credit card payment shares.
67. It is not possible to study other categories.
68. I have added a fixed effects regression in Online Appendix [ref].
69. The OptBlue line serves two important roles.
70. You are correct that historically many merchants refused AmEx but accepted Visa and MC.
71. I agree that detailed data on every possible acceptance subset would be ideal.
72. The best available evidence comes from Yelp reviews in Appendix [ref].
73. I agree.
74. The sales increase from card acceptance is not sufficient to pin down the merchant fee elasticity.
75. Yes, the model overstates the welfare gap between pure card users and pure cash users by polarizing consumers into extreme types.
76. The aggregate welfare results are robust to this concern.
77. Thank you for catching this typo.
78. I have removed the back-of-the-envelope margin calculation from the reduced-form section.
79. As shown by [Zenger 2011], capping merchant fees at the cost of cash is theoretically equivalent to allowing merchants to freely surcharge consumers.
80. Thank you for the suggestion. I have revised the section title.
81. There is complete overlap between the diary and survey respondents within each wave.
82. The Diary of Consumer Payment Choice measures merchant acceptance transaction by transaction.
83. I apologize for the incomplete appendix text.
84. The intuition is as follows: the difference-in-differences design compares debit card volumes at regulated versus exempt issuers.
85. [R2 Response opener] For clarity, I group my responses thematically.
86. I agree that fixed costs of card acceptance are potentially important.
87. Your concern about equilibrium fragility directly shaped my choice of counterfactual.
88. Recall that merchants differ in γ, which determines how much card acceptance increases sales.
89. The model allows unobserved utility to vary with consumer income through two channels.
90. The model assumes consumers have complete information about merchant prices and acceptance decisions.
91. You are right that this is a limitation.
92. The Discover event study in Appendix [ref] is narrower than the previous draft suggested.
93. Your suggested choice set would eliminate consumers who use credit cards and cash but do not use debit cards.
94. Vertical relationships between networks, issuers, and acquirers are an important feature of payment markets.
95. I agree with the intuition from [Edelman-Wright 2015] that consumers could in principle be better off without intermediation.
96. The model represents a short-run equilibrium in which unobserved card characteristics are held fixed.
97. You are correct. If debit and credit cards are poor substitutes, then a new payment method that resembles debit is unlikely to displace credit cards simply by offering lower fees.
98. The model does not infer costs from the physical qualities of cards.
99. The estimation appendix now states the years covered by each data source inline.
100. Higher-income consumers do earn more reward dollars for a given reward rate, since they spend more.
101. The triple-difference design conditions on consumers who use credit cards at other stores.
102. Eliminating Visa and MasterCard changes the number of logit shocks consumers draw.
103. Appendix [ref] traces exactly this kind of sequence.
104. The data do not distinguish between contactless and signature transactions.
105. [R3 Response opener] [Grouped by comment order]
106. I agree that this assumption is unintuitive.
107. Acceptance changes are rare (I find only two clear cases in the Homescan panel).
108. The main text now clarifies the identifying assumption and what would violate it.
109. I apologize for the unclear exposition.
110. Yes. Online Appendix [ref] now re-estimates the model under zero passthrough.
111. For counterfactuals with small fee and reward changes, welfare effects are close to baseline.
112. For counterfactuals with large net fee changes, deadweight loss creates differences.
113. The updated table caption refers to the Diary of Consumer Payment Choice.
114. Recent work on treatment effect heterogeneity under staggered adoption does not apply here.
115. I measure "carrying" based on observed usage in the Homescan data, not self-reported ownership.
116. Yes, the price index depends on the consumer's wallet.
117. The notation suppresses the i subscript on y to avoid cluttering the equations.
118. Fixed. I have spelled out Personal Consumption Expenditures (PCE) at first use.
119. I have verified that the bibliography lists all coauthors for every reference.
120. [R4 Response opener] Below, I group together three related comments about the substitution between debit and credit.
121. Cleanly identifying debit-to-credit substitution is genuinely difficult, and no single piece of evidence is dispositive.
122. Debit users can plausibly substitute toward credit.
123. Aggregate trends are also consistent with substitution.
124. The "Uncap Debit" counterfactual provides a plausibility check.
125. This is a fair concern.
126. I agree that the social optimum is a useful benchmark.
127. Rather than re-deriving the social optimum in my model, I take the cost-of-cash benchmark from this literature.
128. This is an excellent suggestion.
129. The model is not well-suited to determine the optimal number of networks.
130. The public debit counterfactual is not intended as a statement about optimal network composition.
131. You raise a valid concern.
132. The Australian experience provides some reassurance on this point.

---

## Analysis

### Section Opener Issues

| Section | Issue |
|---------|-------|
| Editor letter opener | No issue: greeting + structure statement is appropriate for a response letter. |
| Summary of Changes | No issue: each bullet leads with the revision type and what it addresses. |
| R1: Previously Unaddressed block | Strong opener: announces the organization scheme upfront, orients the reader before diving into specifics. |
| R1: New Comments block | No opener paragraph — jumps directly into the first referee comment without a bridging sentence. Minor gap. |
| R1: Follow-up block | One-sentence opener ("The following points were assessed as satisfactory…") adequately signals the block's purpose. |
| R2 opener | Good thematic roadmap (merchant → consumer → market structure → data). |
| R3 opener | No organizational opener — goes directly to the first comment. Lowest structure of the four referee sections. |
| R4 opener | One sentence grouping three debit-credit comments. Adequate given tight thematic focus. |

### Flow Breaks in Paragraph Skeleton

| After sentence # | Issue |
|------------------|-------|
| 13–14 | Shift from expositional reframing to new data collection without a transitional signal. The three sub-sections (reframing / new data / robustness) are separated only by italic lead-ins embedded in the text; a reader scanning for the structure could miss the transitions. |
| 20–21 | After acknowledging the Discover limitation, the letter moves abruptly to the Nielsen disclosure comment, which is procedural rather than substantive. The hard break between thematic and administrative replies risks losing momentum. |
| 56–57 | The "however" turn on the monopoly counterfactual is clear, but sentence 56 ("Your original concern was valid") concedes too broadly before sentence 57 walks it back. The order creates momentary confusion before the clarification lands. |
| 58–60 | Strong causal chain (fee savings → price competition → consumer gains from reduced credit aversion). No flow break. |
| 75–76 | Sentence 75 concedes the modeling limitation clearly; sentence 76 promises robustness but does not immediately explain the mechanism. The explanation arrives two sentences later. Slight delay in delivering the "so what." |
| 86–88 | R2 merchant responses start with a concession (sentence 86) and then immediately shift to the equilibrium fragility argument (87) and then to merchant heterogeneity (88). The reader loses the thread because the concession and its consequence (the cap change) are separated by a one-sentence bridging sentence. |
| 101–104 | Four consecutive "the [object] does/does not…" sentences in the R2 additional points. Competent but monotonous; no forward momentum between them. |
| 120–124 | R4's debit-credit substitution block clusters evidence well but uses three consecutive paragraph openers ("Debit users can plausibly substitute…", "Aggregate trends are also consistent…", "The Uncap Debit counterfactual provides…") that are structurally parallel but do not build on each other — they feel like a list of independent evidence items rather than a cumulative argument. |
| 125–126 | After the debit-credit evidence cluster (sentences 121–124), sentence 125 ("This is a fair concern") pivots to reward sensitivity without signaling the topic change. |

### Summary

**Strengths:**
- The editor letter and R1 response have the clearest structure: the organizational announcements (sentence 49: "I organize my responses as follows") genuinely help the reader navigate.
- The welfare decomposition reply (sentences 57–60) is the best-flowing substantive response in the letter: concession → mechanism → surprising finding → explanation, executed in tight sequence.
- The R2 thematic grouping announcement (sentence 85) is effective and the most reader-friendly opener across the four referee letters.
- The dual routing and credit constraint replies are crisp and quantitatively grounded; numbers anchor the argument without overwhelming it.
- The R4 debit-credit evidence paragraph provides multiple lines of evidence that reinforce each other, which is appropriate given the referee's skepticism.

**Priority fixes:**
1. **R3 lacks an organizational opener.** Unlike R1 (announces three blocks) and R2 (announces thematic grouping), R3 jumps directly to the first comment. A one-paragraph roadmap stating how the responses are organized would help the reader.
2. **Evidence accumulation in R4 (sentences 121–124) reads as a list, not an argument.** Each paragraph opens with a new piece of evidence but does not signal how it builds on the previous one. Rewrite to make each paragraph's opening sentence carry the prior piece of evidence forward ("This bank-level pattern is reinforced by geographic variation…"; "Both micro patterns align with aggregate trends…").
3. **The topic shift from expositional reframing to new data in the Durbin reply (after sentence 13) needs a clearer hand-off.** The italic sub-heads (Reframing / New data / Robustness) are buried in prose. Restructuring as an explicit numbered list or using bold lead-ins matching the style used elsewhere in the letter would make the three-part structure immediately visible.
