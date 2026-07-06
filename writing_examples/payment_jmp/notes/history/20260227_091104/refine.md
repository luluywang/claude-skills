# Regulating Competing Payment Networks

**Date**: 2/17/2026, 3:32:59 PM
**Domain**: social_sciences/economics
**Taxonomy**: academic/research_paper
**Filter**: Active comments

---

## Overall Feedback

Here are some overall reactions to the document.

**Interpretation of the "Credit Aversion" channel**

The welfare analysis places significant weight on the "Credit Aversion" channel (+$44B in Table 6), which appears to drive the headline conclusion that fee caps raise welfare by $30 billion. This result relies heavily on interpreting the estimated non-pecuniary term $\Gamma$ as a *real social cost*—"These nonpecuniary costs…are real economic costs" (VI.A.3)—rather than a residual for unobserved constraints or tastes. Furthermore, the magnitude seems effectively determined by the point-of-sale segmentation assumption that consumers who desire credit "pay with cash—not debit—if credit is unavailable" (IV.B.1; IV.C.2).

Given that the welfare narrative hinges on interpreting $\Gamma$ as deadweight loss, the paper would benefit from a "minimal-assumption" presentation. It would be valuable to see how much of the policy ranking survives if $\Gamma$ is reinterpreted purely as a constraint (despite the discussion in IV.F) or if the point-of-sale substitution patterns are relaxed to allow credit-to-debit switching.

**Extrapolation of merchant-side primitives**

The merchant block is load-bearing for the equilibrium fees and the general-equilibrium retail-price channel (+$101B in Table 6). However, the key identifying variation comes from a small set of grocery chains in Homescan (III.B), which are explicitly described as "a highly selected group" and "closer to a calibration exercise than a conventional estimation" (V.A.3). The current approach treats these grocers as "just on the margin" to pin down the marginal $\gamma$ and sets the CES $\sigma$ to ensure indifference.

Because the resulting retail-price channel is so large in dollar terms, the policy magnitudes inherit any extrapolation error from this specific grocery subset to the broader economy (restaurants, services, e-commerce). The credibility of the counterfactuals would be strengthened by validating these inferred acceptance events against independent measures where possible. Additionally, reporting welfare ranges under transparent reweighting or bounding exercises for $G(\gamma)$ that reflect sectoral heterogeneity would help address concerns about the representativeness of the Homescan grocers.

**Separating bundled issuer responses from reward sensitivity**

There appears to be a tension between the reduced-form evidence and the structural identification of $\alpha_0$. The text notes that the Durbin diff-in-diff captures banks' "full behavioral response...including adjustments to rewards and other non-price characteristics such as advertising and bank teller sales incentives" (III.A). However, the structural estimation maps this total response entirely to the consumer reward-sensitivity parameter $\alpha_0$ by matching a 25bp "reward shock" (V.A.1).

If the Durbin response reflects bundled marketing or service changes rather than pure curvature with respect to rewards, $\alpha_0$ may be overstated. This matters for the central mechanism: an overstated $\alpha_0$ mechanically amplifies "excessive rewards" and the welfare-reducing effect of competition. It would be helpful to see a cleaner decomposition between the issuer-side "subsidy lever" elasticity and the preference parameter. Tighter bounding using within-card reward variation—such as the Discover quarterly programs discussed in OA.3—might provide a conceptually closer moment to discipline this parameter.

**Discipline on pass-through and price coherence**

The welfare accounting is dominated by general-equilibrium retail price effects ($101B) rather than direct reward transfers. Currently, pass-through seems governed by the CES functional form (IV.C.1) rather than empirical discipline, with the paper acknowledging it is not "estimated directly" (IV.F). While OA.6.1 brackets "full vs zero" pass-through, the binary nature of this check may be too coarse for a policy paper where the sign of the welfare effect depends on incidence.

Since the qualitative claims (fee caps large; competition potentially reducing welfare) depend on this incidence, the analysis would be stronger if it explored intermediate degrees of pass-through or partial coherence. Connecting the implies pass-through to any feasible in-sample evidence, or simply reporting structured sensitivity over plausible intermediate ranges, would clarify how robust the $30B headline is to the CES structure.

**Network conduct and equilibrium selection in the monopoly counterfactual**

The conclusion that "a merger to monopoly would increase total welfare by $16 billion" (Abstract; VI.D) is a striking result. Structurally, this turns on the conduct assumption that "networks set...transaction fees $\tau_j$ and...promised adoption utility" (IV.D.2), as well as equilibrium selection via trembles ($v_x=10^{-4}$) and FOC-based cost recovery (V.A.2).

Given that Visa and Mastercard do not literally set rewards on open-loop cards in the institutional reality, this counterfactual is sensitive to the vertical objective function. It would be useful to stress-test this result by keeping the empirical discipline fixed but varying the conduct mapping (e.g., networks set merchant fees while issuers set rewards). Showing how the monopoly-vs-competition ranking behaves under different tremble variances or cost-recovery inversions would make this counterfactual more persuasive.

**Status**: [Pending]

---

## Detailed Comments (65)

### 1. Inconsistent welfare estimates across tables

**Status**: [Pending]

**Quote**:
> Fee caps raise total welfare by \$30B (SE \$4B), essentially identical to the \$29B baseline (Table OA.17).

**Feedback**:
There appear to be internal inconsistencies in reported welfare totals across OA.6.3 and the appendix tables. In OA.6.3 the text reports a $\$30$Bn total-welfare gain for the constrained model and cites Table OA.17, but Table OA.17’s “Total” under “Cap Fees” is $\$37$Bn. Table OA.20’s cross-specification summary also reports baseline/constrained totals that do not match the main-table baseline figures. It would be good to reconcile the welfare numbers (and ensure scenario labels/baselines are consistent) across the text, the detailed OA tables, and the summary table.

---

### 2. Inconsistent definition of multi-homing pecuniary utility

**Status**: [Pending]

**Quote**:
> Pecuniary utility for multi-homing agents is defined to be the weighted average of the single-homing pecuniary utilities of the cards in their wallet. Thus
$$
\log U^{w}=\pi \log U^{\left(w_{1}, 0\right)}+(1-\pi) \log U^{\left(w_{2}, 0\right)}, w=\left(w_{1}, w_{2}\right) \in \mathcal{J}_{1} \times \mathcal{J}, w_{1} \neq w_{2}
$$

**Feedback**:
The adoption-stage definition of multi-homer pecuniary utility as $\log U^{w}=\pi \log U^{(w_{1},0)}+(1-\pi)\log U^{(w_{2},0)}$ is hard to reconcile with the earlier CES microfoundation in which a wallet-specific price index $P^{w}$ is defined for general wallets via $(1+\gamma v_{M}^{w})$. Under the point-of-sale model, a two-card wallet can have “union acceptance” value that would naturally enter through $P^{(w_{1},w_{2})}$, not a weighted average of the single-card indices. If this weighted-average form is an approximation (e.g., because acceptance gaps are empirically small) or reflects a different microfoundation (e.g., transaction-type aggregation with fixed shares), it would help to make that interpretation explicit and clarify its implications for the value of multi-homing when acceptance differs across cards.

---

### 3. Numerical inconsistencies in counterfactual results

**Status**: [Pending]

**Quote**:
> Under monopoly, credit card rewards fall 146 bps, merchant fees rise 29 bps, debit card rewards also fall, forcing consumer payment to use debit. Consumers substitute cards for cash. Total fees and rewards decline by \$52 and \$77 billion, respectively. Reducing credit card use lowers retail prices for all consumers, whereas reducing rewards mainly affects high-income consumers. Thus, low-income consumers experience a 10 bp increase in consumption, whereas high-income consumers experience a 15 bp loss.

Competition modestly helps consumers (\$6B welfare gain) but slashes network profits (\$29B).

**Feedback**:
The counterfactual numerics reported in the main-text discussion (VI.B–VI.E, including the quoted VI.D monopoly/competition paragraph) do not match the corresponding entries in Tables 5 and 6, with discrepancies that appear too large to be rounding. This makes it unclear which magnitudes are intended for interpretation (e.g., changes in rewards/fees and the implied welfare differences between Baseline and Monopoly, as well as the dual-routing and public-option magnitudes). The text and tables should be reconciled, or any definitional differences made explicit.

---

### 4. Contradiction in microfoundation of segmentation

**Status**: [Pending]

**Quote**:
> For single-homers, some transactions use a less-preferred card type.

