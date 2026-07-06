# Flow Extraction

*Updated 2026-03-16*

## Section Skeleton

### 1. Introduction (intro.tex)

**Opening paragraph:**
In the U.S., Visa and Mastercard (MC) process 80% of card transactions and earn operating margins above 60%. Merchants, in turn, pay around $120 billion in fees every year to accept cards. These facts have motivated two decades of litigation and legislation built on a view that high merchant fees reflect weak competition.

### 2. Institutional Details and Data

#### 2.1 Network Pricing: Merchant Fees and Consumer Rewards (institutional_details.tex)

**Opening paragraph:**
Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers. With every card swipe, the merchant pays a fee and the consumer may receive a reward. While AmEx sets merchant fees and consumer rewards directly, "open-loop" networks like Visa and MC influence merchant and consumer prices by adjusting the interchange fee and network fee.

#### 2.2 Data (data.tex)

**Opening paragraph:**
Identifying the competitive bottleneck requires measuring how sensitive consumers are to rewards, how much card acceptance increases merchant sales, and how often consumers carry cards from multiple networks. I combine five data sources that capture these objects.

### 3. Reduced-Form Facts (reducedform.tex)

**Opening paragraph:**
Three reduced-form facts show why networks tax merchants to subsidize the issuing side. Issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices. By requiring that the estimated model match these facts, I capture the key mechanisms shaping how networks compete for consumers and merchants.

#### 3.1 Issuer Incentives Drive Consumer Payment Choices

The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices.

#### 3.2 Card Acceptance Increases Merchant Sales

Merchants face strong incentives to accept cards because doing so increases sales.

#### 3.3 Merchants Multi-home More Than Consumers

Merchants overwhelmingly accept all cards, yet only around X% of consumers use credit cards from two or more networks.

#### 3.4 The Competitive Bottleneck

Together, these three facts reveal a "competitive bottleneck."

### 4. Model (model.tex)

**Opening paragraph:**
To quantify how the competitive bottleneck shapes fees, rewards, and welfare, I build a model of payment network competition with two-sided multi-homing, merchant competition, and price coherence.

### 5. Estimation (estimation.tex)

**Opening paragraph:**
Estimation links the reduced-form facts to quantitative predictions about regulation and competition. The key primitives are consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.

### 6. Counterfactuals (counterfactuals.tex)

**Opening paragraph:**
I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse. I simulate five counterfactual policies: capping credit card fees, repealing the Durbin Amendment, merging all three networks, increasing consumer multi-homing through dual-routing mandates, and introducing a central bank digital currency.

### 7. Conclusion (conclusion.tex)

**Opening paragraph:**
The increased use of credit cards over time and the corresponding increase in merchants' costs of payments are a consequence of intense network competition channeled toward the wrong side of the market.

---

## Paragraph Skeleton

### Introduction

1. In the U.S., Visa and Mastercard (MC) process 80% of card transactions and earn operating margins above 60%.
2. I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.
3. Even a modest cap on credit card merchant fees would increase total welfare substantially.
4. Networks can tax merchants to fund consumer rewards because three forces reinforce each other.
5. To quantify the welfare costs of the competitive bottleneck, I build a structural model in which payment networks compete as two-sided platforms.
6. I estimate consumer and merchant preferences by matching the reduced-form facts and moments from payment surveys and aggregate market-level data.
7. The structural model shows that current credit card merchant fees and rewards are too high.
8. Put differently, lower rewards resolve a prisoner's dilemma among consumers.
9. Fee caps also disproportionately benefit low-income consumers.
10. These welfare gains are not from reducing market power.
11. Second, merging all networks into a monopoly raises total welfare by $15 billion per year.
12. In the absence of fee caps, policy can also redirect competition by increasing consumer multi-homing.
13. [Related Literature] The closest empirical work is Huynh et al. (2022)...
14. Whether network competition raises or lowers fees, rewards, and welfare is a quantitative question that theory alone cannot resolve.
15. My paper contributes to the empirical IO literature on two-sided markets.

### Institutional Details

16. Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers.
17. Visa and MC connect merchants, merchants' banks (acquirers), consumers' banks (issuers), and consumers.
18. Regulatory shocks confirm that interchange strongly affects merchant fees and rewards but not borrowing costs.

### Data

19. Identifying the competitive bottleneck requires measuring how sensitive consumers are to rewards, how much card acceptance increases merchant sales, and how often consumers carry cards from multiple networks.
20. [Aggregate Prices and Shares]: I use the Nilson Report's aggregate payment volumes and merchant fees in 2019.
21. [Issuer Payment Volumes]: The Nilson Report publishes the dollar payment volumes of the top credit and debit card issuers annually.
22. [Homescan]: The NielsenIQ Homescan panel tracks the payment decisions of around 100,000 households...
23. [Consumer Payment Surveys]: I combine the 2017-2019 waves of the DCPC and SCPC...
24. I also conduct a second-choice survey in 2024...

### Reduced-Form Facts

25. Three reduced-form facts show why networks tax merchants to subsidize the issuing side.
26. [3.1] The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices.
27. I estimate the effect on payment volumes by comparing debit card volumes at large and small issuers.
28. Figure X plots the estimates.
29. The Durbin response combined rewards cuts with changes in advertising and teller incentives.
30. [3.2] Merchants face strong incentives to accept cards because doing so increases sales.
31. I identify the causal effect of credit card acceptance on sales using changes in merchant acceptance policies.
32. The merchants in these event studies are highly selected.
33. I compare spending by credit card users versus non-users...
34. This strategy allows the focal merchants to experience other unobserved shocks...
35. Figure X shows that acceptance increases sales to credit card users by approximately 13%.
36. An alternative explanation is that credit card acceptance increases sales by lowering consumers' effective prices through rewards.
37. [3.3] Merchants overwhelmingly accept all cards, yet only around X% of consumers use credit cards from two or more networks.
38. [3.3.1] As of 2019, most merchants accept either all credit cards or none at all.
39. Similar aggregate acceptance counts could be consistent with merchants specializing in disjoint sets of networks.
40. [3.3.2] Consumer single-homing is the key ingredient generating the competitive bottleneck.
41. I study consumer multi-homing using the Homescan shopping data...
42. Around X% of primary credit card consumers carry credit cards from multiple networks.
43. [3.4] Together, these three facts reveal a "competitive bottleneck."

### Model

44. To quantify how the competitive bottleneck shapes fees, rewards, and welfare, I build a model of payment network competition with two-sided multi-homing, merchant competition, and price coherence.
45. [Structure] I model competition between card networks as a static game with three stages...
46. [Stage 3] Consumers' payment decisions depend on merchants' acceptance decisions...
47. At the point of sale, consumers' primary and secondary cards and merchant acceptance determine payment behavior.
48. Consumers with two cards can substitute between them.
49. Formally, define the set of all inside payment methods...
50. [Consumption] Consumers have CES preferences over a continuum of merchants...
51. Consumers spend more at merchants that accept the cards that they use the most often.
52. [Stage 2] Merchants maximize profits by choosing prices and payment acceptance.
53. [Pricing] Conditional on acceptance M, merchants pass fees into prices.
54. In equilibrium, merchants set optimal prices...
55. [Acceptance] Merchants trade off higher sales against higher fees.
56. The intercept a_M captures fee costs; b_M captures sales gains.
57. In equilibrium, merchants adopt optimal bundles...
58. [Consumer Adoption] Consumers choose up to two cards to maximize utility.
59. [Pecuniary Utility] Consumers prefer cards with high rewards and wide acceptance.
60. Because pecuniary utility is derived from the CES problem...
61. For multi-homing agents, pecuniary utility is the weighted average...
62. [Non-pecuniary] Non-pecuniary utility captures within-wallet complementarities and adoption costs.
63. [Consumer Heterogeneity] Preferences vary with income and exhibit unobserved heterogeneity.
64. Online Appendix develops a two-stage adoption-and-usage model...
65. [Choice Probabilities] The logit choice probability gives that...
66. [Stage 1] Multiproduct payment networks maximize profits, anticipating consumer and merchant actions.
67. Network profits equal transaction fees minus costs and rewards.
68. [Conduct] Networks set transaction fees and pecuniary adoption benefits...
69. [Equilibrium] Equilibrium is fees, adoption benefits, market shares...
70. [Assumptions] The model makes several simplifying assumptions for tractability.

