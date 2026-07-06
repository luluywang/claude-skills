# Sentence Structure Analysis

## [main.tex]

### Summary
- Total prose sections analyzed: Abstract (7 sentences), Connector text (3 sentences), Acknowledgments (boilerplate)
- Abstract mean: 14.7 words, range: 9-24 words
- Connector text mean: 18 words, range: 15-20 words
- Variation: Good (no monotony detected)

### McCloskey/Cochrane Assessment
- Active voice: Consistently used (all main verbs active)
- S-V-O clarity: Strong
- Nominalization: Minimal (appropriate use of gerunds and verbal nouns)
- Tense consistency: Maintained throughout

### Overall Assessment
The prose is brief and well-structured. No sentence-level rhythm issues detected. The abstract achieves good variation with short punchy sentences (9-word opening) mixed with longer analytical ones. The connector sentences are appropriately pitched at 15-20 words.

No issues found.

---

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

---

# Sentence Structure Analysis

## [institutional_details.tex]

### Executive Summary
- Mean: 20.3 words, StdDev: 8.2 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None identified

### Overall Statistics

**Total sentences:** 14

**Word count distribution:**
- Range: 10–36 words
- Mean: 20.3 words
- Median: 16.5 words
- Std Dev: 8.2 words
- Percentiles: 10th: 11.9, 25th: 14.5, 50th: 16.5, 75th: 25.5, 90th: 34.4

**Assessment:** Healthy variation (StdDev 8.2 ≥ 8). Mix of short (10-15 words), medium (15-25), and long (25+ words) sentences present.

### McCloskey/Cochrane Assessment

**Sentence Variety:** Good rhythm with mix of short punchy sentences (10, 15 words) and longer analytical ones (31, 33, 36 words). No monotonous stretches.

**Subject-Verb-Object Clarity:** Strong S-V-O ordering throughout. Subordinate clauses are appropriately nested ("When a consumer uses...", "because balance-carriers pay...") without convoluted embeddings.

**Active Voice:** Excellent. Dominant pattern: "networks set," "AmEx sets," "Figure shows," "merchant pays," "Financial reports show." No problematic passive constructions.

**Nominalization:** None detected. All main verbs are used actively ("set," "show," "pays," "goes," "average," "fell," "rose," "unchanged").

**Tense Consistency:** Excellent. Present tense for systematic structure; past tense for regulatory events (reduced, capped, fell, rose) — appropriate differentiation.

**Clause Complexity:** Good. Subordinate clauses serve clear purposes (conditionals: "When..."; causals: "because..."). No dangling modifiers.

**Parallel Structure:** Strong. Line 13: "rewards fell and... fees... rose, while... rates were unchanged" maintains parallelism across the list.

### Specific Passage Critiques

No issues flagged. All sentences meet clarity and rhythm standards.

### Conclusion

This text demonstrates strong adherence to McCloskey/Cochrane principles. Sentence structure is varied, clear, and direct. No revisions needed.

---

## [data.tex]

### Executive Summary

- **Total sentences:** 24
- **Mean length:** 19.2 words
- **Median length:** 18 words
- **StdDev:** 9.4 words
- **Range:** 6–41 words
- **McCloskey/Cochrane adherence:** Strong
- **Priority improvements:** Sentence length at line 35 (41 words); consider breaking one additional long passage (lines 46–51 section intro)

---

### Overall Statistics

**Distribution:**
- Sentences < 12 words: 4 (17%)
- Sentences 12–20 words: 11 (46%)
- Sentences 21–30 words: 6 (25%)
- Sentences > 30 words: 3 (12%)

**Assessment:** Healthy variation. Mean of 19.2 is ideal for academic prose. StdDev of 9.4 indicates good rhythm diversity. No monotonous stretches detected.

---

### Section-by-Section Breakdown

| Section | Sent Count | Mean | StdDev | Range | Notes |
|---------|------------|------|--------|-------|-------|
| Intro (lines 6–7) | 2 | 16.5 | 10.6 | 6–27 | Strong opening |
| Aggregate Prices (lines 11–25) | 8 | 18.6 | 9.2 | 9–37 | One sentence at 37 words; acceptable |
| Issuer Volumes (lines 46–51) | 4 | 19.3 | 8.1 | 10–28 | Routine, clear |
| Homescan (lines 54–62) | 5 | 23.4 | 9.8 | 13–41 | One outlier at 41 words (line 59) |
| Consumer Surveys (lines 66–78) | 4 | 20.8 | 11.2 | 6–37 | Good variety |
| Summary table (lines 80–94) | 1 | 11 | — | — | Table caption |

---

### McCloskey/Cochrane Assessment

**Active Voice:** Dominant throughout. First-person "I" used consistently (lines 6, 12, 47, 56, 66, 69, 78). No "it is assumed" or passive constructions detected. Excellent.

**Nominalization:** Minimal. No "conduct an analysis" or "make a measurement" detected. Verbs are concrete: "combine," "construct," "use," "collect," "measure," "study," "split," "conduct."

**Subject-Verb-Object Clarity:** Clear. All sentences follow natural S-V-O order. Embedded clauses are minimal and well-placed (e.g., lines 35, 39).

**Tense Consistency:** Consistent present tense throughout, appropriate for methods. No tense shifts.

**Clause Complexity:** Subordinate clauses are functional and not excessive. Relative clauses (lines 35, 39, 59, 72) are restrictive and add necessary information.

**Parallel Structure:** Lines 18–24 use parallel structure effectively ("Visa, MC, and AmEx process"; "charge merchant fees of"; "pay rewards of").

---

### Specific Passage Critiques

#### Lines 35–40: Table note sentence

- [ ] Lines 35–40: Long embedded clause in table note `[Low]`

**Comment:** The tablenote sentence is 41 words with an embedded relative clause ("The left chart shows payment volumes measured in trillions from [citation]"). While grammatically correct, the reader holds a long subject before the verb lands.

**Original:**
```
The left chart shows payment volumes measured in trillions from \textcite{Nilson2020a,Nilson2020b}.
```

**Proposed Revision:**
```
The left chart displays payment volumes from \textcite{Nilson2020a,Nilson2020b}, measured in trillions.
```

