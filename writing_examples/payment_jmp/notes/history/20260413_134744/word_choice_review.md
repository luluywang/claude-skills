# Word Choice Review

## [appendix_model.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is technically precise and appropriate for mathematical exposition:
- "weights" (line 23): Precise technical term for weighted average in econometric context.
- "recovers" (line 74): Correct term meaning "derives back" the coefficients.
- "Collecting terms" (lines 28, 86): Direct and economical algebraic phrasing.
- "Evaluating profits at" (line 85): Clear technical language.
- All technical terms ("homothetic," "envelope theorem," "quasi-profits," "order-$\tau_j$ neighborhood") are used correctly with proper mathematical definitions.

No weak verbs, nominalization, redundant phrases, or pretentious vocabulary. Language is concise and appropriately technical for the intended audience.

**Verdict:** Excellent word choice — no revisions needed.

---

## [institutional_details.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is direct, concrete, and precise. Strong verbs dominate ("set," "influence," "connect," "fund," "confirm," "capped"). No nominalization, no weak Anglo-Latin substitutions, no redundant phrases. Concrete examples (Wells Fargo, Square, Chase) ground abstract concepts. Numbers serve specific evidentiary claims ("roughly one-for-one," "70\% of interest"). No padding phrases or useless modifiers. Vocabulary is appropriately technical without being pretentious.

**Verdict:** Excellent word choice — no revisions needed.

## [data.tex]

### - [ ] Lines 64-65: Redundant modifier

**Comment:** Useless adjective weakening precision

**Original:**
```
The rich demographic detail in these surveys identifies income gradients in payment preferences.
```

**Proposed Revision:**
```
The demographic detail in these surveys identifies income gradients in payment preferences.
```

**Why better:** "Rich" is a formulaic intensifier that adds no information. The claim stands on its own; the data speak for themselves. Removing it tightens the sentence and sharpens focus.

---

## [conclusion.tex]

### - [ ] Lines 9, 21: Vague adjectives reducing precision

**Comment:** "Broad implications" and "conventional wisdom" are abstract and underdefined.

**Original:**
```
The counterfactual results in this paper have broad implications for contemporary legal and policy debates in payments and platform markets more broadly.
```
and
```
The merger counterfactual challenges a second piece of conventional wisdom: that the high cost of payments reflects too little competition.
```

**Proposed Revision:**
```
These results reshape antitrust analysis in two-sided markets, as the paper shows that conventional metrics for market harm can point in the wrong direction.
```

**Why better:** Replaces vague "broad implications" with specific claim about antitrust analysis; removes nested abstraction ("platform markets more broadly"). For line 21, the second sentence is already clear in context ("conventional wisdom: that...") so the first instance could stand alone by directly naming what is challenged.

---

**Overall Assessment:** Word choice in conclusion.tex is strong — concrete verbs, precise claims, minimal padding. The issues flagged above are minor vagueness rather than weak vocabulary.

## [appendix_data_oa.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is direct, precise, and appropriately technical for methodological documentation. Strong verbs dominate ("draw on," "classify," "assign," "compute," "construct," "identify," "flag," "search"). No nominalizations, weak verbs, or Anglo-Latin substitutions. Concrete examples (community banks, credit unions, Chase, Bank of America, Citibank, Wells Fargo) ground abstract concepts. Technical terms are used correctly ("survey-weighted share," "sales-weighted," "geometric means"). Numbers serve specific methodological claims (25,000 consumers, 50,000 from 2021, 214 merchants, 48% credit, 38% debit, 14% cash, 8–10 pp. standard deviations). No padding phrases or useless modifiers. Vocabulary is appropriately technical without being pretentious.

**Verdict:** Excellent word choice — no revisions needed.
## [model.tex]

### - [ ] Lines 188: "agents" should be "consumers" in payment context

**Comment:** Terminology — "agents" is overly generic/technical. In a payments model context where you refer to "consumers" throughout, using "agents" is unnecessarily formal.

**Original:**
```
For multi-homing agents, pecuniary utility is the weighted average of single-homing utilities:
```

