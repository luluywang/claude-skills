# Orality Check

## [main.tex]

### Summary
- Total flags: 0

### Assessment
The prose sections read smoothly when spoken aloud. No word repetitions, ambiguous parallelism, or embedded clauses that break list rhythm detected. The abstract achieves clear, direct language throughout. All pronouns anchor well, list structure is unambiguous, and sentence pacing supports understanding.

No issues found.

---

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

---

## [institutional_details.tex]

### Summary
- Total flags: 0 (High: 0, Medium: 0, Low: 0)
- Assessment: All prose reads smoothly when spoken aloud

No issues found.

---

## [data.tex]

### Summary

- **Total flags:** 1 (High: 0, Medium: 1, Low: 0)
- **Most common pattern:** Pattern #6 (noun pile-ups)

---

### Findings (document order)

#### - [ ] Lines 59–62: Noun phrase complexity with embedded qualifier `[Medium]` `[Pattern #6]`

**Comment:** The phrase "the exception that AmEx is underrepresented (about 4\% versus 10\% in aggregate Nilson data)" requires the listener to hold "the exception" as subject while processing a parenthetical comparison, then loop back to understand what AmEx is compared against. The parenthetical breaks parallel tracking.

**Original:**
```
The Homescan sample is broadly representative, with the exception that AmEx is underrepresented (about 4\% versus 10\% in aggregate Nilson data) because Homescan excludes sectors like travel where AmEx is more dominant.
```

**Proposed Revision:**
```
The Homescan sample is broadly representative except for AmEx. Homescan underrepresents AmEx at 4\% versus 10\% in aggregate data, primarily because it excludes sectors like travel where AmEx dominates.
```

**Why better:**
- "except for AmEx" removes the noun-stack impedance created by "the exception that AmEx is underrepresented"
- Second sentence delivers the comparison (4\% vs 10\%) without a parenthetical interruption
- "primarily because" clarifies causality without suspending the main clause
- The ear follows the logic without backtracking

---

### Overall Assessment

The document reads smoothly when spoken aloud. Sentence rhythm is natural, with no stumbles, breath-breaking patterns, or ambiguous list structures. The single flagged passage is a medium-severity orality issue (noun-stack readability); all other sections are clear and well-paced.

---

# Orality Check (Read-Aloud Pass)

## [reducedform.tex]

### Summary
- Total flags: 0
- Most common pattern: N/A

### Findings (document order)

No issues found. The text reads clearly when spoken aloud. Sentence structures are natural, list parallelism is clean, and pronouns are well-anchored. No stammering, noun pile-ups, or false analogies detected.


---

## [model.tex]

### Summary
- Total flags: 9 (High: 0, Medium: 3, Low: 6)
- Most common pattern: Pattern 1 (word repetition) and Pattern 10 (ambiguous pronouns)

### Findings (document order)

### - [ ] Lines 81, 176: "percentage, lump-sum rewards" `Medium` `Pattern 3 (Ambiguous list parallelism variant)`

**Comment:** The comma creates parsing ambiguity. The ear doesn't know if "percentage" is an adjective modifying "lump-sum rewards" or a separate noun category. Repeated twice makes it a moderate issue.

**Original:**
```
where $f^j$ represents percentage, lump-sum rewards
```

**Proposed Revision:**
```
where $f^j$ represents rewards that are percentage-based and lump-sum
```

**Why better:** Eliminates the comma ambiguity and clarifies the structure: rewards are both percentage-based (tied to transaction amounts) and lump-sum (fixed baseline components). The ear tracks "percentage-based AND lump-sum" clearly.

---

### - [ ] Lines 147-149: Repetition in fee/sales benefit explanation `Medium` `Pattern 1 (Word repetition) + mixed voice`

**Comment:** "all consumers who use it" in line 147 and "all consumers who use the card" in line 148 create a stutter. Additionally, "covers" vs. "is driven" shift agency awkwardly.

**Original:**
```
Adding a more expensive card incurs fees from all consumers who use it but raises sales only among single-homers. The incremental fee cost $a_M$ covers all consumers who use the card, whereas the incremental sales benefit $b_M$ is driven only by single-homers who cannot substitute.
```

**Proposed Revision:**
```
Adding a more expensive card incurs fees from all consumers who use it but raises sales only among single-homers. The fee cost $a_M$ includes all users; the sales benefit $b_M$ comes only from single-homers who cannot substitute.
```

**Why better:** Eliminates "all consumers who" repetition. Active voice throughout ("includes," "comes") instead of mixed passive/active. Shorter, punchier.

---

### - [ ] Line 251: Repetition of "use $j$" `Low` `Pattern 1 (Word repetition)`

**Comment:** The phrase "multi-homers who use $j$" appears with "use $j$" three times in one sentence ("single-homers on $j$", "primarily use $j$", "use $j$ as a secondary"). The ear catches the repetition.

