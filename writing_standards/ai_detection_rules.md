# AI Detection Rules

Canonical list of AI-tell patterns to detect and avoid in economics writing. Synthesized from the copyedit skill's `ai_detection.prompt` and the revisions skill's `writing_quality.prompt` (Rule 1).

Use this file when:
- Reviewing text for AI-generated patterns (copyedit `ai_detection` task)
- Writing or editing manuscript prose (revisions fixer/critic)
- Assessing whether a passage reads as human-authored

---

## Contents

- Part A: Punctuation and Structural Tells
  - Punctuation
  - Lists and Enumeration
  - Template Structures
- Part B: Language Tells
  - Smarmy Reframing (HIGHEST PRIORITY)
  - Pseudo-Aphoristic Clefts / Teaser Theses (HIGH PRIORITY)
  - Meta-Commentary (HIGH PRIORITY), incl. Vapid Paragraph Openers
  - Self-Reference and Credit-Awarding Filler (HIGH PRIORITY)
  - Spatial Framing of Sequential Content (HIGH PRIORITY)
  - Transitions That Scream LLM
  - Formulaic Openers
  - Hedging
  - Compound Noun Stacking
  - Participial Tack-Ons
  - Copula Avoidance
  - Vague Attribution
  - Over-Explanation
- Part C: Rhetorical and Argument Tells
  - Results-First Openings
  - Missing Causal Mechanism
  - Inventory-Style Numbers
  - Buried or Omitted Limitations
  - Artificial Sequential Structure
  - Uniform Sentence Rhythm
  - Flowing Prose vs. Bullet Lists
- Part D: When Not to Flag
- Self-Check pointer

---

## Part A: Punctuation and Structural Tells

### Punctuation
- **Em-dash overuse**: multiple `---` per paragraph. Use rarely — one per several paragraphs at most.
- **Excessive parentheticals**: long inline parentheticals (>10 words) that should be footnotes.
- **Artificial colons for drama**: colons used for effect rather than to introduce specifics.

### Lists and Enumeration
- "One is... A second is... A third is..." — artificial enumeration of parallel items.
- Artificial balance: exactly 3 items when 2 or 4 is more natural (rule-of-three padding).
- "(1) X, (2) Y, (3) Z" enumeration in prose — use separate sentences instead.

### Template Structures
- "Despite these challenges..."
- "In conclusion / In summary / Overall" as formulaic endings
- "Not only... but also..." constructions
- "From X to Y" flourishes
- Paragraph-ending restatements: restating what was just established instead of ending on evidence
- "Challenges and future prospects" section endings

---

## Part B: Language Tells

### Smarmy Reframing (HIGHEST PRIORITY — very AI-typical)

These constructions sound rhetorically clever but are an AI fingerprint. Replace with direct statements.

- "It's not X, it's Y"
- "The question isn't... it's..."
- "This isn't about... it's about..."
- "The real issue isn't... it's..."
- "What matters isn't... but rather..."

### Pseudo-Aphoristic Clefts / Teaser Theses (HIGH PRIORITY)

A sentence that names a difficulty, insight, or tension without stating the underlying fact.
It reads as deep and is empty. Common when the model should have restructured the paragraph and
instead invents a clever opener (or mid-paragraph trailer) that delays the substance one sentence.

**Shape:** *The [gravity noun] is what [vague relative clause].* Gravity nouns include
*difficulty, challenge, tension, insight, point, problem, key, heart, central X*. The relative
clause teases (*what the record omits*, *what makes this hard*) instead of asserting something a
referee could disagree with.

- "The central difficulty is what the record omits."
- "The key insight is that tenure is censored."
- "What makes this hard is the absence of intermediate switches."
- "The tension is between X and Y." (when X and Y are then explained next)

| Teaser | Direct |
|--------|--------|
| The central difficulty is what the record omits. | The survey records only the most recent opening for each product. |
| The key insight is that tenure is censored. | Tenure is right-censored at the survey date. |
| What makes identification hard is the missing intermediate switches. | Intermediate switches are not observed. |

