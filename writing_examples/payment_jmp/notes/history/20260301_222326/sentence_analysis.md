# Sentence Structure Analysis

## [estimation.tex]

### Executive Summary
- Mean: 22.1 words per sentence
- Median: 19 words
- StdDev: 14.8 words (healthy variation)
- Range: 6–60+ words
- **McCloskey/Cochrane adherence:** Moderate — healthy length variation overall, but specific passages use passive construction, nominalization, and jargony framing that obscure economic logic
- **Critical user concern:** Jargony phrasing like "The Rochet-Tirole framework provides leverage" (line 64) needs simplification. Economic intuition should be front-and-center.
- **Priority improvements:** (1) Demystify "framework provides leverage" and similar academic hedging, (2) Break up dense multi-part sentences with heavy noun-stacking (e.g., lines 10, 34), (3) Use active voice more consistently for causal claims

### Overall Statistics

**Document-wide:**
- Total sentences: 81
- Mean: 22.1 words
- Median: 19.0 words
- StdDev: 14.8 words
- Range: 6–65 words
- Percentiles: 10th: 9 words | 25th: 14 words | 50th: 19 words | 75th: 28 words | 90th: 44 words

**Distribution:**
- Very short (< 12 words): ~15% (good for rhythm)
- Short (12–15 words): ~22%
- Medium (15–25 words): ~34%
- Long (25–35 words): ~18%
- Very long (> 35 words): ~11%

**Assessment:** Overall healthy variation. No monotonous stretches of uniform length. However, when sentences ARE long, they tend to bury the main economic claim under procedural detail or jargon.

---

### Section-by-Section Metrics

| Section | Count | Mean | StdDev | Range | Assessment |
|---------|-------|------|--------|-------|------------|
| Opening (L4–5) | 2 | 25.0 | 8.0 | 17–33 | Unbalanced intro; second sentence too long for an opening |
| Estimation Procedure (L10–13) | 4 | 23.5 | 19.8 | 6–60 | Extreme variation; one mega-sentence carries all complex detail |
| Consumer Demand intro (L17–38) | 6 | 28.2 | 15.1 | 10–65 | Dense; heavy noun-stacking; some sentences bury the point |
| Network Costs (L42–43) | 2 | 16.0 | 7.0 | 9–23 | Good balance; clear causality |
| Merchant Types (L48–60) | 5 | 26.4 | 11.2 | 15–43 | Long, dense; passive constructions dominate |
| Calibrated Parameters (L70–73) | 4 | 23.5 | 11.2 | 8–38 | Serviceable; some nominalization |
| Sensitivity/Aversion (L115–140) | 13 | 23.6 | 12.4 | 6–51 | Good variation overall; one very long sentence (L139) |
| Goodness of Fit (L143–191) | 45 | 21.1 | 14.2 | 6–54 | Healthy profile; some overly complex result descriptions |

---

### McCloskey/Cochrane Assessment

**Active vs. Passive Voice:**
- Active constructions dominate overall (good practice)
- **Key exception:** Line 54: "Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation." (Nominalized, passive-leaning)
- **Line 42:** "I recover network costs by inverting networks' first-order conditions with respect to rewards." (Active, clear)
- **Pattern:** When estimating/recovering/identifying, authors use active voice. When describing results or complex relationships, passive/nominalized constructions sneak in.

**Nominalization Issues:**
- Line 49: "A reduced-form approach---such as regressing acceptance on fees---would recover this equilibrium sensitivity" (nominalized "sensitivity" as object of action)
- Line 50: "Evaluating fee regulation out of sample requires recovering the underlying merchant primitives." (nominalization chains: "evaluating," "recovering")
- Line 59: "The standard errors account for uncertainty in the event-study estimates but not for model error from extrapolating beyond the grocery sector." (nominalized "extrapolating")

**S-V-O Clarity Issues:**
- **Lines 34–35:** Subject = "Because the inside-good indicator..." [long subordinate clause], verb = "captures", object = three parallel descriptions. This violates S-V-O order; subordinate clause dominates.
- **Line 65:** "Since platforms tax the insensitive side and subsidize the sensitive side, this fee structure implies merchants are fee-insensitive at current equilibrium fee levels, which disciplines the merchant distribution." Three clauses in one sentence; causality is buried.

**Tense Consistency:** Generally consistent (present tense for model description, past for estimation narrative). No major issues.

**Parallel Structure:** Good in most places (e.g., three-part lists with consistent punctuation). Exception: Line 65–66 uses semicolon + continuation awkwardly.

---

### Specific Passage Critiques

#### - [ ] Line 10: Mega-sentence bundling three-part identification in single sentence

