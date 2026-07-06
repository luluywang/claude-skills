# Flow Extraction

## Introduction (intro.tex)

1. In the U.S., Visa and Mastercard (MC) process 80% of card transactions and earn operating margins above 60%.
2. I argue that this view is backwards.
3. I quantify the harms of this form of competition in U.S. payment markets.
4. Three reduced-form facts illustrate the competitive bottleneck.
5. To quantify the welfare costs of the competitive bottleneck, I build a structural model in which payment networks compete as two-sided platforms.
6. I estimate consumer and merchant preferences by matching the reduced-form facts and moments from payment surveys and aggregate market-level data.
7. The structural model shows that current credit card merchant fees and rewards are too high.
8. A complementary perspective is that lower rewards resolve a prisoner's dilemma among consumers.
9. Fee caps also disproportionately benefit low-income consumers.
10. The welfare gains from fee caps are not from reducing market power.
11. Second, merging all networks into a monopoly raises total welfare by $16 billion per year.
12. In the absence of fee caps, policy can also redirect competition by increasing consumer multi-homing.

### Related Literature (intro.tex)

13. The closest empirical work is Huynh et al., who estimate a structural two-sided model of consumer and merchant card adoption.
14. My model combines three ingredients that prior work treats separately: consumer multi-homing, merchant heterogeneity, and merchant competition.
15. My paper also contributes to the literature on platform pricing and off-platform outcomes.

## Institutional Details (institutional_details.tex)

1. With every card swipe, the merchant pays a fee and the consumer may receive a reward.
2. Visa and MC connect merchants, merchants' banks (acquirers), consumers' banks (issuers), and consumers.
3. Regulatory shocks confirm that interchange strongly affects merchant fees and rewards but not borrowing costs.

## Data (data.tex)

1. I use consumer-level, bank-level, and aggregate data to estimate consumer and merchant demand for payments.
2. [Aggregate Prices and Shares (2019)]: I use the Nilson Report's aggregate payment volumes and merchant fees in 2019.
3. [Issuer Payment Volumes (2008--2014)]: I construct an annual panel of issuer payment volumes from the Nilson Report covering 2008--2014 to study the effects of the Durbin Amendment on payment volumes.
4. [Homescan (2015--2022)]: The NielsenIQ Homescan panel tracks the payment decisions of around 100,000 households at large consumer packaged goods stores from 2015--2022.
5. [Consumer Payment Surveys]: I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) to build a transaction-level dataset on consumers' payment choices over three-day windows.
6. I also conduct a second-choice survey in 2024 to estimate how consumers substitute between payment methods.

## Reduced-Form Evidence (reducedform.tex)

1. This section documents three reduced-form facts that shape the structural model.

### Issuer Incentives Drive Consumer Payment Choices

2. I use the Durbin Amendment to show that issuers' incentives to promote payment instruments strongly affect consumers' payment choices.
3. I estimate the effect on payment volumes by comparing debit card volumes at large and small issuers.
4. Figure 3 plots the estimates.
5. Online Appendix presents mechanism evidence that the effect reflects within-bank payment switching, with consumers shifting from debit to credit, rather than switching banks or benefiting from improved credit card rewards at large issuers.

### Card Acceptance Increases Merchant Sales

6. I identify the causal effect of credit card acceptance on sales using changes in merchant acceptance policies.
7. The merchants in these event studies are highly selected.
8. I estimate [Poisson regression specification].
9. This strategy allows the focal merchants to experience other unobserved shocks contemporaneous with the acceptance change.
10. Figure 5 shows that acceptance increases sales to credit card users by approximately 13%.
11. An alternative explanation is that credit card acceptance increases sales by lowering consumers' effective prices through rewards.

### Merchants Multi-home More Than Consumers

12. Merchants overwhelmingly accept all cards, yet only around 55% of consumers use credit cards from two or more networks.

#### Almost All Merchants Multi-home

13. As of 2019, most merchants accept either all credit cards or none at all.
14. Similar aggregate acceptance counts could be consistent with merchants specializing in disjoint sets of networks.

#### Many Consumers Single-home

15. Only around 55% of consumers carry credit cards from multiple networks.
16. I study consumer multi-homing using the Homescan shopping data, defining a network as Visa credit, MasterCard (MC) credit, AmEx, or any debit card.
17. Figure 8 shows the results.

