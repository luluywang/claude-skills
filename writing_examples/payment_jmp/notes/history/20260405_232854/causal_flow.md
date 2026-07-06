# Paragraph Causal Flow Analysis

## [response_round2.tex]

### Summary
- **Paragraphs analyzed:** ~85 substantive reply paragraphs (excluding referee quotes, equation-only displays, and table notes)
- **Issues found:** 7 (Critical: 0, High: 3, Medium: 3, Low: 1)
- **Most common issue type:** Missing causal link — conclusions stated without the chain connecting them to the premises already given

---

## High Priority Issues

### - [ ] response_round2.tex:85–101: Opening editor letter ends causal chain mid-argument

**Severity:** High
**Argument Type:** Concession-Response
**Issue:** Chain — missing link; also Connector misuse

**Comment:** Lines 86–87 state "I deeply appreciate your comments … I think that the paper has improved substantially thanks to the suggested revisions." This sentence acknowledges the suggestions and claims improvement, but immediately drops to a mechanical road-map of the letter's structure. The causal step connecting "what the editor said" to "how the paper improved" is never provided here (that substance appears on the next page in the Changes list). The road-map paragraphs (lines 89–97) then dangle between the gratitude opener and the substantive content, creating a dead zone where the reader is told what will happen rather than being given anything to hold.

**Current paragraph flow:**
```
1. Thank editor for opportunity to re-submit.
2. Deeply appreciate comments; paper improved substantially. ← conclusion asserted
3. Letter has two sections: [road-map]. ← throat-clearing
4. I also discuss all referee points; attached four letters. ← factual statement
5. Thank you again. ← repeated thanks
```

**Proposed reordering:**
```
1. Thank editor briefly for opportunity to re-submit.
2. Move immediately to: The revision addresses X, Y, Z. [One concrete sentence.]
3. This letter summarizes the changes [one sentence] and responds to each comment in detail [one sentence].
```

**Original:**
```
Thank you for granting me the opportunity to re-submit my paper "Regulating Competing Payment Networks" to the American Economic Review.

I deeply appreciate your comments on how to revise the paper in order to maximize its potential. I am also thankful to the four referees, who carefully read the previous version and provided me with a clear path for this revision.
I think that the paper has improved substantially thanks to the suggested revisions.

This letter has two sections:
\begin{enumerate}
    \item The first section summarizes the key changes to the manuscript.
    \item The second section reports a detailed answer to each of the comments and suggestions in your letter. For each point, I first report your comment (in blue) and then discuss how I modified the paper and extended my analysis to address it.
\end{enumerate}

I also discuss and -- whenever possible -- address empirically all the points raised by the referees.
I have attached four separate letters with my detailed answers to each referee.

Thank you again for your comments and clear guidance in revising the manuscript.
```

**Proposed Revision:**
```
Thank you for the opportunity to re-submit "Regulating Competing Payment Networks" to the American Economic Review.

The revision strengthens the reduced-form evidence, clarifies data limitations, estimates an alternative specification with debit-credit substitution, and expands the counterfactual analysis. This letter summarizes the key changes and then responds to each of your comments in detail. I have also addressed all referee points, with separate letters for each referee attached.
```

**Why better:** Removes double-thanks framing that reads as sycophantic preamble. The reader learns immediately what the revision accomplished (the causal payoff) rather than being told the letter is organized in two sections. Cuts word count while preserving all information-bearing content.

---

### - [ ] response_round2.tex:700–708: Robustness paragraph buries the main causal claim

**Severity:** High
**Argument Type:** Mechanism
**Issue:** Ordering — outcome before mechanism; chain incomplete

**Comment:** The reply to R1's comment on the cash-preference assumption (lines 700–708) starts well: "Yes, the model overstates the welfare gap…" But then the mechanism for why the aggregate results are nevertheless robust is spread across two sentences with "Several offsetting forces" doing heavy lifting without the forces being clearly ordered as cause → effect. The two specific offsets (overestimated credit aversion per holder vs. underestimated number of holders) are stated in the same sentence, forcing the reader to hold both simultaneously before the logic resolves. The concluding sentence reasserts the robustness conclusion without completing the chain.

