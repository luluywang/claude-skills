# Appendix Revision: Corrected Version

**Status:** ✅ COMPLETE - All corrections implemented
**Date:** January 31, 2026
**Document Compilation:** ✅ Success (Exit code 0, 142 pages)

---

## User's Critical Corrections

The user provided important clarifications about the appendix revisions:

1. **Reduced-form appendices are broader** - Each section should be grounded in what the main text actually cites, not generic "assumptions"
   
2. **Use "substitution assumption" not "commitment assumption"** - OA.1 is about payment substitution patterns, not commitment

3. **Don't use "Referees questioned" framing** for model extensions - Present results objectively about what each specification tests

---

## What Was Corrected

### OA.1: Shifted Focus from "Commitment" to "Substitution Patterns"

**Before:** "This appendix provides reduced-form evidence supporting a core modeling assumption: that consumers commit to a primary payment type..."

**After:** "This appendix documents consumer substitution patterns between payment methods and provides evidence that rewards affect which payment method consumers use, not where they shop."

**Key facts now emphasized:**
1. Rewards induce strong credit-to-credit substitution but weak debit-to-credit substitution
2. Credit and debit provide distinct transaction services
3. Payment behavior stable across merchants/time (intrinsic preferences, not merchant-specific)

**Section-specific openings rewritten to emphasize:**
- **Discover experiment**: Rewards affect payment METHOD, not STORE choice
- **Merchant acceptance**: Hierarchical pattern shows credit/debit distinct
- **Durbin Amendment**: Robustness of 30% volume decline
- **Substitution matrix**: Asymmetric patterns (73% credit→credit vs. 8% credit→debit)
- **Consumer survey**: Preference heterogeneity and credit aversion

### OA.2: Emphasized Welfare Mechanism, not Just Assumption

**Before:** "This appendix justifies a key assumption critical to our welfare analysis..."

**After:** "This appendix addresses a critical question for the welfare analysis: why don't merchants surcharge for card payments despite legal ability to do so?"

**Now emphasizes:**
1. Empirical fact: Only ~5% of transactions have surcharges despite legality
2. Economic mechanism: Small menu costs rationalize uniform pricing
3. **Welfare relevance**: Price coherence makes fee pass-through the dominant welfare channel

### OA.3: Quantified Robustness Explicitly

**Enhanced opening to include:**
1. Clear threat: Perfect sorting could eliminate redistribution
2. Empirical question: How much do consumers sort?
3. **Specific robustness finding: 91-96% redistribution remains**
4. Validation: Integrated economy assumption justified

### OA.4: Shifted to Objective Specification Testing

**Before:** "Referees questioned the baseline assumption that consumers do not substitute..."

**After:** "This appendix presents an alternative model specification that allows full consumer substitution between debit and credit at the point-of-sale, and tests whether the main policy conclusions are robust to this modeling choice."

**Key changes:**
- Removed all "Referees questioned" language
- Frames as objective specification test: "does the welfare ranking of policies depend on this assumption?"
- Explains mechanistic robustness through price pass-through channel

### OA.5: Objective "Tests Whether" Framing Throughout

**Before:** "Estimation Variant Guide" with defensive framing

**After:** "Model Specification Details and Robustness Checks" with "tests whether X" language

**Each robustness specification now:**
- Leads with economic question (not defensive motivation)
- Presents results upfront with specific numbers
- Explains why conclusions are/aren't sensitive to the assumption
- Uses objective language: "tests whether X materially affects conclusions"

**Specifications reframed:**
1. **Partial pass-through**: "Tests whether merchants absorbing fees affects welfare conclusions"
2. **Complementarities**: "Tests whether multi-network acceptance creates complementarities"
3. **Halved reward sensitivity**: "Tests robustness to Durbin event study identification"
4. **Intermediate cap**: "Explores politically feasible moderate caps vs. theoretical optimum"

---

## Document Compilation Status

```
✅ Full document compiles successfully
   Exit code: 0
   Output: main.pdf (142 pages, 752 KB)
   No blocking errors
```

---

## Files Modified (Corrected Revision)

- `appendix_reduced.tex` (OA.1) - Complete rewrite of opening + section introductions
- `appendix_surcharging.tex` (OA.2) - Strengthened welfare mechanism framing
- `appendix_sorting.tex` (OA.3) - Quantified robustness (91-96%)
- `appendix_substitution.tex` (OA.4) - Removed "Referees questioned", objective framing
- `appendix.tex` (OA.5) - Renamed, retitled, reframed all robustness specs

---

## Key Improvements in Corrected Version

### 1. Economic Substance Over Assumption Language
- Focus on WHAT each appendix demonstrates (economic facts)
- Not WHY we need the assumption (defensive)
- Ground each section in actual main-text usage

### 2. Objective Specification Language
- "Tests whether X" instead of "Referees questioned"
- Present results factually without defensive framing
- Explain mechanisms (price pass-through) not just robustness

### 3. Quantitative Precision
- OA.1: 30% Discover spending increase, 73% cross-credit substitution
- OA.2: 5% surcharge rate, welfare mechanism emphasis
- OA.3: 91-96% redistribution remains (quantified robustness)
- OA.4: 7% welfare difference (robust despite parameter changes)
- OA.5: All specifications shown in comparison table

### 4. Clear Economic Questions
- OA.1: Do rewards affect where consumers shop? (No)
- OA.2: Why don't merchants surcharge? (Menu costs)
- OA.3: Does sorting eliminate redistribution? (No, 91-96% remains)
- OA.4: Does payment substitution timing affect policies? (No)
- OA.5: Does each assumption matter for policy conclusions? (Mostly no)

---

## Definition of Met Criteria (Corrected)

✅ **Each appendix grounds economics in what main text actually uses it for**
- OA.1 demonstrates substitution patterns affecting payment method choice
- OA.2 explains welfare mechanism (surcharges → price pass-through)
- OA.3 validates redistribution robustness to sorting
- OA.4 tests specification robustness objectively
- OA.5 tests assumption sensitivity objectively

✅ **Removed all defensive "Referees questioned" language**
- Replaced with objective "tests whether X affects conclusions"
- Focus on what each specification reveals
- Present results factually

✅ **Substitution assumption clearly labeled** (not "commitment")
- OA.1 explicitly about substitution patterns
- Asymmetric cross-category substitution emphasized
- Strong within-category, weak between-category

✅ **Quantitative findings prominent**
- Specific numbers integrated into section openings
- Robustness quantified (91-96% in OA.3, 7% in OA.4, etc.)
- Policy implications explicit

---

## Ready for Publication

The paper appendices now:
- Ground economic substance in actual main-text citations
- Use objective presentation (tests whether X) not defensive framing
- Emphasize mechanisms and quantitative robustness
- Maintain all technical content with improved clarity
- Compile successfully as part of full document

**Status: READY**

