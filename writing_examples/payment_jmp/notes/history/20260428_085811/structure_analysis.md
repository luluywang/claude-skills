# Structure Analysis

---

## Analysis Date: 2026-04-27

---

## Executive Summary

**Strengths:**
- The introduction is exceptionally well-structured: it opens with the punchline in paragraph 2 ("merchant fees are too high, but weak competition is the wrong diagnosis"), delivers a three-force diagnostic in paragraph 3, and previews each counterfactual with a precise dollar figure. The RAP (Research question, Answer, Positioning) is clear throughout.
- The reduced-form section (§3) cleanly links three empirical facts to the model's competitive bottleneck logic, and each subsection opener explains why that fact matters for identification.
- The estimation section (§5) explicitly maps each identified primitive back to a specific data source and reduced-form moment, providing clear identification logic.
- The counterfactuals section (§6) opens with an explicit preview of all five policies and sets out what varies versus what is fixed, giving readers a clear footing before the results arrive.
- The conclusion is short (about one page), adds the legal/policy context, and does not merely repeat the abstract.

**Priority Issues:**
1. The section-level heading for §4 ("Model") is generic. The model opener is also purely structural rather than motivation-first; readers finishing §3 do not see immediately which model features are required by, and which go beyond, the three reduced-form facts.
2. The §2 connector text in main.tex briefly previews fee flows and data but does not explain the strategic logic linking merchant fees to consumer rewards. A reader who skips §1 enters §2.1 without knowing why the fee-flow diagram matters for the paper's argument.
3. The Discussion subsection of §6 (§6.5) addresses four robustness concerns after all the main results, but its paragraphs ("Constraints vs Preferences," "Pass-through," "Reward Sensitivity," "Choice of Credit Fee Cap") are not clearly ranked by importance and do not tie back to the specific results they affect. A reader needs to know which results are most sensitive before trusting them.

**Recommended Actions:** Write a one-sentence motivation bridge at the top of §4 that connects the three reduced-form facts to the modeling choices (partial multi-homing, merchant competition, price coherence), making explicit what the model adds beyond what the facts already show.

---

## Introduction Structure

**Current structure:**
- Para 1: Policy context (Visa/MC market share, merchant fees, litigation). Starts with institution, not puzzle.
- Para 2: The thesis — "merchant fees are too high, but weak competition is the wrong diagnosis." Identifies the two-sided incentive asymmetry (consumers 10x more sensitive than merchants).
- Para 3: Three identifying forces (issuer incentives via Durbin, merchant sales gains, consumer single-homing). Introduces "competitive bottleneck."
- Para 4: Theory leaves the question open.
- Para 5: Model summary.
- Para 6: Estimation approach and key calibration numbers.
- Paras 7-12: Main counterfactual results, each with a number.
- Para 13: Literature.

**Assessment:** Very strong. The punchline arrives in para 2 after one scene-setting paragraph, well within the threshold. The RAP is complete: the question is stated (does competition raise or lower fees?), the answer is given (fees are too high because of rewards competition, not insufficient competition), and positioning happens last, in a tight related literature section.

**Issues:**
- Para 1 opens with institutional description rather than the economic puzzle. Consider leading para 1 with the puzzle ("Why do merchant fees remain high despite intense network competition?") to hook readers who know the institution.
- The roadmap is embedded in the numbered counterfactuals rather than in a separate paragraph, which is good and avoids the mechanical "the rest of this paper is organized as follows" trap. However, the four policy comparisons span six paragraphs and may be trimmed.
- The related literature section is appropriately brief and placed after the contribution.

---

## Body Section Structure

### §2 (Institutional Details and Data)

**Connector in main.tex:** "Networks charge merchants fees and pay the revenue to issuers, who return most of it to consumers as rewards. The first subsection traces this fee flow... The second subsection describes the data sources."

**Assessment:** The connector correctly frames the section as motivation for the two-sided identification strategy, but it describes structure rather than explaining why the data sources were chosen to match specific modeling needs. The link between each data source and the parameter it identifies does not appear until §5. Readers may not understand why five separate data sources are needed until after they have read §3–§5.

**Recommendation:** Add one sentence to the §2 connector in main.tex explaining that the data sources jointly identify consumer reward sensitivity, merchant sales gains, and multi-homing rates — the three inputs from §3 that feed the model. This creates a forward reference that lets readers see the purpose before they encounter the description.

### §3 (Reduced-Form Facts)

**Section opener:** "Three reduced-form facts characterize the two-sided structure of the payment market... These facts point toward a partial competitive bottleneck, but the degree of consumer multi-homing leaves the net effect of competition on fees and welfare an empirical question."

**Assessment:** Excellent. The opener previews all three facts and states why they leave a residual uncertainty that motivates the structural model. Each subsection opener also states the identifying claim before presenting evidence. The closing subsection ("The Competitive Bottleneck") serves as a transition that bridges to the model section by stating exactly what the reduced-form evidence cannot determine on its own.