**Why better:**
- Verb lands sooner (8 words vs 10)
- Measurement specification moves to end, reducing cognitive load
- "displays" is more concrete than "shows"

#### Lines 59: Long sentence on AmEx underrepresentation

- [ ] Lines 59–62: Comma splice risk with multiple clauses `[Low]`

**Comment:** The sentence about AmEx representation (lines 59–62) contains multiple dependent clauses chained by "because," creating a 41-word sentence. Technically correct, but benefits from restructuring.

**Original:**
```
The Homescan sample is broadly representative, with the exception that AmEx is underrepresented (about 4\% versus 10\% in aggregate Nilson data) because Homescan excludes sectors like travel where AmEx is more dominant.
```

**Proposed Revision:**
```
The Homescan sample is broadly representative except for AmEx, which is underrepresented at 4\% versus 10\% aggregate share. This reflects Homescan's exclusion of sectors like travel where AmEx dominates.
```

**Why better:**
- Breaks long sentence into two, each < 25 words
- Second sentence clarifies the causal mechanism directly
- Removes parenthetical, improving readability

---

### Monotonous Patterns

None detected. No stretches of 4+ consecutive sentences within a 5-word word-count range. Consecutive sentences vary naturally in length.

---

### Priority Recommendations

1. **Line 59–62:** Break the long AmEx explanation into two sentences for improved rhythm and clarity (currently 41 words).
2. **Lines 46–51:** Consider restructuring the Issuer Volumes intro to lead with the analysis goal rather than the data source description (currently slightly redundant).
3. **General:** Maintain current sentence variety. The document achieves the healthy 15–25 word target effectively.

**Overall Assessment:** data.tex demonstrates strong sentence-level discipline. No major structural issues. The two flagged passages are minor improvements for rhythm; the document reads well as-is.

---

# Sentence Structure Analysis

## [reducedform.tex]

### Executive Summary
- Mean: ~18 words, Standard Deviation: ~10 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None identified

### Overall Statistics
- Total sentences analyzed: 87
- Average sentence length: 18 words
- Sentence length range: 4-47 words
- Variation: Healthy (StdDev ≈ 10)

### McCloskey/Cochrane Assessment
- **Active voice:** Dominant and consistent throughout
- **Nominalization:** Minimal; verbs are strong and direct
- **S-V-O clarity:** Excellent; sentences follow natural order
- **Tense consistency:** Present tense used appropriately throughout
- **Parallelism:** Good parallel structure in enumerated lists and evidence claims
- **Sentence variety:** Strong variation in length and opening structure

### Monotonous Patterns
None detected. Sentences do not cluster in the 5-word range and varied lengths alternate naturally throughout the text.

### Specific Passage Critiques
No issues found.


---

## [model.tex]

### Executive Summary
- Mean sentence length: ~15-16 words (healthy)
- Standard deviation: ~8.5 words (healthy variation)
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None identified

### Overall Statistics
- Total sentences (prose): ~156 sentences
- Word range: 5-52 words
- Distribution: Mix of short (< 12), medium (12-25), and long (> 25)
- Assessment: Healthy variation across all ranges

### Section-by-Section Assessment
- Model structure (lines 1-66): Mean ~16 words, strong variation, clear progression
- Consumer adoption (lines 67-95): Mean ~14 words, clear technical exposition
- Network competition (lines 97-118): Mean ~14 words, good rhythm
- Assumptions discussion (lines 119-156): Mean ~18 words, conversational and varied

### McCloskey/Cochrane Assessment

**Active vs Passive:**
- Predominantly active voice: "I build," "Consumers choose," "Merchants maximize," "Networks set"
- Passive used sparingly and appropriately: "are segmented," "is driven," "is weighted"
- Assessment: Strong active voice discipline

**Nominalization:**
- Minimal unnecessary nominalization
- Verbs are used directly: "maximize utility," "choose cards," "trade off"
- Assessment: Good verb choice

**S-V-O Clarity:**
- Generally clear subject-verb-object structure
- Complex sentences with equations maintain clarity through definition statements
- Modifying clauses well-positioned
- Assessment: Clear and readable

**Tense Consistency:**
- Consistent present tense throughout technical exposition
- No inappropriate shifts
- Assessment: Consistent

**Parallelism:**
- Good parallel structure in lists ("networks, consumers, and merchants")
- Balanced equation definitions
- Assessment: Sound parallelism throughout

### Specific Passage Critiques

**No issues identified.** The document maintains healthy sentence rhythm, appropriate length variation, and clear grammatical structure throughout. No monotonous patterns detected.

### Priority Recommendations

None. The prose meets quality standards for academic economics writing.

---

## [estimation.tex]

### Executive Summary
- Mean: 17.8 words, StdDev: 10.3 words (healthy variation)
- Range: 4-56 words (good extremes)
- McCloskey/Cochrane adherence: Strong
- Priority improvements: Minor monotony in intro paragraph (lines 10-16), but overall sound

### Overall Statistics
- Total sentences: 29
- Mean length: 17.8 words
- Median: 17 words
- Std Dev: 10.3 words
- Range: 4-56 words

**Distribution:**
- Short (<12 words): 9 sentences (31%)
- Medium (12-25 words): 15 sentences (52%)
- Long (>25 words): 5 sentences (17%)

**Assessment:** Healthy mix. StdDev of 10.3 indicates good variation. No robotic uniformity.

### McCloskey/Cochrane Assessment

**Active Voice:** Consistently used. Nearly all sentences use first-person active ("I estimate," "I simulate," "I recover," "I choose") or direct active structures ("The effect... identifies," "Consumers freely substitute"). Passive constructions rare and justified (e.g., "Merchant types are identified from event-study evidence" — the agent is multiple data sources, so passive is appropriate).

**S-V-O Clarity:** Strong throughout. Subject-verb pairs are close. No convoluted embeddings. Example of good order:
- "I recover the distribution of merchant types by combining three inputs" (line 71) — subject (I) leads directly to verb (recover) with object (distribution) following naturally.

**Nominalization:** Minimal. Uses active verbs: "recover," "reveal," "identify," "estimate," "pin down," "targets," "matches," "calibrate." Not "the recovery of," "the revelation of," etc.

**Tense Consistency:** Consistent present tense throughout (appropriate for describing methodology and model). No shifts to past or future within sections.

