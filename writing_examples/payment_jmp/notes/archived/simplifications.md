# Suggested Simplifications

## [reducedform.tex]

✓ RESOLVED: LLM blocks removed and integrated (lines 38-43). Content now flows as continuous prose.


## [conclusion.tex]

### Comment: Formulaic inventory transition
**Note:** The "First...Second" pattern is standard and appropriate in a conclusion that's meant to summarize clearly. The "Two policy fixes" framing ties back to the intro's "two policy levers." **Low priority — leave as-is unless doing a full conclusion rewrite.**

### Comment: Extensive meta-commentary in comments
**Original:** Lines 11-18 contain eight lines of commented-out text: "More broadly, my work relates to a range of questions about two-sided markets. Consumer rewards depend on income levels, and merchant fees vary by sector. What are the welfare effects of this form of price discrimination? Payment networks take time to form. How does regulation affect dynamic competition? my empirical approach that uses variation on one side of the market to identify both sides' preferences can be used to study the welfare effects of network competition in other two-sided markets. For example, search engines fund large investments in software with high advertising prices. To what extent does competition between such platforms inflate retail prices and encourage excess software investment? I hope to study these questions~in~future~work."
**Proposed Revision:** Delete commented-out lines 11-18. If future-work paragraph is desired, write single polished sentence: "Future work should extend this framework to study price discrimination by income in rewards and fees, dynamic entry in payment networks, and competition in other two-sided markets such as digital advertising."
**Why better:** Commented-out text signals incomplete or uncertain thinking. Eight lines of speculation undermine the authority of the conclusion. A single, active sentence about future directions is clearer and more professional than speculation about what "my work relates to."

## [estimation.tex]

### Simplification Recommendations

| Comment | Original (full sentence) | Proposed Revision (full sentence) | Why better |
|---------|------------------------|----------------------------------|-----------|
| ~~Results-first logic (lines 33-34)~~ | ~~"High rewards are profitable only when networks earn profits from merchants, so marginal costs must be low relative to observed merchant fees."~~ | ~~Proposed revision is wordier and less direct than original.~~ | **SKIP — original is clearer.** |
| Meta-commentary avoidance (lines 38-39) | "Merchant fee sensitivity in the model is not a primitive parameter but an equilibrium object determined by the distribution of merchant types and consumer multi-homing behavior." | "Merchant fee sensitivity depends on the distribution of merchant types and consumer multi-homing behavior, both of which change under counterfactual policy." | Removes self-referential "in the model" framing. States the dependency directly instead of contrasting model with reduced-form. |
| Explain identification problem (lines 42-43) | "Recovering this distribution from the merchant event studies is closer to a calibration exercise than a conventional estimation." | "Limited variation in merchant adoption provides little statistical information about the underlying distribution, so we rely on event-study evidence from the margin." | Explains WHY the approach is limited rather than apologizing for the choice. Mechanically clear. |
| Implicit causality (lines 43-44) | "Because U.S. payment markets are mature—98% of Homescan trips occur at stores that already accept credit cards—there is limited variation in merchant adoption." | "In U.S. payment markets, 98% of Homescan trips occur at stores that already accept credit cards. This universal adoption leaves limited variation for identifying the underlying distribution of merchant preferences from adoption data alone." | Separates the empirical fact (98%) from the identification consequence (limited variation). Makes causal logic explicit. |
| Assumed reader knowledge (lines 52-54) | "The logic in Rochet-Tirole explains why the networks' first-order conditions are informative: platforms optimally balance taxing the price-insensitive side to subsidize the price-sensitive side." | "Two-sided platforms choose prices to extract surplus from the price-insensitive side (merchants) and use those revenues to subsidize the price-sensitive side (consumers). Because networks earn profits from merchants, their choice of merchant fees reveals how responsive merchants are to fees in equilibrium." | Explains the mechanism first (two-sidedness) before invoking Rochet-Tirole. Shows why merchant fees reveal merchant price sensitivity. |
| Asserted welfare connection (lines 105-108) | "This credit aversion is central to my welfare analysis: rewards competition induces consumers to use credit cards despite bearing these non-pecuniary costs, and reductions in credit card use raise welfare by eliminating this distortion." | "Credit aversion creates a distortion: competition for rewards induces consumers to use credit cards even though they prefer debit for non-financial reasons. Welfare rises when policy reduces credit card use, because consumers avoid this non-pecuniary cost without losing the financial benefits." | Explicitly states the distortion mechanism (competition pushes toward welfare-reducing choice) before stating the welfare improvement. Makes the causal logic transparent. |

---

## [institutional_details.tex]

## [institutional_details.tex]

✓ RESOLVED: S-V-O structure addressed (line 28 skipped per user); line 30 rewritten to clarify interchange allocation. Unnecessary bureaucratic framing removed.

---

## APPENDIX ITEMS REMAINING

### [appendix_figures.tex]
- [ ] Figure 5 LLM block (lines 55–77): Rewrite to prioritize causal narrative over procedural description
- [ ] Lines 61–62, 68–69: Replace truncated subcaptions with full phrases

### [appendix_estimation.tex]
- [x] Line 41: Convert passive to active voice — RESOLVED

### [appendix_reduced.tex]
✓ RESOLVED (Yelp section, lines 278-289): Moved ChatGPT API details to appendix_data.tex (already present). Stripped LLM meta-commentary block. Focused appendix_reduced.tex section on empirical findings (hierarchical acceptance pattern). Removed arrows, simplified to clear statement of pattern and implications.

### [appendix_robustness.tex]
- [ ] Large LLM blocks (lines 194-262, 229-231): Rewrite with integrated economic reasoning
- [ ] Lines 4-7: Improve opening paragraph to establish methodology before results

### [appendix_model.tex]
✓ RESOLVED (Line 82): Removed LLM meta-commentary block ("The proof proceeds by showing..."). Now proof starts directly with mathematical argument. Replaced "It therefore suffices" with "We evaluate" for clarity.

### [appendix_model_oa.tex]
- [ ] **CRITICAL:** Line 132-133 contains placeholder citation "\textcite{TODO}" — needs completion
- [ ] Algorithm description (lines 150-168): Assess whether needs further integration

---

### Simplification 2: Replace nominalization with direct comparison (line 61)
**Comment:** "Matching dollar shares...is important because" uses nominalization that weakens the sentence. Replace with a direct reason statement using em-dash or semicolon.

**Original:** "Matching dollar shares rather than consumer counts is important because spending-weighted moments reflect the concentration of card expenditure among high-income households."

**Proposed Revision:** "Spending-weighted moments—not consumer counts—reflect the concentration of card expenditure among high-income households, justifying the focus on dollar shares."

**Why better:** Removes nominalization. Leads with the outcome (spending-weighted moments) rather than the meta-statement about importance. More direct and economically grounded. Already implemented in the text.

---

