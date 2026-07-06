# Writing Quality Assessment

Paper: "Who Pays for Payments?"
Type B: specialized topic (interchange fees and payment systems)
Date: 2026-03-23

---

## High

### introduction.tex

### - [ ] Lines 6-9: Opening paragraph is clean but the third sentence is overloaded

**Dimension:** Paragraph Focus

**Comment:** The third sentence (line 9) does four things: introduces interchange fees as the major component of acceptance costs, states that fees flow back as rewards, names the cross-subsidy, and specifies who captures rewards. At 43 words, it also exceeds the sentence length guideline.

**Original:**
```
Since interchange fees---the major component of acceptance costs---flow back to consumers as rewards, a cross-subsidy emerges: all consumers pay higher retail prices, but the users of high-interchange-fee credit cards capture most of the rewards \citep{carlton1994antitrust}.
```

**Proposed Revision:**
```
Interchange fees, the major component of acceptance costs, flow back to consumers as rewards.
Because high-interchange-fee credit cards generate the richest rewards, all consumers pay higher retail prices while credit card users capture most of the benefit \citep{carlton1994antitrust}.
```

**Why better:** Splits one overloaded sentence into two, each making a single point. Removes the em-dash pair and colon construction (surface rules). Preserves the causal logic by leading with the mechanism sentence before the distributional claim.

---

### - [ ] Lines 11-11: Second paragraph is overloaded (four ideas in one paragraph)

**Dimension:** Paragraph Focus

**Comment:** This paragraph (1) states the standard view's implicit assumptions, (2) explains that both assumptions fail in practice, (3) explains why consumers sort, (4) draws the conclusion about incidence depending on joint distributions. Four distinct ideas compete for attention in a single block. At roughly 85 words, it is not excessively long, but the logical density means the reader must track too many pivots.

**Original:**
```
This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs. In practice, however, both assumptions fail: consumers sort across merchants based on payment preferences, and merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts. As a result, the incidence of interchange fees cannot be inferred from average fees or representative consumers, but instead depends on the joint distribution of payment choices across merchants.
```

**Proposed Revision:**
```
This standard view implicitly assumes that consumers using different payment methods shop at the same merchants and that merchants face similar acceptance costs. Both assumptions fail in practice. Consumers sort across merchants based on payment preferences, and merchants face substantial heterogeneity in interchange fees across sectors, sizes, and negotiated contracts. The incidence of interchange fees therefore depends on the joint distribution of payment choices across merchants, not on average fees or representative consumers.
```

**Why better:** Breaking the colon-joined compound sentence into two separate sentences lets each claim land. The final sentence now leads with what incidence depends on (the positive claim) rather than what it cannot be inferred from. Removes the colon construction.

---

### - [ ] Lines 13-16: Policy paragraph drifts from litigation to legislation to EU comparison

**Dimension:** Paragraph Focus

**Comment:** The paragraph opens with merchant and policymaker fights against interchange fees, cites a pending settlement (2025), discusses the 2022 Credit Card Competition Act, then pivots to a comparison with EU regulation. The EU comparison in the final sentence is a separate point from the U.S. litigation and legislation examples. The paragraph starts on U.S. legal disputes and ends on cross-jurisdictional regulatory variation.

**Original:**
```
The U.S. regulatory environment strongly contrasts with the European Union's interchange fee regulation, which has capped interchange fees at less than one-sixth of the highest fees charged in the U.S., highlighting the wide variation in regulatory approaches across jurisdictions.
```

**Proposed Revision:**
```
These U.S. disputes contrast with the European Union's approach, which caps interchange fees at less than one-sixth of the highest U.S. rates.
```

**Why better:** Tightens the EU comparison to a single declarative fact. The original sentence's tail ("highlighting the wide variation in regulatory approaches across jurisdictions") restates what the comparison already shows. Removing it follows Principle 1 (terse and precise).

---

### - [ ] Lines 30-34: Roadmap paragraph uses throat-clearing and is overloaded

**Dimension:** Economy

**Comment:** "We proceed in three parts" is classic meta-commentary. The paragraph then packs four distinct contributions (heterogeneity documentation, consumer sorting, sufficient-statistics framework, and structural model validation) into a single block. The final sentence (line 34) is 56 words long.

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