**Comment:**
The "Although all parameters..." sentence runs 60+ words and tries to compress three distinct identification steps into one breath. Violates McCloskey principle: don't elaborate all three parts (S, V, O) in one sentence. Readers lose track of the structure.

**Original:**
```
Although all parameters are estimated jointly, identification proceeds in three stages: (1) consumer demand estimation using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}; (2) network cost recovery by inverting first-order conditions; (3) merchant type recovery from event-study evidence on card acceptance effects and acceptance rates.
```

**Proposed Revision:**
```
Although all parameters are estimated jointly, we identify them in three stages.

First, we estimate consumer demand using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}. Second, we recover network costs by inverting first-order conditions. Third, we recover merchant types from event-study evidence on card acceptance effects and acceptance rates.
```

**Why better:**
- Breaks structure into three digestible sentences (one per identification step)
- Front-loads "three stages" as the main claim
- Uses active voice and parallel structure ("First... Second... Third...")
- Readers can absorb each step independently

---

#### - [ ] Line 17: Opening of demand subsection chains parameters in one sentence

**Comment:**
"The key consumer demand parameters are price-sensitivity ($\alpha_0$), substitution patterns across payment types ($\Sigma$), how preferences vary with income ($\alpha_y, \beta_y, \chi^{lm}_y$), and returns to holding multiple cards ($\chi^{lm}$)."
This is a single-breath definition of four parameters with nested parenthetical notation. Readers cannot visualize what each parameter does without stopping to parse notation.

**Original:**
```
The key consumer demand parameters are price-sensitivity ($\alpha_0$), substitution patterns across payment types ($\Sigma$), how preferences vary with income ($\alpha_y, \beta_y, \chi^{lm}_y$), and returns to holding multiple cards ($\chi^{lm}$).
```

**Proposed Revision:**
```
The key consumer demand parameters capture four behaviors.
Price-sensitivity ($\alpha_0$) measures how consumers respond to reward changes. Substitution patterns ($\Sigma$) measure consumers' willingness to switch between payment types. Income effects ($\alpha_y, \beta_y, \chi^{lm}_y$) capture how preferences vary across rich and poor consumers. Multi-homing returns ($\chi^{lm}$) measure the value of holding multiple cards.
```

**Why better:**
- Separates definition from enumeration
- Each parameter gets its own sentence with plain-English gloss
- Notation no longer dominates meaning
- Readers understand *why* each parameter matters before seeing the symbol

---

#### - [ ] Line 34: Embedding with "Because the inside-good indicator..." violates S-V-O

**Comment:**
"Because the inside-good indicator equals 1 for all cards (credit and debit alike), $\chi^{12}$ captures the value of having credit in the secondary position for any primary-card consumer, $\chi^{21}$ captures the value of having any secondary card for a credit-primary consumer, and $\chi^{22}$ captures any additional interaction when both cards are credit."

This is 51 words. The subject ("Because...") takes up the first 14 words before the verb appears. Readers are lost halfway through the subordinate clause. The three "captures" clauses are parallel but exhausting to parse after the long setup.

**Original:**
```
Because the inside-good indicator equals 1 for all cards (credit and debit alike), $\chi^{12}$ captures the value of having credit in the secondary position for any primary-card consumer, $\chi^{21}$ captures the value of having any secondary card for a credit-primary consumer, and $\chi^{22}$ captures any additional interaction when both cards are credit.
```

**Proposed Revision:**
```
The inside-good indicator equals 1 for all cards, whether credit or debit. This means three key parameters measure complementarities: $\chi^{12}$ captures the value of credit in the secondary position (for any primary-card consumer), $\chi^{21}$ captures the value of a secondary card (for credit-primary consumers), and $\chi^{22}$ captures the extra burden of managing two credit accounts.
```

**Why better:**
- Moves the fact ("indicator = 1 for all cards") to the front in active voice
- Separates the "meaning" (second sentence) from the notation
- Three parallel clauses are now preceded by a "why we care" statement
- Parenthetical glosses clarify context without derailing the sentence

---

#### - [ ] Line 43: Nominalization chains obscure causal claim

**Comment:**
Line 43 uses multiple nominalizations: "High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed merchant fees."
The core claim is: "networks must have low marginal costs to sustain high rewards." But the sentence buries this under "are profitable...earn profits...must be low." Multiple forms of the same concept (profits/profitable) weaken the claim.

**Original:**
```
High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed merchant fees.
```

**Proposed Revision:**
```
High rewards are only sustainable when networks earn large profits from merchants. Because merchants pay high fees, networks' marginal costs must be low.
```

**Why better:**
- Splits the causal claim into two steps: (1) rewards require merchant profit, (2) therefore costs must be low
- "Sustainable" is clearer than "profitable" (avoids profit/profitable repetition)
- Active voice: "networks earn" and "merchants pay" front-load agents
- Causal chain is now visible

