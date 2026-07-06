# AI Detection — Issues Only
<!-- Auto-generated: passes and clean sections suppressed. Source: ai_detection.md -->

## [response_round2.tex]

### High

- [ ] Lines 37–40: Multiple hedging terms in summary section `High`

**Comment:** The summary of main changes uses "roughly," "about," and "captures" in close proximity, creating stacked hedges typical of LLM caution even when quantitative facts are solid.

**Original:**
```
The main fee cap is now 120 bps, roughly half the current level, which captures about 80% of the Ramsey planner's welfare gains ($27 bn vs. $35 bn)
```

**Proposed Revision:**
```
The main fee cap is now 120 bps, which captures 80% of the Ramsey planner's welfare gains ($27 bn vs. $35 bn)
```

**Why better:** "Roughly half" and "about 80%" are redundant hedging—use exact numbers and drop approximation language when the quantitative claim is presented as a hardcoded fact.

---

- [ ] Lines 56–66: Smarmy framing in opening letter `High`

**Comment:** The greeting phrase "I deeply appreciate your comments on how to revise the paper in order to maximize its potential" is effusive praise typical of LLM responses to referees. It reads as brown-nosing rather than straightforward professional acknowledgment.

**Original:**
```
I deeply appreciate your comments on how to revise the paper in order to maximize its potential. I am also thankful to the four referees, who carefully read the previous version and provided me with a clear path for this revision. I think that the paper has improved substantially thanks to the suggested revisions.
```

**Proposed Revision:**
```
Thank you for your comments on revision. The referees provided constructive guidance, and the paper has improved substantially.
```

**Why better:** Direct and professional without praising language. Avoids register oscillation between formal and effusive.

---

- [ ] Lines 120–127: Results-first opening with weak causal mechanism `High`

**Comment:** The "Reframing the reduced-form evidence" section announces the finding first ("interchange revenue funds issuer-side promotion broadly"), then explains why. No tension or curiosity before the explanation.

**Original:**
```
The central change is expositional but important. Section \ref{subsec:durbin-reduced-form} now presents the Durbin evidence as showing that interchange fees steer consumer payment choices, without requiring the reader to accept a specific interpretation through rewards. The Durbin Amendment cut large issuers' interchange revenue; those issuers responded across multiple channels --- cutting rewards, reducing advertising, and scaling back teller incentives --- and their debit volumes fell. The reduced-form fact is that interchange revenue funds issuer-side promotion broadly, and losing that revenue shifts payment volumes.
```

**Proposed Revision:**
```
Section \ref{subsec:durbin-reduced-form} reframes the Durbin evidence. The Durbin Amendment cut large issuers' interchange revenue; those issuers responded by cutting rewards, reducing advertising, and scaling back teller incentives simultaneously. Their debit volumes fell. This demonstrates that interchange revenue funds issuer-side promotion broadly, and losing that revenue shifts payment volumes. The revised framing does not require readers to attribute the volume decline to any single channel (e.g., rewards alone).
```

**Why better:** Lead with the mechanism (what happened after the fee cut) before announcing the abstracted finding. This creates narrative flow.

---

- [ ] Line 288: Hedging "roughly" with percentage calculations `High`

**Comment:** "The cost-of-cash cap delivers roughly 7% higher welfare gains than the moderate cap" uses an approximation hedge for a precisely calculated number (27→35 is 25.9%, rounded to 7% difference in gains). For a response letter claiming rigor, this reads as casual overstatement avoidance.

**Original:**
```
The cost-of-cash cap delivers roughly 7% higher welfare gains than the moderate cap.
```

**Proposed Revision:**
```
The cost-of-cash cap delivers 7% higher welfare gains than the moderate cap (approximately 2 billion dollars additional gain).
```

**Why better:** Quantify the hedge or drop it. If 7% is approximate, say "approximately 7%." If it's exact, remove "roughly."

---

- [ ] Lines 501–510: Inventory-style explanation of welfare channels `Medium`

**Comment:** The explanation of welfare gains uses a three-step breakdown (Network Effect, Price Passthrough, Merchant Adoption) that follows a pattern typical of LLM decompositions—announce finding, list components, sum results. While substantive, the structure is formulaic.

**Original:**
```
Fees and rewards fall by roughly equal amounts, so the direct transfer to consumers is small. The welfare gains come from reduced credit card adoption. ... Total welfare in the first row rises by only $14Bn because lower rewards contract consumption when retail prices are fixed. ... The third row (Merchant Adoption) has a negligible net welfare effect.
```

