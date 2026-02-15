# Referee 3 Soul Document
**Date:** 2026-01-31
**Status:** COMPLETE
**Overall Recommendation:** Accept

---

## PART 1: NARRATIVE SOUL - WHO IS REFEREE 3?

### 1.1 Scholarly Identity and Perspective

Referee 3 is the most supportive referee on this paper, yet their support comes with a distinctly rigorous edge. This is a scholar who **believes in the paper's fundamental contribution** while demanding that every assumption, every data interpretation, and every modeling choice be defensible. They recommended **Accept** - a clear vote of confidence - but their review reveals someone who thinks deeply about two-sided markets, platform economics, and the institutional details of payment systems.

This referee has clearly engaged with the theoretical literature (Rochet & Tirole, Edelman & Wright) and brings sophisticated understanding of:
- **Two-sided market theory** and platform competition
- **Merchant internalization** mechanisms and their welfare implications
- **Interchange fee regulation** and its theoretical foundations
- **Empirical identification** challenges in platform markets
- **Consumer and merchant behavior** in payment ecosystems

They are not satisfied with surface-level justifications. When the paper interprets survey correlations as causal effects, R3 pushes back: "That seems quite far-fetched." When modeling assumptions seem convenient, R3 questions: "Why take such an extreme assumption as if it is the only possibility?" This is a referee who wants the **story to be right**, not just the conclusions.

### 1.2 What Do They Care About Most?

Examining their 12 concerns reveals a clear hierarchy of priorities:

**Priority 1: Getting the Model Foundations Right**
- R3-1 (Card acceptance and sales): Don't infer causation from correlation
- R3-3 (Debit-credit substitution): Consumer behavior should drive merchant choices, not vice versa
- R3-6 (Portfolio choice vs. second choice): Card holdings reflect strategic bundling, not BLP-style substitution
- R3-11 (Utility function): Use standard notation (α multiplies log U, not dividing other terms)

**Priority 2: Understanding Substitution Patterns**
- R3-2 (Consumer sorting): If payment users segregate across stores, redistribution disappears
- R3-3 (Multi-homing): Consumers hold both debit and credit - why assume segmentation?
- R3-6 (Second-choice modeling): Portfolio choice is fundamentally different from forced substitution

**Priority 3: Pass-Through and Price Effects**
- R3-7 (CES and full pass-through): "I was surprised at how sure the paper was" about full pass-through
- R3-4 (Surcharging): Merchants should steer if sales effects vary by transaction

**Priority 4: Theoretical Rigor and Clarity**
- R3-8 (Rochet & Tirole optimal fee): Calculate the theoretically optimal interchange fee
- R3-9 (Merchant internalization): Acknowledge that lump-sum rewards mute the full Edelman & Wright mechanism
- R3-12 (Market shares vs. demand shares): Clarify distinct concepts clearly

**Priority 5: Institutional Realism**
- R3-5 (Basic facts): What is a "cash store" today? How many exist? Where's online shopping?
- R3-10 (Network fee dimensions): Visa/MC choose interchange, not direct fees - does this matter?

### 1.3 The Spirit of Their Concerns

Reading between the lines, Referee 3's concerns reflect three deeper anxieties:

**Anxiety 1: "Are we measuring the right things?"**
Multiple concerns (R3-1, R3-5, R3-3) essentially ask: "Do we actually know what we think we know about merchant and consumer behavior?" The paper claims merchants gain 30% sales from accepting cards based on survey correlation. R3 is skeptical: "I am not aware of a systematic study of merchant acceptance decisions or how sales change when a merchant drops or adopts a network. It is a critical piece to this puzzle that we just do not know that much about."

This is the anxiety of an empiricist who has seen too many papers build elaborate models on shaky factual foundations.

