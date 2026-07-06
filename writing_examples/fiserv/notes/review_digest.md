# Review Digest — All Issues Sorted by Severity

Consolidated from: ai_detection.md, simplifications.md, word_choice_review.md, sentence_analysis.md, writing_quality.md, within_paragraph_flow.md, structure_analysis.md, flow_extraction.md, copy_edits.md

Items marked with their source review(s). Duplicate flags across reviews are merged.

---

## Critical

### - [ ] introduction.tex:24-25 — "no longer sufficient to determine" overshoots evidence
**Sources:** ai_detection, simplifications

**Comment:** The phrase "average fee differences are no longer sufficient to determine redistribution" reads as a strong logical claim ("determine"), but the paper's evidence is empirical, not a formal impossibility proof.

**Original:**
```
If consumers using different payment methods sort into different merchants, or if merchants face heterogeneous fees, then average fee differences are no longer sufficient to determine redistribution.
```

**Proposed Revision:**
```
If consumers using different payment methods sort into different merchants, or if merchants face heterogeneous fees, then average fee differences misstate redistribution.
```

**Why better:** "Misstate" is direct and accurate without implying a formal sufficiency result the paper does not prove.

---

### - [ ] introduction.tex:111-112 — "the networks do so in a way that moderates" imputes intent
**Sources:** ai_detection, simplifications

**Comment:** Attributing intentional moderation to Visa/Mastercard's pricing overshoots the evidence. The paper documents the pattern but does not identify the networks' intent.

**Original:**
```
Even though fee heterogeneity suggests that Visa and Mastercard exert market power over merchants, the networks do so in a way that moderates the amount of redistribution in the payment system.
```

**Proposed Revision:**
```
Fee heterogeneity suggests that Visa and Mastercard exert market power over merchants, but the resulting fee structure moderates the amount of redistribution in the payment system.
```

**Why better:** Attributes the moderation to the fee structure rather than implying intentional network behavior, matching the descriptive evidence.

---

## High

### - [X] introduction.tex:85-90 — 55-word sentence with stacked qualifications + "Importantly" opener
**Sources:** ai_detection, word_choice, sentence_analysis, writing_quality

**Comment:** Multiple nested qualifications ("avoids the need to," "allowing us to," "without imposing") read as LLM-generated. "Importantly" is a classic AI transition opener.

**Original:**
```
Importantly, this approach avoids the need to estimate a full demand system or explicitly model strategic interactions among firms, allowing us to map observed heterogeneity directly into redistribution without imposing strong functional-form assumptions on demand.
```

**Proposed Revision:**
```
This approach bypasses estimating a full demand system or modeling strategic interactions among firms. It maps observed heterogeneity directly into redistribution without strong functional-form assumptions on demand.
```

**Why better:** Splits into two shorter sentences. Removes "Importantly" and "avoids the need to" padding.

---

### - [X] introduction.tex:108-112 — Restated premise, dangling participial, trailing "highlighting"
**Sources:** within_paragraph_flow, ai_detection, simplifications

**Comment:** Line 109 restates a condition established three times already. Line 112 ends with "highlighting how equilibrium pricing both reflects and mitigates cross-subsidization" -- a participial phrase that adds abstraction without content. "Both reflects and mitigates" is AI-typical balanced phrasing.

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

**Why better:** Removes the restated premise (line 109). Cuts the dangling participial. Tightens repeated phrases ("the redistributive effects of interchange fees" -> "redistribution"). The paragraph now moves directly from claim to evidence to implication.

---

### - [ ] introduction.tex:36-41 — Inventory-style numbers (government programs + financial market comparisons)
**Sources:** ai_detection, writing_quality, sentence_analysis

**Comment:** Five dollar figures and percentages in sequence. Each number is a separate claim, but the passage reads as a list rather than building an argument.

**Original:**
```
Overall, cash users pay the equivalent of \absinput{effective_tax}\% higher sales taxes than premium credit card users.
Because credit card use increases with income, this represents a \$\absinput{cap_high_income_loss_dollars} billion annual transfer from low- and middle-income households earning less than \$150,000 in annual income to higher-income households.
These transfers are economically significant, comparable in size (but opposite in direction) to major government programs such as SNAP (\$120bn), the Earned Income Tax Credit (\$57bn), and unemployment insurance (\$40bn).
```

**Proposed Revision:**
```
Cash users pay the equivalent of \absinput{effective_tax}\% higher sales taxes than premium credit card users.
Because credit card use increases with income, interchange fees transfer \$\absinput{cap_high_income_loss_dollars} billion annually from households earning less than \$150,000 to higher-income households --- comparable in magnitude to SNAP (\$120bn), the Earned Income Tax Credit (\$57bn), and unemployment insurance (\$40bn), but flowing in the opposite direction.
```

**Why better:** Tightens the inventory by folding the comparison into the claim sentence. Removes "Overall" opener and "These transfers are economically significant" padding.

---

### - [ ] introduction.tex:11 — 60+ word compound sentence (assumptions, sorting, heterogeneity, incidence)
**Sources:** sentence_analysis, writing_quality

**Comment:** Packs three distinct ideas into one colon-joined construction.

**Original:**
```
This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs. In practice, however, both assumptions fail: consumers sort across merchants based on payment preferences, and merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts. As a result, the incidence of interchange fees cannot be inferred from average fees or representative consumers, but instead depends on the joint distribution of payment choices across merchants.
```

**Proposed Revision:**
```
This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs. Both assumptions fail in practice. Consumers sort across merchants based on payment preferences. Merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts. As a result, the incidence of interchange fees depends on the joint distribution of payment choices across merchants, not on average fees or representative consumers.
```

**Why better:** Breaks a 50-word sentence into three shorter ones. "Both assumptions fail in practice" provides punch. Final sentence puts the positive claim first.

---

### - [ ] introduction.tex:25 — 55+ word sentence with three nested clauses
**Sources:** sentence_analysis, word_choice

**Comment:** Three appositional phrases chained with "and" in a single sentence.

**Original:**
```
Instead, incidence depends on the covariance between payment choices and merchant characteristics---a dimension that has been largely unobserved in prior work, and one that is central to determining the direction and magnitude of transfer, and therefore to understanding who ultimately bears the cost of interchange fees.
```

**Proposed Revision:**
```
Instead, incidence depends on the covariance between payment choices and merchant characteristics. This dimension has been largely unobserved in prior work, yet it is central to determining both the direction and magnitude of transfers---and therefore to understanding who ultimately bears the cost of interchange fees.
```

**Why better:** Splits one 55-word sentence into two. The dash-interrupted clause at the end now serves as a single climactic point.

---

### - [ ] introduction.tex:34 — 50+ word sentence doing triple duty
**Sources:** sentence_analysis, writing_quality, word_choice

**Comment:** Tries to describe the approach, state what it avoids, and add a qualification about pass-through assumptions.

**Original:**
```
This approach allows us to quantify redistribution without estimating a full demand system, and to isolate the role of sorting and fee heterogeneity in shaping incidence, under empirically plausible pass-through assumptions that we examine in the data and in a structural model.
```

**Proposed Revision:**
```
This approach allows us to quantify redistribution without estimating a full demand system and to isolate how sorting and fee heterogeneity shape incidence. We examine the underlying pass-through assumptions both empirically and in a structural model.
```

