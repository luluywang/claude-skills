# Regulating Competing Payment Networks

**Date**: 4/13/2026, 6:08:11 PM
**Domain**: social_sciences/economics
**Taxonomy**: academic/research_paper
**Filter**: Active comments

---

## Overall Feedback

The central primitive establishing that consumers are highly sensitive to rewards is anchored in Section V.A.1 by matching the Durbin-induced signature-debit volume decline to a simulated 25bp rewards cut. At the same time, Section III.A notes that Durbin moved other margins like marketing and teller incentives, alongside imperfect pre-trends in credit volume. Because the monopoly welfare claim in Section VI.C is highly contingent on this sensitivity—halving the Durbin target in OG.3 flips the monopoly sign in Table OG.10—readers will benefit from seeing this uncertainty highlighted in the main text. Rather than leaving this counterfactual sensitivity in the appendix, providing a partial-identification range that explicitly treats non-reward steering as an omitted channel would robustly bound the surviving policy rankings.

**Merchant-side calibration and external validity**

The welfare conclusions depend crucially on a reliable mapping from fee changes to merchant acceptance. The core merchant moment relies on two grocery-chain events, which then serves in Section V.A.3 to back out $\sigma$ and help identify the merchant-type distribution $G$. While the OptBlue validation in Section V.C.2 is an important test, it operates at a near-universal-acceptance margin where elasticities are mechanically restricted. Making the mapping from moments to the parameters ( $\sigma, G$, and the acceptance elasticity) entirely explicit in the main paper will anchor the exercise. Demonstrating ranking stability under alternative merchant-side calibrations will strengthen the policy stakes, particularly concerning the exclusion of fixed acceptance costs in Section IV.F. Fixed costs possess the potential to precipitate acceptance cascades that profoundly alter short-run counterfactuals.

**Normative interpretation of credit aversion**

The paper's largest welfare gains from fee caps, presented in Section VI.A, stem largely from relieving consumers of the non-pecuniary disutility of credit aversion. The text currently treats this as a real welfare cost that vanishes when credit use declines. Depending on whether this represents private preferences, behavioral internalities, or misclassified constraints, the compensating-variation calculations carry completely different normative weights. While Section VI.F and OG.2 discuss constraints versus preferences, advancing a structured welfare accounting in the main text with dual criteria would resolve the ambiguity. Presenting one framework that counts credit-aversion losses fully and another that nets them out would transparently show how much of the $27 billion gain comes exclusively from standard externality correction.

**Dual routing and structural multi-homing**

The dual-routing mandate counterfactual in Section VI.D models the policy as an increase in consumer credit-card multi-homing via the parameter $\chi^{22}$. From an institutional perspective, actual dual routing mandates change the feasible routing set for merchants at the point of sale, allowing them to route away from expensive networks on identical transactions. Because the model proxies this dynamic via adoption composition, it risks conflating the incidence of the targeted remedy with consumer-level multi-homing. Supplying a tighter institutional mapping that specifies exactly what contractual constraint is relaxing, and defending why the $\chi^{22}$ parameter serves as a valid reduced-form instrument for that shift, will forestall institutional objections.

**Strategic conduct and vertical integration assumptions**

The platform competition equilibrium relies on networks choosing $\{ \tau_j, A_j \}$ with trembles ($v_x=10^{-4}$) to smooth non-differentiabilities, as detailed in Sections IV.D.2 through IV.E. Simultaneously, the framework in Section IV.F collapses the vertical chain of issuers, acquirers, and networks into joint-profit entities. The monopoly counterfactual in Section VI.C hinges completely on these structurally significant choices. If baseline conduct reflects even modest coordination rather than strict Nash behavior, the incremental harm from competition is overstated. Elevating these assumptions from the appendix and demonstrating that the welfare rankings hold under alternative formulations—such as a conduct parameter on merchant-fee setting—would rigorously cement the paper's broad policy claims.

**Status**: [Pending]

---

## Detailed Comments (43)

### 1. Measurement error biases multi-homing

**Status**: [Pending]

**Quote**:
> As shown in Appendix Table OA.2, self-reported payment shares in HomeScan align well with aggregate payment volumes, so this individual-level noise
does not bias the estimation of multi-homing probabilities or the payment patterns the model targets.

**Feedback**:
In the reply regarding measurement error, the assertion that individual-level noise does not bias the estimation of multi-homing probabilities is statistically problematic. If consumers sometimes confuse debit and credit cards in their survey responses, a consumer who exclusively uses debit might occasionally report a credit transaction. Because you classify a consumer as carrying a card type if they use it during the year, this response noise mechanically inflates the multi-homing category. The fact that aggregate payment shares align with aggregate volumes does not resolve this, as aggregate alignment only implies the errors average out in levels, not that the upward bias on the extensive margin is zero. You may want to acknowledge that this bias implies your single-homing estimate is a conservative lower bound, or apply a usage threshold to the multi-homing classification to filter out sporadic misreporting.

---

### 2. Errors in the diversion ratio moment formula

**Status**: [Pending]

**Quote**:
> The adjustment term $\iota$ is the expected number of respondents who report switching to the same card type but also switch networks:

$$
\iota=\sum_{i=1}^{N} S_{i, 3} \times\left(1-\left(\sum_{k \in\{\mathrm{Visa}, \mathrm{MC}\}} n_{b_{i}}^{k, t_{i}} \times\left(\frac{1}{\left|\mathcal{C}_{i}\right|} \sum_{j \in \mathcal{C}_{i}} n_{j}^{k, t_{i}}\right)\right)\right)
$$

The data moments for the second-choice survey are then:

$$
\hat{g}_{1}=\left(\begin{array}{c}
N_{c}^{-1} \sum_{i, r_{i}=\mathrm{CC}} S_{i, 1} \\
N_{d}^{-1} \sum_{i, r_{i}=\mathrm{DC}} S_{i, 2} \\
\frac{\sum_{i} S_{i, 3}-l}{N-l}
\end{array}\right)
$$