**Original:**
```
The three terms count single-homers on $j$, multi-homers who primarily use $j$, and multi-homers who use $j$ as a secondary card.
```

**Proposed Revision:**
```
The three terms count single-homers on $j$, multi-homers who primarily prefer it, and multi-homers who hold it as a secondary.
```

**Why better:** Introduces synonyms ("prefer," "hold") to break the repetition of "use" while maintaining semantic clarity. The ear no longer stumbles on the repeated phrase.

---

### - [ ] Line 263: Pronoun ambiguity in "their own acceptance" `Medium` `Pattern 10 (Ambiguous pronouns)`

**Comment:** "networks set consumers' expectations of their own acceptance" — the ear momentarily uncertain whether "their" refers to consumers or networks. Requires backtrack.

**Original:**
```
Equivalently, networks set consumers' expectations of their own acceptance, fees, and rewards given expectations for rival networks.
```

**Proposed Revision:**
```
Equivalently, networks set consumers' expectations about network acceptance, fees, and rewards, given expectations for rivals.
```

**Why better:** Removes the ambiguous possessive "their." "Network acceptance" is explicit and avoids pronoun confusion. Cleaner on the ear.

---

### - [ ] Line 282: Extremely long equilibrium definition sentence `Medium` `Pattern 9 (Long preamble before main verb)`

**Comment:** This 52-word sentence about the equilibrium tuple is breath-heavy and uses semicolons to list multiple conditions, making it read like a dense enumeration rather than a definition.

**Original:**
```
An equilibrium is a tuple $\left(\tau^{*}, A^{*}, \tilde{\mu}^w_y, p^{*}\left(\gamma\right), M^{*}\left(\gamma\right), q^{w*}\left(\gamma\right)\right)$ satisfying: consumption is optimal (\ref{eq:optimal-consumption}); merchant pricing and acceptance maximize profits (\ref{eq:pricing-eqm}, \ref{eq:adoption-eqm}); consumers choose optimal wallets (\ref{eq:person-market-share}); and networks maximize profits (\ref{eq:network-conduct-argmax}).
```

**Proposed Revision:**
```
An equilibrium is a tuple $\left(\tau^{*}, A^{*}, \tilde{\mu}^w_y, p^{*}\left(\gamma\right), M^{*}\left(\gamma\right), q^{w*}\left(\gamma\right)\right)$ satisfying the following conditions: consumption is optimal per Eq. \ref{eq:optimal-consumption}; merchant pricing and acceptance maximize profits per Eqs. \ref{eq:pricing-eqm} and \ref{eq:adoption-eqm}; consumers choose optimal wallets per Eq. \ref{eq:person-market-share}; networks maximize profits per Eq. \ref{eq:network-conduct-argmax}.
```

**Why better:** "The following conditions" signals a list structure, helping the ear prepare. Replacing parenthetical equation references with "per Eq." shorthand keeps the ear moving without the breath-breaking.

---

### - [ ] Line 298: Ambiguous pronoun "it" `Low` `Pattern 10 (Ambiguous pronouns)`

**Comment:** "Antitrust testimony and consumer surveys support it" — the ear is momentarily unsure whether "it" refers to segmentation or to some other concept. Context resolves it but requires backtrack.

**Original:**
```
Antitrust testimony and consumer surveys support it, but Discover's rewards experiment shows some substitution at the margin (Appendix~\ref{subsec:oa-discover-rewards}).
```

**Proposed Revision:**
```
Antitrust testimony and consumer surveys support segmentation, but Discover's rewards experiment shows some substitution at the margin (Appendix~\ref{subsec:oa-discover-rewards}).
```

**Why better:** Names the referent explicitly ("segmentation") instead of relying on "it." The ear tracks the claim without backtracking.

---

### - [ ] Line 300: Ambiguous phrase "contradicts the first" `Low` `Pattern 10 (Ambiguous pronouns/referents)`

**Comment:** "Antitrust testimony in Ohio v. AmEx contradicts the first" — the ear doesn't know what "the first" refers to (the first observation? the first testimony? the first claim from the previous sentence?). Requires context-hunting.

**Original:**
```
Antitrust testimony in \emph{Ohio v.\ AmEx} contradicts the first, and Durbin halved debit interchange without moving credit interchange.
```

**Proposed Revision:**
```
But antitrust testimony in \emph{Ohio v.\ AmEx} contradicts this first claim: credit acceptance depends on credit-debit multi-homing rates.
```

**Why better:** Explicitly names what the testimony contradicts. "But" signals contrast. The ear knows exactly which claim is being disputed.

---

### - [ ] Line 323: Repeated "card" in compound terms `Low` `Pattern 1 (Word repetition)`

**Comment:** "card networks at all card-accepting stores" — "card" appears twice in quick succession as part of different compounds. Minor ear stumble.

**Original:**
```
This one-dimensional type rationalizes hierarchical acceptance but predicts identical relative shares among accepted card networks at all card-accepting stores.
```

