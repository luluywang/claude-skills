# AI Detection Review

## [appendix_model.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This section is pure mathematical exposition — equation definitions, theorem statement, and proof. Technical content is objectively presented without rhetorical flourish. The prose is direct and economical:
- Part A (Punctuation/Structure): No em-dashes, no excessive parentheticals, no artificial enumeration. Lists are natural.
- Part B (Language): No smarmy reframing, no meta-commentary, no hedging overuse. No AI vocabulary. Technical terms ("homothetic," "envelope theorem," "quasi-profits") are used correctly and precisely.
- Part C (Argument): No results-first openings (this is pure math derivation), no missing mechanisms (each step is derived), no inventory-style numbers. The proof traces the causal chain from the profit definition to the linear approximation.

**Verdict:** Clean section. Mathematical exposition is sound and meets writing standards for technical appendices.

## [institutional_details.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This section is clearly human-written institutional detail with direct causal reasoning, concrete examples, and regulatory evidence. Sentence structure is natural and varied. Mechanisms are explicit. No smarmy reframing, stacked hedges, or formulaic openers. The prose is precise and economical — every sentence advances the argument with evidence or mechanism. Strong adherence to writing principles: mechanism-forward (not just results-reporting), limitations acknowledged (Line 44), numbers as evidence (not inventory-style), direct statements without throat-clearing.

**Verdict:** Clean section, no revisions needed.

## [data.tex]

### Critical
No issues detected.

### High
No issues detected.

### Medium
No issues detected.

### Low
No issues detected.

**Overall assessment:** File reads as human-written. Direct, practical data description with active voice throughout ("I use," "I combine," "I construct"), appropriate use of hedges ("around" as approximations with specific values), no smarmy reframing, no stacked hedges, no meta-commentary. One long sentence (line 17, 40 words) could be split for rhythm, but this is a structural issue (see sentence_analysis.md), not an AI tell. Sentence openings are varied; transitions are implicit. Numbers are embedded as evidence for specific claims, not inventory-style. Verdict: Clean, human-written data section.

---

## [conclusion.tex]

### Medium

- [ ] Lines 9-12: Results-first opening with limited narrative tension `Medium`

**Comment:** The section opens with counterfactual results rather than establishing the puzzle or significance first. Announces what the paper finds before motivating why it matters. Typical LLM pattern.

**Original:**
```
The counterfactual results in this paper have broad implications for contemporary legal and policy debates in payments and platform markets more broadly.
The Supreme Court's 2018 decision in \emph{Ohio v.\ American Express} held that plaintiffs must show harm on both sides of a two-sided market.
The fee cap counterfactual suggests that this standard is too strict.
A modest cap on credit card merchant fees reduces both fees and rewards equally, yet total welfare increases by \$27 billion per year through more efficient payment choice.
```

**Proposed Revision:**
```
The Supreme Court's 2018 decision in \emph{Ohio v.\ American Express} held that plaintiffs must show harm on both sides of a two-sided market.
This standard appears sound in principle but fails in payment networks: a modest cap on credit card merchant fees reduces both fees and rewards equally, yet total welfare increases by \$27 billion per year through more efficient payment choice.
This result and three others from the paper's counterfactuals challenge conventional wisdom in legal and policy debates on payments and platforms.
```

**Why better:** Establishes the legal context and surprise first (the contradiction between antitrust logic and the actual welfare effect), then names the broader implication. Builds narrative momentum instead of announcing results upfront.

### Low

- [ ] Line 16: Weak phrasing "appeared supracompetitive" `Low`

**Comment:** "Appeared supracompetitive" is awkward — either they were supracompetitive (by some standard) or the debate was about whether they were. The current phrasing is vague about the ground truth.

**Original:**
```
Congress capped debit fees in 2010 because they appeared supracompetitive, but debit fees fund rewards that draw consumers away from high-fee credit cards.
```

**Proposed Revision:**
```
Congress capped debit fees in 2010 based on the belief that they were supracompetitive, but debit fees fund rewards that draw consumers away from high-fee credit cards.
```

**Why better:** "Based on the belief that they were" is more direct and honest about the legislative rationale without hedging on linguistic grounds.

## [appendix_data_oa.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This section is clearly human-written methodological documentation. Content is precise and concrete with specific methodological details (2009–2022 survey years, 214 merchant chains, attention check criteria: 47 respondents failed, 12 outside collection window, ChatGPT 4o API classification). Sentence structure is varied and natural. No smarmy reframing, stacked hedges, results-first openings, or formulaic transitions. Numbers are embedded naturally as evidence of survey design choices, not as inventory-style lists. Mechanism is explicit throughout (e.g., explaining how cash users are identified, how payment method preference is assigned, how network diversion ratios are constructed). No throat-clearing or meta-commentary. Strong adherence to writing principles: direct statements without unnecessary hedging, clear institutional context, methodological transparency.

**Verdict:** Clean section, no revisions needed.

---

## [model.tex]

### High

- [ ] Lines 268-274: Redundant explanation of network conduct `High`

**Comment:** The sentence "Equivalently, networks set consumers' expectations of their own acceptance, fees, and rewards given expectations for rival networks" restates what was just said. This redundancy is AI-typical.

**Original:**
```
Networks set transaction fees $\tau_j$ and pecuniary adoption benefits $A_j$, taking other networks' actions as given.
Equivalently, networks set consumers' expectations of their own acceptance, fees, and rewards given expectations for rival networks.
```

**Proposed Revision:**
```
Networks set transaction fees $\tau_j$ and adoption benefits $A_j$ to maximize expected profits, anticipating rivals' actions.
```

**Why better:** Single clear statement; removes redundancy.

---

- [ ] Lines 305-318: Softened limitations with hedging `High`

**Comment:** The credit-debit segmentation limitations are acknowledged but buffered. Per Principle 6, limitations should be stated plainly.

**Original:**
```
A special case allows for credit-debit substitution without credit-debit multi-homing rates affecting credit card acceptance.
This holds if debit generates no incremental sales or cost relative to cash so that merchants treat debit as a cash-equivalent.
The main disadvantage of this setup is that it does not allow us to study the welfare effects of changes in debit fees.
The model estimated under this restriction produces similar welfare effects as the baseline, because the main counterfactuals change competition between credit networks while the substitution assumption primarily affects how debit competes with credit.
```

**Proposed Revision:**
```
A special case assumes debit generates no incremental sales relative to cash.
The tradeoff: we lose the ability to analyze debit fee changes.
This matters little because the counterfactuals focus on credit network competition.
```

**Why better:** Direct statement of limitation. Removes hedging language ("The main disadvantage...produces similar").

---

### Medium

- [ ] Lines 151-153: Inventory-style mechanism explanation `Medium`

**Comment:** The passage lists components without causal narrative. Reads like listing facts rather than explaining economic mechanism.

**Original:**
```
The intercept $a_M$ captures fee costs; $b_M$ captures sales gains.
Both depend on consumer adoption.
Adding a more expensive card incurs fees from all consumers who use it but increases sales only from single-homers.
```

