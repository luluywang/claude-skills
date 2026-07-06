# Flow Extraction

## Section Skeleton

### 1. Introduction

In the U.S., Visa and Mastercard (MC) process 80% of card transactions and merchants pay around $120 billion in fees every year to accept cards. These facts have motivated two decades of litigation and legislation built on a view that high merchant fees reflect weak competition.

#### 1.1 Related Literature

The closest empirical work is Huynh et al. (2022), which estimates a structural two-sided model of consumer and merchant card adoption. I build on their work by modeling merchant and network competition.

---

### 2. Institutional Details

Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers. While AmEx sets merchant fees and consumer rewards directly, "open-loop" networks like Visa and MC influence merchant and consumer prices by adjusting the interchange fee and network fee.

---

### 3. Data

Identifying the competitive bottleneck requires measuring how sensitive consumers are to rewards, how much card acceptance increases merchant sales, and how often consumers carry cards from multiple networks.

---

### 4. Reduced-Form Evidence

Three reduced-form facts illustrate the competitive bottleneck that incentivizes networks to compete for consumers rather than merchants. Issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.

#### 4.1 Issuer Incentives Drive Consumer Payment Choices

The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices. Enacted as part of the 2010 Dodd-Frank Act, it capped debit interchange fees for banks and credit unions with over $10 billion in assets starting in October 2011, reducing large issuers' debit interchange revenue by roughly 75 bp without affecting credit.

#### 4.2 Card Acceptance Increases Merchant Sales

Merchants face strong incentives to accept cards because doing so increases sales.

#### 4.3 Merchants Multi-home More Than Consumers

Merchants overwhelmingly accept all cards, yet only around [X]% of consumers use credit cards from two or more networks.

##### 4.3.1 Almost All Merchants Multi-home

As of 2019, most merchants accept either all credit cards or none at all.

##### 4.3.2 Many Consumers Single-home

Consumer single-homing helps explain why merchants are insensitive to fees.

#### 4.4 The Competitive Bottleneck

Together, these three facts provide evidence for a "competitive bottleneck" in which networks compete primarily for consumers, not merchants.

---

### 5. Model

To quantify how network competition shapes fees, rewards, and welfare, I build a model that features two-sided multi-homing, merchant competition, and price coherence.

#### 5.1 Structure of the Game

I model competition between card networks as a static game with three stages between networks, consumers, and merchants.

#### 5.2 Stage 3: Consumer Shopping and Payments

Consumers' payment decisions depend on merchants' acceptance decisions, and their shopping decisions depend on their ability to use preferred payment methods.

##### 5.2.1 Payment Behavior at the Point of Sale

At the point of sale, consumers' primary and secondary cards and merchant acceptance determine payment behavior.

##### 5.2.2 Consumption Decisions Over Merchants

Consumers have CES preferences over a continuum of merchants, each selling a differentiated variety.

#### 5.3 Stage 2: Pricing, Acceptance, and Adoption

Merchants maximize profits by choosing prices and payment acceptance.

##### 5.3.1 Merchant Pricing

Conditional on acceptance M, merchants pass fees into prices.

##### 5.3.2 Merchant Acceptance

Merchants trade off higher sales against higher fees.

##### 5.3.3 Consumer Adoption

Consumers choose up to two cards to maximize utility.

#### 5.4 Stage 1: Network Competition

Multiproduct payment networks maximize profits, anticipating consumer and merchant actions.

##### 5.4.1 Profits

Network profits equal transaction fees minus costs and rewards.

##### 5.4.2 Conduct and Equilibrium Determinacy

Networks set transaction fees τ_j and pecuniary adoption benefits A_j, taking other networks' actions as given.

#### 5.5 Equilibrium

[Equilibrium definition paragraph — no explicit section opener prose]

#### 5.6 Discussion of Key Assumptions

[Structured as paragraphs, no section-opener paragraph. First assumption: Segmentation Between Debit and Credit]

Consumers in the model have strong transaction-specific preferences for credit versus debit.

---

### 6. Estimation

Estimation links the reduced-form facts to quantitative predictions about regulation and competition. The key primitives are consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.

#### 6.1 Estimation Procedure

I estimate all parameters jointly, but the identification argument has three components.

##### 6.1.1 Consumer Demand

