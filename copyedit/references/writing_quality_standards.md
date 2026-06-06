# Writing Quality Standards

Copyedit's rule registry. All editing tasks read this file.

This file is **copyedit's rule registry**: it assigns stable rule IDs (`R-EMDASH`, `R-COLON`, `R-HEDGE`, `R-TRANSITION`, etc.), priority tags, severity tiers, and enforcement metadata (`auto-fix` | `block` | `flag` | `info`) used by surface_critic, the task prompts, SKILL.md, and the wrapup gate to operationalize each rule in the copyedit pipeline.

The **canonical prose definitions** of the underlying writing rules live in `writing_standards/economics_writing.md`, with the AI-tell catalog in `writing_standards/ai_detection_rules.md` and the vocabulary lists in `writing_standards/vocabulary_ban_list.md`. This file imports those rules and operationalizes them for copyedit. When a rule's substance is unclear (what counts as a hedge, why throat-clearing is bad, how mechanism clarity is defined), consult `writing_standards/`. When you need to know how copyedit flags, blocks, or auto-fixes a violation, consult this file.

When a rule's IDs, severity, or enforcement behavior needs to change, edit this file. When the underlying writing principle itself needs to change, edit `writing_standards/economics_writing.md` (and reflect any registry consequences here).

---

## Rule Index

Each rule below has a stable ID (`R-*`), a `Priority` tag (`high` rules also appear as one-line reminders in surface_critic.prompt; `standard` rules are referenced only by ID), an `Enforcement` tag (`auto-fix` | `block` | `flag` | `info`), and a `Context` tag (`apply` | `proposal` | `rationale` | `digest` | `all`).

| ID | One-line summary | Priority | Enforcement | Context |
|----|------------------|----------|-------------|---------|
| R-EMDASH | No `---` or `--` punctuation; restructure the sentence | high | auto-fix | apply, proposal |
| R-COLON | No body-prose `CLAUSE: CLAUSE` or `CLAUSE: A,B,C` | high | block | apply, proposal, rationale |
| R-SEMICOLON | Prefer periods; flag any paragraph with 2+ semicolons | standard | flag | all |
| R-TRANSITION | Delete sentence-initial Moreover/Furthermore/Additionally/etc. | standard | auto-fix | all |
| R-HEDGE | At most one hedge per claim; cut hedges not doing real work | standard | flag | all |
| R-DEMONSTRATIVE | Bare this/these/that/those need a noun referent | standard | flag | all |
| R-40WORD | New/rewritten sentences must be ≤40 words | high | auto-fix | apply, proposal |
| R-200WORD | New/rewritten paragraphs ≤200 words / 10 sentences | standard | auto-fix | apply, proposal |
| R-SURGICAL | Surgical tasks touch only what the user requested | standard | block | apply |
| R-RHETQ | No body-prose rhetorical questions | standard | block | apply, proposal |
| R-THROAT-CLEAR | First sentence of any paragraph cannot announce what it will do | high | block | apply, proposal |
| R-COINAGE | Novel hyphenated coinages need definition or replacement | standard | flag | apply, proposal |
| R-BANNED | Match against project banned-phrases list — Critical | standard | block | apply, proposal |
| R-NOVEL-COMPOUND | New `X-vs-Y`/`X-only`/`X-Y-Z` compounds need definition or replacement | standard | flag | apply, proposal |
| R-NOUN-STACK | Unstack 3+ noun piles / buried nominalizations into prose; spare terms of art | standard | flag | apply, proposal |
| R-METAPHOR-VERB | Metaphor verbs (`tilts`, `hinges`, `lands`, `speaks to`, `flows from`) without referent | standard | flag | apply, proposal |
| R-VAGUE-QUALIFIER | `bounded/limited/nontrivial/meaningful [vague noun]` needs a number | standard | flag | apply, proposal |
| R-INTENSITY | No added `collapses`/`dramatically`/`paradigm shift`/etc. | high (within Self-Critic) | block | proposal |
| R-WEAK-FOR-WEAK | No `speak to`→`illuminate`-style swaps; preserve `I find that` | high | block | proposal |
| R-LOADBEARING | Don't paraphrase load-bearing terms from the notes file | standard | block | proposal |
| R-LENGTH-DELTA | rewrite ≤ max(1.2× original, original+5 words), with concrete gain | standard | block | proposal |
| R-VOICE-LOCK | Match source voice (I/we); preserve `I find that`/`I estimate that` | standard | block | apply, proposal |
| R-NEW-CLAIMS | No numerals/citations/facts not present in original or context | standard | block | apply, proposal |
| R-TONE | Match register; no casual/dramatic in formal academic prose | standard | flag | all |
| R-RAP | Introduction and section openers use RAP tension (Principle 5) | info | flag | proposal |
| R-TRIANGULAR | Body paragraphs state result first, then mechanism (Principle 5b) | info | flag | proposal |
| R-PARALLEL | Same statistic stated twice must use the same framing direction (not complement) | standard | flag | all |

**Priority rules** (the five most-violated rules — also surfaced as one-line reminders in `surface_critic.prompt` "What to scan"): `R-COLON`, `R-EMDASH`, `R-40WORD`, `R-THROAT-CLEAR`, `R-WEAK-FOR-WEAK`.

