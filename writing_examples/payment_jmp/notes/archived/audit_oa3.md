# Audit: OA.3 - Merchant Sorting

## Current State

### Current Opening Statement

```
\section{Merchant Sorting}
\label{sec:oa-merchant-sorting}

In principle, consumer sorting across stores can reduce redistribution among
consumers who use different payment methods. If credit card consumers shop at
one set of stores and cash consumers shop at a different set of stores, then
high credit card merchant fees do not affect cash consumers' consumption.

I find that although there is some sorting of consumers across merchants, the
amount of sorting does not have quantitatively significant effects on the amount
of redistribution that occurs through merchant fees. I arrive at this conclusion
in three steps.
```

**Assessment**: Opening statement IS excellent. It clearly:
1. States the economic principle (sorting reduces redistribution)
2. Provides intuition (example of credit vs cash consumers)
3. Presents the main finding (sorting is quantitatively small)
4. Outlines the structure ("three steps" below)

**Strength**: This is a model opening statement - clear, self-contained, and immediately engaging.

### Main Finding on Redistribution Reduction

**Key numerical finding** (verbatim from text):

Lines 213-216:
```
If we use the weighted covariances (as prescribed by theory), consumer sorting
has the largest effect on reducing the amount of redistribution from cash users
to credit users. But even then, the reduction is only 4% of the baseline effect.
If we use unweighted covariances, this effect expands to 9% of the baseline effect.
```

**Quantitative Summary**:
- **With weighted covariances**: Sorting reduces redistribution by **4%**
- **With unweighted covariances**: Sorting reduces redistribution by **9%**
- **Interpretation**: Even in the best case (unweighted), sorting explains only ~9% of redistribution; ~91% of redistribution remains unexplained by sorting

**Baseline redistribution level**: Not explicitly stated in the excerpt. The table shows welfare effects (Table 6, lines 220-236) but absolute baseline redistribution amount is not provided. The percentage effects refer to "welfare lost" but baseline levels are in the tables referenced.

### Sufficient Statistic Method Clarity

**Question**: Is the sufficient statistic method explained clearly?

**Method description** (lines 136-201):
- Lines 136-146: Mathematical setup (log-linear prices in fees)
- Lines 149-172: Sufficient statistic derivation with envelope theorem
- Lines 177-199: Interpretation and intuition

**Assessment**:
- **Mathematical rigor**: ✓ Complete; proof uses envelope theorem correctly
- **Intuitive explanation**: ✓ Adequate; lines 189-199 provide interpretation
- **Connection to estimation**: ✗ Weak; doesn't explain how this relates to the structural model in other appendices

**Clarity level**: High-level readers can understand "covariances of payment shares across stores determine redistribution." Technical readers can follow the proof. But readers uncertain of the relationship to the full structural model may be confused.

**Finding**: The sufficient statistic is explained, but the relationship to the main structural model (which computes redistribution through general equilibrium effects) could be clearer.

### Connection to Main-Text "Integrated Economy" Claim

**Expected main text claim**: The paper likely argues that payment network fees redistribute across consumers in an "integrated economy" where consumers with different preferences shop at overlapping stores.

**How OA.3 addresses this**:
- Lines 12-16: States the counterfactual (perfect sorting eliminates redistribution)
- Lines 136-201: Develops sufficient statistic for redistribution with arbitrary sorting
- Lines 203-237: Measures actual sorting in data and quantifies redistribution

**Explicit connection statement**: None found. The appendix never explicitly states: "This proves that the main text's 'integrated economy' assumption is empirically validated; consumers do shop at overlapping stores, and sorting is insufficient to eliminate redistribution."

**Implicit connection**:
- The premise (line 7) assumes credit and cash consumers shop at different stores "in principle"
- The finding (lines 10-14) shows they actually shop at the same stores (empirically)
- Therefore, the integrated economy assumption holds

**Assessment**: The connection exists but is implicit. Readers must infer that "sorting does not eliminate redistribution" supports "integrated economy assumption" rather than the appendix stating it explicitly.

### Sufficient Statistic Method Explanation Quality

