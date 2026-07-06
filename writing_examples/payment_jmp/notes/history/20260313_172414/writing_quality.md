# Writing Quality Assessment

**Paper:** "Regulating Competing Payment Networks" by Lulu Wang
**Paper Type:** B (specialized topic needing institutional context)
**Assessed:** 2026-03-06

---

## Introduction (intro.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A     | Each paragraph has one clear job: hook, thesis, reduced-form preview, model, estimation, counterfactuals, literature. No paragraph tries to do two things at once. |
| Mechanism | A     | The causal logic is laid out explicitly: price coherence + competitive bottleneck -> rewards arms race -> excessive credit card use. The "why" is always present. |
| Precision | A     | Claims are quantified throughout ($27B, 30%, 10:1 sensitivity ratio). Falsifiable predictions (monopoly raises welfare, Durbin repeal raises welfare) are stated without hedging. |
| Economy   | A-    | Nearly every sentence earns its place. The prisoner's dilemma paragraph (lines 72-76) restates the price-coherence logic from a different angle; useful but slightly redundant with the fee-cap paragraph. |
| Clarity   | A-    | "Price coherence" and "competitive bottleneck" are introduced cleanly. The multi-homing counterfactual paragraph (lines 101-112) introduces dual routing somewhat abruptly for a reader unfamiliar with the policy debate. |

**Strongest passage:** Lines 11-19. "I argue that this view is backwards. High-merchant-fee credit cards have proliferated because of, not in spite of, intense competition." This is a model of thesis-stating: concrete, surprising, and immediately supported with the mechanism.