**Why better:** Removes "We proceed in three parts" (throat-clearing). Consolidates the first two contributions into one sentence since they are empirical documentation. Splits the overlong final sentence. The roadmap now tells the reader what happens without meta-narrating the paper's structure.

---

### - [ ] Lines 36-41: Headline results paragraph reads as an inventory of numbers

**Dimension:** Number Integration

**Comment:** Lines 37-41 present five distinct dollar figures and percentages in sequence. Each number is a separate claim, but the paragraph reads as a list rather than building a single argument. The government program comparisons (SNAP, EITC, unemployment insurance) and financial market comparisons are two separate points crammed into the same paragraph.

**Original:**
```
The transfers here are also large relative to other transfers in consumer financial markets, such as the inter-regional transfer due to the GSE's lack of risk-based pricing (\$15 billion), consumer losses from shrouded credit card fees (\$10 billion), and consumer losses from high-fee index funds (\$20 billion) \citep{Hurst.etal2016, agarwal2015regulating, Brown.etal2024}.
```

**Proposed Revision:**
```
The transfers are also large relative to other cross-subsidies in consumer finance, where inter-regional GSE transfers amount to \$15 billion, shrouded credit card fee losses to \$10 billion, and high-fee index fund losses to \$20 billion \citep{Hurst.etal2016, agarwal2015regulating, Brown.etal2024}.
```

**Why better:** Minor tightening. The deeper issue is structural: the government programs comparison and the financial markets comparison belong in separate sentences or paragraphs, each with a distinct "so what." Flagging this for the authors to consider splitting the paragraph after the government programs sentence.

---

### - [ ] Lines 52-57: First-fact paragraph blends description with mechanism without fully explaining why sorting limits redistribution

**Dimension:** Mechanism Clarity

**Comment:** The paragraph states that payment composition varies, reports a standard deviation, notes bimodality, and then asserts that "this variation limits the extent to which credit card interchange fees redistribute consumption." But the causal link between bimodality and limited redistribution is stated as a conclusion rather than explained. Why does bimodality specifically limit redistribution? Because if a merchant serves almost entirely credit card users, there are few cash or debit users at that merchant to cross-subsidize.

**Original:**
```
This reflects consumer sorting, as consumers with different payment preferences tend to shop at a broad range of merchants.
Because redistribution arises only when consumers using different payment methods shop at the same merchants, this variation limits the extent to which credit card interchange fees redistribute consumption from cash and debit card consumers.
```

**Proposed Revision:**
```
This variation reflects consumer sorting. When a merchant serves almost entirely credit card users, few cash or debit users shop there to be cross-subsidized, and vice versa. Redistribution therefore requires mixed-payment merchants, and the bimodal distribution limits the number of such merchants.
```

**Why better:** Traces the mechanism explicitly: bimodality means merchants cluster at extremes, so the overlap needed for cross-subsidization is rare. The original states the conclusion ("this variation limits") without unpacking why bimodality specifically matters.

---

### - [ ] Lines 85-93: Sufficient-statistics preview paragraph is overloaded and partly throat-clearing

**Dimension:** Paragraph Focus / Economy

**Comment:** This paragraph (lines 85-93) does five things: (1) states that a full demand system is typically required, (2) says it becomes intractable, (3) claims the complexity is unnecessary, (4) describes the sufficient-statistics approach, (5) mentions the structural model validation. Lines 88-90 are a single 60-word sentence. The paragraph also contains meta-commentary ("We show that this complexity is unnecessary").

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

**Why better:** Removes "We show that this complexity is unnecessary" (throat-clearing) and the "Importantly" opener (transition tell). Consolidates six sentences into three without losing content. Drops the restated claim about avoiding a full demand system, which duplicates the opening contrast.

---

### - [ ] Lines 142-145: Naifs-and-sophisticates paragraph conflates two arguments

**Dimension:** Paragraph Focus

**Comment:** This paragraph makes two points that deserve separation. First, it contrasts the pooling mechanism (same financial product vs. same merchant). Second, it draws opposite policy implications (separating contracts vs. separating payment methods). The second point is a standalone contribution and should not be subordinated within the same paragraph as the contrast.