**Why better:** Splits one overloaded sentence into two focused ones. Replaces wordy "the role of sorting and fee heterogeneity in shaping incidence" with a direct verb phrase.

---

### - [ ] introduction.tex:142-145 — Naifs-and-sophisticates paragraph conflates two arguments
**Sources:** writing_quality, sentence_analysis

**Comment:** Pooling mechanism contrast and policy implications deserve separation. Final 55-word sentence should be broken.

**Original:**
```
Our findings on redistribution through the payment system contrast significantly with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products.
In contrast, redistribution arises in our setting when naifs and sophisticates choose different financial products but pool at the same merchants.
This leads to qualitatively different recommendations for reducing redistribution.
Whereas in most traditional settings separating contracts (between consumer types) can reduce redistribution, in our setting, it is precisely this separation across financial instruments (i.e., payment methods) that drives redistribution, shifting attention from financial contract design to the interaction between consumer sorting and merchant pricing.
```

**Proposed Revision:**
```
Our findings contrast with prior work on how unsophisticated consumers cross-subsidize sophisticated ones when both pool on the same financial products.
In our setting, redistribution arises from the opposite pattern: naifs and sophisticates choose different financial products but pool at the same merchants.
The policy implications differ accordingly.
In traditional settings, separating contracts between consumer types can reduce redistribution. In our setting, it is precisely this separation across payment methods that drives redistribution. The relevant margin shifts from financial contract design to the interaction between consumer sorting and merchant pricing.
```

**Why better:** "The policy implications differ accordingly" is a short bridge sentence. Breaks the final 50-word sentence into three focused statements. Removes wordy "Our findings on redistribution through the payment system."

---

### - [ ] introduction.tex:6-9 — Opening paragraph's third sentence is overloaded (43 words)
**Sources:** writing_quality

**Comment:** Four things in one sentence: interchange fees as cost component, fees flowing back as rewards, the cross-subsidy, and who captures rewards.

**Original:**
```
Since interchange fees---the major component of acceptance costs---flow back to consumers as rewards, a cross-subsidy emerges: all consumers pay higher retail prices, but the users of high-interchange-fee credit cards capture most of the rewards \citep{carlton1994antitrust}.
```

**Proposed Revision:**
```
Interchange fees, the major component of acceptance costs, flow back to consumers as rewards.
Because high-interchange-fee credit cards generate the richest rewards, all consumers pay higher retail prices while credit card users capture most of the benefit \citep{carlton1994antitrust}.
```

**Why better:** Splits one overloaded sentence into two, each making a single point. Removes the em-dash pair and colon construction.

---

### - [ ] introduction.tex:30-34 — Roadmap uses throat-clearing ("We proceed in three parts")
**Sources:** writing_quality, ai_detection, simplifications

**Comment:** Meta-commentary plus 56-word final sentence.

**Original:**
```
We proceed in three parts.
First, we document striking heterogeneity in both payment mix and interchange fees across merchants.
Second, we show that this heterogeneity reflects systematic consumer sorting across merchants and variation in merchant-level bargaining power and sectoral pricing.
Third, we develop a sufficient-statistics framework that maps these empirical moments into welfare and redistribution across consumer groups.
This approach allows us to quantify redistribution without estimating a full demand system, and to isolate the role of sorting and fee heterogeneity in shaping incidence, under empirically plausible pass-through assumptions that we examine in the data and in a structural model.
```

**Proposed Revision:**
```
We document striking heterogeneity in both payment mix and interchange fees across merchants, and show that this heterogeneity reflects systematic consumer sorting and variation in merchant-level bargaining power and sectoral pricing.
We then develop a sufficient-statistics framework that maps these empirical moments into welfare and redistribution across consumer groups without estimating a full demand system.
We validate the framework against a structural model with imperfect pass-through.
```

**Why better:** Removes "We proceed in three parts" (throat-clearing). Consolidates the first two contributions into one sentence. Splits the overlong final sentence.

---

### - [ ] introduction.tex:52-57 — Mechanism not explained (why bimodality limits redistribution)
**Sources:** writing_quality

**Comment:** Causal link between bimodality and limited redistribution stated as conclusion, not explained.

**Original:**
```
This reflects consumer sorting, as consumers with different payment preferences tend to shop at a broad range of merchants.
Because redistribution arises only when consumers using different payment methods shop at the same merchants, this variation limits the extent to which credit card interchange fees redistribute consumption from cash and debit card consumers.
```

**Proposed Revision:**
```
This variation reflects consumer sorting. When a merchant serves almost entirely credit card users, few cash or debit users shop there to be cross-subsidized, and vice versa. Redistribution therefore requires mixed-payment merchants, and the bimodal distribution limits the number of such merchants.
```

**Why better:** Traces the mechanism explicitly: bimodality means merchants cluster at extremes, so the overlap needed for cross-subsidization is rare.

---

### - [ ] introduction.tex:48-49 — Disconnected sentence breaks data description flow
**Sources:** within_paragraph_flow

**Comment:** "Cash transactions are notoriously difficult to capture in large datasets" sits between the Clover feature description and the validation sentence. It explains *why* the Clover data matter but is stranded after the point it motivates.

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
**Sources:** within_paragraph_flow

**Comment:** Lines 95-96 report cash and debit losses, line 97 makes a new argument (debit users subsidize too), then line 98 jumps back to a sales tax analogy for cash users.

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

**Why better:** The sales tax analogy now directly follows the loss estimates it quantifies. The debit subsidization point closes the paragraph as a punchline. Also drops "we show that" and "our calculations suggest" (redundant). "In contrast" opener replaced with mid-sentence "by contrast."

---

### - [ ] redistribution.tex:8-12 — Monster paragraph (~150 words) mixes five ideas
**Sources:** within_paragraph_flow, ai_detection, writing_quality, simplifications

**Comment:** Opening packs five distinct ideas: (a) two approaches, (b) counterfactuals, (c) SS assumptions and features, (d) pass-through assumption, (e) why structural model is needed.

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

**Why better:** Three short paragraphs, each with one point. Removes throat-clearing ("In this section, we describe the development of"), "A key feature... is that" construction, and the circular "This is a feature because."

---

### - [ ] results.tex:17-26 — Policy framing jumps to academic benchmark without bridge
**Sources:** within_paragraph_flow, writing_quality

**Comment:** Shift from "Both views miss..." to "Academic research has attempted to quantify this transfer" is abrupt. Then "Our analysis yields a more modest estimate" starts yet another thread.

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

**Why better:** The bridge sentence "has tried to quantify this transfer but has relied on strong simplifications" connects the academic literature back to the "both views miss" point. Also removes "In contrast" sentence opener; "attempted" -> "tried" (plainer).

---

### - [ ] results.tex:68-69 — Throat-clearing before sales tax comparison
**Sources:** within_paragraph_flow

**Comment:** "It is helpful to put these changes in consumption in perspective" is meta-commentary.

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

**Why better:** Cuts two sentences of throat-clearing. "Which serves as a tax on consumption" is tautological.

---

### - [ ] results.tex:218-219 — "Moreover" transition + AI-typical incentive argument
**Sources:** ai_detection, within_paragraph_flow

**Comment:** "Moreover, because all consumers face the same prices..." uses a sentence-initial "Moreover" and introduces a new argument (adoption incentives) as an afterthought.

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

