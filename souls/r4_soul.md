# Referee 4 Soul Document
## Understanding the Rejection Referee's Perspective

**Date:** 2026-01-31
**Referee:** R4 (New Reject Referee)
**Recommendation:** Reject
**Document Purpose:** Capture R4's scholarly perspective and evaluate manuscript's responsiveness

---

## PART 1: THE NARRATIVE SOUL

### Who is This Scholar?

Referee 4 is the fresh critical eye—a new referee brought in for this R&R who recommends **rejection**. Unlike R1-R3 who have engaged with earlier drafts, R4 arrives without history, viewing the paper with skepticism rather than investment. This is the scholar who needs convincing from first principles.

R4's intellectual stance reflects a deep empiricist's suspicion of structural models built on fragile identification. They are comfortable with quantitative methods but insist that every behavioral parameter must be empirically anchored with transparent, convincing evidence. When they see a difference-in-differences estimate reinterpreted as a structural parameter, they demand rigorous justification—not just statistical significance, but conceptual validity.

This is not a hostile referee. Their tone is measured, professional, and constructive. They acknowledge "some novel progress in modeling and empirical work." But their fundamental conclusion—that the analysis has "significant limitations"—stems from genuine intellectual concerns about the paper's foundation, not nitpicking or ideology.

### What Do They Care About Most?

R4's concerns cluster around three core priorities:

**1. Empirical Identification of Behavioral Parameters**

R4's primary objection centers on the Durbin Amendment analysis. They believe the paper misinterprets a regulatory event:
- The 29% decline in regulated debit volume relative to exempt issuers is attributed entirely to consumer reward sensitivity
- But R4 argues this conflates multiple mechanisms: differential merchant acceptance, issuer promotional strategies, and overall market dynamics
- "Debit card transactions continued to grow strongly, primarily by replacing cash"—the DD estimate doesn't imply an overall decline in debit use
- The critique: you're identifying a *relative* effect but interpreting it as an *absolute* behavioral response

This matters because the Durbin estimate anchors the model's central behavioral parameter. If R4 is correct that this parameter is misestimated, the entire quantitative exercise collapses.

**2. Structural Assumptions Must Have Empirical Support**

R4 demands that critical modeling assumptions be empirically validated, not just theoretically plausible:
- Debit-credit substitutability at adoption: "presented only as a theoretical possibility, without empirical backing"
- They cite institutional reality: debit users face credit qualification barriers, maxed credit lines, budgeting preferences
- "A small change in debit rewards is unlikely to cause a significant shift to credit card use"
- No existing studies document substantial debit-to-credit migration post-Durbin

The concern: the paper assumes what it should prove. Theoretical consistency isn't enough—R4 wants direct empirical evidence.

**3. Model Robustness to Behavioral Responses (Lucas Critique)**

R4 worries about out-of-sample predictions when institutions respond endogenously:
- Post-Durbin: banks reduced free checking, raised monthly fees, increased minimum balances
- Post-fee-caps: issuers might tighten credit qualification, adjust lending terms, degrade service quality
- "Without accounting for these broader impacts, the paper's welfare and policy analysis may be incomplete or misleading"

This reflects a Lucas critique concern: welfare estimates based on parameters estimated in one regime may not apply when policy fundamentally changes the regime.

### What is the Spirit of Their Concerns?

R4's rejection stems from three interlocking worries:

**Identification Concern:** The core behavioral estimate may not measure what the model claims it measures.

**Specification Concern:** A critical assumption (debit-credit substitution) lacks direct empirical support, creating model misspecification risk.

**External Validity Concern:** Counterfactual predictions may fail when institutions respond to policy changes.

These aren't minor technical quibbles. They're fundamental objections to the research design: *Can we trust the model's quantitative predictions?*

R4 also expresses a methodological preference for transparency about model limitations:
- "Before proceeding to quantitative exercises, it would help to establish some key model properties"
- They want a social optimum benchmark analytically characterized
- They want systematic exploration of the policy space, not just a few specific counterfactuals
- Finding that "network competition reduces welfare" based only on monopoly merger seems extreme

