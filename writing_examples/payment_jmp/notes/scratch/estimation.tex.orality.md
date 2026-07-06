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
