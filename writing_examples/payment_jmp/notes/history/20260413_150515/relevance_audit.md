# Relevance Audit

**Paper:** Regulating Competing Payment Networks  
**Level filter:** section, subsection  
**Paper type:** D (structural model applied to data)  
**Date:** 2026-04-13

---

## RAP Seed

**Research question** (intro.tex:13):
> I find that merchant fees are indeed too high, but weak competition is the wrong diagnosis.

**Main answer / finding** (intro.tex:13, 65, 90–91):
> Merchant fees are indeed too high, but weak competition is the wrong diagnosis. Fee caps raise total welfare by $27 billion. A merger to monopoly also raises welfare by $15 billion, not because monopoly is desirable but because it eliminates the rewards arms race that drives excessive credit card adoption. How networks compete matters more than how intensely they compete.

**Positioning** (intro.tex:10–11):
> These facts have motivated two decades of litigation and legislation built on a view that high merchant fees reflect weak competition. Key policy interventions include the 2011 Durbin Amendment's cap on debit interchange fees, the 2022 proposed Credit Card Competition Act, and the 2024 Department of Justice lawsuit against Visa.

**Thematic phrases:**
- "competitive bottleneck" (intro.tex:34)
- "price coherence" (intro.tex:15)
- "credit aversion" (intro.tex:62)
- "rewards competition" (intro.tex:99)
- "excessive credit card adoption" (intro.tex:99)
- "wrong diagnosis" (intro.tex:13)

**Promised deliverables by section:**

- **§2 (Institutional Details and Data):** The intro does not roadmap §2 explicitly, but the three-force argument (lines 25–34) presupposes that the reader understands interchange mechanics and the Durbin shock. §2 provides that background.
- **§3 (Reduced-Form Facts):** Establish the three conditions for the competitive bottleneck: reward sensitivity (Durbin, ~25% debit decline), merchant sales gains from card acceptance (~12%), and consumer single-homing that limits merchant leverage. Together they explain why competition raises fees rather than lowering them.
- **§4 (Model):** "I thus build a structural model in which payment networks compete as two-sided platforms" (intro.tex:40) with mixed single- and multi-homing consumers, merchant competition, and price coherence.
- **§5 (Estimation):** "I estimate consumer and merchant preferences by matching the reduced-form facts, moments from payment surveys, and aggregate market-level data" (intro.tex:45). Must confirm the 10:1 asymmetry and surface credit aversion.
- **§6 (Counterfactuals):** The intro previews five counterfactuals with specific magnitudes: fee cap (+$27B), Durbin repeal (+$7B), merger (+$15B), dual-routing (+$8B), CBDC.
- **§7 (Conclusion):** Synthesis of policy implications for the Ohio v. AmEx standard, Durbin, antitrust.

---

## How Claude Reads the Paper (Purpose Tree)