### Estimation

71. Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
72. [Procedure] I estimate all parameters jointly, but the identification argument has three components.
73. [Consumer Demand] The key consumer demand parameters are price-sensitivity, substitution patterns, income gradients, and multi-homing complementarity terms.
74. The effect of the Durbin Amendment on debit card volumes identifies the price-sensitivity coefficient.
75. The simulated moment holds merchant acceptance fixed...
76. If part of the observed decline reflects reduced non-price steering...
77. My 2024 second-choice survey reveals the covariance matrix of the random coefficients.
78. Wallet complementarity parameters are identified by multi-homing patterns in the 2017-2019 Homescan data.
79. Demographic data identify how preferences vary with income.
80. [Network Costs] I recover network costs by inverting first-order conditions with respect to rewards.
81. [Merchant Types] I recover the distribution of merchant types by combining event-study evidence...
82. I model grocery chains that changed their acceptance policies...
83. I parameterize G as a two-parameter Gamma distribution.
84. [Calibrated] I calibrate two sets of parameters.
85. [Results] The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees...
86. The consumer substitution matrix shows that consumers view credit cards, debit cards, and cash as distinct segments.
87. Consumers are roughly ten times as sensitive to rewards as merchants are to fees.
88. The parameters reveal substantial consumer "credit aversion."
89. [GoF] I assess fit by examining moments the model was not trained to match...
90. [Consumer Demand GoF] Table X shows baseline prices and market shares.
91. The model also matches the joint distribution of primary and secondary cards...
92. [Merchant Demand GoF] I validate merchant parameter estimates against three types of evidence.
93. [Network GoF] Network cost parameters match accounting data.

### Counterfactuals

94. I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse.
95. [Cap Fees] In my main counterfactual, I cap credit card merchant fees at 120 basis points, roughly half their current level.
96. [Prices/Shares] Capping credit card merchant fees reduces consumer rewards and credit card use...
97. Credit card adoption drops by two-thirds as consumers substitute toward debit and cash.
98. [Welfare] Fee caps increase total welfare by $27 billion per year, with most gains accruing to consumers.
99. I measure consumer welfare by compensating variation.
100. To understand the sources of these gains, Table X decomposes welfare by sequentially allowing more merchant responses.
101. Even though fee caps target merchants, merchants benefit little in equilibrium.
102. The harm to networks is also modest.
103. Consumers gain $28 billion even though fees and rewards fall by roughly equal amounts.
104. Credit card adoption is socially excessive because of price coherence.
105. [Distributional] Fee and reward reductions redistribute consumption toward lower-income consumers.
106. [Repeal Durbin] Fee caps do not raise welfare simply by correcting market power.
107. Repealing the Durbin Amendment would moderate rewards competition between networks.
108. Repealing the Durbin Amendment generates large welfare gains.
109. An international comparison provides external plausibility for the magnitude of reward-driven substitution.
110. [Competition] One might expect that increasing competition among networks would substitute for fee regulation.
111. The key mechanism is compositional.
112. The merger costs consumers $11 billion while raising network profits by $31 billion.
113. [Dual Routing] Rather than regulating fees directly, policy can redirect the locus of network competition.
114. The intuition follows from the merchant acceptance condition...
115. Dual routing weakens this insistence.
116. Current proposed dual-routing legislation often requires that the secondary network not be a large established network.
117. [CBDC] Proposals for central bank digital currencies and faster payments motivate...
118. [Discussion] The welfare gains from fee caps and dual-routing mandates are quantitatively robust...
119. [Constraints] Consumer payment choices in the model reflect preferences, not constraints.
120. An alternative interpretation is that some consumers cannot obtain credit cards.
121. [Fee Cap] The 120 basis point cap keeps the counterfactual close to observed fee levels...
122. [Pass-through] The CES functional form specifies merchant fee pass-through to retail prices...

