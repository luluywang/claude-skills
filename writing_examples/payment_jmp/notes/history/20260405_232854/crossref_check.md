# Cross-Reference Consistency Check

## [response_round2.tex]

### Summary
- **Total labels defined in this file:** 4 (fig:kilts-dd-ols, fig:kilts-dd-24, fig:kilts-dd-non24, fig:agg_debit_credit_volumes)
- **Total \ref{} calls in this file:** 55 unique targets (all resolved against labels in other paper files)
- **Issues found:** 26 (Critical: 0, High: 1, Medium: 25)

> Note: This is a response letter, not compiled standalone. All \ref{} targets resolve against labels defined in the main paper files (model.tex, counterfactuals.tex, appendix_*.tex, etc.). Every target label was verified to exist in the wider codebase — no broken references found.

---

### Critical Issues

None.

---

### High Priority Issues

#### - [ ] response_round2.tex:2I — Online Appendix vs. Appendix naming inconsistency for oa- sections

**Severity:** High
**Comment:** Sections with `subsec:oa-*` or `subsubsec:oa-*` labels are part of the Online Appendix. The letter refers to the same sections inconsistently — sometimes "Online Appendix~\ref{...}" and sometimes bare "Appendix~\ref{...}". This creates contradictory navigation cues for the editor and referees reading the letter alongside the paper.

**Instances using bare "Appendix" for oa- labels (should be "Online Appendix"):**
- Line 428: `Appendix~\ref{subsec:oa-extension}`
- Line 846: `Appendix~\ref{subsec:oa-cost-of-cash-cap}`
- Line 933: `Appendix~\ref{subsec:oa-discover-rewards}`
- Line 996: `Appendix~\ref{subsec:oa-cost-of-cash-cap}`
- Line 1128: `Appendix~\ref{subsec:oa-cost-of-cash-cap}`
- Line 1403: `Appendix~\ref{subsubsec:oa-durbin-rewards}`
- Line 1412: `Appendix~\ref{subsec:oa-credit-constrained}`
- Line 1469: `Appendix~\ref{subsec:oa-optimal-prices}`
- Line 1486: `Appendix~\ref{subsec:oa-optimal-prices}`

**Dominant convention:** "Online Appendix~\ref{}" used 13 times; bare "Appendix~\ref{}" for oa- labels used 9 times.

**Proposed fix:** Replace all bare `Appendix~\ref{subsec:oa-...}` and `Appendix~\ref{subsubsec:oa-...}` with `Online Appendix~\ref{...}` to match the dominant convention and paper structure.

---

### Medium Priority Issues

#### - [ ] response_round2.tex — Missing tilde (non-breaking space) before \ref — Section refs

**Severity:** Medium
**Comment:** The dominant convention in the paper (24 uses) is `Section~\ref{}`. There are 17 instances of `Section \ref{}` (breakable space). While not causing wrong output, line breaks between "Section" and the number are typographically undesirable.

**Lines with `Section \ref` (no tilde) in author-written replies:**
- 124, 138, 141, 157, 164, 171, 269, 276, 297, 310, 313, 321, 362, 377, 893, 1013, 1524

**Proposed fix:** Replace `Section \ref{` with `Section~\ref{` throughout the author replies. (Referee quotes inside `\begin{refcommentnoclear}...\end{refcommentnoclear}` should not be changed.)

---

#### - [ ] response_round2.tex — Missing tilde before \ref — Appendix and Online Appendix refs

**Severity:** Medium
**Comment:** Dominant convention is `Appendix~\ref{}` (24 uses with tilde). There are 9 instances without the tilde.

**Lines with missing tilde:**
- 138: `Online Appendix \ref{par:oa-durbin-rewards-robustness}`
- 227: `Online Appendix \ref{subsec:oa-extension}`
- 235: `Online Appendix \ref{subsec:oa-credit-debit-segmentation}`
- 236: `Online Appendix \ref{subsubsec:oa-credit-debit-evidence}`
- 237: `Appendix \ref{subsec:oa-extension}`
- 239: `Online Appendix \ref{subsec:oa-usage-microfoundation}`
- 287: `Appendix \ref{subsec:oa-cost-of-cash-cap}`
- 624: `Online Appendix \ref{subsec:oa-discover-rewards}`
- 669: `Appendix \ref{subsec:oa-yelp-card-acceptance}`