**Why better:** Splits into two paragraphs (who pays vs. the arms-race dynamic). Removes "Notably," "Moreover," "Consequently." Merges the "These groups" sentence into the prior one.

---

### - [ ] results.tex:102-105 — Inventory-style numbers ($10B, $18B, $15B, $20B)
**Sources:** ai_detection, writing_quality, simplifications

**Comment:** Four consecutive numerical comparisons listed in sequence without argumentative framing.

**Original:**
```
For credit cards, the consumer losses from shrouded credit card fees are estimated at \$10 billion; transfers arising from credit card interest rates are estimated to redistribute \$18 billion from low credit score consumers to high credit score consumers.
Inter-regional transfers due to the GSEs' lack of risk-based pricing amount to \$15 billion, and consumers' losses from high-fee index funds amount to \$20 billion.
```

**Proposed Revision:**
```
The largest comparable transfer in consumer finance is the \$18 billion redistribution from low to high credit score consumers through credit card interest rates.
Other benchmarks include shrouded credit card fee losses (\$10 billion), inter-regional GSE transfers (\$15 billion), and high-fee index fund losses (\$20 billion).
```

**Why better:** Leads with the largest and most relevant comparison as an anchor. Remaining comparisons grouped as supporting evidence.

---

### - [ ] results.tex:157-159 — Strategic complementarity mechanism stated without full chain
**Sources:** writing_quality

**Comment:** Missing the intermediate step: when competitors raise prices, residual demand becomes less elastic.

**Original:**
```
Surprisingly, the structural model finds even greater redistribution from cash and debit card users to credit card users.
Intuitively, strategic complementarity implies that even merchants that do not serve premium credit consumers may raise their prices in response to premium credit interchange fees simply because competitors are raising prices.
This mechanism ``socializes'' the cost of premium credit rewards across all consumers, including those shopping at stores at which premium cards are rarely used.
```

**Proposed Revision:**
```
The structural model finds even greater redistribution from cash and debit card users to credit card users.
Strategic complementarity drives this result. When merchants serving many premium credit users raise prices to cover higher interchange fees, competing merchants face less elastic residual demand and raise their own prices in response.
This mechanism spreads the cost of premium credit rewards to consumers at stores where premium cards are rarely used.
```

**Why better:** Replaces "Surprisingly" and "Intuitively" with direct statements. Adds the intermediate step (less elastic residual demand). Replaces "socializes" with "spreads."

---

### - [ ] payment_costs.tex:200-201 — "Moreover" transition + paragraph-ending restatement
**Sources:** ai_detection, simplifications

**Comment:** "Moreover" is AI-typical; the sentence restates facts already documented.

**Original:**
```
Thus, dispersion in payment composition across merchants limits the extent of cross-subsidization. Moreover, at the merchants where consumers with different payment preferences overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating the magnitude of redistribution.
```

**Proposed Revision:**
```
Dispersion in payment composition across merchants limits cross-subsidization. Where consumers with different payment preferences do overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating redistribution.
```

**Why better:** Removes "Moreover" and "Thus." The logical connection is clear without signpost words.

---

### - [ ] conclusion.tex:12-16 — Stacked claims with "More broadly" + trailing restatement
**Sources:** ai_detection, writing_quality

**Comment:** Uses "highlight" (AI vocabulary), "not only... but also" (template), and generalizes beyond evidence. Paper does not model network competition.

**Original:**
```
These trends illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
More broadly, these results highlight how interchange policies affect not only banks and card networks, but also prices, market competition, and the distribution of economic surplus across consumers.
```

**Proposed Revision:**
```
Network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
```

**Why better:** The "More broadly" sentence is pure padding that generalizes beyond the paper's specific findings. Cutting it tightens the conclusion.

---

### - [ ] appendix_durbin.tex:11 — "These findings help support our assumption" (stacked hedges)
**Sources:** ai_detection, word_choice, simplifications

**Comment:** "Help support" stacks two hedges; "complement the findings from" is additional padding.

**Original:**
```
These findings help support our assumption that firms pass on interchange fees into retail prices and complement the findings from \citet{Amiti.etal2019} that sector-level shocks like interchange fees are passed into retail prices.
```

**Proposed Revision:**
```
These estimates provide direct evidence that interchange fees pass through to retail prices, consistent with \citet{Amiti.etal2019}.
```

**Why better:** Removes the stacked "help support our assumption" hedge and the redundant restatement.

---

### - [ ] introduction.tex:8 — "significantly" as vague intensifier
**Sources:** word_choice

**Original:**
```
Transfers arise because payment acceptance costs vary significantly by payment method, yet retail prices do not.
```

**Proposed Revision:**
```
Transfers arise because payment acceptance costs vary widely by payment method, yet retail prices do not.
```

**Why better:** "Widely" is more concrete than the vague intensifier "significantly."

---

### - [ ] introduction.tex:31 — "striking" is self-congratulatory
**Sources:** word_choice

**Original:**
```
First, we document striking heterogeneity in both payment mix and interchange fees across merchants.
```

**Proposed Revision:**
```
First, we document large heterogeneity in both payment mix and interchange fees across merchants.
```

**Why better:** "Large" states a fact; "striking" praises the finding.

---

### - [ ] introduction.tex:131 — "has important implications for"
**Sources:** word_choice

**Original:**
```
In contrast, we document substantial heterogeneity in both payment composition and interchange fees across merchants and show that this has important implications for redistribution across consumers, implying that incidence cannot be characterized using representative consumers or average fees.
```

**Proposed Revision:**
```
In contrast, we document wide variation in both payment composition and interchange fees across merchants and show that this shapes redistribution across consumers, so that incidence cannot be characterized using representative consumers or average fees.
```

**Why better:** "Shapes" replaces "has important implications for"; "wide variation" is plainer than "substantial heterogeneity."

---

### - [ ] introduction.tex:142 — "contrast significantly with prior work"
**Sources:** word_choice

**Original:**
```
Our findings on redistribution through the payment system contrast significantly with prior work that emphasizes how unsophisticated consumers cross-subsidize sophisticated consumers when both types of consumers pool on the same financial products.
```

**Proposed Revision:**
```
Our findings contrast with prior work showing that unsophisticated consumers cross-subsidize sophisticated ones when both groups pool on the same financial products.
```

**Why better:** Drops "on redistribution through the payment system" (clear from context), "significantly," and "both types of consumers" -> "both groups."

---

### - [ ] payment_costs.tex:15 — "One notable feature of the data is that"
**Sources:** word_choice, ai_detection

**Original:**
```
One notable feature of the data is that payment composition varies significantly across merchants.
```

**Proposed Revision:**
```
Payment composition varies widely across merchants.
```

**Why better:** Cuts the entire wind-up phrase; replaces "significantly" with "widely."

---

### - [ ] introduction.tex:85-93 — Sufficient-statistics preview is overloaded and partly throat-clearing
**Sources:** writing_quality

**Comment:** Six sentences in lines 85-93 where nearly every sentence is 25-40 words. Flat rhythm.