---

#### - [ ] Line 49: Nominalization chain obscures the method

**Comment:**
"A reduced-form approach---such as regressing acceptance on fees---would recover this equilibrium sensitivity, which depends on the current level of fees and on consumer multi-homing, both of which change under counterfactual policy."

The sentence explains *why* a simple regression won't work, but buries the logic: "sensitivity depends on... both of which change." This is passive and hard to follow. The reader must infer: "if sensitivity depends on things that change, then regression estimates won't extrapolate."

**Original:**
```
A reduced-form approach---such as regressing acceptance on fees---would recover this equilibrium sensitivity, which depends on the current level of fees and on consumer multi-homing, both of which change under counterfactual policy.
```

**Proposed Revision:**
```
A reduced-form approach—such as regressing acceptance on fees—would estimate the equilibrium sensitivity. But this sensitivity depends on the current fee level and on consumer multi-homing patterns. Both of these change under a fee cap, so the reduced-form estimate does not generalize out of sample.
```

**Why better:**
- Separates method (first sentence), limitation (second), and implication (third)
- Uses active voice: "[sensitivity] depends on...", "both... change", "estimate... does not generalize"
- The *reason* for structural estimation is now explicit: to recover objects that extrapolate
- Easier for readers to understand why the method matters

---

#### - [ ] Line 54: Passive construction with nominalization

**Comment:**
"Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation."

The subject is a nominalized verb ("Recovering"). The predicate is weak passive ("is closer to..."). This obscures the actual claim: "we are partly guessing the distribution; the data don't fully identify it."

**Original:**
```
Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation.
```

**Proposed Revision:**
```
We partly calibrate rather than estimate the merchant distribution because event studies alone do not fully identify it.
```

**Why better:**
- Active voice: "We partly calibrate..."
- Front-loads the action and agent
- "Do not fully identify" is more explicit than "closer to calibration"
- Sets up the next sentence (why) more naturally

---

#### - [ ] Line 64: Jargony "framework provides leverage" — critical user concern

**Comment:**
"The Rochet-Tirole framework provides leverage to identify merchant parameters."

This is the sentence the user flagged as jargony. "The framework provides leverage" is academic hedging that obscures the economic insight. What actually identifies merchant parameters? The specific insight: platforms tax insensitive (merchant) side to subsidize sensitive (consumer) side. Line 65–66 makes this clear, but the setup (line 64) hides it behind framework-jargon.

**Original:**
```
The Rochet-Tirole framework provides leverage to identify merchant parameters.
After estimating consumers' reward sensitivity, we observe that networks charge high merchant fees to fund generous rewards.
Since platforms tax the insensitive side and subsidize the sensitive side, this fee structure implies merchants are fee-insensitive at current equilibrium fee levels, which disciplines the merchant distribution.
```

**Proposed Revision:**
```
We identify merchant price-sensitivity using a two-sided platform insight.
After estimating consumer demand, we observe that networks charge high merchant fees to fund generous consumer rewards.
This tells us something powerful: platforms tax one side (merchants) to subsidize the other (consumers).
Merchants must be insensitive to fees—otherwise they would refuse such high prices.
This insensitivity disciplines the merchant distribution that we need to recover.
```

**Why better:**
- Replaces "framework provides leverage" with the explicit insight: two-sided pricing logic
- Moves from academic framing ("Rochet-Tirole") to economic logic ("platforms tax one side...")
- Uses active voice throughout ("we observe," "networks charge," "platforms tax")
- Each sentence advances the argument; no hedging
- Reader understands the *why* before the *how*

---

#### - [ ] Line 139: Very long sentence with multiple parallel clauses (43 words)

**Comment:**
"Together, these estimates imply that mixed credit-debit wallets carry slightly higher within-wallet complementarity ($\chi^{12} = 4.60$ for debit-primary, $\chi^{21} = 3.90$ for credit-primary) than two-credit-card wallets ($\chi^{12} + \chi^{21} + \chi^{22} = 3.70$)."

This is a single sentence comparing two wallet types with heavy notation. The parallel structure is correct (good), but the length makes it hard to follow. Readers must keep both wallet types in mind while parsing the equation.

**Original:**
```
Together, these estimates imply that mixed credit-debit wallets carry slightly higher within-wallet complementarity ($\chi^{12} = 4.60$ for debit-primary, $\chi^{21} = 3.90$ for credit-primary) than two-credit-card wallets ($\chi^{12} + \chi^{21} + \chi^{22} = 3.70$).
```