The underlying philosophy: when a model has "many moving parts," readers need clear analytical anchors to understand what's driving results. Numerical simulations without theoretical foundations raise credibility concerns.

### How Would They Want to Be Treated?

**What Would Feel Respectful:**

1. **Direct Engagement with the Durbin Interpretation**
   Don't dismiss their alternative interpretation. Acknowledge that the DD estimate captures multiple mechanisms (bank advertising, merchant acceptance, consumer rewards). Either:
   - Provide additional evidence isolating the reward channel
   - Or acknowledge the estimate is a reduced-form "full behavioral response" and explain why that's the right object for the model
   - Explicitly discuss what happens if their interpretation is partially correct

2. **Empirical Evidence on Debit-Credit Substitution**
   R4 wants to see data, not just theory. Show them:
   - The Discover cashback experiment (already in OA.1)
   - Event study evidence that credit cards increase sales even for debit holders
   - If possible, direct evidence on consumer switching from debit to credit in some context
   - Robustness analysis showing policy conclusions hold even with weaker substitution

3. **Transparent Discussion of Model Limitations**
   R4 will appreciate candor:
   - "Our counterfactuals are short-run predictions"
   - "We cannot model endogenous quality degradation"
   - "Australian evidence suggests limited short-run responses, but long-run effects may differ"
   - This isn't weakness—it's intellectual honesty

4. **More Complete Counterfactual Analysis**
   Address their specific questions:
   - What's the optimal cap level? (Even if just testing 2-3 intermediate values)
   - What about credit-only caps?
   - How about duopoly vs. triopoly network competition?
   - These extensions show you've thought systematically about the policy space

5. **Analytical Characterization of the Social Optimum**
   Even a brief appendix section deriving first-order conditions for the planner's problem would help. This gives R4 an anchor: "Aha, the distortion comes from term X, which the market doesn't internalize."

**What Would Feel Dismissive:**

- Treating their concerns as minor technical points rather than fundamental challenges
- Citing robustness checks without addressing the conceptual critique
- Saying "we acknowledge limitations" without showing how limitations affect conclusions
- Defending every modeling choice without conceding anything

**The Key Insight:**

R4 is the rejection referee because they genuinely doubt the model's foundation. Changing their mind requires *addressing the substance of their concerns,* not just citing existing text. They need to see:

1. Why the Durbin estimate is the right behavioral object (or at minimum, why misspecification is unlikely to reverse conclusions)
2. Direct empirical evidence on debit-credit substitution (not just theoretical argument)
3. Transparency about what the model can and cannot predict
4. More systematic exploration of the policy space

**The Tone They'll Respect:**

"Referee 4 raises important questions about our identification strategy and modeling assumptions. We appreciate the opportunity to clarify these points and provide additional evidence."

Then: *actually provide that evidence.* Show them the Discover experiment. Show them the merchant testimony. Show them robustness analysis. Acknowledge limits candidly.

R4 can be persuaded—but only with substance, not rhetoric. They want to believe the paper makes a contribution, but they need their fundamental concerns addressed before they'll support publication.

---

## PART 2: DETAILED TRACKING SPREADSHEET

### Grading Rubric

**Address Status:**
- **Fully addressed:** Substantive text directly engaging the concern + genuine response to critique
- **Partially addressed:** Some response but incomplete, missing key elements, or only indirect treatment
- **Acknowledged:** Mentioned but no substantive change or only generic acknowledgment
- **Not addressed:** No mention, silence, or dismissal

---

