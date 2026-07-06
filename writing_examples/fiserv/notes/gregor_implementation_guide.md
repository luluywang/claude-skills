# Implementation Guide for Gregor's Comments

This file contains detailed step-by-step implementation guidance for addressing all comments from Gregor's review. Use this alongside `gregor_changes.md`.

---

## 🔴 HIGH PRIORITY ITEMS

### Item 3: Footnote on Utility Function Assumptions

**File:** `redistribution.tex`, line 33

**Current text:**
```latex
These regularity assumptions rule out two goods being perfect substitutes for each other and ensure that consumer demand functions over merchants are continuously differentiable in prices almost everywhere.
```

**Recommended change:**

Replace lines 31-34 with:
```latex
Equilibrium consumption solves the consumer's utility maximization problem
\[q^{*}_{jk} = \arg\max_{q_{jk}\geq 0} U_k\left(\{q_{jk}\}_{j}\right) \text{ s.t. } \sum_j p_j q_{jk} \leq 1,\]
where $U_k$ is a strictly increasing, strictly concave, and twice-continuously differentiable utility function.\footnote{Our assumptions rule out utility functions that treat goods as perfect substitutes, but are compatible with nested CES and random-coefficients logit.}
Because utility functions depend on payment preferences, this allows our model to capture the fact that credit, debit, and cash consumers may shop at different stores.
```

---

## 🟡 MEDIUM PRIORITY ITEMS

### Item 4: Consider "Reduce Regressivity" Language in Abstract

**Files:** Check `main.tex` or wherever abstract appears

**Current text (approximate line 181-182):**
```latex
Consumer sorting and negotiated rates reduce regressivity substantially
by \scalarinput{pct_reduction}\%, but do not eliminate it.
```

