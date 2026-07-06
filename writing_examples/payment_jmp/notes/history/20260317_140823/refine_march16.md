# Regulating Competing Payment Networks

**Date**: 3/16/2026, 2:14:41 PM
**Domain**: social_sciences/economics
**Taxonomy**: academic/research_paper
**Filter**: Active comments

---

## Overall Feedback

Here are some overall reactions to the document.

**Identification of consumer reward sensitivity**

A structural linchpin of the paper is the consumer elasticity parameter $\alpha_0$, which carries almost the entire welfare argument. Sections III.A and V.A.1 identify this elasticity by treating the Durbin Amendment as an effective reward shock. The manuscript clearly notes that Durbin also altered checking-account pricing, debit rewards, advertising, teller incentives, and other issuer steering behaviors. Moving from a 75 basis point interchange cut down to a 25 basis point reward shock places exceptional weight on this single parameter. 

Because this parameter dictates equilibrium rewards, recovers marginal costs, and sets the magnitude of the fee-cap counterfactuals, its stability is crucial. The paper’s stress test is instructive here: attributing half of the debit-volume decline to rewards yields negative Visa marginal costs. Given these mechanics, it would be useful to decompose the Durbin response further or present the primary policy results across a credible range of reward-pass-through bounds.

**Extrapolating merchant demand parameters**

The merchant side of the model relies on the Homescan grocery data detailed in Section III.B. Section V.A.3 characterizes the recovery of these parameters as closer to a calibration exercise than a conventional estimation. The observed events belong to a highly selected sample, as 98% of the Homescan trips occur at stores already accepting credit cards. 

The model uses these specific transitions to recover the merchant-type distribution $G$ and the CES parameter $\sigma$, which ultimately determine the merchant fee sensitivity driving the competitive-bottleneck mechanism. While the OptBlue validation provides an excellent out-of-sample check, extrapolating grocery-store parameters over the entire U.S. payments economy prompts questions. Incorporating a discussion on how structural differences in incremental-sales margins across restaurants, services, and e-commerce platforms might shift the economy-wide welfare claims will build confidence in the aggregate estimates.

**Incidence and the price pass-through mechanism**

The headline finding of a $27 billion welfare gain from capping credit fees relies heavily on lower merchant fees translating into lower retail prices. Table 7 demonstrates that the price-pass-through channel is the central driver for this result and its progressivity. Section VI.F states that this pass-through is inherited from the CES pricing structure rather than estimated empirically. 

The zero-pass-through alternative demonstrates that the CES assumption materially shifts the total welfare calculations. The residual welfare gain maps directly to the “credit aversion” parameter discussed in Sections V.B and VI.A.2. As currently written, the quantitative welfare claim rests on two objects—the incidence of merchant fees into retail prices and the welfare meaning of switching away from credit—that are not directly pinned down by the empirical design. Clarifying the reliance of the point estimates on these imposed structures will align the magnitude of the claims with the supporting evidence.

**Mapping the dual-routing counterfactual**

There is a mechanical divergence in how the dual-routing policy is evaluated relative to the legislation introduced in the text. In Section VI.D, dual routing is operationalized via an increase in $\chi^{22}$, effectively making consumers more willing to hold two credit cards and multi-home across networks. 

The actual policy object discussed in the introduction and Section VI.D operates as a back-end routing mandate. That policy gives merchants routing options on a single credential, rather than representing a front-end shift in consumer wallet composition. Given the $8 billion welfare gain attached to this finding, realigning the model mechanics with the policy object is necessary. The manuscript could achieve this by modeling expanded merchant-side transaction-stage substitution, or by renaming the current exercise as a structural simulation of enhanced consumer multi-homing rather than an evaluation of routing legislation.

**Framing the competition and welfare findings**

The proposition that competition can reduce welfare takes a prominent position in the abstract, the introduction, Section VI.C, and the conclusion. This merger-to-monopoly result rests on a specific and sensitive set of short-run modeling constraints. Section IV.F holds non-reward card characteristics fixed, and the framework collapses issuers, acquirers, and networks into a single entity. 

Section VI.F and Table 6 show that the monopoly result is highly sensitive to the imposed reward-sensitivity parameters, involving substantial consumer losses with wide uncertainty. Rather than foregrounding this counterfactual as a primary policy conclusion, the manuscript could position it as a powerful demonstration of the core mechanism: that under price coherence, the locus of competition dictates outcomes independent of standard market-power logic. Reframing the monopoly simulation around this mechanism will make the paper substantially more persuasive and less vulnerable on its boldest headline.

**Status**: [Pending]

---

## Detailed Comments (42)

### 1. Equivalence of lump-sum and per-transaction rewards

**Status**: [Pending]

**Quote**:
> Rewards $f^{w}$ enter as a lump-sum income boost: total expenditure is $y\left(1+f^{w}\right)$, and log indirect utility reduces to $\log U^{w}=\log y+f^{w}-\log P^{w}$. By Roy's identity, whether $f^{w}$ is paid out lump sum or on each transaction has no effect on the optimized value of indirect utility.

