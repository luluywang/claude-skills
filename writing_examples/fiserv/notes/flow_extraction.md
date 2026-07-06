# Flow Extraction

## Section Skeleton

### 1. Introduction
Payment systems redistribute across consumers who choose different payment methods but shop at the same stores. Transfers arise because payment acceptance costs vary significantly by payment method, yet retail prices do not. Since interchange fees---the major component of acceptance costs---flow back to consumers as rewards, a cross-subsidy emerges: all consumers pay higher retail prices, but the users of high-interchange-fee credit cards capture most of the rewards.

### 2. Institutional Setting and Data
In this section, we outline the institutional details and describe our data. We explain how credit and debit card payment systems operate, focusing on key participants, costs, benefits, and transfers. We then introduce our two primary merchant-level payment datasets from Fiserv, which allow us to observe how the types and costs of payment methods vary across merchants. These data show which payments merchants receive and what fees they pay. Together, these data allow us to link merchant-level payment composition and costs to redistribution across consumers.

#### 2.1 Payment Processing and Interchange Fees
A typical card payment involves the customer making a purchase, the merchant accepting the payment, and three key financial intermediaries: the merchant acquirer, the issuer, and the card network.

#### 2.2 Data
We use two proprietary datasets from Fiserv, one of the largest U.S. merchant acquirers, to examine how interchange fees vary across merchants and their impact on consumer welfare. A key feature of these data is that we observe both the composition and price of transactions at the merchant level, which is critical for measuring heterogeneity in payment costs and its implications for redistribution.

##### 2.2.1 Sources
Our primary dataset comes from Fiserv's payment settlement records, which cover one-fifth of all U.S. card volume.

##### 2.2.2 Data Coverage and Representativeness
The Fiserv data are highly representative of the broader U.S. economy in terms of sectoral coverage, firm size (based on card sales), and geographic distribution.

### 3. Variation in Payment Mix and Payment Costs
Redistribution in the payment system requires consumers who use different payment methods to shop at the same stores. The magnitude of redistribution at each merchant depends on the differences in the fees for these payment methods. In this section, we document novel facts about the variation in payment composition and costs across merchants. We show that payment methods vary significantly in their fees, which generates the potential for redistribution. However, we also document two forces---consumer sorting and merchant fee heterogeneity---that cause aggregate data to overstate the extent of redistribution in the payment system, by limiting the overlap between consumers using different payment methods and compressing fee differences where such overlap occurs.

#### 3.1 Variation in Payment Mix
One notable feature of the data is that payment composition varies significantly across merchants.

##### 3.1.1 Variation Across and Within Sectors
Part of this heterogeneity in the merchant payment mix stems from sector-specific characteristics.

##### 3.1.2 Variation Across Regions and Income Levels
Beyond sector-level differences, payment methods vary systematically with consumer income, which implies that transfers from cash and debit consumers to credit consumers are regressive.

##### 3.1.3 Decomposing the Variation in Payment Methods
To better understand what drives the variation in payment methods, we estimate regressions of the following form: [regression equation]

#### 3.2 Variation in Payment Costs
Payment mix heterogeneity creates substantial variation in merchant transaction costs.

##### 3.2.1 Card Types
Cards vary significantly in their interchange fees. These differences generate the scope for redistribution, as users of low-fee payment methods cross-subsidize the users of high-fee methods.

##### 3.2.2 Merchant Sectors
Interchange rates also vary across sectors, with travel and retail typically paying higher fees.

##### 3.2.3 Merchant Size and Other Characteristics
The data show that interchange fees are generally lower for larger firms.

#### 3.3 Real Effects
In Appendix E, we present novel evidence that interchange fees have real effects on merchant sales.

#### 3.4 Summarizing the Facts
Our reduced-form analysis highlights one fact that suggests substantial redistribution between consumers who use different payment methods, and two facts that moderate this redistribution.

### 4. Methodology: Measuring Interchange Fee Redistribution
In this section, we describe the development of two related approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model. These approaches allow us to quantify how redistribution changes when accounting for consumer sorting and merchant fee heterogeneity. We also evaluate different regulatory counterfactuals: European-style regulation and the consequences of the Durbin Amendment.