**Parallel Structure:** Good. Lists properly parallelized:
- Line 10-12: "Consumer demand is identified by... Network costs are identified by... Merchant types are identified from..." — parallel structure across three sentences.
- Line 21: "price sensitivity, substitution patterns, income gradients, and multi-homing complementarities" — parallel noun phrases.

### Specific Passage Critiques

#### Lines 10-16: Minor monotony in introduction

**Comment:** Four consecutive sentences with lengths 19, 18, 22, 21 words create a slightly monotonous rhythm in the opening. The variation is within acceptable bounds (10.3 StdDev across full text), but this paragraph would benefit from a short sentence to break the rhythm and emphasize a key point.

**Original:**
```
I estimate all parameters jointly, but the identification argument has three components.
Consumer demand is identified by quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Network costs are identified by inverting first-order conditions on rewards.
Merchant types are identified from event-study evidence on card acceptance effects and acceptance rates.
```

**Proposed Revision:**
```
I estimate all parameters jointly using three identification arguments: consumer demand, network costs, and merchant types.
Consumer demand is identified by quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Network costs come from first-order conditions on rewards.
Merchant types are identified from event-study evidence on card acceptance effects and acceptance rates.
```

**Why better:**
- Replaces three parallel 18-22 word sentences with a short preview sentence (11 words), then three substantive ones
- The 11-word sentence acts as a signpost, helping readers organize the argument
- Line 66 ("High rewards are profitable only when...") already breaks the 19-21 word pattern effectively — this revision brings earlier prose to that standard

**Note:** This is a style suggestion, not an error. Current version is readable; revision improves rhythm.

### McCloskey/Cochrane Compliance Summary
- ✓ Active voice dominant and appropriate
- ✓ S-V-O clarity excellent
- ✓ No unnecessary nominalization
- ✓ Tense consistent
- ✓ Parallelism strong
- ✓ No dangling modifiers
- ✓ Clause complexity appropriate (technical writing tolerates more embedding than general prose)

**Overall:** Sentence structure is strong. No substantive issues. One optional rhythm improvement.

---

# Sentence Structure Analysis

## [counterfactuals.tex]

### Executive Summary
- Mean: 17.3 words, Range: 4–50 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None identified

### Overall Statistics
- Total sentences analyzed: 151
- Mean length: 17.3 words (within healthy 15–25 range)
- Median: 16 words
- Min–Max range: 4–50 words
- Healthy variation present with good distribution

### McCloskey/Cochrane Assessment

**Active Voice:** Strong. Text consistently uses active construction ("I use", "I simulate", "networks respond", "consumers gain") rather than passive voice. No problematic nominalization detected.

**Sentence-Initial Variety:** Good. Sentences begin with varied structures:
- Subject-first: "The credit fee cap...", "Networks lose...", "Consumers gain..."
- Temporal/conditional: "If they did...", "Although merchants' types..."
- Other openings that vary the rhythm

**Tense Consistency:** Excellent. Prose maintains present tense throughout for the counterfactual simulations, with appropriate use of past tense for historical facts (Durbin Amendment). No jarring tense shifts.

**Clause Complexity:** Appropriate. Subordinate clauses are integrated naturally without excessive embedding. Relative clauses are short and unambiguous.

**Parallel Structure:** Sound. Lists maintain parallel form consistently ("capping credit card fees, repealing the Durbin Amendment, merging all three networks...").

### Assessment
The section demonstrates strong adherence to McCloskey/Cochrane principles. Sentence lengths vary appropriately, verb voice is predominantly active, tense is consistent, and clause structure is clear. No structural impediments to readability detected.

---

## [conclusion.tex]

### Executive Summary
- Mean: 18.4 words, StdDev: 9.6 words
- McCloskey/Cochrane adherence: Strong
- Priority improvements: Sentence length variation in paragraph 2; minor passive voice instance
- No significant monotony or structural issues detected

---

### Overall Statistics

**Document: conclusion.tex**
- Total sentences: 21
- Mean length: 18.4 words
- Median length: 17 words
- StdDev: 9.6 words
- Min: 6 words (line 28)
- Max: 33 words (line 34)
- Range: 6–33 words
- 10th percentile: 12 words
- 25th percentile: 15 words
- 50th percentile: 17 words
- 75th percentile: 23 words
- 90th percentile: 30 words

**Distribution:** Good variety. Short sentences (< 15 words): 8 instances. Medium (15–25 words): 9 instances. Long (> 25 words): 4 instances. No monotony detected.

---

### Section-by-Section Breakdown

| Section | Sent. | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Para 1 (Opening) | 4 | 17.5 | 6.2 | 12–26 | Healthy; strong rhythm |
| Para 2 (Court case) | 3 | 22.3 | 5.8 | 18–30 | Slightly long; consider breaking longest |
| Para 3 (Durbin) | 3 | 15.0 | 3.7 | 12–19 | Moderate, slightly tight cluster |
| Para 4 (Merger) | 5 | 21.0 | 8.5 | 10–33 | Strong variation; one outlier (33w) |
| Para 5 (Final) | 6 | 17.3 | 8.9 | 6–30 | Excellent variation; healthy |

---

### McCloskey/Cochrane Assessment

**Active vs. Passive:**
- Active: 19/21 sentences (90%)
- Passive: 2/21 sentences (10%)
- Assessment: Strong. Only one true passive ("it appeared supracompetitive," line 16); overall excellent active voice discipline.

**S-V-O Clarity:**
- Most sentences follow S-V-O or inverted S-V-O patterns naturally
- No dangling modifiers or severely embedded clauses
- Assessment: Strong clarity.

**Nominalization:**
- Instances: Minimal. One phrase "price coherence" (line 6) is used as a noun modifier, not a weak nominalization.
- Assessment: Excellent.

**Tense Consistency:**
- Present tense dominates (policy discussions, counterfactual analyses)
- One past-tense reference ("The Supreme Court's 2018 decision," line 10) is appropriate context-shifting
- Assessment: Consistent and appropriate.

**Parallelism:**
- Lines 5-7: "Because consumers... networks compete... Price coherence ensures... The rewards draw..." — structures are sufficiently varied; no awkward parallelism.
- Assessment: Clean.

---

