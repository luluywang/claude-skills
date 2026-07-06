# Writing Quality Assessment

**Paper Type:** B+D (Specialized institutional topic + structural model applied to data)
**Assessed against:** 14 Principles + 8 Quality Dimensions from writing_quality_standards.md

---

## Section Grades

| Section | Grade | Primary Strength | Primary Issue |
|---------|-------|------------------|---------------|
| Introduction | A | Tension, mechanism, economy | Minor inventory-style numbers in dual routing paragraph |
| Institutional Details | A- | Clear layered explanation | Throat-clearing opening sentence |
| Data | A- | Concise, purposeful | Formulaic paragraph structure |
| Reduced Form | A- | Clean identification, good math | Throat-clearing opening sentence |
| Model | A | Precise math, honest assumptions | Dense but justified |
| Estimation | A | Intellectual precision, honest calibration framing | Enumeration "(1)...(2)...(3)" in opening |
| Counterfactuals | A- | Strong mechanisms, good decomposition | Some inventory-style number sequences |
| Conclusion | A | Terse, memorable, no padding | None |

**Overall Grade: A-**

This is exceptionally strong academic writing. The paper consistently explains *why* results obtain, not just *what* happens. Limitations are named plainly. Math is displayed where needed. The main recurring issues are minor: a few throat-clearing openers and occasional inventory-style number reporting.

---

## Detailed Assessment

### intro.tex

#### Strengths

