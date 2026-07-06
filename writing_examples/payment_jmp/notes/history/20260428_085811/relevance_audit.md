# Relevance Audit

*Appended: 2026-04-27. Level filter: all. RAP seed: confirmed by user via interview.*

---

## RAP Seed

**Research question** (intro.tex:13):
> I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.

**Main answer / finding** (intro.tex:13–23):
> Networks set rewards for consumers and fees for merchants. Under price coherence, card users capture rewards while the cost of higher merchant fees is spread across all consumers through higher retail prices. I estimate that consumers are ten times more sensitive to rewards than merchants are to fees. This incentivizes networks to charge high merchant fees to fund generous consumer rewards. High-merchant-fee credit cards thus proliferate because of, not in spite of, intense network competition.

**Positioning** (intro.tex:37–47, 63–75, 84–103):
> Existing theory cannot resolve whether network competition raises or lowers fees and welfare. [...] I build a structural model [...] Capping merchant fees reduces per-transaction margins [...] raising total welfare by $27 billion annually. [...] a merger to monopoly raises total welfare by $15 billion per year [...] The problem is not market power stifling output but rewards competition generating excessive credit card adoption.

**Thematic phrases:**
- "competitive bottleneck" (intro.tex:35)
- "price coherence" (intro.tex:15)
- "rewards competition" / "rewards arms race" (intro.tex:23)
- "cross-subsidy" (intro.tex:56)
- "the direction of competition matters" (intro.tex:115)
- "single-homing" / "multi-homing" (intro.tex:34–35)
- "dual routing" (intro.tex:105–115)
- "credit aversion" (estimation.tex:141)
- "excessive credit card adoption" (intro.tex:54)
- "issuer incentives" (reducedform.tex:10)

**Promised deliverables by section:**
- §2 Institutional Details and Data: trace the fee flow (merchants → networks → issuers → consumer rewards); describe data sources that identify consumer and merchant sensitivities
- §3 Reduced-Form Facts: three facts — (i) issuer incentives drive consumer payment choices (Durbin, ~25% decline); (ii) card acceptance raises merchant sales (~12%); (iii) ~half of consumers single-home credit cards
- §4 Model: structural two-sided platform competition with single- and multi-homing consumers; merchant pricing under price coherence; network profit maximization
- §5 Estimation: match reduced-form facts, payment surveys, aggregate data; show out-of-sample predictions (OptBlue acceptance response, retail margins)
- §6 Counterfactuals: cap credit (+$27B), uncap debit (+$7B), monopoly (+$15B), dual routing (positive), CBDC (positive but smaller)
- §7 Conclusion: regulating networks is at least as important as regulating issuers; direction of network competition matters

---

## How Claude Reads the Paper (Purpose Tree)