**Feedback**:
The passage seems to overstate the equivalence between lump-sum rewards and per-transaction rewards. A transaction rebate is equivalent to a lump-sum only after mapping it into the expected reward amount, which depends on how much spending occurs at merchants that accept the card. As written, the same $f^w$ appears to deliver the full utility shift even when acceptance is less than universal. Since acceptance is endogenous and matters for adoption incentives off equilibrium, it would help to clarify whether $f^w$ is intended as a reduced-form expected rebate net of acceptance, or whether the lump-sum treatment is an approximation justified by near-universal acceptance.

---

### 2. Inverted logic in network diversion adjustment

**Status**: [Pending]

**Quote**:
> The adjustment term $\iota$ is the expected number of respondents who report switching to the same card type but also switch networks:

$$
\iota=\sum_{i=1}^{N} S_{i,3} \times\left(1-\left(\sum_{k \in\{\mathrm{Visa}, \mathrm{MC}\}} n_{b_{i}}^{k, t_{i}} \times\left(\frac{1}{\left|\mathcal{C}_{i}\right|} \sum_{j \in \mathcal{C}_{i}} n_{j}^{k, t_{i}}\right)\right)\right)
$$

**Feedback**:
The network-diversion adjustment in OC.5.3 appears internally inconsistent. The inner sum in the displayed formula is the probability that a respondent who switches banks keeps the same network, so the leading $1-(\cdot)$ makes $\iota$ count expected cross-network switches. But the surrounding prose, step 4, and the reported adjusted diversion rates suggest that the object being subtracted should instead be the expected within-network bank switches. Please reconcile the definition of $\iota$ with the moment $\frac{\sum_i S_{i,3}-l}{N-l}$, and clarify the role of the undefined symbol $l$.

---

### 3. Dimensional inconsistency in the observed reward rate formula

**Status**: [Pending]

**Quote**:
> Adoption utilities $A_{j}$ and network marginal costs $c_{j}$. I seek $A_{j}$ and $c_{j}$ such that each network's first-order condition for $A_{j}$ holds at $c_{j}$, and inverting $A_{j}=f^{j}-\left(\log P^{(j, 0)}-\right. \log P^{0}$ ) (Equation 28) yields implied rewards matching observed reward rates $r_{j}=f^{j} / d_{j}$.

**Feedback**:
The mapping from the model's reward object to the observed reward-rate moment is unclear in Appendix C.3. Equation 28 defines $f^j$ as the reward term entering adoption utility, while Section IV.D.1 separately defines aggregate reward costs $S_j$. The statement that observed reward rates are matched via $r_j=f^j/d_j$ is therefore difficult to reconcile with the paper's other definitions, including the Table 4 note on reported reward rates. This step needs clarification.

---

### 4. Invalid control group for Discover and Other Credit shares

**Status**: [Pending]

**Quote**:
> To address your concern about consumer heterogeneity: the table below repeats the analysis for households whose only credit card is Discover, so they cannot substitute to another credit card. The grocery trip share is again flat. The Discover trip share at grocery rises by only $2.2 \mathrm{pp}(p<0.001)$, compared to 7.1 pp in the full sample, consistent with debit being a much weaker substitute for credit than other credit cards are.

**Feedback**:
The interpretation of the Discover-only exercise needs to be tightened. In the “Discover” share regression, the control households do not appear to provide a meaningful counterfactual trend for Discover use, and the “Other Credit” column has the analogous problem in reverse. As a result, these columns are better read as largely within-group double differences rather than symmetric triple-differences. The finding that Discover use rises by 2.2 pp while grocery trip share stays flat is still informative, but the comparison with the 7.1 pp full-sample effect is only suggestive about credit-debit substitution.

---

### 5. Contradictory signs for $\chi$ parameters

**Status**: [Pending]

**Quote**:
> The model also captures incremental adoption costs. If all cards of a given type pay the same rewards $f_{j}$, then $V_{i}$ is concave in the number of same-type cards, but costs are linear. This explains why consumers do not adopt every card on the market, captured in the main text by $\chi<0$ for wallets with multiple same-type cards.

A consumer who highly values credit cards may still want multiple credit cards to capture more idiosyncratic shocks $\epsilon_{i j t}$, which occurs when $\gamma_{i}^{\prime} X_{j}$ is large for credit. The main text captures this through $\chi>0$ for wallets with multiple credit cards.

**Feedback**:
The discussion in OA.5.3 uses the generic notation $\chi$ in a way that makes the sign of wallet interactions hard to parse. The first paragraph ties “multiple same-type cards” to $\chi<0$, while the next says the model captures demand for “multiple credit cards” through $\chi>0$. In the main text, however, the relevant objects are distinct interaction terms: $\chi^{12}$ and $\chi^{21}$ are positive, while $\chi^{22}$ is negative, and a two-credit-card wallet depends on their combination. It would help to specify which interaction term or net effect is meant in each sentence.

---

### 6. Typo and conceptual issue in dynamic DiD specification

**Status**: [Pending]

**Quote**:
> $$
y_{j t}=\sum_{k \neq-1} \beta_{k} I\{t=k\} \times T_{j k}+\delta_{j}+\delta_{t}+\epsilon_{j t}
$$