**Tension (Principle #5):** The introduction opens with concrete facts ($120B in fees, 60% margins) that set up the conventional view, then pivots with "I argue that this view is backwards." This is textbook motivation-first writing. The surprise of the monopoly result ("increasing market power through a merger to monopoly also increases total welfare") is deployed effectively.

**Mechanism (Principle #2):** Every result is accompanied by a causal chain. "Switching raises total welfare because rewards are merely transfers funded by merchant fees, whereas credit aversion is a real social cost." The reader always knows *why*.

**Economy (Principles #8, #9):** No throat-clearing. No lecturing about two-sided markets to field experts. The related literature section is three tight paragraphs that say exactly what this paper adds.

**Numbers as arguments (Principle #7):** Most numbers serve as evidence. "This gain dwarfs the $12 billion welfare gain from the CARD Act" uses comparison to make the number meaningful.

#### Flagged Issues

### - [X] Lines 96-106: Inventory-style numbers in dual routing paragraph

**Dimension:** Number Integration (Principle #7)

**Comment:** The dual routing paragraph stacks four numbers in sequence (60%, target%, -13 bps fees, -15 bps rewards, $8B welfare) without each one advancing a distinct claim. The mechanism sentence at the end ("When consumers multi-home, merchants can decline expensive networks...") is strong, but the numbers preceding it read as an inventory.

**Original:**
```
Increasing multi-homing from around 60\% to \scalarinput{dual_routing_cc_multihome_level_baseline}\% among existing large networks would force networks to cut credit card merchant fees by 13 basis points and rewards by 15 basis points, increasing total welfare by \$8 billion.
```

**Proposed Revision:**
```
Increasing multi-homing among existing large networks would raise total welfare by \$8 billion. When consumers multi-home, merchants can decline expensive networks without losing sales, shifting competition toward merchant fees rather than consumer rewards. Networks respond by cutting credit card fees by 13 basis points and rewards by 15 basis points.
```

**Why better:** Leads with the welfare claim (the point of the paragraph), then explains the mechanism, then reports the price changes as evidence. Matches Principle #5 (motivation first) and #7 (numbers as evidence).

---

### institutional_details.tex

### - [X] Lines 4: Throat-clearing opening

**Dimension:** Economy (Principle #8)

**Comment:** "This section explains how payment networks such as Visa, MC, and American Express (AmEx) shape merchant fees and consumer rewards." This is a road-mapping sentence that describes what the section will do rather than doing it.

**Original:**
```
This section explains how payment networks such as Visa, MC, and American Express (AmEx) shape merchant fees and consumer rewards.
With every card swipe, the merchant pays a fee, and the consumer may receive a reward.
```

**Proposed Revision:**
```
With every card swipe, the merchant pays a fee and the consumer may receive a reward.
Payment networks such as Visa, MC, and American Express (AmEx) determine these prices.
```

**Why better:** Starts with content rather than meta-commentary. The reader learns what happens rather than being told what the section will explain.

---

### reducedform.tex

### - [ ] Lines 4-6: Throat-clearing opening paragraph

**Dimension:** Economy (Principle #8)

**Comment:** "This section documents three reduced-form facts that shape the structural model." is pure road-mapping. The subsequent sentences preview all three facts before any evidence appears. This is an acceptable convention in economics papers, but the writing principles favor jumping straight to the first fact.

**Original:**
```
This section documents three reduced-form facts that shape the structural model.
Issuers' incentives to promote cards drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.
Together, these facts explain why networks tax merchants to subsidize the issuing side of the market.
```

**Proposed Revision:**
```
Three facts underpin the structural model: issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to these choices. Together, they explain why networks tax merchants to subsidize consumers.
```

**Why better:** Cuts 3 sentences to 2, eliminates the meta-commentary, and preserves the preview. "Three facts underpin" is more direct than "This section documents three reduced-form facts that shape."

---

### estimation.tex

### - [X] Lines 4-6: Enumeration pattern in opening

**Dimension:** Economy (Principle #13, Contrast II.9)

**Comment:** "The key primitives are (1) consumers' preferences over payment options, (2) merchants' gains from accepting cards, and (3) networks' marginal costs." The numbered enumeration in prose is an LLM tell per Contrast II.9. In this case it's borderline acceptable because it previews the estimation structure, but could be tightened.

**Original:**
```
Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
The key primitives are (1) consumers' preferences over payment options, (2) merchants' gains from accepting cards, and (3) networks' marginal costs.
```

**Proposed Revision:**
```
Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
The key primitives are consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.
```

**Why better:** Drops the numbered enumeration. The list is only three items and doesn't need numbering to be clear.

---

### - [ ] Lines 62-73: Honest but slightly over-explained calibration caveat

**Dimension:** Limitations Handling (Principle #6)

**Comment:** The paragraph on merchant types is admirably honest ("closer to a calibration exercise than a conventional estimation"), which is excellent. But the subsequent sentences explaining why this is the case repeat ideas already established in the reduced-form section. Lines 73-74 ("The standard errors account for uncertainty... but not for model error from extrapolating beyond the grocery sector") is the key caveat and could appear earlier.

**Original:**
```
Because U.S.\ payment markets are mature (98\% of Homescan trips occur at stores already accepting credit cards), there is limited variation in merchant adoption.
Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation.
```

**Proposed Revision:**
```
Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation, since U.S.\ payment markets are mature (98\% of Homescan trips occur at stores already accepting credit cards).
```

**Why better:** Leads with the caveat, then explains why. Cuts one sentence without losing information.

---

### counterfactuals.tex

### - [X] Lines 28-39: Inventory-style number sequence in price/share effects

**Dimension:** Number Integration (Principle #7)

**Comment:** Lines 28-39 report a sequence of numbers: -21 pp credit adoption, $10 trillion normalization, -$58B fees, -$57B rewards. Most of these numbers are better left to the table. The prose should focus on the mechanism (consumers substitute toward debit and cash) and let the table carry the specific magnitudes.

**Original:**
```
Credit card adoption drops 21 percentage points
as consumers substitute to debit and cash.
Only one-third of consumers are primary credit card users at baseline, so this is a two-thirds reduction.
Lower card use reduces total merchant fees and rewards by similar amounts.
\textcite{Nilson2020a} finds that consumers spent around $10$ trillion in $2019$.
I normalize total model income to $1$, so each basis point of spending corresponds to \$$1$ billion.
Capping fees reduces annual merchant fees by \$58
and rewards by \$57 billion.
```

**Proposed Revision:**
```
Credit card adoption drops by two-thirds as consumers substitute toward debit and cash (Table \ref{tab:cf-effects}).
Lower card use reduces merchant fees and rewards by roughly equal amounts --- around \$58 billion each --- consistent with the see-saw principle.
I normalize total model income to the \$10 trillion in 2019 consumer spending \parencite{Nilson2020a}, so each basis point corresponds to \$1 billion.
```

**Why better:** Leads with the meaningful comparison ("two-thirds"), connects the fee-reward symmetry to a prior concept (see-saw principle), and moves the normalization explanation to a single clean sentence. Cuts 7 sentences to 3.

---

### - [ ] Line 224: Typo

**Dimension:** Surface

**Comment:** "alternatie" should be "alternative"

**Original:**
```
Across a wide range of alternatie specifications
```

**Proposed Revision:**
```
Across a wide range of alternative specifications
```

**Why better:** Typo fix.

---

### counterfactuals.tex — Discussion paragraphs

#### Strengths

The Discussion subsection (lines 221-271) is among the best-written parts of the paper. Each paragraph follows a clean pattern: name the concern, state the alternative specification, report the result, explain why it does or doesn't matter. This is exemplary limitations handling (Principle #6).

Particularly strong:
- "This seems strong. If a merchant declines a consumer's credit card, debit feels like a closer substitute than cash." (Line 241) -- Acknowledges the reader's likely objection in plain language before addressing it.
- "The welfare gains from fee caps are smaller but still positive" (Line 270) -- Direct, no hedging.

---

### model.tex

#### Strengths

**Math precision (Principle #3):** Every claim is backed by a displayed equation. The model section never hand-waves; identification arguments point to specific moment conditions.

**Assumptions section (Principle #6):** The paragraph-format assumptions discussion is excellent. Each assumption is named, justified with evidence, and its limitation acknowledged. "I omit fixed costs of card acceptance because they cannot be separately identified from heterogeneity in sales benefits" is direct and informative.

**One point per paragraph (Principle #4):** Despite the density of the model, each paragraph makes a single claim. The notation is introduced systematically.

No items flagged. This section meets the highest standard across all dimensions.

---

### conclusion.tex

#### Strengths

**Economy (Principle #8):** Five paragraphs, no padding. The conclusion restates the three key results (fee caps, monopoly, dual routing) with their mechanisms, then closes with the memorable "The direction of competition matters more than its intensity."

**No false uplift:** The commented-out broader-implications paragraph was wisely cut. The paper ends on its own terms.

No items flagged.

---

## Summary of Recurring Patterns

**Consistent strengths:**
1. **Mechanism over description** -- Nearly every result is explained causally. This is the paper's greatest writing strength.
2. **Intellectual precision** -- Assumptions, estimates, and calibrations are labeled correctly throughout.
3. **Direct limitations** -- Caveats are named plainly and addressed substantively.
4. **Strong sentence rhythm** -- Short punchy sentences mixed with longer analytical ones. "I argue that this view is backwards." followed by a detailed explanation.

**Recurring minor issues:**
1. **Throat-clearing openers** -- "This section documents/explains/analyzes..." appears in 2 of 8 files. These are conventional in economics but violate Principle #8.
2. **Occasional inventory numbers** -- 2-3 paragraphs stack numbers without each one serving as evidence for a distinct claim. The tables carry the detail well; the prose could lean on them more.
3. **One enumeration pattern** -- The "(1)...(2)...(3)" in the estimation opening is a minor LLM tell.

**Not flagged (because not present):**
- No lecturing experts (Principle #9)
- No stacked hedges (Contrast II.4)
- No AI-typical transitions ("Moreover," "Furthermore," "Additionally")
- No smarmy reframing
- No false structure imposed on joint estimation