**Proposed fix:** Add `~` before `\ref` in each case.

---

#### - [ ] response_round2.tex — Missing tilde before \ref — Figure and Equation refs

**Severity:** Medium
**Comment:** Dominant conventions are `Figure~\ref{}` (5 uses) and `Equation~\ref{}` (2 uses). Deviations:

- Line 1011: `Appendix Figure \ref{fig:aus-interchange-event-study}` — missing tilde
- Line 1349: `Figure \ref{fig:quasiprofit-approx-envelope-example}` — missing tilde
- Line 1522: `Appendix Figure \ref{fig:aus-interchange-event-study}` — missing tilde
- Line 272: `Equation \ref{eq:consumer-demand-merchant}` — missing tilde

**Proposed fix:** Add `~` before `\ref` in each case.

---

#### - [ ] response_round2.tex:522 — Missing tilde before \ref in plural "Tables \ref"

**Severity:** Medium

**Current:**
```
Tables \ref{tab:cf-baseline} and \ref{tab:welfare-decomp} show the results.
```

**Proposed fix:**
```
Tables~\ref{tab:cf-baseline} and \ref{tab:welfare-decomp} show the results.
```

---

#### - [ ] response_round2.tex:597 — Missing tilde in footnote "Appendix Table \ref"

**Severity:** Medium

**Current:**
```
As shown in Appendix Table \ref{tab:nielsen-compare}
```

**Proposed fix:**
```
As shown in Appendix Table~\ref{tab:nielsen-compare}
```

---

#### - [ ] response_round2.tex:948 — Missing tilde in \tablenote "Table \ref"

**Severity:** Medium

**Current:**
```
Same specification as Table \ref{tab:discover-triple-diff}.
```

**Proposed fix:**
```
Same specification as Table~\ref{tab:discover-triple-diff}.
```

---

#### - [ ] response_round2.tex:566 — Missing tilde in "Figures \ref"

**Severity:** Medium

**Current:**
```
Figures \ref{fig:kilts-dd-24} and \ref{fig:kilts-dd-non24} run separate OLS...
```

**Proposed fix:**
```
Figures~\ref{fig:kilts-dd-24} and \ref{fig:kilts-dd-non24} run separate OLS...
```

---

### Formatting Convention Report

| Element | Dominant Convention | Count | Deviations | Deviation Lines |
|---------|-------------------|-------|------------|-----------------|
| Section refs | `Section~\ref{}` | 24 | 17 | 124, 138, 141, 157, 164, 171, 269, 276, 297, 310, 313, 321, 362, 377, 893, 1013, 1524 |
| Appendix refs (oa-) | `Online Appendix~\ref{}` | 13 | 9 | 138, 227, 235, 236, 237, 239, 287, 624, 669 |
| Appendix refs (non-oa) | `Appendix~\ref{}` | 24 | 0 | — |
| Table refs | `Table~\ref{}` | 9 | 3 | 522, 597, 948 |
| Figure refs | `Figure~\ref{}` | 5 | 3 | 566, 1011, 1349, 1522 |
| Equation refs | `Equation~\ref{}` | 2 | 1 | 272 |

---

### Notes

- Hardcoded numbers in referee quotes (e.g., "Section IV.F.2", "Appendix F.6", "footnote 12", "Figure 4a", "Figure 5", "Figure 6", "Table 1", "Equation 2", "Appendix A.3.1") are inside `\begin{refcommentnoclear}` blocks quoting the referees' original letters verbatim. These are not actionable.
- The inline table at lines 943–949 (Discover-only holders) has no `\label{}`. This is intentional since the table appears only in the response letter and is not cross-referenced from the main paper. No action needed.
- All 55 unique `\ref{}` targets resolve against labels defined in the main paper files. Zero broken references.