**Original:**
```
Evaluating the welfare effects of interchange fees would typically require estimating a full demand system across consumers, merchants, and payment methods, along with modeling strategic pricing by firms.
This quickly becomes intractable in settings with rich heterogeneity.
We show that this complexity is unnecessary.
Under mild conditions on consumer demand and firms' pricing responses to cost shocks, the first-order welfare effects of interchange fees can be summarized by simple moments of the joint distribution of payment shares across merchants and the corresponding fee schedule.
These statistics remain valid even when consumers' payment and shopping preferences are arbitrarily correlated.
Importantly, this approach avoids the need to estimate a full demand system or explicitly model strategic interactions among firms, allowing us to map observed heterogeneity directly into redistribution without imposing strong functional-form assumptions on demand.
```

**Proposed Revision:**
```
Evaluating the welfare effects of interchange fees would typically require estimating a full demand system and modeling strategic pricing by firms, which quickly becomes intractable with rich heterogeneity.
Under mild conditions on consumer demand and firms' pricing responses, the first-order welfare effects can instead be summarized by simple moments of the joint distribution of payment shares and the fee schedule.
These sufficient statistics remain valid even when consumers' payment and shopping preferences are arbitrarily correlated, without requiring functional-form assumptions on demand.
```

**Why better:** Removes "We show that this complexity is unnecessary" (throat-clearing) and "Importantly" opener. Consolidates six sentences into three without losing content.

---

## Medium

### - [ ] redistribution.tex:155-158 — "The structural model serves two purposes. First... Second..." template
**Sources:** ai_detection, simplifications

**Original:**
```
The structural model serves two purposes. First, it allows us to assess whether the sufficient statistic's first-order approximation introduces a meaningful error by omitting second-order utility losses from consumer reallocation.
Second, it enables us to evaluate how imperfect pass-through, arising from strategic complementarities in merchant pricing, would affect our distributional conclusions, providing a disciplined way to quantify departures from the baseline assumptions.
```

**Proposed Revision:**
```
The structural model allows us to assess whether the sufficient statistic's first-order approximation introduces meaningful error by omitting second-order utility losses from consumer reallocation.
It also lets us evaluate how imperfect pass-through from strategic complementarities in merchant pricing would affect our distributional conclusions.
```

**Why better:** Removes the enumeration frame ("serves two purposes. First, ... Second, ...") and delivers both points directly.

---

### - [ ] redistribution.tex:12 — "This is a feature because it avoids strong functional-form assumptions"
**Sources:** ai_detection, simplifications

**Original:**
```
This is a feature because it avoids strong functional-form assumptions; however, without additional structure governing merchant competition, we must make an assumption about how interchange fees pass through to prices.
```

**Proposed Revision:**
```
Minimal structure avoids strong functional-form assumptions but requires an assumption about how interchange fees pass through to prices.
```

**Why better:** Cuts the self-referential "This is a feature because" and tightens the contrast.

---

### - [ ] redistribution.tex:167-168 — Sentence-level repetition / over-explanation
**Sources:** ai_detection

**Original:**
```
We model consumer demand using a nested CES structure that allows for rich heterogeneity in shopping patterns across payment methods.
Consumers with different payment methods have different tastes for merchants, and this heterogeneity matches the observed variation in the composition of payments across merchants, linking the model directly to the empirical dispersion documented in the data.
```

**Proposed Revision:**
```
We model consumer demand using a nested CES structure that allows for rich heterogeneity in shopping patterns across payment methods, matching the observed variation in payment composition across merchants.
```

**Why better:** Collapses two sentences into one. Removes bare "this" and the padding phrase "linking the model directly to the empirical dispersion documented in the data."

---

### - [ ] results.tex:6-14 — Three-paragraph opening with First/Next/Finally roadmap
**Sources:** ai_detection, writing_quality

**Original:**
```
We first quantify the distributional consequences of interchange fees by measuring redistribution relative to a zero-interchange benchmark, which corresponds to the regulatory environment in the E.U.
We also assess the degree to which the resulting redistribution is progressive or regressive across the income distribution.

We next use a counterfactual to show that the Durbin Amendment, the major regulation of U.S. interchange fees, results in regressive redistribution across consumers, benefiting higher-income households at the expense of lower-income ones.
...

Finally, we show that the largest losers from the rise of premiumization in the credit card market are debit card users, not cash users, because they frequently shop at the same merchants as premium card users.
```

**Proposed Revision:**
```
We quantify redistribution under several scenarios using the sufficient-statistics approach.
Our main exercise measures redistribution relative to a zero-interchange benchmark, corresponding to the E.U. regulatory environment.
```

**Why better:** Collapses three preview paragraphs into two sentences. Subsections already announce their content.

---

### - [ ] results.tex:13-14 — "This highlights how merchant-level heterogeneity shapes cross-subsidization"
**Sources:** ai_detection

**Original:**
```
Finally, we show that the largest losers from the rise of premiumization in the credit card market are debit card users, not cash users, because they frequently shop at the same merchants as premium card users.
This highlights how merchant-level heterogeneity shapes cross-subsidization.
```

**Proposed Revision:** Delete the second sentence. The mechanism is already implicit in "they frequently shop at the same merchants."

---

### - [ ] results.tex:26 — Em-dash usage
**Sources:** ai_detection

**Original:**
```
Second, debit card users---not just cash users---subsidize credit card rewards.
```

**Proposed Revision:**
```
Second, debit card users, not just cash users, subsidize credit card rewards.
```

**Why better:** Commas achieve the same parenthetical effect without the em-dash pattern.

---

### - [ ] results.tex:56-57 — "The first contribution of our framework is that it allows us to"
**Sources:** ai_detection, writing_quality, simplifications

**Original:**
```
The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs.
```

**Proposed Revision:**
```
We quantify how interchange fees transfer welfare across consumer groups.
```

**Why better:** Removes the meta-commentary frame and delivers the point directly.

---

### - [ ] results.tex:109 — (i)/(ii) enumeration for a two-item list
**Sources:** ai_detection, simplifications

**Original:**
```
Specifically, we examine the welfare effects of interchange fees relative to a homogeneous benchmark in which: (i) all firms have the same composition of payment methods, and (ii) all firms pay the same interchange fees for a given payment method (i.e., eliminating sectoral variation in interchange fees and negotiated rates).
```

**Proposed Revision:**
```
We compare to a homogeneous benchmark where all firms have the same payment composition and pay the same interchange fees for a given payment method, eliminating sectoral variation and negotiated rates.
```

**Why better:** Removes "Specifically" transition and the (i)/(ii) enumeration. Cuts from ~50 words to ~30.

---

### - [ ] results.tex:175 — "These scenarios illustrate" bare demonstrative + padding
**Sources:** ai_detection, simplifications

**Original:**
```
These scenarios illustrate that the balance between price and rewards pass-through fundamentally shapes distributional consequences.
```

**Proposed Revision:**
```
The balance between price and rewards pass-through shapes the distributional consequences.
```

**Why better:** Removes padding frame "These scenarios illustrate that" and the hedge "fundamentally."

---

### - [ ] real_effects.tex:7-8 — "In this section, we show that" throat-clearing
**Sources:** ai_detection, writing_quality, simplifications

**Original:**
```
In this section, we show that payment costs have real effects on retail sales and prices.
```

**Proposed Revision:**
```
Payment costs have real effects on retail sales and prices.
```

**Why better:** Removes "In this section, we show that" while preserving the claim.

---

### - [ ] real_effects.tex:45-46 — 45-word sentence describing IV design
**Sources:** sentence_analysis, simplifications, writing_quality

**Original:**
```
We implement an instrumented difference-in-differences design that compares restaurants varying in their expected gains from the Durbin Amendment based on pre-regulation characteristics across areas with differential exposure to regulated banks.
```