**Feedback**:
There appear to be typographical and logical inconsistencies in the formulas defining the adjusted diversion ratio in Appendix OD.5.3. First, the vector $g_1$ uses $l$ instead of the previously defined $\iota$. Second, the formula for $\iota$ computes the expected number of network switchers (due to the $1 - \dots$ term). However, the numerator in the third moment is $\sum_i S_{i,3} - l$. If $l = \iota$, this subtracts network switchers from total bank switchers, yielding the number of 'stayers', which contradicts the explicit goal of measuring diversion to *other* networks. Third, adjusting the denominator to $N-l$ seems to improperly condition the population sample, which does not align with the 0.81 'Consideration' share reported in Table OD.6 (which neatly matches just $\iota/N$). Please revise the equations in the manuscript to faithfully reflect the formal moments evaluated in the empirical implementation.

---

### 3. Contradiction in counterfactual policy definitions

**Status**: [Pending]

**Quote**:
> Reply: The revised draft adopts this suggestion: the main counterfactual caps credit card merchant fees at 120 bp while leaving the Durbin Amendment cap on debit unchanged. Together with the appendix analysis, the paper now covers the full space of fee cap policies.

**Feedback**:
There seems to be an issue with the claim that the full policy space is covered: while the reply is transparent that the main counterfactual caps credit card fees and leaves the Durbin Amendment in place, this represents a regime where both credit and debit fees are capped. A true 'credit cap only' absolute state—where credit is capped but debit is definitively uncapped—remains absent from the main text and appendices. Exploring this conceptual fourth permutation would fully complete the 2x2 matrix of absolute policy regimes (credit capped/uncapped $\times$ debit capped/uncapped) and firmly isolate the effects of a credit cap without the compounding distortion of the existing Durbin cap.

---

### 4. Contradictory sample size and composition for second-choice survey

**Status**: [Pending]

**Quote**:
> For credit users, rewards sensitivity was whether they would switch if rewards halved; for debit users, whether they would switch if credit rewards doubled. The final sample contains 788 observations ( 472 credit, 316 debit).

**Feedback**:
In Section A.5, the reported sample size for the second-choice survey contradicts the numbers provided later in the appendices. The text explicitly states the final sample is 788 observations (472 credit, 316 debit), which is roughly a 60/40 split in favor of credit. However, Table OA.9 reports a total N of 740 with a 52% debit and 48% credit split, and Table OD.4 explicitly notes the sample contains 357 primary credit and 383 primary debit users. This discrepancy stands out, particularly because the number of debit users reported is higher in the otherwise smaller N=740 sample. Please reconcile these conflicting numbers or clarify the sampling restriction step that caused this shift.

---

### 5. Misattributed welfare gains in dual-routing

**Status**: [Pending]

**Quote**:
> Consumer welfare still rises \$8 billion from lower retail prices and lower adoption costs, the same credit aversion channel as in the fee cap.

**Feedback**:
In Section VI.D, the \$8 billion consumer welfare gain from dual routing is attributed to 'lower retail prices and lower adoption costs, the same credit aversion channel as in the fee cap.' However, according to Table 5, the mandate reduces credit card spending by only 0.8 percentage points, compared to the 19 percentage point drop in the fee cap counterfactual. This suggests that very little of the new gain comes from marginal consumers switching away from credit and avoiding non-pecuniary credit aversion. The consumer welfare gain instead appears to be primarily driven by the direct simulation assumption of raising the $\chi^{22}$ parameter (the lower adoption costs), which boosts utility for affected consumers. Consider revising the text to clarify that the welfare gains here stem directly from the modeled reduction in multi-homing hassle and the pecuniary transfers of lower retail prices, rather than the endogenous credit un-adoption channel that drives the fee cap results.

---

### 6. Contradiction between sample restriction and fixed effects

**Status**: [Pending]

**Quote**:
> I restrict to households whose primary or secondary card is Discover. I exclude merchants not accepting Discover and household-years without trips to both store categories.

## OD.2.1 Graphical Evidence

Figure OD. 12 shows the effects on payment and shopping behavior. The top panel shows grocery spending shares are flat for Discover cardholders during reward quarters (grey shaded areas). The bottom left panel shows Discover cardholders shift their spending share toward Discover during reward quarters, roughly a 7.6 pp . increase (Table OD.3). Consumers respond to rewards without changing where they shop. The bottom right panel shows no change in payment composition at discount and warehouse stores, so time-varying confounds are unlikely to explain the pattern.

## OD.2.2 Regression Evidence

I supplement the graphical evidence with regression estimates. I first confirm that consumers do not shift between grocery and discount/warehouse stores during reward quarters. Column 1 of Table OD. 3 reports a difference-in-differences specification:

$$
y_{i t}=\alpha \cdot \mathbf{1}\{\text { Reward } \mathrm{Qtr}\}_{t} \times \mathbf{1}\{\text { Discover } \mathrm{HH}\}_{i}+\delta_{i}+\delta_{t}+\epsilon_{i t}
$$

**Feedback**:
There appears to be a mathematical contradiction between the stated sample restriction and the fixed effects specifications used in the regressions. The text preceding the regression states that the sample is restricted to households whose primary or secondary card is Discover. However, if the sample exclusively contains Discover households, the indicator $\mathbf{1}\{\text{Discover HH}\}_i$ equals 1 for all observations. This would make the interaction term $\mathbf{1}\{\text{Reward Qtr}\}_t \times \mathbf{1}\{\text{Discover HH}\}_i$ purely a time-varying shock, rendering it perfectly collinear with the time fixed effects $\delta_t$ in Column 1. 

Similarly, in the triple-difference specification for Columns 2-5, the condition $\mathbf{1}\{\text{Discover HH}\}_i = 1$ would reduce the interaction term to $\mathbf{1}\{\text{Reward Qtr}\}_t \times \mathbf{1}\{\text{Grocery}\}_g$, which would be perfectly collinear with the store-type-by-time fixed effects $\delta_{gt}$. 

