# Structure Analysis

**Paper:** "Regulating Competing Payment Networks" by Lulu Wang
**Type:** B (Specialized topic needing institutional context)
**Date:** 2026-03-06

---

## 1. Section Flow

The paper follows a clean, logical progression:

1. **Introduction** (~130 lines + 15-line literature review) -- Central question, all results previewed, positioning
2. **Institutional Details and Data** (combined section) -- Payment flows, interchange mechanics, five data sources
3. **Reduced-Form Facts** (~175 lines) -- Three facts establishing the competitive bottleneck
4. **Model** (~340 lines) -- Three-stage game: consumers, merchants, networks
5. **Estimation** (~210 lines) -- Parameter recovery, sensitivities, goodness of fit
6. **Counterfactuals** (~260 lines) -- Four policy experiments plus discussion
7. **Conclusion** (~20 lines) -- Summary and generalization

There are no logical gaps. Each section builds directly on what precedes it. The reduced-form facts (Section 3) serve double duty: they are interesting empirical contributions on their own and provide the identifying variation for estimation (Section 5). The counterfactuals (Section 6) directly answer the questions posed in the introduction.

One minor redundancy: the introduction previews every counterfactual result with specific dollar figures. This is thorough but long. The payoff is that readers can assess the full contribution without reading past the third page.

---

## 2. Narrative Arc

The central question is stated early and clearly: **Does competition among payment networks help or harm welfare, and what policies correct the distortion?**

The narrative arc is unusually tight for a structural IO paper:

- **Setup (Sections 2--3):** Competition channels toward consumers, not merchants. Three facts establish this "competitive bottleneck."
- **Mechanism (Section 4):** The model formalizes why the bottleneck generates excessive fees and rewards.
- **Quantification (Sections 5--6):** Consumers are 10x more reward-sensitive than merchants are fee-sensitive. Counterfactuals show this asymmetry makes competition harmful.
- **Punchline (Section 6 + Conclusion):** "The direction of competition matters more than its intensity."

Every section advances this arc. There are no detour sections. The "competitive bottleneck" concept threads from the introduction through the conclusion, providing narrative coherence.

---

## 3. Balance

| Section | Approx. Length | Assessment |
|---|---|---|
| Introduction + Lit Review | ~145 lines | Long but justified; previews all four counterfactuals with dollar amounts |
| Institutional Details | ~45 lines | Concise; Figure 1 (payment flow diagram) carries heavy explanatory weight |
| Data | ~90 lines | Compact; five data sources with details deferred to appendix |
| Reduced-Form Facts | ~175 lines | Well-proportioned; three subsections of roughly equal weight |
| Model | ~340 lines | Longest section; justified given the three-stage game with CES demand, random coefficients, and equilibrium selection |
| Estimation | ~210 lines | Proportionate; includes substantial goodness-of-fit validation |
| Counterfactuals | ~260 lines | Appropriate for four policy experiments plus a five-topic discussion subsection |
| Conclusion | ~20 lines | Very short; almost telegraphic |

The **model section** is the heaviest, which is appropriate for a structural paper where the modeling contribution is central. The backward-induction presentation (Stage 3 before Stage 2 before Stage 1) is standard and correct.

The **conclusion** is notably brief at roughly 20 lines. The introduction already previews all results, so this is not a gap in content -- but a slightly longer conclusion could discuss limitations, future work, or the generalizability argument (app stores, hotel platforms) in more depth.

The **institutional details** subsection is lean at ~45 lines. For a Type B paper, this is efficient but risks under-serving readers unfamiliar with interchange fee mechanics. The payment flow diagram does substantial work. The Australian interchange evidence is a strong institutional fact that motivates treating interchange as the key policy lever.

---

## 4. Institutional Context Placement

The institutional section is well-placed immediately after the introduction. It establishes:

- How interchange fees flow between merchants, acquirers, issuers, and consumers (Figure 1 with representative dollar amounts)
- That interchange strongly affects merchant fees and rewards but not borrowing costs (Australian evidence)
- The distinction between open-loop (Visa/MC) and closed-loop (AmEx) networks

This placement works because the reduced-form section (Section 3) immediately uses these concepts. The Durbin Amendment analysis in Section 3.1 requires understanding interchange; the merchant acceptance evidence in Section 3.2 requires understanding merchant discount fees.

The institutional section wisely avoids covering price coherence and surcharging in depth, deferring to the model assumptions discussion (Section 4.5). This prevents front-loading too much theory before the reader has seen the empirical facts.

Combining institutional details and data under one section heading avoids a proliferation of short top-level sections. The data subsection references institutional features (e.g., the Durbin threshold for the issuer panel) but is primarily about measurement.

---

## 5. Model-to-Estimation Bridge

The transition from model to estimation is smooth. The estimation section opens: "Estimation links the reduced-form facts to quantitative predictions about regulation and competition." It then explicitly maps each parameter group to its identifying variation:

- Consumer price sensitivity ($\alpha_0$) <-- Durbin Amendment (reduced-form Fact 1)
- Substitution patterns ($\Sigma$) <-- Second-choice survey
- Multi-homing complementarities ($\chi^{lm}$) <-- Homescan wallet data (reduced-form Fact 3)
- Merchant types ($G(\gamma)$) <-- Grocery acceptance event studies (reduced-form Fact 2)
- Network costs ($c_j$) <-- First-order condition inversion

This three-component identification argument (consumer demand, network costs, merchant types) is clearly organized. The goodness-of-fit subsection (5.3) validates against untargeted moments: AmEx OptBlue acceptance response, retail margins from macro studies, and network costs from accounting data. This builds credibility before the counterfactuals.