**Enforcement vs Severity:** `Enforcement` is what the gate does (auto-fix in place, block before emit, flag for human review, or info-only diagnostic). `Severity` (Section IV: Critical/High/Medium/Low) is how bad a violation reads to a reviewer. The two are orthogonal — a `flag` rule can still trigger a Critical-severity entry if the violation is severe.

---

## I. The Author's 15 Principles

> **Scope note:** These principles apply to paper prose AND to referee/editor response letters. In response letters, Principles 1, 8, 13, and 14 are most relevant. Additionally, avoid all sycophantic language — see Part B, "Referee/Editor Letter Sycophancy."

### 1. Terse and Precise

**Standard:** Every sentence earns its place. No restatement, no padding, no "identification logic" paragraphs that restate definitions.

**Test:** Can any sentence be deleted without losing information?

**Bad:** "This section derives the first-order conditions characterizing socially optimal merchant fees. The derivation formalizes the discussion of social welfare in the main text and clarifies why the market equilibrium features excessive intermediation."
**Good:** Jump straight to the FOC. The section title already tells the reader what it derives.

---

### 2. Mechanism Over Description

**Standard:** Explain *why* a result obtains, not just *what* happens. Every numerical comparison needs a causal chain.

**Test:** After any number or result, is there a sentence with "because" or "since" that traces the mechanism?

**Bad:** "The cap reduces fees by 100 bps and rewards by 132 bps."
**Good:** "Adding an expensive card incurs fees from both multi-homers and single-homers but increases sales only from single-homers."

---

### 3. Math Is Exact

**Standard:** If there is math, write it out. Do not substitute vague prose for formulas. Replace "this moment identifies the parameter because other parameters have been pinned down" with the actual moment condition.

**Test:** Could a reader replicate the argument from what is written? Does any prose paraphrase a formula that should be displayed?

**Bad:** "This moment identifies the consumer reward sensitivity parameter because other parameters have already been pinned down by substitution patterns."
**Good:** Display the moment condition with the explicit formula, then state what data enters and what parameter comes out.

---

### 4. One Point Per Paragraph

**Standard:** Each paragraph makes one claim and supports it. If a paragraph is "doing too much," split it.

**Test:** Can you state the paragraph's single point in one sentence? If you need two sentences, the paragraph needs splitting.

**Bad:** A paragraph that introduces a counterfactual, reports its results, explains the mechanism, and draws policy implications.
**Good:** Separate paragraphs: setup, result + mechanism, implication.

**Bad:** A paragraph that opens with the legal details of the Durbin Amendment and ends discussing how payment technology has evolved. The reader cannot state the paragraph's single point.
**Good:** One paragraph on the legal structure. A separate paragraph on the technology response.

**Length guardrails:**
- Paragraphs exceeding ~10 sentences or ~200 words likely need splitting even if nominally single-topic. (See R-200WORD.)
- Sentences exceeding ~40 words likely need splitting into two sentences. (See R-40WORD.)
- When rewriting, the output must be equal to or shorter than the input, subject to R-LENGTH-DELTA in Section IV. If a rewrite is longer without satisfying one of the allowed exceptions, it added content that was not in the original — cut it.

---

### 5. RAP Tension (Introduction Only) — Rule ID: R-RAP

**Scope:** Introduction and section openers that set up motivation. Does NOT apply to body paragraphs (see Principle 5b / R-TRIANGULAR).

**Standard:** In the introduction, the reader should know *why they should care* before learning *what you did*. Open with the puzzle, contradiction, or tension; resolve it with the answer (RAP: Research question → Answer → Positioning).

**Test:** Does the opening sentence create curiosity or just announce the topic?

**Bad:** "This paper studies the welfare effects of monopoly under competitive bottlenecks."
**Good:** "Standard models predict monopoly reduces welfare. This paper shows the opposite: under a competitive bottleneck, a merger to monopoly *increases* total welfare."

---

### 5b. Triangular Body Paragraphs (Result Before Mechanism) — Rule ID: R-TRIANGULAR