**Feedback**:
The usage-stage microfoundation in OA.1.2 is potentially hard to reconcile with the baseline point-of-sale segmentation rule. In particular, “For single-homers, some transactions use a less-preferred card type” (together with the preceding bullets about using an “available substitute” when the preferred type is not in the wallet) can be read as implying that the non-preferred type sometimes dominates cash. If so, it is not clear why a credit–debit multi-homer facing non-acceptance of the preferred type would use cash rather than the other card type, as imposed in Section IV.B.1/Figure 6. It would help to clarify how OA.1.2 is meant to map to the acceptance-contingent payment rule in the baseline (versus being a more limited illustration about adoption vs. usage and reward sensitivity).

---

### 5. Contradiction in "Halved Reward Sensitivity" robustness check

**Status**: [Pending]

**Quote**:
> This specification halves the weight on the Durbin moment in estimation to bound consequences if the event study overstates reward sensitivity.

Reward sensitivity falls from 6.74 to 5.92 (Table OA.18).

**Feedback**:
The robustness check labeled “Halved Reward Sensitivity” is described as halving the GMM weight on the Durbin moment, and it yields $\alpha_0$ moving from 6.74 to 5.92. This is informative as a reweighting/identification exercise, but it is easy to misread as a counterfactual where reward sensitivity itself is forced to be 50% lower. If the intent is to bound outcomes under substantially lower $\alpha_0$, it would help to more clearly distinguish “halving the Durbin moment weight” from “imposing half the baseline reward sensitivity,” especially since the latter phrasing also appears in the response material.

---

### 6. Inconsistency in rewards budget constraint regarding non-accepting merchants

**Status**: [Pending]

**Quote**:
> The consumer receives percentage rewards $f^{w}$ on card purchases, which augments total expenditure: $E^{w}= y+f^{w} \cdot E^{w}$, so $E^{w} \approx y\left(1+f^{w}\right)$ for small $f^{w}$. The consumer maximizes CES utility subject to spending no more than $y\left(1+f^{w}\right)$.

**Feedback**:
The reply’s CES microfoundation uses $E^{w}= y+f^{w} \cdot E^{w}$, which (as written) applies rewards at rate $f^{w}$ to the full expenditure aggregate $E^{w}$. With limited merchant acceptance, “percentage rewards on card purchases” would instead suggest a constraint like $E^{w}=y+f^{w}\cdot E^{w}_{\text{card}}$, where $E^{w}_{\text{card}}$ depends on the acceptance environment. Clarifying whether this step is an approximation (e.g., near-universal acceptance) or whether $f^{w}$ is meant to be an acceptance-adjusted effective reward rate would help, since otherwise the derivation tends to make rewards enter indirect utility separably from acceptance (via $P^{w}$) even when acceptance is low.

---

### 7. Arithmetic contradiction and inconsistency with reported results

**Status**: [Pending]

**Quote**:
> Credit card fees decline by 17 basis points (SE 3.8), and credit card rewards decline by 38 basis points (SE 8). ... This gain reflects lower retail prices ( $+\$ 16$ billion from reduced merchant fee passthrough) that more than offset the lost rewards (- \$23 billion).

**Feedback**:
The quoted welfare accounting is internally inconsistent: a $+\$16$B retail-price gain cannot “more than offset” a $-\$23$B rewards loss. If consumer welfare nevertheless rises (e.g., due to credit-aversion or other channels), that should be reflected in the attribution.

Relatedly, the reported Dual Routing magnitudes in the text (fees −17 bps, rewards −38 bps, consumer welfare +$\$9$B, decomposition +$\$16$B/−$\$23$B) appear inconsistent with the Dual Routing figures shown elsewhere in the manuscript (e.g., Table 5/6 and the introduction report smaller fee/reward changes and different dollar decompositions). These results should be reconciled so the narrative, tables, and welfare decomposition correspond to the same counterfactual implementation.

---

### 8. Incorrect aggregation of second-choice probabilities

**Status**: [Pending]

**Quote**:
> The model analogs remove all credit (debit) wallets from the choice set and compute the share that switches to cash:

$$
P(\text { cash } \mid \text { no credit })=\frac{\int \sum_{w \in \mathcal{W}_{C}} \tilde{\mu}_{y}^{w} \cdot \frac{\tilde{\mu}_{y}^{(0,0)}}{\sum_{m \notin \mathcal{W}_{C}} \tilde{\mu}_{y}^{m}} \mathrm{~d} F(y)}{\int \sum_{w \in \mathcal{W}_{C}} \tilde{\mu}_{y}^{w} \mathrm{~d} F(y)}
$$

**Feedback**:
The displayed diversion moment for $P(\text{cash}\mid \text{no credit})$ is potentially inconsistent with the mixed-logit structure if $\tilde{\mu}_y^w$ is interpreted as the share already integrated over random coefficients. In a random-coefficients logit, the correct counterfactual after removing credit wallets renormalizes choice probabilities at the individual/draw level and then averages; renormalizing *aggregate* shares (a ratio-of-integrals form) generally does not preserve this and effectively reintroduces an IIA-style aggregation. It would help to clarify whether this moment is computed draw-by-draw (and then integrated over heterogeneity/income), or whether the formula is meant literally as written.

---

### 9. Discrepancy between text and table in Social Optimum

**Status**: [Pending]

**Quote**:
> The planner sets credit merchant fees at 30 bps (Table OA.22), identical to the fee cap and equal to the estimated cost of cash. Credit rewards are -68 bps (vs. -77 bps under the cap). For debit, optimal rewards are -6 bps compared to -37 bps under the status quo and fee cap.

**Feedback**:
The social-optimum paragraph reports credit and debit reward values “(Table OA.22)” that do not match the “Social Optimum” reward rates shown in Table OA.22 (e.g., credit rewards reported as -68 bps in the text versus 2 bps in the table). In addition, the statement “Networks must break even: transaction fee revenue equals reward payments” is easy to misinterpret given positive processing costs and the reported network-profit row. It would help to reconcile the text/table numbers and to clarify the exact break-even constraint and the definition of “Reward Rates (bps)” used in Table OA.22.

---

### 10. Discrepancy in Uncap Debit counterfactual results

**Status**: [Pending]

**Quote**:
> Under this scenario, networks would reduce merchant fees. Credit card rewards and fees would fall 26 and 6 bps respectively. The net effect is that repealing the Durbin Amendment reduces total merchant fees and rewards by \$2.6 and \$11 billion, respectively.

**Feedback**:
The “Uncap Debit” counterfactual in VI.B appears inconsistent with the tabulated results. The text reports that credit rewards/fees fall by 26 and 6 bps and that total fees/rewards fall by \$2.6B and \$11B, but Table 5’s “Uncap Debit” column shows much smaller credit-side changes (on the order of -6 and -3.3 bps), and Table 6’s “Uncap Debit” column reports different \$Bn totals (and even different signs) for total fees/rewards. Please reconcile the VI.B narrative with the specific “Uncap Debit” counterfactual reported in Tables 5–6.

---

### 11. Response does not address the specific counterfactual requested

**Status**: [Pending]

**Quote**:
> The author has an opening to do exactly this by running the monopoly counterfactual under alternative assumptions regarding consumer multihoming. ... Reply: This was a very helpful suggestion ... I have added a new counterfactual, "Dual Routing," which examines how increased consumer multihoming affects equilibrium fees

**Feedback**:
The quoted suggestion asks for an interaction exercise—evaluating the monopoly counterfactual under alternative consumer multihoming assumptions—to see how the welfare effects of monopolization depend on multihoming. The added “Dual Routing” counterfactual instead changes multihoming holding the competitive market structure fixed. That is informative, but it does not directly answer how the monopoly-vs-competition comparison changes when multihoming is higher (or lower). It would help to either report that interaction (monopoly under the alternative multihoming regime) or clearly acknowledge that the new counterfactual addresses a related but different question.

---

### 12. Identification argument obscures parameter bias

**Status**: [Pending]

**Quote**:
> As discussed in Section IV.F, fixed costs cannot be identified separately from heterogeneity in sales benefits $(\gamma)$ without exogenous variation in consumer card adoption that shifts merchant acceptance. This is a limitation of the approach that I now acknowledge explicitly.

**Feedback**:
Normalizing away merchant fixed acceptance costs is not innocuous for counterfactual acceptance dynamics: fixed costs can generate threshold effects that may amplify “fragility” of acceptance to fee changes even if they are not separately identified from heterogeneity in acceptance benefits $(\gamma)$. It would be useful to clarify what aspects of merchant-side profitability are effectively being normalized/absorbed when fixed costs are set to zero, and what this implies (or does not imply) for the sensitivity of acceptance/disintermediation to fee reductions. The direction of any induced bias in $\gamma$ or in acceptance sensitivity is not obvious from the current discussion.