where $y_{j t}$ is the log of debit card payment volumes, $T_{j t}$ is an indicator that institution $j$ at time $t$ does not pay rewards, $\beta_{k}$ are the dynamic difference-in-difference estimates, $\delta_{j}$ are bank fixed effects, and $\delta_{t}$ are time fixed effects.

**Feedback**:
The event-study notation in OC.1.2 is internally inconsistent. The equation uses $T_{jk}$, while the text defines $T_{jt}$ as a time-varying indicator for not paying rewards. In a sample where all 15 banks paid rewards pre-Durbin, that literal definition would not generate the pre-period coefficients shown in Figure OC.8. The specification appears instead to rely on a time-invariant indicator for banks that eventually ended rewards, or an equivalent formulation, so the equation and variable definition should be clarified.

---

### 7. Contradictory event study timeline

**Status**: [Pending]

**Quote**:
> I define $t=0$ as 2010 and focus on institutions with between 2 and 200 billion in assets, excluding issuers that made large acquisitions during the sample period. This comparison of large and small issuers differences out the effects of the Durbin routing requirements, the CARD Act, and potential changes in merchant acceptance on debit and credit card use.

Figure 3 plots the estimates. Weakening issuers' incentives to promote debit led to

[^5]Figure 3: The effect of the Durbin Amendment on debit card volumes
![](/documents/9bb95c75-4732-42c1-ba2d-d5d3189cf7df/images/image_003.jpg)

Notes: Data are from the Nilson Report. The points show the difference-in-differences estimates of the effects of the Durbin Amendment on debit card volumes. Dashed lines show $95 \%$ confidence intervals. The vertical line marks the year before the policy implementation in Q3 2011, which is $t=0$.

**Feedback**:
The event-time indexing around Figure 3 appears inconsistent. The regression omits $k=-1$, Figure 3 normalizes the point at x = -1, and Appendix Table OC.1 likewise omits $t=-1$, which suggests that 2010 (the year before implementation) is $t=-1$ and 2011 is $t=0$. That conflicts with both the text and the figure note, which say 2010 is $t=0$. Please make the time index consistent across the text, equation, figure, and notes.

---

### 8. Missing merchant-level statistics in referenced table

**Status**: [Pending]

**Quote**:
> The 2022 wave records whether each respondent shopped at 214 merchant chains spanning grocery, department stores, restaurants, and other sectors. For each merchant, I compute the survey-weighted share of customers preferring each payment method. Table OG. 7 shows that the average merchant's customer base is $48 \%$ credit, $38 \%$ debit, and $14 \%$ cash, with standard deviations of $8-10$ percentage points across merchants.

**Feedback**:
The text in OB.1.3 says that Table OG.7 reports merchant-level averages and cross-merchant standard deviations of payment-preference shares, but Table OG.7 appears to report only consumer-level MRI summary statistics. If the 48/38/14 merchant-level shares and their 8-10 percentage point standard deviations are intended as supporting evidence, they seem to be missing or mis-referenced.

---

### 9. Flawed justification for setting debit demand-boost to zero

**Status**: [Pending]

**Quote**:
> Because accepting any card now captures sales from all cardholders, debit acceptance no longer generates incremental sales over credit; the debit demand-boost parameter is set to zero ( $\kappa_{\text {debit }}=0$ in Eq. 31). The merchant acceptance equation (Eq. 12) keeps its form but $b_{M}$ changes because $v_{M}^{w}$ changes.

With $\kappa_{\text {debit }}=0$, debit acceptance yields no incremental sales benefit in $b_{M}$ (Eq. 12), so I impose universal debit acceptance. To make this without loss, I set the cost of cash equal to the debit fee, so merchants are indifferent between debit and cash transactions.

**Feedback**:
The logic for imposing $\kappa_{\text{debit}}=0$ in OF.4 is not stated quite precisely. Under POS substitution, accepting debit in addition to credit already does not add sales for credit-debit multi-homers; setting $\kappa_{\text{debit}}=0$ goes further by removing any incremental sales role for debit relative to cash as well. It would help to state that this stronger restriction is what makes debit and cash equivalent for merchants in the extension, together with the zero relative debit fee. The phrase “set the cost of cash equal to the debit fee” is also easy to misread and would benefit from clarification, especially since Table OF.8 reports cost parameters rather than merchant fees and the model includes two debit networks.

---

### 10. Redundant and out-of-order step in solution algorithm

**Status**: [Pending]

**Quote**:
> 1. Conjecture consumer price indices $P^{w}$
2. Compute consumer price indices $P^{w}$ from current acceptance decisions
3. Solve consumer demand to obtain wallet shares $\tilde{\mu}_{y}^{w}$ conditional on $P^{w}$
4. Solve merchant equilibrium: each merchant type $\gamma$ maximizes quasi-profit to determine optimal acceptance $M^{*}(\gamma)$
5. Update price indices $P^{w}$ using new acceptance decisions $M^{*}(\gamma)$