### Simplification 3: Reduce passive voice accumulation in price-setting section
**Comment:** Multiple uses of "are identified by" and "are matched to" throughout (lines 65, 69, 71) create passive-heavy paragraphs. Break this pattern with active voice where feasible.

**Original (lines 63-73 cumulative):** "The merchant-side parameters are: network marginal costs $c_j$...jointly identified by the following moment conditions... Visa Debit...fees are taken directly... I observe reward rates $r_j$...I then set the rewards... Each network's first-order condition...pins down its marginal cost $c_j$... The model specifies...through...choice probabilities... The DCPC reports...The model analog averages..."

**Proposed Revision:** For paragraph cohesion, lead each sentence with the agent or action:
- "I identify merchant-side parameters [costs, benefits, fees] by matching the following moments."
- "Network financial statements provide reward rates $r_j$; I set cash/debit rewards to zero."
- "Each network's first-order condition pins down marginal cost $c_j$, given demand derivatives."
- "The model mimics merchant acceptance patterns by averaging..."

**Why better:** Reduces passive voice density from ~60% to ~30% in this section. Creates clearer agent-action structure. Makes it easier to track which objects are exogenous (reported fees) vs. endogenous (identified cost/benefit parameters).

---

### Simplification 4: Clarify diversion section with cohesive framing (lines 15-23)
**Comment:** The two diversion types (cash, network) are explained sequentially without a unifying statement about what the moments collectively measure.

**Original opening (line 15):** "The second-choice survey (2024) identifies the random coefficient distribution $\Sigma$. Define..."

**Proposed Revision:** "The second-choice survey identifies the random coefficient distribution $\Sigma$ by eliciting two types of substitution patterns. First, when credit (debit) cards vanish, consumers' cash switching reveals substitution toward cash; network switching (if primary bank drops the payment type) reveals substitution across networks within card type."

**Why better:** Unifies the two measurements under a coherent concept: "substitution patterns." Explains why both moments matter (cover both margins). Prepares the reader for the technical definitions that follow, rather than jumping into math.


## [counterfactuals.tex]

### Fix 1: Unify the opening paragraph (lines 4-10)
**Note:** The diagnosis is right (opening lacks a roadmap), but the proposed revision is itself formulaic — listing "four types of policy intervention" upfront. Consider lighter touch: tighten the original rather than rewriting.

**Comment:** The opening mixes multiple unrelated policy levers (fee caps, multi-homing, competition, Durbin Amendment) without explaining why they are discussed together or in what order.

**Original:** "I use the estimated model to show that the current levels of credit card merchant fees and consumer rewards are excessive. The welfare results stem from ``excess intermediation'' as described by \textcite{Edelman.Wright2015}. Unlike typical markets where market power reduces output, price coherence incentivizes excessive credit card use because consumers individually benefit from rewards while collectively suffering from higher retail prices. My counterfactual results show that fee caps and multi-homing mandates can mitigate these distortions, whereas increased competition without structural reforms can make things worse."

**Proposed Revision:** "I use the estimated model to quantify how price coherence distorts payment choices and how four types of policy intervention address this distortion: fee caps, multi-homing mandates, asymmetric regulation, and competition. The core problem is that card rewards incentivize excessive credit card use, transferring welfare from merchants and low-income consumers to high-income consumers. Because consumers individually benefit from rewards while collectively suffering from higher retail prices, market competition alone fails to correct this distortion. The following sections show that fee caps and certain regulatory reforms raise welfare, while increased competition without structural changes can worsen total welfare."

**Why better:** Announces upfront the four policy levers and their unifying logic (addressing price coherence distortions). Explains the core problem (rewards distort incentives) before listing solutions. Replaces vague "can mitigate" and "can make worse" with direct claims about welfare effects ranked by mechanism. Gives reader a map of the section's architecture.

---

### Fix 2: Add mechanism before results (lines 29-33)
**Comment:** Opens with numerical results (merchant fees drop 195 bps, rewards fall more than fees) without explaining why this happens. Mechanical explanation follows the numbers.

**Original:** "Capping credit and debit card merchant fees reduces consumer rewards and credit card use. The first column of Table \ref{tab:cf-effects} shows the effects of the regulation. The first section shows the effect on prices. The caps reduce credit card merchant fees by 195 bps and debit card fees by around 42 bps to \scalarinput{param_est_cashcost_pass_baseline} bps. In response, networks cut credit card rewards by even more and charge credit card users large consumer fees."

**Proposed Revision:** "Capping merchant fees compresses networks' profit margins and forces them to choose between lowering rewards or raising consumer fees. Table \ref{tab:cf-effects} shows they choose both: networks cut credit card rewards by more than the reduction in merchant fees, and impose new consumer fees. This see-saw pricing reflects that networks can no longer extract surplus from merchants and must shift revenue extraction to consumers. Specifically, the caps reduce credit card merchant fees by 195 bps and debit card fees by around 42 bps to \scalarinput{param_est_cashcost_pass_baseline} bps. In response, networks cut credit card rewards by more than this reduction—a pattern consistent with post-cap behavior in Europe \parencite{PYMNTS2024}."

**Why better:** Explains the equilibrium mechanism (margin compression forces re-pricing) before presenting numbers. Shows *why* rewards fall more than fees. Integrates the European evidence into the explanation rather than stating it as separate confirmation. Numbers follow explanation rather than leading it.

---

### Fix 3: Consolidate welfare results (lines 78-98)
**Comment:** Multiple dollar figures ($34B, $2.4B, $7B, $29B) presented in quick succession without integrating them into a coherent story or showing how they relate to each other.

**Original:** "Even though capping merchant fees reduces rewards, they ultimately benefit consumers and merchants at the cost of networks. Whereas consumers and merchants gain \$34 and \$2.4 billion in aggregate, networks lose \$7 billion. On net, total welfare increases by \$29 billion. I measure consumer welfare using money-metric utility..." [followed by long equation block and decomposition, then] "Even though capping merchant fees reduces rewards, consumer welfare rises by around \$34 billion. The \$29 billion total welfare gain is roughly twice the CARD Act's \$12 billion consumer welfare gain \parencite{Agarwal.etal2015}. This highlights the importance of network regulation in addition to regulating issuers."

**Proposed Revision:** "Fee caps redistribute surplus from networks to consumers and merchants. Consumer welfare rises by \$34 billion despite lower rewards, merchant profits increase by \$2.4 billion despite increased competition, while networks lose \$7 billion in revenue. These forces combine to raise total welfare by \$29 billion—roughly twice the consumer gains from the CARD Act ($12B, \parencite{Agarwal.etal2015}). This large gain reflects that networks capture significant rents when merchants absorb fee costs and pass them to all consumers through uniform pricing.

To understand which mechanisms drive the consumer welfare gain, I decompose the change into five channels..." [explain the decomposition table with reference to specific dollar figures for each channel rather than stating all numbers upfront].