- **Paper thesis:** "High-merchant-fee credit cards proliferate because of, not in spite of, intense competition between networks."

  - **§1 Introduction** (intro.tex:4–138)
    - *First sentence:* "In the U.S., Visa and Mastercard (MC) process 80% of card transactions..."
    - *Claude's read:* establish the RAP, preview the three-force argument, and commit to magnitudes for all major results
    - *Verdict:* pass

  - **§2 Institutional Details and Data** (main.tex:75–84)
    - *First sentence of section opener:* [No section-level prose; the heading goes directly into §2.1]
    - *Claude's read:* provide the institutional fee-flow mechanics and data inventory the reader needs before §3
    - *Verdict:* **fail** — no opener paragraph exists; criteria A, B, C, D all fail by absence

    - **§2.1 Network Pricing: Merchant Fees and Consumer Rewards** (institutional_details.tex:4–48)
      - *First sentence:* "Payment networks are two-sided platforms that simultaneously set prices for merchants and consumers."
      - *Claude's read:* establish the interchange fee-flow mechanics (two-sided pricing, rewards funding) needed to interpret the Durbin shock and the competitive bottleneck framing
      - *Verdict:* pass

    - **§2.2 Data** (data.tex:6–91)
      - *First sentence:* "I combine five data sources to measure consumer reward sensitivity, how card acceptance affects sales, and multi-homing rates."
      - *Claude's read:* inventory the data sources that identify the three reduced-form forces, so the reader knows where the empirical evidence in §3 will come from
      - *Verdict:* pass

  - **§3 Reduced-Form Facts** (reducedform.tex:4–186)
    - *First sentence:* "Three reduced-form facts characterize the two-sided structure of the payment market."
    - *Claude's read:* deliver the three empirical pillars the intro promised, anchoring the competitive bottleneck framing
    - *Verdict:* **weak** — roadmap opener; "competitive bottleneck" appears only in sentence 3; criterion B fails on sentence 1

    - **§3.1 Issuer Incentives Drive Consumer Payment Choices** (reducedform.tex:8–49)
      - *First sentence:* "The Durbin Amendment provides quasi-experimental evidence that issuers' incentives strongly affect consumer payment choices."
      - *Claude's read:* deliver force #1 — consumer choices respond strongly to issuer incentives — using the Durbin quasi-experiment (25% debit decline)
      - *Verdict:* pass

    - **§3.2 Card Acceptance Increases Merchant Sales** (reducedform.tex:51–106)
      - *First sentence:* "Merchants face strong incentives to accept cards because doing so increases sales."
      - *Claude's read:* deliver force #2 — card acceptance increases merchant sales — setting up the model's merchant acceptance equation and welfare channel
      - *Verdict:* pass

    - **§3.3 Merchants Multi-home More Than Consumers** (reducedform.tex:107–177)
      - *First sentence:* "Merchants overwhelmingly accept all cards, yet only around [X]% of consumers use credit cards from two or more networks."
      - *Claude's read:* deliver force #3 — the multi-homing asymmetry that creates the partial competitive bottleneck
      - *Verdict:* pass

    - **§3.4 The Competitive Bottleneck** (reducedform.tex:179–186)
      - *First sentence:* "These patterns resemble a 'competitive bottleneck' [Armstrong 2006] in which networks compete primarily for consumers, not merchants."
      - *Claude's read:* synthesize the three facts into the bottleneck framing and flag that the mixed single/multi-homing rate makes the welfare question empirically open, motivating §4
      - *Verdict:* **weak** — no forward promise to §4–6; "the net effect of competition on fees and welfare must be estimated" is an open question, not a deliverable

  - **§4 Model** (model.tex:4–361)
    - *First sentence:* "To quantify how network competition shapes fees, rewards, and welfare, I build a model with two-sided multi-homing, merchant competition, and price coherence."
    - *Claude's read:* fulfill the intro's promise to build a structural model, anchoring all three design features on the RAP
    - *Verdict:* pass

    - **§4.1 Structure of the Game** (model.tex:8–14)
      - *First sentence:* "I model competition between card networks as a static game with three stages between networks, consumers, and merchants."
      - *Claude's read:* lay out the economic environment — game type, players, stage structure — that the reader needs before the formal derivations
      - *Verdict:* pass — economists expect the model section to open with the game setup; this is the right information to lead with

    - **§4.2 Stage 3: Consumer Shopping and Payments** (model.tex:15–19)
      - *First sentence:* "Consumers' payment decisions depend on merchants' acceptance decisions, and their shopping decisions depend on their ability to use preferred payment methods."
      - *Claude's read:* model the point-of-sale interdependence between consumer and merchant behavior that micro-founds the sales benefit of card acceptance
      - *Verdict:* pass

    - **§4.3 Stage 2: Pricing, Acceptance, and Adoption** (model.tex:101–104)
      - *First sentence:* "Merchants maximize profits by choosing prices and payment acceptance."
      - *Claude's read:* formalize merchant behavior under price coherence, generating fee pass-through and the adoption externality
      - *Verdict:* **weak** — "price coherence" and the externality mechanism appear only in sentence 2; sentence 1 is generic

    - **§4.4 Stage 1: Network Competition** (model.tex:238–242)
      - *First sentence:* "Multiproduct payment networks maximize profits, anticipating consumer and merchant actions."
      - *Claude's read:* formalize network best-response behavior, closing the game and enabling the equilibrium analysis that feeds the counterfactuals
      - *Verdict:* **weak** — generic description; no preview of what the FOCs imply about network pricing; criteria B and D fail

    - **§4.5 Equilibrium** (model.tex:285–288)
      - *First sentence:* "An equilibrium is a tuple (τ*, A*, ...) satisfying: consumption is optimal; merchant pricing and acceptance maximize profits; consumers choose optimal wallets; and networks maximize profits."
      - *Claude's read:* formally close the model section by defining equilibrium across all optimality conditions
      - *Verdict:* pass — correct form for a purely formal closure node

    - **§4.6 Discussion of Key Assumptions** (model.tex:289–361)
      - *First sentence:* [No subsection-level prose; begins immediately with paragraph heading "Segmentation Between Debit and Credit"]
      - *Claude's read:* address robustness of core modeling assumptions that the reader may contest before trusting the counterfactuals
      - *Verdict:* **fail** — no opener sentence at the subsection level; criteria B, F, H all fail by absence; five assumption paragraphs read as standalone encyclopedia entries

  - **§5 Estimation** (estimation.tex:4–238)
    - *First sentence:* "Estimation links the reduced-form facts to quantitative predictions about regulation and competition."
    - *Claude's read:* bridge from the three reduced-form forces to the identified structural parameters, setting up the competitive-bottleneck quantification
    - *Verdict:* pass

    - **§5.1 Estimation Procedure** (estimation.tex:9–16)
      - *First sentence:* "I estimate all parameters jointly, but the identification argument has three components."
      - *Claude's read:* map each parameter group to its identifying variation so the reader can assess credibility before examining estimates
      - *Verdict:* pass

    - **§5.2 Merchant and Consumer Sensitivities and Credit Aversion** (estimation.tex:98–182)
      - *First sentence:* "The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants."
      - *Claude's read:* deliver the key quantitative finding — the 10:1 asymmetry and credit aversion — that drives all counterfactual welfare results
      - *Verdict:* pass — exemplary opener; uses exact thematic phrase, states finding, explains mechanism

    - **§5.3 Goodness of Fit** (estimation.tex:185–237)
      - *First sentence:* "I assess fit by examining three sets of untargeted moments: adoption shares, the joint distribution of primary and secondary cards, and merchant acceptance rates."
      - *Claude's read:* validate model parameters against out-of-sample moments to build credibility for counterfactual predictions
      - *Verdict:* **weak** — "I assess fit by examining" is roadmap language (criterion B); the most important test (OptBlue out-of-sample prediction) is not previewed in sentence 1; criterion E (quantitative preview) fails

  - **§6 Counterfactuals** (counterfactuals.tex:4–305)
    - *First sentence:* "I use the estimated model to show that equilibrium fees and rewards are too high, but that increasing network competition without breaking the competitive bottleneck makes the problem worse."
    - *Claude's read:* deliver the paper's central normative findings, anchored on the competitive bottleneck framing
    - *Verdict:* pass

    - **§6.1 Capping Credit Card Merchant Fees** (counterfactuals.tex:13–158)
      - *First sentence:* "In my main counterfactual, I cap credit card merchant fees at 120 bp, roughly half their current level."
      - *Claude's read:* present the primary policy simulation — the fee cap — showing it raises welfare by correcting excessive adoption via price coherence
      - *Verdict:* **weak** — "In my main counterfactual, I..." is a roadmap opener; "price coherence" and "excessive adoption" absent from sentence 1; the $27B gain appears in sentence 3

    - **§6.2 Repealing the Durbin Amendment** (counterfactuals.tex:159–193)
      - *First sentence:* "Fee caps raise welfare by correcting adoption distortions, not by reducing market power."
      - *Claude's read:* use the Durbin repeal as a direct test of the adoption-distortion mechanism, showing the current debit-capping regime is counter-productive
      - *Verdict:* pass — states a claim, not a roadmap; directly anchors on the adoption-distortion vs. market-power contrast

    - **§6.3 Welfare Effects of Reducing Network Competition** (counterfactuals.tex:195–226)
      - *First sentence:* "One might expect that increasing competition among networks would substitute for fee regulation."
      - *Claude's read:* confront the conventional-wisdom prediction and overturn it with the merger counterfactual
      - *Verdict:* pass — frames the counterfactual as a test of the dominant hypothesis and sets up the reversal

    - **§6.4 Consumer Multi-Homing and Dual Routing** (counterfactuals.tex:227–255)
      - *First sentence:* "Rather than regulating fees directly, policy can redirect the locus of network competition."
      - *Claude's read:* show that mandating consumer multi-homing achieves welfare gains by breaking the bottleneck without a price cap, addressing Credit Card Competition Act proposals
      - *Verdict:* pass

    - **§6.5 Central Bank Digital Currencies and Public Entry** (counterfactuals.tex:256–268)
      - *First sentence:* "Proposals for central bank digital currencies (CBDC) and faster payments motivate the possibility that government entry could discipline network pricing."
      - *Claude's read:* evaluate CBDC as a policy alternative and show it is dominated by fee caps and dual routing due to credit-debit segmentation
      - *Verdict:* **weak** — states motivation only; no deliverable promised and no quantitative preview

    - **§6.6 Discussion** (counterfactuals.tex:269–304)
      - *First sentence:* "The welfare gains from fee caps and dual-routing mandates are quantitatively robust to alternative assumptions about consumer constraints, pass-through, and reward sensitivity."
      - *Claude's read:* consolidate the robustness of the main results across the three most contested modeling choices
      - *Verdict:* pass

  - **§7 Conclusion** (conclusion.tex:4–37)
    - *First sentence:* "Rising credit card use and rising merchant costs both follow from intense network competition channeled toward the wrong side of the market."
    - *Claude's read:* synthesize the paper's mechanism and draw policy implications for legal and regulatory debates
    - *Verdict:* pass