**Original:**
```
In contrast, redistribution arises in our setting when naifs and sophisticates choose different financial products but pool at the same merchants.
This leads to qualitatively different recommendations for reducing redistribution.
Whereas in most traditional settings separating contracts (between consumer types) can reduce redistribution, in our setting, it is precisely this separation across financial instruments (i.e., payment methods) that drives redistribution, shifting attention from financial contract design to the interaction between consumer sorting and merchant pricing.
```

**Proposed Revision:**
```
In our setting, redistribution arises when naifs and sophisticates choose different financial products but pool at the same merchants.
The policy implications reverse accordingly. In traditional settings, separating contracts across consumer types reduces redistribution. Here, separation across payment methods is what drives redistribution, shifting attention from financial contract design to the interaction between consumer sorting and merchant pricing.
```

**Why better:** Removes "In contrast," opener (transition tell). Splits the two ideas into a contrast paragraph and a policy-implication statement. The final sentence of the original (55 words) is broken into two.

---

### institutional_setting.tex

### - [ ] Lines 6-11: Opening paragraph is pure throat-clearing

**Dimension:** Economy

**Comment:** Every sentence in this paragraph describes what the section will do rather than doing it. "In this section, we outline..." / "We explain how..." / "We then introduce..." / "These data show..." / "Together, these data allow us to..." This is textbook meta-commentary (Principle 8).

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
Credit and debit card payments involve three financial intermediaries---the issuer, the merchant acquirer, and the card network---each of which earns fees from the transaction.
We use two merchant-level datasets from Fiserv that record both the composition and cost of payments at each merchant, allowing us to link fee heterogeneity to redistribution across consumers.
```

**Why better:** Replaces five throat-clearing sentences with two content sentences. The section now opens with substance (the institutional structure) rather than announcing what it will cover. Note: the em-dash pair here is acceptable because it is a parenthetical list within a sentence, not a rhetorical colon construction; however, the authors may prefer commas or a footnote.

---

### payment_costs.tex

### - [ ] Lines 15-23: Payment mix variation paragraph is overloaded with descriptive statistics

**Dimension:** Number Integration

**Comment:** This paragraph reports the cash share distribution, the dollar-weighted average (11%), the two-thirds threshold, the 30% conditional average, and the 90th percentile (80%). Five numbers in eight sentences. The numbers are presented sequentially rather than as evidence for a single claim. The paragraph's single point (cash usage is concentrated among a subset of merchants) could be made with fewer numbers, with the rest left to the figure.

**Original:**
```
On average, cash accounts for around 11\% of transaction dollars (dollar-weighted across merchants; Figure \ref{fig:cash_share_ts}).
However, this masks substantial heterogeneity.
For approximately two thirds of merchant-year observations, cash accounts for less than 2\% of transactions.
In contrast, for the one-third of merchants for which cash represents at least 2\% of sales, it accounts for more than 30\% of their transactions---and for merchants in the 90th percentile, over 80\%, highlighting the concentration of cash usage among a subset of merchants.
```

**Proposed Revision:**
```
On average, cash accounts for around 11\% of transaction dollars, but this average masks a bimodal pattern.
For roughly two-thirds of merchants, cash accounts for less than 2\% of sales. Among the remaining third, cash exceeds 30\% of transactions, with the 90th percentile above 80\%.
```

**Why better:** Tightens from four sentences to three. Removes "However" and "In contrast" openers. Drops "highlighting the concentration of cash usage among a subset of merchants," which restates what the numbers already show. The descriptive point lands without the trailing restatement.

---

### - [ ] Lines 196: Real Effects paragraph is a single dense block

**Dimension:** Paragraph Focus

**Comment:** Lines 196 is a single paragraph that introduces the Durbin Amendment as a natural experiment, describes the institutional variation (large vs. small banks, transaction sizes), describes the IV design, and reports the result. This paragraph does four distinct things and runs to approximately 150 words in a single block. The IV design and the result should be separated from the institutional setup.

**Original:**
```
In Appendix \ref{sec:appendix_durbin}, we present novel evidence that interchange fees have real effects on merchant sales. To do this, we exploit variation in the effects of the 2011 Durbin Amendment across merchants, which has been exploited in other work such as \citet{Mukharlyamov.Sarin2025}. The Durbin Amendment capped interchange fees only on debit cards issued by large banks, but not on debit cards issued by small banks, nor on credit cards. It also inadvertently increased debit card interchange fees for merchants with small average transaction sizes, while creating significant savings for merchants with large transaction sizes. We implement an instrumental variables design that compares sales growth across merchants with different predicted savings from the Durbin Amendment, using variation in local exposure to large banks to isolate causal effects. We find evidence suggesting that the Durbin Amendment led to a decline in prices and, ultimately, find that every one percentage point in interchange expense saved causes around a \absinput{durbin_iv_2Y_Sales_IV}\% increase in card sales.
```

**Proposed Revision:**
```
In Appendix \ref{sec:appendix_durbin}, we present evidence that interchange fees affect merchant sales, exploiting variation in the effects of the 2011 Durbin Amendment.
The Durbin Amendment capped interchange fees on debit cards issued by large banks but not on those issued by small banks or on credit cards.
It also inadvertently increased fees for merchants with small average transaction sizes while creating savings for merchants with large transaction sizes.

