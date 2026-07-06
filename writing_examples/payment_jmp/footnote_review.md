# Footnote Review

Every footnote in the compiled paper (main.tex), where it attaches, and whether it reads well in context. Excludes response letter and commented-out footnotes.

---

## Introduction (intro.tex)

### FN 1 — Price coherence (line 16)
**Attaches to:** "…a phenomenon known as 'price coherence' (Frankel 1998, Stavins 2018)."
**Text:** "This occurs even though cash discounts and card surcharges are largely legal. I explore surcharging both theoretically and empirically in Online Appendix [ref]."
**Verdict:** Fine. Short, gives the natural "but what about surcharging?" pointer.

### FN 2 — Choice of fee cap (line 56)
**Attaches to:** "I simulate a counterfactual in which credit card merchant fees are capped at 120 basis points, roughly half their current level."
**Text:** "Online Appendix [ref] evaluates alternative fee caps. The 120 bps cap achieves 93% of the welfare gains from a 30 bps cap modeled after the tourist test of Rochet and Tirole (2011) and 77% of a Ramsey planner's gains."
**Verdict:** Fine after today's edit. Previously brought up Rochet-Tirole's competitive intermediary assumption unprompted; now simply points to appendix with specific numbers.

### FN 3 — Credit aversion definition (line 63)
**Attaches to:** "…which I describe as 'credit aversion.'"
**Text:** "Credit aversion can reflect the hassle of managing another account, the temptation to overspend, or a preference to avoid debt. Online Appendix [ref] discusses survey evidence on credit aversion."
**Verdict:** Fine. Defines the term on first use and points to evidence.

---

## Data (data.tex)

### FN 4 — DCPC acceptance rates (line 64)
**Attaches to:** "Cards are accepted for around 95% of transactions."
**Text:** "The diary and survey share a common panel of respondents. For each transaction, the respondent records which payment methods the merchant accepted, so the resulting acceptance rates are sales-weighted across merchants visited. Online Appendix Table [ref] compares DCPC acceptance rates to Yelp business attributes by sector; the two sources agree closely in aggregate."
**Verdict:** Fine. Clarifies measurement and validates with external data.

---

## Reduced Form (reducedform.tex)

### FN 5 — Durbin control group (line 16, label: fn:durbin-control-group)
**Attaches to:** "I estimate the effect on payment volumes by comparing debit card volumes at large and small issuers."
**Text:** "Small issuers are an imperfect control group because they may have been indirectly affected by the Durbin Amendment through competitive spillovers. However, such spillovers are likely to attenuate, rather than amplify, the estimated treatment effect. If small issuers also reduced debit promotion in response to competitive pressure from large issuers shifting toward credit, the difference between treated and control groups would understate the true effect of losing debit interchange revenue."
**Verdict:** Fine but long. Three sentences explaining one direction of bias. Could tighten the last sentence—the logic is clear from "attenuate, rather than amplify."

### FN 6 — Signature vs. total debit (line 39)
**Attaches to:** "Weakening issuers' incentives to promote debit led to around a 30% decline in signature debit volumes."
**Text:** "I focus on signature debit because it has the highest coverage in the Nilson Report (Appendix [ref]). Online Appendix Table [ref] shows a roughly 20% decline in total debit volumes, though this estimate is weaker due to more limited early-sample coverage."
**Verdict:** Fine. Justifies the choice of outcome variable and reports the alternative.

### FN 7 — Staggered DID not a concern (line 81)
**Attaches to:** "The coefficients of interest, γ_k, capture the dynamic effects of credit card acceptance on sales to credit card users."
**Text:** "Because the treatment groups are very small relative to the large control group, and treated stores in one event are excluded from the control group of another, the staggered-treatment complications addressed by recent difference-in-differences estimators do not arise here."
**Verdict:** Fine. Preempts the obvious methodological question.

### FN 8 — Why Poisson not log (line 82)
**Attaches to:** "I use a Poisson specification following Cohn et al. (2022)…"
**Text:** "A log transform of dollar spending is not feasible here because many household-retailer-period observations have zero spending; taking logs would require either dropping zeros, which eliminates the extensive margin response, or adding an arbitrary constant, either of which biases the estimate."
**Verdict:** Fine. Standard methodological justification.

### FN 9 — Warehouse store exclusion (line 88)
**Attaches to:** "I verified that no such campaigns accompanied the events I study."
**Text:** "I excluded events involving warehouse stores for this reason. Changes in which credit cards a warehouse store accepts are often accompanied by co-branded card campaigns designed to shift consumers' card holdings along with the acceptance change, a coordinated shift rather than a change in merchant acceptance holding fixed consumer payment behavior."
**Verdict:** Fine. Explains a sample restriction that supports identification.

### FN 10 — Debit network grouping (line 174)
**Attaches to:** "I define 'carrying' a card based on observed usage…"
**Text:** "Although Visa and MC each operate separate debit networks, almost no consumers multi-home across debit networks (Figure [ref]), so grouping all debit does not change estimates of credit card multihoming. The structural model in Section [ref] retains distinct Visa Debit and MC Debit products on the fee side while using this same aggregation for consumer adoption moments."
**Verdict:** Fine. Bridges the reduced-form aggregation to the structural model.