---

## Violations (severity-sorted)

### [H3] §3 Reduced-Form Facts (reducedform.tex:4) — **weak** | severity: medium

**Parent goal:** Establish the three empirical forces that create the competitive bottleneck: reward sensitivity, merchant sales gains from card acceptance, and consumer single-homing that limits merchant leverage.

**Original opener:**
> Three reduced-form facts characterize the two-sided structure of the payment market. Issuers' incentives drive consumer payment choices; card acceptance increases merchant sales; and a mix of single- and multi-homing consumers limits merchants' ability to steer between networks. These facts point toward a competitive bottleneck, but the degree of consumer multi-homing leaves the net effect of competition on fees and welfare an empirical question.

**Verdict:** weak — sentence 1 is roadmap language ("Three reduced-form facts... characterize"). "Competitive bottleneck" appears only in sentence 3. Criterion B fails on sentence 1; the opener ends on an open question rather than a deliverable.

**Proposed rewrite:**
> Issuers' incentives drive consumer payment choices; card acceptance increases merchant sales; and a mix of single- and multi-homing consumers limits merchants' ability to steer between networks. Together, these facts produce a partial competitive bottleneck that keeps merchant fees high.

**Why the rewrite works:**
- Opens with the paper's central claim (fees too high, competition cannot fix them) in sentence 1.
- Previews all three bottleneck conditions before the subsections deliver each one.
- States why the facts matter (criterion B).

