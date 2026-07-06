# Appendix Audit Summary - Payment Network Competition Paper

**Date**: January 31, 2026
**Project**: Econ RA Appendix Revision (Tasks 2-9)
**Scope**: 8 Appendices (A, B, C, OA.1-OA.5)

---

## Executive Summary

All 8 appendices have been audited and documented. Key findings:

- **2 Critical Issues**: Commented-out opening statement (OA.1), Incomplete TODO (OA.5)
- **3 Major Weaknesses**: Missing LaTeX figures, weak opening statements, disconnected content organization
- **Multiple Recommendations**: File cross-references, improved exposition, structured robustness discussion
- **Overall Assessment**: Appendices are substantially complete but need refinement in clarity and organization

---

## Audit Documents Created

### Location
All audit files are in: `/Users/luluwang/Dropbox/Overleaf/Payment Network Competition/draft_202601/notes/`

### Files

| File | Appendix | Size | Status | Key Issue |
|---|---|---|---|---|
| `audit_appendix_a.md` | A (Data Details) | 22KB | ✓ Complete | Missing overarching purpose statement |
| `audit_appendix_b.md` | B (Model Details) | 26KB | ✓ Complete | Weak justifications for modeling choices; 2 missing figures |
| `audit_appendix_c.md` | C (Estimation) | 19KB | ✓ Complete | No explicit identification argument; high-complexity passages |
| `audit_oa1.md` | OA.1 (Reduced Form) | 37KB | ✓ Complete | **CRITICAL: Opening statement commented out; misaligned content** |
| `audit_oa2.md` | OA.2 (Price Coherence) | 15KB | ✓ Complete | Limited empirical validation; theoretical-heavy |
| `audit_oa3.md` | OA.3 (Sorting) | 15KB | ✓ Complete | Missing baseline redistribution context; implicit connections |
| `audit_oa4.md` | OA.4 (Extension Model) | 8KB | ✓ Complete | Missing standard errors; no sensitivity analysis |
| `audit_oa5.md` | OA.5 (Additional Tables) | 49KB | ✓ Complete | **CRITICAL: Incomplete TODO at line 722; 2 missing figures** |

---

## Critical Issues (Must Fix)

### Issue 1: OA.1 Opening Statement (Lines 9-10)

**Problem**: The opening purpose statement is commented out.
```latex
% I analyze the effects of Discover's quarterly rewards program and find evidence
% for two key assumptions of the model...
```

**Impact**: Readers see no section-level opening; must infer purpose from subsection headers.

**Fix**: Uncomment and move to section opening; or recreate as rendered opening paragraph.

---

### Issue 2: OA.5 Incomplete Intermediate Fee Cap (Line 722)

**Problem**: Subsection header exists with TODO comment instead of results.
```latex
% TODO: Add results table and discussion. Results are intermediate to the full cap at cost of cash.
```

**Impact**: Major counterfactual scenario (intermediate fee cap at 95 bps) is documented but not analyzed. This is incomplete in a comprehensive appendix.

**Fix**: Implement the counterfactual analysis and provide results table + discussion.

---

### Issue 3: Missing Figure Files

**Location**: Lines 195, 322 (OA.5)

**Problem**: Two figures are referenced as placeholders:
- `mri_credit_by_checking.pdf` (line 195)
- `mri_rewards_by_checking.pdf` (line 322)

**Impact**: Robustness check results for big vs. small bank comparison (Durbin robustness) lack visual evidence.

**Fix**: Either provide figures or supplement with text-based evidence of results.

---

## Major Weaknesses (Should Fix)

### Weakness 1: Appendix B - Missing Figure References (Lines 188, 199)

**Problem**: Two quasi-profit comparison figures referenced as placeholders.

**Evidence Cited**: "The fit is very close for all values of the merchant type γ" (line 182)

**Impact**: Critical approximation claim lacks visual verification.

**Recommendation**: Uncomment or provide the linear_approx_example.pdf figures.

---

### Weakness 2: Appendix C - No Identification Argument

**Problem**: Estimation appendix specifies 6 moment conditions but never states which parameter each identifies.

**Impact**: Readers unfamiliar with GMM cannot understand identification structure.

**Recommendation**: Add "Identification Strategy" table mapping moments to parameters.

---

### Weakness 3: Appendices A & B - Weak Opening Statements