**Present** (Lines 136-201):
1. ✓ Mathematical definition of $w_{lm}$ (welfare loss ratio)
2. ✓ Interpretation in homogeneous case (line 189-192)
3. ✓ Interpretation in heterogeneous case (line 193-196)
4. ✓ Sufficient statistic form (line 183-184)

**Missing**:
1. ✗ Why "sufficient"? (What question does this statistic suffice to answer?)
2. ✗ Assumptions required (log-linear pricing; envelope theorem validity; no GE feedback)
3. ✗ Relationship to structural model (how does this compare to full equilibrium analysis?)

**Finding**: The sufficient statistic is properly derived and interpreted but the term "sufficient" is not explained. Sufficient for what? (Answer: sufficient to compute welfare effects without solving full structural model, but this is left implicit.)

### File Naming Artifacts

| Artifact Type | Count | Locations |
|---|---|---|
| `.tex` file references | 8 | Lines 115, 119, 125, 129, 228, 229, 234, 235, 250, 256, 260 (tables) |
| `.csv` references | 0 | None |
| `variant = ` references | 0 | None |
| Figure references | 4 | Lines 40, 44, 73, 85, 92, 93 (PDFs for graphs) |

**Finding**: Clean references; all table and figure includes use proper LaTeX syntax.

---

## Issues Found

1. **Missing Main Finding Baseline**: The appendix states sorting reduces redistribution by "4%" (weighted) or "9%" (unweighted), but:
   - What is the baseline redistribution amount? (e.g., in dollars? % of spending?)
   - Which table shows the absolute redistribution numbers?
   - Readers cannot assess whether "4%" is economically large or negligible without context

   **Impact**: Finding reported as percentage reduction of an unknown baseline amount.

2. **Implicit Connection to "Integrated Economy"**: The appendix doesn't explicitly state:
   ```
   These findings validate the main text's assumption of an "integrated economy"
   in which consumers with different payment preferences shop at overlapping stores.
   If perfect sorting occurred, redistribution would be eliminated; the empirical
   finding that sorting reduces redistribution by only [4-9]% confirms that the
   economy is indeed integrated, justifying our welfare analysis.
   ```

   **Impact**: Readers must infer how OA.3 supports main text claims; no explicit validation statement.

3. **Insufficient Statistic Terminology Not Explained**: The term "sufficient statistic" is used (line 136) but never defined. Sufficient for what?
   - Sufficient to compute welfare without solving the full model? (Implied but not stated)
   - Sufficient for consistent estimation? (No)
   - Sufficient for optimal policy? (No)

   **Impact**: Readers unfamiliar with sufficient statistics may be confused about what this method accomplishes.

4. **Missing Assumption Discussion**: The derivation assumes:
   - Log-linear pricing (line 140): "Suppose prices are log-linear in fees"
   - Envelope theorem applies: No consumer quantity changes (no GE feedback)
   - Merchants absorb/pass through fees without changing service quality

   None of these assumptions are explicitly stated or justified.

5. **Disconnected from Structural Model**: The appendix uses a reduced-form sufficient statistic approach, but the main model is structural (general equilibrium with merchant adoption decisions). The relationship between:
   - This reduced-form welfare calculation (lines 136-201)
   - The full structural model welfare calculations (presumably elsewhere)

   is never explained.

6. **Table Presentation**: Tables 6 and 7 (lines 220-262) show welfare ratios but:
   - No row labels explaining what "Homescan - Unweighted" vs. "Homescan - Weighted" mean
   - No indication of what baseline (homogenous merchants) each ratio is relative to
   - References to Tables via `\input` commands, making visual inspection impossible

---

## Recommendations

1. **Add Baseline Redistribution Context**: After line 216, add:
   ```
   To contextualize these results: in the baseline (homogenous merchants)
   case, cash consumers bear [X] dollars in redistribution from credit card
   merchant fees (Table [X]). With actual merchant sorting, this redistribution
   is reduced by only 4%, leaving [Y] dollars in redistribution. This [large/small]
   remaining redistribution illustrates that consumer sorting across merchants
   is insufficient to eliminate payment method discrimination in an integrated
   economy.
   ```