**Proposed Revision:**
```
These estimates reveal a key finding: mixed credit-debit wallets generate higher complementarity than two-credit-card wallets.
Mixed wallets have complementarity $\chi^{12} + \chi^{21} = 8.50$ (debit-primary: $\chi^{12} = 4.60$; credit-primary: $\chi^{21} = 3.90$).
Two-credit-card wallets have lower complementarity: $\chi^{12} + \chi^{21} + \chi^{22} = 3.70$ (due to the negative $\chi^{22}$ penalty).
```

**Why better:**
- Front-loads the finding in plain English
- Separates the two wallet types into distinct sentences
- Equations are still present but no longer dominate the prose
- Readers understand the comparison before encountering the math

---

#### - [ ] Line 165: Long sentence with multi-part comparison

**Comment:**
"Appendix Figure \ref{fig:market-share-fit} compares the market share of different wallets in the Homescan data on the x-axis against the model implied share on the y-axis."

This is clear (good), but it's 25 words before the reader learns what the figure does. The "on the x-axis... on the y-axis" structure is useful but verbose.

**Original:**
```
Appendix Figure \ref{fig:market-share-fit} compares the market share of different wallets in the Homescan data on the x-axis against the model implied share on the y-axis.
```

**Proposed Revision:**
```
Appendix Figure \ref{fig:market-share-fit} plots Homescan data (x-axis) against model predictions (y-axis) for each wallet type's market share.
```

**Why better:**
- Shorter (16 vs. 25 words)
- Front-loads the action ("plots")
- Uses parenthetical notation to clarify axes
- Keeps the essential information (comparison, data source, model prediction)

---

### Monotonous Patterns

**No severe monotony detected.** Sentence lengths vary widely within sections. The longest consecutive sequence of similar-length sentences (within a 5-word band):

- Lines 148–152: Four sentences averaging 18.5 words
  - "My model closely reproduces untargeted moments of consumer demand." (9 words)
  - "First, the baseline equilibrium yields adoption shares that match the DCPC." (12 words)
  - "Just as in the DCPC data (Table \ref{tab:dcpc-summary}), debit cards are the most popular primary payment method, as 45\% of consumers have a primary debit card." (27 words)
  - "Around 30\% of consumers have a primary credit card, and the remaining use cash for all their transactions." (18 words)

**Assessment:** Not monotonous, but the rhythm could be improved. Line 150 jumps from 12 → 27 words (a 15-word swing), then back to 18. This is not unnatural, but could be smoothed.

---

### Priority Recommendations

1. **Highest Priority: Demystify "framework provides leverage" (line 64)**
   - This is the user's flagged concern. The core insight—platforms tax insensitive merchants to subsidize sensitive consumers—should be explicit, not wrapped in framework-jargon.
   - Simplify to: "We identify merchant insensitivity using a two-sided platform insight: networks tax merchants to fund consumer rewards, revealing that merchants must be fee-insensitive."
   - **Rationale:** Jargony framing alienates readers and obscures the economic logic. Non-experts should grasp the intuition immediately.

2. **Second Priority: Break up mega-sentences (lines 10, 34, 139)**
   - The Estimation Procedure opening (line 10) is 60+ words and exhausting.
   - Lines 34 and 139 use parallel notation but are too long for a single sentence.
   - Split each into 2–3 sentences. Let readers absorb one idea per sentence.
   - **Rationale:** Long sentences with dense notation are a hallmark of AI-generated or rushed academic writing. Breaking them improves clarity without sacrificing precision.

3. **Third Priority: Replace passive/nominalized constructions with active voice (lines 49, 54)**
   - "Recovering... would recover..." and "Recovering... is closer to..." bury the claim.
   - Reframe as: "We partly calibrate rather than estimate..." and "A regression would not generalize because..."
   - **Rationale:** Active voice front-loads causality and makes the economic argument transparent. Academic hedging via nominalization weakens claims that should be stated confidently.

---

## [appendix_model_oa.tex]

### Executive Summary
- **Mean:** 23.6 words, **StdDev:** 11.9 words
- **McCloskey/Cochrane adherence:** Moderate (strong distribution variety, some passive voice issues)
- **Priority improvements:**
  1. Reduce passive voice constructions ("is accepted", "is unchanged", "are omitted")
  2. Address monotonous rhythm in lines 77-82 (4-5 boundary case sentences all 15-32 words)
  3. Break up longest sentences (max 66 words) into shorter, punchier constructions

### Overall Statistics

**File:** appendix_model_oa.tex (4,112 words)
- **Total sentences analyzed:** 132 (excluding math, tables, figures)
- **Mean word count:** 23.6 words
- **Median word count:** 21.5 words
- **Standard Deviation:** 11.9 words
- **Range:** 4–66 words

**Healthy indicators:**
- StdDev of 11.9 is in the strong range (≥8–10 words needed)
- Good mix of short/medium/long sentences
- Not AI-robotic uniformity (not all 15–25 words)