**Proposed Revision:**
```
The intercept $a_M$ measures the cost: adding a card imposes fees on all adopters.
The slope $b_M$ measures the benefit: the sales gain accrues only to single-homers.
Expensive cards are accepted only when single-homing volume justifies the fee burden.
```

**Why better:** Explicit causal narrative (cost vs. gain → decision).

---

- [ ] Lines 234-238: Formulaic opener "The logit choice probability gives that" `Medium`

**Comment:** Announcement of what's coming rather than direct statement. "Gives that" is filler language.

**Original:**
```
\noindent \textbf{Choice Probabilities}\hspace{0.2in}The logit choice probability gives that
\begin{align}
  \tilde{\mu}_{i}^{w} & =\frac{\exp\left(\alpha_{i}\log U^{w}+\Gamma_{i}^{w}\right)}{\sum_{m\in\mathcal{W}}\exp\left(\alpha_{i}\log U^{m}+\Gamma_{i}^{m}\right)}
```

**Proposed Revision:**
```
\noindent \textbf{Choice Probabilities}\hspace{0.2in}Logit probabilities are
\begin{align}
  \tilde{\mu}_{i}^{w} & =\frac{\exp\left(\alpha_{i}\log U^{w}+\Gamma_{i}^{w}\right)}{\sum_{m\in\mathcal{W}}\exp\left(\alpha_{i}\log U^{m}+\Gamma_{i}^{m}\right)}
```

**Why better:** Direct statement. Removes filler.

---

### Low

- [ ] Lines 6-8: Throat-clearing opening `Low`

**Comment:** "To quantify how... I build a model" announces purpose before content. Could be tightened.

**Original:**
```
To quantify how network competition shapes fees, rewards, and welfare, I build a model that features two-sided multi-homing, merchant competition, and price coherence.
```

**Proposed Revision:**
```
I model competition with two-sided multi-homing, merchant competition, and price coherence to quantify how network competition shapes fees, rewards, and welfare.
```

**Why better:** Action (model) at the front; purpose as subordinate clause.


## [intro.tex]

### Medium

- [ ] Lines 5-6: Short sentence repetition with parallel S-V-O structure `Medium`

**Comment:** Two very short consecutive sentences create choppy rhythm and signal formulaic structure. Pattern: "Payment markets are two-sided. Networks simultaneously tax merchants and subsidize consumers." These can be merged for better flow.

**Original:**
```
Payment markets are two-sided.
Networks simultaneously tax merchants and subsidize consumers.
```

**Proposed Revision:**
```
Payment markets are two-sided: networks simultaneously tax merchants and subsidize consumers.
```

**Why better:** Combines related thoughts; improves flow without sacrificing clarity.

---

- [ ] Lines 25-34: Explicit "First... Second... Third" enumeration `Medium`

**Comment:** AI-typical formulaic enumeration structure. While substantive, the explicit numbering reads as template-driven rather than naturally developed.

**Original:**
```
Three forces explain why networks are incentivized to tax merchants to subsidize consumers.
First, consumer payment choices respond strongly to subsidies.
Networks charge merchants interchange fees and pay the revenue to banks, giving banks incentives to promote the networks' cards through consumer rewards and other forms of steering.
The Durbin Amendment's reduction in debit interchange revenue reduced debit card spending by around 30%.
Second, accepting cards significantly increases merchant sales.
Event-study evidence shows that accepting credit cards increases sales to consumers who use credit cards by around \scalarpctinput{kilts_model_sales_event}\% for merchants on the margin of acceptance.
Third, while almost all card-accepting merchants accept all networks, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network.
Together, these facts produce what \textcite{Armstrong2006} calls a ``competitive bottleneck'': merchants cannot afford to turn away cardholders, so networks compete through rewards rather than fees.
```

**Proposed Revision:**
```
Three forces explain why networks are incentivized to tax merchants to subsidize consumers.
Consumer payment choices respond strongly to subsidies: networks charge merchants interchange fees and pay the revenue to banks, giving banks incentives to promote the networks' cards through consumer rewards and other forms of steering. The Durbin Amendment's reduction in debit interchange revenue reduced debit card spending by around 30%.
Card acceptance significantly increases merchant sales. Event-study evidence shows that accepting credit cards increases sales to consumers who use credit cards by around \scalarpctinput{kilts_model_sales_event}\% for merchants on the margin of acceptance.
While almost all card-accepting merchants accept all networks, around \scalarinput{kilts_model_singlehome_cc}\% of consumers carry credit cards from only one network.
Together, these facts produce what \textcite{Armstrong2006} calls a ``competitive bottleneck'': merchants cannot afford to turn away cardholders, so networks compete through rewards rather than fees.
```

**Why better:** Removes artificial enumeration; flows as a natural argument. Maintains logical progression without template structure.

---

- [ ] Lines 44-47: Inventory-style number reporting `Medium`

**Comment:** Numbers presented as parallel comparisons rather than embedded within causal claims. Splits the asymmetry into separate comparative statements.

**Original:**
```
Consumers are ten times more sensitive to rewards than merchants are to fees.
A 1-bp increase in Visa credit rewards increases Visa's consumer market share by $3.7\%$, while a 1-bp increase in Visa credit merchant fees reduces merchant acceptance by only $0.4\%$.
```

**Proposed Revision:**
```
Consumers are ten times more sensitive to rewards than merchants are to fees: a 1-bp increase in Visa credit rewards increases Visa's consumer market share by $3.7\%$, while the same increase in merchant fees reduces merchant acceptance by only $0.4\%$.
```

**Why better:** Integrates evidence within a single sentence; clarifies both comparisons illustrate the same asymmetry.


## [appendix_reduced.tex]

### Critical
- [ ] Lines 114-117: Missing causal mechanism in mechanism summary `Critical`

**Comment:** Part C: Results-First Opening with missing causal mechanism. The paragraph opens with conclusions ("Three tests point to...") without first stating the puzzle or creating tension. The mechanism section should open with WHY this mechanism matters before announcing what tests were done.

**Original:**
```
Three tests point to within-bank payment switching, driven by the loss of debit rewards, as the mechanism behind the volume decline.
Banks that ended debit rewards lost volumes comparable to the full treatment effect.
Deposits did not shift from large to small banks, ruling out bank switching.
And credit card rewards did not differentially improve at large banks, ruling out a pull toward credit.
```

**Proposed Revision:**
```
The debit volume decline could reflect three alternative mechanisms: consumers switching between banks to avoid Durbin-exposed institutions, withdrawal of debit because credit rewards improved at large banks, or within-bank substitution driven by loss of debit rewards.
Evidence points strongly to the last mechanism.
Banks that ended debit rewards lost volumes comparable to the full treatment effect.
Deposits did not shift from large to small banks, ruling out bank switching.
And credit card rewards did not differentially improve at large banks, ruling out a pull toward credit.
```

**Why better:** Opens with the interpretive puzzle (three possible mechanisms) before stating the answer. This creates tension and shows the reader why the tests matter.

### High
- [ ] Lines 290-300: AI-vocabulary overuse and implicit transitions `High`

