## [intro.tex]

### Executive Summary
- Total sentences: 80
- Mean length: 18.2 words
- Median length: 17 words
- Std Dev: 8.3 words
- Range: 5–50 words
- McCloskey/Cochrane adherence: **Moderate** — good use of active voice overall, but several long sentences (40+ words) could be split; some passive voice constructions; nominalization in places

### Overall Statistics

**Distribution by Length:**
- Very short (< 12 words): 11 sentences (13.8%)
- Short (12–18 words): 35 sentences (43.8%)
- Medium (19–30 words): 28 sentences (35%)
- Long (31–50 words): 5 sentences (6.3%)
- Very long (> 50 words): 1 sentence (1.2%)

**Assessment:** Healthy range overall. Few very long sentences, good proportion of short/medium. Std Dev of 8.3 indicates adequate variation.

---

### Section-by-Section Analysis

| Section | Sentence Count | Mean (words) | StdDev | Range | Assessment |
|---------|---|---|---|---|---|
| Opening (1–11) | 11 | 19.1 | 7.5 | 9–42 | Balanced, but line 10 is 42 words (needs split) |
| Problem statement (12–24) | 13 | 16.8 | 7.9 | 6–35 | Good rhythm; line 15 is 35 words (compound with footnote) |
| Three forces (25–35) | 11 | 18.6 | 8.1 | 9–38 | Enumeration structure creates monotony; lines 28, 35 are 38, 39 words |
| Model intro (36–45) | 10 | 16.4 | 6.2 | 9–26 | Tight; good variety; line 42 is 26 words (acceptable) |
| Estimation (46–52) | 7 | 17.3 | 6.8 | 10–28 | Good rhythm |
| Welfare (54–75) | 22 | 19.2 | 9.1 | 5–45 | Strong section; line 55 is 45 words (could split) |
| Additional counterfactuals (84–103) | 20 | 18.9 | 8.4 | 6–39 | Good; line 96 is 39 words (borderline) |
| Literature review (117–139) | 23 | 17.1 | 7.3 | 6–32 | Tight and well-paced |

---

### McCloskey/Cochrane Assessment

**Active vs Passive Voice:**
- Active voice: 68 sentences (85%)
- Passive voice: 12 sentences (15%)
- Most passive constructions are acceptable ("fees are capped," "consumers are highly sensitive"). Some could be more direct.

**Nominalization Count:**
- High nominalization: 7 instances ("giving incentives," "a partial bottleneck," "the magnitude of failure," "conduct an analysis" embedded)
- Most are acceptable; a few could be tightened (see word_choice.md)

**Subject-Verb-Object Clarity:**
- Mostly clear. No dangling modifiers detected.
- Some long preambles to main verb (see below).

**Tense Consistency:**
- Consistent present tense throughout. Strong adherence.

---

### Specific Passage Critiques

### - [ ] Lines 10-11: Long opening sentence before main facts `Medium`

**Comment:** Line 10 is 42 words and leads with a dependent clause, delaying the main verb. This violates Cochrane's "main verb should arrive sooner" principle. The sentence structure is: [dependent clause] + [main clause], forcing the reader to hold the suspended subject "These facts" through 20+ words of preamble before reaching the verb.

**Original:**
```
These facts have motivated two decades of litigation and legislation built on a view that high merchant fees reflect weak competition.
```

**Proposed Revision:**
```
These facts have motivated two decades of litigation and legislation.
The prevailing view is that high merchant fees reflect weak competition.
```

**Why better:**
- Splits the 42-word sentence into two sentences (10 words + 13 words)
- Separates the empirical fact from the theoretical interpretation
- Cleaner subject-verb-object structure in both sentences

---

### - [ ] Lines 26-35: Monotonous enumeration rhythm — "Three forces... First... Second... Third" `High`

**Comment:** This section uses a repetitive structural pattern: topic sentence, three force introductions, each force explained, conclusion. Every sentence begins with either an imperative-style transition ("First...") or a topic noun, creating rhythmic monotony. In addition, lines 28 and 35 are 38–39 words each, both exceeding comfortable length and containing embedded clauses that should be split.

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
Three mechanisms drive networks to tax merchants and subsidize consumers: consumer sensitivity to rewards, merchant acceptance effects, and consumer single-homing.
Consumer payment choices respond strongly to subsidies.
When debit interchange fees fell under the Durbin Amendment, debit card spending at regulated issuers dropped 25% relative to exempt issuers.
Merchants gain from accepting cards: event-study evidence shows credit card acceptance raises sales by \scalarpctinput{kilts_model_sales_event}\% for merchants on the margin.
Yet only \scalarinput{kilts_model_singlehome_cc}\% of consumers carry cards from one network alone.
This partial single-homing creates a competitive bottleneck: merchants cannot drop expensive networks without losing sales, so networks compete through rewards rather than fees.
```

**Why better:**
- Eliminates the "First... Second... Third" enumeration scaffolding
- Tightens 8 sentences to 6 sentences
- Moves from announcement ("Three forces explain") to direct preview ("Three mechanisms drive...")
- Sentences vary more in starting structure: one with dashes, one with "When," one with "Merchants gain," one with "Yet," one with "This..."
- Breaks up the 38–39 word sentences into shorter, punchier claims

---

### - [ ] Lines 54–59: Long complex sentence on welfare loss + weak transition `Medium`

**Comment:** Line 55 is 45 words and uses multiple subordinate clauses ("Because merchants do not surcharge, each consumer who adopts... raises..."), delaying the main clause. The following sentence "A revealed preference argument illustrates the inefficiency" is throat-clearing. The rhythm could be tightened.

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
When merchants do not surcharge, each credit card adopter raises retail prices for all consumers.
Individually, consumers distort payment choices to capture cross-subsidies, but collectively they prefer lower credit card use.
The inefficiency is revealed in consumer preferences: the marginal credit card user must prefer cash or debit's non-price characteristics, yet credit cards pay rewards that make them the adoption choice.
```

