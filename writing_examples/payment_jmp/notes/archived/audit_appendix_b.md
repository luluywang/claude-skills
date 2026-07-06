# Audit: Appendix B - Model Details

## Current State

### Opening Statement

The appendix opens with comments about notation and income:
```
% Income notation: y denotes level income (baseline income).
% Income is lognormal: y ~ Lognormal, normalized so E[y]=1.
% Equivalently, log y ~ N(-σ_y²/2, σ_y²) where σ_y² is the variance of log income.

\section{Model Details}
```

**Finding**: Opening statement does NOT provide explicit purpose. The section immediately launches into derivations without explaining why each modeling choice was made or what aspect of payment networks this appendix addresses.

### Major Section Structure

| Section | Line | Title | Explicit Justification |
|---|---|---|---|
| 1 | 10 | Deriving Consumer Demand Function for Merchants | ✗ No |
| 2 | 51 | Microfounding Merchant Profits | ✗ No |
| 3 | 114 | Linearizing Merchant Profits | ✗ Weak - "I prove..." (justifies derivation not choice) |
| 4 | 209 | Comparison with Rochet and Tirole (2003) | ✓ Yes - "The key insight..." |
| 5 | 232 | Microfounding Adoption vs. Usage Decisions | ✓ Yes - "This section develops..." |
| 6 | 284 | Details on Conduct Assumption | ✓ Yes - "I model competition..." (explains choice) |
| 7 | 326 | Model Solution Algorithm | ✗ No |

**Summary**: 7 major sections
- **Sections WITH clear WHY justification**: 3/7 (43%)
- **Sections WITHOUT clear WHY justification**: 4/7 (57%)

### Alignment with Main Text

**Expected Alignment Issues**:
1. **CES Demand Derivation** (Section 1): This section provides full mathematical foundations for the consumer demand function used in main text. Appears well-aligned - derives equation referenced as fundamental to merchant adoption decisions.

2. **Merchant Profit Specification** (Sections 2-3): The quasi-profit linearization is mathematically sophisticated but the appendix does not explain WHY this approximation is used instead of exact profits. Lines 117-131 prove the approximation is valid, but never state "we use this because exact computation is intractable" or similar.

3. **Conduct Assumption** (Section 6): Lines 286-310 provide extensive justification for modeling competition in pecuniary gains (A_j) rather than rewards (f^j). This is well-justified but the main text may not fully reference this reasoning.

### Unclear or Overly Technical Passages

| Passage | Line Range | Issue | Severity |
|---|---|---|---|
| Quasi-profit proof | 133-176 | Multi-step approximation with envelope theorem; limited intuition provided | Medium |
| Demand shares normalization | 45-49 | Mathematical definition of $\mu^w$ with complex integral notation; purpose unclear | Medium |
| Conduct assumption trembles | 296-309 | Non-differentiability discussion highly technical; relationship to equilibrium selection unclear | High |
| Model solution fixed-point | 335-355 | Algorithm presented as pseudocode-style list; convergence conditions not specified | Medium |

**Finding**: Sections 6 (Conduct) and 7 (Algorithm) are the most technically dense with limited intuition. Section 6 explains the problem well but the solution (trembles with Gauss-Hermite quadrature) requires significant technical background.

### Duplicates with Main Text

**Potential duplicates detected**:
- Lines 10-49: Derivation of CES demand and merchant pricing - likely foundational derivation that main text references but doesn't repeat (not a true duplicate, but could be a boundary question)
- Lines 51-89: Merchant profit microfounding - similar to core model in main text section on equilibrium but with more detail
- Lines 209-229: Rochet-Tirole comparison - appears novel to appendix (comparing existing literature model to current setup)

**Finding**: Minimal direct duplication. The appendix provides technical depth that the main text abstracts. However, some foundational equations (e.g., CES demand, merchant pricing) are presented at full length without clear marking of where main text summarizes these concepts.

### Orphaned or Unclear Subsections

| Subsection | Status |
|---|---|
| Deriving CES Demand | Connected - foundational for merchant adoption |
| Merchant Profits | Connected - supports equilibrium analysis |
| Quasi-profit Approximation | Connected - enables tractable computation |
| Rochet-Tirole Comparison | ORPHANED - standalone comparison without clear connection to main analysis |
| Adoption vs. Usage Decisions | Connected - explains transaction-level vs. adoption-level behavior |
| Conduct Assumption | Connected - critical for equilibrium selection |
| Model Solution Algorithm | Connected - explains computational procedure |

**Finding**: Rochet-Tirole comparison (lines 209-229) appears somewhat disconnected. It makes a theoretical point about multi-homing and fee sensitivity but doesn't clearly state how this informs the empirical application or main text conclusions.

### File Naming Artifacts