**Source:** `phd_paper_writing.txt` ("triangular" or "newspaper" style — punchline up front); Chaubey, *Research Writing* (Minto's Pyramid Principle).

**Scope:** Body paragraphs (everything outside the introduction's RAP setup). Does NOT apply to the introduction (see Principle 5 / R-RAP) or to section-opener motivation paragraphs that re-establish RAP context.

**Standard:** State the paragraph's main claim — the result, the conclusion, the punchline — in the topic sentence. Then explain the mechanism, evidence, or logic. The reader should know what the paragraph is arguing before they wade through how the argument is built. Joke/novel structure (long windup → punchline at the end) is wrong here.

**Test:** Strip the paragraph to its first sentence. Can a reader who reads only that one sentence state the paragraph's point? If not, the paragraph buries the punchline and needs to be flipped.

**Bad:** "Consider a market with two networks. Under price coherence, merchants set uniform prices regardless of payment method. Each merchant pays the higher fee on every transaction. As a result, fees rise above the competitive level."
**Good:** "Price coherence inflates fees above the competitive level. Because merchants must set uniform prices, each pays the higher network's fee on every transaction, even when a cheaper alternative exists."

**Common violations:**
- Paragraph opens with "Consider..." or "Suppose..." and only delivers the result in the closing sentence
- Topic sentence describes what the paragraph will do ("This paragraph examines...") rather than what it concludes
- Paragraph is structured as derivation (premise → step → step → result) when the result alone is what the reader needs and the mechanism is supporting detail

**Self-Critic implication:** A rewrite that flips a body paragraph from result-first to motivation-first (or buries the topic sentence) is a structural regression — fail Test 1 (clearly better).

---

### 6. Direct About Limitations

**Standard:** Name weaknesses explicitly, in plain language, early. Then state what the analysis achieves despite the limitation. Do not bury limitations in hedge-laden qualifications.

**Test:** Are limitations named plainly or softened with "may not fully capture" / "unlikely to be sufficient"?

**Bad:** "Our approach may not fully capture the dynamic effects of the policy, though it is unlikely to be sufficient to invalidate the main conclusions."
**Good:** "The model is static. It misses learning effects. But the welfare comparison holds if adjustment costs are symmetric across networks."

---

### 7. Numbers Earn Their Place

**Standard:** Every number in prose answers "so what?" and advances an argument. If a number doesn't serve as evidence for a claim, it belongs in a table, not in text.

**Test:** For each number, what claim does it support? If you can't name one, move it to a table.

**Bad:** "Fees change by X, rewards change by Y, share changes by Z." (inventory of numbers)
**Good:** "Consumer welfare still rises \$8 billion as lower retail prices compensate" — the number is evidence for the claim.

---

### 8. No Throat-Clearing

**Standard:** Cut preambles, meta-commentary, and road-mapping sentences. "This section analyzes..." / "The following analysis shows..." / "Below is a detailed overview..." — delete all of these. Sections begin with their content. (See R-THROAT-CLEAR for the gate-enforced version.)

**Test:** Does the first sentence of any section describe what the section will do rather than doing it?

**Bad:** "This section derives the first-order conditions characterizing socially optimal merchant fees."
**Good:** "A social planner chooses merchant fees $\tau$ to maximize total welfare..."

---

### 9. No Lecturing Experts

**Standard:** Do not explain Econ 101 to field experts. Do not explain what fixed effects do, what IV means, or define common terms. The reader is a professional economist.

**Test:** Would a referee at a top-5 journal already know this? If yes, delete it.

**Bad:** "Fixed effects control for time-invariant unobserved heterogeneity across merchants."
**Good:** Include merchant fixed effects in the specification and move on.

---

### 10. Finesse Over Brute Force

**Standard:** Craft arguments with subtlety. Don't just state conclusions — build to them. Simple does not mean blunt.

**Test:** Does the argument unfold naturally, or does it announce itself?

**Bad:** "The key result is that competition lowers welfare. This is because..."
**Good:** Present the evidence, let the mechanism emerge, then name the result.

---

### 11. Intellectual Precision

**Standard:** Results are not assumptions. Assumptions are not findings. Estimated quantities are not calibrated parameters. Do not mischaracterize what drives a result.

**Test:** For each claim: is it an assumption, an estimation result, a calibration target, or a model prediction? Is it labeled correctly?

**Bad:** "We assume credit aversion..." (when credit aversion is an estimated result)
**Good:** "The model estimates that consumers incur non-pecuniary costs when using credit cards" — clearly an estimated finding.

---

### 12. Don't Impose False Structure

**Standard:** If the method is joint, don't describe it as sequential. If the model has two mechanisms, don't merge them. Describe the actual structure.

**Test:** Does the framing match the method? Does "Step 1... Step 2..." language impose sequence on a simultaneous system?

**Bad:** "First, we estimate demand parameters. Then, we recover supply parameters." (when estimation is joint SMM)
**Good:** "All parameters are estimated jointly by simulated method of moments."

---

### 13. Simple When Possible

**Standard:** Say the simple thing directly. Don't wrap a straightforward claim in elaborate indirect language. If you match a data moment, say so.

**Test:** Is there a simpler way to say this that loses nothing?

**Bad:** "This seems like a really confusing way to just say that I match the response of the Amendment in the model and the data."
**Good:** "The model matches the observed response to the Durbin Amendment."

---

### 14. Direct but Not Dismissive

**Standard:** In referee responses and caveats, be honest and direct without being combative. Name what you can't do, explain why, and state what you deliver instead.

**Test:** Does the tone respect the reader's intelligence without being defensive?

---

### 15. Match Claims to Evidence

**Standard:** Claims must not exceed the evidence presented. If the paper shows a correlation, do not write "demonstrates." If the result is scoped to a subsample, do not generalize. Suggestive evidence stays suggestive. Descriptive patterns are not causal findings.

**Test:** For each claim, what is the strongest verb the identification strategy supports? "Shows" requires a credible causal design. "Suggests" fits suggestive evidence. "Is consistent with" fits descriptive patterns. If the verb overshoots the method, downgrade it.

**Bad:** "shows the opposite" (when evidence only complicates the prior logic)
**Good:** "complicates this logic" — matches the descriptive nature of the evidence

**Bad:** "credit never substitutes for debit" (when the analysis covers only point-of-sale)
**Good:** "at the point of sale, credit does not substitute for debit" — scoped to the evidence

---

## II. LLM-vs-Human Contrasts

These 9 contrasts distinguish LLM prose habits from the author's natural voice. The `writing_quality` task uses these as diagnostic markers.

### 1. Tension vs Summary

**LLM pattern:** Opens with the conclusion, then backfills reasoning. "Monopoly can be welfare-improving because..."
**Human pattern:** Opens with the puzzle or surprise, builds to the conclusion. "A merger to monopoly would *increase* total welfare."

### 2. Sentence and Paragraph Rhythm

**LLM pattern (sentence):** Uniform sentence length (~20-25 words). Every sentence roughly the same structure.
**Human pattern (sentence):** Short punchy sentences mixed with longer analytical ones. Rhythm varies deliberately.

**LLM pattern (paragraph):** Monotonous paragraph openings — every paragraph starts with the same structure (e.g., short declarative sentence followed by expansion). Formulaic internal cadence.
**Human pattern (paragraph):** Paragraph openings vary — some start with evidence, some with a question, some with a concession, some mid-argument. No detectable template across consecutive paragraphs.

### 3. Mechanism vs Description

**LLM pattern:** Reports outcomes without explaining what produces them. "Fees fall by X and rewards fall by Y."
**Human pattern:** Traces the causal chain. "Competing networks must fund rewards through merchant fees; a monopolist can cut rewards without competitive pressure."

### 4. Hedging Discipline

**LLM pattern:** Stacked hedges — "roughly appears to suggest," "may potentially indicate." One hedge per claim maximum.
**Human pattern:** One hedge if genuinely uncertain, zero if the identification is credible. "Our results suggest" only when truly uncertain.

### 5. Implicit Transitions

**LLM pattern:** Explicit transition words at paragraph starts — "Moreover," "Additionally," "Furthermore," "In contrast."
**Human pattern:** Transitions embedded in content. The connection is clear from the argument, not from a signpost word.

### 6. Numbers as Arguments

**LLM pattern:** Inventory-style reporting — "X changed by A, Y changed by B, Z changed by C."
**Human pattern:** Each number mid-sentence as evidence for a specific claim. Numbers advance the argument.

### 7. Honest Limitations

**LLM pattern:** Omits limitations or buries them in softening language. "May not fully capture..."
**Human pattern:** Names the limitation plainly, then states what the analysis achieves despite it.

### 8. Footnote Strategy

**LLM pattern:** Minor caveats inline, cluttering the main argument.
**Human pattern:** Minor caveats in footnotes. Main text stays clean and focused on the primary argument.

### 9. Specific LLM Tells

**LLM pattern:** "(1) X, (2) Y, (3) Z" enumeration in prose. "Not only X but also Y." "It is worth noting." Rule-of-three padding. CLAUSE: LONGER CLAUSE colon constructions ("The implication is direct: fees fall.") used as rhetorical setup.
**Human pattern:** Separate sentences for separate points. Direct statements. No artificial enumeration.

---

## III. Surface Fix Rules

Mechanical rules always applied to new or changed text, regardless of which task runs. Each rule has a stable ID, referenced throughout the skill by that ID.

### R-EMDASH: Em-dash removal

**Priority:** high | **Enforcement:** auto-fix | **Context:** apply, proposal

`---` (LaTeX) and `--` used as punctuation → restructure the sentence instead (period, comma, or subordinate clause).

---

### R-COLON: Colon construction hard block

**Priority:** high | **Enforcement:** block | **Context:** apply, proposal, rationale

Zero tolerance in agent-emitted text. ANY body-prose colon that separates two independent clauses (`CLAUSE: CLAUSE`) OR introduces an enumerated list (`CLAUSE: A, B, C` — including 2-item lists) → block and rewrite.

Three patterns:
- (a) **rhetorical setup** — "The result is clear: fees fall." → "Fees fall."
- (b) **list dump** — "The mechanism has three parts: firms enter, prices fall, and entry stops." → "Firms enter. Prices fall. Entry stops."
- (c) **two-item lists** — "The insight is twofold: fees rise and welfare falls." → "Fees rise. Welfare falls."

**Exclusions:** math equation introducers, bibliographic citations, ratios, section titles, direct quotations, code blocks. See surface_critic P7.

---

### R-SEMICOLON: Semicolon discipline

**Priority:** standard | **Enforcement:** flag | **Context:** all

Prefer periods. LLMs reach for semicolons to sound erudite; humans mostly use periods. Any paragraph with 2+ semicolons → convert to periods unless the parallelism is genuinely essential.

---

### R-TRANSITION: Transition opener removal

**Priority:** standard | **Enforcement:** auto-fix | **Context:** all

Delete sentence-initial "Moreover," "Furthermore," "Additionally," "In contrast," "Notably," "Importantly".

---

### R-HEDGE: Hedging discipline

**Priority:** standard | **Enforcement:** flag | **Context:** all

Maximum one hedge per claim. Cut hedges that aren't doing real work ("roughly" when not approximating, "appears" when not genuinely uncertain). "Our results suggest" only when truly uncertain about identification.

---

### R-DEMONSTRATIVE: Demonstrative pronoun discipline

**Priority:** standard | **Enforcement:** flag | **Context:** all

Bare "this," "these," "that," "those" without a noun referent → add the specific noun. ("This suggests..." → "This price gap suggests..."; "these results" → "the merger counterfactual results"). Exception: "this" is acceptable when the referent is the immediately preceding clause and no ambiguity exists.

---

### R-40WORD: Sentence length cap

**Priority:** high | **Enforcement:** auto-fix | **Context:** apply, proposal

Any new or rewritten sentence exceeding ~40 words → split into two sentences. Long sentences are an LLM tell (humans naturally break at ~25 words in academic prose). See surface_critic P4.

---

### R-200WORD: Paragraph length cap

**Priority:** standard | **Enforcement:** auto-fix | **Context:** apply, proposal

Any new or rewritten paragraph exceeding ~200 words or ~10 sentences → split at the natural topic break.

---

### R-SURGICAL: Surgical edit discipline

**Priority:** standard | **Enforcement:** block | **Context:** apply

When the user requests only specific changes (data updates, number fixes, notation changes), touch NOTHING else. Zero prose changes, zero grammar fixes, zero style improvements beyond the explicit request. "Surgical" means the diff contains only what was asked for.

---

### R-RHETQ: Rhetorical question block

**Priority:** standard | **Enforcement:** block | **Context:** apply, proposal

Any sentence in body prose ending in `?` → rewrite as an assertion. Economics papers state claims; they do not ask them. Convert `Why does X matter? Because Y.` → `X matters because Y.` Exclusions: section headings, quoted referee comments, footnotes discussing literature.

---

### R-THROAT-CLEAR: Throat-clearing block

**Priority:** high | **Enforcement:** block | **Context:** apply, proposal

The first sentence of any paragraph that announces what the paragraph will do rather than doing it → rewrite. Meta-openers to flag: `This section`, `This paragraph`, `To understand`, `To see how`, `By requiring`, `In order to`. See Principle 8. Exception: one thanks-opener is allowed at the very top of a referee-reply letter only.

---

### R-COINAGE: Coinage discipline

**Priority:** standard | **Enforcement:** flag | **Context:** apply, proposal

If an edit introduces a compound term (hyphenated or otherwise) not already in the source file, require either (a) an in-sentence definition immediately following first use or (b) a plain-language replacement. Novel compounds are candidate jargon until proven otherwise.

---

### R-NOVEL-COMPOUND: Novel compound flag

**Priority:** standard | **Enforcement:** flag | **Context:** apply, proposal

Any multi-word hyphenated coinage matching the pattern `X-vs-Y`, `X-only`, or `X-Y-Z` that does NOT appear elsewhere in the source file → flag as candidate jargon. Require either (a) an in-sentence definition immediately following first use or (b) a plain-language replacement. See surface_critic P2.

---

### R-NOUN-STACK: De-stack compound nouns

**Priority:** standard | **Enforcement:** flag | **Context:** apply, proposal

A noun phrase that stacks 3+ nouns/modifiers ("reward response decomposition"), or a nominalized phrase that buries an action in a noun ("feedback from the movement of cohort *k*'s spending shares"), should be unstacked into prose: turn the pile into a prepositional phrase or short clause, de-nominalize the buried verb, or relabel. **Favor a few more words over the stack.**

**Distinct from R-NOVEL-COMPOUND.** That rule fires only on hyphenated `X-vs-Y`/`X-only`/`X-Y-Z` patterns and its remedy is define-or-replace (which can produce a *shorter* phrase). R-NOUN-STACK fires on bare noun-piles and nominalizations (no hyphen needed), fires even when the compound recurs or is defined, and its remedy is the opposite — add words to unstack. See also R-COINAGE.

**Exception:** leave intact (a) load-bearing terms per R-LOADBEARING, and (b) established field terms of art — "income semi-elasticities," "dominant diagonal," assumption names, "fixed effects," etc. When unsure whether a term is art or jargon, **flag — do not rewrite** (the second layer of protection for terms of art that R-LOADBEARING may miss).

| Stacked compound | Unstacked |
|---|---|
| Step B: Reward response decomposition | Step B: The reward response |
| direct network-balance rebate | direct rebate: every dollar the network collects from the rate hike on method *l* is returned to method-*l* users |
| reward feedback from the movement of cohort *k*'s spending shares | feedback from the movement in cohort *k*'s spending shares *(de-nominalize only)* |
| the share-feedback term | the spending-share term |
| recentered composition feedback / composition feedback | drop the modifier; relabel (e.g. underbrace label → feedback) |
| centered merchant/cohort fee gap | fee gaps taken relative to the average |
| a cohort spending-weighted sum is a revenue-weighted moment | summing over merchants with cohort spending weights is the same as a revenue-weighted average |
| spending-share envelope formula | the envelope formula in spending shares |

**Leave intact:** income semi-elasticities, dominant diagonal, assumption names. See surface_critic P2 and the canonical principle in `writing_standards/vocabulary_ban_list.md` § Compound Noun Stacking. Unstacking is exempt from the R-LENGTH-DELTA word-count cap (clause d).

---

### R-METAPHOR-VERB: Metaphor verb flag

**Priority:** standard | **Enforcement:** flag | **Context:** apply, proposal

The verbs `tilts`, `hinges`, `lands`, `speaks to`, `flows from` in a technical passage where there is no concrete referent → replace with a literal verb. See surface_critic P2.

---

### R-VAGUE-QUALIFIER: Vague-qualifier flag

**Priority:** standard | **Enforcement:** flag | **Context:** apply, proposal

Phrases matching `bounded [vague noun]`, `limited [vague noun]`, `nontrivial [vague noun]`, `meaningful [vague noun]` where the noun is itself vague (e.g., `bounded impact`, `meaningful effect`, `nontrivial variation`) → require a number or concrete comparator. See surface_critic P2.

---

### R-BANNED: Banned-phrases match

**Priority:** standard | **Enforcement:** block | **Context:** apply, proposal

If a `banned_phrases` list was loaded (from `notes/copyedit_banned_phrases.md` or `notes/banned_phrases.md` — see master.prompt Bootstrap), any match in new/changed text is a **Critical** violation. Replace with a plain-language alternative before proceeding to other checks.

---

### R-PARALLEL: Framing parallelism

**Priority:** standard | **Enforcement:** flag | **Context:** all

When the same statistic or binary fact appears more than once in a section, all appearances must use the same framing direction. Restating X as its complement (100 − X) in a later sentence, or flipping from the positive to the negative form of the same claim, forces the reader to translate and signals that the passages were written independently.

**Test:** Find every appearance of a given statistic in the passage. Do they all use the same polarity — the same numerator, the same direction? If the section opener states "Y% multi-home," a later paragraph should not restate the same fact as "X% carry only one card."

**Common trigger:** A section or subsection opener establishes direction A for a statistic. A subsequent paragraph restates the same share in direction not-A (the complement) as its lead, forcing the reader to subtract to reconcile the two.

**Bad:** "Around 44% of consumers carry credit cards from two or more networks. [...] Around 56% of primary credit card consumers carry credit cards from only one network."
**Good:** "Around 44% of primary credit card consumers carry credit cards from two or more networks. [...] Single-homers — those without an alternative card — face the largest consequences if a merchant declines their network."

**Fix:** Identify which direction is established first (or which is most central to the argument). Restate all subsequent appearances in that direction. State the complement only when the complement is itself the subject of the claim.

**Severity:** Medium (single flip); High (multiple flips in the same section, or the flip reverses a direction that was explicitly motivated in the section opener).

---

## IV. AI Tell Pattern Reference

### Severity Tiers

| Tier | Label | When to Use |
|------|-------|-------------|
| 1 | **Critical** | Smarmy reframing ("It's not X, it's Y"), stacked hedges (2+ hedges per sentence), missing causal mechanism in results passage, claims overshooting evidence |
| 2 | **High** | AI vocabulary (leverage, robust, nuanced, pivotal, etc.) used 2+ times; results-first openings with no tension; inventory-style numbers |
| 3 | **Medium** | Transition overuse (Moreover, Furthermore, Critically however); template structures; meta-commentary; padding phrases |
| 4 | **Low** | Single-instance AI vocabulary; minor parentheticals; minor hedging; quick-flag Part C patterns with low confidence |

Sort order: Critical first, then High, Medium, Low. Within each tier, preserve document reading order.

**Severity vs Enforcement:** the four-tier severity scale describes how *bad* the violation reads to a reviewer. The `Enforcement` tag in the Rule Index describes what the gate *does* (block, auto-fix, flag, info). They are independent dimensions.

---

### Part A: Punctuation & Structure Tells

**Punctuation:**
- Em-dash overuse: multiple `---` per paragraph (use rarely). See R-EMDASH.
- Excessive parentheticals
- **Colon constructions** — using a colon in body prose to set up a punchline (`CLAUSE: CLAUSE`) or dump an enumerated list (`CLAUSE: A, B, C`, including 2-item lists). The single most persistent AI tell. Examples: "The result is clear: fees fall." / "The mechanism has three parts: firms enter, prices fall, and entry stops." / "The insight is twofold: fees rise and welfare falls." → restructure as direct sentences. Assign **High** severity for any single occurrence in body prose; **Critical** if 2+ occurrences in the same passage or chained with other colon constructions. See R-COLON for the gate-enforced rule.
- Semicolon overuse — see R-SEMICOLON. Flag any paragraph with 2+ semicolons, or any sentence with a semicolon that would read better as two sentences. Assign **Medium** severity (High if pervasive across the document).

**Lists & Enumeration:**
- "One is... A second is... A third is..."
- Artificial balance (exactly 3 items when 2 or 4 is natural)

**Transitions:** see R-TRANSITION.
- "Moreover," "Additionally," "Furthermore" at paragraph starts
- "More broadly," "Taken together" (signals pivot to generalization)
- "In contrast," used as sentence opener instead of subordinate clause
- "Critically, however" openers
- "Notably," "Importantly" overuse

**Template Structures:**
- "Despite these challenges..."
- "In conclusion / In summary / Overall" (formulaic endings)
- "Challenges and future prospects" section endings
- "Not only... but also..." constructions
- Rule-of-three padding (artificial three-item lists beyond natural enumeration)
- "From X to Y" flourishes
- Paragraph-ending restatements: restating what was just established instead of ending on the evidence
- Long inline parentheticals (>10 words) that should be footnotes to keep the argument streamlined
- Monotonous paragraph openings: consecutive paragraphs that all begin with the same sentence structure (e.g., short declarative + expansion, or topic sentence + evidence + implication repeated 3+ times)

**Ambiguous Reference:** see R-DEMONSTRATIVE.
- Bare "this"/"these"/"that"/"those" without a noun — forces reader to guess the referent
- "These results show..." (which results? from which table/counterfactual?)
- "This is driven by..." (what is "this"?)
- Assign **Medium** severity (single occurrence), **High** (3+ bare demonstratives in a paragraph)

---

### Part B: Language Tells

**🚨 Smarmy Reframing (HIGH PRIORITY — very AI-typical):**
- "It's not X, it's Y" constructions
- "The question isn't... it's..."
- "This isn't about... it's about..."
- "The real issue isn't... it's..."
- "What matters isn't... but rather..."

These sound rhetorically clever but are overused by AI. Replace with direct statements.

**Formulaic Openers:**
- "This occurs because..." / "This is because..." as standalone opener (integrate the reason into the prior sentence instead)
- "Put differently..."
- "From a [X] perspective..."

**Meta-Commentary & Collaboration Language:**
- "The paper proceeds in three parts..."
- "[Analysis] yields two main conclusions..."
- "Let's walk through..."
- "Below is a detailed overview..."
- "As we can see..." / "As mentioned above..."
- "It is important to remember..." (moralizing)
- "It is worth noting that..." / "It bears mentioning..."

**Hedging:** see R-HEDGE.
- "Our results suggest that" (when identification is credible)
- "Is consistent with" (weak phrasing)
- Overuse of "arguably," "potentially," "plausibly"
- Stacked hedges: two or more hedges in one sentence ("roughly appears to suggest"); one hedge per claim maximum
- Hedges that aren't doing real work: "roughly" when not a true approximation, "appears" when not genuinely uncertain
- "Unlikely to be sufficient," "may not fully capture" — reflexive softening that reads as uncertain rather than careful

**Over-Explanation:**
- Explaining Econ 101 to field experts
- Explaining the obvious

**AI Vocabulary (flag when overused: 2+ occurrences or AI-typical context):**
- align, crucial, delve, elaborate, emphasize, enhance
- enduring, foster, garner, highlight, intricate, interplay
- pivotal, showcase, tapestry, underscore, leverage, robust
- nuanced, multifaceted, comprehensive, facilitate
- channel (as verb meaning "transmit/convey"), landscape, ecosystem, navigate
- underpin, bolster, cornerstone, framework (when used loosely)
- dynamic, lens ("through the lens of"), shed light, pathway
- load-bearing (as a metaphor for "essential" or "does the work" — strongly AI-typical; flag on any occurrence unless literally describing structural engineering)
- bracket (technical economics term: to bound a quantity between formal limits; flag when used without a bounding argument)
- polar (overused as intensifier or modifier; flag unless referring to actual polarity, coordinates, or regions)

**Padding Phrases:**
- "highlighting," "underscoring" (as sentence fillers)
- "plays a pivotal role," "continues to captivate"
- "serves as a testament to," "stands as a reminder"

**Misused Technical Terminology:**
- Economics jargon used loosely or incorrectly: "strategic complementarities" (requires firms choosing higher actions when competitors do), "moral hazard" (requires hidden action, not just risk), "adverse selection" (requires hidden type), "general equilibrium effects" (requires actual GE model, not just spillovers)
- LLM pattern: sprinkles technical terms for credibility without checking the formal definition applies
- Human pattern: uses a technical term only when its formal conditions are met; otherwise uses plain language ("firms tend to match each other's actions" instead of "strategic complementarities")
- Assign severity: **High** — misusing a term in a paper submitted to a field journal is worse than using no term at all

**Referee/Editor Letter Sycophancy (flag in cover letters and response documents):**
- "genuine economic insight," "genuinely novel," "elegant framework," "excellent paper"
- "important contribution to the literature," "groundbreaking," "seminal"
- Any adjective praising the quality of the paper, referee, or editor
- Human pattern: understated, matter-of-fact. "Useful contribution." "We appreciate this suggestion." "The referee raises a fair point."
- LLM pattern: effusive praise that reads as brown-nosing. Flattery of the referee's intelligence or the paper's significance.
- Fix: strip all praising adjectives. State what the paper does, not how wonderful it is.
- Assign severity: **High**

**Content Style:**
- Exaggerating meaning, symbolism, or significance
- Abstract platitudes instead of concrete facts/examples
- Flowery or overly formal tone where casual fits
- Didactic lines that moralize

---

### R-INTENSITY: Intensity inflation (P7)

**Priority:** high (within Self-Critic) | **Enforcement:** block | **Context:** proposal

Flag ONLY when the word is ADDED in the rewrite. The following words signal hyperbole or inflated stakes. They are a fail when introduced by a rewrite but were absent from the original. When flagged, suggest a measured replacement.

| Added word | Measured replacement |
|------------|----------------------|
| `collapses` | `falls`, `drops`, `declines` |
| `drives` (used as hyperbole) | `raises`, `increases`, `lowers` |
| `exacerbates` | `worsens`, `amplifies` |
| `dramatically` | (delete or quantify) |
| `radically` | (delete or quantify) |
| `fundamentally reshapes` | `changes`, `alters` |
| `paradigm shift` | (delete; state what changed concretely) |
| `drives divergence` | `widens the gap`, `separates` |

---

### R-WEAK-FOR-WEAK: Weak-for-weak substitutions to refuse (P9)

**Priority:** high | **Enforcement:** block | **Context:** proposal

The following swaps exchange one imprecise or register-neutral word for another of equal or lesser precision. They are fails in the Self-Critic Pass (Test 6) and in any task reviewing word choice.

| Original term | Banned swap | Rationale |
|---------------|-------------|-----------|
| `speak to` | `illuminate`, `shed light on` | Same register, no precision gain |
| `challenges` | `complicates` | Same register, no precision gain |
| `targets` | `addresses` | Preserve `targets` if it was in the original |
| `is driven by` | `emerges from` | Substitutes one vague causal phrase for another |
| `I find that` | (deleted) | Removing this weakens the empirical-claim signal; preserve it |
| `I estimate that` | (deleted) | Same — preserve |
| `I show that` | (deleted) | Same — preserve |
| (absent) | `The puzzle emerges from how` | Throat-clearing replacement; banned as an addition |

---

### R-LOADBEARING: Load-bearing jargon principle (P5)

**Priority:** standard | **Enforcement:** block | **Context:** proposal

A load-bearing term is a hyphenated multi-word phrase that appears 3 or more times in the source and carries a specific technical meaning in the paper. Auto-detected during bootstrap and stored in `notes/copyedit_load_bearing_terms.md` (user-editable). Removing a load-bearing term in a rewrite — replacing it with a verbose paraphrase — is a Test 1 fail in the Self-Critic Pass, because it trades field precision for wordiness. Examples of past violations: replacing `credit aversion` with `the cost of using credit`; replacing `merchants multi-home` with `merchants maintain relationships with multiple networks`; replacing `lump-sum rewards` with `rewards for card adoption`.

---

### R-LENGTH-DELTA: Length-delta budget (P3)

**Priority:** standard | **Enforcement:** block | **Context:** proposal

When rewriting a passage: `word_count(rewrite) ≤ max(1.2 × word_count(original), word_count(original) + 5)`. Excess is allowed only if the rewrite (a) reduces hedge density, (b) replaces a vague noun with a concrete noun or number, (c) cannot be shortened without losing meaning, or (d) unstacks a compound noun per R-NOUN-STACK (adding words to de-stack is the intended fix, so it does not count against the cap). Otherwise downgrade to flag-only.

---

### R-VOICE-LOCK: Voice and notation lock (P4)

**Priority:** standard | **Enforcement:** block | **Context:** apply, proposal

Match the source document's grammatical voice. If the source uses first-person singular ("I find," "I estimate"), the rewrite must also use first-person singular — not "we" and not passive. If the document uses "we," the rewrite must use "we." Voice is detected by the bootstrap and stored in `notes/.copyedit_status` as `voice: I`, `voice: we`, or `voice: mixed`.

**Preserved signals:** Do NOT delete `I find that`, `I estimate that`, `I show that` when the source uses them. (Cross-references R-WEAK-FOR-WEAK.)

**Notation check:** If the original contains `$X$` and the rewrite writes `$X$ (between 0 and 1)` or any parenthetical that merely restates what the LaTeX already says → fail. Remove the parenthetical.

---

### R-NEW-CLAIMS: No new claims (P6)

**Priority:** standard | **Enforcement:** block | **Context:** apply, proposal

Tokenize the original and the rewrite. Tokens of interest: numerals, capitalized multi-word phrases, `\cite{...}`, `\ref{...}`. Any such token present in the rewrite but absent from (a) the original sentence, (b) the ±3 surrounding paragraphs of source, OR (c) the user's response document (if loaded) → fail. Note: `**Self-screen:** rewrite withheld — introduced new fact (\`{token}\`)`.

---

### R-TONE: Tone Oscillation (inconsistent register)

**Priority:** standard | **Enforcement:** flag | **Context:** all

- Mixing casual phrasing ("might look like," "kind of") with formal academic prose in the same passage
- Mixing dramatic/literary phrasing ("the landscape shifts," "a pivotal moment") with understated technical prose
- LLM pattern: oscillates between registers within a single section, sometimes within a paragraph
- Human pattern: consistent register throughout — academic economics prose is precise and understated, neither casual nor dramatic
- Fix: choose the register of the surrounding text and match it. When in doubt, default to precise and understated.

---

### Part C: Argument Tells

Quick-flag pass: identifies rhetorical patterns that look LLM-typical. Definitive paragraph-level assessment is handled by the `writing_quality` task (Sonnet). Flag patterns here; defer judgment there.

**Results-First Openings (no tension):**
- Paragraphs or sections that announce the result and then explain it, instead of building curiosity
- Human pattern: opens with the puzzle, contradiction, or surprising fact; lets explanation follow
- LLM pattern: states the conclusion upfront, then backfills the reasoning

**Missing Causal Mechanism:**
- Numerical comparisons or results stated without explaining *why* the result obtains
- Human pattern: traces the causal chain ("Adding an expensive card incurs fees from both multi-homers and single-homers but increases sales only from single-homers")
- LLM pattern: reports outcomes ("the cap reduces fees by 100 bps and rewards by 132 bps") without unpacking what produces the gap

**Inventory-Style Numbers:**
- Sequences of numbers presented as a list rather than embedded as evidence for claims
- Human pattern: each number answers a "so what?" and serves as evidence mid-sentence
- LLM pattern: fees change by X, rewards change by Y, share changes by Z — reads like a table caption, not an argument

**Buried or Omitted Limitations:**
- Known weaknesses softened with hedging language rather than confronted directly
- Human pattern: names limitations explicitly and early, in plain language, then explains what the analysis achieves despite the limitation
- LLM pattern: omits limitations entirely or buries them in hedge-laden qualifications

**Claims Overshooting Evidence:**
- Verbs that exceed the identification strategy: "shows," "demonstrates," "proves" applied to suggestive or descriptive evidence
- Scope creep: results from a subsample or specific margin stated as general findings
- Human pattern: verb strength matches method strength — "suggests" for suggestive, "is consistent with" for descriptive, "shows" only with credible causal identification
- LLM pattern: upgrades every finding to the strongest available verb regardless of design; drops scope qualifiers
- Assign severity: **Critical** (misrepresents the paper's contribution)
