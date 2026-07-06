# Responses to refine_apr13.md

Responses triage each comment as **Accept** (fix as suggested), **Partial** (valid point, narrower fix), **Clarify** (wording tweak), **Reject** (disagree, defend), or **Verify** (needs checking against code/tables before deciding).

---

## REMAINING ITEMS (not yet fixed)

### Big-picture Accepts that still need substantive work

#### OF3. Normative interpretation of credit aversion — **Accept, NOT YET DONE**
This is the strongest overall critique. A dual welfare accounting (with vs. without crediting aversion as real utility loss) in the main VI.A table would transparently isolate how much of the $27B gain is pure externality correction. Recommend adding a second welfare column to Table 5 or a small companion table that nets out the aversion channel. Section VI.F already has the conceptual machinery; the fix is presenting the numbers in the main text. **Requires structural decision and possibly new estimation output — flagged for user direction.**

#### OF4. Dual routing institutional mapping — **Partial / reframe**
User pushed back on the referee's framing. The point of raising χ²² is not to model the exclusive-routing contractual machinery — it is simply to make two-credit-card multi-homing more attractive, which is what a dual-routing mandate achieves in reduced form. A byproduct is that credit cards become more attractive overall (the utility boost applies to credit--credit wallets), which is precisely why the mechanical welfare adjustment from #5 is needed: we net out the direct attractiveness gain so the reported welfare change reflects the equilibrium routing/substitution response, not the preference perturbation itself.

What to write: a short clarification in Section VI.D that (a) χ²² is a reduced-form knob on the multi-homing margin, not a structural model of routing contracts, and (b) the preference boost mechanically raises credit attractiveness, which is why Online Appendix~\ref{subsec:oa-mechanical-dr} subtracts that component before reporting. Skip the "which contractual constraint is being relaxed" paragraph the referee asked for — that's more specificity than the reduced-form instrument can support.

---

## DROPPED BY USER (do not implement)

Items the user reviewed and chose to ignore:

- **#3** — missing "credit cap only" corner of 2×2 policy matrix. *(Lulu: dumb.)*
- **#8** — income elasticity defense, functional form vs. economic rationale. *(Lulu: ignore.)*
- **#12** — Discover event study partial substitution vs. strict segmentation. *(Lulu: ignore.)*
- **#24** — share-response term second-order dismissal. *(Lulu: ignore.)*
- **#25** — non-pecuniary utility scaling for single-homers. *(Lulu: ignore.)*
- **#26** — linear approximation overstates α_y identification. *(Lulu: ignore.)*
- **#31** — χ²² sign and within-category option value. *(Lulu: ignore.)*

---

## COMPLETED ITEMS

### Overall Feedback

