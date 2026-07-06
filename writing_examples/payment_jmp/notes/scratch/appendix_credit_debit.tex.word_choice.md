## [appendix_credit_debit.tex]

### - [ ] Lines 62: Weak verb "explores"

**Comment:** "Explore how relaxing" is vague and tentative. Economics writing benefits from more direct action verbs.

**Original:**
```
Below, I explore how relaxing the no substitution assumption changes the model.
```

**Proposed Revision:**
```
Below, I relax the no substitution assumption and derive how it changes the model.
```

**Why better:** "Relax and derive" is more direct and concrete than "explore how." It matches the technical action being taken.

### - [ ] Lines 98–99: Weak verb and nominalization

**Comment:** "The model needs parameters" and "scale the sales increase" use passive construction and nominalization. More direct phrasing.

**Original:**
```
When debit generates fewer incremental sales than credit, the model needs parameters $\kappa_j$ for each payment method that scale the sales increase relative to credit cards.
```

**Proposed Revision:**
```
When debit generates fewer incremental sales than credit, we parameterize each payment method with $\kappa_j$ to weight its sales boost relative to credit cards.
```

**Why better:** "Parameterize" and "weight" are more concrete and active than "the model needs parameters" and "scale the sales increase."

### - [ ] Lines 139–141: Redundant framing

**Comment:** "A two-card example makes this dependence visible" is vague framing. The phrase "makes visible" is weaker than direct statement.

**Original:**
```
A two-card example makes this dependence visible.
Keep the convention from Online Appendix~\ref{subsec:oa-credit-multihoming} that card~$1$ is debit (fee $\tau_d$, sales parameter $\kappa_d\leq1$) and card~$2$ is credit (fee $\tau_c$, sales parameter $\kappa_c = 1$).
```

**Proposed Revision:**
```
A two-card example demonstrates this dependence.
Let card~$1$ denote debit (fee $\tau_d$, sales parameter $\kappa_d\leq1$) and card~$2$ denote credit (fee $\tau_c$, sales parameter $\kappa_c = 1$), following Online Appendix~\ref{subsec:oa-credit-multihoming}.
```

**Why better:** "Demonstrates" is more direct than "makes visible." "Let X denote Y" is clearer than "Keep the convention that X is Y."

### - [ ] Lines 206–208: Weak verb in substantive claim

**Comment:** "Depends on" is a passive linking verb. Strengthen with direct causation.

**Original:**
```
The threshold~\eqref{eq:general-credit-debit-threshold} contains $D = \zeta M$.
When $\zeta > 0$, the credit acceptance threshold depends on credit-debit multi-homing rates.
```

**Proposed Revision:**
```
The threshold~\eqref{eq:general-credit-debit-threshold} contains $D = \zeta M$.
When $\zeta > 0$, credit-debit multi-homing rates enter the credit acceptance threshold.
```

**Why better:** "Enter" is more concrete and active than "the threshold depends on." It specifies that multi-homing rates directly affect the calculation.

### - [ ] Lines 310–311: Dense nominalization

**Comment:** "The resolution runs through merchant margins" is weak. "Resolution" and "runs through" are vague.

**Original:**
```
The resolution runs through merchant margins.
Higher margins weight the incremental-sales channel more heavily than the fee channel, which requires lowering the CES elasticity to $\sigma = 4.98$ from the baseline $5.61$ (Table~\ref{tab:param-half-kappa}).
```

**Proposed Revision:**
```
Merchant margins provide the resolution.
Higher margins favor the incremental-sales channel over the fee channel, forcing down the CES elasticity to $\sigma = 4.98$ from the baseline $5.61$ (Table~\ref{tab:param-half-kappa}).
```

**Why better:** "Provide the resolution" is more direct than "runs through." "Favor" and "forcing" are stronger than "weight" and "requires."

