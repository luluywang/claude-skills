## [appendix_robustness.tex]

### Summary
- Total flags: 3 (High: 0, Medium: 2, Low: 1)
- Most common pattern: Pattern 11 (mechanism paraphrase), Pattern 1 (repetition)

---

### Findings (document order)

### - [ ] Lines 7: Long sentence with multiple semicolons `[Medium]` `[Pattern #3]`

**Comment:** Intro paragraph uses semicolons to separate three parallel independent clauses. When read aloud, the listener struggles to track three separate thoughts about what each section does.

**Original:**
```
Sections~\ref{subsec:oa-no-passthrough}--\ref{subsec:oa-debit-robustness} re-estimate under three alternative specifications (no merchant fee pass-through, credit constraints, lower reward sensitivity); Online Appendix~\ref{sec:oa-credit-debit} addresses credit-debit substitution; Section~\ref{subsec:oa-cost-of-cash-cap} compares the 120 bps cap to a tighter cost-of-cash cap and the constrained social optimum.
```

**Proposed Revision:**
```
Sections~\ref{subsec:oa-no-passthrough}--\ref{subsec:oa-debit-robustness} re-estimate under three alternative specifications: no merchant fee pass-through, credit constraints, and lower reward sensitivity. Online Appendix~\ref{sec:oa-credit-debit} addresses credit-debit substitution. Section~\ref{subsec:oa-cost-of-cash-cap} compares the 120 bps cap to a tighter cost-of-cash cap and the constrained social optimum.
```

**Why better:** Separates three distinct thoughts into three sentences. The ear can parse each independently. The first sentence now uses a colon to introduce a list of three specifications (natural and clear), not three competing clauses.

---

### - [ ] Line 69: Mechanism phrasing "after a credit fee cap" `[Medium]` `[Pattern #11]`

**Comment:** The phrase "after a credit fee cap" reads as temporal sequence when the mechanism is causal. Listener might parse "after the cap is implemented" rather than "because of the cap's effect."

**Original:**
```
Under full pass-through, positive retail markups make baseline consumption inefficiently low, but merchant price cuts after a credit fee cap reverse this distortion.
```

**Proposed Revision:**
```
Under full pass-through, positive retail markups make baseline consumption inefficiently low, but the cap prompts merchant price cuts that reverse this distortion.
```

**Why better:** "Prompts" makes causality explicit. The ear now hears the mechanism clearly: the cap causes price cuts, which reverse the distortion. No ambiguity about temporal vs. causal sequence.

---

### - [ ] Line 116: Word repetition "card...card" `[Low]` `[Pattern #1]`

**Comment:** Close repetition of "card" in same clause. "Constrained customers cannot have a credit card as a primary or secondary card."

**Original:**
```
Constrained customers cannot have a credit card as a primary or secondary card.
```

**Proposed Revision:**
```
Constrained customers cannot hold credit cards as a primary or secondary account.
```

**Why better:** Replaces the repeated "card" with "account." Reduces the auditory stumble while keeping the technical meaning. "Hold" also provides variety from "have."

---