| Appendix | Current Opening | Assessment |
|---|---|---|
| A | "Table \ref{tab:data_coverage} summarizes..." | Missing purpose statement |
| B | Comments about notation, then section header | No purpose statement |

**Impact**: Readers don't know what data/model concerns each appendix addresses.

**Recommendation**: Add 2-3 sentence opening explaining purpose and scope.

---

### Weakness 4: OA.1 - Misaligned Content

**Problem**: Lines 235-309 (multi-homing behavior) belong in OA.3 (Merchant Sorting), not OA.1.

**Impact**: Readers seeking merchant multi-homing evidence may not find it where theory suggests.

**Recommendation**: Reorganize subsections or add cross-references; consider moving multi-homing section to OA.3.

---

### Weakness 5: OA.5 - Disconnected Organization

**Problem**: 725-line appendix jumps between:
- Descriptive tables (lines 12-98)
- Payment probability definitions (lines 133-155)
- Descriptive figures (lines 159-271)
- [Large gap with no content]
- Estimation variants (lines 525-615)
- Robustness checks (lines 639-722)

**Impact**: No clear narrative; readers cannot navigate coherently.

**Recommendation**: Add navigation aid; consolidate related sections; create visual index.

---

## File Naming Artifacts

### Total Count: 52 References

**By Type**:
- Table file references (`\input{.../tables/...tex}`): 35
- Figure file references (`\includegraphics`): 11
- Variant naming references (`param_tab_*_{variant}.tex`): 6

**By Location**:
- Appendix A: 2 (proper LaTeX usage)
- Appendix B: 1 (proper LaTeX usage)
- Appendix C: 10 (proper LaTeX usage)
- OA.1: 9 (proper LaTeX usage)
- OA.2: 1 (proper LaTeX usage)
- OA.3: 11 (proper LaTeX usage)
- OA.4: 0
- OA.5: 35 (proper LaTeX usage, but 2 placeholders)

**Assessment**: All references use proper LaTeX syntax (`\input{}`, `\includegraphics`). No problematic file naming artifacts (no `.csv` references, no code-like `variant = ` statements, no data file paths exposed).

---

## Content Organization Issues

### OA.1 Relevance Tagging

| Subsection | Tag | Issue |
|---|---|---|
| Discover Rewards | CORE | ✓ Central to model assumptions |
| Multi-homing Details | SUPPORTING | ✗ Belongs in OA.3 |
| Consumer Substitution Survey | CORE | ✓ Identifying moment |
| Merchant Comments | TANGENTIAL | ⚠ Anecdotal evidence |
| Consumer Card Preferences | TANGENTIAL | ⚠ Interesting but peripheral |

**Recommendation**: Reorganize subsections by relevance; move multi-homing to OA.3.

---

## Robustness Check Summary

### OA.4 Extension Model

**Status**: Robustness results are qualitatively robust but quantitatively different:
- Cap Fees: 30B (baseline) vs. 28B (extension) = 7% difference
- Monopoly: +16B (baseline) vs. +14B (extension) = 13% difference

**Finding**: Counterfactual ranges are reported but without confidence intervals.

**Recommendation**: Add standard errors and significance tests.

---

### OA.5 Halved Reward Sensitivity

**Status**: Critical finding: monopoly counterfactual sign flips.
- Baseline: +$16B welfare gain from monopoly
- Robustness (halved sensitivity): -$19B welfare loss from monopoly

**Finding**: This represents a fundamental robustness concern for policy relying on consumer reward sensitivity.

**Recommendation**: Add sensitivity analysis showing threshold where sign flips occur.

---

### OA.5 Intermediate Fee Cap

**Status**: INCOMPLETE (TODO at line 722)

**Issue**: Counterfactual scenario (95 bps cap) is motivated but results are missing.

---

## Summary by Appendix

### Appendix A: Data Details ✓
- **Quality**: Good
- **Main Issue**: Missing overarching purpose statement
- **Subsections**: 11 (all with explicit purposes)
- **Artifacts**: 2 (proper usage)
- **Recommendation**: Add 2-3 sentence opening explaining data scope and coverage

### Appendix B: Model Details ⚠
- **Quality**: Acceptable but technical
- **Main Issues**: Weak WHY justifications (4/7 sections lack them); 2 missing figures
- **Subsections**: 7 major sections
- **Artifacts**: 1 (proper usage)
- **Recommendations**: Strengthen justifications; provide quasi-profit comparison figures