### The Competitive Bottleneck

18. Together, these three facts reveal a "competitive bottleneck."

## Model (model.tex)

1. I develop a structural model of payment network competition with two-sided multi-homing, merchant competition, and price coherence.

### Structure of the Game

2. I model competition between card networks as a static game with three stages between networks, consumers, and merchants.

### Stage 3: Consumer Shopping and Payments

3. Consumers' payment decisions depend on merchants' acceptance decisions, and their shopping decisions depend on their ability to use preferred payment methods.

#### Payment Behavior at the Point of Sale

4. At the point of sale, consumers' primary and secondary cards and merchant acceptance determine payment behavior.
5. Consumers with two cards can substitute between them (Figure 2).
6. Formally, define the set of all inside payment methods (i.e., cards) as J_1, and the set of all payment methods as J = {0} union J_1, where 0 refers to cash.

#### Consumption Decisions Over Merchants

7. Card consumers reallocate consumption toward merchants that accept cards, increasing demand at those merchants and incentivizing acceptance.
8. Merchants are vertically differentiated by a type gamma ~ G that governs their benefit from card acceptance.
9. Here sigma is the elasticity of substitution between merchants, P^w is a price index that depends on other merchants' actions, y is baseline income, f^w is the lump-sum reward from adopting w, and v^w_M is the payment surplus from wallet w at a merchant accepting M.
10. Consumers spend more at merchants that accept their primary or secondary cards, not simply any card they own.
11. Online Appendix micro-founds this demand function in a CES demand system.
12. In equilibrium, a consumer with income y optimally consumes y * q^{w*}(gamma) from each merchant type gamma, given equilibrium pricing p* and acceptance M*.

### Stage 2: Pricing, Acceptance, and Adoption

13. Merchants maximize profits by choosing prices and payment acceptance.

#### Merchant Pricing

14. Conditional on acceptance M, merchants pass fees into prices.
15. In equilibrium, merchants set optimal prices p*(gamma) given other merchants' pricing and adoption strategies.

#### Merchant Acceptance

16. Merchants trade off higher sales against higher fees.
17. The intercept a_M captures fee costs; b_M captures sales gains.
18. In equilibrium, merchants adopt optimal bundles given other merchants' behavior.

#### Consumer Adoption

19. Consumers choose up to two cards.
20. The utility from a wallet w for a consumer i is [equation].
21. [Pecuniary Utility]: Consumers prefer cards with high rewards and wide acceptance.
22. For multi-homing agents, pecuniary utility is the weighted average of single-homing utilities.
23. This specification implies consumers do not multi-home to increase acceptance coverage.
24. [Non-pecuniary Utility]: Non-pecuniary utility captures within-wallet complementarities and adoption costs.
25. [Consumer Heterogeneity]: Preferences vary with income and exhibit unobserved heterogeneity.
26. Demeaning ensures that alpha_0, beta=0, and chi^{lm} represent preferences at median income.
27. Income dependence in chi^{lm}_i allows higher-income consumers to derive greater value from holding both a rewards credit card and a debit card for distinct transaction types.
28. Online Appendix develops a two-stage adoption-and-usage model following Koulayev et al. to microfound these parameters.
29. [Choice Probabilities]: Let mu_i^w denote the probability that consumer i chooses wallet w and mu_y^w the probability for a consumer with income y.

### Stage 1: Network Competition

30. Multiproduct payment networks maximize profits, anticipating consumer and merchant actions.

#### Profits

31. Network profits equal transaction fees minus costs and rewards.
32. Total reward costs equal [equation].
33. For a network n that owns cards O_n, it earns profits [equation].

#### Conduct and Equilibrium Determinacy

34. Networks set transaction fees tau_j and pecuniary adoption benefits A_j, taking other networks' actions as given.
35. Small trembles select a unique equilibrium when profits are not differentiable in fees.

### Equilibrium

36. Equilibrium is fees tau*, adoption benefits A*, market shares, merchant prices, acceptance, and consumption such that [all agents optimize].

### Discussion of Key Assumptions