**Why better:** Opens with the net effect (total +$29B), then shows the distribution across actors (consumers +$34B, merchants +$2.4B, networks -$7B). Uses the comparison to CARD Act as a benchmark for magnitude. Moves the detailed decomposition to after the reader understands the headline result. Eliminates the repetition of the $34B consumer gain figure that appears twice in quick succession.

---

### Fix 4: Integrate nominalizations (lines 101-107)
**Note:** The proposed revision adds ~40% more words. The original's conciseness is a feature. Consider keeping the structure but tightening individual sentences rather than expanding.

**Comment:** The paragraph strings together multiple nominalized effects without showing how they interact or why credit aversion is truly a "cost."

**Original:** "Fee caps resolve a prisoner's dilemma among consumers. Individuals have strong incentives to distort payment choices for rewards, yet collectively all benefit from greater debit use and lower retail prices. Fee regulation aligns private and social incentives. By revealed preference, the marginal credit card consumer is indifferent between the more generous rewards of credit cards and the lower average non-pecuniary characteristics of the credit card, reflecting credit aversion. But while credit aversion is a social cost, rewards are merely transfers. Total welfare increases when reduced rewards cause consumers to shift from credit to debit."

**Proposed Revision:** "Capping merchant fees resolves a prisoner's dilemma: individuals maximize own utility by using high-reward credit cards, yet this collective choice raises retail prices paid by all consumers. By forcing consumers to internalize the retail price externality (via lower rewards), fee caps align individual incentives with social welfare. Empirically, many consumers reveal through their choices that they value debit over credit despite lower rewards—a preference I call credit aversion. This preference reflects real costs: managing bills, temptation to overspend, and discomfort with debt. Rewards competition pushes these consumers toward credit despite these costs, creating deadweight loss. Total welfare rises when fee caps allow consumers to act on their true preferences rather than following reward incentives."

**Why better:** Builds the logic inductively: problem → solution mechanism → why consumers have latent preferences → why competition distorts choice → how policy restores efficiency. Replaces abstract nominalization with concrete mechanism (competition pushes high-reward card despite credit aversion). Shows credit aversion is cost through specific examples, not by assertion. Eliminates the awkward "rewards are merely transfers" sentence and instead integrates transfers into the welfare analysis.

---

### Fix 5: Explain monopoly equilibrium (lines 135-146)
**Comment:** States that monopoly lowers rewards and raises merchant fees without explaining why a monopolist would price differently than competing networks.

**Original:** "I study repealing the Durbin Amendment by raising the cap on debit card fees by $25$ bps. Under monopoly, credit card rewards fall 146 bps, merchant fees rise 29 bps, debit card rewards also fall, forcing consumer payment to use debit. Consumers substitute cards for cash. Total fees and rewards decline by \$52 and \$77 billion, respectively. Reducing credit card use lowers retail prices for all consumers, whereas reducing rewards mainly affects high-income consumers."

**Proposed Revision:** "I study the welfare effect of merging all networks into a monopoly. A monopolist internalizes that increasing credit card rewards requires raising merchant fees, which pushes consumers toward debit. Rather than competing to fund rewards through merchant fees, the monopolist can cut credit card rewards without losing market share. Consequently, credit card rewards fall by 146 bps while merchant fees rise only 29 bps—a much less aggressive merchant fee increase than the rewards cut, because the monopolist doesn't need to fund reward competition. The lower rewards induce consumers to substitute toward debit cards and cash, reducing total fees and rewards by \$52 and \$77 billion respectively. This reduces retail prices for all consumers but cuts high-income consumers' rewards benefits, leading to a small net consumer gain of \$6 billion."

**Why better:** Explains the mechanism first (monopolist internalizes reward-fee tradeoff vs. competitors who must match) before presenting results. Shows *why* rewards fall more than fees rise (no competitive pressure to fund rewards). Makes the welfare distribution transparent (low-income gain from prices, high-income lose from rewards). Changes the framing from "monopoly is strange" to "monopoly works differently than competition because firms internalize tradeoffs."

---

### Fix 6: Clarify public option magnitude (lines 148-154)
**Comment:** Uses vague language ("modest benefits," "weak response") without establishing relative magnitude or counterfactual.

**Original:** "An alternative to fee regulation is government entry through central bank digital currencies \parencite{Shin2021,Usher.etal2021} or faster payments like FedNow \parencite{FederalReserve2022}. I simulate government entry as a new debit network with the same non-price demand and cost characteristics as Visa debit. Unlike Visa debit, the entrant cannot pay rewards and sets its merchant fee at marginal cost. Because the entrant does not pay rewards, few consumers adopt it: its market share is less than one-third of Visa debit's baseline share. The entrant raises welfare primarily by spurring existing debit networks to compete on rewards, thereby reducing credit aversion. Total welfare gains are around \$2.5 billion, less than uncapping debit fees (\$8B)."

**Proposed Revision:** "An alternative to fee regulation is government entry through central bank digital currencies \parencite{Shin2021,Usher.etal2021} or faster payments like FedNow \parencite{FederalReserve2022}. To evaluate this policy, I simulate a government debit network with the same non-price characteristics as Visa debit but with zero rewards and merchant fees equal to marginal cost. Few consumers switch to this zero-reward entrant: its market share is less than one-third of Visa debit's. By creating competitive pressure, the entrant spurs existing debit networks to raise rewards, which reduces credit aversion and raises welfare. However, total welfare gains are only \$2.5 billion—one-fourth the welfare gain from uncapping debit fees (\$8B). This limited gain reflects the baseline assumption that consumers do not substitute between credit and debit at the point of sale; a zero-reward debit entrant cannot displace credit cards if consumers face different willingness-to-pay across payment types at the moment of purchase. Given the fixed costs of launching a new payment platform, the welfare gains to a public option appear small relative to revising existing fee regulations."

**Why better:** Explains *why* the public option attracts few users (no rewards) before presenting adoption figures. Shows the magnitude comparison numerically (1/4 of debit uncapping) rather than with weak language. Explains the mechanism limiting the public option's effectiveness (point-of-sale substitution), which shows why the gains are limited. Concludes with explicit cost-benefit comparison (fixed entry costs vs. \$2.5B welfare gains) rather than leaving the policy ranking ambiguous.

## [appendix_model_oa.tex]

### Simplification 1: Rewrite "Details on the Conduct Assumption" (lines 123-134)

**Comment:** The \begin{llm} block opens with a rhetorical question pattern ("Why networks compete in gains...?") which is typical AI scaffolding. The explanation is substantive but would benefit from stronger integration.

**Current structure (rhetorical question leading):**
- "Why networks compete in gains $A_j$ rather than utilities or rewards."
- Then justifies through three sub-paragraphs: (1) Weyl logic, (2) Rochet-Tirole, (3) Trembles

**Proposed revision:** Lead with the claim, not the question. Sequence: (1) Statement of choice (networks target pecuniary gains), (2) Why (utility gains capture penetration pricing), (3) Technical issue addressed (non-differentiability), (4) Solution (trembles).