### Conclusion

123. The increased use of credit cards over time and the corresponding increase in merchants' costs of payments are a consequence of intense network competition channeled toward the wrong side of the market.
124. A moderate credit card fee cap would raise total welfare by $27 billion per year...
125. The Supreme Court's 2018 decision in Ohio v. American Express held that plaintiffs must show harm on both sides of a two-sided market...
126. The Durbin Amendment shows that capping the wrong fees makes things worse.
127. The merger counterfactual challenges a second piece of conventional wisdom...
128. The Ohio standard also implicitly treats competition for merchants and competition for consumers as interchangeable.

---

## Analysis

### Section Opener Assessment

| Section | Assessment |
|---------|-----------|
| **Introduction** | **Strong.** Setting (high fees, high margins) -> wrong diagnosis pivot -> inverted pyramid. All five counterfactuals previewed. |
| **Institutional Details** | **Improved.** Now opens with "Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers," connecting to the paper's two-sided framing. Still reads as background rather than argument. |
| **Data** | **Fixed (was weak).** Now reads "Identifying the competitive bottleneck requires measuring..." -- connects directly to the RAP and previews the three empirical objects. |
| **Reduced-Form Facts** | **Strong.** "Three reduced-form facts show why networks tax merchants to subsidize the issuing side" states purpose, previews content, links to the central argument. |
| **Model** | **Fixed (was generic).** Now reads "To quantify how the competitive bottleneck shapes fees, rewards, and welfare..." -- states the deliverable and connects to the bottleneck. |
| **Estimation** | **Strong.** "Estimation links the reduced-form facts to quantitative predictions about regulation and competition" connects backward and forward. |
| **Counterfactuals** | **Strong.** States the main result and the surprising finding up front. Now also enumerates all five counterfactuals in the second sentence. |
| **Conclusion** | **Strong.** Restates core finding in mechanism language ("competition channeled toward the wrong side") and engages with legal/policy implications. |

### Top 10 Remaining Flow Issues

**Issue 1 (Intro 10 -> 11): "These welfare gains" pivot to Durbin lacks bridge**

| Location | intro.tex, paragraphs 10-11 (~lines 87-95) |
|---|---|
| First sentences | 10: "These welfare gains are not from reducing market power." / 11: "Second, merging all networks into a monopoly raises total welfare by $15 billion per year." |
| Problem | #10 announces "not market power" and delivers the Durbin repeal counterfactual as the first illustration. #11 jumps to the monopoly counterfactual with "Second" but the reader hasn't been told to expect a numbered list. The word "First" doesn't appear before the Durbin discussion; it sits implicitly inside #10. The enumeration is lopsided: "First" is buried, "Second" opens a new paragraph. |
| Suggested fix | Begin #10 with "Two counterfactuals illustrate." and number both explicitly. |

**Issue 2 (Intro 12 -> 13): Abrupt shift from contribution to literature review**

| Location | intro.tex, paragraphs 12-13 (~lines 106-122) |
|---|---|
| First sentences | 12: "In the absence of fee caps, policy can also redirect competition by increasing consumer multi-homing." / 13: "The closest empirical work is Huynh et al. (2022)..." |
| Problem | The dual-routing paragraph is the last policy counterfactual. The next paragraph shifts to positioning with no signal. A reader going fast hits a wall. |
| Suggested fix | Add a transitional paragraph header `\paragraph{Related Literature}` (already present in the tex) helps structurally, but the first-sentence narrative still has no bridge. Consider opening #13 with a sentence like "These results build on a small but growing empirical literature." |

**Issue 3 (Institutional Details 16 -> 17): Section opener is descriptive, not argumentative**

| Location | institutional_details.tex, paragraphs 1-2 (~lines 4-6, 26-27) |
|---|---|
| First sentences | 16: "Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers." / 17: "Visa and MC connect merchants, merchants' banks (acquirers)..." |
| Problem | Both sentences describe *what* networks are. Neither connects to *why* this matters for the competitive bottleneck. The section reads as background. A reader who skims first sentences gets mechanics but no argument. |
| Suggested fix | The opener could forward-reference: "Payment networks are two-sided platforms... Understanding this pricing structure is essential because the split between merchant fees and consumer rewards drives the competitive bottleneck." But this may be overkill for an institutional section -- low priority. |

