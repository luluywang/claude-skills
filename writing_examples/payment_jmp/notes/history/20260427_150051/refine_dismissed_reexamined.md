# Re-examination of dismissed referee items

Second pass on comments marked **Rejected**, **Misread**, or **Dropped** in `refine_apr13_responses.md` and `refine_apr10_plan.md`. Goal: confirm the triage on the merits rather than trusting the first read.

Items are ranked by substantive risk to the paper, not by original comment number.

---

## Priority 1 — Verify before submission

### α_y linearization (#26 apr13 / #1 apr10)

**Triage status:** Dropped as "below the line; referees didn't raise it last round." Response doc hand-waves with "presumably the code uses exact moments."

**Why it matters:** A factor-of-2 error in α_y would propagate through the welfare results. This is the one dismissed item that could materially change a headline number.

**What the reviewer actually said:**
The identification text claims that in a conditional logit with small issuer shares ($s_{ij}\ll 1$), switching probability is proportional to $\alpha_i$, so the elasticity of switching w.r.t. income directly reveals $\alpha_y$. The $s_{ij}\ll 1$ assumption is defensible — individual issuer shares in a fragmented credit-card market really are small. But the proportionality claim requires more than small $s_{ij}$.

**Closed form.** Conditional on originally choosing issuer $j$, the logit-with-iid-shocks switching probability under a utility drop $\Delta = \alpha_i \Delta f$ on $j$ is:

$$P_{\text{switch}}(\alpha_i, \Delta f; s_{ij}) = \frac{(1-s_{ij})(1-e^{-\Delta})}{1 - s_{ij}(1-e^{-\Delta})}$$

