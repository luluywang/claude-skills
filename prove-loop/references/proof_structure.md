# Canonical proof structure for micro-theory results

This layout is the **default for self-contained main theorems**. The actor
should use as much of it as the result needs, and no more.

- A two-line corollary, a one-paragraph extension, or a proof that reuses
  the parent paper's environment should not re-scaffold: reference the
  parent setup by citation and write the proof directly.
- Standard results (Roy's identity, Daly–Zachary–Williams, Milgrom–Segal)
  should be cited by name, not restated as named lemmas with proofs.
- A self-contained main theorem of a new result should use most of the
  layout below.

The critic flags both *missing* structure when the result needs it and
*over-scaffolded* structure when it does not.

## Sections

### 1. Environment

State the economic primitives. One short paragraph or a bulleted list. No
proofs, no derivations.

- Agents and their type/action spaces (e.g. $\theta \in \Theta \subseteq \mathbb{R}$, $a \in A$).
- Preferences / utility (e.g. $u(a, \theta)$, with smoothness named).
- Information structure (who observes what, when).
- Mechanism / game form, if applicable.

Every symbol introduced here must be used later. If it is not used, drop it.

### 2. Assumptions

Numbered, named, and justified.

```
\begin{assumption}[Single-crossing]\label{a:sc}
$u(a, \theta)$ has strictly increasing differences in $(a, \theta)$.
\end{assumption}
```

For each assumption: one line on what it rules out (so the reader knows what
work the assumption is doing) and where it will be used. If an assumption is
not used in the proof, delete it. If a step in the proof needs an assumption
that is not stated, add it.

### 3. Lemmas (proved before they are used)

Lemmas earn their place by being used at least once downstream. State each
lemma cleanly:

```
\begin{lemma}\label{l:envelope}
Under Assumptions~\ref{a:sc}-\ref{a:reg}, the indirect utility
$V(\theta) := \max_{a} u(a, \theta)$ is absolutely continuous and
$V'(\theta) = u_\theta(a^*(\theta), \theta)$ a.e.
\end{lemma}

\begin{proof}
[Self-contained proof. Cite only earlier lemmas or named external results.]
\end{proof}
```

**Lemma discipline:**

- One claim per lemma. If the lemma needs the word "and," consider splitting.
- The lemma is proved *before* it is invoked in the main theorem.
- The proof of a lemma does not forward-reference the theorem.
- If a lemma is one line, it is not a lemma — inline it.

### 4. Theorem

State exactly what is being proven. Quantifiers explicit. Conclusion explicit.

```
\begin{theorem}\label{t:main}
Under Assumptions~\ref{a:sc}-\ref{a:reg}, the direct revelation mechanism
$(q^*, t^*)$ is incentive-compatible if and only if [...].
\end{theorem}
```

### 5. Proof of the theorem

Open with the structure: "We prove (i) necessity and (ii) sufficiency,"
or "The proof proceeds in three steps." Then execute.

Each step:
- Names the goal of the step ("Step 1: show that $V$ is non-decreasing").
- Cites the lemma or assumption used at the moment it is used, not in a
  trailing list.
- Shows the algebra at the granularity a careful reader needs — no skipped
  inequalities. If a chain of equalities has more than three steps, break it
  with a sentence of explanation.

End with a sentence that names the conclusion: "Therefore $(q^*, t^*)$ is
IC, completing the proof." Do not just write `$\blacksquare$` and leave the
reader to assemble the conclusion.

## Discipline that applies throughout

- **Define every symbol on first use.** Including standard ones if there is
  any ambiguity (e.g. is $\mathbb{R}_+$ open or closed at zero?).
- **Cite each assumption at the moment of use** ("by Assumption~\ref{a:sc},
  ..."). Do not generate trailing "where used: invoked in Lemma X,
  Remark Y, Step Z" cross-reference paragraphs — those are bookkeeping,
  not proof content.
- **No skipped algebra in the main theorem.** Lemmas can be terse; the
  theorem proof is the main artifact and should be readable cold.
- **No "it is easy to see," "clearly," "obviously."** Either show it or cite
  a lemma.
- **One idea per paragraph.** When the reasoning shifts (e.g. from FOC
  manipulation to a comparative-statics argument), start a new paragraph.

## Common failure modes the critic should catch

1. **Symbol introduced but never used** in the environment block.
2. **Assumption stated but never invoked** in the proof.
3. **Step uses an assumption that was not stated.**
4. **Lemma stated but not used** downstream.
5. **Lemma proof forward-references the theorem** (circular).
6. **Inequality reversed without justification** (e.g. dropping a minus sign).
7. **Maximum vs. argmax confusion** when invoking the envelope theorem.
8. **Quantifier scope error** ("for all" vs. "there exists" mismatch with the
   stated theorem).
9. **Algebra skipped at the load-bearing step** (typically the IC chain).
10. **Conclusion not named.** The proof ends mid-derivation without saying
    which clause of the theorem just got established.
11. **Over-formalization.** Standard tools (Roy's identity, Daly–Zachary–
    Williams, Milgrom–Segal) restated as named lemmas with proofs instead
    of cited. Named constants ($C_\text{Roy}$, $C_2$, $L_w$) introduced
    where an order bound ($O(\tau_\max)$) would do.
12. **Stage-direction meta-narration.** Every paragraph opening with
    `\emph{What this step does.}` / `\emph{Economic gloss.}` /
    `\emph{Used:}` — the canonical-layout discipline rendered literally
    rather than absorbed into prose.
13. **AI-speak.** "We now establish…", "It suffices to show…",
    "Crucially,…", "the **genuine** X", "the **key** observation."
14. **Bookkeeping-as-economic-interpretation.** A paragraph labelled
    "economic interpretation" that merely restates the algebra in English
    rather than naming the mechanism.
