## [appendix_credit_debit.tex]

<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Critical

No Critical-tier issues found.

### High

### - [ ] Lines 243–244, 253: Near-verbatim sentence repetition within one page `[High]`

**Comment:** The paragraph ending Section~\ref{subsubsec:oa-credit-debit-general} (lines 242–244) and the opening of the very next subsection (line 253) say essentially the same thing. This is a structural tell — AI text often re-announces what was just said at each new section boundary, because the model treats each section as a fresh context.

**Original (lines 243–244):**
```
Sections~\ref{subsec:oa-half-kappa} and~\ref{subsec:oa-extension} thus estimate two alternatives that navigate this trade-off between the consumer-side substitution evidence and the merchant-side acceptance and pricing evidence differently.
```

**Original (line 253):**
```
This subsection estimates two alternative specifications that navigate the trade-off between consumer-side substitution evidence and merchant-side acceptance and pricing evidence differently.
```

**Proposed Revision:** Delete line 253 entirely (the subsection heading plus the prior paragraph already set up what follows), or replace with a sentence that advances the argument by naming what distinguishes the two alternatives, e.g.:
```
The two specifications differ in whether debit still generates incremental sales: the first keeps $\kappa_d = 0.5 > 0$, preserving a link between debit fees and credit acceptance; the second sets $\kappa_d = 0$, severing it.
```

**Why better:** Removes the stutter; the replacement sentence distinguishes the two alternatives rather than restating that they exist.

---

### - [ ] Lines 237–240: Results-first paragraph with throat-clearing opener `[High]`

**Comment:** The "Takeaways" paragraph opens by announcing the conclusion the reader has already reached from the analysis. "In the main text, I focus on the baseline model because it most accurately captures the effects of the Durbin Amendment" is a throat-clearing opener (Principle 8 violation) that states what the author does before explaining why. The paragraph then restates the logic already laid out in Predictions 1 and 2. This template — "here is what I do, here is why, here is what the alternatives do" — is a classic AI-generated wrapup structure.

**Original (lines 237–240):**
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

**Why better:** Starts with the conclusion (the predictions fail), gives the reason, cuts the throat-clearing sentence about "the goal of the model."

---

### Medium

### - [ ] Line 215: CLAUSE: LONGER CLAUSE colon construction `[Medium]`

**Comment:** "The $(\tau_c - \tau_d)$ term in the threshold implies equilibrium fee co-movement: when credit and debit are substitutes, a lower debit fee allows less aggressive credit pricing before acceptance breaks down." Uses a colon to introduce a longer elaborating clause, the classic AI colon-construction (Part A).

**Original:**
```
The $(\tau_c - \tau_d)$ term in the threshold implies equilibrium fee co-movement: when credit and debit are substitutes, a lower debit fee allows less aggressive credit pricing before acceptance breaks down.
```

**Proposed Revision:**
```
The $(\tau_c - \tau_d)$ term in the threshold implies equilibrium fee co-movement.
When credit and debit are substitutes, a lower debit fee allows less aggressive credit pricing before acceptance breaks down.
```

**Why better:** Two clean sentences; removes the colon construction.

---

### - [ ] Lines 275–276: CLAUSE: LONGER CLAUSE colon construction `[Medium]`

**Comment:** "The fixed cost modifies this to $\argmax_M -a_M - F\mathbf{1}[|M|>0] + b_M\gamma$: a merchant that accepts any card pays $f_1$..." — math expression followed by colon and elaborating clause. Standard AI colon structure.

**Original:**
```
The fixed cost modifies this to $\argmax_M -a_M - F\mathbf{1}[|M|>0] + b_M\gamma$: a merchant that accepts any card pays $f_1$, raising the threshold at which the marginal merchant begins accepting cards.
```

**Proposed Revision:**
```
The fixed cost modifies this to $\argmax_M -a_M - F\mathbf{1}[|M|>0] + b_M\gamma$, where a merchant that accepts any card pays $F$, raising the threshold at which the marginal merchant begins accepting cards.
```

**Why better:** Replaces the colon with a relative clause "where," which is the standard mathematical prose convention for introducing the interpretation of an expression. Also: the original says "pays $f_1$" but the notation introduced earlier for the fixed cost is $F$, not $f_1$ — possible notation inconsistency (see grammar file).

---

### - [ ] Lines 267–271: Meta-commentary / throat-clearing opener `[Medium]`