---

### 13. Mismatch between text and table in Monopoly counterfactual

**Status**: [Pending]

**Quote**:
> Under monopoly, credit card rewards fall 146 bps, merchant fees rise 29 bps, debit card rewards also fall, forcing consumer payment to use debit. Consumers substitute cards for cash. Total fees and rewards decline by \$52 and \$77 billion, respectively.

**Feedback**:
The numerical narrative for the Monopoly counterfactual in Section VI.D does not match the “Monopoly” results reported in Tables 5 and 6. For example, the text cites a 146 bps fall in credit rewards and a 29 bps rise in credit fees, while Table 5 reports about $-90$ bps for credit rewards and $+36$ bps for credit fees. The text also reports declines in total fees/rewards of \$52B/\$77B, while Table 6 reports about \$40B/\$66B. Relatedly, other VI.D statements about consumer and total welfare under competition vs monopoly appear inconsistent with Table 6. This section likely needs to be reconciled with the current table definitions and numbers.

---

### 14. Merchant profit function derivation

**Status**: [Pending]

**Quote**:
> Merchants maximize profits by choosing prices and payment acceptance. Profits equal per-dollar quantities $q^{w}$ multiplied by margins, weighted by the spending power of consumers with different payment preferences. Appendix B. 2 shows that merchant profits equal

$$
\begin{aligned}
\Pi(\gamma, p, M) & =\sum_{w \in \mathcal{W}} \tilde{\mu}^{w} \times q^{w}(\gamma, p, M, 1) \times\left[p\left(1-\frac{(1+\gamma) \tau_{M}^{w}}{1+\gamma v_{M}^{w}}\right)-1\right] \\
\tilde{\mu}^{w} & =\int \tilde{\mu}_{y}^{w} y \mathrm{~d} F(y)
\end{aligned}
$$

where $\tilde{\mu}_{y}^{w}$ is the market share of wallet $w$ among consumers with baseline income $y$, $F$ is the distribution of income, $\tau_{j}$ is the per-dollar fee for transactions on card $j$, and $\tau_{M}^{w}=\sum_{j=1}^{J} \pi_{M, j}^{w} \tau_{j}$ is the average fee associated with a wallet $w$ consumer at a merchant with type $\gamma=0$.

**Feedback**:

The merchant profit expression in IV.C features a margin term $p\left(1-\frac{(1+\gamma)\tau_M^w}{1+\gamma v_M^w}\right)-1$, so γ enters the effective fee burden. While Appendix B.2 appears to contain a derivation consistent with this form (via the CES/quality microfoundation and the distinction between total demand $(1+\gamma v_M^w)$ and the incidence of fee-paying card transactions), the economic/algebraic logic for the adjustment factor $(1+\gamma)/(1+\gamma v_M^w)$ is not transparent in the main text. It would help to more clearly explain how the fee term relates to card-paid revenue versus total revenue, and to clarify the definition of $\tau_M^w$ (including the potentially confusing reference to “$\gamma=0$”).

---

### 15. Mismatched values in Monopoly counterfactual description

**Status**: [Pending]

**Quote**:
> Under monopoly, credit card rewards fall 146 bps, merchant fees rise 29 bps, debit card rewards also fall, forcing consumer payment to use debit. Consumers substitute cards for cash. Total fees and rewards decline by \$52 and \$77 billion, respectively.

**Feedback**:
The Monopoly counterfactual description in VI.D appears numerically out of sync with the monopoly results reported in Tables 5–6. Several objects in the text (e.g., the stated changes in credit fees/rewards in bps, the \$Bn changes in total fees/rewards, and the implied consumer/total welfare differences when comparing competition to monopoly) do not match the corresponding monopoly column entries in the tables. Please reconcile which monopoly results the text is describing and ensure the narrative matches the tabulated counterfactual.

---

### 16. Contradiction in definition and formula for adjustment term $\iota$

**Status**: [Pending]

**Quote**:
> The adjustment term $\iota$ calculates the expected number of respondents who would report switching to the same card type but stay on the same network:
$$
\iota=\sum_{i=1}^{N} S_{i, 3} \times\left(1-\left(\sum_{k \in\{\mathrm{Visa}, \mathrm{MC}\}} n_{b_{i}}^{k, t_{i}} \times\left(\frac{1}{\left|\mathcal{C}_{i}\right|} \sum_{j \in \mathcal{C}_{i}} n_{j}^{k, t_{i}}\right)\right)\right)
$$

**Feedback**:
In OA.2.2 there is an internal inconsistency between the verbal definition of $\iota$ (“stay on the same network”) and the displayed formula, which (because of the $1-(\cdot)$ term) appears to compute the probability of switching networks rather than staying. Relatedly, the subsequent moment uses “$l$” (not $\iota$), making it unclear which quantity is being subtracted in $\frac{\sum_i S_{i,3}-l}{N-l}$. Also, the definition of $t_i$ as “(Visa or Mastercard)” conflicts with the definition of $n_j^{k,t}$ as the share of type-$t$ cards “(credit/debit)” on network $k$; with $k\in\{\mathrm{Visa},\mathrm{MC}\}$ already indexing networks, $t$ seems intended to index credit vs debit.

---

### 17. Incorrect order-of-magnitude reasoning in welfare derivation

**Status**: [Pending]

**Quote**:
> Since payment share changes $\partial \mu_{j k} / \partial \tau_{m}$ are proportional to fee levels $\tau$ (consumers substitute away from more expensive payment methods), and baseline fees $\tau_{k}$ appear multiplicatively, this term is of order $\tau^{2}$.

**Feedback**:
The order-of-magnitude argument in this sentence seems too strong as stated. In the second term $\mathbb{E}_{R}\!\left[\mu_{j l} \times \sum_{k} \frac{\partial \mu_{j k}}{\partial \tau_{m}} \tau_{k}\right]$, the fact that $\tau_k$ appears multiplicatively only implies the term is small if $\frac{\partial \mu_{jk}}{\partial \tau_m}$ is itself $O(\tau)$; but in many standard share systems $\partial \mu/\partial \tau$ need not vanish as $\tau\to 0$ (so the term would be $O(\tau)$ rather than $O(\tau^2)$). If the intent is instead that the *share change* $\Delta \mu$ induced by a small fee change is $O(\tau)$, that should be clarified, or the justification weakened to “small because it is multiplied by small baseline fees (and/or because $\mu$ responds weakly).” A brief statement of the expansion point/assumptions under which the $O(\tau^2)$ claim holds would help.

---

### 18. Identical parameter estimates for structurally different pricing models

**Status**: [Pending]

**Quote**:
> Table OA. 11 shows that the estimated parameters are largely unchanged relative to the baseline.\n\nThe main difference of the no-passthrough results is that consumers no longer benefit from lower merchant fees. Instead, the savings are transferred to the merchants in the form of higher profits.

**Feedback**:
The “No Passthrough” re-estimation in OA.6.1 yields merchant parameters (notably Merchant CES and average $\gamma$) that are essentially identical to baseline to two decimals. This may be correct if those parameters are identified largely from moments that are (approximately) invariant to the pricing-rule change (e.g., because acceptance depends only second-order on the pricing rule, as suggested by the envelope-theorem discussion). But as written it is easy to wonder whether the merchant-side identification truly remains unchanged or whether this reflects rounding/a reporting artifact. It would help to clarify why $(\sigma,\gamma)$ are expected to be nearly invariant to removing the pass-through term and to confirm that the parameters were re-estimated under the altered pricing equation.

---

### 19. Mismatch between text and table in Durbin counterfactual

**Status**: [Pending]

**Quote**:
> Credit card rewards and fees would fall 26 and 6 bps respectively. The net effect is that repealing the Durbin Amendment reduces total merchant fees and rewards by \$2.6 and \$11 billion, respectively.

**Feedback**:
The numerical summary of the “Uncap Debit” (Durbin repeal) counterfactual in Section VI.B does not match Tables 5 and 6. The text reports that credit rewards and fees fall by 26 and 6 bps and that total fees and rewards fall by \$2.6B and \$11B, but Table 5 reports much smaller changes for credit (Credit Fees about $-3.3$ bps; Credit Rewards about $-6$ bps), and Table 6 reports a positive change in Total Fees (about $+4.4$) and Total Rewards (about $+0.5$). This looks like the narrative is keyed to different results/definitions than the reported tables and should be reconciled.

---

### 20. Logic of conservative sorting estimates

**Status**: [Pending]