---

### [H4] §3.4 The Competitive Bottleneck (reducedform.tex:179) — **weak** | severity: medium

**Parent goal:** Synthesize the three reduced-form facts into the bottleneck framing and motivate §4's structural model.

**Original opener:**
> These patterns resemble a "competitive bottleneck" [Armstrong 2006] in which networks compete primarily for consumers, not merchants.

**Verdict:** weak — names "competitive bottleneck" correctly but ends on an open question. The opener does not tell the reader what §4–6 will deliver.

**Proposed rewrite:**
> The three facts above explain why competition runs the wrong way: consumers respond to rewards, merchant sales depend on accepting every network, and most credit card consumers carry only one network's cards. Resolving whether this bottleneck raises or lowers welfare requires a structural model that accommodates the observed mix of single- and multi-homing consumers.

**Why the rewrite works:**
- Opens with "competitive bottleneck" and connects it to all three facts.
- Ends with a forward promise to the structural model.
- "The three facts above" marks this as a synthesis, not a new argument.

---

### [H6] §4.3 Stage 2: Pricing, Acceptance, and Adoption (model.tex:101) — **weak** | severity: medium

**Parent goal:** Formalize the merchant-side behavior (uniform pricing, card acceptance) that generates price coherence, fee pass-through, and the adoption externality central to the welfare results.