#### 4.1 Sufficient Statistic Economic Environment
We model the behavior of consumers, merchants, and payment networks. Consumers with fixed payment preferences choose how to allocate spending across merchants subject to a budget constraint. Merchants set retail prices in response to the composition of payments they receive and the fees on each payment method. Payment networks set interchange fees and pay consumers rewards.

##### 4.1.1 Consumers
The sufficient statistics economic environment places few restrictions on consumer preferences.

##### 4.1.2 Merchants
Merchants set prices based on their marginal costs to maximize profits.

##### 4.1.3 Card Networks and Rewards
We assume that card networks pass-through merchant fees, net of costs, to lump-sum consumer rewards.

#### 4.2 Sufficient Statistics Approach
We develop sufficient statistics to conduct an equilibrium welfare evaluation of interchange fees across consumer groups when payment choices are fixed, but prices and consumption can re-adjust.

##### 4.2.1 Intuition and proof sketch
The theorem states that two channels determine how interchange fees redistribute welfare.

##### 4.2.2 Relation to alternative approaches
Our sufficient-statistic approach yields a simple formula that requires only the payment shares and the overlap moments.

##### 4.2.3 Sufficient statistic parameters
To calculate the sufficient statistics for consumer welfare as per eq. (4), all we need are the revenue-weighted first and second-moments of payment shares, as well as the estimates of the baseline fee, the sector adjustments, and the negotiated discount.

#### 4.3 Structural Model
While the sufficient-statistics approach provides intuitive and transparent estimates of redistribution, it requires us to make assumptions about both the pass-through of interchange fees to retail prices and the pass-through of interchange revenues to consumer rewards.

##### 4.3.1 Consumer Preferences
We model consumer demand using a nested CES structure that allows for rich heterogeneity in shopping patterns across payment methods.

##### 4.3.2 Merchant Problem
Merchants set a uniform price for all consumers, regardless of payment method, consistent with the institutional reality that most U.S. merchants do not price discriminate by payment type.

##### 4.3.3 Network Problem
The network problem in the structural model is the same as that in the sufficient statistics framework.

##### 4.3.4 Equilibrium
An equilibrium is defined by a vector of prices for each sector and a vector of consumption choices for consumers of each payment method, such that consumers maximize utility given prices and merchants maximize profits.

##### 4.3.5 Calibration
We next calibrate our model to the data. We target moments describing the composition of payments across merchants and sectors.

### 5. Results on Interchange Fee Redistribution
We use the sufficient-statistics approach to quantify redistribution under several scenarios. We first quantify the distributional consequences of interchange fees by measuring redistribution relative to a zero-interchange benchmark, which corresponds to the regulatory environment in the E.U. We also assess the degree to which the resulting redistribution is progressive or regressive across the income distribution.

#### 5.1 Existing Benchmarks
Before presenting our results, we put them in the context of existing debates. Public discussion of interchange fees is polarized between two extreme views.

#### 5.2 The Redistributive Effects of Interchange Fees
We study how interchange fees affect retail prices and rewards, and thus redistribution.

##### 5.2.1 Redistribution Across Payment Types
The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs.

##### 5.2.2 The Effects of Consumer Sorting and Negotiation on Redistribution Estimates
The second contribution of our framework is that it allows us to quantify the extent to which consumer sorting and merchant fee heterogeneity reduce redistribution.

##### 5.2.3 Interchange Fees Result in Regressive Redistribution
Higher-income consumers use higher-fee payment methods, suggesting that the resulting redistribution is regressive.

##### 5.2.4 Robustness
Our benchmark sufficient statistic makes strong assumptions on the pass-through of interchange fees to retail prices and consumer rewards.

#### 5.3 Effects of the Durbin Amendment
Our framework also sheds light on the redistributive impact of the Durbin Amendment.

#### 5.4 Who Pays for Premiumization?
Lastly, we examine the redistribution effects of the rise in premium credit cards.

### 6. Conclusion
Interchange fees shape retail activity and redistribute consumption. Using merchant-level data, we document substantial heterogeneity in the composition and cost of payments across stores, with critical implications for merchants' costs and redistribution. By combining the results of a sufficient-statistics framework with a calibrated structural model, we quantify the overall impact of interchange pricing.

---

## Paragraph Skeleton