37. The model makes several simplifying assumptions for tractability.
38. [Segmentation Between Debit and Credit]: A consumer who primarily uses credit never substitutes to debit if her card is declined.
39. This assumption is at odds with the intuition that debit is a closer substitute to credit than cash.
40. [Fixed Costs]: I omit fixed costs of card acceptance because they cannot be separately identified from heterogeneity in sales benefits (gamma).
41. [Merchant Types]: Merchants differ only in the sales benefit gamma.
42. [Non-Rewards Credit Card Characteristics]: The data lack non-rewards credit card characteristics such as interest rates, credit limits, or annual fees.
43. [Price Coherence]: Merchants charge the same price regardless of payment method (price coherence).
44. [Fee Caps and Tacit Coordination]: If networks use regulated fee levels as focal points for tacit coordination, welfare benefits of fee caps could be attenuated.
45. [Issuers and Acquirers]: The model combines issuers, acquirers, and networks into a single entity.

## Estimation (estimation.tex)

1. Estimation links the reduced-form facts to quantitative predictions about regulation and competition.

### Estimation Procedure

2. I estimate all parameters jointly, but the identification argument has three components.

#### Consumer Demand

3. The key consumer demand parameters are price-sensitivity (alpha_0), substitution patterns (Sigma), income gradients, and multi-homing returns (chi^{lm}).
4. The Durbin Amendment identifies the price-sensitivity coefficient alpha_0.
5. My 2024 second-choice survey reveals the covariance matrix Sigma of the random coefficients.
6. Wallet complementarity parameters are identified by multi-homing patterns in the 2017--2019 Homescan data.
7. Demographic data identify how preferences vary with income.

#### Network Costs

8. I recover network costs by inverting first-order conditions with respect to rewards.

#### Merchant Types

9. Merchant fee sensitivity is an equilibrium outcome of merchant type heterogeneity and consumer multi-homing, not a primitive parameter.
10. I recover the distribution of merchant types G(gamma) by combining event-study evidence from grocery chains' 2015--2022 credit card adoption in the Homescan panel, acceptance data from the DCPC, and networks' optimal pricing conditions.
11. I model grocery chains that changed their acceptance policies during this period as just on the margin of accepting credit cards.
12. I parameterize G as a two-parameter Gamma distribution.

#### Calibrated Parameters

13. I calibrate two sets of parameters.

### Merchant and Consumer Sensitivities and Credit Aversion

14. Table 5 reports parameter estimates.
15. The consumer substitution matrix in Table 6 shows that consumers view credit cards, debit cards, and cash as distinct segments.
16. Merchant acceptance, by contrast, is fee-insensitive.
17. The parameters reveal substantial consumer "credit aversion."
18. The estimated chi^{12} > 0 and chi^{21} > 0 indicate that consumers value holding a credit card alongside any other card.

### Goodness of Fit

19. The estimation targets aggregate spending shares, multi-homing patterns, and the Durbin debit volume response.
20. I now assess fit by examining moments the model was not trained to match, including adoption shares across payment types, the joint distribution of primary and secondary cards, and merchant acceptance patterns.

#### Consumer Demand (Fit)

21. Table 7 shows baseline prices and market shares.
22. The model also matches the joint distribution of primary and secondary cards in consumers' wallets.

#### Merchant Demand (Fit)

23. I validate merchant parameter estimates against three types of evidence.

#### Network Parameters (Fit)

24. Network cost parameters match accounting data.

## Counterfactuals (counterfactuals.tex)

1. I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse.

### Capping Credit Card Merchant Fees

2. In my main counterfactual, I cap credit card merchant fees at 120 basis points, roughly half their current level.

#### Effects on Prices and Shares

3. Capping credit card merchant fees reduces consumer rewards and credit card use, illustrating the see-saw principle in Rochet and Tirole (2003).
4. Credit card adoption drops by two-thirds as consumers substitute toward debit and cash (Table 8).

#### Welfare

5. Fee caps increase total welfare by $27 billion per year, with most gains accruing to consumers.
6. I measure consumer welfare by compensating variation.
7. To understand the sources of these gains, Table 9 decomposes welfare by sequentially allowing more merchant responses.
8. Even though fee caps target merchants, merchants benefit little in equilibrium.
9. The harm to networks is also modest.
10. Consumers gain $28 billion even though Table 8 shows fees and rewards falling by roughly equal amounts.
11. Price coherence makes credit card adoption socially excessive.
12. Although the first row is where payment choices shift most, total welfare there rises by only $18 billion, around half the overall gain.