**Original opener:**
> Merchants maximize profits by choosing prices and payment acceptance.

**Verdict:** weak — sentence 1 is generic. A minimal improvement would make the trade-off explicit in the opener; "price coherence" belongs in the pricing subsubsection (§4.3.1), not here.

**Proposed rewrite:**
> Merchants maximize profits by choosing retail prices and which cards to accept, trading off higher fees against the sales gains that card acceptance brings.

**Why the rewrite works:**
- States the acceptance trade-off, not just the objective function.
- Leaves price coherence for the pricing subsubsection where it belongs.
- One sentence, no redundancy with the subsubsection headings.

---

### [H7] §4.4 Stage 1: Network Competition (model.tex:238) — **weak** | severity: medium

**Parent goal:** Build a structural model that quantifies how network competition shapes fees, rewards, and welfare.

**Original opener:**
> Multiproduct payment networks maximize profits, anticipating consumer and merchant actions.

**Verdict:** weak — technically accurate but no preview of what the stage implies about network pricing. Criterion D fails.

**Proposed rewrite:**
> Networks maximize profits by setting fees for merchants and rewards for consumers, internalizing the demand curves derived in Stages 2 and 3. Because consumers respond more strongly to rewards than merchants respond to fees, the profit-maximizing choice is high merchant fees funding generous rewards.

**Why the rewrite works:**
- Makes explicit that networks internalize demand curves from Stages 2 and 3.
- The asymmetric sensitivity falls out of profit maximization rather than being asserted upfront.
- Networks do not "exploit" the bottleneck; the bottleneck is the equilibrium, not a strategic choice in Stage 1.

---

### [H8] §5.3 Goodness of Fit (estimation.tex:185) — **weak** | severity: medium

**Parent goal:** Validate the model parameters against data so the counterfactual predictions in §6 are credible.

**Original opener:**
> I assess fit by examining three sets of untargeted moments: adoption shares, the joint distribution of primary and secondary cards, and merchant acceptance rates.

**Verdict:** weak — "I assess fit by examining" is roadmap language (criterion B fails). The opener states what is assessed but not why untargeted validation matters for the counterfactuals. The OptBlue test, the most direct check of the model's merchant-response predictions, is not previewed (criterion E fails).

**Proposed rewrite:**
> The model passes three out-of-sample tests relevant to the counterfactuals: it recovers untargeted adoption shares, matches the joint distribution of primary and secondary card holdings, and correctly predicts that AmEx's OptBlue fee cut shrank the merchant acceptance gap by \absinput{divert_inst_optblue_price_amex_baseline} pp. This last test is the most direct check of the model's ability to predict merchant responses to fee changes, which is central to the counterfactual analysis.

**Why the rewrite works:**
- Opens with a claim rather than a list of what will be examined.
- Flags the OptBlue test as the most important and explains why.
- The subsection earns its place by establishing why §6 predictions should be trusted.

---

### [H9] §6.1 Capping Credit Card Merchant Fees (counterfactuals.tex:13) — **weak** | severity: medium

**Parent goal:** Show that equilibrium fees and rewards are too high and that a fee cap corrects excessive credit card adoption via price coherence.

**Original opener:**
> In my main counterfactual, I cap credit card merchant fees at 120 bp, roughly half their current level.