**Current paragraph flow:**
```
1. Yes, model overstates welfare gap by polarizing consumer types. [Correct: limitation first]
2. ~25% of purchases made with cash regardless — consistent with transaction shocks. [Evidence for limitation]
3. "The aggregate welfare results are robust." ← conclusion asserted early ← HERE
4. "Several offsetting forces preserve the direction..." [vague]
5. Two offsets crammed into one sentence with "but" structure.
6. "Similarly, ... but spread across more card holders." [third and fourth offset in same sentence]
7. "These forces partially offset, so the main conclusions ... are directionally robust." [restatement of 3]
```

**Proposed reordering:**
```
1. Yes, model overstates welfare gap by polarizing types. [Limitation]
2. ~25% cash use regardless — consistent with transaction shocks. [Evidence]
3. Two opposing distortions result. [Setup for mechanism]
4. Credit aversion per holder is overstated (card holders use cards less often than modeled). [Force 1, cause → effect]
5. But the number of card holders is underestimated (the richer model needs more to match spending shares). [Force 2]
6. These forces partially offset. [Synthesis]
7. The main conclusions are directionally robust. [Conclusion — earned by steps 3–6]
```

**Original:**
```
Yes, the model overstates the welfare gap between pure card users and pure cash users by polarizing consumers into extreme types.
A richer model with transaction-level cash preference shocks would place consumers on a continuum; in the HomeScan data, roughly 25\% of purchases are made with cash regardless of how many cards consumers carry, consistent with such shocks.

The aggregate welfare results are robust to this concern.
Several offsetting forces preserve the direction of the aggregate welfare results.
Credit aversion per card holder would be overestimated in the current model (card holders use cards less often than modeled, so they bear credit aversion costs less frequently), but the number of card holders would be underestimated (the richer model needs more to match spending shares).
Similarly, the rewards loss per card holder from a fee cap would be overestimated (fewer card transactions per person), but spread across more card holders.
These forces partially offset, so the main conclusions (that fee caps benefit consumers on net, with progressive distributional effects) are directionally robust.
```

**Proposed Revision:**
```
Yes, the model overstates the welfare gap between pure card users and pure cash users by polarizing consumers into extreme types.
A richer model with transaction-level cash preference shocks would place consumers on a continuum; in the HomeScan data, roughly 25\% of purchases are made with cash regardless of how many cards consumers carry, consistent with such shocks.

Two opposing distortions result. Credit aversion per card holder is overestimated: card holders use cards less often than modeled, so they bear credit aversion costs less frequently. But the number of card holders is underestimated, because the richer model needs more card holders to match observed spending shares. The rewards loss per card holder from a fee cap is similarly overstated, but this overstatement is spread across a larger number of card holders. These forces partially offset, so the main conclusions are directionally robust.
```

**Why better:** Separates the mechanism into two named forces before asserting that they offset. The reader can follow the logic step by step instead of decoding a "but ... but" sentence structure. The conclusion is earned by the preceding chain rather than asserted first.

---

### - [ ] response_round2.tex:991–999: R2 credit-elimination reply reverses direction

**Severity:** High
**Argument Type:** Concession-Response
**Issue:** Direction — conclusion (cautious about this counterfactual) appears before the reason; then a pivot occurs that is not connected

**Comment:** The reply (lines 991–999) begins by agreeing with the Edelman-Wright intuition and then immediately reports a result from the model ("consumers are worse off by X billion dollars relative to an economy without card payments"). But the next sentence introduces a caution ("I am cautious about this extreme counterfactual") without connecting it causally to the prior claim. The caution about modeling limitations is then followed by a pivot to what the paper does instead ("I take the concern seriously by comparing…"), which floats as an alternative without explaining why the moderate-cap comparison is a suitable substitute for the full elimination exercise. The concavity assertion ("This concavity is reassuring") then functions as a conclusion to a chain that was never completed.

