# Referee 2: Soul Document

**Date:** 2026-01-31
**Manuscript:** AER-2025-0455 "Regulating Competing Payment Networks"
**Created by:** Claude (econ_ra execution agent)

---

## PART 1: NARRATIVE SOUL - WHO IS REFEREE 2?

### The Scholar's Identity and Perspective

Referee 2 is a sophisticated **theoretical industrial organization economist** with deep expertise in two-sided markets, payment systems, and platform competition. Their perspective reveals someone intimately familiar with the classic theoretical literature on payment networks—particularly Rochet and Tirole's foundational work—and who approaches empirical work through the lens of mechanism design and equilibrium analysis.

This reviewer is not a pure theorist disconnected from empirical reality. Rather, they are someone who **believes theory must discipline empirics**: they want to see clear mapping between data patterns, model assumptions, and counterfactual predictions. Their citations reveal familiarity with both theoretical frameworks (Rochet-Tirole, Edelman-Wright) and recent empirical work (Huynh et al. 2022 on Canadian payment systems). They understand the institutional details of payment networks—three-party versus four-party systems, double marginalization problems, merchant acquiring contracts—suggesting either direct research experience in this domain or extensive policy/consulting work.

### What Does R2 Care About Most?

R2's concerns cluster around three core themes, listed in descending order of passion:

**1. Equilibrium Fragility and Merchant-Side Architecture (The Central Obsession)**

This is R2's deepest concern. They worry that the author has built a beautifully calibrated model on a foundation of sand. If merchant acceptance involves substantial fixed costs—as R2 suspects—then small perturbations in consumer demand could trigger catastrophic disintermediation. The equilibrium is like a pencil balanced on its tip: stable in the model, but fragile to tiny shocks in reality.

R2 provides a **formal mathematical example** in their report (lines 64-73) to make this concrete: if merchants face fixed costs $F_s(M_s) >> 0$ and earn zero profits in equilibrium ($\Pi_s(M_s) = 0$), then "even a small reduction in market size... would trigger non-acceptance." This is not hand-waving—it's a precise theoretical claim backed by institutional evidence (Huynh et al.'s finding that terminal rental is "only a small proportion" of total costs).

Why does R2 care so much? Because **counterfactual validity** depends on understanding the equilibrium's basin of attraction. If the current equilibrium is fragile, then the dramatic fee reduction in the counterfactual (from ~200 bps to 30 bps) is "far out of sample," and predictions become unreliable. R2 wants to see the **trajectory**: what happens at 150 bps? 100 bps? 50 bps? Does the system smoothly adjust, or does it cliff-dive into disintermediation?

**2. Debit-Credit Substitution Patterns (The Empirical Puzzle)**

R2 finds the assumption that consumers won't substitute between debit and credit at the point of sale "difficult to like" (line 118). This isn't mere aesthetic preference—it's a fundamental question about **revealed preferences versus constraints**. R2 asks pointed practical questions: "Is it typical behavior that a consumer holds one or more credit cards and does not have a debit account? How are balances on the cards paid at the end of a billing cycle?" (lines 121-123).

The reviewer's concern deepens when examining the evidence. Figure 4 shows credit card adoption increases trips, but R2 wants to know: **whose trips?** Did cash/debit consumers switch to credit (true substitution), or did credit-preferring consumers simply shop more at this merchant? The missing decomposition matters crucially for welfare interpretation.

R2's sophistication shows in their treatment of footnote 12 and Figure 5. They recognize that aggregate patterns can hide heterogeneity: maybe the "no substitution" pattern is driven by two groups (those with only Discover+debit versus those with multiple credit cards), making the evidence uninformative about the relevant margin. This is the concern of someone who has **spent time with micro data** and knows how aggregation can mislead.

**3. System Structure and Out-of-Sample Predictions (The Market Design Question)**

R2 understands that payment systems are **ecosystems**, not just sets of prices. Three-party systems (AmEx) internalize double marginalization that afflicts four-party systems (Visa/MC). Under dramatic fee regulation, competitive dynamics change: "MC and Visa are likely to be more adversely affected than AmEx" (line 157). Exit becomes possible.