We implement an instrumental variables design that compares sales growth across merchants with different predicted savings, using variation in local exposure to large banks to isolate causal effects.
Every one percentage point in interchange expense saved leads to approximately a \absinput{durbin_iv_2Y_Sales_IV}\% increase in card sales.
```

**Why better:** Splits the institutional setup from the empirical design and result. Removes "novel evidence" (the reader can judge novelty). Removes the stacked hedging in the final sentence ("We find evidence suggesting that... and, ultimately, find that...") and states the result directly.

---

### redistribution.tex

### - [ ] Lines 8-12: Opening paragraph is meta-commentary and overloaded

**Dimension:** Economy / Paragraph Focus

**Comment:** Lines 8-9 describe what the section does rather than doing it. The paragraph then previews both approaches, their assumptions, their relationship, and the counterfactuals. This is five topics in one paragraph. The long second paragraph (lines 12) is a single 140-word sentence block that tries to compare the two approaches, state the key feature, name the limitation, justify the assumption, and preview the relaxation.

**Original:**
```
In this section, we describe the development of two related approaches to evaluate the redistributive consequences of interchange fees: a sufficient statistic approach and a structural model.
These approaches allow us to quantify how redistribution changes when accounting for consumer sorting and merchant fee heterogeneity.
We also evaluate different regulatory counterfactuals: European-style regulation and the consequences of the Durbin Amendment.
```

**Proposed Revision:**
```
We evaluate the redistributive consequences of interchange fees using two approaches.
The sufficient-statistics approach applies broadly across utility functions and market structures under a full pass-through assumption.
The structural model relaxes this assumption by imposing more parametric structure on preferences and competition.
```

**Why better:** Removes "In this section, we describe the development of" (throat-clearing). Removes the two colon constructions. Drops the counterfactual preview, which belongs later. Each sentence makes one claim.

---

### results.tex

### - [ ] Lines 6-14: Opening three paragraphs all announce results before presenting evidence

**Dimension:** Motivation & Tension

**Comment:** Lines 6-14 consist of three paragraphs that each announce a result. The first says interchange fees are regressive. The second says the Durbin Amendment is regressive. The third says debit card users are the largest losers from premiumization. All three give away the punchline before the analysis. While a brief roadmap is conventional, stating the direction and sign of every result removes all tension from the subsequent 200+ lines of analysis.

**Original:**
```
We next use a counterfactual to show that the Durbin Amendment, the major regulation of U.S. interchange fees, results in regressive redistribution across consumers, benefiting higher-income households at the expense of lower-income ones.
```

**Proposed Revision:**
```
We then ask whether the Durbin Amendment, the major regulation of U.S. interchange fees, achieved its goal of helping debit card consumers.
```

**Why better:** Frames the Durbin counterfactual as a question rather than announcing the answer. The reader now has a reason to read the analysis. The same principle applies to the premiumization preview (line 13), which could be framed as "Who bears the cost of the rise in premium credit cards?" rather than stating debit card users are the largest losers.

---

### - [ ] Lines 23-26: Benchmarks section blends existing estimates with the paper's three contributions

**Dimension:** Paragraph Focus

**Comment:** The paragraph at lines 23-26 does too much. It presents the Schuh et al. back-of-envelope calculation ($40 billion), states the paper's more modest estimate, and then lists three findings ("Three findings stand out"). The three findings are each substantive points that deserve their own treatment. The paragraph runs to approximately 180 words with six distinct claims.

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
Consumer sorting across merchants and merchant fee heterogeneity attenuate redistribution, as \citet{Gans2018} recognized.
```