The key consumer demand parameters are price-sensitivity (α_0), substitution patterns (Σ), income gradients (α_y, β_y, χ^{lm}_y), and multi-homing complementarity terms (χ^{lm}).

##### 6.1.2 Network Costs

I recover network costs by inverting first-order conditions with respect to rewards.

##### 6.1.3 Merchant Types

I recover the distribution of merchant types G by combining event-study evidence from grocery chains' credit card acceptance changes in the Homescan panel, acceptance data from the DCPC, and networks' optimal pricing conditions.

##### 6.1.4 Calibrated Parameters

I calibrate two sets of parameters.

#### 6.2 Merchant and Consumer Sensitivities and Credit Aversion

The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants.

#### 6.3 Goodness of Fit

I assess fit by examining untargeted moments, including adoption shares, the joint distribution of primary and secondary cards, and merchant acceptance patterns.

##### 6.3.1 Consumer Demand

Table [cf-baseline] shows baseline prices and market shares.

##### 6.3.2 Merchant Demand

I validate merchant parameter estimates against three types of evidence.

##### 6.3.3 Network Parameters

Network cost parameters match accounting data.

---

### 7. Counterfactuals

I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse.

#### 7.1 Capping Credit Card Merchant Fees

In my main counterfactual, I cap credit card merchant fees at 120 bp, roughly half their current level.

##### 7.1.1 Effects on Prices and Shares

Capping credit card merchant fees reduces consumer rewards and credit card use, illustrating the see-saw principle in Rochet and Tirole (2003).

##### 7.1.2 Welfare

Fee caps increase total welfare by $27 billion per year, with most gains accruing to consumers.

##### 7.1.3 Distributional Effects

Fee and reward reductions redistribute consumption toward lower-income consumers.

#### 7.2 Repealing the Durbin Amendment

Fee caps do not raise welfare simply by correcting market power.

#### 7.3 Welfare Effects of Reducing Network Competition

One might expect that increasing competition among networks would substitute for fee regulation.

#### 7.4 Consumer Multi-Homing and Dual Routing

Rather than regulating fees directly, policy can redirect the locus of network competition.

#### 7.5 Central Bank Digital Currencies and Public Entry

Proposals for central bank digital currencies (CBDC) and faster payments motivate the possibility that government entry could discipline network pricing.

#### 7.6 Discussion

The welfare gains from fee caps and dual-routing mandates are quantitatively robust across alternative assumptions about consumer constraints, merchant pass-through, and reward sensitivity.

---

### 8. Conclusion

The increased use of credit cards over time and the corresponding increase in merchants' costs of payments are a consequence of intense network competition channeled toward the wrong side of the market.

---

## Paragraph Skeleton

1. In the U.S., Visa and Mastercard (MC) process 80% of card transactions and merchants pay around $120 billion in fees every year to accept cards.
2. I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.
3. Three forces explain why networks are incentivized to tax merchants to subsidize consumers.
4. To quantify the welfare costs of the competitive bottleneck, I build a structural model in which payment networks compete as two-sided platforms.
5. I estimate consumer and merchant preferences by matching the reduced-form facts, moments from payment surveys, and aggregate market-level data.
6. The structural model shows that current credit card merchant fees and rewards are too high.
7. Credit card adoption is socially excessive because of price coherence.
8. The gains from fee caps are also progressive: reduced merchant fees pass through to lower retail prices for all consumers, whereas the reduction in rewards falls mostly on high-income consumers.
9. Two counterfactuals illustrate that these welfare gains are not from reducing market power.
10. Second, merging all networks into a monopoly raises total welfare by $15 billion per year.
11. In the absence of fee caps, policy can also redirect competition by increasing consumer multi-homing.
12. [Related Literature] The closest empirical work is Huynh et al. (2022), which estimates a structural two-sided model of consumer and merchant card adoption.
13. Whether network competition raises or lowers fees, rewards, and welfare is a quantitative question that theory alone cannot resolve.
14. My paper contributes to the empirical IO literature on two-sided markets.
15. My paper also relates to a literature on price regulation in credit card markets.

**[Institutional Details]**

16. Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers.
17. Visa and MC connect merchants, merchants' banks (acquirers), consumers' banks (issuers), and consumers.
18. Regulatory shocks confirm that interchange strongly affects merchant fees and rewards but not borrowing costs.

**[Data]**