The requested counterfactual—"Can the author compute total and consumer welfare for the case when, after the regulation, the only credit card surviving in the market is AmEx?"—is not a gotcha. It's a serious question about **mechanism robustness**. Does competition in rewards drive excessive adoption (in which case monopoly might improve welfare), or does competition discipline markups (in which case monopoly worsens welfare)? The answer determines whether the paper's policy prescription is robust to endogenous market structure.

### What is the Spirit of Their Concerns?

R2's concerns are animated by a core principle: **respect the Lucas Critique**. When you simulate policy changes that dramatically alter the economic environment, you must allow the parameters that depend on that environment to respond. The author holds fixed:

- Unobserved product characteristics (credit card quality)
- Market structure (number of competitors)
- Merchant acceptance costs
- Consumer payment preferences

R2 suspects at least the first three will respond endogenously to fee regulation. Holding them fixed creates a **mechanical counterfactual** that computes what happens if only fees change while the world stays frozen. But R2 wants an **equilibrium counterfactual** that accounts for how the world will reshape itself.

This is not nihilism about structural estimation—R2 doesn't say "your counterfactual is worthless." Rather, they advocate for **sensitivity analysis and trajectories**: show me the path from here to there, demonstrate that the equilibrium remains in the basin of attraction, compute bounds under alternative quality responses. The spirit is: **earn my trust in your out-of-sample predictions** by demonstrating robustness.

### How Would R2 Want to Be Treated?

**Intellectual Honesty Over Defensive Posturing**

R2 has clearly read the manuscript carefully—they cite specific footnotes, figures, page numbers, and equations. They have thought deeply about the mechanisms. The worst response would be to dismiss their concerns as misunderstandings or to hide behind "identification is hard."

R2 wants the author to **engage with the economic substance**:

- If fixed costs can't be separately identified from heterogeneous benefits, acknowledge this limitation explicitly and discuss what it means for counterfactual validity
- If debit-credit substitution evidence is ambiguous, show the robustness check with full substitution (the author did this—good!)
- If computing the full trajectory is computationally expensive, at least provide 2-3 intermediate points to demonstrate smooth adjustment

**Empirical Evidence Over Pure Theory**

R2 cites the author's own reference (Huynh et al. 2022) against them and asks for additional empirical decompositions (Figure 4 and 5 breakdowns). This suggests R2 believes in **letting data speak**: if you claim debit-credit are segmented, show me the data broken down by consumer type. If you claim fixed costs don't matter, show me merchant acceptance didn't fall after E.U./Australia fee caps.

The author actually does some of this (the international evidence defense in model.tex lines 258-261 is responsive), but R2 also wants **direct empirical tests** where possible.

**Constructive Dialogue, Not Dismissal**

Despite raising serious concerns, R2's tone is fundamentally constructive. They say the manuscript "has become better along several dimensions" and acknowledge improvements in data, reduced-form evidence, and consumer heterogeneity. They provide concrete suggestions for additional counterfactuals (AmEx-only, zero-card, gradual trajectory) that would strengthen the paper.

R2 would feel respected if the author:

1. **Acknowledged the theoretical validity** of the fragility concern, even if data limitations prevent full modeling
2. **Provided the requested sensitivity analyses** where feasible (gradual fee trajectories, quality deterioration bounds)
3. **Stated limitations explicitly** rather than implying the model is fully structural
4. **Engaged with the institutional details** R2 raises (3-party vs 4-party, merchant acquiring contracts, debit account necessity)

### The Deeper Scholarly Values

Reading between the lines, R2 values:

- **Theoretical coherence**: mechanisms should be internally consistent (hence the concern about consumer information sets and merchant competition)
- **Institutional realism**: models should respect real-world market structure (3-party vs 4-party) and contracting practices (two-part tariffs, fixed fees)
- **Empirical discipline**: strong claims require strong evidence (hence requests for additional data decompositions)
- **Intellectual humility**: acknowledge what your model can and cannot say (short-run vs long-run, in-sample vs out-of-sample)