**Proposed Revision:**
```
For multi-homing consumers, pecuniary utility is the weighted average of single-homing utilities:
```

**Why better:** Consistent terminology with the rest of the model section where "consumers" is the standard term.

---

### - [ ] Lines 268-270: "Taking other networks' actions as given" is passive/weak

**Comment:** Weak verb phrasing. "Taking actions as given" is less direct than naming the game structure (Bertrand, Cournot, etc.).

**Original:**
```
Networks set transaction fees $\tau_j$ and pecuniary adoption benefits $A_j$, taking other networks' actions as given.
```

**Proposed Revision:**
```
Networks set transaction fees $\tau_j$ and adoption benefits $A_j$ in a Nash equilibrium, anticipating rivals' moves.
```

**Why better:** "Anticipating rivals' moves" is more active and precise than the passive construction "taking actions as given."

---


## [intro.tex]

**Status:** Excellent word choice throughout. No major issues detected.

**Assessment:** Word choice is direct, concrete, and technically appropriate:
- Strong verbs dominate: "process," "motivate," "find," "compete," "tax," "subsidize," "inflate," "draw," "shift"
- Technical terms used correctly: "price coherence," "competitive bottleneck," "interchange," "rewards"
- No weak Anglo-Latin substitutions (e.g., "utilize" instead of "use")
- No nominalization problems
- Numbers serve evidentiary claims and advance arguments
- Concrete examples (Durbin Amendment, DOJ lawsuit, CBDC)

The vocabulary is appropriately technical for an economics paper without being pretentious. Active voice dominates. Mechanisms are explained clearly. The prose is economical — every word earns its place.

**Verdict:** Excellent word choice — no revisions needed.

## [appendix_model_oa.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is technically precise and appropriate for mathematical/technical exposition:
- "works out" (line 10): Acceptable technical phrasing for deriving quantities.
- "hinges on" (line 49): Reasonable metaphor for dependency in technical context.
- "takes...as given" (line 139): Standard economic language for exogeneity assumption.
- "integrating...over" (line 148): Precise mathematical phrasing.
- "iterates on" (line 143): Direct technical language.
- All technical terms ("quasi-profit," "trembles," "Gauss-Hermite quadrature," "fixed point," "damping") are used correctly with proper mathematical/computational definitions.

No weak verbs, nominalization, redundant phrases, or pretentious vocabulary. Language is concise and appropriately technical for the intended audience (economists with technical modeling expertise).

**Verdict:** Excellent word choice — no revisions needed.

## [appendix_reduced.tex]

### Vague or Unnecessarily Latin Terms

- [ ] Lines 136-137: "If these channels are substitutes..."
  - **Category:** Technical precision / nominalization
  - **Comment:** "channels are substitutes" is correct jargon, but the sentence buries the actual mechanism
  - **Original:** "If these channels are substitutes, banks that relied on rewards to promote debit spent less on non-price promotion."
  - **Proposed Revision:** "If banks substitute across these channels, reward-heavy banks should spend less on advertising and branch incentives."
  - **Why better:** More concrete (names specific alternatives: advertising, branch incentives) and shorter

### Weak Verbs & Nominalizations

- [ ] Lines 153: "That rewards alone can account for the full decline suggests they drove much of the overall effect"
  - **Category:** Weak verb / nominalization ("can account for" → "account")
  - **Comment:** "can account for" is weaker than "account for"
  - **Original:** "That rewards alone can account for the full decline suggests they drove much of the overall effect, though the small sample size limits further decomposition."
  - **Proposed Revision:** "Rewards alone account for the full decline, suggesting they drive most of the effect."
  - **Why better:** Removes "can" (unnecessary modal), removes "suggests" (just state it), drops the defensive "though..." clause