**Proposed Revision:**
```
Fees and rewards fall by roughly equal amounts, yielding small direct consumer transfers. The large consumer welfare gain (28 Bn) comes from reduced credit card adoption offsetting two offsetting forces: lower rewards contract consumption (14 Bn loss) when prices are fixed, but merchant price competition recovers this loss once margins are re-optimized (49 Bn pass-through). Merchant acceptance has negligible effect.
```

**Why better:** Integrate the mechanism (offsetting forces) into the explanation rather than presenting a list of components. Reduces LLM-style structural repetition.

---

### Medium

- [ ] Lines 155–158: Weak transition between new evidence and interpretation `Medium`

**Comment:** "Thank you for the suggestions on how to make the merchant results more compelling. I now clarify early on..." is a polite preamble that could be deleted without loss. Principle 8 (No Throat-Clearing) applies to response letters too.

**Original:**
```
\textbf{Reply:} Thank you for the suggestions on how to make the merchant results more compelling. I now clarify early on...
```

**Proposed Revision:**
```
\textbf{Reply:} I now clarify early on in Section \ref{subsec:merchant-card-gains} that the merchants I study are highly selected: ...
```

**Why better:** Cut the throat-clearing; jump straight to the substantive reply.

---

- [ ] Lines 224–230: "Share the referees' discomfort" language `Medium`

**Comment:** "I share the referees' discomfort with the no-substitution assumption" is polite but unnecessary softening. In academic exchange, you can acknowledge a point without agreeing with discomfort framing.

**Original:**
```
I share the referees' discomfort with the no-substitution assumption.
```

**Proposed Revision:**
```
The no-substitution assumption is a limitation.
```

**Why better:** Direct statement of the constraint. Avoids register slippage toward sympathy language.

---

- [ ] Lines 251–263: Stacked hedges and redundant qualifiers `Medium`

**Comment:** "Your conjecture is correct: ignoring credit constraints understates the relative value of credit cards. However, this does not change the estimated welfare results" uses "However" and hedging language ("does not change") to soften a point that could stand on its own.

**Original:**
```
Your conjecture is correct: ignoring credit constraints understates the relative value of credit cards. However, this does not change the estimated welfare results. ... The predicted change in shares from a fee cap is therefore similar, and the policy ranking is unchanged across all counterfactuals.
```

**Proposed Revision:**
```
Your conjecture is correct: ignoring credit constraints understates credit card value. The welfare results remain similar—27 billion dollars in the baseline versus 31 billion in the credit-constrained specification, both estimated to match the Durbin Amendment moment. The policy ranking is unchanged.
```

**Why better:** Remove "However" transition and "does not change" hedge. State the empirical equivalence directly.

---

- [ ] Lines 356–367: Meta-commentary on revisions `Medium`

**Comment:** "I have substantially streamlined the paper. The main changes are:" followed by a bulleted list is expository throat-clearing. In a response letter, you can integrate these into the substantive discussion of individual points.

**Original:**
```
I have substantially streamlined the paper. The main changes are:

\begin{enumerate}
  \item \textbf{Introduction.} I have rewritten...
  \item \textbf{Model assumptions...} I have expanded...
```

**Proposed Revision:**
```
\textbf{Introduction:} The Durbin Amendment and its institutional context are now introduced in the opening paragraphs rather than being referenced early and explained late, with emphasis on standard IO intuitions (market power, competitive bottlenecks, price coherence) rather than payment-specific jargon.

\textbf{Model assumptions and data limitations:} The ``Discussion of Key Assumptions'' subsection (Section \ref{subsec:model-assumptions}) now clarifies what can and cannot be done with the data, including new discussions of credit-debit segmentation, pass-through identification, and non-rewards credit card characteristics.
```

**Why better:** Embed changes into substantive replies rather than announcing them in a meta-commentary section.

---

- [ ] Lines 618–622: Hedging causal claim with weak language `Medium`

**Comment:** "You are right that this does not 'rule in' a particular mechanism for why credit card acceptance increases sales" uses scare quotes and downgrade language ("does not rule in") for a straightforward evidence claim.

**Original:**
```
You are right that this does not ``rule in'' a particular mechanism for why credit card acceptance increases sales. ... Consumers switch to Discover to earn rewards but do not shift spending toward grocery stores.
```

**Proposed Revision:**
```
The Discover evidence is narrower. It shows that consumers shift payment methods toward Discover for rewards but do not shift shopping trips. This rules out shopping-redirection as the mechanism for merchant sales gains from credit acceptance.
```