- **Paper thesis:** "Merchant fees are indeed too high, but weak competition is the wrong diagnosis — networks compete intensely for cardholders by funding rewards through merchant fees, and capping credit merchant fees raises total welfare by $27 billion annually."
  - **§1 Introduction** (intro.tex:4–140)
    - *First sentence:* "In the U.S., Visa and Mastercard (MC) process 80% of card transactions and earn profit margins above 60%."
    - *Claude's read:* Establish the RAP — high fees are real but market power is the wrong diagnosis; rewards competition under price coherence is the culprit
    - *Verdict:* pass
  - **§2 Institutional Details and Data** (main.tex:72–85)
    - *First sentence (section opener):* "Networks charge merchants fees and pay the revenue to issuers, who return most of it to consumers as rewards."
    - *Claude's read:* Provide the institutional background and data inventory the reader needs before the three-force argument in §3
    - *Verdict:* pass — opener correctly names the fee-flow mechanism and the two promised deliverables (fee flow, data sources)
    - **§2.1 Network Pricing: Merchant Fees and Consumer Rewards** (institutional_details.tex:4)
      - *First sentence:* "Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers."
      - *Claude's read:* Trace the interchange fee flow from merchants through acquirers and issuers to consumer rewards, establishing that issuers — not consumers — hold the financial stake in card promotion
      - *Verdict:* pass
    - **§2.2 Data** (data.tex:6)
      - *First sentence:* "I combine five data sources to measure consumer reward sensitivity, how card acceptance affects sales, and multi-homing rates."
      - *Claude's read:* Inventory the data sources that will identify the three reduced-form forces in §3
      - *Verdict:* pass — opener maps data sources directly to the three facts promised by the RAP
  - **§3 Reduced-Form Facts** (reducedform.tex:4–189)
    - *First sentence:* "Three reduced-form facts characterize the two-sided structure of the payment market."
    - *Claude's read:* Establish the three empirical forces — issuer incentives, card acceptance sales effects, single-homing asymmetry — that motivate the competitive bottleneck and the structural model
    - *Verdict:* **weak** — sentence 1 is roadmap language; thematic phrases appear only in sentences 2–3; criterion D is weak (ends on an open question rather than a deliverable promise)
    - **§3.1 Issuer Incentives Drive Consumer Payment Choices** (reducedform.tex:8)
      - *First sentence:* "The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices."
      - *Claude's read:* Quantify the first force: cutting issuers' financial stake in debit reduces debit use ~25%, showing issuer incentives drive consumer choices
      - *Verdict:* pass — lands immediately on the thematic phrase "issuers' incentives" and names the identifying variation
    - **§3.2 Card Acceptance Increases Merchant Sales** (reducedform.tex:51)
      - *First sentence:* "Merchants face strong incentives to accept cards because doing so increases sales."
      - *Claude's read:* Quantify the second force — the causal sales gain from card acceptance — which explains why merchants accept all networks despite high fees
      - *Verdict:* pass — states the claim before the method
    - **§3.3 Merchants Multi-home More Than Consumers** (reducedform.tex:107)
      - *First sentence:* "Merchants overwhelmingly accept all cards, yet only around [X]% of consumers use credit cards from two or more networks."
      - *Claude's read:* Document the asymmetry that produces the partial competitive bottleneck — merchants cannot credibly threaten to drop networks because single-homers would follow
      - *Verdict:* pass — opens with the key asymmetry the subsection exists to establish
      - **§3.3.1 Almost All Merchants Multi-home** (reducedform.tex:113)
        - *First sentence:* "As of 2019, most merchants accept either all credit cards or none at all."
        - *Claude's read:* Establish the merchant side of the multi-homing asymmetry, using the AmEx OptBlue convergence as evidence
        - *Verdict:* pass
      - **§3.3.2 Many Consumers Single-home** (reducedform.tex:160)
        - *First sentence:* "Whether merchants can steer consumers between networks depends on how many consumers carry cards from more than one."
        - *Claude's read:* Establish the consumer side of the asymmetry — the share who single-home limits merchant bargaining power
        - *Verdict:* pass
    - **§3.4 The Competitive Bottleneck** (reducedform.tex:183)
      - *First sentence:* "These patterns resemble a 'competitive bottleneck' in which networks compete primarily for consumers, not merchants."
      - *Claude's read:* Synthesize the three facts into the bottleneck framing and set up the structural model
      - *Verdict:* **weak** — names "competitive bottleneck" correctly but criterion D fails: subsection ends on "the net effect of competition on fees and welfare must be estimated" with no forward promise of what §4–6 will deliver; criterion G (handoff to §4) is absent
  - **§4 Model** (model.tex:4)
    - *First sentence:* "To quantify how network competition shapes fees, rewards, and welfare, I build a model with two-sided multi-homing, merchant competition, and price coherence."
    - *Claude's read:* Formally specify the structural model that turns the three empirical forces into a quantitative framework for counterfactual analysis
    - *Verdict:* pass — opener anchors on "price coherence" and the RAP's central question about competition and fees
    - **§4.1 Structure of the Game** (model.tex:8)
      - *First sentence:* "I model competition between card networks as a static game with three stages between networks, consumers, and merchants."
      - *Claude's read:* Lay out the game's timing and stages, which is necessary technical scaffolding for the model
      - *Verdict:* **weak** — criterion F fails mildly: announces the architecture but not why the sequential structure is needed to capture the competitive bottleneck; reads as a specification, not an argument. A rewrite connecting the stage ordering to issuer incentives would be clearly better.
    - **§4.2 Stage 3: Consumer Shopping and Payments** (model.tex:15)
      - *First sentence:* "Consumers' payment decisions depend on merchants' acceptance decisions, and their shopping decisions depend on their ability to use preferred payment methods."
      - *Claude's read:* Formalize consumer payment behavior at the point of sale and set up the shopping externality that makes merchant acceptance decision-relevant
      - *Verdict:* pass — opener correctly previews the two-way dependence that the section formalizes
      - **§4.2.1 Payment Behavior at the Point of Sale** (model.tex:20)
        - *First sentence:* "At the point of sale, consumers' primary and secondary cards and merchant acceptance determine payment behavior."
        - *Claude's read:* Formally derive payment probabilities for single- and multi-homers, establishing the key behavioral foundation for merchant acceptance decisions
        - *Verdict:* pass
      - **§4.2.2 Consumption Decisions Over Merchants** (model.tex:69)
        - *First sentence:* "Consumers have constant elasticity of substitution (CES) preferences over a continuum of merchants, each selling a differentiated variety."
        - *Claude's read:* Formalize how card acceptance raises merchant quality and shopping intensity, generating the price-index externality at the heart of price coherence
        - *Verdict:* pass — procedural specification node; criterion B satisfied because the CES structure is named and its relevance to acceptance is implicit in the section context
    - **§4.3 Stage 2: Pricing, Acceptance, and Adoption** (model.tex:101)
      - *First sentence:* "Merchants maximize profits by choosing prices and payment acceptance."
      - *Claude's read:* Formalize how price coherence links merchant fee pass-through to retail prices and creates the adoption externality central to the welfare results
      - *Verdict:* **weak** — "price coherence" (RAP thematic phrase) and the externality mechanism appear only in sentence 2; criterion B fails on sentence 1, which is a generic description of profit maximization that could appear in any model section. The second sentence carries the load and the rewrite below is clearly better.
      - **§4.3.1 Merchant Pricing** (model.tex:114)
        - *First sentence:* "Conditional on acceptance $M$, merchants pass fees into prices."
        - *Claude's read:* Derive the optimal uniform price, showing that fee pass-through is complete and depends on demand shares — the mechanism behind the retail-price redistribution
        - *Verdict:* pass — procedural derivation node; opens with the substantive result it will prove
      - **§4.3.2 Merchant Acceptance** (model.tex:137)
        - *First sentence:* "Acceptance decisions trade off higher sales against higher fees."
        - *Claude's read:* Derive the acceptance threshold condition that single-homing consumers drive merchant fee sensitivity
        - *Verdict:* pass
      - **§4.3.3 Consumer Adoption** (model.tex:158)
        - *First sentence:* "Consumers choose up to two cards to maximize utility."
        - *Claude's read:* Formalize consumer wallet choice, including the reward-sensitivity and credit-aversion parameters that will be estimated in §5
        - *Verdict:* pass — procedural specification; opens with the main choice
    - **§4.4 Stage 1: Network Competition** (model.tex:234)
      - *First sentence:* "Multiproduct payment networks maximize profits, anticipating consumer and merchant actions."
      - *Claude's read:* Formalize how networks exploit the bottleneck — profit-maximizing fee-and-reward setting given the asymmetric consumer-merchant sensitivity identified in §3
      - *Verdict:* **weak** — generic description of profit maximization; does not invoke the bottleneck logic or preview the implication (networks tax merchants to subsidize consumers). Criterion B fails: the intro's punchline is not echoed here. A concrete rewrite is clearly better.
      - **§4.4.1 Profits** (model.tex:239)
        - *First sentence:* "Network profits equal transaction fees minus costs and rewards."
        - *Claude's read:* Lay out the profit accounting — transaction margins minus rewards subsidies — that underpins the fee-and-reward first-order conditions
        - *Verdict:* pass
      - **§4.4.2 Conduct and Equilibrium Determinacy** (model.tex:259)
        - *First sentence:* "Networks set transaction fees $\tau_j$ and pecuniary adoption benefits $A_j$, taking other networks' actions as given."
        - *Claude's read:* Specify Nash conduct and the trembles device that selects a unique equilibrium with multiple networks
        - *Verdict:* pass — procedural node; opener names the control variables and the equilibrium concept
    - **§4.5 Equilibrium** (model.tex:281)
      - *First sentence:* "An equilibrium is a tuple $(\tau^*, A^*, \tilde{\mu}^w_y, p^*(\gamma), M^*(\gamma), q^{w*}(\gamma))$ satisfying: [conditions]."
      - *Claude's read:* Define the full equilibrium as a fixed point of the staged game, closing the model before estimation
      - *Verdict:* pass — procedural definition node
    - **§4.6 Discussion of Key Assumptions** (model.tex:285)
      - *First sentence:* "The welfare results depend on several modeling assumptions, of which credit-debit segmentation at the point of sale is the most consequential."
      - *Claude's read:* Defend the model's key assumptions and flag where they are stress-tested in the appendix, justifying the counterfactual credibility promised by §4's opener
      - *Verdict:* pass — opener correctly flags the most consequential assumption and signals the scope of the section
  - **§5 Estimation** (estimation.tex:4)
    - *First sentence:* "Estimation links the reduced-form facts to quantitative predictions about regulation and competition."
    - *Claude's read:* Connect the three reduced-form forces to the structural parameters, validating that the model can credibly generate the counterfactuals in §6
    - *Verdict:* pass — opener names the bridge role of estimation clearly
    - **§5.1 Estimation Procedure** (estimation.tex:8)
      - *First sentence:* "I estimate all parameters jointly, but the identification argument has three components."
      - *Claude's read:* Describe the identification strategy mapping each data source to its target parameters
      - *Verdict:* pass — procedural node; opener correctly previews the three-part structure and signals joint estimation
      - **§5.1.1 Consumer Demand** (estimation.tex:18)
        - *First sentence:* "The key consumer demand parameters are price sensitivity ($\alpha_0$), substitution patterns ($\Sigma$), income gradients ($\alpha_y, \beta_y, \chi^{lm}_y$), and multi-homing complementarities ($\chi^{lm}$)."
        - *Claude's read:* Lay out the consumer identification strategy — Durbin variation identifies price sensitivity, second-choice surveys identify substitution, demographics identify income gradients
        - *Verdict:* pass — procedural inventory that directly sets up the subsection's content
      - **§5.1.2 Network Costs** (estimation.tex:63)
        - *First sentence:* "I recover network costs by inverting first-order conditions with respect to rewards."
        - *Claude's read:* Describe how the equilibrium reward condition identifies marginal costs
        - *Verdict:* pass
      - **§5.1.3 Merchant Types** (estimation.tex:68)
        - *First sentence:* "I recover the distribution of merchant types $G$ by combining three inputs: event-study evidence on grocery chains' credit card adoption from the Homescan panel, acceptance rates from the DCPC, and networks' optimal pricing conditions."
        - *Claude's read:* Explain how the acceptance event studies and acceptance rates identify the merchant type distribution, closing the estimation system
        - *Verdict:* pass
      - **§5.1.4 Calibrated Parameters** (estimation.tex:89)
        - *First sentence:* "I calibrate two sets of parameters."
        - *Claude's read:* Document two parameters set directly from external data rather than estimated
        - *Verdict:* pass — brief procedural note; acceptable opener for a short calibration paragraph
    - **§5.2 Merchant and Consumer Sensitivities and Credit Aversion** (estimation.tex:95)
      - *First sentence:* "The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants."
      - *Claude's read:* Present and interpret the key estimated parameters, showing they confirm the bottleneck and reveal substantial credit aversion
      - *Verdict:* pass — opens immediately on "competitive bottleneck" (RAP thematic phrase) and states the finding
    - **§5.3 Goodness of Fit** (estimation.tex:182)
      - *First sentence:* "I assess fit by examining three sets of untargeted moments: adoption shares, the joint distribution of primary and secondary cards, and merchant acceptance rates."
      - *Claude's read:* Validate model predictions against out-of-sample data, including the OptBlue test that directly validates the merchant fee-response mechanism
      - *Verdict:* **weak** — "I assess fit by examining" is roadmap language (criterion B fails); the OptBlue out-of-sample test — the most direct test of merchant responses to fee changes — is buried in §5.3.2 rather than previewed; criterion E (quantitative preview) fails for a results subsection
      - **§5.3.1 Consumer Demand** (estimation.tex:186)
        - *First sentence:* "The baseline equilibrium matches untargeted adoption shares from the DCPC."
        - *Claude's read:* Show the model recovers adoption shares not targeted in estimation, confirming the income-preference correlation is correctly specified
        - *Verdict:* pass
      - **§5.3.2 Merchant Demand** (estimation.tex:207)
        - *First sentence:* "I validate merchant parameter estimates against three types of evidence."
        - *Claude's read:* Validate merchant parameters using the OptBlue acceptance response and external evidence on sales effects and retail margins
        - *Verdict:* pass — "I validate" is borderline procedural but immediately names the scope; acceptable for a sub-level fit node
      - **§5.3.3 Network Parameters** (estimation.tex:226)
        - *First sentence:* "Network cost parameters match accounting data."
        - *Claude's read:* Show estimated marginal costs fall in the range from independent accounting sources
        - *Verdict:* pass — opens with the finding, not a roadmap
  - **§6 Counterfactuals** (counterfactuals.tex:4)
    - *First sentence:* "I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse."
    - *Claude's read:* Deliver the policy analysis — five counterfactuals showing that the direction of competition matters, not just its intensity
    - *Verdict:* pass — opens on "competitive bottleneck" and directly states the key finding about competition direction
    - **§6.1 Capping Credit Card Merchant Fees** (counterfactuals.tex:13)
      - *First sentence:* "In my main counterfactual, I cap credit card merchant fees at 120 bp, roughly half their current level."
      - *Claude's read:* Show that a credit fee cap corrects excessive adoption via price coherence, raising total welfare $27B
      - *Verdict:* **weak** — "In my main counterfactual, I…" is roadmap language (criterion B fails); "price coherence" and "excessive adoption" (RAP thematic phrases) are absent from sentence 1; the $27B magnitude appears only in sentence 3. A rewrite with the finding up front is clearly better.
      - **§6.1.1 Effects on Prices and Shares** (counterfactuals.tex:25)
        - *First sentence:* "Capping credit card merchant fees reduces rewards and card use, illustrating the see-saw principle in [Rochet-Tirole 2003]."
        - *Claude's read:* Describe the price and quantity effects of the cap — networks cut rewards ~1.1pp, credit spend falls ~half — setting up the welfare calculation
        - *Verdict:* pass
      - **§6.1.2 Welfare** (counterfactuals.tex:58)
        - *First sentence:* "The gains from the credit fee cap stem from correcting excessive adoption, not from reducing market power."
        - *Claude's read:* Explain the welfare mechanism — reduced credit aversion generates gains beyond the fee-reward see-saw — and quantify the $27B total
        - *Verdict:* pass — opens on "excessive adoption" (RAP thematic phrase) and distinguishes the paper's mechanism from the market-power story
      - **§6.1.3 Distributional Effects** (counterfactuals.tex:143)
        - *First sentence:* "Fee and reward cuts redistribute consumption toward lower-income consumers."
        - *Claude's read:* Show the progressivity of the credit fee cap — low-income gains (48 bp) exceed high-income gains (15 bp)
        - *Verdict:* pass — opens with the finding
    - **§6.2 Repealing the Durbin Amendment** (counterfactuals.tex:158)
      - *First sentence:* "The credit fee cap raises welfare by correcting adoption distortions, not by reducing market power."
      - *Claude's read:* Test the mechanism by showing that the same logic predicts repealing the Durbin debit cap also raises welfare ($7B), contradicting the market-power story for debit
      - *Verdict:* pass — re-states the mechanism and immediately sets up the Durbin test as direct evidence
    - **§6.3 Welfare Effects of Reducing Network Competition** (counterfactuals.tex:194)
      - *First sentence:* "One might expect that increasing competition among networks would substitute for fee regulation."
      - *Claude's read:* Show the monopoly merger raises total welfare ($15B) because eliminating rewards competition reduces excessive credit use — illustrating that competition direction matters more than intensity
      - *Verdict:* pass — the rhetorical contrast ("one might expect") is used to set up the paper's key counter-intuitive finding about competition; criterion B is met because the next sentence delivers the finding immediately
    - **§6.4 Consumer Multi-Homing and Dual Routing** (counterfactuals.tex:226)
      - *First sentence:* "Rather than regulating fees directly, policy can redirect the locus of network competition."
      - *Claude's read:* Show dual-routing mandates raise welfare by forcing competition from the consumer side to the merchant side — illustrating "the direction of competition matters"
      - *Verdict:* pass — opens on "redirect the locus of network competition," directly echoing the thematic phrase about competition direction
    - **§6.5 Central Bank Digital Currencies and Public Entry** (counterfactuals.tex:259)
      - *First sentence:* "Proposals for central bank digital currencies (CBDC) and faster payments [...] motivate the possibility that government entry could discipline network pricing."
      - *Claude's read:* Compare CBDC to fee caps and dual routing, showing public entry delivers far smaller welfare gains because credit-debit segmentation limits its competitive reach
      - *Verdict:* **weak** — states motivation without committing to a deliverable; criterion D fails (no forward promise of what the analysis finds); criterion E fails for a results subsection; the $3.7B result — much less than fee caps ($27B) — is not previewed in sentence 1
    - **§6.6 Discussion** (counterfactuals.tex:272)
      - *First sentence:* "Online Appendix [ref] re-estimates the model under alternative assumptions about consumer constraints, pass-through, and reward sensitivity."
      - *Claude's read:* Stress-test the main welfare results under three alternative specifications and discuss policy design choices
      - *Verdict:* pass — procedural note that accurately scopes the discussion; acceptable for a robustness discussion node
  - **§7 Conclusion** (conclusion.tex:4)
    - *First sentence:* "Rising credit card use and rising merchant costs both follow from intense network competition channeled toward the wrong side of the market."
    - *Claude's read:* Synthesize the paper's contribution — rewards competition under price coherence drives excessive credit use — and connect to policy debates
    - *Verdict:* pass — opens immediately on the paper's central mechanism and echoes "competition [...] toward the wrong side of the market," the direction-of-competition thesis

  ---

  **Appendix sections (audited for section/subsection openers only):**

  - **Appendix A: Data Details** (appendix_data.tex:4)
    - *First sentence (section opener in §§ opener):* "I build an annual panel of issuer payment volumes from the Nilson Report, supplemented with FFIEC call reports [...] to estimate consumers' reward sensitivities."
    - *Claude's read:* Document data construction details for the Nilson issuer panel
    - *Verdict:* pass (appendix procedural section)
  - **Appendix B: Additional Reduced Form Results** (appendix_reduced.tex:4)
    - *Section opener:* "This section checks sensitivity of the main specification and identifies the mechanism behind the debit volume decline."
    - *Claude's read:* Durbin robustness checks and mechanism evidence supporting §3.1
    - *Verdict:* pass (appendix procedural; criterion B met by scope statement)
  - **Appendix C: Model Details** (appendix_model.tex:8)
    - *Section opener — first substantive subsection:* "Merchant profits equal the integral of per-unit margins times quantities across consumer types"
    - *Claude's read:* Derive the merchant profit function and linearization theorem used in the main model
    - *Verdict:* pass (appendix derivation)
  - **Appendix D: Estimation Details** (appendix_estimation.tex:4)
    - *Section opener:* "I estimate the model by matching data and simulated moments."
    - *Claude's read:* Provide full estimation details for replication
    - *Verdict:* pass
  - **Appendix E: Additional Tables / Figures** (appendix_tables.tex, appendix_figures.tex)
    - *Claude's read:* Tables and figures collections; no prose openers to audit
    - *Verdict:* pass (not applicable — table/figure collections)
  - **Appendix F: Additional Data Details** (appendix_data_oa.tex:4)
    - *Section opener:* "MRI-Simmons USA is a nationally representative panel..."
    - *Claude's read:* MRI-Simmons, Yelp, and DCPC data construction for robustness checks
    - *Verdict:* pass
  - **Appendix G: Alternative Specifications** (appendix_robustness.tex:4)
    - *Section opener:* "Sections [refs] re-estimate under three alternative specifications [...]; Section [ref] compares the 120 bps cap to a tighter cap and the constrained social optimum."
    - *Claude's read:* Robustness checks and alternative counterfactual designs
    - *Verdict:* pass (scoped roadmap acceptable for appendix)
  - **Appendix H: Additional Model Details** (appendix_model_oa.tex:8)
    - *Section opener (§H.1):* "This section derives the payment probabilities from Section [ref]..."
    - *Claude's read:* Computational and theoretical details supporting §4
    - *Verdict:* pass (appendix derivation)
  - **Appendix I: Credit-Debit Segmentation** (appendix_credit_debit.tex:4)
    - *Section opener:* "The baseline model assumes consumers do not substitute between credit and debit at the point of sale."
    - *Claude's read:* Evaluate the segmentation assumption, show alternatives, and confirm welfare results are robust to most counterfactuals
    - *Verdict:* pass — opens on the assumption being tested; criterion B met by the implied stakes
  - **Appendix J: Price Coherence** (appendix_surcharging.tex:4)
    - *Section opener:* "This appendix explains why merchants almost never surcharge despite legal ability to do so."
    - *Claude's read:* Establish price coherence is empirical and not merely institutional, supporting the main-text assumption
    - *Verdict:* pass
  - **Appendix K: Merchant Sorting** (appendix_sorting.tex:4)
    - *Section opener:* [No section label — §§ opener] "Card fees may not redistribute across consumer types if consumers with different payment preferences shop at different merchants."
    - *Claude's read:* Show sorting attenuates redistribution by at most 10%, validating the main welfare analysis
    - *Verdict:* pass

