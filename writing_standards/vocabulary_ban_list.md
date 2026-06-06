# Vocabulary Ban List

Banned and discouraged words and phrases for economics writing. Synthesized from the copyedit skill's `ai_detection.prompt`, `word_choice.prompt`, and revisions skill's `writing_quality.prompt`.

---

## Banned Words (AI Vocabulary)

These words are AI fingerprints. Never use them in academic economics prose.

| Word | Reason |
|------|--------|
| align | AI-typical filler |
| crucial | AI-typical intensifier |
| delve | AI-typical; no economist says this |
| elaborate | AI-typical when used as verb ("elaborate on") |
| emphasize | AI-typical filler |
| enhance | AI-typical; use "improve" or be specific |
| enduring | AI-typical adjective |
| foster | AI-typical; use "support," "encourage," or be specific |
| garner | AI-typical; use "attract," "earn," "collect" |
| highlight | AI-typical filler; use "show," "find," "demonstrate" |
| intricate | AI-typical adjective; be specific instead |
| interplay | AI-typical; describe the actual mechanism |
| pivotal | AI-typical intensifier |
| showcase | AI-typical; use "show" or "present" |
| tapestry | AI-typical metaphor |
| underscore | AI-typical filler; use "show" or just state the fact |
| leverage | AI-typical; use "use" or "exploit" |
| robust | AI-typical (in non-technical usage); use "strong," "stable," or quantify |
| nuanced | AI-typical; be specific about what the nuance is |
| multifaceted | AI-typical; describe the actual dimensions |
| comprehensive | AI-typical filler adjective |
| facilitate | AI-typical; use "help," "enable," or a specific verb |
| load-bearing | AI-typical metaphor; name what the element actually does (e.g., "the assumption the result rests on" → just say which assumption and why) |
| belt-and-suspenders | AI-typical idiom; if you're describing a redundant check, name the two checks and what each rules out |

---

## Latinate Words to Replace with Anglo-Saxon Equivalents

| Never write | Write instead |
|-------------|---------------|
| utilize | use |
| commence | begin |
| purchase | buy |
| demonstrate | show |
| implement | do, carry out (or a specific verb) |
| prior to | before |
| in order to | to |
| individuals | people |
| via | through, by |
| comprise | include, consist of |
| hypothesize | suppose, expect |
| critique | criticize, comment on |

**Test:** Would you say this word aloud to a colleague at the whiteboard?

---

## Vague Nouns to Avoid

| Never write | Write instead |
|-------------|---------------|
| concept | idea, notion (or be specific) |
| structure | (usually empty — name what you mean) |
| process | (usually empty — just name the action) |
| individuals | people |
| factor | reason (or be specific) |
| agents | people (unless used technically in models) |
| function (as "role") | role (or be specific) |
| situation | position, condition |
| time frame | time |

---

## Weak Verbs to Replace

| Never write | Write instead |
|-------------|---------------|
| analyze | examine, study, or specific ("regress Y on X") |
| utilize | use (always) |
| investigate | study, test |
| indicate | show |
| state (meaning "say") | say |

---

## Nominalizations to Eliminate

Find the action hiding in the noun. Make it the verb.

| Never write | Write instead |
|-------------|---------------|
| make a calculation | calculate |
| conduct an analysis | analyze |
| perform an estimation | estimate |
| provide a demonstration | demonstrate (or just "show") |
| have an impact on | affect |
| give consideration to | consider |
| make a determination | determine |

---

## Compound Noun Stacking (Unstack into Prose)

A noun phrase that stacks 3+ nouns/modifiers ("reward response decomposition"), or a nominalized phrase that buries an action in a noun ("feedback from the movement of cohort *k*'s spending shares"), reads as compressed jargon and forces the reader to unpack it. Unstack it into prose: turn the pile into a prepositional phrase or short clause, de-nominalize the buried verb, or relabel. **Favor a few more words over the stack** — this is the one place where adding words is the fix.

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

**Exception — leave terms of art intact.** Established field terms with a fixed technical meaning are not stacks to unpack: "income semi-elasticities," "dominant diagonal," assumption names, "fixed effects," and the like. Load-bearing terms that recur with a specific meaning in the document also stay. When unsure whether a phrase is a term of art or invented compression, flag it — do not rewrite.

---

## Useless Modifiers to Cut

### Adjectives
- interesting (weakened by sarcastic use; never describe your own work this way)
- various
- different
- certain
- particular
- former / latter (makes reader look back)
- intra / inter (use "within" and "between")
- kind of, sort of, type of (vague)

### Self-praise adjectives (never use about your own work)
- striking results
- very significant
- highly important
- novel contribution (show it — don't label it)

### Adverbs to cut
- very (strike almost always)
- clearly (if it's clear, just say it)
- obviously (condescending)
- essentially (hedge disguised as emphasis)
- basically
- respectively (signals lack of parallel structure)
- fortunately, interestingly (cheap opinion)
- absolutely, purely, literally (usually misused)

---

## Redundant Phrases to Cut

| Never write | Write instead |
|-------------|---------------|
| due to the fact that | because |
| in the event that | if |
| for the purpose of | to |
| with regard to | about |
| it is the case that | (delete entirely) |
| it should be noted that | (delete — just say what you want to say) |
| it is worth noting that | (delete) |
| in other words | (delete — if you need it, you didn't say it right the first time) |
| as I mentioned earlier | (delete — say it once, correctly) |

---

## Economics-Specific Verbose Patterns

| Never write | Write instead |
|-------------|---------------|
| We examine the extent to which | How much does X affect Y? |
| has important implications for | affects |
| our analysis focuses on | we study |
| we find evidence suggesting | we find |
| a key advantage is that we observe | we observe |
| the explicit [noun] proceeds | (just describe it directly) |

---

## Discouraged Phrases

These phrases are not outright banned but are discouraged because they signal AI-generated prose or weak writing. Prefer the alternative.

| Phrase | Problem | Preferred alternative |
|--------|---------|----------------------|
| "highlighting," "underscoring" (as sentence fillers) | AI padding | State the fact directly |
| "plays a pivotal role" | AI-typical | Describe the actual mechanism |
| "continues to captivate" | AI-typical | (Academic economics; just state the fact) |
| "serves as a testament to" | AI-typical | (Just state the fact) |
| "stands as a reminder" | AI-typical | (Just state the fact) |
| "abstract platitudes" | Vague | Use concrete examples and numbers |
| "a fortiori," "mutatis mutandis," "ipso facto" | Legalistic | Use plain English |
| "ceteris paribus" | Avoid unless established usage requires it | "holding X fixed," "all else equal" |

---

## Field Convention Notes

**DO NOT flag as errors:**
- Technical economics terms (OLS, IV, FE, SMM, etc.)
- "Agents" when used technically in structural models
- Standard abbreviations
- "Robust" in technical sense (robust standard errors, robust to...)

**DO flag:**
- "Agents" when "people" is clearer in context
- "Utilize" (always — never needed)
- "Robust" as a general intensifier (e.g., "robust findings")
- Pretentious words without technical justification

---

*Sources: copyedit `prompts/tasks/ai_detection.prompt`; copyedit `prompts/tasks/word_choice.prompt`; revisions `prompts/components/writing_quality.prompt` Rules 1–2; copyedit `references/writing_quality_standards.md` (Part B: Language Tells, AI Vocabulary section).*