**Why better:** Removes "but more importantly, it reveals a richer picture of who pays whom" (smarmy reframing). Removes "Three findings stand out" (formulaic enumeration). Removes colon constructions and em-dash pair. Each finding gets its own sentence with a direct statement.

---

### - [ ] Lines 100-105: Context paragraph is inventory-style

**Dimension:** Number Integration

**Comment:** Lines 102-105 present six dollar figures from other papers in rapid succession. Each comparison is a separate claim, but they are presented as a list. The paragraph reads like a table caption rather than an argument.

**Original:**
```
For credit cards, the consumer losses from shrouded credit card fees are estimated at \$10 billion \citep{agarwal2015regulating,Hurst.etal2016}; transfers arising from credit card interest rates are estimated to redistribute \$18 billion from low credit score consumers to high credit score consumers \citep{Agarwal.etal2022}.
Inter-regional transfers due to the GSEs' lack of risk-based pricing amount to \$15 billion, and consumers' losses from high-fee index funds amount to \$20 billion \citep{agarwal2015regulating,Hurst.etal2016}.
```

**Proposed Revision:**
```
The largest comparable transfer in consumer finance is the \$18 billion redistribution from low to high credit score consumers through credit card interest rates \citep{Agarwal.etal2022}.
Other benchmarks include shrouded credit card fee losses (\$10 billion), inter-regional GSE transfers (\$15 billion), and high-fee index fund losses (\$20 billion) \citep{agarwal2015regulating,Hurst.etal2016}.
```

**Why better:** Leads with the largest and most relevant comparison, which gives the reader a single anchor. The remaining comparisons are grouped as supporting evidence. The revision frames numbers as evidence for the claim "interchange transfers are large relative to other financial market transfers" rather than listing them.

---

### - [ ] Lines 157-159: Strategic complementarity mechanism is stated without full explanation

**Dimension:** Mechanism Clarity

**Comment:** "Intuitively, strategic complementarity implies that even merchants that do not serve premium credit consumers may raise their prices in response to premium credit interchange fees simply because competitors are raising prices" states the mechanism at a high level but does not trace the full chain. Why would a merchant that does not serve premium credit consumers raise prices because competitors do? Because CES demand means that when competitors raise prices, a merchant's residual demand becomes less elastic, making it optimal to raise its own price.

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

**Why better:** Replaces "Surprisingly" (editorializing) and "Intuitively" (throat-clearing) with direct statements. Adds the intermediate step (less elastic residual demand) that explains why competitors raise prices. Replaces "socializes" (informal scare-quote usage) with "spreads."

---

## Medium

### institutional_setting.tex

### - [ ] Lines 30-31: "Additionally" opener and restated claim

**Dimension:** Economy

**Comment:** "Additionally, both the issuer and the acquirer pay network fees to the card network" opens with a transition tell. The following sentence ("The interchange fee is typically the largest component...") restates what was already established in lines 22-24.

**Original:**
```
Additionally, both the issuer and the acquirer pay network fees to the card network.
The interchange fee is typically the largest component of the merchant discount fee and funds consumer rewards; consequently, it is the focus of much of our analysis.
```

**Proposed Revision:**
```
Both the issuer and the acquirer also pay network fees to the card network, though these are small relative to the interchange fee.
```

**Why better:** Removes "Additionally" opener. Eliminates the meta-commentary ("it is the focus of much of our analysis"), which tells the reader about the paper rather than about the payment system. The relative magnitude point is preserved in a subordinate clause.

---

### - [ ] Lines 46-48: Data subsection opens with near-repetition of the section introduction

**Dimension:** Economy

**Comment:** Lines 46-48 restate what lines 6-11 already said (that we use Fiserv data to examine interchange fee variation and consumer welfare). The phrase "A key feature of these data is that we observe both the composition and price of transactions at the merchant level" repeats the contribution claim rather than describing the data.

