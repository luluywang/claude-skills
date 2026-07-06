# Relevance Audit: `appendix_credit_debit.tex`

Scope: `draft_202601/appendix_credit_debit.tex`, levels `subsection` and `paragraph`. Subsubsections appear in the purpose tree with heading plus Claude's read but are not graded. The parent `\section` (Credit-Debit Segmentation) is also shown as context only.

---

## RAP Seed (confirmed by user via interview)

**Research question:**
> What are the effects of fee regulation and network competition in payment markets?

**Main answer / finding:**
> Fees are too high, but competition is the reason everybody uses high-fee payment methods. Capping fees helps by reducing credit card adoption.

**Positioning:**
> Two decades of litigation and legislation are predicated on the view that fees are too high and that it is because competition is weak. This paper tests that view and finds the diagnosis wrong: fees are indeed too high, but the cause is intense rewards-based competition, not weak competition.

**Thematic phrases:**
- "price coherence"
- "credit aversion"
- "competitive bottleneck"
- "the wrong diagnosis"
- "tax merchants to subsidize consumers"
- "rewards competition, not market power"
- "single-homing" / "multi-homing"
- "dual-routing"

**Parent goal for this appendix (from RAP seed):**

Defend the credit-debit segmentation assumption that underlies the baseline model. Every subsection and paragraph must advance one of:
- (a) empirical basis for segmentation at the point of sale;
- (b) a parameterized generalization that nests segmentation as a knife-edge;
- (c) test the generalization's predictions against the Durbin evidence and reject them;
- (d) present the "debit as cash" corner that avoids the rejected predictions and replicates baseline welfare;
- (e) microfoundation showing segmentation at usage is compatible with substitution at adoption (the rewards channel the paper needs).

---

## How Claude Reads the Paper (Purpose Tree)

