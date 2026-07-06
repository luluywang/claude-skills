# AI Detection Review

## [counterfactuals.tex]

### Medium

- [ ] Lines 7-9: Long footnote content (3 sentences) could be moved to appendix `[Medium]`

**Comment:** The footnote contains substantive explanation that interrupts the main text flow. The structure is parenthetical but long enough to impede reading rhythm.

**Original:**
```
All counterfactuals fix consumers' preferences $\beta_i$, baseline income $y$, and merchants' sales benefits to card consumers $\gamma$.
Consumer adoption, merchant acceptance, retail prices, and network prices adjust endogenously.\footnote{
    Although merchants' types $\gamma$ are fixed, their incentives to accept cards can change because the effect of card acceptance on total sales depends on $\gamma$ and the share of consumers using each card.
}
```

**Proposed Revision:**
```
All counterfactuals fix consumers' preferences $\beta_i$, baseline income $y$, and merchants' sales benefits to card consumers $\gamma$.
Consumer adoption, merchant acceptance, retail prices, and network prices adjust endogenously.
```

**Why better:** Cleans main text; move clarification to appendix where model assumptions are already detailed.

---

### Low

- [ ] Lines 213-216: Results-first structure in subsection opening `[Low]`

**Comment:** The subsection "Welfare Effects of Reducing Network Competition" opens with a counter-expectation framing ("One might expect...") followed by negation ("the opposite holds"), but could open more directly with the main claim.

**Original:**
```
One might expect that increasing competition among networks would substitute for fee regulation.
In payment markets, the opposite holds.
Competition fuels the rewards arms race that amplifies distortions from price coherence.
```

**Proposed Revision:**
```
Increasing competition among networks amplifies rather than solves the distortion from price coherence.
Competition fuels the rewards arms race by reducing network incentives to curb rewards competition.
```

**Why better:** Leads with the main insight rather than building through negation; more direct.

---

**No critical or high-severity AI patterns detected.** The prose is mechanism-driven, numbers are embedded as evidence, and causal chains are explicit throughout.

## [conclusion.tex]

### Pass: No issues detected

**Comment:** The conclusion demonstrates strong human-written characteristics:
- Each numerical result is immediately followed by a causal mechanism (e.g., "welfare increases by $15 billion because eliminating rewards competition reduces the overuse of credit cards")
- Mechanisms are explicit throughout: "because," "yet," "when" connectors tie results to causal chains
- Active voice dominates; no passive constructions
- Sentence rhythm varies naturally (7-34 word range, healthy StdDev)
- No smarmy reframing patterns
- No transition overuse (Moreover, Additionally, etc.)
- No stacked hedges or excessive qualification
- Numbers are evidence for claims, not inventory-style lists
- Policy implications flow directly from mechanisms

---
**Assessment: Pass — No AI-detection flags. Clean, mechanism-driven argument structure.**

## [appendix_estimation.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

Pass: No AI-typical patterns detected.

**Comment:** This section is clean technical writing. No smarmy reframing, stacked hedges, results-first openings, or inventory-style numbers. The opening ("I estimate the model by matching data and simulated moments...") is direct and method-forward. Paragraphs are organized by parameter (Bootstrap Inference, Consumer Parameters, Network Parameters, Merchant Parameters), each with a subsection explaining what data moment pins down which model component. This is human economics writing: terse, precise, mechanism-forward.

