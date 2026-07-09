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
  - Meta-Commentary (HIGH PRIORITY)
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

### Compound Noun Stacking

- **LLM pattern:** Piles 3+ nouns/modifiers into one phrase ("reward response decomposition," "spending-share envelope formula") or buries an action in a noun ("feedback from the movement of cohort *k*'s spending shares"). Reads as compressed jargon the reader must unpack.
- **Human pattern:** Unstacks the pile into a prepositional phrase or short clause, de-nominalizes the buried verb, or relabels — favoring a few more words over the stack. Genuine terms of art ("income semi-elasticities," "dominant diagonal") are left intact.
- See `vocabulary_ban_list.md` § Compound Noun Stacking for the full before/after table and the terms-of-art exception.

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
