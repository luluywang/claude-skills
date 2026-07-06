# AI Detection Review

## [counterfactuals.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### High

- [ ] Lines 23–26: Artificial colon structure and template language in LLM block `[High]`

**Comment:** The opening colon ("I cap credit card merchant fees at 120 basis points: roughly half...") is dramatic and unnecessary. Also uses template structures ("At this level, the cap binds"; "A moderate cap keeps the counterfactual close") typical of AI prose.

**Original:**
```
In my main counterfactual, I cap credit card merchant fees at 120 basis points, roughly half their current level.
At this level, the cap binds for credit cards and AmEx but not for debit, where fees are already lower.
A moderate cap keeps the counterfactual close to observed fee levels, avoiding the large out-of-sample extrapolation required by more aggressive caps.
```

**Proposed Revision:**
```
I cap credit card merchant fees at 120 basis points, roughly half their current level. This cap binds for credit and AmEx but not for debit. A moderate cap avoids the large out-of-sample extrapolation required by more aggressive assumptions.
```

**Why better:** Removes artificial exposition ("At this level...the cap binds"; "A moderate cap keeps...") and tightens the argument. Direct statement is more authoritative than template-style explanation.

---

- [ ] Lines 31–44: Inventory-style numbers without causal explanations `[High]`

**Comment:** This section strings together numerical results (21 pp decline, 12 pp rise, 9 pp rise) as a sequence rather than embedding each number to answer "so what?" The numbers are presented as a list from a table rather than as evidence for claims about substitution. The final sentence attempts causal logic but numbers come first.

**Original:**
```
Lower credit rewards cause consumers to substitute from credit toward debit cards and cash.
Credit card market share declines by 21 percentage points,
% HARDCODED[table: cf_table_baseline.tex, row: "Credit", col: 1] current=-21
while debit share rises 12 percentage points
% HARDCODED[table: cf_table_baseline.tex, row: "Debit", col: 1] current=12
and cash share rises 9 percentage points.
% HARDCODED[table: cf_table_baseline.tex, row: "Cash", col: 1] current=9
Because the cap does not bind for debit, consumers redirect toward their preferred non-credit payment methods rather than abandoning cards entirely.
```

**Proposed Revision:**
```
Lower credit rewards cause consumers to substitute toward debit and cash. Credit card share drops 21 percentage points while debit rises 12 pp and cash rises 9 pp—a reallocation rather than abandonment, since the cap does not bind for debit and consumers have clear preferences for these alternatives.
```

**Why better:** Embeds numbers into the causal logic upfront. Explanation ("the cap does not bind...") precedes or accompanies numbers rather than following them. Tighter, more integrated prose.

---

- [ ] Lines 46–53: Results-first opening followed by table-caption structure `[High]`

**Comment:** Opens with outcome ("capping fees reduces..."), then backfills explanation. Numbers presented as a sequence (fees down 58 B, rewards down 57 B) without answering why they are nearly identical—which is surprising and interesting, but the section treats it as inventory data.

**Original:**
```
Lower card use reduces the total merchant fees paid in the economy and the total rewards paid out.
\textcite{Nilson2020a} finds that consumers spent around $10$ trillion in $2019$.
% CONSTANT: normalization from Nilson (2020a), not updated by pipeline
Given that total income is normalized to $1$ in the model, each basis point of spending in the model corresponds to \$$1$ billion in spending in reality.
With this normalization, I find that capping fees would reduce annual merchant fees and rewards by \$58
% HARDCODED[table: cf_table_baseline.tex, row: "Total Fees", col: 1] current=-58
and \$57 billion, respectively.
% HARDCODED[table: cf_table_baseline.tex, row: "Total Rewards", col: 1] current=-57
```

**Proposed Revision:**
```
Lower card use reduces both sides of the fee-reward loop. Using Nilson's \$10 trillion spending baseline, I find capping fees reduces merchant fees by \$58 billion and rewards by \$57 billion—a near-equal pass-through that reveals networks defend margins by slashing rewards rather than absorbing costs.
```

**Why better:** Integrates the normalization and numerical results into a single logical chain. Replaces inventory structure (first X, then Y, then Z) with causal connective ("because networks defend margins"). Highlights the interesting fact (near-equal reduction) upfront.

---

- [ ] Line 89: Artificial colon for drama `[High]`

**Comment:** The colon before the "closed loop" explanation is theatrical—it signals an impending revelation but the thought is straightforward. User flagged excessive colons.

**Original:**
```
At first glance, fee caps might seem to merely redistribute rather than raise total welfare.
Merchant fees flow to networks, which use them to fund rewards that flow back to consumers, while retail price competition returns the costs to shoppers: a closed loop.
```

**Proposed Revision:**
```
At first glance, fee caps might seem to merely redistribute rather than raise total welfare—merchant fees flow to networks, which fund rewards that return to consumers, while retail prices absorb the costs. But this loop breaks under close inspection.
```