### Introduction
1. Payment systems redistribute across consumers who choose different payment methods but shop at the same stores.
2. This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs.
3. In recent years, merchants and policymakers have fought against rising interchange fees through both litigation and legislation.
4. Despite this policy attention, there is little consensus on who ultimately bears the cost of interchange fees.
5. This lack of consensus reflects a fundamental measurement challenge.
6. More broadly, the existing literature treats the incidence of interchange fees as a representative-agent problem, abstracting from heterogeneity in both merchant characteristics and consumer sorting.
7. In this paper, we use novel merchant-level data from Fiserv to quantify how the payment system redistributes among consumers with different payment preferences.
8. We proceed in three parts.
9. Our results highlight the magnitude and limits of redistribution through the payment system.
10. To study the effects of interchange fees, we draw on two comprehensive datasets from Fiserv, a large U.S. merchant acquirer.
11. In the first part of the paper, we document two basic facts about heterogeneity in the cost and composition of payments across merchants.
12. Our first fact is that payment composition varies substantially across merchants.
13. The distribution is also bimodal: some stores have almost all credit card shoppers, while others have few.
14. The composition of payments across sectors and geographies is consistent with the fact that higher-income individuals are more likely to use credit cards, especially premium credit cards, and less likely to use debit cards.
15. Our second fact is that card type, merchant sector, and merchant size play fundamental roles in determining merchant-level interchange fees.
16. Even holding card types fixed, interchange fees also vary across merchants.
17. We also provide causal evidence that interchange fees have real impacts on prices and consumption.
18. Evaluating the welfare effects of interchange fees would typically require estimating a full demand system across consumers, merchants, and payment methods, along with modeling strategic pricing by firms.
19. Having incorporated merchant heterogeneity, consumer sorting, and the structure of interchange fees, we find that the payment system generates large transfers from cash and debit card users to credit card users of around $X billion per year.
20. At the same time, we find that consumer sorting matters for the magnitude of this transfer.
21. Variation in interchange fees across merchants, driven by a combination of sector discounts and the bargaining power of large merchants, also shapes the redistributive effects of interchange fees.
22. We also use our framework to examine how two recent industry shifts, the Durbin Amendment and the rise in card premiumization, have affected redistribution.

### Related Literature
23. Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
24. Our framework builds on the literature using sufficient statistics to evaluate the welfare effects of market interventions.
25. Our analysis also highlights the redistributive potential of payment system innovations.
26. Our findings on redistribution through the payment system contrast significantly with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products.
27. Finally, our analysis of the Durbin Amendment's redistributive effects builds on Manuszak and Sarin (2025) and Mukharlyamov and Sarin (2025).

### Section 2: Institutional Setting and Data
28. In this section, we outline the institutional details and describe our data.
29. A typical card payment involves the customer making a purchase, the merchant accepting the payment, and three key financial intermediaries: the merchant acquirer, the issuer, and the card network.
30. Merchants pay transaction fees to accept cards.
31. Figure 1 illustrates how fees flow among these parties.
32. The typical merchant discount fee for a credit card transaction in the U.S. is 2.25%, of which the average interchange fee accounts for about 1.90%.
33. Our analysis connects the level and heterogeneity of interchange fees across payment methods and merchants to redistribution across consumers.
34. We use two proprietary datasets from Fiserv, one of the largest U.S. merchant acquirers, to examine how interchange fees vary across merchants and their impact on consumer welfare.
35. Our primary dataset comes from Fiserv's payment settlement records, which cover one-fifth of all U.S. card volume.
36. Our data enable us to observe total payment values, payment counts, and interchange fees paid for each card type by each establishment.
37. We study the data at two levels of aggregation.
38. Our second dataset comes from Clover, a Fiserv-owned point-of-sale (POS) system, covering approximately 800,000 merchants from 2019 to 2022.
39. Like the settlement data, the Clover dataset contains information on payment values, counts, and interchange fees across card types at the establishment level.
40. We supplement our data from Fiserv with survey data on consumers' preferred payment methods from the Federal Reserve Bank of Atlanta's DCPC and the MRI-Simmons Ultimate Survey of Americans (USA).
41. The Fiserv data are highly representative of the broader U.S. economy in terms of sectoral coverage, firm size (based on card sales), and geographic distribution.
42. The Fiserv payment data are also representative of external measures of average transaction size, merchant fees, and the composition of payments.