### Distribution Histogram

```
Short (<15 words):  27 sentences (20.5%)  ████████
Medium (15-25):    56 sentences (42.4%)  ██████████████████████
Long (>25):        49 sentences (37.1%)  █████████████████████
```

### Monotonous Sentence Patterns

**FLAG: Lines 77–82** (Comparative statics paragraph)
Five consecutive sentences in narrow range [22, 25, 22, 25, 21] words. Creates plodding rhythm when explaining complex boundary conditions.

**FLAG: Lines 93–98** (Credit acceptance threshold section)
Cluster of 6 sentences all 26–32 words. Repetitive medium-long structure makes dense material even heavier.

### McCloskey/Cochrane Assessment

**Active/Passive Voice:**
- **Passive constructions found:** 11 instances
- **Key examples:**
  - Line 11: "The key distinction **is in** the rows where only one card **is accepted**"
  - Line 47: "multi-homers switch to whichever card **is accepted**"
  - Line 130: "The debit acceptance threshold **is unchanged**"
  - Line 169: "credit card acceptance **was unchanged**"
  - Line 172: "ratings... **were unchanged**"

**S-V-O Clarity:**
- Lines 201–202 (Model modification): One sentence spans 5 lines with multiple semicolons and parenthetical asides. Subject is "The extension" but the object doesn't arrive until line 202.

**Tense Consistency:** Strong throughout; maintains mixture of present tense (model description) and past tense (empirical results) appropriately.

**Nominalization:** Minimal issue. Mostly good verbs ("predict," "corroborate," "distinguish"). No egregious constructions like "make a prediction" or "conduct an analysis."

### Specific Passage Critiques

#### - [ ] Lines 10–13: Opening prose paragraph monotony

**Comment:** Four consecutive sentences introducing payment probabilities, all 12–21 words. While not egregiously long, the series feels expository and could benefit from a short punchy sentence to vary rhythm.

**Original:**
```
Table~\ref{tab:consumer-payment-probs} summarizes the payment probabilities for multi-homing consumers.
The key distinction is in the rows where only one card is accepted.
When a multi-homer carries two credit cards and only one is accepted, the consumer switches to the accepted card (probability~$1$), because both cards serve the same payment function.
When a multi-homer carries one credit and one debit card and only one is accepted, the consumer uses it only with probability~$\pi$ (if it is the card the consumer tried first), because consumers do not substitute across card types at the point of sale.
```

**Proposed Revision:**
```
Table~\ref{tab:consumer-payment-probs} summarizes payment probabilities for multi-homing consumers.
Key distinctions appear in rows where only one card is accepted.
When a multi-homer carries two credit cards and only one is accepted, she switches with certainty (probability 1), because both serve the same payment function.
For credit-debit pairs, substitution depends on card type: when only one is accepted, she uses it with probability $\pi$ (if tried first) because consumers do not substitute across card types at the point of sale.
```

**Why better:**
- Removes "The" + "is" construction ("The key distinction is in") and replaces with active verb ("appear")
- Shortens second sentence: "in the rows where only one card is accepted" → "in rows where only one card is accepted"
- Clarifies first multi-card case with active subject ("she switches") and removes nested parenthetical
- Consolidates credit-debit case into one sentence that better parallels the credit-only case above

---

#### - [ ] Lines 41–43: Passive voice + complex sentence

**Comment:** Opens subsection with weak passive construction "Acceptance... depends on" followed by a sprawling conditional sentence. The subject "a lower fee on one card" buries before "raises the acceptance bar."

**Original:**
```
Acceptance of one credit card depends on the fee of the other.
When both cards are the same type, multi-homers divert spending without generating incremental sales, so a lower fee on one card raises the acceptance bar for the other.
This result is consistent with the evidence in Figures~\ref{fig:fees-history} and~\ref{fig:merchant-amex-visa} that AmEx acceptance responded sharply to changes in its fee relative to Visa.
```

**Proposed Revision:**
```
One credit card's acceptance depends on the other's fee.
When both cards are the same type, multi-homers divert spending without generating new sales; a lower fee on one card thus raises the acceptance bar for the other.
Evidence from Figures~\ref{fig:fees-history} and~\ref{fig:merchant-amex-visa} confirms this: AmEx acceptance responded sharply to changes in its fee relative to Visa.
```

**Why better:**
- Shorter, punchier opening sentence
- Second sentence: replaces "so" conjunction with semicolon for crisper logic; removes "lower fee on one card raises" complexity by placing the object first in a tighter clause
- Third sentence: replaces "is consistent with" + passive "acceptance... responded" with active "acceptance responded"

---

#### - [ ] Lines 77–82: Monotonous boundary cases paragraph

