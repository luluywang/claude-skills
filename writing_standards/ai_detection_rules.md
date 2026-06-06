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
  - Over-Explanation
- Part C: Rhetorical and Argument Tells
  - Results-First Openings
  - Missing Causal Mechanism
  - Inventory-Style Numbers
  - Buried or Omitted Limitations
  - Artificial Sequential Structure
  - Uniform Sentence Rhythm
  - Flowing Prose vs. Bullet Lists
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

## Self-Check

For the unified self-check, see `economics_writing.md` § Quick Self-Check.

---

*Sources: copyedit `prompts/tasks/ai_detection.prompt`; revisions `prompts/components/writing_quality.prompt` Rule 1.*