**Quote**:
> To construct payment shares at each merchant, I assume consumers use their preferred payment method at each store, equating a store's payment mix with the mix of consumer preferences among its shoppers... While consumers may strategically vary payment methods across purchases (e.g., using credit for large transactions), such within-consumer variation would reduce measured sorting, making our estimates conservative. Any measurement error that overstates sorting would bias our findings toward rejecting the integrated economy assumption, strengthening the conclusion that redistribution remains substantial.

**Feedback**:
The claim that “within-consumer variation would reduce measured sorting, making our estimates conservative” seems to require additional assumptions. With MRI, merchant payment shares are imputed from the mix of shoppers’ primary payment preferences; if consumers’ payment method varies systematically across merchants/transaction types (e.g., credit at big-ticket merchants and cash/debit at small-ticket merchants), imputing “preferred method at each store” could mechanically attenuate cross-merchant dispersion in payment shares and push the covariance terms toward zero, which would bias the sufficient-statistic exercise toward finding an integrated economy. It would help to clarify under what conditions the imputation is conservative (or acknowledge that the direction of bias is ambiguous) and how this interacts with the Homescan transaction-level evidence.

---

### 21. Inconsistency in welfare decomposition formula

**Status**: [Pending]

**Quote**:
> Consumer surplus then decomposes into five channels:
$$
\begin{aligned}
\mathrm{CS}= & \underbrace{\left(-\log P^{0}\right) \cdot \bar{y}}_{\text {Retail Prices }}+\underbrace{\sum_{w} \tilde{\mu}^{w} f^{w} \cdot \bar{y}}_{\text {Rewards }}+\underbrace{\sum_{w} \tilde{\mu}^{w}\left(-\left(\log P^{w}-\log P^{0}\right)\right) \cdot \bar{y}}_{\text {Payment Convenience }} \\
& +\underbrace{\sum_{w} \frac{\tilde{\mu}^{w}}{\alpha_{0}} \bar{\Gamma}_{y}^{w} \cdot \bar{y}}_{\text {Credit Aversion }}+\underbrace{\sum_{w} \frac{1}{\alpha_{0}} \mathbb{E}\left[E_{i}^{w} \tilde{\Gamma}_{i}^{w}\right] \cdot \bar{y}}_{\text {Option Value }}
\end{aligned}
$$
where $P^{0}$ is the cash-only price index, $\tilde{\mu}^{w}$ are income-conditional wallet shares, $f^{w}$ is the rewards rate for wallet $w,-\left(\log P^{w}-\log P^{0}\right)$ measures the payment convenience of wallet $w$ (the price benefit from merchant card acceptance), $\bar{\Gamma}_{y}^{w}$ captures the mean non-pecuniary utility of wallet $w$ at income $y, \tilde{\Gamma}_{i}^{w}$ captures the idiosyncratic component (including $\epsilon$-shocks), and $\bar{y}$ denotes income-weighted integration $\int(\cdot) y \mathrm{~d} F(y)$.

**Feedback**:
The main-text welfare decomposition equation appears to suppress income dependence in the utils-to-dollars scaling for the non-pecuniary channels: with income-varying reward sensitivity $\alpha_i$, the aggregation of terms involving $\bar{\Gamma}_y^w$ and $\tilde{\Gamma}_i^w$ should reflect $1/\alpha_i$ (and the associated income-weighting adjustments), as in the formal derivation in Appendix B.4. As written, the main-text formula’s use of $1/\alpha_0$ and $\bar y=\int(\cdot)\,y\,dF(y)$ risks implying a different weighting than the appendix and the computations underlying Table 6.

---

### 22. Contradiction between text and Table OA.14 regarding welfare gains

**Status**: [Pending]

**Quote**:
> Fee caps raise total welfare by \$8B (SE \$2B), compared to \$29B baseline (Table OA.14). The status quo is less distorted under free substitution: consumers facing high fees shift to debit rather than to cash or shopping elsewhere, partially self-correcting the welfare cost.

**Feedback**:
There appears to be a numerical inconsistency between the OA.6.2 text and Table OA.14. The text states that under the extension “Fee caps raise total welfare by \$8B (SE \$2B)” and that the retail price channel is about \$83B, but Table OA.14’s “Cap Fees” counterfactual reports “Total” welfare of 23 (SE 3.0) and “Retail Prices” of 68 (SE 0.2). This also affects the interpretation that the baseline and extension “bracket” the welfare gain. Please reconcile which run/specification the table corresponds to and ensure the text references the same object/units.

---

### 23. Non-responsive reply regarding sample composition in Figure 5

**Status**: [Pending]

**Quote**:
> Reply: The Discover event study in Appendix OA.3.2 addresses this concern directly. The analysis conditions on Discover cardholders and compares their shopping and payment behavior at grocery stores versus discount and warehouse stores during quarters when grocery stores do and do not offer Discover cashback.

**Feedback**:
The reply states that the Discover event study “addresses this concern directly,” but it does not speak to the specific heterogeneity mechanism raised in the footnote (Discover cardholders who are credit-single-homers versus those who also hold/use other credit cards). Conditioning on “Discover cardholders” alone does not show whether a meaningful share of the sample can substitute away from Discover without going to debit/cash, nor whether the event-study estimates differ across these subgroups. It would strengthen the interpretation to document the share of Discover households observed with only Discover+debit (no other credit network) and/or to show that the results are similar when restricting to Discover households observed using another credit card.

---

### 24. Inconsistency in merchant fee sensitivity magnitudes

**Status**: [Pending]

**Quote**:
> In contrast, merchant acceptance is fee-insensitive. A 1-bp increase in Visa's merchant fees, holding fixed consumer adoption decisions, leads to only a 0.4% decrease in the share of merchants that accept that card (S.E. 0.3%). This asymmetry drives high fees and rewards.

**Feedback**:
The headline merchant fee sensitivity in V.B (a 1-bp Visa fee increase implies a 0.4% decline in the share of merchants accepting Visa, holding consumer adoption fixed) is easy to misread as being directly comparable to the OptBlue validation in V.C.2 (a 15-bp AmEx relative-fee cut closes the AmEx–Visa acceptance gap by 15.8 pp). As written, a reader could interpret these as implying materially different “per-bp” acceptance responses.

It would help to more explicitly reconcile these objects: V.B appears to be an own-fee semi-elasticity for unconditional Visa acceptance (a near-saturated margin in 2019), while OptBlue is a relative-fee shock affecting AmEx incremental acceptance conditional on Visa acceptance (a different margin that can be much steeper, especially with cross-network effects). Also, V.B is in percent changes whereas OptBlue is in percentage points, so the mapping depends on baseline acceptance levels and the exact conditioning (e.g., whether consumer adoption is held fixed in the OptBlue simulation).

---

### 25. Economic logic of debit acceptance in the extension

**Status**: [Pending]

**Quote**:
> I estimate an alternative model specification that allows debit-credit substitution at the point of sale while imposing that debit cards do not generate incremental sales relative to cash. This alternative recovers lower merchant margins but yields qualitatively similar counterfactual predictions.

**Feedback**:
The extension is described as allowing POS debit–credit substitution while imposing that debit generates no incremental sales relative to cash. Taken literally, with debit fees above the cost of cash, this seems to make debit acceptance privately dominated for merchants (accepting debit raises transaction costs without increasing demand). It would help to clarify what exactly is set to zero in the extension (e.g., a particular “acceptance-driven demand boost” channel), and how the extension avoids implying corner solutions with negligible debit acceptance (or whether debit acceptance is treated as effectively fixed / not a key equilibrium margin in that robustness exercise).

---

### 26. Contradictory logic regarding debit sales benefits in extension

**Status**: [Pending]

**Quote**:
> In the extension, consumers freely substitute between all cards in their wallet regardless of type, changing the payment value $v_{M}^{w}$ in Eq. 4. Because accepting any card now captures sales from all card holders, debit acceptance no longer generates incremental sales relative to credit; the debit sales benefit is set to zero.

**Feedback**:
The extension’s description is potentially ambiguous about what exactly is being set to zero. The sentence “the debit sales benefit is set to zero” can be read as eliminating any incremental demand benefit from debit acceptance (relative to cash), which—given positive debit costs—would seem to make voluntary debit acceptance hard to rationalize. If instead the intent is that debit provides no *additional* incremental sales relative to already accepting credit (or that a debit-specific demand-boost parameter is normalized to zero), that distinction should be made explicit here, along with a brief explanation of how the merchant acceptance incentives remain well-defined under the extension.

---

### 27. Circular reasoning in defense of reward sensitivity

**Status**: [Pending]

**Quote**:
> The relevant counterfactual, however, is what debit usage would have been absent the regulation. Section VI.B simulates repealing the debit fee cap: debit's market share rises substantially (Table 5, "Uncap Debit" column), consistent with reward-driven substitution away from debit under the current regime.