**Original:**
```
We use two proprietary datasets from Fiserv, one of the largest U.S. merchant acquirers, to examine how interchange fees vary across merchants and their impact on consumer welfare.
A key feature of these data is that we observe both the composition and price of transactions at the merchant level, which is critical for measuring heterogeneity in payment costs and its implications for redistribution.
```

**Proposed Revision:**
```
We use two proprietary datasets from Fiserv, one of the largest U.S. merchant acquirers.
Both datasets record the composition and price of transactions at the merchant level, which is essential for measuring heterogeneity in payment costs.
```

**Why better:** Cuts the restated purpose ("to examine how interchange fees vary...and their impact on consumer welfare") since the introduction already established this. Replaces "A key feature of these data is that" (throat-clearing preamble) with a direct statement.

---

### payment_costs.tex

### - [ ] Lines 6-11: Section opening blends fact documentation with preview of conclusions

**Dimension:** Motivation & Tension

**Comment:** The opening paragraph previews the two moderating forces (consumer sorting and merchant fee heterogeneity) before the reader has seen any evidence. This removes the tension from the subsequent analysis. The reader already knows the punchline before encountering the data.

**Original:**
```
However, we also document two forces---consumer sorting and merchant fee heterogeneity---that cause aggregate data to overstate the extent of redistribution in the payment system, by limiting the overlap between consumers using different payment methods and compressing fee differences where such overlap occurs.
```

**Proposed Revision:**
```
We also document two forces that cause aggregate data to overstate the extent of redistribution in the payment system.
```

**Why better:** Preserves the roadmap function without giving away the punchline. The reader knows to look for moderating forces but still has to read the evidence to learn what they are and how they operate. This creates forward momentum rather than front-loading the conclusion.

---

### - [ ] Lines 37-42: Credit card bimodality paragraph restates its conclusion

**Dimension:** Economy

**Comment:** The final sentence ("again limiting the potential for cross-subsidization, as many merchants are dominated by a single payment type") restates the same point made in the preceding paragraph about cash. The reader does not need to be told twice that payment concentration limits cross-subsidization.

**Original:**
```
The bimodal nature of the distribution suggests that variation in card payment mix is significant at the merchant level---again limiting the potential for cross-subsidization, as many merchants are dominated by a single payment type.
```

**Proposed Revision:**
```
The bimodal distribution confirms that many merchants are dominated by a single card type, limiting the overlap needed for cross-subsidization.
```

**Why better:** Removes "again" (which signals repetition) and the em-dash construction. States the implication once, directly.

---

### - [ ] Lines 199-201: Summarizing the Facts paragraph front-loads the conclusion

**Dimension:** Motivation & Tension

**Comment:** "Our reduced-form analysis highlights one fact that suggests substantial redistribution... and two facts that moderate this redistribution" announces the full result structure upfront. The reader already knows the three-part answer before reading the evidence. The paragraph then lists all three facts in a single block.

**Original:**
```
Our reduced-form analysis highlights one fact that suggests substantial redistribution between consumers who use different payment methods, and two facts that moderate this redistribution. First, card types vary substantially in their interchange fees. By itself, this raises the potential for substantial redistribution through the payment system. However, redistribution only happens when consumers who choose different payment methods shop at the same stores. Thus, dispersion in payment composition across merchants limits the extent of cross-subsidization. Moreover, at the merchants where consumers with different payment preferences overlap, interchange fees are often lower due to sector discounts and negotiation, further attenuating the magnitude of redistribution.
```

**Proposed Revision:**
```
Card types vary substantially in their interchange fees, which by itself raises the potential for large redistribution through the payment system.
Two forces moderate this potential.
Dispersion in payment composition across merchants limits the overlap between consumers using different payment methods.
Where overlap does occur, interchange fees tend to be lower due to sector discounts and negotiation, further attenuating redistribution.
```

**Why better:** Removes the meta-commentary opener ("Our reduced-form analysis highlights one fact...and two facts"). Removes "Moreover" opener. Leads with the fact (fee variation) rather than the structural announcement, then introduces the two moderating forces. The argument builds rather than being previewed.

---

### redistribution.tex

### - [ ] Lines 55-58: Pricing equation paragraph asserts pass-through without building the case first

**Dimension:** Motivation & Tension

**Comment:** The paragraph states the pricing assumption (log-linear pass-through) before explaining why one-for-one pass-through is reasonable. The justifications come afterward (lines 61-66). Leading with the assumption and then defending it is less persuasive than motivating it first.