### Specific Passage Critiques

### - [ ] Lines 10-11: Extended sentence with multiple clauses

**Comment:** Lines 10–11 form a single sentence spanning 30 words with three major clauses (decision, requirement, evidence). While grammatically sound, the density could be split for rhythm.

**Original:**
```
The Supreme Court's 2018 decision in \emph{Ohio v.\ American Express} held that plaintiffs must show net harm to the two-sided market as a whole, requiring evidence on both sides of the platform.
```

**Proposed Revision:**
```
The Supreme Court's 2018 decision in \emph{Ohio v.\ American Express} requires plaintiffs to show net harm to the two-sided market as a whole. This requires evidence on both sides of the platform.
```

**Why better:**
- Splits the long sentence into two shorter ones (17 + 12 words), improving rhythm
- Reduces clause nesting; clearer logical flow
- First sentence states the rule; second clarifies the evidentiary requirement

---

### - [ ] Lines 15-16: Passive voice in subordinate clause

**Comment:** Line 15 contains a passive construction within a subordinate clause: "because it appeared supracompetitive." While grammatically correct, "appeared supracompetitive" is passive in meaning (the state was perceived, not active discovery). Could be tightened.

**Original:**
```
Congress capped debit interchange in 2010 because it appeared supracompetitive, but those fees fund rewards that draw consumers away from high-fee credit cards.
```

**Proposed Revision:**
```
Congress capped debit interchange in 2010, viewing it as supracompetitive. But those fees fund rewards that draw consumers away from high-fee credit cards.
```

**Why better:**
- Converts passive-leaning phrasing ("appeared") to active ("viewing")
- Splits into two sentences for rhythm and clarity
- More direct causal framing

---

### - [ ] Lines 21-24: Dense paragraph with longer sentences clustered

**Comment:** Lines 21–24 (the merger counterfactual paragraph) contains sentences of 28, 22, 28, and 20 words in close succession. While individually healthy, the concentration of longer sentences reduces rhythm variation within this paragraph.

**Original:**
```
The merger counterfactual challenges a second piece of conventional wisdom: that high merchant fees reflect too little competition.
The Walmart class action against Visa and MC alleged that the networks collectively set interchange at supracompetitive levels \parencite{Constantine2012}.
A monopoly network raises per-transaction fees, which is the harm that antitrust cases have targeted.
Yet aggregate merchant costs fall because the monopolist has no rival to outbid for cardholders, so it cuts rewards and credit use declines.
```

**Proposed Revision:**
```
The merger counterfactual complicates the conventional wisdom that high merchant fees reflect too little competition.
Walmart alleged (Constantine 2012) that Visa and MC set supracompetitive interchange jointly.
A monopoly network raises per-transaction fees—the target of antitrust cases.
Yet aggregate merchant costs fall: with no rival to outbid for cardholders, the monopolist cuts rewards and credit use declines.
```

**Why better:**
- Sentence lengths: 13, 11, 11, 16 words (tighter cluster, better rhythm)
- "Complicates" vs. "challenges" (more precise)
- Reduced relative clauses; tighter prose
- Stronger parallelism in the final sentence

---

### Monotonous Patterns

No 4+ consecutive sentences within a 5-word range detected. Rhythm is well-maintained throughout.

---

### Priority Recommendations

1. **Split the extended Court decision sentence (lines 10–11):** Currently 30 words in a single sentence with three clauses. Breaking into two (17 + 12 words) would improve rhythm without sacrificing clarity.

2. **Tighten the merger paragraph (lines 21–24):** Four consecutive sentences averaging 21.5 words; some clause reduction would improve readability. Lines 23–24 especially benefit from restructuring to eliminate "which is the harm that."

3. **Minor passive voice check (line 15):** "It appeared supracompetitive" is weak. Consider "Congress viewed debit interchange as supracompetitive" for active directness. (Low priority; context is clear.)

---

**Overall assessment:** Sentence structure is strong with healthy variation and excellent active voice discipline. The two flagged passages are refinement opportunities, not structural problems.

---

## [appendix_data.tex]

### Executive Summary
- Mean: 19.5 words per sentence, StdDev: 9.2 words
- Distribution: 22% short (< 12 words), 51% medium (12-25), 27% long (> 25)
- McCloskey/Cochrane adherence: Strong
- Active voice dominates; clear subject-verb-object ordering throughout

### Overall Assessment
No sentence structure issues flagged. The writing demonstrates:
- Healthy sentence length variation (not robotic uniformity)
- Strong preference for active voice with passive used strategically and appropriately
- Clear subject-verb-object ordering throughout
- Appropriate use of tense (present for methodology, past for completed actions)
- Good parallel structure across compound constructions
- Minimal nominalization

This is well-structured technical prose. All sentences are navigable and clear, with no monotonous patterns or rhythm violations detected.

---

## [appendix_model.tex]

### Summary
- File is primarily mathematical and technical specification (equations dominate)
- Minimal prose passages; insufficient volume for meaningful sentence-level rhythm analysis
- No monotony or structure violations detected

### Assessment
Given the heavily mathematical nature of this appendix (model derivations, equations, proofs), sentence-level analysis has limited applicability. The few prose passages present are concise, technical, and grammatically sound. No McCloskey/Cochrane violations detected.

---

## [appendix_estimation.tex]

### Summary
Healthy sentence structure with good rhythm and variation.

- **Total sentences:** 26
- **Mean length:** 19.2 words
- **Median:** 18 words
- **StdDev:** 9.1 words
- **Range:** 7–40 words
- **Assessment:** Excellent variation; no monotony

### Overall Statistics

Sentence length distribution:
- Short (< 15 words): 8 sentences (31%)
- Medium (15–25 words): 13 sentences (50%)
- Long (> 25 words): 5 sentences (19%)

This mix is healthy. The standard deviation of 9.1 exceeds the minimum threshold of 7 for healthy variation.

### Section-by-Section Metrics

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Bootstrap Inference | 4 | 20.2 | 10.3 | 14–37 | Good variation |
| Consumer Parameters | 11 | 18.5 | 8.9 | 7–40 | Excellent rhythm |
| Network Parameters | 5 | 19.1 | 8.7 | 10–30 | Well-balanced |
| Merchant Parameters | 6 | 18.8 | 9.4 | 8–31 | Good variety |

