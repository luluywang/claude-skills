## [appendix_credit_debit.tex]

Line-by-line word choice review. Issues organized by document order.

---

### - [ ] Line 8: "along some dimensions" — vague modifier

**Comment:** Category: Vague modifier. "More realistic along some dimensions" hedges without specifying which dimensions. In a technical appendix the author should name them or drop the qualifier.

**Original:**
```
While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Proposed Revision:**
```
While incorporating substitution would make the model more realistic on the consumer side, it also generates predictions at odds with the merchant-side evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Why better:** Specific ("consumer side," "merchant-side evidence") rather than vague ("along some dimensions").

---

### - [ ] Line 40: "captures the dominant pattern but understates" — weak framing

**Comment:** Category: Weak verb / hedged claim. "Understates" is technically correct but passive in effect. The segmentation assumption is not wrong — it is a deliberate choice that misses the substitution margin.

**Original:**
```
Segmentation captures the dominant pattern but understates the substitution in response to rewards.
```

**Proposed Revision:**
```
Segmentation captures the dominant pattern but misses the substitution that rewards generate.
```

**Why better:** "Misses" is more direct than "understates"; "that rewards generate" is tighter than "in response to rewards."

---

### - [ ] Line 62: "no substitution assumption" — noun pile-up / awkward compound

**Comment:** Category: Noun pile-up. "The no substitution assumption" strings three words with no hyphenation. Standard economics prose would write "the no-substitution assumption" (hyphenated when used as a modifier) or "the assumption of no substitution."

**Original:**
```
Below, I explore how relaxing the no substitution assumption changes the model.
```

**Proposed Revision:**
```
Below, I explore how relaxing the no-substitution assumption changes the model.
```

**Why better:** Hyphenating the compound modifier is grammatically standard and removes the noun pile-up.

---

### - [ ] Line 73: "governs how often" / "governs the demand boost" — repeated "governs"

**Comment:** Category: Word repetition / weak verb. "Governs" appears twice in the same sentence. The first use is fine ("governs how often a consumer...redirects"); the second is weak ("governs the demand boost merchants get from debit"). The second usage is also slightly imprecise: $\kappa_d$ scales the demand boost, it does not govern it.

**Original:**
```
The parameter $\zeta\in[0,1]$ governs how often a consumer holding both card types reaches for the other type when a merchant accepts only one, and $\kappa_d\in[0,1]$ governs the demand boost merchants get from debit relative to credit.
```

**Proposed Revision:**
```
The parameter $\zeta\in[0,1]$ governs how often a consumer holding both card types reaches for the other type when a merchant accepts only one; $\kappa_d\in[0,1]$ scales the demand boost merchants get from debit relative to credit.
```

**Why better:** Avoids the repeated verb; "scales" is more precise for a multiplicative parameter. Note: the semicolon may be a surface concern per the project's semicolon-discipline rule — author may prefer a period and a new sentence.

---

### - [ ] Line 98: "needs parameters $\kappa_j$" — imprecise

**Comment:** Category: Vague verb. "The model needs parameters" is informal. The model introduces or requires parameters.

**Original:**
```
When debit generates fewer incremental sales than credit, the model needs parameters $\kappa_j$ for each payment method that scale the sales increase relative to credit cards.
```

**Proposed Revision:**
```
When debit generates fewer incremental sales than credit, the model introduces parameters $\kappa_j$ for each payment method that scale the demand boost relative to credit cards.
```

**Why better:** "Introduces" is more precise than "needs"; "demand boost" is the paper's own term (used at lines 73, 104), so using "sales increase" here creates inconsistency.

---

### - [ ] Line 149: "captures new card transactions" / "captures actual diversion" — "captures" repeated

**Comment:** Category: Word repetition. $N$ "captures" and $D$ "captures" in adjacent sentences. The repetition is deliberate for parallel structure but sounds slightly formulaic.

**Original:**
```
$N$ captures new card transactions: single-homers on credit plus the share of multi-homer spending that stays cash under partial substitution.
$D$ captures actual diversion: multi-homer spending redirected from debit to credit.
```

**Comment:** This is actually a case where parallelism is intentional and correct. The repetition of "captures" mirrors the decomposition. Do NOT flag as an error. Leaving here as a note that the author was presumably deliberate; no revision recommended.

---

### - [ ] Line 221: "confirms the implied gap is large" — vague

**Comment:** Category: Vague noun. "The implied gap is large" — gap in what? The sentence refers to the co-movement gap between the model's prediction (33 bps) and the observed zero response, but "gap" is abstract.

**Original:**
```
Section~\ref{subsec:oa-half-kappa} quantifies the implied co-movement by estimating a specification with incremental debit sales and confirms the implied gap is large.
```

**Proposed Revision:**
```
Section~\ref{subsec:oa-half-kappa} quantifies the implied co-movement: the estimated model predicts credit fees rising 33 bps, against a flat observed response.
```

**Why better:** Names the quantity (33 bps) rather than the abstract "gap"; readers get the substance here rather than having to read ahead. Note: this moves a number from the later section into the current one — author should confirm the sequencing is intentional.

---

### - [ ] Lines 328–329: "the incremental-debit-sales specification still yields welfare estimates close to the baseline" — wordy

**Comment:** Category: Wordiness / redundant modifier. "Still yields welfare estimates close to the baseline" can be tightened.

**Original:**
```
For counterfactuals that primarily affect credit, the incremental-debit-sales specification still yields welfare estimates close to the baseline.
```

**Proposed Revision:**
```
For counterfactuals that primarily affect credit, the incremental-debit-sales specification yields welfare estimates close to the baseline.
```

**Why better:** "Still" is redundant — the sentence already implies robustness ("close to the baseline"). Removing it tightens without losing meaning.

---

### - [ ] Line 395: "Rationalizing observed acceptance at a lower net cost requires lower merchant margins" — passive / circular

**Comment:** Category: Passive construction / weak verb. "Rationalizing" dangles as a gerund subject; the sentence is really saying the estimator raises the CES elasticity.

**Original:**
```
Rationalizing observed acceptance at a lower net cost requires lower merchant margins, which the estimator delivers by raising the CES elasticity to $\sigma = 7.16$ from the baseline $5.61$ (Table~\ref{tab:param-extension}).
```

**Proposed Revision:**
```
Observed acceptance at a lower net cost requires lower merchant margins, so the estimator raises the CES elasticity to $\sigma = 7.16$ from the baseline $5.61$ (Table~\ref{tab:param-extension}).
```

**Why better:** Removes the dangling gerund; "so the estimator raises" is direct and active.

---

### - [ ] Lines 460–461: "The welfare results for other counterfactuals are more sensitive, but do not change signs." — ambiguous

**Comment:** Category: Imprecise phrasing. "Do not change signs" — signs of what? Of the total welfare effects? This is probably clear in context but the phrasing is terse to the point of ambiguity.

**Original:**
```
The welfare results for other counterfactuals are more sensitive, but do not change signs.
```

**Proposed Revision:**
```
Welfare effects for other counterfactuals are more sensitive to the specification, but the signs do not change.
```

**Why better:** "The signs do not change" has a clear referent (the signs of the welfare effects just discussed); adding "to the specification" explains sensitive-to-what.