**Feedback**:
The fixed-point algorithm in OA.7.1 appears to conflate initialization and updating. After Step 1 conjectures $P^{w}$, Step 2 again computes $P^{w}$ from “current acceptance decisions,” even though acceptance is only solved in Step 4, and Step 5 already updates $P^{w}$ from the newly computed $M^{*}(\gamma)$. It would help to clarify whether Step 2 is meant to use an initialized acceptance profile or whether it is redundant.

---

### 11. Sign error in second derivative in proof of Theorem 3

**Status**: [Pending]

**Quote**:
> Computing the second derivative of log profit with respect to $\log p$ and evaluating at the optimal price $p^{w *}=\frac{\sigma}{\sigma-1}\left(1-\tau^{w}\right)^{-1}$ yields $\frac{\partial^{2} \log \pi^{w}}{\partial(\log p)^{2}}= \sigma(\sigma-1)$. Since $\log p^{w *}-\log \hat{p}=\tau^{w}-\hat{\tau}$, the second-order Taylor expansion yields the result.

**Feedback**:
The proof seems to contain a local algebraic slip. At $p^{w*}=\frac{\sigma}{\sigma-1}(1-\tau^w)^{-1}$, $\partial^2 \log \pi^w/\partial(\log p)^2$ should be $-\sigma(\sigma-1)$, not $+\sigma(\sigma-1)$. The theorem’s positive loss formula is still consistent once the Taylor expansion is written using this negative second derivative. Also, $\log p^{w*}-\log \hat p$ equals $-\log(1-\tau^w)+\log(1-\hat\tau)$, so the displayed equality to $\tau^w-\hat\tau$ is only first-order; that is harmless given the stated $O(\tau^3)$ remainder, but the proof should distinguish the approximation from an exact identity.

---

### 12. Contradictory direction of imputation bias in OE.3

**Status**: [Pending]

**Quote**:
> Consumers may vary methods across purchases (e.g., using credit for large transactions), but such within-consumer variation would reduce measured sorting, understating sorting and overstating surviving redistribution. Any measurement error that overstates sorting biases our findings toward rejecting the integrated economy assumption.

**Feedback**:
The discussion of imputation bias in OE.3 appears to reverse the direction of the bias. If consumers sometimes use non-preferred methods, imputing each shopper to a single method should make merchant-level payment shares more extreme, thereby overstating sorting and understating surviving redistribution. The following sentence seems to reflect this intended logic, so clarifying the comparison would make the bounding argument easier to follow.

---

### 13. Incorrect pricing formula for ad valorem fees

**Status**: [Pending]

**Quote**:
> This log-linear form follows from the main-text CES demand structure: with elasticity $\sigma$, merchant $j$ sets $p_{j}= \frac{\sigma}{\sigma-1}\left(w+\sum_{k} \mu_{j k} \tau_{k}\right)$ where $w$ is marginal cost, yielding the log-linear form for small fees.

**Feedback**:
The sentence motivating the log-linear pricing equation appears to state an additive pricing rule that is not the exact CES price formula for the paper’s ad valorem merchant fees. In the main model the exact rule is multiplicative in $(1-\bar{\tau}_j)^{-1}$ (or the corresponding effective-fee term), while the expression here is at most a first-order approximation, especially under the paper’s normalization of marginal cost. The log-linear approximation may still be appropriate for small fees, but the derivation should distinguish the exact ad valorem formula from the approximation.

---

### 14. Inconsistent outcome variable in OLS discussion

**Status**: [Pending]

**Quote**:
> A standard OLS specification in levels estimates absolute changes in trips, not percentage changes. Running OLS in logs is not feasible here because the outcome (purchases at the consumer-store-period level) contains many zeros.

**Feedback**:
This discussion currently mixes outcomes. The main event-study in the revised draft uses dollar purchases, but this paragraph still refers to “absolute changes in trips,” and Figure A.1 appears to label the OLS results as a percentage change in trips. It would help to clarify whether the auxiliary OLS comparison is based on trips or on dollar purchases, and to make the wording and figure labeling consistent with that choice.

---

### 15. Inaccurate mapping of merchant identification moments

**Status**: [Pending]

**Quote**:
> | Merchant event study + Aggregate pricing | 2013-2023 / 2019 | Sales effect of credit card acceptance at grocer | Merchant benefit distribution $\left(\bar{\gamma}, v_{\gamma}\right)$ |

**Feedback**:
The summary table’s last row appears to misstate the merchant-side identification mapping. In the paper, the grocery event-study sales effect identifies the merchant CES elasticity $\sigma$ through the marginal merchant, while $\left(\bar{\gamma}, v_{\gamma}\right)$ are recovered from the aggregate acceptance moment together with the networks’ pricing first-order conditions. As written, the row omits $\sigma$ and does not mention the acceptance-rate moment, so the condensed mapping is inconsistent with the fuller identification discussion.

---

### 16. Inconsistent merchant acceptance set M at adoption

**Status**: [Pending]

**Quote**:
> W_{i}^{*} & =\underset{W \subseteq \mathcal{J}}{\operatorname{argmax}} V_{i}(M, W)-\sum_{j \in W} c^{\prime} X_{j}+\phi a_{i}^{W} \\
a_{i}^{W} & \sim \mathcal{N}\left(0, v^{2}\right)