#### OF1. Rewards sensitivity anchored in single Durbin moment — **DONE**
[estimation.tex:36-39](../estimation.tex#L36) sharpened: the lower-bound paragraph now explicitly names the monopoly counterfactual as the most calibration-sensitive and notes that its welfare gain reverses sign under the halved Durbin target. [counterfactuals.tex:226](../counterfactuals.tex#L226) adds a one-sentence sensitivity flag at the end of the merger subsection pointing to [appendix_robustness.tex:251](../appendix_robustness.tex#L251) for the $+\$15B \to -\$19B$ flip.

#### OF2. Merchant-side calibration and external validity — **DONE**
[estimation.tex:74-77](../estimation.tex#L74) replaces the Merchant Types intro with an explicit moment→parameter mapping: grocery event-study → $\sigma$, DCPC acceptance rates → marginal type in $G$, network FOCs → density of $G$ near margin and merchant fee elasticity. [model.tex:328](../model.tex#L328) adds one sentence to the Fixed Costs paragraph in IV.F acknowledging that fixed acceptance costs would matter most for the dynamic cascade margin the model excludes.

#### OF3. Normative interpretation of credit aversion
**Accept.** See Remaining section above — NOT YET DONE.

#### OF4. Dual routing institutional mapping
**Accept.** See Remaining section above — NOT YET DONE.

#### OF5. Strategic conduct and vertical integration — **DONE**
[model.tex:354-362](../model.tex#L354) extends the Issuers and Acquirers paragraph (already updated per Comment 7) with the contracting mechanism: long-term issuer contracts and acquirer agreements give the parties instruments to internalize joint surplus rather than mark up sequentially, with the DOJ 2024 Visa suit cited as consistent evidence. New prose wrapped in `\begin{llm}`. Joint-profit maximization framed as the equilibrium outcome of the contracting environment, not a modeling shortcut.

---

### Detailed Comments

#### 1. Multi-homing measurement error is asymmetric — **DONE**
Added single sentence to [reducedform.tex:172](../reducedform.tex#L172) acknowledging single-homing share is a conservative lower bound under survey-style measurement error.

#### 2. Diversion ratio formula typos (OD.5.3) — **REJECTED (verified)**
Formula uses `\iota` consistently in [appendix_reduced.tex:503-513](../appendix_reduced.tex#L503-L513). Critique was a PDF-extraction artifact. No action.

#### 4. Second-choice sample size discrepancy — **DONE**
[appendix_data.tex:101](../appendix_data.tex#L101) now uses `\scalarinput{survey_num_credit}` and `\scalarinput{survey_num_debit}` (357/383) instead of a hardcoded total, so the prose tracks the summary-statistics table automatically.

#### 5. Dual-routing welfare attribution — **DONE**
Because the dual routing counterfactual perturbs the preference parameter χ²² directly (unlike the other counterfactuals, which move fees, ownership, or products), the logit log-sum mechanically raises consumer surplus even at unchanged prices, portfolios, and acceptance. To keep the \$8B figure comparable to the other counterfactuals, the mechanical component is now netted out of the reported consumer surplus. [counterfactuals.tex:243-246](../counterfactuals.tex#L243) adds a short `\begin{llm}` block explaining the adjustment and points to the new derivation. [appendix_model_oa.tex:184-212](../appendix_model_oa.tex#L184) (new subsection `subsec:oa-mechanical-dr`) derives the first-order mechanical gain $\frac{\Delta\chi}{\alpha_i}\cdot y \cdot P(\mathcal{W}_{CC}\mid i)$, integrates over the baseline income distribution $F(y)$ mirroring `eq:cons-surplus-integral`, and averages baseline and counterfactual credit–credit portfolio shares via the trapezoidal rule to avoid under/overstating the adjustment.

#### 6. Discover sample restriction vs. fixed effects collinearity — **DONE**
[appendix_reduced.tex:248](../appendix_reduced.tex#L248) clarified that the sample restriction applies to the graphical evidence, while the triple-difference regressions use the full panel with Discover households as the treated group.

#### 7. Double marginalization "effective marginal cost" overstated — **DONE**
[model.tex:354-357](../model.tex#L354) rewritten: joint-profit framing now rests on long-term contracting (backed by the DOJ 2024 Visa suit). Double marginalization and other vertical frictions are explicitly left to future work. Dropped the Weyl & Fabinger, Tirole, and Huynh et al. citations along with the effective-marginal-cost claim.

#### 9. Ohio v. AmEx framing — "too strict" — **DONE**
[conclusion.tex:10-12](../conclusion.tex#L10) rewritten: results *satisfy* the net-harm standard; the obstacle is producing the cross-side elasticities the standard requires, not the standard itself.

#### 10. AmEx underrepresentation in Homescan (4% vs 10%) — **DONE**
[data.tex:58](../data.tex#L58) updated with explicit AmEx underrepresentation note (4% vs 10%, attributed to CPG/grocery focus) and a sentence noting that AmEx-specific moments (fees, rewards) are externally sourced.

#### 11. Text/Table OF.4 contradiction on credit rewards direction — **DONE**
[appendix_credit_debit.tex:297-301](../appendix_credit_debit.tex#L297) rewritten. Now correctly says credit networks raise both fees (33 bps) and rewards (32 bps), and the welfare-loss narrative is explained as escalation on both sides absorbing new debit rents.

#### 13. Australia comparison — mismatched regulatory regimes — **DONE**
[response_round2.tex:1355-1365](../response_round2.tex#L1355) rewritten twice. First pass swapped the Uncap Debit benchmark for Cap Fees (credit-only, 120 bps), which gave a card-only debit:credit ratio of 66:34 against Australia's 59:41, and noted that Australia's tighter-on-debit structure would close the gap. Second pass (after user flagged the Cap-Fees-vs-Australia scenario mismatch as confusing, since Australia caps both) switched the benchmark to the **tourist test** counterfactual from Online Appendix~\ref{subsec:oa-cost-of-cash-cap}, which actually caps both credit and debit. Tourist test gives card-only 69:31 versus Australia's 59:41 — same ballpark, with the residual gap attributed to the tourist test's tighter credit cap (30 bps versus Australia's higher credit cap) pushing the mix further toward debit. Numbers sourced from [appendix_cap_table_baseline.tex](../../output/tables/appendix_cap_table_baseline.tex) (Debit −5 pp, Credit −30 pp under Tourist Test).

#### 14. CBDC welfare driven by logit option value — **DONE**
[counterfactuals.tex:267](../counterfactuals.tex#L267) note added pushing back on the referee's pure-logit-variety framing: because CBDC is modeled as a debit product, much of the $3.7B gain accrues to credit-averse consumers substituting away from cash or incumbent debit toward a better-matched debit option — a substantive channel, not horizontal differentiation. Logit variety is acknowledged as a secondary contributor.

#### 15. Missing Panel C (Merchant Parameters) in main Table 2 — **NO ACTION (verified)**
[estimation.tex:114](../estimation.tex#L114) already has Panel C. Critique was a misread.

#### 16. Merchant fee data source inconsistency (Appendix A.2 vs C.3) — **DONE**
[appendix_data.tex:33](../appendix_data.tex#L33) updated: Visa Credit, Visa Debit, and MC Debit fees fixed from network financial data; MC Credit and AmEx fees recovered in estimation. Cross-references the corresponding online appendix subsection.

#### 17. 91% top-card match rate vs. table's ~96% — **DONE**
[appendix_data.tex:67](../appendix_data.tex#L67) updated to ~96% (volume-weighted across card types).

#### 18. V_i(W) and CES price index conflation (OF.5.2) — **DONE**
[appendix_credit_debit.tex:478](../appendix_credit_debit.tex#L478) corrected: $V_i(W)$ summarizes the wallet's non-pecuniary characteristics $\Gamma_i^w$ rather than the CES price index $P^w$, which aggregates only pecuniary fees and rewards.

#### 19. Credit access parameters — Table OG.4 vs OG.5 — **DONE**
Checked the code: `constraint_intercept` and `constraint_slope` come from `dcpc_draws.csv` (generated by `payment_pref_reg.ipynb`'s logistic regression on the prime-credit-score indicator), and `estimate_model_current_eqm_foc.jl:142-143` reads them in as fixed inputs to the structural step — they are NOT re-estimated jointly. So the OG.4 citation in the text is correct. The discrepancy the reviewer noticed was instead in the *predicted* percentages: 82% at median is right, but 95%/55% at the 90th/10th percentiles were stale. Recomputed with current intercept 1.49, slope 1.04, ν_y = 0.75: median 82%, 90th 92%, 10th 62%. [appendix_robustness.tex:119-122](../appendix_robustness.tex#L119) updated.

#### 20. Revealed preference argument for cash — fixed cost confound — **DONE**
[response_round2.tex:1014](../response_round2.tex#L1014) — the revealed-preference cash-only merchant paragraph dropped; reply now relies on Felt et al. (2020) external estimates only.

#### 21. "Confirms" vs. rejects in segmentation defense — **DONE**
All three occurrences in [response_round2.tex](../response_round2.tex) replaced "confirms both predictions" with "generates both predictions."

#### 22. Australian annual fees contradiction — **DONE**
[response_round2.tex:986](../response_round2.tex#L986), [response_round2.tex:1450](../response_round2.tex#L1450), [model.tex:341](../model.tex#L341) updated to "non-rewards annual fees did not deteriorate."

#### 23. Australian interest rate levels vs. spread — **DONE**
Same locations as #22: now say "the spread between credit card rates and term loans was unchanged" instead of "interest rates were unchanged."

#### 27. Positive denominator condition for acceptance threshold — **DONE**
[appendix_model_oa.tex:67](../appendix_model_oa.tex#L67) — added one-line condition that the threshold rule applies whenever $\Delta b > 0$, which holds for all observed networks at baseline parameters.

#### 28. Missing Panel C in Table OF.6 — **NO ACTION (verified)**
[appendix_credit_debit.tex:382](../appendix_credit_debit.tex#L382) already has Panel C in `tab:param-extension` (debit-as-cash). Critique was a misread.

#### 29. Two-card limit defense — rely on segmentation — **DONE**
[response_round2.tex:401-412](../response_round2.tex#L401) restructured: leads with segmentation as the primary justification, then adds a revealed-preference hedge (the 95% concentration is informative because it signals the third-best card is a poor substitute, not an on-path artifact to be dismissed via a Lucas-critique argument), and points to the partial-substitute robustness check.

#### 30. Figure OD.3 notes mislabeling — **DONE**
[appendix_reduced.tex:63-65](../appendix_reduced.tex#L63) rephrased to "institution-level pre-post changes in signature debit volumes...from which the difference-in-differences estimate of Durbin's effect is derived."

#### 32. Text vs. Table 3 on Visa-credit → MC-debit elasticity — **REJECTED (verified)**
Both (MC Debit, Visa Credit) and (Visa Debit, Visa Credit) cells in [diversion_baseline.tex](../../output/tables/diversion_baseline.tex) are −0.3. Text matches table. Critique was wrong. No action.

#### 33. Figure OD.7 right panel title — **DONE**
[code/nilson_reg_robust.ipynb](../../code/nilson_reg_robust.ipynb) — corrected internal panel title from "Share of Debit on Signature Debit" to "Signature Debit Share of Total Debit". Figure needs to be regenerated by re-running the notebook to update [output/graphs/sig_share_of_debit.pdf](../../output/graphs/sig_share_of_debit.pdf).

#### 34. "Full interchange fee" vs. full merchant fee — **DONE**
[appendix_surcharging.tex:146](../appendix_surcharging.tex#L146) updated to "the full merchant discount fee."

#### 35. Discover spend share 7.1 vs. 7.6 in response memo — **DONE**
[response_round2.tex:607](../response_round2.tex#L607) updated: now cites 7.6 pp from `discover_triple_diff_spend.tex`, and the dependent variables (grocery share of spending vs. Discover share of grocery spending) are distinguished in the memo's narrative.

#### 36. 17.8 "within" 13–17% range — **DONE**
[response_round2.tex:704](../response_round2.tex#L704) softened to "is close to" the 13–17% margin range.

#### 37. "Coincides with" CES price index — Jensen's term — **DONE**
[model.tex:189](../model.tex#L189) softened "coincides with" to "closely approximates," acknowledging the Jensen's term derived in OE.3.

#### 38. MRI/Homescan sampling variation — **DONE**
[appendix_sorting.tex:212](../appendix_sorting.tex#L212) reworded from "not subject to sampling variation" to "standard errors are negligible given the large sample sizes."

#### 39. Equation 12 vs. 14 for merchant benefit — **DONE**
[response_round2.tex:831](../response_round2.tex#L831) — equation reference updated from `eq:adoption-eqm` to `eq:merch-accept`.

#### 40. Missing tilde on demeaned log income in reply — **DONE**
[response_round2.tex:846](../response_round2.tex#L846) — added tilde: $\beta_i \sim N(\beta_y \cdot \log \tilde{y}, \Sigma)$.

#### 41. Signature debit reply tightening — **DONE**
[response_round2.tex:1068-1073](../response_round2.tex#L1068) rewritten: clarifies that signature debit refers to V/MC routing rails and includes contactless taps (so the referee's signature-vs-contactless dichotomy is institutionally off), and that the 2019 cross-section used for Ξ does not distinguish form factors while the Durbin panel analysis does distinguish signature vs. PIN.

#### 42. Two-card substitution rule wording contradicts segmentation — **DONE**
[model.tex:46](../model.tex#L46) updated to "tries the primary card first, then the secondary within the same card type if declined, then cash," restoring consistency with the credit/debit segmentation rule two lines below.

#### 43. Table OA.5 rounding artifact — **DONE**
[appendix_tables.tex:55](../appendix_tables.tex#L55) — added footnote noting the gradient is computed from unrounded values and displayed cells are rounded to one decimal.

---

### Bonus pre-existing bug fixed
[appendix_surcharging.tex:27](../appendix_surcharging.tex#L27) — a `% CONSTANT:` annotation had swallowed a `\footnote{` opening on the same line, leaving the closing `}` on the next line dangling. CLAUDE.md explicitly warns against this pattern. Fixed by moving the footnote before the comment annotation. Verified clean compile (195 pages, no undefined references or citations).

### Follow-up cleanups on the mechanical-χ appendix (post #5)
Separate from the referee comment — these surfaced when rereading the new `subsec:oa-mechanical-dr` derivation.

**Notation alignment.** Rewrote the derivation to use the model's existing symbols rather than ad hoc ones. Portfolio shares are now $\tilde{\mu}^w_i$ indexed by wallet $w$ (following [model.tex:230](../model.tex#L230)), not $s^i_{jk}$. The income variable and integrating measure changed from $Y_i$/$dF(i)$ to $y$/$dF(y)$ to match the main-text CS formula at [counterfactuals.tex:96-98](../counterfactuals.tex#L96-L98). Introduced $\mathcal{W}_{CC} = \{w=(w_1,w_2)\in\mathcal{W}: w_1,w_2 \text{ are both credit cards}\}$ inline (defined and restated on first use) instead of a "CC" shorthand, paralleling the $\mathcal{W}_C$/$\mathcal{W}_D$ convention in [appendix_estimation.tex:61](../appendix_estimation.tex#L61).

**Policy magnitude correction.** Checked the code against the writing and found a discrepancy: the prose said $\Delta\chi = 0.0025\cdot\alpha_0$ / "25 bps reward increase", but [solve_model_foc.jl:490](../../code/solve_model_foc.jl#L490) actually uses `cc_boost = 0.0020 * price_sens`. Updated the prose to match the code: [appendix_model_oa.tex:188](../appendix_model_oa.tex#L188), [counterfactuals.tex:52,73,234,236](../counterfactuals.tex#L52) all now read "20 bps" / $0.0020$. The 25 bps references in the Durbin estimation moment and the Uncap Debit counterfactual are unrelated and left alone.

---

## Triage summary (post-cleanup)

| Category | Count | Comments |
|---|---|---|
| Done (Accept/Partial/Clarify fixed) | 33 | 1, 4, 5, 6, 7, 9, 10, 11, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 27, 29, 30, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, plus OF1, OF2, OF5 |
| No action — already present (Accept misreads) | 2 | 15, 28 |
| Rejected (critique wrong) | 2 | 2, 32 |
| Dropped by user | 7 | 3, 8, 12, 24, 25, 26, 31 |
| Big-picture pending (Accept) | 2 | OF3, OF4 |

**Highest-priority items still pending:**
1. **OF3** — dual welfare accounting with/without credit aversion (affects headline $27B claim). Needs user direction.
2. **OF4** — dual-routing institutional mapping paragraph (separate from the welfare-attribution rewrite, which is done).
