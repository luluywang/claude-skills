# Economics Writing Standards

Canonical prose source for economics writing rules. Derived from McCloskey, Cochrane, and Chaubey principles, synthesized from the copyedit and revisions skills. Skills like copyedit may layer rule IDs, severity tiers, and enforcement metadata on top of these prose definitions (see `copyedit/references/writing_quality_standards.md`); this file owns the substantive rules themselves.

---

## Contents

- Part I: Paragraph-Level Quality Dimensions
  - Priority 1: Intellectual Precision
  - Priority 2: Mechanism Clarity
  - Priority 3: No False Structure
  - Priority 4: Paragraph Focus
  - Priority 5: Math Precision
  - Priority 6: Number Integration
  - Priority 7: Motivation and Tension
  - Priority 8: Economy (No Throat-Clearing)
- Part II: Structural Principles
  - Paper Organization
  - Introduction Structure
  - Theory Sections
  - Getting to Results Quickly
- Part III: Sentence and Word-Level Standards
  - Sentence Construction
  - Paragraph Coherence
  - Concreteness
  - Voice Matching (for revision work)
- Part IV: Limitations Handling
- Part V: Don't Regress
- Quick Self-Check (unified checklist)
- Grading Scale (for copyedit quality assessments)

---

## Part I: Paragraph-Level Quality Dimensions

These 8 dimensions govern paragraph-level writing quality. Assess each paragraph against the ones that apply — not every dimension applies to every paragraph. When multiple issues overlap, prioritize in the order listed.

### Priority 1: Intellectual Precision

**Standard:** Results are not assumptions. Assumptions are not findings. Estimated quantities are not calibrated parameters. Do not mischaracterize what drives a result. If the framing does not match the method, fix the framing.

**Flags:**
- Estimated result described as an assumption (or vice versa)
- Calibrated parameter described as estimated
- Joint estimation described as sequential steps ("First we pin down X. Second we pin down Y.")
- Two distinct mechanisms conflated into one summary
- Causal language when identification is only correlational

**Bad:** "We assume credit aversion..." (when credit aversion is an estimated result)
**Good:** "The model estimates that consumers incur non-pecuniary costs when using credit cards."

**Bad:** "First, we estimate demand parameters. Then, we recover supply parameters." (when estimation is joint SMM)
**Good:** "All parameters are estimated jointly by simulated method of moments."

---

### Priority 2: Mechanism Clarity

**Standard:** Explain *why* a result obtains, not just *what* happens. Every numerical comparison needs a causal chain. After any number or result, there should be a sentence with "because" or "since" that traces the mechanism.

**Flags:**
- Numerical comparison stated without causal explanation
- Results reported without tracing the economic channel
- "Because" or "since" absent after any result

**Bad:** "The cap reduces fees by 100 bps and rewards by 132 bps."
**Good:** "Adding an expensive card incurs fees from both multi-homers and single-homers but increases sales only from single-homers."

**Earn each inferential step.** When inferring a conclusion from evidence, name the leading alternative explanation and say why your evidence rules it out — even briefly. The reader should never silently wonder "couldn't it be X?" This is distinct from the "because/since" rule above: that rule explains *how* a result obtains; this one explains *why the inference from evidence to conclusion is non-trivial.*

**Bad:** "High-credit-score consumers cross-hold at similar rates as low-credit-score consumers. This suggests preference heterogeneity, not asymmetric information, drives bundling."
**Good:** "High-credit-score consumers cross-hold at similar rates as low-credit-score consumers. This is striking because theories in which information allows the bank to underwrite or price more attractively are unlikely to apply for transactors who use credit cards purely as a payment method."

---

### Priority 3: No False Structure

**Standard:** Describe the actual structure of the method. If estimation is joint, say so. If the model has two mechanisms, don't merge them.

**Flags:**
- "First... Second... Third..." framing for a simultaneous procedure
- "Step 1... Step 2..." language imposed on a joint system
- Bullet-point lists in economics papers where flowing prose would build the argument (exception: referee response documents)

**Bad:** 4 paragraphs with notation defining how an amendment is simulated.
**Good:** "I match this in the model by simulating a 25 bps cut to debit rewards."

**Carve-out for mechanism taxonomies.** Sequential framing ("First… Second… Third…") *is* the right tool when the paper turns on distinguishing N competing mechanisms the reader needs to hold in mind. Enumerate them explicitly in flowing prose before introducing evidence, then tag each downstream piece of evidence to a numbered mechanism. The ban on sequential framing applies to *procedures* (joint estimation, simultaneous moves) — not to *taxonomies of explanations* the reader has to track. Compressing three mechanisms into a comma-separated list ("X, Y, or simply Z") loses the structural scaffolding the reader needs.

---

### Priority 4: Paragraph Focus

**Standard:** Each paragraph makes one claim and supports it. If a paragraph is doing too much, split it.