**Issue 4 (Reduced-form 28 -> 29): Result then mechanism backtracks**

| Location | reducedform.tex, paragraphs around lines 36-52 |
|---|---|
| First sentences | 28: "Figure X plots the estimates." [delivers 30% decline punchline] / 29: "The Durbin response combined rewards cuts with changes in advertising and teller incentives." |
| Problem | After delivering the main result (30% decline), the text circles back to explain *which channels* drove it. This is a standard robustness paragraph but its first sentence reads as new information rather than as a qualification. The reader wonders whether the result just stated needs to be revised. |
| Suggested fix | Open with "This 30% decline reflects..." or "Part of this decline may reflect..." to signal that the paragraph qualifies rather than overturns the result. |

**Issue 5 (Counterfactuals 103 -> 104): Near-repetition of mechanism**

| Location | counterfactuals.tex, paragraphs around lines 127-143 |
|---|---|
| First sentences | 103: "Consumers gain $28 billion even though fees and rewards fall by roughly equal amounts." / 104: "Credit card adoption is socially excessive because of price coherence." |
| Problem | Both paragraphs explain the same mechanism: why welfare rises when fees and rewards fall symmetrically. #103 explains via revealed preference and credit aversion. #104 explains via the price-coherence externality and prisoner's dilemma. The two framings are complementary but reading them back-to-back feels repetitive. |
| Suggested fix | Merge into one paragraph, or open #104 with "The mechanism is price coherence" to signal a shift from *what* to *why*. |

**Issue 6 (Counterfactuals 109 -> 110): Abrupt topic shift across subsections**

| Location | counterfactuals.tex, paragraphs around lines 195-214 |
|---|---|
| First sentences | 109: "An international comparison provides external plausibility for the magnitude of reward-driven substitution." / 110: "One might expect that increasing competition among networks would substitute for fee regulation." |
| Problem | Jumps from the Australia comparison (Durbin repeal validation) to the monopoly counterfactual. The subsection heading helps, but the first-sentence narrative has no connecting thread. |
| Suggested fix | Open the competition section with a sentence that bridges from the Durbin discussion: "The Durbin and fee-cap results show that fee levels matter; the next question is whether competition can substitute for regulation." |

**Issue 7 (Counterfactuals 113 -> 114): Dual routing theory paragraph drops in without setup**

| Location | counterfactuals.tex, paragraphs around lines 243-261 |
|---|---|
| First sentences | 113: "Rather than regulating fees directly, policy can redirect the locus of network competition." / 114: "The intuition follows from the merchant acceptance condition in Section X." |
| Problem | #113 is a strong opener. But #114 immediately dives into theory ("the intuition follows from the merchant acceptance condition") before giving the reader the quantitative results. The result ($8B welfare gain, fees fall 13 bps) appears only later. Inverted pyramid would put the headline number first. |
| Suggested fix | Move the quantitative result earlier (it currently appears in the paragraph starting at line 246-254) and let the theory paragraph follow. |

**Issue 8 (Counterfactuals 118-122): Discussion fragmentation**

| Location | counterfactuals.tex, Discussion subsection (~lines 280-313) |
|---|---|
| First sentences | 118: "The welfare gains from fee caps and dual-routing mandates are quantitatively robust..." / 119: "Consumer payment choices in the model reflect preferences, not constraints." / 120: "An alternative interpretation is that some consumers cannot obtain credit cards." / 121: "The 120 basis point cap keeps the counterfactual close to observed fee levels..." / 122: "The CES functional form specifies merchant fee pass-through to retail prices..." |
| Problem | Five paragraphs on four unrelated robustness topics (overall robustness, constraints vs. preferences, fee cap choice, pass-through). Each paragraph opens without connecting to the previous one. Reads as a checklist. |
| Suggested fix | The framing sentence in #118 already helps. Consider organizing the \paragraph headings into a progression (assumptions about consumers -> assumptions about merchants -> sensitivity to policy parameter) so each opener can reference the previous. |