**Feedback**:
The response appears to use the “Uncap Debit” counterfactual as support for the claim that the Durbin-volume effects are reward-driven. Because that counterfactual is an implication of the estimated structural parameters (including the reward-sensitivity parameter whose identification is being questioned), it does not constitute independent validation and can read as circular. It would help to explicitly frame the simulation as conditional on the model and to lean more on the independent reduced-form mechanism/sensitivity evidence when responding to the identification critique.

---

### 28. Inconsistent magnitudes in distributional analysis

**Status**: [Pending]

**Quote**:
> Under this measure, low-income consumers (log income at-2 SD) increase consumption 50 bps; high-income consumers (log income at +2 SD) decrease consumption 200 bps. At an average level of household purchases of around $40,000 in 2023, ${ }^{16}$ this is a \$200 gain for each low-income household and a \$800 loss for each high-income household.

**Feedback**:
The distributional consumption changes reported in VI.A.2 (e.g., “low-income … +50 bps” and “high-income … −200 bps,” converted into \$200/\$800 per household) are hard to reconcile with the “Low/Medium/High income” \$Bn entries in Table 6 given the current description. It is unclear whether the text and table are using the same welfare/consumption object and the same aggregation/normalization (point evaluation at $y=\pm2$ SD vs an aggregate over an income group). Clarifying the exact mapping from the bps measures to the \$Bn figures would help, and would also confirm whether any numerical inconsistency is present.

---

### 29. Notation mismatch in payment value and fee definitions

**Status**: [Pending]

**Quote**:
> In general, it equals

$$
v_{M}^{w}=\sum_{j=1}^{J} \pi_{M, w_{j}}^{w} \kappa_{j}
$$

where $\kappa_{j} \in[0,1]$ governs the demand boost from accepting card $j$.

**Feedback**:
The definition of $v_M^w$ appears notationally inconsistent with the earlier definition of wallets as $w=(w_1,w_2)$ and payment-method indices $j\in\{1,\dots,J\}$. With a two-slot wallet, $w_j$ is undefined for $j>2$, so $\sum_{j=1}^J \pi_{M,w_j}^w\kappa_j$ is not well-formed as written. It seems the intended object is a probability-weighted average over payment methods (e.g., $\sum_{j=1}^J \pi_{M,j}^w\kappa_j$) or a sum over wallet slots with $\kappa$ indexed by the card in the slot; clarifying the indexing here (and in the analogous definitions of $\tau_M^w$ and $\tilde\tau_M^w$) would avoid confusion.

---

### 30. Discrepancy in credit card reward reduction figures

**Status**: [Pending]

**Quote**:
> Fee caps at the cost of cash—the "tourist test" motivating European regulations—raise total welfare by \$30 billion annually. Networks respond by cutting credit card rewards by 229 basis points.

**Feedback**:
The cap-fees counterfactual is described with inconsistent magnitudes across the paper. The Introduction states that networks cut credit card rewards by 229 bps, but the main counterfactual results (e.g., Table 5 “Cap Fees”) report a cut of about 199 bps (with the rest of the cap-fees discussion appearing consistent with the table). Please reconcile which number corresponds to the baseline “Cap Fees” scenario presented in the tables.

---

### 31. Discrepancy between Summary and Detailed Response

**Status**: [Pending]

**Quote**:
> 1. Reduced Form. I have addressed concerns about interpreting the Durbin Amendment evidence and the retailer event studies:
(a) I collected data on debit rewards programs and show that comparing debit card volumes at issuers who cut rewards versus those who did not results in a similar estimate of the effect of rewards on debit card usage. I respond to the concerns about the estimated elasticities by re-estimating the counterfactuals with half the baseline reward sensitivity.

**Feedback**:
The Summary of Main Changes states that two key additions address the Durbin interpretation/elasticity concern (the “issuers who cut rewards” comparison and re-estimation with reduced reward sensitivity), but the Referee 4-specific detailed reply in this excerpt does not mention or point to either exercise. Even if these analyses are now in the revised manuscript/online appendix, the Referee 4 response would be more persuasive if it explicitly signposted them as the direct rebuttal to the mechanism and magnitude skepticism.

---

### 32. Logic regarding predictions of substitution models

**Status**: [Pending]

**Quote**:
> A model that combines both substitution and incremental sales from debit cards generates two counterfactual predictions. First, reductions in debit card merchant fees should lower credit card acceptance-even if networks adjust rewards at the same time.

**Feedback**:
The claim that a model with POS substitution plus incremental sales from debit “should” imply that lower debit fees reduce credit acceptance seems stated too universally. The direction of the acceptance response generally depends on maintained primitives (e.g., how incremental-sales/quality effects differ across credit vs debit and how many merchants are near the acceptance margin). If the intended argument is that, under the paper’s contemplated “substitution + positive debit incremental-sales” setup, a debit-fee reduction raises the credit acceptance threshold (and hence tends to reduce credit acceptance), it would help to make that conditioning explicit and distinguish it from cases with strong credit-specific incremental sales (vertical differentiation) where credit acceptance might remain stable despite some substitution.

---

### 33. Logic of debit acceptance in alternative model

**Status**: [Pending]

**Quote**:
> I estimate an alternative model specification that allows debit-credit substitution at the point of sale while imposing that debit cards do not generate incremental sales relative to cash (i.e. the $\gamma$ for debit equals zero). This alternative recovers lower merchant margins but yields qualitatively similar counterfactual predictions.

**Feedback**:
The description of the debit–credit substitution extension is potentially confusing/internally ambiguous. In the baseline model $\gamma$ is a merchant-type parameter, whereas the card-specific “incremental sales” shifter in Appendix B.1 is $\kappa_j$; saying “the $\gamma$ for debit equals zero” makes it hard to map the restriction into the model. More importantly, under the extension’s point-of-sale substitution, debit acceptance need not be driven by an incremental sales boost relative to cash; it can instead be driven by payment-mix effects (e.g., accepting debit diverts transactions away from higher-fee credit among multi-card consumers). It would help to clarify, within the extension, what exactly is being set to zero and what margin rationalizes debit acceptance in equilibrium under that specification.

---

### 34. Contradiction between significance claim and reported statistics

**Status**: [Pending]

**Quote**:
> The results show no significant effect on grocery trip share (coefficient 0.002, SE 0.001) or log total trips (coefficient -0.004 , SE 0.003), indicating that Discover users do not increase their trips to grocery stores relative to non-Discover users during reward months.

**Feedback**:
The statement “no significant effect” seems inconsistent/ambiguous given the reported grocery trip share estimate (coefficient 0.002, SE 0.001). Taken literally, this implies a t-statistic around 2, and in Table OA.3 the corresponding coefficient is marked “+” (p<0.1), suggesting at least marginal significance under the paper’s own star convention. It would help to reconcile the text with the intended inference (e.g., whether this is only significant at 10% but not 5% due to rounding/clustering) and to separate statistical from economic significance, since even a statistically detectable 0.002 effect is extremely small relative to the large payment-share response.

---

### 35. Unaddressed query on competitive mechanics

**Status**: [Pending]

**Quote**:
> How does merchant competition in acceptance work if the benefit of accepting is the same for the first and last adopter?

Reply: I address these three related comments together. I agree that fixed costs of card acceptance are potentially important.

**Feedback**:
The response groups the merchant-competition question with the fixed-cost/fragility discussion, but the ensuing reply (in the excerpt shown) only addresses the identification of fixed costs. It would help to explicitly connect this question to the model’s merchant-competition mechanism (e.g., how acceptance affects relative demand through $v_M^w$ and the equilibrium price indices $P^w$) and to clarify whether the “first vs last adopter” framing is meaningful in the paper’s static equilibrium setting.

---

### 36. Potential overestimation of welfare effects due to unmodeled cash usage

**Status**: [Pending]

**Quote**:
> The main welfare channels-lower retail prices from reduced merchant fees, and lower rewards from reduced interchange-operate regardless of how often consumers pay with cash at individual transactions. The estimated value of card networks already reflects this: consumers adopt cards knowing cash remains available for any transaction, so the option value of occasional cash use is embedded in the observed adoption patterns that discipline the model.

**Feedback**:
I initially worried that treating “card users” as always paying by card could mechanically overstate the fee/reward base (and thus the dollar welfare magnitudes), given the Homescan fact that cardholders still use cash for a nontrivial share of purchases. However, after reading the counterfactual scaling and the stated targeting of aggregate spending shares/volumes, this does not seem to imply a simple $\approx 25\%$ inflation of aggregate welfare effects.

