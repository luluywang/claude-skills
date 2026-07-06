## [appendix_credit_debit.tex]

Proposed revisions for stylistic issues (NOT auto-applied — author review required).
Organized by priority within the file.

---

### - [ ] Lines 253: Delete redundant subsection opener (HIGH PRIORITY)

**Comment:** The subsection opener at line 253 repeats verbatim what was said at lines 243–244. The subsection heading "Alternative Specifications" already signals what follows. The sentence adds no information.

**Original:**
```
This subsection estimates two alternative specifications that navigate the trade-off between consumer-side substitution evidence and merchant-side acceptance and pricing evidence differently.
```

**Proposed Revision:** Delete the sentence entirely, or replace with a sentence that advances the argument by distinguishing the two alternatives:
```
The two specifications differ in whether debit generates incremental sales relative to cash.
```

**Why better:** Removes the stutter; starts the subsection doing work rather than announcing what it will do.

---

### - [ ] Lines 237–240: Tighten the "Takeaways" paragraph opener (HIGH PRIORITY)

**Comment:** "In the main text, I focus on the baseline model because..." is throat-clearing. The reader already knows what the baseline model is and why it was chosen. The paragraph's real content starts at "The two substitution predictions fail this test."

**Original:**
```
In the main text, I focus on the baseline model because it most accurately captures the effects of the Durbin Amendment.
The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
Every counterfactual in the paper revisits margins similar to Durbin's debit fee cap, so a credible model must reproduce Durbin's actual response.
The two substitution predictions fail this test.
```

**Proposed Revision:**
```
The two substitution predictions fail the Durbin test.
Every counterfactual in the paper revisits margins similar to Durbin's debit fee cap, so a model that cannot reproduce Durbin's actual response cannot be trusted on the others.
```

**Why better:** Leads with the punchline; removes two sentences of meta-commentary about "the goal of the model."

---

### - [ ] Line 313: Split overlong sentence (MEDIUM PRIORITY)

**Comment:** 46-word sentence chains two subordinate clauses onto a main clause. Exceeds the ~40-word guideline.

**Original:**
```
Because debit generates incremental sales and consumers substitute between credit and debit at the point of sale, cheap debit becomes a close alternative to expensive credit in the merchant's acceptance decision, so the estimator must explain why merchants keep accepting expensive credit anyway.
```

**Proposed Revision:**
```
Because debit generates incremental sales and consumers substitute between card types at the point of sale, cheap debit becomes a close alternative to expensive credit in the merchant's acceptance decision.
The estimator must explain why merchants keep accepting expensive credit anyway.
```

**Why better:** Two sentences; the second is punchy and sets up the answer that follows ("The resolution runs through merchant margins.").

---

### - [ ] Lines 267–273: Replace "First... Second..." enumeration with flowing prose (MEDIUM PRIORITY)

**Comment:** The "Two additional adjustments are required. First... Second..." structure is formulaic. See ai_detection for full analysis.

**Original:**
```
Two additional adjustments are required.
First, AmEx is dropped, leaving four products (Visa Debit, Visa Credit, MC Debit, MC Credit).
...
Second, a fixed cost of card acceptance $F$ is added to the merchant's acceptance problem.
```

**Proposed Revision:**
```
AmEx is dropped, leaving four products (Visa Debit, Visa Credit, MC Debit, MC Credit).
...
A fixed cost of card acceptance $F$ is also added to the merchant's acceptance problem.
```

**Why better:** Each modification carries its own paragraph; the scaffold of "First/Second" is unnecessary when each point is a full paragraph.

---

### - [ ] Lines 215, 351: Convert colon-elaboration constructions to two sentences (MEDIUM PRIORITY)

**Comment:** Two instances of CLAUSE: LONGER CLAUSE at lines 215 and 351. See ai_detection for proposed revisions.

**Line 215 Original:**
```
The $(\tau_c - \tau_d)$ term in the threshold implies equilibrium fee co-movement: when credit and debit are substitutes, a lower debit fee allows less aggressive credit pricing before acceptance breaks down.
```

**Proposed Revision (line 215):**
```
The $(\tau_c - \tau_d)$ term in the threshold implies equilibrium fee co-movement.
When credit and debit are substitutes, a lower debit fee allows less aggressive credit pricing before acceptance breaks down.
```

**Line 351 Original:**
```
Point-of-sale substitution makes multi-homing more valuable: when consumers can freely switch cards, more multi-homing pushes the market closer to a world where merchants accept only the cheapest card.
```

**Proposed Revision (line 351):**
```
Point-of-sale substitution makes multi-homing more valuable.
When consumers can freely switch cards, more multi-homing pushes the market toward a world where merchants accept only the cheapest card.
```

---

### - [ ] Lines 336–339: Consider splitting the uncapping-debit paragraph for clarity (LOWER PRIORITY)

**Comment:** Lines 336–339 do three things in four sentences: state the direction of fee co-movement, report the welfare reversal, explain the mechanism, and contrast with the baseline. This is close to the "one point per paragraph" limit.

**Original:**
```
Under substitution, credit and debit merchant fees move in the same direction, so this specification reverses the welfare effects of uncapping debit fees.
Total welfare falls by \$10B (SE \$2.8B) versus a \$7B gain at baseline.
Uncapping debit removes the competitive constraint on credit fees, so credit networks raise both fees (by 33 bps) and rewards (by 32 bps), an escalation on both sides of the credit market that reduces total welfare.
The baseline instead raises debit rewards with minimal effects on credit pricing.
```

**Proposed Revision:** This paragraph is actually quite well-integrated — the mechanism (co-movement) leads to the result (welfare reversal) leads to the explanation (escalation on both sides). The four sentences hold together. This is a low-priority simplification; the author may choose to leave it as is.

---

### - [ ] Line 385: Clarify "targeted credit fees" (LOWER PRIORITY)

**Comment:** "targeted credit fees fall by the same amount" — "targeted" is ambiguous. Likely means "net" or "effective" credit fees (net of the cash benchmark), but the word "targeted" does not communicate this.

**Original:**
```
Because fees are measured relative to cash (Section~\ref{subsubsec:payment-tree}), treating debit as cash raises the implied cost of cash to match debit, so $\tau_d = 0$ and targeted credit fees fall by the same amount.
```

**Proposed Revision:**
```
Because fees are measured relative to cash (Section~\ref{subsubsec:payment-tree}), treating debit as cash raises the implied cost of cash to match debit, so $\tau_d = 0$ and net credit fees fall by the same amount.
```

**Why better:** "Net credit fees" (fees net of the cash benchmark) is the precise term.