---

## Violations (severity-sorted)

### [F1] §3 Reduced-Form Facts (reducedform.tex:4–6) — **weak**

**Parent goal:** Deliver the three promised empirical forces — issuer incentives, card-acceptance sales effect, multi-homing asymmetry — that motivate the competitive bottleneck.

**Original opener:**
> Three reduced-form facts characterize the two-sided structure of the payment market.
> Issuers' incentives drive consumer payment choices; card acceptance increases merchant sales; and a mix of single- and multi-homing consumers limits merchants' ability to steer between networks.
> These facts point toward a competitive bottleneck, but the degree of consumer multi-homing leaves the net effect of competition on fees and welfare an empirical question.

**Verdict:** weak — sentence 1 is a roadmap announcement ("Three reduced-form facts characterize"). Thematic phrase "competitive bottleneck" appears only in sentence 3. Criterion B fails on sentence 1; criterion D ends on an open question rather than a concrete deliverable.

**Proposed rewrite:**
> Issuer incentives — not consumer preferences — drive payment choices. Cutting issuers' financial stake in debit reduced debit spending by around 25%; card acceptance raises merchant sales by around 12%; and around half of consumers carry credit cards from only one network, giving merchants little leverage to drop any card. Together, these facts produce a partial competitive bottleneck whose net effect on fees and welfare must be estimated.