That said, the passage could still be interpreted as ruling out any quantitative relevance of within-cardholder cash usage. Since the baseline model abstracts from transaction-level cash preference shocks at merchants that accept cards, it would be helpful to clarify how aggregate card-dollar volume (and hence total fees/rewards and retail-price effects) is disciplined in the model, and to acknowledge that the “cash leakage” abstraction is primarily about within-wallet usage rather than the aggregate fee base.

---

### 37. Contradiction regarding data availability for income heterogeneity

**Status**: [Pending]

**Quote**:
> What the model does not capture is whether high-income consumers have systematically different preferences across specific networks like Visa, Mastercard, and Amex, because the most representative data with both income and payment choice (the Diary of Consumer Payment Choice) has limited AmEx coverage. ... Allowing $\Xi$ to also vary with income on top of $\beta_{y}$ and $\chi(y)$ would be difficult to identify-the data are not rich enough to distinguish income differences in baseline network preferences from the variation these other channels already capture.

**Feedback**:
It is somewhat unclear why the response frames income-by-network heterogeneity in $\Xi$ as infeasible mainly because DCPC has limited AmEx coverage, given that Homescan (used to identify $\chi_y^{lm}$) also contains income and large samples. If the intention is that Homescan is only informative about conditional multi-homing patterns (and is not representative for identifying income gradients in baseline network tastes—especially for AmEx, which Homescan underrepresents relative to aggregate shares), and/or that $\Xi(y)$ is weakly identified once $\beta_y$ and $\chi_y$ are included, that distinction would be worth making explicit.

---

### 38. Contradiction between credit aversion and segmentation

**Status**: [Pending]

**Quote**:
> Credit and debit are segmented. When consumers wish to use a credit card, they are not willing to substitute to debit (and vice-versa). ... The median consumer exhibits significant "credit aversion," requiring 1.2% in rewards to be indifferent between a Visa credit card and a Visa debit card.

**Feedback**:
The discussion of “credit aversion” (estimated debit-vs-credit non-pecuniary preference at the adoption stage) alongside “credit–debit segmentation” (limited point-of-sale substitution conditional on wanting to use a given card type for a transaction) risks sounding internally inconsistent. A reader could infer that if debit is intrinsically preferred to credit, then consumers whose credit is declined should generally switch to debit rather than cash, weakening the lost-sales mechanism behind merchant acceptance and potentially altering the welfare interpretation of “reduced credit aversion.” Even if the intended reconciliation is transaction-level heterogeneity (so adoption-level indifference can coexist with transaction-level segmentation), it would help to more explicitly connect these concepts and clarify which margin each object pertains to.

---

### 39. Inconsistent parameter count for merchant distribution

**Status**: [Pending]

**Quote**:
> The merchant-side parameters are: network marginal costs $c_{j}$ for five networks, merchant benefit distribution parameters ( $\bar{\gamma}, v_{\gamma}, \sigma_{\gamma}$ ), and additive fee adjustments for MC Credit and AmEx

**Feedback**:
Appendix C.4 lists “merchant benefit distribution parameters” as $(\bar{\gamma}, v_{\gamma}, \sigma_{\gamma})$, but the main text describes $G(\gamma)$ as a two-parameter Gamma distribution and Table 2 Panel C reports only mean and S.D. of $\gamma$ (with merchant CES $\sigma$ reported separately). As written, it is unclear what the third symbol $\sigma_{\gamma}$ represents (and whether it is redundant with $v_{\gamma}$ or is accidentally conflated with the merchant CES elasticity $\sigma$). This parameter accounting/notation should be made consistent across the appendix and main text.

---

### 40. Discrepancy in consumer welfare decomposition

**Status**: [Pending]

**Quote**:
> The net consumer welfare gain is +\$34 Bn, driven primarily by retail price reductions that benefit all consumers-including cash users who do not directly participate in the card market.

**Feedback**:
The response letter reports a consumer-welfare decomposition totaling +$\$34$Bn with specific component values, but Table 6 in the manuscript reports a different total consumer gain and slightly different component magnitudes. Even if the qualitative story is the same, it would be good to make the response letter’s decomposition numbers consistent with the current Table 6 (or otherwise clarify which set of figures is the final one) to avoid confusion.

---

### 41. Mechanism for consumer response to fees under price coherence

**Status**: [Pending]

**Quote**:
> The status quo is less distorted under free substitution: consumers facing high fees shift to debit rather than to cash or shopping elsewhere, partially self-correcting the welfare cost.

**Feedback**:
The mechanism in this sentence is hard to reconcile with price coherence as stated elsewhere in the paper. With uniform retail pricing, consumers do not directly observe merchant fees, so “consumers facing high fees shift to debit” could be misread as implying fee salience or payment-specific prices. If the intended mechanism is instead indirect (e.g., high-fee credit being less available due to merchant acceptance/steering incentives under the free-substitution specification, so consumers can complete transactions with debit rather than diverting to cash/other merchants), it would help to state that more explicitly.

---

### 42. Logical inconsistency in data disclosure justification

**Status**: [Pending]

**Quote**:
> To be clear, the event study puts most of the weight on the Aldi event study since more consumers shop at Aldi's. However, it was essential to find multiple events as the Kilts disclosure policy prevents me from showing charts with only one retailer.

**Feedback**:
The disclosure-policy rationale for pooling is currently easy to misread. You state that “the Kilts disclosure policy prevents me from showing charts with only one retailer,” but also name the retailers and note that the pooled event study is heavily weighted toward Aldi. It would help to clarify what the Kilts policy restricts (e.g., displaying retailer-specific outcome series/estimates computed from the proprietary data) and to avoid phrasing that could be interpreted as effectively revealing a single retailer’s series. Relatedly, since pooling combines a begin-accepting and stop-accepting event via sign normalization, briefly reiterating why the symmetry assumption is appropriate here would make the justification for pooling more self-contained.

---

### 43. Logical inconsistency in data cleaning threshold

**Status**: [Pending]

**Quote**:
> remove stores where any network's transaction share falls below 1.5% ( 15.7% of the remaining sample). The 1.5% threshold is calibrated to observed payment patterns: Visa's share at major grocery chains known not to accept Visa was approximately 1.5%, reflecting measurement error.

**Feedback**:
The data-cleaning rule and its motivation seem potentially misaligned. The text says that known non-acceptance can show up as an observed share of “approximately $1.5\%$” due to measurement error, but then defines the filter as dropping store-years only when a network’s share falls below $1.5\%$. As written, it is unclear whether $1.5\%$ is intended to be a typical non-acceptance level, an upper bound/quantile for non-acceptance measurement error, or simply a conservative cutoff. Clarifying this (and whether the intended inequality is strict vs. weak) would help readers understand that the “accepts all four brands” sample excludes the non-acceptance cases the threshold is calibrated to detect.

---

### 44. Ambiguity in surcharge prevalence statistic relative to sample selection

**Status**: [Pending]

**Quote**:
> Around 5% of transactions in the Diaries of Consumer Payment Choice (DCPC) involve card surcharges or cash discounts, justifying the price coherence assumption. I focus on cash, check, debit, and credit transactions at retail merchants

**Feedback**:
The 5% prevalence figure is not clearly tied to the sample restriction that follows. As written, it is ambiguous whether “Around 5% of transactions … involve card surcharges or cash discounts” is computed on the full DCPC transaction universe or on the restricted set of “cash, check, debit, and credit transactions at retail merchants, excluding … government or financial transactions.” Since differential pricing is plausibly concentrated in excluded/non-retail settings (e.g., utilities, government payments, gas), and since the model assumes strict price coherence, it would help to explicitly state the denominator/sample for the 5% number (and, if different, for the subsequent time-series measures) and how sensitive the violation rate is to these inclusions/exclusions.

---

### 45. Confusing axis label and econometric claim in Reply

**Status**: [Pending]

**Quote**:
> The key limitation of OLS is that it estimates absolute changes in trips, not percentage changes. To obtain percentage effects from OLS, one must run separate difference-in-differences specifications for the focal grocer and control grocers, then convert each to percentage terms and subtract.

**Feedback**:
The reply’s discussion of OLS vs Poisson is potentially misleading in two ways. First, the statement that to obtain percentage effects from OLS “one must run separate” DiD specifications is too strong: while levels-OLS yields effects in units, comparable percentage-type effects can also be obtained via normalization by an appropriate baseline (or other standard linear-model constructions). Second, Figure A.25’s y-axis label (“Change As Percentage of Total Trips”) is ambiguous between (i) a change in a share/percentage points and (ii) a percent change in volume relative to a baseline. Given that the text compares these coefficients to a $\approx 14\%$ Poisson estimate and describes “subtracting these percentage estimates,” it would help to clarify exactly what is plotted (including the denominator) and to state the implied treated-minus-control OLS effect in the same units/window used for the Poisson summary.