- [ ] Lines 172-173: "uses... design as the main specification, with log deposits as the outcome"
  - **Category:** Nominalization ("with log deposits as the outcome" → dependency variable / outcome variable)
  - **Comment:** "outcome" is correct but follows an NP-heavy construction
  - **Original:** "The left panel uses the same Nilson Report panel and difference-in-differences design as the main specification, with log deposits as the outcome."
  - **Proposed Revision:** "The left panel replicates the main specification using log deposits as the dependent variable."
  - **Why better:** Shorter, more direct, eliminates parenthetical "with..."

### Redundant Phrases

- [ ] Lines 167-169: "An alternative explanation for the debit volume decline is that consumers switched from large banks to small banks after Durbin, taking their debit volumes with them."
  - **Category:** Redundancy / unnecessary elaboration
  - **Comment:** "switched to small banks" already implies they took volumes; "taking their debit volumes with them" is redundant
  - **Original:** "An alternative explanation for the debit volume decline is that consumers switched from large banks to small banks after Durbin, taking their debit volumes with them."
  - **Proposed Revision:** "One alternative: consumers switched from large to small banks after Durbin, moving their debit volumes with them."
  - **Why better:** Eliminates "An alternative explanation for... is that" (verbose); "taking... with them" now reads less redundantly when paired with "switched"

### Over-Explanation & Jargon Precision

- [ ] Lines 468-475: Technical subsection on "Technical Details of Constructing Network Diversion"
  - **Category:** Over-explanation for field audience
  - **Comment:** Explaining why survey question asks about banks rather than networks treats reader as naive about survey design
  - **Original:** "The survey asks how consumers would switch if their bank stopped offering their preferred payment type. The model requires diversion between networks (e.g., Visa to Mastercard), but the survey measures diversion between banks (e.g., Chase to Bank of America). I designed the question this way because consumers often do not know which cards are Visa or Mastercard."
  - **Proposed Revision:** "The survey measures bank-level diversion; the model requires network-level diversion. Consumers often misidentify card networks, so I recover network diversion by adjusting for expected within-network bank switches (see Appendix for formal construction)."
  - **Why better:** Assumes field knowledge, avoids pedagogical tone, forwards the logic rather than explaining the design choice

### Weak Word Choice / Imprecision

- [ ] Lines 134: "teller incentives"
  - **Category:** Vague noun modifier
  - **Comment:** "teller incentives" is unclear; do employees get bonus pay? Store coupons?
  - **Original:** "Banks fund debit promotion from interchange revenue, allocating across rewards, advertising, and teller incentives."
  - **Proposed Revision:** "Banks fund debit promotion across consumer rewards, advertising, and in-branch promotions."
  - **Why better:** More concrete and parallel

- [ ] Lines 152: "That rewards alone can account for the full decline suggests..."
  - **Category:** Weak construction ("can account for" + "suggests")
  - **Comment:** Double hedging (can + suggests)
  - **Original:** "That rewards alone can account for the full decline suggests they drove much of the overall effect, though the small sample size limits further decomposition."
  - **Proposed Revision:** "Rewards account for the entire decline, suggesting they're the dominant driver."
  - **Why better:** Removes "can," consolidates hedges

### Field-Specific Precision Issues