| Artifact Type | Count | Locations |
|---|---|---|
| `.tex` references | 1 | Line 1 (document class) |
| `.csv` references | 0 | None |
| Variable naming (variant = ) | 0 | None |
| Uncommented code | 0 | None |
| Figure placeholders | 2 | Lines 188, 199 (`[Figure placeholder...]`) |

**Finding**: Two figure placeholders present - these indicate images are missing or not yet incorporated:
- Line 188: `linear_approx_example.pdf`
- Line 199: `linear_approx_envelope_example.pdf`

These figures compare quasi-profit approximations to exact profits, which is central to Section 3 justification.

---

## Issues Found

1. **Missing Opening Paragraph**: No introductory statement explaining the appendix purpose: "This appendix provides the mathematical foundations for the three-player equilibrium model of payment network competition. It derives the consumer demand and merchant profit functions, proves key approximations used in computation, and explains the conduct assumption and solution algorithm."

2. **Weak Justification for Modeling Choices**: Many sections present derivations (HOW) but not rationales (WHY). Examples:
   - Why CES preferences specifically? (functional form choice not justified)
   - Why linearize profits? (mathematical tractability mentioned but not the key bottleneck)
   - Why model $\gamma$ heterogeneity as continuous? (assumed, not justified)

3. **Missing Figure Comparisons**: Two critical figures (lines 188, 199) showing quasi-profit approximation validity are placeholders. Without these, Section 3's claim that "The fit is very close for all values of the merchant type γ" (line 182) is unverifiable in the appendix.

4. **Orphaned Rochet-Tirole Comparison**: Section 4 (lines 209-229) compares the model to RT(2003) but doesn't clearly connect this to the main analysis. Is it showing the model is more general? That it yields similar insights? The connection is unclear.

5. **Conduct Assumption Complexity**: Section 6 (lines 284-324) is highly technical. The intuition that "networks stand to lose the same profits from raising or lowering fees" (line 297) is buried in a long discussion of non-differentiability and trembles. This deserves clearer framing.

6. **Algorithm Description Lacks Convergence Details**: Section 7 (lines 326-355) presents the model solution as a numbered list but doesn't specify:
   - Convergence tolerances
   - Maximum iterations
   - How equilibrium existence/uniqueness is verified
   - Computational complexity

---

## Recommendations

1. **Add Opening Paragraph**: Insert before line 8 (before section header):
   ```
   This appendix develops the mathematical foundations for the model of payment
   network competition. It derives the consumer demand system (Section 1),
   microfounds merchant profits (Section 2), proves a linear approximation
   (Section 3), compares to prior work (Section 4), explains consumer adoption
   versus usage decisions (Section 5), justifies the conduct assumption (Section 6),
   and describes the solution algorithm (Section 7).
   ```

2. **Strengthen Modeling Justifications**: For each major section, add a paragraph explaining the economic motivation, not just the mathematical setup. Example:
   - Before CES section: "We adopt CES preferences because they generate demand with constant elasticity of substitution, tractable aggregation, and a parsimonious price index..."
   - Before Profit Linearization: "Merchants' optimal acceptance decisions depend on comparing profits across payment bundles. Computing exact profits requires solving the full pricing equilibrium for each bundle; we prove a linear approximation provides sufficient accuracy..."

3. **Provide Figure Files or Remove**: Either include the missing quasi-profit comparison figures or remove the claims they support. Currently, lines 181-182 state "The fit is very close" without visual proof.

4. **Clarify Rochet-Tirole Connection**: Add a closing sentence to Section 4: "In contrast to Rochet-Tirole, our model [specify: includes three networks? allows heterogeneous consumer preferences? admits multiple equilibria?], which provides empirical implications for [specify outcome]."

5. **Expand Algorithm Description**: Add subsection after line 355 with:
   - Pseudocode or flowchart of the fixed-point iteration
   - Stated convergence criterion (e.g., $\max_j |A_j^{t+1} - A_j^t| < 10^{-6}$)
   - Number of Gauss-Hermite nodes and justification
   - Statement about equilibrium uniqueness (is the equilibrium unique?)

6. **Separate Technical Detail**: Consider moving the full Non-differentiability discussion (lines 294-309) to a subsection titled "Equilibrium Selection via Trembles" with clearer framing of the problem and solution.

---

## Verification Checklist

- [x] File read end-to-end (357 lines)
- [x] Major sections documented (7 identified)
- [x] Justification assessment completed (3/7 sections have clear WHY statements)
- [x] Orphaned content identified (Rochet-Tirole comparison somewhat disconnected)
- [x] Unclear passages flagged (conduct assumption, algorithm sections marked as high/medium complexity)
- [x] File naming artifacts searched (minimal; 2 missing figures noted)
- [x] Audit document created at correct path
- [x] Markdown is clean and well-formatted

---

**File**: `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_model.tex`
**Size**: 25,783 bytes | **Lines**: 357
**Missing Figures**: 2 (linear_approx_example.pdf, linear_approx_envelope_example.pdf)
**Audit Date**: January 31, 2026