---

### 46. Contradiction in description of robustness check

**Status**: [Pending]

**Quote**:
> I respond to the concerns about the estimated elasticities by re-estimating the counterfactuals with half the baseline reward sensitivity.

**Feedback**:
The summary’s description of this robustness check as “half the baseline reward sensitivity” does not match what OA.6.4 reports. OA.6.4 instead halves the weight on the Durbin Amendment moment in the GMM objective, which leads $\alpha_0$ to fall from 6.74 to 5.92 (a modest reduction, not a 50% reduction). It would help to align the description of the exercise (and its interpretation as a stress test) with the actual procedure and the resulting change in $\alpha_0$.

---

### 47. Invariance assumption in card carrying definition

**Status**: [Pending]

**Quote**:
> Reply: I measure "carrying" based on observed usage in the Homescan data, not selfreported ownership. A consumer is classified as carrying a card if they use it during the sample period. ... This usage-based measure is appropriate for the model, which captures payment behavior rather than ownership-a consumer who owns a debit card but never uses it is effectively a credit-only user for merchant acceptance decisions.

**Feedback**:
At first the usage-based “carrying” definition made it seem like the model might be treating “did not use debit in-sample” as “cannot switch to debit” in counterfactuals where credit is not accepted, which could overstate merchant losses from dropping credit. However, the paper’s wallet concept is meant to capture effective payment behavior/habits (not literal ownership) and the baseline model also assumes limited credit–debit substitution at the point of sale. It would still help to make the maintained interpretation explicit here (and clarify the time-horizon/behavioral scope under which a never-used card is treated as not in the effective wallet).

---

### 48. Contradictory definitions of event time in Durbin analysis

**Status**: [Pending]

**Quote**:
> I define $t=0$ as 2011. ... Figure 3: The effect of the Durbin Amendment on debit card volumes ... The vertical line marks the year before the policy implementation in Q3 2011, which is $t=0$.

**Feedback**:
The paper defines $t=0$ as 2011 in the Durbin event-study setup, but Figure 3’s caption describes $t=0$ as “the year before the policy implementation in Q3 2011.” With annual data, “the year before” would be 2010, so the caption (or the event-time definition) should be aligned to avoid ambiguity about which year is the omitted reference period ($k=-1$) and whether the $t=0$ coefficient is meant to be a pre-period placebo or the initial (partially treated) year effect.

---

### 49. Contradictory logic on identification of omega

**Status**: [Pending]

**Quote**:
> The weight parameter $\omega$ governs the primary card's share of wallet utility from non-
pecuniary characteristics, so $1-\omega$ weights the secondary card. It is identified by the difference between Visa's share among primary credit cards and Visa's share among secondary credit cards: a lower $\omega$ makes network identity matter more for the secondary card, widening this gap.

**Feedback**:
The identification intuition for $\omega$ seems to have the comparative static reversed (or at least stated too strongly). Given $\Gamma_i^w$ weights primary characteristics by $\omega$ and secondary by $1-\omega$, increasing $\omega$ generally makes the primary slot more salient and should tend to make a high-$\Xi$ network like Visa disproportionately appear as the primary card, widening the gap between Visa’s primary and secondary shares. Decreasing $\omega$ makes slots more symmetric, which would typically narrow that primary–secondary share gap unless other forces (e.g., interaction terms or the $w_1\neq w_2$ constraint) dominate; if those forces are important, the direction should be qualified.

---

### 50. Mismatch between text and table in Dual Routing counterfactual

**Status**: [Pending]

**Quote**:
> I model a 25 bps reward increase that raises multi-homing from 60% to 80%.

**Feedback**:
There is an inconsistency in the stated magnitude/implementation of the Dual Routing counterfactual: Section VI.C describes it as “a 25 bps reward increase,” while the Table 5 notes describe dual routing as increasing the multi-homing parameter by the equivalent of 15 bps in rewards (for the median consumer). As written, it is unclear whether the shock is a literal change in rewards or a preference-parameter change expressed in reward-equivalent units, and which bps value is the relevant one.

---

### 51. Inconsistency between profit formula and demand derivation

**Status**: [Pending]

**Quote**:
> $\Pi(\gamma, p, M) = \sum_{w \in \mathcal{W}} \tilde{\mu}^{w} \times q^{w}(\gamma, p, M, 1) \times\left[p\left(1-\frac{(1+\gamma) \tau_{M}^{w}}{1+\gamma v_{M}^{w}}\right)-1\right]$

**Feedback**:
At first glance, the factor $\tau_M^w\frac{1+\gamma}{1+\gamma v_M^w}$ in the profit expression can look inconsistent with treating $\pi_{M,j}^w$ as fixed payment probabilities (since one might expect fees to be proportional to $p q^w \tau_M^w$). However, the paper appears to be using a different interpretation: $\gamma$ shifts demand in the card-usable (or preferred-payment) states, so card-paid revenue scales with $1+\gamma$ while total revenue scales with $1+\gamma v_M^w$, yielding the $(1+\gamma)/(1+\gamma v_M^w)$ normalization even with fixed $\pi$. It would help to make this interpretation explicit in Appendix B.2 so readers do not default to the “uniform payment mix across all units of $q^w$” reading.

---

### 52. Contradiction regarding data availability on acceptance subsets

**Status**: [Pending]

**Quote**:
> Precisely because combinatorial acceptance is not a feature of this industry, no data source systematically records the acceptance subsets of individual merchants.

**Feedback**:
At first this reads like a blanket statement that overlap/acceptance-subset information is unavailable. However, later the paper reports that “the share of Visa merchants that did not accept AmEx shrunk from around $9\text{-}17\,\mathrm{pp}$. to almost zero” (OA.3.4.1/V.C.2), which sounds like an overlap statistic. It would help to reconcile these by clarifying whether that 9–17pp figure is inferred from marginal merchant counts under an inclusion/hierarchical-acceptance assumption (rather than observed joint acceptance subsets), and to be explicit that publicly available sources do not provide comprehensive counts for all acceptance combinations (Visa+MC, Visa+AmEx, etc.) or merchant-level subset data.

---

### 53. Contradiction between credit aversion estimate and market shares

**Status**: [Pending]

**Quote**:
> The parameters reveal substantial consumer "credit aversion." The median consumer would pay with debit cards if credit cards did not pay rewards. I estimate that a consumer with an median income is indifferent between a Visa debit card and a Visa credit card that pays 1.2% in rewards.

**Feedback**:
At first the statement that “a consumer with an median income is indifferent … at $1.2\%$ in rewards” seemed to imply that, given baseline credit rewards of 145 bps in Table 4, the median-income consumer should strictly prefer credit—raising the question of why Table 4 still reports a larger primary-debit share than primary-credit share. However, this need not be a logical contradiction given the multinomial random-utility structure (multiple wallets, cash outside option, idiosyncratic shocks, and random coefficients) and because Table 4 reports *primary-card* shares rather than credit carrying/usage. Still, it would help to clarify precisely how the $1.2\%$ indifference point is computed (which wallet comparison and which components of unobserved heterogeneity are held fixed) and how it should be interpreted relative to the aggregate primary-card shares.

---

### 54. Unaddressed referee comment in response letter

**Status**: [Pending]

**Quote**:
> I was pleased with the passthrough discussion. Can the paper produce the counterfactuals underlying Table A.12?

**Feedback**:
There appears to be an unformatted referee-style question (“I was pleased with… Can the paper produce…”) left in the response letter without a corresponding reply. As it stands, this reads like an unanswered request about generating the counterfactuals underlying “Table A.12” (table numbering may differ between main text vs. appendix). This should either be answered explicitly (with a pointer to where those counterfactuals are reported) or removed if included inadvertently.

---

### 55. Incorrect statement of network ownership in Figure 2 notes

**Status**: [Pending]

**Quote**:
> Notes: The left chart shows payment volumes measured in trillions from Nilson (2020b, 2020c). Visa and MC own credit and debit cards, whereas AmEx primarily offers credit and charge cards.

**Feedback**:
The Figure 2 notes say “Visa and MC own credit and debit cards.” In the usual industry terminology, Visa/Mastercard are open-loop networks (issuers/banks issue the cards and own the customer accounts). Given this is a descriptive data figure citing Nilson aggregates, the note’s wording could be clarified to avoid implying that Visa/MC are issuers, especially since the paper later collapses issuers and networks only as a modeling abstraction.