### FN 11 — Top-two spending concentration (line 175, label: foot:homescan-merch-accept)
**Attaches to:** "I characterize household-years by their primary (most-used) and secondary (second-most-used) networks."
**Text:** "Online Appendix Table [ref] shows that consumers put around 95% of their card spending on two networks. These usage shares reflect consumer preferences rather than merchant acceptance policies, since most Homescan merchants are large and accept all major payment methods. I exclude merchants with a particularly low share of transactions from any network (Appendix [ref])."
**Verdict:** Fine. Justifies the two-card characterization.

### FN 12 — Conservative multi-homing measure (line 183)
**Attaches to:** "…while AmEx users have the highest at around [X]%."
**Text:** "These measures are conservative because even a consumer who spends 99% on one network and 1% on another is counted as multi-homing."
**Verdict:** Fine. Short, useful clarification.

---

## Model (model.tex)

### FN 13 — Transaction-level switching (line 47, label: foot:reward-pos-switch)
**Attaches to:** "With probability 1−π, the roles reverse."
**Text:** "Consumers may switch between the two cards due to transaction-level shocks that I do not model. For example, a credit card consumer may use the card with the best reward for the merchant."
**Verdict:** Fine. Motivates the stochastic switching assumption.

### FN 14 — Explicit probability derivation (line 65)
**Attaches to:** "Define π^w_{M,0} = 0 for all w."
**Text:** "Online Appendix [ref] explicitly works out these probabilities in a simplified model with two credit cards and one debit card."
**Verdict:** Fine. Standard appendix pointer.

### FN 15 — χ^{lm} indexing (line 210)
**Attaches to:** "…χ^{lm}_i are consumer-specific interaction terms capturing within-wallet complementarity or substitution."
**Text:** "l and m index the two characteristics of the primary and secondary card: whether it is an inside good and whether it is credit. Thus χ^{12} measures the interaction between any primary card and a credit secondary; χ^{21} measures the interaction between a credit primary and any secondary; χ^{22} measures an additional interaction specific to credit in both positions."
**Verdict:** Fine. Necessary notation clarification; reader would be lost without it.

### FN 16 — Credit-debit segmentation compatible with reward-sensitive adoption (line 299)
**Attaches to:** "…because the two types serve non-overlapping transaction pools."
**Text:** "This is compatible with reward-sensitive adoption: consumers may prefer credit for some transactions and debit for others, so adoption utility, which averages over all future transactions, can still respond to reward changes (Online Appendix [ref])."
**Verdict:** Fine. Preempts the objection that segmentation contradicts reward sensitivity.

---

## Estimation (estimation.tex)

### FN 17 — Durbin and checking fees (line 31, label: foot:durbin-icg-vs-rewards)
**Attaches to:** "I model the Durbin shock as a 25 bps decline in rewards…"
**Text:** "Banks also absorbed the loss through higher checking account fees (Kay et al. 2018, Mukharlyamov and Sarin 2025). I ignore the increase in checking account fees since they do not influence the relative costs and benefits of different payment methods."
**Verdict:** Fine. Explains a modeling simplification with clear reasoning.

### FN 18 — χ^{11} normalization (line 62)
**Attaches to:** "…χ^{22} captures the cost of managing two credit accounts."
**Text:** "The fourth interaction χ^{11} (any-primary, any-secondary) is normalized to zero: the only wallet where it would be separately identified is (debit,debit), which is negligible in the data."
**Verdict:** Fine. Technical but necessary for readers following the identification.

### FN 19 — Adoption utility vs. rewards (line 154)
**Attaches to:** "A 1-bp increase in Visa credit rewards"
**Text:** "I model a 1-bp increase in adoption utility. Given that merchant acceptance largely does not respond to changes in rewards when networks charge symmetric fees, a 1-bp increase in adoption utility is largely equivalent to an increase in rewards."
**Verdict: FLAG.** This footnote corrects the main text mid-sentence. The text says "rewards" and the footnote immediately says "actually, I model adoption utility." Consider rewriting the main text to say "adoption utility" with a parenthetical noting the equivalence, rather than saying one thing and correcting it in a footnote.

### FN 20 — Credit aversion formula (line 169)
**Attaches to:** "A consumer with median income is indifferent between a Visa debit card and a Visa credit card paying [X]% in rewards."
**Text:** "The penalty can be computed as ω × (Ξ^{V Debit} − Ξ^{V Credit})."
**Verdict: FLAG.** This footnote drops a formula with no context on what the terms mean. A reader encountering this for the first time gets no help. Either define the terms briefly ("where ω is the primary-card weight and Ξ^j is mean unobserved utility") or cut it — the formula adds little for readers who don't already know the notation, and those who do can derive it.

### FN 21 — AmEx acceptance validation (line 220)
**Attaches to:** "…and the share of Visa merchants not accepting AmEx shrank from around 9–[X] pp. to almost zero."
**Text:** "AmEx's 2019 annual report confirms its U.S. network went from covering 90% to 99% of card spending during this period. The count of merchants (Nilson 2020d) shows a larger reduction in the acceptance gap."
**Verdict:** Fine. External validation of the acceptance fact.