### Section 3: Variation in Payment Mix and Payment Costs
43. Redistribution in the payment system requires consumers who use different payment methods to shop at the same stores.
44. One notable feature of the data is that payment composition varies significantly across merchants.
45. On average, cash accounts for around 11% of transaction dollars (dollar-weighted across merchants).
46. This heterogeneity shapes redistribution.
47. The remaining 89% of sales occur via debit and credit card payments.
48. The distribution of credit card sales is bimodal, with peaks at approximately 25% and 70%.
49. Part of this heterogeneity in the merchant payment mix stems from sector-specific characteristics.
50. We also find substantial dispersion in the composition of payments within sectors.
51. Beyond sector-level differences, payment methods vary systematically with consumer income, which implies that transfers from cash and debit consumers to credit consumers are regressive.
52. Geographic variation in payment mix also reflects these underlying income differences.
53. To better understand what drives the variation in payment methods, we estimate regressions of the following form: [eq]
54. Table 3 shows that consumers are more likely to use cash at merchants with higher sales volumes but lower average transaction values.
55. Consistent with the income gradient documented in Figure 5, local demographics systematically influence cash usage across merchants.
56. In contrast, consumers are more likely to use credit cards (relative to debit cards) at merchants with lower sales volumes and higher average transaction values.
57. Overall, these results suggest that the payment mix varies substantially across merchants, depending on characteristics such as sector and region.
58. Payment mix heterogeneity creates substantial variation in merchant transaction costs.
59. Part of the variation in average transaction costs is driven by the mix of cash versus card payments across firms.
60. Cards vary significantly in their interchange fees.
61. We classify card payments into four categories: regulated debit, exempt debit, basic credit, and premium credit.
62. Interchange fees on debit cards depend on whether the issuing bank has more than $10 billion in assets.
63. Credit card interchange fees depend on whether the credit card is a premium card targeted at high creditworthiness borrowers.
64. We assess how much differences in payment mix can explain variation in merchant-level interchange fees.
65. Interchange rates also vary across sectors, with travel and retail typically paying higher fees.
66. Fees are highest in the travel and retail sectors, which generally serve more affluent customers compared to other sectors.
67. Accounting for the merchant sector, in addition to the payment mix, explains roughly X% of the overall variation in transaction costs.
68. The data show that interchange fees are generally lower for larger firms.
69. A key mechanism underlying these size-based discounts is that large merchants can influence consumer payment behavior by choosing not to accept specific payment methods.
70. In addition to merchant size, transaction size also plays an important role in determining interchange fees.
71. Accounting for firm characteristics, such as total sales and the average transaction size, in addition to payment mix and sector, explains approximately X% of the overall variation in transaction costs.
72. In Appendix E, we present novel evidence that interchange fees have real effects on merchant sales.
73. Our reduced-form analysis highlights one fact that suggests substantial redistribution between consumers who use different payment methods, and two facts that moderate this redistribution.

### Section 4: Methodology
74. In this section, we describe the development of two related approaches to evaluate the redistributive consequences of interchange fees.
75. We model the behavior of consumers, merchants, and payment networks.
76. The sufficient statistics economic environment places few restrictions on consumer preferences.
77. Merchants set prices based on their marginal costs to maximize profits.
78. Rather than explicitly modeling merchant competition or imposing functional forms on the demand side, we assume that prices are log-linear in weighted interchange fees.
79. We can justify this pricing function in several ways.
80. We assume that card networks pass-through merchant fees, net of costs, to lump-sum consumer rewards.
81. We develop sufficient statistics to conduct an equilibrium welfare evaluation of interchange fees across consumer groups when payment choices are fixed, but prices and consumption can re-adjust.
82. [Theorem statement]
83. The theorem states that two channels determine how interchange fees redistribute welfare.
84. The non-trivial part of the theorem is showing that the equilibrium changes in retail prices across all merchants are well approximated by these mechanical effects.
85. Our sufficient-statistic approach yields a simple formula that requires only the payment shares and the overlap moments.
86. To calculate the sufficient statistics for consumer welfare, all we need are the revenue-weighted first and second-moments of payment shares, as well as the estimates of the fee parameters.
87. We recover the revenue-weighted first and second-moments with their empirical analogues.
88. We recover the fee parameters by regressing firm-level interchange fees for each payment method on sector dummies and a dummy for having more than $1 billion in sales.
89. While the sufficient-statistics approach provides intuitive and transparent estimates of redistribution, it requires us to make assumptions about both the pass-through of interchange fees to retail prices and the pass-through of interchange revenues to consumer rewards.
90. The structural model serves two purposes.
91. We calibrate two versions of the model.
92. We model consumer demand using a nested CES structure that allows for rich heterogeneity in shopping patterns across payment methods.
93. Merchants set a uniform price for all consumers, regardless of payment method.
94. The departure from the standard monopolistic competition assumption serves two purposes.
95. The network problem in the structural model is the same as that in the sufficient statistics framework.
96. An equilibrium is defined by a vector of prices for each sector and a vector of consumption choices for consumers of each payment method.
97. We next calibrate our model to the data.