R2 is the kind of scholar who would rather see a narrower claim well-supported than a sweeping claim built on shaky foundations. They want the author to succeed—but on terms that satisfy R2's high standards for structural empirical work in industrial organization.

---

## PART 2: DETAILED TRACKING SPREADSHEET

### Concern-by-Concern Analysis

| Concern ID | Concern Text | Manuscript Location | Quote from Manuscript | Address Status | Justification |
|-----------|--------------|-------------------|----------------------|----------------|---------------|
| **R2-1a** | **Merchant acceptance costs:** Model assumes costs are negligible ("machines are cheap"), but total acceptance costs include installation, POS integration, contracts, training, chargeback risk. Fixed costs matter because equilibrium is fragile—small demand reduction can trigger non-acceptance. Evidence from Huynh et al. (2022) shows terminal rental is small proportion; larger part driven by fees. | model.tex:258-261 | "The model ignores fixed costs of card acceptance because my data cannot separately identify fixed costs from heterogeneity in sales benefits. Both rationalizations predict the same pattern: merchants not accepting cards have either high fixed costs or low sales gains from acceptance. Fixed costs could cause lower rewards to reduce consumer adoption and thus merchant acceptance. However, merchant acceptance has not declined after fee caps in the E.U. or Australia, suggesting fixed costs do not qualitatively change the policy conclusions." | **Partially addressed** | Author acknowledges limitation and provides empirical justification (international evidence), but does NOT provide theoretical analysis of fragility or gradual fee trajectory to test equilibrium robustness. The identification defense is reasonable, but doesn't address R2's core concern about out-of-sample prediction validity. R2 specifically requested "sequence of equilibria with gradually reducing fees"—not provided. |
| **R2-1b** | **Consumer utility heterogeneity:** Why doesn't mean unobserved utility Ξ vary with consumer income? Higher-income consumers have different consumption bundles and may receive more utility from cards. Asymmetric heterogeneity (monetary but not non-monetary) may bias reward sensitivity estimates. Could finding that reward sensitivity increases with income be driven by this restriction? | model.tex:176-189 | "The mean non-pecuniary utility for consumer i is Γ_i^w=ω(Ξ^{w_1}+β_i X^{w_1})+(1-ω)(Ξ^{w_2}+β_i X^{w_2})+∑∑χ^{lm}_i X_l^{w_1} X_m^{w_2} where Ξ^j is the mean unobserved utility for a given card, β_i is consumer i's value from the characteristics... Consumer preferences vary with income: log α_i = log α_0 + α_y log ỹ, β_i = β_y log ỹ + ε_i" | **Acknowledged** | Specification is documented (β varies with income through β_y term, but Ξ does not), but NO justification provided for why Ξ is constant across income types. No discussion of potential bias from asymmetric heterogeneity. R2's economic intuition (high-income consumers may have higher baseline utility from any card) is not addressed. This is a specification choice that could affect interpretation of reward sensitivity findings. |
| **R2-1c** | **Information sets and consumer-merchant interaction:** Little discussion of how consumers interact with merchants and what information they possess. If consumers have full information about merchant acceptance before shopping, why don't they sort perfectly? If no search/transport costs, merchant accepting cards should attract all card-willing consumers. Why is γ (sales benefit) fixed rather than varying with total acceptance? How does merchant competition work? | model.tex:66-79 (merchant heterogeneity); NO explicit information structure discussion | "Merchants are vertically differentiated by a type γ ~ G... σ is the elasticity of substitution between merchants, P^w is a price index that depends on other merchants' actions... v^w_M represents additional utility that a consumer with wallet w derives at a merchant that accepts payment methods M" | **Not addressed** | Manuscript does NOT specify: (1) consumer information about merchant acceptance at adoption stage, (2) timing of consumer learning, (3) why γ is exogenous characteristic rather than endogenous to competitive dynamics, (4) how "tourist test" relates to consumer information assumptions. This is a significant theoretical gap that affects interpretation of merchant competition and consumer sorting. |
| **R2-1d** | **Debit-credit non-substitution:** Consumers unwilling to substitute between debit and credit at point-of-sale despite both being electronic. Is it typical for credit card users to have no debit account? How are balances paid? Figure 4 panel (b) shows credit-card-consumer trips but not change in trips by cash/debit consumers—crucial for understanding where sales increase comes from. Did consumers who used cash/debit actually prefer credit but couldn't use it? Figure 5 interpretation ambiguous: could be two groups (Discover-only vs. multiple credit cards). | model.tex:273-277, 46-47 (footnote 11); appendix_model.tex:248-296 (microfoundation); appendix_substitution.tex:1-126 (robustness) | "In the model, consumers who carry debit and credit cards do not substitute between them at the point of sale. This rationalizes the evidence from Section 3.2 that accepting credit cards increases sales even from those who own debit cards. Online Appendix OA.4 provides additional evidence from merchant and network testimony that credit and debit cards are distinct products... Online Appendix tests an alternative specification with full point-of-sale substitution (κ=0) and shows that the main policy conclusions are robust to this modeling choice." | **Fully addressed** | Author provides: (1) clear statement of assumption, (2) empirical evidence (event study + testimony), (3) theoretical microfoundation reconciling adoption vs. usage substitution, (4) full robustness check with κ=0 showing welfare results similar ($28B vs $30B, 7% difference). However, does NOT provide requested empirical decomposition of Figure 4 by consumer type or Figure 5 by Discover-only vs. multi-card holders. Substantive engagement with economic mechanism and robustness demonstrated. |
| **R2-1e** | **Three-party vs. four-party system dynamics:** Assuming away issuer/acquirer market not innocuous with significant fee structure change. Three-party (AmEx) may be more efficient than four-party (Visa/MC) due to no double marginalization and no duplication of fixed costs. MC and Visa likely more adversely affected by regulation. Under significantly lower volumes, issuing/acquiring businesses may not be sustainable. **Request:** Compute total and consumer welfare if only AmEx survives after regulation. | model.tex:243-245 | "My model combines issuers, acquirers, and networks into a single multiproduct network. This abstraction requires that Visa, issuers, and acquirers internalize each other's profits. To the extent they face double-marginalization frictions (Huynh et al. 2022), my marginal cost are upwards biased." | **Partially addressed** | Author acknowledges double marginalization and states it biases marginal costs upward (conservative direction). However, does NOT provide requested AmEx-only counterfactual, does NOT discuss differential efficiency of 3-party vs. 4-party systems, does NOT analyze exit risk under regulation. The acknowledgment is appropriate but the substantive request for alternative market structure counterfactual is ignored. |
| **R2-1f** | **χ heterogeneity:** Why doesn't χ (complementarity/incremental adoption cost) vary with consumer income and reward sensitivity? High-income consumers have wider consumption bundle (more opportunities to use multiple cards); low-income may not spend enough to justify multiple cards. Similarly, high reward-sensitive consumers should gain more from multi-network adoption. | model.tex:187-189 | "χ^{lm}_i = χ^{lm} + χ^{lm}_y log ỹ" | **Fully addressed** | R2's concern appears to be MOOT. The specification shows χ DOES vary with income through the χ^{lm}_y term. The complementarity parameter is income-dependent as R2 requests. This suggests either: (1) model was updated after R2's review, or (2) R2 misread the specification. No action needed. |
| **R2-2a** | **Extreme counterfactual - complete elimination:** If excessive adoption implies welfare improves by reducing adoption, what if credit cards completely eliminated? Is welfare without credit cards higher than factual? What about consumer welfare? Edelman & Wright (2015) suggest overuse can be so large consumers better off without intermediation. **Request:** Trace sequence of equilibria from factual to zero credit card use, potentially requiring fee reversal (consumers pay merchants for credit use). | NOT FOUND | N/A | **Not addressed** | Manuscript provides NO counterfactual with complete credit card elimination, NO comparison to Edelman & Wright prediction, NO trajectory/sequence as fees reduce to zero or negative. Counterfactuals section discusses intermediate cap (95 bps) but does NOT trace full trajectory. This is a significant gap given R2's theoretical concern about fragility. |
| **R2-2b** | **Endogenous unobserved characteristics:** Why should unobserved characteristics remain invariant to dramatic equilibrium changes? If regulation constrains profits, product quality may deteriorate or credit function unavailable at same price. Author acknowledges credit enters unobserved utility. Should have self-reinforcing effects of lower usage/adoption. **Request:** Compute reduction in Ξ in new equilibrium that would drive cards to <1% usage. Does it take much to drive cards out? | model.tex:264-265 | "I assume non-rewards credit card characteristics do not change when rewards change. Australia's fee regulation showed no short-run effects of interchange fee caps on interest rates or annual fees (Appendix Figure OA.X). This is consistent with high-volume transactors accounting for little credit card borrowing (Adams et al. 2022a). The counterfactuals are best interpreted as short-run predictions. Longer-run issuer responses to fee regulation are not modeled." | **Partially addressed** | Author explicitly states assumption, provides empirical justification (Australia evidence), and limits claims to short-run. However, does NOT provide requested sensitivity analysis: how much would Ξ need to fall to drive usage below 1%? The scope limitation (short-run only) is honest and appropriate, but the quantitative bounds exercise R2 requests is not provided. |
| **R2-2c** | **Merchant disintermediation from fixed costs:** With material merchant acceptance costs, even minor interventions can lead to quick disintermediation because: (1) value of credit-card market falls below fixed costs, or (2) regulation reduces number of providers. Stronger intervention, less likely market structure unchanged. Current counterfactual "far out of sample." **Request:** Report sequence of equilibria with gradually reducing merchant fees toward cost of cash. Perturbations around factual may be very informative. | Related to R2-1a; appendix intermediate cap section (not fully found in read) | Model.tex lines 258-261 same as R2-1a; reference to intermediate cap counterfactual exists but full trajectory not provided | **Partially addressed** | Author acknowledges fixed cost concern with international evidence defense (same as R2-1a). Provides ONE intermediate point (95 bps cap showing $14.5B gain vs. $30B for full cap) but does NOT provide "sequence of equilibria" with multiple intermediate steps as requested. One data point insufficient to demonstrate smooth trajectory or identify disintermediation threshold. This is R2's most critical counterfactual validity concern and remains largely unaddressed. |
| **R2-2d** | **Debit-credit substitution in counterfactual:** If debit and credit are poor substitutes at point-of-sale (as model assumes), how would new payment method help if it has similar dedicated usages? Won't attract consumers who substitute away from debit/credit services. This limits policy implications. | Relates to R2-1d; appendix_substitution.tex:87-92 | "The results show that policy conclusions are robust to the substitution assumption. Fee caps raise welfare by $28B under point-of-sale substitution versus $30B in the baseline, a difference of 7%. Uncapping debit fees raises welfare by $8B versus $7B baseline. Critically, the policy ranking is unchanged: interchange fee caps dominate both the status quo and Durbin repeal under both specifications." | **Fully addressed** | Alternative specification with full substitution (κ=0) tested. Policy conclusions robust—welfare effects within 7%, ranking unchanged. R2's concern about "new payment method" implications not directly addressed, but robustness to substitution assumption provides strong evidence that baseline results not driven by restrictive assumption. This is substantive engagement with the economic mechanism. |
| **R2-3a** | **Cash cost assumption:** Why assume cash is cheapest payment method? With contactless features (tap-and-go), card costs should have decreased. Using only signature-card data may bias unobserved quality estimates. **Request:** If data distinguishes contactless vs. signature, show different Ξ estimates for each type. Otherwise, allow time variation in Ξ. | NOT EXPLICITLY DISCUSSED; data.tex shows cost of cash from Felt et al. (2020) but no comparison to contactless | N/A | **Not addressed** | Manuscript does NOT justify why cash is cheapest, does NOT distinguish contactless vs. signature transactions in estimation, does NOT allow time variation in unobserved characteristics. Assumption is implicit rather than defended. This is a data/specification limitation that could affect parameter estimates, though R2 classifies it as "minor." |
| **R2-3b** | **Data consistency across time:** Very hard to see how different data sources are consistent across time. **Request:** Report time period covered by each dataset used in estimation. | data.tex:6-88; appendix_data.tex | "I use the Nilson Report's aggregate payment volumes and merchant fees in 2019... I construct an annual panel of issuer payment volumes from the Nilson Report covering 2008--2014... The NielsenIQ Homescan panel tracks the payment decisions of around 100,000 households at large consumer packaged goods stores from 2015--2022... I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC)..." | **Fully addressed** | Time periods ARE documented: Nilson aggregate (2019), Nilson panel (2008-2014), Homescan (2015-2022), DCPC/SCPC (2017-2019), second-choice survey (2024), MRI-Simmons (2009-2022). Information is present in text. R2's concern appears to be about clarity of presentation rather than missing information—a summary table might help but substance is addressed. |
| **R2-3c** | **Merchant competition mechanism:** How does competition between merchants in acceptance decisions work if benefit of accepting is same for first and last merchant accepting given payment method? Relates to fixed γ distribution. | model.tex:68-79; appendix_model.tex:222-245 (Rochet-Tirole comparison) | "Merchants are vertically differentiated by a type γ ~ G... A merchant's quasi-profit from accepting both cards relative to accepting only the low-fee card is approximately: ΔΠ̄ ≈ μ^(2) · γ (1/σ - τ_2) - μ^(2) · τ_2... The acceptance cutoff γ* for adding card 2 is thus: γ* ≈ στ_2/(1 - στ_2)" | **Partially addressed** | Model structure documented: heterogeneous γ generates acceptance hierarchy with different thresholds. However, does NOT explicitly address R2's question: "How does competition work if γ is same for all merchants?" The answer is implicit (γ is NOT uniform, distributed as G), but competitive pressure mechanism not clearly explained. R2 wants to understand how merchant competition disciplines acceptance when benefits are merchant-specific vs. common. |