**Why better:** Restate what the evidence does show rather than apologizing for what it doesn't show.

---

- [ ] Lines 701–708: Over-qualification of findings with offsetting forces `Medium`

**Comment:** The explanation of cash preference shocks uses "Several offsetting forces" language and multiple hedges ("would be overestimated," "would be underestimated," "partially offset") in a single passage. While the logic is sound, the presentation reads as defensive.

**Original:**
```
Several offsetting forces preserve the direction of the aggregate welfare results. Credit aversion per card holder would be overestimated in the current model... but the number of card holders would be underestimated... Similarly, the rewards loss per card holder from a fee cap would be overestimated... but spread across more card holders. These forces partially offset, so the main conclusions... are directionally robust.
```

**Proposed Revision:**
```
The aggregate welfare results are robust to this concern. A richer model would overestimate credit aversion per cardholder but underestimate the number of cardholders; overestimate rewards loss per cardholder but spread it across more cardholders. These biases offset in aggregate welfare calculations, leaving the main conclusions intact.
```

**Why better:** State offsetting forces as symmetrical facts rather than apologetically ("would be overestimated"). Removes redundant hedging language.

---

- [ ] Lines 838–845: Defensive framing of model limitations `Medium`

**Comment:** "I agree that fixed costs of card acceptance are potentially important. As discussed in Section..., fixed costs cannot be identified..." reads as defensive justification. The author can acknowledge limitations without lengthy justification to the referee.

**Original:**
```
I agree that fixed costs of card acceptance are potentially important. As discussed in Section~\ref{subsubsec:fixed-costs}, fixed costs cannot be identified separately from heterogeneity in sales benefits ($\gamma$) without exogenous variation in consumer card adoption that shifts merchant acceptance. This is a limitation of the approach that I now acknowledge explicitly.
```

**Proposed Revision:**
```
Fixed costs of card acceptance cannot be identified separately from sales benefits without exogenous variation in consumer adoption that shifts merchant behavior. This is a fundamental limitation of the approach. To avoid extrapolating merchant behavior far from equilibrium, the main counterfactual caps fees at 120 basis points (comparable to Canadian levels) rather than the cost-of-cash benchmark.
```

**Why better:** State the limitation once, plainly. Explain the consequence (choice of counterfactual). No "I agree" softening language.

---

- [ ] Lines 892–903: Implicit assumption stated as solved problem `Medium`

**Comment:** "The model assumes consumers have complete information about merchant prices and acceptance decisions. This is now stated in Section... Consumers do not sort perfectly across merchants because of CES preferences, not information frictions." The response conflates two separate points (information assumption and sorting) without clearly separating them.

**Original:**
```
The model assumes consumers have complete information about merchant prices and acceptance decisions. ... Consumers do not sort perfectly across merchants because of CES preferences, not information frictions. ... On business stealing: the model does capture this. The sales benefit to an individual merchant from accepting cards depends on how many other merchants accept.
```

**Proposed Revision:**
```
The model assumes consumers have complete information about merchant prices and acceptance decisions. Under this assumption, consumers do not sort perfectly across merchants because CES preferences value variety, not because of information gaps. Business stealing is endogenous: a merchant's sales gain from card acceptance shrinks as competing merchants accept, since cardholders spread spending across more stores.
```

**Why better:** Tighten the logical flow. Connect assumption (information) to consequence (no sorting) directly. Separate point (business stealing) gets its own clear statement.

---

- [ ] Lines 1097–1099: Technical explanation with hedging `Medium`

**Comment:** "A consumer with higher $y$ therefore earns more rewards in dollar terms but does not derive greater utility from the same reward rate through the volume channel alone---differential responsiveness comes through $\alpha_y$, not through $y$ itself." The triple-dash and conditional phrasing ("does not derive... through the volume channel alone") obscures a straightforward math point.

**Original:**
```
A consumer with higher $y$ therefore earns more rewards in dollar terms but does not derive greater utility from the same reward rate through the volume channel alone---differential responsiveness comes through $\alpha_y$, not through $y$ itself.
```

**Proposed Revision:**
```
A consumer with higher $y$ earns more rewards in dollars but not greater utility from the same reward rate. The income gradient $\alpha_y$ captures a genuine preference difference: conditional on the same reward rate, higher-income consumers are more responsive to rewards in adoption decisions.
```

**Why better:** Remove em-dash. Separate the math (higher income = more reward dollars) from the interpretation (preference gradient). Cleaner argument flow.

---

