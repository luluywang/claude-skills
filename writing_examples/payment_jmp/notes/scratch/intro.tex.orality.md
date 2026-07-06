## [intro.tex]

### Summary
- Total flags: 7 (High: 2, Medium: 5, Low: 0)
- Most common patterns: Pattern #1 (word repetition), Pattern #11 (mechanism mischaracterization), Pattern #3 (list ambiguity)

---

### Findings (document order)

### - [ ] Lines 4–7: Word repetition "fees... fees... fees" `Medium` `Pattern #1`

**Comment:** The opening paragraph repeats "fees" three times in quick succession (line 4: "profit margins," line 6: "earn profit margins," line 8: "merchants pay...in fees"). The ear catches this as repetition-heavy.

**Original:**
```
In the U.S., Visa and Mastercard (MC) process 80\% of card transactions and earn profit margins above 60\% \parencite{Visa2020}.
At the same time, merchants pay around \$120 billion in fees every year to accept cards \parencite{Nilson2020a}.
```

**Proposed Revision:**
```
In the U.S., Visa and Mastercard process 80\% of card transactions with profit margins above 60\%.
Merchants, meanwhile, pay around \$120 billion annually to accept cards.
```

**Why better:** Eliminates the "fees... fees" repetition by using "pay...to accept cards" instead of "pay fees"; varies sentence structure with "meanwhile" transition; tightens "every year" to "annually"

---

### - [ ] Lines 28–30: Embedded clause in list attachment (relative clause inside first item) `High` `Pattern #5`

**Comment:** The sentence "Networks charge merchants interchange fees and pay the revenue to banks, giving them incentives to promote the networks' cards through consumer rewards and other forms of steering." has an embedded clause ("interchange fees and pay the revenue to banks") that scrambles the list rhythm. The listener can't track whether the list is "charge... and pay..." or "charge..., giving incentives" — ambiguous attachment.

**Original:**
```
Networks charge merchants interchange fees and pay the revenue to banks, giving them incentives to promote the networks' cards through consumer rewards and other forms of steering.
```

**Proposed Revision:**
```
Networks charge merchants interchange fees that go to banks, which incentivizes bank promotion of cards through rewards and steering.
```

**Why better:** Restructures the sequence so the logic is: networks charge fees TO banks, which creates incentives. The "and pay the revenue" is compressed into "that go to" and "which incentivizes" is a clearer causal link than "giving them incentives to."

---

### - [ ] Lines 31–34: Stacked noun phrases and repetition "consumers... consumers... consumers" `Medium` `Pattern #1, #6`

**Comment:** Within lines 31–34, "consumers" appears four times and "cards" appears three times. Additionally, line 34 has a noun pile-up: "only one network's cards... they ``single-home''" where "single-home" is introduced in quotation marks but immediately referred to as "they single-home" — the dual use (noun and action) confuses the ear.

**Original:**
```
Second, accepting cards significantly increases merchant sales.
Event-study evidence shows that, for merchants on the margin of acceptance, beginning to accept credit cards raises sales from credit users by around \scalarpctinput{kilts_model_sales_event}\%.
Third, while almost all merchants accept every network's cards, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network (i.e., they ``single-home'').
```

**Proposed Revision:**
```
Card acceptance raises merchant sales: event-study evidence shows that merchants on the margin gain \scalarpctinput{kilts_model_sales_event}\% in sales when accepting credit.
Yet most merchants accept all networks while most consumers carry cards from only one.
```

**Why better:** Deletes repetition of "consumers," "cards," "accept" in close proximity; restructures "single-home" to a simpler statement ("consumers carry cards from only one network") avoiding the quotation-marked gerund; tightens narrative flow

---

### - [ ] Lines 35–36: Long preamble before main verb `Medium` `Pattern #9`

**Comment:** The sentence beginning "Together, these facts produce a partial ``competitive bottleneck''..." is 51 words with a long preamble. When read aloud, "Together, these facts produce" + multiple dependent clauses ("because enough consumers... merchants risk... tilting...") creates a breath-holding effect. The listener has to hold "Together, these facts produce" in mind through 20+ words before the main clause resolves.

**Original:**
```
Together, these facts produce a partial ``competitive bottleneck'' \parencite{Armstrong2006}: because enough consumers carry only one network's cards, merchants risk losing substantial sales by dropping a network, tilting competition toward rewards rather than fees.
```

**Proposed Revision:**
```
This generates a partial competitive bottleneck.
When enough consumers single-home, merchants cannot drop expensive networks without losing sales, so networks compete through rewards rather than fees.
```

**Why better:** Splits the 51-word sentence into two (7 + 20 words); names "bottleneck" directly without long preamble; "When enough consumers single-home" is more spoken and vivid than the explanation in the original; avoids breath-running-out effect

