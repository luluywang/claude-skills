# Gregor's Review: Outstanding Items & What We've Incorporated

**Document analyzed:** `draft_202511/cash_or_credit_20250909gm.lyx` (Gregor's version from Sept 2024)
**Compared against:** Current draft in `draft_202511/`
**Date of analysis:** November 4, 2025
**Last updated:** November 4, 2025

**📋 For detailed implementation instructions, see:** `gregor_implementation_guide.md`

---

## REMAINING TODO ITEMS

### 🔴 HIGH PRIORITY

#### 1. **WHERE Redistribution is Largest** (Gregor's Primary Strategic Concern)

**Issue:** Gregor's most important editorial comment (lines 717-785 of LyX file) asks for more explicit discussion about WHERE redistribution is concentrated, not just that it varies.

**What Gregor wants:**
- Explicitly state which merchant types see the most redistribution
- Explain that grocery stores, gas stations, and large retailers with diverse customer bases have the most cross-subsidization
- Contrast with luxury retailers and discount stores where consumer sorting limits transfers
- Link to policy implications: heterogeneity matters for evaluating interchange fee regulations

**Current status:** Introduction mentions variation in redistribution but doesn't systematically describe WHERE it's largest.

**See gregor_implementation_guide.md for suggested paragraph to add.**

---

#### 2. **Table 4 / Visa Schedule Labeling Issues**

**Issue:** Gregor noted (lines 634-641): Panel B doesn't clearly indicate it's "RESTAURANTS ONLY" excerpt, making it seem like it applies to all firms at quick glance.

**Action needed:**
- Label Panel B clearly as "EXCERPT: RESTAURANTS ONLY"
- Add table note clarifying this is our simplified classification, not direct Visa schedule
- Optional: Consider adding figure showing actual Visa schedule page to emphasize complexity

**Why this matters:** Current labeling could mislead readers about scope of fee variation.

---

### 🟢 LOW PRIORITY

#### 3. **Pre-Durbin Fee Numbers Source**

**Issue:** Numbers for pre-Durbin debit fees (1.19% + $0.10) stated without citation.

**Action needed:** Add footnote citing source (Visa/Mastercard 2010 schedules or Federal Reserve Durbin documentation).

---

#### 4. **Confusing Vertical Line Statement**

**Issue:** Gregor confused by explanation of vertical line in Durbin figure marking indifference point between fee structures.

**Action needed:** Either delete entirely (Gregor's preference) or clarify substantially. See implementation guide for options.

---

#### 5. **Better Examples for Fee-Sales Relationship**

**Issue:** Gregor wants clearer, more concrete examples of why fees decline with firm sales and transaction size.

**Action needed:** Replace generic statement with specific examples (e.g., volume discounts, fixed fee as percentage of different transaction sizes).

---

#### 6. **Theory Section: Rewards Affecting Demand**

**Issue:** Gregor uncomfortable that model has rewards affecting demand but merchant prices don't respond to demand shifts.

**Action needed:** Add theoretical justification (empirical pass-through already captures equilibrium effects; rewards are small relative to income) or make model more generic.

---

#### 7. **Utility Function Footnote** (OPTIONAL)

**Current status:** Content exists in redistribution.tex:33 as main text.

**Gregor's version:** Had this as a footnote: "Our assumptions rule out perfect substitutes but are compatible with nested CES and random-coefficients logit."

**Action:** Consider converting to footnote to reduce clutter (optional, low priority).

---

#### 8. **Ongoing QA Tasks**
- Verify graphs match stated statistics (ongoing)
- General figure/table formatting cleanup (ongoing)

---

## WHAT WE'VE SUCCESSFULLY INCORPORATED FROM GREGOR'S REVIEW

The current draft has made **substantial improvements** based on Gregor's feedback:

### ✅ Major Structural Improvements

**Title & Framing:**
- Changed from Gregor's "Will that Be Cash or Credit: A Quantitative Analysis of Modern Interchange Fees"
- To current "Who Pays for Payments?"
- **Assessment:** Current title is dramatically better - punchy, memorable, immediately conveys redistributive focus

**Abstract Structure:**
- Restructured with clear "two facts point towards... However, two facts limit..." framing
- More concise while covering same ground (350 vs 540 words)
- Better quantification using scalars
- Uses Gregor's preferred "reduce regressivity" language ✅ (main.tex:81)

**Introduction:**
- Opening paragraph is very similar to Gregor's version with minor refinements
- Added explicit statement that "Redistribution arises only when different consumers use payment methods with different interchange fees at the same merchant"
- Restructured paper roadmap to emphasize three-part structure (vs Gregor's outline)
- Enhanced motivation with comparisons to major government programs (SNAP $120bn, EITC $57bn, unemployment $40bn)
- Added comparison to other household finance transfers (GSE $15bn, shrouded fees $10bn, high-fee index funds $20bn)
- Regulatory context footnote present in both versions ✅

### ✅ Household Finance Positioning (Gregor's Strategic Vision)

**Gregor asked:** "What is the contribution relative to shrouding literature? Normally pooling contracts increase redistribution; in our setting, pooling on payment method decreases redistribution."

**What we incorporated:**
- Strong household finance literature connection at introduction.tex:154
- Explicit comparison to other transfers: GSE (lack of risk-based pricing), shrouded credit card fees, high-fee index funds
- Clear articulation that our setting INVERTS traditional shrouding logic:
  - Traditional: pooling contracts → more redistribution
  - Our setting: consumer sorting across merchants → less redistribution
  - Key insight: "separation across merchants combined with payment method uniformity within merchants drives redistribution"
- Transfer magnitude comparisons ($150B comparable to SNAP $120B, EITC $57B)

### ✅ Technical & Methodological Improvements

**Scalars:**
- All main results use `\scalarinput{}` instead of hard-coded numbers
- Consistent use of `\absinput{}` and `\scalarpctinput{}`

**Footnotes Incorporated:** 15 out of 17 from Gregor's version, including:
- Regulatory context (Durbin, Colorado, EU) ✅ (introduction.tex)
- **Mukharlyamov & Sarin comparison** ✅ (introduction.tex:97) - Footnote contrasting their zip-code level analysis (insufficient power) with our merchant-level data advantage
- **Durbin identification strategy justification** ✅ (real_effects.tex:51) - Addresses why zip-code level used
- **Merchants vs outlets definition** ✅ (introduction.tex:55) - Clear distinction between corporate entities and physical locations
- **Mathematical notation (μ_jk)** ✅ (redistribution.tex:51) - Properly defined before use

**Data Section:**
- **2022 vs 2023 choice justification** ✅ (institutional_setting.tex:54) - Footnote explaining why 2022 is the main cross-section (data completeness at time of analysis) and noting robustness to 2023
- Better representativeness discussion

**Related Literature:**
- More focused and strategic
- Stronger positioning relative to household finance literature
- Clear articulation of what's new/surprising

**Sufficient Statistics Framework:**
- Well explained with clear intuition
- Good exposition of why this approach is powerful

### ✅ Empirical Choices Validated

**Direction Reversal:** ✅ Correctly omitted - we checked and consumer sorting does NOT reverse transfer direction for any groups, only attenuates magnitude. Gregor's claim doesn't hold in our data.

**Section References:** ✅ All "Section XXX" placeholders from Gregor's draft have been properly filled in current version.

### ✅ Writing Quality Improvements

**Overall Assessment:** Current version and Gregor's version are quite similar in structure and content. The main differences are:
- Current version has more refined exposition in places
- Three-part paper structure is more clearly articulated
- Household finance comparisons are more prominent
- Some wording improvements and clarifications

**Note:** Many sections are substantively the same between versions, with Gregor's draft providing the foundation that the current version builds upon.

---

## GREGOR'S COMPLETE STRATEGIC VISION (For Reference)

Here is Gregor's most important editorial comment (lines 717-785), which represents his strategic vision for the paper:

```
We need to say much more about where the re-distributoin is largest:
- big vs. small
- basic goods vs luxory goods
- cheap or expensive stores
- etc. etc.

Link to important topcis in liteatrue:
- how does shopping / search behavior affect these transfers?–> if cheaper stores
- what has happened to reddistribution over time

• Where is the relative contribution to the literature that shrouding etc.
  results in redistribution
  • normally the idea in this liteature is that everyone faces one pooled contract
    (think insurance, refinance etc) and that this pooling results in MORE
    redistribution; in our setting, pooling people on same payment method
    decreases redistribution
    • pooling on same payment is different than pooling on same merchant
  • sorting, negotationed fees etc. matters because it modulates this redistribution
    • what is new / surprising about this?
    • does it change how we think about policy?
```

**Our implementation:**
- ✅ Household finance positioning: EXCELLENT - fully addresses the pooling vs. sorting insight
- ✅ Policy implications: GOOD - incorporated throughout introduction and would be strengthened by conclusion paragraph
- ⚠️ WHERE redistribution is largest: PARTIAL - mentioned but not systematically described (HIGH PRIORITY TODO #1)
- ⚠️ Shopping/search behavior links: PARTIAL - could be expanded
- ⚠️ Time trends: NOT YET ADDRESSED - could be added if we have the data

---

## SUMMARY FOR COMMUNICATION

**What to tell Gregor:**

"I've been working from your September 2024 draft and have incorporated most of your feedback and suggestions:

**Key refinements based on your draft:**
- Kept the 'Who Pays for Payments?' title
- Used your 'two facts for, two facts against' framing in abstract
- Adopted your preferred 'reduce regressivity' language rather than 'moderate transfers'
- Strengthened household finance positioning - now explicitly articulate how our setting INVERTS traditional shrouding logic (pooling vs. sorting)
- Added specific dollar comparisons to major government transfer programs (SNAP $120bn, EITC $57bn, unemployment $40bn)
- Added comparisons to other household finance transfers (GSE $15bn, shrouded fees $10bn, high-fee index funds $20bn)
- Incorporated technical footnotes you added (Mukharlyamov & Sarin, Durbin identification, merchants vs outlets, etc.)
- Filled in all 'Section XXX' placeholders with proper cross-references
- Restructured paper roadmap to emphasize three-part structure
- Verified empirical claims (e.g., direction reversal doesn't occur in our data, so correctly omitted)

**Still outstanding from your review:**
1. **HIGH PRIORITY (2 items):**
   - Your main strategic point (lines 717-785) about explicitly describing WHERE redistribution is largest - I need to add 1-2 paragraphs stating that grocery stores, gas stations, and large retailers see the most cross-subsidization (diverse customer base) while luxury retailers and discount stores see less (consumer sorting). I have draft text ready.
   - Table 4 labeling - Panel B needs clearer indication it's 'RESTAURANTS ONLY' excerpt to avoid confusion.

2. **LOW PRIORITY (6 items):** Citing sources for pre-Durbin fee numbers, clarifying the vertical line in the Durbin figure, better examples for the fee-sales relationship, theory section justification for rewards/pricing, utility function footnote (optional), and ongoing QA tasks.

The detailed implementation guide has specifics for each remaining item."