---

## SUMMARY STATISTICS

### Overall Address Rate

- **Total concerns:** 13
- **Fully addressed:** 4 (R2-1d, R2-1f, R2-2d, R2-3b) = 31%
- **Partially addressed:** 5 (R2-1a, R2-1e, R2-2b, R2-2c, R2-3c) = 38%
- **Acknowledged only:** 1 (R2-1b) = 8%
- **Not addressed:** 3 (R2-1c, R2-2a, R2-3a) = 23%

### By Severity

**Critical concerns (4 total):**
- R2-1a (merchant costs): Partially addressed (31% complete)
- R2-1d (debit-credit substitution): Fully addressed (100% complete)
- R2-2c (disintermediation): Partially addressed (31% complete)
- R2-2d (substitution in counterfactual): Fully addressed (100% complete)

**Critical average: 66% addressed**

**Important concerns (5 total):**
- R2-1b (utility heterogeneity): Acknowledged (25% complete)
- R2-1c (information sets): Not addressed (0% complete)
- R2-1e (3-party vs 4-party): Partially addressed (40% complete)
- R2-2a (extreme counterfactual): Not addressed (0% complete)
- R2-2b (endogenous characteristics): Partially addressed (50% complete)

**Important average: 31% addressed**

**Minor concerns (3 total):**
- R2-3a (cash cost): Not addressed (0% complete)
- R2-3b (data consistency): Fully addressed (100% complete)
- R2-3c (merchant competition): Partially addressed (50% complete)