**Comment:** "Two additional adjustments are required." is a meta-commentary sentence (Part B) announcing what follows rather than making the argument. It is throat-clearing before the First/Second enumeration.

**Original:**
```
Two additional adjustments are required.
First, AmEx is dropped, leaving four products (Visa Debit, Visa Credit, MC Debit, MC Credit).
```

**Proposed Revision:**
```
Two modifications adapt the baseline for this setting.
AmEx is dropped, leaving four products (Visa Debit, Visa Credit, MC Debit, MC Credit).
```

**Why better:** "Two modifications adapt the baseline" is still meta but at least states the purpose; alternatively, the announcement sentence can be cut entirely and the First/Second labels dropped, letting the content carry. The "First... Second..." artificial enumeration (Part A: Lists & Enumeration) should be reviewed.

---

### - [ ] Lines 267–273: Artificial "First... Second..." enumeration `[Medium]`

**Comment:** "First, AmEx is dropped... Second, a fixed cost of card acceptance $F$ is added..." is an enumerated list structure common in AI prose. Part A flags this pattern.

**Original:**
```
Two additional adjustments are required.
First, AmEx is dropped, leaving four products (Visa Debit, Visa Credit, MC Debit, MC Credit).
...
Second, a fixed cost of card acceptance $F$ is added to the merchant's acceptance problem.
```

**Proposed Revision:** Integrate both modifications as separate paragraphs without "First/Second" labels, or convert to natural prose:
```
AmEx is dropped, leaving four products (Visa Debit, Visa Credit, MC Debit, MC Credit).
...
A fixed cost of card acceptance $F$ is also added to the merchant's acceptance problem.
```

**Why better:** Less formulaic; each adjustment stands on its own without an artificial numbering scaffold.

---

### - [ ] Line 351: Colon-based elaboration on multi-homing value `[Medium]`

**Comment:** "Point-of-sale substitution makes multi-homing more valuable: when consumers can freely switch cards, more multi-homing pushes the market closer to a world where merchants accept only the cheapest card." — Another CLAUSE: LONGER CLAUSE colon construction.

**Original:**
```
Point-of-sale substitution makes multi-homing more valuable: when consumers can freely switch cards, more multi-homing pushes the market closer to a world where merchants accept only the cheapest card.
```

**Proposed Revision:**
```
Point-of-sale substitution makes multi-homing more valuable.
When consumers can freely switch cards, more multi-homing pushes the market toward a world where merchants accept only the cheapest card.
```

**Why better:** Removes colon construction; two clean sentences.

---

### Low

### - [ ] Line 7–8: "Reassuringly" padding word `[Low]`

**Comment:** Line 244: "Reassuringly, the credit-focused counterfactuals..." — "Reassuringly" is a sentence-initial adverb that signals a pivot to good news, a mild AI-tell padding opener.

**Original:**
```
Reassuringly, the credit-focused counterfactuals (the credit fee cap and the merger) deliver similar welfare across all three specifications.
```

**Proposed Revision:**
```
The credit-focused counterfactuals (the credit fee cap and the merger) deliver similar welfare across all three specifications.
```

**Why better:** The sentence is self-explanatory; the adverb adds nothing and reads as a filler.

---

### - [ ] Line 487–489: "The pattern matches" wrapup template `[Low]`

**Comment:** Lines 487–489: "The pattern matches the underlying economics. The substitution assumption affects how debit competes with credit, so it matters most for counterfactuals that change debit pricing. The credit-focused conclusions of the paper, capping credit fees and the credit network merger, do not depend on the substitution assumption." — The opener "The pattern matches the underlying economics" is a mild formulaic summary tag (Part B: Meta-Commentary template), similar to "Taken together..." or "The results are consistent with..."

**Original:**
```
The pattern matches the underlying economics.
The substitution assumption affects how debit competes with credit, so it matters most for counterfactuals that change debit pricing.
The credit-focused conclusions of the paper, capping credit fees and the credit network merger, do not depend on the substitution assumption.
```

**Proposed Revision:**
```
The divergence tracks the economics.
The substitution assumption shapes how debit competes with credit, so it matters most for counterfactuals that change debit pricing.
The credit-focused conclusions — capping credit fees and the merger — do not depend on the substitution assumption.
```

**Why better:** "The divergence tracks the economics" is specific (refers to the welfare divergence just described); cuts the filler meta-opener. Minor: replaces the parenthetical "capping credit fees and the credit network merger" with em-dash format — but note the project's surface rules flag em-dashes; author should use commas or a separate clause instead.