**Test:** Could a referee disagree with this sentence on its own? If it only asserts that something
is hard, important, or missing — without naming the concrete fact — cut it and lead with that fact.
If the paragraph still feels wrong after the cut, restructure the paragraph; do not replace the
teaser with a different teaser.

**Related but distinct:** Smarmy reframing (*It's not X, it's Y*) is antithesis theater. Vapid
openers announce a *move* ("Now compare X to Y"). Teaser theses look like *claims* but only
announce that a claim is coming. Aphoristic *closers* after an argument are covered separately
(copyedit `R-PUNCHLINE`).

### Meta-Commentary (HIGH PRIORITY — #1 AI tell overall)

Never announce what you're about to say. Just say it.

- "proceeds as follows" / "is organized as follows"
- "we now turn to"
- "Let's walk through..."
- "Below is a detailed overview..."
- "As we can see..." / "As mentioned above..."
- "It is important to remember..." / "It is worth noting that..." / "It bears mentioning..."
- "This section discusses..." / "We begin by..." / "We conclude by..."
- "The paper proceeds in three parts..."
- "[Analysis] yields two main conclusions..."

**Vapid paragraph openers.** The first sentence of a paragraph is the position a reader attends to
most. Spending it on a move rather than a claim is the same tell in a subtler form. Every paragraph
opener should be something that could be true or false.

| Vapid opener | What it does | Fix |
|--------------|--------------|-----|
| "Start from what the model needs." | Announces a move | State what the model needs |
| "Before the algebra, two observations." | Pure scaffolding | Lead with the first observation |
| "There are two routes here." | Defers content one sentence | Give the first route |
| "Now compare X to Y." | Instructs the reader | State what the comparison shows |
| "My first concern is about the fit between A and B." | Names a topic | "A measures something different from B." |
| "It is worth computing one." / "It is worth seeing these together." | Says the work matters instead of doing it | Delete; do the work |
| "The first is timing." / "The second part is the counterfactual." | A label is not a claim | "The model has lenders moving simultaneously, but cards are acquired over time." |

A signpost survives only if it also carries content. "The sample restriction is the most serious"
ranks *and* asserts, and is fine. "I take these in order of severity" only ranks, and should be cut.

### Self-Reference and Credit-Awarding Filler (HIGH PRIORITY)

A document is the argument, not a report on how the argument was produced. Writing about one's own
diligence, or inserting concessive beats for balance, is among the most reliable machine
fingerprints — human authors almost never do either.

**Claims of one's own verification or effort.** Never write these. The reader assumes the author
checked their claims; saying it aloud invites the opposite inference. The page cite and the
arithmetic *are* the verification.

- "I have verified this against the manuscript."
- "each verified against the source"
- "After careful analysis / a thorough review of the literature..."
- "I have checked every number in this table."
- "To be sure I had this right, I re-derived..."

**Credit-awarding filler.** Concessive sentences inserted for balance rather than because anyone
asked. If something is done well, say so once, with a specific reason, where strengths belong.

- "That candor is to the paper's credit."
- "which is the right instinct"
- "The authors deserve credit for acknowledging this."
- "This is a reasonable choice, and I do not fault it, but..."

**Narration of the writer's own reasoning.** Delete the frame, keep the claim.

The whole family is a tell, not just the exact wordings below. Banning "Let me be clear" only moves
the writer to "I want to be clear" or "To be clear." The shape is a first-person clause announcing
the writer's intent, emphasis, or state of certainty before the claim arrives. If the sentence still
says what it said with the frame deleted, the frame was the tell.

- Clarity announcements: "Let me be clear...", "I want to be clear...", "To be clear,...", "I should be clear that...", "Just to be clear,..."
- Emphasis announcements: "I want to stress that...", "I want to emphasize that...", "Let me emphasize...", "I would underscore...", "I cannot stress enough..."
- Noting announcements: "It is worth noting that...", "I would note that...", "I should note that...", "It bears mentioning...", "I hasten to add...", "It is important to note..."
- Stance announcements: "This is not an abstract objection, because...", "I say this not to be difficult, but...", "I raise this not because X but because Y."
- Plan announcements: "My third point is narrower and, I hope, more constructive."