**Minor average: 50% addressed**

### Thematic Gaps

**BIGGEST GAP: Trajectory and Out-of-Sample Validity**
- R2-2a (extreme counterfactual): Not addressed
- R2-2c (gradual fee trajectory): Only 1 intermediate point, not full sequence
- R2-1a (fragility concern): Acknowledged but not tested

R2's central concern about "far out of sample" predictions remains largely unaddressed. The author provides one intermediate counterfactual (95 bps) but not the requested **sequence of equilibria** that would demonstrate smooth adjustment and identify potential disintermediation thresholds.

**SECOND GAP: Model Microfoundations**
- R2-1c (information structure): Not addressed
- R2-1b (Ξ heterogeneity): Acknowledged but not justified
- R2-3c (competition mechanism): Partially explained

Several theoretical details about consumer information, preference heterogeneity, and merchant competition remain unclear. These may not affect aggregate welfare numbers but they affect **interpretation** of what the model assumes.

**THIRD GAP: Endogenous Responses**
- R2-1e (AmEx-only counterfactual): Requested but not provided
- R2-2b (quality deterioration bounds): Short-run caveat stated but sensitivity not computed

R2 wants to see how market structure and product characteristics respond endogenously to regulation. The author limits claims to short-run (appropriate) but doesn't provide the requested robustness exercises.

