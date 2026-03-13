# Writing Quality Standards

Voice reference for the copyedit skill. All editing tasks read this file.

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
- Paragraphs exceeding ~10 sentences or ~200 words likely need splitting even if nominally single-topic.
- Sentences exceeding ~40 words likely need splitting into two sentences.
- When rewriting, the output must be equal to or shorter than the input. If a rewrite is longer, something was added that was not in the original — cut it.

---

### 5. Motivation First

**Standard:** The reader should know *why they should care* before learning *what you did*. Open with the puzzle, contradiction, or tension — not the result.

**Test:** Does the opening sentence create curiosity or just announce the topic?

**Bad:** "Monopoly can be welfare-improving because of the competitive bottleneck."
**Good:** "A merger to monopoly would *increase* total welfare" — the surprise lands first, then the explanation follows.

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

**Standard:** Cut preambles, meta-commentary, and road-mapping sentences. "This section analyzes..." / "The following analysis shows..." / "Below is a detailed overview..." — delete all of these. Sections begin with their content.

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

Mechanical rules always applied to new or changed text, regardless of which task runs.

- **Em-dash removal**: `---` (LaTeX) and `--` used as punctuation → restructure the sentence instead (period, comma, or subordinate clause)
- **Artificial colon removal**: `CLAUSE: LONGER CLAUSE` rhetorical constructions → convert to a direct statement. ("The result is clear: fees fall" → "Fees fall.")
- **Transition opener removal**: Delete sentence-initial "Moreover," "Furthermore," "Additionally," "In contrast," "Notably," "Importantly"
- **Hedging discipline**: Maximum one hedge per claim; cut non-load-bearing hedges ("roughly" when not approximating, "appears" when not genuinely uncertain); "Our results suggest" only when truly uncertain about identification
- **Demonstrative pronoun discipline**: Bare "this," "these," "that," "those" without a noun referent → add the specific noun. ("This suggests..." → "This price gap suggests..."; "these results" → "the merger counterfactual results"). Exception: "this" is acceptable when the referent is the immediately preceding clause and no ambiguity exists.
- **Sentence length cap**: Any new or rewritten sentence exceeding ~40 words → split into two sentences. Long sentences are an LLM tell (humans naturally break at ~25 words in academic prose).
- **Paragraph length cap**: Any new or rewritten paragraph exceeding ~200 words or ~10 sentences → split at the natural topic break.
- **Surgical edit discipline**: When the user requests only specific changes (data updates, number fixes, notation changes), touch NOTHING else. Zero prose changes, zero grammar fixes, zero style improvements beyond the explicit request. "Surgical" means the diff contains only what was asked for.

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

---

### Part A: Punctuation & Structure Tells

**Punctuation:**
- Em-dash overuse: multiple `---` per paragraph (use rarely)
- Excessive parentheticals
- CLAUSE: LONGER CLAUSE construction — using a colon to introduce a conclusion or elaboration that could stand on its own. "The result is clear: fees fall." → "Fees fall." Assign **Medium** severity (High if 3+ occurrences in a passage).

**Lists & Enumeration:**
- "One is... A second is... A third is..."
- Artificial balance (exactly 3 items when 2 or 4 is natural)

**Transitions:**
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

**Ambiguous Reference:**
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

**Hedging:**
- "Our results suggest that" (when identification is credible)
- "Is consistent with" (weak phrasing)
- Overuse of "arguably," "potentially," "plausibly"
- Stacked hedges: two or more hedges in one sentence ("roughly appears to suggest"); one hedge per claim maximum
- Non-load-bearing hedges: "roughly" when not a true approximation, "appears" when not genuinely uncertain
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

**Tone Oscillation (inconsistent register):**
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