**Original:**
```
Rather than explicitly modeling merchant competition or imposing functional forms on the demand side, we assume that prices are log-linear in weighted interchange fees, such that merchants pass through interchange fees to prices one-for-one, as calculated below:
```

**Proposed Revision:**
```
We assume that merchants pass through interchange fees to prices one-for-one.
Because virtually all major retailers accept cards, interchange fee changes represent sector-wide common cost shocks, and standard models predict near-complete pass-through for common shocks \citep{Amiti.etal2019}.
Formally, prices are log-linear in weighted interchange fees:
```

**Why better:** Leads with the motivation (sector-wide common shocks predict near-complete pass-through) before stating the formal assumption. The justification precedes the equation rather than following it, which is more persuasive for a skeptical reader.

---

### - [ ] Lines 109-114: Intuition paragraph uses a long footnote that partly duplicates the main text

**Dimension:** Economy

**Comment:** The footnote at lines 111-114 explains that the paper fixes payment choices to focus on redistribution rather than efficiency, discusses alternative models, and contrasts redistribution analysis with efficiency analysis. This footnote is approximately 80 words and covers three topics. The main text point (two channels determine redistribution) is clean, but the footnote tries to do too much.

**Original:**
```
Our model fixes consumers' payment choices, which allows us to focus on redistribution rather than efficiency effects.
Redistribution can be studied in a largely model-free way by tracking transfers across consumer groups holding behavior fixed, while efficiency analysis requires taking a stand on behavioral responses and therefore demands structural assumptions about demand elasticities, utility functions, and network conduct \citep{Wang2025}.
High interchange fees may induce excessive credit card adoption \citep{Wang2025}, or they may improve efficiency when card acceptance lowers merchant costs \citep{Li.etal2020}.
Our approach enables transparent quantification of redistribution without requiring the stronger assumptions needed for efficiency analysis.
```

**Proposed Revision:**
```
Our model fixes consumers' payment choices, which allows us to focus on redistribution rather than efficiency effects.
High interchange fees may induce excessive credit card adoption \citep{Wang2025} or improve efficiency when card acceptance lowers merchant costs \citep{Li.etal2020}; quantifying these channels requires structural assumptions we avoid here.
```

**Why better:** Cuts the footnote from four sentences to two. Removes the restated claim about not needing structural assumptions (already stated in the main text). Keeps the substantive content (fixed payment choices, efficiency channels deferred).

---

### results.tex

### - [ ] Lines 19-22: Existing Benchmarks paragraph uses smarmy reframing

**Dimension:** Economy

**Comment:** "Both views miss that interchange fees transfer consumption, rather than imposing pure costs or providing free benefits" uses a "Both X miss that Y" construction that is close to smarmy reframing ("It's not X, it's Y"). The paragraph also opens with "Public discussion of interchange fees is polarized between two extreme views," which is a mildly dismissive framing of non-academic positions.

**Original:**
```
Both views miss that interchange fees transfer consumption, rather than imposing pure costs or providing free benefits.
```

**Proposed Revision:**
```
Interchange fees transfer consumption rather than imposing pure costs or providing free benefits.
```

**Why better:** States the paper's position directly without the "Both views miss" framing. The direct statement is more precise and avoids the rhetorical setup.

---

### - [ ] Lines 60-61: Redundant framing before table presentation

**Dimension:** Economy

**Comment:** "The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs" is meta-commentary about the paper's contribution rather than analysis. The reader already knows this from the introduction.

**Original:**
```
The first contribution of our framework is that it allows us to quantify how interchange fees transfer across consumer groups and identify which groups bear these costs.
```

**Proposed Revision:**
```
We quantify how interchange fees transfer across consumer groups using the sufficient-statistics formula.
```

**Why better:** Removes the meta-commentary ("The first contribution of our framework is that it allows us to") and states what the paper does directly.

---

### - [ ] Lines 109-111: Sorting decomposition paragraph front-loads the quantitative answer

**Dimension:** Motivation & Tension

**Comment:** "We find that ignoring these two forces inflates the estimated amount of redistribution by roughly one-third" gives away the punchline before the decomposition. The reader already knows the answer before seeing how sorting and fee heterogeneity are separated.

