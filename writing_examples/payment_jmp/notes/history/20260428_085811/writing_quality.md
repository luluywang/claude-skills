# Writing Quality Assessment

---

## intro.tex

### Section: Opening three paragraphs (lines 4–35)

### - [ ] Lines 13–24: Second paragraph stacks too many distinct mechanisms

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph introduces the paper's main finding ("merchant fees are indeed too high, but weak competition is the wrong diagnosis"), then names price coherence, estimates the consumer-to-merchant sensitivity ratio, explains the incentive mechanism, and draws a causal conclusion about credit card proliferation. That is at minimum four distinct moves — diagnosis, mechanism setup, quantitative finding, and causal conclusion — in eight lines. The topic sentence belongs to one paragraph; the price coherence setup belongs to another.

**Original:**
```
I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.
Networks set rewards for consumers and fees for merchants.
The division of costs matters because merchants typically charge the same price for all payment methods, a phenomenon known as ``price coherence'' \parencite{Frankel1998, Stavins2018}.
Under price coherence, card users capture rewards while the cost of higher merchant fees is spread across all consumers through higher retail prices.
I estimate that consumers are ten times more sensitive to rewards than merchants are to fees.
This incentivizes networks to charge high merchant fees to fund generous consumer rewards.
High-merchant-fee credit cards thus proliferate because of, not in spite of, intense network competition.
```

**Proposed Revision:**
```
I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.
Networks set rewards for consumers and fees for merchants, and the division of costs matters.
Merchants typically charge the same price for all payment methods, so card users capture rewards while the cost of higher merchant fees is spread across all consumers through higher retail prices --- a phenomenon known as ``price coherence'' \parencite{Frankel1998, Stavins2018}.
I estimate that consumers are ten times more sensitive to rewards than merchants are to fees.
This asymmetry incentivizes networks to charge high merchant fees to fund generous consumer rewards.
High-merchant-fee credit cards therefore proliferate because of, not in spite of, intense network competition.
```

**Why better:** Keeps the single-point structure while preserving the causal chain. The price-coherence explanation is integrated as a subordinate mechanism rather than introduced as its own topic. Trims the paragraph slightly and removes the throat-clearing "The division of costs matters because..." opener, which is not a direct statement.

---

### - [ ] Lines 37–40: "Existing theory" paragraph announces result before tension