**Why better:** Removes the dramatic colon. Em-dash is more natural for the "closed loop" aside. Moves to the counterargument quickly rather than dwelling on the setup.

---

- [ ] Line 173: AI vocabulary — "fundamentally different" `[High]`

**Comment:** "Payment markets are fundamentally different" is a filler phrase typical of AI prose. The claim that follows is not inherently "fundamental"—it's just a distinction that matters for the argument. The word appears once here but in context with other template language ("In standard markets, consumer choices drive efficient outcomes...").

**Original:**
```
In standard markets, consumer choices drive efficient outcomes because prices reflect production costs.
Payment markets are fundamentally different.
High rewards are funded not by efficient production but by rent extraction from merchants through high merchant fees.
```

**Proposed Revision:**
```
In standard markets, consumer choices drive efficient outcomes because prices reflect production costs. In payment markets, rewards come not from production but from rent extraction—high merchant fees that don't reflect actual network costs.
```

**Why better:** Removes "fundamentally different" and the template opening ("In standard markets..."). Direct contrast avoids unnecessary elevation.

---

### Medium

- [ ] Line 4: Weak quantifier — "roughly an order of magnitude" `[Medium]`

**Comment:** "Roughly" + approximation ("order of magnitude") stacks two hedges. If this is precise enough for the model, say so; if it's approximate, one hedge suffices.

**Original:**
```
The estimated model confirms the competitive bottleneck: consumers are roughly an order of magnitude more sensitive to rewards than merchants are to fees.
```

**Proposed Revision:**
```
The estimated model confirms the competitive bottleneck: consumers are approximately 10 times more sensitive to rewards than merchants are to fees.
```

**Why better:** Removes "roughly" and replaces the vague approximation with "approximately 10 times," which is clearer and avoids stacking hedges.

---

- [ ] Lines 76–85: LLM block with multiple hedges and template language `[Medium]`

**Comment:** The section uses hedging overload ("The fee cap benefits all income groups"; "even high-income consumers...experience a negligible 1.2 basis point loss, statistically indistinguishable from zero"). Also contains meta-commentary ("The outcome is near-Pareto") and padding phrase ("is too small...to impose meaningful losses").

**Original:**
```
The fee cap benefits all income groups.
Low-income consumers (log income at $-2$ SD) gain 44 basis points of consumption;
% HARDCODED[table: welfare_table_baseline.tex, row: "Low Income", col: 1] current=44
even high-income consumers (log income at $+2$ SD) experience a negligible 1.2 basis point loss, statistically indistinguishable from zero (standard error 3.1 basis points).
At an average level of household purchases of around \$$40,000$ in 2023, low-income households gain around \$\scalarinput{cap_credit_household_welfare_low_baseline} while high-income households are barely affected.
The outcome is near-Pareto: lower retail prices benefit all consumers, while the reduction in credit rewards is too small at 120 bps to impose meaningful losses on high-income cardholders.
```

**Proposed Revision:**
```
The fee cap benefits all income groups. Low-income consumers gain 44 basis points of consumption while high-income consumers experience a 1.2 basis point loss (SE 3.1 bp)—statistically zero. At average household spending of $40,000 in 2023, low-income households gain roughly $40 while high-income households are unaffected. This is nearly Pareto: retail price reductions help all, while higher-income cardholders lose only $4 in annual rewards.
```

**Why better:** Removes meta-commentary ("The outcome is near-Pareto:"), tightens hedges, and cuts padding ("is too small...to impose meaningful losses" → "lose only $4"). Concrete dollar figures replace vague hedges.

---

- [ ] Lines 141–144: Transition overuse and meta-commentary `[Medium]`

**Comment:** The paragraph opening with "Table~\ref{..." immediately launches into meta-description of what the table does ("decomposes the welfare effects...by sequentially walking through..."). This is table-caption style, not integration into the prose argument.

**Original:**
```
Table~\ref{tab:cap-credit-channel-decomp} decomposes the welfare effects of the fee cap by sequentially walking through three equilibrium adjustments.
In the first step (``Network Effect''), networks re-optimize their fees and rewards while merchant retail prices and acceptance decisions are held fixed at baseline.
In the second step (``Price Passthrough''), merchants re-optimize retail prices given the new network prices, with acceptance still frozen.
In the third step (``Merchant Adoption''), merchants adjust their acceptance decisions.
```

**Proposed Revision:**
```
To isolate each channel, I sequentially lock variables at baseline values. First, I fix merchant prices and acceptance while networks re-optimize (Network Effect). Next, I release merchant prices but hold acceptance (Price Passthrough). Finally, merchants adjust acceptance (Merchant Adoption).
```

