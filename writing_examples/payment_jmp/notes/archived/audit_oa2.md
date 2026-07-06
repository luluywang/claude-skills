# Audit: OA.2 - Price Coherence

## Current State

### Current Opening Statement

```
\section{Price Coherence}
\label{sec:oa-price-coherence}

Although merchants in the U.S. can charge discriminatory prices for different
payment methods, most do not. This can be rational even assuming small menu costs.
```

**Assessment**: Opening statement IS clear and presents the main finding: merchants generally charge uniform prices despite having the legal right to discriminate. The statement is concise and immediately explains what the appendix addresses.

**Strength**: The opening is self-contained and could stand alone as an abstract of the appendix's contribution.

### Major Section Structure

| Section | Lines | Title | Content Summary |
|---|---|---|---|
| History of Price Coherence | 10-25 | Evolution of surcharge legality 1981-2023 | Legal/institutional background |
| Price Coherence in DCPC Data | 27-57 | Empirical frequency of surcharges and discounts | Core empirical evidence |
| Theory: Private Incentives to Surcharge | 65-297 | Mathematical analysis of why uniform prices persist | Theoretical explanation |
| - No Steering Lemma | 95-182 | Proof that surcharges cannot change payment method | Core theory result |
| - Magnitude of Losses | 194-267 | Quantification of profit losses from uniform pricing | Quantitative implication |
| - Conditions for Effectiveness | 268-276 | Discussion of when surcharging might be valuable | Boundary conditions |
| - Multi-network Pricing | 277-297 | Discussion of differential pricing across networks | Extension |

### Evidence Types Present

| Evidence Type | Present | Location | Assessment |
|---|---|---|---|
| Surcharging adoption rates | ✓ Yes | Lines 27-57, Figure on line 58 | Good empirical foundation |
| Legal/regulatory history | ✓ Yes | Lines 10-25 | Institutional context provided |
| International comparison | ✗ No | N/A | Not included |
| Theory of surcharging incentives | ✓ Yes | Lines 65-297 | Extensive theoretical development |
| Quantitative estimates | ✓ Yes | Lines 264-266 (basis points of profit) | Point estimates provided |
| Robustness to assumptions | ✓ Partial | Lines 268-297 | Extended discussion of boundary cases |

**Finding**: The appendix is heavily weighted toward theoretical explanation with limited empirical evidence. Surcharging rates are measured in DCPC data but not connected quantitatively to the theoretical predictions about menu costs.

### Connection to Counterfactual Pass-Through Mechanism

**Expected connection**: The main text likely argues that retailers pass through payment network fees to consumer prices. This appendix explains why merchants charge uniform prices despite being able to discriminate.

**Clarity assessment**:

**Explicit connection statements**:
- Line 33: "This fact explains why I assume price coherence throughout my paper."
- Lines 68-75: "Third, given this inability to steer, merchants' losses from uniform prices are second order in any type-symmetric equilibrium..."

**Assessment**: The connection IS made explicit. The appendix argues:
1. Merchants cannot use surcharges to steer consumers (Lemma on line 141)
2. Therefore, uniform pricing has only second-order losses (Theorem on line 213)
3. Therefore, small menu costs rationalize price coherence
4. Therefore, it's reasonable to assume full fee pass-through in the model

**Quality**: Strong logical chain connecting uniform pricing to fee pass-through. However:
- The menu cost explanation is theoretical; no empirical estimate of actual menu costs
- The connection to the "integrated economy" main-text claim is not explicit

### Opening Statement Assessment (OA.2 specifically)

```
"Although merchants in the U.S. can charge discriminatory prices for different
payment methods, most do not. This can be rational even assuming small menu costs."
```

