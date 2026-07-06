# Audit: OA.1 - Additional Reduced Form Evidence

## Current State

### Current Opening Statement

```
\section{Additional Reduced Form}\label{sec:oa-reduced-form}

\subsection{Details on Discover's Reward Programs}
\label{subsec:discover-rewards}

% I analyze the effects of Discover's quarterly rewards program and find evidence
% for two key assumptions of the model. First, consumers are unwilling to
% substitute between credit and debit at the point of sale. Second, consumers do
% not reallocate their spending across stores to earn rewards. The first fact
% supports the mechanical usage model used in the text that assumes that for a
% given transaction, consumers prefer either credit or debit and do not substitute
% between the two. The second fact supports the model's assumption that consumers
% treat rewards merely as an increase in income and not a price reduction that
% justifies shifting spending across stores.

Discover's \textit{5\% Cashback Bonus} program offers a 5\% discount on
purchases at select stores for customers who use Discover credit cards.
```

**Opening Statement Assessment**: The opening is COMMENTED OUT and thus does NOT appear in the rendered document. The rendered document begins immediately with subsection headers without stating overall purpose.

**Critical Issue**: The commented-out text (lines 9-10) contains a perfect statement of the appendix's core purpose: "I analyze the effects of Discover's quarterly rewards program and find evidence for two key assumptions of the model." This should be uncommented and used as the section-level opening statement.

### Major Findings/Subsections

| Subsection | Lines | Topic | Finding Type |
|---|---|---|---|
| Discover Rewards > Program Details | 11-71 | 5% cashback quarterly rotation | Supporting |
| Discover Rewards > Graphical Evidence | 84-115 | Time series of trips and payment mix | Supporting |
| Discover Rewards > Regression Evidence | 117-125 | Fixed effects regression on trip share vs payment mix | Core |
| Event Study Methodology | 127-156 | Poisson triple-difference for merchant acceptance effects | Methodological |
| Yelp Evidence | 154-173 | Hierarchical card acceptance patterns from reviews | Supporting |
| Durbin Robustness | 175-233 | Multiple robustness checks on debit reduction | Supporting |
| Multi-homing Details | 235-309 | Consumer and merchant multi-homing behavior | Supporting |
| Consumer Substitution Survey | 311-368 | Second-choice survey findings on payment substitution | Core |
| Merchant/Network Comments | 370-391 | Antitrust case evidence on credit-debit distinctness | Supporting |
| Consumer Survey on Card Preferences | 393-427 | SCPC survey on why consumers choose payment methods | Tangential |

### Relevance Tagging

| Subsection | Tag | Justification |
|---|---|---|
| Discover Rewards | **CORE** | Directly addresses debit-credit substitution assumption at point of sale; central to model validity |
| Event Study Methodology | **SUPPORTING** | Provides methodological details for merchant acceptance effects; helps understand how card benefits are estimated |
| Yelp Evidence | **SUPPORTING** | Provides evidence that merchant acceptance is hierarchical (not specialized); supports bundled acceptance assumption |
| Durbin Robustness | **SUPPORTING** | Robustness checks strengthen the Durbin event study identification; not core but strengthens inference |
| Multi-homing Details | **SUPPORTING** | Documents actual multi-homing behavior and shows it responds to product differentiation not acceptance; supports model assumptions |
| Consumer Substitution Survey | **CORE** | Directly measures substitution patterns between payment types; critical identifying moment for model |
| Merchant/Network Comments | **TANGENTIAL** | Provides real-world support for credit-debit distinctness but relies on antitrust litigation quotes; anecdotal |
| Consumer Survey Card Preferences | **TANGENTIAL** | Shows consumers dislike credit cards for non-price reasons; interesting but not central to debit-credit substitution claim |

### Content That Might Belong in OA.3

OA.3 (Merchant Sorting) focuses on how consumer sorting across stores affects redistribution. This appendix contains:

**Lines 17-102 (Measuring Payment Shares + Sufficient Statistic)**: These subsections in OA.3 directly discuss merchant payment shares and covariances.

**Potential movement**: The "Multi-homing Details" subsection (lines 235-309 in OA.1) discusses merchant multi-homing and provides evidence that merchants accept multiple cards. Lines 247-309 specifically show acceptance is hierarchical (all accept debit before credit, all accept Visa before AmEx, etc.). This BELONGS in OA.3 since OA.3 directly uses merchant multi-homing patterns to measure sorting effects.

**Recommendation**: Move subsection "Additional Details on Consumer and Merchant Multi-homing Behavior" (lines 235-309) to OA.3, or at least cross-reference it clearly.

### Opening Statement Issue (CRITICAL)

**Current state**: The section opens with no purpose statement. Subsection headers begin immediately.

**What should appear**: Uncomment and elevate the commented-out purpose statement (lines 9-10) to be the section-level opening:

```
This appendix provides reduced-form evidence for two key model assumptions.
First, using Discover's quarterly rewards program, we document that consumers
have rigid transaction-specific preferences for credit vs. debit and do not
substitute between them at the point of sale, even when incentivized. Second,
we show that consumers do not reallocate spending across stores in response to
rewards, treating them as lump-sum income gains rather than price discounts.
We also provide supporting evidence on merchant acceptance patterns and
consumer substitution behavior from multiple data sources.
```

### File Naming Artifacts