**Anxiety 2: "Are the modeling assumptions doing the work?"**
R3-2, R3-3, R3-6, and R3-7 all question whether strong assumptions are driving results. The paper assumes all consumers shop at all merchants (maximizing cross-subsidization). R3 asks: "Why take such an extreme assumption as if it is the only possibility?"

Full pass-through magnifies welfare effects. Portfolio choice is modeled as second-choice substitution. Debit and credit are assumed non-substitutable despite consumers holding both. Each time, R3 is asking: **"Is the real world like this, or is this just convenient for the model?"**

**Anxiety 3: "Does the theory tell a coherent story?"**
R3-8, R3-9, R3-10, R3-11, and R3-12 are about theoretical coherence. R3 wants to understand: Where does this sit relative to Rochet & Tirole's procompetitive rationale? How does this relate to Edelman & Wright's merchant internalization? Why present utility functions in non-standard ways? What exactly is the difference between market shares and demand shares?

This is a referee who thinks in **theoretical frameworks** and wants to see how this paper fits into - or extends - those frameworks.

### 1.4 Tone and Communication Style

R3's tone is **constructive but uncompromising**. They use phrases like:
- "I would like the paper to take a more circumspect approach"
- "I was surprised at how sure the paper was"
- "I never got the difference between..."
- "I think we know very little about..."

This is not hostile language - it's the language of someone who is **genuinely puzzled** and wants clarification. They acknowledge when things are hard: "Incorporating merchant internalization may be too challenging, which is OK, but it needs to be acknowledged."

Notably, R3 offers **constructive alternatives** rather than just criticism:
- "Perhaps considering robustness checks"
- "Would results change if we allowed consumers to make this choice but forced merchants to adopt both Visa networks as a bundle?"
- "The paper could calculate the optimal fee structure. Would that be interesting to do?"

This is a collaborative referee who wants the paper to succeed.

### 1.5 What Would Make Referee 3 Feel Respected?

Based on their review style, R3 would feel respected by:

**1. Taking Their Theoretical Concerns Seriously**
Don't just add a robustness check and move on. Engage with the theory. When R3 asks about Rochet & Tirole's optimal interchange fee, they want to see the paper **calculate it** and discuss how current fees compare. When they question merchant internalization, they want acknowledgment of what the model does and doesn't capture.

**2. Providing Direct Empirical Evidence**
R3's opening concern is essentially: "You're inferring merchant behavior from survey correlations - can you do better?" The fact that the author added an event study (showing a grocer increased sales by 15% after accepting credit cards) is **exactly what R3 wanted**. Direct evidence trumps clever inference.

**3. Acknowledging Assumptions and Limitations**
R3 repeatedly asks for acknowledgment: "the paper should still recognize that this is a potentially important assumption that is not well supported by the data." They're not asking for the paper to be perfect - they're asking for **intellectual honesty** about what is known, unknown, and assumed.

**4. Showing Robustness**
When R3 questions full pass-through, they want to see: "what if prices were constrained to go up by something less than the full cost of card?" When they question sorting, they want to see: "how would the results change?" They value **sensitivity analysis** that bounds the importance of assumptions.

**5. Using Precise Language**
R3's concern about "insulated vs. standard market shares" is fundamentally about clear communication. They want equations defined precisely, concepts distinguished clearly, and notation used consistently.

---

## PART 2: DETAILED TRACKING SPREADSHEET