**Proposed Revision:**
```
This one-dimensional type rationalizes hierarchical acceptance but predicts identical relative shares across networks at all stores accepting cards.
```

**Why better:** Eliminates the "card networks...card-accepting" repetition. "Networks...stores accepting cards" reads more smoothly.

---

### - [ ] Line 340: Repeated "card" in "card acceptance...card payments" `Low` `Pattern 1 (Word repetition)`

**Comment:** "Merchants with the strongest gains from card acceptance are those whose consumers value card payments" — "card" repeated in "card acceptance" and "card payments" in close proximity. Slight ear stumble.

**Original:**
```
Merchants with the strongest gains from card acceptance are those whose consumers value card payments highly and respond little to surcharges, so even small menu costs deter surcharging.
```

**Proposed Revision:**
```
Merchants who gain most from accepting cards are those whose customers value card use highly and resist surcharges, so even small menu costs deter surcharging.
```

**Why better:** Replaces first "card acceptance" with "accepting cards," eliminating the noun-phrase repetition. "Card use" is varied from "card payments." The ear hears smooth variation.

---

**Total flags found: 9. None are critical. All are Medium or Low and represent either minor repetitions or mild ambiguities that context resolves, but that benefit from clarification for read-aloud fluency.**

---

## [estimation.tex]

### Summary
- Total flags: 3 (High: 0, Medium: 3, Low: 0)
- Most common patterns: Pattern #1 (word repetition), Pattern #3 (list parallelism)
- Overall orality quality: Good. The prose reads smoothly when spoken. No major stumbles.

### Findings (document order)

### - [ ] Lines 71-78: "merchant" repetition and list parallelism `[Medium]` `[Pattern #1, #3]`

**Comment:** The word "merchant" appears 5 times in 8 lines (71, 72, 76, 78, and implied in 77), creating a stuttering effect when read aloud. Additionally, lines 71-72 use embedded relative clauses in a list that should be flattened for ear-clarity.

**Original:**
```
I recover the distribution of merchant types $G$ by combining three inputs: event-study evidence on grocery chains' credit card adoption from the Homescan panel, acceptance rates from the DCPC, and networks' optimal pricing conditions.
U.S.\ payment markets are mature. In 2013, 98\% of Homescan trips occurred at stores already accepting credit cards, so recovering the merchant-type distribution is closer to a calibration than a conventional estimation.
I model grocery chains that changed their acceptance policies during this period as the lowest-type merchant that accepts credit cards. Under the baseline substitution assumption, such merchants trade-off $\gamma^*$\% more sales to credit card consumers against the cost of paying additional merchant fees of $\tau$ instead of the cost of cash.
```

**Proposed Revision:**
```
I recover the distribution of merchant types $G$ by combining three inputs: event-study evidence on grocery chains' card adoption from the Homescan panel, acceptance rates from the DCPC, and networks' optimal pricing conditions.
U.S.\ payment markets are mature. In 2013, 98\% of Homescan trips occurred at stores already accepting credit cards, so this recovery is closer to calibration than conventional estimation.
I model grocery chains that changed their acceptance policies as the lowest type willing to accept cards. Under the baseline substitution assumption, these firms trade-off $\gamma^*$\% more sales from credit users against additional card fees of $\tau$ instead of the cash cost.
```

**Why better:**
- Reduces "merchant" from 5 instances to 2 (lines 71, 73 only) — eliminates the stutter
- Changes "accepting credit cards" to "accept cards" where context is clear (listener already tracking the domain)
- "recovering the merchant-type distribution is closer to a calibration" becomes "this recovery is closer to calibration" — listener-friendly pronoun anchors and noun reduction
- "such merchants trade-off X against the cost of paying additional merchant fees" becomes "these firms trade-off X from credit users against additional card fees" — removes redundant "cost" and avoids two instances of "merchant" in one phrase

---

### - [ ] Lines 156-164: "credit aversion" and "non-pecuniary cost" repetition `[Medium]` `[Pattern #1]`

**Comment:** These two phrases appear 4-5 times in 9 lines (aversion: 157, 159, 162; non-pecuniary: 159, 160, 162, 163), creating repetitive rhythm when spoken.

**Original:**
```
The parameters reveal substantial consumer ``credit aversion.''
The median consumer would pay with debit if credit cards did not pay rewards.
A consumer with median income is indifferent between a Visa debit card and a Visa credit card paying \scalarinput{param_est_credit_penalty_pass_baseline}\% in rewards.\footnote{This is the difference in non-pecuniary utility between single-homing on Visa debit versus Visa credit, scaled by the primary-card weight $\omega$.}
The model estimates a large non-pecuniary cost of credit card use, consistent with survey evidence that consumers who avoid credit cards cite budget control, distaste for carrying debt, and the hassle of managing revolving accounts (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
This credit aversion is central to the welfare analysis.
Rewards competition induces consumers to use credit cards despite these non-pecuniary costs.
Reductions in credit card use raise welfare by eliminating this distortion.
```

