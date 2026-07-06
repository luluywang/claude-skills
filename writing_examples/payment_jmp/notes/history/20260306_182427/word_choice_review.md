# Word Choice Review

## [counterfactuals.tex]

### - [ ] Lines 34: Nominalized phrase

**Comment:** Nominalization — "The fact that..." is verbose. Convert to direct verb construction.

**Original:**
```
The fact that rewards fall by more than the reduction in merchant fees is consistent with the rise in network fees in Europe after interchange caps were imposed \parencite{PYMNTS2024}.
```

**Proposed Revision:**
```
Rewards fall by more than the reduction in merchant fees, consistent with the rise in network fees in Europe after interchange caps were imposed \parencite{PYMNTS2024}.
```

**Why better:** Removes the nominalizing frame "The fact that X is"; the sentence moves immediately to the action. More direct and clearer.

---

### - [ ] Lines 75: Weak verb + wordiness

**Comment:** Weak verb "measure"; "the weighted sum of... weighted by" is repetitive. Nominalization in "utility changes."

**Original:**
```
I measure consumption change per income group as the weighted sum of utility changes across wallet types, weighted by baseline choice probabilities $\tilde{\mu}$.
```

**Proposed Revision:**
```
I compute consumption change per income group by weighting utility changes across wallet types by baseline choice probabilities $\tilde{\mu}$.
```

**Why better:** "Compute" is more concrete for a calculation. Eliminates the "weighted... weighted" repetition. Clearer flow.

---

### - [ ] Lines 92-93: Nominalization + weak verb + useless modifier

**Comment:** Nominalization in "solving the equilibrium"; weak verb "stand out"; useless modifier in "Two results stand out."

**Original:**
```
To see why this logic fails, I decompose the welfare effects by sequentially solving the equilibrium while holding different margins fixed (Table~\ref{tab:cap-credit-channel-decomp}).
Two results stand out.
```

**Proposed Revision:**
```
To see why this logic fails, I decompose welfare effects by sequentially adjusting different margins (Table~\ref{tab:cap-credit-channel-decomp}).
Two patterns emerge.
```

**Why better:** "Adjusting different margins" is more specific than "solving the equilibrium." Removes "Two results stand out" — unnecessary frame; "Two patterns emerge" is slightly tighter but could be cut entirely if context permits.

---

### - [ ] Lines 160: Weak descriptor

**Comment:** "The key asymmetry is that" — verbose frame. "Key" is implied by context.

**Original:**
```
The key asymmetry is that retail price reductions benefit all consumers---including cash users---while reward cuts fall mainly on card users.
```

**Proposed Revision:**
```
Retail price reductions benefit all consumers---including cash users---while reward cuts fall mainly on card users.
```

**Why better:** Removes redundant framing. The contrast speaks for itself. Tighter and more direct.

---

### - [ ] Lines 163: Weak verb

**Comment:** "Reflecting that" — indirection. "Because" is more direct.

**Original:**
```
Merchant adoption effects are modest (\$1.9 billion total), reflecting that most merchants remain near their acceptance threshold throughout the transition.
```

**Proposed Revision:**
```
Merchant adoption effects are modest (\$1.9 billion total), because most merchants remain near their acceptance threshold throughout the transition.
```

**Why better:** "Because" is more active and direct than "reflecting that." Clearer causal link.

---

### - [ ] Lines 176: Wordiness

**Comment:** "With price coherence, merchants charge uniform prices..." — redundant opening. "Under" is more economical.

**Original:**
```
Under pure-transfer logic, a cap reshuffles surplus---from networks and high-income reward earners toward low-income households---without creating any.
To see why this logic fails, I decompose the welfare effects by sequentially solving the equilibrium while holding different margins fixed (Table~\ref{tab:cap-credit-channel-decomp}).
Two results stand out.
First, the network effect alone---before any retail price adjustment---generates net welfare gains, because consumers who lose credit rewards switch to payment methods they genuinely prefer rather than ones chosen for rewards.
Second, price passthrough amplifies the gains: merchant competition converts fee savings into lower retail prices that benefit all consumers, including cash users.
...
In standard markets, consumer choices drive efficient outcomes because prices reflect production costs.
Payment markets are fundamentally different.
High rewards are funded not by efficient production but by rent extraction from merchants through high merchant fees.
Under price coherence, merchants charge uniform prices regardless of payment method.
```

**Proposed Revision:**
```
Under price coherence, merchants charge uniform prices regardless of payment method.
```

**Why better:** "Under" is tighter than "With." (Note: The intro.tex uses "Under price coherence" on line 176, so consistency matters here; counterfactuals.tex already uses "Under price coherence" but context is good.)

---

### - [ ] Lines 181: Abstract concept word

**Comment:** "This reveals a fundamental tension" — vague abstraction. "This shows" or restructure to be more concrete.

**Original:**
```
This reveals a fundamental tension: rewards pull consumers toward credit cards despite preferring debit.
```

**Proposed Revision:**
```
The conflict is clear: rewards pull consumers toward credit cards despite preferring debit.
```

**Why better:** More concrete. Or: restructure entirely as "Rewards pull consumers toward credit cards, even though they prefer debit." This is more direct.

---

### - [ ] Lines 107-108: Nominalization + passive voice

**Comment:** "I measure consumer welfare using money-metric utility. I compute this as:" — weak transition; nominalization in "money-metric utility."

**Original:**
```
I measure consumer welfare using money-metric utility.
I compute this as:
```

**Proposed Revision:**
```
I measure consumer welfare in money-metric utility terms.
```

Or alternatively:
```
Consumer welfare is measured as the money-metric utility that maximizes...
```

**Why better:** "In money-metric utility terms" is more economical. The "I compute this as:" is redundant—the equation speaks for itself. Removes the extra sentence.

---

### - [ ] Lines 199: Latin-derived word option

**Comment:** "reflect the small second-order gains" — "reflect" is acceptable here, but could be "represent" (still Latin-derived) or "capture" (more concrete).

**Original:**
```
which reflect the small second-order gains from no longer having to charge uniform prices for payments with heterogeneous costs.
```

**Proposed Revision:**
```
which represent the small second-order gains from no longer having to charge uniform prices for payments with heterogeneous costs.
```

Or:
```
which capture the small second-order gains from pricing payments by their costs.
```

**Why better:** "Represent" is equally Latin but slightly more visual. "Capture" is more concrete and reframes the idea—merchants capture value from differentiated pricing. (Note: "heterogeneous costs" is technical jargon; keep it.)

---

### - [ ] Lines 241-242: Weak hedging language

**Comment:** "This shows the current regime... is worse than either laissez-faire or uniform caps. This result highlights the difficulty of regulating two-sided markets."

**Original:**
```
This shows the current regime---capping debit but not credit---is worse than either laissez-faire or uniform caps.
This result highlights the difficulty of regulating two-sided markets.
```

**Proposed Revision:**
```
The current regime---capping debit but not credit---is worse than both laissez-faire and uniform caps.
Regulating two-sided markets is harder than one-sided regulation.
```

**Why better:** Removes "This shows" and "This result highlights" (weak frames). "Both X and Y" is tighter than "either X or Y." Final sentence is more direct: shows difficulty rather than naming it abstractly.