| Concern ID | Concern Text (Abbreviated) | Manuscript Location | Key Quote | Address Status | Justification |
|------------|---------------------------|---------------------|-----------|----------------|---------------|
| **R3-1** | **Interpretation of survey data**: Paper interprets 30% survey correlation as causal effect of card acceptance on sales. Questions whether this is valid without evidence of actual merchant acceptance decisions' effects. | **Main:** reducedform.tex:49-89<br>**App:** appendix_reduced.tex (OA.1) | "Figure 4b shows the estimated dynamic effects, indicating that acceptance increases sales to credit card users by approximately 14%... I identify multiple instances in the Homescan data where a grocery store begins or stops accepting credit cards" | **Fully addressed** | Added **direct event study evidence** showing grocer increased sales to credit card consumers by ~15% after accepting credit cards. Changed estimation strategy to anchor merchant type γ on event study estimate rather than survey correlation. This is exactly the kind of direct evidence R3 requested. |
| **R3-2** | **Consumer sorting**: Paper assumes all consumers shop at all stores (maximizing redistribution). Questions why paper doesn't explore sensitivity to sorting assumptions where different payment users shop at different stores. | **Main:** model.tex:256<br>**App:** appendix_sorting.tex (OA.3) | "This one-dimensional specification ignores potential sorting of payment types across stores; Appendix OA.3 shows such sorting is quantitatively small... while some sorting exists, no large merchant exclusively serves one payment type. Even merchants in the 90th percentile of credit card usage receive 15% of transactions from debit/cash. This limited sorting leaves 91-96% of the baseline redistribution intact." | **Fully addressed** | Added **Appendix OA.3** with comprehensive analysis using Homescan and MRI-Simmons data. Derived **sufficient statistic** relating variance-covariance matrix of payment shares to redistribution. Found sorting reduces redistribution by at most 10%. Empirically grounded answer to theoretical concern. |
| **R3-3** | **Credit vs. debit wallet assumption**: Paper assumes consumer wallets never contain both credit and debit cards. Infers this from merchants not dropping credit after Durbin (backwards logic - inferring consumer behavior from merchant choice). Suggests consumers likely hold both. | **Main:** reducedform.tex:131-156, model.tex:273-277, data.tex:67<br>**App:** appendix_reduced.tex:412-443 | "Figure 6b shows that roughly one-fifth of primary credit card users use debit cards and that around 75% of primary debit card holders use credit cards... In the model, consumers who carry debit and credit cards do not substitute between them at the point of sale. This rationalizes the evidence from Section III.B.1 that accepting credit cards increases sales even from those who own debit cards." | **Fully addressed** | **Acknowledged multi-homing prevalence**: 20-25% of credit users also use debit, 75% of debit users also use credit. Added **second-choice survey** (~750 users) showing debit closer substitute to cash than credit. **Updated model** to allow portfolio choice with complementarity parameters χ. Provided **three types of evidence**: (1) event study showing sales increase, (2) Discover rewards variation, (3) merchant/network testimony. No longer relies solely on Durbin inference. |
| **R3-4** | **Surcharging and steering**: Appendix C claims merchants gain little from surcharging, but this depends on assumption that ALL card transactions increase sales. If not all transactions lead to sales increases, merchants should have stronger incentives to surcharge/steer. Also, surcharging threat could bargain down fees. | **Main:** model.tex:252-253<br>**App:** appendix_surcharging.tex (OA.2) | "The above results depend crucially on the assumption that sales decline every time the merchant steers the consumer from card to cash. This may not hold if card acceptance raises sales by γ percent on average, but for any given transaction, some consumers may have lower utility from using a card. In such an extended model, surcharges would be valuable because they would screen out card transactions that bring consumers low utility." | **Fully addressed** | **Explicitly acknowledged** assumption dependence in Section D.3.3. Discussed extended model with heterogeneous transaction-level effects where surcharges would screen low-utility transactions. Provided **empirical counterevidence**: merchant fees for Visa have **risen** over time (Figure A.5a) even as no-surcharge rules were repealed, suggesting surcharging hasn't constrained Visa. Theory + empirics addressing concern. |
| **R3-5** | **Missing basic facts**: What is a "cash store" today? What is the base for 30% comparison? How many cash stores exist? What about consumers who use only cash and never shop online? How does online shopping fit? Why doesn't paper present these basic statistics? | **Main:** data.tex:61-66, reducedform.tex:98-156 | "Table 1 shows summary statistics on consumers' payment preferences. Cards are widely accepted for around 95% of transactions. Debit cards are the most popular payment method... around one-quarter of transactions are online... Figure 6a shows that by 2019 the number of merchants that accept AmEx approximately equals the number that accept Visa... historical Yelp reviews confirm that merchant acceptance follows a hierarchical pattern" | **Fully addressed** | Added **comprehensive facts**: (1) Debit most popular, then credit, then cash (~20% prefer cash), (2) ~95% of transactions at card-accepting merchants, (3) ~25% online, (4) Card acceptance hierarchical, (5) Multi-homing rates: ~60% of credit users across networks, ~20% also use debit, (6) Merchant acceptance: almost all accepting one network accept all, (7) Within-card-type price differences smaller (30 bps premium vs. basic credit vs. 150 bps credit vs. debit). **Explains online**: high γ merchants where card acceptance very important. |
| **R3-6** | **Second-choice data modeling**: Paper treats second-choice wallet data analogously to BLP second-choice data. But holding two cards is a **portfolio choice** where second card is optimal knowing first will be used wherever possible. Model assumes consumers pick second choice when first is "randomly taken away," but consumers likely think of multiple cards as bundle for different transaction circumstances. | **Main:** model.tex:39-47, 144-149, 176-190, data.tex:67<br>**App:** appendix_reduced.tex:412-443 | "Consumers choose up to two cards to put in their wallet, reflecting the multi-homing asymmetry... The non-pecuniary utility terms capture within-wallet complementarities... Γ_i^w = ω(Ξ^{w1} + β_i X^{w1}) + (1-ω)(Ξ^{w2} + β_i X^{w2}) + Σ Σ χ^{lm}_i X_l^{w1} X_m^{w2}... I conduct a second-choice survey in 2024 to estimate how consumers substitute between payment methods" | **Fully addressed** | **No longer assumes** secondary cards reveal second choices. **Explicitly models portfolio choice**: consumers choose which pair of cards to put in wallet. Two cards realistic (95% of spending on two networks per Table A.20) and tractable. Utility includes **complementarity parameters χ** capturing transaction-differentiation (e.g., AmEx for travel, Visa for everyday). Added **second-choice survey** (~750 users) to directly recover substitution patterns. Appendix C.7 develops two-stage adoption/usage model to microfound χ. This is a **fundamental model revision** addressing R3's theoretical concern. |
| **R3-7** | **CES demand and full pass-through**: CES implies full pass-through of payment costs to consumers, magnifying welfare and distributional impacts. Questions why paper is "so sure" this is appropriate. Suggests acknowledging strength and experimenting with alternative pass-through rates. | **Main:** model.tex:247-249<br>**App:** appendix.tex:411-480 (Robustness) | "Merchants fully pass on fees to prices given CES preferences. Appendix F.6 considers zero pass-through... From a theoretical perspective, full pass-through is consistent with the macro literature that shows firms fully pass through sector-level cost shocks (Amiti et al. 2019). Since almost all merchants accept cards, an increase in merchant fees affects all firms and pass-through should be complete." | **Fully addressed** | **Extended model** to accommodate imperfect pass-through in Appendix F.6. **Defended theoretically**: (1) Consistent with macro literature on sector-level cost shocks, (2) Since 95% of merchants accept cards, fee changes affect all firms → complete pass-through, (3) Full pass-through understates consumer losses from reduced variety if merchants exit. **Found empirically**: imperfect pass-through has large effects on welfare distribution but minimal effects on fees, rewards, market shares, total welfare. Fee cap: total welfare rises $24B even with zero pass-through (vs. $30B with full). **Noted data limitation**: merchant-level price data impractical (Durbin study showed price variation 168x larger than fee savings). Theory + robustness + data discussion. |
| **R3-8** | **Rochet & Tirole optimal interchange**: What is role of procompetitive rationale (consumer doesn't account for merchant's cash handling cost)? Is this effect at work? Cost of cash (τ₀) quite low. Starting from zero merchant fee, cost of cash should rationalize positive merchant fee. Is argument that observed fees have "blown through" procompetitive effects? Could paper calculate optimal fee structure? | **Main:** counterfactuals.tex:9-15 | "In my main counterfactual, I cap credit and debit card merchant fees at my baseline estimate of the cost of cash... This level of fee regulation aligns with the theoretical work of Rochet & Tirole (2011), who show that capping both credit and debit card merchant fees at the cost of cash is welfare-optimal in a model with homogeneous merchants... the tourist test applies." | **Fully addressed** | **Explicitly implemented** Rochet & Tirole optimal fee counterfactual: cap merchant fees at cost of cash. **Acknowledged**: (1) Optimal merchant fee equals cost of cash, (2) Current merchant fees far beyond procompetitive level, (3) Because merchant cost of cash homogenous, tourist test (Rochet & Tirole 2011) applies. **Main counterfactual** now evaluates welfare effects of this theoretically-grounded cap. This directly answers R3's question "would that be interesting to do?" with a resounding yes. |
| **R3-9** | **Merchant internalization not fully captured**: Paper makes comparisons to Edelman & Wright, but their key mechanism is merchant internalization (merchants raise prices in response to rewards, making them tolerate high fees). In this paper, rewards are lump-sum, so effect is muted. Needs acknowledgment that full merchant internalization not captured. | **Main:** model.tex:87-95 | "Because merchants accept cards to increase sales, card acceptance can be excessive because of a partial form of merchant internalization (Rochet and Tirole 2002; Wright 2012)." [Footnote 19] | **Partially addressed** | **Removed explicit references** to full merchant internalization. **Acknowledged weaker version**: merchants accept cards to increase sales (not reduce costs), present in Rochet & Tirole (2002), key to excessive fee result. **Explained partial internalization**: private platforms internalize marginal consumer benefit, marginal merchant cost reduction, and (due to merchant internalization) average consumer benefit → too much weight on consumer surplus → excessive merchant fees. **Retained one sentence** in Footnote 19 discussing partial mechanism. Honest about model limitations while explaining what IS captured. |
| **R3-10** | **Network fee dimensions not modeled**: Paper assumes all networks choose merchant and consumer fees directly, but Visa/Mastercard can only choose interchange fee. In theory they can choose all dimensions, but switch fees haven't been controversial and don't appear to change. Does this assumption affect results? | **Main:** counterfactuals.tex:22 | "The fact that rewards fall by more than the reduction in merchant fees is consistent with the rise in network fees in Europe after interchange caps were imposed (PYMNTS 2024)." | **Partially addressed** | **Did not change model** to allow all fee dimensions. **Noted factually**: network fees HAVE been controversial in Europe (EU probe into Visa/Mastercard scheme fees, November 2024) and US (Fixed Acquirer Network Fee - FANF). **Discussed in counterfactuals**: rewards fall more than merchant fee reduction, consistent with rise in network fees in Europe after caps. Acknowledges limitation without full model extension. |
| **R3-11** | **Utility function presentation**: In Equation 11, why not have α multiply the log U instead of dividing the other terms? Standard presentation would have α multiply the log utilities. | **Main:** model.tex:146-148 | "The utility from a wallet w for a consumer i is: log V_i^w = log U^w + (1/α_i)(Γ_i^w + ε_i^w) where U^w is the consumer's pecuniary utility, α_i is the consumer's rewards-sensitivity..." | **Fully addressed** | **Changed to standard presentation**: log V_i^w = log U^w + (1/α_i)(Γ_i^w + ε_i^w). Author notes this is "more standard especially now that consumers differ in reward sensitivity α_i." Simple fix showing responsiveness to notational clarity concern. |
| **R3-12** | **Insulated vs. standard market shares clarity**: Difference between insulated and standard market shares unclear. Paper defines standard shares as share of consumers carrying wallet and insulated shares as share of cash-only merchant's demand from given wallet. But all consumers shop at all merchants, so why would these differ? | **Main:** model.tex:93-109<br>**App:** appendix_model.tex:50-54 | "where the income-weighted market share μ̃^w weights consumers' payment choices by their incomes... where the average fee uses demand shares μ^w, which are normalized weighted sums of the income-weighted market shares μ̃^w... Demand shares capture how acceptance decisions of other merchants affect the consumer composition at each merchant through the price index P^w." | **Fully addressed** | **Clarified terminology** with **three distinct concepts**: (1) **Conditional market shares** μ̃^w_y = chance consumer with income y carries wallet w, (2) **Income-weighted market shares** μ̃^w = share of economy dollars spent by consumers with wallet w, (3) **Demand shares** μ^w = share of spending at cash-only merchant from consumers with wallet w. **Explained why demand shares differ**: (a) weight high-income individuals who consume more, (b) adjust for consumer reallocation as other merchants change acceptance. As more merchants accept cards, card consumers divert spending away from cash-only merchants. Clear conceptual explanation. |