### Section 5: Results
98. We use the sufficient-statistics approach to quantify redistribution under several scenarios.
99. We next use a counterfactual to show that the Durbin Amendment results in regressive redistribution across consumers.
100. Finally, we show that the largest losers from the rise of premiumization in the credit card market are debit card users, not cash users.
101. Before presenting our results, we put them in the context of existing debates.
102. Academic research has attempted to quantify this transfer.
103. Our analysis yields a more modest estimate of approximately $X billion, but more importantly, it reveals a richer picture of who pays whom.
104. We study how interchange fees affect retail prices and rewards, and thus redistribution.
105. The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs.
106. Table 5 presents our estimates of redistribution across consumer groups.
107. Cash users lose from interchange fees because these fees raise retail prices at merchants where they shop.
108. Even though much of the literature focuses on transfers between card and cash users, regulated debit card users also lose substantially from interchange fees.
109. Whereas cash and regulated debit card users lose from interchange fees, credit card users (basic and premium) gain.
110. We can also quantify who receives and who pays for rewards in Figure 7.
111. The figure clearly illustrates why regulated debit card users "pay" for rewards of credit card users under the current system.
112. The transfers from interchange fees that we estimate are at least as large as other transfers in credit card financial markets, as well as many government insurance programs.
113. The second contribution of our framework is that it allows us to quantify the extent to which consumer sorting and merchant fee heterogeneity reduce redistribution.
114. Consumer sorting reduces redistribution across all segments.
115. Cash and regulated debit users also benefit from fee heterogeneity.
116. Higher-income consumers use higher-fee payment methods, suggesting that the resulting redistribution is regressive.
117. We find that interchange fees generate a large regressive transfer from households with incomes below $150,000 to those with incomes above that level.
118. Our benchmark sufficient statistic makes strong assumptions on the pass-through of interchange fees to retail prices and consumer rewards.
119. Our sufficient statistic assumes that interchange fees are fully passed through to retail prices.
120. As a preliminary step, we first confirm that our calibration successfully replicates the key moments of the empirical data.
121. We next isolate the approximation error from using the sufficient statistic rather than solving the full equilibrium.
122. Last, we study how modeling imperfect pass-through and market power changes our estimates of redistribution.
123. Surprisingly, the structural model finds even greater redistribution from cash and debit card users to credit card users.
124. While the structural model captures strategic pricing behavior, it still implies full pass-through of sector-level interchange fees to retail prices.
125. We can incorporate imperfect pass-through of retail prices and rewards into our sufficient-statistics framework.
126. When both price and rewards pass-through fall to 70%, redistribution dampens proportionally.
127. Our baseline analysis aggregates payment shares to the corporate level.
128. Our framework also sheds light on the redistributive impact of the Durbin Amendment.
129. The Durbin Amendment was designed to limit interchange fees on debit card transactions.
130. Regulated debit card users were hurt by the regulation.
131. The Durbin Amendment redistributes consumer surplus from middle-income to high-income consumers.
132. Lastly, we examine the redistribution effects of the rise in premium credit cards.
133. Table 7 reports the redistributive effects of the rise in premium credit cards.
134. Notably, the largest costs in dollar terms accrue not to cash users but to debit card users.

### Conclusion
135. Interchange fees shape retail activity and redistribute consumption.
136. Our analysis of policy counterfactuals reveals that recent changes in the payment system have had significant regressive impacts.

---

## Analysis

### Section Opener Issues