**Feedback**:
The adoption problem in OA.5.2 appears to condition on a single merchant acceptance set $M$, since $V_i(M,W)$ was defined in OA.5.1 for a given merchant. In the main text, by contrast, adoption values a wallet through $P^w$, which averages over heterogeneous merchants and their acceptance decisions. I could follow OA.5 as an illustrative microfoundation for usage-stage versus adoption-stage segmentation, but the mapping to the main-text adoption problem is not exact as written unless $V_i$ is interpreted as already averaged over the expected merchant environment.

---

### 17. Flawed intuition for Ramsey Planner rewards

**Status**: [Pending]

**Quote**:
> It also sets negative rewards, but less negative than the tourist test, because it can target fees directly rather than relying on reward reductions to discourage excessive credit card use.

**Feedback**:
The intuition in this sentence seems misleading. In the tourist-test scenario, fees are already directly capped at 30 bps, so the difference between the tourist test and the Ramsey planner is not well explained by the planner's ability to “target fees directly.” The key distinction is that the planner jointly chooses fees and rewards subject to the network profit constraint, whereas under the tourist test rewards are chosen endogenously by profit-maximizing networks under the fee cap. As written, the sentence risks attributing the tourist-test reward cuts to a welfare motive rather than to the networks' equilibrium response.

---

### 18. Contradiction between text and Table 6 regarding CBDC welfare gains

**Status**: [Pending]

**Quote**:
> Because pricing merchants at cost requires charging consumers, the entrant's market share is roughly half that of Mastercard debit, and total welfare gains are roughly \$2 billion, smaller than repealing Durbin caps.

**Feedback**:
In Section VI.E, the text states that the CBDC counterfactual delivers "total welfare gains" of roughly \$2 billion, but Table 6 reports total welfare of \$0.9 billion in that column, with \$2.3 billion corresponding to consumer welfare. The text and table should be reconciled here.

---

### 19. Missing normalization factor in welfare derivation

**Status**: [Pending]

**Quote**:
> $$
\begin{aligned}
\int_{j} q_{j l} \frac{\partial p_{j}}{\partial \tau_{m}} & =\int_{j} q_{j l} p_{j}\left(\mu_{j m}+\sum_{k} \frac{\partial \mu_{j k}}{\partial \tau_{m}} \tau_{k}\right) \\
& =\int_{j} p_{j} Q_{j} \mu_{j l} \mu_{j m}+\int_{j} p_{j} Q_{j} \mu_{j l} \times\left(\sum_{k} \frac{\partial \mu_{j k}}{\partial \tau_{m}} \tau_{k}\right) \\
& =\mathbb{E}_{R}\left[\mu_{j l} \mu_{j m}\right]+\mathbb{E}_{R}\left[\mu_{j l} \times \sum_{k} \frac{\partial \mu_{j k}}{\partial \tau_{m}} \tau_{k}\right]
\end{aligned}
$$

**Feedback**:
The transition from $\int_j p_j Q_j X_j$ to $\mathbb{E}_R[X_j]$ appears to omit the aggregate revenue factor implicit in the revenue-weighted expectation, and the same issue seems to recur in the subsequent normalization $\int_j p_j Q_j \mu_{jl}=\mathbb{E}_R[\mu_{jl}]$. Because this common factor cancels in the ratio defining $w_{lm}$, the final sufficient-statistic formula appears unaffected, but the intermediate equalities are not literally correct as written.

---

### 20. Contradictory explanation for monopoly welfare gains

**Status**: [Pending]

**Quote**:
> The monopoly counterfactual is more beneficial here: $\$ 22 \mathrm{~B}$ versus $\$ 15 \mathrm{~B}$ at baseline. The unconstrained consumers who drive adoption are more reward-sensitive, so a merged network that raises rewards can attract more volume.

**Feedback**:
This explanation seems reversed relative to the paper’s monopoly mechanism. Elsewhere the merger raises welfare because integrated ownership dampens the rewards arms race and reduces excessive credit adoption. Here the statement that “a merged network ... raises rewards” to attract more volume is hard to reconcile with that logic; it may instead be the competitive baseline networks whose incentive to raise rewards is stronger when unconstrained consumers are more reward-sensitive.

---

### 21. Contradiction regarding the welfare effect of monopoly

**Status**: [Pending]

**Quote**:
> Reducing reward sensitivity makes network monopoly power less harmful because consumers are less responsive to rewards and networks extract less surplus through the reward-fee channel.

**Feedback**:
This sentence seems to invert the logic of the monopoly robustness check. In the baseline, the merger-to-monopoly counterfactual raises welfare, whereas under the reduced reward-sensitivity calibration it turns negative. So lower reward sensitivity appears to make monopoly less beneficial, or more likely harmful, in overall welfare terms. If the intended claim is instead about a narrower reward-fee extraction channel, that distinction needs to be made explicit.

---

### 22. Undefined term in network volume equation

**Status**: [Pending]

**Quote**:
> d_{j}=\sum_{w \in \mathcal{W}} \tilde{\mu}^{w} \times \int \frac{(1+\gamma) \pi_{M^{*}(\gamma), j}^{w}}{1+\gamma \pi_{M^{*}(\gamma)}^{w}} q^{w *}(\gamma) p^{*}(\gamma) \mathrm{d} G(\gamma)