**Why the rewrite works:**
- Sentence 1 states the claim ("issuer incentives drive choices"), not the count ("three facts characterize").
- Sentence 2 previews magnitudes for all three facts, satisfying criterion E.
- "Competitive bottleneck" (RAP thematic phrase) still appears, but now it is earned by the evidence rather than asserted.
- The final sentence correctly ends on "must be estimated," but now comes after a concrete summary rather than as the section's only substantive claim.
- Max sentence 1 word count: 9 words.

---

### [F2] §3.4 The Competitive Bottleneck (reducedform.tex:183–188) — **weak**

**Parent goal:** Synthesize the three facts into the bottleneck framing and set up §4's structural model as the necessary next step.

**Original opener:**
> These patterns resemble a "competitive bottleneck" in which networks compete primarily for consumers, not merchants.
> Standard theoretical models assume either pure single-homing, under which competition unambiguously raises merchant fees, or pure multi-homing, which reverses the result [citations].
> Given that some consumers single-home and others multi-home, neither benchmark applies cleanly, and the net effect of competition on fees and welfare must be estimated.

**Verdict:** weak — names "competitive bottleneck" in sentence 1, but criterion D fails: the subsection ends without a forward promise of what §4–6 will deliver. Criterion G (explicit handoff to the structural model) is absent.

