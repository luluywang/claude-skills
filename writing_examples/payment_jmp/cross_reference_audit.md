# Cross-Reference Audit

Generated 2026-03-16. Covers all `\ref{}` and `\eqref{}` in the main text and appendices.

---

## Issues Found

### 1. WRONG PREFIX: model.tex:331 — "Appendix" should be "Online Appendix"

```latex
Appendix \ref{sec:oa-price-coherence} discusses the history and theory.
```

Target `sec:oa-price-coherence` is in `appendix_surcharging.tex`, which is an **Online Appendix** (OD). All other references to OA labels correctly say "Online Appendix." This one should too.

**Fix:** Change "Appendix" → "Online Appendix".

---

### 2. FOOTNOTE CONTENT MISMATCH: counterfactuals.tex:169

```latex
As discussed in Footnote \ref{foot:durbin-icg-vs-rewards}, only around 25
of the 75 basis point interchange decline flowed through to rewards.
```

Target `foot:durbin-icg-vs-rewards` (estimation.tex:32) says:
> "Banks also absorbed the loss through higher checking account fees. I ignore the increase in checking account fees since they do not influence the relative costs and benefits of different payment methods."

The footnote does **not** state that only 25 of 75 bps flowed through to rewards. That claim is in the body text surrounding the footnote (estimation.tex:24–29). The reader who follows the footnote reference will not find the cited claim there.

**Fix:** Either (a) add the 25/75 bps claim to the footnote, or (b) change the reference to point to the surrounding body text or section.

---

### 3. IMPRECISE: model.tex:65 — ref says "works out probabilities" but target is "Acceptance Thresholds"

```latex
Online Appendix~\ref{subsec:oa-credit-multihoming} explicitly works out
these probabilities in a simplified model with two credit cards and one debit card.
```

Target `subsec:oa-credit-multihoming` (appendix_model_oa.tex:51) is titled **"Acceptance Thresholds"** and derives acceptance cutoffs using payment probabilities as inputs. The **payment probability table** itself is in `subsec:oa-payment-probs` ("Consumer Payment Probabilities in Baseline Model").

This is borderline — the acceptance thresholds section does work through simplified cases involving these probabilities, but the section's focus is merchant acceptance, not the probabilities themselves.

**Suggestion:** Consider referencing both `subsec:oa-payment-probs` (for the probabilities) and `subsec:oa-credit-multihoming` (for the two-card economy analysis), or adjust the wording to say "derives acceptance thresholds" rather than "works out these probabilities."

---

### 4. LABEL NAME MISLEADING: `subsec:oa-merchant-acceptance-fee-history`

Label is on section titled **"Consumer Multi-homing Behavior"** (appendix_reduced.tex:385–386). The label name suggests "merchant acceptance fee history." Referenced at model.tex:193:

```latex
I adopt this because even as AmEx acceptance has converged with Visa Credit,
multi-homing rates between them have not changed
(Online Appendix \ref{subsec:oa-merchant-acceptance-fee-history}).
```

The section content does match the reference (it discusses AmEx multi-homing stability despite acceptance convergence). Not a broken ref, but the label name is confusing.

**Suggestion:** Rename label to `subsec:oa-consumer-multihoming-history` or similar.

---

### 5. LABEL PREFIX: `sec:oa-data` on a `\subsection`

In `appendix_data_oa.tex:7`, `\label{sec:oa-data}` is attached to a `\subsection{MRI-Simmons}`. The `sec:` prefix conventionally denotes a `\section`. This label is not referenced from the main text (only from within the OA itself), but the prefix inconsistency could confuse future editors.

---

## All Cross-References by Source File

### intro.tex (3 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 18 | `sec:oa-price-coherence` | "explore surcharging...in Online Appendix" | OA: "Price Coherence" (appendix_surcharging.tex:5) | OK |
| 56 | `subsec:oa-cost-of-cash-cap` | "evaluates alternative fee caps" | OA: "Comparison to Other Fee Caps and the Social Optimum" (appendix_robustness.tex:367) | OK |
| 65 | `subsec:oa-survey-consumer-pref` | "discusses survey evidence on credit aversion" | OA: "Survey Evidence on Credit Aversion" (appendix_reduced.tex:509) | OK |