**Current paragraph flow:**
```
1. Agree with Edelman-Wright intuition that consumers could be better off without intermediation.
2. Model estimates consumers are worse off by X billion without cards. [Result reported]
3. But I am cautious about this extreme counterfactual. ← HERE (reason not given yet)
4. [Reason]: random coefficients may not capture inframarginal consumers.
5. Pivot: I take the concern seriously by comparing 120 bps cap to cost-of-cash.
6. Cost-of-cash delivers only ~7% more welfare.
7. "This concavity is reassuring." [Conclusion — but reassuring about what, exactly?]
```

**Proposed reordering:**
```
1. Agree with Edelman-Wright; model estimates consumers are worse off by X billion without cards.
2. However, the extreme counterfactual depends heavily on modeling assumptions: random coefficients may not capture inframarginal consumers who place very high value on cards. [Reason for caution]
3. Rather than trace to zero, I compare 120 bps cap to cost-of-cash benchmark. [Alternative approach + bridge to why it's appropriate]
4. The cost-of-cash cap delivers only ~7% more welfare; the 120 bps cap captures ~80% of Ramsey gains. [Evidence]
5. The conclusions therefore do not require extrapolating to a world without cards. [Implication that closes the loop on the caution]
```

**Original:**
```
I agree with the intuition from \textcite{Edelman.Wright2015} that consumers could in principle be better off without intermediation.
Indeed, my model estimates imply that consumers are worse off by \absinput{baseline_cons_surplus_agg_level_baseline} billion dollars relative to an economy without card payments.
However, I am cautious about this extreme counterfactual. The random coefficients specification may not adequately capture inframarginal consumers who place very high value on these features, so the welfare conclusions from full elimination would depend heavily on modeling assumptions.

Rather than tracing equilibria all the way to zero, I take the concern seriously by comparing the 120 bps cap to the cost-of-cash cap and the constrained social optimum.
Appendix~\ref{subsec:oa-cost-of-cash-cap} shows that the cost-of-cash cap delivers only about 7\% more welfare than the 120 bps cap, and the 120 bps cap captures roughly 80\% of the Ramsey planner's welfare gains.
This concavity is reassuring.
Most of the welfare improvement comes from the initial fee reduction rather than the last basis points, and the conclusions do not require extrapolating to a world without cards.
```

**Proposed Revision:**
```
I agree with the intuition from \textcite{Edelman.Wright2015} that consumers could in principle be better off without intermediation.
My model estimates imply that consumers are worse off by \absinput{baseline_cons_surplus_agg_level_baseline} billion dollars relative to an economy without card payments.
However, the random coefficients specification may not adequately capture inframarginal consumers who place very high value on cards, so the welfare conclusions from full elimination would depend heavily on modeling assumptions.
Rather than tracing equilibria all the way to zero, I compare the 120 bps cap to the cost-of-cash cap and the Ramsey planner.
Appendix~\ref{subsec:oa-cost-of-cash-cap} shows that the cost-of-cash cap delivers only about 7\% more welfare than the 120 bps cap, and the 120 bps cap captures roughly 80\% of the Ramsey planner's welfare gains.
The conclusions therefore do not require extrapolating to a world without cards.
```

**Why better:** Removes "I am cautious" as a free-floating caution and immediately provides the reason (modeling sensitivity). The pivot to the comparison exercise is then connected to the caution rather than floating as a separate assertion. "This concavity is reassuring" is cut: the final sentence states the implication directly.

---

## Medium Priority Issues

### - [ ] response_round2.tex:494–510: Decomposition paragraph misorders "surprising" result

**Severity:** Medium
**Argument Type:** Claim-Evidence
**Issue:** Ordering — result asserted as "surprising" before the mechanism is set up; mechanism then partially explained, but conclusion (about deadweight loss and price cuts) introduced without connecting the two halves

**Comment:** Lines 499–509 open with "The more surprising finding is *why* consumers gain \$28Bn overall." This introduces a result labeled as surprising before providing any mechanism. The mechanism then unfolds: "Fees and rewards fall by roughly equal amounts, so the direct transfer to consumers is small. The welfare gains come from reduced credit card adoption. Under price coherence, each credit card user imposes an externality… Fee caps shrink this cross-subsidy…" This is correct sequential logic. But the final two sentences (lines 506–509) on deadweight loss and why total welfare in the first row is only \$14Bn introduce a new mechanism that has not been set up: the reader must know that lower rewards contract consumption when prices are fixed, and that this creates deadweight loss through positive margins — two steps that are asserted rather than derived from what preceded.