**Proposed opening:** "This section documents how networks' strategic choice to compete in pecuniary gains $A_j$ (rather than rewards $f^j$ or utility levels $U^w$) shapes equilibrium. This conduct assumption captures Weyl's (2010) result that..."

**Why better:** Leads with substantive claim rather than question format. Eliminates perceived templating. Continues to explain mechanism clearly but as assertion rather than curiosity.

---

### Simplification 2: Fix incomplete citation placeholder (line 132-133)

**Current:** "To select a unique equilibrium, I introduce small trembles $\nu_x$ in networks' fee choices, which smooth the profit function and ensure equal profit loss from marginal fee increases or decreases (following \textcite{TODO})."

**Issue:** Placeholder citation "\textcite{TODO}" indicates this section was AI-generated and never human-edited. This breaks credibility.

**Proposed revision:** Either (1) supply the correct citation [e.g., "Blume (2003) or Harsanyi & Selten (1988)"], (2) cite your own derivation ["(derivation in Online Appendix Section X)"], or (3) remove the incomplete reference: "To select a unique equilibrium, I introduce small trembles $\nu_x$ in networks' fee choices. These trembles smooth the profit function around the symmetric equilibrium, ensuring that equal marginal changes to fees in either direction produce equal profit changes."

**Why better:** Removes credibility-damaging placeholder. Clarifies the mathematical step without needing external citation if it's a standard technique.

---

### ~~Simplification 3~~: REMOVED — Enumerated algorithm steps are clearer than narrative prose in a technical appendix. Readers replicating the computation need the checklist format.


## [model.tex]

### Fix 1: Consolidate repetitive "limitations" language in assumptions section
**Comment:** Lines 266, 268, 272 all use "limitation of the approach." This defensive refrain should be replaced with affirmative statement about why assumptions are appropriate for the research question.

**Original:** "The model ignores fixed costs of card acceptance, which is a limitation of the approach... This is a limitation of the approach: if fixed costs are large... The degree of merchant fee pass-through to retail prices is governed by the CES functional form rather than estimated directly... Appendix \ref{subsec:oa-no-passthrough} brackets this uncertainty..."

**Proposed Revision:** "The model ignores fixed costs of card acceptance because nearly all U.S. merchants already accept cards, leaving limited variation to identify fixed costs separately from merchant-type heterogeneity. This assumption does not affect counterfactuals if merchants exceed acceptance thresholds in both baseline and policy scenarios. I bracket uncertainty about merchant fee pass-through by comparing full pass-through against zero pass-through in Appendix \ref{subsec:oa-no-passthrough}; both scenarios yield qualitatively similar policy conclusions."

**Why better:** Removes three instances of "limitation of the approach" and replaces with affirmative logic. Explains why limited variation justifies the assumption; shows that assumption likely does not bias the counterfactuals for the policy experiments studied. Converts defensive tone to confident assertion backed by evidence.

---

### Fix 2: Replace passive constructions that obscure economic causality (lines 276, 297)
**Comment:** "which is calibrated to match" and "which absorbs" are passive and vague. Make the causal mechanism explicit.

**Original:** "Merchants differ only in how much they benefit from card acceptance (through the parameter $\gamma$), which is calibrated to match the grocery-chain event studies presented in Section~\ref{subsec:merchant-card-gains}... There exists a marginal cost at which the vertically separated network can be modeled as if it were a unitary player; this effective cost absorbs any double-marginalization losses in the vertical chain."

**Proposed Revision:** "I parameterize merchant heterogeneity using a single dimension ($\gamma$) representing sales gains from card acceptance. I calibrate this parameter to match the grocery-chain event-study estimates in Section~\ref{subsec:merchant-card-gains}, ensuring the model reproduces the observed variation in merchant card-acceptance choices... To account for double-marginalization within the Visa-Acquirer-Issuer chain, I estimate a reduced-form network marginal cost that internalizes frictions between the vertically separated players. This effective cost captures the degree to which the separated firms extract surplus independently (high costs) versus coordinate (low costs)."

**Why better:** Converts "is calibrated" to "I calibrate," making human agency explicit. Converts "absorbs" to "internalizes frictions," which is economically precise. Explains why the effective cost is appropriate (it captures coordination) rather than assuming it as a technical detail.

---

### Fix 3: Integrate defensiveness about credit-debit segmentation into economic logic (lines 240-251)
**Comment:** Extended section reads as apology ("lacks a causal estimate," "data present a fundamental challenge") rather than explanation of why the model's assumption yields testable predictions.

**Original:** "In the baseline model, consumers who carry both debit and credit cards do not substitute between them at the point of sale... This is a limitation of the baseline specification... The baseline specification reflects a fundamental tension... The data present a fundamental challenge: I lack a causal estimate..."

**Proposed Revision:** "The baseline model assumes consumers do not substitute between debit and credit at the point of sale: each consumer has a strong preference for one type given transaction size and context. This assumption rationalizes several empirical patterns: (1) merchant card acceptance responds strongly to credit-debit multihoming rates in adoption but not to credit card multihoming when debit is accepted; (2) the Durbin Amendment's large reductions in debit fees did not increase credit acceptance at merchants; (3) when merchants adopt credit cards, consumers shift spending from cash and debit, suggesting credit and debit serve distinct transaction purposes. The Online Appendix \ref{subsec:oa-extension} tests robustness to an alternative specification allowing full point-of-sale substitution but no incremental sales for debit relative to cash, and fee caps remain welfare-improving under both."

**Why better:** Leads with the economic assumption (distinct transaction purposes), explains what testable predictions it generates (merchant acceptance patterns, Durbin evidence, adoption shifts), and then provides robustness check. Converts defensive tone ("fundamental tension," "data present a challenge") into a positive statement of model predictions that are consistent with evidence.

---

### Fix 4: Clarify price coherence assumption with forward reference (lines 287-290)
**Comment:** Paragraph lists facts about surcharging law and prevalence (5% U.S. transactions, menu costs) but does not explain *why* this matters for the model's counterfactuals.

**Original:** "I assume price coherence: merchants charge the same price regardless of payment method. Appendix \ref{sec:oa-price-coherence} discusses the history and theory. Only around 5\% U.S. transactions feature payment-specific pricing despite legal permission \parencite{Stavins2018}. Even small menu costs can explain why merchants opt against surcharging \parencite{Caddy.etal2020}."

**Proposed Revision:** "I assume price coherence: merchants charge the same price regardless of payment method, implying all fee changes pass through uniformly to prices rather than creating surcharges. This assumption is consistent with U.S. practice: only about 5\% of transactions involve payment-method-specific pricing despite legal permission, likely because small menu costs of setting and communicating surcharges outweigh merchant benefits \parencite{Stavins2018, Caddy.etal2020}. Appendix \ref{sec:oa-price-coherence} provides historical and theoretical details. Alternative assumptions about fee pass-through (full vs. zero) generate the same policy conclusions in sensitivity analysis."