**Flags:**
- Paragraph introduces a concept, reports results, explains mechanism, AND draws implications
- Topic sentence absent or buried
- Paragraph exceeds ~8 sentences without a clear single argument

**Test:** Can you state the paragraph's single point in one sentence? If you need two sentences, the paragraph needs splitting.

---

### Priority 5: Math Precision

**Standard:** Write the math out. Do not substitute vague prose for formulas. Replace "this moment identifies the parameter because other parameters have been pinned down" with the actual moment condition.

**Flags:**
- Prose paraphrases a formula that should be displayed
- Vague identification arguments without explicit equations
- "Approximately" or "roughly" when exact values are available
- Approximate signs (`\approx`) when exact solutions exist

**Test:** Could a reader replicate the argument from what is written?

---

### Priority 6: Number Integration

**Standard:** Every number in prose answers "so what?" and advances an argument. If a number doesn't serve as evidence for a claim, it belongs in a table, not in text.

**Flags:**
- Inventory-style sequences: "X changed by A, Y changed by B, Z changed by C"
- Numbers presented as a list rather than embedded as evidence for claims

**Bad:** "Fees change by X, rewards change by Y, share changes by Z."
**Good:** "Consumer welfare still rises $8 billion as lower retail prices compensate."

**Counterfactuals organize by economic insight, not by counterfactual.** In counterfactual or robustness sections, paragraph titles and topic sentences should name the takeaway, not the simulation. A paragraph organized around "narrow-bank entry" is weaker than one organized around "complementarity reduces single-product entrants' market share" — the latter tells the reader what to take away; the former tells them what was simulated. This applies even when every number in the paragraph is doing real work: structure by story, not by which counterfactual is being run.

---

### Priority 7: Motivation and Tension

**Standard:** The reader should know *why they should care* before learning *what you did*. Open with the puzzle, contradiction, or tension — not the result. Build curiosity before delivering the conclusion.

**Flags:**
- Section opens by announcing its result rather than the puzzle
- No tension, surprise, or question motivating the analysis
- Reader is told what to think before seeing the evidence

**Bad:** "Monopoly can be welfare-improving because of the competitive bottleneck."
**Good:** "A merger to monopoly would *increase* total welfare." (surprise lands first, then explanation follows)

---

### Priority 8: Economy (No Throat-Clearing)

**Standard:** Cut preambles, meta-commentary, and road-mapping sentences. Do not explain Econ 101 to field experts. If a point can be stated in one sentence, use one sentence. Multi-paragraph formulations for simple ideas are the second-biggest AI tell after meta-commentary.

**Flags:**
- "This section analyzes..." / "Below we show..." / "The following demonstrates..."
- Explaining what fixed effects do, what IV means, or other basics to a field expert audience
- Meta-commentary about the paper's structure
- Elaborate indirect language where a direct statement works
- Always-include-takeaways omitted: after listing robustness checks, counterfactuals, or exercises, the punchline must be stated

**Bad:** "This section derives the first-order conditions characterizing socially optimal merchant fees."
**Good:** "A social planner chooses merchant fees $\tau$ to maximize total welfare..."

---

## Part II: Structural Principles

### Paper Organization

- Organize in inverted-pyramid style: punchline first, then details for readers who continue.
- State the central contribution in the first paragraph. Never make readers wait until Table 12.
- Keep introductions to 3 pages maximum.
- Literature review comes AFTER you've explained your contribution, not before.
- Conclusions should be short (or omitted if the introduction is well-written). Do not restate all findings.

### Introduction Structure

- First sentence states the central contribution with the fact behind the result.
- Part 1: Provoke curiosity, establish context.
- Part 2: Help readers get ready for the main business.
- No "roadmap paragraphs" listing section numbers.
- Never start with "This paper..."

### Theory Sections

- Theory serves empirical work. Keep it minimal and specific.
- Do not write a "general" model and then specialize — work out only the specialized model you take to data.
- No theorems that don't connect to empirical work.

### Getting to Results Quickly

- Nothing before the main result that a reader does not need to understand it.
- No warm-up exercises, no extensive data description of well-known datasets, no preliminary estimates.
- Follow main result with graphs/tables giving intuition and showing robustness.

---

## Part III: Sentence and Word-Level Standards

### Sentence Construction