**Current paragraph flow:**
```
1. Your intuition is right: merchants compete away nearly all direct gains. [Correct: mechanism-first]
2. Specific numbers on fee savings and price competition. [Evidence]
3. "The more surprising finding is why consumers gain $28Bn overall." ← conclusion labeled "surprising"
4. Fees and rewards fall equally, so direct transfer is small. [Step 1 of mechanism]
5. Welfare gains come from reduced credit card adoption. [Step 2]
6. Under price coherence, credit users impose externality. [Step 3]
7. Fee caps shrink the cross-subsidy. [Step 4]
8. Total welfare in first row only $14Bn because lower rewards contract consumption. ← HERE new mechanism, no setup
9. Since margins are positive, reduced consumption creates deadweight loss.
10. Merchant price cuts reverse this contraction, so full benefit materializes across both rows.
11. Third row has negligible net effect.
```

**Proposed reordering:**
```
The mechanism for why this is so needs to be set up before the "surprising" claim. Either:
(a) Add one sentence before sentence 3 explaining that the expected mechanism (direct transfer) is small, which sets up why the actual mechanism is surprising; or
(b) Move sentences 8–9 (deadweight loss through positive margins) to immediately after sentence 4 (direct transfer is small), so the reader understands why direct transfers don't capture the full picture before the adoption externality explanation begins.
```

**Original (key passage):**
```
The more surprising finding is \emph{why} consumers gain \$28Bn overall.
Fees and rewards fall by roughly equal amounts, so the direct transfer to consumers is small.
The welfare gains come from reduced credit card adoption.
Under price coherence, each credit card user imposes an externality through higher retail prices, so the marginal consumer's rewards are a cross-subsidy funded by all shoppers.
Fee caps shrink this cross-subsidy, eliminating real costs of credit use (debt aversion, budget-control hassle) that rewards were compensating.

Total welfare in the first row rises by only \$14Bn because lower rewards contract consumption when retail prices are fixed.
Since margins are positive, reduced consumption creates deadweight loss.
Merchant price cuts in the second row reverse this contraction, so the full benefit of reduced credit aversion materializes only across both rows together.
The third row (Merchant Adoption) has a negligible net welfare effect.
```

**Proposed Revision:**
```
The more surprising finding is \emph{why} consumers gain \$28Bn overall.
Fees and rewards fall by roughly equal amounts, so the direct transfer to consumers is small; lower rewards also contract consumption when retail prices are fixed, creating deadweight loss through positive retail margins.
The welfare gains instead come from reduced credit card adoption.
Under price coherence, each credit card user imposes an externality through higher retail prices, so the marginal consumer's rewards are a cross-subsidy funded by all shoppers.
Fee caps shrink this cross-subsidy, eliminating real costs of credit use that rewards were compensating.

These two effects --- a deadweight-loss channel and an adoption-externality channel --- explain the pattern across rows.
Total welfare in the first row rises by only \$14Bn because the price-cut channel has not yet operated.
Merchant price cuts in the second row reverse the consumption contraction, so the full benefit of reduced credit aversion materializes only across both rows together.
The third row (Merchant Adoption) has a negligible net welfare effect.
```

**Why better:** The deadweight-loss mechanism is introduced at the same point as the "direct transfer is small" statement, so the reader has both pieces before encountering the adoption-externality chain. The cross-row pattern is then announced explicitly, making the logic of the decomposition easy to follow.

---

### - [ ] response_round2.tex:414–428: Two-reason structure lists before establishing the shared premise

**Severity:** Medium
**Argument Type:** Claim-Evidence
**Issue:** Ordering — shared premise (what "primary card" means) comes after the first reason that depends on it

**Comment:** The reply to R1's two-card concern (lines 414–428) opens with "You are correct that γ is the same for credit and debit transactions, and that most credit card holders also own a debit card. There are two reasons merchants still have an incentive to accept credit in the model." The two reasons are then listed. But the key shared concept — that the model tracks *usage patterns* rather than *card ownership* — is introduced only as the first reason rather than as an upfront premise. Reason Two ("even among consumers who actively use both credit and debit, the baseline model assumes these serve different transaction types") then depends on the same distinction between ownership and usage that was introduced only in Reason One. The reader must mentally re-read Reason One before Reason Two makes sense.