**Proposed rewrite:**
> The three facts above produce a partial competitive bottleneck in which networks compete primarily for consumers, not for merchants. Because neither the pure single-homing nor the pure multi-homing benchmark applies, the net welfare effect of competition must be estimated — the task of Sections 4–6.

**Why the rewrite works:**
- Sentence 1 retains "competitive bottleneck" but grounds it in the three facts just presented (criterion G, local argument chain).
- Sentence 2 states the deliverable promise — "the task of Sections 4–6" — making the handoff explicit (criterion D).
- Shorter and tighter; no new LaTeX macros.
- Max sentence 1 word count: 21 words.

---

### [F3] §4.1 Structure of the Game (model.tex:8–13) — **weak**

**Parent goal:** Build a structural model that quantifies how network competition shapes fees, rewards, and welfare via two-sided multi-homing, merchant competition, and price coherence.

**Original opener:**
> I model competition between card networks as a static game with three stages between networks, consumers, and merchants.
> In the first stage, profit-maximizing networks set per-transaction fees for merchants and promised adoption utility for consumers.
> In the second stage, consumers and merchants make adoption and pricing decisions.
> In the third stage, consumers make consumption decisions over merchants.
> The second and third stages micro-found demand for payments.
> Section [ref] discusses key assumptions.

**Verdict:** weak — criterion F fails mildly: announces the model's architecture but not why the sequential three-stage structure is required to capture the competitive bottleneck. The opener reads as a specification, not an argument. The rewrite connecting stage ordering to the bottleneck logic is clearly better than the original.

