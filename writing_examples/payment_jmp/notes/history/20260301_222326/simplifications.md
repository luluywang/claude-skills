# Suggested Simplifications

## [appendix_model_oa.tex]

No file-specific simplification recommendations. The appendix section shows good structural integrity with concrete examples and clear technical exposition. Refer to sentence_analysis.md for rhythm improvements and ai_detection.md for LLM pattern issues.

---

## estimation.tex — Overall Simplification Strategy

The estimation section uses too many weak verbs and vague nouns. The user's core complaint about line 64 ("provides leverage") exemplifies the problem: the writing describes methods without explaining WHY they work or WHAT they actually identify.

### Key Patterns to Fix

1. **Weak Verbs (recover, provide leverage, reflect, shows):**
   - Replace with concrete actions: calculate, invert, capture, measure, identify
   - Each verb should say exactly what operation happens

2. **Vague Nouns:**
   - "leverage" → explain the identification mechanism
   - "object" → name the thing (outcome, pattern, distribution)
   - "source" / "evidence" → list the specific evidence type

3. **Nominalization:**
   - "merchant fee sensitivity...is not a primitive parameter but an equilibrium object"
   - → "merchant sensitivity emerges from merchant heterogeneity and multi-homing"

4. **Passive + Nominalization + Weak Verb combo (the worst pattern):**
   - "The Rochet-Tirole framework provides leverage to identify..."
   - → Active subject + concrete verb: "The Rochet-Tirole framework allows us to measure X by observing Y, which reveals Z"

5. **Jargon Shorthand:**
   - "platforms tax the insensitive side and subsidize the sensitive side"
   - → "charge high fees to merchants and use revenues to fund consumer rewards"
   - "being just on the margin"
   - → "barely breaking even on acceptance"

### Section-by-Section Fixes

**Subsection: Merchant Types (lines 45-67)**
This is the section most in need of clarification. The user flagged line 64 for a reason: it's the pivot point where you switch from telling the reader the problem (need merchant primitives) to explaining the solution (use Rochet-Tirole + event studies).

**Before:** Vague hand-waving about "leveraging" frameworks.
**After:** Explain step-by-step:
1. Why reduced-form won't work (out-of-sample issue)
2. What information you need (merchant primitives)
3. How you get it (event studies + theory)
4. Why it works (fee structure reveals merchant sensitivity)

**Subsection: Goodness of Fit (lines 141-199)**
Overcomplicated summary sentences. Use parallel structure and concrete language.

**Before:** "The model reflects key features of the market" + "shows this" + "reasonably approximates"
**After:** "My model matches observed adoption shares, validates merchant fee sensitivity against AmEx data, and aligns with experimental evidence."

---
## Deduplication Summary
- Items reviewed: 0 (file-level analysis; appendix_model_oa.tex has no simplifications flagged)
- Duplicates removed: 0