The merchant type estimation (Section 5.1.3) honestly acknowledges it is "closer to a calibration exercise than a conventional estimation" and that standard errors exclude model error from extrapolating beyond grocery. This candor is valuable but could be strengthened with a forward reference to the specific robustness checks that vary these assumptions.

One structural observation: the paper's key empirical finding -- the 10-to-1 consumer-merchant sensitivity asymmetry -- appears in Section 5.2 ("Merchant and Consumer Sensitivities and Credit Aversion") rather than as the headline of the estimation section. This is the empirical confirmation of the competitive bottleneck and could be more prominently positioned.

---

## 6. Counterfactual Motivation

Each counterfactual is well-motivated by earlier material:

- **Fee caps (120 bps):** Directly addresses the central question. Motivated by international precedent (EU, Australia, Canada) and the competitive bottleneck mechanism. The choice of 120 bps is justified by comparison to the Ramsey planner's optimum in the online appendix.
- **Durbin repeal:** Motivated by reduced-form evidence on the Durbin Amendment (Section 3.1). Tests the market power hypothesis: if fee caps always help, removing the debit cap should hurt. The finding that repeal *raises* welfare is the most counterintuitive result and is well set up.
- **Monopoly merger:** Motivated by the theoretical prediction that competition can be harmful. Carefully framed as a thought experiment, not a policy recommendation. The paper explicitly states: "This counterfactual is not a justification for letting networks merge."
- **Dual routing:** Motivated by the multi-homing evidence (Section 3.3) and the Credit Card Competition Act. Provides a constructive, market-based alternative to fee caps.

The ordering is strategic: fee caps (headline result) first, then Durbin repeal and monopoly (challenging conventional wisdom), then dual routing (constructive alternative). The discussion subsection handles five robustness topics (constraints vs. preferences, choice of cap, pass-through, rewards as proxy, robustness appendix) without interrupting the main flow.

---

## 7. Key Strengths

- **Tight narrative unity.** Every section serves the central argument that competition direction matters more than intensity. The "competitive bottleneck" concept threads from abstract to conclusion.
- **Reduced-form facts do double duty.** Each fact is an independent empirical contribution and provides identifying variation for the structural model.
- **Counterfactuals build cumulatively.** Fee caps, Durbin repeal, and monopoly collectively establish that the problem is not market power. Dual routing then offers the market-based solution.
- **Unusually thorough assumptions discussion.** Section 4.5 addresses seven distinct modeling choices (credit-debit segmentation, fixed costs, merchant types, non-rewards characteristics, price coherence, tacit coordination, issuer-acquirer consolidation), each with empirical support or online appendix references.
- **Distributional results throughout.** Effects by income group are reported for every counterfactual, strengthening policy relevance.
- **Well-organized appendix system.** Clear separation between main appendices (A: Data, B: Model, C: Estimation) and online appendices (OA.1--OA.8), with the online appendices ordered by topic relevance.
- **Effective goodness-of-fit section.** Validation against untargeted moments (AmEx OptBlue, retail margins, network accounting costs) builds credibility for the counterfactuals.

---

## 8. Suggestions

### - [ ] Consider expanding the conclusion
The conclusion is approximately 20 lines and reads as a condensed abstract reprise plus one paragraph on generalizability. It could benefit from 1--2 paragraphs on: (a) what the model cannot address (dynamic entry, long-run innovation incentives, international spillovers from unilateral fee caps), and (b) more development of the generalization to other two-sided platforms. The final sentence on app stores and hotel platforms is valuable but underdeveloped.

### - [x] Elevate the 10-to-1 sensitivity asymmetry as the lead estimation result
The finding that consumers are ten times more sensitive to rewards than merchants are to fees is the empirical confirmation of the competitive bottleneck -- the paper's core mechanism. Currently this appears in Section 5.2 with a descriptive subsection heading. Consider making it the opening result of the estimation section with a more declarative framing.

### - [ ] Tighten the introduction's counterfactual preview
The introduction spends roughly 70 lines (paragraphs 7--11) previewing all four counterfactual results with specific dollar amounts and mechanisms. The Durbin repeal and monopoly previews (lines 83--99) both serve to show the problem is not market power. Consider condensing one of these to free space, or combining them into a single paragraph contrasting the two.

### - [ ] Add a roadmap sentence at the end of the introduction
The introduction transitions directly from the literature review to Section 2 without a roadmap. A single sentence ("The paper proceeds as follows...") would orient readers, especially given the non-obvious combined section title "Institutional Details and Data."

### - [ ] Strengthen the forward reference from merchant type estimation to robustness
Section 5.1.3 candidly notes that merchant type recovery is "closer to a calibration exercise" and that standard errors exclude model error from extrapolating beyond grocery. Adding a brief forward reference to the specific online appendix section(s) that vary these assumptions would reassure readers that this limitation is addressed quantitatively.

### - [ ] Flag the dual-routing modeling choice earlier
The dual-routing counterfactual models the mandate as "a 25 bps reward increase that raises multi-homing" -- a stylized representation rather than a literal routing mandate. This choice is stated only in Section 6.4. Since dual routing is previewed in the abstract and introduction, briefly flagging how it will be modeled (as increased multi-homing) in the model section or introduction would preempt confusion about what exactly is being simulated.

### - [x] Add brief connecting sentences to model subsections
The model section reads as a sequence of definitions (demand, merchant pricing, merchant acceptance, consumer adoption, network optimization). Brief connecting sentences at the start of each subsection -- linking back to the reduced-form motivation or explaining why this component matters for the competitive bottleneck -- would maintain narrative momentum through the densest part of the paper.