| Artifact Type | Count | Locations |
|---|---|---|
| `.tex` references | 9 | Lines 1, 43, 104, 173, 215, 228, 229, 249, 362 (tables/figures via \input or \includegraphics) |
| `.csv` references | 0 | None |
| `variant = ` references | 0 | None |
| `.pdf` figure references | 8 | Multiple lines with graph includes |

**Finding**: Minimal problematic artifacts. All references are proper LaTeX syntax.

---

## Issues Found

1. **Critical: Opening Statement is Commented Out** (Lines 9-10): The appendix's purpose statement is commented-out and thus invisible to readers. The section opens with subsection headers providing no overview of what evidence this appendix presents.

2. **Unclear Subsection Organization**: The appendix jumps between:
   - Discover rewards evidence (assumption test)
   - Event study methodology (methodological detail)
   - Yelp evidence (different data source, different question)
   - Durbin robustness (more evidence for earlier assumption)
   - Multi-homing details (mixed: some belongs in OA.3)

   No clear narrative arc connecting these pieces.

3. **Misaligned Content**: Lines 235-309 on merchant and consumer multi-homing behavior directly support OA.3's merchant sorting analysis, but appear here in OA.1. This creates potential for readers to miss relevant evidence or fail to understand where to find specific results.

4. **Methodological Detail Without Context** (Lines 127-156): The event study methodology section explains Poisson triple-difference specification, but its purpose is unclear. Is this defending the methodology? Explaining implementation? The connection to the Discover evidence above and merchant multi-homing below is tenuous.

5. **Anecdotal Evidence Without Systematic Treatment** (Lines 370-391): The antitrust litigation quotes provide real-world support for credit-debit distinctness, but:
   - They are presented as extended quotes rather than synthesized
   - No systematic count of how many merchants make these arguments
   - No statistical comparison across payment types
   - This feels more like supporting material than core evidence

6. **Missing Transition to OA.5**: The appendix concludes with consumer survey data (lines 393-427) but doesn't clarify whether this is reduced-form evidence or estimated preference parameters. The relationship to OA.5's estimation appendix is unclear.

---

## Recommendations

1. **Uncomment and Move Purpose Statement** (Lines 9-10):
   - Delete the commented-out lines 9-10 in current location
   - Create a new opening paragraph immediately after `\section{Additional Reduced Form}`:
   ```
   This appendix provides reduced-form evidence on two key model assumptions
   about consumer payment behavior. First, we exploit Discover's quarterly
   rewards program to test whether consumers substitute between debit and credit
   cards at the point of sale. Second, we examine whether consumers reallocate
   shopping across stores in response to rewards. We find limited evidence of
   either substitution, supporting our model's assumption of rigid transaction-
   specific preferences and treating rewards as income effects. We also provide
   supporting evidence on merchant acceptance patterns, consumer substitution
   behavior, and industry perspectives on credit-debit complementarity.
   ```

2. **Reorganize Subsections for Coherence**:
   - Move "Yelp Evidence on Hierarchical Card Acceptance" earlier (right after Discover evidence)
   - Then move "Multi-homing Behavior" as separate section supporting acceptance patterns
   - Group all robustness checks together (Durbin robustness, Yelp hierarchical patterns)
   - Then consumer survey evidence
   - Final section: Antitrust and industry quotes as supporting material

3. **Add Cross-References**:
   - In the "Multi-homing Behavior" subsection, add: "This pattern of hierarchical acceptance is analyzed in detail in Appendix OA.3 (Merchant Sorting), where we use merchant-level payment share covariances to quantify redistribution effects."
   - In the event study methodology section, add: "This specification is applied to merchant card acceptance events discussed in the main text Section [X]."

4. **Clarify Purpose of Event Study Methodology**: Either:
   - Relocate this to the estimation appendix (OA.5) if it's pure methodology
   - Add context explaining why this specific methodology is critical for identifying merchant benefits
   - Explain how Poisson results differ from OLS and why this matters

5. **Systematize the Antitrust Evidence** (Lines 370-391):
   - Count how many merchants mention each argument
   - Create a table showing distribution of arguments (credit provides line of credit, larger purchase size, customer expectations, etc.)
   - Compare argument frequency across merchant types
   - Cite specific trial transcript pages systematically

6. **Add Concluding Paragraph**: After consumer survey evidence, add:
   ```
   These reduced-form results show that [summarize key findings: no debit-credit
   substitution, no store-switching response, hierarchical merchant acceptance,
   and strong consumer preferences for credit despite non-pecuniary concerns].
   The parameter estimates in Appendix [OA.5/Estimation] are identified using
   these moment conditions and are broadly consistent with this reduced-form
   evidence.
   ```

---

## Verification Checklist

- [x] File read end-to-end (430 lines)
- [x] Current opening statement captured (found commented out; critical issue)
- [x] All major subsections documented (10 subsections identified and tagged)
- [x] Findings tagged for relevance (CORE, SUPPORTING, TANGENTIAL)
- [x] Content inventory for OA.3 migration identified (lines 235-309 multi-homing)
- [x] File naming artifacts identified (minimal; proper LaTeX syntax)
- [x] Audit document created at correct path
- [x] Markdown is clean and well-formatted

---

**File**: `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/appendix_reduced.tex`
**Size**: 37,013 bytes | **Lines**: 430
**Critical Issues**: 1 (commented-out opening statement makes purpose invisible)
**Structural Issues**: Content alignment (multi-homing in wrong appendix), unclear narrative arc
**Relevance Breakdown**: 2 CORE, 5 SUPPORTING, 2 TANGENTIAL subsections
**Audit Date**: January 31, 2026