**Not the same thing:** a first-person clause that carries a fact the sentence would otherwise lack.
"I could not replicate column 3 from the posted code" narrates the writer, but the narration *is* the
evidence. The test is whether deleting the clause loses information or only loses throat-clearing.

### Spatial Framing of Sequential Content (HIGH PRIORITY)

LLM prose maps an argument onto a geometry — inside/outside, before/after, above/below, layers,
foundations, upstream/downstream — when the underlying relation is just *a list*. The geometry
implies a containment or ordering the argument does not have, and the reader has to decode it to
recover "there are three problems."

- **LLM pattern:** "Two things go wrong with that corner before any algebra, and a third goes wrong
  inside it." The sentence promises that the third problem is nested within the corner in some way
  that matters. Nothing downstream uses the nesting.
- **Human pattern:** "There are three problems with the corner." Then the three problems.

**Watch for:** *before any algebra*, *inside it*, *beneath this*, *underneath the result*, *one layer
down*, *at a deeper level*, *the foundation of*, *sits on top of*, *upstream of the estimate*,
*where this really bites*, *at the heart of*, *the core issue underlying*, *on the surface... but
underneath*. The tell is sharpest when the geometry is paired with a count ("two... and a third...")
or with rhetorical balance across two clauses.

**Test:** delete the geometry and state the count. If nothing is lost, the geometry was decoration.
If the sentence becomes false or vague, the relation was real — keep it.

**Do not flag genuine spatial or temporal relations,** which are ordinary in economics:

- **Terms of art:** inside/outside option, upstream/downstream market, higher-order beliefs, nested
  models, the envelope, corner vs. interior solution.
- **Real sequence in a pipeline:** "The selection happens upstream of the instrument, in how the
  sample was drawn" names *where* in the data construction the problem enters, and a reader who
  skipped it would look in the wrong place.
- **Real time order:** "before the reform," "after 2008."

The rule is not "avoid spatial words." It is: do not use spatial words to dress up an enumeration.

### Transitions That Scream LLM

Never start sentences with these words:

- Moreover
- Additionally
- Furthermore
- Notably
- Importantly
- Critically
- Crucially
- "More broadly,"
- "Taken together,"
- "In contrast," (as sentence opener — use as subordinate clause instead)
- "Despite these challenges..."