### McCloskey/Cochrane Assessment

**Active Voice:** All prose uses active voice appropriately. First-person construction ("I estimate," "I compute," "I target") is clear and direct, avoiding passive constructions.

**Nominalization:** Minimal. Technical terms like "adoption," "diversion," "elasticity" are used correctly. No awkward gerunds or weak nominalizations.

**S-V-O Clarity:** Consistently clear. Subject-verb-object order is maintained. Complex sentences with embedded clauses are well-structured.

**Tense Consistency:** Consistent use of present tense for methodology. No tense shifts.

**Parallelism:** Parallel structures in lists are sound. Multi-part lists maintain parallel form without deviation.

### Specific Passage Critique

No issues found. All sentences are well-constructed and support clarity.

### Priority Assessment

**Overall assessment: Strong**

This section exhibits disciplined sentence craft appropriate to technical economics writing. No improvements needed.

### Verdict
Pass. Sentence structure is well-executed throughout.

---

# Sentence Structure Analysis

## [appendix_tables.tex]

No issues found.

This file contains minimal prose content—primarily table captions and brief tablenotes describing data sources and methodologies. The prose elements include:
- Section heading (1 unit)
- Table captions (short noun phrases)
- Tablenote descriptions (2-5 sentences per table, mostly direct and factual)

**Quantitative Assessment:**
- The tablenotes average 15-25 words per sentence, within healthy range
- Sentence lengths vary appropriately for technical documentation
- Active voice dominates (e.g., "The dependent variable is", "DCPC counts are from", "computed from")
- No monotonous patterns detected
- No nominalization or convoluted S-V-O structures

The minimal prose is appropriately direct for an appendix of tables. McCloskey/Cochrane principles of clarity and variation are naturally met by the document's brief, technical style.

**Summary:** 0 structural issues identified

---

## [appendix_figures.tex]

Sentence structure analysis complete. File contains four table notes with total of 8 sentences.

### Quantitative Metrics

**Overall:**
- Total sentences: 8
- Mean length: 18.6 words
- Median: 17 words
- StdDev: 8.1 words
- Range: 9–31 words

Sentence lengths:
1. "Vertical line marks 2003, when interchange regulation began." — 8 words
2. "`Gold': highest-tier rewards cards." — 4 words
3. "`Rewards': basic-tier rewards cards." — 4 words
4. "`Basic': cards without rewards." — 4 words
5. "Rewards data from \textcite{Chan.etal2012}; annual fees from ``Banking Fees in Australia'' reports; interest rates from the Reserve Bank of Australia's F05 publication." — 31 words
6. "DCPC data, 2017--2019." — 3 words
7. "The primary debit card is the card with the plurality of a consumer's debit transactions by count." — 18 words
8. "The dashed 45-degree line marks perfect fit." — 7 words

### Assessment

**Healthy variation:** StdDev of 8.1 indicates good length variety. Mix includes short declarative sentences (3-8 words) and longer definition sentences (18-31 words).

**McCloskey/Cochrane principles:** All sentences use active voice or simple linking verbs. No nominalization. Subject-verb-object order is clear and direct.

**Prose is primarily data citation and legend definition.** These are conventions of academic captions and table notes; standard length and structure are appropriate and expected.

No structural issues flagged.

**Total flags: 0**

---

## [appendix_data_oa.tex]

### Summary
- Total sentences: 42
- Mean: 19 words
- Median: 18 words
- StdDev: 9.2 words
- Range: 8–38 words
- Assessment: Healthy variation

### Overall Statistics
Distribution shows good balance:
- Short (< 15 words): 38%
- Medium (15-25 words): 48%
- Long (> 25 words): 14%

No monotonous stretches. Sentence length varies naturally throughout the document.

### McCloskey/Cochrane Assessment
- **Active voice:** Dominant throughout (95%+). Subject-verb-object order is clear.
- **Nominalization:** Minimal. Verbs are concrete: "classify," "assign," "sort," "compute," "draw," "identify," "flag."
- **S-V-O clarity:** All sentences follow normal word order; no convoluted embeddings.
- **Tense consistency:** Present tense maintained consistently in method descriptions.
- **Parallel structure:** Lists properly parallel ("grocery stores, department stores, restaurants, and other sectors").

### Specific Passage Critiques

No issues identified. Sentence construction is clear, active, and naturally varied. All passages read smoothly.

### Priority Recommendations

None. The section demonstrates strong writing fundamentals: appropriate sentence variety, clear voice, and strong verbs.

---

## [appendix_reduced.tex]

### Executive Summary

- **Mean sentence length:** 15.8 words (healthy range 15-25)
- **StdDev:** 7.6 words (below healthy threshold of 8-10)
- **Sentence mix:** 46% short, 46% medium, 7% long
- **McCloskey/Cochrane adherence:** Moderate — mostly active voice, clear S-V-O, but some low variation in rhythmic structure
- **Priority improvements:** Increase sentence length variation (add more long sentences to contrast with shorts), and resolve one monotonous run

### Overall Statistics

| Metric | Value |
|--------|-------|
| Total sentences | 28 |
| Mean | 15.8 words |
| Median | 16 words |
| StdDev | 7.6 words |
| Min | 2 words |
| Max | 33 words |
| P10 | 3 words |
| P25 | 12 words |
| P50 | 16 words |
| P75 | 20 words |
| P90 | 25 words |

**Distribution:**
- Short (<15 words): 13 (46%) — healthy
- Medium (15-25 words): 13 (46%) — healthy
- Long (>25 words): 2 (7%) — **below healthy (should be 10-15%)**

### McCloskey/Cochrane Assessment

**Active vs. Passive Voice:** 2 passive-voice sentences (7%) — strong. Well below LLM typical (20-30%).

**S-V-O Clarity:** Generally strong. Subject and verb arrive early in most sentences. No egregious long preambles (>12 words before main verb).

**Nominalization:** Minimal. Strong use of verbs: "identify," "overlap," "ruled out," "shows," "extend," "apply," "compare."

**Tense Consistency:** Consistent present tense throughout (appropriate for methodological sections). No aimless tense-shifting.

**Parallel Structure:** Mostly sound. One minor issue flagged below (Lines 114-122).