**Minor issue:** §3.3 has two subsubsections (merchant multi-homing, consumer multi-homing) but §3.1 and §3.2 do not use subsubsections. The structural asymmetry is not a problem, but the §3.3 opener ("Merchants overwhelmingly accept all cards, yet only around X% of consumers use credit cards from two or more networks") states the conclusion before presenting the evidence, which is the right structure — the subsubsections then fill in the details. This works well.

### §4 (Model)

**Section opener:** "To quantify how network competition shapes fees, rewards, and welfare, I build a model with two-sided multi-homing, merchant competition, and price coherence."

**Assessment:** The opener correctly names the three modeling ingredients but does not connect them back to the three reduced-form facts from §3. A reader wants to know: which reduced-form fact motivates each modeling choice? The mapping is implicit:
- Two-sided multi-homing ← §3.3 (asymmetric multi-homing)
- Merchant competition ← §3.2 (sales gains from acceptance)
- Price coherence ← mentioned in intro but not documented in §3

The price coherence assumption is the most consequential modeling choice for welfare (it drives the prisoner's dilemma result), yet it first appears substantively in §4's discussion section as a bulleted assumption rather than as a motivated empirical claim. The intro's footnote and §4.4 paragraph handle this, but without a §3 fact to anchor it, it feels more like an assumption than an empirical finding.

**Recommendation:** Either (a) add one or two sentences at the top of §4 mapping each model ingredient to its reduced-form motivation, or (b) add a brief empirical subsection in §3 on the prevalence of price coherence (citing the 5% surcharging statistic now buried in §4.4) so the model's key friction has empirical grounding before the model is presented.

**Heading:** "Model" is generic. A declarative heading like "A Two-Sided Platform Model with Asymmetric Multi-Homing" would signal the specific modeling contribution.

**Discussion of assumptions (§4.4):** The section is well-organized. The sequencing — credit-debit segmentation first (most consequential), then two-card restriction, fixed costs, merchant types, non-rewards characteristics, price coherence, issuers and acquirers — is logical. Each paragraph honestly states whether the assumption is supported or merely convenient and where robustness checks appear. This is a strength.

### §5 (Estimation)

**Section opener:** "Estimation links the reduced-form facts to quantitative predictions about regulation and competition."

**Assessment:** Strong opener that directly states why §5 exists. The identification logic is clearly laid out in §5.1: consumer demand identified by quasi-experimental variation and surveys; network costs identified from FOCs; merchant types identified from event studies and acceptance rates. This mapping back to the data described in §2 and the facts from §3 is explicit.

**Issue:** The goodness-of-fit section (§5.2) presents three untargeted validation moments (adoption shares, merchant acceptance, network costs), but the first subsection (Consumer Demand) does not describe what these untargeted moments are before launching into them. Adding a one-sentence preview ("Three sets of untargeted moments validate the estimates...") would help readers understand the structure of the evidence before encountering each piece.

**Minor issue:** The parameter discussion in §5.1 includes a commented-out paragraph about wallet complementarity signs (chi parameters). This content exists only in inline comments, not in the prose. Whether those results belong in the main text or an appendix is a judgment call, but if the chi-parameter estimates matter for understanding multi-homing patterns, they should appear in the narrative.

### §6 (Counterfactuals)

**Section opener:** Explicitly lists five policies, states what adjusts endogenously vs. what is fixed, and defines the baseline. This is the right structure for a counterfactuals section.

**Assessment:** Each subsection opener announces the finding before the mechanism ("repealing the Durbin Amendment generates large welfare gains" in §6.2, "competition fuels the rewards arms race" in §6.3). The welfare decomposition table (Table 3) appears early in §6.1 and the narrative walks through the channels in a logical order. This is well-organized.

**Issue — §6.5 Discussion:** The Discussion section addresses four robustness concerns in sequence, but they are presented at equal weight without signaling which results are most sensitive to which assumption. The opening sentence ("Online Appendix OG re-estimates the model under alternative assumptions...") does not tell the reader which counterfactual results to trust conditionally. Specific guidance such as "the cap-fees result is robust; the monopoly result is most sensitive to reward sensitivity" should appear at the top of §6.5 rather than being inferred from the individual paragraphs.

**Issue — ordering within §6:** The Durbin (§6.2) and monopoly (§6.3) sections both argue that competition in the wrong direction is harmful, and they complement each other. The current order — cap fees, Durbin, monopoly, dual routing, CBDC — is fine. But the transition from monopoly (§6.3) to dual routing (§6.4) is abrupt. The sentence opening §6.4 ("Rather than regulating fees directly, policy can redirect the locus of network competition") provides the logical hinge but arrives after an entire section on mergers that ends with a warning against them. A one-sentence summary at the end of §6.3 pointing toward the dual routing alternative would smooth this transition.

---

## Section Ordering

**Current order:** Introduction → Institutional Details → Data → Reduced-Form Facts → Model → Estimation → Counterfactuals → Conclusion

**Assessment:** The ordering is appropriate for a structural IO paper that uses reduced-form evidence to discipline a model. The institutional details section (§2.1) correctly precedes the data section (§2.2) because readers need to understand what merchant fees and interchange are before evaluating what the data measure. The reduced-form section before the model is the right sequencing: the model is motivated by facts that require a structural explanation.

**Issue — grouping of §2.1 and §2.2:** The fee-flow diagram (§2.1) and the five data sources (§2.2) are logically distinct. §2.1 is institutional motivation; §2.2 is empirical inputs. The current two-subsection structure under "Institutional Details and Data" obscures this distinction. A reader scanning section headings sees "Institutional Details and Data" and cannot tell which part to skip if they are already familiar with the institutional background.

**Issue — placement of price coherence:** The paper's central friction — that merchants do not surcharge — is first asserted in the introduction (para 2, footnote 1), mentioned in the intro body, and then formally addressed in §4.4 as a modeling assumption. Given its centrality to the welfare results, the reader might benefit from a brief statement of the empirical prevalence in §3 or §2.1 rather than first encountering the supporting evidence (the 5% surcharging statistic) in the model assumptions section.

---

## Transitions and Headings

**Transitions:**

- Intro → §2 (main.tex connector): Functional but describes structure rather than logic. Could be strengthened with one sentence on why the fee-flow motivates the model's two-sided structure.
- §3 → §4: The closing subsection of §3 ("The Competitive Bottleneck") explicitly states what the reduced-form evidence leaves undetermined, providing a natural bridge to the model. This is a well-executed transition.
- §5 → §6: No explicit transition sentence. The counterfactuals section opener begins immediately with the five policies. Since §5 ends with a goodness-of-fit subsection and §6 is a clean break to policy results, a single sentence acknowledging that the validated model is now used for policy analysis would reduce the abruptness.
- §6 → Conclusion: The conclusion opens with a summary sentence that accurately restates the central finding and then moves to legal implications. This is a clean transition.

**Headings:**

- "Model" (§4) — generic. See recommendation above.
- "Estimation" (§5) — acceptable for a structural IO paper but could be more specific, e.g., "Identifying Consumer Reward Sensitivity and Merchant Acceptance."
- "Counterfactuals" (§6) — generic. Could be "Welfare Effects of Fee Regulation and Competition Policy."
- Subsection headings in §6 are mostly declarative: "Capping Credit Card Merchant Fees," "Repealing the Durbin Amendment," "Consumer Multi-Homing and Dual Routing" — these are good.
- §5.1 subsection "Merchant and Consumer Sensitivities and Credit Aversion" is the strongest heading in the estimation section: it signals the finding, not just the method.

**Paragraph-level transitions:**

No systematic overuse of "moreover" or "additionally" detected. The intro uses narrative logic rather than mechanical signposts. The counterfactuals section occasionally opens paragraphs with "The gains from X stem from Y, not from Z" which is a strong rhetorical pattern that signals the claim before the evidence.

---

## Conclusion

**Assessment:** The conclusion earns its place. At approximately one page, it does not repeat the abstract. It adds two elements not in the abstract: (1) the legal frame from Ohio v. American Express, providing a specific application of the structural framework to antitrust practice; and (2) the Buy Now Pay Later generalization as a contemporary analogy for the same mechanism. The final sentence — "which side of the market networks compete for matters as much as how intensely they compete" — is a quotable summary of the paper's contribution. The conclusion is a strength, not a weakness.

---

## Priority Improvements

1. **Add a motivation bridge at the top of §4.** One to three sentences mapping the three reduced-form facts from §3 to the three modeling ingredients (asymmetric multi-homing, merchant competition, price coherence) would prevent readers from treating the model as a technical detour and would clarify that the model features are empirically motivated. This is the highest-impact structural fix because the model section is where readers most often lose the thread in structural IO papers.

2. **Move or anchor the price coherence empirical evidence.** The 5% surcharging statistic is currently embedded in §4.4 as a modeling assumption defense. Because price coherence is the friction that generates all the welfare results, its empirical prevalence should be stated in §3 or the §2 connector, not introduced for the first time in the model's assumptions paragraph. Moving or cross-referencing this evidence earlier would make the model's most consequential friction feel grounded rather than assumed.

3. **Restructure the §6.5 Discussion opener.** The four robustness paragraphs currently appear as a flat list without a summary of which results are most and least robust. Adding two sentences at the top of §6.5 — e.g., "The cap-fees result is robust to all four alternatives; the monopoly welfare gain is the most sensitive, reversing under the halved reward-sensitivity target" — would let readers assess confidence before reading the details.