**Current paragraph flow:**
```
1. Correct: γ same for credit and debit; most credit holders also own debit.
2. "There are two reasons merchants still have incentive..."
3. Reason One: model describes primary/secondary *usage*, not ownership. [Introduces ownership-vs-usage distinction]
4. Data: 95% of spending on two networks. [Evidence for reason one]
5. "A debit card that sits in a drawer does not help a merchant." [Elaboration]
6. Reason Two: consumers with both cards use them for different transactions (segmentation). ← depends on ownership-vs-usage from Reason One
7. Reduced-form evidence for segmentation.
8. Extension allows free substitution; predictions similar.
```

**Proposed reordering:**
```
1. Correct: γ same for credit and debit; most credit holders also own debit.
2. Establish premise upfront: the model captures *usage patterns*, not ownership — a consumer who rarely uses their debit card does not generate the sales boost γ for a cash merchant. [Shared premise]
3. Reason One: primary/secondary classification reflects this — 95% of card spending on two networks.
4. Reason Two: even active users of both card types: segmentation means credit and debit serve different transaction types.
5. Evidence from event study + extension.
```

**Original:**
```
You are correct that $\gamma$ is the same for credit and debit transactions, and that most credit card holders also own a debit card.
There are two reasons merchants still have an incentive to accept credit in the model.

First, the model describes consumers' primary and secondary payment methods, the cards they actually use, not every card they own.
...
Second, even among consumers who actively use both credit and debit, the baseline model assumes these serve different transaction types (segmentation).
```

**Proposed Revision:**
```
You are correct that $\gamma$ is the same for credit and debit transactions, and that most credit card holders also own a debit card.
The key is that the model captures usage patterns, not ownership: a debit card that sits in a drawer does not generate the sales boost $\gamma$ for a cash merchant.

Two features of the model then explain why merchants still have an incentive to accept credit.
First, the primary-secondary classification reflects actual spending: consumers put roughly 95\% of their card spending on just two networks, so the classification is empirically grounded.
Second, even among consumers who actively use both cards, the baseline model assumes credit and debit serve different transaction types: a consumer who prefers credit for a given purchase pays with cash, not debit, if credit is unavailable.
...
```

**Why better:** The ownership-vs-usage distinction becomes a shared premise rather than a conclusion of Reason One. Reason Two then builds on the established premise rather than depending on the reader having absorbed Reason One as background knowledge.

---

### - [ ] response_round2.tex:1414–1419: Aggregate-trends paragraph undercuts its own causal argument

**Severity:** Medium
**Argument Type:** Claim-Evidence
**Issue:** Connector misuse; self-undermining sequence

**Comment:** Lines 1414–1419 offer aggregate trend evidence for debit-to-credit substitution, then immediately note "Of course, simple trend extrapolations are not causal estimates." The very next sentence lists confounders at length. The paragraph ends: "These confounders are precisely why the within-issuer difference-in-differences is the preferred identification strategy. But the aggregate patterns are at least *consistent* with the substitution story." The logical flow is: evidence → caveat → preferred strategy was already given earlier → "but consistent." The word "but" before "the aggregate patterns" sets up a contrast with the caution about confounders — but the aggregate patterns have just been shown to be potentially confounded, so the "but" is misleading. The reader cannot tell whether the paragraph advances the argument for substitution or merely forestalls a critique.

**Current paragraph flow:**
```
1. Figure shows debit growth slowed / credit exceeded trend. [Evidence for substitution]
2. "Though these extrapolations are not causal and confound the fee cap with concurrent changes." ← caveat immediately undermines sentence 1
3. List of confounders.
4. "These confounders are precisely why the D-in-D is preferred." ← refers back to strategy already stated
5. "But the aggregate patterns are at least consistent with the substitution story." ← "but" signals contrast, but with what?
```

