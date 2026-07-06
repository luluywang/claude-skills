# Audit: OA.4 - Extension Model

## Current State

### Current Opening Statement

```
\section{Extension Model}
\label{sec:oa-extension-model}

This appendix presents robustness analysis for an alternative model specification
that allows consumers who hold both debit and credit cards to substitute between
them at the point of sale. In the baseline model, multi-homing consumers who carry
both debit and credit cards cannot substitute across payment types---a consumer who
prefers credit will pay with cash rather than debit if credit is unavailable.
The extension model relaxes this assumption by allowing full debit-credit substitution.
```

**Assessment**: Opening statement IS very clear. It:
1. Identifies this as robustness analysis (not main specification)
2. States the baseline assumption (no debit-credit substitution)
3. States the extension modification (allow full substitution)
4. Previews the core change (parameter κ from 1 to 0)

**Strength**: Excellent opening; clearly positions this appendix in relation to baseline model.

### Referee Concern Framing

**Question**: Is this framed as addressing a referee concern?

**Evidence from text**:
- Line 14: "Referees raised concerns about the baseline assumption that debit and credit cards do not substitute at the point of sale."
- Lines 15-16: "Empirically, Figure \ref{fig:grocer-event-sales-effects} shows that when a large grocer started accepting credit cards, consumers who previously used both credit and debit elsewhere shifted their credit card spending toward the grocer."

**Assessment**: ✓ YES, explicitly framed as response to referee concerns (line 14). This is strong transparency about the motivation.

**Quality of response**:
- Acknowledges concern directly
- Provides empirical evidence for the concern (grocer event study)
- Shows how the modified model addresses it
- Demonstrates that results are robust (conclusion of appendix)

### Model Modification (κ Parameter)

**Baseline specification**:
- Parameter κ = 1: Consumers who hold both debit and credit cannot substitute across types
- Interpretation: A credit-card consumer will use cash rather than their secondary debit card if credit is unavailable

**Extension specification**:
- Parameter κ = 0: Allow full debit-credit substitution at point of sale
- Interpretation: A consumer can use secondary debit as substitute for primary credit, subject to usage penalty

**Mathematical justification** (lines 17-20):
```
When κ = 0, a consumer who prefers credit cards but shops at a debit-only
merchant can use their secondary debit card, subject to a usage penalty
governed by the convenience parameter.
```

**Clarity assessment**:
- ✓ The change is clearly stated
- ✓ Intuition is provided
- ✗ The relationship to the merchant benefit parameter γ is not explained (is γ also variant-specific?)
- ✗ The usage penalty mechanism is mentioned but not detailed

**Finding**: The κ parameter change is well-explained but the broader model modifications (merchant benefits, elasticity changes) are consequences that emerge from re-estimation rather than designed features.

### Parameter Comparison

**Parameter differences** (subsection lines 38-57):

| Parameter Type | Baseline Value | Extension Value | Difference | Magnitude |
|---|---|---|---|---|
| Random coefficient correlation | -0.78 | -0.66 | Weaker correlation | Large |
| Unobserved debit utility (Ξ debit) | -3.3 | -0.5 | Less negative | Large |
| Income gradient (β_y) | -0.8 | +0.4 | Sign flip | Critical |
| Credit card marginal cost | 70-80 bps | 90 bps | +10-20 bps | Small |
| CES elasticity (σ) | 5.3 | 6.8 | +1.5 | Medium |
| Mean merchant benefit (γ̄) | Not stated | 0.18-0.21 | N/A | N/A |

**Assessment of parameter discussion**:
- ✓ Consumer parameters are clearly explained (lines 43-47)
- ✓ Network parameters explained (lines 49-51)
- ✓ Merchant parameters explained (lines 53-56)
- ✗ No discussion of why these parameter changes are economically sensible
- ✗ No sensitivity analysis showing how robust counterfactuals are to parameter shifts

**Critical finding**: The income gradient sign flip (β_y from -0.8 to +0.4) is major. The appendix states why (lines 46-47) but doesn't discuss whether this makes economic sense.

### Counterfactual Results

**Counterfactual table** (lines 62-83):