Given the massive sample size in Table OD.3 and the presence of the "Discover HH" indicator, these regressions were almost certainly estimated on a full sample that includes non-Discover households as a control group. Consider revising the text to clarify that the sample restriction applies solely to the graphical evidence in Figure OD.12, rather than the regressions.

---

### 7. Double marginalization vs. effective marginal cost

**Status**: [Pending]

**Quote**:
> There exists an effective marginal cost at which the vertically separated network behaves as if it were unitary, absorbing any double-marginalization losses in the vertical chain (Tirole 1988, ch. 4). This representation gives the correct predictions for market shares, fees, and rewards.

**Feedback**:
The claim that double marginalization can be absorbed into an 'effective marginal cost' while yielding structurally identical counterfactual predictions warrants slight qualification. While an inflated marginal cost establishes a static calibration equivalence to match baseline retail observables, this exact equivalence breaks down in counterfactual simulations if the true data generating process features downstream double marginalization. A unitary platform with an inflated marginal cost will exhibit different pass-through behavior and strategic responses to fee caps or mergers compared to a vertically separated chain with stacked margins. Alternatively, if the vertical entities use non-linear pricing or other mechanisms to maximize joint profits, the unitary assumption is theoretically exact, but in that case, there is no double marginalization to absorb into the marginal cost. It would be safer to clarify that the unitary platform formulation relies on the assumption of near-perfect coordination and joint profit maximization (rendering it a valid baseline approximation), rather than claiming exact structural counterfactual equivalence in the presence of unmitigated double marginalization.

---

### 8. Missed structural critique regarding income and rewards

**Status**: [Pending]

**Quote**:
> Reply: Your point is correct that higher-income consumers earn more dollar rewards because they spend more, but $\alpha_{i}$ is sensitivity to the reward rate, not to dollar rewards. Pecuniary utility (Equation 16) depends on the reward rate $f^{j}$-a consumer who spends \$10,000 and one who spends \$1,000 face the same $f^{j}$. The income elasticity $\hat{\alpha}_{y}=0.20$
(SE 0.06) is therefore identified from how wallet choices vary with income conditional on the reward rate, not from the mechanical correlation between income and total dollar rewards.

**Feedback**:
In your reply regarding consumer price sensitivity and income, you state that Equation 16 evaluates rewards as a rate ($f^j$) rather than absolute dollars, avoiding a mechanical correlation. However, the referee's critique argues that the absolute dollar scale *should* matter, hypothesizing that absolute returns overcome fixed non-pecuniary adoption costs for high-income earners. To make your reply airtight, consider explicitly defending the economic rationale for the rate-based formulation in response to this. For example, you can highlight that this specification is a natural consequence of your CES framework, which implies that non-pecuniary costs (like the opportunity cost of time) scale proportionally with income. Supplementing your functional-form explanation with this economic justification will fully resolve the referee's reasonable underlying concern.

---

### 9. Contradiction regarding the Ohio v. AmEx standard

**Status**: [Pending]

**Quote**:
> The Supreme Court's 2018 decision in Ohio v. American Express held that plaintiffs must show net harm to the two-sided market as a whole, requiring evidence on both sides of the platform. The fee cap counterfactual suggests that this standard is too strict. A modest cap on credit card merchant fees reduces both fees and rewards, yet total welfare increases by \$27 billion per year through more efficient payment choice.

**Feedback**:
In the conclusion, the claim that the Ohio v. American Express standard is "too strict" creates a slight textual tension with the results of the counterfactual. The text notes the standard requires demonstrating net harm to the two-sided market as a whole. Because the fee cap simulation shows that current fees reduce total welfare by \$27 billion, the paper's findings actually appear to satisfy this exact standard. It might be helpful to clarify whether the intention is that the standard's conceptual premise (treating consumer rewards as an offsetting benefit) is intrinsically flawed, or if the standard imposes an evidentiary burden that is too strict for typical antitrust litigation.

---

### 10. Unacknowledged underrepresentation of AmEx in Homescan

**Status**: [Pending]

**Quote**:
> Homescan (2013-2023). The NielsenIQ Homescan panel tracks the payment decisions of around 100, 000 households at large consumer packaged goods stores from 2013-2023. I use this panel to measure how consumers split spending across the cards in their wallets and how card acceptance affects sales. Appendix Table OA. 1 reports summary statistics. Appendix Table OA. 2 compares Homescan payment shares to aggregate shares, confirming that the sample is representative.

**Feedback**:
In the paragraph introducing the Homescan data, the text states that Appendix Table OA.2 confirms the sample is representative. However, Table OA.2 shows that AmEx's share in the Homescan sample (4%) is less than half of its aggregate share in the Nilson data (10%). Given AmEx's role in the analysis, it would be helpful to briefly acknowledge this difference—perhaps due to Homescan's focus on CPG/grocery where AmEx has historically had lower penetration—and clarify why the consumer multi-homing moments derived from the sample remain reliable despite this compositional difference.

---

### 11. Contradiction between text and Table OF.4 regarding credit rewards

**Status**: [Pending]

**Quote**:
> The pricing linkage does, however, reverse the sign of uncapping debit: total welfare
falls by \$10B (SE \$2.8B) versus a \$7B gain at baseline. Uncapping debit removes the competitive constraint on credit fees, so credit networks raise fees and cut rewards-the opposite of the baseline, where uncapping debit raises debit rewards without affecting credit.

**Feedback**:
In Section OF.3.5, the text states that under the partial-substitute specification, uncapping debit causes credit networks to "raise fees and cut rewards." However, Table OF.4 shows that in the "Uncap Debit" scenario, Credit Rewards change by +32 bps. This indicates that credit networks actually raise rewards, contradicting the text. Correcting this is important because the escalation of rewards across both debit and credit networks—rather than a cut in rewards—is the mechanism driving the \$10B welfare loss in this counterfactual.

---

### 12. Evidence contradicts strict credit-debit segmentation

**Status**: [Pending]

**Quote**:
> The Discover spending share at grocery rises by only $2.5 \mathrm{pp}(p<0.001)$, compared to 7.6 pp in the full sample, consistent with debit being a much weaker substitute for credit than other credit cards are.

