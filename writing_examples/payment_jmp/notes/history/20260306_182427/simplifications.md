# Suggested Simplifications

## [counterfactuals.tex]

### Priority 1: Colons — Remove Artificial Drama

**Line 4:** Remove colon before "consumers are roughly an order of magnitude..."
- Current: "The estimated model confirms the competitive bottleneck: consumers are roughly..."
- Simpler: "The estimated model confirms the competitive bottleneck: consumers are roughly..." → keep it, but consider tightening "roughly" (see below).

**Line 89–90:** Replace colon with em-dash or period.
- Current: "...while retail price competition returns the costs to shoppers: a closed loop."
- Simpler: "...while retail price competition returns the costs to shoppers—a closed loop." OR "...to shoppers. But this closed loop breaks..."

**Line 181:** Replace colon with em-dash.
- Current: "This reveals a fundamental tension: rewards pull consumers..."
- Simpler: "Rewards pull consumers toward credit cards despite preferring debit—a key tension."

---

### Priority 2: Hedging & "Fundamental" Language

**Line 4:** Replace "roughly an order of magnitude" with precise approximation.
- Current: "roughly an order of magnitude more sensitive"
- Simpler: "approximately 10 times more sensitive"

**Line 173:** Remove "fundamentally different."
- Current: "Payment markets are fundamentally different."
- Simpler: "In payment markets, rewards come not from production but from rent extraction."

**Line 181:** Remove "fundamental" from "fundamental tension."
- Current: "reveals a fundamental tension"
- Simpler: "a key tension" or just "this tension"

**Lines 76–85:** Tighten hedges in LLM block.
- Current: "The outcome is near-Pareto"; "too small...to impose meaningful losses"
- Simpler: Remove "near-" and "too small to"; state dollar amounts directly.

---

### Priority 3: Inventory-Style Numbers & Missing Causal Logic

**Lines 31–44:** Embed share-change numbers into causal explanation upfront.
- Current: Announces "Lower credit rewards cause consumers to substitute..." then lists numbers (21 pp, 12 pp, 9 pp).
- Simpler: "Lower credit rewards cause consumers to shift 21 percentage points from credit to debit (12 pp) and cash (9 pp)..."

**Lines 46–53:** Integrate normalization fact into result.
- Current: "Lower card use reduces...Nilson finds...Given that total income is normalized...each basis point corresponds... With this normalization I find..."
- Simpler: "Using Nilson's $10 trillion baseline as normalization, capping fees reduces merchant fees by $58 billion and rewards by $57 billion—a near-equal pass-through revealing how networks defend margins."

**Lines 141–144:** Remove table-caption language ("decomposes by sequentially walking through").
- Current: "Table~\ref{...} decomposes the welfare effects...In the first step...In the second step..."
- Simpler: "To isolate each channel, I sequentially fix variables at baseline. First, I hold merchant prices and acceptance while networks re-optimize (Network Effect)..."

---

### Priority 4: Meta-Commentary & Padding Phrases

**Lines 76–85:** Remove "The outcome is near-Pareto:" prefix.
- Current: "The outcome is near-Pareto: lower retail prices benefit all consumers, while the reduction in credit rewards..."
- Simpler: "Lower retail prices benefit all consumers while higher-income cardholders lose $4 in annual rewards—nearly Pareto."

**Line 207:** Remove "Credit cards are not inherently harmful."
- Current: Standalone defensive opener.
- Simpler: Delete or move to concluding sentence after evidence.

**Line 209:** Cut "would further increase welfare" (redundant with "social optimum").
- Current: "...reflecting that some fee reduction beyond 120 basis points would further increase welfare."
- Simpler: Delete phrase; the optimum speaks for itself.

---

### Priority 5: Template Language & Over-Explanation

**Lines 23–26:** Tighten LLM block.
- Current: "At this level, the cap binds for credit cards and AmEx but not for debit, where fees are already lower. A moderate cap keeps the counterfactual close to observed fee levels, avoiding the large out-of-sample extrapolation required by more aggressive caps."
- Simpler: "This cap binds for credit and AmEx but not debit. A moderate level avoids large out-of-sample extrapolation."

**Lines 173–175:** Replace "In standard markets, consumer choices drive efficient outcomes..." template.
- Current: Template contrast ("In standard markets... Payment markets are fundamentally different...")
- Simpler: Direct statement: "In payment markets, rewards come not from production but from rent extraction through high merchant fees."

---