**Verdict:** weak — "In my main counterfactual, I..." is a roadmap opener (criterion B fails). The word "main" signals primacy without stating the finding. "Price coherence" and "excessive adoption" are absent from sentence 1.

**Proposed rewrite:**
> My main counterfactual shows that merchant fees are too high: capping them at 120 bp raises total welfare by \$27 billion per year.

**Why the rewrite works:**
- States the finding and magnitude in sentence 1 (criterion E).
- "My main counterfactual shows that..." is active and commits to a claim rather than a procedure.

---

### [H10] §6.5 Central Bank Digital Currencies and Public Entry (counterfactuals.tex:256) — **weak** | severity: low

**Parent goal:** Compare CBDC to fee caps and dual routing, and show that public entry cannot break the competitive bottleneck without overcoming credit-debit segmentation.

**Original opener:**
> Proposals for central bank digital currencies (CBDC) and faster payments motivate the possibility that government entry could discipline network pricing.

**Verdict:** weak — states the motivation without committing to a deliverable. Criterion D fails: no forward promise of what the analysis finds. Criterion E fails: the $3.7B result (much less than fee caps or dual routing) is not previewed.

**Proposed rewrite:**
> Although there are many proposals for central bank digital currencies and faster payments, I find that public entry is far less effective than fee caps or dual-routing mandates at disciplining network pricing.

**Why the rewrite works:**
- Sets up the comparison with fee caps before revealing the result, so the magnitude lands with more force.
- States why CBDC underperforms (credit-debit segmentation) without front-loading the number.
- Criterion F clear: without this section, the paper does not address prominent CBDC proposals.

---

## Summary Dashboard

**Verdicts by level:**

| Level      | Pass | Weak | Fail | Fixed | Total |
|------------|------|------|------|-------|-------|
| section    | 5    | 1    | 0    | 1     | 7     |
| subsection | 9    | 7    | 0    | 1     | 17    |
| **Total**  | **14** | **8** | **0** | **2** | **24** |

*Section verdicts: §1 pass, §2 **fixed**, §3 weak, §4 pass, §5 pass, §6 pass, §7 pass.*
*Subsection: §4.1 reconsidered → pass. §4.6 **fixed**. All other verdicts unchanged.*

**Remaining fixes (proposed rewrites in violations section above):**

1. [H3] §3 Reduced-Form Facts — weak; roadmap opener; "competitive bottleneck" arrives late
2. [H7] §4.4 Stage 1: Network Competition — weak; no preview of what the FOCs imply
3. [H6] §4.3 Stage 2: Pricing, Acceptance, and Adoption — weak; acceptance trade-off absent from sentence 1
4. [H9] §6.1 Capping Credit Card Merchant Fees — weak; roadmap opener for the paper's main counterfactual
5. [H8] §5.3 Goodness of Fit — weak; OptBlue test not previewed
6. [H4] §3.4 The Competitive Bottleneck — weak; no deliverable in the opener
7. [H10] §6.5 CBDC — weak; motivation only, no finding

---

## What's Working

1. **§5.2 "Merchant and Consumer Sensitivities and Credit Aversion"** opens with: "The estimated parameters support the competitive bottleneck: consumers are far more sensitive to rewards than merchants are to fees, so networks compete for consumers rather than merchants." The opener is exemplary: exact thematic phrase, finding, and mechanism all in one sentence. Other results-section openers should replicate this pattern.

2. **§6.2 "Repealing the Durbin Amendment"** opens with a claim: "Fee caps raise welfare by correcting adoption distortions, not by reducing market power." It anchors the section in the paper's central diagnostic and sets up the surprising result. Compare to §6.1.

3. **§2.2 "Data"** opens with a sentence that maps directly onto the three RAP forces: "I combine five data sources to measure consumer reward sensitivity, how card acceptance affects sales, and multi-homing rates." The three objects listed correspond exactly to the three facts in §3, creating a transparent handoff. Good model for how a data-section opener should anticipate empirical structure.
