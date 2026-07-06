# AI Detection Report

## appendix_credit_debit.tex

<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### High

### - [ ] Lines 10, 13, 183, 365, 432: Nominalized "post-Durbin null" shorthand `High`

**Comment:** The phrase "post-Durbin null" (and variants: "the observed null," "the null," "post-Durbin data") gets used five times to stand in for "credit interchange did not respond to Durbin." Turning a verb-object phrase into a compact noun ("null") reads as AI-fluent jargon. User-flagged as "artificial." Replace with plain verb phrases that describe what actually happened.

**Original (line 10):**
```
Section~\ref{subsubsec:oa-credit-debit-general} generalizes the model and derives an acceptance threshold that yields two predictions---credit acceptance should depend on credit-debit multi-homing rates, and debit fee caps should discipline credit fees. Both are rejected without any estimation: the first by \emph{Ohio v.\ AmEx} testimony, the second by the post-Durbin null in credit interchange.
```

**Proposed Revision:**
```
Section~\ref{subsubsec:oa-credit-debit-general} generalizes the model and derives an acceptance threshold that yields two predictions---credit acceptance should depend on credit-debit multi-homing rates, and debit fee caps should discipline credit fees. Both fail without any estimation. \emph{Ohio v.\ AmEx} testimony rejects the first. The second fails because credit interchange did not fall when Durbin halved debit interchange.
```

**Original (line 13):**
```
Section~\ref{subsec:oa-half-kappa} is a quantitative deep dive that estimates the partial-substitute specification; it predicts credit fees would rise 33 bps under Durbin reversal, directly contradicted by the post-Durbin data.
```

**Proposed Revision:**
```
Section~\ref{subsec:oa-half-kappa} estimates the partial-substitute specification for readers who want quantitative magnitudes; it predicts credit fees would rise 33 bps under Durbin reversal, while in the data credit interchange did not move when debit interchange was halved.
```

**Original (line 183):**
```
The post-Durbin data rejects this. Debit interchange fell by roughly half under Durbin, yet credit interchange did not respond (Figure~\ref{fig:merchant-fees-acceptance}). The equilibrium magnitude of this co-movement depends on network pricing FOCs rather than the threshold alone; Section~\ref{subsec:oa-half-kappa} quantifies it by estimating a partial-substitute specification and confirms the implied rejection is large.
```

**Proposed Revision:**
```
The data rejects this. Debit interchange fell by roughly half under Durbin, yet credit interchange did not respond (Figure~\ref{fig:merchant-fees-acceptance}). The equilibrium magnitude of this co-movement depends on network pricing FOCs rather than the threshold alone. Section~\ref{subsec:oa-half-kappa} quantifies it by estimating a partial-substitute specification and confirms the implied rejection is large.
```

**Original (line 365):**
```
The threshold formula and the post-Durbin null already reject Prediction 2 qualitatively. This subsection is a quantitative deep dive for the motivated reader. Estimating the partial-substitute specification ($\zeta = 0.5$, $\kappa_d = 0.5$) yields a 33 bps credit-fee rise under Durbin reversal, flatly contradicted by the observed null in credit interchange. This is why the partial-substitute specification is not the paper's main focus.
```

**Proposed Revision:**
```
The threshold formula together with the fact that credit interchange did not move when Durbin halved debit interchange already rejects Prediction 2 qualitatively. Readers wanting magnitudes can estimate the partial-substitute specification ($\zeta = 0.5$, $\kappa_d = 0.5$). That specification predicts credit fees would rise 33 bps under Durbin reversal, while credit interchange in fact stayed flat. The partial-substitute specification is therefore not the paper's main focus.
```

**Original (line 432):**
```
The null is not driven by bundling, which a 2003 settlement had already ended \parencite{Constantine2012}.
```

**Proposed Revision:**
```
This lack of credit response is not driven by bundling, which a 2003 settlement had already ended \parencite{Constantine2012}.
```

**Why better:** Names what actually happened (credit interchange did not move) instead of compressing it into jargon ("null"). Plain verb phrases read as authored rather than AI-polished. Also drops one "This subsection is a..." meta-commentary line and cuts two paragraph-ending semicolons.

---

### Medium

### - [ ] Line 194: "The caveat:" colon-as-drama construction `Medium`

**Comment:** `The caveat: X` uses a colon to dramatize what is just a follow-up point. Classic AI tell (Part A: CLAUSE: LONGER CLAUSE). A direct sentence reads more natural.

**Original:**
```
Welfare results under this specification are quantitatively similar to the baseline. The caveat: setting $\kappa_d = 0$ shuts off debit's own incremental-sales benefit, so the corner does not fully capture the realism of substitution. Readers wanting the intermediate case $\zeta = \kappa_d = 0.5$ should see Section~\ref{subsec:oa-half-kappa}.
```

**Proposed Revision:**
```
Welfare results under this specification are quantitatively similar to the baseline. Setting $\kappa_d = 0$ does shut off debit's own incremental-sales benefit, so the corner does not fully capture the realism of substitution; readers wanting the intermediate case $\zeta = \kappa_d = 0.5$ should see Section~\ref{subsec:oa-half-kappa}.
```

**Why better:** Names the caveat as it arises instead of announcing "The caveat:".

---

### - [ ] Line 365: "This subsection is a quantitative deep dive for the motivated reader" `Medium`

**Comment:** Meta-commentary announcing what the subsection is, rather than doing it. Paper sections should begin with content.

**Original:**
```
The threshold formula and the post-Durbin null already reject Prediction 2 qualitatively. This subsection is a quantitative deep dive for the motivated reader.
```

**Proposed Revision (merged with post-Durbin fix above):**
```
The threshold formula together with the fact that credit interchange did not move when Durbin halved debit interchange already rejects Prediction 2 qualitatively. Readers wanting magnitudes can estimate the partial-substitute specification ($\zeta = 0.5$, $\kappa_d = 0.5$).
```

**Why better:** Gets straight to what the subsection does instead of labeling it.

---

### - [ ] Line 192: "Prediction 1: debit generates no incremental sales..." colon construction `Medium`

**Comment:** Another CLAUSE: LONGER CLAUSE construction (Part A). The colon appends an elaboration that could stand on its own as a sentence.

**Original:**
```
The debit-as-cash corner ($\zeta = 1$, $\kappa_d = 0$, $\tau_d = 0$) allows credit-debit substitution while shutting off the multi-homing dependence in Prediction 1: debit generates no incremental sales and costs merchants the same as cash, so credit acceptance thresholds depend only on the credit fee and multi-homing across credit cards (Table~\ref{tab:threshold-cases}).
```

**Proposed Revision:**
```
The debit-as-cash corner ($\zeta = 1$, $\kappa_d = 0$, $\tau_d = 0$) allows credit-debit substitution while shutting off the multi-homing dependence in Prediction 1. Debit generates no incremental sales and costs merchants the same as cash, so credit acceptance thresholds depend only on the credit fee and multi-homing across credit cards (Table~\ref{tab:threshold-cases}).
```

**Why better:** Period instead of colon. The follow-up sentence now stands on its own.

---

### Low

### - [ ] Line 13, 365: "directly contradicted" / "flatly contradicted" adverb fillers `Low`

**Comment:** The adverbs ("directly," "flatly") are flavor words that add no load. "Contradicted" is itself strong enough.

**Original (line 13):** `...directly contradicted by the post-Durbin data.`

**Proposed Revision (paired with the post-Durbin fix):** `...while in the data credit interchange did not move when debit interchange was halved.`

**Why better:** Drops filler adverb and replaces the nominalized "post-Durbin data" with what actually happened.