**Feedback**:
Equation 25 uses $\pi_{M^{*}(\gamma)}^{w}$ in the denominator, but this object is not defined. Given the definitions in Section IV.B.2 and the generalized dollar-volume formula in Appendix B.1, the denominator appears intended to be the quality term $1+\gamma v_{M^{*}(\gamma)}^{w}$, or an explicitly defined shorthand for that object.

---

### 23. Incorrect subscript in generalized payment surplus and wallet-average fees

**Status**: [Pending]

**Quote**:
> The derivations below use a generalized payment surplus:

$$
v_{M}^{w}=\sum_{j=1}^{J} \pi_{M, w_{j}}^{w} \kappa_{j}
$$

where $\kappa_{j} \in[0,1]$ governs the demand boost from accepting card $j$.

**Feedback**:
In Appendix B.1, the definitions of $v_M^w$, $\tau_M^w$, and $\tilde{\tau}_M^w$ sum over $j=1,\dots,J$ but use $\pi_{M,w_j}^w$. Since $w_j$ denotes the card in wallet position $j$, this is not consistent with a sum over all inside payment methods. The intended probability term appears to be $\pi_{M,j}^w$, as in the main text.

---

### 24. Contradiction between text and Figure OC.9 right panel

**Status**: [Pending]

**Quote**:
> The right panel uses MRI-Simmons survey data, which asks consumers whether they recently changed their primary financial institution. Consumers at small banks (credit unions or community banks, largely exempt from Durbin) did not report higher rates of recent bank switching compared to consumers at large banks.

**Feedback**:
The right panel appears to show a temporary increase in reported bank switching among small-bank customers in 2012, even if the confidence intervals overlap and the pattern is not sustained. As written, the statement that small-bank consumers “did not report higher rates” is too categorical relative to the figure; the evidence seems better described as showing no clear or persistent differential increase in switching at small banks.

---

### 25. Misidentification of preference heterogeneity parameters

**Status**: [Pending]

**Quote**:
> Halving the target lowers estimated reward sensitivity from 6.74 to 5.92 (Table OF.6). The model offsets this with larger preference heterogeneity: Visa Debit $\Xi=-5.40$ (vs. -4.00 baseline), Amex $\Xi=-7.70$ (vs. -6.30 ).

**Feedback**:
The sentence attributes “larger preference heterogeneity” to changes in the $\Xi$ terms, but elsewhere the paper defines $\Xi$ as mean unobserved characteristics and the volatility parameters as the source of consumer heterogeneity. If the point is that the reduced-Durbin specification generates more heterogeneity, the supporting evidence should come from the volatility estimates; the more negative $\Xi$'s reflect a different adjustment.

---

### 26. Contradiction in Discover regression coefficients

**Status**: [Pending]

**Quote**:
> The results show a small and economically negligible effect on grocery spend share (coefficient 0.002 , SE 0.001 ), indicating that Discover users do not meaningfully increase their spending at grocery stores relative to non-Discover users during reward months. However, the Discover spend share increases significantly (coefficient 0.102, SE 0.002)

**Feedback**:
The reply's summary of the Discover appendix does not appear to match the current appendix specification. Section OC.2.2 and Table OC.3 describe trip-share regressions, and the Discover coefficient reported there is 0.071 (SE 0.003), not 0.102 (SE 0.002). The 0.002 estimate in column 1 also refers to grocery trip share, not spend share. Aligning the response letter with the current appendix would avoid confusion about which regression results are being summarized.

---

### 27. Misattribution of deadweight loss under zero passthrough

**Status**: [Pending]

**Quote**:
> The monopoly counterfactual is the exception: total gains fall from \$15 billion to \$8 billion, because the monopolist's higher fees generate more deadweight loss under zero passthrough, where no price adjustment offsets the consumption distortion.

**Feedback**:
The explanation of why the monopoly gains are smaller under zero passthrough seems to misstate the mechanism. In the discussion just above, the relevant channel is that lower rewards reduce consumption, and under zero passthrough there is no offsetting retail-price decline. As written, attributing the extra deadweight loss to the monopolist’s “higher fees” is confusing, since under zero passthrough fees do not move retail prices. If this sentence is meant to describe the consumption-distortion channel, it would benefit from clarification.

---

### 28. Outdated reference to the "Cap Fees" counterfactual level

**Status**: [Pending]

**Quote**:
> The "Cap Fees" counterfactual caps merchant fees at approximately 30 basis points, and Appendix OF. 5 confirms that this simple cap captures roughly $80 \%$ of the welfare gain from the constrained social optimum.

**Feedback**:
This paragraph appears to conflate two different fee-cap exercises. In the paper, the main “Cap Fees” counterfactual is the 120 bps credit-only cap, while the 30 bps policy is the cost-of-cash / tourist-test benchmark in Appendix OF.5. Because both generate roughly 80% of the Ramsey gains, the numerical claim is understandable, but the labeling here is inconsistent and makes it unclear which counterfactual is being discussed.

---

### 29. Mismatch between data moment and model analog for merchant acceptance