**Proposed Revision:**
```
We implement an instrumented difference-in-differences design.
The design compares restaurants with different expected gains from the Durbin Amendment, based on pre-regulation characteristics, across areas with differential exposure to regulated banks.
```

**Why better:** Splits at the natural break, improving readability.

---

### - [ ] introduction.tex:24 — "More broadly" transition opener
**Sources:** ai_detection, simplifications, within_paragraph_flow

**Original:**
```
More broadly, the existing literature treats the incidence of interchange fees as a representative-agent problem, abstracting from heterogeneity in both merchant characteristics and consumer sorting.
```

**Proposed Revision:**
```
The existing literature treats the incidence of interchange fees as a representative-agent problem, abstracting from heterogeneity in both merchant characteristics and consumer sorting.
```

**Why better:** Removing "More broadly" loses nothing; the sentence already generalizes.

---

### - [ ] introduction.tex:25 — "This abstraction is consequential" bare demonstrative + padding
**Sources:** ai_detection, simplifications, word_choice

**Proposed Revision:** Delete this sentence. The following sentence beginning "If consumers using different payment methods..." already explains the consequence.

---

### - [ ] introduction.tex:30 — "We proceed in three parts" meta-commentary
**Sources:** ai_detection, simplifications

**Proposed Revision:** Delete. The "First," "Second," "Third" sentences that follow are self-explanatory.

---

### - [ ] introduction.tex:92-93 — Triple restatement ("closely approximates... indicating... suggesting")
**Sources:** ai_detection, simplifications

**Original:**
```
We find that our sufficient-statistics framework closely approximates the full structural model, indicating that the key forces driving redistribution are well captured by the empirical moments we use, and suggesting that our main results are robust.
```

**Proposed Revision:**
```
The sufficient-statistics framework closely approximates the full structural model, so the empirical moments we use capture the key forces driving redistribution.
```

**Why better:** Eliminates the triple restatement. One sentence, one point.

---

### - [ ] introduction.tex:128 — "Our paper contributes to the literature" formulaic opener
**Sources:** ai_detection

**Original:**
```
Our paper contributes to the literature on two-sided markets by quantifying how payment platform fees redistribute consumption among consumers.
```

**Proposed Revision:**
```
We quantify how payment platform fees redistribute consumption among consumers, connecting to the two-sided markets literature.
```

**Why better:** Leads with the action rather than the formulaic construction.

---

### - [ ] introduction.tex:136 — "Our analysis also highlights" AI vocabulary
**Sources:** ai_detection, simplifications

**Original:**
```
Our analysis also highlights the redistributive potential of payment system innovations.
```

**Proposed Revision:**
```
Payment system innovations also have redistributive potential.
```

**Why better:** Removes "Our analysis highlights" padding.

---

### - [ ] introduction.tex:18 — "Both views overlook" smarmy reframing
**Sources:** ai_detection, writing_quality

**Original:**
```
Both views overlook that interchange fees primarily redistribute consumption across consumers, and that the magnitude and direction of this redistribution depend on how consumers and merchants are matched in equilibrium.
```

**Proposed Revision:**
```
Neither view accounts for the fact that interchange fees redistribute consumption across consumers, with the magnitude and direction depending on how consumers and merchants are matched in equilibrium.
```

**Why better:** "Neither view accounts for" is factual rather than rhetorical.

---

### - [ ] introduction.tex:16 — EU comparison tacked onto U.S. litigation paragraph
**Sources:** within_paragraph_flow, writing_quality

**Original:**
```
The U.S. regulatory environment strongly contrasts with the European Union's interchange fee regulation, which has capped interchange fees at less than one-sixth of the highest fees charged in the U.S., highlighting the wide variation in regulatory approaches across jurisdictions.
```

**Proposed Revision:**
```
The U.S. fees that merchants seek to reduce are already far higher than those in the European Union, which caps interchange at less than one-sixth of the highest U.S. rates.
```

**Why better:** Connects the EU fact back to the paragraph's subject (merchants fighting fees). Removes "highlighting the wide variation in regulatory approaches across jurisdictions." Shorter.

---

### - [ ] introduction.tex:114-117 — 55-word sentence packing two lessons
**Sources:** within_paragraph_flow

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

### - [ ] introduction.tex:11 — "however" and Latinate phrasing
**Sources:** word_choice

**Original:**
```
In practice, however, both assumptions fail: consumers sort across merchants based on payment preferences, and merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts.
```

**Proposed Revision:**
```
In practice, both assumptions fail: consumers sort across merchants based on payment preferences, and merchants face wide variation in interchange fees across sectors, sizes, and negotiated contracts.
```

**Why better:** Removes "however" (implied by "In practice"). "Wide variation" replaces "substantial heterogeneity."

---

### - [ ] introduction.tex:18 — "there is little consensus on" wordy
**Sources:** word_choice

**Original:**
```
Despite this policy attention, there is little consensus on who ultimately bears the cost of interchange fees.
```

**Proposed Revision:**
```
Despite this policy attention, who ultimately bears the cost of interchange fees remains unclear.
```

**Why better:** Avoids the empty "there is" construction.

---

### - [ ] introduction.tex:20 — "This lack of consensus reflects a fundamental measurement challenge"
**Sources:** word_choice

**Original:**
```
This lack of consensus reflects a fundamental measurement challenge.
```

**Proposed Revision:**
```
This disagreement persists because redistribution is hard to measure.
```

**Why better:** Replaces two abstract nominalizations with a concrete verb and simpler noun.

---

### - [ ] introduction.tex:86 — "rich heterogeneity" vague modifier
**Sources:** word_choice

**Original:**
```
This quickly becomes intractable in settings with rich heterogeneity.
```

**Proposed Revision:**
```
This quickly becomes intractable when consumers and merchants differ along many dimensions.
```

**Why better:** Concrete description replaces vague "rich heterogeneity."

---

### - [ ] institutional_setting.tex:7-11 — Five-sentence throat-clearing opening
**Sources:** ai_detection, writing_quality, within_paragraph_flow, simplifications

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

### - [ ] institutional_setting.tex:24 — "As a result, variation in interchange fees is central to understanding"
**Sources:** ai_detection, simplifications

**Proposed Revision:** Delete. The preceding sentences already establish that interchange fee variation drives cross-subsidization.

---

### - [ ] institutional_setting.tex:42 — "To the best of our knowledge" hedge
**Sources:** ai_detection, simplifications, sentence_analysis

**Original:**
```
While public schedules illustrate potential fee variation, to the best of our knowledge, we are the first to use data on the actual fees merchants pay to quantify how this heterogeneity shapes redistribution.
```

**Proposed Revision:**
```
Public schedules illustrate potential fee variation, but we are the first to use data on the actual fees merchants pay to quantify how this heterogeneity shapes redistribution.
```

**Why better:** Removes non-load-bearing hedge. If the claim is wrong, a referee will say so regardless.

---

### - [ ] institutional_setting.tex:46 — "A key feature of these data is that" throat-clearing
**Sources:** ai_detection, word_choice, writing_quality

**Original:**
```
A key feature of these data is that we observe both the composition and price of transactions at the merchant level, which is critical for measuring heterogeneity in payment costs and its implications for redistribution.
```

