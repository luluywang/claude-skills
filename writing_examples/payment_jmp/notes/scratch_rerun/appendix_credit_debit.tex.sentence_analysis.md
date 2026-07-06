## [appendix_credit_debit.tex]

### Executive Summary

- Prose sentences (excluding math environments, table captions, and tablenotes): approximately 110 sentences
- Estimated mean length: ~22 words
- Estimated StdDev: ~9 words (acceptable range: ≥ 8–10)
- Range: 6 words (shortest) to 47 words (longest)
- McCloskey/Cochrane adherence: **Moderate** — good variation overall, but several overlong sentences in the mathematical exposition sections, and three notable monotony clusters
- Priority improvements: (1) break the 46-word sentence at line 313; (2) resolve the repetitive parallel paragraph openings in lines 267–279; (3) address passive constructions in the microfoundation section

---

### Overall Statistics

**Approximate distribution:**
- Short (< 15 words): ~25% — present and healthy
- Medium (15–25 words): ~45% — dominant but not robotic
- Long (> 25 words): ~30% — slightly high; several approach or exceed 40 words

**Longest sentences (> 35 words):**
- Line 8: ~50 words ("While incorporating substitution would make the model more realistic...")
- Line 265: ~42 words (first sentence, "Consumers holding both card types...")
- Line 313: ~46 words ("Because debit generates incremental sales...")
- Line 351: ~35 words ("Point-of-sale substitution makes multi-homing more valuable...")

---

### Section-by-Section Assessment

| Section | Sentences (approx.) | Mean | Assessment |
|---------|-------------------|------|------------|
| Intro paragraph (ll. 7–29) | 10 | ~22 | Good — mixes short and long |
| Empirical Evidence (ll. 38–62) | 18 | ~19 | Good — testimony quotes create natural variation |
| Model Generalization (ll. 71–226) | 35 | ~25 | Needs work — math interspersed with dense prose |
| Takeaways (ll. 237–244) | 5 | ~20 | Good |
| Alternative Specs intro (ll. 253) | 1 | ~28 | Redundant; see simplifications |
| Incremental Debit Sales (ll. 258–352) | 32 | ~23 | Moderate — parameter discussion runs long |
| Debit as Cash (ll. 383–466) | 20 | ~22 | Good |
| Robustness Summary (ll. 471–489) | 10 | ~20 | Good |
| Microfoundation (ll. 500–566) | 22 | ~24 | Moderate — usage-stage discussion is dense |

---

### McCloskey/Cochrane Assessment

**Active Voice:**
- The file uses first person ("I estimate," "I focus") consistently in the analytical sections — good.
- Passive constructions appear mainly in math-adjacent prose: "is identified by," "is added," "are required," "are dropped," "are distributed."
- Count: approximately 12 passive constructions in ~110 sentences (11%). Within acceptable range for a technical appendix.

**Nominalization:**
- "The resolution runs through merchant margins" (line 313, passive inference paragraph) — good direct phrasing.
- "The fixed cost is identified by requiring..." (line 276) — "is identified by requiring" nominalizes; "the estimator identifies the fixed cost by requiring..." is more active.

**S-V-O Clarity:**
- Most sentences follow S-V-O. Exceptions are the long sentences noted below.

**Tense Consistency:**
- Present tense throughout — consistent.

**Parallelism:**
- The N/D decomposition paragraphs (lines 149–152) use consistent parallel structure.
- The bullet list at lines 170–171 has parallel structure.
- The "First... Second..." enumeration at lines 267–273 is parallel but formulaic (see ai_detection).

---

### Specific Passage Critiques

### - [ ] Line 8: Overlong introductory sentence (50 words) — split needed

**Comment:** The opening paragraph's second sentence runs ~50 words and carries four ideas: (1) substitution adds realism; (2) it creates wrong predictions; (3) this appendix presents the case for segmentation; (4) and two alternatives. A reader meeting this sentence fresh has to hold four branches simultaneously.