**Status**: [Pending]

**Quote**:
> Benefit dispersion $v_{\gamma}$. The data moment is the share of spending at card-accepting merchants (Table 1). The model analog is the ratio of dollar spending at merchants above the acceptance threshold $\underline{\gamma}_{M}$ (Equation 44) to total dollar spending (Equation 25), computed at the threshold for accepting the grand bundle of cards.

**Feedback**:
At first the use of the grand-bundle threshold made me think the model analog was narrower than the Table 1 data moment on “card-accepting merchants.” Then I understood that the intended approximation is likely that, by 2019, merchants that accept cards largely accept the full major-card bundle. It would still help to make that connection explicit here, since the model allows partial acceptance and the data description reads more broadly than “accepts the grand bundle.”

---

### 30. Incorrect dataset and table reference for credit card ownership

**Status**: [Pending]

**Quote**:
> In the Nielsen Homescan panel, approximately $70-80 \%$ of households that primarily use debit also hold at least one credit card (Table OG.4). These households are not uniformly at their credit limits-Table 1 shows meaningful variation in credit utilization, and many debit-primary households carry substantial unused credit capacity.

**Feedback**:
The credit-card-ownership statistic appears to be attributed to the wrong dataset and table. Table OG.4 reports only Homescan sample summary statistics and does not contain credit-card ownership information. The relevant evidence seems to be Table 1 from the DCPC, where 79% of debit-primary consumers own a credit card and credit utilization is also reported. This should be corrected so the reader can verify the claim.

---

### 31. Contradictory justification for Poisson model

**Status**: [Pending]

**Quote**:
> I use a Poisson specification following Cohn et al. (2022), who show that Poisson regression is the preferred approach for difference-in-differences designs with count-like outcomes. A standard OLS specification in levels estimates absolute changes in trips, not percentage changes.

**Feedback**:
The Poisson justification here still refers to “count-like outcomes” and to percentage changes in trips, whereas the revised specification uses dollar purchases as the outcome. The estimator itself seems reasonable, but the explanation should be aligned with the current spending-based specification rather than the earlier trips-based one.

---

### 32. Contradiction regarding hierarchical acceptance and modeling restrictions

**Status**: [Pending]