**Original:**
```
The second contribution of our framework is that it allows us to quantify the extent to which consumer sorting and merchant fee heterogeneity reduce redistribution. We find that ignoring these two forces inflates the estimated amount of redistribution by roughly one-third.
```

**Proposed Revision:**
```
Our framework also quantifies how much consumer sorting and merchant fee heterogeneity reduce redistribution.
We compare our baseline estimates to a homogeneous benchmark that assumes identical payment composition and uniform fees across all merchants.
```

**Why better:** Removes "The second contribution of our framework is that" (meta-commentary). Defers the "one-third" finding to after the benchmark is described, so the reader encounters the setup before the result. The quantitative finding belongs after the comparison is specified.

---

## Low

### conclusion.tex

### - [ ] Lines 6-10: Conclusion restates results without adding insight

**Dimension:** Economy

**Comment:** The conclusion is two paragraphs. The first paragraph restates the headline finding (dollar amount of redistribution) and the sorting attenuation (percentage). The second restates the Durbin and premiumization results. Neither paragraph offers new insight, synthesis, or forward-looking implications beyond what was already stated in the results section. While brevity in conclusions is generally good, the conclusion could add value by identifying what the results mean for ongoing policy debates (the 2025 Corner Post ruling, merchant surcharging, BNPL regulation) rather than recapping.

**Original:**
```
Specifically, we find that interchange fees redistribute approximately \$\absinput{combined_dollar_headline} billion per year from cash and debit users to credit card users, with consumer sorting attenuating these transfers by about \absinput{pct_reduction} percent.
```

**Proposed Revision:**
```
Interchange fees redistribute approximately \$\absinput{combined_dollar_headline} billion per year from cash and debit users to credit card users, with consumer sorting attenuating these transfers by about \absinput{pct_reduction} percent.
```

**Why better:** Minor: removes "Specifically, we find that" (throat-clearing preamble). The deeper suggestion is that the conclusion could benefit from forward-looking content (e.g., implications of the Corner Post ruling, what the framework implies for BNPL regulation, or merchant surcharging policies) rather than restating results already presented.

---

### - [ ] Lines 12-16: Second conclusion paragraph uses "highlight" and broad claims

**Dimension:** Evidence-Claim Alignment

**Comment:** "These trends illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households" is a causal claim about network competition that exceeds the paper's evidence. The paper documents the distributional consequences of fee structures but does not model network competition or estimate how competition among Visa and Mastercard drives fee levels. "More broadly, these results highlight how interchange policies affect not only banks and card networks, but also prices, market competition, and the distribution of economic surplus across consumers" is a vague summary that overgeneralizes.

**Original:**
```
These trends illustrate how network competition through richer rewards funded by higher fees amplifies transfers from low- to high-income households.
More broadly, these results highlight how interchange policies affect not only banks and card networks, but also prices, market competition, and the distribution of economic surplus across consumers.
```

**Proposed Revision:**
```
The common thread is that richer rewards funded by higher interchange fees amplify transfers from low- to high-income households.
Interchange policies affect not only banks and card networks but also retail prices and the distribution of surplus across consumers.
```

**Why better:** Replaces "network competition" (a mechanism the paper does not model) with a description of what the paper does show. Removes "More broadly" opener and "highlight" (AI vocabulary). Drops "market competition" from the list since the paper does not study how interchange policies affect competition among merchants.

---

## Section Grades

| Section | Grade | Primary Issue |
|---------|-------|---------------|
| Introduction | B+ | Several overloaded paragraphs; headline results paragraph is inventory-style; sufficient-statistics preview has throat-clearing |
| Related Literature | A- | One paragraph conflates two arguments (naifs/sophisticates contrast and policy implications) |
| Institutional Setting | B+ | Opening is pure throat-clearing; some restated claims in data subsection |
| Payment Costs | A- | Section opening front-loads conclusions; minor number inventory in cash share description |
| Methodology | A- | Opening paragraph is meta-commentary; footnote in proof sketch section is overloaded |
| Results | B+ | Opening previews all results (removes tension); benchmarks section has inventory-style numbers and smarmy reframing; some meta-commentary ("first contribution," "second contribution") |
| Conclusion | B | Restates results without new synthesis; causal claim about network competition exceeds evidence |
