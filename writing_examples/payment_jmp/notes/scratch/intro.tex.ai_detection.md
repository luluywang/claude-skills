## [intro.tex]

### Critical

### - [ ] Lines 26-35: Enumeration with "Three forces" + "First...Second...Third" structure `Critical`

**Comment:** Textbook AI enumeration pattern — signals LLM generation. "Three forces explain... First... Second... Third" is an extremely common LLM scaffolding device, rarely seen in human economic writing at this level.

**Original:**
```
Three forces explain why networks tax merchants to subsidize consumers.
First, consumer payment choices respond strongly to subsidies.
Networks charge merchants interchange fees and pay the revenue to banks, giving them incentives to promote the networks' cards through consumer rewards and other forms of steering.
A regulatory reduction in debit interchange fees --- the Durbin Amendment --- reduced debit card spending at regulated issuers by around 25\% relative to exempt issuers.
Second, accepting cards significantly increases merchant sales.
Event-study evidence shows that, for merchants on the margin of acceptance, beginning to accept credit cards raises sales from credit users by around \scalarpctinput{kilts_model_sales_event}\%.
Third, while almost all merchants accept every network's cards, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network (i.e., they ``single-home'').
Together, these facts produce a partial ``competitive bottleneck'' \parencite{Armstrong2006}: because enough consumers carry only one network's cards, merchants risk losing substantial sales by dropping a network, tilting competition toward rewards rather than fees.
```

**Proposed Revision:**
```
Networks tax merchants to subsidize consumers for three reasons.
Consumer payment choices respond strongly to subsidies: merchants promote networks' cards through consumer rewards to capture the interchange revenue paid by merchants.
A regulatory reduction in debit interchange fees --- the Durbin Amendment --- reduced debit card spending at regulated issuers by around 25\% relative to exempt issuers, demonstrating this sensitivity.
Accepting cards significantly increases merchant sales: event-study evidence shows merchants on the margin of acceptance raise credit card sales by around \scalarpctinput{kilts_model_sales_event}\%.
Yet while almost all merchants accept every network's cards, only around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network (i.e., they ``single-home'').
Because enough consumers single-home, merchants risk substantial sales losses from dropping a network, tilting competition toward rewards rather than fees.
```

**Why better:**
- Eliminates the "First... Second... Third" scaffolding entirely — moves forces into mechanism
- Converts isolated facts into causal flow ("for three reasons" followed by mechanisms)
- Tightens from 8 sentences to 5 sentences without losing substance
- Replaces announcement ("Together, these facts produce") with direct conclusion
- Reads like human argument-building, not enumeration template

---

### - [ ] Lines 43-45: Bare demonstratives with vague expansion `High`

**Comment:** Sentences 3-4 of the structural model setup use stacked bare pronouns ("A mix... which... who... which...") without clear noun anchors. This is a hallmark of LLM filler where the writer restates definitions instead of advancing argument.

**Original:**
```
A mix of single- and multi-homing consumers choose payment methods based on rewards, merchant acceptance, and exogenous non-price characteristics.
Merchants choose which cards to accept and set retail prices to maximize profits net of merchant fees.
```

**Proposed Revision:**
```
Consumers choose payment methods based on rewards and merchant acceptance; they mix single- and multi-homing across issuers.
Merchants choose which cards to accept and set prices to maximize profits net of merchant fees.
```

**Why better:**
- "Consumers mix single- and multi-homing" is stronger than "A mix of consumers single- and multi-home"
- Second sentence is strengthened by dropping the redundant "and set retail prices" clause that doesn't advance the model description
- Parallel structure is clearer: consumers choose methods, merchants choose acceptance

---

### High

### - [ ] Lines 54-59: "Revealed preference" construction + weak transition `High`

**Comment:** The opening "A revealed preference argument illustrates the inefficiency" is pure throat-clearing — it announces what the next paragraph will do rather than doing it. The paragraph that follows is substantive but the preface is LLM-filler language.

**Original:**
```
Credit card adoption is socially excessive because of price coherence.
Because merchants do not surcharge, each consumer who adopts a credit card raises retail prices for all other consumers.
Consumers individually face incentives to distort their payment choices to capture cross-subsidies, but collectively prefer lower credit card use.
A revealed preference argument illustrates the inefficiency.
Since credit cards pay rewards whereas cash and debit do not, the marginal user of credit cards must prefer the non-price characteristics of cash and debit.
```

