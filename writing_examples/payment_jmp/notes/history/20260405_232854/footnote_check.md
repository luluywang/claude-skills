# Footnote Consistency Check

## [response_round2.tex]

### Summary
- **Total footnotes:** 1 (in response_round2.tex)
- **Issues found:** 1 (Critical: 0, High: 1, Medium: 0, Low: 0)

### Footnote Inventory

| # | File | Line | Length (lines) | First 80 chars | Contains \ref | Contains \label |
|---|------|------|----------------|-----------------|---------------|-----------------|
| 1 | response_round2.tex | 597 | ~4 | Consumers sometimes confuse signature debit cards, which they swipe at a machi | Yes (`tab:nielsen-compare`) | No |

### High Priority Issues

#### - [ ] response_round2.tex:597: Key estimation-validity argument buried in footnote

**Severity:** High
**Comment:** The referee directly asked "how does this affect the author's estimation procedure?" The footnote's second sentence — that aggregate HomeScan shares align with aggregate payment volumes, so individual-level noise does not bias estimation — is the direct answer to that question. Placing it in a footnote buries the methodological reassurance. In a response letter, replies to explicit referee questions should be in the body text, not relegated to notes. The cross-reference to `tab:nielsen-compare` supports this claim and is substantive evidence, not a peripheral citation.

**Current footnote:**
```
Consumers sometimes confuse signature debit cards, which they swipe at a machine, with credit cards when responding to surveys \parencite{Rysman.etal2025}. As shown in Appendix Table \ref{tab:nielsen-compare}, the aggregate self-reported payment shares in the HomeScan data align well with aggregate payment volumes, so this individual-level noise does not bias the estimation of multi-homing probabilities or the aggregate payment patterns that the model targets.
```

**Proposed fix:** Absorb both sentences into the body of the reply paragraph. Delete the footnote. The revised reply paragraph would read:

```
\textbf{Reply:} I infer acceptance from large shifts in credit card payment shares and classify a merchant as accepting credit cards only if more than 5\% of its sales are paid by credit. The nonzero credit share before the acceptance change reflects misreporting: consumers sometimes confuse signature debit cards with credit cards when responding to surveys \parencite{Rysman.etal2025}. As shown in Appendix Table~\ref{tab:nielsen-compare}, aggregate self-reported payment shares in HomeScan align well with aggregate payment volumes, so this individual-level noise does not bias the estimation of multi-homing probabilities or the aggregate payment patterns the model targets.
```

**Why better:** The referee asked explicitly about estimation bias. Answering that question in the body of the reply — rather than in a footnote — directly addresses the concern and signals that the estimation is robust. No content is lost; the reply becomes three short sentences instead of one sentence plus a footnote.

### Density Report

| Section | File | Footnote Count | Assessment |
|---------|------|----------------|------------|
| Editor letter (pp. E-1 to E-end) | response_round2.tex | 0 | Fine |
| Referee 1 response | response_round2.tex | 1 | Fine (single footnote, lines 595–597) |
| Referee 2 response | response_round2.tex | 0 | Fine |
| Referee 3 response | response_round2.tex | 0 | Fine |
| Referee 4 response | response_round2.tex | 0 | Fine |