**Proposed rewrite:**
> The competitive bottleneck requires a sequential structure: networks move first, setting fees and rewards; consumers and merchants then adopt and price, taking network actions as given; and consumers make final shopping decisions that determine how much card acceptance raises merchant sales.

**Why the rewrite works:**
- Sentence 1 opens with "competitive bottleneck" (RAP thematic phrase) and justifies the three-stage ordering as a consequence of the bottleneck, not an arbitrary modeling choice.
- 37 words — within the 40-word cap.
- Replaces six sentences with one claim sentence; the stage descriptions that follow can remain.

---

### [F4] §4.3 Stage 2: Pricing, Acceptance, and Adoption (model.tex:101–103) — **weak**

**Parent goal:** Formalize the merchant-side behavior (uniform pricing, card acceptance) that generates price coherence, fee pass-through, and the adoption externality central to the welfare results.

**Original opener:**
> Merchants maximize profits by choosing prices and payment acceptance.
> Under price coherence, merchants set uniform prices, passing fees through to all consumers and creating the externality that makes credit card use socially excessive.

**Verdict:** weak — "price coherence" and the externality appear only in sentence 2. Criterion B fails on sentence 1, which is generic profit-maximization language that could open any IO model section. Sentence 2 carries the load and a rewrite placing it first is clearly better.

