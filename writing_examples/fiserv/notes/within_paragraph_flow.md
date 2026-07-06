# Within-Paragraph Flow Review

Review of sentence-to-sentence flow within paragraphs across all prose subfiles of `draft_202511/`.

---

## High Impact

### - [ ] introduction.tex:48-49 — Disconnected sentence breaks data description flow

**Comment:** "Cash transactions are notoriously difficult to capture in large datasets" (line 49) sits between the Clover feature description and the validation sentence. It explains *why* the Clover data matter but is stranded after the point it motivates. Moving it before the Clover feature creates a cause-then-payoff structure.

**Original:**
```
A unique feature of the Clover data is that it includes both cash and card payments, allowing us to observe the full composition of payments.
Cash transactions are notoriously difficult to capture in large datasets.
We validate the data against public sources...
```

**Proposed Revision:**
```
Because cash transactions are notoriously difficult to capture in large datasets, a unique feature of the Clover data is that it includes both cash and card payments, allowing us to observe the full composition of payments.
We validate the data against public sources...
```

**Why better:** The reason (cash is hard to observe) now precedes the payoff (Clover captures it), and the orphaned sentence is absorbed.

---

### - [ ] introduction.tex:95-99 — Sales tax analogy appears after unrelated debit finding

**Comment:** Lines 95-96 report cash and debit losses, line 97 makes a new argument (debit users subsidize too), then line 98 jumps back to a sales tax analogy for cash users. The sales tax comparison logically follows the loss estimates, not the debit subsidization point.

**Original:**
```
Our calculations suggest that cash users lose around X basis points of purchasing power and that regulated debit card users lose around Y basis points.
Although much emphasis has been placed on cash users subsidizing credit card rewards, we show that debit card users also subsidize a substantial share of those rewards.
Relative to an average state and local sales tax rate of around 6%, our calculations suggest that interchange fees are analogous to raising the sales tax rate for cash users by around X% and that for regulated debit card users by Y%.
In contrast, basic and premium credit card users consume around Z basis points more...
```

**Proposed Revision:**
```
Our calculations suggest that cash users lose around X basis points of purchasing power and that regulated debit card users lose around Y basis points.
Relative to an average state and local sales tax rate of around 6%, interchange fees are analogous to raising the sales tax rate for cash users by around X% and for regulated debit card users by Y%.
Basic and premium credit card users, by contrast, consume around Z basis points more...
Although much emphasis has been placed on cash users subsidizing credit card rewards, debit card users also subsidize a substantial share of those rewards.
```

**Why better:** The sales tax analogy now directly follows the loss estimates it quantifies. The debit subsidization point closes the paragraph as a punchline rather than interrupting the quantitative comparison. Also drops "we show that" (unnecessary self-reference) and "our calculations suggest" (redundant — already said on prior line). "In contrast" opener replaced with mid-sentence "by contrast."

---

### - [ ] introduction.tex:108-112 — Restated premise and dangling participial

**Comment:** Line 109 ("Redistribution requires that consumers with different payment methods shop at the same merchants...") restates a condition established three times already (lines 7, 21, 57). Line 112 ends with "highlighting how equilibrium pricing both reflects and mitigates cross-subsidization" — a participial phrase that adds abstraction without content.

**Original:**
```
Variation in interchange fees across merchants, driven by a combination of sector discounts and the bargaining power of large merchants, also shapes the redistributive effects of interchange fees.
Redistribution requires that consumers with different payment methods shop at the same merchants, and that the payment methods incur different interchange fees.
Grocery stores, gas stations, and large retailers exhibit the greatest overlap between consumers using different payment methods, but they also face the lowest levels of interchange fees and the smallest fee differentials across payment methods, due to sectoral discounts and private negotiations. This substantially reduces the extent of redistribution.
Even though fee heterogeneity suggests that Visa and Mastercard exert market power over merchants, the networks do so in a way that moderates the amount of redistribution in the payment system.
These sector and negotiated discounts lead to a progressive redistribution of approximately $X billion per year to cash and regulated debit card users, thereby attenuating the overall transfer, highlighting how equilibrium pricing both reflects and mitigates cross-subsidization.
```

**Proposed Revision:**
```
Variation in interchange fees across merchants, driven by a combination of sector discounts and the bargaining power of large merchants, also shapes redistribution.
Grocery stores, gas stations, and large retailers exhibit the greatest overlap between consumers using different payment methods, but they also face the lowest interchange fees and the smallest fee differentials, due to sectoral discounts and private negotiations. This substantially reduces cross-subsidization.
Even though fee heterogeneity suggests that Visa and Mastercard exert market power over merchants, the networks do so in a way that moderates redistribution.
These sector and negotiated discounts generate a progressive transfer of approximately $X billion per year to cash and regulated debit card users, attenuating the overall regressive effect.
```

