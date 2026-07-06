# Word Choice Review

## [appendix_model_oa.tex]

No word choice issues flagged for appendix_model_oa.tex. Technical vocabulary is appropriate and precise. Word choice recommendations exist for estimation.tex (see separate section below).

---

## [estimation.tex]

### - [ ] Lines 64: "provides leverage" — vague academic hand-waving

**Comment:** Weak verb + abstract noun. "Leverage" is jargony and unclear. The sentence doesn't say what identification strategy actually works or why. This is precisely the kind of vague hand-waving the user flagged.

**Original:**
```
The Rochet-Tirole framework provides leverage to identify merchant parameters.
```

**Proposed Revision:**
```
The Rochet-Tirole framework allows us to identify merchant parameters: because networks tax the insensitive merchants and subsidize the sensitive consumers, the fee structure reveals that merchants are fee-insensitive.
```

**Why better:** Concrete and specific. Removes vague "provides leverage" and explains the actual mechanism that makes identification possible. Anticipates the logic in the next sentence.

---

### - [ ] Lines 42-43: "recover" — appears twice in adjacent sentences, repetitive and vague

**Comment:** Weak verb + vague. Better to name the specific action (inverting, estimating, computing).

**Original:**
```
I recover network costs by inverting networks' first-order conditions with respect to rewards.
High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed merchant fees.
```

**Proposed Revision:**
```
I calculate network marginal costs by inverting networks' first-order conditions with respect to rewards.
Since high rewards are profitable only when networks earn profits from merchants, these costs must be low relative to observed merchant fees.
```

**Why better:** "Calculate" and "invert" are concrete and specific. "Since" tightens the logical flow.

---

### - [ ] Lines 48-49: "Merchant fee sensitivity in the model is not a primitive parameter but an equilibrium object"

**Comment:** Nominalization and vague structure. "Object" is empty—name what it is. Passive voice buries agency.

**Original:**
```
Merchant fee sensitivity in the model is not a primitive parameter but an equilibrium object determined by the distribution of merchant types and consumer multi-homing behavior.
```

**Proposed Revision:**
```
Merchant fee sensitivity emerges as an equilibrium outcome of merchant type heterogeneity and consumer multi-homing choices, not as a primitive parameter.
```

**Why better:** Active voice. Clearer that merchant sensitivity is determined BY something, not just "determined." Avoids empty "object."

---

### - [ ] Lines 49-50: "A reduced-form approach...would recover this equilibrium sensitivity"

**Comment:** Weak verb "recover." State what the regression actually does—measure, identify.

**Original:**
```
A reduced-form approach---such as regressing acceptance on fees---would recover this equilibrium sensitivity, which depends on the current level of fees and on consumer multi-homing, both of which change under counterfactual policy.
```

**Proposed Revision:**
```
A reduced-form regression of acceptance on fees would measure this equilibrium sensitivity, but it depends on current fee levels and consumer multi-homing patterns—both of which shift under counterfactual policy.
```

**Why better:** "Measure" is more precise than "recover." Avoids the double subordinate clause at the end by using a dash for emphasis.

---

### - [ ] Lines 56-57: "just on the margin of accepting"

**Comment:** Vague phrase. "Margin" is economics jargon; use clearer language.

**Original:**
```
I model the few grocery chains that changed their acceptance policies during this period as being just on the margin of accepting credit cards.
```

**Proposed Revision:**
```
I treat these few grocery chains as marginal merchants: their decision to start accepting credit cards means they barely break even on acceptance costs.
```

**Why better:** Explicit. Explains what "marginal" means concretely for the reader.

---

### - [ ] Lines 66-67: "platforms tax the insensitive side and subsidize the sensitive side"

**Comment:** Jargony shorthand. "Tax" and "subsidize" are metaphors; say what actually happens.

**Original:**
```
Since platforms tax the insensitive side and subsidize the sensitive side, this fee structure implies merchants are fee-insensitive at current equilibrium fee levels, which disciplines the merchant distribution.
```