| Concern ID | Concern Text | Manuscript Location | Quote | Address Status | Justification |
|:-----------|:-------------|:-------------------|:------|:---------------|:--------------|
| **R4-1** | **Durbin Interpretation (Empirical Identification):** The paper's interpretation that the 29% decline in signature debit volume represents consumer switching from debit to credit due to lost rewards is likely incorrect. Debit continued growing post-Durbin (replacing cash), exempt issuers likely promoted debit more aggressively, and the DD result doesn't imply overall debit decline. Attributing entire effect to reward sensitivity appears overstated. | `reducedform.tex:35-47`<br><br>`appendix_reduced.tex:1-179` (OA.1) | **Main text (lines 41-45):**<br>"My estimate captures banks' full behavioral response to interchange changes—including adjustments to advertising and sign-up incentives—not just consumers' pure sensitivity to rewards. This broader response is the relevant object for modeling how networks use interchange to expand card adoption."<br><br>**Footnote 44:**<br>"To the extent that interchange increases card adoption by funding steering that consumers do not value, my model understates the harms of rewards competition."<br><br>**Appendix OA.1 (lines 130-133):**<br>"A key finding from the Discover experiment is the asymmetric substitution pattern: strong credit-to-credit substitution but weak debit-to-credit substitution. This asymmetry is further confirmed by the lack of spillover effects." | **Partially addressed** | **What's addressed:** Paper explicitly acknowledges estimate captures "full behavioral response" including advertising/sign-up incentives, not pure consumer sensitivity. Footnote 44 admits if steering is involved, model may *understate* harms. OA.1 provides Discover evidence.<br><br>**What's missing:** No direct engagement with (1) overall debit growth post-Durbin, (2) differential promotion by exempt vs. regulated issuers, (3) acknowledgment that DD estimate is *relative* not *absolute* effect. The footnote deflects rather than addresses: it says "if I'm wrong, my conclusions are stronger" but doesn't engage with R4's specific mechanism critique. |
| **R4-2** | **Debit-Credit Substitutability (Structural Assumption):** The assumption that debit and credit cards are substitutable is presented as theoretical possibility without empirical backing. Debit users often face barriers to credit (unqualified, maxed lines, budgeting preferences). Small change in debit rewards unlikely to cause significant shift to credit. No existing studies document substantial debit-to-credit migration post-Durbin. | `model.tex:273-278`<br><br>`reducedform.tex:79-89`<br><br>`appendix_substitution.tex:1-100` (OA.4) | **Model assumptions (lines 273-277):**<br>"In the model, consumers who carry debit and credit cards do not substitute between them at the point of sale. This rationalizes the evidence from Section 3.2 that accepting credit cards increases sales even from those who own debit cards. Online Appendix OA.3 provides additional evidence from merchant and network testimony that credit and debit cards are distinct products for the merchant."<br><br>**Footnote (line 277):**<br>"Although credit and debit cards are not substitutes at the transaction level, they can still be substitutes at the adoption stage. Transaction-specific rewards do not change usage decisions if a consumer has rigid transaction-specific preferences over credit or debit. However, offering rewards on all her debit transactions can still tip her decision about which card to adopt."<br><br>**Reduced form (lines 83-86):**<br>"Moreover, credit cards provide services that debit cards do not fully replicate—most importantly, the credit line. Merchant and network testimony in Appendix B.3 highlights that credit cards are strongly preferred for larger purchases precisely because of the credit line."<br><br>**Robustness OA.4 (lines 88-93):**<br>"The results show that policy conclusions are robust to the substitution assumption. Fee caps raise welfare by $28B under point-of-sale substitution versus $30B in the baseline, a difference of 7%. Uncapping debit fees raises welfare by $8B versus $7B baseline. Critically, the policy ranking is unchanged: interchange fee caps dominate both the status quo and Durbin repeal under both specifications." | **Fully addressed** | **Strong response.** Paper actually adopts MORE conservative stance than R4 assumes—models credit/debit as segmented at transaction level (no point-of-sale substitution), with substitution only at adoption. This directly addresses barriers concern: model doesn't require credit-constrained consumers to switch payment methods transaction-by-transaction.<br><br>Provides empirical support: (1) event study showing credit increases sales even for debit holders, (2) merchant testimony on credit line importance, (3) robustness check with full substitution (κ=0) showing policy ranking unchanged.<br><br>The distinction between adoption-level vs. transaction-level substitution elegantly resolves R4's concern. At adoption level, even modest reward changes can tip decisions; at transaction level, strong preferences persist. This is both theoretically coherent and empirically supported. |
| **R4-3** | **Model Misspecification Risk:** Without convincing interpretation of Durbin impact, model may misestimate consumer reward sensitivity and debit-credit substitutability, leading to fundamental misspecification and flawed policy conclusions. If debit and credit aren't substitutable, Durbin may have enhanced welfare. | **Implicit only**<br><br>Robustness in:<br>`reducedform.tex:47`<br>`appendix_reduced.tex:1-179`<br>`appendix_substitution.tex:87-93` | **Sensitivity mention (line 47):**<br>"Online Appendix OA.1.4 shows the main qualitative conclusions are unchanged under halved reward sensitivity."<br><br>**Footnote 44 (lines 42-45):**<br>"To the extent that interchange increases card adoption by funding steering that consumers do not value, my model understates the harms of rewards competition."<br><br>**Substitution robustness (OA.4, lines 88-93):**<br>"The results show that policy conclusions are robust to the substitution assumption. Fee caps raise welfare by $28B under point-of-sale substitution versus $30B in the baseline... the policy ranking is unchanged." | **Partially addressed** | **What's addressed:** Extensive robustness checks on key parameters: (1) halved reward sensitivity, (2) alternative substitution specification, (3) extensive empirical validation in OA.1.<br><br>**What's missing:** No explicit discussion that *if R4's critique of Durbin is correct,* reward sensitivity parameter could be biased and what that means for policy conclusions. The robustness checks test sensitivity to magnitudes but don't address the *conceptual* critique that the parameter may not measure what model assumes.<br><br>Paper shows "conclusions robust to halving parameter" but doesn't engage with "parameter may be biased upward due to confounding mechanisms." These are different concerns. Former is about magnitude, latter is about interpretation. |
| **R4-4** | **Missing Socially Optimal Benchmark:** Model is complex with many moving parts. Before quantitative exercises, should establish key model properties. Define socially optimal benchmark and illustrate how/why market outcomes diverge. Currently policy implications drawn from few specific counterfactuals; reliability unclear. | `counterfactuals.tex:7-16`<br><br>`intro.tex:18-32` | **Counterfactuals benchmark (lines 10-14):**<br>"This level of fee regulation aligns with the theoretical work of Rochet and Tirole (2011), who show that capping both credit and debit card merchant fees at the cost of cash is welfare-optimal in a model with homogeneous merchants. While my model features heterogeneous merchants, I use this fee level as a benchmark because it has guided the design of European interchange regulation."<br><br>**Intro inefficiency logic (lines 18-32):**<br>"Price coherence not only generates cross-subsidies between consumers, but also generates large aggregate welfare losses. Because many consumers choose to use debit cards when reward credit cards are available, I infer that consumers bear non-pecuniary costs to use credit cards—what I term 'credit aversion'. These can include the hassle of managing another account, the temptation to overspend, or a preference to avoid debt. Rewards incentivize consumers to incur more credit aversion. But while the credit aversion is a social cost, the rewards are transfers funded by merchant fees. While consumers collectively prefer lower credit card use, they individually choose reward cards to capture the cross-subsidy from other consumers." | **Partially addressed** | **What's addressed:** Paper references Rochet-Tirole (2011) theoretical benchmark (fee = cost of cash) and explains economic logic for why current equilibrium is inefficient (price coherence + credit aversion creates prisoner's dilemma).<br><br>**What's missing:** No formal derivation of first-best optimum *in the paper's specific model* (with heterogeneous merchants, credit aversion, multi-homing, etc.). No characterization of optimal fees as function of parameters. No analytical proof showing how market equilibrium deviates from optimum.<br><br>R4's point is valid: paper relies on numerical counterfactuals relative to theoretically-motivated benchmark rather than formally characterizing social optimum within its own framework. This makes it harder to understand what's driving welfare results—is it the specific functional forms, or fundamental economic forces? |
| **R4-5** | **Incomplete Counterfactual Exploration:** Paper shows capping both fees improves welfare but doesn't explore optimal cap level. Shows capping only debit reduces welfare but doesn't explore capping only credit. Network competition based on extreme scenario (monopoly); doesn't address optimal number/composition of networks. | `counterfactuals.tex:143-151`<br><br>Partial coverage:<br>- Intermediate cap: footnote 15<br>- Durbin analysis: lines 98-118 | **Conclusion acknowledgment (lines 150-151):**<br>"Several extensions would enrich the analysis. First, the current counterfactuals cap both credit and debit fees uniformly; an analysis of credit-only fee caps could reveal whether the welfare gains are robust to asymmetric regulation. Second, while I examine a merger to monopoly, a fuller analysis would characterize the optimal number and composition of competing networks. Third, the model assumes networks do not adjust non-price characteristics (such as credit limits or fraud protection) in response to fee caps; longer-run effects may differ if networks strategically degrade quality. I leave these extensions to future work."<br><br>**Footnote 15 (intermediate cap):**<br>"Online Appendix OA.5 presents results for an intermediate cap of 95 bps, which corresponds to the 2023 caps implemented in Canada."<br><br>**Durbin analysis (lines 98-118):**<br>Tests uncapping debit fees (asymmetric regulation in one direction) and shows current regime worse than either uniform policy. | **Partially addressed** | **What's addressed:** Paper explicitly acknowledges in conclusion that credit-only caps and optimal network number are left to future work. Tests one intermediate cap level (95 bps). Analyzes asymmetric regulation (Durbin) showing debit-only cap is worse than alternatives.<br><br>**What's missing:** (1) No systematic exploration of optimal cap level (grid search over 20bp, 30bp, 40bp, etc.), (2) No credit-only cap counterfactual (tests debit-only but not mirror scenario), (3) No intermediate competition scenarios (duopoly, triopoly), (4) No characterization of optimal network number.<br><br>R4's critique is valid and acknowledged by authors. The question is whether "future work" acknowledgment is sufficient for publication or whether journal standards require more complete policy space exploration. For a policy paper, testing only extreme scenarios (monopoly vs. status quo, 30bp vs. 95bp caps) may seem thin. |
| **R4-6** | **Network Competition Based on Extreme Scenario:** Finding that network competition reduces welfare based on extreme/unrealistic scenario (merging all networks to monopoly). More moderate scenarios between competition and monopoly not explored. Tension between "competition reduces welfare" but "public option improves welfare"—what's optimal network configuration? | `counterfactuals.tex:126-137`<br><br>`intro.tex:38-39`<br><br>Conclusion: line 150 | **Main discussion (lines 126-137):**<br>"U.S. policy favors competition, but competition in payment markets can backfire. It exacerbates price coherence distortions by encouraging high-fee, high-reward card adoption. I model extreme competition reduction via monopoly merger, with fees and rewards set to maximize industry profits.<br><br>Under monopoly: credit card rewards fall 94 bps; merchant fees rise 18 bps; debit card rewards also fall... Competition modestly helps consumers ($6B welfare gain) but slashes network profits ($26B). The margin of gain is uncertain given wide standard errors. Total welfare declines $16B because competition fuels reward competition...<br><br>This paradox hinges on price coherence. Competing networks must fund rewards through merchant fees; a monopolist can cut rewards without competitive pressure. These results do not endorse mergers—the consumer benefits are too uncertain—but they show that price regulation, not competition alone, is needed."<br><br>**Conclusion (line 150):**<br>"Second, while I examine a merger to monopoly, a fuller analysis would characterize the optimal number and composition of competing networks." | **Partially addressed** (concern valid but acknowledged) | **What's addressed:** Paper explicitly acknowledges monopoly is an extreme scenario. States "These results do not endorse mergers." Emphasizes point is to show competition can backfire under price coherence. Notes large standard errors on consumer welfare effect ($6B). Conclusion explicitly lists optimal network structure as future work.<br><br>**What R4 correctly identifies:** No intermediate competition scenarios tested (duopoly, removing one network, etc.). No exploration of optimal network structure. Tension with public option not explicitly resolved—if adding a low-cost public network helps, why does reducing competition (monopoly) also help? These seem contradictory without explanation.<br><br>The monopoly comparison is illustrative but incomplete. A more thorough analysis would test: (a) removing AmEx only, (b) merging two networks, (c) characterizing optimal N. This would show whether the result is about *competition per se* or about *three networks specifically being worse than one.* |
| **R4-7** | **Lucas Critique Vulnerability:** Model assumes card features (checking availability, qualification, service quality) are fixed and independent of fees/rewards. Consumer preferences treated as exogenously given. Post-Durbin, banks endogenously adjusted features (reduced free checking, raised fees, minimum balances). Post-fee-caps, issuers might tighten credit qualification, adjust lending terms, degrade service quality. Without accounting for broader impacts, welfare analysis may be incomplete or misleading. | `model.tex:263-265`<br><br>`counterfactuals.tex:105-106, 150-151` | **Model assumptions (lines 263-265):**<br>"I assume non-rewards credit card characteristics do not change when rewards change. Australia's fee regulation showed no short-run effects of interchange fee caps on interest rates or annual fees (Appendix Figure OA.7). This is consistent with high-volume transactors accounting for little credit card borrowing. The counterfactuals are best interpreted as short-run predictions. Longer-run issuer responses to fee regulation are not modeled."<br><br>**Durbin context (lines 105-106):**<br>"The Durbin Amendment caused around a 75 basis point decline in interchange but only around a 25 basis point change in rewards. Banks responded to the decline in interchange by also raising fees on checking accounts. To obtain an empirically realistic estimate of the effect of Durbin on payment choice, I model the repeal as lifting the cap by 25 bps."<br><br>**Conclusion (lines 150-151):**<br>"Third, the model assumes networks do not adjust non-price characteristics (such as credit limits or fraud protection) in response to fee caps; longer-run effects may differ if networks strategically degrade quality. I leave these extensions to future work." | **Fully addressed** (transparent acknowledgment with supporting evidence) | **What's addressed:** Paper explicitly acknowledges this limitation in model assumptions section. Cites empirical evidence from Australia that short-run effects on non-price terms are limited. States counterfactuals should be interpreted as short-run predictions. Acknowledges in Durbin discussion that banks raised checking fees (captures one endogenous response by adjusting counterfactual to match empirical 25bp reward change). Conclusion explicitly notes quality degradation not modeled.<br><br>**What's missing:** No attempt to model endogenous quality responses. No quantitative discussion of how this might affect welfare estimates. No sensitivity analysis on this assumption. Australian evidence is from one country; may not generalize to U.S.<br><br>**Assessment:** R4's critique is valid but authors are completely transparent about it. They acknowledge the Lucas critique concern, provide empirical evidence it's limited in short run, frame results explicitly as "short-run predictions," and list endogenous quality as future work. This is intellectually honest treatment of a genuine limitation. The question is whether transparency is sufficient or whether journal/R4 requires actually modeling the endogenous response. For short-run policy analysis, transparency may be adequate; for long-run structural predictions, it may not be. |

