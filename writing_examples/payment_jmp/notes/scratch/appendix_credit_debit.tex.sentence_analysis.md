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