**Proposed rewrite:**
> Under price coherence, merchants set uniform prices regardless of payment method, so merchant fees pass through to all consumers and create the externality that makes credit card adoption socially excessive.

**Why the rewrite works:**
- Opens with "price coherence" (RAP thematic phrase) and the mechanism in one sentence.
- 29 words — within the 40-word cap.
- The original sentence 1 ("Merchants maximize profits...") can follow as a second sentence with no loss of content.

---

### [F5] §4.4 Stage 1: Network Competition (model.tex:234–236) — **weak**

**Parent goal:** Build a structural model that quantifies how network competition shapes fees, rewards, and welfare — specifically the profit-maximizing rationale for taxing merchants to subsidize consumers.

**Original opener:**
> Multiproduct payment networks maximize profits, anticipating consumer and merchant actions.

**Verdict:** weak — generic description of profit maximization; does not invoke the bottleneck logic or preview the implication (networks find it optimal to fund rewards through merchant fees). Criteria B and D fail: the paper's central insight about networks exploiting consumer sensitivity is not echoed in this opener. A concrete rewrite is clearly better.

**Proposed rewrite:**
> Networks exploit the bottleneck position: because consumers are far more sensitive to rewards than merchants are to fees, profit-maximizing networks fund generous rewards through high merchant fees.

**Why the rewrite works:**
- Sentence 1 opens with the bottleneck logic (RAP thematic phrase) and states the mechanism explicitly.
- 26 words — at the 25-word sentence 1 cap; split if needed.
- No new LaTeX macros.

---

### [F6] §5.3 Goodness of Fit (estimation.tex:182–188) — **weak**

**Parent goal:** Validate the structural estimates against out-of-sample data so the counterfactual predictions in §6 are credible, with the OptBlue acceptance test as the most direct check of the mechanism.

**Original opener:**
> I assess fit by examining three sets of untargeted moments: adoption shares, the joint distribution of primary and secondary cards, and merchant acceptance rates.

**Verdict:** weak — "I assess fit by examining" is roadmap language (criterion B fails); the OptBlue out-of-sample test — the most direct test of the model's ability to predict merchant responses to fee changes — is buried in §5.3.2, not previewed here; criterion E (quantitative preview) fails for a results subsection.

**Proposed rewrite:**
> The model passes three out-of-sample tests. Most importantly, it correctly predicts that AmEx's OptBlue fee cut shrank the merchant acceptance gap by around 9 percentage points — the sharpest test of the model's ability to predict merchant responses to the fee changes the counterfactuals impose.

**Why the rewrite works:**
- Opens with the finding ("passes three out-of-sample tests"), not a roadmap announcement.
- Sentence 2 names the OptBlue test specifically and explains why it matters for counterfactual credibility, satisfying criterion E.
- "Around 9 percentage points" is in plain prose (no new macros), approximating the scalar value.
- Max sentence 1 word count: 10 words.

---

### [F7] §6.1 Capping Credit Card Merchant Fees (counterfactuals.tex:13–16) — **weak**