**Dimension:** Motivation and Tension (Principle #5)

**Comment:** The paragraph opens by stating the conclusion ("Existing theory cannot resolve whether...") and then backtracks to explain the two theoretical extremes. The reader is told the punchline — ambiguity — before seeing the evidence for it. A stronger paragraph would open with the two extreme predictions and let the ambiguity emerge.

**Original:**
```
Existing theory cannot resolve whether network competition raises or lowers fees and welfare.
The U.S.\ market sits between two theoretical extremes.
When all consumers single-home, each network is a monopoly gateway to its cardholders, so competition raises per-transaction merchant fees \parencite{Armstrong2006, Edelman.Wright2015}.
When consumers multi-home (i.e. carry cards from multiple networks), merchants can drop expensive networks without losing sales, so competition lowers fees \parencite{Anderson.etal2018, Bakos.Halaburda2020, Teh.etal2022}.
```

**Proposed Revision:**
```
Existing theory offers two competing predictions.
When all consumers single-home, each network is a monopoly gateway to its cardholders and competition raises per-transaction merchant fees \parencite{Armstrong2006, Edelman.Wright2015}.
When consumers multi-home, merchants can drop expensive networks without losing sales, so competition lowers fees \parencite{Anderson.etal2018, Bakos.Halaburda2020, Teh.etal2022}.
The U.S.\ market sits between these extremes, so the net effect of competition on fees and welfare cannot be read off from theory alone.
```

**Why better:** Opens with the tension (two conflicting predictions) rather than the conclusion (theory is silent). The ambiguity emerges from the structure of the argument rather than being declared upfront.

---

### - [ ] Lines 92–102: Monopoly paragraph inventories numbers without earning them as arguments

**Dimension:** Number Integration (Principle #7, Contrast II.6)

**Comment:** The paragraph reports: monopoly raises welfare by $15B, consumers lose $11B, networks gain $31B, low-income gain 13 bps, high-income lose 29 bps. These numbers are presented sequentially without each one advancing a distinct claim. The mechanism (rewards competition eliminated) is stated once, then buried by the list. The distributional numbers in particular feel inventorial --- the low/high income split is listed without a "because" explaining why the directions differ.

**Original:**
```
The merger increases total welfare by \$15 billion because eliminating rewards competition more than offsets the consumer losses.
Consumers lose \$11 billion (though imprecisely estimated)
while networks gain \$31 billion.
Lower credit card use reduces retail prices for all consumers, but lower rewards mainly harm high-income cardholders.
Low-income consumers gain 13 bps in consumption
while high-income consumers lose 29 bps.
These results do not support mergers, since the consumer losses are large and imprecisely estimated.
They do show that rewards competition is so harmful that increases in market power can raise total welfare.
```

**Proposed Revision:**
```
The merger increases total welfare by \$15 billion because eliminating rewards competition more than offsets the consumer losses.
Consumers lose \$11 billion (imprecisely estimated) while networks gain \$31 billion.
The distribution is progressive: lower credit card use reduces retail prices for all consumers, but lower rewards fall disproportionately on high-income cardholders, who are both more likely to hold credit cards and more reward-sensitive.
Low-income consumers gain 13 bps in consumption while high-income consumers lose 29 bps.
These results do not support mergers --- consumer losses are large and imprecisely estimated --- but they show that rewards competition is so harmful that increases in market power can raise total welfare.
```

**Why better:** Adds the causal "because" before the distributional split (income gradient in reward sensitivity explains the direction), making the numbers evidence for a claim rather than inventory. Consolidates the last two sentences to cut redundancy.

---

## reducedform.tex

### Section: Opening paragraph (lines 4–6)

### - [ ] Lines 4–6: Opening paragraph announces conclusions before showing evidence

**Dimension:** Motivation and Tension (Principle #5)

**Comment:** The opening sentence of the reduced-form section announces all three facts the section will document, then the third sentence draws the conclusion from those facts. The reader learns what to think before seeing any evidence. A section that is supposed to motivate the structural model should open with the puzzle, not the answer.

**Original:**
```
Three reduced-form facts characterize the two-sided structure of the payment market.
Issuers' incentives drive consumer payment choices; card acceptance increases merchant sales; and a mix of single- and multi-homing consumers limits merchants' ability to steer between networks.
These facts point toward a partial competitive bottleneck, but the degree of consumer multi-homing leaves the net effect of competition on fees and welfare an empirical question.
```

**Proposed Revision:**
```
How intensely networks compete for consumers versus merchants determines whether competition raises or lowers total welfare.
Three reduced-form facts characterize this tradeoff in the U.S. payment market: issuers' incentives strongly drive consumer payment choices; card acceptance increases merchant sales; and a mix of single- and multi-homing consumers limits merchants' ability to steer between networks.
Together these facts point toward a partial competitive bottleneck, but the degree of consumer multi-homing leaves the net effect of competition on fees and welfare an empirical question.
```

**Why better:** Opens with the tension (the unknown direction of competition's effect) before announcing the facts that bear on it. The reader now knows why the facts matter before seeing them.

---

### Section: Section 3 --- Consumer Multi-homing (lines 162–164)

### - [ ] Lines 162–164: Single-paragraph with two competing hypotheticals collapses the tension

**Dimension:** Within-Paragraph Flow (Principles #2, #4, #5)

**Comment:** The paragraph introduces the question "whether merchants can steer consumers" and then immediately answers it in two sentences by stating both possible outcomes. There is no building toward either case; the pair of sentences functions as a table caption, not an argument. The current paragraph flow is: question → if A then X → if B then Y, with no synthesis.

**Original:**
```
Whether merchants can steer consumers between networks depends on how many consumers carry cards from more than one.
If most consumers single-home, a merchant that declines a network loses those consumers entirely. If most multi-home, the merchant can redirect them to a rival.
```

**Proposed Revision:**
```
Whether merchants can steer consumers between networks depends on how many carry cards from more than one network.
A merchant declining an expensive network loses all single-homers on that network entirely, since they cannot substitute; it can redirect multi-homers to a rival.
The share of single-homers therefore governs merchants' effective bargaining power.
```

**Why better:** Converts the two hypothetical scenarios into a single causal chain (single-homers lost entirely → multi-homers redirectable → share determines bargaining power), which builds toward the multi-homing data that follows rather than just stating two cases in parallel.

---

## model.tex

### Section: Structure of the Game (lines 8–13)

### - [ ] Lines 8–13: Stage description paragraph has throat-clearing close

**Dimension:** Economy (Principle #8)

**Comment:** The last sentence "The second and third stages micro-found demand for payments" announces what the stages do rather than letting the structure speak for itself. A reader who has just read the three-stage description does not need to be told what stages 2 and 3 accomplish --- that is already clear from the description.

**Original:**
```
The second and third stages micro-found demand for payments.
Section~\ref{subsec:model-assumptions} discusses key assumptions.
```

**Proposed Revision:**
```
Section~\ref{subsec:model-assumptions} discusses key assumptions.
```

**Why better:** Deletes the throat-clearing summary. The cross-reference to key assumptions is still useful. The micro-foundation role of stages 2 and 3 is self-evident from reading them.

---

### Section: Discussion of Key Assumptions --- Segmentation (lines 293–305)

### - [ ] Lines 293–305: Mixed-support paragraph conflates "case for" with "case against"

**Dimension:** Within-Paragraph Flow (Principles #2, #4)

**Comment:** The paragraph runs: (1) baseline assumes segmentation, (2) intuition for segmentation, (3) appendix shows adoption-stage consistency, (4) support is mixed, (5) substitution generates bad predictions. Sentences 4 and 5 undercut the earlier defense without resolving the concession. The paragraph makes two distinct arguments --- "here is the assumption" and "here is why it is defensible despite mixed evidence" --- which belong in separate paragraphs.

Current flow:
1. Baseline treats credit/debit as segmented. [Setup]
2. Intuition: transactions differ by type. [Defense]
3. Appendix: segmentation at transaction level consistent with adoption substitution. [Technical defense]
4. Mixed support; substitution generates bad predictions. [Concession + answer]
5. Antitrust testimony contradicts substitution prediction 1; Durbin contradicts prediction 2. [Evidence for answer]

The concession in sentence 4 and the evidence in sentence 5 are the actual argument but arrive after two sentences of defense that are never returned to.

**Original:**
```
Although the segmentation assumption has mixed support, allowing for credit-debit substitution generates important predictions that are not observed in the data.
Antitrust testimony and consumer surveys support it, but Discover's rewards experiment shows some substitution at the margin (Appendix~\ref{subsec:oa-discover-rewards}).
Under substitution, credit acceptance would depend on credit-debit multi-homing rates, and debit fee caps would discipline credit fees.
Antitrust testimony in \emph{Ohio v.\ AmEx} contradicts the first, and Durbin halved debit interchange without moving credit interchange.
```

**Proposed Revision:**
```
Allowing for credit-debit substitution generates two testable predictions: credit acceptance should depend on credit-debit multi-homing rates, and debit fee caps should discipline credit fees.
Neither holds in the data.
Antitrust testimony in \emph{Ohio v.\ AmEx} contradicts the first, and Durbin halved debit interchange without moving credit interchange.
The segmentation assumption has mixed support on the consumer side --- antitrust testimony and surveys favor it, but Discover's rewards experiment shows some marginal substitution (Appendix~\ref{subsec:oa-discover-rewards}) --- but it is the only specification consistent with the merchant-side evidence.
```

**Proposed Revision Flow:**
1. Substitution generates two predictions. [Setup]
2. Neither holds. [Conclusion earned early]
3. Evidence against each. [Chain of evidence]
4. Consumer-side is mixed; merchant-side tilts toward segmentation. [Honest concession, placed after the evidence]

**Why better:** The argument now earns its conclusion (segmentation is preferred) from the evidence rather than asserting it and then providing partial support. The concession about mixed consumer-side evidence is preserved but placed after the disconfirming evidence, not before it.

---

### Section: Two-Card Restriction (lines 307–313)

### - [ ] Lines 307–313: Limitation paragraph names limitation but buries the "so what"

**Dimension:** Limitations Handling (Principle #6)

**Comment:** The paragraph names two limitations of the two-card restriction (understates flexibility, overstates substitution) but never states what the analysis achieves despite them. The last sentence cites an alternative approach without explaining how the paper's approach compares or why the limitation is not fatal. This leaves the reader uncertain about how seriously to take the restriction.

**Original:**
```
This setup understates consumer flexibility by excluding a potential third fallback option, but potentially overstates the willingness to substitute among the top-two cards.
A consumer who puts 99\% of their spending on one card and 1\% on another may be less willing to substitute than the model implies.
\textcite{Sullivan2025} takes an alternative approach and infers substitution patterns from within-consumer persistence in platform choice.
```

**Proposed Revision:**
```
This setup understates consumer flexibility by excluding a potential third fallback option, but potentially overstates substitution among the top two cards: a consumer who puts 99\% of spending on one card and 1\% on another may be less willing to substitute than the model implies.
Because both biases push in opposite directions, their net effect on the counterfactual predictions is unclear.
The 95\% spending concentration across two networks (Online Appendix Table~\ref{tab:top-two}) limits the first concern, while the credit-debit segmentation at the point of sale limits the second for cross-type substitution.
```

**Why better:** Adds a statement about what the paper achieves despite the limitation. The original ends on a citation to an alternative that the reader might take as an implicit concession; the revision closes on the paper's own defense.

---

## estimation.tex

### Section: Merchant and Consumer Sensitivities (lines 140–163)

### - [ ] Lines 140–163: Three-paragraph block opens each paragraph with summary rather than mechanism

**Dimension:** Paragraph Focus / Motivation and Tension (Principles #4, #5)

**Comment:** All three paragraphs in this block follow the same structure: summary sentence → supporting numbers → interpretation. Paragraph 1: "estimated parameters support the competitive bottleneck: consumers far more sensitive than merchants" → numbers → "underpins bottleneck." Paragraph 2: "substantial consumer credit aversion" → example → "central to welfare analysis." Paragraph 3: "reward sensitivity increasing in income" → evidence → implication. Three consecutive paragraphs with identical rhythm, each opening by announcing the finding and closing by connecting it to welfare. The repetition is an LLM tell (Contrast II.2).

**Original (paragraph 1 opening sentence):**
```
The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants.
```

**Original (paragraph 2 opening sentence):**
```
The parameters reveal substantial consumer ``credit aversion.''
```

**Original (paragraph 3 opening sentence):**
```
Reward sensitivity is increasing in income ($\alpha_y > 0$).
```

**Proposed Revision (paragraph 1 opening):**
```
Consumers are roughly ten times more sensitive to rewards than merchants are to fees.
```

**Proposed Revision (paragraph 2 opening):**
```
The median consumer would pay with debit if credit cards did not pay rewards.
```

**Proposed Revision (paragraph 3 opening):**
```
Reward sensitivity rises with income ($\alpha_y > 0$).
```

**Why better:** Each revision opens with the empirical fact rather than announcing the conclusion. The "bottleneck," "credit aversion," and "income gradient" labels can follow from the facts rather than precede them. This also breaks the three-paragraph structural monotony.

---

### Section: Network Costs (lines 63–67)

### - [ ] Lines 63–67: Network costs subsection lacks mechanism behind the identification argument

**Dimension:** Mechanism Clarity (Principle #2)

**Comment:** The subsection states that costs are recovered by inverting first-order conditions on rewards, then adds "High rewards are profitable only when networks earn positive margins from merchants, so marginal costs must be low relative to observed fees." This is a conclusion, not the identification argument. The actual moment condition --- the FOC for rewards --- is not written out. A reader cannot verify the argument from what is written.

**Original:**
```
I recover network costs by inverting first-order conditions with respect to rewards.
High rewards are profitable only when networks earn positive margins from merchants, so marginal costs must be low relative to observed fees.
```

**Proposed Revision:**
```
I recover network costs by inverting first-order conditions with respect to rewards.
At the profit-maximizing reward level, the marginal cost of funding an extra basis point of rewards equals the marginal revenue from the consumer adoption it induces, weighted by the merchant fee margin $(\tau_j - c_j)$.
Given observed rewards and estimated consumer sensitivity, this condition pins down $c_j$ for each network.
```

**Why better:** Makes the identification argument explicit --- what moment condition is inverted and what data enter it. The original version is hand-waved (Principle #3: Math Is Exact). The revision shows the logic without requiring a full equation display.

---

### Section: Goodness of Fit --- Merchant Demand (lines 209–223)

### - [ ] Lines 209–223: Merchant validation paragraph is an inventory of fit statistics

**Dimension:** Number Integration (Principle #7)

**Comment:** The paragraph reports three validation facts in sequence: OptBlue fee cut and acceptance change, model prediction of the acceptance gap shrinkage, and sales effect comparison to external experiments. The three pieces of evidence are juxtaposed without a unifying claim about what they collectively demonstrate. The final sentence (retail margin vs. macro estimates) is a fourth piece that does not connect back to the main argument.

**Original:**
```
I validate merchant parameter estimates against three types of evidence.
AmEx's 2016--2019 OptBlue program cut merchant fees by \scalarinput{amex_visa_fee_diff} bps relative to Visa (Figure \ref{fig:fees-history}), and the share of Visa merchants not accepting AmEx shrank from around $9$--\absinput{amex_visa_accept_diff} pp. to almost zero (Figure \ref{fig:merchant-amex-visa}).
...
Simulating this shock in the model, the gap shrinks by \absinput{divert_inst_optblue_price_amex_baseline} pp.
This out-of-sample prediction is the most direct test of the model's ability to predict merchant responses to fee changes, which is central to the counterfactual analysis.
...
The estimated average sales effect of \scalarpctinput{param_est_e_gamma_pass_baseline}\% is consistent with experimental evidence...
The estimated retail margin of \scalarinput{param_est_retail_margin_pass_baseline.tex}\% is similar to the aggregate margins...
```

**Proposed Revision:**
```
The most direct test of merchant parameters is the model's out-of-sample prediction for AmEx's OptBlue fee cut.
AmEx cut merchant fees by \scalarinput{amex_visa_fee_diff} bps relative to Visa between 2016 and 2019 (Figure \ref{fig:fees-history}), and the share of Visa merchants not accepting AmEx shrank from around $9$--\absinput{amex_visa_accept_diff} pp.\ to almost zero (Figure \ref{fig:merchant-amex-visa}).
Simulating this shock, the model predicts the acceptance gap shrinks by \absinput{divert_inst_optblue_price_amex_baseline} pp., close to the observed value.
The estimated average sales effect of \scalarpctinput{param_est_e_gamma_pass_baseline}\% and retail margin of \scalarinput{param_est_retail_margin_pass_baseline.tex}\% are also consistent with external evidence from randomized experiments \parencite{Higgins2022, Berg.etal2024} and macro studies of misallocation \parencite{Edmond.etal2022, Sraer.Thesmar2023a}.
```

**Why better:** Opens with the single organizing claim (out-of-sample OptBlue prediction is the key test) and integrates the other statistics as corroborating evidence rather than items on a list. The "three types of evidence" throat-clearing opener is removed.

---

## counterfactuals.tex

### Section: Welfare (lines 94–136)

### - [ ] Lines 94–109: Consumer welfare paragraph opens with claim before completing the mechanism

**Dimension:** Within-Paragraph Flow (Principles #2, #4)

**Comment:** "The gains from the credit fee cap stem from correcting excessive adoption, not from reducing market power" is the conclusion. The welfare formula and the breakdown of numbers come next, but the mechanism connecting the formula to the conclusion is not fully developed before the numbers are reported. The current flow: conclusion → formula → numbers → mechanism (last three sentences). The mechanism for why $28B accrues to consumers rather than merchants or networks is buried at the end.

**Original:**
```
The gains from the credit fee cap stem from correcting excessive adoption, not from reducing market power.
I measure consumer welfare by compensating variation:
\begin{equation}...
\end{equation}
The inner expectation computes surplus for households at a given income as a share of baseline income. The outer integral weights by baseline income to yield aggregate welfare.
Most gains accrue to consumers (\$28 billion), not merchants (\$0.4 billion).
Networks lose only \$1.5 billion---around 6\% of baseline profits.
The total gain is roughly double the \$12 billion consumer welfare gain from the CARD Act...
```

**Proposed Revision:**
```
The gains from the credit fee cap stem from correcting excessive adoption, not from reducing market power.
I measure consumer welfare by compensating variation:
\begin{equation}...
\end{equation}
The inner expectation computes surplus for households at a given income as a share of baseline income; the outer integral weights by baseline income to yield aggregate welfare.
Most gains accrue to consumers (\$28 billion) because merchant competition dissipates merchant fee savings into lower retail prices, and networks lose only \$1.5 billion --- around 6\% of baseline profits --- because higher acceptance when fees fall partly offsets the lost margin.
The total gain is roughly double the \$12 billion consumer welfare gain from the CARD Act \parencite{Agarwal.etal2015}, which suggests that regulating networks is at least as important as regulating issuers.
```

**Why better:** The "because" clauses attach mechanism to each number immediately, so the three-way welfare split is explained rather than listed. The original buries these explanations in the channel-decomposition paragraph below; the revision earns the numbers when they first appear.

---

### Section: Repealing the Durbin Amendment (lines 172–192)

### - [ ] Lines 172–180: Mechanism paragraph uses causal chain but mixes narrative with numbers mid-stream

**Dimension:** Number Integration / Within-Paragraph Flow

**Comment:** The paragraph traces a causal chain (Durbin repealed → merchant fees rise → debit rewards increase → reward-sensitive consumers switch to debit → marginal credit consumer less reward-sensitive → networks pull back on credit rewards → see-saw). This is good mechanism writing. But then it inserts two specific numbers (credit rewards fall 6 bps, credit fees fall 3.3 bps) mid-chain, interrupting the narrative before the chain completes. The inventory continuation ("Net of the debit increase, total merchant fees rise by $4.4 billion but rewards rise by only $0.5 billion") then lists two more numbers without a "because."

**Original:**
```
Repealing the Durbin Amendment moderates the rewards race.
If the debit fee cap were lifted by 25 bps, merchant fees would rise and networks would increase debit rewards.
Consumers would switch to debit, especially reward-sensitive ones.
As the marginal credit consumer becomes less reward-sensitive, networks pull back on rewards competition, triggering the see-saw principle and lowering credit merchant fees.
Credit rewards fall 6 bps and credit fees fall 3.3 bps as credit networks pull back.
Net of the debit increase, total merchant fees rise by \$4.4 billion but rewards rise by only \$0.5 billion, reflecting substitution toward lower-reward debit.
```

**Proposed Revision:**
```
Repealing the Durbin Amendment moderates the rewards race.
If the debit fee cap were lifted by 25 bps, networks would increase debit rewards, drawing reward-sensitive consumers away from credit cards.
As the marginal credit consumer becomes less reward-sensitive, networks pull back on credit rewards competition, triggering the see-saw principle: credit rewards fall 6 bps and credit fees fall 3.3 bps.
Net of the debit increase, total merchant fees rise by \$4.4 billion but rewards rise by only \$0.5 billion, because the substitution toward lower-reward debit breaks the tight link between fees and rewards that exists under credit competition alone.
```

**Why better:** The numbers (6 bps, 3.3 bps) are now placed immediately after the mechanism that produces them, as the see-saw's quantitative result. The final sentence adds a "because" that explains why fees and rewards diverge, turning the inventory into an argument.

---

### Section: Consumer Multi-Homing and Dual Routing (lines 247–257)

### - [ ] Lines 247–257: Dual routing intuition paragraph restates model notation in prose

**Dimension:** Math Precision / Economy (Principles #3, #8)

**Comment:** "A merchant's fee cost from accepting card $j$ depends on all consumers who use it, but the incremental sales gain comes only from single-homers" is a prose restatement of the acceptance condition already displayed as Equation (8) in the model section. The paragraph then adds the legal observation about the secondary network restriction. These are two separate points. The model restatement adds length without adding insight for a reader who has read the model.

**Original:**
```
The intuition for these effects follows from the merchant acceptance condition in Section \ref{subsubsec:model-merch-accept}.
A merchant's fee cost from accepting card $j$ depends on all consumers who use it, but the incremental sales gain comes only from single-homers who would otherwise pay cash.
When consumers single-home on one credit network, merchants must accept that network to capture those sales---what trial testimony in Ohio v.\ American Express called ``cardholder insistence'' \parencite{Conrath2014}.
When a consumer carries credit cards from multiple networks, the merchant can decline the expensive network's card without losing the sale---the consumer simply pays with the cheaper alternative.
The incremental sales gain from accepting the expensive network shrinks.
Networks must then compete on merchant fees rather than relying on consumer lock-in to extract rents from the merchant side.
```

**Proposed Revision:**
```
The mechanism follows from the merchant acceptance condition: fee cost covers all consumers who use a card, but the incremental sales gain comes only from single-homers who cannot substitute.
When consumers single-home, merchants cannot drop expensive networks without losing sales --- what Ohio v.\ American Express testimony called ``cardholder insistence'' \parencite{Conrath2014}.
When consumers multi-home, merchants can route payments to cheaper networks, so the incremental value of accepting the expensive network falls.
Networks must then compete on merchant fees rather than relying on consumer lock-in.
```

**Why better:** Tighter. Cuts the verbatim restatement of the model's intuition paragraphs. The four sentences now carry the same argument in four steps without prose padding.

---

## conclusion.tex

### - [ ] Lines 9–12: Ohio v. AmEx paragraph announces what the paper provides before demonstrating it

**Dimension:** Throat-Clearing (Principle #8)

**Comment:** "This paper provides a structural framework for carrying out that analysis" is meta-commentary announcing the paper's contribution rather than demonstrating it. The following sentence then makes the actual point. The announcing sentence can be deleted.

**Original:**
```
The Supreme Court's 2018 decision in \emph{Ohio v.\ American Express} held that plaintiffs must show net harm to the two-sided market as a whole, requiring evidence on both sides of the platform.
This paper provides a structural framework for carrying out that analysis, linking consumer rewards, merchant fees, and retail prices within a single equilibrium model of a two-sided card market.
Applied to credit card merchant fees, the framework shows that a modest cap reduces both fees and rewards yet raises total welfare by \$27 billion per year through more efficient payment choice.
```

**Proposed Revision:**
```
The Supreme Court's 2018 decision in \emph{Ohio v.\ American Express} held that plaintiffs must show net harm to the two-sided market as a whole, requiring evidence on both sides of the platform.
A structural model linking consumer rewards, merchant fees, and retail prices within a single equilibrium satisfies this standard: a modest cap on credit card merchant fees reduces both fees and rewards yet raises total welfare by \$27 billion per year through more efficient payment choice.
```

**Why better:** Merges the two sentences to remove the self-congratulatory "this paper provides" framing. The contribution is demonstrated (the model links X, Y, Z; the cap raises welfare) rather than announced.

---

### - [ ] Lines 21–31: Conclusion paragraph conflates two distinct policy arguments in one block

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph begins with the Walmart antitrust case (market power diagnosis), traces the merger mechanism (rewards cut, credit collapses, aggregate fees fall), draws the total welfare result, and then pivots to Buy Now Pay Later as a contemporary application. These are three distinct moves: (1) challenging the market power diagnosis, (2) the merger mechanism, (3) an extension to a new market. The BNPL observation in particular introduces a new topic (analogous dynamics in a different product) that belongs in a separate paragraph.

**Original:**
```
The merger counterfactual challenges a second piece of conventional wisdom: that high merchant fees reflect too little competition.
The Walmart class action against Visa and MC alleged that the networks collectively set interchange at supracompetitive levels \parencite{Constantine2012}.
A monopoly network raises per-transaction fees, which is the harm that antitrust cases have targeted.
Yet aggregate merchant costs fall because the monopolist has no rival to outbid for cardholders, so it cuts rewards and credit use declines.
The merger increases total welfare by \$15 billion
because eliminating rewards competition reduces the overuse of credit cards.
Antitrust typically targets harms from low output.
Under price coherence, the harm is excessive credit card adoption.
Buy Now, Pay Later is the latest technology to woo consumers with generous terms funded by high merchant fees \parencite{Berg.etal2024}.
Whether these services raise welfare depends on whether they shift competition toward merchants or simply open another front in the war for cardholders.
```

**Proposed Revision:**
```
The merger counterfactual challenges a second piece of conventional wisdom: that high merchant fees reflect too little competition.
The Walmart class action alleged that networks set interchange at supracompetitive levels \parencite{Constantine2012}.
A monopoly network does raise per-transaction fees --- the harm antitrust cases target --- but aggregate merchant costs fall because the monopolist cuts rewards and credit use declines.
The merger increases total welfare by \$15 billion because eliminating rewards competition reduces the overuse of credit cards.
Antitrust typically targets harms from low output; under price coherence, the harm is excessive credit card adoption.

Buy Now, Pay Later is the latest technology to woo consumers with generous terms funded by high merchant fees \parencite{Berg.etal2024}.
Whether these services raise welfare depends on whether they shift competition toward merchants or simply open another front in the war for cardholders.
```

**Why better:** Splits the BNPL observation into its own paragraph. Within the merger paragraph, consolidates the per-transaction vs. aggregate fees contrast into a single sentence using the "does X --- but Y" structure that earns the result rather than listing it.

---

## appendix_reduced.tex

### Section: Mechanism subsection (lines 144–148)

### - [ ] Lines 144–148: Three-mechanism intro paragraph enumerates without tension

**Dimension:** Motivation and Tension / Number Integration

**Comment:** The subsection opens by listing three candidate mechanisms before ruling two out. The structure is "(1) bank switching, (2) credit pull, (3) rewards push" --- then the subsequent paragraphs rule out 1 and 2 and confirm 3. This is proper sequencing at the section level, but the opening paragraph has no tension: it merely announces what will be tested. A stronger opening would state the identification challenge first.

**Original:**
```
The debit volume decline could reflect three mechanisms: bank switching by consumers fleeing Durbin-exposed institutions, a pull toward credit from improved large-bank rewards, or within-bank substitution driven by loss of debit rewards.
Banks that ended debit rewards lost volumes comparable to the full treatment effect.
Deposits did not shift from large to small banks, ruling out bank switching.
And credit card rewards did not differentially improve at large banks, ruling out a pull toward credit at large banks.
```

**Proposed Revision:**
```
The treatment-control design identifies the effect of losing debit promotion, but three alternative explanations threaten the interpretation: consumers may have switched banks, large banks may have improved credit rewards, or the loss of debit rewards specifically may account for the decline.
The data rule out the first two.
Deposits did not shift from large to small banks, and credit card reward receipt rates did not differentially improve at large banks after Durbin.
The volume decline is specific to banks that ended debit rewards, consistent with the rewards channel.
```

**Why better:** Opens with the identification threat (alternative explanations) rather than listing mechanisms. The ruling-out proceeds from the threat, making the argument a concession-response structure rather than a table of contents.

---

### Section: Hierarchical Card Acceptance (lines 378–396)

### - [ ] Lines 381–385: Paragraph restates the finding before earning it

**Dimension:** Within-Paragraph Flow (Principle #5)

**Comment:** The first paragraph of the Yelp section states the finding ("acceptance patterns were hierarchical: merchants add payment methods sequentially") and then explains what the data show. The finding is announced twice --- once in the third sentence of this paragraph and again in the last sentence of the next.

**Original:**
```
This section uses Yelp reviews to show that when AmEx and Visa charged different fees, acceptance patterns were hierarchical.
Merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network at the expense of another.
This provides evidence of the multi-homing fact.
```

**Proposed Revision:**
```
Aggregate acceptance counts show that AmEx and Visa had similar merchant counts by 2019, but cannot distinguish multi-homing from specialization.
This section uses Yelp reviews from the period 2010--2018 to show that acceptance was hierarchical when AmEx and Visa charged different fees: merchants added payment methods sequentially rather than specializing in one network.
```

**Why better:** Opens with the identification gap (aggregate counts can't distinguish multi-homing from specialization) before presenting the Yelp evidence that closes it. The "This provides evidence of the multi-homing fact" sentence is deleted as throat-clearing.

---

## appendix_robustness.tex

### Section: No Merchant Fee Pass-Through (lines 13–19)

### - [ ] Lines 13–19: Robustness section overview paragraph announces results before mechanism

**Dimension:** Motivation and Tension (Principle #5)

**Comment:** The opening paragraph of the no-passthrough section states all four results (sign preserved, small counterfactuals robust, credit cap and monopoly shrink, distributional story reverses) before any mechanism or model description. A reader who sees "$27B drops to $17B" before understanding why pass-through matters cannot evaluate the importance of the finding.

**Original:**
```
The main counterfactuals assume merchants pass merchant-fee changes into retail prices one-for-one.
Without pass-through, fee savings accrue to merchants instead of consumers.
Total welfare gains keep their sign under every policy.
Small counterfactuals are nearly unchanged, while credit fee cap and monopoly gains shrink by a third or more.
The credit fee cap's distributional story also reverses, with merchants gaining at consumers' expense.
```

**Proposed Revision:**
```
The main counterfactuals assume merchants pass merchant-fee changes into retail prices one-for-one, so lower merchant fees benefit consumers through lower retail prices.
Without pass-through, fee savings accrue to merchants rather than passing to consumers.
This matters most for policies with large net fee changes: credit fee cap welfare gains fall to \$17B from \$27B and monopoly gains to \$8B from \$15B, while counterfactuals with small fee changes are nearly unchanged.
The distributional story also reverses under the credit fee cap, with merchants gaining at consumers' expense.
```

**Why better:** States the mechanism (pass-through → consumer vs. merchant incidence) before the results, so the reader understands what the robustness check tests before seeing the numbers.

---

## appendix_sorting.tex

### Section: Structure of Analysis (lines 23–29)

### - [ ] Lines 23–29: "Three steps" paragraph is pure road-mapping

**Dimension:** Economy / Throat-Clearing (Principle #8)

**Comment:** The entire paragraph announces what the analysis does in three steps. It contains no new information beyond what the subsection headings already communicate. It is a classic throat-clearing paragraph: "The analysis has three steps. First... Second... Third."

**Original:**
```
The analysis has three steps.
First, we measure payment share distributions across stores in Homescan and MRI, computing both unweighted and revenue-weighted covariance matrices.
Second, we derive a sufficient statistic linking sorting to redistribution magnitude, valid to first order under local fee changes.
Third, we apply this statistic and show sorting attenuates baseline redistribution by at most 10\%.
```

**Proposed Revision:**
Delete this paragraph. The three steps are described in the subsequent subsections ("Measuring Payment Shares," "Sufficient Statistic," etc.). The paragraph adds no information not available from the section structure.

**Why better:** Removes pure road-mapping. Every sentence announces what will happen rather than doing anything.

---

## appendix_credit_debit.tex

### Section: Opening (lines 8–30)

### - [ ] Lines 10–30: Section intro conflates the case-for and the case-against into one paragraph

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The opening two paragraphs of the appendix cover: (1) the decision to show alternatives despite evidence favoring segmentation, (2) what Section X covers, (3) what Section Y covers, (4) what Section Z covers, (5) what Section W covers. This is five section-level road maps compressed into two paragraphs. Each subsection reference adds no information that the subsection itself will not provide.

**Original:**
```
Section~\ref{subsec:oa-credit-debit-evidence} weighs the direct evidence.
Antitrust testimony and consumer surveys describe credit and debit as distinct products at the point of sale, while the Discover rewards experiment shows some substitution at the margin.

Section~\ref{subsubsec:oa-credit-debit-general} generalizes the model to allow substitution and derives two equilibrium predictions: credit acceptance depending on credit-debit multi-homing rates, and debit fee caps disciplining credit fees.
\emph{Ohio v.\ AmEx} testimony contradicts the first, and the lack of an effect of the Durbin Amendment on credit interchange contradicts the second.

Section~\ref{subsec:oa-half-kappa} estimates a specification that allows point-of-sale substitution and incremental debit sales relative to cash.
...
Section~\ref{subsec:oa-extension} estimates a specification that treats debit as generating no incremental sales relative to cash.
...
Section~\ref{subsec:oa-usage-microfoundation} closes with a microfoundation...
```

**Proposed Revision:**
```
The key empirical test of the segmentation assumption is whether credit-debit substitution generates counterfactual predictions contradicted by the data.
It does.
Under substitution, credit acceptance should depend on credit-debit multi-homing rates and debit fee caps should discipline credit fees.
\emph{Ohio v.\ AmEx} testimony contradicts the first, and the Durbin Amendment halved debit interchange without moving credit interchange.
Two alternative specifications that relax segmentation are estimated in Sections~\ref{subsec:oa-half-kappa} and~\ref{subsec:oa-extension}; welfare results for the credit fee cap and merger are similar across all three.
Section~\ref{subsec:oa-usage-microfoundation} provides a microfoundation consistent with segmentation at usage but substitution at adoption.
```

**Why better:** Opens with the empirical test (the strongest argument for segmentation) rather than a contents listing. Reduces five road-map paragraphs to one paragraph that makes an argument, then a single sentence pointing to the alternatives.

---

## model.tex (additional)

### Section: Price Coherence paragraph (lines 333–342)

### - [ ] Lines 333–342: Price coherence paragraph ends on a dangling explanation

**Dimension:** Within-Paragraph Flow (Principle #10)

**Comment:** The paragraph opens by asserting price coherence, says the friction causes fees and rewards to distort choices, defers theory to the appendix, and then reports the 5% figure and explains *why* surcharging is rare for high-acceptance merchants. The last two sentences are the actual argument but feel appended: they arrive after the appendix reference as if the paragraph had already ended. The mechanism (why merchants with the strongest gains deter surcharging) is the interesting claim and should either be the focus of this paragraph or placed in the appendix.

**Original:**
```
Merchants charge the same price regardless of payment method (price coherence).
This friction causes merchant fees and rewards to distort consumer payment choices.
Online Appendix \ref{sec:oa-price-coherence} discusses the history and theory.
Only about 5\% of U.S. transactions feature payment-specific pricing despite legal permission \parencite{Stavins2018}.
Merchants with the strongest gains from card acceptance are those whose consumers value card payments highly and respond little to surcharges, so even small menu costs deter surcharging.
```

**Proposed Revision:**
```
Merchants charge the same price regardless of payment method (price coherence), so fees distort consumer payment choices rather than passing directly to card users.
Only about 5\% of U.S. transactions feature payment-specific pricing despite legal permission \parencite{Stavins2018}.
Merchants with the strongest incentive to accept cards --- those whose consumers value card payments most --- are also those whose consumers respond least to surcharges, so even small menu costs deter differential pricing at the margin.
Online Appendix \ref{sec:oa-price-coherence} develops the theory.
```

**Why better:** Attaches the mechanism ("why distortion") directly to the price-coherence definition. The interesting empirical-theoretic argument (selection into acceptance predicts low surcharging incentive) is now the third sentence instead of an afterthought. The appendix reference moves to the end, where it belongs.

---

## Section Grades

| Section | Grade | Primary Issue |
|---------|-------|---------------|
| intro.tex | B+ | Second paragraph overloaded; monopoly numbers inventorial |
| reducedform.tex | A- | Opening announces rather than motivates; multi-homing pair-of-hypotheticals paragraph underdeveloped |
| model.tex | B+ | Credit-debit concession-response paragraph misordered; price coherence paragraph ends on dangling mechanism |
| estimation.tex | B | Network costs identification hand-waved in prose; three consecutive paragraphs with identical rhythm |
| counterfactuals.tex | B+ | Consumer welfare paragraph front-loads conclusion; Durbin mechanism interrupted by mid-stream numbers |
| conclusion.tex | B+ | BNPL observation mixed into merger paragraph; Ohio v. AmEx meta-commentary opener |
| appendix_reduced.tex | B+ | Mechanism intro enumerates rather than frames threat; Yelp section restates finding before earning it |
| appendix_robustness.tex | B | Results-first opening before mechanism in no-passthrough section |
| appendix_sorting.tex | B- | Pure road-map paragraph with no substantive content |
| appendix_credit_debit.tex | B | Five road-map paragraphs replace the argument they should make |
| appendix_model.tex | A | Derivations precise and clean; no prose padding |
| appendix_estimation.tex | A- | Identification arguments match math; slight over-explanation in bootstrap paragraph |