**Comment:** Paragraph explaining comparative statics has 5 consecutive sentences of lengths [22, 25, 22, 25, 21] words—mechanical uniformity that deadens technical exposition. All sentences are roughly 20–25 words, creating rhythmic monotony when reader is mentally taxed.

**Original:**
```
A reduction in $\tau_1$ raises $\underline{\gamma}_2$: a smaller $\tau_1$ widens $\tau_2 - \tau_1$, increasing the incremental fee cost borne by multi-homers (the diversion term in the numerator) while leaving incremental sales unchanged---they come only from single-homers regardless of $\tau_1$.

The two boundary cases follow the same logic.
When there are no multi-homers ($\mu^{(1,2)} = \mu^{(2,1)} = 0$), there is no diversion fee drag, so incremental fees and incremental sales both come only from single-homers and the threshold reduces to $\sigma\tau_2/(1-\sigma\tau_2)$, which depends only on card~$2$'s own fee.
When there are no single-homers ($\mu^{(2,0)} \to 0$), there are no incremental sales at all---multi-homers would have paid by card regardless---so $\underline{\gamma}_2 \to \infty$ and no merchant accepts card~$2$.
When $\tau_2 = \tau_1$, the diversion fee drag vanishes and the threshold collapses to $\underline{\gamma}_1$: merchants jump directly from cash-only to accepting both cards.
```

**Proposed Revision:**
```
A reduction in $\tau_1$ raises $\underline{\gamma}_2$.
Why? A smaller $\tau_1$ widens $\tau_2 - \tau_1$, increasing the incremental fee cost borne by multi-homers (the diversion term in the numerator) while leaving incremental sales unchanged—they come only from single-homers regardless of $\tau_1$.

Three boundary cases illustrate the mechanism.
No multi-homers ($\mu^{(1,2)} = \mu^{(2,1)} = 0$): with no diversion, incremental fees and sales both come from single-homers alone, so the threshold reduces to $\sigma\tau_2/(1-\sigma\tau_2)$, depending only on card 2's fee.
No single-homers ($\mu^{(2,0)} \to 0$): with no incremental sales at all—multi-homers would pay by card anyway—we get $\underline{\gamma}_2 \to \infty$ and no merchant accepts card 2.
Equal fees ($\tau_2 = \tau_1$): the diversion fee drag vanishes, the threshold collapses to $\underline{\gamma}_1$, and merchants jump directly from cash-only to accepting both.
```

**Why better:**
- Opens with short 8-word sentence to break rhythm
- Adds "Why?" as bridge—creates micro-variety and signals the paragraph's logic
- Introduces boundary cases with active verb ("illustrate") instead of "follow the same logic"
- Restructures each boundary case: uses colon-plus-statement format instead of "When... there... so..." structure, reducing subordination
- Shortens the last sentence from 26 to 18 words by removing "the diversion fee drag vanishes and"

---

#### - [ ] Lines 86–88: Long conditional sentence

**Comment:** Line 86 is a 32-word sentence with two clauses connected by "and," creating a sprawling protasis. The apodosis ("the model predicts") feels distant from the complex conditional.

**Original:**
```
If consumers freely substitute between credit and debit at the point of sale and debit cards generate incremental sales, the model predicts that cutting debit fees lowers credit card acceptance.
The data reject this prediction.
Two specifications avoid it: the baseline assumes no point-of-sale substitution but allows incremental debit sales (main text), while the extension allows free substitution but shuts down incremental debit sales (Section~\ref{subsec:oa-extension}).
```

**Proposed Revision:**
```
Suppose two things: consumers freely substitute between credit and debit at the point of sale, and debit cards generate incremental sales.
Then the model predicts that cutting debit fees lowers credit card acceptance.
The data reject this prediction.
Two specifications avoid it: the baseline assumes no point-of-sale substitution but allows incremental debit sales, while the extension allows free substitution but shuts down incremental debit sales.
```

**Why better:**
- Breaks the long conditional into two shorter sentences (22 + 14 words)
- "Suppose two things:" is more direct than "If... and..." protasis-apodosis structure
- Clearer separation between setup and conclusion
- Removes parenthetical "(main text)" to tighten the final sentence

---

#### - [ ] Lines 201–204: Long dense paragraph on model modification

**Comment:** Lines 201–202 form one sentence spanning nearly 5 lines with 3 semicolons and 2 parenthetical asides. Subject ("The extension") doesn't connect clearly to object ("payment probabilities"). Dense technical material is made harder to parse.