**Issue 9 (Model 70): Assumptions section opens with a meta-statement**

| Location | model.tex, line ~295 |
|---|---|
| First sentence | "The model makes several simplifying assumptions for tractability." |
| Problem | This is a meta-statement about the section rather than a claim. It tells the reader to expect caveats but doesn't orient them to *which* assumptions matter most or *why* they were chosen. The paragraph assumptions that follow (segmentation, fixed costs, merchant types, etc.) are individually well-written, but the opening line wastes the reader's attention. |
| Suggested fix | Lead with the most consequential assumption: "The model's key simplification is that credit and debit transactions do not substitute at the point of sale." Then note that this section discusses this and other assumptions. |

**Issue 10 (Estimation 85 -> 86 -> 87 -> 88): Results subsection front-loads four parallel claims**

| Location | estimation.tex, paragraphs around lines 149-173 |
|---|---|
| First sentences | 85: "The estimated parameters support the competitive bottleneck..." / 86: "The consumer substitution matrix shows that consumers view credit cards, debit cards, and cash as distinct segments." / 87: "Consumers are roughly ten times as sensitive to rewards as merchants are to fees." / 88: "The parameters reveal substantial consumer 'credit aversion.'" |
| Problem | Four consecutive paragraph openers each announce an independent finding. No paragraph builds on the previous one through a keyword chain. The progression is: bottleneck support -> substitution matrix -> asymmetric sensitivity -> credit aversion. These are all facets of the same story but read as a flat inventory. |
| Suggested fix | Thread them: the substitution matrix (#86) shows segmentation, which explains *why* the 10x asymmetry (#87) arises, which in turn implies that when rewards disappear, consumers reveal credit aversion (#88). Making this chain explicit in first sentences would unify the four paragraphs. |

---

### Changes Since Last Extraction

**Resolved from prior priority fixes:**
1. ~~Data section opener~~ -- Now connects to competitive bottleneck ("Identifying the competitive bottleneck requires...")
2. ~~Model section opener~~ -- Now states deliverable ("To quantify how the competitive bottleneck shapes fees, rewards, and welfare...")
3. ~~Intro #10->11~~ -- Partially addressed: "These welfare gains are not from reducing market power. Two counterfactuals illustrate this." now appears, but "Second" in #11 still reads as lopsided enumeration (Issue 1 above).

**New observations:**
- Institutional details opener now starts with "Payment networks are two-sided platforms" (cleaner than prior "With every card swipe")
- Counterfactuals opener now enumerates all five policies in the second sentence
- Estimation results subsection now has a framing sentence (#85) before the individual findings
- Reduced-form 3.2 opener changed from "I identify the causal effect..." to "Merchants face strong incentives to accept cards because doing so increases sales" -- stronger because it states the claim first

### Summary

**Strengths:**
- Introduction: excellent wrong-diagnosis pivot, inverted pyramid, all five counterfactuals previewed
- Data and Model openers now connect directly to the competitive bottleneck (both fixed since last review)
- Reduced-form section has the clearest argumentative structure: three facts, one bottleneck, perfect keyword chain
- Estimation and Counterfactuals openers connect backward and forward
- Conclusion engages with legal/policy implications (Ohio v. AmEx, Durbin, BNPL)

**Remaining priority fixes (ranked):**
1. **Intro 10->11**: Lopsided enumeration of "not market power" counterfactuals
2. **CF 103->104**: Near-repetition of fee-cap welfare mechanism
3. **CF Discussion 118-122**: Disconnected robustness checklist
4. **CF 109->110**: No bridge from Durbin repeal to monopoly
5. **Estimation 85-88**: Flat inventory of four independent findings
6. **Reduced-form 28->29**: Result then mechanism backtracks
7. **CF 113->114**: Dual routing theory before quantitative result
8. **Model 70**: Meta-statement opens assumptions section
9. **Intro 12->13**: Abrupt shift to literature review
10. **Institutional details opener**: Descriptive not argumentative (low priority)