- **§ Credit-Debit Segmentation** (appendix_credit_debit.tex:4) — *context only*
  - *First sentence:* "The baseline model assumes consumers do not substitute between credit and debit at the point of sale."
  - *Claude's read:* top-level section; sets up the five-part defence (a)–(e) of the segmentation assumption.

  - **§ Empirical Evidence for Credit-Debit Segmentation** (appendix_credit_debit.tex:23)
    - *First sentence:* "Antitrust testimony in \emph{Ohio v.\ American Express} identifies the credit facility as the primary reason merchants cannot substitute debit for credit \parencite{Conrath2014}."
    - *Claude's read:* deliver goal (a) — muster the trial-testimony basis for segmentation on the merchant side.
    - *Verdict:* **pass**

    - *¶ (appendix_credit_debit.tex:26–30, opens the subsection):* "Antitrust testimony in \emph{Ohio v.\ American Express} identifies the credit facility as the primary reason merchants cannot substitute debit for credit \parencite{Conrath2014}."
      - *Claude's read:* merchant-side evidence: credit facility and security-deposit needs make debit an inadequate substitute.
      - *Verdict:* **pass** (audited as the subsection opener).

    - *¶ (appendix_credit_debit.tex:32–33):* "Consumers also do not view credit and debit as substitutes at the transaction level."
      - *Claude's read:* consumer-side half of goal (a) — threshold evidence that consumers pick card type by ticket size, not cross-use.
      - *Verdict:* **pass**

  - **§ Generalizing Credit-Debit Substitution** (appendix_credit_debit.tex:38)
    - *First sentence:* "The alternative specifications below differ in how much consumers substitute between credit and debit at the point of sale."
    - *Claude's read:* deliver goal (b) — introduce $\zeta$ and $\kappa_d$ so segmentation is nested as a knife-edge.
    - *Verdict:* **pass**

    - *¶ `\paragraph{Generalized payment probabilities.}` (appendix_credit_debit.tex:42–45):* "When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type."
      - *Claude's read:* write down how $\zeta$ enters the consumer-side payment probabilities.
      - *Verdict:* **pass**

    - *¶ `\paragraph{Generalizing the full merchant problem.}` (appendix_credit_debit.tex:64–104):* "Below we show how to generalize the model when debit cards generate fewer incremental sales than credit cards."
      - *Claude's read:* extend the merchant-side equations to heterogeneous $\kappa_j$.
      - *Verdict:* **pass**

    - *¶ `\paragraph{Two-card credit-debit acceptance threshold.}` (appendix_credit_debit.tex:106–130):* "The general model simplifies in the two-card case where the merchant already accepts debit and decides whether to add credit."
      - *Claude's read:* specialise the generalised model to the credit-given-debit decision that will matter for the rejected predictions.
      - *Verdict:* **pass**

    - *¶ `\paragraph{When does credit-debit multi-homing matter?}` (appendix_credit_debit.tex:132–140):* "$D$ enters the threshold~\eqref{eq:general-credit-debit-threshold} through two channels: a fee effect, $D(\tau_c - \tau_d)$ in the numerator, and a sales effect, $D\kappa_d(1-\sigma\tau_d)$ in the denominator."
      - *Claude's read:* pin down the two corners ($\zeta=0$; $\kappa_d=0,\tau_d=0$) that make multi-homing irrelevant, setting up the three-specification table.
      - *Verdict:* **pass**

  - **§ Debit as a Partial Substitute for Credit** (appendix_credit_debit.tex:173)
    - *First sentence:* "If debit is even a partial substitute for credit, two consequences follow."
    - *Claude's read:* deliver goal (c) — estimate the interior-$\zeta$ specification and reject its two predictions against Durbin.
    - *Verdict:* **pass**

    - **§§ Model Modification** (appendix_credit_debit.tex:178) — *context only*
      - *First sentence:* "This specification assumes intermediate levels of credit-debit substitution and allows debit cards to generate incremental sales relative to cash."
      - *Claude's read:* spell out the $\zeta=0.5$, $\kappa_d=0.5$ choice, the drop of AmEx, and the fixed-cost adjustment needed to estimate it.

      - *¶ (appendix_credit_debit.tex:180):* "This specification assumes intermediate levels of credit-debit substitution and allows debit cards to generate incremental sales relative to cash."
        - *Claude's read:* state the two key parameter choices that define the specification.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:182–185):* "Two additional adjustments are required."
        - *Claude's read:* flag the first adjustment — dropping AmEx — and explain why substitution forces it.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:187–193):* "Second, a fixed cost of card acceptance $F$ is added to the merchant's acceptance problem."
        - *Claude's read:* introduce the fixed-cost adjustment and explain the counterfactual ordering it prevents.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:195):* "Table~\ref{tab:param-half-kappa} reports estimated parameters under intermediate debit-credit substitution."
        - *Claude's read:* hand off to the parameter table.
        - *Verdict:* **pass**

    - **§§ Parameter Estimates** (appendix_credit_debit.tex:225) — *context only*
      - *First sentence:* "Partial substitution makes cheap debit a close alternative to expensive credit in the merchant's acceptance decision, so the estimator must explain why merchants keep accepting expensive credit anyway."
      - *Claude's read:* interpret the $\sigma=4.98$ vs.\ baseline $5.61$ move; note network costs remain plausible.

      - *¶ (appendix_credit_debit.tex:227–231):* "Partial substitution makes cheap debit a close alternative to expensive credit in the merchant's acceptance decision, so the estimator must explain why merchants keep accepting expensive credit anyway."
        - *Claude's read:* explain why the CES elasticity has to fall, and confirm network costs stay plausible.
        - *Verdict:* **pass**

    - **§§ Two Testable Predictions** (appendix_credit_debit.tex:233) — *context only*
      - *First sentence:* "Two testable predictions follow from the partial-substitute model."
      - *Claude's read:* set up the two predictions the section will then reject.

      - *¶ (appendix_credit_debit.tex:235):* "Two testable predictions follow from the partial-substitute model."
        - *Claude's read:* one-line framing sentence; tees up the two paragraphs below.
        - *Verdict:* **pass**

      - *¶ `\paragraph{Prediction 1: Merchants should weigh credit-debit multi-homing when deciding which credit cards to accept}` (appendix_credit_debit.tex:237–241):* "The acceptance threshold~\eqref{eq:general-credit-debit-threshold} contains $D = \zeta M$."
        - *Claude's read:* derive Prediction 1 directly from the threshold; no estimation needed.
        - *Verdict:* **pass**

      - *¶ `\paragraph{Prediction 2: Capping debit fees should lower credit fees}` (appendix_credit_debit.tex:243–250):* "To understand how capping debit fees affects equilibrium credit merchant fees, I estimate the model and evaluate how uncapping debit fees affects equilibrium credit fees."
        - *Claude's read:* derive Prediction 2 by simulating the uncap-debit counterfactual under the partial-substitute estimates.
        - *Verdict:* **weak** — opener starts with procedure ("To understand how…, I estimate…") rather than the prediction; criterion F is soft and the paragraph's claim (uncapping debit raises credit fees 33 bps) is buried two sentences down. See rewrite [M1] below.

    - **§§ Evidence Against Both Predictions** (appendix_credit_debit.tex:252) — *context only*
      - *First sentence:* "Both predictions about the drivers of merchants' credit card acceptance decisions and the effects of debit fee caps on credit fees are rejected."
      - *Claude's read:* confront the two predictions with the trial-testimony and Durbin-pricing evidence.

      - *¶ (appendix_credit_debit.tex:254):* "Both predictions about the drivers of merchants' credit card acceptance decisions and the effects of debit fee caps on credit fees are rejected."
        - *Claude's read:* summary sentence that labels the subsection's verdict.
        - *Verdict:* **pass**

      - *¶ `\paragraph{Credit acceptance does not depend on credit-debit multi-homing.}` (appendix_credit_debit.tex:256–258):* "Expert witnesses in \emph{Ohio v.\ American Express} testified that merchants discipline credit fees by threatening to divert transactions to rival credit cards, not to debit \parencite{Conrath2014}."
        - *Claude's read:* reject Prediction 1 using trial testimony: disciplining goes credit-to-credit, not credit-to-debit.
        - *Verdict:* **pass**

      - *¶ `\paragraph{Capping debit fees did not lower credit fees.}` (appendix_credit_debit.tex:268–281):* "The Durbin Amendment cut regulated debit interchange fees by roughly half."
        - *Claude's read:* reject Prediction 2 by showing credit fees did not move after Durbin, backed by Katz and merchant testimony.
        - *Verdict:* **pass**

    - **§§ Counterfactual Scenarios** (appendix_credit_debit.tex:284) — *context only*
      - *First sentence:* "For counterfactuals that primarily affect credit, the partial-substitute specification yields welfare estimates close to the baseline, even setting aside the rejected pricing linkage."
      - *Claude's read:* show that where this specification is internally consistent, welfare numbers match baseline; flag where the rejected pricing linkage drives them apart.

      - *¶ (appendix_credit_debit.tex:286–292):* "For counterfactuals that primarily affect credit, the partial-substitute specification yields welfare estimates close to the baseline, even setting aside the rejected pricing linkage."
        - *Claude's read:* show the fee-cap welfare number survives ($\$28$B vs.\ $\$27$B) under this specification.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:294–300):* "The pricing linkage does, however, reverse the sign of uncapping debit: total welfare falls by \$10B (SE \$2.8B) versus a \$7B gain at baseline."
        - *Claude's read:* flag that uncap-debit welfare flips sign because the (rejected) pricing linkage forces credit fees up.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:302–310):* "The pricing linkage amplifies dual routing: welfare gains rise to \$14B (SE \$3.9B) versus \$3.8B at baseline."
        - *Claude's read:* note that dual-routing welfare also moves, for the same reason, and explain the intuition.
        - *Verdict:* **pass**

  - **§ Debit as Cash** (appendix_credit_debit.tex:343)
    - *First sentence:* "The partial-substitute specification makes card acceptance depend on credit-debit multihoming rates."
    - *Claude's read:* deliver goal (d) — show the corner specification ($\zeta=1,\kappa_d=0,\tau_d=0$) that avoids the rejected predictions yet keeps baseline welfare.
    - *Verdict:* **pass**

    - **§§ Model Modification** (appendix_credit_debit.tex:352) — *context only*
      - *First sentence:* "At the debit-as-cash corner $(\zeta, \kappa_d) = (1, 0)$, consumers freely substitute between all cards in their wallet regardless of type, and debit acceptance generates no incremental sales."
      - *Claude's read:* spell out how the $\tau_d=0$ renormalisation changes the fee ladder while leaving the merchant FOC's form intact.

      - *¶ (appendix_credit_debit.tex:354–358):* "At the debit-as-cash corner $(\zeta, \kappa_d) = (1, 0)$, consumers freely substitute between all cards in their wallet regardless of type, and debit acceptance generates no incremental sales."
        - *Claude's read:* define the corner and trace the fee renormalisation.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:360–361):* "With $\kappa_d = 0$, debit acceptance generates no incremental sales benefit in $b_M$ (Eq.~\ref{eq:merch-accept}), so I impose universal debit acceptance."
        - *Claude's read:* justify the universal-debit-acceptance imposition as without loss.
        - *Verdict:* **pass**

    - **§§ Parameter Estimates and Counterfactuals** (appendix_credit_debit.tex:363) — *context only*
      - *First sentence:* "Treating debit as cash lowers every credit card's net cost of acceptance because fees are measured relative to cash and cash's implied cost rises to equal debit's."
      - *Claude's read:* interpret the $\sigma=7.16$ estimate and report the counterfactual numbers.

      - *¶ (appendix_credit_debit.tex:365–367):* "Treating debit as cash lowers every credit card's net cost of acceptance because fees are measured relative to cash and cash's implied cost rises to equal debit's."
        - *Claude's read:* explain why the CES elasticity has to rise under this renormalisation.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:392):* "Tables~\ref{tab:cf-prices-extension} and~\ref{tab:welfare-extension} report counterfactual prices and welfare under the debit-as-cash specification."
        - *Claude's read:* hand off to the counterfactual tables.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:417–428):* "Fee cap welfare is similar across all three specifications: \$27B at baseline, \$28B under partial substitution, and \$23B under debit as cash (Table~\ref{tab:welfare-extension})."
        - *Claude's read:* deliver the punchline — fee-cap welfare $\$23$B vs.\ baseline $\$27$B — and explain why the assumption has little bite here.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:430–435):* "Other counterfactuals are more sensitive."
        - *Claude's read:* note where the specification does move numbers (monopoly: $\$8$B vs.\ $\$15$B) and why debit-only counterfactuals are omitted.
        - *Verdict:* **pass**

  - **§ A Microfoundation for Segmentation Between Credit and Debit at the Point of Sale** (appendix_credit_debit.tex:441)
    - *First sentence:* "This section derives a microfoundation showing how payment methods can be substitutes at adoption yet poor substitutes at the point of sale."
    - *Claude's read:* deliver goal (e) — show that usage-stage segmentation is compatible with adoption-stage substitution, which is what the Durbin rewards channel requires.
    - *Verdict:* **pass**

    - **§§ Utility at the Point of Sale** (appendix_credit_debit.tex:449) — *context only*
      - *First sentence:* "At the point of sale, the consumer picks one card from her wallet."
      - *Claude's read:* write down the random-coefficient logit that will let $\Sigma$ control usage-stage segmentation.

      - *¶ (appendix_credit_debit.tex:451–452):* "At the point of sale, the consumer picks one card from her wallet."
        - *Claude's read:* define notation and the utility specification.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:459–461):* "The random shocks $\gamma_{it} \in \mathbb{R}^k$ capture transaction-specific preferences over card types: for a given transaction, a consumer may strongly prefer credit over debit, or cards over cash."
        - *Claude's read:* interpret the role of the two shock terms — $\gamma_{it}$ for card-type preference, $\epsilon_{ijt}$ for within-type variation.
        - *Verdict:* **pass**

      - *¶ (appendix_credit_debit.tex:463–468):* "These assumptions yield the expected utility from wallet $W_i$:"
        - *Claude's read:* deliver the expected-utility formula that feeds into the adoption stage.
        - *Verdict:* **pass**

    - **§§ Utility at Adoption** (appendix_credit_debit.tex:470) — *context only*
      - *First sentence:* "At adoption, consumers choose a wallet to maximize expected point-of-sale utility less adoption costs:"
      - *Claude's read:* write down the adoption problem that integrates over $\gamma_{it}$.

      - *¶ (appendix_credit_debit.tex:472–478):* "At adoption, consumers choose a wallet to maximize expected point-of-sale utility less adoption costs:"
        - *Claude's read:* state the adoption problem and the adoption-cost notation.
        - *Verdict:* **pass**

    - **§§ Mapping to the Model in the Main Text** (appendix_credit_debit.tex:480) — *context only*
      - *First sentence:* "The microfounded model clarifies two points: how segmentation at the point of sale differs from segmentation at adoption, and how payment methods can complement or substitute for each other in a wallet."
      - *Claude's read:* link the micro-parameters ($\Sigma$, $\nu^2$) back to the assumptions and complementarities in the main text.

      - *¶ (appendix_credit_debit.tex:482):* "The microfounded model clarifies two points: how segmentation at the point of sale differs from segmentation at adoption, and how payment methods can complement or substitute for each other in a wallet."
        - *Claude's read:* roadmap the two downstream paragraphs.
        - *Verdict:* **pass**

      - *¶ `\paragraph{Usage-stage vs.\ adoption-stage segmentation.}` (appendix_credit_debit.tex:485–496):* "The main text assumes consumers use credit and debit for distinct transaction types, yet those carrying two credit cards freely substitute between them."
        - *Claude's read:* show that large $\Sigma$ gives usage-stage segmentation while small $\nu^2$ keeps adoption-stage substitution alive.
        - *Verdict:* **pass**

      - *¶ `\paragraph{Complements and substitutes at adoption.}` (appendix_credit_debit.tex:498–509):* "The microfounded model also explains why debit holders may want to adopt credit cards."
        - *Claude's read:* use the option-value logic to microfound the $\chi^{lm}$ complementarities in the main text.
        - *Verdict:* **pass**