**Why better:** Removes the restated premise (line 109). Cuts the dangling participial. Tightens repeated phrases ("the redistributive effects of interchange fees" → "redistribution"; "the extent of redistribution" → "cross-subsidization" for variety). The paragraph now moves directly from the claim to the evidence to the implication.

---

### - [ ] redistribution.tex:8-12 — Monster paragraph (~150 words) mixes five ideas

**Comment:** The section opener packs five distinct ideas into one paragraph: (a) two approaches, (b) counterfactuals, (c) SS assumptions and features, (d) the pass-through assumption, (e) why the structural model is needed. The reader cannot extract a single point from this paragraph.

**Original:**
```
In this section, we describe the development of two related approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model.
These approaches allow us to quantify how redistribution changes when accounting for consumer sorting and merchant fee heterogeneity.
We also evaluate different regulatory counterfactuals: European-style regulation and the consequences of the Durbin Amendment.

Each approach rests on different assumptions. The sufficient statistic approach applies broadly across utility functions and market structures, and highlights the first-order determinants of redistribution from interchange fees. A key feature of the sufficient statistic approach is that it imposes minimal structure on the problem. This is a feature because it avoids strong functional-form assumptions; however, without additional structure governing merchant competition, we must make an assumption about how interchange fees pass through to prices. In our baseline implementation of the sufficient statistic approach, we assume full pass-through of interchange fees to prices. We view this as a reasonable approximation for industry-wide cost shocks, but relax it in the structural model. In the structural model, we impose more parametric assumptions on consumer utility functions and the nature of competition between firms. Because the estimates from the two methods are quantitatively similar, we present the more intuitive sufficient statistic approach first.
```

**Proposed Revision:**
```
We develop two approaches to evaluate how interchange fees redistribute consumption: a sufficient-statistics approach and a structural model.
Both approaches quantify how redistribution changes when accounting for consumer sorting and merchant fee heterogeneity, and we use them to evaluate regulatory counterfactuals including European-style fee caps and the Durbin Amendment.

The sufficient-statistics approach imposes minimal structure. It applies broadly across utility functions and market structures, avoiding strong functional-form assumptions. The tradeoff is that, without a model of merchant competition, we must assume how interchange fees pass through to prices. In our baseline, we assume full pass-through, a reasonable approximation for industry-wide cost shocks.

The structural model imposes more parametric assumptions on consumer utility and firm competition, but allows us to relax the pass-through assumption. Because the two methods yield quantitatively similar estimates, we present the sufficient-statistics approach first.
```

**Why better:** Three short paragraphs, each with one point: (1) what we do, (2) the SS approach and its tradeoff, (3) the structural model and why we order them this way. Removes throat-clearing ("In this section, we describe the development of"), "A key feature... is that" construction, and the circular "This is a feature because."

---

### - [ ] results.tex:17-26 — Policy framing jumps to academic benchmark without bridge

**Comment:** The paragraph covers four things: (1) merchant lobby view, (2) bank lobby view, (3) why both miss the point, (4) an academic benchmark calculation. The shift from "Both views miss..." to "Academic research has attempted to quantify this transfer" is abrupt — the reader expects elaboration on what both views miss, not a pivot to a different literature. Then "Our analysis yields a more modest estimate" starts yet another thread.

**Original:**
```
Public discussion of interchange fees is polarized between two extreme views.
Merchant groups characterize the fees as a ``hidden tax,'' describing the $100 billion in annual interchange fees as money siphoned from the economy.
In contrast, bank lobbyists frame interchange solely as funding for consumer rewards, ignoring that the fees can inflate retail prices.
Both views miss that interchange fees transfer consumption, rather than imposing pure costs or providing free benefits.

Academic research has attempted to quantify this transfer. Following the logic of \citet{schuh2010gains}, if we focus on credit card versus cash users and assume homogeneous shopping behavior, the calculation is straightforward. U.S. merchants paid approximately $80 billion in credit card interchange fees in 2022. With credit cards representing roughly half of payment volume, cash users cross-subsidize credit users by approximately $40 billion annually.

Our analysis yields a more modest estimate of approximately $X billion, but more importantly, it reveals a richer picture of who pays whom. Three findings stand out. First, ...
```