**Proposed Revision:**
```
Credit card adoption is socially excessive because of price coherence.
Each consumer who adopts a credit card raises retail prices for all other consumers, yet consumers collectively prefer lower credit card use: they individually face incentives to distort payment choices to capture cross-subsidies.
The inefficiency is revealed in consumer revealed preference: marginal credit card users must prefer the non-price characteristics of cash and debit, since credit cards pay rewards while those alternatives do not.
```

**Why better:**
- Deletes "A revealed preference argument illustrates the inefficiency" — pure announcement
- Tightens the causal claim: the prisoner's dilemma is immediate, not a separate intellectual move
- Strengthens "Since credit cards pay rewards... must prefer cash/debit" by positioning it as direct evidence of the preference reversal
- Reduces from 5 sentences to 3 without losing substance

---

### Medium

### - [ ] Lines 13-23: Opening via negation "wrong diagnosis" without building tension first `Medium`

**Comment:** The opening "I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis" states the conclusion first. The tension (why would anyone think weak competition?) only emerges in the next sentence. A more human opening would establish what economists believed before revealing the puzzle.

**Original:**
```
I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.
Networks set rewards for consumers and fees for merchants.
The division of costs matters because merchants typically charge the same price for all payment methods, a phenomenon known as ``price coherence'' \parencite{Frankel1998, Stavins2018}.
```

**Proposed Revision:**
```
Merchant fees are indeed too high, yet the standard diagnosis --- weak competition --- is wrong.
The puzzle emerges from how networks set rewards for consumers and fees for merchants: the division of costs matters because merchants typically charge the same price for all payment methods, a phenomenon called ``price coherence''.
```

**Why better:**
- "yet the standard diagnosis is wrong" creates tension before resolution
- Drops announcement "I find" (Principle 8: no throat-clearing)
- Positions "Networks set rewards... fees for merchants" as the mechanism explaining why the diagnosis is wrong, rather than an isolated fact
- More concise and builds reader curiosity

---

### - [ ] Lines 77-82: Stacked hedges and "there is no trade-off" construction `Medium`

**Comment:** The passage "The gains from credit fee caps are also progressive. Reduced merchant fees pass through... whereas the reduction in rewards falls mostly on high-income consumers who are more likely to use credit cards." uses three hedging moves in sequence ("also," "mostly," "more likely") without clear mechanism connecting them. The concluding sentence "My results show that there is no trade-off" is weaker than the evidence warrants.

**Original:**
```
The gains from credit fee caps are also progressive.
Reduced merchant fees pass through to lower retail prices for all consumers, whereas the reduction in rewards falls mostly on high-income consumers who are more likely to use credit cards.
Consumer surplus rises by 48 bp of consumption for low-income consumers, compared to only 15 bp for high-income consumers.
My results show that there is no trade-off between equity and efficiency in regulating payment fees.
```

**Proposed Revision:**
```
The gains are progressive.
Reduced merchant fees lower retail prices for all consumers, but lost rewards hit high-income users harder — they use credit cards more.
Low-income consumers gain 48 bp of consumption against 15 bp for high-income consumers.
The cap achieves equity and efficiency simultaneously.
```

**Why better:**
- Cuts "also" (adds no information) and "mostly," "more likely" (hedges weaken the evidence unnecessarily when the numbers are provided)
- Removes "My results show that there is" — direct claim is stronger
- "The cap achieves equity and efficiency simultaneously" is more active and less hedge-laden than "there is no trade-off"
- Sharpens from 4 sentences to 3 without losing substance

---

### Low

### - [ ] Line 15: Footnote parenthetical on surcharging `Low`

**Comment:** The footnote opening "This occurs even though cash discounts and card surcharges are largely legal" uses "largely legal" which is a weak hedge. But the footnote is properly marginal, so this is a minor issue.

**Original:**
```
This occurs even though cash discounts and card surcharges are largely legal.
```

**Proposed Revision:**
```
This occurs despite the legality of cash discounts and card surcharges.
```

**Why better:** "Despite the legality" is more direct than "largely legal" — it acknowledges legal status without hedging

---

**Total AI Detection Flags: 5 (1 Critical, 1 High, 2 Medium, 1 Low)**