### FN 22 — Semi-elasticity nonlinearity (line 226)
**Attaches to:** "This out-of-sample prediction is the most direct test of the model's ability to predict merchant responses to fee changes…"
**Text:** "The semi-elasticity linearizes the acceptance cutoff at near-universal acceptance. The OptBlue fee reduction is large enough that the cutoff responds nonlinearly, so the per-basis-point acceptance change differs from the linearized estimate."
**Verdict:** Fine. Explains why the model prediction and the linearized estimate may differ.

---

## Counterfactuals (counterfactuals.tex)

### FN 23 — Fixed merchant types (line 7)
**Attaches to:** "All counterfactuals fix consumers' preferences β_i, baseline income y, and merchants' sales benefits to card consumers γ."
**Text:** "Although merchants' types γ are fixed, their incentives to accept cards can change because the effect of card acceptance on total sales depends on γ and the share of consumers using each card."
**Verdict:** Fine. Important clarification — "fixed types" doesn't mean "fixed acceptance."

### FN 24 — Welfare decomposition explanation (line 133)
**Attaches to:** "…but the reduced credit aversion is a real social benefit."
**Text:** "Although the first row is where payment choices shift most, total welfare there rises by only $14 billion, around half the overall gain. The first row conflates two offsetting forces: a large gain from reduced credit aversion and a loss from reduced consumption when rewards fall but retail prices remain fixed. Positive retail markups mean that reducing total consumption increases deadweight loss. Merchant price cuts in the second row reverse the consumption distortion, so the full welfare gain of reduced credit aversion materializes only across both rows."
**Verdict: FLAG.** This is substantive analysis that explains a key decomposition result. Four sentences covering two offsetting forces, deadweight loss from markups, and a cross-row interaction. This belongs in the main text, not a footnote. A reader who skips footnotes will be confused by why the first-row welfare is "only" $14B when the total is $27B.

### FN 25 — Durbin repeal modeling (line 167)
**Attaches to:** "I study repealing the Durbin Amendment by raising the cap on debit card fees by 25 bps."
**Text:** "As discussed in Footnote [ref], only around 25 of the 75 basis point interchange decline flowed through to rewards. I model the repeal as lifting the cap by 25 bps to match the empirically realistic effect on payment choice (Hayashi 2012)."
**Verdict:** Fine. Cross-references the estimation footnote and justifies the modeling choice.

### FN 26 — Adoption vs. usage preferences (line 279)
**Attaches to:** "Survey evidence documents concrete motives, including budget control, debt aversion, and account-management hassle…"
**Text:** "This is still compatible with consumers who have adopted both debit and credit having strong preferences for credit for particular transactions (e.g., large purchases or travel). Online Appendix [ref] formalizes this distinction between preferences at the adoption stage and at the transaction stage."
**Verdict:** Fine. Preempts a natural objection.

---

## Online Appendix: Reduced Form (appendix_reduced.tex)

### FN 27 — Discover cardholder classification (line 221)
**Attaches to:** "I restrict to Discover cardholders"
**Text:** "Classified by number of card trips with spending as a tiebreaker; see Appendix [ref]."
**Verdict:** Fine. Brief data-construction detail.

---

## Online Appendix: Price Coherence (appendix_surcharging.tex)

### FN 28 — Discounts vs. surcharges under shrouding (line 23)
**Attaches to:** "Cash discounts have long been legal in the U.S., but card surcharges became permitted only gradually."
**Text:** "Under full information, discounts and surcharges are the same. But if shrouded, cash discounts are giveaways while surcharges are add-on prices (Bourguignon et al. 2019)."
**Verdict:** Fine. Explains the economic distinction motivating the legal difference.

### FN 29 — Network-level surcharge rules (line 26)
**Attaches to:** "A 2013 settlement between Visa, Mastercard, and the DOJ removed network-level no-surcharge rules…"
**Text:** "Visa allowed multi-state merchants to surcharge in states that permitted it (Visa 2013). American Express and Discover relaxed their no-surcharge rules to match (Merchant 2016)."
**Verdict:** Fine. Institutional detail appropriate for appendix.

### FN 30 — NY/Maine disclosure rules (line 28)
**Attaches to:** "…though disclosure rules in New York and Maine make it impractical."
**Text:** "In New York and Maine, retailers must disclose both the credit card price and cash price in dollar amounts. In New York, this rule ensures consumers 'should not have to do math to figure out whether they are paying the surcharge' (Westchester 2019)."
**Verdict:** Fine. Good illustrative detail for the appendix.

---

## Summary of Flags

| # | Location | Issue |
|---|----------|-------|
| 19 | estimation.tex:154 | Main text says "rewards" then footnote immediately corrects to "adoption utility." Rewrite main text instead. |
| 20 | estimation.tex:169 | Drops formula without defining terms. Either add brief definitions or cut. |
| 24 | counterfactuals.tex:133 | Four-sentence substantive analysis about welfare decomposition buried in a footnote. Promote to main text. |