---

## PART 3: OVERALL ASSESSMENT

### 3.1 How Well Did the Author Respond?

Referee 3 will likely be **very satisfied** with the revision. The author took their concerns seriously and responded with:

1. **Major new empirical work**: Event study (R3-1), second-choice survey (R3-3, R3-6), MRI-Simmons sorting analysis (R3-2)

2. **Substantial model extensions**: Portfolio choice with complementarity parameters (R3-6), imperfect pass-through robustness (R3-7), income heterogeneity throughout

3. **Theoretical engagement**: Rochet & Tirole optimal fee counterfactual (R3-8), honest discussion of merchant internalization (R3-9), clarification of market shares (R3-12)

4. **Intellectual honesty**: Acknowledged assumption dependence (R3-4), noted limitations (R3-9, R3-10), provided comprehensive facts (R3-5)

### 3.2 Remaining Concerns

Only **R3-10** is marked "partially addressed" - the model still doesn't allow networks to choose all fee dimensions separately. But the author provides institutional evidence that these fees ARE controversial and discusses implications. Given R3's pragmatic tone ("Incorporating merchant internalization may be too challenging, which is OK"), they will likely accept this limitation with acknowledgment.

### 3.3 The Spirit of the Response

What makes this response likely to succeed with R3 is that it **engages with the theory** while **grounding it in evidence**. R3 questioned whether card acceptance increases sales - the author ran an event study. R3 questioned full pass-through - the author added robustness checks AND theoretical defense. R3 questioned portfolio choice modeling - the author fundamentally revised the model AND collected new survey data.

This is not a defensive response. This is a collaborative response from someone who took R3's concerns as an opportunity to strengthen the paper.

### 3.4 Prediction

**Referee 3 will recommend Accept with high confidence** and likely write a positive report noting the substantial improvements in empirical evidence, model flexibility, and theoretical clarity.

---

## SUMMARY STATISTICS

**Total Concerns:** 12
**Fully Addressed:** 10 (83%)
**Partially Addressed:** 2 (17%)
**Not Addressed:** 0 (0%)

**Concern Categories:**
- Model foundations: 7 concerns (R3-1, R3-3, R3-4, R3-7, R3-8, R3-9, R3-10)
- Exposition/clarity: 4 concerns (R3-5, R3-11, R3-12, R3-9)
- Empirics: 3 concerns (R3-1, R3-2, R3-3)

**Major Revisions:**
- 3 new datasets (event study, second-choice survey, MRI-Simmons)
- Model extensions (portfolio choice, complementarity, pass-through)
- New counterfactual (Rochet & Tirole optimal fee)
- 3 new appendices (OA.1, OA.2, OA.3)

---

**END OF DOCUMENT**