- Normal S-V-O word order. Complicate only ONE of subject, verb, or object (Gardner's Rule).
- End position = emphasis position. Put the important thing last.
- Active voice. "We estimate" not "it is estimated." "The cap reduces fees" not "fees are reduced by the cap."
- Vary sentence length. Mix short and long. After a complex sentence, follow with a short one. If every sentence is 20–25 words, it reads as AI.

### Paragraph Coherence

- Link each sentence to the previous through repeated words or concepts (McCloskey's Rule of Coherence).
- First sentence of each paragraph carries forward at least one phrase from the previous first sentence.
- Test coherence: extract first sentences of all paragraphs — do they tell a coherent story?
- Do NOT use traffic-signal words (Moreover, Additionally, Furthermore, Therefore, Indeed) to achieve coherence. Use repeated key terms instead.

### Concreteness

- Prefer specific to general: "Chicago" not "large cities" not "urban areas"; "bread" not "food" not "consumption goods"; "workers" not "labor" not "factor inputs."
- Singular words are more vivid than plural: "A worker" vs. "workers."
- Eliminate abstract nouns: "concept," "structure," "process" are usually empty.

### Voice Matching (for revision work)

When editing, before writing any prose:
1. Read the 3–5 sentences surrounding the insertion point.
2. Note the author's sentence length, tense, person (we/I), notation conventions, citation style.
3. Write to match — not to "improve." The goal is that a reader cannot tell where the author's prose ends and the edit begins.

---

## Part IV: Limitations Handling

**Standard:** Name weaknesses explicitly, in plain language, early. State what the analysis achieves despite the limitation. Do not bury limitations in hedge-laden qualifications. Minor caveats belong in footnotes, not inline.

**Bad:** "Our approach may not fully capture the dynamic effects of the policy, though it is unlikely to be sufficient to invalidate the main conclusions."
**Good:** "The model is static. It misses learning effects. But the welfare comparison holds if adjustment costs are symmetric across networks."

One hedge per claim maximum. Never stack hedges ("roughly appears to suggest"). If identification is credible, say "we find" not "our results suggest that."

**Pre-empt selection and identification objections inline.** When a piece of evidence has an obvious selection or identification concern, acknowledge it inline — in the same paragraph where the evidence is introduced — and turn it into motivation for the methodological choice that follows. Don't quarantine all caveats to a limitations paragraph; the reader who is going to object will object on first reading. An inline acknowledgment converts a potential objection into an argument *for* the method.

**Example:** "We can only ask the product-discontinuation question of consumers who already cross-hold — but these are exactly the consumers selected for high one-stop-service utility. This is why we model unobserved heterogeneity rather than reading off mean responses."

---

## Part V: Don't Regress

When rewriting a section (especially for revisions), compare against the prior version. LLM rewrites lose economic insights the author carefully included in earlier drafts.

Before submitting a rewrite:
1. Check that the key economic intuition from the original is preserved.
2. Check that notation defined in the original is still usable downstream.
3. If you removed content, verify it is not referenced later in the manuscript.

---

## Quick Self-Check

Unified self-check covering writing quality and AI-tell detection. Apply to every paragraph. (Both `ai_detection_rules.md` and the revisions/copyedit pipelines reference this checklist; do not maintain a parallel copy elsewhere.)

**Opening and structure**
- [ ] Does the opening create tension or curiosity, rather than announcing the topic or stating the result first?
- [ ] Are there meta-commentary phrases announcing what comes next ("This section..." / "Below we...")?
- [ ] Is there artificial sequential structure ("First... Second... Third...") for a joint procedure?
- [ ] Could the point be made in one sentence instead of a paragraph?

**Sentence-level mechanics**
- [ ] Can any sentence-initial transition be deleted without losing meaning?
- [ ] Does sentence length vary, or is every sentence ~20 words?
- [ ] Would a colleague at a whiteboard say this?

**Word choice and hedging**
- [ ] Is there any word on the AI vocabulary ban list? (See `vocabulary_ban_list.md`)
- [ ] Is there more than one hedge in any sentence?

**Argument and evidence**
- [ ] Does every number answer "so what?"
- [ ] Is the causal mechanism explicit, not just the outcome reported?
- [ ] Are minor caveats in footnotes rather than inline?

**Revision discipline**
- [ ] Does the edit preserve key insights from the prior version?
- [ ] Is any notation being deleted that's still used downstream?

**Final pass**
- [ ] Would a reader familiar with LLM writing recognize this passage as AI-generated?

---

## Grading Scale (for copyedit quality assessments)

| Grade | Meaning |
|-------|---------|
| A | Paragraphs focused, mechanisms clear, math exact, no padding |
| A- | Minor economy issues, one paragraph slightly overloaded |
| B+ | Some inventorial numbers or missing motivation |
| B | Multiple unfocused paragraphs or hand-waved math |
| B- | Significant missing mechanisms or intellectual imprecision |
| C+ | Systematic throat-clearing or false structural framing |
| C | Fundamental issues: wrong characterization of results, missing causal logic |

---

*Sources: McCloskey (Economical Writing), Cochrane (Writing Tips for Ph.D. Students), Chaubey (The Little Book on Research Writing). Synthesized from copyedit `references/writing_quality_standards.md`, copyedit `prompts/tasks/writing_quality.prompt`, and revisions `prompts/components/writing_quality.prompt`.*