**Weakest passage:** Lines 72-76 (prisoner's dilemma paragraph). The point is real but restates the externality logic already covered in lines 60-65. A reader who understood the fee-cap welfare discussion does not need a second framing of the same externality. Could be cut or folded into two sentences.

### Suggestions
- [x] Consider merging the prisoner's dilemma paragraph (lines 72-76) into the fee-cap welfare discussion rather than giving it a standalone paragraph.
- [ ] In lines 101-103, briefly explain what "dual routing" means before naming the Credit Card Competition Act. The current version defines it one sentence after introducing the policy name.
- [ ] The literature review is admirably concise but the final paragraph (lines 125-128) on off-platform outcomes feels disconnected. One sentence linking price coherence to the Sullivan contrast would tighten it.

---

## Institutional Details (institutional_details.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A     | Three tight paragraphs: payment flows, representative prices, regulatory evidence. Each does one thing. |
| Mechanism | A     | The causal chain (interchange -> issuer incentives -> rewards) is traced with dollar amounts. The regulatory evidence paragraph (lines 40-44) explains *why* interchange does not affect interest rates. |
| Precision | A     | Every number is sourced. The illustrative transaction walks through exact dollar flows. |
| Economy   | A     | Very short section. No wasted sentences. |
| Clarity   | A-    | "Acquirer" and "issuer" are defined on first use, but a reader completely unfamiliar with payment networks might benefit from one more sentence on why the network sits between them rather than processing directly. |

**Strongest passage:** Lines 40-44. The regulatory shock paragraph uses external variation to validate institutional assumptions: E.U./Australia evidence, then the "70% of interest / 10% of volume" fact that explains why interchange does not affect borrowing costs. Efficient and convincing.

**Weakest passage:** None stands out. This section is tight and well-calibrated.

### Suggestions
- [ ] No substantive changes needed. This section is well-calibrated for a paper-type-B audience.

---

## Data (data.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | B+    | Each data source gets its own paragraph, which is clean. But the Homescan paragraph (lines 55-61) tries to describe the data, note its limitations, and point to appendix tables in too few sentences. |
| Mechanism | B     | The section describes *what* is in each dataset but rarely explains *why* each dataset is needed. The link to estimation is implicit throughout. |
| Precision | A-    | Good quantitative detail (100,000 households, 80% coverage of top 7 banks). |
| Economy   | B+    | Functional but not elegant. The repeated "Appendix Table X reports summary statistics" pattern appears three times in identical form. |
| Clarity   | A-    | Data descriptions are accessible. The second-choice survey (line 71) is introduced without explaining what it will identify, deferring entirely to the estimation section. |

**Strongest passage:** Lines 10-16. The aggregate prices and shares paragraph is efficient: one sentence per fact, all sourced, with a figure reference.

**Weakest passage:** Lines 55-61 (Homescan paragraph). The sentence "The large number of transactions lets me measure how consumers allocate spending across the cards in their wallets, which shapes merchants' incentives to accept high-fee cards" is vague about *how* the allocation data will be used. Connecting it explicitly to the multi-homing moments would sharpen the paragraph.

### Suggestions
- [x] Add one sentence per data source explaining what model parameter or moment it identifies. Data sections in structural papers gain substantially from previewing the estimation link.
- [x] The second-choice survey (line 71) deserves a sentence explaining what substitution patterns it reveals, rather than deferring entirely to estimation.
- [x] Consider varying the appendix-pointing language to avoid the triple repetition of "Appendix Table X reports summary statistics."

---

## Reduced-Form Evidence (reducedform.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A     | Three facts, each in its own subsection, each with one clear point. The summary paragraphs at top and bottom frame the section without redundancy. |
| Mechanism | A     | Each fact is traced to its causal mechanism. The Durbin section explains *why* large issuers cut promotion (lost incentives). The merchant acceptance section explains *why* credit cards increase sales even when all cardholders have debit (purchasing power from credit line). |
| Precision | A     | Quantified throughout. Identification strategies are stated explicitly, with threats to validity discussed honestly. |
| Economy   | A-    | The merchant acceptance section (lines 45-93) is the longest and could be tightened slightly. The Poisson specification justification footnote (line 66) is necessary but long for the main text. |
| Clarity   | A-    | The triple-difference design is well-explained, but the Poisson regression equation (lines 59-63) uses dense notation that may lose non-IO readers. A one-sentence plain-English restatement before the equation would help. |

**Strongest passage:** Lines 167-173. The "Competitive Bottleneck" wrap-up elegantly ties all three facts into the structural motivation: "Issuer incentives drive consumer adoption (Fact 1), card acceptance increases merchant sales (Fact 2), and asymmetric multi-homing (Fact 3) tilts network competition toward the consumer side."

**Weakest passage:** Lines 58-66. The Poisson specification is introduced with heavy notation before the reader has fully absorbed the identification strategy. A plain-English description of the triple-difference idea ("I compare spending by credit card users vs. non-users, at treated vs. control merchants, before vs. after the acceptance change") before the equation would improve flow.

### Suggestions
- [x] Add a one-sentence plain-English summary before the Poisson regression equation explaining the triple-difference structure in words.
- [ ] The identifying assumption paragraph (lines 68-72) could be shortened by one sentence. The co-branded card campaign example is effective; the preceding general statement is slightly redundant with it.
- [ ] In the consumer multi-homing section, the footnote defining "carrying" based on usage rather than ownership (lines 155-156) contains important information that might belong in the main text since it affects interpretation.

---

## Model (model.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A-    | The backward-induction structure (Stage 3, 2, 1) provides clear organization. The Consumer Adoption subsection (lines 159-230) packs too many moving parts into one flow: pecuniary utility, non-pecuniary utility, heterogeneity, choice probabilities. |
| Mechanism | A     | The model is built to generate the competitive bottleneck endogenously, and the writing explains *why* each ingredient matters. The key insight -- that single-homing consumers give networks ex-post monopoly power -- is stated clearly at line 148. |
| Precision | A     | Equations are precise and notation is consistent throughout. Assumptions are stated formally with explicit discussion of what they rule out. |
| Economy   | B+    | The discussion-of-assumptions section (lines 285-347) is admirably thorough but long. Some paragraphs (Fixed Costs, Merchant Types) could be shortened. The Non-Rewards Credit Card Characteristics paragraph partially restates Australia evidence already covered in institutional_details.tex. |
| Clarity   | B+    | The model is inherently complex. The payment-at-point-of-sale figure (lines 27-38) is an excellent aid. But the consumer adoption utility specification (lines 164-230) introduces many parameters ($\alpha_i$, $\beta_i$, $\chi^{lm}_i$, $\omega$, $\Xi$, $\Sigma$) in quick succession without a roadmap telling the reader which ones matter most. |

**Strongest passage:** Lines 139-151 (Merchant Acceptance). The acceptance rule is stated cleanly, and the economic content is immediately transparent: "Adding a more expensive card incurs fees from all consumers who use it but increases sales only from single-homers." This sentence does more work than most paragraphs.

**Weakest passage:** Lines 192-224 (Non-pecuniary utility and consumer heterogeneity). The notation is dense and the economic intuition is spread thin. A reader encounters $\omega$, $\Xi$, $\beta_i$, $\chi^{lm}_i$, and income interactions ($\alpha_y$, $\beta_y$, $\chi^{lm}_y$) without a clear map of which parameters drive the key results. Flagging the 2-3 most important parameters would help enormously.

### Suggestions
- [x] Before the consumer adoption utility equations, add a 2-sentence roadmap: "Three groups of parameters govern consumer adoption. Price sensitivity ($\alpha$) determines how strongly rewards affect choices; substitution patterns ($\chi$) determine multi-homing; and income gradients determine distributional effects."
- [x] In the assumptions section, the Non-Rewards Credit Card Characteristics paragraph (lines 319-324) partially repeats the Australia evidence from institutional_details.tex. Consider a cross-reference rather than restating.
- [ ] The conduct and equilibrium determinacy section (lines 258-279) could benefit from a plain-English sentence explaining *why* trembles are needed before the formal specification. Currently the motivation ("select a unique equilibrium when profits are not differentiable in fees") arrives after the math.

---

## Estimation (estimation.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A-    | Clean three-part structure (consumer demand, network costs, merchant types). The "sensitivities and credit aversion" subsection (lines 89-155) blends results interpretation with parameter reporting, which works but could be split more clearly between "what we estimated" and "what it means." |
| Mechanism | A     | Identification arguments are explicit: Durbin identifies price sensitivity, second-choice survey identifies substitution, first-order conditions identify costs. Each mapping from data to parameter is explained. |
| Precision | A     | The 10:1 sensitivity ratio is stated with exact numbers ($4\%$ vs. $0.4\%$). Credit aversion is quantified in reward-equivalent terms. |
| Economy   | A-    | The merchant type subsection (lines 61-82) has some repetition between explaining identification and defending the approach. The distinction between equilibrium sensitivity and structural primitives is stated twice. |
| Clarity   | A-    | The merchant type identification section (lines 61-82) is commendably honest about its limitations ("closer to a calibration exercise than a conventional estimation"). The goodness-of-fit section is clean and well-organized. |

**Strongest passage:** Lines 131-141. The consumer substitution matrix discussion is a model of how to present structural estimates: "A 1-bp increase in Visa credit rewards raises Visa's share by 3.8%, drawn mostly from MC credit (down 3.5%), while MC debit falls only 0.3% and cash 0.3%." Specific, falsifiable, and directly tied to the competitive bottleneck.

**Weakest passage:** Lines 61-69. The merchant types preamble repeats that merchant fee sensitivity is an equilibrium outcome (already established in the model section) and that U.S. markets are mature (already noted in reduced form). Two sentences would suffice.

### Suggestions
- [x] Trim the merchant types preamble (lines 61-69) to avoid repeating the model section's framing.
- [ ] The credit aversion result (lines 143-148) is one of the paper's most important findings. Consider giving it slightly more space: explain in one more sentence *why* the median consumer prefers debit absent rewards, connecting to the survey evidence more tightly in the main text rather than deferring to the appendix.
- [x] The goodness-of-fit section could explicitly note which out-of-sample predictions are most informative for the counterfactuals. The AmEx OptBlue validation (lines 189-196) is the strongest external test and deserves a sentence flagging its importance for counterfactual credibility.

---

## Counterfactuals (counterfactuals.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A-    | Each counterfactual gets its own subsection, which is clean. The welfare decomposition (lines 96-119) packs two tables and their interpretation into one dense stretch. |
| Mechanism | A     | Causal logic is traced step by step. The fee cap section: cap -> lower rewards -> less credit use -> lower credit aversion -> welfare gain. The Durbin repeal traces a subtler chain: higher debit fees -> higher debit rewards -> less credit use -> lower credit rewards competition. |
| Precision | A     | Dollar values and basis-point changes are reported throughout with standard errors. |
| Economy   | B+    | The Discussion subsection (lines 219-260) covers five distinct robustness topics in rapid succession. Each is important individually, but together they dilute attention. Prioritizing the 2-3 most decision-relevant would strengthen the section. |
| Clarity   | A-    | The welfare decomposition table interpretation (lines 96-119) is well done but requires careful reading. The two offsetting forces in the first row (reduced credit aversion vs. reduced consumption) could be flagged more prominently with a signpost sentence. |

**Strongest passage:** Lines 168-199. The merger counterfactual is the paper's most provocative result, and the writing handles it expertly: state the result, trace the mechanism, immediately clarify "These results do not support mergers" with the reason why. No hedging, no burying. The sentence at line 199 ("They do show that rewards competition is so harmful that increases in market power can raise total welfare") is the paper's sharpest single-sentence summary of the central finding.

**Weakest passage:** Lines 219-260 (Discussion). Five paragraph-topics in rapid succession (constraints vs. preferences, choice of cap, pass-through, rewards as proxy, robustness overview) make this read like a checklist. The pass-through paragraph (lines 243-249) is important enough to warrant its own subsubsection, and grouping by theme would help.

### Suggestions
- [ ] Consider splitting the Discussion into two parts: one on interpretation (constraints vs. preferences, rewards as proxy) and one on robustness (pass-through, cap choice, alternative specs).
- [x] In the welfare decomposition (lines 116-119), add a transition sentence before explaining that the full gain materializes only across both rows. The current flow requires the reader to hold two offsetting forces in mind without a signpost.
- [ ] The dual-routing section (lines 201-217) is concise but could explain more clearly *why* the effect is modest. One sentence on the share of transactions affected by dual routing would help the reader understand the magnitude.

---

## Conclusion (conclusion.tex)

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Focus     | A     | Four paragraphs: results, mechanism, broader applicability. No bloat. |
| Mechanism | A     | The two conditions (price coherence + competitive bottleneck) are stated as the necessary and sufficient drivers, with examples showing generalizability. |
| Precision | A     | Key numbers are restated without new hedges. |
| Economy   | A     | Remarkably lean. Every sentence adds something. |
| Clarity   | A     | The final paragraph pivots to external validity without overreaching. |

**Strongest passage:** Lines 15-19. "Price coherence creates the externality... The competitive bottleneck determines the direction of competition." Distilling the entire paper into two conditions, then listing analogous markets (app stores, hotel platforms, ad-supported platforms), is exactly what a conclusion should do.

**Weakest passage:** None. This is an excellent conclusion.

### Suggestions
- [ ] No changes recommended. This conclusion is a model of economy and clarity.

---

## Overall Assessment

**Overall Grade: A-**

This is a well-written paper by academic economics standards. The prose is consistently purposeful, the causal logic is always traced, and the key results are stated with precision and without hedging. The writing quality is noticeably above the median for structural IO papers.

### Top 3 Strengths

1. **Thesis clarity.** The paper's central claim -- that competition *causes* high fees rather than failing to prevent them -- is stated boldly in the introduction and supported relentlessly throughout. Every section reinforces this argument rather than wandering. The monopoly-raises-welfare result is handled with particular skill: provocative but immediately qualified.

2. **Mechanism exposition.** The paper never reports a result without explaining *why* it holds. The fee-cap welfare gain, the Durbin repeal result, and the merger counterfactual each trace complete causal chains. The reader always knows the economic logic behind the numbers. The Durbin repeal mechanism paragraph (counterfactuals.tex, lines 148-166) is the best example: a multi-step causal chain where each step is specific and leads to the next.

3. **Quantitative specificity.** Claims are dollar-denominated, basis-point-precise, and accompanied by standard errors. The paper avoids the common trap of discussing structural estimates in qualitative terms. The 10:1 consumer-merchant sensitivity ratio and the credit aversion estimate in reward-equivalent terms are particularly effective.

### Top 3 Areas for Improvement

1. **Model section density.** The consumer adoption specification introduces too many parameters too quickly ($\alpha_i$, $\beta_i$, $\chi^{lm}_i$, $\omega$, $\Xi$, $\Sigma$, plus income gradients). A roadmap paragraph before the equations, flagging which parameters drive the key results and which are nuisance parameters, would significantly improve accessibility for non-specialist readers.

2. **Discussion section organization in counterfactuals.** The five-paragraph Discussion subsection reads as a heterogeneous checklist. Grouping by theme (interpretation vs. robustness) and promoting the most decision-relevant topics (pass-through, constraints vs. preferences) into subsubsections would sharpen it.

3. **Data section motivation.** The data section describes datasets without explaining why each is needed for identification. One sentence per dataset linking it to the estimation strategy would transform this section from a catalog into an argument. This is the section where the gap between *what* and *why* is most noticeable.

### Priority Recommendations

- [x] Add a 2-3 sentence roadmap before the consumer utility equations in model.tex explaining which parameters drive the key results vs. which are nuisance parameters
- [ ] Restructure the Discussion subsection in counterfactuals.tex into interpretation and robustness groups, potentially with subsubsection headers
- [x] Add one sentence per data source in data.tex previewing its role in estimation (e.g., "Homescan identifies multi-homing moments; the DCPC identifies acceptance rates and income gradients")
- [x] Consider merging the prisoner's dilemma paragraph in the introduction (lines 72-76) into the fee-cap welfare discussion
- [x] Add a plain-English summary sentence before the Poisson regression in reducedform.tex to orient non-IO readers
- [x] Flag the AmEx OptBlue validation in estimation.tex as the strongest out-of-sample test, connecting it explicitly to counterfactual credibility