---

## Violations (severity-sorted)

### [M1] Prediction 2 paragraph in §§ Two Testable Predictions (appendix_credit_debit.tex:243–250) — **weak**

**Parent goal:** Derive the two partial-substitute predictions the next subsubsection will reject, so the claim that the specification is inconsistent with the Durbin evidence is sharp.

**Original opener:**
> To understand how capping debit fees affects equilibrium credit merchant fees, I estimate the model and evaluate how uncapping debit fees affects equilibrium credit fees.

**Verdict:** weak — the opener leads with procedure ("To understand how…, I estimate…") rather than the prediction itself. The lighter F–H test asks whether sentence 1 advances the enclosing node's argument; the argument here is a prediction that capping debit fees pulls credit fees down, but the opener defers that claim to sentence 3 ("the uncap debit column…shows that after removing the Durbin cap, credit fees rise 33 bps"). Sentence 1 also re-labels the prediction in the heading with no added content.

**Proposed rewrite:**
> Under partial substitution, the debit fee disciplines how high networks can price credit before merchant acceptance erodes. Estimating the model and then uncapping debit confirms the prediction: credit fees rise 33 bps once the Durbin cap is removed (Table~\ref{tab:cf-prices-half-kappa}).

**Why the rewrite works:**
- Sentence 1 states the mechanism — the debit fee disciplining credit pricing — in the appendix's own language rather than the paragraph's "to understand how" frame.
- Sentence 2 does the estimation bookkeeping and leads with the 33-bp magnitude rather than hiding it two sentences down.
- Only the existing `\ref` macro and table label are reused; no new macros.
- Sentence 1 is 17 words; sentence 2 is 22 words.