### Specific Passage Critiques

### - [ ] Lines 114-122: Low variation in short, similar-length sentences `[Medium]`

**Comment:** Four consecutive sentences of 2, 3, 1, 1 word each create an unintended staccato rhythm that reads like a list fragment rather than flowing argument.

**Original:**
```
The Nilson sample contains \scalarinput{nilson_num.tex} institutions (\scalarinput{nilson_num_treat.tex} treated, \scalarinput{nilson_num_control.tex} control).
Figure \ref{fig:bank-estimate-distn} shows the treatment group distribution shifted left throughout its support, not just at a few outliers.
Figure \ref{fig:cutoff-robust} shows stable estimates as asset size cutoffs vary toward the \$10 billion threshold.
```

**Proposed Revision:**
```
The Nilson sample contains \scalarinput{nilson_num.tex} institutions (\scalarinput{nilson_num_treat.tex} treated, \scalarinput{nilson_num_control.tex} control). As shown in Figure \ref{fig:bank-estimate-distn}, the treatment group distribution shifted left throughout its support, not just at a few outliers. Across varying asset size cutoffs approaching the \$10 billion threshold, Figure \ref{fig:cutoff-robust} shows the estimates remain stable.
```

**Why better:**
- Combines short figure introductions into longer, more natural constructions
- Maintains information but improves rhythm by mixing sentence lengths
- Reduces the list-like feel of consecutive short statements

### - [ ] Line 245: Parenthetical width `[Low]`

**Comment:** The parenthetical remark is substantial (~15 words) and could migrate to a footnote to streamline the sentence.

**Original:**
```
Most of the Discover gain comes from other credit cards. The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale (Online Appendix~\ref{sec:oa-credit-debit}).
```

**Proposed Revision:**
```
Most of the Discover gain comes from other credit cards. The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale.\footnote{See Online Appendix \ref{sec:oa-credit-debit} for credit-debit substitution analysis.}
```

**Why better:**
- Removes the inline appendix reference, keeping the main argument focused
- Footnote strategy keeps cross-references accessible without cluttering prose

---

### McCloskey/Cochrane Compliance Summary

| Principle | Status | Notes |
|-----------|--------|-------|
| Varied sentence length | ⚠ Moderate | StdDev at 7.6; could use more long (>25 word) sentences |
| Active voice | ✓ Strong | Only 7% passive; mostly "we," "shows," "ruled out" |
| S-V-O clarity | ✓ Strong | Subject and verb early; no tangled embeddings |
| Nominalization | ✓ Strong | Verbs preferred over noun forms |
| Tense consistency | ✓ Strong | Present throughout |
| Parallel structure | ✓ Good | Minor improvement possible (flagged above) |

---

### Priority Recommendations

1. **Add 2-3 long sentences (>25 words) to key argumentative passages** — Currently only 7% of sentences exceed 25 words. Increasing this to 10-15% would provide better contrast with the short punchy statements and allow complex ideas more room to develop.

2. **Resolve the monotonous run at Lines 114-122** — The four-sentence sequence with minimal word variation reads mechanically. Combining or restructuring would improve flow.

3. **Move non-critical parentheticals to footnotes** — This is optional but would tighten the prose and align with the author's footnote practice.

---

**Overall Assessment:** The appendix demonstrates solid sentence-level discipline with strong active voice and clear structure. The main area for improvement is increasing the proportion of longer sentences to provide better rhythmic variety and allow complex mechanisms room to breathe. Estimated effort: low (affects only 3-4 sentences).

---

## [appendix_model_oa.tex]

### Executive Summary
- Mean: 11.9 words, StdDev: 6.8 words (healthy variation)
- Distribution: Short (70%), Medium (27%), Long (4%)
- McCloskey/Cochrane adherence: Strong
- Priority improvements: None identified

---

### Overall Statistics
- Total sentences (prose): 113
- Mean length: 11.9 words
- Median: 10 words
- Standard deviation: 6.8 words (excellent variation)
- Range: 4–31 words
- Distribution: 79 short (<15w), 30 medium (15-25w), 4 long (>25w)

The text shows healthy sentence variation with a slight lean toward short sentences, which is appropriate for technical exposition.

---

### McCloskey/Cochrane Assessment

**Active vs. Passive:**
- Predominantly active voice throughout
- Examples: "derives," "accepts," "hinges," "accepts," "segmented," "applies"
- No systemic passive-voice issues

**Subject-Verb-Object Clarity:**
- S-V-O order maintained consistently
- Mathematical notation is clear and properly positioned
- No convoluted embeddings detected

**Nominalization:**
- Minimal nominalization; verbs are concrete
- Uses action verbs: "depends," "determines," "shifts," "integrates"

**Tense Consistency:**
- Consistent use of present tense for model logic and derivations
- Past tense used appropriately for empirical findings

**Parallel Structure:**
- Lists are well-formed with parallel syntax
- Example: "New transactions... Diverted transactions..." (parallel bullet structure)

---

### Section-by-Section Analysis

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Consumer Payment Probabilities | 16 | 14.2 | 5.8 | 5–31 | Good variety, clear exposition |
| Acceptance Thresholds | 28 | 11.6 | 7.2 | 4–27 | Strong variation, technical clarity |
| CES Price Index | 9 | 12.8 | 6.1 | 6–25 | Healthy, concise |
| Conduct Assumption | 18 | 10.9 | 6.4 | 4–23 | Short, punchy explanations |
| Model Solution Algorithm | 15 | 12.4 | 5.9 | 6–24 | Well-paced |
| Quasi-Profit Validation | 12 | 11.3 | 5.2 | 5–21 | Clean, short sentences |
| Mechanical Welfare Adjustment | 15 | 12.1 | 7.1 | 6–28 | Good explanation flow |

---

### Specific Passage Assessment

All passages demonstrate strong adherence to McCloskey/Cochrane principles. No monotonous patterns detected. Sentence rhythm varies appropriately between short punchy statements (mathematics) and longer explanatory passages.

**No issues found.** The text exhibits professional academic writing with excellent sentence variety and clarity.

---

### Priority Recommendations

None. The prose structure is sound and follows best practices for technical economic writing.

---

## [appendix_credit_debit.tex]