| Section | Issue |
|---------|-------|
| 2. Institutional Setting and Data | Opens with a process description ("In this section, we outline...") rather than a claim or key insight. Could state the takeaway: interchange fees are institutionally complex and vary along multiple dimensions, making merchant-level data essential. |
| 4. Methodology | Opens with a description of what will be done ("we describe the development of two related approaches") rather than previewing the key insight: that redistribution depends on simple moments (payment share overlaps), not a full demand system. The methodological punchline is buried several paragraphs later. |
| 5.1 Existing Benchmarks | Opens with "Before presenting our results, we put them in the context of existing debates." This is a meta-statement about the paper's structure rather than a substantive claim. It delays the reader from reaching the actual results. |

### Flow Breaks in Paragraph Skeleton

| After sentence # | Issue |
|------------------|-------|
| 9 -> 10 | Topic shift without link. Sentence 9 previews headline results ("magnitude and limits of redistribution"), but sentence 10 pivots to data description ("To study the effects of interchange fees, we draw on two comprehensive datasets"). The data description interrupts the results preview. |
| 17 -> 18 | Abrupt shift from causal evidence on real effects to the sufficient-statistics framework. The connection (pass-through is what makes redistribution possible) is implicit rather than stated. |
| 22 -> 23 | Transition from the end of the results preview to the literature review subsection. This is a standard structural break in economics papers, but the shift is abrupt because sentence 22 discusses Durbin/premiumization counterfactuals and sentence 23 jumps to "the literature on two-sided markets." |
| 42 -> 43 | Transition from data representativeness (end of Section 2) to the opening of Section 3. The link is implicit: Section 2 showed the data are good; Section 3 uses them to document facts. A bridging sentence would help. |
| 57 -> 58 | Sentence 57 summarizes the payment mix results ("Overall, these results suggest..."), then sentence 58 jumps to "Payment mix heterogeneity creates substantial variation in merchant transaction costs." The transition from *documenting* variation in payment mix to *documenting* variation in costs could be slightly more explicit about *why* we now turn to costs (because costs determine the magnitude of redistribution). |
| 72 -> 73 | Sentence 72 mentions the Durbin appendix for real effects evidence, then sentence 73 abruptly summarizes the entire section. The real-effects paragraph feels like an afterthought before the summary. |
| 97 -> 98 | Transition from calibration (end of Section 4) to results (Section 5). The model has been specified and calibrated; now results begin. This is a natural section break, but sentence 98 does not explicitly connect back to the questions posed earlier. |
| 101 -> 102 | The "Existing Benchmarks" subsection (sentences 101-103) interrupts the flow between the results preview (sentences 98-100) and the actual results (sentence 104 onward). The reader has already been told what to expect; this detour delays delivery. |
| 127 -> 128 | Shift from robustness (establishment-level shares) to the Durbin Amendment counterfactual. These are distinct exercises; a transitional sentence linking them (e.g., "Having established robustness of our baseline results, we now apply the framework to two policy-relevant counterfactuals") would improve flow. |

### Summary

**Strengths:**
- The paragraph skeleton tells a largely coherent story when read sequentially. Key concepts (redistribution, consumer sorting, fee heterogeneity, sufficient statistics) are introduced early and carried forward consistently.
- Section 3's opener is exemplary: it states the conditions for redistribution (overlap at merchants) and previews the two moderating forces (sorting, fee heterogeneity) before any details appear.
- The results section effectively structures its findings around payment-type redistribution, then sorting/heterogeneity decomposition, then income-based regressivity, creating a logical buildup.
- Key word chains are strong throughout: "redistribution," "consumer sorting," "merchant fee heterogeneity," and "interchange fees" recur in first sentences, maintaining coherence.

**Priority fixes:**
1. **Relocate or cut the data-description paragraphs in the introduction (sentences 10--12).** They break the flow between the results preview (sentence 9) and the empirical facts preview (sentence 11). The data are described fully in Section 2; the introduction should focus on contributions and findings.
2. **Strengthen the Section 4 opener.** The current opener is procedural ("we describe the development of two related approaches"). It should instead preview the key methodological insight: that first-order redistribution depends on simple overlap moments, not a full demand system, allowing transparent quantification.
3. **Consolidate or shorten "Existing Benchmarks" (5.1).** Sentences 101--103 delay the results that the reader has been prepared for since the introduction. The Schuh et al. benchmark and the two-extreme-views framing could appear as a single paragraph at the start of 5.2, or be folded into the introduction.