**Severity:** medium — the node is `weak` at the paragraph level but sits at the exact beat where the appendix's core argument (b)→(c) hinges; strengthening the opener makes the rejection in the next subsubsection land harder.

---

## Summary Dashboard

**Verdicts by level (audited only):**

| Level          | Pass | Weak | Fail | Total |
|----------------|------|------|------|-------|
| subsection     |   5  |  0   |  0   |   5   |
| paragraph      |  22  |  1   |  0   |  23   |
| **Total**      |  27  |  1   |  0   |  28   |

(Subsubsections: 10 nodes shown in tree as context; not graded. Section `\section{Credit-Debit Segmentation}` also shown as context.)

**Top priority fixes:**
1. [M1] Prediction 2 paragraph in §§ Two Testable Predictions — see rewrite above. Leading with procedure buries the 33-bp claim that the next subsubsection will reject.

## What's Working

1. The two subsection openers that carry the deliverables — "If debit is even a partial substitute for credit, two consequences follow" (§ Debit as a Partial Substitute) and "The partial-substitute specification makes card acceptance depend on credit-debit multihoming rates" (§ Debit as Cash) — state the local claim in sentence 1 and hand off cleanly to the next subsection. Replicate this pattern elsewhere when a subsection exists to reject or rescue a claim just made.
2. The `\paragraph{Capping debit fees did not lower credit fees.}` opener leads with the Durbin fact ("The Durbin Amendment cut regulated debit interchange fees by roughly half"), then stacks testimony around it — the heading is the claim and the body is the evidence, which is the right shape for a rejection paragraph.
3. The microfoundation subsection opener ("This section derives a microfoundation showing how payment methods can be substitutes at adoption yet poor substitutes at the point of sale") states the target result in one clause; it resists the usual temptation to open with the setup.