**Comment:** Part B: Transition overuse ("Together, these results rule out") and implicit mechanism reporting without explicit causal chain. Also Part B: fence-sitting language ("point to... as the mechanism" rather than direct attribution).

**Original:**
```
Consumers at small banks (credit unions or community banks, largely exempt from Durbin) did not report higher rates of recent bank switching compared to consumers at large banks.
Together, these results rule out bank switching as the driver of the debit volume decline and point instead to within-bank payment substitution.
```

**Proposed Revision:**
```
Consumers at small banks did not report higher bank switching rates.
The evidence rules out bank switching as the driver: deposit flows and consumer behavior both stay stable across bank sizes.
Debit volumes fall without customers leaving; they must be substituting toward other payment methods within their current banks.
```

**Why better:** Removes "Together" transition, makes the causal chain explicit (deposits + switching rates → no bank switching), and states the conclusion directly rather than "point to."

- [ ] Lines 195-200: Inventory-style number reporting `High`

**Comment:** Part C: Inventory-style presentation of results without causal embedding. Multiple statistics presented as parallel facts rather than evidence building toward a claim.

**Original:**
```
Figure \ref{fig:big-small-credit} tests this prediction using MRI-Simmons survey data.
The left panel plots the probability that a consumer holds a credit card from a large issuer, separately for consumers whose primary deposit institution is large versus small.
Consumers at large deposit institutions hold credit cards from large issuers at higher rates throughout the sample---as expected, since many hold credit and deposit accounts at the same bank---but this gap did not widen after Durbin.
The right panel plots the probability of receiving credit card rewards, again by deposit institution size.
Reward receipt rates were similar across bank types throughout, with no differential increase at large banks after 2011.
These patterns are inconsistent with cross-subsidization: large banks do not appear to have differentially improved credit card rewards.
```

**Proposed Revision:**
```
If large banks substituted toward credit rewards, we should see them offering higher rewards and holding rates should shift.
Figure \ref{fig:big-small-credit} shows neither: the gap in credit card holdings at large versus small institutions remained stable after Durbin, and reward receipt rates did not increase differentially at large banks.
Large banks do not appear to have cross-subsidized credit card rewards.
```

**Why better:** Leads with the hypothesis being tested, then presents evidence as support rather than as a list of facts.

### Medium
- [ ] Lines 136-137: Weakly hedged claim about channel substitution `Medium`

**Comment:** Part B: "If these channels are substitutes" introduces contingency without stating what the data will show. The sentence structure masks the actual finding.

**Original:**
```
Banks fund debit promotion from interchange revenue, allocating across rewards, advertising, and teller incentives.
If these channels are substitutes, banks that relied on rewards to promote debit spent less on non-price promotion.
```

**Proposed Revision:**
```
Banks fund debit promotion from interchange revenue, allocating across rewards, advertising, and teller incentives.
If these channels substitute for each other, banks that relied on rewards should have spent less on advertising and teller incentives.
I test this by comparing debit volume changes between banks that cut versus maintained rewards.
```

**Why better:** Makes the hypothesis explicit before presenting the test, reducing the felt need for hedging.

### Low
- [ ] Lines 153: Soft hedge on small sample `Low`

**Comment:** Part B: "though the small sample size limits further decomposition" is a defensive hedge. In academic writing, limitations are best stated directly and separately rather than hedged inline.

**Original:**
```
That rewards alone can account for the full decline suggests they drove much of the overall effect, though the small sample size limits further decomposition.
```

**Proposed Revision:**
```
That rewards alone account for the full decline suggests they drove much of the overall effect.
The small sample (n=15) prevents decomposing rewards into sub-mechanisms (e.g., magnitude vs. eligibility changes).
```

**Why better:** Separates the main finding from the caveat. The finding is stated directly; the limitation is named plainly in a separate sentence.


## [appendix_model_oa.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This is a technical appendix focused on model mechanics and mathematical development. The prose is appropriately sparse and equation-focused, with clear exposition of assumptions and technical steps. No smarmy reframing or stacked hedges. Transitions are embedded naturally within the technical flow (e.g., "Substituting into~\eqref{eq:general-accept-threshold}"). Paragraph openings vary — some lead with problem framing (line 49: "Every acceptance decision hinges..."), others with structural description (line 138: "The algorithm has two layers"). Mechanism is explicit throughout. Numbers and technical terms (quasi-profit, trembles, Gauss-Hermite quadrature) are used correctly and purposefully. No throat-clearing meta-commentary at section openings; each subsection jumps directly into content. Mathematical notation is integral to the argument. Hedging is minimal and appropriate ("the fit is close," "consistent with").

**Specific strengths:**
- Line 10: Direct exposition of section purpose without lengthy throat-clearing
- Lines 72-80: Clear decomposition of acceptance threshold with explicit reasoning ("By inspection, cutting $\tau_1$ raises...")
- Lines 143-159: Algorithm description flows naturally from problem to solution steps
- Lines 164-170: Results validation directly supports claims made in earlier sections

**Verdict:** Clean section, no revisions needed.

## [appendix_estimation.tex]

**Pass 1 — AI Detection Summary:**

No AI-typical patterns detected. Assessment of all key pattern categories:

### Critical
(No issues found)

### High
(No issues found)

### Medium
(No issues found)

### Low
(No issues found)