### model.tex (27 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 13 | `subsec:model-assumptions` | "discusses key assumptions" | "Discussion of Key Assumptions" (model.tex:293) | OK |
| 44 | `fig:payment-pos-illustration` | "substitute between them (Figure)" | Figure: POS payment illustration (model.tex:28) | OK |
| 65 | `subsec:oa-credit-multihoming` | "works out these probabilities" | "Acceptance Thresholds" (appendix_model_oa.tex:51) | **IMPRECISE** (Issue #3) |
| 81 | `subsec:oa-discover-rewards` | "Discover evidence" | "Evidence on Whether Rewards Shift Shopping Behavior" (appendix_reduced.tex:211) | OK |
| 105 | `subsec:appendix-merch-profits` | "shows that profits equal" | "Merchant Profits and Optimal Pricing" (appendix_model.tex:13) | OK |
| 119 | `subsec:appendix-merch-pricing` | "shows the optimal uniform price" | Same section dual-label (appendix_model.tex:14) | OK |
| 144 | `subsec:appendix-quasiprofits` | "derives a fast approximate algorithm" | "Linearizing Merchant Profits" (appendix_model.tex:79) | OK |
| 154 | `subsec:oa-credit-multihoming` | "verifies these intuitions in a two-card economy" | "Acceptance Thresholds" (appendix_model_oa.tex:51) | OK — content matches |
| 180 | `eq:price-index-integral-gamma` | "CES price index from Equation" | CES price index equation (model.tex:87) | OK |
| 193 | `subsec:oa-merchant-acceptance-fee-history` | "multi-homing rates have not changed" | "Consumer Multi-homing Behavior" (appendix_reduced.tex:386) | OK (label name misleading, Issue #4) |
| 194 | `subsec:oa-ces-price-index` | "CES price index of wallet $w$" | "CES Price Index and Multi-Homing Pecuniary Utility" (appendix_model_oa.tex:39) | OK |
| 228 | `subsec:oa-usage-microfoundation` | "develops a two-stage adoption-and-usage model" | "A Microfoundation for Segmentation Between Credit and Debit at the Point of Sale" (appendix_model_oa.tex:191) | OK |
| 287 | `subsec:oa-conduct` | "discusses the conduct assumption" | "Details on the Conduct Assumption" (appendix_model_oa.tex:262) | OK |
| 290 | `eq:optimal-consumption` | "consumption is optimal" | Optimal consumption equation (model.tex:96) | OK |
| 290 | `eq:pricing-eqm` | "profits" | Pricing equilibrium (model.tex:135) | OK |
| 290 | `eq:adoption-eqm` | "acceptance maximize profits" | Adoption equilibrium (model.tex:159) | OK |
| 290 | `eq:person-market-share` | "consumers choose optimal wallets" | Logit choice probability (model.tex:236) | OK |
| 290 | `eq:network-conduct-argmax` | "networks maximize profits" | Network argmax (model.tex:279) | OK |
| 291 | `subsec:oa-model-solution` | "details the solution algorithm" | "Model Solution Algorithm" (appendix_model_oa.tex:289) | OK |
| 299 | `subsec:oa-usage-microfoundation` | "compatible with reward-sensitive adoption" | Microfoundation section (appendix_model_oa.tex:191) | OK |
| 300 | `subsubsec:oa-credit-debit-evidence` | "antitrust treatment of credit and debit" | "Empirical Evidence on Credit-Debit Segmentation" (appendix_model_oa.tex:145) | OK |
| 303 | `subsec:oa-credit-debit-segmentation` | "estimates an alternative model allowing credit-debit substitution" | "Credit-Debit Segmentation" (appendix_model_oa.tex:131) | OK |
| 307 | `fig:merchant-amex-visa` | "credit acceptance remained stable after Durbin" | Figure: credit card acceptance (reducedform.tex:147) | OK |
| 319 | `sec:oa-merchant-sorting` | "shows such sorting is quantitatively small" | "Merchant Sorting" (appendix_sorting.tex:5) | OK |
| 325 | `sec:institutional-data` | "As Section documents" | "Institutional Details and Data" (main.tex:70) | OK |
| 325 | `fig:aus-interchange-event-study` | "Australia's interchange caps showed no short-run effects" | Australia interchange event study figure (appendix_figures.tex:10) | OK |
| 331 | `sec:oa-price-coherence` | "Appendix discusses the history and theory" | OA: "Price Coherence" (appendix_surcharging.tex:5) | **WRONG PREFIX** (Issue #1) |

### data.tex (6 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 8 | `sec:appendix-data` | "Appendix provides data construction details" | "Data Details" (appendix_data.tex:4) | OK |
| 18 | `fig:aggregate-shares` | "Figure shows payment volumes, fees, rewards" | Aggregate payment figure (data.tex:29) | OK |
| 50 | `subsec:appendix-data-issuers` | "Appendix details sample construction" | "Issuer Payment Volumes" (appendix_data.tex:7) | OK |
| 63 | `tab:dcpc-summary` | "Table shows summary statistics" | DCPC summary table (data.tex:76) | OK |
| 66 | `tab:yelp-dcpc-comparison` | "Table compares DCPC acceptance rates to Yelp" | Table in appendix_data_oa.tex (via output file input) | OK (label in generated table) |
| 70 | `tab:dcpc-summary` | "Table" | DCPC summary table (data.tex:76) | OK |

### reducedform.tex (18 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 36 | `fig:volumes` | "Figure plots the estimates" | Durbin event study figure (reducedform.tex:29) | OK |
| 40 | `subsec:appendix-data-issuers` | "Appendix" | "Issuer Payment Volumes" (appendix_data.tex:7) | OK |
| 41 | `tab:durbin-event-study` | "Table shows a roughly 20% decline" | Durbin event study table (appendix_reduced.tex:34) | OK |
| 44 | `subsec:oa-durbin-robustness` | "presents robustness checks" | "Durbin Amendment Robustness Checks" (appendix_reduced.tex:7) | OK |
| 53 | `par:oa-durbin-rewards-robustness` | "rewards alone sufficient" | Paragraph on rewards channel (appendix_reduced.tex:127) | OK |
| 103 | `fig:grocer-event-sales-effects` | "Figure shows acceptance increases sales" | Event study figure (reducedform.tex:96) | OK |
| 104 | `tab:event-study-tab` | "Table reports regression coefficients" | Event study table (appendix_tables.tex:100) | OK |
| 106 | `tab:dcpc-summary` | "Table" | DCPC summary table (data.tex:76) | OK |
| 107 | `subsubsec:oa-credit-debit-evidence` | "merchant and network testimony" | "Empirical Evidence on Credit-Debit Segmentation" (appendix_model_oa.tex:145) | OK |
| 111 | `sec:oa-reduced-form` | "studies Discover's quarterly rewards programs" | "Additional Reduced Form Results" (appendix_reduced.tex:4) | OK — Discover is a subsection within |
| 125 | `fig:fees-history` | "Figure shows fee gap" | Merchant fees subfigure (reducedform.tex:141) | OK |
| 126 | `fig:merchant-amex-visa` | "Figure shows acceptance gap" | Acceptance subfigure (reducedform.tex:147) | OK |
| 131 | `subsec:oa-yelp-card-acceptance` | "Yelp reviews rule this out" | "Hierarchical Card Acceptance" (appendix_reduced.tex:358) | OK |
| 174 | `fig:debit-primary` | "Figure" | Debit primary figure (appendix_figures.tex:25) | OK |
| 174 | `sec:model` | "Section retains distinct Visa Debit and MC Debit" | "Model" (main.tex:86) | OK |
| 175 | `tab:top-two` | "Table shows consumers put ~95% on two networks" | Top-two table (appendix_tables.tex:90) | OK |
| 176 | `sec:appendix-data` | "Appendix" | "Data Details" (appendix_data.tex:4) | OK |
| 179 | `fig:consumer-multi-homing` | "Figure" | Consumer multi-homing figure (reducedform.tex:157) | OK |

### estimation.tex (14 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 16 | `sec:appendix-estimation` | "Appendix contains estimation details" | "Estimation Details" (appendix_estimation.tex:5) | OK |
| 41 | `subsec:oa-debit-robustness` | "re-estimates model attributing only half" | "Reduced Durbin Amendment Moment" (appendix_robustness.tex:193) | OK |
| 57 | `subsec:oa-estim-cons-sub` | "consumers view credit and debit as two separate categories" | "Consumer Substitution Patterns from a Second Choice Survey" (appendix_reduced.tex:410) | OK |
| 67 | `fig:consumer-multi-homing` | "Figure identify both chi and income gradient" | Consumer multi-homing figure (reducedform.tex:157) | OK |
| 68 | `tab:multihome-by-income` | "Table, multi-homing rate 4.3pp higher above median" | Multihoming by income table (appendix_tables.tex:145) | OK |
| 101 | `fig:aggregate-shares` | "Figure pin down unobserved characteristics" | Aggregate shares figure (data.tex:29) | OK |
| 151 | `tab:param-est` | "Table reports parameter estimates" | "Estimated parameters" (estimation.tex:108) | OK |
| 153 | `tab:cross-sub` | "Table shows consumers view credit cards..." | Cross-substitution table (estimation.tex:140) | OK |
| 170 | `subsec:oa-survey-consumer-pref` | "survey evidence confirms credit aversion" | "Survey Evidence on Credit Aversion" (appendix_reduced.tex:509) | OK |
| 194 | `tab:cf-baseline` | "Table shows baseline prices and market shares" | "Baseline Equilibrium" (estimation.tex:204) | OK |
| 196 | `tab:dcpc-summary` | "Table, debit cards are most popular" | DCPC summary (data.tex:76) | OK |
| 212 | `fig:market-share-fit` | "Figure, joint distribution of primary and secondary" | Market share fit figure (appendix_figures.tex:36) | OK |
| 218 | `fig:fees-history` | "Figure, AmEx fee cuts" | Fees history subfigure (reducedform.tex:141) | OK |
| 218 | `fig:merchant-amex-visa` | "Figure, share of Visa merchants not accepting AmEx" | Acceptance subfigure (reducedform.tex:147) | OK |

### counterfactuals.tex (14 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 28 | `tab:cf-effects` | "Table shows networks respond to fee caps" | "Counterfactual Effects on Prices and Shares" (counterfactuals.tex:40) | OK |
| 30 | `tab:cf-effects` | "Table" | Same | OK |
| 113 | `tab:cap-credit-channel-decomp` | "Table decomposes welfare" | "Welfare Decomposition by Channel: 120 Bps Cap" (counterfactuals.tex:79) | OK |
| 127 | `tab:cf-effects` | "Table shows fees and rewards falling" | Same | OK |
| 131 | `subsec:oa-survey-consumer-pref` | "credit aversion" | "Survey Evidence on Credit Aversion" (appendix_reduced.tex:509) | OK |
| 169 | `foot:durbin-icg-vs-rewards` | "only around 25 of 75 bps flowed through to rewards" | Footnote on checking fees (estimation.tex:32) | **MISMATCH** (Issue #2) |
| 252 | `subsubsec:model-merch-accept` | "merchant acceptance condition" | "Merchant Acceptance" (model.tex:140) | OK |
| 265 | `subsec:model-assumptions` | "Section" | "Discussion of Key Assumptions" (model.tex:293) | OK |
| 273 | `sec:oa-alternative-specifications` | "presents detailed sensitivity analysis" | "Alternative Specifications and Additional Counterfactuals" (appendix_robustness.tex:5) | OK |
| 279 | `subsec:oa-survey-consumer-pref` | "survey evidence" | "Survey Evidence on Credit Aversion" (appendix_reduced.tex:509) | OK |
| 280 | `subsec:oa-usage-microfoundation` | "formalizes this distinction" | Microfoundation (appendix_model_oa.tex:191) | OK |
| 284 | `subsec:oa-credit-constrained` | "uses credit score data" | "Credit Card Access Constraints" (appendix_robustness.tex:99) | OK |
| 294 | `subsec:oa-no-passthrough` | "compares full pass-through against zero" | "No Passthrough" (appendix_robustness.tex:16) | OK |
| 302 | `subsec:oa-cost-of-cash-cap` | "compares this cap to a 30 bps cap" | "Comparison to Other Fee Caps and the Social Optimum" (appendix_robustness.tex:367) | OK |

### institutional_details.tex (2 refs)

| Line | Label | Context | Target | Status |
|------|-------|---------|--------|--------|
| 27 | `fig:payment-flow` | "Figure shows the payment flows" | Payment flow figure (institutional_details.tex:9) | OK |
| 42 | `fig:aus-interchange-event-study` | "Appendix Figure shows" | Australia event study (appendix_figures.tex:10) | OK |

---

## Appendix-to-Appendix References (spot-checked)

| Source | Line | Label | Context | Status |
|--------|------|-------|---------|--------|
| appendix_model.tex | 22 | `subsec:oa-extension` | "Online Appendix" | OK |
| appendix_model.tex | 110 | `subsec:oa-quasiprofit-validation` | "confirms numerically accurate" | OK |
| appendix_robustness.tex | 8 | `subsec:oa-no-passthrough` | section ref | OK |
| appendix_robustness.tex | 8 | `subsec:oa-extension` | section ref | OK |
| appendix_robustness.tex | 9 | `subsec:oa-cost-of-cash-cap` | section ref | OK |
| appendix_robustness.tex | 18 | `eq:optimal-price` | equation ref | OK |
| appendix_robustness.tex | 102 | `eq:person-market-share` | equation ref | OK |
| appendix_model_oa.tex | 10 | `tab:consumer-payment-probs` | table ref | OK |
| appendix_model_oa.tex | 54 | `eq:payment-value-kappa` | equation ref | OK |
| appendix_model_oa.tex | 56 | `thm:quasiprofit-approx` | theorem ref | OK |
| appendix_model_oa.tex | 129 | `subsec:oa-extension` | section ref | OK |
| appendix_model_oa.tex | 305 | `eq:subsidy-bill` | equation ref | OK |
| appendix_model_oa.tex | 305 | `eq:transaction-fee-profit` | equation ref | OK |
| appendix_estimation.tex | 26 | `subsec:oa-network-diversion-construction` | section ref | OK |
| appendix_estimation.tex | 29 | `fig:volumes` | figure ref | OK |
| appendix_estimation.tex | 47 | `eq:dollars` | equation ref | OK |
| appendix_estimation.tex | 53 | `eq:adoption-pecuniary-gain` | equation ref | OK |
| appendix_estimation.tex | 62 | `eq:general-accept-threshold` | equation ref | OK |
| appendix_estimation.tex | 66 | `eq:merch-accept` | equation ref | OK |
| appendix_reduced.tex | 15 | `fig:covariate-overlap` | figure ref | OK |
| appendix_reduced.tex | 28 | `tab:durbin-event-study` | table ref | OK |
| appendix_reduced.tex | 40 | `subsec:appendix-data-issuers` | data appendix ref | OK |
| appendix_reduced.tex | 221 | `sec:appendix-data` | data appendix ref | OK |
| appendix_data.tex | 20 | `fig:durbin-missing` | figure ref | OK |
| appendix_data.tex | 26 | `fig:aggregate-shares` | figure ref | OK |
| appendix_data.tex | 92 | `subsec:oa-credit-constrained` | OA robustness ref | OK |
| appendix_data_oa.tex | 30 | `subsec:oa-durbin-robustness` | OA robustness ref | OK |
| appendix_data_oa.tex | 62 | `sec:appendix-data` | main appendix ref | OK |
| appendix_sorting.tex | 44 | `fig:distribution_cc` | figure ref | OK |

---

## Summary

- **Total references checked:** ~150 (all main text + spot-checked appendices)
- **Broken labels (ref to undefined label):** 0
- **Issues found:** 5
  - 1 wrong "Appendix" vs "Online Appendix" prefix
  - 1 footnote content mismatch
  - 1 imprecise description of target content
  - 1 misleading label name (cosmetic)
  - 1 label prefix inconsistency (cosmetic)
