# RAP Seed (confirmed by user)

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

**Promised deliverables by section:**
- §2 Institutional Details and Data: trace the fee flow from merchants through networks and issuers to consumer rewards; describe the data sources used to identify consumer and merchant sensitivities.
- §3 Reduced-Form Facts: establish the three forces driving rewards competition — (a) Durbin cut debit spending by ~25% via issuer incentives, (b) accepting credit cards raises credit-user sales ~12%, (c) a large share of credit users single-home, producing a partial competitive bottleneck.
- §4 Model: a structural two-sided-platform model with a mix of single- and multi-homing consumers, merchant competition under price coherence, and multi-product networks setting fees and rewards.
- §5 Estimation: recover consumer and merchant preferences by matching reduced-form facts, survey moments, and aggregate shares; validate on untargeted moments (AmEx fee cut, profit margins, network costs); deliver the ~10× reward/fee sensitivity gap.
- §6 Counterfactuals: quantify a 120-bp credit fee cap (+$27B), Durbin repeal (+$7B), merger-to-monopoly (+$15B), and dual-routing (+$8B); show that rewards competition, not market power, is the welfare driver and that *how* networks compete matters more than intensity alone.
- §7 Conclusion: policy takeaway that regulating networks is at least as important as regulating issuers, and that redirecting competition (via dual-routing) works when fee caps are off the table.
- Appendices: supporting data details, model derivations, estimation details, robustness, price-coherence/surcharging theory, merchant sorting, credit-debit segmentation — each should earn its place relative to a claim or step in the main text.

---

## Scope for this run

Audit `draft_202601/appendix_credit_debit.tex` at **subsection and paragraph** levels only.

**Parent goal for the credit-debit segmentation appendix (the yardstick every subsection and paragraph must meet):**

The baseline model treats credit and debit as segmented at the point of sale. Two headline
counterfactuals turn on this:

- The Durbin counterfactual (+$7B welfare from uncapping debit) runs through debit rewards
  drawing consumers off credit at the *adoption* stage — not through debit fees disciplining
  credit fees at the merchant-acceptance stage. The mechanism requires consumers to
  substitute *across wallets*, not *within a wallet at the register*.
- The dual-routing counterfactual (+$3.8B) scales the rate of consumer multi-homing. If
  credit-debit substitution at the register were large, the welfare channel would look
  different than the paper claims.

So the appendix must: (a) establish the empirical basis for segmentation; (b) write down
a parameterized generalization so the assumption is not a knife-edge; (c) test the
generalization's predictions against the Durbin evidence and show they are rejected; (d)
present a "debit as cash" corner that avoids the rejected predictions and replicates the
baseline welfare numbers; (e) provide a microfoundation showing segmentation at usage is
compatible with substitution at adoption (which is what the paper's rewards channel
requires).

Every subsection opener and paragraph opener should advance one of (a)–(e) and make clear
which.