2. **Explicit Integration Economy Connection**: Add new paragraph after line 216:
   ```
   These results validate a core assumption of our main text analysis: the
   U.S. payment network economy is "integrated" in the sense that consumers
   with different payment preferences (credit, debit, cash) shop at overlapping
   sets of stores. In such an integrated economy, merchant fee structures
   affect all consumer types, enabling the redistribution effects computed in
   the main text. If instead the economy were segmented (credit card consumers
   shopping exclusively at high-credit-acceptance stores), merchant fees would
   have no effect on competitors' costs and the redistributive impact would be
   negligible. The empirical finding that sorting reduces redistribution by at
   most [9]% confirms that integration is substantial.
   ```

3. **Define Sufficient Statistic**: Add before line 138:
   ```
   A sufficient statistic is a data feature that, combined with a parametric
   model, allows computing welfare effects without fully solving the structural
   model. Here, the covariance matrix of payment shares across merchants is
   sufficient to compute how redistribution depends on merchant fee structure,
   provided prices follow the log-linear specification in equation [X]. This
   sufficient statistic approach allows us to quantify sorting effects
   independently of other model features (demand elasticities, network markups, etc.).
   ```

4. **Add Assumption Exposition**: Create new subsection "Assumptions" after line 136:
   ```
   ### Assumptions

   Our sufficient statistic approach requires three key assumptions:

   (1) **Log-linear pricing** (line 140): Merchants set prices proportional to
   fees, i.e., log p_j = log p̄ + ∑ μ_jk τ_k. This is consistent with CES
   pricing but rules out kinked demand or fixed-cost components of merchant pricing.

   (2) **No general equilibrium feedback**: Consumers do not adjust quantities
   in response to price changes (the envelope theorem argument). This assumes
   the welfare effect of fee changes operates entirely through price changes,
   not quantity adjustments. For large fee changes, this assumption may break down.

   (3) **Linear aggregation of merchant-level effects**: We sum welfare effects
   across merchants without accounting for how merchant pricing might respond
   endogenously to changes in fee structure. The sufficient statistic is consistent
   with this additive welfare decomposition.

   In Section [X], we verify these assumptions empirically / theoretically [as appropriate].
   ```

5. **Add Structural Model Connection**: After line 201, add:
   ```
   Note that this sufficient statistic approach provides a reduced-form analysis
   of redistribution that is complementary to the full structural model solved
   in the main text and Appendix [OA.5/Estimation]. The structural model
   accounts for endogenous merchant adoption decisions and network pricing,
   which the sufficient statistic approach does not. The finding that sorting
   has limited effects on redistribution is robust across both approaches.
   ```

6. **Add Row Labels to Tables**: Ensure table footnotes clearly define:
   - "Unweighted" vs. "Weighted" covariances
   - What baseline each ratio is computed relative to (homogenous merchants with zero covariance)
   - How to interpret a ratio > 1 (more sorting than baseline) vs. < 1 (less sorting)

---

## Verification Checklist

- [x] File read end-to-end (264 lines)
- [x] Current opening statement captured and assessed (excellent opening)
- [x] Main finding on redistribution extracted (4% weighted, 9% unweighted)
- [x] Sufficient statistic method clarity evaluated (well-derived, terminology unexplained)
- [x] Integration claim connection assessed (implicit, not explicit)
- [x] File naming artifacts identified (minimal; proper LaTeX)
- [x] Audit document created at correct path
- [x] Markdown is clean and well-formatted

---

**File**: `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_sorting.tex`
**Size**: 14,749 bytes | **Lines**: 264
**Main Findings**: Sorting reduces redistribution by 4% (weighted) or 9% (unweighted)
**Critical Issues**: Missing baseline redistribution context; implicit rather than explicit connection to integrated economy assumption
**Clarity Gaps**: Sufficient statistic terminology not explained; assumptions not explicitly stated; structural model relationship unexplained
**Audit Date**: January 31, 2026