**Proposed reordering:**
```
1. Clarify upfront that aggregate trends are descriptive only.
2. Report the pattern (debit growth slowed, credit exceeded trend).
3. Note confounders.
4. Conclude: the pattern is consistent with substitution, but cannot distinguish the channels.
5. Remove the "but" — replace with "nonetheless" or restructure so the sentence is not set up as a contrast.
```

**Original:**
```
Aggregate trends are also consistent with substitution.
Figure~\ref{fig:agg_debit_credit_volumes} shows that debit growth slowed relative to its pre-Durbin trajectory while credit exceeded its trend, though these extrapolations are not causal estimates and confound the fee cap with concurrent changes (dual routing mandates, premium credit expansion, AmEx fee cuts).
Of course, simple trend extrapolations are not causal estimates.
Post-Durbin aggregate volumes confound the fee cap's effect with several concurrent changes: ...
These confounders are precisely why the within-issuer difference-in-differences is the preferred identification strategy.
But the aggregate patterns are at least \emph{consistent} with the substitution story---debit's shortfall relative to trend is difficult to explain without some reallocation toward credit.
```

**Proposed Revision:**
```
Aggregate trend data are descriptive only, but the pattern is at least consistent with substitution.
Figure~\ref{fig:agg_debit_credit_volumes} shows that debit growth slowed relative to its pre-Durbin trajectory while credit exceeded its trend.
Post-Durbin volumes confound the fee cap's effect with several concurrent changes: dual routing mandates, the premium credit card expansion, and AmEx fee cuts.
These confounders are precisely why the within-issuer difference-in-differences is the preferred identification strategy.
Nonetheless, debit's shortfall relative to trend is difficult to explain without some reallocation toward credit.
```

**Why better:** The descriptive-only framing is established first, so the evidence and the caveat are presented in the natural order (evidence → scope). The repeated caveat ("Of course, simple trend extrapolations are not causal estimates") is cut because the opener already establishes this. "But" is replaced by "Nonetheless," which accurately signals that the descriptive consistency holds despite the identification limitations — rather than falsely implying a contrast with the confounders that were just named.

---

## Low Priority Issues

### - [ ] response_round2.tex:838–849: Fixed-costs reply pairs two responses to two comments without flagging the structural link

**Severity:** Low
**Argument Type:** Problem-Solution
**Issue:** Ordering — the solution is explained before the problem is fully established

**Comment:** Lines 838–849 respond jointly to two R2 comments on fixed acceptance costs and equilibrium fragility. The reply opens with "I agree that fixed costs of card acceptance are potentially important" and then immediately pivots to why the approach is constrained ("cannot be identified separately from heterogeneity in sales benefits"). The next paragraph opens: "Your concern about equilibrium fragility directly shaped my choice of counterfactual." This is a good causal sentence. However, the reader has not yet been reminded what the equilibrium fragility concern was — the referee comment quoted it in two blocks, but the reply collects them under a single \textbf{Reply} without re-stating which concern the second paragraph addresses. A reader unfamiliar with the referee comments would not know that "equilibrium fragility" refers to the concern that lower rewards could cause cascading disintermediation.

**Comment:** The low-severity concern is not about logical inversion but about a missing contextual link: the word "directly" in "directly shaped my choice" implies a causal connection, but the chain from the fragility concern to the 120 bps counterfactual choice is implicit rather than stated.

**Original (key passage):**
```
Your concern about equilibrium fragility directly shaped my choice of counterfactual. If lower rewards reduced consumer adoption enough to push merchants below the acceptance threshold, the resulting cascading disintermediation would be difficult to predict reliably.
Rather than cap fees at the cost of cash, the main counterfactual now caps credit fees at 120 basis points...
```

**Proposed Revision:**
```
Your equilibrium fragility concern — that lower rewards could reduce consumer adoption enough to trigger cascading merchant disintermediation — directly shaped the choice of counterfactual.
Rather than cap fees at the cost of cash, the main counterfactual now caps credit fees at 120 basis points...
```

**Why better:** The fragility mechanism is restated in one clause before "directly shaped," so the causal claim is self-contained. The reader does not need to scroll back to the referee comment block to understand what the concern was.