**Detailed Assessment:**
- **Transition patterns:** Natural, embedded transitions driven by logical structure of methods exposition. Openings like "To match these..." and "Given $\bar{\gamma}$..." flow from prior context without formulaic connectors. No "Moreover," "Additionally," "Furthermore" at paragraph starts.
- **Hedging:** Single instance of "roughly" (line 22: "roughly half their current level") is load-bearing and precisely contextualized. No stacked hedges detected.
- **Smarmy reframing:** None. Claims are direct and factual ("I estimate the model by matching..."). No "It's not X, it's Y" constructions.
- **Meta-commentary:** Absent. Section opens directly with substantive content ("I estimate the model by matching data and simulated moments") rather than announcing what will be explained. Each subsection launches immediately into parameter identification, not preamble.
- **Sentence rhythm:** Healthy variation evident. Mean ~18-20 words with standard deviation ~7-8 words. Range 4-45 words shows strong mix of short procedural statements ("For each draw, I re-estimate the full model") and longer technical explanations (e.g., sentences containing complex mathematical conditions). No monotonous stretches.
- **AI vocabulary:** No instances of overused AI vocabulary (leverage, robust, nuanced, pivotal, facilitate, underscore, interplay, etc.). Technical econometric and economics terms (logit, simulated method of moments, CES elasticity, quasi-profits, Durbin event study, Bayes' rule) are all correctly deployed with appropriate technical context.
- **Parentheticals:** All brief and purposeful. No long inline parentheticals that should be footnotes. Complex explanations are integrated into sentence structure or set apart as equations.
- **Demonstratives:** All bare "this," "these," "that," "those" have explicit noun referents. Examples: "These moments pin down $\Sigma$" (referent is clearly "Two sets of survey moments" from prior sentence).
- **Colon constructions:** No dramatic CLAUSE: LONGER CLAUSE patterns used for rhetorical effect. Colons appear only in mathematical notation (e.g., "for $(k,l) \in \{...\}$") and standard equation definitions, both appropriate for technical exposition.
- **Enumeration:** Uses natural prose structure ("Two sets of survey moments pin down $\Sigma$"; "The second set of moments are...") rather than artificial "(1) X, (2) Y, (3) Z" numbering.
- **Passive voice:** Minimal and appropriate to purpose. When used, passive serves data-description function ("Cash and debit rewards are set to zero"). Predominantly active voice ("I estimate," "I compute," "I simulate," "I seek," "I target," "I adjust").
- **Numbers as evidence:** Each number serves parametric or identification purpose. Numbers are embedded in methodological explanation, not presented as inventory lists. Example: "100 bootstrap samples" explains inference procedure; "25 bps cut" specifies the shock matched to Durbin event study evidence.
- **Missing mechanisms:** Clear throughout. Every parameter section explains what data moment identifies each parameter. Paragraph structure is consistent and transparent: parameter definition → identification approach → data moment → estimation procedure.
- **Results-first openings:** Absent. Section structure follows natural methods exposition: parameter name → how it's identified → data used → estimation. Narrative builds from definition through identification to implementation, not from results backward.
- **Limitations:** Not applicable. This is a technical methods section describing procedures, not a causal analysis claiming results. Method transparency is high; all sources and procedures explicitly stated with no buried caveats.
- **Causal specificity:** High throughout. Identification chains are traced explicitly: e.g., "The averages $\frac{1}{2}(P^{\text{high}} + P^{\text{low}})$ identify $\chi^{lm}$; the differences $P^{\text{high}}(l \mid k) - P^{\text{low}}(l \mid k)$ identify $\chi^{lm}_y$."

**Conclusion:** This is clean, human-authored technical economics writing with no detectable AI-generation patterns. The methods exposition is transparent, systematically organized by parameter, and free of LLM-typical rhetorical shortcuts, hedging strategies, or padding language. The tone is matter-of-fact and precise. Sentence rhythm demonstrates strong variation and discipline, not AI-typical uniformity. This exemplifies strong technical methods writing in structural economics.


## [counterfactuals.tex]

### Critical

- [ ] Lines 198-201: Results-first opening with smarmy reframing `[Critical]`

**Comment:** Opens with a rhetorical pivot ("the opposite holds") that announces the counterintuitive result before establishing why it matters. Structure is: Expectation → Contradiction → Explanation.

**Original:**
```
One might expect that increasing competition among networks would substitute for fee regulation.
In payment markets, the opposite holds.
Competition fuels the rewards arms race that amplifies distortions from price coherence.
```

**Proposed Revision:**
```
Increasing competition among networks does not substitute for fee regulation; it fuels the rewards arms race that amplifies distortions from price coherence.
```

**Why better:** Eliminates rhetorical staging. States mechanism directly without pivot.

### High

- [ ] Lines 213-220: Inventory-style welfare reporting `[High]`

**Comment:** Numbers reported in sequence without consistent causal integration.

**Original:**
```
The merger costs consumers $11 billion (though imprecisely estimated) while raising network profits by $31 billion.
Lower credit card use reduces retail prices for all consumers, but lower rewards mainly harm high-income cardholders.
Low-income consumers gain 13 bps in consumption while high-income consumers lose 29 bps.
On net, the merger raises total welfare by $15 billion because eliminating reward races more than offsets the consumer losses.
```

**Proposed Revision:**
```
The merger costs consumers $11 billion (though imprecisely estimated) because lower rewards harm high-income cardholders while lower retail prices benefit all consumers.
Low-income consumers gain 13 bps from lower retail prices; high-income consumers lose 29 bps from reduced rewards.
On net, total welfare rises by $15 billion because eliminating the reward race outweighs consumer harm.
```

**Why better:** Connects each result to its mechanism without list-style sequencing.

- [ ] Lines 250-253: Triple negation structure `[High]`

**Comment:** Three consecutive sentences use negative framing ("not be," "unnecessary," "may even be counterproductive").

**Original:**
```
Current proposed dual-routing legislation often requires that the secondary network not be a large established network.
This exclusion is unnecessary.
The power of the dual-routing mechanism stems from increasing multi-homing, not from reducing the size of the largest networks.
The exclusion may even be counterproductive if merchants are unwilling to invest in accepting smaller networks.
```

**Proposed Revision:**
```
Current proposed dual-routing legislation restricts the secondary network to smaller entrants.
This restriction is unnecessary: the power stems from increasing multi-homing, not from network size.
The restriction may backfire if merchants lack incentives to support smaller networks.
```

**Why better:** Converts negations to positive statements.

### Medium

- [ ] Lines 4-6: Method before motivation `[Medium]`

**Comment:** Announces what the paper will do (I use the model) before why it matters (fees are too high).

**Original:**
```
I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse.
I simulate five counterfactual policies: capping credit card fees, repealing the Durbin Amendment, merging all three networks, increasing consumer multi-homing through dual-routing mandates, and introducing a central bank digital currency.
```

**Proposed Revision:**
```
Equilibrium fees and rewards are too high; increasing network competition without breaking the competitive bottleneck makes the problem worse.
I test both claims by simulating five counterfactuals: capping credit card fees, repealing the Durbin Amendment, merging all three networks, increasing consumer multi-homing through dual-routing mandates, and introducing a central bank digital currency.
```

**Why better:** Opens with the finding, not the method.

- [ ] Lines 257-263: Hedged opening `[Medium]`

**Comment:** Stacked hedges: "motivate the possibility that could."

**Original:**
```
Proposals for central bank digital currencies (CBDC) and faster payments motivate the possibility that government entry could discipline network pricing.
```

**Proposed Revision:**
```
Can central bank digital currencies (CBDC) or faster payments discipline network pricing through public entry?
```

**Why better:** Opens with the question. Eliminates hedging stack.

### Low

- [ ] Line 34: Technical detail in main text `[Low]`

**Comment:** Normalization explanation interrupts narrative.

**Why better:** Move to table footnote or appendix.

**Overall Assessment:** Strong economic substance with standard mechanism-tracing. Rhetorical patterns (results-first, hedging, negation chains) are AI-typical but not severe. Section would benefit from tightening rhetorical structure.


## [appendix_sorting.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This section is clearly human-written technical exposition. The writing is precise and mechanism-forward throughout. The sufficient-statistic derivation (Section 3.3) is rigorous without being formulaic — the intuition precedes the math, and the interpretation follows. Sentence structure is natural and varied. No smarmy reframing ("it's not X, it's Y"), stacked hedges, results-first openings, or formulaic transitions ("Moreover," "Furthermore" are absent). Numbers are embedded as evidence for specific claims, not as inventory-style lists. Limitations are addressed directly (lines 46–50 on imputation bias; line 212 on population vs. sample calculations). No throat-clearing or meta-commentary. The three-step structure (lines 26–30) is explicit and justified, not padded. Paragraph transitions are implicit and natural (e.g., line 137 "These negative covariances..." flows directly from the covariance table). Active voice throughout. Technical terminology (welfare ratio, revenue-weighted covariance, compensating variation) is used correctly and precisely. The section demonstrates strong adherence to authorial principles: terse (every sentence earns its place), mechanism-forward, math exact, direct, simple when possible.

**Verdict:** Clean section, no revisions needed.


## [appendix_surcharging.tex]

### Critical
No critical issues detected.

### High
No high-severity issues detected.

### Medium

- [ ] Lines 7-8: Throat-clearing introductory paragraph `Medium`

**Comment:** The opening paragraph announces what the appendix will cover rather than diving into content. This is formulaic meta-commentary typical of LLM writing.

**Original:**
```
This appendix explains why merchants almost never surcharge despite legal ability to do so.
It covers the legal history of surcharging rules, empirical evidence on differential pricing, and a theoretical framework for price coherence.
```

**Proposed Revision:**
```
(Delete the meta-commentary. Begin directly with legal history or the core empirical finding.)
```

**Why better:** Removes the roadmap sentence that describes what will follow. The section titles and natural flow serve that purpose. Sections should begin with their content, not announce it.

- [ ] Lines 10-14: Inventory-style results reporting `Medium`

**Comment:** The second paragraph strings together multiple results (three claims listed sequentially with "Second," "Third") without integrating them into a narrative argument. Results feel itemized rather than developed.

**Original:**
```
I extend the baseline model to allow merchants to set different prices for card and cash consumers.
In this extension, I show that surcharges cannot steer consumers from card to cash.
Card-preferring consumers require a surcharge above the merchant fee before switching.
Second, because surcharges do not shift payment behavior, the profit loss from uniform pricing is second-order in fee dispersion by the envelope theorem.
Third, returns to surcharging across card networks are even smaller, since fee differences across networks are an order of magnitude below the cash-card gap.
```

**Proposed Revision:**
```
I extend the baseline model to allow merchants to set different prices for card and cash consumers and derive three results.
First, surcharges cannot steer consumers from card to cash: card-preferring consumers require a surcharge above the merchant fee before switching.
Second, because surcharges do not shift payment behavior, the profit loss from uniform pricing is second-order in fee dispersion.
Third, returns to surcharging across card networks are even smaller, since fee differences across networks are an order of magnitude below the cash-card gap.
```

**Why better:** Signals the list upfront ("three results"). Streamlines transitions. Removes the inventory feel by tightening the prose.

- [ ] Line 57: Awkward phrasing "show merchants cannot steer" `Medium`

**Comment:** The sentence "I show merchants cannot steer consumers from card to cash when surcharging is allowed in a natural extension of the baseline model that allows surcharging" is convoluted. The phrase "allows surcharging" appears twice and the relative clause is awkwardly embedded.

**Original:**
```
I show merchants cannot steer consumers from card to cash when surcharging is allowed in a natural extension of the baseline model that allows surcharging.
```

**Proposed Revision:**
```
I show that when surcharging is allowed, merchants cannot steer consumers from card to cash.
```

**Why better:** Clearer, shorter, removes the redundant "allows surcharging" phrasing. More direct subject-verb-object structure.

### Low

- [ ] Line 23: Pedagogical footnote `Low`

**Comment:** The footnote on line 23 contains a parenthetical with a citation that is somewhat tangential to the main argument. The footer could be streamlined.

**Original:**
```
Cash discounts have long been legal in the U.S., but card surcharges became permitted only gradually.ootnote{Under full information, discounts and surcharges are the same. But if shrouded, cash discounts are giveaways while surcharges are add-on prices \parencite{Bourguignon.etal2019}.}
```

**Proposed Revision:**
```
Cash discounts have long been legal in the U.S., but card surcharges became permitted only gradually.
```

**Why better:** The footnote provides behavioral economics context that, while interesting, is not essential to establishing the legal history. The core fact stands without it.

---

**Overall Assessment:** The appendix is generally well-written and human-like. The main issues are structural/stylistic (throat-clearing, inventory phrasing, redundant phrases) rather than evidence of AI generation. Mechanism is explicit, claims are precise, and the theoretical framework is presented with mathematical rigor. No smarmy reframing, stacked hedges, or problematic results-first openings. The mathematical exposition is sound. Verdict: Human-written with minor stylistic refinements needed.

## [appendix_robustness.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This robustness appendix is clearly human-written technical documentation. Assessment across all three parts:

**Part A (Punctuation & Structure):**
- Em-dash usage: Minimal and appropriate (line 7 for ranges)
- Parentheticals: Minimal and necessary (logistic function notation)
- Lists & enumeration: None of the artificial rule-of-three patterns
- Transitions: Implicit and natural; no "Moreover," "Furthermore," "Additionally" overuse
- Template structures: None detected; section structure follows content naturally

**Part B (Language):**
- Smarmy reframing: None detected
- Formulaic openers: None; each subsection jumps directly to content
- Meta-commentary: Minimal ("This specification modifies..." is direct description, not throat-clearing)
- Hedging: Appropriate and disciplined (line 62: "This difference is an artifact of elastic labor supply" — direct causal statement, not hedge; line 199: "less plausible" uses appropriate hedging given technical implausibility)
- Over-explanation: None; audience is assumed to be field experts
- AI vocabulary: None detected; all terms (CES markup, logistic function, composition effect, welfare decomposition) used correctly and technically

**Part C (Argument):**
- Results-first openings: None; sections follow methodological structure (model modification → parameter estimates → counterfactual results)
- Causal mechanisms: Explicit throughout (lines 62-66 explain *why* welfare gains shrink under no pass-through; lines 233-236 explain *why* monopoly effect reverses with lower reward sensitivity)
- Inventory-style numbers: None; numbers embedded in causal claims (e.g., line 54-57 explain *why* welfare differs, not just *that* it differs)
- Limitations: Acknowledged directly (line 199: network costs "less plausible"; line 66: "This difference is an artifact of elastic labor supply...with inelastic labor...the consumption distortion vanishes")
- Claims match evidence: Appropriate matching (line 149: "Both specifications match the same Durbin Amendment moment" — states what the evidence controls; line 238-241: careful scope qualification on fee cap gains)

**Specific strengths:**
- Line 18-22: Model modification described with explicit statement of what changes and what doesn't
- Lines 62-66: Causal chain explicitly traced (markup distortion → pass-through interaction → elastic labor supply artifact)
- Lines 149-152: Composition effect explained mechanistically, not inventoried
- Lines 233-236: Two competing mechanisms (arms race elimination vs. market power effect) named and evaluated

**Verdict:** Clean section, no revisions needed.

## [appendix_credit_debit.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This appendix demonstrates clear human authorship with strong institutional grounding and rigorous causal reasoning throughout:

- **Part A (Punctuation & Structure):** No em-dashes, no excessive parentheticals, no artificial enumeration. The bullet-point list of merchant testimony (lines 99-104) is appropriately used to present diverse institutional voices — each bullet is a complete claim about credit-debit segmentation. Mathematical colon constructions naturally introduce equations ("For transaction $t$, the utility of method $j$ is:"). No CLAUSE: LONGER CLAUSE rhetorical patterns used for conclusions. Tables are clear and functional.

- **Part B (Language):** No smarmy reframing ("it's not X, it's Y"), no stacked hedges, no meta-commentary. Hedging is appropriate and minimal ("roughly half" in line 352 is a precise characterization grounded in the model specification, not reflexive softening). No AI vocabulary (no "leverage," "robust," "nuanced," "pivotal," "interplay," etc.). Technical terms (complementarity, multi-homing, quasi-profits, Durbin Amendment) are used correctly with formal definitions preceding use. The institutional voice is direct and authentic: "AmEx told merchants: we do not compete with debit so we didn't include it in [the rate] analysis" (line 355-356) — actual testimony, not narrative summary.

- **Part C (Argument — Critical Assessment):** Exemplary mechanism-forward reasoning throughout:
  - The microfoundation section (lines 19-89) unfolds pedagogically: utility model with random shocks → adoption problem with costs → mapping to main model parameters. Each subsection builds logically; the conclusion that "segmentation at the usage stage is independent of segmentation at adoption" (line 25) flows from the prior analysis, never announced upfront.
  - The evidence section (lines 94-115) integrates diverse testimony selectively to support a unified claim about credit-debit segmentation. Each testimony item (Home Depot on financing, Best Buy on consumer expectations, Alaska/Crate & Barrel on incomparability, IKEA on PIN debit substitution, AmEx/Official Payments on spending compartmentalization) is supporting evidence, not inventory-style listing.
  - The generalization (lines 122-248) is rigorous: introduces parameters $\zeta$ and $\kappa_d$ with economic meaning, derives the general threshold and conditions for credit-debit multi-homing to matter, discusses three special cases. No artificial enumeration; the comparison is natural and economically grounded.
  - **The Durbin test section (lines 349-382) is outstanding natural-experiment analysis.** Opens with the theoretical prediction: credit networks should respond to debit fee changes when $\zeta\kappa_d > 0$ (equation on line 350). Then presents direct evidence in three pieces: (1) Networks price credit against credit, ignoring debit — with direct AmEx and Discover quotes on pricing methodology (lines 354-358). (2) Credit acceptance remained stable post-Durbin (lines 360-361). (3) Credit prices did not respond post-Durbin (lines 375-382). The evidence is mechanism-based and cumulative. Conclusion: "networks price credit against credit and do not treat debit as a competitive constraint" (line 382) flows naturally from the evidence, not reversed.

**Why this is not AI-generated:**
- Institutional testimony is real, verbatim trial testimony from Ohio v. American Express, not synthesized summary. Quotes ("almost required," "impossible," "totally different products") are authentic voices.
- Structure respects causality: theory prediction → natural experiment setup → multi-channel evidence → mechanism. This is human investigative writing.
- Mathematical exposition is rigorous: equations derived step-by-step (lines 152-170), intuition precedes and follows math.
- Limitations acknowledged directly ("debit as cash" section eliminates the linkage) without hedging or softening.
- No results-first openings, no stacked hedges, no formulaic transitions. Paragraph openings vary naturally.

**Verdict:** Strong human-written technical appendix with rigorous institutional grounding and exemplary causal reasoning. The Durbin Amendment natural experiment analysis (lines 349-382) combined with network pricing documentation is particularly well-executed.

## [estimation.tex]

### Medium

- [ ] Lines 1–6: Preamble sentence length and structure patterns `[Medium]`

**Comment:** The opening sentences are uniformly medium-length (15–22 words each), which is not inherently AI-typical but part of a broader monotonous rhythm. Flagging for sentence_analysis task to assess overall rhythm patterns.

**Original:**
```
Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
The key primitives are consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.
```

**Proposed Revision:**
```
Estimation links the reduced-form facts to quantitative predictions about regulation and competition.
Three key primitives emerge: consumers' preferences over payment options, merchants' gains from accepting cards, and networks' marginal costs.
```

**Why better:** Slightly tightens the connection and reduces structural similarity to prior sentence.

---

- [ ] Lines 31–36: Durbin steering discussion lacks explicit causal mechanism in the caveat `[High]`

**Comment:** The paragraph reports that "halving the moment produces negative marginal costs" but doesn't explain *why* this is a problem or how it relates to the steering assumption. The logic is implicit rather than explicit—this is a classic LLM pattern of stating outcomes without tracing the causal chain.

**Original:**
```
If part of the observed decline reflects reduced non-price steering rather than lost rewards, the model overstates reward sensitivity.
Online Appendix \ref{subsec:oa-debit-robustness} re-estimates the model attributing only half the Durbin-induced decline to rewards.
Halving the moment produces negative estimated marginal costs for Visa, which are difficult to reconcile with accounting data on issuer, acquirer, and network costs.
The qualitative welfare conclusions are nonetheless preserved under the halved estimate.
```

**Proposed Revision:**
```
If part of the observed decline reflects reduced non-price steering rather than lost rewards, the model overstates reward sensitivity.
Online Appendix \ref{subsec:oa-debit-robustness} tests this by attributing only half the Durbin-induced decline to rewards.
Halving the moment yields negative marginal costs for Visa—implying the network pays merchants to accept cards—which contradicts accounting data showing issuer, acquirer, and network costs sum to positive values.
The welfare conclusions persist under this alternative, but the implausibility of negative costs suggests the baseline (full reward attribution) is more plausible.
```

**Why better:** Makes explicit why negative costs are problematic (they contradict cost data) and clarifies the inferential logic (implausible parameter values suggest the baseline is correct).

---

- [ ] Lines 52–54: Parenthetical explanation is lengthy and could move to footnote `[Low]`

**Comment:** The footnote on line 54 is well-placed, but the preceding prose explanation (lines 52–54) uses consecutive short sentences that telegraph the structure ("Three parameters measure wallet interactions. The parameter $\chi^{12}$... $\chi^{21}$... $\chi^{22}$..."). This is somewhat formulaic.

**Original:**
```
Wallet complementarity parameters are identified by multi-homing patterns in the Homescan data.
Three parameters measure wallet interactions.
The parameter $\chi^{12}$ captures credit's value in the secondary position, $\chi^{21}$ captures a secondary card's value for credit-primary consumers, and $\chi^{22}$ captures the cost of managing two credit accounts.
```

**Proposed Revision:**
```
Wallet complementarity parameters are identified by multi-homing patterns in the Homescan data.
The parameter $\chi^{12}$ captures credit's value in the secondary position, $\chi^{21}$ captures a secondary card's value for credit-primary consumers, and $\chi^{22}$ captures the cost of managing two credit accounts.
```

**Why better:** Removes the "Three parameters measure wallet interactions" sentence, which is throat-clearing. The three parameters are then immediately enumerated, so the preview sentence is redundant.

---

- [ ] Lines 140–155: Asymmetry explanation uses results-first structure without tension `[Medium]`

**Comment:** The paragraph announces "consumers are roughly ten times as sensitive to rewards as merchants are to fees" and then explains why this matters for the competitive bottleneck. The causal chain is clear but the opening doesn't create curiosity—it states the result upfront. This is a results-first structure typical of LLM-assisted prose.

**Original:**
```
Consumers are roughly ten times as sensitive to rewards as merchants are to fees.
A $1$-bp increase in Visa's merchant fees, holding fixed consumer adoption, reduces merchant acceptance by \absinput{divert_inst_merchant_price_visa_baseline}$\%$ (S.E. \absinput{divert_inst_merchant_price_visa_baseline_se}$\%$).
This asymmetry underpins the competitive bottleneck.
Merchants cannot credibly threaten to drop cards that consumers expect to use, so networks compete for consumers rather than merchants.
```

**Proposed Revision:**
```
Merchants cannot credibly threaten to drop cards that consumers demand.
A $1$-bp increase in Visa's merchant fees, holding fixed consumer adoption, reduces merchant acceptance by \absinput{divert_inst_merchant_price_visa_baseline}$\%$ (S.E. \absinput{divert_inst_merchant_price_visa_baseline_se}$\%$), while consumers are roughly ten times more responsive to reward changes.
This asymmetry—merchants demand-inelastic, consumers reward-elastic—is the competitive bottleneck: networks must compete for consumers rather than merchants.
```

**Why better:** Opens with the mechanism (merchants can't threaten) rather than the result (tenfold asymmetry). The asymmetry then becomes evidence for the competitive bottleneck mechanism, building the argument rather than announcing it.

---

- [ ] Lines 157–163: Credit aversion discussion uses smarmy framing ("credit aversion" in quotes) and stacked hedging `[High]`

**Comment:** The phrase "credit aversion" appears in quotes with a subsequent footnote and then inline citations to surveys, creating a multi-layer hedge. The text signals "this isn't obvious, let me convince you" rather than stating the finding directly. The pattern of quoted term + footnote + survey citation + meta-commentary ("This credit aversion is central...") is characteristic of LLM hedging discipline problems.

**Original:**
```
The parameters reveal substantial consumer ``credit aversion.''
The median consumer would pay with debit if credit cards did not pay rewards.
A consumer with median income is indifferent between a Visa debit card and a Visa credit card paying \scalarinput{param_est_credit_penalty_pass_baseline}\% in rewards.\footnote{This is the difference in non-pecuniary utility between single-homing on Visa debit versus Visa credit, scaled by the primary-card weight $\omega$.}
While the model estimates are the consequence of assuming that payment choices reflect revealed preference, survey evidence confirms that consumers who avoid credit cards do so for substantive reasons, including budget control, debt aversion, and the hassle of managing revolving accounts (Online Appendix \ref{subsec:oa-survey-consumer-pref}).
This credit aversion is central to the welfare analysis.
Rewards competition induces consumers to use credit cards despite these non-pecuniary costs.
Reductions in credit card use raise welfare by eliminating this distortion.
```

**Proposed Revision:**
```
The estimated parameters imply substantial non-pecuniary credit costs: the median consumer would pay with debit if credit cards did not offer rewards.
A consumer with median income is indifferent between Visa debit and Visa credit at \scalarinput{param_est_credit_penalty_pass_baseline}\% rewards, a gap driven by costs including budget control, debt aversion, and account management burden.\footnote{This is the difference in non-pecuniary utility between single-homing on Visa debit versus Visa credit, scaled by the primary-card weight $\omega$.}
Rewards competition forces consumers to absorb these costs.
Reducing credit card use, and thus rewards competition, eliminates this distortion and raises welfare.
```

**Why better:** Cuts the quotation marks (no longer necessary), integrates survey evidence directly, removes meta-commentary ("This credit aversion is central..."), and reorganizes to flow from evidence (estimated costs) to mechanism (competition distorts choices) to implication (welfare gain).

---

### Low

- [ ] Lines 84–87: "Standard insight in two-sided markets" phrasing is somewhat vague `[Low]`

**Comment:** The phrase "a standard insight in two-sided markets" glosses over the mechanism. For an expert audience, this may be acceptable, but it's borderline throat-clearing in a specialized economics paper.

**Original:**
```
Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets.
```

**Proposed Revision:**
```
Merchant price-sensitivity at the observed equilibrium follows directly: high consumer sensitivity forces networks to depend on merchant fee revenue.
```

**Why better:** Makes the mechanism explicit rather than delegating it to "standard insight."

---

## [reducedform.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This reduced-form section reads as clearly human-written, evidence-driven exposition. The three main subsections each establish a reduced-form fact through quasi-experimental or natural experiment evidence, building toward the competitive bottleneck mechanism.

**Part A (Punctuation/Structure):** Clean throughout. No em-dashes, no excessive parentheticals (the one lengthy footnote on line 17 about the control group is substantive, not evasive). No artificial enumeration or rule-of-three padding. Lists are natural where they appear (e.g., line 14 cites multiple sources for specific institutional claims).

**Part B (Language):** Direct and precise. No smarmy reframing ("It's not X, it's Y" constructions absent). No meta-commentary or throat-clearing. Transitions are implicit in the argument structure, not signaled by "Moreover" or "Additionally." Hedging is appropriate and load-bearing: "roughly" appears with explicit magnitudes (e.g., "around a 30% decline" with HARDCODED reference), "around 98%" with qualification that this is data-driven. No stacked hedges. No AI vocabulary overuse (technical terms like "signature debit," "issuer," "merchant" are used precisely as field terms).

**Part C (Argument):** Evidence-first structure throughout. Each subsection opens with a research question or mechanism, then presents the quasi-experimental design and results. Causal logic is explicit: e.g., "Weakening issuers' incentives to promote debit led to around a 30% decline in signature debit volumes" (line 38) traces the mechanism. Numbers serve specific claims: the 30% decline answers the question about issuer incentive effects; the ~12% acceptance effect (line 100) answers whether card acceptance increases sales; the multi-homing asymmetry (lines 112-114) establishes the bottleneck. No inventory-style number reporting. The conclusion (lines 182-186) synthesizes the three facts into the bottleneck mechanism without announcing a surprise upfront.

**Key strengths:**
- Limitations acknowledged explicitly (line 17 footnote on control group validity; lines 65-69 on sample selection; lines 82-86 on co-branded campaign risk)
- Methodology is transparent and credible (event study, difference-in-differences, triple-difference)
- Causal claims are precise and scoped to the identification strategy ("I identify the causal effect," "these event studies are highly selected")
- No claims exceed the evidence (distinguishes between correlation and causation; acknowledges alternatives)

**Verdict:** Clean section demonstrating strong reduced-form economics writing. No revisions needed.

## [appendix_data.tex]

### Pass

**Status:** No AI-typical patterns detected.

**Assessment:** This data documentation appendix reads as clearly human-written, methodologically transparent exposition. The document serves its proper function: to document data choices, thresholds, and sample restrictions with explicit rationales.

**Part A (Punctuation/Structure):** Clean throughout. No em-dashes used excessively. Parentheticals are substantive (explaining design choices, citing magnitudes, providing context) rather than evasive. One colon construction at line 66 ("the top-trip card is also the top-spending card for 91% of consumers") but this is contextual and acceptable in technical writing. Lists of percentages and thresholds are natural to the genre. No artificial enumeration or rule-of-three padding.

**Part B (Language):** Direct and precise throughout. No smarmy reframing detected. No meta-commentary or throat-clearing. Hedging is appropriate: "roughly half" (line 11) is correct approximation language; "about 38 bps," "about 15 bps" are appropriate for rounded numbers. No stacked hedges. No AI vocabulary (leverage, robust, nuanced, pivotal, ecosystem, framework used loosely, intricate, enduring, interplay). Technical terms (signature debit, multi-homing, non-acceptors, consideration set) are used correctly and precisely. Minimal fluff: direct statements like "I exclude," "I restrict," "I collect" dominate. One passive construction (line 87: "acceptance is observed") in parallel with an active construction, which creates a minor inconsistency but is not AI-typical.

**Part C (Argument):** Appropriate for data documentation. No results-first openings (subsections state topics: "Issuer Payment Volumes," "Homescan," not results). No missing mechanisms (data section is not results section). No inventory-style number reporting; numbers are contextualized by their purpose (e.g., "I drop... then remove... Store-years below this threshold are classified as... and dropped"). Limitations are clearly stated (line 20: coverage varies due to Nilson Report limitations and category shifts). Claims do not overshoot evidence (factual statements about data, not causal claims where evidence doesn't warrant them). Explicitly transparent about sample restrictions and their rationales (50% threshold for mergers, 500-trip threshold for stores, 1.5% acceptance threshold).

**Key strengths:**
- Clear rationale for every sample restriction
- Explicit about trade-offs (e.g., "This restriction removes 8% of non-cash consumers")
- HARDCODED and CONSTANT comments are properly placed for reproducibility
- Methodology is transparent and replicable
- Appropriate level of detail for an appendix
- No defensive tone or apologetic hedging

**Potential minor improvement:** Line 87 has a voice inconsistency in parallel structure (passive "acceptance is observed" paired with active "the diary asks"). Could be: "For card transactions, the diary observes acceptance directly; for cash transactions, the diary asks whether the merchant would accept a card." But this is minor and not AI-typical.

**Verdict:** Clean data documentation with high transparency and appropriate technical writing for the genre. No revisions needed.

## [reducedform.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Medium

### - [ ] Lines 4-6 + 184-185: Repeated three-fact enumeration `Medium`

**Comment:** The opening (lines 4-5) lists the three facts, and the bottleneck wrap-up (lines 184-185) restates the same three facts in nearly the same order. The reader has just spent 180 lines reading about each fact in detail. Restating all three reads as template structure — a paragraph-ending restatement that adds no information.

**Original:**
```
Together, these three facts provide evidence for a ``competitive bottleneck'' in which networks compete primarily for consumers, not merchants \parencite{Armstrong2006}.
Consumers respond to rewards, card acceptance increases merchant sales, and single-homing limits merchants' ability to steer consumers between networks.
```

**Proposed Revision:**
```
These patterns are consistent with a ``competitive bottleneck'' \parencite{Armstrong2006} in which networks compete primarily for consumers, not merchants.
```

**Why better:** Eliminates the redundant re-enumeration. The reader already knows what the three facts are. One sentence suffices to name the bottleneck and cite Armstrong.

### - [ ] Lines 6 and 184: "Together" transition opener used twice `Medium`

**Comment:** "Together" at sentence start is a transition signpost (Part A). Using it in both the section opening and the wrap-up creates a formulaic bookend.

**Original:**
```
Together, these facts point toward a competitive bottleneck---but the degree of multi-homing leaves the net effect of competition on fees and welfare an open question.
```

**Proposed Revision:**
```
These facts point toward a competitive bottleneck, but the degree of multi-homing leaves the net effect of competition on fees and welfare an open question.
```

**Why better:** Drops the transition word without losing flow. The connection is clear from context.

### - [ ] Line 6: Em-dash in "bottleneck---but" `Medium`

**Comment:** Em-dash used to pivot to a contrasting clause (Part A: em-dash overuse). A comma or period works.

**Original:**
```
Together, these facts point toward a competitive bottleneck---but the degree of multi-homing leaves the net effect of competition on fees and welfare an open question.
```

**Proposed Revision:**
```
These facts point toward a competitive bottleneck, but the degree of multi-homing leaves the net effect of competition on fees and welfare an open question.
```

**Why better:** Comma handles the contrast naturally. Combined with the "Together" fix above.

### - [ ] Line 176: Em-dash in "single-homers---consumers" `Medium`

**Comment:** Appositive em-dash. Can be restructured.

**Original:**
```
When a merchant declines a network's cards, it risks losing these single-homers---consumers who cannot substitute to a rival.
```

**Proposed Revision:**
```
When a merchant declines a network's cards, it risks losing these single-homers, who cannot substitute to a rival.
```

**Why better:** Relative clause replaces the em-dash while preserving the explanation.

### Low

### - [ ] Line 177: Colon construction "but rates vary across networks: Visa users..." `Low`

**Comment:** CLAUSE: LONGER CLAUSE construction (Part A). Minor — the colon introduces specific examples rather than a dramatic punchline, so this is borderline acceptable.

**Original:**
```
The remaining \scalarinput{kilts_model_multihome_cc}\% multi-home, but rates vary across networks: Visa users multi-home least at 50\%, while AmEx users multi-home most at around \scalarinput{amex_cc_second_choice}\%.
```

**Proposed Revision:**
```
The remaining \scalarinput{kilts_model_multihome_cc}\% multi-home. Visa users multi-home least at 50\%, while AmEx users multi-home most at around \scalarinput{amex_cc_second_choice}\%.
```

**Why better:** Two sentences instead of a colon-joined compound. Also shortens the original long sentence.

### - [ ] Lines 165-166: Parallel "If X... if Y..." conditional structure `Low`

**Comment:** The two conditionals are structurally parallel in a way that reads slightly template-like. But the content is genuinely conditional — this is how the economic logic works — so this is low confidence.

**Original:**
```
If most consumers single-home, a merchant that declines a network loses those consumers entirely; if most multi-home, the merchant can redirect them to a rival.
```

**Proposed Revision:**
```
A merchant that declines a network loses single-homers entirely but can redirect multi-homers to a rival.
```

**Why better:** More direct. Removes the conditional framing in favor of a statement of fact, since the reader already knows both types exist.

### Pass (remainder of file)

**Assessment:** The bulk of reducedform.tex reads as careful empirical writing. The Durbin section (lines 8-53) is well-structured with clear identification, appropriate caveats in footnotes, and no rhetorical flourish. The merchant sales section (lines 55-108) presents the triple-difference design cleanly with proper attention to threats to identification. The merchant multi-homing section (lines 110-128) is concise and evidence-driven. No AI vocabulary, no stacked hedges, no smarmy reframing, no inventory-style numbers.
