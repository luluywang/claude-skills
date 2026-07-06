# Appendix Cross-Reference Mapping

This document systematically maps each appendix section to its citations in the main text, reviewer concerns, and current opening statements. It provides a foundation for the appendix revision project.

---

## Master Cross-Reference Table

| Appendix | Current Opening Statement | Reviewer Concern/Revision Goal | Main Text Citations | Citation Count | Status |
|----------|--------------------------|--------------------------------|---------------------|-----------------|--------|
| **A: Data Details** (`appendix_data.tex`) | "Table \ref{tab:data_coverage} summarizes the years covered by each data source." | Verify each subsection addresses specific data concerns raised in reviews; ensure one-sentence purpose statements explain what main-text claim each supports. | data.tex:7 (Appendix contains data construction details); reducedform.tex:145 (discuss merchants excluded); referee.tex:630 (selection rule); referee.tex:692 (discuss data details); referee.tex:1188 (Data Appendix details); referee.tex:1268 (Appendix contains details); referee.tex:1317 (rewards adjustment) | 7 | Needs Attention |
| **B: Model Details** (`appendix_model.tex`) | "The merchant demand function used in the main text follows from a model in which consumers have CES preferences over a continuum of merchants, and payment acceptance affects quality." | Audit to ensure it matches exposition in main text; verify each section explains a modeling choice that was necessary or controversial (nested logit structure, cost parametrization). | model.tex:79 (CES demand system); model.tex:90 (merchant profits); model.tex:101 (optimal pricing); model.tex:124 (quasiprofits algorithm); model.tex:134 (hierarchical acceptance); model.tex:236 (conduct assumption); model.tex:239 (model solution) | 7 | Needs Attention |
| **C: Estimation Details** (`appendix_estimation.tex`) | "I estimate the model's parameters by matching data and simulated moments. I then conduct inference by bootstrapping the underlying data moments, matching the bootstrap to the dataset used for each moment." | Verify all moment-based identification is clearly explained and matches main text description. | estimation.tex:14 (contains details); referee.tex:773 (distribution of merchant types—commented); referee.tex:1830 (describe the process) | 3 | Ready |
| **OA.1: Additional Reduced Form** (`appendix_reduced.tex`) | "Discover's 5% Cashback Bonus program offers a 5% discount on purchases at select stores for customers who use Discover credit cards." | **MAJOR REVISION NEEDED:** Lead with purpose statement supporting core assumption: "This appendix provides reduced-form evidence supporting a core modeling assumption: that consumers commit to a primary payment type (debit vs. credit) before entering a transaction and do not substitute between them at point-of-sale." | reducedform.tex:80 (rewards affect payment behavior not store choice); model.tex:275 (credit-debit non-substitution); estimation.tex:28 (consumers don't substitute debit↔credit) | 3 | Needs Attention |
| **OA.2: Price Coherence** (`appendix_surcharging.tex`) | "Although merchants in the U.S. can charge discriminatory prices for different payment methods, most do not. This can be rational even assuming small menu costs." | **STRATEGIC REVISION:** Lead with: "This appendix justifies a key assumption: that U.S. merchants do not freely surcharge consumers for card acceptance despite legal ability, instead embedding card costs into uniform retail prices. This price coherence assumption is crucial for the pass-through mechanism in our counterfactuals." | intro.tex:20 (surcharging explored); model.tex:253 (price coherence assumption & discussion); counterfactuals.tex:15 (intermediate cap) | 3 | Needs Attention |
| **OA.3: Merchant Sorting** (`appendix_sorting.tex`) | "In principle, consumer sorting across stores can reduce redistribution among consumers who use different payment methods. If credit card consumers shop at one set of stores and cash consumers shop at a different set of stores, then high credit card merchant fees do not affect cash consumers' consumption." | Restate purpose upfront: "This section shows that consumer sorting across merchants by payment preference does not substantially reduce the redistribution from high-income (credit) to low-income (cash/debit) consumers." | model.tex:256 (hierarchical acceptance & sorting); referee.tex:18 (sorting limits redistribution); referee.tex:166 (addresses sorting empirically & theoretically) | 3 | Ready |
| **OA.4: Extension Model** (`appendix_substitution.tex`) | "This appendix presents robustness analysis for an alternative model specification that allows consumers who hold both debit and credit cards to substitute between them at the point of sale." | **FRAMING EMPHASIS:** Sharpen "referee-driven robustness" framing. Lead with: "Referees questioned whether the baseline assumption of no debit-credit substitution at point-of-sale is plausible. This appendix presents a specification allowing full substitution and demonstrates that the main counterfactual results are robust to this modeling choice." | model.tex:275 (no substitution assumption); estimation.tex:28 (consumers view credit/debit as separate) | 2 | Ready |
| **OA.5: Additional Tables & Robustness** (`appendix.tex`) | "This appendix collects additional descriptive tables, figures, and robustness analyses for alternative model specifications." | **MAJOR REVISION NEEDED:** Remove file naming references and "Estimation Variant Guide"; reframe around economic findings. Subsections should answer "Do our main conclusions hold under alternative assumptions?" Examples: Alternative Pass-through, Acceptance Complementarities, Halved Reward Sensitivity, Intermediate Fee Cap. | counterfactuals.tex:15 (intermediate cap); reducedform.tex:47 (halved reward sensitivity); model.tex:249 (pass-through); referee.tex:66 (acceptance complementarities); referee.tex:107 & 111 (imperfect pass-through) | 6 | Needs Attention |

---

## Detailed Citation List by Appendix

### Appendix A: Data Details
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_data.tex`

**Current Opening:** "Table \ref{tab:data_coverage} summarizes the years covered by each data source."

**Citations:**
1. `data.tex:7` - "Appendix \ref{sec:appendix-data} contains more data construction details."
2. `reducedform.tex:145` - "I discuss this in detail in the Data Appendix \ref{sec:appendix-data}." (context: merchant acceptance policies)
3. `referee.tex:630` - "The new data Appendix \ref{sec:appendix-data} documents the selection rule more formally"
4. `referee.tex:692` - "I now discuss this in the newly added data Appendix \ref{sec:appendix-data}."
5. `referee.tex:1188` - "I discuss this in detail in the Data Appendix \ref{sec:appendix-data}."
6. `referee.tex:1268` - "Appendix \ref{sec:appendix-data} now contains the details."
7. `referee.tex:1317` - "I discuss how I adjust rewards for annual fees in the Data Appendix \ref{sec:appendix-data}"

**Reviewer Concern:** Data construction details; selection rules; merchant acceptance filtering; rewards adjustment methodology.

**Status:** Needs Attention - Current opening statement is purely mechanical. Should add 1-2 sentence purpose statement explaining what specific data concerns this addresses.

---

### Appendix B: Model Details
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_model.tex`

**Current Opening:** "The merchant demand function used in the main text follows from a model in which consumers have CES preferences over a continuum of merchants, and payment acceptance affects quality."

**Citations:**
1. `model.tex:79` - "Appendix \ref{subsec:ces-derivation} micro-founds this demand function in a constant elasticity of substitution (CES) demand system."
2. `model.tex:90` - "Appendix \ref{subsec:merch-profits} shows that merchant profits can be expressed as"
3. `model.tex:101` - "Appendix \ref{subsec:merch-pricing} shows that the optimal uniform price is"
4. `model.tex:124` - "In Online Appendix \ref{sec:quasiprofits}, I derive and validate a fast approximate algorithm for optimizing"
5. `model.tex:134` - "Appendix \ref{subsec:rt-compare} verifies these intuitions."
6. `model.tex:236` - "Online Appendix \ref{subsec:appendix-conduct} discusses the details of my conduct assumption."
7. `model.tex:239` - "Online Appendix \ref{subsec:model-solution} contains details on how to solve the model."

**Reviewer Concern:** Verify derivations match main text exposition; explain necessity of modeling choices (CES structure, hierarchical acceptance, cost parametrization).

**Status:** Needs Attention - Opening is good but should check that each major subsection has a clear statement of *why* the modeling choice matters.

---

### Appendix C: Estimation Details
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_estimation.tex`

**Current Opening:** "I estimate the model's parameters by matching data and simulated moments. I then conduct inference by bootstrapping the underlying data moments, matching the bootstrap to the dataset used for each moment (Homescan for marginal merchant moments, DCPC for average income moments)."

**Citations:**
1. `estimation.tex:14` - "Appendix \ref{sec:appendix-estimation} contains the details."
2. `referee.tex:773` - (Commented out) "I use the data from the DCPC to recover the distribution of merchant types, as I now discuss in the estimation Appendix"
3. `referee.tex:1830` - "I describe the process in Appendix \ref{sec:appendix-estimation}:"

**Reviewer Concern:** Moment-based identification strategy; clarity of matching procedure.

**Status:** Ready - Opening statement clearly explains the estimation strategy and is well-positioned to support the main text.

---

### Online Appendix OA.1: Additional Reduced Form
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_reduced.tex`

**Current Opening:** "Discover's 5% Cashback Bonus program offers a 5% discount on purchases at select stores for customers who use Discover credit cards. This reward is redeemable as a deposit to a bank account or as a discount on the credit card bill, among other options."

**Citations:**
1. `reducedform.tex:80` - "Online Appendix \ref{sec:oa-reduced-form} shows that rewards affect payment behavior but not store choice: consumers switch payment methods to earn higher rewards, yet do not reallocate shopping trips across merchants."
2. `model.tex:275` - "In the model, consumers who carry debit and credit cards do not substitute between them at the point of sale. This rationalizes the evidence from Section~\ref{subsec:merchant-card-gains} that accepting credit cards increases sales even from those who own debit cards. Online Appendix \ref{subsec:antitrust-comments-credit-debit} provides additional evidence..."
3. `estimation.tex:28` - "Appendix \ref{subsec:estim-cons-sub} shows that consumers view credit and debit cards as two separate categories and that cash substitutes more effectively for debit cards than credit cards."

**Reviewer Concern:** **MAJOR REVISION NEEDED.** Reduce-form section currently mixes multiple findings without unified purpose. Should exclusively support the core assumption: "Consumers do not substitute between debit and credit at point-of-sale."

**Spec Language:** "This appendix provides reduced-form evidence supporting a core modeling assumption: that consumers commit to a primary payment type (debit vs. credit) before entering a transaction and do not substitute between them at point-of-sale, even when one is unavailable."

**Status:** Needs Attention - Must restructure with clear opening purpose statement and organized subsections.

---

### Online Appendix OA.2: Price Coherence
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_surcharging.tex`

**Current Opening:** "Although merchants in the U.S. can charge discriminatory prices for different payment methods, most do not. This can be rational even assuming small menu costs."

**Citations:**
1. `intro.tex:20` - "This occurs even though cash discounts and card surcharges are largely legal. I explore surcharging both theoretically and empirically in Online Appendix \ref{sec:oa-price-coherence}."
2. `model.tex:253` - "I assume price coherence: merchants charge the same price regardless of payment method. Appendix \ref{sec:oa-price-coherence} discusses the history and theory."
3. `counterfactuals.tex:15` - "Online Appendix \ref{subsec:oa-intermediate-cap} presents results for an intermediate cap of 95 bps" (implicit reference to surcharging context)

**Reviewer Concern:** Section exists but may not clearly address the surcharging assumption. Should justify why merchants maintain uniform pricing despite legal surcharging ability.

**Spec Language:** "This appendix justifies a key assumption: that U.S. merchants do not freely surcharge consumers for card acceptance despite legal ability, instead embedding card costs into uniform retail prices. This price coherence assumption is crucial for the pass-through mechanism in our counterfactuals."

**Status:** Needs Attention - Opening is good but should be prefaced with clearer framing of its role in justifying pass-through assumptions for counterfactuals.

---

### Online Appendix OA.3: Merchant Sorting
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_sorting.tex`

**Current Opening:** "In principle, consumer sorting across stores can reduce redistribution among consumers who use different payment methods. If credit card consumers shop at one set of stores and cash consumers shop at a different set of stores, then high credit card merchant fees do not affect cash consumers' consumption."

**Citations:**
1. `model.tex:256` - "This one-dimensional specification ignores potential sorting of payment types across stores \parencite{Gans2018}; Appendix \ref{sec:oa-merchant-sorting} shows such sorting is quantitatively small."
2. `referee.tex:18` - "I use this data in Appendix \ref{sec:oa-merchant-sorting} to explore how much the sorting of consumers with different payment preferences across merchants limits redistribution between consumers."
3. `referee.tex:166` - "I devote Appendix \ref{sec:oa-merchant-sorting} to addressing this possibility both empirically and theoretically."

**Reviewer Concern:** Clear structure but needs purpose restatement. Should show that sorting does not substantially reduce redistribution effects.

**Spec Language:** "A concern with card fees is that they redistribute from non-card-users to card-users. However, if consumers with different payment preferences shop at different merchants, cards' costs and benefits may be concentrated in specific stores, limiting cross-consumer redistribution. This appendix shows that such sorting is limited in the data."

**Status:** Ready - Opening statement is strong and clearly sets up the main concern and answer. Minor enhancement: add explicit statement "no large merchant exclusively serves one payment type."

---

### Online Appendix OA.4: Extension Model
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_substitution.tex`

**Current Opening:** "This appendix presents robustness analysis for an alternative model specification that allows consumers who hold both debit and credit cards to substitute between them at the point of sale. In the baseline model, multi-homing consumers who carry both debit and credit cards cannot substitute across payment types—a consumer who prefers credit will pay with cash rather than debit if credit is unavailable. The extension model relaxes this assumption by allowing full debit-credit substitution."

**Citations:**
1. `model.tex:275` - "In the model, consumers who carry debit and credit cards do not substitute between them at the point of sale."
2. `estimation.tex:28` - "Appendix \ref{subsec:estim-cons-sub} shows that consumers view credit and debit cards as two separate categories"

**Reviewer Concern:** Well-structured but should emphasize this is **referee-driven robustness**. Should sharpen framing to address specific referee concern.

**Spec Language:** "Referees questioned whether the baseline assumption of no debit-credit substitution at point-of-sale is plausible. This appendix presents a specification allowing full substitution and demonstrates that the main counterfactual results are robust to this modeling choice."

**Status:** Ready - Opening is already strong. Add callout: "Key Finding: Even allowing full substitution, fee caps raise welfare by $28B, uncapping debit raises welfare by $8B. Counterfactual rankings unchanged."

---

### Online Appendix OA.5: Additional Tables & Robustness
**File:** `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix.tex`

**Current Opening:** "This appendix collects additional descriptive tables, figures, and robustness analyses for alternative model specifications."

**Citations:**
1. `counterfactuals.tex:15` - "Online Appendix \ref{subsec:oa-intermediate-cap} presents results for an intermediate cap of 95 bps"
2. `reducedform.tex:47` - "Online Appendix \ref{subsec:oa-robustness-debit} shows the main qualitative conclusions are unchanged under halved reward sensitivity."
3. `model.tex:249` - "Appendix \ref{subsec:oa-relax-passthrough} considers zero pass-through"
4. `referee.tex:66` - "In Appendix \ref{subsec:appendix-estimation-comp}, I re-estimate a version of my model in which there are these kinds of acceptance complementarities."
5. `referee.tex:107 & 111` - "In Appendix \ref{subsubsec:relax-passthrough}, I find that imperfect pass-through has large effects..."
6. (Implicit) Various tables for merchant acceptance, Nilson panel, Homescan summary, Nielsen comparison

**Reviewer Concern:** **MAJOR REVISION NEEDED.** Current subsections read like technical documentation with file naming conventions ("param_tab_cons_no_passthrough.tex") rather than economic findings. Should reorganize around "robustness across model specifications" with clear economic framing.

**Spec Language:** "This section documents that alternative model specifications exist, highlights when they produce quantitatively similar results (supporting main conclusions), and clearly explains when/why they diverge (e.g., 'halved reward sensitivity' changes monopoly welfare conclusion)."

**Key Subsections to Revise:**
- **Alternative Pass-through:** "This variant removes an assumption central to our welfare results: merchant fee pass-through to retail prices. Under no pass-through, fee caps benefit merchants rather than consumers."
- **Acceptance Complementarities:** "Empirically, AmEx's multi-homing rate is insensitive to changes in its relative fee, contradicting the large multi-homing effects predicted by the complementarity model."
- **Halved Reward Sensitivity:** "Unlike other robustness checks, this variant produces a qualitatively different monopoly result (–$19B welfare vs. +$16B baseline), suggesting our policy conclusions are robust but magnitude is sensitive to reward elasticity assumptions."
- **Intermediate Fee Cap:** "Capping fees at the cost of cash (≈30 bps) is theoretically optimal but regulatory. This variant explores a more moderate cap aligned with international practice."

**Status:** Needs Attention - MOST PROBLEMATIC section. Must remove technical documentation, reframe as economic robustness findings, and clarify implications.

---

## Summary Analysis

### Appendices Cited in Main Text: All 8
All appendices are cited at least 2–7 times across the main text (data.tex, model.tex, estimation.tex, reducedform.tex, intro.tex, counterfactuals.tex, referee.tex). No orphaned sections.

### Appendices Ranked by Revision Urgency

| Priority | Appendix | Issue |
|----------|----------|-------|
| **Critical** | OA.5 | Technical documentation; file naming; lacks economic framing |
| **High** | OA.1 | Multiple findings without unified purpose; needs clarity on debit-credit substitution |
| **High** | OA.2 | Exists but underemphasizes role in justifying pass-through assumption |
| **Medium** | A, B | Verify subsection purpose statements are explicit |
| **Low** | C, OA.3, OA.4 | Structure is good; minor framing enhancements needed |

### Key Revision Principles (from spec)

1. **Clarity of Purpose:** Each section should open with 1-2 sentences answering "What claim from main text does this support?" and "What concern from reviewers does this address?"

2. **Lead with Economics:** Avoid file names, table references, technical setup. Start with the economic question.

3. **Explicit Referee Mapping:** State "Referees questioned [assumption]. This section provides evidence [that/suggesting]..."

4. **Signal Robustness:** When multiple specifications presented, open with "Do our main conclusions hold under alternative assumptions?" and answer clearly.

5. **Minimize Implementation Details:** Remove references to file names, code variable names, LaTeX file organization.

6. **Connect to Main Text:** End each section with 1-2 sentences restating how finding supports main narrative.

---

## Appendix Status Summary

- **Appendix A (Data):** Technical but acceptable; verify purpose statements
- **Appendix B (Model):** Structural description; audit for necessity of each choice
- **Appendix C (Estimation):** Technical but acceptable; moment matching clearly explained
- **OA.1 (Reduced Form):** NEEDS MAJOR REVISION; consolidate around debit-credit non-substitution
- **OA.2 (Price Coherence):** Good structure; strengthen connection to pass-through mechanism
- **OA.3 (Merchant Sorting):** Good structure; verify robustness finding is clear
- **OA.4 (Extension Model):** Good structure; add callout highlighting robustness of results
- **OA.5 (Additional Tables):** NEEDS MAJOR REVISION; remove technical documentation, reframe as economics

---

## Next Steps for RA

1. Begin revisions in order: A → B → C → OA.1 → OA.2 → OA.3 → OA.4 → OA.5
2. For each section, add 1-2 sentence opening statement answering "What main-text claim?" and "What reviewer concern?"
3. For OA.1, OA.2, OA.5: Make structural changes per spec recommendations
4. Cross-reference check after revisions to ensure all citations still point to correct sections
5. Verify no file naming or technical documentation references remain in final versions

---

*Document created: January 31, 2026*
*Status: Foundation for appendix revision project*
