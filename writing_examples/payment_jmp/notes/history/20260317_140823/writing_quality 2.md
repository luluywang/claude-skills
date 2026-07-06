# Writing Quality Assessment

*Assessed 2026-03-13. Paper type B (specialized topic with institutional context — payment networks).*

---

## intro.tex

### Section: Opening and Main Argument

### - [ ] Lines 23–26: Opening paragraph of this block does too much

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph starting "I quantify the harms of this form of competition" simultaneously introduces the bottleneck concept, reports the empirical pattern (asymmetric multi-homing), and announces both the fee-cap result and the competition-worsens result. This is four moves in six sentences. The empirical pattern and the two results belong in separate paragraphs.

**Original:**
```
I quantify the harms of this form of competition in U.S. payment markets.
Many consumers carry cards from only one network (single-home), while almost all merchants accept all major cards (multi-home) to avoid losing sales.
This ``competitive bottleneck'' \parencite{Armstrong2006} channels competition toward consumer rewards rather than lower merchant fees.
Even a modest cap on credit card merchant fees would increase total welfare substantially.
But simply increasing network competition actually lowers welfare because networks compete by offering rewards to increase card usage.
In the absence of regulatory limits on fees, policy should seek to increase rates of consumer multi-homing to force networks to compete for merchants rather than consumers.
```

**Proposed Revision:**
```
I quantify the harms of this form of competition in U.S. payment markets.
Many consumers carry cards from only one network (single-home), while almost all merchants accept all major cards (multi-home) to avoid losing sales.
This ``competitive bottleneck'' \parencite{Armstrong2006} channels competition toward consumer rewards rather than lower merchant fees.
```
(Move the welfare results and policy conclusion to the following structural paragraph, which already develops these points at lines 55–118.)