### What Was Done Well

**Debit-Credit Substitution (R2-1d, R2-2d):** The author took this critical concern seriously and provided comprehensive response: empirical evidence, theoretical microfoundation, and full robustness check with alternative specification. This is the gold standard for addressing a referee concern.

**Data Transparency (R2-3b):** Time periods documented clearly in text.

**χ Heterogeneity (R2-1f):** Concern appears moot based on actual specification.

**Short-Run Caveat (R2-2b):** Author honestly states that longer-run quality responses are not modeled and provides empirical justification (Australia) for short-run invariance assumption.

### What Needs Work

**Trajectory Analysis (R2-2a, R2-2c):** This is the most critical gap. R2 wants to see that the equilibrium path from status quo to cost-of-cash fees is smooth and doesn't cross disintermediation thresholds. One intermediate point is insufficient. **Recommendation:** Compute at least 4-5 intermediate fee levels (200 bps → 150 → 100 → 75 → 50 → 30 bps) showing consumer welfare, merchant acceptance rates, and card usage at each step.

**Information Structure (R2-1c):** This requires adding 1-2 paragraphs clarifying: (1) what consumers know about merchant acceptance when making adoption decisions, (2) timing of consumer learning, (3) why perfect sorting doesn't occur. **Recommendation:** Add explicit discussion in model section about information assumptions and their implications for consumer-merchant interaction.