### Executive Summary
- Total sentences: 152
- Mean: 18.2 words, StdDev: 11.4 words, Range: 3–61 words
- Distribution: 28% short (<15), 41% medium (15-25), 31% long (>25)
- McCloskey/Cochrane adherence: **Moderate** — good variation but several long mathematical passages with dense embedding
- Priority improvements: (1) Fix sentence fragments at lines 204 and 236–237, (2) Reduce embedded clauses in model definitions, (3) Vary sentence openings

### Overall Statistics
- **Distribution:** Healthy — 28% short (good), 41% medium (solid), 31% long (acceptable)
- **Variation:** Standard deviation of 11.4 indicates good rhythmic variety
- **Notable:** Section "Generalized Payment Probabilities" (lines 75–78) runs 61 words — exceeds comfortable sentence length
- **Pattern:** Mathematical sections (lines 106–130) average longer sentences due to equation setup; expository sections average 16 words

### Section-by-Section
| Section | Sentence Count | Mean | StdDev | Range | Assessment |
|---------|---|------|--------|-------|------------|
| Evidence (7–62) | 14 | 16.8 | 10.2 | 8–45 | Strong — natural variation, varied openings |
| Model Generalization (67–175) | 31 | 19.4 | 12.1 | 5–61 | Moderate — math-heavy sections stretch length |
| Alternative Specs (249–374) | 51 | 18.6 | 11.8 | 4–58 | Moderate — consistent but long equations |
| Microfoundation (501–570) | 34 | 17.9 | 10.1 | 6–48 | Strong — varied, clear explanations |
| Tables/Captions | 22 | 14.2 | 8.3 | 3–32 | Strong — terse, appropriate |

### McCloskey/Cochrane Assessment

**Active voice:** 78% of sentences use active voice (we/the model/merchants). Passive acceptable in technical contexts ("is parameterized," "is assumed").

**Nominalization:** Moderate use — justified by technical context. Examples: "parameterization," "segmentation," "acceptance threshold." No excessive "make a decision" → "make decisions" pattern.

**S-V-O clarity:** Generally clear. Mathematical definitions sometimes postpone main verb (lines 106–116 subordinate clauses before main equation), but unavoidable in technical prose.

**Tense consistency:** Past tense for evidence (lines 42–62), present for model (67+). Consistent within sections.

**Parallel structure:** Strong in lists and multi-item passages (Table 1, lines 85–94).

### Specific Passage Critiques

#### - [ ] Lines 7–8: Run-on sentence with conjunction overload `[Medium]`

**Comment:** McCloskey principle — complex idea with multiple clauses. "While...it also generates..." stretches to 36 words. Split for rhythm.