**Feedback**:
There seems to be an issue with how the Discover event study is framed relative to the structural model. The event study table shows a 1.7 pp decrease in debit spending, which demonstrates partial substitution between debit and credit at the point of sale. While the text notes this shows debit is a "weaker" substitute for credit than other credit cards, the baseline structural model assumes strict segmentation (zero substitution). Although Appendix OF justifies the zero-substitution assumption by showing that partial substitution generates counterfactual macro predictions, the text here could more explicitly reconcile the empirical presence of weak substitution with the baseline model's structural choice to treat it as strictly zero.

---

### 13. Mismatched regulatory regimes in Australia comparison

**Status**: [Pending]

**Quote**:
> The "Uncap Debit" counterfactual provides a plausibility check on the magnitude of migration from debit to credit. Repealing the Durbin cap raises the debit share by 13 pp and lowers the credit share by 6 pp, shifting the card-only debit-to-credit ratio from 45:55 to 56:44. Australia has both caps on credit and debit interchange and has a debit:credit ratio of roughly 59:41 (Caddy et al. 2020), close to the predicted uncapped US ratio.

**Feedback**:
In the discussion of the "Uncap Debit" counterfactual, you use Australia's debit-to-credit ratio (59:41) as a plausibility check for the model's predicted uncapped US ratio (56:44). However, as you transparently note, Australia caps both credit and debit interchange, whereas the "Uncap Debit" counterfactual simulates a market where neither is capped. A more direct structural comparison for Australia's regulatory regime might be the "Cap Fees" counterfactual (which caps both). Based on Table 5, the "Cap Fees" counterfactual yields a noticeably different card-only debit-to-credit ratio of approximately 66:34. It would be helpful to briefly clarify why the symmetrically uncapped counterfactual serves as the appropriate benchmark for a symmetrically capped empirical market, or to acknowledge the ratio predicted by the "Cap Fees" scenario in this context.

---

### 14. Mechanical logit option value in CBDC counterfactual

**Status**: [Pending]

**Quote**:
> I simulate a public debit network with Mastercard debit's demand and cost characteristics that sets merchant fees at cost and offers zero consumer rewards, earning zero profit. Because the entrant offers no consumer-side subsidies, its resulting market share is small. Consumer welfare gains are roughly \$3.7 billion, smaller than repealing Durbin caps.

**Feedback**:
In the subsection titled 'Central Bank Digital Currencies and Public Entry,' the \$3.7 billion consumer welfare gain from introducing a CBDC appears to be driven heavily by the idiosyncratic preference for variety inherent in logit demand systems. Because the CBDC is modeled as offering zero rewards alongside standard retail prices, it is pecuniarily disadvantaged relative to incumbent debit, meaning its resulting market share and associated welfare gains stem mainly from the logit error term. It may be helpful to explicitly clarify in the text that the measured welfare benefits of the CBDC largely capture the value of this horizontal discrete-choice differentiation, rather than a pro-competitive downward effect on incumbent pricing.

---

### 15. Missing Panel C (Merchant Parameters) in Table 2

**Status**: [Pending]

**Quote**:
> | Credit-Credit Income ( $\chi_{y}^{22}$ ) | -0.40 | 0.17 |


Panel D: Network Cost Parameters (bps)
| Parameter | Est | SE |
| :--- | ---: | ---: |
| Cash | 30 | 10 |

**Feedback**:
In Table 2, the panel for Merchant Parameters (Panel C) is missing, as the table jumps directly from Panel B to Panel D. The table notes mention the Gamma distribution of merchant types $\gamma$, and the appendix tables (e.g., Table OF.3) include Panel C with the CES, Average $\gamma$, and S.D. of $\gamma$. Please include Panel C in the main text's Table 2 for completeness.

---

### 16. Contradictory data sources for merchant fees

**Status**: [Pending]

**Quote**:
> The Nilson Report provides annual merchant fees from acquirer surveys, split by V/MC Credit, American Express, and V/MC Debit. I use 2019 Visa credit and debit fees directly and recover MC and AmEx fees in the estimation, treating their Nilson values as measured with error.

**Feedback**:
In Appendix A.2, the text implies that the 2019 Visa credit and debit fees are taken directly from the Nilson Report. However, Nilson groups V/MC Credit together, and Appendix C.3 clarifies that Visa Debit, Visa Credit, and MC Debit fees actually come from "network financial data." Additionally, Appendix A.2 states that "MC and AmEx fees" are recovered in the estimation, whereas Appendix C.3 specifies that MC Debit is fixed directly and only MC Credit and AmEx fees are estimated. Revising the text in Appendix A.2 to fully align with the parameterization details in Appendix C.3 would remove this ambiguity.

---

### 17. Mathematical mismatch in top-card correlation

**Status**: [Pending]

**Quote**:
> Table OA. 8 shows that trip-based and spending-based rankings are highly correlated: the top-trip card is also the top-spending card for $91 \%$ of consumers.

When counting trips, I focus on stores accepting all four main card brands to separate consumer preferences from merchant acceptance.

**Feedback**:
In the text referencing Table OA.8, it states that the top-trip card is the top-spending card for 91% of consumers. However, Table OA.8 shows match rates for every constituent card type strictly greater than 94% (ranging from 94.2% for AmEx to 96.5% for Debit). Specifically, the raw observation counts in the table imply an overall match rate of approximately 96.0%. The stated 91% match rate appears mathematically inconsistent with the provided table.

---

### 18. Conflation of transaction-level expected utility with CES price index

**Status**: [Pending]

**Quote**:
> where $c \in \mathbb{R}^{k}$ captures adoption costs by payment-method characteristics. In the main text, this expected utility is summarized through the CES price index $P^{w}$.

