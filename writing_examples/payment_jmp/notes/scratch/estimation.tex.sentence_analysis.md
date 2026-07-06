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