**Proposed Revision:**
```
We observe both the composition and price of transactions at the merchant level, which is necessary for measuring heterogeneity in payment costs and its redistributive implications.
```

**Why better:** Removes the "key feature is that" frame and "critical" (AI vocabulary). Leads with what the data contain.

---

### - [ ] institutional_setting.tex:52 — "making it an ideal source for studying" evaluative padding
**Sources:** ai_detection

**Original:**
```
Fiserv is a merchant acquirer responsible for processing transactions and calculating the interchange fees owed to issuers, making it an ideal source for studying how the composition and cost of payments vary across merchants.
```

**Proposed Revision:**
```
Fiserv processes transactions and calculates the interchange fees owed to issuers, so the data capture the composition and cost of payments at the merchant level.
```

**Why better:** States what the data contain rather than evaluating the data source as "ideal."

---

### - [ ] institutional_setting.tex:70 — "provides valuable insight into" filler
**Sources:** ai_detection, word_choice

**Original:**
```
While the Clover sample skews toward smaller merchants, it provides valuable insight into cash usage and variation in payment composition that informs redistribution, particularly for merchants where cash remains a meaningful share of transactions.
```

**Proposed Revision:**
```
The Clover sample skews toward smaller merchants but captures cash usage and payment composition variation at merchants where cash remains a meaningful share of transactions.
```

**Why better:** Drops "provides valuable insight" (evaluative) and tightens the concession.

---

### - [ ] institutional_setting.tex:16, 18 — "facilitates" (Latinate, used twice)
**Sources:** word_choice

**Original:**
```
The issuer, effectively the consumer's bank (e.g., Chase), facilitates the transaction...
...which supplies payment terminals and facilitates settlement and fund transfers.
```

**Proposed Revision:** Replace both instances of "facilitates" with "handles."

---

### - [ ] payment_costs.tex:7 — "In this section" + "novel facts" self-promotional
**Sources:** ai_detection, simplifications

**Original:**
```
In this section, we document novel facts about the variation in payment composition and costs across merchants.
```

**Proposed Revision:**
```
We document the variation in payment composition and costs across merchants.
```

**Why better:** Removes "In this section" and "novel facts" (self-promotional).

---

### - [ ] payment_costs.tex:23 — Long sentence with trailing "highlighting the concentration"
**Sources:** ai_detection, simplifications, sentence_analysis

**Original:**
```
In contrast, for the one-third of merchants for which cash represents at least 2\% of sales, it accounts for more than 30\% of their transactions---and for merchants in the 90th percentile, over 80\%, highlighting the concentration of cash usage among a subset of merchants.
```

**Proposed Revision:**
```
For the one-third of merchants where cash represents at least 2\% of sales, it accounts for more than 30\% of transactions, and over 80\% at the 90th percentile.
```

**Why better:** Cuts "In contrast" transition and "highlighting" padding. The numbers demonstrate concentration without meta-commentary.

---

### - [ ] payment_costs.tex:42 — "again limiting" + em-dash restatement
**Sources:** ai_detection, simplifications

**Original:**
```
The bimodal nature of the distribution suggests that variation in card payment mix is significant at the merchant level---again limiting the potential for cross-subsidization, as many merchants are dominated by a single payment type.
```

**Proposed Revision:**
```
The bimodal distribution of card payment mix at the merchant level limits cross-subsidization, because many merchants are dominated by a single payment type.
```

**Why better:** Removes "again" (signals repetition) and the em-dash. Tightens to one direct claim.

---

### - [ ] payment_costs.tex:37-42 — Paragraph drifts via throat-clearing pivot
**Sources:** within_paragraph_flow

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

**Why better:** Removes the throat-clearing pivot, the redundant average (already stated), and "potentially play a subsidizing role" (hedged). Logic now flows: bimodality -> debit mechanism -> but bimodality limits it.

---

### - [ ] payment_costs.tex:63-66 — 75-word sentence with nested parentheticals
**Sources:** within_paragraph_flow

**Original:**
```
The DCPC provides information on consumer preferences between cash, debit, and credit by income level, while MRI-Simmons USA offers supplementary data on whether debit card users have accounts at small or large banks (relevant for distinguishing exempt versus regulated debit) and whether credit card users hold premium cards (such as Visa Signature or Mastercard World).
```

**Proposed Revision:**
```
The DCPC provides information on consumer preferences between cash, debit, and credit by income level.
MRI-Simmons USA supplements this with data on whether debit card users bank at small or large institutions (distinguishing exempt from regulated debit) and whether credit card users hold premium cards.
```

**Why better:** Split into two sentences. Each data source gets its own sentence. Parenthetical examples (Visa Signature, Mastercard World) removed.

---

### - [ ] payment_costs.tex:66 — Trailing "linking payment choice directly to"
**Sources:** ai_detection, simplifications

**Original:**
```
Figure \ref{fig:payment_income} illustrates the key pattern: at low levels of income, consumers prefer using debit cards and cash, while at higher levels of income, consumers increasingly use credit cards, and in particular, premium credit cards with higher interchange fees, linking payment choice directly to the distribution of rewards and fees.
```

**Proposed Revision:**
```
Figure \ref{fig:payment_income} shows that low-income consumers prefer debit cards and cash, while higher-income consumers increasingly use credit cards, especially premium cards with higher interchange fees.
```

**Why better:** Removes "illustrates the key pattern:" (colon construction) and trailing "linking" participial.

---

### - [ ] payment_costs.tex:105 — "mirroring the distribution of rewards" trailing restatement
**Sources:** ai_detection, simplifications

**Original:**
```
Reinforcing the individual-level income patterns we showed earlier, credit card usage is more prevalent in wealthier, older, more educated, and more urban areas, mirroring the distribution of rewards tied to high-fee payment instruments.
```

**Proposed Revision:**
```
Credit card usage is more prevalent in wealthier, older, more educated, and more urban areas, consistent with the individual-level income patterns documented above.
```

**Why better:** Cuts both the "Reinforcing" opener and the "mirroring" trail.

---

### - [ ] payment_costs.tex:108 — "has important implications for"
**Sources:** word_choice

**Original:**
```
As shown below, this heterogeneity has important implications for both the cost and redistributive aspects of payments, by shaping where cross-subsidization can occur.
```

**Proposed Revision:**
```
As shown below, this heterogeneity shapes both the cost and redistributive effects of payments, by determining where cross-subsidization can occur.
```

**Why better:** "Shapes" replaces "has important implications for"; "effects" is more concrete than "aspects."

---

### - [ ] payment_costs.tex:113 — "but this average masks considerable variation" cliche
**Sources:** ai_detection, simplifications

**Original:**
```
On average, merchants pay around \absinput{icg_summary_mean}\% of sales to accept cards, but this average masks considerable variation.
```

**Proposed Revision:**
```
Merchants pay around \absinput{icg_summary_mean}\% of sales on average to accept cards, though fees range from \absinput{icg_summary_p10}\% at the 10th percentile to \absinput{icg_summary_p90}\% at the 90th.
```

**Why better:** Replaces the cliche with actual numbers demonstrating the variation.

---

### - [ ] payment_costs.tex:170 — "reflects Visa's and Mastercard's attempts to balance" imputes motive
**Sources:** ai_detection, simplifications

**Original:**
```
Fee variation across sectors reflects Visa's and Mastercard's attempts to balance merchant acceptance versus issuer incentives, trading off participation on both sides of the platform.
```