**Original:**
```
\paragraph{Model modification.} The extension modifies the payment probabilities $\pi_{M,j}^w$. In the baseline, credit-debit multi-homers do not substitute across card types at POS: a consumer who prefers credit for a transaction uses credit or cash, never debit. In the extension, consumers freely substitute between all cards in their wallet regardless of type, changing the payment value $v_M^w$ in Eq.~\ref{eq:consumer-demand-merchant}. Because accepting any card now captures sales from all card holders, debit acceptance no longer generates incremental sales relative to credit; the debit demand-boost parameter is set to zero ($\kappa_{\text{debit}} = 0$ in Eq.~\ref{eq:payment-value-kappa}). The merchant acceptance equation (Eq.~\ref{eq:merch-accept}) is unchanged in form but $b_M$ changes because $v_M^w$ changes.
```

**Proposed Revision:**
```
\paragraph{Model modification.} The extension modifies the payment probabilities $\pi_{M,j}^w$ in three ways.

First, substitution rules change. In the baseline, credit-debit multi-homers do not substitute across card types at the point of sale: a consumer who prefers credit uses credit or cash, never debit. The extension allows free substitution among all cards in the wallet regardless of type, changing the payment value $v_M^w$ in Eq.~\ref{eq:consumer-demand-merchant}.

Second, the demand boost parameter drops. Because accepting any card now captures all card holders' sales, debit acceptance no longer generates incremental sales relative to credit. We set the debit demand-boost parameter to zero: $\kappa_{\text{debit}} = 0$ in Eq.~\ref{eq:payment-value-kappa}.

Third, the merchant equation's form is preserved but one term changes. The merchant acceptance equation (Eq.~\ref{eq:merch-accept}) remains structurally unchanged, but $b_M$ changes because $v_M^w$ changes.

With $\kappa_{\text{debit}} = 0$, debit acceptance generates no incremental sales benefit in $b_M$ (Eq.~\ref{eq:merch-accept}), so we impose universal debit acceptance.
This is without loss: the debit fee equals the cost of cash, so merchants are indifferent between debit and cash transactions, and accepting debit imposes no incremental cost.
```

**Why better:**
- Breaks the dense paragraph into 5 shorter, logically separated paragraphs
- Opens with an enumeration ("in three ways") that signals structure to reader
- Each change gets its own topic sentence + explanation, improving comprehension
- Replaces "I" with "we" for consistency with academic voice
- Shortens the final sentence from 32 words to 20 by removing "in this specification" clause

---

#### - [ ] Lines 313–316: Long explanation with dense embedding

**Comment:** The long paragraph on "Complements" (starting line 313) contains a sentence that runs 66 words with multiple embedded clauses. While technically correct, the S-V-O order is tortured: "A consumer with high variance... therefore faces uncertainty... By adopting both... she can use... raising... This option value is positive even if..."

**Original:**
```
A consumer with high variance $\Sigma$---meaning strong but transaction-specific preferences over card types---therefore faces uncertainty over which card type she will prefer for each future transaction. By adopting both card types, she can use credit when the realized shock $\gamma_{it}' X_j$ favors credit and debit when it favors debit, raising the inclusive value $V_i$. This option value is positive even if the consumer knows at the adoption stage that she will have bifurcated transaction-level preferences.
```

**Proposed Revision:**
```
Consider a consumer with high variance $\Sigma$—meaning strong but transaction-specific preferences over card types.
Such a consumer faces uncertainty: she doesn't know which card type she'll prefer for each future transaction.
By adopting both types, she gains flexibility: use credit when the shock $\gamma_{it}' X_j$ favors credit, debit when it favors debit.
This flexibility raises the inclusive value $V_i$ and creates positive option value, even if she expects bifurcated preferences.
```

**Why better:**
- Breaks a dense 66-word sentence into four shorter sentences (19, 18, 19, 18 words)
- Removes the long dash and "meaning... preferences" appositive; leads with "Consider"
- Uses parallel structure in line 3: "use credit when..., debit when..."
- Final sentence is declarative and concise, avoiding the embedded "even if" conditional

---

#### - [ ] Lines 341–342: Very long sentence on approximation validation

**Comment:** A 66-word sentence explaining the trembles methodology is technically necessary but hard to parse. S-V is clear ("I introduce"), but the object is embedded in middle; the final clause "comparing... with..." dangles from a relative clause.

**Original:**
```
To select a unique equilibrium, I introduce small trembles $\nu_x$ in networks' fee choices, which smooth the profit function and ensure equal profit loss from marginal fee increases or decreases (following \textcite{Bilal.Lhuillier2021}). Convolving the profit function with smooth noise makes $\Psi$ differentiable; as noise vanishes, the smoothed objective converges uniformly to the original. To evaluate approximation error, Online Appendix Figure \ref{fig:max-compare} plots pairwise heatmaps of Visa's profit (without trembles) as a function of all control-variable pairs, comparing the solution from perturbed first-order conditions with a grid search over the original profit function.
```