**Proposed Revision:**
```
Public discussion of interchange fees is polarized between two extreme views.
Merchant groups characterize the fees as a ``hidden tax,'' describing the $100 billion in annual interchange fees as money siphoned from the economy.
Bank lobbyists frame interchange solely as funding for consumer rewards, ignoring that the fees can inflate retail prices.
Both views miss that interchange fees transfer consumption, rather than imposing pure costs or providing free benefits.

Academic research has tried to quantify this transfer but has relied on strong simplifications. Following the logic of \citet{schuh2010gains}, if we focus on credit card versus cash users and assume homogeneous shopping behavior, the calculation is straightforward. U.S. merchants paid approximately $80 billion in credit card interchange fees in 2022. With credit cards representing roughly half of payment volume, cash users cross-subsidize credit users by approximately $40 billion annually.

Our analysis yields a more modest estimate of approximately $X billion, but more importantly, it reveals a richer picture of who pays whom. Three findings stand out. First, ...
```

**Why better:** The bridge sentence "has tried to quantify this transfer but has relied on strong simplifications" connects the academic literature back to the "both views miss" point (the simplifications *are* what's missed) and sets up the benchmark calculation as an illustration of those simplifications. Also removes "In contrast" sentence opener (AI tell); "attempted" → "tried" (plainer).

---

### - [ ] results.tex:68-69 — Throat-clearing before sales tax comparison

**Comment:** "It is helpful to put these changes in consumption in perspective" is meta-commentary. The comparison speaks for itself.

**Original:**
```
Across all cash users, this amounts to approximately $X billion in lost annual consumption.
It is helpful to put these changes in consumption in perspective.
One natural benchmark is the sales tax, which serves as a tax on consumption.
```

**Proposed Revision:**
```
Across all cash users, this amounts to approximately $X billion in lost annual consumption.
One natural benchmark is the sales tax.
```

**Why better:** Cuts two sentences of throat-clearing. "Which serves as a tax on consumption" is tautological (a sales tax is, by definition, a tax on consumption).

---

## Medium Impact

### - [ ] introduction.tex:13-16 — EU comparison tacked onto U.S. litigation paragraph

**Comment:** The paragraph opens with U.S. litigation and legislation, then the final sentence pivots to the EU without connecting it to the argument. The EU fact is relevant but needs to either motivate the U.S. debate or start its own sentence pair.

**Original:**
```
The U.S. regulatory environment strongly contrasts with the European Union's interchange fee regulation, which has capped interchange fees at less than one-sixth of the highest fees charged in the U.S., highlighting the wide variation in regulatory approaches across jurisdictions.
```

**Proposed Revision:**
```
The U.S. fees that merchants seek to reduce are already far higher than those in the European Union, which caps interchange at less than one-sixth of the highest U.S. rates.
```

**Why better:** Connects the EU fact back to the paragraph's subject (merchants fighting fees). Removes "highlighting the wide variation in regulatory approaches across jurisdictions" (vague takeaway that adds nothing). Shorter.

---

### - [ ] introduction.tex:114-117 — 55-word sentence at paragraph end

**Comment:** The final sentence tries to draw two lessons at once ("essential to understanding..." and "more broadly how policy and innovation can reshape..."). Split into two sentences.

**Original:**
```
These two examples illustrate how distinguishing between different types of debit and credit cards is essential to understanding the effects of interchange in modern payment systems, and more broadly how policy and innovation can reshape the incidence of platform fees.
```

**Proposed Revision:**
```
Both examples show that distinguishing between types of debit and credit cards is essential for understanding interchange in modern payment systems. They also illustrate how policy and innovation can reshape the incidence of platform fees.
```

**Why better:** Two sentences, each with one point. Drops "more broadly" (AI transition).

---

### - [ ] institutional_setting.tex:7-11 — Throat-clearing opener

**Comment:** Five consecutive sentences describe what the section will do before doing it.

**Original:**
```
In this section, we outline the institutional details and describe our data.
We explain how credit and debit card payment systems operate, focusing on key participants, costs, benefits, and transfers.
We then introduce our two primary merchant-level payment datasets from Fiserv, which allow us to observe how the types and costs of payment methods vary across merchants.
These data show which payments merchants receive and what fees they pay.
Together, these data allow us to link merchant-level payment composition and costs to redistribution across consumers.
```

**Proposed Revision:**
```
We begin with the institutional details of card payment systems, focusing on key participants, costs, and transfers, and then introduce our two merchant-level datasets from Fiserv.
These data show which payments merchants receive and what fees they pay, allowing us to link payment composition and costs to redistribution across consumers.
```

**Why better:** Two sentences instead of five. Preserves the roadmap function without belaboring it.

---

### - [ ] payment_costs.tex:37-42 — Paragraph drifts from distribution to cross-subsidization via throat-clearing pivot

**Comment:** "This pattern has implications for cross-subsidization" is a throat-clearing pivot. The sentences that follow introduce a new claim ("debit card transactions also potentially play a subsidizing role") that doesn't flow from the bimodality description.

**Original:**
```
This bimodality suggests that although credit cards account for 53% of card transactions on average, merchants tend to fall into two distinct groups: those where credit accounts for around 25% of card transactions and those where it accounts for about 75%.
This pattern has implications for cross-subsidization.
Debit cards carry lower interchange fees and rewards relative to credit cards.
Just as cash transactions can subsidize credit card rewards, debit card transactions also potentially play a subsidizing role.
The bimodal nature of the distribution suggests that variation in card payment mix is significant at the merchant level---again limiting the potential for cross-subsidization, as many merchants are dominated by a single payment type.
```

**Proposed Revision:**
```
This bimodality suggests that merchants fall into two groups: those where credit accounts for around 25% of card transactions and those where it accounts for about 75%.
Because debit cards carry lower interchange fees and rewards than credit cards, debit card transactions can subsidize credit card rewards in the same way cash transactions do.
But the bimodal distribution limits this cross-subsidization: many merchants are dominated by a single payment type, leaving little scope for transfers between debit and credit users at those stores.
```

**Why better:** Removes the throat-clearing pivot, the redundant "although credit cards account for 53% on average" (already stated two sentences earlier), and "potentially play a subsidizing role" (hedged and vague). The logic now flows: bimodality → debit subsidization mechanism → but bimodality limits it.

---

### - [ ] payment_costs.tex:63-66 — 75-word sentence with nested parentheticals

**Comment:** One sentence tries to describe two data sources and what each provides, with parenthetical clarifications embedded.

**Original:**
```
The DCPC provides information on consumer preferences between cash, debit, and credit by income level, while MRI-Simmons USA offers supplementary data on whether debit card users have accounts at small or large banks (relevant for distinguishing exempt versus regulated debit) and whether credit card users hold premium cards (such as Visa Signature or Mastercard World).
```

**Proposed Revision:**
```
The DCPC provides information on consumer preferences between cash, debit, and credit by income level.
MRI-Simmons USA supplements this with data on whether debit card users bank at small or large institutions (distinguishing exempt from regulated debit) and whether credit card users hold premium cards.
```

**Why better:** Split into two sentences. Each data source gets its own sentence. Parenthetical examples (Visa Signature, Mastercard World) removed — the reader knows what premium cards are by this point in the paper.

---

### - [ ] results.tex:214-219 — Back-to-back "Moreover" and "Consequently"; paragraph mixes who-pays with why-premiumization-accelerates

**Comment:** The paragraph starts by describing who benefits and who loses from premiumization, then pivots to explaining the *incentive to adopt* premium cards (a separate argument about the arms-race dynamic). "Moreover" and "Consequently" back-to-back signal that the connections are being forced rather than flowing naturally.

**Original:**
```
Notably, the largest costs in dollar terms accrue not to cash users but to debit card users (both regulated and exempt) and basic credit card users.
These groups shop more frequently at the same merchants as premium cardholders, and therefore bear a greater share of the burden from the higher interchange fees associated with premium cards.
Moreover, because all consumers face the same prices regardless of payment method, consumers have incentives to adopt the most expensive card offering the most generous rewards.
Consequently, costly payment methods, such as premium credit cards, tend to crowd out cheaper ones, such as basic cards, helping to explain the rise of premiumization.
```

**Proposed Revision:**
```
The largest costs in dollar terms accrue not to cash users but to debit card users (both regulated and exempt) and basic credit card users, who shop more frequently at the same merchants as premium cardholders.

Because all consumers face the same retail prices regardless of payment method, each consumer has an incentive to adopt the card with the most generous rewards. Costly payment methods therefore tend to crowd out cheaper ones, helping to explain the rise of premiumization itself.
```

**Why better:** Splits into two paragraphs (who pays vs. the arms-race dynamic). Removes "Notably" (AI tell), "Moreover," "Consequently" (transition overuse). Merges the "These groups" sentence into the prior one to eliminate a bare demonstrative.

---

## Surface Issues (AI tells in flow-relevant contexts)

These are transition-word issues that would be fixed as part of the above edits or as standalone swaps:

| Location | Issue | Fix |
|----------|-------|-----|
| introduction.tex:24 | "More broadly, the existing literature" | Drop "More broadly," — the paragraph break already signals broadening |
| introduction.tex:131 | "In contrast, we document" | "We document" (the contrast is clear from context) |
| institutional_setting.tex:29 | "Additionally, both the issuer and the acquirer" | "Both the issuer and the acquirer also" |
| payment_costs.tex:35 | "Moreover, the share of credit card transactions" | "The share of credit card transactions" |
| payment_costs.tex:201 | "Moreover, at the merchants where" | "At the merchants where" |
| conclusion.tex:16 | "More broadly, these results highlight" | "These results also show" |
| introduction.tex:112 | "highlighting how equilibrium pricing" | (addressed in Fix 3 above) |
| payment_costs.tex:23 | "highlighting the concentration" | "reflecting the concentration" or restructure |
