# Bootstrap-stage correction for α_y

Fix for the concavity bias in the second-choice calibration of `log_price_sens_income` (= $\alpha_y$). Applies at the bootstrap stage in R so no Julia changes are needed.

---

## Problem

The current pipeline calibrates the structural income-elasticity of price sensitivity to the empirical LPM elasticity of switching probability:

1. `second_choice_analyze.ipynb` runs a gaussian LPM `change_rewards ~ log_income` on credit-card respondents, giving slope $\hat\beta \approx 0.14$.
2. `average_person_elast` divides the slope by each respondent's fitted $\hat P_i$ and averages, yielding $\approx 0.197$.
3. The bootstrap writes this per-draw to `bootstrap_data/income_switch_coef.csv` under the column `elast`, merged into `second_choice_survey_draws.csv`.
4. [`estimate_model_current_eqm_foc.jl:153`](../../code/estimate_model_current_eqm_foc.jl#L153) assigns `second_choice_draws.elast[BOOT_DRAW]` directly into `log_price_sens_income`.
5. [`03_consumer_homing_demand.jl:159`](../../code/model_functions/03_consumer_homing_demand.jl#L159) uses it structurally:
   ```julia
   price_sensitivity = exp(cons_pref.log_price_sens + cons_pref.log_price_sens_income * centered_log_income)
   ```
   i.e. $\alpha_i = \exp(\beta_0 + \alpha_y \log\tilde y_i)$.

The data object and the structural object are not the same thing. The data moment is the income-elasticity of an observed switching probability; the structural parameter is the semi-elasticity of $\log\alpha_i$ with respect to $\log y$. They coincide only in a limit that does not hold in this sample.

## Why the mapping is wrong

Under a conditional logit with small individual issuer shares $s_{ij}\ll 1$, the closed-form switching probability under a utility drop $\Delta = \alpha_i \Delta f$ on the chosen issuer is

$$P_{\text{switch}}(\alpha_i; \Delta f) = 1 - e^{-\alpha_i \Delta f}.$$

Differentiating in $\log y$ through $\alpha_i = \exp(\beta_0 + \alpha_y \log\tilde y)$:

$$\frac{\partial P}{\partial \log y} = \alpha_y\, (1 - P)\bigl(-\ln(1-P)\bigr).$$

The structural parameter $\alpha_y$ is proportional to the LPM slope, but with a concavity factor $(1-P)(-\ln(1-P))$ that depends on the baseline switching probability:

| $\bar P$ | Correction factor $(1-\bar P)(-\ln(1-\bar P))$ |
|---|---|
| 0.10 | 0.095 |
| 0.30 | 0.250 |
| 0.50 | 0.347 |
| 0.71 | **0.359** |
| 0.90 | 0.207 |

The factor is bounded above around 0.37 and shrinks as $\bar P$ moves away from ~0.7. At the sample mean $\bar P \approx 0.71$, it equals 0.359, so the LPM slope recovers roughly $0.36\cdot\alpha_y$, not $\alpha_y$ itself.

Equivalently, in elasticity form at $\bar P = 0.71$:

$$\frac{d\log P}{d\log y}\bigg|_{\bar P=0.71} = \frac{(1-\bar P)(-\ln(1-\bar P))}{\bar P}\,\alpha_y \approx 0.51\,\alpha_y.$$

The current pipeline implicitly sets $\alpha_y$ equal to $d\log P/d\log y$, understating the structural parameter by a factor of $\approx 1/0.51 \approx 2$.

## The fix

Invert the nonlinear relationship inside R so the object written to `income_switch_coef.csv` is already the structural $\alpha_y$, not the raw LPM elasticity. Then Julia's existing calibration line is correct without change.

At each observation $i$, the local identity is

$$\alpha_y = \frac{\partial P_i / \partial \log y}{(1-P_i)\bigl(-\ln(1-P_i)\bigr)}.$$

Replacing the numerator with the LPM slope and evaluating the denominator at the fitted $\hat P_i$ gives a closed-form per-person estimate of $\alpha_y$, which is then averaged across respondents.

### Code change

`code/second_choice_analyze.ipynb`, cell 117 (`average_person_elast`):

```r
# Before
average_person_elast = function(r){
    person_level_means = r %>% predict
    agg_slope = (r %>% coef)[2]
    return(mean(agg_slope / person_level_means))
}
```

```r
# After
average_person_elast = function(r){
    person_level_means = r %>% predict
    # Clip to avoid divide-by-zero when fitted P is near 0 or 1
    person_level_means = pmin(pmax(person_level_means, 0.05), 0.95)
    agg_slope = (r %>% coef)[2]
    # Invert small-share logit: d P / d log y = α_y · (1-P)(-log(1-P))
    correction = (1 - person_level_means) * (-log(1 - person_level_means))
    return(mean(agg_slope / correction))
}
```

No other changes are required. The bootstrap, the csv schema, and the Julia calibration block all stay the same — the `elast` column now holds the structurally-corrected $\alpha_y$ rather than the raw LPM elasticity.

### Simpler variant (mean-P)

If the per-person version is noisy across bootstrap draws, the mean-$P$ variant is more stable and numerically very close when fitted values are concentrated near the sample mean (as they are here — the LPM has low $R^2$):

```r
average_person_elast = function(r){
    agg_slope = (r %>% coef)[2]
    pbar = mean(r$response)  # or: mean(model.frame(r)[[1]])
    correction = (1 - pbar) * (-log(1 - pbar))
    return(as.numeric(agg_slope / correction))
}
```

Each bootstrap draw's $\bar P$ gets resampled naturally, so uncertainty in both the slope and the baseline probability propagates through. Recommended as the default.

## Sanity check at the mean

With slope $\approx 0.14$ and $\bar P \approx 0.71$:

$$(1-\bar P)(-\ln(1-\bar P)) \approx 0.29 \times 1.238 \approx 0.359$$

$$\hat\alpha_y = \frac{0.14}{0.359} \approx 0.39.$$

Compared to the current calibrated value of $\approx 0.20$, this is the expected factor-of-$\approx 2$ increase.

## What this does not handle

The correction assumes $s_{ij}\ll 1$ so that the logit switching probability collapses to the clean exponential form $1-e^{-\alpha_i\Delta f}$. The full finite-$s_{ij}$ formula is

$$P_{\text{switch}}(\alpha_i; \Delta f, s_{ij}) = \frac{(1-s_{ij})(1-e^{-\Delta})}{1 - s_{ij}(1-e^{-\Delta})}.$$

This reduces to the exponential form as $s_{ij}\to 0$. In a fragmented credit-card issuer market the approximation is probably fine — typical individual issuer shares within a consumer's consideration set are well below 0.5 — but if desired, the fully rigorous version is a simulation-based GMM moment (option 2 in `refine_dismissed_reexamined.md`) that evaluates the exact $P$ at each draw, runs the analogous LPM, and matches the simulated coefficient. The bootstrap-stage fix above is the 90% solution with essentially zero code cost.

## Downstream welfare to re-check

With $\alpha_y$ roughly doubled, reward sensitivity becomes more heterogeneous across income. Counterfactuals likely to shift:

- **Fee cap:** high-income cardholders lose more reward surplus, low-income gain more from price passthrough — the distributional decomposition tilts.
- **Monopoly:** already known to flip under halved $\alpha_0$; a larger $\alpha_y$ widens the heterogeneity channel and may change sign or magnitude.
- **Dual routing:** interacts with χ²² through income-varying reward responsiveness.

Rerunning `estimate_model_current_eqm_foc.jl` and the main counterfactual table under the corrected bootstrap is the clean way to see how much the welfare numbers actually move.
