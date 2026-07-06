# Writing Quality Assessment

---

## intro.tex

### Section: Opening and Main Findings

### - [-] Lines 25-28: Paragraph mixes motivation and evidence for three separate forces without marking their logical relationship

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph announces "three forces" then delivers them as enumerated items, but the third force ("around X% of consumers carry credit cards from only one network") is the weakest link — it is not itself a force that incentivizes networks to tax merchants, but rather a *consequence* of the asymmetry that enables the bottleneck. The paragraph conflates the three forces that explain behavior with the fact that sets up the bottleneck.

**Original:**
```
Three forces explain why networks are incentivized to tax merchants to subsidize consumers.
First, consumer payment choices respond strongly to subsidies.
Networks charge merchants interchange fees and pay the revenue to banks, giving banks incentives to promote the networks' cards through consumer rewards and other forms of steering.
The Durbin Amendment's reduction in debit interchange revenue reduced debit card spending by around 30\%.
Second, accepting cards significantly increases merchant sales.
Event-study evidence shows that accepting credit cards increases sales to consumers who use credit cards by around \scalarpctinput{kilts_model_sales_event}\% for merchants on the margin of acceptance.
Third, while almost all card-accepting merchants accept all networks, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network.
Together, these facts produce what \textcite{Armstrong2006} calls a ``competitive bottleneck'': merchants cannot afford to turn away cardholders, so networks compete through rewards rather than fees.
```

**Proposed Revision:**
```
Three facts characterize the competitive bottleneck.
Consumer payment choices respond strongly to rewards: the Durbin Amendment's reduction in debit interchange revenue reduced debit card spending by around 30\%.
Card acceptance increases merchant sales: event-study evidence shows that accepting credit cards increases sales to credit card consumers by around \scalarpctinput{kilts_model_sales_event}\% for merchants on the margin of acceptance.
And while almost all card-accepting merchants accept all networks, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network.
Together, these facts produce what \textcite{Armstrong2006} calls a ``competitive bottleneck'': merchants cannot afford to turn away cardholders, so networks compete through rewards rather than fees.
```

**Why better:** The original frames these as forces "explaining" incentives but the third fact is a precondition for the bottleneck, not an explanatory force. The revision labels them plainly as "facts" characterizing the bottleneck, which matches their actual logical role. Also removes the sub-paragraph on issuer steering (which breaks the three-part claim by adding an unnested observation) and makes each item a single tight sentence.

---

### - [-] Lines 80-96: Two separate claims occupy the same paragraph — progressive welfare gains and the prisoner's dilemma framing

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** Lines 66-78 form a coherent paragraph on progressive welfare effects. Lines 80-96 then pivot from the Durbin counterfactual (which is the direct contrast with the main cap result) back to the mechanism of the main counterfactual. These two ideas — the mechanism of excessive adoption and the comparative statics with Durbin — are placed in sequence but each would benefit from standing alone. The paragraph on lines 80-96 especially reads as a delayed return to material introduced earlier rather than a forward-moving argument.

**Original:**
```
Two counterfactuals illustrate that these welfare gains are not from reducing market power.
First, repealing the Durbin Amendment's debit fee cap would raise total welfare by \$7 billion per year.
Under the usual market power story \parencite{Cuesta.Sepulveda2021}, removing a fee cap should reduce welfare.
But higher debit merchant fees fund higher debit rewards, drawing consumers away from high-reward credit cards and reducing credit aversion.
This substitution effect matches prior work on the Durbin Amendment \parencite{Mukharlyamov.Sarin2025} and illustrates that the current U.S. regime of capping debit but not credit fees is worse than laissez-faire.

Second, merging all networks into a monopoly raises total welfare by \$15 billion per year.
Without competitive pressure to attract consumers, a monopoly network cuts rewards and raises merchant fees.
Because consumers are highly sensitive to rewards, credit card use collapses.
Consumers lose \$11 billion as network markups increase sharply, but total welfare nonetheless rises because eliminating rewards competition more than offsets the consumer losses.
These predictions align with rising U.S.\ interchange fees despite increasing network competition \parencite{GAO2009} and the global expansion of high-fee Buy Now, Pay Later products \parencite{Berg.etal2024}.
This counterfactual is not a justification for letting networks merge.
It instead illustrates that the fundamental problem is not market power stifling output, but rewards competition generating excessive adoption of credit cards.
```