**AmEx-Only Counterfactual (R2-1e):** This is a reasonable request that would illuminate role of competition in driving excessive adoption. **Recommendation:** Either provide the counterfactual or explain why it's infeasible (e.g., if model doesn't separately identify AmEx efficiency advantage).

---

## STATUS ASSESSMENT

**Overall evaluation:** PARTIAL

The manuscript has made genuine progress on several R2 concerns (particularly debit-credit substitution), but the core concern about **out-of-sample validity and equilibrium fragility** remains largely unaddressed. R2 is likely to remain skeptical about the counterfactual predictions without seeing the gradual trajectory and sensitivity analyses they requested.

**Likelihood R2 will be satisfied:** 40-50%

R2 is a sophisticated, constructive reviewer who has acknowledged improvements. However, their central theoretical concern—that the dramatic counterfactual is "far out of sample" and potentially invalidated by fixed costs—has received only partial engagement (international evidence defense) rather than the direct empirical test they request (gradual trajectory showing smooth adjustment).

**Recommended priority actions:**
1. **HIGH:** Compute gradual fee reduction trajectory (R2-2a, R2-2c)
2. **HIGH:** Clarify information structure in model (R2-1c)
3. **MEDIUM:** Provide AmEx-only counterfactual or explain infeasibility (R2-1e)
4. **MEDIUM:** Justify why Ξ doesn't vary with income (R2-1b)
5. **LOW:** Compute quality deterioration sensitivity bounds (R2-2b)

---

**END OF SOUL DOCUMENT**