---

## Summary Assessment

### Concerns by Address Status

**Fully Addressed (2/7):**
- R4-2 (Debit-credit substitutability): Strong empirical and theoretical response
- R4-7 (Lucas critique): Transparent acknowledgment with supporting evidence

**Partially Addressed (4/7):**
- R4-1 (Durbin interpretation): Acknowledges broader response but doesn't engage specific mechanisms
- R4-3 (Model misspecification): Robustness checks on magnitudes, not conceptual critique
- R4-4 (Social optimum): References Rochet-Tirole but no formal derivation in paper's model
- R4-5 (Incomplete counterfactuals): Explicitly acknowledged as future work
- R4-6 (Extreme scenario): Acknowledged as extreme, doesn't endorse mergers

**Not Addressed (1/7):**
- None—all concerns have at least some treatment

### Key Strengths of Manuscript Response

1. **Transparency:** Model assumptions section is extensive and candid about limitations
2. **Empirical Support:** OA.1 provides substantial validation of key assumptions (Discover experiment, merchant evidence)
3. **Robustness:** Multiple appendices test alternative specifications (substitution, reward sensitivity, pass-through)
4. **Acknowledgment:** Conclusion explicitly lists extensions left to future work (credit-only caps, optimal network number, quality degradation)

### Critical Gaps from R4's Perspective