**Proposed Revision:**
```
Fee variation across sectors is consistent with networks balancing merchant acceptance against issuer incentives.
```

**Why better:** Evidence is descriptive; "is consistent with" matches this.

---

### - [ ] results.tex:23-26 — Benchmarks paragraph does too much (~180 words, six claims)
**Sources:** writing_quality

**Original:**
```
Our analysis yields a more modest estimate of approximately \$\absinput{combined_dollar_headline} billion, but more importantly, it reveals a richer picture of who pays whom. Three findings stand out. First, within-card distinctions matter: Regulated and exempt debit cardholders face very different outcomes, as do basic and premium credit cardholders. Second, debit card users---not just cash users---subsidize credit card rewards. Regulated debit cardholders pay almost as much as cash users, a finding obscured by the traditional credit-versus-cash framing. Third, consumer sorting across merchants and merchant fee heterogeneity attenuates redistribution.
```

**Proposed Revision:**
```
Our analysis yields a more modest estimate of approximately \$\absinput{combined_dollar_headline} billion.
The difference reflects three forces absent from the standard calculation.
Within-card distinctions matter because regulated and exempt debit cardholders face very different outcomes, as do basic and premium credit cardholders.
Debit card users, not just cash users, subsidize credit card rewards; regulated debit cardholders pay almost as much as cash users.
Consumer sorting across merchants and merchant fee heterogeneity attenuate redistribution.
```

**Why better:** Removes "but more importantly, it reveals a richer picture" (smarmy reframing). Removes "Three findings stand out" (formulaic). Each finding gets its own sentence.

---

### - [ ] results.tex:109-111 — Sorting decomposition front-loads the quantitative answer
**Sources:** writing_quality

**Original:**
```
The second contribution of our framework is that it allows us to quantify the extent to which consumer sorting and merchant fee heterogeneity reduce redistribution. We find that ignoring these two forces inflates the estimated amount of redistribution by roughly one-third.
```

**Proposed Revision:**
```
Our framework also quantifies how much consumer sorting and merchant fee heterogeneity reduce redistribution.
We compare our baseline estimates to a homogeneous benchmark that assumes identical payment composition and uniform fees across all merchants.
```

**Why better:** Removes "The second contribution of our framework is that" (meta-commentary). Defers the "one-third" finding to after the benchmark is described.

---

### - [ ] redistribution.tex:55-58 — Pricing equation asserts pass-through before building the case
**Sources:** writing_quality

**Original:**
```
Rather than explicitly modeling merchant competition or imposing functional forms on the demand side, we assume that prices are log-linear in weighted interchange fees, such that merchants pass through interchange fees to prices one-for-one, as calculated below:
```

**Proposed Revision:**
```
We assume that merchants pass through interchange fees to prices one-for-one.
Because virtually all major retailers accept cards, interchange fee changes represent sector-wide common cost shocks, and standard models predict near-complete pass-through for common shocks.
Formally, prices are log-linear in weighted interchange fees:
```

**Why better:** Leads with motivation before stating the formal assumption.

---

### - [ ] conclusion.tex:13 — "despite being designed to help consumers" unnecessary parenthetical
**Sources:** simplifications

**Proposed Revision:** Remove. Contrast already conveyed by "rather than the intended debit card users."

---

### - [ ] appendix_theory.tex:7 — "This appendix formally demonstrates that"
**Sources:** word_choice, simplifications

**Original:**
```
This appendix formally demonstrates that the sufficient statistic in Equation~\ref{eq:sufficient-stat-formula} captures the first-order welfare effects of interchange fees, even when consumers are allowed to change their consumption in response to prices.
```

**Proposed Revision:**
```
This appendix proves that the sufficient statistic in Equation~\ref{eq:sufficient-stat-formula} captures the first-order welfare effects of interchange fees, even when consumers change their consumption in response to prices.
```

**Why better:** "Proves" is more precise than "formally demonstrates"; drops passive "are allowed to."

---

### - [ ] appendix_theory.tex:97-98 — "The following lemma characterizes" padding
**Sources:** simplifications

**Proposed Revision:** Delete. Lemma title is sufficient.

---

### - [ ] appendix_theory.tex:143 — Em-dash where relative clause works
**Sources:** simplifications

**Proposed Revision:** Replace with "which is second-order in fees."

---

### - [ ] appendix_data.tex:7 — 47-word throat-clearing opener listing five datasets
**Sources:** simplifications, sentence_analysis

**Original:**
```
This section describes the cleaning procedures applied to five key datasets that form the backbone of our empirical analysis: (1) the aggregate time series, (2) the Clover merchant data, (3) the merchant cross-section from the settlement dataset, (4) the Diary of Consumer Payment Choice, and (5) the MRI survey data.
```

**Proposed Revision:**
```
This section describes the cleaning procedures for five key datasets: the aggregate time series, the Clover merchant data, the settlement cross-section, the Diary of Consumer Payment Choice, and the MRI survey data.
```

**Why better:** Removes "applied to... that form the backbone of our empirical analysis" (throat-clearing). Drops numbered parentheticals.

---

### - [ ] appendix_data.tex:98 — Unnecessary appositive describing the Nilson Report
**Sources:** simplifications

**Proposed Revision:** Remove "a leading industry trade publication that compiles payment statistics across the U.S. payment system." Readers know it.

---

### - [ ] appendix_cash_model.tex:8-10 — Three redundant opening sentences + "sheds light on"
**Sources:** simplifications

**Proposed Revision:** Collapse into two sentences; remove AI vocabulary.

---

### - [ ] appendix_cash_model.tex:15 — Restatement of section title
**Sources:** simplifications

**Proposed Revision:** Replace "We use a two-part model to extrapolate..." with "The model has two parts:"

---

### - [ ] appendix_cash_model.tex:30 — "effectively" useless modifier
**Sources:** word_choice, simplifications

**Original:**
```
We find that our two-stage approach effectively captures the variation in cash usage across merchants in the Clover data.
```

**Proposed Revision:**
```
Our two-stage approach captures the variation in cash usage across merchants in the Clover data.
```

**Why better:** Drops "We find that" (empty frame) and "effectively" (vague).

---

### - [ ] appendix_structural.tex:7-9 — Three-sentence meta-commentary opening
**Sources:** simplifications

**Proposed Revision:** Delete. Section title is sufficient.

---

### - [ ] appendix_structural.tex:63 — "confirms that the calibrated model provides a credible quantitative laboratory"
**Sources:** simplifications

**Proposed Revision:** Delete self-congratulatory claim.

---

### - [ ] appendix_structural.tex:91 — "provide visual evidence that the calibration is working as intended"
**Sources:** simplifications

**Proposed Revision:** Delete from figure caption note.

---

### - [ ] appendix_structural.tex:29 — "mechanically pass through fees to rewards and do not earn economic profits"
**Sources:** simplifications

**Proposed Revision:** Simplify to "earn zero profits."

---

### - [ ] appendix_durbin.tex:7-8 — "This appendix provides empirical evidence that"
**Sources:** simplifications

**Proposed Revision:** State the finding directly.

---

### - [ ] appendix_durbin.tex:31 — Road-mapping sentence
**Sources:** simplifications

**Proposed Revision:** Delete "We can then use this panel to illustrate..."

---