19. Identifying the competitive bottleneck requires measuring how sensitive consumers are to rewards, how much card acceptance increases merchant sales, and how often consumers carry cards from multiple networks.
20. [Aggregate Prices and Shares] I use the Nilson Report's aggregate payment volumes and merchant fees in 2019.
21. [Issuer Payment Volumes] The Nilson Report publishes the dollar payment volumes of the top credit and debit card issuers annually.
22. [Homescan] The NielsenIQ Homescan panel tracks the payment decisions of around 100,000 households at large consumer packaged goods stores from 2013--2023.
23. [Consumer Payment Surveys] I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) to build a transaction-level dataset.

**[Reduced-Form Evidence]**

24. Three reduced-form facts illustrate the competitive bottleneck that incentivizes networks to compete for consumers rather than merchants.
25. The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices.
26. I estimate the effect on payment volumes by comparing debit card volumes at large and small issuers.
27. Figure [volumes] plots the estimates.
28. This decline reflects several channels beyond rewards alone.
29. Merchants face strong incentives to accept cards because doing so increases sales.
30. The merchants in these event studies are highly selected.
31. I compare spending by credit card users versus non-users, at merchants that changed acceptance versus those that did not, before versus after the change.
32. This strategy allows the focal merchants to experience other unobserved shocks contemporaneous with the acceptance change.
33. Figure [grocer-event-sales-effects] shows that acceptance increases sales to credit card users by approximately [X]%.
34. An alternative explanation is that credit card acceptance increases sales by lowering consumers' effective prices through rewards.
35. Merchants overwhelmingly accept all cards, yet only around [X]% of consumers use credit cards from two or more networks.
36. As of 2019, most merchants accept either all credit cards or none at all.
37. Similar aggregate acceptance counts could be consistent with merchants specializing in disjoint sets of networks.
38. Consumer single-homing helps explain why merchants are insensitive to fees.
39. I study consumer multi-homing using the Homescan shopping data, defining a network as Visa credit, MasterCard (MC) credit, AmEx, or any debit card.
40. Around [X]% of primary credit card consumers carry credit cards from multiple networks.
41. Together, these three facts provide evidence for a "competitive bottleneck" in which networks compete primarily for consumers, not merchants.

**[Model]**

42. To quantify how network competition shapes fees, rewards, and welfare, I build a model that features two-sided multi-homing, merchant competition, and price coherence.
43. I model competition between card networks as a static game with three stages between networks, consumers, and merchants.
44. Consumers' payment decisions depend on merchants' acceptance decisions, and their shopping decisions depend on their ability to use preferred payment methods.
45. At the point of sale, consumers' primary and secondary cards and merchant acceptance determine payment behavior.
46. Consumers with two cards can substitute between them.
47. Consumers have CES preferences over a continuum of merchants, each selling a differentiated variety.
48. Consumers spend more at merchants that accept the cards that they use the most often.
49. Merchants maximize profits by choosing prices and payment acceptance.
50. Conditional on acceptance M, merchants pass fees into prices.
51. Merchants trade off higher sales against higher fees.
52. The intercept a_M captures fee costs; b_M captures sales gains.
53. Consumers choose up to two cards to maximize utility.
54. Consumers prefer cards with high rewards and wide acceptance.
55. Because pecuniary utility is derived from the CES problem, a 1 pp. increase in rewards and a 1% increase in retail prices exactly offset.
56. For multi-homing agents, pecuniary utility is the weighted average of single-homing utilities.
57. Non-pecuniary utility captures within-wallet complementarities and adoption costs.
58. Preferences vary with income and exhibit unobserved heterogeneity.
59. Multiproduct payment networks maximize profits, anticipating consumer and merchant actions.
60. Network profits equal transaction fees minus costs and rewards.
61. Networks set transaction fees τ_j and pecuniary adoption benefits A_j, taking other networks' actions as given.
62. Consumers in the model have strong transaction-specific preferences for credit versus debit.
63. Online Appendix [sec:oa-credit-debit] explores the challenges with relaxing this assumption and estimates versions of the model with credit-debit substitution.
64. Trial testimony and data reject both of these predictions.
65. A special case allows for credit-debit substitution without credit-debit multi-homing rates affecting credit card acceptance.
66. Consumers choose up to two cards and are indifferent between them as long as they are the same type.
67. I omit fixed costs of card acceptance because they cannot be separately identified from heterogeneity in sales benefits γ without exogenous shocks to consumer adoption.
68. Merchants differ only in the sales benefit γ.
69. The data lack non-rewards credit card characteristics such as interest rates, credit limits, or annual fees.
70. Merchants charge the same price regardless of payment method (price coherence).