- [ ] Lines 155-158: "I do not run a horse race between being above the cutoff and terminating rewards. A regression that controls for rewards and being above or below the cutoff would be misspecified. It assumes equal non-price baselines across banks, whereas the substitution logic implies the opposite."
  - **Category:** Clarity / precision (explains why NOT to do something but uses jargon)
  - **Comment:** "horse race," "controls for," "would be misspecified" are correct but the explanation of why is unclear
  - **Original:** "I do not run a horse race between being above the cutoff and terminating rewards. A regression that controls for rewards and being above or below the cutoff would be misspecified. It assumes equal non-price baselines across banks, whereas the substitution logic implies the opposite."
  - **Proposed Revision:** "A regression controlling for both rewards and the Durbin cutoff would be misspecified. The substitution logic implies non-price promotion differs between reward-reliant and reward-independent banks, violating the assumed equal baselines."
  - **Why better:** States the problem directly (why it's misspecified), then explains the source of bias (different counterfactuals)


## [appendix_sorting.tex]

**Status:** Excellent word choice throughout. No word-level issues detected.

**Assessment:** Word choice in this section demonstrates strong technical precision and economy:
- Strong verbs dominate: "measure," "derive," "link," "compute," "classify," "assume," "filter," "capture," "interpret"
- Precise technical terminology used correctly: "covariance," "welfare," "compensating variation," "revenue-weighted," "sorting," "redistribution," "segmentation," "acceptance"
- No weak Anglo-Latin substitutions (e.g., "utilize," "implement," "facilitate" are absent; language uses "use," "do," "help")
- No nominalization problems or weak passive constructions
- Numbers serve evidentiary claims: "4–9 pp.", "91–96%", "15% of transactions", "90th percentile" all advance the argument, not listed as inventory
- Concrete examples ground abstract concepts: "high-end merchants," "discount retailers," "Homescan," "MRI-Simmons," "large stores," "small stores"
- Technical jargon is justified: "quasi-profit" (in model context), "welfare ratio," "revenue-weighted covariance" are all used with proper mathematical definitions
- No padding phrases or useless modifiers: "clear interpretation," "important implication" are absent; claims stand on their own
- Vocabulary is appropriately technical without being pretentious or flowery

The prose is economical and direct — every word serves the argument. Descriptions of data are concrete and specific. Mathematical exposition is precise.

**Verdict:** Excellent word choice — no revisions needed.

## [counterfactuals.tex]

### - [ ] Lines 21-22: Weak verb "driven by"

**Comment:** Nominalization / weak verb usage

**Original:**
```
Lower merchant fees reduce credit card rewards, correcting excessive adoption driven by price coherence.
```

**Proposed Revision:**
```
Lower merchant fees reduce credit card rewards, correcting excessive adoption that price coherence induces.
```

**Why better:** "That X induces" is more direct than "driven by X"; avoids passive-voice flavor.

### - [ ] Line 33: Vague abstraction "the combination"

**Comment:** Weak noun usage; "combination" is abstract where a specific mechanism would be clearer.

**Original:**
```
Ultimately, the combination of the price and quantity changes reduces total merchant fees and rewards by roughly equal amounts.
```

**Proposed Revision:**
```
As consumers substitute to debit and rewards fall, total merchant fees and rewards both fall by roughly equal amounts.
```

**Why better:** Shows *how* the combination works (substitution + reward decline) rather than just naming it as "combination."

### - [ ] Line 96: Weak setup "I measure consumer welfare by..."

**Comment:** Could open more directly with the definition rather than announcing it.

**Original:**
```
I measure consumer welfare by compensating variation:
\begin{equation}...
```

**Proposed Revision:**
```
Consumer welfare is measured by compensating variation:
\begin{equation}...
```

**Why better:** More direct; avoids "I measure" throat-clearing.

### - [ ] Lines 171-172: Verbose "I ignore the increase in checking account fees since..."

**Comment:** Could be tightened with "Checking account fee increases fall outside this analysis" or moved to footnote.

**Original:**
```
I ignore the increase in checking account fees since they do not influence the relative costs and benefits of different payment methods.
```

**Proposed Revision:**
```
Checking account fees fall outside this analysis: they do not alter relative payment method costs.
```

**Why better:** More concise; avoids "I ignore."

### - [ ] Line 203: Weak verb "cuts"

**Comment:** "Cuts" is colloquial but acceptable in economics prose. "Reduces" would be more formal and parallel to surrounding usage ("lowers," "falls").

**Original:**
```
Without competitive pressure to fund rewards, a monopolist cuts credit card rewards by 90 bps
```

**Proposed Revision:**
```
Without competitive pressure to fund rewards, a monopolist reduces credit card rewards by 90 bps
```

**Why better:** More consistent with formal register of surrounding text; "cuts" is too informal for technical economics.

### - [ ] Lines 234-235: Weak modifier "for the median consumer, this is equivalent to"

**Comment:** "Equivalent to" is indirect. Could be direct: "increases multi-homing to the same degree as a 25 bps reward increase..."

**Original:**
```
For the median consumer, this is equivalent to a 25 bps reward increase for those bundles.
```

**Proposed Revision:**
```
This increases multi-homing by the equivalent of a 25 bps reward increase for the median consumer.
```

**Why better:** Reorders for clearer subject-verb-object flow.

### - [ ] Line 288: Weak verb "lack"

**Comment:** Not a major issue, but "lack the required merchant-level interchange data" is verbose. "Cannot obtain" or "do not have access to" might be clearer.

**Original:**
```
The CES functional form specifies merchant fee pass-through to retail prices; I lack the required merchant-level interchange data matched to retail prices to test pass-through.
```

**Proposed Revision:**
```
The CES functional form specifies merchant fee pass-through to retail prices, but matching merchant-level interchange data to retail prices is not feasible.
```

**Why better:** Avoids "I lack"; focuses on the constraint, not the author's limitation.


## [appendix_estimation.tex]

**Pass 1 — Word Choice Review:**

No word choice issues detected. Verification of all major categories:

- **Anglo-Saxon vs. Latin:** All verbs are strong and direct: "estimate," "match," "pin down," "compute," "derive," "simulate," "adjust," "seek." No instances of "utilize," "commence," "demonstrate" (as weak verb), "implement," "facilitate."

- **Redundant phrases:** None found. Language is economical throughout. No "due to the fact that," "in the event that," "for the purpose of," "with regard to," "it is the case that."

- **Weak verbs:** All verbs are precise and active. "Match," "pin down," "derive," "compute," "simulate" — all specific and substantive. No hedge verbs like "appear," "suggest," "seem" (except where technically appropriate).

- **Nominalizations:** Minimal and all appropriate. Technical nouns required for econometric exposition: "identification," "estimation," "inference," "covariance," "elasticity," "threshold," "utility" (in CES utility context). No lazy nominalizations like "make a calculation" or "conduct an analysis."

- **Vague nouns:** None. Uses specific technical payment, econometric, and economics terms: "bootstrap samples," "moment conditions," "logit," "survey moments," "diversion share," "CES elasticity," "quasi-profits," "welfare loss." All concrete within technical context.

- **Useless modifiers:** None. All adjectives are necessary and descriptive: "random coefficients" (specific to model), "simulated moments" (technical), "consumer-level" (modifying data sources), "baseline choice probabilities" (specific to equilibrium concept).

- **Hedging language:** Single instance of "roughly" (line 22: "roughly half their current level") is load-bearing and appropriately calibrated. No stacked hedges detected. All hedging is precise and contextual.

- **Concrete specificity:** Excellent throughout. Names specific surveys (2024 second-choice survey, DCPC, Homescan, Nilson Report), specific years and periods (2007–2014, 2017–2019, 2019), specific parameters ($\Sigma$, $\chi^{lm}$, $\chi^{lm}_y$, $\omega$, $\pi$, $\bar{\gamma}$, $\nu_\gamma$, $\sigma$), specific equations (Equation \ref{eq:adoption-pecuniary-gain}, \ref{eq:general-accept-threshold}). Notation is consistent and clear.

- **Technical precision:** Perfect. Econometric terms (logit, simulated method of moments, first-order conditions, sufficient statistic, diversion share, quasi-profits, acceptance threshold) are all correctly used with proper context and no jargon overuse. Parameters are defined with formal notation.

- **Voice appropriateness:** Predominantly active ("I estimate," "I compute," "I simulate," "I adjust," "I seek," "I match," "I target"). When passive is used, it serves data-description function appropriately ("Cash and debit rewards are set to zero"; "MC Credit and AmEx fees are less precisely measured").

**Conclusion:** The methods section demonstrates exemplary word choice with strong, precise verbs, concrete technical nouns, and economical language. Every word earns its place in explaining parameters and identification strategies. No weak vocabulary, inflated modifiers, or unclear references. This is high-quality technical economics writing.


## [appendix_robustness.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is direct, precise, and appropriately technical. Strong verbs dominate ("modify," "re-estimate," "match," "reverse," "amplify," "discipline," "extrapolate"). No nominalization, no weak Anglo-Latin substitutions, no redundant phrases. Technical terms (CES markup, logistic function, elastic labor supply, composition effect, welfare decomposition, constrained optimization) are used correctly and with appropriate precision. Numbers serve specific evidentiary and mechanistic claims ("The gap reflects how pass-through interacts with the CES markup" — the word "gap" is concrete and precise). No padding phrases or useless modifiers. No instances of "leverage," "robust," "nuanced," "facilitate," "underscore," or other overused AI vocabulary. Vocabulary choices support clarity of technical exposition without pretension.

**Specific strengths:**
- Line 62: "The gap reflects..." — concrete antecedent, causal framing
- Line 104: "Credit access follows a logistic function..." — technical but clear, no abstraction
- Line 149: "Both specifications match the same Durbin Amendment moment" — precise, concrete
- Line 233-236: "monopoly counterfactual reverses sign" — technical precision without padding

**Verdict:** Excellent word choice — no revisions needed.


## [appendix_surcharging.tex]

**Status:** Excellent word choice throughout. Minimal issues detected.

**Assessment:** Word choice is direct, precise, and appropriate for legal/theoretical exposition:

**Strong elements:**
- Technical terms used correctly: "price coherence," "merchant fee," "surcharge," "envelope theorem," "fee dispersion," "competitive bottleneck," "quasi-profit"
- Strong verbs: "explain," "allow," "require," "shift," "surcharge," "fund," "guarantee," "granted," "removed," "banned," "flag," "deter," "steer," "charge," "accepts," "steer"
- No weak Anglo-Latin substitutions detected (no "utilize," "facilitate," "commence," "implement")
- No nominalizations or weak passive constructions
- Numbers are embedded naturally as evidence: "5%," "order of magnitude," "2-3%," "tens of bps"
- Concrete examples: Visa, Mastercard, American Express, Massachusetts, Connecticut, New York

**Minor word choice opportunities:**
- Line 38: "flag violations of price coherence" — could be "identify violations" or "detect violations" ("flag" is informal but acceptable in technical contexts)
- Line 57: The phrase "in a natural extension" is somewhat vague; could be "in an extended model allowing surcharging" for more precision

**Overall assessment:** Word choice is strong and economical. The writing is direct without being informal. Numbers serve claims rather than being listed inventorily. Technical vocabulary is precise and appropriate for an economics audience. No pretentious language or padding phrases.

**Verdict:** Excellent word choice — only minor stylistic refinements suggested above.


## [appendix_credit_debit.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is precise and economically appropriate for technical appendix exposition:
- "microfounds" (lines 7-8): Correct technical term in economics for deriving microfoundations
- "segmented" (used throughout): Direct and precise for the payment method distinction
- "captures" (lines 37-40): Appropriate technical usage for modeling assumptions
- "recovers" (lines 7-9, 25, 75): Correct derivative term (as in recovering coefficients/parameters)
- "Collecting terms yields" (line 223): Direct algebraic phrasing, not verbose
- "integrates over" (line 71): Precise mathematical language
- "pins down" (line 72): Idiomatic but appropriately informal for technical writing
- Institutional terminology: "complementarity," "multi-homing," "quasi-profit coefficients" used correctly with formal definitions preceding use

No weak verbs, no nominalization, no Anglo-Latin substitutions. Technical terms (strategic complementarities, welfare decomposition, equilibrium, Durbin Amendment) are used correctly. Trial testimony is presented in direct quotes, preserving authentic voice ("almost required," "impossible," "totally different products"). Numbers serve evidentiary claims in causal context, not inventory-style.

**Verdict:** Excellent word choice — no revisions needed.


## [estimation.tex]

### - [ ] Lines 10–13: "First, I estimate..." → "The identification proceeds through"

**Comment:** Enumeration structure; phrasing "I estimate... I recover... I recover" repeats agent and verb unnecessarily.

**Original:**
```
I estimate all parameters jointly, but the identification argument has three components.
First, I estimate consumer demand using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Second, I recover network costs by inverting first-order conditions.
Third, I recover merchant types from event-study evidence on card acceptance effects and acceptance rates.
```

**Proposed Revision:**
```
I estimate all parameters jointly using three identification strategies.
Consumer demand is estimated using quasi-experimental price variation, second-choice surveys \parencite{Berry.etal2004}, and demographic moments \parencite{Petrin2002}.
Network costs are recovered by inverting first-order conditions.
Merchant types are recovered from event-study evidence on acceptance changes.
```

**Why better:** Consolidates the introduction to three strategies; reduces agent repetition ("I estimate... I recover..."); tightens phrasing.

---

### - [ ] Lines 72–73: "Recovering this distribution is closer to a calibration exercise than a conventional estimation"

**Comment:** Weak hedging. Either it's calibration or estimation; "closer to" is vague.

**Original:**
```
Because U.S.\ payment markets are mature (98\% of Homescan trips in 2013 occur at stores already accepting credit cards), there is limited variation in merchant adoption, and recovering this distribution is closer to a calibration exercise than a conventional estimation.
```

**Proposed Revision:**
```
Because U.S.\ payment markets are mature (98\% of Homescan trips in 2013 occur at stores already accepting credit cards), merchant adoption variation is limited.
I calibrate the distribution of merchant types using event-study evidence rather than estimating it from acceptance variation.
```

**Why better:** Separates the constraint (limited variation) from the method (calibration); names the approach explicitly; removes hedging language.

---

### - [ ] Lines 152–155: "Consumers are roughly ten times as sensitive to rewards as merchants are to fees"

**Comment:** Weak phrasing in the following sentence: "A $1$-bp increase... reduces merchant acceptance by... (S.E....)". The "S.E." parenthetical interrupts flow; consider moving to footnote or reformatting.

**Original:**
```
Consumers are roughly ten times as sensitive to rewards as merchants are to fees.
A $1$-bp increase in Visa's merchant fees, holding fixed consumer adoption, reduces merchant acceptance by \absinput{divert_inst_merchant_price_visa_baseline}$\%$ (S.E. \absinput{divert_inst_merchant_price_visa_baseline_se}$\%$).
This asymmetry underpins the competitive bottleneck.
```

**Proposed Revision:**
```
Consumers are roughly ten times as sensitive to rewards as merchants are to fees.
A 1-bp increase in Visa's merchant fees reduces merchant acceptance by \absinput{divert_inst_merchant_price_visa_baseline}$\%$ (S.E.: \absinput{divert_inst_merchant_price_visa_baseline_se}$\%$), holding consumer adoption fixed.
This asymmetry is the competitive bottleneck's core.
```

**Why better:** Moves "holding consumer adoption fixed" to end for better flow; slightly tightens "underpins the" to "is the"; improves S.E. formatting.

---

### - [ ] Lines 157–163: Quoted "credit aversion" with footnote

**Comment:** Weak verb: "The parameters reveal substantial consumer ``credit aversion.''". The quotation marks weaken the claim. Consider "The parameters imply" or "show" instead.

**Original:**
```
The parameters reveal substantial consumer ``credit aversion.''
```

**Proposed Revision:**
```
The estimated parameters imply substantial non-pecuniary costs to credit cards.
```

**Why better:** Stronger, more direct phrasing; avoids quotation marks which soften the claim; names the mechanism (non-pecuniary costs) rather than using jargon.

---

### - [ ] Lines 84–87: "Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets."

**Comment:** Vague phrase: "a standard insight." This is throat-clearing that avoids naming the mechanism directly.

**Original:**
```
Merchant price-sensitivity at the observed equilibrium follows from a standard insight in two-sided markets.
Networks charge high fees to merchants and use the revenue to fund rewards for price-sensitive consumers, so merchants must be relatively insensitive to fees compared to consumers' sensitivity to rewards.
```

**Proposed Revision:**
```
Merchant price-sensitivity at equilibrium follows directly: networks charge high merchant fees to fund consumer rewards, so merchants must be fee-insensitive relative to consumers' reward sensitivity.
```

**Why better:** Eliminates "standard insight" hedge; names the mechanism explicitly in a single sentence; tightens the logic.

---

## [reducedform.tex]

**Status:** No word choice issues detected.

**Assessment:** Word choice throughout is direct, precise, and appropriately technical for reduced-form evidence exposition. Strong verbs dominate ("drive," "capture," "incentivizes," "identify," "compared," "risk," "accept," "fund," "steer"). No nominalizations, weak Anglo-Latin substitutions, or redundant phrases. 

Technical terms are used correctly:
- "Durbin Amendment" (institutional term, not inflated puffery)
- "signature debit" (precise product distinction, not jargon)
- "multi-homing" (standard network economics term, used accurately)
- "competitive bottleneck" (Armstrong 2006, standard terminology)
- "quasi-experimental evidence" (correctly describes natural experiment design)

Numbers serve specific evidentiary claims:
- "roughly 75 bp" (line 11) — exact magnitude with source attribution
- "around a 30% decline" (line 38) — hardcoded reference for specificity
- "approximately 12%" (line 100) — scaled to causal effect claim
- "around 98% of Homescan trips" (line 66) — evidence for selection pattern
- "Only around X% of consumers use credit cards from two or more networks" (line 112) — evidence for single-homing

No padding phrases ("very," "clearly," "interesting," "various," "particularly" used only when precise). Concrete examples (Wells Fargo teller incentives, Discover rewards) ground abstract concepts. Sentence structure is clean and varied — no lists of X, Y, Z inventory-style. 

Limitations are named plainly in footnotes and prose without softening language ("imperfect control group," "highly selected," "co-branded card campaigns").

**Verdict:** Excellent word choice. No revisions needed.

## [appendix_data.tex]

### Status: Clean with one minor stylistic note

**Overall Assessment:** The appendix uses precise, economical technical language appropriate for data documentation. All word choices are correct and serve their methodological purpose. No weak verbs, no unnecessary nominalization, no pretentious vocabulary.

**Technical Precision:**
- "proxy" (line 10) — correctly used for a quantitative estimate; "proxy interchange income with non-interest income" is clear and standard usage
- "classify" (line 60) — direct, active verb
- "define" (line 62) — clear and methodologically sound
- "drop" and "remove" (lines 57, 70, 72, 75) — standard econometrics terminology for sample restrictions, properly used

**Hedging Language (All Appropriate):**
- "roughly half" (line 11) — correct approximation modifier
- "about 38 bps" (line 40) — appropriate for rounded numbers
- "about 15 bps" (line 44) — appropriate for rounded numbers
- Single hedges per claim, not stacked
- No non-load-bearing hedges ("appears," "seems," "arguably" absent)

**Concrete Language:**
- "Signature debit" (line 22) — specific product type
- "American Express, Chase, Citi, Bank of America, Capital One, and US Bank" (line 34) — concrete names, not vague "institutions"
- "cash-only," "primary card," "secondary card" (lines 60–62) — specific definitions

**Nominal Note (Not a Flag):**
- Lines 70, 72, 75 use "drop," "remove," and "dropped" in close succession (3 instances across 6 lines), creating minor verb repetition. In technical writing, "drop" is the standard econometrics term for sample restriction, so this repetition is acceptable and conventional. Could optionally vary with "exclude," "filter," or "restrict," but the current phrasing is clean and field-standard.

**Numbers Serve Specific Purposes:**
- "28.9% of the sample" (line 57) — documents the magnitude of a restriction
- "91% of consumers" (line 66) — evidence for a methodological choice
- "0.7% of remaining sample" (line 70) — magnitude of store-trip restriction
- "15.7% of remaining sample" (line 70) — magnitude of acceptance threshold
- "2.1% of all transactions" (line 88) — documents a data limitation
- "21% report using checks" (line 90) — evidence for imputation choice
- Numbers are contextualized by their purpose, not inventory-style

**Verdict:** Excellent word choice throughout. The document meets the standards for clarity, precision, and technical appropriateness. No revisions needed.