---

### - [ ] Lines 42–45: Bare "it" references and word-order ambiguity in model setup `Medium` `Pattern #10`

**Comment:** The paragraph describing the model structure uses stacked clauses that trip the ear: "A mix of single- and multi-homing consumers choose payment methods based on rewards, merchant acceptance, and exogenous non-price characteristics." When read aloud, "non-price characteristics" is so far from the main verb "choose" that the listener loses the clause structure. The sentence is grammatically correct but orally awkward.

**Original:**
```
A mix of single- and multi-homing consumers choose payment methods based on rewards, merchant acceptance, and exogenous non-price characteristics.
Merchants choose which cards to accept and set retail prices to maximize profits net of merchant fees.
Multiproduct networks maximize profits by setting fees and rewards, balancing merchant acceptance against consumer adoption.
```

**Proposed Revision:**
```
Consumers choose payment methods based on rewards, merchant acceptance, and non-price characteristics, mixing single- and multi-homing.
Merchants choose which cards to accept and set prices to maximize profits.
Networks maximize profits by setting fees and rewards, balancing adoption against acceptance.
```

**Why better:** "Consumers choose... mixing single- and multi-homing" is more conversational than "A mix of consumers choose..."; "Merchants... set prices" tightens "set retail prices"; "balancing adoption against acceptance" is clearer when spoken than "balancing merchant acceptance against consumer adoption"

---

### - [ ] Lines 54–59: Word repetition and weak pronoun reference "reward... reward... reward" + "they must prefer" `Medium` `Pattern #1, #10`

**Comment:** The phrase "Consumers individually face incentives to distort their payment choices to capture cross-subsidies, but collectively prefer lower credit card use" uses "prefer" but the subject shifts from "Consumers" to implied "they" across the coordinating clause. Additionally, "rewards" is repeated twice within two sentences (line 56: "High rewards reduce" and line 59: "credit cards pay rewards").

**Original:**
```
High rewards reduce consumers' non-price utility from payment choices, but the rewards themselves are merely transfers funded by higher retail prices.
```

**Proposed Revision:**
```
High rewards reduce the non-price appeal of payment methods, yet they are merely transfers funded by higher retail prices.
```

**Why better:** Reduces "rewards" repetition by using pronoun "they"; tightens "consumers' non-price utility from payment choices" to "non-price appeal of payment methods"

---

### - [ ] Lines 77–82: Stacked modifiers "The gains... are also progressive" + hedge language `Medium` `Pattern #1`

**Comment:** The opening "The gains from credit fee caps are also progressive" uses "also" which signals that a prior claim was already made — but this is the first mention of progressivity in this section. The word "also" confuses the ear about what it's adding to. Following lines use "mostly" and "more likely" which create stuttering hedges when read aloud.

**Original:**
```
The gains from credit fee caps are also progressive.
Reduced merchant fees pass through to lower retail prices for all consumers, whereas the reduction in rewards falls mostly on high-income consumers who are more likely to use credit cards.
```

**Proposed Revision:**
```
The gains are progressive.
Lower merchant fees benefit all consumers through cheaper retail prices, but lost rewards hit high-income users hardest — they use credit cards more.
```

**Why better:** Deletes "also" (no prior claim); changes "mostly... more likely" hedges to direct "hardest — they use"; "hit high-income users hardest" is more vivid when spoken than "falls mostly on high-income consumers"

---

### - [ ] Lines 101–102: Passive opening "These predictions align" + abstract noun "problem" `High` `Pattern #11`

**Comment:** The sentence "These predictions align with rising U.S. interchange fees despite increasing network competition" paraphrases the model's mechanism loosely. The ear receives "predictions align with fees rising" but the actual mechanism is that competition drives rewards, which drives fees — "alignment" understates the causal claim. Additionally, "The problem is not... but..." construction is abstract and requires the listener to parse a double negation.

**Original:**
```
These predictions align with rising U.S.\ interchange fees despite increasing network competition \parencite{GAO2009} and the global expansion of high-fee Buy Now, Pay Later products \parencite{Berg.etal2024}.
The problem is not market power stifling output but rewards competition generating excessive credit card adoption.
```

**Proposed Revision:**
```
The model explains real-world phenomena: U.S. interchange fees rose despite competition, and globally high-fee credit products expanded.
The cause is not market power but rewards competition driving excessive adoption.
```

**Why better:** "Explains" is more direct than "aligns with"; removes double-negative "The problem is not... but..." in favor of "The cause is"; simplifies the causal claim so the listener doesn't have to parse a negation first

---

**Total Orality Flags: 7 (High: 2, Medium: 5, Low: 0)**