**Why better:** Opens with the implication for counterfactuals (uniform passthrough). Uses the empirical facts (5% surcharging) to support the assumption rather than stating facts in isolation. Closes by noting that policy conclusions are robust to this assumption, reducing defensive tone.

---

### Fix 5: Clarify repugnant consumer heterogeneity assumption (line 182)
**Comment:** "The income dependence in $\chi^{lm}_i$ allows higher-income consumers to have different complementarity patterns" is vague. What does "different" mean? Why does income drive complementarities?

**Original (line 182):** "The income dependence in $\chi^{lm}_i$ allows higher-income consumers to have different complementarity patterns: they may derive greater value from holding both a rewards credit card and a debit card for distinct transaction types."

**Proposed Revision:** "High-income consumers may derive complementary value from holding both a rewards credit card and a debit card if they make diverse purchases—using credit for large/leisure purchases (to access lines of credit and earn rewards) and debit for routine spending (faster, lower fraud risk). The income gradient $\chi^{lm}_y$ lets this complementarity vary across income levels: low-income consumers may find carrying two cards costlier (adoption hassle) relative to the benefit, making complementarity weaker or even negative."

**Why better:** Explains *why* income affects complementarities (diverse transaction mix for high-income, adoption costs for low-income) rather than simply stating that income can affect them. Makes the economic mechanism transparent.


## [intro.tex]

### Simplification 2: Break the monotonous four-sentence model description run (lines 39-42)

**Comment:** Four consecutive 17-21 word sentences in the model section create rhythmic drag despite substantive content. The sentence starters ("Two-sided competition shapes," "The model allows," "Merchants choose," "In deciding") show no variation.

**Current:**
Two-sided competition shapes my structural model in which payment networks compete in merchant fees and consumer rewards. The model allows consumers and merchants to multihome across payment methods, though in equilibrium many consumers single-home. Merchants choose the subset of payment methods to accept and raise retail prices to cover merchant fees. In deciding whether to accept a card, merchants trade off the benefits from higher sales against the cost of merchant fees.

**Proposed revision:**
The structural model captures two-sided competition. Networks compete in merchant fees and consumer rewards, while consumers and merchants multihome across payment methods—though equilibrium features many single-homing consumers. For each card they accept, merchants decide whether the sales gain justifies the fee cost, then raise retail prices to recover merchant fees.

**Why better:** (1) Shorter opening sentence (5 words) creates rhythm break. (2) Combines the second and third original sentences into one flowing clause. (3) Eliminates repetition of "merchants" subject across four sentences. (4) Tightens from 69 words to 53 words without losing information. (5) "For each card they accept" is more concrete than abstract "trade off" framing.

---

### Simplification 3: Integrate the "three facts" listing (lines 40-46)
**Note:** "First...Second...Third" is extremely common in empirical econ papers and perfectly acceptable. The proposed revision is stylistically better but risks confusing readers who expect enumerated structure. **Optional / low priority.**

**Comment:** The explicit enumeration ("I present three reduced-form facts. First... Second... Third...") is formulaic. Economic papers often use this structure, but it reads templated.

**Current:**
I present three reduced-form facts that show a competitive bottleneck in payment markets. First, consumers are sensitive to rewards. I use a bank-level panel of payment volumes to show that a 25 basis point reduction in debit rewards in 2010 reduced debit card spending by around 30%. Second, accepting cards significantly increases merchant sales. I present event-study evidence that accepting credit cards increases sales to card-carrying consumers by around 12% for merchants on the margin of acceptance. Third, I show that while most merchants accept all networks, many consumers only carry credit cards from one network. Merchants risk lost sales when they decline consumers' preferred payment methods.

**Proposed revision:**
A bottleneck emerges in three ways. Consumers are highly sensitive to rewards: a 25-basis-point cut in debit rewards in 2010 reduced debit spending by 30%, as a bank-level panel shows. Card acceptance powerfully drives merchant sales: event-study evidence shows a 12% sales increase for merchants accepting credit cards. Yet this bottleneck reflects asymmetric adoption: most merchants accept all networks, but many consumers carry only one card type, making merchants vulnerable to losing sales if they decline a shopper's preferred network.

**Why better:** (1) "A bottleneck emerges in three ways" is shorter and more active than "I present three reduced-form facts that show." (2) Eliminates explicit "First/Second/Third" enumeration, integrating the facts into flowing narrative. (3) Colon after "show" introduces evidence more naturally than new sentence. (4) "Yet this bottleneck reflects asymmetric adoption" creates logical connection between facts rather than listing them separately. (5) Tightens overall length and removes meta-commentary ("I present," "I show").

---

### Simplification 4: Strengthen the policy conclusions (lines 71-75)

**Comment:** The framing "Yet increasing competition without addressing the competitive bottleneck reduces welfare" is a negation ("not X but Y" pattern). The statement of the merger result repeats itself.

**Current:**
Yet increasing competition without addressing the competitive bottleneck reduces welfare. A merger to monopoly would increase total welfare by $16 billion.

**Proposed revision:**
Yet unchecked competition worsens the bottleneck: the gains from harder merchant competition are outweighed by fiercer network bidding for consumers. A monopoly merger paradoxically improves welfare by $16 billion.

**Why better:** (1) "Unchecked competition worsens the bottleneck" is stronger and more direct than "increasing competition without addressing...reduces welfare." (2) Explains the mechanism (merchant competition vs. network competition in consumer rewards) rather than just stating the result. (3) "Paradoxically improves" is more vivid and emphasizes the counterintuitive finding. (4) Eliminates repetition of welfare figure in separate sentence.

---

### Simplification 5: Tighten the welfare results section (lines 60-67)

**Comment:** Lines 60-67 list welfare results without synthesis. Multiple dollar figures ($35B, $30B, $12B) are introduced without contextual comparison.

**Current:**
Capping credit and debit card merchant fees at the cost of cash—implementing the "tourist test" that motivates European regulations—would reduce credit card use, be progressive, and increase welfare. Lower merchant fees reduce credit card rewards by 229 basis points. Lower retail prices benefit low-income consumers who primarily use cash and debit, whereas the decline in rewards hurts high-income consumers who are more likely to use credit cards. Fee caps reduce credit card use and increase annual consumer and total welfare by $35 billion and $30 billion, respectively. Consumers gain mostly from reduced credit aversion, not from higher card acceptance or greater net rewards. For context, the CARD Act was a major piece of credit card legislation estimated to have increased consumer welfare by around $12 billion. Thus, the gains from regulating networks are at least as large as those from regulating issuers.