**Human alternative:** Use the subject of the sentence as the transition. Repeat key terms from the prior sentence (McCloskey's Rule of Coherence).

### Formulaic Openers
- "This occurs because..." / "This is because..." as standalone opener — integrate the reason into the prior sentence instead
- "Put differently..."
- "From a [X] perspective..."

### Hedging (AI Pattern)

One hedge per claim maximum. Never stack hedges.

- "roughly appears to suggest" — stacked hedges
- "may potentially indicate" — stacked hedges
- "Our results suggest that" — when identification is credible, say "we find"
- "is consistent with" — weak phrasing; be direct
- Overuse of "arguably," "potentially," "plausibly"
- Non-load-bearing hedges: "roughly" when not a true approximation, "appears" when not genuinely uncertain
- Reflexive softening: "unlikely to be sufficient," "may not fully capture"

### Invented Compound Nouns

- **LLM pattern:** Coins multi-word labels that compress a description into a name ("floor bank," "low-slack banks," "near-constraint sample," "tax-price shock"), or piles 3+ nouns/modifiers into one phrase ("reward response decomposition," "spending-share envelope formula"), or buries an action in a noun. Defining the coinage once does not redeem it — the reader still has to learn a private vocabulary.
- **Human pattern:** Uses ordinary descriptive phrases ("bank at the regulatory minimum," "banks near the requirement") and unstacks longer piles into prepositional phrases or short clauses, favoring a few more words over the stack. Leaves intact only **canonical terms of art** with a stable meaning in the published literature ("fixed effects," "capital requirement," "shadow value," "income semi-elasticities").
- **Test:** Would a referee recognize the phrase without this paper's glossary? If not, replace it.
- See `vocabulary_ban_list.md` § Compound Nouns for before/after tables and the terms-of-art exception.

### Participial Tack-Ons

A present-participle clause bolted onto the end of a finished sentence, adding commentary rather than content. This is the grammatical shape behind the banned words in `vocabulary_ban_list.md` — banning *highlighting* alone just moves the writer to *suggesting* or *pointing to*. Flag the shape, not the word.

- **LLM pattern:** "Employment falls by 3 percent in treated counties, **underscoring the importance of** credit constraints." The tack-on asserts significance the sentence has not earned, and could be deleted with no loss.
- **Human pattern:** Either cut the clause, or promote it to its own sentence that makes a real claim. "Employment falls by 3 percent in treated counties. The effect is concentrated among firms with above-median leverage, which is what a credit-constraint channel predicts."
- **Watch for:** highlighting, underscoring, emphasizing, reflecting, suggesting, indicating, demonstrating, pointing to, contributing to, ensuring, thereby.

**Not every trailing participle is a tell.** "Firms respond by cutting hours, **leaving** employment unchanged" states a result. The test is whether the clause adds a fact or only adds praise for the fact already stated.

### Copula Avoidance

LLM prose substitutes elaborate constructions for plain `is`/`are`/`has`.

- **LLM pattern:** "Column 3 **serves as** our preferred specification." "The instrument **represents a** source of variation in exposure." "Table 2 **presents** four panels."
- **Human pattern:** "Column 3 **is** our preferred specification." "The instrument **is** plausibly exogenous because..." "Table 2 **has** four panels."
- **Watch for:** serves as, stands as, represents a, constitutes a, functions as, features, boasts, offers, provides (when "has" or "is" would do).

**Exception:** "represents" in its technical sense (a parameter represents a marginal effect; a matrix represents a linear map) is not copula avoidance.

### Vague Attribution

Claims sourced to an unnamed authority. In economics this is sharper than a style tic: an uncited literature claim is a referee magnet.

- **LLM pattern:** "**Experts argue** that pass-through is incomplete." "**Several studies suggest** a negative relationship." "**The literature shows** that minimum wages have small disemployment effects."
- **Human pattern:** Cite, or drop the claim. "Pass-through is incomplete in most retail settings (Nakamura and Zerom 2010)." If the literature genuinely disagrees, say who disagrees with whom.
- **Watch for:** experts argue, observers note, it is widely believed, some critics, a growing literature, several studies, prior work suggests — any of these standing where a citation belongs.

### Over-Explanation
- Explaining Econ 101 to field experts (what fixed effects do, what IV means, definitions of common terms)
- Explaining the obvious
- Restating what a displayed equation already shows

---

## Part C: Rhetorical and Argument Tells

These patterns reflect how LLM prose structures arguments differently from human academic writing. They require reading groups of sentences, not just individual lines. Flag these quickly; the `writing_quality` task (or full paragraph assessment) makes the definitive call.

### Results-First Openings (No Tension)
- **LLM pattern:** Opens with the conclusion, then backfills reasoning. "Monopoly can be welfare-improving because..."
- **Human pattern:** Opens with the puzzle or surprise, builds to the conclusion. "A merger to monopoly would *increase* total welfare."

### Missing Causal Mechanism
- **LLM pattern:** Reports outcomes without explaining what produces them. "Fees fall by X and rewards fall by Y."
- **Human pattern:** Traces the causal chain. "Competing networks must fund rewards through merchant fees; a monopolist can cut rewards without competitive pressure."

### Inventory-Style Numbers
- **LLM pattern:** Sequences of numbers presented as a list. "Fees change by X, rewards change by Y, share changes by Z."
- **Human pattern:** Each number answers a "so what?" and serves as evidence mid-sentence.

### Buried or Omitted Limitations
- **LLM pattern:** Omits limitations or buries them in softening language. "May not fully capture..."
- **Human pattern:** Names limitations explicitly and early, in plain language, then explains what the analysis achieves despite the limitation.

### Artificial Sequential Structure
- **LLM pattern:** "First, we pin down X. Second, we pin down Y. Third, we pin down Z." when the estimation is joint.
- **Human pattern:** "All parameters are estimated jointly by simulated method of moments."

### Uniform Sentence Rhythm
- **LLM pattern:** Every sentence roughly 20–25 words. Monotonous cadence.
- **Human pattern:** Short punchy sentences mixed with longer analytical ones. Rhythm varies deliberately.

### Flowing Prose vs. Bullet Lists
- **LLM pattern:** Bullet-point lists in economics papers as a formatting crutch.
- **Human pattern:** Connected sentences that build intuition. (Exception: `\begin{enumerate}` in referee responses for enumerating distinct changes.)

---

## Part D: When Not to Flag

Everything above describes prose that is *probably* machine-written. None of it proves anything on its own. A careful economist writing at 2am hits half these patterns without an LLM in the room, and a detector that flags every instance teaches the author to ignore it.

**Tells are evidence in clusters, not in isolation.** One em-dash means nothing. One `however`. One colon. Em-dashes *plus* rule-of-three padding *plus* "underscoring the importance of" *plus* a results-first opening, in the same three paragraphs, is a confession. Weight a flag by what surrounds it: the same colon is Low in a paragraph that is otherwise clean and High in a paragraph already carrying two other tells. When a passage has exactly one tell and nothing else, prefer silence.

**Do not flag these on their own:**

- **Polish.** Clean grammar and consistent style mean the author has been edited, or is good. Neither is a tell.
- **Formal vocabulary.** LLMs overuse *specific* fancy words (Part B, and `vocabulary_ban_list.md`), not all fancy words. Leave *ostensibly*, *constituent*, *a fortiori* where the author meant them.
- **Isolated transitions.** A single *however* or *consequently* is ordinary English. The tell is the pile-up, and specifically the sentence-initial *Moreover/Furthermore/Notably* that could be deleted with no loss.
- **Em-dashes alone.** Plenty of economists use them heavily. Evidence only alongside a formulaic rhythm.
- **One short emphatic sentence.** Writers land points this way. Flag staccato only when several fragments run together to manufacture drama.
- **Terms of art.** Covered under Compound Noun Stacking, and it generalizes: when unsure whether a phrase is a field convention or invented compression, flag it as uncertain — do not rewrite it.
- **Secondhand text.** Never rewrite a watched phrase inside a quotation, a title, a referee's own words, or an example where the phrase is being *discussed* rather than *used*.
- **Dry prose.** AI writing has specific tells. Dryness without them is just dry writing, and is not this file's problem.

**Signs of a human author — lean toward leaving the passage alone:**

- Specific, hard-to-fabricate detail: an odd institutional fact, a footnote about a data quirk, the exact reason three counties were dropped. LLMs round specifics off; humans hoard them.
- Unresolved tension. "The IV is defensible but I am not fully comfortable with the exclusion restriction." Machines default to clean takes.
- Genuine self-interruption — a parenthetical that argues with the sentence it sits inside.
- Deliberate rhythm variation: a four-word sentence after a forty-word one.
- A choice the author can defend. If there is a reason the word is *that* word, it stays.

**Scope.** This section governs judgments about *the author's* text — what a detection task flags in a manuscript. It does **not** relax copyedit's surface fix rules (`R-EMDASH`, `R-COLON`, and the rest of `writing_quality_standards.md` § III), which bind agent-emitted text in the apply, proposal, and rationale contexts. Claude writing a colon into a rewrite is still a hard block. A human economist having written one is a data point.

Where a detection task says to scan "exhaustively," read it as *scan* exhaustively and *report* by cluster weight. A flag the author dismisses costs more than a tell that slips through, because it trains dismissal of the next flag.

---

## Self-Check

For the unified self-check, see `economics_writing.md` § Quick Self-Check.

---

*Sources: copyedit `prompts/tasks/ai_detection.prompt`; revisions `prompts/components/writing_quality.prompt` Rule 1. Participial Tack-Ons, Copula Avoidance, Vague Attribution, and Part D adapted for economics from [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) (WikiProject AI Cleanup), via the [humanizer](https://github.com/blader/humanizer) skill.*