**Proposed Revision:**
```
The parameters reveal substantial ``credit aversion'' — a non-pecuniary cost that consumers incur when using credit.
The median consumer would pay with debit if credit cards did not pay rewards.
A consumer with median income is indifferent between a Visa debit card and a Visa credit card paying \scalarinput{param_est_credit_penalty_pass_baseline}\% in rewards.\footnote{This is the difference in non-pecuniary utility between single-homing on Visa debit versus Visa credit, scaled by the primary-card weight $\omega$.}
This cost is large, consistent with survey evidence that consumers who avoid credit cards cite budget control, distaste for carrying debt, and the hassle of managing revolving accounts (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
This distortion is central to welfare analysis.
Rewards competition induces consumers to use credit cards despite the cost.
Reducing credit card use raises welfare by eliminating this distortion.
```

**Why better:**
- Establishes "credit aversion" as the label upfront, then uses synonyms and pronouns (the cost, the distortion) to avoid repetition
- Listener hears the concept defined once, then can track the argument through pronouns and synonyms
- Reduces "credit aversion" from 3 occurrences to 1; "non-pecuniary cost" from 3 to 1
- Eliminates "Reductions in" nominalization → "Reducing" gerund (listener-friendly structure)
- The footnote remains unchanged since it's not spoken aloud

---

### - [ ] Lines 84-87: "merchants" list with embedded parenthetical `[Medium]` `[Pattern #3]`

**Comment:** Lines 84-87 have an embedded parenthetical in the first item of a list, which breaks parallel tracking for the ear. The listener has to hold "(which depend on...)" in working memory while processing the rest of the sentence.

**Original:**
```
Two moments identify its shape: the expenditure-weighted acceptance rate from DCPC respondents, and networks' first-order conditions on merchant fees (which depend on the density near the marginal type).\footnote{...}
```

**Proposed Revision:**
```
Two moments identify its shape: the expenditure-weighted acceptance rate from DCPC respondents, and networks' first-order conditions on fees near the marginal merchant type.\footnote{...}
```

**Why better:**
- Removes the embedded clause "(which depend on the density...)" — that explanation is technical detail
- Listener hears a clean parallel list: rate, conditions
- Replaces parenthetical with a noun phrase: "fees near the marginal merchant type" — keeps the idea without breaking rhythm
- Shorter and easier to follow aloud

---

### Overall Orality Assessment