**Proposed Revision:**
```
Two counterfactuals illustrate that these welfare gains are not from reducing market power.
First, repealing the Durbin Amendment's debit fee cap would raise total welfare by \$7 billion per year.
Under the usual market power story \parencite{Cuesta.Sepulveda2021}, removing a fee cap should reduce welfare.
But higher debit merchant fees fund higher debit rewards, drawing consumers away from high-reward credit cards and reducing credit aversion.
This substitution effect matches prior work on the Durbin Amendment \parencite{Mukharlyamov.Sarin2025} and illustrates that the current U.S. regime of capping debit but not credit fees is worse than laissez-faire.

Second, merging all networks into a monopoly raises total welfare by \$15 billion per year.
Without competitive pressure to attract consumers, a monopoly network cuts rewards and raises merchant fees.
Because consumers are highly sensitive to rewards, credit card use collapses.
Consumers lose \$11 billion as network markups increase sharply, but total welfare nonetheless rises because eliminating rewards competition more than offsets the consumer losses.
These predictions align with rising U.S.\ interchange fees despite increasing network competition \parencite{GAO2009} and the global expansion of high-fee Buy Now, Pay Later products \parencite{Berg.etal2024}.
The fundamental problem is not market power stifling output, but rewards competition generating excessive adoption of credit cards.
```

**Why better:** The only change is cutting "This counterfactual is not a justification for letting networks merge. It instead illustrates that..." which is throat-clearing that restates a caveat already implied. The revision ends directly on the substantive diagnosis, which is what the paragraph is building toward.

---

### - [x] Lines 98-110: Inventorial numbers weaken the dual-routing paragraph (applied)