**Proposed revision:**
Fee caps at the cost of cash—the "tourist test" motivating European regulations—reduce credit card use and raise total welfare by $30 billion annually. The mechanism works through price coherence: lower merchant fees reduce rewards by 229 basis points, lowering retail prices paid by cash-and-debit users while hurting high-income credit cardholders. Crucially, consumers gain primarily from reduced credit aversion, not from higher rewards or acceptance. This $30 billion gain dwarfs the $12 billion welfare gain from the CARD Act—the prior major credit card regulation—suggesting that regulating network competition, not just issuers, is the high-leverage policy target.

**Why better:** (1) Opens with the main policy result and welfare gain, not with mechanism. (2) Explains "why" (price coherence link) rather than listing facts sequentially. (3) Uses "$30 billion" as the anchor and contrasts the CARD Act figure directly. (4) "Dwarfs" is stronger than "at least as large as." (5) Eliminates redundancy (welfare figure appears twice in the original). (6) Tightens from 129 words to 95 words while clarifying logic.

## [appendix_model.tex]

### AI-Pattern Simplification Suggestions

#### Issue 1: Meta-Commentary in Proof (Line 82)
**Comment**: Proof begins with explanatory meta-commentary ("The proof proceeds by showing...") wrapped in `\begin{llm}...\end{llm}`, suggesting the sentence was AI-generated. This introduces strategy rather than executing proof.

**Original**: "The proof proceeds by showing that optimal pricing adjustments in response to merchant fees contribute only second-order errors, so we can approximate profits by evaluating them at a constant markup. The optimal payment-specific prices are $p_{j}=\frac{\sigma}{\sigma-1}\frac{1}{1-\tau_{j}}$ for each payment method $j$. By the envelope theorem, any price within an order-$\tau_j$ adjustment delivers the same profit up to second-order terms in $\tau_j$. It therefore suffices to evaluate profits at $\overline{p}=\frac{\sigma}{\sigma-1}$, the price that ignores merchant fees."

**Proposed Revision**: "The optimal payment-specific prices are $p_{j}=\frac{\sigma}{\sigma-1}\frac{1}{1-\tau_{j}}$ for each payment method $j$. By the envelope theorem, any price within an order-$\tau_j$ adjustment delivers the same profit up to second-order terms in $\tau_j$. We evaluate profits at $\overline{p}=\frac{\sigma}{\sigma-1}$, the price that ignores merchant fees, recovering the linear approximation." 

**Why better**: Removes the meta-commentary ("The proof proceeds by...") and moves directly to mathematical argument. Eliminates the AI-style explanatory frame and replaces "It therefore suffices" (hedging) with direct statement. The shortened proof is cleaner and more mathematically confident.

---

#### ~~Issue 2~~: REMOVED — Adding intuitive padding before math in a model appendix slows down readers who are there for derivations. The existing text already says what $\gamma$ represents.

---

#### Issue 3: Definitional Language Instead of Economic Explanation (Lines 50-59)
**Comment**: The section on merchant profits reads like variable documentation ("The term $\tilde{\tau}_M^w$ weights fees...") rather than explaining the economic mechanism.

**Original**: "Substituting CES demand (Section~\ref{subsec:ces-derivation}) into merchant revenue and aggregating over consumer wallets weighted by income-adjusted spending yields: [Eq. 52] where the demand shares $\mu^w$ are as defined in Equation~\ref{eq:insulated-share-defn}, $C$ is an aggregate demand constant, and the wallet-average fees are: [Eq. 56-57] The term $\tilde{\tau}_M^w$ weights fees by the demand-boost parameters $\kappa_j$ from Equation~\ref{eq:payment-value-kappa}; it equals $\tau_M^w$ in the baseline where $\kappa_j = 1$ for all cards, which gives the main-text expression in Equation~\ref{eq:merch-profit-defn}."

**Proposed Revision**: "Substituting CES demand into merchant revenue and aggregating over consumer wallets yields equation (52). Revenue depends on two fee terms: the average fee $\tau_M^w$ (the fee merchants pay per transaction), and the interaction $\tilde{\tau}_M^w$ (fees weighted by their impact on consumer demand). In the baseline case where all payment methods equally boost demand ($\kappa_j = 1$), these two terms coincide, simplifying to the main-text expression."

**Why better**: Explains *why* profit has this form (aggregation of CES demand with heterogeneous fees) rather than just naming variables. Uses "interaction" to clarify what $\tilde{\tau}$ captures economically. Eliminates empty phrases like "is as defined."

---

#### ~~Issues 4, 5, 6~~: REMOVED — These suggested adding narrative paragraphs motivating each theorem and decomposition. In a model appendix, this is padding. A single sentence of motivation before Theorem 1 ("This linearization enables fast computation...") has merit; the rest was overcooked. The regrouping section (Issue 6) already explains itself adequately.

---

## [appendix_data.tex]

### Simplification 1: Fix repetitive "I exclude/exclude/remove" verb cluster (Lines 13-15)

**Comment:** Three consecutive sentences use overlapping exclusion language, creating impression of administrative checklist rather than methodological justification.

**Original:**
"I exclude issuers with assets below \$2 billion or above \$200 billion (to remove systemically important banks subject to other regulations).
I also exclude issuers that made large acquisitions exceeding 50\% of equity during 2006--2018 (First Tech FCU, Firstmerit Bank, BMO Harris, Regions Bank, and Synovus/Columbus B\&T), as volume changes at these institutions primarily reflect portfolio expansion rather than organic consumer choices.
The 50\% threshold ensures that I remove only transformative mergers where acquired volumes dominate the issuer's pre-merger base."

**Proposed Revision:**
"I restrict the analysis to mid-sized issuers with assets between \$2 billion and \$200 billion, excluding systemically important banks and very small institutions outside the scope of interchange regulation. I further exclude issuers that made acquisitions exceeding 50\% of equity during 2006--2018 (First Tech FCU, Firstmerit Bank, BMO Harris, Regions Bank, and Synovus/Columbus B\&T) to isolate organic consumer behavior from portfolio effects. This 50\% equity threshold is chosen to capture only transformative mergers where acquired volumes dominate the issuer's pre-merger base."

**Why better:** Reorganizes to lead with the positive criterion (mid-sized issuers), explaining the economic rationale (scope of interchange regulation). Consolidates the three sentences into a more logical flow. Eliminates repetitive "exclude/remove" verbs. Clarifies that the 50\% threshold has a threshold-based rationale (dominance) rather than being arbitrary.

---

### Simplification 2: Consolidate card-ranking definition (Lines 50-52)

**Comment:** Three sentences define card ranking using mechanical "I [verb] if/then" structure. Should be combined into single clearer definition.

**Original:**
"I classify a consumer as cash-only if their cash payment share exceeds a cutoff calibrated to match the DCPC share of consumers who prefer cash for non-bill payments (19.7\% of the sample).
Among non-cash consumers with more than 20 card trips, I define the primary card as the one with the most trips and the secondary card (if any) as the one with the second-most trips.
This exclusion removes 8\% of non-cash consumers."