Estimation.tex reads well aloud. The three flags above are refinements, not essential fixes. The prose has:
- Clear subject-verb-object order (sentences don't require backtracking)
- Mostly short pronouns and common word order (no garden paths)
- Technical density appropriate to audience (no oversimplification)
- Good pacing overall (one weak point in intro; otherwise varied)

Recommend the three revisions as polish, especially for seminars or oral presentations.

---

# Orality Check (Read-Aloud Pass)

## [counterfactuals.tex]

### Summary
- Total flags: 0
- Most common pattern: N/A

### Findings
No orality issues detected. The prose reads smoothly when spoken aloud. Sentence rhythms are varied, word repetitions are not excessive, list parallelism is clear, pronouns are well-anchored, and no false analogies or ambiguous constructions were identified during read-aloud review.

---

## [conclusion.tex]

### Summary
- Total flags: 2 (High: 0, Medium: 2, Low: 0)
- Most common pattern: Pattern 6 (Noun pile-ups) and Pattern 7 (Long preamble)

---

### Findings (document order)

### - [ ] Lines 23-24: Noun pile-up with "aggregate merchant costs" and relative clause `Medium` `Pattern 6`

**Comment:** The phrase "aggregate merchant costs fall because the monopolist has no rival to outbid for cardholders" builds a complex noun phrase ("aggregate merchant costs") followed by a long causal clause. The ear holds "aggregate merchant" as modifiers and then must process "costs" + "fall because the monopolist..." — the cascade of nouns before the verb landing makes this stumble-prone.

**Original:**
```
Yet aggregate merchant costs fall because the monopolist has no rival to outbid for cardholders, so it cuts rewards and credit use declines.
```

**Proposed Revision:**
```
Yet the monopolist cuts rewards because it has no rival to outbid for cardholders. As a result, aggregate merchant costs fall and credit use declines.
```

**Why better:** The ear now hears: (1) the cause (monopolist cuts rewards—no rivals to compete with), then (2) the consequence (costs fall, usage declines). Subject-verb arrives faster; the noun modifiers attach to a clearer main clause.

---

### - [ ] Lines 5-7: Long preamble before main verb in opening sentence `Medium` `Pattern 9`

**Comment:** The opening sentence spans 26 words before the main verb "ensure" appears. The structure is "Because consumers... networks compete... Price coherence ensures..." — the relative clause "Because consumers are far more sensitive..." builds suspense for 11 words before the listener knows what will happen. Not awkward, but on the edge of working memory capacity for oral delivery.

**Original:**
```
Rising credit card use and rising merchant costs both follow from intense network competition channeled toward the wrong side of the market.
Because consumers are far more sensitive to rewards than merchants are to fees, networks compete for cardholders with generous rewards funded by merchant fees.
Price coherence ensures that these fees pass through to higher retail prices borne by all consumers, including those who pay with cash and debit. 
The rewards draw more consumers to credit cards, increasing merchants' costs.
```

**Proposed Revision:**
```
Intense network competition targeted at the wrong side of the market — consumers rather than merchants — drives both rising credit card use and rising merchant costs.
Networks compete for cardholders with generous rewards because consumers care more about rewards than merchants care about fees.
These rewards pass through to retail prices (which all customers pay, whether they use cards or not) and pull more consumers toward credit cards, raising merchant costs.
```

**Why better:** The opening now leads with the key tension (wrong side of the market) and uses shorter, punchier subject-verb-object structures. The listener tracks: (1) competition targets consumers, (2) networks reward them, (3) rewards inflate prices for all, (4) this raises costs. No long causal preambles; the verb arrives faster in each sentence.

---

**No additional orality issues found. The document reads smoothly aloud overall.**

---

## [appendix_data.tex]

### Summary
- Total flags: 0 (High: 0, Medium: 0, Low: 0)

No orality issues detected. The text reads naturally when spoken aloud:
- No word repetitions in close proximity causing stuttering
- No verbatim sentence repetition within sections
- No ambiguous list parallelism
- No words landing as the opposite of their intended meaning
- No embedded clauses breaking list rhythm
- No noun pile-ups forcing the ear to hold unwindable stacks
- No long preambles before main verbs exceeding comfortable memory
- All pronouns and demonstratives are properly anchored within proximal range
- All technical jargon and numbers are clear in context

The prose is clean and navigable from a read-aloud perspective.

---

## [appendix_model.tex]

### Summary
- Total flags: 0
- File is primarily mathematical specification with minimal prose
- No orality issues detected

### Assessment
This appendix is dominated by mathematical derivations and equations. The limited prose passages are technical specifications that read clearly when spoken aloud. No word repetitions, ambiguous parallelism, embedded clause issues, or other orality patterns detected.

---

## [appendix_estimation.tex]

### Summary
No orality issues found.

The prose reads smoothly when spoken aloud. No stumbles, breath-run-on, ambiguities, repetitions, or noun pile-ups that would trip the ear.

### Read-Aloud Assessment

- **Word repetition:** None flagged. Technical terms like "network," "share," "matched" are used as needed without stuttering.
- **Sentence repetition:** None across paragraphs.
- **List parallelism:** All lists (e.g., the six-item list in the Multi-homing paragraph) maintain clean parallel structure.
- **Ambiguous attachment:** No dangling modifiers or unclear clause attachments.
- **Embedded clauses in lists:** All properly placed; no rhythm disruption.
- **Noun pile-ups:** Technical phrases are well-formed (e.g., "random coefficients," "first-order condition").
- **Long preamble before verb:** None exceed 12 words to suspension.
- **Pronouns and demonstratives:** All anchor clearly and locally.

### Verdict
Pass. This section is ready for oral presentation.

---

# Orality Check

## [appendix_tables.tex]

### Summary
- Total flags: 0 (High: 0, Medium: 0, Low: 0)
- No orality issues detected

### Findings

No issues found.

The file contains minimal prose, and all sentences read naturally when spoken aloud. The brief tablenotes and captions are direct and clear:
- No word repetition stutters
- No ambiguous list parallelism
- No noun pile-ups or complex embeddings
- No long preambles before main verbs
- No ambiguous pronouns

Technical description prose (e.g., methodological notes) is appropriately structured for clarity both silently and orally.

**Status:** Complete — no orality concerns identified

---

## [appendix_figures.tex]

### Summary
- Total flags: 0
- Most common pattern: N/A

### Findings

Orality pass complete. File contains four table notes read aloud. All prose passes clear without stumbles, ambiguities, or repetition.

**Pass 1 — Inventory:** Read all prose aloud. No word repetitions, ambiguous list parallelism, embedded clause breaks, noun pile-ups, or pronoun anchoring issues detected.

**Pass 2 — Analysis:**
- No content word repeated within 15 words of itself.
- No verbatim sentence repetition across notes.
- All lists maintain clear parallel structure (e.g., "Gold, Rewards, Basic" parallel fragments; "credit, debit, and cash" parallel nouns).
- No embedded clauses that break rhythm.
- All sentences under ~25 words deliver single ideas clearly.
- Pronouns "it" (line 42, "marks perfect fit") have immediate antecedent.

Prose is data-driven and technical—function over elaboration. Clarity is high.

**No revisions needed.**

---

## [appendix_data_oa.tex]

### Summary
- Total flags: 0
- Orality assessment: No issues

### Findings

No issues found. The prose reads smoothly when spoken aloud. Word choices are clear, pronouns are well-anchored, lists maintain parallel structure, and sentence rhythm supports spoken delivery. No stammering repetitions, ambiguous references, or embedded clauses that disrupt the listener's tracking.

---

## [appendix_reduced.tex]

### Summary

Total flags: 2 (High: 0, Medium: 2, Low: 0)

The appendix reads clearly when spoken aloud with minimal stumbles. The writing is direct, parallelism is sound, and ambiguous references are rare. Two minor issues flagged for polish.

---

### Findings (Document Order)

### - [ ] Lines 54-55: Demonstrative pronoun clarity `[Medium]` `[Pattern #10]`

**Comment:** "Only 15 paid debit rewards before Durbin. Of these, 7 ended rewards after Durbin while 8 continued."

The pronoun "these" refers back to the 15 institutions, which requires the listener to hold that number in working memory across a sentence break. Acceptable on the page but trips the ear slightly when read aloud because the specific referent isn't reinforced.

**Original:**
```
Of the \scalarinput{nilson_num.tex} institutions in my baseline panel, only 15 paid debit rewards before Durbin.
% CONSTANT: 15 institutions paid debit rewards pre-Durbin, from internet scraping of bank reward programs
Of these, 7 ended rewards after Durbin
% CONSTANT: 7 institutions ended debit rewards post-Durbin, from internet scraping of bank reward programs
while 8 continued.
```

**Proposed Revision:**
```
Of the \scalarinput{nilson_num.tex} institutions in my baseline panel, only 15 paid debit rewards before Durbin.
% CONSTANT: 15 institutions paid debit rewards pre-Durbin, from internet scraping of bank reward programs
Among these 15 institutions, 7 ended rewards after Durbin
% CONSTANT: 7 institutions ended debit rewards post-Durbin, from internet scraping of bank reward programs
while 8 continued.
```

**Why better:** Explicitly restating "15 institutions" as "these 15 institutions" reinforces the antecedent for the listener, preventing the need to backtrack mentally. The ear now anchors "7 ended" and "8 continued" to a concrete set.

---

### - [ ] Lines 383-393: Repetition of "multi-homing" and related terms `[Medium]` `[Pattern #1]`

**Comment:** The section heading, opening sentence, and surrounding text repeat "multi-homing" 5 times within ~80 words. While each instance is technically distinct, the repetition creates a stutter-like effect in spoken delivery.

**Original:**
```
\subsection{Hierarchical Card Acceptance}
\label{subsec:oa-yelp-card-acceptance}

In the main text, I show that the number of merchants that accepts AmEx is similar to the number of merchants that accepts Visa. 
However, aggregate acceptance counts alone cannot prove that merchants multi-home.
This section uses Yelp reviews to show that when AmEx and Visa charged different fees, acceptance patterns were hierarchical.
Merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network at the expense of another.
This provides evidence of the multi-homing fact.

I collect roughly 3,000 Yelp reviews that mention at least two payment methods by name (see Online Appendix \ref{subsec:appendix-yelp-data} for details on the sample construction).
% CONSTANT: count of Yelp reviews, from dataset
The reviews come primarily from the period 2010--2018, before AmEx's acceptance gap with Visa had fully closed, so they capture merchant acceptance decisions during a period of meaningful variation across networks.

Figure \ref{fig:merchant-multihoming} shows a clear hierarchy in which payment methods co-occur in reviews.
```

**Proposed Revision:**
```
\subsection{Hierarchical Card Acceptance}
\label{subsec:oa-yelp-card-acceptance}

In the main text, I show that the number of merchants that accepts AmEx is similar to the number of merchants that accepts Visa. 
However, aggregate acceptance counts alone cannot prove that merchants maintain relationships with multiple networks.
This section uses Yelp reviews to show that when AmEx and Visa charged different fees, acceptance patterns were hierarchical.
Merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network at the expense of another.
This sequential pattern provides evidence of multi-homing behavior.

I collect roughly 3,000 Yelp reviews that mention at least two payment methods by name (see Online Appendix \ref{subsec:appendix-yelp-data} for details on the sample construction).
% CONSTANT: count of Yelp reviews, from dataset
The reviews come primarily from the period 2010--2018, before AmEx's acceptance gap with Visa had fully closed, so they capture merchant acceptance decisions during a period of meaningful variation across networks.

Figure \ref{fig:merchant-multihoming} shows a clear hierarchy in which payment methods co-occur in reviews.
```

**Why better:**
- Line 381 (second paragraph): replaced "merchants multi-home" with "merchants maintain relationships with multiple networks" (more concrete, avoids near repetition)
- Line 384: replaced final "the multi-homing fact" with "multi-homing behavior" (slightly less repetitive)
- The section title still contains the key term, but the body prose no longer stutters on repetition
- "Multi-homing" is used 3 times instead of 5, reserving heavy use for the section heading and conclusion

---

**Overall Assessment:** The appendix is crisp and reads smoothly aloud. Both flagged issues are minor and cosmetic. The prose demonstrates:
- Strong control of demonstrative pronouns (mostly well-anchored)
- Sound parallel structure throughout
- No noun pile-ups or ambiguous list attachments
- Clear active constructions that avoid stumbling points

**Estimated readability:** High. Suitable for seminar presentation with minimal editing.

---

## [appendix_model_oa.tex]

### Summary
- Total flags: 0
- Most common pattern: N/A
- Overall orality: Clean

### Findings (document order)

**Result:** No issues found.

The text reads smoothly aloud. Sentences are clear, pronouns anchor properly, mathematical terms are explained before use, and there are no stutters or ambiguities. The prose is well-suited for spoken presentation at a seminar or conference.

Example of good orality:
- Line 12: "Single-homers are straightforward: a consumer uses her card if the merchant accepts it and pays cash otherwise." — Clear antecedent, smooth rhythm.
- Line 48: "Every acceptance decision hinges on the same two forces: consumer multi-homing patterns and the fee spread across networks." — Clean list structure, clear pronunciation.
- Line 123: "Convolving with smooth trembles makes $\Psi$ differentiable, and as the perturbation vanishes, the smoothed objective converges uniformly to the original." — Technical but clearly articulated.

---

## [appendix_credit_debit.tex]

### Summary
- Total flags: 5 (High: 2, Medium: 3, Low: 0)
- Most common pattern: Pattern 2 (truncated/incomplete sentences that stutter on read-aloud)

### Findings (document order)

### - [ ] Lines 204–204: Incomplete sentence trailing off with ".." `[High]` `[Pattern 2]`

**Comment:** The sentence abruptly ends with ".." — speaker would halt, confused. Looks like the sentence was revised but not completed.

**Original:**
```
The generalized threshold yields two testable predictions for the case when there is substitution and debit cards generate incremental sales relative to cash..
```

**Proposed Revision:**
```
The generalized threshold yields two key testable predictions when credit and debit are substitutes and debit generates incremental sales.
```

**Why better:** Completes the sentence grammatically. Reader/speaker ends on a period with conviction, not trailing off. The two predictions are named in the immediately following section headings, so the revision gestures to them.

### - [ ] Lines 236–237: Abrupt restart after incomplete clause `[High]` `[Pattern 2]`

**Comment:** "In the main text, I focus on the baseline model because it most accurately captures the effects of the D" — sentence fragment that cuts off mid-word. Then restarts: "The goal of the model is to study..." The ear hears a stutter, stops, tries to rewind.

**Original:**
```
In the main text, I focus on the baseline model because it most accurately captures the effects of the D
The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
```

**Proposed Revision:**
```
In the main text, I focus on the baseline model because it most accurately captures the empirical Durbin episode. The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
```

**Why better:** Completes the first sentence ("effects of the D" → "effects of the empirical Durbin episode"). The two sentences now flow: the first justifies the baseline, the second restates the model's purpose. The ear doesn't stutter.

### - [ ] Lines 8–9: Long preamble before main clause `[Medium]` `[Pattern 9]`

**Comment:** "While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it." — The verb "presents" doesn't arrive until 36 words in. The speaker must hold the subject across a long stretch.

**Original:**
```
While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Proposed Revision:**
```
Incorporating substitution would make the model more realistic in some dimensions, but it generates predictions at odds with the empirical evidence. This appendix presents the case for segmentation and two alternative specifications.
```

**Why better:** Splits long preamble into two sentences. First sentence: subject-verb arrives in 11 words ("Incorporating...would make"). Second sentence: subject-verb arrives in 5 words ("This appendix presents"). Ear doesn't lag.

### - [ ] Lines 71–73: Packed subordination in model definition `[Medium]` `[Pattern 3]`

**Comment:** "The model therefore treats segmentation as a continuous parameter. The parameter $\zeta\in[0,1]$ governs how often a consumer holding both card types reaches for the other type when a merchant accepts only one, and $\kappa_d\in[0,1]$ governs the demand boost merchants get from debit relative to credit." — The second sentence stacks two parallel independent clauses ("governs how often" AND "governs the demand boost") with heavy embedding in the first. Listener loses track of the parallel structure.

**Original:**
```
The parameter $\zeta\in[0,1]$ governs how often a consumer holding both card types reaches for the other type when a merchant accepts only one, and $\kappa_d\in[0,1]$ governs the demand boost merchants get from debit relative to credit.
```

**Proposed Revision:**
```
The parameter $\zeta\in[0,1]$ (between 0 and 1) governs how often a consumer holding both card types reaches for the secondary card when a merchant accepts only one. The parameter $\kappa_d\in[0,1]$ governs the demand boost from debit relative to credit.
```

**Why better:** Splits single 31-word sentence into two 18-word sentences. Parallel structure now visible: "The parameter X...governs [something]. The parameter Y...governs [something else]." No conjunction overload; each parameter gets its own clause.

### - [ ] Lines 75–77: Dense conditional with multiple referents `[Medium]` `[Pattern 9]`

**Comment:** "When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type." — The main verb "redirects" arrives after 28 words, and the listener must hold: (1) the consumer type (multi-homer), (2) the card types (credit, debit), (3) the merchant behavior (accepts only one), (4) the transaction type (intended for the missing). Too much in suspension.

**Original:**
```
When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type.
```

**Proposed Revision:**
```
When a consumer multi-homing across credit and debit visits a merchant that accepts only one, she redirects a fraction $\zeta$ of her intended transactions to the accepted type.
```

**Why better:** 
- Verb arrives at 15 words (vs. 28)
- "Multi-homing across credit and debit" replaces "carrying one credit and one debit card" — shorter, same meaning
- "her intended transactions to the accepted type" replaces "the transactions intended for the missing type" — simpler grammar (prepositional phrase over reduced relative clause)

---


---

## [appendix_robustness.tex]

### Summary
- Total flags: 3 (High: 0, Medium: 2, Low: 1)
- Most common pattern: Pattern 11 (mechanism paraphrase), Pattern 1 (repetition)

---

### Findings (document order)

### - [ ] Lines 7: Long sentence with multiple semicolons `[Medium]` `[Pattern #3]`

**Comment:** Intro paragraph uses semicolons to separate three parallel independent clauses. When read aloud, the listener struggles to track three separate thoughts about what each section does.

**Original:**
```
Sections~\ref{subsec:oa-no-passthrough}--\ref{subsec:oa-debit-robustness} re-estimate under three alternative specifications (no merchant fee pass-through, credit constraints, lower reward sensitivity); Online Appendix~\ref{sec:oa-credit-debit} addresses credit-debit substitution; Section~\ref{subsec:oa-cost-of-cash-cap} compares the 120 bps cap to a tighter cost-of-cash cap and the constrained social optimum.
```

**Proposed Revision:**
```
Sections~\ref{subsec:oa-no-passthrough}--\ref{subsec:oa-debit-robustness} re-estimate under three alternative specifications: no merchant fee pass-through, credit constraints, and lower reward sensitivity. Online Appendix~\ref{sec:oa-credit-debit} addresses credit-debit substitution. Section~\ref{subsec:oa-cost-of-cash-cap} compares the 120 bps cap to a tighter cost-of-cash cap and the constrained social optimum.
```

**Why better:** Separates three distinct thoughts into three sentences. The ear can parse each independently. The first sentence now uses a colon to introduce a list of three specifications (natural and clear), not three competing clauses.

---

### - [ ] Line 69: Mechanism phrasing "after a credit fee cap" `[Medium]` `[Pattern #11]`

**Comment:** The phrase "after a credit fee cap" reads as temporal sequence when the mechanism is causal. Listener might parse "after the cap is implemented" rather than "because of the cap's effect."

**Original:**
```
Under full pass-through, positive retail markups make baseline consumption inefficiently low, but merchant price cuts after a credit fee cap reverse this distortion.
```

**Proposed Revision:**
```
Under full pass-through, positive retail markups make baseline consumption inefficiently low, but the cap prompts merchant price cuts that reverse this distortion.
```

**Why better:** "Prompts" makes causality explicit. The ear now hears the mechanism clearly: the cap causes price cuts, which reverse the distortion. No ambiguity about temporal vs. causal sequence.

---

### - [ ] Line 116: Word repetition "card...card" `[Low]` `[Pattern #1]`

**Comment:** Close repetition of "card" in same clause. "Constrained customers cannot have a credit card as a primary or secondary card."

**Original:**
```
Constrained customers cannot have a credit card as a primary or secondary card.
```

**Proposed Revision:**
```
Constrained customers cannot hold credit cards as a primary or secondary account.
```

**Why better:** Replaces the repeated "card" with "account." Reduces the auditory stumble while keeping the technical meaning. "Hold" also provides variety from "have."

---


---

## [appendix_surcharging.tex]

No issues found.

---

## [appendix_sorting.tex]

### Summary
- Total flags: 1 (High: 0, Medium: 1, Low: 0)
- Most common pattern: Word repetition in close proximity (Pattern 1)

### Findings (document order)

### - [ ] Lines 10: "patronize...patronize" repetition `[Low]` `[Pattern 1]`

**Comment:** The verb "patronize" is repeated within the same sentence, creating a stutter-like echo that trips the ear, even though the two clauses have different subjects.

**Original:**
```
Under perfect sorting, credit card users patronize only high-end merchants while cash/debit users patronize discount retailers, eliminating cross-consumer redistribution.
```

**Proposed Revision:**
```
Under perfect sorting, credit card users shop only at high-end merchants while cash/debit users shop at discount retailers, eliminating cross-consumer redistribution.
```

**Why better:** Substituting "shop" for the second "patronize" eliminates the repetition while preserving the parallel structure and meaning. The sentence reads more smoothly aloud without the duplicated verb.


---