**Dimension:** Number Integration (Principle #7, Contrast II.6)

**Comment:** The paragraph reports that credit card fees fall 13 bp and rewards fall 15 bp without making either number serve as evidence for a specific claim. The numbers appear in quick succession, inventory-style. Both the mechanism and the conclusion (welfare rises $8 billion) are already clear from the surrounding sentences; the specific basis-point numbers do not add an argument.

**Original:**
```
Networks respond by cutting credit card fees by 13 bp
and rewards by 15 bp.
Consumer welfare still rises \$8 billion from lower retail prices and reduced credit aversion.
```

**Proposed Revision:**
```
Networks respond by cutting credit card fees by 13 bp and rewards by 15 bp, and consumer welfare rises \$8 billion from lower retail prices and reduced credit aversion.
```

**Why better:** Merging the three sentences into one eliminates the inventory cadence. The basis-point figures remain but now serve the single claim that competition shifts toward merchants rather than remaining as a separate numerical report.

---

## institutional_details.tex

### Section: Institutional Background

The institutional details section is clean and well-integrated. No material flags.

---

## data.tex

### Section: Data

### - [x] Lines 4-7: Opening sentence announces structure before earning it (applied)

**Dimension:** Economy (Principle #8)

**Comment:** "Identifying the competitive bottleneck requires measuring how sensitive consumers are to rewards, how much card acceptance increases merchant sales, and how often consumers carry cards from multiple networks. I combine five data sources that capture these objects." The first sentence frames data requirements; the second announces the five-source structure. Together they are a preamble before the content starts. The reader learns what will happen rather than seeing the data in action.

**Original:**
```
Identifying the competitive bottleneck requires measuring how sensitive consumers are to rewards, how much card acceptance increases merchant sales, and how often consumers carry cards from multiple networks.
I combine five data sources that capture these objects.
Appendix \ref{sec:appendix-data} provides data construction details.
```

**Proposed Revision:**
```
I combine five data sources to measure consumer reward sensitivity, card acceptance effects on sales, and consumer multi-homing rates.
Appendix \ref{sec:appendix-data} provides data construction details.
```

**Why better:** Compresses two sentences into one without losing content. Drops the "Identifying the competitive bottleneck requires..." frame, which restates what the reader already knows from the prior section.

---

## reducedform.tex

### Section: Reduced-Form Evidence

### - [x] Lines 4-6: Opening paragraph announces its conclusions before presenting evidence (applied)

**Dimension:** Motivation & Tension (Principle #5, Contrast II.1)

**Comment:** The opening paragraph of the reduced-form section leads with a summary of three facts, then states that the model will be estimated to match them. This is results-first: the reader learns the answer before the evidence. The section title already signals this is reduced-form evidence; the opening paragraph could instead create curiosity by naming a puzzle.

**Original:**
```
Three reduced-form facts illustrate the competitive bottleneck that incentivizes networks to compete for consumers rather than merchants.
Issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.
By requiring that the estimated model match these facts, I capture the key mechanisms shaping how networks compete for consumers and merchants.
```

**Proposed Revision:**
```
Three reduced-form facts establish the empirical foundations for the competitive bottleneck.
Issuers' incentives drive consumer payment choices, card acceptance increases merchant sales, and asymmetric multi-homing leaves merchants captive to consumer payment choices.
The structural model in Section~\ref{sec:model} is estimated to match these facts.
```

**Why better:** The revision is modest: it removes "By requiring that the estimated model match these facts, I capture the key mechanisms" which is throat-clearing about the paper's method rather than content. The revised third sentence is shorter and more direct.

---

### - [-] Lines 45-53: Mixed paragraph — robustness caveat interrupted by mechanism discussion

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The paragraph beginning "This decline reflects several channels beyond rewards alone" has two distinct tasks: (1) acknowledging the multi-channel nature of the Durbin response, and (2) reporting a robustness test for the rewards-only interpretation. These are separate logical points. The paragraph also contains an unintuitive transition: "If these channels are substitutes, banks that relied on rewards spent less on non-price promotion." This conditional is doing too much work to get to the robustness point.

**Original:**
```
This decline reflects several channels beyond rewards alone.
If these channels are substitutes, banks that relied on rewards spent less on non-price promotion.
Focusing on the subset of banks that paid debit rewards pre-Durbin therefore selects a sample where non-price steering was likely lower.
Online Appendix \ref{par:oa-durbin-rewards-robustness} shows that the banks that cut rewards experienced a 30\% decline in debit volumes compared to banks that continued to pay rewards, consistent with rewards alone being sufficient to account for the volume shift in this subsample.
```

**Proposed Revision:**
```
This decline reflects several channels beyond rewards alone.
Online Appendix \ref{par:oa-durbin-rewards-robustness} shows that banks which cut rewards experienced a 30\% decline in debit volumes, compared to banks that continued paying rewards, consistent with rewards alone being sufficient to account for the volume shift in this subsample.
```

**Why better:** The intermediate logic about substitutable channels and selection on the pre-Durbin rewards sample is the apparatus used to justify the subsample comparison, but the key point is the comparison result. The mechanism is clear enough from the robustness test itself; the intermediate steps can be footnoted or moved to the appendix. The revision is shorter and ends on the substantive finding.

---

### - [x] Lines 163-166: Paragraph on consumer single-homing opens with its conclusion, then restates material already established (applied)

**Dimension:** Motivation & Tension (Principle #5)

**Comment:** "Consumer single-homing helps explain why merchants are insensitive to fees. Because card acceptance increases sales, merchants risk substantial sales if they reject cards from one network even while accepting others." The first sentence states the conclusion; the second restates what was established in Subsection 3.2. The paragraph opens flat rather than setting up the measurement that follows.

**Original:**
```
Consumer single-homing helps explain why merchants are insensitive to fees.
Because card acceptance increases sales, merchants risk substantial sales if they reject cards from one network even while accepting others.
```

**Proposed Revision:**
```
Around \scalarinput{kilts_model_multihome_cc}\% of primary credit card consumers carry cards from only one network.
When a merchant declines a network's cards, it therefore risks losing the single-homers in that network's base---consumers who cannot substitute to a rival.
```

**Why better:** The revision leads with the surprising empirical fact (most consumers single-home) rather than a conclusion about merchant fee sensitivity. The mechanism follows from the fact, rather than being stated first and then explained.

---

## model.tex

### Section: Model

### - [x] Lines 4-13: Opening paragraph announces the model's features before the model is introduced (applied)

**Dimension:** Economy (Principle #8)

**Comment:** "To quantify how network competition shapes fees, rewards, and welfare, I build a model that features two-sided multi-homing, merchant competition, and price coherence." This sentence is a preamble. The following sentences describe the game structure. The opening sentence does not add information beyond what the section title conveys.

**Original:**
```
To quantify how network competition shapes fees, rewards, and welfare, I build a model that features two-sided multi-homing, merchant competition, and price coherence.
```

**Proposed Revision:**
```
The model is a static three-stage game among networks, consumers, and merchants.
```

**Why better:** Cuts the preamble sentence and moves directly into the model structure. The features of the model (two-sided multi-homing, price coherence) are demonstrated in the subsequent paragraphs rather than announced upfront.

---

### - [x] Lines 153-155: Key acceptance mechanism stated without connecting to the formal acceptance condition (applied)

**Dimension:** Math Precision (Principle #3)

**Comment:** "Adding a more expensive card incurs fees from all consumers who use it but increases sales only from single-homers. If all consumers multi-home across credit networks, merchants accept only the lowest-fee network." This is the central competitive bottleneck mechanism in the model, but it is stated in prose without pointing to the formal expression for $b_M$ and $a_M$ that were just derived. The reader who wants to verify the claim has no pointer.

**Original:**
```
Adding a more expensive card incurs fees from all consumers who use it but increases sales only from single-homers.
If all consumers multi-home across credit networks, merchants accept only the lowest-fee network.
Online Appendix~\ref{subsec:oa-credit-multihoming} verifies these intuitions in a two-card economy.
```

**Proposed Revision:**
```
Adding a more expensive card incurs fees from all consumers who use it but increases sales only from single-homers: in terms of (\ref{eq:merch-accept}), the fee cost $a_M$ includes all payers on that card while the sales benefit $b_M$ is driven only by the single-homers who cannot substitute.
If all consumers multi-home across credit networks, this incremental sales gain vanishes and merchants accept only the lowest-fee network.
Online Appendix~\ref{subsec:oa-credit-multihoming} verifies these intuitions in a two-card economy.
```

**Why better:** Connects the prose intuition to the formal objects $a_M$ and $b_M$ defined in the preceding equation, making the verbal claim checkable without requiring the reader to do the algebra themselves.

---

### - [-] Lines 292-318: Segmentation paragraph conflates two distinct arguments

**Dimension:** Paragraph Focus (Principle #4)

**Comment:** The segmentation paragraph (p. "Segmentation Between Debit and Credit") does three things: (1) defines the assumption, (2) provides empirical/institutional support, and (3) describes what happens when the assumption is relaxed (substitution with debit affects the credit acceptance problem). The third task — describing the relaxed model's implications — is analytically distinct from defending the assumption and belongs in the later paragraph about the credit-debit substitution model, or in a footnote. The current structure requires the reader to follow an extended conditional argument ("If consumers sometimes switch to debit...Capping debit fees then forces...") before the assumption is clearly defended.

**Original:**
```
Online Appendix \ref{sec:oa-credit-debit} explores the challenges with relaxing this assumption and estimates versions of the model with credit-debit substitution.
Allowing substitution between credit and debit at the transaction-level generally changes the inputs into the merchant acceptance problem.
If consumers sometimes switch to debit when credit is unavailable, and debit generates incremental sales relative to cash, then credit card acceptance depends on credit-debit multihoming rates and debit fees.
Capping debit fees then forces networks to lower credit fees and rewards.
```

**Proposed Revision:**
```
Online Appendix \ref{sec:oa-credit-debit} explores the challenges with relaxing this assumption and estimates versions of the model with credit-debit substitution.
Under substitution, credit card acceptance would depend on credit-debit multi-homing rates and debit fees, which would change counterfactual predictions for debit fee changes.
The main counterfactuals, which vary credit fees and multi-homing, are robust to this alternative (Section~\ref{subsec:cf-discussion}).
```

**Why better:** The revision focuses the paragraph on the consequence relevant to the paper's scope (what changes, what stays robust) rather than detailing the mechanism of the alternative model, which belongs in the appendix section where it is estimated.

---

## estimation.tex

### Section: Estimation

### - [x] Lines 4-16: Opening paragraph imposes false sequential structure on the estimation (applied)

**Dimension:** Intellectual Precision (Principle #12)

**Comment:** "I estimate all parameters jointly, but the identification argument has three components. First, I estimate consumer demand... Second, I recover network costs... Third, I recover merchant types..." The opening correctly says "jointly," but then the three-step presentation with "First...Second...Third" creates a sequential reading. The phrase "I recover" for costs and types (steps 2 and 3) also suggests separate recovery steps, not components of joint estimation.

**Original:**
```
I estimate all parameters jointly, but the identification argument has three components.
First, I estimate consumer demand using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Second, I recover network costs by inverting first-order conditions.
Third, I recover merchant types from event-study evidence on grocery chains' credit card acceptance changes in the Homescan panel.
```

**Proposed Revision:**
```
I estimate all parameters jointly, but the identification argument has three components.
Consumer demand is identified by quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Network costs are identified by inverting first-order conditions on rewards.
Merchant types are identified from event-study evidence on grocery chains' credit card acceptance changes in the Homescan panel.
```

**Why better:** Replaces "First I estimate... Second I recover... Third I recover..." with passive constructions that describe how each component is identified without implying sequential recovery steps. "Identified by" rather than "I recover" signals these are components of a joint identification argument, consistent with the opening disclaimer.

---

### - [x] Lines 85-88: Merchant sensitivity described circularly — it "comes from first-order conditions" without explaining what variation delivers it (applied)

**Dimension:** Math Precision (Principle #3)

**Comment:** "Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets. Networks charge high fees to merchants and use the revenue to fund rewards for price-sensitive consumers, so merchants must be relatively insensitive to fees compared to consumers' sensitivity to rewards. Given estimates of consumer sensitivity, merchant sensitivity comes from networks' first-order conditions." This is the identification argument for the merchant density parameter, but it is hand-waved. What moment condition delivers the merchant density? The first-order condition of the network problem with respect to merchant fees provides the moment, but the passage does not show or cite it.

**Original:**
```
Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets.
Networks charge high fees to merchants and use the revenue to fund rewards for price-sensitive consumers, so merchants must be relatively insensitive to fees compared to consumers' sensitivity to rewards.
Given estimates of consumer sensitivity, merchant sensitivity comes from networks' first-order conditions.
```

**Proposed Revision:**
```
Given consumer sensitivity estimates, the density of merchant types near the acceptance margin is recovered from networks' first-order conditions on merchant fees: the observed fee level pins down how many merchants the network is willing to lose at the margin (Appendix \ref{sec:appendix-estimation}).
```

**Why better:** States the identification logic more precisely: it is the observed equilibrium fee that, combined with the FOC, pins down the density near the margin. Removes the circular reasoning that "merchants must be insensitive because networks charge high fees" (that is the equilibrium implication, not an independent moment). Points to the appendix for the formal condition.

---

### - [x] Lines 157-163: Credit aversion paragraph conflates estimated result with model-dependent interpretation (applied)

**Dimension:** Intellectual Precision (Principle #11)

**Comment:** "While the model estimates are the consequence of assuming that payment choices reflect revealed preference, survey evidence confirms that consumers who avoid credit cards do so for substantive reasons." The phrase "the model estimates are the consequence of assuming revealed preference" is technically accurate but obscures what is actually estimated. Credit aversion is an estimated parameter (non-pecuniary utility gap) that happens to be large; it is not imposed by assumption. The sentence risks making the reader think credit aversion is a calibration choice rather than a finding.

**Original:**
```
While the model estimates are the consequence of assuming that payment choices reflect revealed preference, survey evidence confirms that consumers who avoid credit cards do so for substantive reasons, including budget control, debt aversion, and the hassle of managing revolving accounts (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
```

**Proposed Revision:**
```
The model estimates a large non-pecuniary cost of credit card use, consistent with survey evidence that consumers who avoid credit cards cite budget control, debt aversion, and the hassle of managing revolving accounts (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
```

**Why better:** Describes credit aversion as an estimated result rather than a consequence of an assumption. The survey evidence then corroborates the finding rather than rescuing an imposed assumption. Eliminates the hedge "the consequence of assuming revealed preference," which is true of all demand estimation and doesn't need restating here.

---

## counterfactuals.tex

### Section: Counterfactuals

### - [x] Lines 91-94: Opening of welfare subsection is results-first with no tension (applied)

**Dimension:** Motivation & Tension (Principle #5, Contrast II.1)

**Comment:** "Fee caps increase total welfare by \$27 billion per year, with most gains accruing to consumers. The gains arise because fee caps correct excessive credit card adoption." This announces the result and immediately explains it. The prior subsection already established the price/quantity effects. The welfare result paragraph has no setup or tension — it is pure announcement.

**Original:**
```
Fee caps increase total welfare by \$27 billion per year, with most gains accruing to consumers.
The gains arise because fee caps correct excessive credit card adoption.
Under price coherence, rewards funded by merchant fees induce consumers to use credit cards beyond the socially efficient level.
Capping fees moderates this distortion.
```

**Proposed Revision:**
```
The gains from fee caps stem from correcting excessive credit card adoption, not from reducing market power.
Under price coherence, rewards funded by merchant fees induce consumers to use credit cards beyond the socially efficient level, and capping fees moderates this distortion.
Total welfare rises by \$27 billion per year, with most gains accruing to consumers.
```

**Why better:** Opens with the surprising mechanism (it's not about market power) rather than the dollar number. The claim of $27 billion then arrives as the payoff to a causal argument rather than as an announcement. This matches the paper's overall rhetorical structure: puzzle first, then result.

---

### - [x] Lines 116-122: Sequential decomposition paragraph imposes false structure (applied)

**Dimension:** Intellectual Precision (Principle #12)

**Comment:** "The network effect (first row) holds merchant prices and acceptance fixed... The price passthrough row allows merchants to adjust retail prices, holding acceptance fixed. The merchant adoption row allows merchants to adjust acceptance decisions." This accurately describes Table 3's sequential decomposition, but the framing in the text reads as if these are separate channels that operate in sequence, when they are actually simultaneous in the model. The decomposition is a numerical device, not the actual model structure.

**Original:**
```
To understand the sources of these gains, Table~\ref{tab:cap-credit-channel-decomp} decomposes welfare by sequentially allowing more merchant responses.
The network effect (first row) holds merchant prices and acceptance fixed while networks re-optimize fees and rewards and consumers adopt new payment methods.
The price passthrough row allows merchants to adjust retail prices, holding acceptance fixed.
The merchant adoption row allows merchants to adjust acceptance decisions.
```

**Proposed Revision:**
```
Table~\ref{tab:cap-credit-channel-decomp} isolates the welfare sources by holding different margins fixed.
The first row holds merchant prices and acceptance at their baseline while networks re-optimize fees and rewards and consumers adopt new payment methods.
The second row additionally allows merchant retail prices to adjust, holding acceptance fixed.
The third row allows acceptance to adjust as well.
```

**Why better:** "Decomposes welfare by sequentially allowing more merchant responses" implies a sequential causal process. "Isolates the welfare sources by holding different margins fixed" correctly describes this as a counterfactual decomposition tool, not a sequential mechanism.

---

### - [x] Lines 198-224: Monopoly counterfactual paragraph carries inventorial numbers and delayed mechanism (applied)

**Dimension:** Number Integration (Principle #7, Contrast II.6)

**Comment:** Lines 203-209 report a sequence of numbers (credit rewards -90 bps, credit share -23 pp., fees fall $40 billion, rewards fall $66 billion, per-transaction fees +36 bps) before explaining why they arise. Each number is a different margin; none is introduced as evidence for a specific claim before the next number follows.

**Original:**
```
Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps, dramatically reducing credit card use (credit share falls 23 pp.).
With fewer high-fee credit transactions, aggregate fees fall \$40 billion and rewards fall \$66 billion despite higher per-transaction fees of 36 bps.
```

**Proposed Revision:**
```
Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps.
Because rewards are the primary reason consumers use credit cards, credit card spending collapses: the credit share falls 23 pp.
Aggregate merchant fees fall \$40 billion despite a 36 bps rise in per-transaction fees, because far fewer transactions clear on high-fee credit cards.
```

**Why better:** Each number is now embedded in a sentence that states the specific claim it supports. The mechanism — rewards drive credit usage, fewer credit transactions means lower aggregate fees even with higher unit fees — is made explicit between the numbers.

---

### - [x] Lines 268-270: Discussion paragraph opens with a summary claim, then meta-comments on what follows (applied)

**Dimension:** Economy (Principle #8)

**Comment:** "The welfare gains from fee caps and dual-routing mandates are quantitatively robust across alternative assumptions about consumer constraints, merchant pass-through, and reward sensitivity. The merger counterfactual is more sensitive to the level of reward sensitivity. Online Appendix \ref{sec:oa-alternative-specifications} presents detailed sensitivity analysis; I summarize the key robustness checks here." The third sentence is throat-clearing ("I summarize... here").

**Original:**
```
The welfare gains from fee caps and dual-routing mandates are quantitatively robust across alternative assumptions about consumer constraints, merchant pass-through, and reward sensitivity.
The merger counterfactual is more sensitive to the level of reward sensitivity.
Online Appendix \ref{sec:oa-alternative-specifications} presents detailed sensitivity analysis; I summarize the key robustness checks here.
```

**Proposed Revision:**
```
The welfare gains from fee caps and dual-routing mandates are quantitatively robust across alternative assumptions about consumer constraints, merchant pass-through, and reward sensitivity.
The merger counterfactual is more sensitive to the level of reward sensitivity.
Online Appendix \ref{sec:oa-alternative-specifications} provides details.
```

**Why better:** Cuts "I summarize the key robustness checks here" which tells the reader what they can already see from the paragraph headers that follow. Replaces the compound sentence with a short pointer.

---

## conclusion.tex

### Section: Conclusion

The conclusion is clean and tightly argued. No material flags. Four paragraphs, each with a single claim, no inventory-style numbers, and no throat-clearing.

---

## Summary

| File | Primary Issues |
|------|---------------|
| intro.tex | Three-forces paragraph conflates facts with forces; monopoly paragraph has light throat-clearing; dual-routing numbers are inventorial |
| data.tex | Opening two sentences are a preamble; can be compressed |
| reducedform.tex | Opening paragraph results-first; single-homing paragraph opens with conclusion before fact; multi-channel Durbin paragraph overloaded |
| model.tex | Opening sentence is preamble; key acceptance mechanism lacks pointer to formal objects; segmentation paragraph does too much |
| estimation.tex | Opening falsely sequential despite "jointly" disclaimer; merchant identification is hand-waved; credit aversion mislabeled as assumption consequence |
| counterfactuals.tex | Welfare subsection results-first; decomposition framing is sequentially misleading; monopoly numbers inventorial; discussion throat-clearing |
| conclusion.tex | Clean |