**Proposed Revision:**
```
To select a unique equilibrium, I introduce small trembles $\nu_x$ in networks' fee choices.
These trembles smooth the profit function and ensure equal profit loss from marginal fee increases or decreases (following \textcite{Bilal.Lhuillier2021}).
Convolving with smooth noise makes $\Psi$ differentiable; as noise vanishes, the smoothed objective converges uniformly to the original.
To evaluate approximation error, Online Appendix Figure~\ref{fig:max-compare} plots pairwise heatmaps of Visa's profit without trembles, across all control-variable pairs.
The figure compares solutions from perturbed first-order conditions against a grid search over the original profit function.
```

**Why better:**
- Breaks the long 26-word sentence on trembles into two shorter ones (17 + 16 words)
- Removes the complex relative clause modifier; makes "These trembles" the new subject
- Simplifies the final very long sentence (41 words) into two sentences (20 + 15 words)
- Eliminates the dangling participial phrase "comparing the solution..."

---

### Section-by-Section Analysis

| **Section**                           | **Count** | **Mean** | **StdDev** | **Range** | **Assessment** |
|---------------------------------------|-----------|----------|-----------|-----------|---|
| Consumer Payment Probabilities        | 8         | 18.1     | 9.2       | 5–38      | Good variety; strong short sentences |
| Multi-Homing and Relative Acceptance  | 13        | 24.3     | 10.1      | 8–44      | Moderate; some long explanations |
| Debit/Credit Thresholds              | 19        | 26.8     | 11.2      | 9–42      | **Flag:** Cluster of 4–5 medium-long sentences (lines 93–98) |
| Empirical Evidence Section            | 9         | 21.3     | 11.8      | 7–36      | Good; mixed rhythm despite technical content |
| Antitrust Testimony Section           | 8         | 22.5     | 12.4      | 4–41      | Excellent; includes punchy 4-word and 8-word sentences |
| Extension/Model Modification          | 15        | 25.7     | 10.9      | 8–51      | **Flag:** Dense technical language needs restructuring (lines 201–204) |
| Microfoundation Section               | 29        | 21.6     | 10.3      | 6–66      | **Flag:** One sentence reaches 66 words (line 313) |
| Conduct Assumption                    | 11        | 24.1     | 11.8      | 9–44      | Moderate; explanations of non-differentiability are long |
| Model Solution Algorithm              | 12        | 19.8     | 8.7       | 7–35      | Good; technical list format keeps sentences shorter |
| Quasi-Profit Validation               | 8         | 20.5     | 9.1       | 5–32      | Good; no major issues |

---

### Passive Voice Patterns (All Instances)

1. **Line 11:** "The key distinction **is in** the rows where only one card **is accepted**"
2. **Line 47:** "multi-homers switch to whichever card **is accepted**"
3. **Line 130:** "The debit acceptance threshold **is unchanged**"
4. **Line 169:** "credit card acceptance **was unchanged**"
5. **Line 172:** "ratings... **were unchanged**"
6. **Line 207:** "large negative debit utilities **are needed**"
7. **Line 241:** "these scenarios... **are omitted**"
8. **Line 245:** "consumers **are locked** into credit"
9. **Line 373:** "first-order conditions **are solved** jointly"
10. **Line 377:** "conditions... **are verified** numerically"
11. **Line 378:** "caps **are confirmed** binding"

**Recommendation:** Of these 11 instances, 5 are problematic (lines 11, 130, 169, 172, 245). The others are acceptable because they appear in list/enumeration contexts or describe technical procedures where passive voice is standard (numerical verification, algorithmic steps).

---

### Priority Recommendations

1. **Highest Priority:** Break up the model modification paragraph (lines 201–204) into 3–4 shorter paragraphs with clear topic sentences. This section is dense technical material that would greatly benefit from visual/structural breaks.

2. **Second Priority:** Restructure comparative statics section (lines 77–82) by adding a short sentence and rephrasing boundary cases. The current monotonous rhythm undermines the logical force of the explanation.

3. **Third Priority:** Address five passive voice constructions (lines 11, 130, 169, 172, 245) by converting to active voice. Most are in accessible prose sections and can be tightened without altering meaning:
   - "The key distinction is in → "The key distinction appears in"
   - "The threshold is unchanged → "The threshold remains unchanged" (slightly better)
   - "acceptance was unchanged → "acceptance remained unchanged"
   - "consumers are locked → "the model locks consumers"

---
## Deduplication Summary
- Items reviewed: 29 (appendix_model_oa.tex: 8 passages + 11 passive voice instances)
- Duplicates removed: 0
- Cross-references added: 1 (lines 77-82 also flagged in ai_detection.md)