### - [ ] appendix_durbin.tex:65 — Colon construction + bare "this"
**Sources:** simplifications

**Proposed Revision:** Remove colon construction and fix bare demonstrative.

---

### - [ ] appendix_durbin.tex:73-74 — Bare "This" + em-dash
**Sources:** simplifications

**Proposed Revision:** Fix bare demonstrative; remove em-dash.

---

### - [ ] real_effects.tex:18 — "highly" useless modifier
**Sources:** word_choice

**Original:**
```
The 2011 Durbin Amendment, passed as part of the Dodd-Frank Act, imposed a binding cap on debit card interchange fees for banks with over \$10 billion in assets that had highly heterogeneous effects across merchants.
```

**Proposed Revision:**
```
The 2011 Durbin Amendment, passed as part of the Dodd-Frank Act, imposed a binding cap on debit card interchange fees for banks with over \$10 billion in assets, with heterogeneous effects across merchants.
```

**Why better:** Drops "highly"; if the effects were not heterogeneous, you would not mention them.

---

### Grammar & Mechanics (auto-fix)
**Sources:** copy_edits

| File:Line | Fix |
|-----------|-----|
| main.tex:78 | "directly intro redistribution" -> "directly into redistribution" (typo) |
| introduction.tex:25 | "transfer , and" -> "transfer, and" (extra space) |
| introduction.tex:91-92 | "Under these assumptions,\nOur sufficient statistic approach" -> connect the dangling clause |
| payment_costs.tex:157 | "This variation in fees that can generate" -> "This variation in fees can generate" (extraneous "that") |
| payment_costs.tex:178 | "The data shows" -> "The data show" (data is plural) |
| results.tex:100 | Add period to \paragraph heading for consistency |
| appendix_data.tex:75 | "shows THE summary" -> "shows the summary" (accidental caps) |
| appendix_durbin.tex:21 | "WHICH WAS driven" -> "which was driven" (accidental caps) |
| real_effects.tex:51 | "zip-code fixed effects" -> "ZIP-code fixed effects" (inconsistent caps) |

---

### Within-paragraph surface fixes (AI transition words)
**Sources:** within_paragraph_flow

| Location | Fix |
|----------|-----|
| introduction.tex:24 | Drop "More broadly," |
| introduction.tex:131 | Drop "In contrast," |
| institutional_setting.tex:29 | "Both the issuer and the acquirer also" |
| payment_costs.tex:35 | Drop "Moreover," |
| payment_costs.tex:201 | Drop "Moreover," |
| conclusion.tex:16 | "These results also show" |

---

## Low

### - [ ] introduction.tex:7 — Opening sentence summarizes rather than creating tension
**Sources:** writing_quality, simplifications

**Original:**
```
Payment systems redistribute across consumers who choose different payment methods but shop at the same stores.
```

**Proposed Revision:**
```
Consumers who pay cash, swipe a debit card, or tap a premium credit card all see the same price at the register, yet each transaction imposes different costs on the merchant.
```

**Why better:** Creates tension by juxtaposing uniform prices with heterogeneous costs, inviting the reader to ask "so what happens?"

---

### - [ ] results.tex:129 — "Our findings help explain why"
**Sources:** simplifications

**Proposed Revision:** Simplify to "High-income consumers have weak incentives to adopt..."

---

### - [ ] results.tex:185 — "sheds light on"
**Sources:** simplifications

**Proposed Revision:** Replace with "quantify" or another concrete verb.

---

### - [ ] real_effects.tex:11 — "Documenting the real effects..." gerund construction
**Sources:** simplifications

**Proposed Revision:** Replace with a direct noun phrase.

---

### - [ ] real_effects.tex:83 — "is consistent with findings in"
**Sources:** simplifications

**Proposed Revision:** Replace with "matches" for directness.

---

### - [ ] appendix_cash_model.tex:25-26 — Two didactic sentences about raw averages
**Sources:** simplifications

**Proposed Revision:** Collapse into one.

---

### - [ ] appendix_durbin.tex:82-84 — Three sentences explaining price proxy
**Sources:** simplifications

**Proposed Revision:** Collapse into two.

---

### - [ ] conclusion.tex:6-10 — Conclusion restates results without adding insight
**Sources:** writing_quality

**Comment:** Consider adding forward-looking content (Corner Post ruling, BNPL regulation, merchant surcharging) rather than restating results.

---

### - [ ] conclusion.tex:12-16 — Causal claim about "network competition" exceeds evidence
**Sources:** writing_quality

**Comment:** Paper does not model network competition. Replace with description of what the paper does show.

---

## Paper-Level Issues (from structure_analysis, flow_extraction)

### High: Introduction length and redundancy
The introduction runs ~6-7 pages. Data-description paragraphs (lines 43-50) and detailed results preview (lines 95-117) reappear nearly verbatim in the body. Cut data description; condense results preview. Target ~4 pages.

### High: Section headings are generic
"Institutional Setting and Data," "Methodology: Measuring Interchange Fee Redistribution," "Results on Interchange Fee Redistribution" are descriptive labels, not claims. Consider declarative headings:
- Section 4: "A Sufficient-Statistics Framework for Redistribution"
- Section 5: "Interchange Fees Redistribute Billions from Cash and Debit to Credit Users"

### Medium: "Existing Benchmarks" subsection (5.1) partially duplicates introduction
The "two extreme views" framing and Schuh et al. calculation repeat positioning already established. Fold into introduction or reduce to one paragraph.

### Medium: Section 4 opener is procedural
"We describe the development of two related approaches" should preview the key methodological insight (redistribution depends on simple overlap moments, not a full demand system).

### Flow breaks needing bridging sentences
| Location | Issue |
|----------|-------|
| Intro sentences 9->10 | Data description interrupts results preview |
| Intro sentences 17->18 | Abrupt shift from causal evidence to SS framework |
| Intro sentences 22->23 | Abrupt shift from counterfactuals to lit review |
| Sections 2->3 (sentences 42->43) | Implicit link needs explicit bridge |
| Section 3 (sentences 57->58) | Payment mix -> costs needs "because costs determine redistribution" |
| Section 5 (sentences 101->102) | "Existing Benchmarks" delays results |
| Section 5 (sentences 127->128) | Robustness -> Durbin needs transition |

---

## Section Grades (from writing_quality)

| Section | Grade | Primary Issue |
|---------|-------|---------------|
| Introduction | B+ | Overloaded paragraphs; inventory-style numbers; throat-clearing in SS preview |
| Related Literature | A- | One paragraph conflates two arguments (naifs/sophisticates contrast and policy implications) |
| Institutional Setting | B+ | Opening is throat-clearing; restated claims in data subsection |
| Payment Costs | A- | Section opening front-loads conclusions; minor number inventory |
| Methodology | A- | Opening is meta-commentary; overloaded footnote |
| Results | B+ | Opening previews all results (removes tension); inventory-style numbers; meta-commentary |
| Conclusion | B | Restates without new synthesis; causal claim exceeds evidence |

---

## Sentence Statistics (from sentence_analysis)

- Mean sentence length: ~28 words (above 15-25 healthy range)
- Sentences > 40 words: ~20% (high)
- Sentences < 12 words: ~5% (low; target 10-15%)
- Passive voice: ~20-25%
- Worst offenders: introduction.tex (mean 30), redistribution.tex (mean 30), results.tex (mean 29)