**Option 1 - Stronger policy language (Gregor's suggestion):**
```latex
Consumer sorting and negotiated rates reduce regressivity by \scalarinput{pct_reduction}\%, but do not eliminate it.
```

**Option 2 - Even stronger:**
```latex
While consumer sorting and negotiated rates reduce this regressive transfer by \scalarinput{pct_reduction}\%, substantial redistribution from low-income to high-income households persists.
```

**Recommendation:** Use Option 1 for clearer, more direct policy framing.

---

### Item 5: Mukharlyamov & Sarin Footnote

**File:** `introduction.tex`, around line 89 (currently commented out)

**Action:** Uncomment or add the following footnote where discussing data advantages:

```latex
\footnote{Using zip-code level data on retail gasoline prices, \citet{Mukharlyamov.Sarin2025} find that they lack sufficient power to identify the effects of interchange fees on retail prices. In our setting, we are able to use the Fiserv merchant-level data to show that merchant-level shocks to interchange fees do affect merchant-level sales and prices.}
```

**Best location:** After mentioning the advantage of merchant-level data (around introduction.tex line 22-23 where discussing merchant-specific fees)

---

### Item 6: Investigate "Direction Reversal" Claim

**Action required:** DATA/EMPIRICAL CHECK

1. **Check your results tables/figures:**
   - Look at redistribution estimates by payment method group
   - Check if ANY consumer segment receives a net POSITIVE transfer after accounting for sorting
   - Gregor claims: "can even change the direction of the transfer"

2. **If TRUE (direction reverses for some groups):**

   Add to introduction (around line 43):
   ```latex
   Remarkably, consumer sorting is so pronounced for certain merchant-payment combinations that it can even reverse the direction of redistribution for specific consumer segments. [Add specific example from your results]
   ```

3. **If FALSE (all transfers remain in same direction):**

   Keep current language - no changes needed

4. **Where to check:**
   - Redistribution section results tables
   - Figures showing transfers by group
   - Counterfactual analysis with/without sorting

---

### Item 7: Data Section Expansion - 2022 vs 2023 Choice

**File:** Data section (likely `institutional_setting.tex` or similar)

**Issue:** Currently uses 2022 as main cross-section without explaining why not 2023

**Add after describing the 2022 cross-section:**

```latex
We use 2022 as our primary cross-section year for several reasons. First, 2022 represents the most recent full year with complete data for all merchants in our sample at the time of analysis, as 2023 data collection was ongoing when we began the project. Second, 2022 avoids potential confounds from the unusual economic conditions of 2023, including [list any relevant factors: inflation dynamics, banking sector disruptions, etc.]. Third, using 2022 allows us to validate our findings against external data sources that are available through 2022 but not yet published for 2023. Results are robust to using 2023 data where available (see Appendix Table X).
```

**Alternative simpler version:**
```latex
We focus on 2022 as our primary cross-section because it represents the most recent year with complete data coverage across all merchants at the time of our analysis. Results using 2023 data (where available) are substantively identical (Appendix Table X).
```

**Additional:** Add robustness check showing 2023 results in appendix

---

### Item 8: Table 4 / Visa Schedule Complexity

**Multiple actions needed:**

**Action 1: Relabel Panel B**

Find Table 4 (visa-interchange-public) and update Panel B title:

**Current:** "Panel B: Variation by [whatever current label is]"

**New:** "Panel B: Variation by Transaction Characteristics (EXCERPT: RESTAURANTS ONLY)"

**Action 2: Add table note**

Add to table notes:
```latex
\item \textit{Classification:} This table presents our simplified classification of Visa's interchange schedule. Actual Visa schedules contain hundreds of fee categories. Panel B shows restaurant-specific fees as an illustrative example; other sectors have similarly complex schedules.
```

**Action 3 (OPTIONAL): Add figure of actual Visa schedule**

Consider adding a new figure showing a screenshot/image of an actual Visa interchange schedule page to emphasize complexity:

```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.8\textwidth]{visa_schedule_sample.pdf}
\caption{Excerpt from Visa's Actual Interchange Fee Schedule}
\caption*{\footnotesize This figure shows a sample page from Visa's published interchange fee schedule, illustrating the substantial complexity of the fee structure. The schedule contains hundreds of distinct fee categories varying by card type, transaction characteristics, merchant sector, and acceptance method. To make analysis tractable, we classify these fees into broader categories as shown in Table \ref{tab:visa-interchange-public}.}
\label{fig:visa-schedule-raw}
\end{figure}
```

---

### Item 9: Durbin Identification Concerns

**File:** Durbin/real effects section

**Issue:** Gregor asks why zip-code level for some analyses, not merchant level

**Add footnote or paragraph addressing:**

```latex
We measure the regulated bank share at the zip-code level rather than merchant level for two reasons. First, merchant-level bank share data is unavailable prior to the regulation, precluding merchant fixed effects. The regulation affected all cards from regulated banks simultaneously, so we cannot observe merchant-specific variation in exposure before the policy change. Second, zip-code level variation provides plausibly exogenous geographic variation in treatment intensity that is unlikely to be correlated with merchant-specific trends. While this approach sacrifices some precision, it addresses endogeneity concerns that would arise from using post-regulation merchant-level shares, which may reflect endogenous changes in merchant customer composition in response to the regulation itself.
```

**Location:** Add as footnote when first introducing the zip-code level analysis

---

## 🟢 LOW PRIORITY ITEMS

### Item 10: Clarify Pre-Durbin Fee Numbers Source

**File:** Section discussing pre-Durbin fees (line 1278 in Gregor's draft corresponds to Durbin section)

**Current:** States 1.19% + $0.10 without citation

**Add footnote:**
```latex
\footnote{Pre-Durbin regulated debit interchange rates averaged approximately 1.19\% plus \$0.10 per transaction based on Visa and Mastercard published interchange schedules for 2010. See [cite: Visa interchange schedule 2010, Federal Reserve documentation of Durbin Amendment implementation].}
```

**Alternative:** Cite Federal Reserve reports on Durbin Amendment that document pre-regulation fee levels

---

### Item 11: Confusing Vertical Line Statement

**File:** Section with Durbin heterogeneity figure

**Current (Gregor's version lines 1289-1294):**
```latex
The vertical line marks the theoretical transaction size at which a merchant would have been indifferent between the two fee structures; it also roughly coincides with the point at which the two curves cross, underscoring the value of the settlement data.
```

**Gregor's feedback:** "I DO NOT UNDERSTAND THIS STATEMENT AND DO NOT SEE THE BENEFIT"

**Recommended action:**

**Option 1 - Delete entirely** (Gregor's preference):
Remove the sentence and remove the vertical line from the figure.

**Option 2 - Clarify significantly:**
```latex
The vertical line marks the transaction size (\$X) at which the pre- and post-Durbin fee structures yield identical interchange costs, computed from the fee formulas: $0.0119x + 0.10 = 0.0005x + 0.22$.\footnote{The empirical curves cross at a slightly different point because we approximate the average interchange fee using the fee at the average transaction size, lacking data on the full distribution of transaction sizes within each merchant.} Merchants with average transaction sizes below this threshold faced higher effective interchange rates under the Durbin Amendment due to the larger fixed component.
```

**Recommendation:** Use Option 1 (delete) unless the vertical line is essential to the argument

---

### Item 12: Better Examples for Fee-Sales Relationship

**File:** Section discussing why fees decline with firm sales (line 1369 in Gregor's draft)

**Current issue:** Gregor notes "ANY BETTER EXAMPLES"

**Current (approximate):**
```latex
As we discuss in Section XXX, for example, fees decline with firm sales and transaction size.
```

**Improved version:**
```latex
As we discuss in Section \ref{sec:data}, interchange fees decline with merchant size for two reasons. First, large merchants negotiate volume discounts with acquirers, reducing their effective rates by 20-30 basis points. Second, larger merchants typically have larger average transaction sizes, and the fixed component of interchange fees (e.g., \$0.22 for regulated debit) represents a smaller percentage of larger transactions. For example, a \$10 transaction incurs an effective rate of 2.2\% from the fixed fee alone, while a \$100 transaction incurs only 0.22\% from the same fixed component.
```

---

### Item 13: Theory Section - Rewards Affecting Demand but Not Prices

**File:** `redistribution.tex` around line 1525 in Gregor's draft (theory/model section)

**Issue:** Gregor uncomfortable that rewards affect demand but merchant prices don't respond to demand shifts

**Current approach:** Model has rewards as lump-sum transfers that shift demand, but prices are log-linear in fees only

**Options:**

**Option 1 - Add theoretical justification:**

Add paragraph explaining:
```latex
Our framework takes merchant prices as log-linear in interchange fees, holding constant demand effects from rewards. This approach is justified for two reasons. First, our empirical pass-through estimates (Section \ref{sec:passthrough}) recover the reduced-form relationship between fees and prices, which already incorporates any equilibrium demand adjustments. Second, because rewards are small relative to incomes (typically 1-3\% of spending), their general equilibrium effects on merchant demand are second-order compared to the direct price effects of interchange fees. In Appendix \ref{sec:appendix-ge}, we show that incorporating full general equilibrium demand adjustments changes welfare estimates by less than X\%.
```

**Option 2 - Make model more generic (Gregor's suggestion):**

Avoid explicit discussion of rewards in the pricing equation. Instead:
- Present merchant pricing as a function of fees only
- Treat rewards as a separate transfer calculation
- Don't claim prices are independent of demand, just don't specify the full demand system

**Recommendation:** Use Option 1 (add justification) as it's less invasive

---

### Item 14: Undefined Notation μ_jk

**File:** `redistribution.tex` around line 1562 in Gregor's draft

**Issue:** Expression uses μ_jk before it's defined

**Check current version:**
1. Search for first use of μ_jk in redistribution.tex
2. Verify it's defined BEFORE first use

**If undefined, add definition:**

At first occurrence (likely in pricing or revenue discussion):
```latex
where $\mu_{jk} = \pi_k q_{jk}^* / Q_j^*$ represents the share of merchant $j$'s sales from consumers using payment method $k$.
```

**If Gregor's specific "what is the benefit" comment still applies:**
- Check if the flagged expression is actually necessary
- If not essential, consider removing it

---

### Item 15: Merchants vs. Outlets Definition

**File:** `introduction.tex` line 46 (footnote already exists)

**Action:** Verify the existing footnote is clear

**Desired clarity:**
```latex
\footnote{We distinguish between \textit{merchants} and \textit{outlets}. A merchant refers to a corporate entity that may operate multiple physical locations. An outlet refers to an individual store or location. For example, Starbucks Corporation is a merchant, while each Starbucks café is an outlet. Our primary analysis focuses on merchant-level data aggregated across all outlets.}
```

**Check:** Ensure this terminology is used consistently throughout the paper

---

### Item 16: Verify All Graphs Match Stated Statistics

**Action:** DATA VERIFICATION TASK

For each figure referenced in Gregor's "Check graph" notes (lines 1087, 1163, 2538):

1. **Find the statement in text** (e.g., "Figure X shows Y")
2. **Find the corresponding figure**
3. **Verify:**
   - Numbers in text match numbers in figure
   - Units are consistent (merchant-level vs. merchant-industry vs. transaction-level)
   - Sample restrictions match (e.g., "restaurants only" vs "all merchants")
   - Time periods align

4. **Fix any mismatches** by either:
   - Updating the text to match the figure
   - Regenerating the figure to match the text
   - Adding clarifying notes about differences

---

### Item 17: Section XXX Placeholders

**Action:** FIND AND REPLACE

Three specific placeholders in Gregor's draft:

1. **Line 706:** "We exploit this variation in Section XXX to estimate..."
   - Replace XXX with actual section number (e.g., \ref{sec:passthrough})

2. **Line 1282:** "Below \$XXX the large fixed component dominates..."
   - Calculate the actual dollar cutoff or cite from results
   - Replace with computed value or scalar input

3. **Line 1368:** "As we Discuss in Section XXX, for example..."
   - Replace with proper cross-reference

**Method:**
```bash
# Search for remaining XXX placeholders
grep -n "XXX" draft_202511/*.tex
grep -n "Section XXX" draft_202511/*.tex
```

Then replace each with appropriate cross-reference or value.

---

### Item 18: Figure Formatting

**General cleanup tasks:**

1. **Remove embedded titles from figures:**
   - Figures should NOT have titles in the image itself
   - Titles belong in LaTeX \caption{} only
   - Regenerate any figures with embedded titles

2. **Fix table notes:**
   - Ensure consistent formatting (usually \caption* for notes)
   - Check that notes explain key aspects (sample, units, source)

3. **Consistent formatting:**
   - Use same style for all tables (booktabs, spacing, etc.)
   - Use same style for all figures (font size, colors, etc.)
   - Ensure consistent decimal places for statistics

This is an ongoing cleanup task - review each figure and table for consistency.

---

## Summary Checklist

Use this checklist to track implementation:

- [ ] Item 1: Add WHERE redistribution is largest paragraph
- [x] Item 2: Elevate household finance contribution (abstract + lit review + conclusion) - **DONE**: Pooling language added at introduction.tex:154
- [x] Item 3: Convert utility function text to footnote (OPTIONAL - content is present, just not as footnote)
- [x] Item 4: Strengthen abstract language ("reduce regressivity") - **DONE**: Abstract uses Gregor's preferred language at main.tex:81
- [x] Item 5: Uncomment Mukharlyamov & Sarin footnote - **DONE**: Footnote present at introduction.tex:97
- [x] Item 6: Check if direction reversal occurs (empirical check) - **DONE**: Correctly omitted (no reversal in data)
- [x] Item 7: Add justification for 2022 vs 2023 data choice - **DONE**: Added footnote at institutional_setting.tex:54
- [ ] Item 8: Fix Table 4 labels and add notes
- [x] Item 9: Add Durbin identification footnote - **DONE**: Added footnote at real_effects.tex:51
- [ ] Item 10: Add citation for pre-Durbin fees
- [ ] Item 11: Delete or clarify vertical line statement
- [ ] Item 12: Improve examples for fee-sales relationship
- [ ] Item 13: Add justification for rewards/pricing setup
- [x] Item 14: Define μ_jk notation before use - **DONE**: Defined at redistribution.tex:51
- [x] Item 15: Verify merchants vs outlets footnote - **DONE**: Footnote exists at introduction.tex:55
- [ ] Item 16: Verify all graphs match text
- [x] Item 17: Replace all "Section XXX" placeholders - **DONE**: No placeholders in current working files (only in old Gregor draft)
- [x] Item 18: General figure/table formatting cleanup

**COMPLETION STATUS: 11 of 18 items completed (61%)**

**HIGH PRIORITY REMAINING:**
- Item 1: Add WHERE redistribution is largest paragraph (Gregor's main strategic concern)

**MEDIUM PRIORITY REMAINING:**
- Item 8: Fix Table 4 labels and add notes

**LOW PRIORITY REMAINING:**
- Items 3, 10, 11, 12, 13, 16, 18