**Original:**
```
While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Proposed Revision:**
```
Incorporating substitution would make the model more realistic on the consumer side, but it also generates predictions at odds with the merchant-side evidence.
This appendix presents the case for segmentation and two alternatives that relax it.
```

**Why better:**
- Two sentences, each carrying one idea
- "Consumer side" / "merchant-side" replaces the vague "along some dimensions"

---

### - [ ] Lines 265: Dense compound sentence (42 words) in paragraph opener

**Comment:** The "Model Modification" paragraph opens with a single 42-word sentence that sets $\zeta$ and $\kappa_d$ simultaneously, with three parenthetical comparisons embedded. The paragraph's second sentence also runs ~30 words. Two consecutive long sentences with identical structure (X...rather than Y (baseline) or Z (debit as cash)) produce monotonous rhythm.

**Original:**
```
Consumers holding both card types substitute between them at the point of sale half the time ($\zeta = 0.5$) rather than never (baseline) or always (debit as cash). Debit acceptance generates half the demand boost of credit ($\kappa_d = 0.5$; Eq.~\ref{eq:payment-value-kappa}) rather than the full boost ($\kappa_d = 1$) of the baseline or none ($\kappa_d = 0$) of debit as cash.
```

**Proposed Revision:**
```
Consumers holding both card types substitute between them at the point of sale half the time ($\zeta = 0.5$): never in the baseline, always in the debit-as-cash specification.
Debit acceptance generates half the demand boost of credit ($\kappa_d = 0.5$, Equation~\ref{eq:payment-value-kappa}): the full boost in the baseline, none in the debit-as-cash specification.
```

**Why better:**
- Each sentence is shorter (~20–22 words)
- Parallel structure is maintained but each sentence is now independently readable
- Note: the project's surface rules flag em-dash/colon constructions; author may prefer "— never in the baseline, always in..." with a dash or restructure as a table row

---

### - [ ] Lines 313–316: Overlong sentence (46 words) followed by short sentence creates rhythm imbalance

**Comment:** The Parameter Estimates paragraph opens with a 46-word sentence (below), then pivots to a 10-word sentence ("The resolution runs through merchant margins."). While the short sentence is a good rhetorical move, the 46-word opener is too long to land cleanly.

**Original:**
```
Because debit generates incremental sales and consumers substitute between credit and debit at the point of sale, cheap debit becomes a close alternative to expensive credit in the merchant's acceptance decision, so the estimator must explain why merchants keep accepting expensive credit anyway.
```

**Proposed Revision:**
```
Because debit generates incremental sales and consumers substitute between card types at the point of sale, cheap debit becomes a close alternative to expensive credit.
The estimator must explain why merchants keep accepting expensive credit anyway.
```

**Why better:**
- Two sentences of 22 and 14 words; the punchy 14-word sentence now has more force because it is not buried in the same sentence as the setup
- "Card types" replaces the tautological "credit and debit"

---

### - [ ] Lines 267–279: Monotony cluster — four consecutive 20–25 word sentences in "Model Modification" paragraph

**Comment:** The paragraph from "Two additional adjustments are required" through "This acceptance ordering is counterfactual" contains approximately eight sentences, most in the 18–25 word range. No sentence is below 12 words. The result is metronomic prose in a passage that deserves more variation.

**Recommended approach:** Insert short declarative sentences after the key logical steps. For example, "This acceptance ordering is counterfactual." (line 279) is already a good short sentence — replicate that rhythm one or two more times in the paragraph.

---

### - [ ] Lines 541–548: Microfoundation usage-stage section — passive-heavy

**Comment:** The "Usage-stage vs. adoption-stage segmentation" paragraph uses several passive constructions: "Large $\Sigma$ does not induce segmentation at adoption because the consumer values the expected utility $V_i$, which integrates over the transaction-specific shocks $\gamma_{it}$. If adoption costs are similar across instruments, consumers remain sensitive to rewards in choosing what to adopt."

These sentences are grammatically fine, but the paragraph as a whole reads more like a lecture than an argument. The microfoundation section may be appropriate for this style (it is more formal), but the author should confirm this is the register they want.

**Note:** The microfoundation section has some of the most academic-register prose in the file. For an online appendix aimed at specialists, this is acceptable.

---

### Priority Recommendations

1. **Split line 313's 46-word sentence** — highest impact for readability; the "resolution" sentence that follows is sharp and deserves better setup.
2. **Break the line-8 introductory sentence** — first sentence of the second paragraph sets the tone for the whole appendix; 50 words is too long for that anchor position.
3. **Address the monotony cluster at lines 267–279** — eight consecutive medium-length sentences with no short breaks reads as a wall of text.