(Derivation: conditional on $Y \equiv \epsilon_j - \max_{k\neq j}(\epsilon_k + V_k - V_j) > 0$, consumer stays iff $Y > \Delta$, so $\Pr[\text{stay}] = s'_{ij}/s_{ij}$; working out the logit shift gives the formula.)

Taking $s_{ij}\to 0$:
$$P_{\text{switch}} \to 1 - e^{-\alpha_i \Delta f}$$

This is the clean small-share limit. But it is still **concave in $\alpha_i$** when $\alpha_i \Delta f$ is not small, and the observed 71% switch rate implies $\alpha_i \Delta f \approx -\ln(0.29) \approx 1.24$, which is not small. Proportionality in $\alpha_i$ requires both $s_{ij}\ll 1$ *and* $\alpha_i \Delta f \ll 1$; only the first condition holds.

**Elasticity at $P = 0.71$.** In the small-$s_{ij}$ limit,
$$\frac{\partial \log P_{\text{switch}}}{\partial \log \alpha_i} = \frac{-\ln(1-P)(1-P)}{P}$$

| $P_{\text{switch}}$ | 0.1 | 0.3 | 0.5 | 0.71 | 0.9 |
|---|---|---|---|---|---|
| Elasticity w.r.t. $\alpha_i$ | 0.95 | 0.83 | 0.69 | **0.51** | 0.26 |

At $P = 0.71$, the empirical income-elasticity of switching (~0.197) maps to a structural $\alpha_y \approx 0.39$, not 0.20 — a factor of ~2 — *if* the GMM targets the empirical elasticity 1:1.

**What I found in the code:**
[`code/second_choice_analyze.ipynb:1376`](../../code/second_choice_analyze.ipynb) computes the data moment as:

```r
elast_second_choice = (base_regs[[1]] %>% copy %>% coef)[2] / switch_probs$switch_prob[1]
```

This is a plug-in elasticity: LPM coefficient divided by mean switching probability. Writes to `income_switch_coef.csv` and bootstraps. The estimate (~0.197) coincides almost exactly with the reported $\hat\alpha_y = 0.20$, which is suspicious given the nonlinearity — if the GMM correctly accounted for the curvature, the recovered parameter would be roughly twice the reduced-form elasticity.

**Code trace (confirmed path b):**

1. `code/second_choice_analyze.ipynb` cell 50: runs the LPM `feglm(change_rewards ~ log_income, family = 'gaussian')` on credit-card respondents. Gaussian → linear probability model with slope $\approx 0.14$.
2. Same notebook, cell 117: `average_person_elast = mean(agg_slope / person_level_means)` — divides the LPM slope by each person's fitted $\hat P_i$ and averages. Because fitted values cluster around $\bar P = 0.71$, this is effectively $\text{slope}/\bar P \approx 0.197$.
3. Cell 120 bootstraps this, writes to `bootstrap_data/income_switch_coef.csv`, merged into `second_choice_survey_draws.csv` with column name `elast`.
4. [`estimate_model_current_eqm_foc.jl:71`](../../code/estimate_model_current_eqm_foc.jl#L71): explicit comment reads `# elast (log_price_sens_income) is now calibrated, not matched as a moment`.
5. [`estimate_model_current_eqm_foc.jl:153`](../../code/estimate_model_current_eqm_foc.jl#L153):
   ```julia
   calib = CalibratedParams(
       ...,
       second_choice_draws.elast[BOOT_DRAW],  # log_price_sens_income
       ...
   )
   ```
   The bootstrap `elast` (= 0.197) is assigned directly as `log_price_sens_income`.
6. [`model_functions/03_consumer_homing_demand.jl:159`](../../code/model_functions/03_consumer_homing_demand.jl#L159) uses it structurally:
   ```julia
   price_sensitivity = exp(cons_pref.log_price_sens + cons_pref.log_price_sens_income * centered_log_income)
   ```
   So $\alpha_i = \exp(\beta_0 + \alpha_y \cdot \log\tilde y)$ with $\alpha_y \equiv$ `log_price_sens_income`. No simulation of switching, no exact-$P$ matching, no inversion of the concavity.

**This is path (b).** The GMM equates $\alpha_y$ (structural semi-elasticity of $\log\alpha$ w.r.t. $\log y$) directly to the empirical semi-elasticity of $P_{\text{switch}}$ w.r.t. $\log y$. The correct structural mapping at $\bar P = 0.71$ under the small-$s_{ij}$ logit is

$$\frac{d\log P}{d\log y} = \alpha_y \cdot \frac{(1-P)(-\ln(1-P))}{P} \approx 0.51 \cdot \alpha_y$$

so the current code implicitly sets $\alpha_y = 0.197$ where the exact mapping would give $\alpha_y \approx 0.39$. **Roughly a factor-of-2 understatement.**

**Fix options (ordered by invasiveness):**

1. **One-line recalibration.** In `estimate_model_current_eqm_foc.jl:153`, scale by the correction factor:
   ```julia
   # Correct for logit concavity: empirical LPM elasticity ≈ 0.51 · α_y at P̄ ≈ 0.71
   second_choice_draws.elast[BOOT_DRAW] / 0.51,  # log_price_sens_income
   ```
   Uses the small-$s_{ij}$ formula $(-\ln(1-\bar P))(1-\bar P)/\bar P$ with $\bar P$ from the data. Do the same rescale inside `second_choice_bootstrap.ipynb` so all bootstrap draws are corrected consistently. Rerun the estimation. Counterfactual tables will shift — most importantly, the heterogeneity in $\alpha_i$ roughly doubles, so high-income consumers become more reward-responsive and low-income less so, which affects the distributional welfare decomposition.

2. **Restore as a GMM moment.** Add a simulated moment that (i) computes $P_i(\alpha_i) = 1-\exp(-\alpha_i\Delta f)$ for each consumer in the simulation panel, (ii) runs the same LPM of simulated-switch on log income, (iii) matches the simulated elasticity to the data elasticity. This absorbs the concavity correctly and handles finite-$s_{ij}$ effects that option 1 ignores.

3. **Do nothing structural, fix the text.** If 1–2 are out of scope, the identification appendix should at minimum acknowledge that `log_price_sens_income` is calibrated to the empirical LPM elasticity and note the direction of the implied attenuation. This is the weakest option and leaves the parameter potentially understated.

**Welfare implications to check:**
- Fee-cap counterfactual: higher $\alpha_y$ means high-income cardholders lose more reward surplus, low-income gain more from price passthrough — distributional tilt changes.
- Monopoly counterfactual (already known to flip under halved $\alpha_0$): with $\alpha_y$ roughly doubled, the heterogeneity channel strengthens; sign or magnitude may shift further.
- Dual routing: reward elasticity heterogeneity affects how χ²² interacts with income.

Rerunning the main counterfactual table under the corrected calibration is the clean way to see how much this actually moves numbers.

---

### Diversion ratio moment construction (#2 apr13)

**Triage status:** Rejected as "PDF-extraction artifact; formula uses `\iota` throughout." Verified: notation is fine. But the substantive algebraic concern was not addressed.

**Why it matters:** If the tex formula and the GMM code don't target the same object, the second-choice moment may be mis-labeled in the paper (embarrassing, not welfare-moving). If the tex matches the code and both compute a non-natural statistic, there's a real question about what the diversion moment identifies.

**The concern:**
Let $A = \sum_i S_{i,3}$ be same-type bank-switchers in the raw survey. The inner sum at [`appendix_reduced.tex:509`](../appendix_reduced.tex#L509) equals $\text{Pr}[\text{same network} \mid \text{bank switch}]$. So:

- $\iota = \sum_i S_{i,3}(1-p_i)$ = cross-network switchers (matches the prose description)
- $A - \iota$ = within-network bank switchers

The natural "network diversion to same card type" moment is $\iota/N$. The tex reports:

$$\frac{\sum_i S_{i,3} - \iota}{N - \iota} = \frac{\text{within-network switchers}}{N - \text{cross-network switchers}}$$

This ratio has no obvious economic reading. The four candidates I can think of all give different formulas:

| Interpretation | Formula |
|---|---|
| Cross-network rate (raw) | $\iota/N$ |
| Conditional on bank-switching | $\iota/A$ |
| Drop ambiguous (within-network) respondents | $\iota/(N-(A-\iota))$ |
| Drop cross-network respondents | $(A-\iota)/(N-\iota)$ ← **tex** |

The tex matches the last option, but "share of within-network bank-switchers among the non-cross-network population" is not what one would call a diversion ratio.

**To verify:**
1. Open the GMM moment block that consumes the diversion output.
2. Check what the simulated counterpart computes and compare with the tex.
3. If mismatch: fix the tex. If match: rewrite the paragraph so the moment is labeled honestly (e.g., as a conditional stay-on-bank rate), and confirm that whatever parameter it identifies actually needs this particular construction rather than the cleaner $\iota/N$.

The `second_choice_diversion_assumptions` table generator is the obvious starting point for the trace.

---

## Priority 2 — Defensible but worth one sentence

### 2×2 policy matrix — "credit-capped, debit-uncapped" corner (#3 apr13)

**Triage status:** Dropped. User said "dumb."

**Second read:** Calling it dumb is too quick. The missing corner is a real policy question: does the fee-cap welfare gain depend on Durbin remaining in place underneath? Under the current credit cap, debit is already constrained at ~21bp, which limits how much networks can substitute toward debit. Removing both the Durbin backstop and capping credit isolates the credit-cap mechanism from the Durbin interaction.

**Editorial judgment:** The paper already runs (a) status quo, (b) Cap Fees (credit capped, Durbin in place), (c) Uncap Debit (both uncapped). Running the fourth corner would add one column to Table 5 and probably not change the qualitative message. Reasonable to skip for bandwidth, but it is not a nonsensical request — a careful reviewer could legitimately push on this.

**Recommended action:** None in the tex. If a subsequent referee raises this, don't dismiss it out of hand; the natural response is that the policy space of interest is two-sided regulation (which the paper covers) and the unilateral credit-cap-only corner is an unrealized policy that the Durbin backstop makes less relevant in practice.

---

### Discover 1.7pp debit decline vs. strict credit-debit segmentation (#12 apr13)

**Triage status:** Dropped.

**Second read:** The Discover event study does show a ~1.7pp decrease in debit spending during reward months, which empirically is nonzero cross-type substitution. The baseline model assumes exactly zero. Appendix OF runs the partial-substitution robustness and shows the main policy rankings survive, so the modeling choice is defensible, but the main text currently glosses the empirical tension.

**Recommended action:** Add one sentence to the Discover event study discussion acknowledging the 1.7pp debit decline as a small empirical cross-type substitution channel, and pointing to appendix OF for the robustness check. Cost: one sentence. Benefit: a future reviewer who independently spots the 1.7pp can't accuse you of hiding it.

---

## Priority 3 — Correctly dismissed

These held up on re-examination. No further action.

| # | Topic | Why the dismissal is right |
|---|---|---|
| #8 apr13 | Rate vs. absolute-dollar rewards | CES log indirect utility makes the reward rate the natural object; specification is internally consistent. |
| #24 apr13 | Share-response term as second-order | Legitimate PE/GE pedantry. The derivation is partial-equilibrium by construction; adding "holding rewards fixed" would be tidier but is not load-bearing. |
| #25 apr13 | Non-pecuniary utility ω scaling for single-homers | Figure 7 and the wallet definition resolve the ambiguity. |
| #31 apr13 | χ²² interpretation in response letter | Purely expositional; the reply letter's phrasing is slightly loose but the main text is correct. |
| #32 apr13 | MC Debit elasticity text vs. table | Verified: text says "0.3%" and `diversion_baseline.tex` shows both (Visa Debit, Visa Credit) and (MC Debit, Visa Credit) at −0.3. The reviewer misread the table. |
| #15 apr13 | Panel C in Table 2 | Already present at [`estimation.tex:114`](../estimation.tex#L114). |
| #28 apr13 | Panel C in Table OF.6 | Already present in `tab:param-extension`. |

---

## Summary

Of the eleven dismissed items across both refine passes, two deserve actual verification (α_y nonlinearity and the diversion moment construction), two deserve a short main-text concession (2×2 corner and Discover 1.7pp), and seven are correctly dismissed.

The α_y check is the highest-priority item from the entire refine cycle that isn't already resolved, because it is the only one with the potential to move a welfare number rather than a sentence.