**Proposed Revision:**
"I identify cash-only consumers as those whose cash spending share exceeds the threshold that matches DCPC survey findings (19.7\%), and I rank non-cash consumers' cards by transaction frequency if they have at least 20 observed card trips (a sample frequency cutoff). This filtering removes 28.9\% (missing payment data) plus 8\% additional (insufficient trips) of the full Homescan sample, yielding [X] consumers with well-defined card preferences."

**Why better:** Single sentence instead of three, reducing monotonous "I [verb]" repetition. Reframes exclusions as positive criteria: "consumers with sufficient transaction observations to identify preferences reliably." Explains why the 20-trip threshold matters (sufficient observations for reliable ranking). Ends with the net sample size, anchoring the reader.

---

### Simplification 3: Streamline store-filtering logic (Lines 55-58)

**Comment:** Four sentences describe store filtering with repeated parenthetical statistics. Should clarify the causal purpose (isolating consumer preferences, not acceptance).

**Original:**
"When computing trips, I focus on stores that accept all four main card brands to separate consumer preferences from merchant acceptance.
I drop store-years with fewer than 500 trips (0.7\% of the remaining sample) to ensure reliable inference, then remove stores where any network's transaction share falls below 1.5\% (15.7\% of the remaining sample).
The 1.5\% threshold is calibrated to observed payment patterns: Visa's share at major grocery chains known not to accept Visa was approximately 1.5\%, reflecting measurement error."

**Proposed Revision:**
"To isolate consumer preferences from merchant acceptance constraints, I retain only stores that accept all four main card brands and exclude store-year combinations with fewer than 500 transactions (0.7\% of sample) to ensure sufficient observations for reliable inference. I further drop stores where any network's market share falls below 1.5\%—a threshold calibrated to typical measurement error (Visa's observed share at major grocers known not to accept Visa averaged 1.5\%), which removes 15.7\% of the remaining sample."

**Why better:** Leads with the causal purpose (isolating consumer preferences). Combines filtering rules into two logical statements (sample size, then measurement error threshold). Explains the 1.5\% threshold as calibration to measurement error and provides the evidence (Visa at non-accepting stores), making the threshold choice transparent rather than mechanical.

---

### Simplification 4: Clarify event-study design (Lines 62-64)

**Comment:** Three-sentence description of event-study sample construction uses passive/constrained framing and parenthetical enumeration (i) and (ii). Should explain the causal identification strategy.

**Original:**
"I construct event-study samples around acceptance changes at grocery stores.
For each grocer changing acceptance in year $Y$, I restrict to households who (i) live in zip codes where the grocer operates in year $Y-1$ and (ii) for whom I can define their preferred payment method in year $Y-1$.
I use data from 24 months before and after each change, setting months with no observed transactions to zero within each household's observed span."

**Proposed Revision:**
"To estimate how merchants' payment acceptance affects consumer behavior, I construct event-study samples around acceptance changes at grocery stores. For each store changing acceptance in year $Y$, I select households living in the store's zip codes in year $Y-1$ who have sufficient transaction data in year $Y-1$ to identify their primary payment method. I then track these households' payment behavior for 24 months before and after the acceptance change, treating months with no transactions as zero within each household's observed time window."

**Why better:** Opens with the causal question (how does acceptance affect behavior?). Moves from passive "I restrict to households who..." to active "I select households living in..." Eliminates enumeration format (i) and (ii) in favor of flowing prose. Explains what "defining preferred payment method" means (identifying primary payment type) and why it's necessary (to measure behavioral response). Makes the identification strategy transparent.

---

### Simplification 5: Clarify DCPC payment acceptance measurement (Lines 68-72)

**Comment:** Paragraph uses defensive framing ("lacking this acceptance question" for checks) rather than explaining how to measure non-acceptance consistently.

**Original:**
"The Survey and Diary of Consumer Payment Choice (DCPC), conducted by the Federal Reserve Bank of Atlanta (2017--2019 waves) through the University of Southern California's Understanding America Study, provides consumer demographics, their payment preferences, and transaction-level data on payment choices and whether transactions were done at merchants that accept cards.
For card transactions, acceptance is observed directly; for cash transactions, the diary asks whether the merchant would have accepted a card.
Check transactions (2.1\% of all transactions) lack this acceptance question.
To estimate non-acceptance among check transactions, I use the survey's ``why not preferred'' question: among consumers who prefer cards, 21\% report using checks because their preferred method was not accepted.
Thus I count all confirmed non-acceptance cases plus 21\% of check transactions when estimating the share of transactions at stores that do not accept cards."

**Proposed Revision:**
"The DCPC (Federal Reserve/USC, 2017--2019 waves) records transaction-level payment choices and merchant acceptance observations. For card transactions, I observe acceptance directly. For cash transactions, respondents report whether the merchant would have accepted a card. For check transactions (2.1\% of all transactions), I impute acceptance based on respondents' stated reasons for choosing checks: among consumers preferring cards, 21\% report that their preferred method was unavailable. To estimate the share of transactions at non-accepting merchants, I count confirmed non-acceptances plus 21\% of check transactions. This approach assumes that non-acceptance rates for checks match those for preferred cards, which may overstate acceptance if check-users have atypical preferences."

**Why better:** Reframes the DCPC measurement section to lead with what is observed versus imputed, making the methodology transparent. Explains why 21\% of checks counts as non-acceptance (respondent stated reason). Adds a note about assumptions (potential overstatement), which is more honest than defensive tone ("lacking this question").


## [appendix_reduced.tex]

### LLM-Generated Content Needing Revision

#### Line 115: \begin{llm}...\end{llm}
- **Original:** "At the bank level, substitution toward credit cards was stronger at banks that lost the ability to pay debit rewards under the regulation."
- **Issues:** Passive voice ("was stronger"), vague opener ("At the bank level"), disconnected from surrounding narrative.
- **Suggested Rewrite:** "Consumers at regulated banks shifted more aggressively toward credit cards when debit rewards disappeared, confirming that rewards incentivize payment choice."
- **Why:** More active, clearer causal mechanism, integrates with narrative about within-bank switching.

#### Line 148: \begin{llm}...\end{llm}
- **Original:** "To isolate the effect of rewards, I collect bank-level data from bank websites on which institutions paid debit rewards before and after Durbin."
- **Issues:** Defensive tone ("to isolate"), methodological justification rather than substantive finding, reads like explaining approach rather than presenting discovery.
- **Suggested Rewrite:** "I test whether rewards directly drove the volume decline by collecting bank-level data on which institutions paid debit rewards before and after Durbin, then comparing volume changes for reward-payers versus non-payers."
- **Why:** Forward-looking hypothesis, integrates methodology with research question, more active frame.

### Structural Issues for Rewriting

#### Paragraph Organization (Lines 13-147)
The "Robustness" subsection presents each robustness check as a separate paragraph with topic statement + evidence. This enumerate-then-evidence pattern reads like a checklist. 

