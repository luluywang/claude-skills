# AI Detection Review

## [appendix_model_oa.tex]

### High

- [ ] Lines 77-82: Comparative static explanation requires multiple sentences before outcome clarifies `[High]`
[Also flagged in: sentence_analysis.md for monotonous rhythm]

**Comment:** The comparative static paragraph begins with the claim "A reduction in $\tau_1$ raises $\underline{\gamma}_2$" but delays the mechanism explanation ("widens $\tau_2 - \tau_1$") to the same sentence. The explanation then splits across three sentences with overlapping mechanism descriptions. This inventory-style structure (outcome first, then backfilled reasoning) is LLM-characteristic when explaining technical results.

**Original:**
```
\paragraph{Comparative static.} A reduction in $\tau_1$ raises $\underline{\gamma}_2$: a smaller $\tau_1$ widens $\tau_2 - \tau_1$, increasing the incremental fee cost borne by multi-homers (the diversion term in the numerator) while leaving incremental sales unchanged---they come only from single-homers regardless of $\tau_1$.

The two boundary cases follow the same logic.
When there are no multi-homers ($\mu^{(1,2)} = \mu^{(2,1)} = 0$), there is no diversion fee drag, so incremental fees and incremental sales both come only from single-homers and the threshold reduces to $\sigma\tau_2/(1-\sigma\tau_2)$, which depends only on card~$2$'s own fee.
When there are no single-homers ($\mu^{(2,0)} \to 0$), there are no incremental sales at all---multi-homers would have paid by card regardless---so $\underline{\gamma}_2 \to \infty$ and no merchant accepts card~$2$.
When $\tau_2 = \tau_1$, the diversion fee drag vanishes and the threshold collapses to $\underline{\gamma}_1$: merchants jump directly from cash-only to accepting both cards.
```

**Proposed Revision:**
```
\paragraph{Comparative static.} Consider what happens when $\tau_1$ falls. The threshold $\underline{\gamma}_2$ increases because a lower $\tau_1$ widens the fee gap $\tau_2 - \tau_1$. This wider gap increases the incremental fee cost borne by multi-homers (the diversion term in the numerator), since multi-homers who divert spending to the high-fee card now face a larger fee differential. Incremental sales are unchanged because they come only from single-homers, who are unaffected by $\tau_1$. Thus, the threshold rises---merchants require higher cash attractiveness to accept the high-fee card when the low-fee alternative becomes cheaper.

The two boundary cases clarify this mechanism.
When there are no multi-homers ($\mu^{(1,2)} = \mu^{(2,1)} = 0$), there is no diversion effect, so the threshold depends only on card~$2$'s own fee and reduces to $\sigma\tau_2/(1-\sigma\tau_2)$.
When there are no single-homers ($\mu^{(2,0)} \to 0$), incremental sales vanish, so $\underline{\gamma}_2 \to \infty$ and no merchant accepts card~$2$.
When $\tau_2 = \tau_1$, the diversion effect vanishes, the fee drag disappears, and the threshold collapses to $\underline{\gamma}_1$.
```

**Why better:** The revision frontloads the causal mechanism ("lower fee $\Rightarrow$ wider gap $\Rightarrow$ higher diversion cost") before listing boundary cases. It replaces the colon-based outcome announcement with a step-by-step causal chain that helps readers follow how the fee change propagates through the model. The boundary cases then serve as confirmations of this logic, not as a separate inventory. This flow mirrors how an expert derives the result rather than how an LLM presents conclusions and then backlogs explanations.

### Medium

- [ ] Lines 153-155: Results-first opening with delayed mechanism `[Medium]`

**Comment:** The paragraph announces the simulation result ("Credit acceptance falls for every network in both panels") immediately, then explains the merchant cost channel and diversion mechanism. While this is common in applied work, the result-first framing without initial puzzle or motivation is characteristic of LLM expository structure.

**Original:**
```
Credit acceptance falls for every network in both panels---whether consumer adoption responds to the fee change (left) or rewards are held fixed (right). The merchant cost channel alone suffices: lower debit fees widen the fee gap $\tau_C - \tau_D$, making credit less attractive at the margin. The decline is largest for Visa Credit and smallest for AmEx, because Visa has the most overlap between credit and debit holders and therefore the strongest diversion channel.
```

**Proposed Revision:**
```
The simulation reveals that credit acceptance falls when debit fees are cut, but the magnitude differs by network. This decline occurs through the merchant cost channel: lower debit fees widen the gap $\tau_C - \tau_D$, making credit less attractive at the margin to merchants. The effect is strongest for Visa Credit (which has the largest overlap between credit and debit holders) and weakest for AmEx, because the diversion effect depends on the multi-homing mass.
```

**Why better:** The revision opens by framing the finding as a discovery ("reveals that...") rather than asserting it as fact, setting up the "why" before stating "what." It also tightens the causal chain by explaining why the overlap matters for the diversion effect, avoiding the inventory-style presentation of results followed by explanation.

### Low

- [ ] Lines 269: Single-instance AI vocabulary: "encode" `[Low]`

**Comment:** The verb "encode" appears once in a technical context describing how shocks represent heterogeneity in consumer preferences. This is appropriate modeling language rather than padding, so flagged as low severity.

**Original:**
```
The random shocks to $\gamma_{it} \in \mathbb{R}^k$ encode the idea that for a given transaction, the consumer may value being able to use a credit card more than a debit card or might value using a card far more than using cash.
```

**Proposed Revision:**
```
The random shocks to $\gamma_{it} \in \mathbb{R}^k$ capture transaction-specific variation in how consumers value payment methods: for some transactions, a consumer prefers credit; for others, debit or cash.
```

**Why better:** "Capture" is more direct than "encode" and the revision shows the heterogeneity through examples rather than abstract description, which is clearer for a technical audience.

---
## Deduplication Summary
- Items reviewed: 3
- Duplicates removed: 0
- Cross-references added: 1