| Counterfactual | Baseline Result | Extension Result | Difference | Robustness |
|---|---|---|---|---|
| Cap Fees | +30 billion | +28 billion | -2 billion (7%) | ✓ Robust |
| Uncap Debit | +7 billion | +8 billion | +1 billion (14%) | ✓ Robust |
| Monopoly | +16 billion | +14 billion | -2 billion (13%) | ✓ Robust |

**Clarity of results presentation**:
- ✓ Results are clearly tabled
- ✓ Both models' results shown side-by-side
- ✓ Direction and magnitude of differences shown
- ✗ Standard errors are mentioned ("not shown") but not provided
- ✗ No discussion of whether differences are statistically significant

**Finding**: Results are qualitatively robust (same direction, similar magnitude) but quantitative differences are not negligible (7-14%). The claim that they are "similar" (line 61) masks these differences.

### Counterfactual Ranges

**Explicit ranges provided**:
- Cap Fees: 28-30 billion (range: 2 billion)
- Uncap Debit: 7-8 billion (range: 1 billion)
- Monopoly: 14-16 billion (range: 2 billion)

**Assessment**: The ranges are narrow (7-14% variation) but:
- No confidence intervals provided for either model
- No discussion of whether ranges overlap (they do, but unclear if differences are significant)
- No guidance on which to use for policy (baseline vs. extension)

**Finding**: Counterfactual ranges exist but are presented without uncertainty quantification.

### File Naming Artifacts

| Artifact Type | Count | Locations |
|---|---|---|
| `.tex` file references | 1 | Line 40 (reference to estimation appendix) |
| `.csv` references | 0 | None |
| `variant = ` references | 0 | None |
| Model variant names | 5 | Lines 18, 40 (`baseline`, `extension`, named throughout) |

**Finding**: Minimal artifacts. Model variants are properly named with text references rather than code-like variable names.

---

## Issues Found

1. **Missing Standard Errors**: Line 82 states "Standard errors (not shown) are approximately 4--5 billion for each estimate," but:
   - The table presents point estimates without any uncertainty measure
   - Readers cannot assess whether 2-billion differences between baseline and extension are significant
   - Claiming standard errors are "not shown" then stating approximate values is awkward

   **Impact**: Readers cannot conduct statistical tests to verify whether results are meaningfully different.

2. **No Guidance on Model Choice**: The appendix shows results are robust but doesn't recommend which model to use:
   - For main paper: baseline (cited in main results)
   - For policy analysis: [unspecified]
   - For robustness: extension (shows sensitivity)

   The conclusion (lines 100-101) says "Researchers who prefer [assumption A] can use baseline; those who prefer [assumption B] can use extension" but this deflects rather than recommends.

3. **Unexplained Parameter Changes**: The extension model's re-estimation produces large parameter changes:
   - Income gradient sign flip (β_y: -0.8 to +0.4): Why is this economically sensible?
   - Debit unobserved utility change (Ξ: -3.3 to -0.5): Is it reasonable that debit preferences shift this much?
   - CES elasticity increase (σ: 5.3 to 6.8): Why would elasticity increase with debit-credit substitution?

   None of these are explained as features of the extension; they're presented as consequences.

4. **Limited Sensitivity Analysis**: The appendix doesn't explore:
   - What if κ = 0.5 (partial substitution)?
   - How sensitive are counterfactuals to different κ values?
   - Are parameter estimates continuous in κ?

   The choice is binary (κ = 1 vs. κ = 0) without exploring the parameter space.

5. **Incomplete Identification Discussion**: Lines 35-36 mention "The key identifying moment is the within-network diversion ratio" but:
   - How does this moment identify κ differently in baseline vs. extension?
   - Are both models identified off the same moment set?
   - Are there sufficient degrees of freedom to estimate the additional substitution parameters?

6. **Missing Behavioral Comparison**: The appendix doesn't show how consumer and merchant behavior actually differ:
   - How do payment shares change? (e.g., does credit market share rise?)
   - How do merchant acceptance decisions change?
   - Do adoption patterns differ between models?

   Only counterfactual welfare is compared, not the equilibrium itself.

---

## Recommendations

1. **Present Standard Errors**: Replace line 82-83 table with uncertainty measures. Either:
   - Add column with confidence intervals: "Cap Fees: $30 ± 5$ billion (baseline) vs. $28 ± 5$ billion (extension)"
   - Or add footnote with significance test: "Difference between baseline and extension is [not significant / significant at 5%] for all counterfactuals"