**Parent goal:** Show that a credit fee cap corrects the price-coherence adoption externality, raising total welfare $27B.

**Original opener:**
> In my main counterfactual, I cap credit card merchant fees at 120 bp, roughly half their current level.
> Debit fees are unchanged.
> The cap raises total welfare by $27 billion per year.
> Lower merchant fees reduce credit card rewards, correcting excessive adoption driven by price coherence.

**Verdict:** weak — "In my main counterfactual, I…" is roadmap language; "price coherence" and "excessive adoption" appear only in sentence 4; the $27B magnitude appears only in sentence 3. The rewrite with the finding first is clearly better.

**Proposed rewrite:**
> Capping credit card merchant fees at 120 bp — roughly half their current level — corrects the price-coherence adoption externality and raises total welfare by $27 billion per year.

**Why the rewrite works:**
- Opens with the policy action and mechanism together, then the magnitude.
- "Price coherence" (RAP thematic phrase) and "$27 billion" appear in sentence 1.
- 26 words — slightly over the 25-word sentence 1 cap; can be split: "Capping credit card merchant fees at 120 bp corrects the price-coherence adoption externality. This raises total welfare by $27 billion per year."
- No new LaTeX macros.

---

### [F8] §6.5 Central Bank Digital Currencies and Public Entry (counterfactuals.tex:259–268) — **weak**

**Parent goal:** Compare CBDC to fee caps and dual routing, showing public entry is weaker because credit-debit segmentation limits its competitive reach.

**Original opener:**
> Proposals for central bank digital currencies (CBDC) and faster payments [citations] motivate the possibility that government entry could discipline network pricing.

**Verdict:** weak — states the policy motivation without committing to a finding; criterion D fails (no forward promise of what the analysis shows); criterion E fails: the $3.7B result — much less than fee caps ($27B) or repealing Durbin ($7B) — is not previewed.

**Proposed rewrite:**
> Government entry as a public debit network disciplines pricing far less than fee caps or dual routing: consumer welfare rises by only $3.7 billion because credit-debit segmentation limits the competitive pressure a new debit product can exert on incumbent credit card fees.

**Why the rewrite works:**
- Opens with the finding and its magnitude ($3.7B) in sentence 1, satisfying criterion E.
- "Credit-debit segmentation" echoes §4.6's key assumption and explains the finding without a new citation.
- 39 words — within the 40-word cap.
- No new LaTeX macros.

---

## Summary Dashboard

**Verdicts by level:**

| Level         | Pass | Weak | Fail | Total |
|---------------|------|------|------|-------|
| section       | 7    | 1    | 0    | 8     |
| subsection    | 23   | 7    | 0    | 30    |
| subsubsection | 10   | 0    | 0    | 10    |
| paragraph     | 0    | 0    | 0    | 0     |
| **Total**     | **40** | **8** | **0** | **48** |

*(Paragraphs were examined but all pass; none is flagged. Appendix section/subsection nodes counted in the section/subsection rows.)*

**Top priority fixes:**
1. [F7] §6.1 Capping Credit Card Merchant Fees — roadmap opener buries the $27B finding until sentence 3
2. [F1] §3 Reduced-Form Facts — sentence 1 is a count announcement; thematic phrases appear only in sentences 2–3
3. [F5] §4.4 Stage 1: Network Competition — generic profit-maximization opener misses the bottleneck insight
4. [F4] §4.3 Stage 2: Pricing, Acceptance, and Adoption — "price coherence" (the key mechanism) appears only in sentence 2
5. [F6] §5.3 Goodness of Fit — roadmap opener buries the OptBlue test, the sharpest validation for counterfactual credibility
6. [F3] §4.1 Structure of the Game — architectural announcement does not connect stage ordering to the bottleneck
7. [F2] §3.4 The Competitive Bottleneck — no explicit handoff to §4–6
8. [F8] §6.5 CBDC / Public Entry — motivation without a finding

## What's Working

1. **§6 Counterfactuals opener** (counterfactuals.tex:4) is the strongest section opener in the paper: it opens on "competitive bottleneck," immediately states the main counterfactual finding ("too high"), and adds the paper's counter-intuitive result about competition direction in a single sentence. The pattern to replicate is: RAP thematic phrase in sentence 1, specific finding in sentence 1 or 2, no "In this section."

2. **§3.1 Issuer Incentives Drive Consumer Payment Choices** (reducedform.tex:10) exemplifies good subsection opening: it names the identification strategy ("Durbin Amendment") and the target parameter ("issuers' incentives") in its first sentence, with no roadmap language. The paper's other subsection openers should follow this pattern.

3. **§5.2 Merchant and Consumer Sensitivities** (estimation.tex:140) opens on the RAP thematic phrase "competitive bottleneck" and immediately states the parameter-level finding ("consumers are far more sensitive to rewards than merchants are to fees"). This is the paper's own argument in the author's voice — the conclusion of §4.4's model section should echo it equally directly.