**Proposed Revision:**
```
Since platforms charge high fees to fee-insensitive merchants and use revenues to fund rewards for price-sensitive consumers, high merchant fees signal that merchants are fee-insensitive at equilibrium.
```

**Why better:** Concrete. No jargon. Explains the two-sided market logic plainly.

---

### - [ ] Lines 143-144: "match a wide range of untargeted moments. This shows the model reflects key features of the market."

**Comment:** "Reflect" is vague. Nominalization of "to show" → "This shows." Weak transition.

**Original:**
```
My estimates of consumer and merchant demand for payments match a wide range of untargeted moments.
This shows the model reflects key features of the market.
```

**Proposed Revision:**
```
My estimates match many untargeted moments, indicating the model captures key features of the payment market.
```

**Why better:** Shorter. "Captures" is more concrete than "reflects." One sentence instead of two.

---

### - [ ] Lines 148: "My model closely reproduces untargeted moments"

**Comment:** Weak verb "reproduces." Action is matching moments, so say that.

**Original:**
```
My model closely reproduces untargeted moments of consumer demand.
```

**Proposed Revision:**
```
My model accurately matches untargeted moments of consumer demand.
```

**Why better:** "Matches" is more precise and active. "Accurately" is more specific than "closely."

---

### - [ ] Lines 152-153: "The close match is not mechanical"

**Comment:** Awkward negation + weak adjective "mechanical." State what IS true.

**Original:**
```
The close match is not mechanical: I target spending shares, not the share of consumers who adopt each payment method.
```

**Proposed Revision:**
```
This match is not automatic: I target spending shares, not adoption shares, so matching adoption shares confirms the model's income correlation.
```

**Why better:** Active voice. Explains why it's not mechanical (I target one thing, get another), which proves the model works.

---

### - [ ] Lines 175: "Several sources of direct evidence"

**Comment:** Vague phrase "sources of direct evidence." Say what evidence you'll use.

**Original:**
```
My estimates of the merchant parameters are consistent with several sources of direct evidence on merchants' fee sensitivity and sales benefits from accepting payments.
```

**Proposed Revision:**
```
I validate my merchant parameter estimates against three types of evidence: AmEx's OptBlue fee cut, experimental studies of payment technology adoption, and aggregate retail margins.
```

**Why better:** Concrete list instead of vague "several sources." Sets up the three subsections that follow.

---

### - [ ] Lines 186-188: "For example...Higgins2022 shows...Berg.etal2024 use a randomized experiment...to show"

**Comment:** Nominalization + weak verb pattern ("shows that," "show that"). Parallel structure broken.

**Original:**
```
For example, \textcite{Higgins2022} shows that debit card adoption by corner stores increased sales to different groups of debit card consumers by $20-60\%$.
\textcite{Berg.etal2024} use a randomized experiment at a merchant to show that accepting Buy Now, Pay Later raises sales by around $20\%$.
```

**Proposed Revision:**
```
For example, \textcite{Higgins2022} find that debit card adoption at corner stores increases sales by $20-60\%$ across different consumer groups.
\textcite{Berg.etal2024} use a randomized experiment showing that accepting Buy Now, Pay Later raises sales by around $20\%$.
```

**Why better:** Parallel structure ("find...," "show that..."). Active voice. Removes wordiness ("to show that" → "showing").

---

### - [ ] Lines 191: "The close match shows that my model reasonably approximates"

**Comment:** "Reasonably approximates" is weak and vague. Say what the match demonstrates.

**Original:**
```
The close match shows that my model reasonably approximates firms' profitability in reality.
```

**Proposed Revision:**
```
This alignment confirms that my model captures real firm profitability.
```

**Why better:** Shorter and more direct. "Captures" is stronger than "approximates." "This alignment" avoids the weak "close match" + "shows."

---
## Deduplication Summary
- Items reviewed: 15
- Duplicates removed: 0
- File scope: word_choice_review.md covers appendix_model_oa.tex (0 items) and estimation.tex (15 items)