**Why better:** Stops the setup paragraph after establishing the bottleneck. Results and policy belong where they are developed, not here. (Principle #4.)

---

### - [ ] Lines 31–41: Three numbered facts presented as sequential topic sentences

**Dimension:** Paragraph Focus (Principle #4) / Economy (Principle #8)

**Comment:** The paragraph announces "Three reduced-form facts," then issues three topic sentences ("I first show…", "Second, accepting cards…", "Third, while almost all…") before each fact. These opener sentences are redundant; each fact should speak for itself.

**Original:**
```
Three reduced-form facts illustrate the competitive bottleneck.
Networks compete for cardholders by charging merchants interchange fees and paying the revenue to banks, giving banks incentives to promote their cards.
I first show that consumers' payment choices respond strongly to interchange fees.
I use a bank-level panel of payment volumes to show that the Durbin Amendment's reduction in debit interchange revenue reduced debit card spending by around 30\%.
Second, accepting cards significantly increases merchant sales.
Event-study evidence shows that accepting credit cards increases sales to card-carrying consumers by around \scalarpctinput{kilts_model_sales_event}\% for merchants on the margin of acceptance.
Third, while almost all card-accepting merchants accept all networks, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network.
Merchants risk lost sales when they decline a consumer's preferred payment method.
Together, these facts show that networks can raise merchant fees to fund consumer adoption because merchants cannot afford to turn away cardholders.
```

**Proposed Revision:**
```
Three reduced-form facts illustrate the competitive bottleneck.
Networks compete for cardholders by charging merchants interchange fees and paying the revenue to banks, giving banks incentives to promote their cards.
Consumer payment choices respond strongly to these incentives: the Durbin Amendment's reduction in debit interchange revenue reduced debit card spending by around 30\%.
Accepting cards significantly increases merchant sales---event-study evidence shows a \scalarpctinput{kilts_model_sales_event}\% sales increase for merchants on the margin of credit card acceptance.
Yet while almost all merchants accept all networks, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network, so merchants risk lost sales when they decline a consumer's preferred payment method.
Together, these facts show that networks can raise merchant fees to fund consumer adoption because merchants cannot afford to turn away cardholders.
```

**Why better:** Eliminates three redundant announcement openers ("I first show…", "Second…", "Third…"), integrating each fact into its evidence sentence. The paragraph is the same length but flows as argument rather than an indexed list. (Principles #4, #8.)

---

### - [ ] Lines 77–81: "Put differently" signals a restatement paragraph

**Dimension:** Economy (Principle #8, Contrast II.9)

**Comment:** "Put differently" flags that the prisoner's dilemma paragraph restates the credit-aversion mechanism just explained in lines 65–75. The cross-subsidy framing ("Credit cards can afford large rewards not because they have low costs, but because they extract the largest cross-subsidies") is the only genuinely new element.

**Original:**
```
Put differently, lower rewards resolve a prisoner's dilemma among consumers.
Under price coherence, consumers exert externalities through their payment choices.
When consumers adopt credit cards, they inflate retail prices for all consumers.
Credit cards can afford large rewards not because they have low costs, but because they extract the largest cross-subsidies.
Consumers collectively prefer lower credit card use but individually face strong incentives to distort their payment choices toward credit.
```

**Proposed Revision:**
```
Credit cards can afford large rewards not because they have low costs, but because they extract the largest cross-subsidies: each credit card adopter raises retail prices for all consumers, so consumers collectively prefer lower credit card use despite individually having strong incentives to defect.
```

**Why better:** Collapses five sentences into one by dropping the restatement and keeping only the cross-subsidy framing that adds new content. (Principle #1.)

---

### - [ ] Lines 96–104: Disclaimer and elaboration should be one sentence

**Dimension:** Economy (Principle #8)

**Comment:** "This counterfactual is not a justification for letting networks merge. It instead illustrates that the fundamental problem is not market power stifling output, but rewards competition generating excessive adoption of credit cards." The second sentence adds nothing the first does not imply; "It instead illustrates" is throat-clearing.

**Original:**
```
This counterfactual is not a justification for letting networks merge.
It instead illustrates that the fundamental problem is not market power stifling output, but rewards competition generating excessive adoption of credit cards.
```

**Proposed Revision:**
```
The result is not a justification for mergers: the fundamental problem is rewards competition generating excessive credit card adoption, not market power stifling output.
```

**Why better:** One sentence replaces two; "It instead illustrates" is cut. (Principle #8.)

---

### Section: Related Literature

### - [ ] Lines 127–130: Inventory of prior-literature gaps without linking gaps to this paper's resolution

**Dimension:** Mechanism Clarity (Principle #2)

**Comment:** Three sentences each state a literature gap ("Assuming X implies Y"), but none explain why the author's approach resolves that gap or what prediction the prior approach gets wrong.

**Original:**
```
Assuming single-homing overstates harm from competition \parencite{Edelman.Wright2015, Anderson.etal2018, Bakos.Halaburda2020, Teh.etal2022}.
Merchant homogeneity implies network competition must weakly reduce merchant fees \parencite{Rochet.Tirole2011, Guthrie.Wright2007}.
Ignoring merchant competition understates merchants' incentives to accept cards \parencite{Rochet.Tirole2003, Wright2012, Li.etal2020}.
```

**Proposed Revision:**
```
Assuming single-homing overstates harm from competition because it predicts networks compete on merchant fees; with mixed homing the bottleneck survives \parencite{Edelman.Wright2015, Anderson.etal2018, Bakos.Halaburda2020, Teh.etal2022}.
Merchant homogeneity implies competition weakly reduces fees, masking the role of merchant type heterogeneity in sustaining the bottleneck at positive acceptance rates \parencite{Rochet.Tirole2011, Guthrie.Wright2007}.
Ignoring merchant competition understates merchants' card acceptance incentives, which are central to why debit cannot discipline credit markets \parencite{Rochet.Tirole2003, Wright2012, Li.etal2020}.
```

**Why better:** Each sentence now states the gap and the wrong prediction it produces, connecting directly to the paper's mechanism. (Principle #2.)

---

## institutional_details.tex

### Section: Payment Flows and Regulatory Evidence

*No significant writing quality issues. The section is short, factual, and tightly written. The payment-flow walkthrough is clear and mechanistic. The regulatory evidence paragraph correctly leads with the empirical claim before the evidence.*

---

## data.tex

### Section: Data Sources

### - [ ] Lines 6–7: Opening sentence is road-mapping throat-clearing

**Dimension:** Economy (Principle #8)

**Comment:** "I use consumer-level, bank-level, and aggregate data to estimate consumer and merchant demand for payments." The section header already signals that data are described here. This sentence adds no information and could be deleted.

**Original:**
```
I use consumer-level, bank-level, and aggregate data to estimate consumer and merchant demand for payments.
Appendix \ref{sec:appendix-data} provides data construction details.
```

**Proposed Revision:**
```
Appendix \ref{sec:appendix-data} provides data construction details.
```

**Why better:** Deletes a pure preamble sentence. (Principle #8.)

---

### - [ ] Lines 53–56: Parenthetical explanation lectures on why large panels are useful

**Dimension:** Economy (Principle #9)

**Comment:** "The large number of transactions lets me measure how consumers split spending across the cards in their wallets, which shapes merchants' incentives to accept high-fee cards." The parenthetical extension ("which shapes merchants' incentives…") explains to field experts why consumer payment splits matter—a connection already established by the model setup. It can be cut.

**Original:**
```
The large number of transactions lets me measure how consumers split spending across the cards in their wallets, which shapes merchants' incentives to accept high-fee cards.
I also use this data to study how card acceptance affects sales.
```

**Proposed Revision:**
```
I use this panel to measure how consumers split spending across the cards in their wallets and how card acceptance affects sales.
```

**Why better:** Drops the parenthetical over-explanation and combines two sentences into one. (Principle #9.)

---

## reducedform.tex

### Section: Opening Paragraph

### - [ ] Lines 4–6: Three-sentence road-map preamble

**Dimension:** Economy (Principle #8)

**Comment:** All three sentences describe what the section will do rather than doing it. "Three reduced-form facts explain why…" previews; the list sentence lists the facts; "By requiring that the estimated model match these facts…" announces the estimation bridge. The section can open with the first fact.

**Original:**
```
Three reduced-form facts explain why networks tax merchants to subsidize the issuing side of the market.
Issuers' incentives to promote cards drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.
By requiring that the estimated model match these facts, I capture the key mechanisms shaping how networks compete for consumers and merchants.
```

**Proposed Revision:**
```
Three reduced-form facts show why networks tax merchants to subsidize the issuing side: issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.
```

**Why better:** Collapses three throat-clearing sentences into one that states the facts directly. Deletes the estimation-bridge sentence, which belongs at the end of the section rather than at the opening. (Principle #8.)

---

### Section: Issuer Incentives

### - [ ] Lines 10–11: "I use X to show Y" is weaker than starting with the identification

**Dimension:** Economy (Principle #8)

**Comment:** "I use the Durbin Amendment to show that issuers' incentives to promote payment instruments strongly affect consumers' payment choices." This is an announcement. The revision should lead with the identification claim directly.

**Original:**
```
I use the Durbin Amendment to show that issuers' incentives to promote payment instruments strongly affect consumers' payment choices.
```

**Proposed Revision:**
```
The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices.
```

**Why better:** Shorter and starts with the identification claim rather than announcing the author's action. (Principle #8.)

---

### Section: Card Acceptance Increases Merchant Sales

### - [ ] Lines 95–96: "shows" overstates causal identification from a panel reduced form

**Dimension:** Evidence-Claim Alignment (Principle #15)

**Comment:** "Online Appendix~\ref{sec:oa-reduced-form} studies Discover's quarterly rewards programs and shows that rewards influence which credit card consumers use but not which merchants they visit." The Discover analysis is a panel reduced form, not a designed experiment. "Shows" overstates the causal identification; "finds" matches the evidence.

**Original:**
```
Online Appendix~\ref{sec:oa-reduced-form} studies Discover's quarterly rewards programs and shows that rewards influence which credit card consumers use but not which merchants they visit.
```

**Proposed Revision:**
```
Online Appendix~\ref{sec:oa-reduced-form} studies Discover's quarterly rewards programs and finds that rewards influence which credit card consumers use but not which merchants they visit.
```

**Why better:** Verb strength matches the identification strategy. (Principle #15.)

---

### Section: Competitive Bottleneck Summary

### - [ ] Lines 173–178: Synthesis paragraph conflates synthesis, qualification, and section transition

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The closing paragraph synthesizes the three facts, then introduces a qualification ("existing theoretical models offer ambiguous predictions"), then transitions to the model section. Three moves in four sentences.

**Original:**
```
Together, these three facts reveal a ``competitive bottleneck'' \parencite{Armstrong2006}.
Issuer incentives drive consumer adoption (Fact 1), card acceptance increases merchant sales (Fact 2), and asymmetric multi-homing (Fact 3) tilts network competition toward the consumer side and away from merchants.
Networks should therefore set high merchant fees to fund the issuer rewards that drive consumer adoption \parencite{Rochet.Tirole2003, Edelman.Wright2015}.
Because only \scalarinput{kilts_model_multihome_cc}\% of consumers multi-home, however,
existing theoretical models offer ambiguous predictions on the effects of competition and regulation.
I develop a structural model to evaluate these effects.
```

**Proposed Revision:**
```
Together, these three facts reveal a ``competitive bottleneck'' \parencite{Armstrong2006}: issuer incentives drive consumer adoption, card acceptance increases merchant sales, and asymmetric multi-homing tilts competition toward the consumer side.
Networks should therefore set high merchant fees to fund the issuer rewards that drive consumer adoption \parencite{Rochet.Tirole2003, Edelman.Wright2015}.
But because only \scalarinput{kilts_model_multihome_cc}\% of consumers multi-home, existing theoretical models offer ambiguous predictions on the effects of competition and regulation, motivating the structural model in the next section.
```

**Why better:** Compresses the synthesis and removes the standalone "I develop a structural model" sentence. (Principles #4, #8.)

---

## model.tex

### Section: Structure of the Game

### - [ ] Lines 4–5: Two throat-clearing sentences

**Dimension:** Economy (Principle #8)

**Comment:** "I develop a structural model of payment network competition with two-sided multi-homing, merchant competition, and price coherence. The model quantifies how the mix of single-homing and multi-homing consumers shapes network competition, and evaluates fee caps, mergers, and routing mandates." Both sentences describe what the model does rather than presenting it. "Evaluates fee caps…" belongs in the counterfactuals section.

**Original:**
```
I develop a structural model of payment network competition with two-sided multi-homing, merchant competition, and price coherence.
The model quantifies how the mix of single-homing and multi-homing consumers shapes network competition, and evaluates fee caps, mergers, and routing mandates.
```

**Proposed Revision:**
```
The model features payment network competition with two-sided multi-homing, merchant competition, and price coherence.
```

**Why better:** One sentence replaces two; drops the forward-looking "evaluates fee caps…" clause that belongs in counterfactuals. (Principle #8.)

---

### Section: Discussion of Key Assumptions

### - [ ] Lines 294–295: Second sentence is pure meta-commentary

**Dimension:** Economy (Principle #8)

**Comment:** "I discuss the evidence for these assumptions below." The discussion follows immediately; this sentence announces what the paragraphs already do.

**Original:**
```
The model makes several simplifying assumptions for tractability.
I discuss the evidence for these assumptions below.
```

**Proposed Revision:**
```
The model makes several simplifying assumptions for tractability.
```

**Why better:** Deletes a pure meta-commentary sentence. (Principle #8.)

---

### - [ ] Lines 308–312: Rejection of alternative specification: mechanism implicit

**Dimension:** Mechanism Clarity (Principle #2)

**Comment:** "A specification that combines incremental debit sales with free substitution predicts that credit acceptance should fall when debit fees decline, because merchants can capture card transactions via the lower-fee debit card." The "because" clause states the mechanism, but the underlying logic—if debit generates incremental sales and consumers substitute freely to debit, accepting credit becomes redundant for merchants—is compressed. The testable prediction is clearly stated; the mechanism producing it is not.

**Original:**
```
A specification that combines incremental debit sales with free substitution predicts that credit acceptance should fall when debit fees decline, because merchants can capture card transactions via the lower-fee debit card.
Yet as Online Appendix \ref{subsec:oa-credit-debit-segmentation} documents, merchant acceptance of credit remained stable after the Durbin Amendment cut debit fees by roughly half (Figure~\ref{fig:merchant-amex-visa}), rejecting this combined specification.
```

**Proposed Revision:**
```
A specification that combines incremental debit sales with free credit-debit substitution predicts that credit acceptance should fall when debit fees decline: if debit generates the same incremental sales as credit and consumers freely substitute, merchants can capture card-user revenue at lower cost by dropping credit.
Yet merchant acceptance of credit remained stable after the Durbin Amendment cut debit fees by roughly half (Figure~\ref{fig:merchant-amex-visa}), rejecting this combined specification.
```

**Why better:** States the full causal chain ("merchants can capture card-user revenue at lower cost") before the empirical test, so the test result clearly falsifies a stated prediction. (Principle #2.)

---

### - [ ] Lines 343–347: Tacit coordination: "less relevant" is imprecise

**Dimension:** Intellectual Precision (Principle #11)

**Comment:** "This mechanism is less relevant here" is vague. The reason follows—the caps studied are binding constraints, not non-binding ceilings—but the claim should be stated directly rather than hedged as "less relevant."

**Original:**
```
This mechanism is less relevant here.
The caps I study are binding constraints that reduce fees below competitive levels, whereas their result applies to non-binding ceilings serving as coordination devices above the competitive price.
```

**Proposed Revision:**
```
The caps I study are binding constraints that reduce fees below competitive levels; the Knittel-Stango result applies to non-binding ceilings serving as coordination devices above the competitive price and does not apply here.
```

**Why better:** Removes the vague hedge "less relevant" and states directly that the mechanism does not apply, with the reason in the same sentence. (Principle #11.)

---

## estimation.tex

### Section: Estimation Procedure

### - [ ] Lines 10–13: Sequential framing ("First…Second…Third") contradicts joint estimation

**Dimension:** Intellectual Precision / False Structure (Principle #12)

**Comment:** "I estimate all parameters jointly, but the identification argument has three components. First, I estimate consumer demand… Second, I recover network costs… Third, I recover merchant types…" The joint-estimation claim conflicts with the sequential "First/Second/Third" framing. The three items are components of the identification argument, not sequential procedures.

**Original:**
```
I estimate all parameters jointly, but the identification argument has three components.
First, I estimate consumer demand using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Second, I recover network costs by inverting first-order conditions.
Third, I recover merchant types from event-study evidence on card acceptance effects and acceptance rates.
```

**Proposed Revision:**
```
I estimate all parameters jointly, but the identification argument has three components: consumer demand identified by quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}; network costs recovered by inverting first-order conditions; and merchant types recovered from event-study evidence on card acceptance effects and acceptance rates.
```

**Why better:** Eliminates the false "First/Second/Third" sequentiality by presenting all three components in one sentence as parallel identification claims. (Principle #12.)

---

### Section: Network Costs

### - [ ] Lines 61–62: Identification argument states result without tracing the moment condition

**Dimension:** Math Precision / Mechanism Clarity (Principles #3, #2)

**Comment:** "I recover network costs by inverting first-order conditions. High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed fees." The second sentence is an intuition, not an identification argument. Which first-order condition? What data enter it? What is the identified quantity?

**Original:**
```
I recover network costs by inverting first-order conditions.
High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed fees.
```

**Proposed Revision:**
```
I recover network costs by inverting the network first-order condition for reward-setting: given observed fees, rewards, and adoption elasticities, the condition pins down the cost of processing each card type.
Networks fund rewards from merchant fee profits, so inferred costs are low relative to observed fees.
```

**Why better:** States which first-order condition is being inverted and what data enter it, making the identification argument traceable rather than a verbal intuition. (Principles #3, #2.)

---

### Section: Merchant and Consumer Sensitivities

### - [ ] Lines 145–150: Inventorial number sequence with closing restatement

**Dimension:** Number Integration (Principle #7)

**Comment:** The paragraph states the ten-to-one ratio, reports two numbers (fee sensitivity and its SE), explains the mechanism, and then restates the ten-to-one ratio in the closing sentence. The closing sentence is redundant.

**Original:**
```
Consumers are roughly ten times as sensitive to rewards as merchants are to fees.
A $1$-bp increase in Visa's merchant fees, holding fixed consumer adoption, leads to only a \absinput{divert_inst_merchant_price_visa_baseline}$\%$ decrease in the share of merchants accepting that card (S.E.
\absinput{divert_inst_merchant_price_visa_baseline_se}$\%$).
This asymmetry underpins the competitive bottleneck.
Merchants cannot credibly threaten to drop cards that consumers expect to use.
The roughly ten-to-one sensitivity gap means that networks compete more for consumers than merchants.
```

**Proposed Revision:**
```
Consumers are roughly ten times as sensitive to rewards as merchants are to fees: a $1$-bp increase in Visa's merchant fees reduces merchant acceptance by only \absinput{divert_inst_merchant_price_visa_baseline}\% (S.E. \absinput{divert_inst_merchant_price_visa_baseline_se}\%).
This asymmetry underpins the competitive bottleneck: merchants cannot credibly threaten to drop cards that consumers expect to use, so networks compete for consumers rather than merchants.
```

**Why better:** Integrates the evidence numbers as proof of the claim rather than reporting them sequentially; removes the closing restatement. (Principles #7, #1.)

---

### Section: Goodness of Fit — Merchant Demand

### - [ ] Lines 197–212: Three validation exercises in one paragraph

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph validates merchant parameters against (1) OptBlue fee cut and acceptance response, (2) estimated average sales effect vs. external experiments, and (3) estimated retail margin vs. macro studies. These are three separate tests and belong in separate paragraphs.

**Original:**
```
I validate merchant parameter estimates against three types of evidence.
AmEx's 2016--2019 OptBlue program cut merchant fees by \scalarinput{amex_visa_fee_diff} bps relative to Visa...
Simulating this shock in the model, the gap shrinks by \absinput{divert_inst_optblue_price_amex_baseline} pp.
This out-of-sample prediction is the most direct test...
The estimated average sales effect of \scalarpctinput{param_est_e_gamma_pass_baseline}\% is consistent with experimental evidence...
The estimated retail margin of \scalarinput{param_est_retail_margin_pass_baseline.tex}\% is similar to...
```

**Proposed Revision:**
```
I validate merchant parameter estimates against three types of evidence.

AmEx's 2016--2019 OptBlue program cut merchant fees by \scalarinput{amex_visa_fee_diff} bps relative to Visa (Figure \ref{fig:fees-history}), and the share of Visa merchants not accepting AmEx shrank from around $9$--\absinput{amex_visa_accept_diff} pp.\ to almost zero (Figure \ref{fig:merchant-amex-visa}).
Simulating this shock in the model, the gap shrinks by \absinput{divert_inst_optblue_price_amex_baseline} pp., the most direct out-of-sample test of the model's ability to predict merchant responses to fee changes.\footnote{[Existing footnote content]}

The estimated average sales effect of \scalarpctinput{param_est_e_gamma_pass_baseline}\% is consistent with experimental evidence: \textcite{Higgins2022} find that debit card adoption at corner stores increases sales by $20$--$60\%$, and \textcite{Berg.etal2024} find that accepting Buy Now, Pay Later raises sales by around $20\%$.
The estimated retail margin of \scalarinput{param_est_retail_margin_pass_baseline.tex}\% is similar to the aggregate markups of $15$--$20\%$ used in macro studies of misallocation \parencite{Edmond.etal2022, Sraer.Thesmar2023a}.
```

**Why better:** Separates three distinct validation tests into distinct paragraph blocks, each with a single point. (Principle #4.)

---

## counterfactuals.tex

### Section: Opening

### - [ ] Lines 4–6: Road-mapping announces conclusion before evidence

**Dimension:** Motivation (Principle #5) / Economy (Principle #8)

**Comment:** "I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse." This pre-announces the conclusion. The results should be discovered through the counterfactuals, not stated upfront.

**Original:**
```
I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse.
I do so by simulating counterfactual policies that cap credit card fees, repeal the Durbin Amendment, merge all three networks, increase consumer multi-homing through dual-routing mandates, or introduce a central bank digital currency.
```

**Proposed Revision:**
```
I simulate five counterfactual policies: capping credit card fees, repealing the Durbin Amendment, merging all three networks, increasing consumer multi-homing through dual-routing mandates, and introducing a central bank digital currency.
```

**Why better:** Removes the pre-announcement of conclusions and the meta-commentary "I do so by." A listing sentence is sufficient; the results will establish the welfare comparisons. (Principles #5, #8.)

---

### Section: Capping Credit Card Merchant Fees — Welfare

### - [ ] Lines 103–110: Welfare decomposition reported as inventory

**Dimension:** Number Integration (Principle #7)

**Comment:** "consumers gain \$28 billion, merchants gain \$0.4 billion, and networks lose \$1.5 billion" lists three numbers from the table without each number serving as evidence for a mechanistic claim. The reader can see the table.

**Original:**
```
Table~\ref{tab:welfare-decomp} shows that consumers gain \$28 billion,
% HARDCODED...
merchants gain \$0.4 billion,
% HARDCODED...
and networks lose \$1.5 billion, around 6\% of baseline profits.
% HARDCODED...
The total gain is roughly double the \$12 billion annual consumer welfare gain from the CARD Act \parencite{Agarwal.etal2015}.
```

**Proposed Revision:**
```
Most gains accrue to consumers (\$28 billion), not merchants (\$0.4 billion), because retail competition dissipates merchants' fee savings into lower prices.
Networks lose only \$1.5 billion---around 6\% of baseline profits---because increased merchant acceptance partially offsets lower per-transaction margins.
The total gain is roughly double the \$12 billion consumer welfare gain from the CARD Act \parencite{Agarwal.etal2015}.
```

**Why better:** Each number serves as evidence for a specific mechanistic claim rather than being listed from the table. (Principle #7.)

---

### Section: Repealing the Durbin Amendment

### - [ ] Lines 178–185: Inventory of five price-change numbers

**Dimension:** Number Integration (Principle #7)

**Comment:** Credit rewards fall 6 bps, credit fees fall 3.3 bps, total fees rise \$4.4 billion, total rewards rise \$0.5 billion — four numbers in two sentences without each number being anchored to a specific claim beyond the see-saw principle.

**Original:**
```
Credit card rewards and fees would fall by 6
and 3.3 bps respectively.
The net effect is that repealing the Durbin Amendment increases total merchant fees by \$4.4 billion
and increases total rewards by \$0.5 billion.
```

**Proposed Revision:**
```
Credit rewards fall 6 bps and credit fees fall 3.3 bps as credit networks reduce reward competition for consumers who switch to debit.
Net of the debit increase, total merchant fees rise \$4.4 billion but total rewards rise only \$0.5 billion, reflecting the substitution of lower-reward debit for high-reward credit.
```

**Why better:** Each pair of numbers is anchored to the cross-network substitution mechanism. (Principle #7.)

---

### Section: Welfare Effects of Reducing Network Competition

### - [ ] Lines 219–229: Mechanism ("key mechanism is compositional") arrives after the numbers

**Dimension:** Motivation (Principle #5) / Mechanism Clarity (Principle #2)

**Comment:** The paragraph opens with the price changes (rewards cut 90 bps, fees rise 36 bps), then states "The key mechanism is compositional," then reports aggregate effects. The mechanism should come first.

**Original:**
```
Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps
while raising per-transaction merchant fees by 36 bps.
The key mechanism is compositional: lower rewards dramatically reduce credit card use (credit share falls 20 pp),
so the proliferation of high-fee credit transactions declines.
Despite higher per-transaction fees, aggregate fees and rewards fall by \$40
and \$66 billion, respectively.
```

**Proposed Revision:**
```
The key mechanism is compositional.
Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps, dramatically reducing credit card use (credit share falls 20 pp).
With fewer high-fee credit transactions, aggregate fees fall \$40 billion and rewards fall \$66 billion despite higher per-transaction fees of 36 bps.
```

**Why better:** Opens with the mechanism before the numbers, so each price change serves as evidence for the compositional claim. (Principles #5, #2.)

---

### Section: Discussion — Rewards as a Proxy for Issuer Incentives

### - [ ] Lines 319–328: Two concerns stated but their resolutions are interleaved

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph correctly names two concerns, but states concern 1, then its implication, then concern 2, then the robustness evidence for concern 2 only, then mixes the robustness results. The resolution of concern 1 (welfare estimates understate losses) is not quantified; the resolution of concern 2 is in the appendix.

**Original:**
```
This simplification raises two concerns.
First, steering may have real costs and not benefit consumers.
The baseline welfare estimates therefore understate the losses from high interchange fees.
Second, the Durbin Amendment event study may overstate reward sensitivity if part of the observed decline in debit activity reflects reduced steering rather than lost rewards.
Online Appendix \ref{subsec:oa-debit-robustness} re-estimates the model attributing only half the Durbin-induced decline to a response to rewards.
Fee cap gains shrink but remain positive, and dual routing still raises welfare.
The merger no longer raises welfare because market power is more harmful when consumers are less sensitive to rewards.
```

**Proposed Revision:**
```
This simplification raises two concerns.
First, steering has real costs and does not benefit consumers, so the baseline welfare estimates understate the true losses from high interchange fees.
Second, the Durbin event study may overstate reward sensitivity if part of the observed debit decline reflects reduced steering rather than lost rewards; Online Appendix~\ref{subsec:oa-debit-robustness} re-estimates the model attributing only half the decline to rewards.
Fee cap gains shrink but remain positive, dual routing still raises welfare, and the merger no longer raises welfare---market power is more harmful when consumers are less reward-sensitive.
```

**Why better:** Each concern is paired immediately with its implication; the robustness results are consolidated in the final sentence. (Principle #4.)

---

## conclusion.tex

### Section: Conclusion

### - [ ] Lines 4–7: Opening four sentences repeat intro-level mechanism exposition

**Dimension:** Economy (Principle #1)

**Comment:** The conclusion opens with four sentences re-narrating the competitive bottleneck mechanism already fully established in the introduction and reduced-form sections. A conclusion should synthesize or extend, not repeat.

**Original:**
```
The increased use of credit cards over time and the corresponding increase in merchants' costs of payments are a consequence of intense network competition channeled toward the wrong side of the market.
Because most consumers single-home while nearly all merchants multi-home, networks compete for cardholders with generous rewards funded by merchant fees.
Price coherence ensures that these fees pass through to higher retail prices borne by all consumers, including those who pay with cash and debit.
The rewards draw more consumers to credit cards, increasing merchants' costs.
```

**Proposed Revision:**
```
Intense network competition, channeled toward the consumer side by the competitive bottleneck, has raised merchants' costs and retail prices for all consumers.
Price coherence is the key friction: merchant fees pass through to higher retail prices, and rewards draw more consumers to credit cards, amplifying the distortion.
```

**Why better:** Two sentences replace four without losing information; the revision opens with the paper's diagnostic contribution rather than re-narrating the mechanism step by step. (Principle #1.)

---

### - [ ] Lines 31–35: Final paragraph introduces a broad antitrust claim without connecting it to the dual-routing evidence

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph moves from the Ohio standard's two-sidedness assumption, to the dual-routing evidence that competition for consumers and merchants differs, to a broad claim about antitrust's quantity focus. The last sentence ("Antitrust typically focuses on the harms from low quantities, whereas platform markets may feature excessive quantities due to price coherence") introduces a new framing that is not connected to either the Ohio standard or the dual-routing evidence by any causal link.

**Original:**
```
The Ohio standard also implicitly treats competition for merchants and competition for consumers as interchangeable.
The dual-routing counterfactual shows they are not.
When consumer multi-homing forces networks to compete for merchants rather than cardholders, welfare rises by \$8 billion.
Antitrust typically focuses on the harms from low quantities, whereas platform markets may feature excessive quantities due to price coherence.
```

**Proposed Revision:**
```
The Ohio standard also treats competition for merchants and competition for consumers as interchangeable.
They are not: when consumer multi-homing forces networks to compete for merchants rather than cardholders, welfare rises by \$8 billion even though fees and rewards both fall.
The broader lesson is that antitrust's standard concern---harm from low output---is reversed in platform markets with price coherence, where the distortion is excessive credit card adoption, not output suppression.
```

**Why better:** The final sentence is reframed as a lesson from the dual-routing evidence rather than an unconnected observation. (Principle #4.)

---

## Section Grades

| Section | Grade | Primary Issue |
|---------|-------|---------------|
| Introduction | B+ | Opening bottleneck paragraph multi-tasks; prisoner's dilemma paragraph restates prior paragraph; related literature inventory |
| Institutional Details | A | Short, factual, mechanistic throughout |
| Data | A- | One road-map opener; one lecturing sentence |
| Reduced-Form Facts | B+ | Three-sentence road-map opener; closing synthesis overloaded; "shows" overstates Discover evidence |
| Model | B+ | Two throat-clearing passages; one mechanism slightly compressed; tacit coordination vague |
| Estimation | B | Sequential framing of joint estimation; identification argument for network costs hand-waved; sensitivities paragraph closes with restatement; merchant GoF three tests in one paragraph |
| Counterfactuals | B | Opening pre-announces conclusion; inventory numbers in welfare and Durbin sections; mechanism arrives after numbers in monopoly paragraph |
| Conclusion | A- | Opening four sentences re-narrate intro mechanism; final paragraph introduces antitrust claim without evidence link |

---

*Total flagged items: 27. No Critical flags; all issues are Medium or Low priority. The paper's core argument structure is sound: mechanisms are traced, limitations are named, and evidence-claim alignment is generally good. Issues concentrate in Economy (throat-clearing, road-mapping) and Number Integration (inventory sequences).*
