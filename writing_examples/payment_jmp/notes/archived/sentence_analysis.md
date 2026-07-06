# Sentence Structure — Actionable Items Only

Prior version of this file contained exhaustive sentence-length statistics, passive voice counts, and mechanical flagging for every file. Most of that was noise. Below are the 4 items with genuinely useful specific rewrites.

---

## [intro.tex] Lines 48-51: Four consecutive same-length sentences

Four sentences of 17, 17, 17, 21 words with repetitive S-V-O structure.

**Current:**
Two-sided competition shapes my structural model in which payment networks compete in merchant fees and consumer rewards. The model allows consumers and merchants to multihome across payment methods, though in equilibrium many consumers single-home. Merchants choose the subset of payment methods to accept and raise retail prices to cover merchant fees. In deciding whether to accept a card, merchants trade off the benefits from higher sales against the cost of merchant fees.

**Proposed tightening (see also simplifications.md):**
The structural model captures two-sided competition. Networks compete in merchant fees and consumer rewards, while consumers and merchants multihome across payment methods—though equilibrium features many single-homing consumers. For each card they accept, merchants decide whether the sales gain justifies the fee cost, then raise retail prices to recover merchant fees.

---

## [estimation.tex] Line 52: 59-word sentence

Grammatically correct but dense for a general audience.

**Current:** "Because I model G as a two-parameter Gamma distribution, the acceptance rate (which equals the share of the distribution above the marginal type) and the networks' first-order conditions with respect to merchant fees (which depend on the density of types near the margin) are sufficient to pin down its shape."

**Proposed split:** "Because G is a two-parameter Gamma distribution, two moments pin down its shape: the acceptance rate and the density of merchants near the margin. Both are observable from the data and networks' first-order conditions."

---

## [estimation.tex] Lines 91-95: Five repetitive sentence starters

"Table \ref{tab:cross-sub} highlights..." / "The second column shows..." / "The new consumers mostly come..." / "In contrast, MC debit only declines..." / "The difference reflects..."

**Proposed:** Vary starters. E.g.: "Table \ref{tab:cross-sub} shows reward sensitivity. Visa credit rewards increase Visa's share by 3.8%, drawn mostly from MC credit (down 3.5%). Debit falls only 0.3%, indicating consumers view debit and credit as distinct."

---

## [appendix_surcharging.tex] Lines 23-27: Legal background

✓ RESOLVED: Dense five-semicolon sentence has been broken into clear, short sentences by regulatory action. Each epoch (1981 Cash Discount Act, 2010 Durbin Amendment, 2013 settlement, 2023 status) is now its own sentence.