1. **Durbin Interpretation (R4-1):** Paper acknowledges estimate captures "broader response" but doesn't engage with R4's specific critique about overall debit growth, differential issuer promotion, relative vs. absolute effects. The footnote 44 deflection ("if I'm wrong, conclusions stronger") may not satisfy a skeptical referee.

2. **Model Misspecification Discussion (R4-3):** No explicit engagement with possibility that core identification strategy could be conceptually flawed (not just parametrically uncertain). Robustness checks test "what if parameter is half as big" but not "what if parameter doesn't measure what we think."

3. **Analytical Benchmark (R4-4):** Numerical counterfactuals without formal characterization of social optimum in the paper's framework. This makes it hard to understand whether results are driven by functional forms or fundamental economics.

4. **Policy Space Exploration (R4-5, R4-6):** Only extreme scenarios tested (monopoly, 30bp vs. 95bp caps). No credit-only cap, no intermediate competition levels, no optimal network number. For a quantitative policy paper, this may seem incomplete.

---

## Recommendation for Response Letter

### Priority 1: Must Address for R4's Reconsideration

**R4-1 (Durbin Interpretation):**
- Add discussion acknowledging DD estimate is *relative* effect (regulated vs. exempt) not *absolute* consumer response
- Directly address that overall debit grew post-Durbin (consistent with cash replacement) while regulated issuers lost share
- Explain why "full behavioral response" (including bank advertising) is the right object for modeling network competition
- Provide additional evidence isolating reward channel beyond just the DD estimate (the Discover experiment in OA.1 should be highlighted)