#### Distributional Effects

13. Fee and reward reductions redistribute consumption toward lower-income consumers.

### Repealing the Durbin Amendment

14. Fee caps do not raise welfare simply by correcting market power.
15. Repealing the Durbin Amendment would moderate rewards competition between networks.
16. These changes are progressive.

### Welfare Effects of Reducing Network Competition

17. A market power interpretation implies that competition should substitute for fee regulation.
18. Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps while raising per-transaction merchant fees by 36 bps.
19. The merger costs consumers $11 billion (though imprecisely estimated) while raising network profits by $31 billion.
20. On net, the merger raises total welfare by $16 billion because eliminating reward races more than offsets the consumer losses.

### Consumer Multi-Homing and Dual Routing

21. Rather than regulating fees directly, policy can redirect competition by changing who networks compete for.
22. Current proposed dual-routing legislation often requires that the secondary network not be a large established network.

### Discussion

23. Online Appendix studies how different model assumptions affect the counterfactual results.
24. [Constraints vs Preferences]: Consumer payment choices in the model reflect preferences, not constraints.
25. An alternative interpretation is that some consumers cannot obtain credit cards.
26. [Choice of Fee Cap]: The 120 basis point cap keeps the counterfactual close to observed fee levels, avoiding the large out-of-sample extrapolation required by more aggressive caps.
27. [Pass-through]: The CES functional form governs merchant fee pass-through to retail prices; I do not estimate pass-through directly.
28. [Rewards as a Proxy for Issuer Incentives]: The model captures issuers' incentives to promote payment instruments entirely through rewards, which enter consumer utility as real value.

## Conclusion (conclusion.tex)

1. U.S. payment networks compete intensely for cardholders, not for merchants.
2. Two conditions drive these results, and neither is unique to payments.

---

# Flow Assessment

## 1. Connectivity

The paper generally maintains strong logical flow. The introduction builds a clear chain: problem statement (1) -> thesis (2) -> quantification plan (3) -> evidence preview (4) -> model (5) -> estimation (6) -> results (7) -> complementary perspectives (8) -> distributional effects (9) -> market power tests (10-11) -> policy alternatives (12). This is a well-structured funnel.

**Abrupt transitions flagged:**

- **Intro 8 -> 9**: Topic shift from the prisoner's dilemma framing to distributional effects. No linking phrase connects the two perspectives. The reader must infer why distributional effects follow from the prisoner's dilemma.
- **Intro 9 -> 10**: Abrupt pivot from distributional benefits to "not from reducing market power." Sentence 9 ends on distributional gains, not market power, so the negation needs a better setup.
- **Intro 10 -> 11**: Numbering break. Sentence 10 says "Two counterfactuals illustrate this" but the first counterfactual (Durbin repeal) is embedded in a paragraph that opens with a different sentence ("The welfare gains from fee caps are not from reducing market power"). The reader then encounters "Second, merging..." at sentence 11 without having seen a clearly labeled "First."
- **Reduced-form 4**: "Figure 3 plots the estimates." Pure pointer with no substantive content; it relies entirely on the reader having absorbed prior context. (The real finding -- the ~29% decline -- is in the continuation of that sentence.)
- **Reduced-form 17**: "Figure 8 shows the results." Same issue -- content-free pointer.
- **Counterfactuals 16**: "These changes are progressive." Very short opener that does not specify which changes, requiring the reader to look back.

## 2. Repetition

- **Intro 3 and 5**: "I quantify the harms..." and "To quantify the welfare costs..." overlap. Paragraph 5 re-announces the model after paragraph 4 previews the evidence.
- **Reduced-form 12 and 15**: Both open with nearly identical statements about ~55% of consumers carrying credit cards from multiple networks. One is a subsection opener and the other a subsubsection opener, but within the same flow they feel redundant.
- **Model 15 and 18**: "In equilibrium, merchants set optimal prices..." and "In equilibrium, merchants adopt optimal bundles..." Structurally parallel equilibrium-condition statements. Intentional for a model section but mechanically repetitive.
- **Estimation 1 and 2**: "Estimation links the reduced-form facts to quantitative predictions..." and "I estimate all parameters jointly..." are both throat-clearing openers for the same section.
- **Estimation 19 and 20**: Sentences 19 ("The estimation targets...") and 20 ("I now assess fit...") both open the Goodness of Fit subsection and could be merged.

