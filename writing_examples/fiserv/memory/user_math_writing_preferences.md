---
name: Math writing preferences
description: User's standards for how to write theorem proofs in the interchange paper — what they reject vs. what they want
type: feedback
---

**Math-proof writing style for this paper:**

1. **Avoid "circuit" and "loop" language.** Describe feedback in terms of explicit matrix products with norm bounds, not as prose about signals traversing loops.

2. **No stacked-space lifts (like `\Pi^\uparrow`).** If a matrix multiplication needs to type-check across dimensions, find a formulation that doesn't require renaming/lifting. The reader sees `\Pi^\uparrow` and gets confused. Use direct sup-row-sum bounds instead.

3. **Don't use `\Pi` for matrices — it looks like profits.** Prefer `\mathcal{E}` variants when the object is an elasticity matrix (parallels the existing `E`).

4. **Surface structure must make the decomposition visible.** The user's reference phrasing: "Welfare effect = A + B + Old Effect, A is zero by envelope, B is small by some other proof, Old effect is the same as before." Proofs should literally open with this kind of line; lemmas are verification of its pieces.

5. **Proofs should separate individual-level from aggregate-level explicitly.** First derive `dV_i/dx_l` for a single consumer, then aggregate to `dV_k/dx_l` for the cohort with explicit aggregation formulas (e.g., `\bar q^*_{jk} := \mathbb{E}_i[q^*_{ij}|k^*(i)=k]`), and show explicitly how population-level objects like `\mu_{jk}` emerge from the averaging via the spending identity.

6. **The result must not feel like a miracle.** For an economics paper with rich simultaneous channels (fees → prices → baskets → rewards → payment choice → shares → prices), the reader's first reaction is that many things are moving at once. Enumerate every channel and bucket it: "this one is the main effect, this one is killed by envelope, this one is residual by a named lemma." The simplification has to feel earned, not produced by a hat.

7. **Critic design for actor–critic loops = naive reader, not syntactic checklist.** When asked to write in an actor-critic loop, the critic simulates a first-time reader (think: a corporate-finance PhD student who knows Roy's identity but hasn't seen payments-system models). The critic enumerates the questions a naive reader would ask as they work through the proof ("what actually changes?", "doesn't every merchant's share now move?", "how is this aggregated?", etc.) and checks whether the proof provides clear sentences answering each. Failure modes: answers that require already knowing the proof, or answers that appear miraculous.

**Why:** the current paper addresses a corporate-finance audience who needs both rigor and economic intuition. Proofs that are formally correct but surface-level opaque will lose readers on the first pass and damage the paper's reception.

**How to apply:** apply to every theorem-proof rewrite in this project (`appendix_theory.tex`, `appendix_endogenous_choice.tex`, any future appendix). When drafting, simulate the naive reader and enumerate their questions before starting; when revising, check each question has a clear sentence-level answer.