**R4-3 (Model Misspecification):**
- Add explicit paragraph: "If the Durbin estimate is biased upward (as R4 suggests), our model would overstate reward sensitivity. However, we show qualitative conclusions are robust to halving the parameter, and the Discover evidence provides independent validation of reward effects."
- Quantify: "At what level of reward sensitivity would policy rankings reverse?" This shows conclusions aren't knife-edge.

### Priority 2: Strengthen Existing Treatment

**R4-4 (Social Optimum):**
- Consider adding brief appendix section with analytical characterization of inefficiency
- Even simplified model (homogeneous merchants) showing FOCs for planner vs. market would help
- Or expand intro discussion to more clearly articulate *why* market equilibrium is inefficient (what externality isn't internalized)

**R4-5, R4-6 (Counterfactual Completeness):**
- If feasible, add: (a) credit-only cap counterfactual, (b) one intermediate competition scenario (e.g., remove AmEx only)
- If not feasible, strengthen conclusion discussion of why these are important future work and what we'd expect to find
- Explicitly address tension: "Why does public option help but monopoly also help?" (Answer: public option adds low-cost choice without eliminating competition; monopoly reduces wasteful reward competition but harms consumer choice)

### Priority 3: Tone and Framing

**What R4 Needs to Hear:**
- "Referee 4 raises fundamental questions about our identification strategy. We appreciate the opportunity to provide additional evidence and clarification."
- Then: *actually provide that evidence* (Discover, merchant testimony, robustness analysis)
- "We acknowledge our counterfactuals are short-run predictions and cannot model all endogenous responses. We are transparent about this limitation and provide empirical evidence from Australia that short-run effects on non-price terms are limited."
- "We agree that a complete policy analysis would characterize optimal fee levels and network structure. We view our counterfactuals as establishing that current policy distortions are first-order and directionally clear, while leaving fine-tuning to future work."

**What to Avoid:**
- Dismissing concerns as "already addressed in the paper" without engaging substance
- Treating R4 as unreasonable or overly demanding
- Claiming robustness without showing it

---

## Bottom Line

**Can R4 be persuaded?** Yes, but it will require substantive additions, not just pointing to existing text.

**What would change their mind:**
1. Direct engagement with Durbin interpretation critique (not deflection)
2. Explicit discussion of model misspecification risk and robustness
3. Either analytical characterization of optimum OR clearer exposition of economic mechanism
4. Either additional counterfactuals (credit-only cap, intermediate competition) OR stronger justification for focusing on extreme scenarios

**What won't change their mind:**
- "We already discussed this in footnote X"
- "Robustness checks show conclusions are unchanged" (without addressing the conceptual critique)
- "We acknowledge limitations" (without showing limitations don't undermine conclusions)

R4 is a serious scholar with legitimate concerns. They can be persuaded, but only by taking their concerns seriously and providing substantive responses. The good news: much of what they want already exists in the paper (OA.1 evidence, robustness checks, transparent limitations discussion). The challenge: making that evidence salient and directly addressing their specific critiques rather than relying on readers to connect the dots.