**[Estimation]**

71. Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
72. I estimate all parameters jointly, but the identification argument has three components.
73. The effect of the Durbin Amendment on debit card volumes identifies the price-sensitivity coefficient α_0.
74. If part of the observed decline reflects reduced non-price steering rather than lost rewards, the model overstates reward sensitivity.
75. My second-choice survey reveals the covariance matrix Σ of the random coefficients.
76. Wallet complementarity parameters are identified by multi-homing patterns in the Homescan data.
77. Demographic data identify how preferences vary with income.
78. I recover network costs by inverting first-order conditions with respect to rewards.
79. I recover the distribution of merchant types G by combining event-study evidence from grocery chains' credit card acceptance changes in the Homescan panel, acceptance data from the DCPC, and networks' optimal pricing conditions.
80. I model grocery chains that changed their acceptance policies during this period as the lowest-type merchant that accepts credit cards.
81. I parameterize G as a two-parameter Gamma distribution.
82. Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets.
83. I calibrate two sets of parameters.
84. The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants.
85. The consumer substitution matrix in Table [cross-sub] shows that consumers view credit cards, debit cards, and cash as distinct segments.
86. Consumers are roughly ten times as sensitive to rewards as merchants are to fees.
87. The parameters reveal substantial consumer "credit aversion."
88. Reward sensitivity is increasing in income (α_y > 0).
89. I assess fit by examining untargeted moments, including adoption shares, the joint distribution of primary and secondary cards, and merchant acceptance patterns.
90. Table [cf-baseline] shows baseline prices and market shares.
91. I validate merchant parameter estimates against three types of evidence.
92. Network cost parameters match accounting data.

**[Counterfactuals]**

93. I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse.
94. In my main counterfactual, I cap credit card merchant fees at 120 bp, roughly half their current level.
95. Capping credit card merchant fees reduces consumer rewards and credit card use, illustrating the see-saw principle in Rochet and Tirole (2003).
96. Fee caps increase total welfare by $27 billion per year, with most gains accruing to consumers.
97. I measure consumer welfare by compensating variation.
98. To understand the sources of these gains, Table [cap-credit-channel-decomp] decomposes welfare by sequentially allowing more merchant responses.
99. Even though fee caps target merchants, merchants benefit little in equilibrium.
100. The harm to networks is also modest.
101. Consumers gain $28 billion even though Table [cf-effects] shows fees and rewards falling by roughly equal amounts.
102. Credit card adoption is socially excessive because of price coherence.
103. Fee and reward reductions redistribute consumption toward lower-income consumers.
104. Fee caps do not raise welfare simply by correcting market power.
105. Repealing the Durbin Amendment moderates rewards competition between networks.
106. Repealing the Durbin Amendment generates large welfare gains.
107. One might expect that increasing competition among networks would substitute for fee regulation.
108. Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps, dramatically reducing credit card use.
109. The merger costs consumers $11 billion (though imprecisely estimated) while raising network profits by $31 billion.
110. Rather than regulating fees directly, policy can redirect the locus of network competition.
111. The intuition for these effects follows from the merchant acceptance condition in Section [subsubsec:model-merch-accept].
112. Current proposed dual-routing legislation often requires that the secondary network not be a large established network.
113. Proposals for central bank digital currencies (CBDC) and faster payments motivate the possibility that government entry could discipline network pricing.
114. The welfare gains from fee caps and dual-routing mandates are quantitatively robust across alternative assumptions about consumer constraints, merchant pass-through, and reward sensitivity.
115. Consumer payment choices in the model reflect preferences, not constraints.
116. An alternative interpretation is that some consumers cannot obtain credit cards.
117. The CES functional form specifies merchant fee pass-through to retail prices; I lack the required merchant-level interchange data matched to retail prices to test pass-through.
118. The 120 bp cap keeps the counterfactual close to observed fee levels, avoiding the large out-of-sample extrapolation required by more aggressive caps.

**[Conclusion]**