## 3. Forward Momentum

Most openers advance the argument. The introduction is particularly strong: each paragraph raises the stakes or introduces a new result.

**Stalling openers:**
- **Reduced-form 1**: "This section documents three reduced-form facts that shape the structural model." Classic meta-commentary / roadmap opener. The second sentence ("Issuers' incentives...") is the real opener.
- **Model 37**: "The model makes several simplifying assumptions for tractability." Meta-commentary that does not advance the argument.
- **Estimation 14**: "Table 5 reports parameter estimates." Pure pointer.
- **Counterfactuals 23**: "Online Appendix studies how different model assumptions affect the counterfactual results." Pointer to the appendix with no substantive claim.
- **Data 1**: "I use consumer-level, bank-level, and aggregate data to estimate consumer and merchant demand for payments." Generic data-section opener. Functional but could be more informative.

## 4. Weak Openers

- **Reduced-form 1**: "This section documents three reduced-form facts that shape the structural model." -- Meta-commentary.
- **Reduced-form 4**: "Figure 3 plots the estimates." -- Content-free pointer. (The finding follows in the same sentence but after the figure reference.)
- **Reduced-form 17**: "Figure 8 shows the results." -- Content-free pointer.
- **Model 37**: "The model makes several simplifying assumptions for tractability." -- Throat-clearing.
- **Estimation 14**: "Table 5 reports parameter estimates." -- Pure pointer.
- **Counterfactuals 16**: "These changes are progressive." -- Vague without specifying which changes.
- **Counterfactuals 23**: "Online Appendix studies how different model assumptions affect the counterfactual results." -- Appendix pointer, no substantive claim.

## 5. Suggestions

### - [x] Reduced-form, paragraph 1: Replace "This section documents three reduced-form facts that shape the structural model" with the substantive claim from the second sentence, e.g., "Three reduced-form facts establish the competitive bottleneck that shapes the structural model."
### - [x] Reduced-form, paragraphs 12 and 15: Eliminate the near-duplicate opening about ~55% of consumers carrying multiple credit cards. One can open with the merchant side, the other with the consumer side, without restating the same statistic.
### - [x] Reduced-form, paragraph 17: Replace "Figure 8 shows the results" with a sentence stating the key finding, e.g., "Around 55% of primary credit card consumers carry credit cards from multiple networks (Figure 8)."
### - [x] Intro, paragraphs 3 and 5: Differentiate the openers. Paragraph 3 quantifies; paragraph 5 builds. Consider opening paragraph 5 with what the model adds rather than re-announcing quantification.
### - [x] Intro, paragraphs 10-11: Restructure the two-counterfactual sequence so the "First" (Durbin repeal) is clearly labeled in a sentence opener, matching the "Second" (monopoly merger) at sentence 11. This could be done by splitting paragraph 10 so the Durbin counterfactual opens its own paragraph.
### - [x] Model, paragraph 37: Cut or merge "The model makes several simplifying assumptions for tractability" into the first assumption paragraph (e.g., lead directly with the segmentation assumption).
### - [x] Counterfactuals, paragraph 16: Specify what changes, e.g., "The welfare gains from repealing the Durbin Amendment are progressive: low-income consumers gain..."
### - [x] Counterfactuals, paragraph 23: Lead with the substantive finding, e.g., "The counterfactual results are robust across a wide range of alternative specifications (Online Appendix ...)."
### - [x] Estimation, paragraph 14: Lead with the key finding rather than a table pointer, e.g., "Consumers are roughly ten times more price-sensitive than merchants (Table 5)."
### - [x] Estimation, paragraphs 19-20: Merge into a single opener, e.g., "I assess fit by examining moments the model was not trained to match."
### - [ ] Model, paragraphs 15 and 18: Vary the "In equilibrium..." opener for one of the two, e.g., changing paragraph 18 to "Merchants' optimal acceptance bundles satisfy..."