**Why better:** Removes the table-caption framing ("Table decomposes...by walking through") and meta-description ("In the first step, in the second step"). Direct procedural language is more active.

---

- [ ] Line 181: "Fundamental tension" — AI vocabulary flag `[Medium]`

**Comment:** "Fundamental tension" is inflated rhetoric. The tension is real but doesn't need the adjective "fundamental."

**Original:**
```
This reveals a fundamental tension: rewards pull consumers toward credit cards despite preferring debit.
```

**Proposed Revision:**
```
Rewards pull consumers toward credit cards despite preferring debit—a key tension in the market design.
```

**Why better:** Removes "fundamental" and "reveals a...tension:" structure (colon for drama). Embeds the contrast directly.

---

- [ ] Lines 207–209: LLM block with hedging and padding `[Medium]`

**Comment:** Uses multiple hedges ("well below"; "would further increase") and contains the padding phrase "are not inherently harmful" (unnecessary softening for obvious statement).

**Original:**
```
Credit cards are not inherently harmful.
The social optimum (Appendix~\ref{subsec:oa-optimal-prices}) sets credit merchant fees at 26 basis points---well below the 120 basis point cap---reflecting that some fee reduction beyond 120 basis points would further increase welfare.
A cost-of-cash cap at \scalarinput{param_est_cashcost_pass_baseline} basis points delivers \$29 billion in welfare gains, roughly 7\% more than the moderate cap.
```

**Proposed Revision:**
```
The social optimum sets credit fees at 26 bp—well below the 120 bp cap. A cost-of-cash cap at [X] bp delivers \$29 billion in gains, roughly 7% more. Credit cards are thus a tool, not an evil; the issue is their pricing under competition.
```

**Why better:** Leads with the evidence (optimum, cost-of-cash), then states the conclusion. Removes the defensive "are not inherently harmful" opener. Cuts "would further increase welfare" (obvious from "optimum").

---

### Low

- [ ] Line 5: Minor hedging — "show that" `[Low]`

**Comment:** Weak epistemic marker. The model does show this, so "establish" or "demonstrate" are stronger.

**Original:**
```
In this section, I use the estimated model to show that the resulting fees and rewards are too high.
```

**Proposed Revision:**
```
In this section, I use the estimated model to demonstrate that the resulting fees and rewards are too high.
```

**Why better:** "Demonstrate" is more assertive and appropriate for a structural model result.

---

- [ ] Line 12: Minor hedging — "can adjust" `[Low]`

**Comment:** "Can adjust" is softer than "adjust" in an equilibrium context where adjustment is endogenous.

**Original:**
```
Consumer adoption, merchant acceptance, retail prices, and network prices can adjust.
```

**Proposed Revision:**
```
Consumer adoption, merchant acceptance, retail prices, and network prices adjust endogenously.
```

**Why better:** More precise. "Can adjust" suggests optionality; "adjust" is the model's outcome.

---

- [ ] Lines 46–53: Normalization exposition (meta-commentary) `[Low]`

**Comment:** The extended explanation of the normalization ("Given that total income is normalized to $1$...") is necessary but presented as separate meta-step rather than integrated into the result. Not critical but reads like a tutorial.

**Original:**
```
\textcite{Nilson2020a} finds that consumers spent around $10$ trillion in $2019$.
% CONSTANT: normalization from Nilson (2020a), not updated by pipeline
Given that total income is normalized to $1$ in the model, each basis point of spending in the model corresponds to \$$1$ billion in spending in reality.
With this normalization, I find that capping fees would reduce annual merchant fees and rewards by \$58
```

**Proposed Revision:**
```
Using Nilson's \$10 trillion spending baseline as the normalization, capping fees reduces annual merchant fees by \$58 billion and rewards by \$57 billion.
```

**Why better:** Embed the normalization fact into the result statement. Removes "Given that...each basis point..." step-by-step exposition.

---

- [ ] Line 261: Minor inventory structure — "Thus, low-income..." `[Low]`

**Comment:** Short inventory of distributional effects without integration: "low-income consumers experience X, whereas high-income consumers experience Y." Not severe but slightly list-like.

**Original:**
```
Reducing credit card use lowers retail prices for all consumers, whereas reducing rewards mainly affects high-income consumers.
Thus, low-income consumers experience a 4.6 bp increase in consumption,
% HARDCODED[table: welfare_table_baseline.tex, row: "Low Income", col: 6] current=4.6
whereas high-income consumers experience a 46 bp loss.
```

**Proposed Revision:**
```
Reducing credit card use lowers retail prices for all, while cutting rewards harms high-income cardholders. Low-income consumers gain 4.6 bp in consumption; high-income consumers lose 46 bp—a regressive collapse of rewards benefits.
```

**Why better:** Reorders the logic (constraint then outcome) and replaces "Thus...whereas..." with causal connective ("a regressive collapse"). More narrative flow.

---