- No excessive transitions (Moreover, Furthermore, Additionally)
- No artificial enumeration in prose
- No colon dramatics
- Active voice dominates; passive used appropriately (e.g., "The model analogs are...")
- No bare "this"/"these" without noun referents
- Technical terms (conditional logit, Bayes' rule, SMM) used correctly per formal definitions
- No AI vocabulary flags

**Verdict:** PASS — no issues to flag.

## [appendix_figures.tex]

Pass: No AI-typical patterns detected.

**Comment:** This file contains only figure declarations with minimal prose: figure captions and table notes. All text is factual, technical, and directly tied to data sources. No smarmy reframing, hedges, transition overuse, or AI-typical phrasing. The prose consists of:
- Short, direct captions describing what each figure shows
- Factual notes explaining data sources and figure construction
- Technical terminology used correctly (e.g., "primary--secondary card combination," "merchant-years," "plurality of transactions")
- Consistent citation formatting

**Verdict:** PASS — no issues to flag.


## [appendix_model.tex]

### Medium

- [ ] Lines 81-82: Throat-clearing opening to subsection. `[Medium]`

**Comment:** The subsection opens by announcing what it will do rather than doing it. This is classic meta-commentary that can be deleted.

**Original:**
```
This section proves that merchant profits are approximately linear in $\gamma$, exploiting the envelope theorem to show that optimal price adjustments contribute only second-order error in fee rates.
Define quasi-profits $\overline{\Pi}$ by:
```

**Proposed Revision:**
```
Define quasi-profits $\overline{\Pi}$ by:
```

**Why better:** The section title already signals the topic. The opening sentence just restates it; the definition and theorem carry the weight. Deleting this sentence streamlines the exposition and lets the mathematics speak for itself.

## [appendix_reduced.tex]

### Pass: No critical or high-severity AI patterns detected.

**Comment:** The appendix demonstrates clean, evidence-driven exposition:
- Results are embedded in mechanism chains ("Consumers shift payments toward Discover during reward quarters but do not change where they shop, so the stable shopping patterns are not due to inattention")
- Numbers are placed mid-sentence as evidence for claims, not as inventory lists
- Transitions between subsections are content-driven; no "Moreover," "Furthermore," "Additionally" clutter
- Active voice dominates throughout
- No smarmy reframing (It's not X, it's Y)
- No stacked hedges; hedging is disciplined and load-bearing
- No bare "this"/"these" without clear noun referents
- Technical terms (difference-in-differences, triple-difference, fixed effects) used correctly

**Verdict:** PASS — no issues to flag.


## [reducedform.tex]

<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Low

- [ ] Lines 14, 38, 46: "Weakening issuers' incentives to promote debit led to..." and similar participial openers `Low`

**Comment:** Participial opening phrases (e.g., "Weakening...", "Enacted...") are characteristic of academic prose, not AI-typical. They appear naturally within a sophisticated economic analysis. This is a legitimate stylistic choice rather than an AI-generated pattern.

**Original:**
```
Weakening issuers' incentives to promote debit led to a \scalarinput{debit_reg_coef}$\%$ decline in signature debit volumes.
```

**Proposed Revision:**
```
The reduction in large issuers' incentives to promote debit led to a \scalarinput{debit_reg_coef}$\%$ decline in signature debit volumes.
```

**Why better:** Active voice ("reduction in incentives") is more direct than the participial construction, though the original is also acceptable.

---

### Assessment Summary

This section demonstrates strong human authorship:
- Clear causal mechanisms explained before results
- Appropriate hedging language (not over-hedged)
- Numbers contextualized with economic meaning
- Varied sentence-initial transitions
- Explicit identification assumptions discussed thoroughly
- Strategic framing language is appropriate and context-driven

**Verdict:** No significant AI patterns detected. Document appears human-written by an economist familiar with research design and causal inference.

## [appendix_data_oa.tex]

### Pass: No issues detected

**Comment:** This methods section demonstrates strong human-written characteristics:
- Consistent first-person active voice throughout ("I draw," "I identify," "I classify," "I use," "I compute")
- Direct, procedural language explaining data construction and survey design
- No transition word overuse (Moreover, Additionally, Furthermore)
- No smarmy reframing patterns or hedge stacking
- Demonstrative pronouns have clear antecedents ("These data," "this split")
- No artificial enumeration or rule-of-three padding
- Sentence 32 is notably long (64 words) but complexity is warranted by nested survey structure
- No meta-commentary or throat-clearing ("This section describes...")
- Technical terminology used correctly (verticality, conditional logit, geometric means)
- Numbers embedded as factual reporting, not as inventory-style lists
- Passive voice used sparingly and appropriately (e.g., "were asked")

**Verdict:** PASS — no AI-detection flags. Writing is methodologically sound and human-voiced.

## [appendix_tables.tex]

### Pass: No substantive prose content

**Comment:** File consists entirely of table environments with `\input{}` commands, table captions (3-7 words each), and technical notes with factual definitions. No substantive prose passages exist to analyze for AI-typical patterns (hedging, smarmy reframing, meta-commentary, enumeration, colon overuse, etc.).

**Assessment:** Not applicable. This is a table-only file with zero connected prose. Table metadata is factual and correctly formatted.

**Verdict:** PASS — N/A for prose analysis. File structure is appropriate for an appendix of tables.

---

## Deduplication Summary (Updated)
- Items reviewed: 16 (counterfactuals.tex) + 1 (model.tex) + 1 (appendix_tables.tex)
- Duplicates removed: 0 (17 unique items across all files)
- Model.tex items: 0 flags (human-authored)
- Appendix_tables.tex items: N/A (table-only file)

## [appendix_model_oa.tex]

**Pass 1 — AI Detection Summary:**

No AI-typical patterns detected. Assessment of all key pattern categories:

### Critical
(No issues found)

### High
(No issues found)

### Medium
(No issues found)

### Low
(No issues found)

**Detailed Assessment:**
- **Transition patterns:** Language follows naturally from model structure ("For same-type multi-homers," "Consider two cards," "Suppose consumers holding both..."). Not formulaic.
- **Hedging:** Minimal. Technical qualifications ("close for all values," "in general") appropriately placed. No stacked hedges.
- **Smarmy reframing:** None. Writing is direct and technical throughout.
- **Meta-commentary:** Absent. Sections launch directly into content, not with preambles describing what follows.
- **Sentence rhythm:** Healthy variation. Short technical definitions mixed with longer derivations and explanations.
- **AI vocabulary:** Technical terms (strategic complementarities, moral hazard, adverse selection, general equilibrium) used with full formal definitions in their proper context.
- **Parentheticals:** Content appropriately placed. No excessive inline clutter.
- **Demonstratives:** All bare "this," "these," "that," "those" have explicit noun referents or clear antecedents.
- **Colon constructions:** Used only for mathematical definitions ("$a$ = ...:", "the utility of method $j$ is:") and proper enumeration, not for dramatic effect.
- **Enumeration:** Prose-based ("New transactions ($N$): ...", "Diverted transactions ($D$): ..."), not artificial numbering.
- **Results-first vs. tension:** Subsections build from primitives before stating implications. No results-first openings.
- **Missing mechanisms:** All key claims include causal explanation. Microfoundation section deliberately connects adoption-stage vs. usage-stage segmentation through explicit mechanisms.

**Verdict:** PASS — Clean, well-structured technical exposition. No AI-typical patterns detected.

---

## [response_round2.tex]

<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

### Critical
(No issues found)

### High

- [ ] Lines 85-86: Stacked hedges and results-first structure `[High]`

**Comment:** "I think that the paper has improved substantially thanks to your suggested revisions" appears twice in nearly identical form (lines 57-58 and 85-86), which is AI-typical dual-structure. The rhetorical retreat with "I think that" lacks confidence for a formal response.

**Original:**
```
I deeply appreciate your comments on how to revise the paper in order to maximize its potential. I am also thankful to the four referees, who carefully read the previous version and provided me with a clear path for this revision.
I think that the paper has improved substantially thanks to the suggested revisions.
```

**Proposed Revision:**
```
I appreciate your comments and the referees' detailed suggestions. The revisions have substantially improved the paper.
```

**Why better:** Removes the hedged "I think that..." structure and reduces politeness inflation. More authoritative tone appropriate for formal response.

---

- [ ] Lines 138-139: Citation dumping without integration `[High]`

**Comment:** Two citations appended sequentially without causal integration: "news articles suggesting... \parencite{Johnson2010}, and that exempt issuers... \parencite{CUOnline2012}." This is a list of references, not a narrative.

**Original:**
```
However, I did find news articles suggesting that regulated banks reduced sales incentives for debit cards after the Durbin Amendment \parencite{Johnson2010}, and that exempt issuers increased their marketing of their free checking and reward debit programs \parencite{CUOnline2012}.
```

**Proposed Revision:**
```
I found news reports: regulated banks reduced debit incentives (Johnson 2010) while exempt issuers increased marketing of rewards (CU Online 2012).
```

**Why better:** Integrates citations into the sentence structure rather than parenthetical appends. More active flow.

---

- [ ] Lines 224-228: Defensive explanatory structure `[High]`

**Comment:** "To be clear about what the baseline model does:" is a meta-commentary opening typical of AI-written responses. The phrase signals uncertainty or defensive posturing. The section then restates the same logic multiple times (lines 225-226 repeat the segmentation assumption twice).

**Original:**
```
\textbf{Reply: } I share the referees' discomfort with the no-substitution assumption.
To be clear about what the baseline model does: accepting debit cards increases a merchant's sales relative to being cash-only, and consumers are segmented between credit and debit transactions.
A consumer who prefers credit for a given purchase pays with cash, not debit, if credit is unavailable.
```

**Proposed Revision:**
```
\textbf{Reply: } I share the referees' discomfort. The baseline model assumes: accepting debit increases sales, and consumers segment between credit and debit uses. A credit-preferring consumer pays cash if credit is unavailable.
```

**Why better:** Removes "To be clear about what...does" meta-commentary. Tightens repetitive logic.

---

### Medium

- [ ] Lines 56-58: Boilerplate gratitude opening `[Medium]`

**Comment:** "Thank you for carefully reading the previous version of the paper and providing me with great comments and suggestions" is formulaic opening common in AI-generated letters. It lacks specificity and uses inflated politeness ("great comments").

**Original:**
```
Thank you for carefully reading the previous version of the paper and providing me with great comments and suggestions.
I think that the paper has improved substantially thanks to your suggested revisions.
```

**Proposed Revision:**
```
Thank you for your careful reading and feedback. The paper has improved substantially as a result.
```

**Why better:** More concise. Removes inflated politeness and "I think that" hedge. Stronger register for formal correspondence.

---

- [ ] Lines 95-96: Redundant enumeration and meta-commentary `[Medium]`

**Comment:** "I also discuss and -- whenever possible -- address empirically all the points raised by the referees. I have attached four separate letters with my detailed answers to each referee." — Two sentences doing the same work. Dashes and "whenever possible" hedge unnecessarily.

**Original:**
```
I also discuss and -- whenever possible -- address empirically all the points raised by the referees.
I have attached four separate letters with my detailed answers to each referee.
```

**Proposed Revision:**
```
I address all referee points empirically in four detailed response letters below.
```

**Why better:** Combines redundant function. Removes hedging "whenever possible." More direct.

---

- [ ] Lines 141-143: Inventory-style listing of changes `[Medium]`

**Comment:** "The main changes to the exposition are:" followed by enumerated list uses meta-commentary framing ("main changes") followed by template structure ("\begin{enumerate}").

**Original:**
```
The main changes to the exposition are:

\begin{enumerate}
  \item I have added a sentence in Section \ref{subsec:durbin-reduced-form} about how the results are weaker once I include the full sample of debit card payment volumes.
  \item I have clarified that the estimated effects reflect the combination of changes in rewards and non-price characteristics after the Durbin Amendment.
\end{enumerate}
```

**Proposed Revision:**
```
I revised Section \ref{subsec:durbin-reduced-form} on two points: (1) results weaken with the full debit sample, and (2) effects combine rewards and non-price changes from Durbin.
```

**Why better:** Embeds changes into prose. Removes meta-announcement and enumeration. More direct.

---

### Low

- [ ] Lines 57-58: Soft epistemic marker `[Low]`

**Comment:** "I think that the paper has improved substantially thanks to your suggested revisions" — Unnecessarily hedged for a factual assessment.

**Original:**
```
I think that the paper has improved substantially thanks to the suggested revisions.
```

**Proposed Revision:**
```
The revisions have substantially improved the paper.
```

**Why better:** Removes "I think that" hedge. More assertive tone.

---

- [ ] Lines 118-119: Formulaic response opening `[Low]`

**Comment:** "\textbf{Reply:} Thank you for your suggestions..." — The label "Reply:" followed by boilerplate gratitude is formulaic. Stronger to move directly to substantive content.

**Original:**
```
\textbf{Reply:} Thank you for your suggestions on how to address the concerns raised by R1 and R4 about the Durbin evidence.
```

**Proposed Revision:**
```
\textbf{Reply:} I address these concerns through two changes: new data on rewards and a robustness check with reduced sensitivity.
```

**Why better:** Leads with substance rather than gratitude. More efficient use of response space.

---

### Assessment Summary

This is a formal response letter with conventions distinct from paper prose. AI detection is complicated by:
- Expected politeness norms in responses to editors and referees
- Required structural elements (Reply labels, enumerations)
- Repetition of points for clarity to different audiences

Flagged items are genuine style concerns that would improve directness and authority, but the document is not significantly AI-generated. Most text appears human-authored with natural argumentation and problem-solving language. The flagged sections represent opportunities to tighten the register rather than evidence of LLM composition.

**Verdict:** Response letter is primarily human-authored with opportunities to reduce politeness inflation and improve conciseness. No critical AI-detection flags.

---

## Deduplication Summary (Consolidated)
- Items reviewed: 16 (counterfactuals.tex) + 1 (model.tex) + 8 (response_round2.tex) + others
- Total AI-detection items: 25
- Duplicates identified: 0 unique new duplicates (ai_detection.md serves as primary severity-ranked analysis)
- Response_round2.tex items: 8 flags (3 High, 3 Medium, 2 Low severity; appropriately tagged for response letter context and consolidated from word_choice_review.md and simplifications.md)
- Note: response_round2.tex items in word_choice_review.md and simplifications.md now reference ai_detection.md as primary analysis per deduplication priorities

## [appendix_robustness.tex]

**Pass 1 — AI Detection Summary:**

No AI-typical patterns detected. Assessment of all key pattern categories:

### Critical
(No issues found)

### High
(No issues found)

### Medium
(No issues found)

### Low
(No issues found)

**Detailed Assessment:**
- **Transition patterns:** Embedded naturally within technical arguments. No "Moreover," "Furthermore," "Additionally," "In contrast" openers detected. Transitions include "Instead, merchants..." and "Because constraints..." which integrate smoothly into content.
- **Hedging:** Minimal and appropriate. Uses include "nearly identical" (legitimate approximation), "less plausible" (honest assessment), "roughly 7% more" (appropriate approximation signal). No stacked hedges detected.
- **Smarmy reframing:** None detected. No "It's not X, it's Y" constructions.
- **Meta-commentary:** Absent. Sections open with content, not roadmapping ("Model modification" followed immediately by technical specification).
- **Sentence rhythm:** Strong variation (5-65 words) and structure. No monotonous 20-25 word uniformity.
- **AI vocabulary:** Technical terms used precisely. No padding vocabulary detected.
- **Parentheticals:** Minimal and appropriate. No excessive clutter.
- **Demonstratives:** All bare pronouns have explicit referents. No ambiguous pronouns.
- **Colon constructions:** Two instances of CLAUSE: LONGER CLAUSE (lines 28, 204) used to introduce clarifying evidence, not dramatic rhetoric. Contextually appropriate.
- **Enumeration:** No artificial "(1) X, (2) Y" numbering.
- **Missing mechanisms:** All numerical results include explicit causal explanations. ("because the cap mechanically forces...", "Less responsive consumers face less distortion...")
- **Numbers as evidence:** Each number serves as evidence for specific claims, not inventory-style presentation.
- **Results-first openings:** Sections open with mechanism/specification, not results.
- **Limitations:** Named directly and plainly, not hedged with softening language.

**Conclusion:** Clean, human-authored technical appendix with no detectable AI-generation patterns. Dense specialist content, mechanically precise, methodically structured. Author demonstrates robustness of primary results across alternative specifications at high technical standard.

## [intro.tex]

### Medium

- [ ] Lines 14–15: Two consecutive short declarative sentences `[Medium]`

**Comment:** Monotonous short-sentence pattern. Both sentences are syntactically similar (simple declarative structure) with very short length (8 and 7 words respectively). Pattern is readable but could benefit from rhythm variation.

**Original:**
```
Payment markets are two-sided.
Networks simultaneously tax merchants and subsidize consumers.
```

**Proposed Revision:**
```
Payment markets are two-sided: networks simultaneously tax merchants and subsidize consumers.
```

**Why better:** Consolidates related ideas and breaks the monotonous short-sentence pattern while maintaining clarity and directness.

---

- [ ] Lines 31–41: Enumeration pattern with "First," "Second," "Third" `[Medium]`

**Comment:** Somewhat formulaic structure using explicit enumeration markers. While this is clear and readable, it represents an AI-typical pattern of artificial three-item enumeration in prose.

**Proposed Revision:** More concise; eliminate repetitive "I first show," "Second," "Third" enumeration markers while maintaining logical clarity.

**Why better:** Tightens prose and removes formulaic enumeration.

---

- [ ] Line 77: Transition opener "Put differently" `[Medium]`

**Comment:** Formulaic transition word at paragraph start. "Put differently" is a characteristic AI transition opener.

**Original:**
```
Put differently, lower rewards resolve a prisoner's dilemma among consumers.
```

**Proposed Revision:**
```
Lower rewards resolve a prisoner's dilemma among consumers.
```

**Why better:** Removes formulaic transition opener; the logical connection is already clear from content.

---

**Overall Assessment:** The text is well-written, human-authored, and mechanism-driven. No critical or high-severity AI patterns detected. The medium-level flags represent style suggestions for rhythm and concision, not indicators of AI generation. The writing demonstrates strong causal reasoning and explicit logic throughout.

## [appendix_surcharging.tex]

**Pass 1 — AI Detection Summary:**

No AI-typical patterns detected. Assessment of all key pattern categories:

### Critical
(No issues found)

### High
(No issues found)

### Medium
(No issues found)

### Low
(No issues found)

**Detailed Assessment:**

**Part A: Punctuation & Structure Tells**
- **Em-dashes:** No excessive em-dash usage detected. Minimal punctuation; mostly commas and standard sentence-final punctuation.
- **Colon constructions:** No rhetorical CLAUSE: LONGER CLAUSE patterns found. Colons used only in standard citation contexts.
- **Excessive parentheticals:** Minimal; mostly short citations and mathematical notation. No clutter.
- **Bare demonstratives:** All bare demonstratives have explicit noun referents (e.g., "That" in "That merchants do not surcharge" has clear antecedent). No ambiguous bare pronouns.
- **Transition overuse:** None detected. Paragraph openings vary: "It covers...", "I extend...", "In this extension...", "Card-preferring...", "The rarity...", "Menu costs...", "Since..." — natural variety, not template.
- **Monotonous openings:** No monotonous template structure detected across paragraphs.

**Part B: Language Tells**
- **Smarmy reframing:** None detected. No "It's not X, it's Y" constructions.
- **Meta-commentary:** Absent. Section opens with substantive content, not roadmapping ("This appendix explains..." sets up the puzzle directly).
- **Formulaic openers:** None detected ("This occurs because...", "Put differently..." not found).
- **Hedging:** Disciplined throughout. Single hedges only when genuinely uncertain: "roughly 2-3%" for approximation. No stacked hedges ("roughly appears to suggest"). Hedging vocabulary: minimal.
- **AI vocabulary:** Technical terms ("strategic complementarities," "moral hazard," "adverse selection," "general equilibrium effects") checked — NONE used inappropriately. Field terms like "envelope theorem," "menu costs," "price coherence" are used correctly with proper definitions.
- **Padding phrases:** None detected. No "plays a pivotal role," "serves as a testament," "highlights the importance."
- **Misused technical terminology:** All technical economics terms are used correctly per their formal definitions. "Menu costs" properly invoked for decision costs. "Envelope theorem" correctly applied.

**Part C: Argument Tells**
- **Results-first openings:** NOT present. Opening creates genuine tension: "Why do merchants almost never surcharge despite legal ability?" This is a puzzle-first framing, not results-first.
- **Missing causal mechanism:** Mechanisms are EXPLICIT throughout. Examples:
  * "Card-preferring consumers require a surcharge above the merchant fee before switching" — explains why surcharges don't steer
  * "The profit loss from uniform pricing is second-order in fee dispersion by the envelope theorem" — explains the causal logic
  * "Menu costs, maintaining payment-specific prices, communicating them, and the resulting customer friction exceed the gains" — clear mechanism linking behavior to market outcome
- **Inventory-style numbers:** None detected. Numbers are embedded as evidence:
  * "Fee differences across card networks are an order of magnitude smaller" — number serves as evidence for why card-vs-card surcharging won't happen
  * "Merchants do not price differently at the larger margin, they will not do so at the smaller one" — number comparison embedded in causal logic
- **Claims overshooting evidence:** Claims are well-supported by proofs and logic:
  * "I show merchants cannot steer consumers..." — backed by formal Lemma and Theorem
  * "Menu costs suffice to deter surcharging" — logical inference from revealed preference (rarity of legal cash discounts)
- **Buried limitations:** Limitations are NAMED PLAINLY and EARLY. Section 4.5 ("Limitations") states directly: "The results above rely on every card transaction generating incremental sales for the merchant." Then explains what analysis achieves despite limitation. This is textbook good practice per author's writing standards.

**Conclusion:** This appendix exhibits clean, disciplined writing with no AI-typical patterns. Opening creates intellectual tension (puzzle-first framing). Mechanisms are explicit throughout. Limitations are named plainly, not buried in hedging. Hedging is minimal and appropriate. Technical terms are used correctly. Prose demonstrates human-authored economic reasoning with tight logical exposition.

---

**Assessment Summary:**
- Tension-first opening: ✓
- Explicit mechanisms: ✓
- Numbers embedded in argument: ✓
- Limitations named plainly: ✓
- No hedging stacks: ✓
- No AI vocabulary overuse: ✓
- Technical terms used correctly: ✓
- No results-first openings: ✓
- No inventory-style numbers: ✓
- No claims overshooting evidence: ✓

**Overall Severity: 0 items flagged**

## [institutional_details.tex]

**Pass 1 — AI Detection Summary:**

No AI-typical patterns detected. Assessment of all key pattern categories:

### Critical
(No issues found)

### High
(No issues found)

### Medium
(No issues found)

### Low
(No issues found)

**Detailed Assessment:**
- **Transition patterns:** Transitions are embedded naturally in the narrative flow of the payment system description, not formulaic connectors. Language is direct and procedural.
- **Hedging:** Minimal and appropriate. Single use of "roughly one-for-one" is an accurate approximation, not a stacked hedge.
- **Smarmy reframing:** None detected. No "It's not X, it's Y" constructions or false dichotomies.
- **Meta-commentary:** Absent. Institutional details are stated directly without preambles or roadmapping language.
- **Sentence rhythm:** Healthy variation in length and structure. Mix of descriptive sentences, procedural statements, and causal chains.
- **AI vocabulary:** Technical payment industry terms (interchange, merchant discount, acquirer, issuer, network fee) are all precisely used. No AI-typical overuse of "leverage," "nuanced," "pivotal," etc.
- **Parentheticals:** All integrated naturally. Long citations use standard LaTeX parenthetical citations, not clutter.
- **Demonstratives:** No bare "this," "these," "that," "those" without referents. All pronouns have clear noun antecedents.
- **Colon constructions:** No dramatic CLAUSE: LONGER CLAUSE patterns. Colons are used only in standard figure captions and table notes.
- **Enumeration:** No artificial "(1) X, (2) Y, (3) Z" numbering. Facts are presented as a narrative flow, not a list.
- **Causal mechanisms:** Clear throughout. Payment flows are traced explicitly (who receives which fee, and why). Regulatory evidence is presented with causal chains (interchange reduction → merchant fee reduction).
- **Numbers as evidence:** Each dollar figure appears in context answering "so what?" The $2.25 merchant discount is evidence for the payment flow description. Regulatory evidence (fee declines in E.U. and Australia) supports the claim that interchange strongly affects fees.
- **Limitations:** Not applicable — this is institutional background, not a causal analysis. The text appropriately brackets its scope to describing how payment networks function.

**Conclusion:** This is clean, well-written institutional background with no detectable AI-generation patterns. The writing is direct, mechanistic (explaining payment flows clearly), and factually precise without relying on LLM-typical rhetorical shortcuts, hedging strategies, or padding language.


## [estimation.tex]

### Medium

- [ ] Lines 37-39: Anaphoric structure (repetition of "indicator for") `[Medium]`

**Comment:** Parallel structure with repeated "indicator for" creates rhythmic pattern that borders on formulaic. While grammatically correct and technically necessary, a slight restructuring would improve flow.

**Original:**
```
The characteristic vector $X_j$ is an indicator for an inside good and an indicator for being a credit card.
```

**Proposed Revision:**
```
The characteristic vector $X_j$ consists of an inside-good indicator and a credit-card indicator.
```

**Why better:** Eliminates anaphoric repetition; uses "consists of" to express the structural parallel more naturally. Maintains technical precision while improving rhythm.

---

### Pass: No Critical or High-severity AI patterns detected

**Comment:** The estimation section demonstrates strong human-written characteristics throughout:
- First-person active voice dominates ("I estimate," "I recover," "I model," "I match") — natural authorial presence
- Mechanisms are explicit: "because," "so," "thus" connectors tie evidence to causal chains
- Technical specificity: Parameters are named with mathematical notation; identification arguments are concrete (e.g., "The Durbin Amendment identifies $\alpha_0$")
- Sentence rhythm varies appropriately (5–63 word range; mean 21.2 words)
- No excessive hedging or soft qualification
- Numbers are embedded as evidence for claims, not inventory-style lists
- The structure is method-forward, not results-first

**Verdict:** Clean, mechanistic writing appropriate to estimation exposition. The single Medium-severity anaphora flag is minor and stylistic, not indicative of LLM generation.


## [appendix_data.tex]
<!-- Entries sorted: Critical → High → Medium → Low; document order within tier -->

**No issues found.** This appendix section is clean.

This data appendix demonstrates:
- Precise, direct technical language appropriate to the genre
- No AI-typical punctuation patterns (no excessive em-dashes, no dramatic colons)
- No smarmy reframing, meta-commentary, or padding phrases
- No stacked hedges or excessive qualification (hedges used appropriately for approximations and data properties)
- No AI vocabulary (no "leverage," "robust," "nuanced," "pivotal," "facilitate," etc.)
- Appropriate methodology descriptions without over-explanation
- Clear limitations named plainly (coverage varies, thresholds explained rationally)
- Consistent active voice throughout (first-person "I build," "I collect," "I classify," etc.)
- No transition overuse ("Moreover," "Furthermore," "Additionally" absent at paragraph starts)
- No artificial enumeration or rule-of-three padding
- No bare demonstrative pronouns without clear antecedents

**Verdict:** Clean. No AI detection flags warranted.