119. The increased use of credit cards over time and the corresponding increase in merchants' costs of payments are a consequence of intense network competition channeled toward the wrong side of the market.
120. The counterfactual results in this paper have broad implications for contemporary legal and policy debates in payments and platform markets more broadly.
121. The Durbin Amendment shows that capping the wrong fees makes things worse.
122. The merger counterfactual challenges a second piece of conventional wisdom: that the high cost of payments reflects too little competition.
123. The [Ohio] standard also implicitly treats competition for merchants and competition for consumers as interchangeable.

---

## Analysis

### Section Opener Issues

| Section | Issue |
|---------|-------|
| Institutional Details | Connects to RAP weakly. The opener ("Payment networks are two-sided platforms...") states background fact rather than linking back to the intro's central claim. The section lacks a purpose statement: it does not tell the reader what they will learn here that they could not have learned from the intro. |
| Data | No issue. Opener states the three objects that need measuring and announces the data sources — purpose is clear and ties directly to the bottleneck argument. |
| Reduced-Form Evidence | Opener is strong. States the three facts, labels them as bottleneck evidence, and announces what the section's empirical work will deliver. |
| Section 4.2 (Card Acceptance Increases Merchant Sales) | Opener is weak: "Merchants face strong incentives to accept cards because doing so increases sales." This is the conclusion, not a provocation. The section's contribution is the *causal identification* of this effect, but the opener pre-announces the result with no tension. Misses the RAP connection (why this fact specifically matters for the bottleneck). |
| Section 4.3.2 (Many Consumers Single-home) | Opener ("Consumer single-homing helps explain why merchants are insensitive to fees") announces the conclusion rather than motivating what's coming. |
| Model | Opener is clean — states purpose and previews the three model features. RAP connection is explicit ("competitive bottleneck"). No issue. |
| Section 5.3 (Stage 2) | Opener is thin. "Merchants maximize profits by choosing prices and payment acceptance" is a description of what they do, not a statement of why this stage matters for the argument (price coherence creating the externality). |
| Section 5.4 (Stage 1: Network Competition) | Opener "Multiproduct payment networks maximize profits, anticipating consumer and merchant actions" is minimal — a description, not a purpose statement. Doesn't explain what the stage adds (endogenizing fees and rewards). |
| Section 5.5 (Equilibrium) | Has no substantive opener — the section body is the equilibrium definition equation. Abrupt. |
| Estimation | Opener is strong: states the bridging role of estimation and names the three key primitives. RAP connection is clear. |
| Section 6.2 (Merchant and Consumer Sensitivities) | Opener announces the conclusion ("the estimated parameters support the competitive bottleneck") before showing the table. Slightly results-first, but acceptable given the section's function as a results presentation. |
| Section 6.3 (Goodness of Fit) | Opener is description-heavy: "I assess fit by examining untargeted moments." No tension, no preview of what the fit reveals. |
| Counterfactuals | Opener is excellent. States the main finding ("too high"), establishes the key surprise ("increasing competition makes it worse"), and previews all five counterfactuals. Strong RAP connection. |
| Section 7.3 (Welfare Effects of Reducing Network Competition) | Opener poses a tension ("One might expect...") but then immediately resolves it ("In payment markets, the opposite holds") in the same breath, collapsing what could be a stronger provocation. |
| Section 7.6 (Discussion/Robustness) | Opener announces robustness ("quantitatively robust") without context. Reads as throat-clearing before substantive content. |
| Conclusion | Opener is strong — restates the core mechanism directly and concisely. |

---

### Flow Breaks in Paragraph Skeleton