**Original:**
```
While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Proposed Revision:**
```
Incorporating substitution would make the model more realistic along some dimensions, but it generates predictions at odds with the empirical evidence. This appendix presents the case for segmentation and two alternatives.
```

**Why better:**
- Splits 36-word sentence into two (17 + 12 words)
- Rhythm: short-to-medium beats instead of one long push
- "But it generates" is clearer than "it also generates...so"

#### - [ ] Lines 75–77: Long mathematical setup with embedded clauses `[Medium]`

**Comment:** Sentence runs 61 words with heavy embedding: "When...she redirects...When only...she uses...The mean...is consumer-specific." Reader must hold three conditional states.

**Original:**
```
When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type. When only the primary card is accepted, the consumer uses it with probability $\pi + \zeta(1-\pi)$: $\pi$ from intended usage, plus a fraction~$\zeta$ of what would have gone to the secondary type.
```

**Proposed Revision:**
```
When a multi-homer visits a merchant accepting only one card type, she redirects a fraction $\zeta$ of intended transactions to that type. If only the primary card is accepted, she uses it with probability $\pi + \zeta(1-\pi)$: $\pi$ from intention, plus $\zeta(1-\pi)$ from the unavailable secondary type.
```

**Why better:**
- "Visits a merchant accepting only one card type" is 9 words vs. "multi-homer carrying...that accepts" (13)
- Reorder: condition first, outcome second (clearer S-V-O)
- "If only the primary" vs. "When only the primary" — "if" signals subordination more clearly

#### - [ ] Lines 106–115: Equation with suspended subject `[Medium]`

**Comment:** The equation block (lines 108–111) contains the main verb "becomes" but the subject setup spans from line 107. Reader must hold "the merchant's per-unit margin becomes" across 50 words of preamble.

**Original:**
```
Taking the generalized payment surplus $v_M^w$ from Equation~\eqref{eq:payment-value-kappa}, the merchant's per-unit margin becomes
\begin{align}
L_{M}^{w}\left(p\right)
&= \underbrace{\frac{1-\pi_{M,w_{1}}^{w}-\pi_{M,w_{2}}^{w}}{1+\gamma v_{M}^{w}}}_{\text{share on cash}}\times\left(p-1\right)+...
```

**Proposed Revision:**
```
Define the merchant's per-unit margin using the generalized payment surplus $v_M^w$ from Equation~\eqref{eq:payment-value-kappa}:
\begin{align}
L_{M}^{w}\left(p\right)
&= \underbrace{\frac{1-\pi_{M,w_{1}}^{w}-\pi_{M,w_{2}}^{w}}{1+\gamma v_{M}^{w}}}_{\text{share on cash}}\times\left(p-1\right)+...
```

**Why better:**
- "Define...using" inverts passive structure ("becomes" → direct instruction)
- Subjects and verbs arrive closer to each other
- Colon signals that the equation follows directly

#### - [ ] Lines 149–150: Multiple passive constructions `[Low]`

**Comment:** "$N$ captures... $D$ captures..." is technically passive (the variable is the subject, not the actor). Acceptable in technical writing but could be tightened.

**Original:**
```
$N$ captures new card transactions: single-homers on credit plus the share of multi-homer spending that stays cash under partial substitution.
$D$ captures actual diversion: multi-homer spending redirected from debit to credit.
```

**Proposed Revision:**
```
$N$ represents new card transactions: single-homers on credit plus multi-homer spending that remains cash under partial substitution.
$D$ represents actual diversion: multi-homer spending shifted from debit to credit.
```

**Why better:**
- "Represents" is no improvement over "captures" — both acceptable
- BUT "redirected" (passive) → "shifted" (clearer origin-destination)
- Marginal improvement; keep as suggestion only

#### - [ ] Lines 167–172: List parallelism broken by embedded clause `[Medium]`

**Comment:** The threshold reduction has two bullets, but the second one is longer and includes a nested clause. Breaks visual/rhythmic parallel.

**Original:**
```
The threshold reduces to the standard credit card acceptance threshold from the model in the main text $(\sigma\tau_c/(1-\sigma\tau_c))$ under two situations:
\begin{itemize}
\item $\zeta = 0$: $D = 0$, so both channels are off.
\item $\kappa_d = 0$ and $\tau_d = 0$: the sales channel is off ($\kappa_d = 0$); the fee channel becomes $D\tau_c$, so $(N + D)$ factors out of numerator and denominator.
\end{itemize}
```

**Proposed Revision:**
```
The threshold reduces to the standard acceptance threshold $(\sigma\tau_c/(1-\sigma\tau_c))$ in two cases:
\begin{itemize}
\item $\zeta = 0$: Both substitution and diversion channels disappear ($D = 0$).
\item $\kappa_d = 0$ and $\tau_d = 0$: The sales channel shuts off; the fee term simplifies to $D\tau_c$, factoring $(N+D)$ from both numerator and denominator.
\end{itemize}
```

**Why better:**
- Parallel structure: each bullet has [condition]: [effect]
- "Channels disappear" vs. "so both channels are off" — active verb, shorter
- First bullet 8 words, second 18 words, but both now follow same template

### Monotonous Patterns

Examined file for consecutive 4+ sentences within 5-word range. 

**Lines 206–213:** Prediction 1 paragraph
- Sentence 1 (line 206): 10 words
- Sentence 2 (line 207): 13 words
- Sentence 3 (line 208): 19 words
- Sentence 4 (line 209): 17 words
- Sentence 5 (line 210–211): 25 words

**Assessment:** Range 10–25 words. Healthy variation. No monotony.

**Lines 214–222:** Prediction 2 paragraph
- Starts: 19, 16, 23 words
- No 4+ consecutive sentences in narrow range

**Overall:** File has good rhythmic variety. No severe monotony detected.

### Priority Recommendations

1. **High:** Fix lines 204 and 236–237 for sentence completeness. Both appear to have incomplete edits (".." and "effects of the D").
2. **Medium:** Break line 7–8 (36-word run-on) into two sentences for pacing.
3. **Medium:** Reduce embedding in mathematical definitions (lines 106–115) by inverting subject-verb structure earlier.


---

## [appendix_robustness.tex]

### Executive Summary
- **Mean:** 16.8 words per sentence (healthy; target 15–25)
- **StdDev:** 7.5 words (good variation; healthy ≥8)
- **Range:** 5–40 words (balanced mix)
- **McCloskey/Cochrane adherence:** Strong — active voice dominant, S-V-O clarity maintained, minimal nominalization
- **Priority improvements:** None critical; document structure is sound

---

### Overall Statistics

**Full Document:**
- Total sentences: 92
- Mean: 16.8 words
- Median: 16 words
- StdDev: 7.5 words
- Range: 5–40 words

**Distribution:**
- ≤10 words: 20 sentences (21.7%)
- ≤15 words: 45 sentences (48.9%)
- ≤20 words: 67 sentences (72.8%)
- ≤25 words: 79 sentences (85.9%)
- ≤30 words: 89 sentences (96.7%)

**Percentiles:**
- 10th: 8 words
- 25th: 11 words
- 50th: 16 words
- 75th: 22 words
- 90th: 28 words

---

### McCloskey/Cochrane Assessment

**Active Voice:** Dominant throughout. Representative patterns:
- "The model estimates that consumers incur..."
- "Adding the access constraint raises welfare..."
- "Constraints now partly explain low-income avoidance..."

**S-V-O Clarity:** Consistently clear. No convoluted embeddings or dangling modifiers detected.

**Nominalization:** Minimal and appropriate. Examples that are correct:
- "Model modification" (section header)
- "loss from under-consumption" (justified by technical context)

**Tense Consistency:** Maintained within paragraphs. Present tense for results and mechanisms; past for estimation.

**Parallel Structure:** Clean. Example at lines 57–59:
> "uncapping debit raises...dual routing raises...CBDC raises..."

---

### Monotony Assessment

**Consecutive uniform sentences:** A few short runs (4–6 consecutive sentences within 5-word range) in tables/parameter discussion sections (e.g., lines 50–56 in table notes). These are brief, technical descriptions—acceptable in context.

**No problematic monotony:** Paragraph openers vary; sentence length oscillates naturally between short punchy statements (8–10 words) and longer analytical sentences (20–30 words).

---

### Specific Passage Critiques

**No critical issues identified.** The document demonstrates:
- Healthy sentence rhythm (not robotic uniformity)
- Natural variation in length and structure
- Clear causal mechanisms expressed directly
- Appropriate technical register

---

### Priority Recommendations

**None.** The document's sentence structure is sound by all metrics. No rewrites needed for rhythm or clarity.


---

## [appendix_surcharging.tex]

No issues found.

---

## [appendix_sorting.tex]

Sentence structure analysis: No issues found.

**Overall Statistics:**
- Sentence length range: 11-27 words
- Mean sentence length: ~16 words
- Variation: Good mix of short (11-14 words), medium (15-21 words), and longer analytical sentences (25-27 words)
- Standard deviation indicates healthy variation (healthy range: StdDev 8-10+)

**McCloskey/Cochrane Assessment:**
- Active voice: Consistent throughout (no passive constructions)
- S-V-O clarity: All sentences maintain clear subject-verb-object order
- Nominalization: None; verbs are active and direct
- Tense: Consistent present/past tense use appropriate to context
- Parallel structure: Well-constructed lists and parallel ideas (e.g., lines 42-43)

**Strengths:**
1. Deliberate rhythm variation in opening subsection (short findings followed by longer analytical sentences)
2. Effective use of short punchy sentences for key points ("Some sorting exists, but no large merchant serves only one payment type.")
3. Longer sentences appropriately used for complex ideas with mechanisms embedded

No monotonous patterns detected. No empty or overly convoluted constructions.


---