2. **Add Model Selection Discussion**: After line 99, add:
   ```
   For the main paper, we report baseline model results because the assumption
   that consumers have rigid transaction-specific preferences is supported by
   the Discover rewards evidence in Appendix OA.1 (no debit-credit substitution
   at point of sale). However, readers who believe the grocer event study evidence
   (that consumers do substitute when credit becomes available) may prefer the
   extension model results. The quantitative policy conclusions are robust to both
   specifications, differing by at most [14]% in any counterfactual scenario.
   ```

3. **Explain Parameter Changes Explicitly**: Add subsection 3.2 "Why Parameters Change":
   ```
   The extension model's re-estimation produces several parameter changes.
   These arise mechanically because the model must fit the same data moments
   under a different substitution assumption:

   (1) Income gradient sign flip (β_y: -0.8 → +0.4): In baseline, high-income
   consumers reveal a strong preference for credit, interpreted as β_y < 0.
   In extension, high-income credit users' revealed preference partly reflects
   their option to substitute to debit at non-credit merchants. Removing this
   option (baseline) makes revealed preferences more negative.

   (2) Debit unobserved utility (Ξ_debit: -3.3 → -0.5): The extension model
   attributes lower debit usage to friction/substitution costs rather than
   inherent preferences. Thus debit utility appears less negative.

   (3) CES elasticity (σ: 5.3 → 6.8): [Economic explanation of why elasticity
   increases when merchants' benefits must rationalize credit acceptance despite
   debit substitution possibility].
   ```

4. **Add Sensitivity to κ Parameter**: Create table or figure showing:
   ```
   Counterfactual results under alternative substitution parameters:
   - κ = 1.0 (baseline, no substitution): [results from Table 1]
   - κ = 0.75 (partial substitution): [interpolated/estimated results]
   - κ = 0.50 (moderate substitution): [results]
   - κ = 0.25 (high substitution): [results]
   - κ = 0.0 (full substitution, extension): [results from Table 1]

   This shows whether welfare conclusions change smoothly with substitution
   parameter or exhibit threshold behavior.
   ```

5. **Compare Equilibrium Allocations**: Add new subsection showing:
   ```
   Table: Equilibrium Comparison (Baseline vs. Extension)

   | Variable | Baseline | Extension | Change |
   | Credit market share | X% | Y% | +Z% |
   | Debit market share | A% | B% | +C% |
   | Merchant credit acceptance | P% | Q% | +R% |
   | Average retail price level | | | |

   These comparisons show how substitution affects equilibrium beyond
   counterfactual policy analysis.
   ```

6. **Clarify Identification**: Add subsection explaining:
   ```
   Both baseline and extension models are identified off the same moment set
   [cite Appendix OA.5/Estimation]. The key difference is that the extension
   model treats some within-network diversion (documented in second-choice
   survey) as debit-credit substitution rather than pure network switching.
   This allows estimation of the substitution matrix χ_lm in addition to the
   network switching parameters. The identification is achieved through [cite
   moments that distinguish these effects].
   ```

---

## Verification Checklist

- [x] File read end-to-end (103 lines)
- [x] Current opening statement captured (clear positioning as robustness)
- [x] Referee concern framing assessed (explicit on line 14)
- [x] Model modification explained (κ parameter clearly defined)
- [x] Parameter comparison table created (6 key parameters identified)
- [x] Counterfactual ranges extracted (28-30B cap, 7-8B uncap, 14-16B monopoly)
- [x] File naming artifacts searched (minimal; proper naming)
- [x] Audit document created at correct path
- [x] Markdown is clean and well-formatted

---

**File**: `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_substitution.tex`
**Size**: 7,918 bytes | **Lines**: 103
**Framing**: ✓ Excellent (explicitly addresses referee concern)
**Model Modification**: ✓ Clear (κ = 1 to 0 change well-explained)
**Results Robustness**: ✓ Quantitatively robust (7-14% variation)
**Clarity Issues**: Missing standard errors, unexplained parameter changes, no sensitivity to κ parameter
**Missing Elements**: Model selection guidance, equilibrium allocation comparison, identification details
**Audit Date**: January 31, 2026
