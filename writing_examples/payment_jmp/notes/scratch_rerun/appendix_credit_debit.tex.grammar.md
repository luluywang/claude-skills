## [appendix_credit_debit.tex]

### Pass 1

**Line 204 double-period check:** Line 204 reads "The generalized threshold yields two testable predictions for the case when there is substitution and debit cards generate incremental sales relative to cash." — NO double period. The prior "cash.." concern is resolved; the period is single and correct.

---

### - [ ] Line 223: Missing article / grammar error — "credit merchants fees"

**Original:**
```
The acceptance threshold also predicts that if credit merchants fees don't respond to the debit fee cap, credit card acceptance should decline.
```

**Proposed Revision:**
```
The acceptance threshold also predicts that if credit card merchant fees do not respond to the debit fee cap, credit card acceptance should decline.
```

**Why better:** "credit merchants fees" is missing the article and the noun is wrong — the intended phrase is "credit card merchant fees" (or "credit merchant fees" with a hyphen: "credit-merchant fees"). Also "don't" is informal in academic prose; "do not" is standard.

---

### - [ ] Line 253: Verbatim repetition of introductory sentence from lines 243–244

**Original (line 253):**
```
This subsection estimates two alternative specifications that navigate the trade-off between consumer-side substitution evidence and merchant-side acceptance and pricing evidence differently.
```

**Comment:** This sentence is nearly identical to lines 243–244: "Sections~\ref{subsec:oa-half-kappa} and~\ref{subsec:oa-extension} thus estimate two alternatives that navigate this trade-off between the consumer-side substitution evidence and the merchant-side acceptance and pricing evidence differently." The `\subsection{Alternative Specifications}` opening at line 250–253 restates what was just said. This is a redundancy error, not merely a style issue.

**Note for author:** The opening sentence of the subsection at line 253 can be deleted entirely; the subsection heading plus the prior paragraph already set up what follows. Or it can be replaced with a sentence that advances the argument (e.g., detailing what distinguishes the two alternatives).

---

### - [ ] Line 265: Run-on sentence (two independent clauses joined without coordination)

**Original:**
```
Consumers holding both card types substitute between them at the point of sale half the time ($\zeta = 0.5$) rather than never (baseline) or always (debit as cash). Debit acceptance generates half the demand boost of credit ($\kappa_d = 0.5$; Eq.~\ref{eq:payment-value-kappa}) rather than the full boost ($\kappa_d = 1$) of the baseline or none ($\kappa_d = 0$) of debit as cash.
```

**Comment:** These are two separate, dense sentences. Not a grammar error per se, but the period after "debit as cash" on line 265 (first sentence) creates a very long sentence (41 words). This is a style note passed to simplifications; grammatically the sentences are correct.

---

### - [ ] Line 313: Overlong sentence (grammar / punctuation concern)

**Original:**
```
Because debit generates incremental sales and consumers substitute between credit and debit at the point of sale, cheap debit becomes a close alternative to expensive credit in the merchant's acceptance decision, so the estimator must explain why merchants keep accepting expensive credit anyway.
```

**Comment:** 46 words. Two subordinate clauses ("Because...") and a main clause with a consequential clause ("so the estimator must...") chained together. Grammatically permissible but strains comprehension. Flagging as a grammar/punctuation concern since the sentence length exceeds the ~40-word guideline. Proposed split is in simplifications.

---

### Pass 2 (Adversarial)

Re-read with fresh eyes:

- **Line 167:** "By inspection, the acceptance threshold depends now on the gap between credit and debit fees $\tau_2 - \tau_1$ and the share of transactions that substitute between credit and debit ($D$)." — The adverb "now" is misplaced. Standard word order would be "depends now" → "now depends" or "depends on the gap now that..." This is a word-order issue, borderline grammar.

  **Proposed Revision (grammar):**
  ```
  The acceptance threshold now depends on the gap between credit and debit fees $\tau_2 - \tau_1$ and the share of transactions that substitute between credit and debit ($D$).
  ```
  **Why better:** "depends now" has the adverb after the verb in a way that sounds informal; "now depends" places the adverb before the verb per standard academic style.

- **Line 215:** "The $(\tau_c - \tau_d)$ term in the threshold implies equilibrium fee co-movement: when credit and debit are substitutes, a lower debit fee allows less aggressive credit pricing before acceptance breaks down." — The colon introduces an explanation. This is a CLAUSE: LONGER CLAUSE construction (AI tell, flagged in ai_detection). Grammar is correct.

- **Line 276:** "The fixed cost is identified by requiring that the first merchant that is willing to add Visa Credit is indifferent between accepting both debit networks + MC credit and the empty bundle." — "both debit networks + MC credit" uses a "+" symbol in prose text (should be "and" or "plus"). This is a minor formatting inconsistency.

  **Proposed Revision (grammar):**
  ```
  The fixed cost is identified by requiring that the first merchant willing to add Visa Credit is indifferent between accepting both debit networks and MC Credit and the empty bundle.
  ```
  **Why better:** Replaces the informal "+" with "and"; also removes the redundant "that is" → "willing."

- **Line 385:** "Because fees are measured relative to cash (Section~\ref{subsubsec:payment-tree}), treating debit as cash raises the implied cost of cash to match debit, so $\tau_d = 0$ and targeted credit fees fall by the same amount." — "targeted credit fees" — unclear what "targeted" modifies here; likely "net credit fees" or "credit fees net of the cash benchmark." Flagging as potential ambiguity (grammar/clarity boundary). Passed to word_choice.

**No additional errors found beyond those documented above.**

---

**Summary: 4 grammar/mechanics issues flagged (1 clear error at line 223 "credit merchants fees"; 1 word-order at line 167; 1 prose symbol at line 276; 1 redundancy at line 253). Line 204 double-period is NOT present — resolved.**