---

### 56. Definition of "network" in multi-homing analysis

**Status**: [Pending]

**Quote**:
> I study consumer multi-homing behavior using the Homescan shopping data. For this analysis, I define a network as Visa credit, MasterCard (MC) credit, AmEx, or any debit card.⁶ In Appendix Table OA.30, I find that consumers put around 95% of their card spending on two networks.

**Feedback**:

At first glance, the reduced-form multi-homing analysis defines “network” as Visa credit, MC credit, AmEx, or “any debit card,” while later sections of the paper appear to model Visa Debit and MC Debit separately. However, since Fact 3 is interpreted as evidence about consumers’ ability to multi-home across *credit* networks (and the model assumes credit/debit segmentation at the point of sale), this debit aggregation may just be a descriptive simplification and/or reflect limits of what Homescan can cleanly identify for debit. It would help to clarify explicitly why debit is grouped this way in Section III.C.2 and how that definition relates to the model’s more granular debit products and any moments being targeted.

---

### 57. Contradiction between text and Figure OA.12

**Status**: [Pending]

**Quote**:
> Figure OA. 12 rules out cross-subsidization through improved credit rewards: consumers at large and small deposit institutions were equally likely to hold credit cards from large issuers and equally likely to receive credit card rewards after Durbin.

**Feedback**:
At first this sentence reads like a claim about level equality (“equally likely”) in holding large-issuer credit cards across large- vs small-deposit-institution consumers, which (visually) does not seem consistent with Figure OA.12’s sizable level gap. If the intended point is instead that there is no *differential change* after Durbin (i.e., similar post-Durbin patterns/trends), it would help to state that explicitly so the figure is not read as making a levels claim.

---

### 58. Internal consistency of the alternative specification

**Status**: [Pending]

**Quote**:
> Appendix OA.6.2 estimates the feasible alternative: a specification with full point-of-sale substitution but no incremental sales benefit for debit relative to cash.

**Feedback**:
At first the description “full point-of-sale substitution but no incremental sales benefit for debit relative to cash” sounded internally inconsistent, because “full substitution” is often read as debit and credit being close in the same dimension that drives incremental sales. However, in the paper’s structure these are distinct channels (POS substitution affects the payment probabilities $\pi_{M,j}^w$, while “incremental sales” is governed by the demand-boost/quality shifter via $\kappa_j$). It would help to clarify this distinction at the point where OA.6.2 is introduced, so readers do not infer that “full substitution” is meant to imply debit and credit are equally sales-enhancing relative to cash.

---

### 59. Mismatch in Option Value welfare loss

**Status**: [Pending]

**Quote**:
> The final channel is option value, which reduces welfare by \$32 billion as reduced variety in card offerings lowers the match between consumers and wallets.

**Feedback**:
In the fee-cap welfare decomposition, the option-value channel is reported with inconsistent magnitudes: the text states an option-value welfare loss of \$32B, while Table 6’s “Cap Fees” column appears to report about -\$28B (with an SE). Please reconcile the option-value figure used in the narrative with the table entry (or clarify if the narrative number is intended as a rounded approximation).

---

### 60. Contradiction in description of Full Cap substitution

**Status**: [Pending]

**Quote**:
> The 120 bps cap reduces credit merchant fees from 225 bps to 120 bps. Credit share falls 19 percentage points, debit share rises 11 pp , and cash share rises 8 pp . The substitution pattern differs from the full cap: dual holders shift 11 pp to debit and 8 pp to cash, whereas the full cap induces 15 pp to debit and 15 pp to cash.

**Feedback**:
At first this read like it was stating aggregate share changes “under the full cap,” which would clash with the main counterfactual table. However, on rereading, the “15 pp to debit and 15 pp to cash” comparison appears to be about “dual holders” (a conditional substitution pattern), not the overall market share change. It would still help to make the conditioning and the mapping to the aggregate share changes more explicit, since the paragraph mixes aggregate pp changes and subgroup shifts in close succession.

---

### 61. Asymmetric justification for no pass-through

**Status**: [Pending]

**Quote**:
> The relevant notion of no pass-through here is that merchants as a whole do not raise retail prices because they are constrained by consumers' ability to substitute to nonmarket consumption.

**Feedback**:
At first, the sentence defining “no pass-through” in terms of merchants “do not raise retail prices” reads like an upward-rigidity/limit-pricing motivation, which could leave ambiguity about why the same notion would imply zero pass-through under fee caps (cost decreases). Since the OA no-pass-through specification appears to be symmetric (prices invariant to fee changes), it would help to clarify that this polar case is meant to shut down price responses to merchant-fee changes in either direction (i.e., prices are pinned/unresponsive), rather than being defined solely by an inability to raise prices.

---

### 62. Inadequate response to referee regarding "fat tails"

**Status**: [Pending]

**Quote**:
> The article uses the number of trips as the outcome... claiming that revenue is unsuitable for use due to its fat tails... Wouldn't a log transform of revenue deal with the fat tails?

Reply: Thank you for this comment. The main text regression now uses dollar purchases at the consumer level as the main outcome to capture both trips and dollars per trips.

**Feedback**:
The reply does not directly address the referee’s suggestion of logging revenue to handle fat tails. Even if the main text now uses dollar purchases and a Poisson (PPML-style) specification, it would be helpful to explicitly state in the response why a log transform is not used in this setting (e.g., many zeros / interpretational and retransformation concerns) and why Poisson with dollar purchases is the appropriate way to handle skewed, nonnegative spending outcomes.

---

### 63. Incorrect scaling of transaction fees in profit and revenue equations

**Status**: [Pending]

**Quote**:
> $$
\Pi(\gamma, p, M)=\sum_{w \in \mathcal{W}} \tilde{\mu}^{w} \times q^{w}(\gamma, p, M, 1) \times\left[p\left(1-\frac{(1+\gamma) \tau_{M}^{w}}{1+\gamma v_{M}^{w}}\right)-1\right]
$$

**Feedback**:
At first, the fee term $\frac{(1+\gamma)\tau_M^w}{1+\gamma v_M^w}$ can look like it is charging fees on more than card revenue. However, given the paper’s definitions, $q^w$ already embeds the acceptance-driven demand boost $(1+\gamma v_M^w)$, while fees are paid only on the (payment-contingent) card-processed dollars, which scale with $(1+\gamma)$ when the card is used. It would help to briefly clarify in the main text that $v_M^w$ is a payment probability (not a revenue share) and that the ratio $\frac{1+\gamma}{1+\gamma v_M^w}$ converts from total expected dollars to card-processed dollars (as derived more generally in Appendix B.2 and echoed in the $d_j$ expression).

---

### 64. Mismatched response to Editor's point (c)

**Status**: [Pending]

**Quote**:
> Reply: Thank you for this advice. You are right that U.S. payment markets are mature$98 \%$ of retail trips in Homescan occur at stores that already accept credit cards-and this severely limits the variation available for studying merchant behavior. The grocery chains that changed acceptance policies are essentially the only natural experiments in the data.

**Feedback**:
At first glance, the opening sentence of this reply reads as if it is responding to the merchant-acceptance / fixed-cost identification limitation rather than to point (c)’s issuer-side abstraction from non-rewards card characteristics and the short-run interpretation of counterfactuals. However, reading on, the subsequent numbered list does appear to address (c) (including the short-run interpretation and holding non-rewards characteristics fixed). It may still be worth making the mapping from the Editor’s subpoints—especially (c)—to the reply letter’s paragraphs/bullets more immediately transparent.

---

### 65. Contradiction between covariance signs and welfare ratios in Table OA.10

**Status**: [Pending]

**Quote**:
> Table OA. 10 shows ratios of welfare loss with actual sorting to welfare loss with homogeneous merchants; most ratios are close to 1 . Using weighted covariances, sorting reduces redistribution from cash to credit users by only $4 \%$, our preferred estimate given the theoretical justification for revenueweighting. Using unweighted covariances, this effect expands to $9 \%$, an upper bound that overweights small merchants.

**Feedback**:
(a2) I initially thought Table OA.10’s ratios might conflict with the negative cross-covariances in Table OA.8. However, on inspection the off-diagonal Debit–Credit entries in Table OA.10 are in fact below 1 (e.g., 0.971/0.984 in Homescan), consistent with a negative Debit–Credit covariance. The ratios above 1 (e.g., 1.037) appear to be diagonal own-terms (variance terms), for which ratios above 1 are expected. Given how easy it is to misread the table’s orientation/panels, it would help to more explicitly flag which cells are off-diagonal “redistribution” terms versus diagonal own-terms.

---