**Quote**:
> This hierarchical pattern is an equilibrium outcome of similar fees across networks, not a modeling restriction. The model allows merchants to accept any arbitrary subset of cards, so if a counterfactual drove fees apart (for example, capping one network's fees while leaving others uncapped) the model would predict divergent acceptance patterns.

**Feedback**:
Statement “This hierarchical pattern is an equilibrium outcome of similar fees across networks, not a modeling restriction” initially made me think the model could generate fully non-nested acceptance patterns across merchants. After reading Section IV.F, I understood that merchants are allowed to choose any subset, but the one-dimensional merchant type still tends to organize equilibrium acceptance along a hierarchical margin. It would help to clarify what “divergent acceptance patterns” means here—e.g. larger acceptance gaps or more selective acceptance, rather than disjoint specialization—and to separate that point from the role of similar fees in producing near-universal co-acceptance among major credit networks.

---

### 33. Contradiction in explaining income scale effects on reward utility

**Status**: [Pending]

**Quote**:
> The model does capture the fact that higher-income consumers spend more and therefore earn more total rewards for a given reward rate. In the indirect utility function, rewards enter as $\alpha \cdot f^{w}$, where $f^{w}$ is the percentage reward rate. The level of spending does not multiply this term because the CES indirect utility is already in $\log$ form, $\log V^{w} \approx \log y+\alpha f^{w}-\log P^{w}$, so a consumer with higher $y$ benefits more from rewards only through $\alpha$, not through the volume of spending.

**Feedback**:
At first the sentence “The model does capture the fact that higher-income consumers spend more and therefore earn more total rewards” made me think the model generated a mechanical income-scale effect in wallet choice. Reading the rest of the paragraph, I understood that the model only captures higher reward dollars in levels: under the log/CES indirect utility, spending volume does not separately raise the relative utility of a rewards card, so differential responsiveness comes through $\alpha_y$ rather than through $y$ itself. Clarifying that distinction would make this response more internally consistent.

---

### 34. Mismatched coefficients for Discover spend share

**Status**: [Pending]

**Quote**:
> However, the Discover spend share increases significantly (coefficient 0.102, SE 0.002), indicating that Discover users shift their payment method within grocery stores toward Discover cards but do not change where they shop.

**Feedback**:
The response letter cites a Discover-share effect of 0.102 (SE 0.002), but the visible appendix regression reports 0.071 (SE 0.003) for the Discover-share coefficient and labels those columns as trip shares. Please reconcile the coefficient and clarify whether the referenced result is a spend-share or trip-share specification.

---

### 35. Clarify whether \$28 bn refers to total or consumer welfare

**Status**: [Pending]

**Quote**:
> However, the welfare results are very similar ( \$28 bn in the baseline and \$32 bn in the credit-constrained specification). Both models are estimated to match the same Durbin Amendment moment (the observed shift in payment shares after the debit fee reduction).

**Feedback**:
The phrase “the welfare results are very similar (\$28 bn in the baseline and \$32 bn in the credit-constrained specification)” is ambiguous because these figures appear to be consumer welfare changes, whereas the paper’s headline welfare numbers are total welfare gains of \$27 bn and \$31 bn. Clarifying which welfare measure is intended would avoid confusion.

---

### 36. Typo in explanation of multihoming effects

**Status**: [Pending]

**Quote**:
> Consistent with the theoretical predictions of Teh et al. (2022), increased multihoming leads networks to compete more aggressively for consumers.

**Feedback**:
Statement “Consistent with the theoretical predictions of Teh et al. (2022), increased multihoming leads networks to compete more aggressively for consumers” seemed to describe the dual-routing mechanism incorrectly. After reading the manuscript and the rest of this reply, I understood the intended mechanism to be that greater consumer multihoming weakens the cardholder bottleneck and shifts competition toward merchants/merchant fees, which fits the reported declines in both fees and rewards. Because the intended meaning is recoverable, this looks like a local wording slip in the response letter, but it is worth correcting to avoid confusion.

---

### 37. Response to Reviewers: Use of "tractable" vs. "empirically viable"

**Status**: [Pending]

**Quote**:
> I was unable to find a tractable specification that incorporates both channels: a model with both the debit sales channel and point-of-sale substitution predicts that reductions in debit fees should lower credit card acceptance and that credit acceptance should depend on the share of consumers who multi-home across credit and debit

**Feedback**:
At first, “unable to find a tractable specification” made me think the combined debit-sales/point-of-sale-substitution model could not be solved. Then I understood from the rest of the paragraph and OA.4 that the more relevant issue is that the combined specification yields predictions not clearly supported by the data, and perhaps is not attractive as the paper’s quantitative baseline. A brief clarification of that distinction would avoid confusion.

---

### 38. Clarify "without payment methods" vs "without credit cards"

**Status**: [Pending]

**Quote**:
> Reply: I agree with the intuition from Edelman et al. (2015) that consumers could in principle be better off without intermediation. Indeed, my model estimates imply that consumers are worse off by 13 billion dollars relative to an economy without payment methods.

**Feedback**:
At first “without payment methods” made me think the counterfactual was eliminating cash as well. Then the surrounding discussion (“without intermediation,” “full elimination,” and later “world without cards”) made clear that the intended comparison is to a world without cards or card intermediation. The wording here should be tightened because, under the paper’s notation, cash is itself a payment method.

---

### 39. Missing footnote in Section III.A

**Status**: [Pending]

**Quote**:
> Expositional clarification. A footnote in Section III.A now notes that the results are weaker once I include the full sample of debit card payment volumes.

**Feedback**:
I initially had trouble locating the promised Section III.A footnote on the total-debit robustness. The sensitivity appears in Appendix OC.1.1, but in the visible main-text extract I did not see a clear pointer to it. If that footnote is not already in the source file, a brief cross-reference in Section III.A would align the manuscript with the response letter.

---

### 40. Contradictory reference to the number of retailers

**Status**: [Pending]

**Quote**:
> I satisfy this restriction by pooling the two events so that neither retailer's series appears in isolation. Second, retailer identities must remain anonymous in the published paper, which is why the main text refers to "a large grocer" rather than naming the retailers.

**Feedback**:
I initially had trouble with the disclosure explanation because this reply mentions pooling two events so that neither retailer appears on its own, but then says the main text refers to "a large grocer." However, after reading the broader discussion, I understood that the analysis uses multiple grocery adoption events and that the issue here is anonymization rather than a truly single-retailer design. Still, this sentence can be read as implying one merchant, so it would be helpful to clarify explicitly that the pooled evidence comes from two anonymous grocers/retailers.

---

### 41. Notation for demeaned income in random coefficient

**Status**: [Pending]

**Quote**:
> Reply: I address these two comments together. The model allows unobserved utility to vary with consumer income through two channels. First, the random coefficient on card characteristics, $\beta_{i} \sim N\left(\beta_{y} \cdot \log y, \Sigma\right)$, means higher-income consumers have systematically different preferences for card characteristics. This allows the model to match average income differences between credit, debit, and cash users.

**Feedback**:
At first $\beta_i \sim N(\beta_y \cdot \log y,\Sigma)$ made me think the response was using raw log income rather than the paper's demeaned $\log \tilde y$. Then I understood that the point here is simply that the mean of the random coefficient varies with income. Still, matching the paper's notation would avoid suggesting a different normalization.

---

### 42. Unclear terminology: "verticality" of payment acceptance

**Status**: [Pending]

**Quote**:
> I use the Yelp Open Dataset (reviews mainly from 2010-2018) to document the verticality of merchant payment acceptance. I identify cash-only reviews with regular expressions ("cash only" or "only...cash"), then flag reviews discussing card acceptance with keywords such as "accept," "take," "took," and "bring."

**Feedback**:
At first “verticality of merchant payment acceptance” made me think the Yelp exercise was about vertical differentiation across payment methods. Then I understood from the later discussion of hierarchical card acceptance that the object here is the nested ordering of merchants’ acceptance sets. A brief clarification would help align OB.2 with the terminology used elsewhere in the paper.

---