**Feedback**:
In Section OF.5.2, the text states that the expected point-of-sale utility $V_i(W)$ is "summarized through the CES price index $P^w$." This mapping appears incorrect. In the main text, $P^w$ is derived from the CES consumption problem and summarizes the value of merchant acceptance and retail prices. In contrast, the microfoundation of $V_i(W)$ in this appendix abstracts entirely from merchant acceptance and models transaction-level preference matching. This setup naturally yields within-wallet option value, meaning it microfounds the non-pecuniary wallet characteristics ($\Gamma_i^w$) and the role of rewards, rather than the price index $P^w$. Consider updating the text to correctly reference the variable that $V_i(W)$ microfounds.

---

### 19. Discrepancy in credit access parameters

**Status**: [Pending]

**Quote**:
> Credit access follows a logistic function of income: $P($ access $\mid y)=\Lambda\left(\gamma_{0}+\gamma_{y} \log y\right)$, adding two parameters $\left(\gamma_{0}, \gamma_{y}\right)$ estimated from DCPC credit score data. Based on the estimates, the access probability is $82 \%$ at median income, $95 \%$ at the 90 th percentile, and $55 \%$ at the 10th percentile. Table OG. 4 reports the logistic regression of credit card access on income.

**Feedback**:
In Section OG.2, there appears to be a minor discrepancy regarding the credit access probability parameters. The text states that $\gamma_0$ and $\gamma_y$ are 'estimated from DCPC credit score data' and cites the logistic regression in Table OG.4 (which reports an intercept of 1.49 and slope of 1.04). However, the access probabilities cited in the text (82% at median, 95% at 90th percentile, 55% at 10th percentile) correspond more closely to the structural parameter estimates reported in Table OG.5 ('Constraint Intercept' 1.51, 'Constraint Slope' 1.32). Clarifying whether these parameters were fixed to the reduced-form estimates or re-estimated jointly within the structural model (and ensuring the text's percentages align explicitly with the correct source) would resolve this ambiguity.

---

### 20. Flawed revealed preference argument for cash costs

**Status**: [Pending]

**Quote**:
> The strongest evidence that cash is cheapest comes from revealed preference: some merchants accept only cash. For those merchants, the cost of accepting any card exceeds the sales benefit, which implies that the cost of cash is below the lowest card fee in equilibrium. If contactless cards were cheaper to process than cash, no merchant would refuse them, yet cash-only merchants persist in the 2019 data.

**Feedback**:
Your revealed preference argument for cash being the cheapest method (based on the persistence of cash-only merchants) is vulnerable to a simple counterargument: cash-only merchants may accept only cash to avoid the fixed costs of card terminals and network access, not just the marginal costs. Since your model explicitly abstracts from fixed costs (Section IV.F), raising a real-world argument that is easily confounded by the presence of fixed costs draws unnecessary attention to this omission. It would be tactically stronger to simply drop the revealed preference argument from your response copy and instead rely entirely on the robust external cost estimates you note from Felt et al. (2020).

---

### 21. Confusing use of "confirms" for rejected predictions

**Status**: [Pending]

**Quote**:
> Allowing substitution while keeping incremental debit sales generates the entangled pricing described above and a second prediction: capping debit fees should lower credit fees. A specification with both forces (Online Appendix OF.3) confirms both predictions. Expert witnesses in Ohio v. American Express testified that merchants discipline credit fees by threatening to divert transactions to rival credit cards, not to debit, rejecting the acceptance entanglement.

**Feedback**:
In the discussion of relaxing the segmentation assumption, stating that the alternative specification "confirms both predictions" is momentarily confusing. It reads as though empirical evidence validates the substitution model, yet the very next sentences present empirical evidence explicitly rejecting these predictions. To avoid reader whiplash, consider replacing "confirms" with a word like "yields," "generates," or "exhibits" to clarify that the mathematical machinery of the alternative structural model produces these predictions, avoiding the strong connotation of empirical validation.

---

### 22. Contradiction regarding Australian annual fees

**Status**: [Pending]

**Quote**:
> The Australian experience provides some reassurance on this point. Australia has had interchange fee caps since 2003, and Appendix Figure OB. 1 shows that observable card characteristics (annual fees and interest rates) did not deteriorate following regulation.

**Feedback**:
In the reply concerning the Lucas critique, you state that the Australian experience shows "annual fees" did not deteriorate. However, Section II.A of the main text explicitly notes that "consumer annual fees on rewards cards rose." To avoid a contradiction and maintain credibility with the referee, consider specifying in the reply that *non-rewards* annual fees did not deteriorate, matching the precise phrasing used in Section IV.F of the manuscript.

---

### 23. Contradiction between text and Figure OB.1 regarding interest rates

**Status**: [Pending]

**Quote**:
> Figure OB.1: Australian credit card market after interchange regulation
![](/documents/5021233c-4af7-4413-8065-f6b2768dac26/images/image_007.jpg)

Notes: Vertical line marks 2003, when interchange regulation began.

**Feedback**:
In Section II.A, the text states that Figure OB.1 shows interest rates were "unchanged" after Australian interchange regulation. However, the right panel of Figure OB.1 shows that absolute interest rates for both credit cards and term loans rose substantially (roughly 3-4 percentage points) between 2003 and 2010. While the *spread* between credit card and term loan rates appears relatively stable, the phrase "interest rates were unchanged" directly contradicts the visual evidence over this decade. Consider revising the text to clarify that you are referring to the spread or relative rate.

---

### 24. Incorrect dismissal of the share-response term as second-order

**Status**: [Pending]

**Quote**:
> The second term involves $\sum_{k}\left(\partial \mu_{j k} / \partial \tau_{m}\right) \tau_{k}$, which is $O(\tau)$ because share derivatives $\partial \mu_{j k} / \partial \tau_{m}$ are $O(1)$ while baseline fees $\tau_{k}$ are small ( $1-3 \mathrm{pp}$.). For a fee change $\Delta \tau_{m}$ that is itself $O(\tau)$, this term contributes $O\left(\tau^{2}\right)$, while the first term contributes $O(\tau)$. The second term is second-order for the fee changes relevant to policy analysis, so we focus on $\mathbb{E}_{R}\left[\mu_{j l} \mu_{j m}\right]$.

**Feedback**:
The statement dismissing the share-response term as second-order 'for the fee changes relevant to policy analysis' appears problematic because it reads as a general-equilibrium claim, where your own structural counterfactuals (e.g., Table 5) demonstrate the share response operates as a first-order driver of welfare via endogenous rewards. Clarifying that this derivative strictly isolates the partial-equilibrium mechanical incidence holding rewards constant would avoid an apparent contradiction, though the broader argument utilizing the covariance matrix to validate the integrated market assumption still holds.

---

### 25. Ambiguity in non-pecuniary utility for single-homers

**Status**: [Pending]

**Quote**:
> Mean non-pecuniary utility for consumer $i$ is

$$
\Gamma_{i}^{w}=\omega\left(\Xi^{w_{1}}+\beta_{i} X^{w_{1}}\right)+(1-\omega)\left(\Xi^{w_{2}}+\beta_{i} X^{w_{2}}\right)+\sum_{l=1}^{K} \sum_{m=1}^{K} \chi_{i}^{l m} X_{l}^{w_{1}} X_{m}^{w_{2}}
$$

**Feedback**:
In the subsection on consumer adoption, the formula for mean non-pecuniary utility $\Gamma_i^w$ scales the components by $\omega$ and $1-\omega$. For a single-homing consumer whose wallet is $w = (w_1, 0)$, normalizing the outside option to zero mathematically implies their utility evaluates to exactly $\omega(\Xi^{w_1} + \beta_i X^{w_1})$. Consider adding a brief sentence clarifying whether this exact fractional scaling for single-homers is an intended structural feature, as readers parsing the math may wonder if single-homers were instead meant to receive an unscaled standalone utility (effectively evaluating the primary card at $\omega=1$). If the fractional scaling is intentional, explicitly stating how the formula evaluates for $w_2=0$ would ensure expositional clarity and gracefully aid replication.

---

### 26. Flawed linear approximation in identification argument for alpha_y

**Status**: [Pending]

**Quote**:
> For $\alpha_y$: I target the elasticity of switching probability with respect to income among credit card holders asked whether they would switch issuers if rewards halved (Table OD.5). In a conditional logit with small issuer shares ($s_{ij} \ll 1$), switching probability is proportional to $\alpha_i$, so this elasticity directly reveals $\alpha_y$.

**Feedback**:
In Section C.2, the heuristic identification argument states that the switching probability is proportional to $\alpha_i$, implying its income elasticity directly reveals $\alpha_y$. This claim relies on a linear approximation ($1 - \exp(-\Delta V) \approx \Delta V$) that accurately holds only for small switching probabilities. Given the empirical mean switching rate of 71% (Table OA.9), the linear approximation substantially diverges from the true logit probability. At this high baseline rate, the actual elasticity of the switching probability with respect to $\alpha_i$ is approximately 0.51, not 1. Therefore, the targeted elasticity maps to approximately $0.51 \alpha_y$ rather than $\alpha_y$. While the formal numerical estimation presumably matches the exact non-linear simulated moments to the data without relying on this approximation, the exposition in the text overstates the 1:1 proportionality of the parameter mapping and should be slightly revised for technical accuracy.

---

### 27. Missing condition for positive denominator in acceptance threshold

**Status**: [Pending]

**Quote**:
> The merchant accepts card 2 if and only if $\gamma \geq \underline{\gamma}_{2}$, where

$$
\underline{\gamma}_{2}=\frac{\sigma\left[N \tau_{2}+D\left(\tau_{2}-\tau_{1}\right)\right]}{N\left(1-\sigma \tau_{2}\right)-D \sigma\left(\tau_{2}-\tau_{1}\right)}
$$

**Feedback**:
In Section OE.2, the algebraic rearrangement to derive the acceptance threshold $\gamma \geq \underline{\gamma}_2$ from the incremental quasi-profit condition implicitly assumes that the denominator of $\underline{\gamma}_2$ (which corresponds to $\sigma \Delta b$) is strictly positive. If the diversion mass $D$ is sufficiently large relative to $N$, $\Delta b$ could be negative, in which case the inequality would flip and the merchant would reject card 2 for all $\gamma \geq 0$. Specifying that this threshold rule applies exclusively under the assumption that $\Delta b > 0$ (which naturally holds in the paper's estimated empirical setting) would make the mathematical exposition technically complete.

---

### 28. Missing Panel C in Table OF.6

**Status**: [Pending]

**Quote**:
> Treating debit as cash lowers every credit card's net cost of acceptance because fees are measured relative to cash and cash's implied cost rises to equal debit's. Rationalizing observed acceptance at a lower net cost requires lower merchant margins, which the estimator delivers by raising the CES elasticity to $\sigma=7.16$ from the baseline 5.61 (Table OF.6).

**Feedback**:
In the subsection "OF.4.2 Parameter Estimates and Counterfactuals," the text states that the CES elasticity $\sigma$ is raised to 7.16 and directs the reader to Table OF.6. However, Table OF.6 omits the merchant parameters entirely (skipping directly from Panel B to Panel D). While the adjusted CES elasticity is provided in the text, the other updated merchant parameters (such as the mean and standard deviation of $\gamma$) that belong in Panel C are not reported and should be restored for completeness.

---

### 29. Endogenous justification for the two-card limit

**Status**: [Pending]

**Quote**:
> First, the model describes consumers' primary and secondary payment methods, the cards they actually use, not every card they own. A consumer may have a debit card linked to a bank account but rarely use it. What matters for merchant revenue is which cards consumers reach for at the register. In the data, consumers put around $95 \%$ of their card spending on just two networks (Online Appendix Table OA.4), so the primarysecondary classification is an empirically grounded way to capture the payment methods that drive spending. A debit card that sits in a drawer does not help a merchant capture the sales boost $\gamma$.

**Feedback**:
In your response to Referee 1 regarding the two-card wallet restriction, the first argument (relying on the 95% spending concentration) is vulnerable to pushback. A skeptical referee might note that this high concentration is an equilibrium outcome; if a merchant deviated by declining a consumer's preferred cards, the consumer might theoretically utilize a third card off-path. Using on-path shares to justify a restriction on off-path substitution invites a "Lucas Critique" debate. Fortunately, your second argument—that transactions are segmented between credit and debit—fully resolves the referee's concern, as segmentation prevents the fallback to debit regardless of wallet size. I suggest relying primarily on the segmentation argument and downplaying or qualifying the initial empirical concentration defense to avoid unnecessary methodological debates.

---

### 30. Mislabeling of institution-level estimates in Figure OD.3

**Status**: [Pending]

**Quote**:
> Figure OD.3: Distribution of institution-level estimates in the Nilson analysis
![](/documents/5021233c-4af7-4413-8065-f6b2768dac26/images/image_013.jpg)

Notes: Density plots of institution-level event study estimates of Durbin's effect on signature debit volumes for treated and control groups. Each observation is a financial institution. The main text coefficient roughly equals the difference between the treated and control group means.

**Feedback**:
In the notes for Figure OD.3, the plotted values are labeled as "institution-level event study estimates of Durbin's effect... for treated and control groups." Since the policy effect (the Durbin effect) is a difference-in-differences outcome, assigning an estimate of Durbin's effect to the control group level is slightly confusing terminology. The figure actually plots institution-specific pre-post changes (or time dummy coefficients). Consider rephrasing the label to clarify that these are the underlying institution-level changes from which the difference-in-differences estimate is derived.

---

### 31. Contradictory interpretation of the complementarity parameter

**Status**: [Pending]

**Quote**:
> A consumer who instead knows she strongly prefers credit has less option value from carrying debit and may benefit more from holding two credit cards, since there is also option value within a card type (e.g., different reward categories suit different purchases). The parameter $\chi$ in the main model captures this trade-off in reduced form.

**Feedback**:
There seems to be a minor expositional ambiguity in your reply that could confuse the referee. The phrasing suggests that the parameter $\chi$ directly captures the positive option value within a card type that leads a consumer to benefit from holding two credit cards. However, Table 2 reports $\chi^{22} = -4.80$, and Appendix OF.5.3 explains that this negative value captures linear adoption costs outweighing the option value. You might want to clarify in your letter that while the gross within-category option value exists (and is inherently generated by the logit shocks), the net effect represented by the reduced-form parameter $\chi^{22}$ is negative due to the offsetting linear adoption costs.

---

### 32. Mismatch between text and Table 3 for MC Debit

**Status**: [Pending]

**Quote**:
> The consumer substitution matrix in Table 3 shows that consumers view credit cards, debit cards, and cash as distinct segments. A 1-bp increase in Visa credit rewards raises Visa's share by $3.7 \%$, drawn mostly from MC credit (down $3.5 \%$ ), while MC debit falls only $0.3 \%$ and cash $0.3 \%$.

**Feedback**:
In Section V.B, the text states that a 1-bp increase in Visa credit rewards causes MC debit to fall by 0.3%. However, Table 3 shows the cross-reward semi-elasticity for MC Debit with respect to Visa Credit is -0.2. The value for Visa Debit is -0.3, suggesting a minor typo in the text. Please align the text with the table to prevent reader confusion.

---

### 33. Incorrect panel title in Figure OD.7

**Status**: [Pending]

**Quote**:
> ![](/documents/5021233c-4af7-4413-8065-f6b2768dac26/images/image_017.jpg)

Notes: Data are from the Nilson Report. Both panels use the same difference-in-differences design as Figure 3, comparing issuers above and below the \$10 billion Durbin threshold. Left: log total debit volumes (signature plus PIN). Right: signature debit as a share of total debit volumes.

**Feedback**:
In Figure OD.7, the title embedded in the right panel image reads "Share of Debit on Signature Debit." This phrasing is confusing and contradicts the figure notes and main text, which correctly state the panel plots "signature debit as a share of total debit volumes." Updating the internal panel title (e.g., to "Signature Debit Share of Total Debit" or "Share of Signature Debit") would ensure consistency and prevent minor reader confusion.

---

### 34. Conflation of merchant fee and interchange fee

**Status**: [Pending]

**Quote**:
> The cash-card fee gap is roughly $2-3 \%$ (the full interchange fee, since cash carries no merchant fee). That merchants do not surcharge even at this margin shows that menu costs exceed the gains at a $2-3 \%$ fee gap.

**Feedback**:
The text equates the 2-3% cash-card fee gap with "the full interchange fee." Because the 2-3% gap faced by merchants represents the merchant discount fee (which includes the interchange fee, network fees, and acquirer's markup), it would be more accurate to refer to this as "the full merchant fee" or "the full merchant discount fee." This ensures consistency with the precise terminology established in Section II.A.

---

### 35. Numerical and specification mismatch in response

**Status**: [Pending]

**Quote**:
> The key coefficient on "Discover HH × Grocery Reward Month" is small and economically negligible for grocery spend share ( 0.002 , SE 0.001), but the Discover spend share increases by 7.1 pp (SE 0.003).

**Feedback**:
In the response memo, the stated 7.1 pp increase in the Discover spend share contradicts the manuscript, which correctly reports a 7.6 pp increase (Table OD.3). Additionally, the response text describes two distinct regression models by referring to a single interaction term for both the grocery spend share and the Discover spend share outcomes, which obscures the paper's actual empirical design. Correcting these details in the response will ensure it neatly reflects the robust analysis in the manuscript.

---

### 36. Mathematical contradiction in margin range

**Status**: [Pending]

**Quote**:
> In the estimation section, I now clarify that the margin is estimated structurally: the model recovers a retail margin of 17.8 (SE 5), which lies within the 13-17\% margin range implied by the $15-20\%$ markups cited in macro studies of misallocation.

**Feedback**:
In your reply regarding the retail margin, you state that the structurally estimated margin of 17.8 (SE 5) "lies within the 13-17\% margin range." Mathematically, 17.8 is strictly greater than 17. To avoid a trivial contradiction, consider rephrasing this to state that it is "similar to" or "close to" the 13-17\% range, matching the precise language you already use in Section V.C.2 of the main text.

---

### 37. Inexact coincidence of multi-homing utility with CES price index

**Status**: [Pending]

**Quote**:
> This specification implies consumers do not multi-home to increase acceptance coverage. I adopt this because even as AmEx acceptance has converged with Visa Credit, multihoming rates between them have not changed (Online Appendix OD.4). The expression coincides with one that directly uses the CES price index of wallet $w$ whenever merchant acceptance depends only on card type (credit or debit) rather than network identity (Online Appendix OE.3).

**Feedback**:
In the subsection on consumer adoption, the text states that the multi-homing pecuniary utility expression 'coincides' with one using the CES price index directly. However, as accurately formalized in Online Appendix OE.3, this relationship is technically a first-order approximation due to a Jensen's inequality term resulting from the log of the price index. Consider softening the word 'coincides' to 'approximates' or 'closely approximates' to perfectly align the main text with the precise mathematical derivation found in the appendix.

---

### 38. Incorrect claim about sampling variation

**Status**: [Pending]

**Quote**:
> These are population calculations from the full MRI and Homescan samples, not subject to sampling variation.

**Feedback**:
The claim in Section OI.5 that calculations from the MRI and Homescan datasets are 'not subject to sampling variation' is statistically incorrect. Although these panels are large, they remain samples drawn from the broader U.S. population rather than full censuses. Consequently, any estimates calculated from them—even using the complete sample sizes available—are sample statistics and inherently retain sampling variance, even if their standard errors are infinitesimally small.

---

### 39. Incorrect equation reference for merchant benefit

**Status**: [Pending]

**Quote**:
> A merchant accepts a card when the sales benefit from card-paying consumers exceeds the merchant fee, and this benefit is proportional to $\gamma$ (Equation 14).

**Feedback**:
In the first paragraph, the reference to Equation 14 to show that the sales benefit is proportional to $\gamma$ is slightly inaccurate. Equation 14 summarizes the equilibrium consistency condition ($\widehat{M}(\gamma, \tau) = M^*(\gamma)$). The explicit mathematical relationship showing that the benefit of conditional acceptance is proportional to $\gamma$ is actually found in Equation 12 via the term $b_M \gamma$. Updating the reference to Equation 12 would cleanly direct the reader to the exact underlying mechanism.

---

### 40. Inconsistent notation for income-dependent preferences

**Status**: [Pending]

**Quote**:
> First, the random coefficient on card characteristics, $\beta_{i} \sim N\left(\beta_{y} \cdot \log y, \Sigma\right)$, means higher-income consumers have systematically different preferences for card characteristics.

**Feedback**:
In the reply, the normal distribution for the random coefficient is written using raw log income: $\beta_i \sim N(\beta_y \cdot \log y, \Sigma)$. However, Equation 20 in the main text defines this using demeaned log income ($\log \tilde{y}$), which is a key normalization step ensuring baseline parameters represent median income preferences. Adding the tilde to the term in the rebuttal text would ensure exact notational consistency with the empirical setup in the manuscript.

---

### 41. Contradictory reply regarding signature debit

**Status**: [Pending]

**Quote**:
> Reply: The data do not distinguish between contactless and signature transactions, only between debit and credit. The unobserved characteristics $\Xi$ are estimated to rationalize observed market shares in a 2019 cross-section, so they absorb whatever mix of contactless and signature use prevailed at that time.

**Feedback**:
In the response letter regarding the estimation of $\Xi$, the phrasing could be tightened to avoid potential confusion or the appearance of contradicting the main text.

First, the referee's comment contrasts 'signature cards' with 'contactless ones'. However, 'signature debit' (as used extensively in the paper's Durbin event study) refers to the Visa/Mastercard routing network, which inherently includes contactless tap transactions. Clarifying this institutional definition for the referee would directly address their concern and demonstrate your firm grasp of payment mechanics, gently dismissing the false dichotomy.

Second, stating broadly that 'the data' distinguishes 'only between debit and credit' risks contradicting the paper's heavy reliance on distinguishing signature debit from PIN debit in the panel analysis (e.g., Section III.A). Specifying that the *2019 cross-sectional data* used for estimating $\Xi$ does not distinguish by physical form factor (like contactless taps) would completely resolve this ambiguity while effectively precluding the referee's request.

---

### 42. Contradictory substitution rules for mixed wallets

**Status**: [Pending]

**Quote**:
> Consumers with two cards can substitute between them (Figure 7). One card is the primary. With probability $\pi$, the consumer tries the primary card first, then the secondary if declined, then cash if both are declined. With probability $1-\pi$, the roles reverse. ${ }^{15}$ Credit and debit cards are segmented. A consumer who wishes to use credit does not substitute to debit if her credit card is declined (and vice versa).

**Feedback**:
There seems to be an issue with the exposition of two-card substitution rules: the text describes sequential substitution to a secondary card as a general mechanism for all two-card wallets, which technically contradicts the subsequent statement that mixed credit and debit wallets are segmented. While Figure 7 perfectly clarifies the correct mechanics, the text itself contains a brief inconsistency.

---

### 43. Arithmetic error in Table OA.5 model gradient

**Status**: [Pending]

**Quote**:
> Table OA.5: Multihoming rate by income: data vs. model
|  | Data | Model |
| :--- | :---: | :---: |
| Below Median Income | $53.6 \%$ | $54.0 \%$ |
| Above Median Income | $57.9 \%$ | $58.2 \%$ |
| Gradient (High - Low) | +4.3 ppts | +4.3 ppts |

**Feedback**:
In Table OA.5, the difference between the displayed model values for Above Median Income (58.2%) and Below Median Income (54.0%) equals 4.2 ppts, but the Gradient row reports +4.3 ppts. This is likely an artifact of rounding the underlying exact values, but consider adding a brief note or adjusting the displayed decimals to ensure the table appears internally consistent to readers.

---