### Appendix C: Estimation Details ⚠
- **Quality**: Technically sound but exposition weak
- **Main Issues**: No identification argument; high-complexity passages (3 flagged)
- **Subsections**: 6 moment types
- **Artifacts**: 10 (proper usage)
- **Recommendations**: Add identification table; improve exposition of diversion adjustment

### OA.1: Reduced Form Evidence 🔴
- **Quality**: Good content, poor organization
- **Main Issues**: CRITICAL - opening statement commented out; misaligned content; orphaned subsections
- **Findings**: Mixed relevance (2 CORE, 5 SUPPORTING, 2 TANGENTIAL)
- **Artifacts**: 9 (proper usage)
- **Recommendations**: Uncomment opening; reorganize by relevance; move multi-homing to OA.3

### OA.2: Price Coherence ✓
- **Quality**: Good exposition, theory-heavy
- **Main Issues**: Limited empirical validation; theoretical menu cost explanation not quantitatively anchored
- **Findings**: Surcharging rare despite legality explained by menu costs
- **Artifacts**: 1 (proper usage)
- **Recommendations**: Add empirical menu cost estimates; strengthen alternative explanation discussion

### OA.3: Merchant Sorting ✓
- **Quality**: Excellent opening and sufficient statistic method
- **Main Issues**: Missing baseline redistribution context; implicit rather than explicit integration claim
- **Finding**: Sorting reduces redistribution by only 4-9%
- **Artifacts**: 11 (proper usage)
- **Recommendations**: Add baseline welfare levels; explicitly state "validates integrated economy assumption"

### OA.4: Extension Model ✓
- **Quality**: Clear positioning, transparent robustness
- **Main Issues**: Missing standard errors; no sensitivity to κ parameter; unexplained parameter changes
- **Finding**: Counterfactual results robust (7-14% variation)
- **Artifacts**: 0
- **Recommendations**: Add uncertainty; model selection guidance; sensitivity analysis

### OA.5: Additional Tables & Robustness 🔴
- **Quality**: Comprehensive coverage, poor organization
- **Main Issues**: CRITICAL - incomplete TODO (intermediate fee cap); 2 missing figures; weak opening; disconnected subsections
- **Findings**: Monopoly counterfactual sign flips under halved sensitivity (major robustness concern)
- **Artifacts**: 35 (proper usage, but 2 placeholders)
- **Recommendations**: Complete intermediate cap analysis; provide missing figures; restructure with navigation aids

---

## Overall Assessment

| Category | Status | Notes |
|---|---|---|
| **Completeness** | 85% | 2 incomplete sections (OA.1 commented opening, OA.5 TODO) |
| **Clarity** | 70% | Multiple weak openings; some high-complexity exposition |
| **Organization** | 65% | OA.1 and OA.5 have weak structure; misaligned content |
| **Correctness** | 95% | No major substantive errors detected |
| **File Integrity** | 95% | 52 file references all proper; 3 missing files |

**Recommendation**: Ready for review with must-fix items addressed.

---

## Next Steps

### Priority 1 (Must Fix)
1. Uncomment OA.1 opening statement (lines 9-10) → audit_oa1.md
2. Complete OA.5 intermediate fee cap analysis → audit_oa5.md
3. Locate or recreate 3 missing figures → audit_appendix_b.md, audit_oa5.md

### Priority 2 (Should Fix)
4. Add opening statements to Appendices A & B
5. Reorganize OA.1 by relevance; move multi-homing to OA.3
6. Add identification table to Appendix C
7. Strengthen model justifications in Appendix B

### Priority 3 (Nice to Have)
8. Add standard errors and sensitivity analyses to OA.4
9. Improve navigation structure in OA.5
10. Add quantitative robustness analysis to OA.5 halved sensitivity section

---

## Document Cross-Reference

- **Appendix A full details**: `audit_appendix_a.md`
- **Appendix B full details**: `audit_appendix_b.md`
- **Appendix C full details**: `audit_appendix_c.md`
- **OA.1 full details**: `audit_oa1.md`
- **OA.2 full details**: `audit_oa2.md`
- **OA.3 full details**: `audit_oa3.md`
- **OA.4 full details**: `audit_oa4.md`
- **OA.5 full details**: `audit_oa5.md`

---

**Audit Completed**: January 31, 2026
**Total Files Reviewed**: 8 appendices (175KB of LaTeX)
**Audit Documents Created**: 9 (this summary + 8 individual audits)
**Total Recommendations**: 40+ specific actionable items