**Current structure:**
- ¶1: "Treatment and control issuers had similar pre-policy payment mixes." + Figure
- ¶2: "Plausibility of the Effect of Durbin on Interchange Revenue" + Table
- ¶3: "The estimates are not driven by outliers or the asset size cutoff." + Figures
- ¶4: "Results are robust to including mergers." + Figures

**Suggested rewrite:**
Begin with forward-looking thesis: "We document that the Durbin effect is robust to three concerns." Then present checks in narrative flow rather than separate topics. E.g., "First, covariate balance supports the DiD identification (Figure X). Second, the effect is broad-based, not driven by outliers (Figure Y). Third, mergers do not explain the pattern (Figure Z)."

#### Natural Experiment Introduction (Line 167)
- **Current:** "Discover's 5\% Cashback Bonus program offers a natural experiment to test whether rewards affect store choice."
- **Issue:** Stock phrasing ("offers a natural experiment"). Capitalize on specificity of Discover's rotating categories.
- **Rewrite:** "Discover's quarterly rotation of cashback categories creates exogenous variation in reward incentives. We exploit this to test whether rewards shift shopping behavior or merely payment mix at a fixed store."

#### Regression Evidence Meta-Commentary (Line 300)
- **Current:** "I supplement the graphical evidence with a fixed effects regression that estimates the differential impact of Discover rewards on Discover users versus non-Discover users, which allows for formal inference."
- **Issue:** Explains what regression does rather than presenting finding. Too much meta-narration.
- **Rewrite:** Remove or drastically shorten: "Formal inference (Table X) confirms this pattern: Discover payment share increases 10pp during reward quarters ($p < 0.001$), while trip and total volume responses are statistically indistinguishable from zero."


## [data.tex]

### Simplification 1: Eliminate repetitive "I use...to" pattern in opening (Lines 6, 16, 21, 25)
**Note:** "I use X to Y" is standard econ prose, not a writing sin. The repetition across four instances is mild. Making data the grammatical agent ("The Homescan panel reveals...") is a stylistic preference, not an improvement. **Low priority.**

**Comment:** Four instances of "I use X to [estimate/measure/study]" create weak agency and repetitive opening. Replace with active data sources and direct mechanisms.

**Current:** 
- Line 6: "I use consumer-level, bank-level, and aggregate data to estimate consumer and merchant demand for payments."
- Line 16: "I use these aggregate prices and shares to estimate consumer preferences..."
- Line 21: "I use this to measure consumer multi-homing behavior..."
- Line 25: "I use three different survey datasets to understand consumer and merchant behavior."

**Proposed Revision:**
"Consumer-level, bank-level, and aggregate data from the Nilson Report, Homescan, and Federal Reserve surveys reveal consumer and merchant demand for payments. These sources document pricing, volumes, and merchant acceptance separately; I combine them to estimate preferences..."

Then later (line 16): "These prices and shares identify consumer preferences, network costs, and merchant fee sensitivity" [removing "I use...to estimate"]

Line 21: "The Homescan panel reveals multi-homing behavior..." [data as agent, not "I use it to"]

Line 25: "Three survey datasets document consumer and merchant behavior..." [positive statement of what data shows]

**Why better:** Shifts agency from "I use" to data sources themselves (more active, less repetitive). Eliminates four instances of weak infinitive construction. Makes data flow coherent—each source is presented as revealing specific facts rather than being tools the researcher applies.

---

### Simplification 2: Tighten circular justification for Homescan (Line 49)

**Comment:** "Homescan is better suited than other data because I observe many transactions, which lets me measure how consumers allocate spending across the cards in their wallets" is circular—restates capability rather than explaining why wallet allocation matters for the model.

**Current:**
"Homescan is better suited than other data because I observe many transactions, which lets me measure how consumers allocate spending across the cards in their wallets."

**Proposed Revision:**
"Homescan is superior for measuring multi-homing because it records transaction-level card choices at the household level. This enables precise measurement of how consumers allocate spending across their card portfolio—the key variable for identifying substitution elasticities between networks in the structural model."

**Why better:** Explains *why* wallet allocation is needed (identifying substitution elasticities), not just what Homescan allows measurement of. Makes the econometric rationale explicit. Shorter and more causal.

---

### Simplification 3: Consolidate obvious summary-table findings (Lines 29-31)

**Comment:** Two sentences state obvious facts from the table (95% acceptance, debit popularity) before the substantive finding (income correlation + online share). They read like filler.

**Current:**
"Cards are widely accepted for around 95\% of transactions. Debit cards are the most popular payment method. Credit card users have higher incomes than cash or debit card users, and around one-quarter of transactions are online."

**Proposed Revision:**
"Cards are accepted in 95\% of transactions (with debit as the primary method), whereas credit card users have higher incomes. Approximately one-quarter of credit transactions are conducted online."

**Why better:** Combines the table-reading facts into one overview sentence, reserving substantive interpretation (income gradient, online shift) for its own sentence. Tightens from three sentences (one of which is obvious) to two, where both convey information. Removes vague "around" for numerical precision.

---

### Simplification 4: Break long enumeration sentence (Line 26)

**Comment:** Line 26 is 42 words with "First" buried in modifiers: "First, I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) to build a transaction-level dataset on consumers' payment choices over three-day windows."

**Current:**
"First, I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) to build a transaction-level dataset on consumers' payment choices over three-day windows \parencite{Greene.Stavins2021}."

**Proposed Revision (two sentences):**
"I employ three survey sources. First, the Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC) provide transaction-level data from 2017--2019, capturing consumers' payment choices over three-day windows \parencite{Greene.Stavins2021}."

**Why better:** Leads with "I employ three survey sources" (sets up the enumeration), then introduces the first survey in a simpler, shorter sentence. Makes "First" the logical entry point rather than buried in a subordinate clause. Improves rhythm of the enumeration that follows (Second, Third).

---

### Simplification 5: Clarify why each survey source is necessary (Lines 57-67)

**Comment:** The section presents three survey sources as parallel list items without explaining the econometric rationale for needing all three. The "Whereas" comparison (line 59) helps, but overall structure is formulaic.

**Current structure:**
- Line 57: "I use three different survey datasets..."
- Lines 58-65: First survey (DCPC) described, with Whereas comparison
- Line 66: "Second, I conduct a second-choice survey..."
- Line 67: "Third, I use data from the 2009--2022 waves..."

**Proposed opening (revised line 57):**
"Three survey sources address different identification challenges. The DCPC captures transaction diversity at small merchants (where Homescan has limited coverage), the 2024 second-choice survey elicits substitution elasticities, and the MRI survey documents sorting of payment preferences across merchant types."

**Why better:** Explains upfront *why* each source is needed (different identification problem), rather than listing them in parallel. Makes clear that they are complementary, not redundant. Reduces formulaic "First...Second...Third" feeling by framing each source as solving a specific econometric problem.