**Strengths**:
- Factual statement of the puzzle (merchants don't surcharge despite ability)
- Immediately states the appendix's resolution (menu cost explanation)
- Self-contained; doesn't require reading to understand the appendix's contribution

**Weaknesses**:
- Doesn't mention connection to main model's pass-through assumption
- Doesn't state what "this can be rational" means (rational for whom? in what sense?)

### File Naming Artifacts

| Artifact Type | Count | Locations |
|---|---|---|
| `.tex` references | 1 | Line 1 (document class) |
| `.csv` references | 0 | None |
| `variant = ` references | 0 | None |
| `.pdf` figure references | 1 | Line 58 (price coherence time series) |

**Finding**: Minimal artifacts. Single figure reference on line 58: `../output/graphs/price_coherence_ts.pdf`

---

## Issues Found

1. **Limited Empirical Scope**: The empirical evidence is restricted to DCPC surcharge frequencies. No quantitative comparison to:
   - Menu cost estimates from literature
   - Counterfactual surcharge rates under different assumptions
   - International evidence on surcharging in countries with different regulations

   **Impact**: Readers cannot assess whether the theoretical menu cost explanation is quantitatively plausible.

2. **No Empirical Menu Cost Estimates**: The appendix concludes that menu costs "less than 20 basis points" explain price coherence (lines 82-85), but:
   - This is derived from the model, not measured independently
   - No comparison to empirical estimates of menu costs in retail
   - Circular logic: "menu costs explain uniform pricing if menu costs exceed X, and our model suggests X is small, so menu costs explain it"

3. **Disconnected Boundary Case Discussion** (Lines 268-297): The section on "Gains from Charging One Credit Card Versus Another" (lines 277-297) feels disconnected from the main analysis. It discusses why merchants don't differentiate between Visa and AmEx fees but:
   - This is a different question from uniform vs. surcharge vs. cash
   - The reasoning (fixed costs of price signage) is mentioned but not proven
   - It's unclear whether this strengthens or weakens the main menu cost argument

4. **Missing Connection to Main Text Claims**: The main text likely claims that merchant fees pass through to consumer prices. This appendix shows price coherence implies fee pass-through is rational. But the explicit connection is minimal (one sentence on line 33).

5. **Theoretical Result Presentation**: The two main theorems (Lemma on steering; Theorem on uniform pricing losses) are presented without economic intuition first. Lines 140-182 prove the lemma but don't explain the intuition before beginning the proof.

6. **No Discussion of Evidence Against Coherence**: The appendix mentions that surcharging is "legal'' after 2013 but rates are still low. Why? The appendix offers the menu cost theory, but doesn't discuss:
   - Consumer aversion to surcharges (psychological factors)
   - Merchant reputation concerns
   - Imperfect information about legality
   - These would be alternative explanations worth discussing

---

## Recommendations

1. **Add Quantitative Empirical Anchors**: After line 57, add:
   ```
   To calibrate the menu cost explanation, we note that our theoretical
   analysis implies losses from uniform pricing are at most 20 basis points
   (Section 3.2). Empirical studies of retail price changes [cite: Dominitz & Manski,
   Gagnon & Lopez-Salido, or others] estimate menu costs ranging from [X to Y basis points].
   Our implied menu cost threshold is [below/above/comparable to] these estimates,
   suggesting [uniformpricing is / may or may not be] consistent with observed
   surcharging frequencies.
   ```

2. **Reorganize Boundary Cases Section**: Split lines 268-297 into:
   - Subsection 4a: "Why Not Differentiate Between High- and Low-Fee Cards?"
   - Subsection 4b: "Multi-network Competitive Pressure"

   Add context: "In principle, merchants might benefit from surcharging AmEx (high fee) while offering discounts for Visa (low fee)..."

3. **Add Alternative Explanations Paragraph**: After the empirical facts (line 57), add:
   ```
   Why is surcharging rare despite being legal? Several explanations have been
   proposed:

   (1) Menu costs of price signage and customer confusion (analyzed in Section 3)
   (2) Consumer aversion to "add-on" pricing [cite: Thaler, Bourguignon et al]
   (3) Merchant concerns about customer relationships [cite: Kadoya et al]
   (4) Incomplete information about legality of surcharging

   In this appendix, we focus on (1) and show that small menu costs suffice
   to rationalize uniform pricing. Factors (2)-(4) may provide additional
   explanation but are orthogonal to the fee pass-through analysis in the main text.
   ```

4. **Explicit Connection to Main Model**: Add section opening statement:
   ```
   This appendix explains why our main model assumes merchants charge uniform
   prices (price coherence) despite being able to surcharge different payment
   methods. We show that [brief summary of logic: surcharges don't steer
   consumers + uniform pricing losses are second-order + small menu costs
   rationalize coherence]. Therefore, it is reasonable to assume full
   pass-through of merchant fees to retail prices, as assumed in the
   counterfactual analysis.
   ```

5. **Provide Economic Intuition Before Proofs**: Add to line 140 (before Lemma):
   ```
   Intuition: A merchant who surcharges credit card users by amount s will
   cause some customers to switch to alternative payment methods. However,
   in our model, customers who prefer credit cards cannot substitute to debit
   (by assumption). Therefore, surcharges cannot change the payment method
   used by credit card users; it can only reduce their consumption. Because
   lower consumption harms merchants, surcharges are ineffective as steering
   mechanisms.
   ```

6. **Add Robustness Check on Menu Cost Threshold**: Add calculation showing:
   ```
   We compute the implied menu cost threshold under alternative parameter values:
   - If σ = 4 (lower elasticity): menu cost threshold = [Y] bps
   - If σ = 7 (higher elasticity): menu cost threshold = [Z] bps
   These thresholds [span a reasonable range / concentrate around X / are sensitive to sigma],
   suggesting our conclusion is [robust / sensitive] to demand elasticity assumptions.
   ```

---

## Verification Checklist

- [x] File read end-to-end (299 lines)
- [x] Current opening statement captured and assessed
- [x] Evidence types catalogued (6 types: history, empirical rates, theory, steering, magnitude, multi-network)
- [x] Pass-through connection clarity evaluated (explicit but limited)
- [x] File naming artifacts identified (minimal; 1 figure reference)
- [x] Audit document created at correct path
- [x] Markdown is clean and well-formatted

---

**File**: `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_surcharging.tex`
**Size**: 14,749 bytes | **Lines**: 299
**Evidence Balance**: Theory-heavy (80% of content) vs. Empirical (20%)
**Main Issue**: Limited empirical validation of menu cost explanation; disconnected boundary cases section
**Audit Date**: January 31, 2026