| After sentence # | Issue |
|------------------|-------|
| 11 (intro three-forces paragraph) → 12 (build model paragraph) | Clean transition — the three forces lead naturally to the need for a structural model. No break. |
| 15 (lit review: platform pricing) → 16 (lit review: price regulation) | The transition from platform pricing to price regulation in credit markets is abrupt. The link between Sullivan (2025) and the literature on interest rate caps is not stated — the connector is missing. A reader following only first sentences loses the thread here. |
| 18 (inst. details: regulatory shocks confirm) → 19 (data: identifying competitive bottleneck requires) | **Break.** The institutional details section ends with evidence about interchange and interest rates; the data section opens with measurement requirements. The argumentative link — why the institutional evidence matters before turning to data — is absent. The two sections sit adjacent without a bridging sentence. |
| 28 (Durbin: decline reflects several channels) → 29 (merchant acceptance: merchants face strong incentives) | **Break.** The channel-decomposition discussion in the Durbin subsection ends, and the next subsection opens with a conclusion about merchant acceptance. A reader of first sentences would not understand why we shift from consumer behavior to merchant behavior here, or what the logical connection is. The section opener of 4.2 should preview why this fact is the next piece of evidence needed. |
| 34 (alternative explanation via rewards) → 35 (merchants multi-home more than consumers) | **Break.** Sentence 34 is the final piece of the credit-acceptance-increases-sales argument; sentence 35 opens a new subsection with a new fact. The leap is large and the connection to the bottleneck argument is not restated. |
| 41 (competitive bottleneck subsection summary) → 42 (model) | **Break.** The bottleneck section ends with the observation that theory produces ambiguous predictions, which motivates the structural model. But sentence 42 opens the model with "To quantify how network competition shapes fees, rewards, and welfare" — this is good, but the connection to "theory is ambiguous" is implicit, not explicit. Works in context but borderline. |
| 52 (intercept a_M captures fee costs; b_M captures sales gains) → 53 (consumers choose up to two cards) | **Break.** After three paragraphs on merchant acceptance mechanics, the narrative shifts abruptly to consumer adoption without a transitional signal. The reader following first sentences loses track of the stage structure. |
| 65 (special case: credit-debit substitution) → 66 (two-card restriction) | **Break.** The model assumption discussion shifts from credit-debit segmentation to the two-card restriction without indicating this is the next assumption to be addressed. In the assumptions paragraph structure, this is expected, but a reader of first sentences sees a sequence of disconnected claims. |
| 82 (merchant price-sensitivity follows from standard insight) → 83 (calibrate two sets of parameters) | Mild break. The discussion of how merchant sensitivity is recovered ends and calibration begins. The logical step — what parameters remain after demand and cost identification — is implicit. |
| 99 (merchants benefit little) → 100 (harm to networks is also modest) | The sequence merchants → networks → consumers is logical but mechanically structured. Reads like an inventory. No break per se, but the three paragraphs (99, 100, 101) each announce their result first, then explain it. Consistent results-first pattern across this passage. |
| 113 (CBDC section) → 114 (discussion/robustness) | **Break.** The CBDC paragraph ends by noting that a public product displacing credit is "beyond the scope of most current proposals." The robustness section then opens by announcing that results are "quantitatively robust." The logical connection between CBDC limitations and the robustness paragraph is absent. |
| 122 (conclusion: merger counterfactual challenges conventional wisdom) → 123 (Ohio standard treats competition for merchants and consumers as interchangeable) | Minor break. The conclusion shifts from the merger result to the Ohio standard without a bridging phrase. The paragraph on competition and market power ends with Buy Now, Pay Later; the next paragraph pivots to the Ohio legal standard. A reader of first sentences would not see the connection from BNPL to antitrust doctrine. |

---

### Summary

**Strengths:**

- The introduction has a strong RAP structure. The first three paragraphs execute the inverted pyramid well: diagnosis (problem with conventional view), three-force mechanism, structural model announcement.
- The counterfactuals section opener is the best in the paper: it states the finding, flags the key surprise (competition makes things worse), and previews five scenarios. Readers know exactly where they are going.
- The reduced-form section opener cleanly names all three facts and links them to the bottleneck concept before any evidence appears.
- The estimation section opener explicitly labels estimation's bridging role and names the three identification components — strong preparation for detail.
- The conclusion restates the mechanism directly without preamble.

**Priority fixes:**

1. **Institutional Details opener** — The section currently opens with background description. Add a sentence that links the institutional structure (interchange, two-sided pricing) to why the bottleneck emerges — i.e., why the section is a prerequisite for understanding the paper's argument, not just context.

2. **Flow breaks at subsection boundaries in reduced-form section** — Sentences 28→29 and 34→35 are the sharpest breaks: the Durbin result ends and the merchant sales subsection begins without a connector. The bottleneck framing should be restated briefly at each transition to keep the three-fact structure legible.

3. **Results-first pattern in welfare decomposition (sentences 99–101)** — Three consecutive paragraphs in the welfare section (merchants benefit little / harm to networks modest / consumers gain) each open with the result and then explain it. The reader loses narrative momentum. Reordering at least one of these to open with the mechanism rather than the result would break the inventory rhythm.