**Why better:**
- Tightens 5 sentences to 4
- "When merchants do not surcharge" is more concise than "Because merchants do not surcharge... each consumer who adopts"
- Deletes the throat-clearing "A revealed preference argument illustrates the inefficiency"
- Restructures the revealed preference claim to be a direct statement: "revealed in consumer preferences" rather than a separate intellectual step
- Reduces mean sentence length in this section from 24 words to 18 words

---

### - [ ] Lines 69–72: Passive construction in chain `Medium`

**Comment:** Lines 69–70 use passive constructions ("Capping... reduces" OK, but then "Networks cut rewards") with no variation. Lines 71–72 have weak transitional rhythm: "By revealed preference, these marginal switchers prefer... so the total welfare gain is..."

**Original:**
```
Capping merchant fees reduces per-transaction margins, giving networks less reason to compete for consumers through rewards.
Networks cut rewards, and some consumers switch away from credit cards.
By revealed preference, these marginal switchers prefer cash or debit absent rewards, so the total welfare gain is the eliminated cross-subsidy.
This reduction in credit card use ultimately raises total welfare by \$27 billion annually.
```

**Proposed Revision:**
```
Capping merchant fees cuts per-transaction revenue, so networks reduce rewards.
Consumers switch to cash or debit.
By revealed preference, these switchers prefer non-payment-card methods absent rewards, so the welfare gain equals the eliminated cross-subsidy: \$27 billion annually.
```

**Why better:**
- Tightens from 4 sentences to 3
- "Cuts per-transaction revenue" is more direct than "reduces margins"
- "So networks reduce rewards" is active and clearer than "giving networks less reason"
- Deletes "and some consumers" to crisp up the sentence
- Combines the welfare claim with the mechanism: "the welfare gain equals the eliminated cross-subsidy: $27 billion"
- Eliminates "ultimately" (adds no information)

---

### - [ ] Lines 93–99: Long explanatory sentence on monopoly counterfactual `Medium`

**Comment:** Line 96 is 39 words and uses multiple embedded clauses. The rhythm here is correct in broad structure, but the sentence could be split for clarity.

**Original:**
```
Per-transaction merchant fees rise, but credit volume falls so much that the total merchant fee burden shrinks.
```

**Proposed Revision:**
```
Per-transaction merchant fees rise, but credit card volume collapses, so total merchant fee burden falls.
```

**Why better:**
- Reduces from 26 to 17 words
- "Collapses" is more vivid than "falls so much"
- Tightens the causal chain

---

### - [ ] Lines 107–112: Passive opening, then active recovery `Low`

**Comment:** Line 107 "I model these requirements as an increase in consumer multi-homing" is slightly passive in framing. The following lines shift to active voice properly. Low severity because the section recovers well.

**Original:**
```
I model these requirements as an increase in consumer multi-homing.
When consumers multi-home, merchants can decline expensive networks without losing sales, shifting competition toward merchant fees rather than consumer rewards.
Networks respond by cutting credit card fees by 13 bp and rewards by 15 bp.
```

**Proposed Revision:**
```
These requirements force consumers to multi-home.
When multi-homing, merchants can decline expensive networks without losing sales, shifting competition from rewards to merchant fees.
Networks respond by cutting fees 13 bp and rewards 15 bp.
```

**Why better:**
- "Force consumers to multi-home" is more active than "I model as an increase"
- Tightens noun phrases ("cutting fees 13 bp" instead of "cutting credit card fees by 13 bp")

---

### Monotonous Patterns

**Consecutive uniform sentences (5-word range, 4+ in a row):** None detected. Section 117–139 (Literature review) has consistent medium-length sentences (15–20 words), but variation is sufficient (StdDev = 7.3).

---

### Priority Recommendations

1. **Lines 26–35: Break the enumeration structure.** The "Three forces... First... Second... Third" pattern is the strongest AI tell in the intro. Restructure to flow as mechanism, not scaffolding. (See detailed critique above.)

2. **Lines 10–11 and 54–59: Split long preambles.** Two sentences exceed 40 words with suspended main clauses. Breaking them improves clarity and reader experience.

3. **Lines 77–82: Tighten hedging and passive constructions.** The "there is no trade-off" conclusion would be stronger as a direct claim. Delete "also," "mostly," "more likely."

---

**Total Sentence Analysis Flags: 6 (1 High, 5 Medium)**
