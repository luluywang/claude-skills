# Suggested Simplifications

## [main.tex]

No issues found.

---

## [intro.tex]

### Wordiness & Nominalization Issues

### - [ ] Line 28: "giving them incentives to promote"
**Comment:** Nominalization + weak verb construction. "Giving incentives" is weaker than "incentivize."
**Original:**
```
Networks charge merchants interchange fees and pay the revenue to banks, giving them incentives to promote the networks' cards through consumer rewards and other forms of steering.
```
**Proposed Revision:**
```
Networks charge merchants interchange fees and pay the revenue to banks, incentivizing promotion of cards through consumer rewards and steering.
```
**Why better:** Tighter and more direct; "incentivize" is a stronger verb than "give incentives to"

---

### - [ ] Line 31: "Accepting cards significantly increases"
**Comment:** Nominalizing the subject; "accepting cards" could be "card acceptance." The sentence is acceptable but could be crisper.
**Original:**
```
Second, accepting cards significantly increases merchant sales.
```
**Proposed Revision:**
```
Card acceptance significantly raises merchant sales.
```
**Why better:** "Raises" is more direct than "increases"; removes "Second" (enumeration artifact) and "significantly" (advb modifier overuse)

---

### - [ ] Line 47: "I estimate consumer and merchant preferences"
**Comment:** "I estimate" is acceptable but "estimating" or "Estimation of" creates wordier passive construction. The prose is fine as-is but could tighten.
**Original:**
```
I estimate consumer and merchant preferences by matching the reduced-form facts, moments from payment surveys, and aggregate market-level data.
```
**Proposed Revision:**
```
Consumer and merchant preferences are estimated by matching reduced-form facts, moments from payment surveys, and aggregate market-level data.
```
**Why better:** Wait — original is actually more direct. No change needed.

---

### - [ ] Line 48: "The estimated parameters match several untargeted moments"
**Comment:** Weak phrasing "match several untargeted moments" — is "several" precise enough?
**Original:**
```
The estimated parameters match several untargeted moments, including the acceptance response to American Express (AmEx) fee cuts, profit margins, and network costs from accounting data.
```
**Proposed Revision:**
```
The model matches untargeted moments: the acceptance response to AmEx fee cuts, profit margins, and accounting costs.
```
**Why better:** "Match untargeted moments" is more direct; "several" is deleted (vague quantifier); "including" construction is replaced with colon (cleaner list structure)

---

### - [ ] Line 62: "The structural model quantifies the magnitude of"
**Comment:** "Magnitude of this coordination failure" is slightly abstract. "Quantifies" is the weak verb here.
**Original:**
```
The structural model quantifies the magnitude of this coordination failure.
```
**Proposed Revision:**
```
The model measures the welfare loss from this coordination failure.
```
**Why better:** "Measures" is more concrete than "quantifies the magnitude"; "welfare loss" is more specific than "magnitude of failure"

---

### - [ ] Line 69: "Capping merchant fees reduces per-transaction margins"
**Comment:** "Per-transaction margins" is slightly vague — is this clearer as "per-card fees" or "interchange fees"?
**Original:**
```
Capping merchant fees reduces per-transaction margins, giving networks less reason to compete for consumers through rewards.
```
**Proposed Revision:**
```
Capping merchant fees lowers the per-transaction revenue networks earn, reducing incentives to compete for consumers through rewards.
```
**Why better:** "Lowers per-transaction revenue" is more concrete than "reduces margins"; removes "less reason to" (weak construction)

---

### - [ ] Lines 101-102: "These predictions align with rising U.S. interchange fees despite increasing network competition"
**Comment:** "Align with" is a weak verb; "predictions align with observations" is a passive intellectual construction.
**Original:**
```
These predictions align with rising U.S.\ interchange fees despite increasing network competition \parencite{GAO2009} and the global expansion of high-fee Buy Now, Pay Later products \parencite{Berg.etal2024}.
The problem is not market power stifling output but rewards competition generating excessive credit card adoption.
```
**Proposed Revision:**
```
The model's prediction matches U.S. data: fees rose despite network competition, and globally, high-fee Buy Now, Pay Later products expanded.
The culprit is not market power stifling output but rewards competition driving excessive credit card adoption.
```
**Why better:** "Matches U.S. data" is more direct than "aligns with"; "The culprit is" is more forceful than "The problem is not ... but"; strengthens causal claim

---

### - [ ] Line 122: "Network competition endogenizes merchant fees and consumer rewards"
**Comment:** "Endogenizes" is jargon that could be simpler. The sentence is technically correct but could be more accessible.
**Original:**
```
Network competition endogenizes merchant fees and consumer rewards, enabling me to assess how price controls and competition affect total welfare.
```
**Proposed Revision:**
```
Network competition determines merchant fees and consumer rewards, enabling assessment of how price controls and competition affect total welfare.
```
**Why better:** "Determines" is more accessible than "endogenizes"; removes "me" (passive shift is actually clearer here)

---

### Passive Voice & Voice Issues

### - [ ] Lines 75-76: "Reduced merchant fees pass through to lower retail prices"
**Comment:** This is correct passive, but the subject is "Reduced merchant fees" which inverts the agent. Clearer to say "merchants pass through" or "retail prices fall."
**Original:**
```
Reduced merchant fees pass through to lower retail prices for all consumers
```
**Proposed Revision:**
```
Merchants pass the fee cuts through to lower retail prices for all consumers
```
**Why better:** Names the agent explicitly; "Merchants pass through" is more active than "Fees pass through"

---

### Vague Modifiers & Quantifiers

### - [ ] Line 48: "several untargeted moments"
**Comment:** "Several" is vague. Either say which moments or say "additional moments" / "many moments."
**Original:**
```
The estimated parameters match several untargeted moments, including the acceptance response to American Express (AmEx) fee cuts, profit margins, and network costs from accounting data.
```
**Proposed Revision:**
```
The estimated parameters match untargeted moments including the acceptance response to AmEx fee cuts, profit margins, and accounting-based network costs.
```
**Why better:** Deletes "several" (vague); tightens "from accounting data" to "accounting-based"

---

**Total Simplification Flags: 8**

---

## [institutional_details.tex]

No issues found.

---

## [data.tex]

### Simplifications & Word-Choice Suggestions

#### Lines 46–51: Tighten data source introduction

The section on "Issuer Payment Volumes" includes a redundant statement of what the Nilson Report publishes before moving to the panel construction. The revision integrates both pieces of information and eliminates the pause.

**Original:**
```
\noindent \textbf{Issuer Payment Volumes (2007--2014):} 
The Nilson Report publishes the dollar payment volumes of the top credit and debit card issuers annually.
These issuers include both banks and large credit unions.
I construct an annual panel of 39 issuers from the Nilson Report covering 2007--2014 to study how the Durbin Amendment affected payment volumes.
```

**Proposed Revision:**
```
\noindent \textbf{Issuer Payment Volumes (2007--2014).} I construct an annual panel of 39 issuers from the Nilson Report covering 2007--2014 to study how the Durbin Amendment affected payment volumes. The issuers include both banks and large credit unions.
```

**Why better:** Leads with the action (constructing the panel) rather than describing the data source; tightens narrative flow; maintains necessary context about issuer composition.

---

# Simplifications & Style Suggestions

## [reducedform.tex]

No issues found.


---

## [model.tex]

No simplifications suggested. The document prose is direct and avoids typical AI patterns.

---

## [estimation.tex]

No simplifications flagged. The prose is concise and economical. Word choices are precise and appropriate for the technical audience. No instances of:
- "Utilize" / "facilitate" / "implement" (uses specific verbs: "recover," "pin down," "identify")
- Redundant phrases
- Weak verbs or nominalizations
- Useless modifiers ("various," "particular," "interesting")

The text is clean.

---

# Simplifications & Stylistic Suggestions

## [counterfactuals.tex]

No simplifications or stylistic improvements suggested. The prose is clear, direct, and well-structured.

---

## [conclusion.tex]

### High Priority: Remove smarmy reframing

**Lines 21-22:** Replace `challenges a second piece of conventional wisdom: that high merchant fees reflect too little competition` with `challenges the assumption that high merchant fees reflect too little competition.` The colon construction is rhetorically flashy but reads as LLM-typical. The direct version is cleaner.

### Medium Priority: Clarify bare demonstrative

**Lines 31-34:** Replace `Whether these services raise welfare` with `Whether these programs raise welfare` to ground the pronoun in a specific noun and avoid ambiguity.

### Low Priority: Strengthen mechanism exposition

**Lines 4-7:** Consider consolidating the enumeration of outcomes into a tighter causal chain. Current version reports results sequentially; consider unifying: "Intense network competition channeled toward the wrong side of the market creates a chain: networks vie for cardholders with rewards, funded by merchant fees that pass through to retail prices; these rewards draw consumers to credit cards, raising merchant costs for all customers."

---

## [appendix_data.tex]

No issues found.

No AI simplifications or suggested rewrites needed. The vocabulary is appropriately technical, direct verbs are used throughout, there is no nominalization where it can be avoided, and the prose is not wordily or redundant.

---

## [appendix_model.tex]

No issues found.

---

## [appendix_estimation.tex]

No stylistic simplifications suggested.

The prose is already clean, direct, and precise. Word choice is appropriate for technical econometrics writing. No wordiness, weak verbs, or nominalization issues detected.

---

# Simplifications & AI Pattern Suggestions

## [appendix_tables.tex]

No issues found.

The file contains minimal prose, and all sentences are already concise and direct. No AI-typical wordiness, nominalization, or weak verb patterns detected. Table captions and notes are appropriately sparse and technical.

---

## [appendix_figures.tex]

Simplifications review: No wordiness, weak verbs, or redundant phrasing detected. The prose is lean and technical throughout.

Examples:
- "Each point plots a card combination's model share against the data share." — Direct and active.
- "The primary debit card is the card with the plurality of a consumer's debit transactions by count." — Definition sentence; clear.

**Total suggestions: 0**

---

## [appendix_data_oa.tex]

No issues found.

---

## [appendix_reduced.tex]

### Suggestions (Non-Critical)

**Lines 142-147: Optional restructuring of mechanism list**

The three-item mechanism list could be broken into separate sentences for added clarity. This is optional since the current structure is grammatically sound and contextually clear.

See ai_detection.md for full details and proposed revision.

---

**Lines 243-244: Optional footnote for inline cross-reference**

The parenthetical reference to Online Appendix could be moved to a footnote for a cleaner main text. This is a minor readability preference, not a defect.

See ai_detection.md for full details and proposed revision.

---

**Overall:** Appendix_reduced.tex requires no rewrites. The prose is clear, direct, and well-structured. Optional stylistic improvements are noted above but are not necessary for publication.

---

## [appendix_model_oa.tex]

### - [ ] Lines 165-166: Weak adverb and word repetition

**Comment:** "Closely" is a weak adverb modifying "approximate," and the word "approximate" appears twice within one sentence pair.

**Original:**
```
The quasi-profit functions approximate true profits closely. Figure \ref{fig:quasiprofit-approx} compares exact and approximate profits for all $32$ potential payment bundles in the baseline equilibrium.
```

**Proposed Revision:**
```
The quasi-profit functions match true profits closely. Figure \ref{fig:quasiprofit-approx} compares exact and approximate profits for all $32$ potential payment bundles in the baseline equilibrium.
```

**Why better:** "Match" is more concrete than "approximate," and avoids word repetition within the passage.

---

### - [ ] Lines 122-123: Slightly awkward passive-like construction

**Comment:** "Convolving with smooth trembles makes $\Psi$ differentiable" uses a gerund subject with a weak verb "makes" to describe a technical mathematical operation.

**Original:**
```
Convolving with smooth trembles makes $\Psi$ differentiable, and as the perturbation vanishes, the smoothed objective converges uniformly to the original.
```

**Proposed Revision:**
```
This convolution smooths the profit function, making $\Psi$ differentiable, and as the perturbation vanishes, the smoothed objective converges uniformly to the original.
```

**Why better:** Clearer subject ("This convolution") and stronger verb connection to the main action.

---

## [appendix_credit_debit.tex]

### Lines 7–8: Wordy opening clause
Replace "While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence" with a tighter structure.

**Suggested revision:**
```
Incorporating substitution would make the model more realistic in some dimensions but less so empirically—it generates predictions at odds with the data, so this appendix presents alternatives.
```

### Lines 71–73: Dense subordination
The sentence about the generalized model is dense with embedded clauses. Consider breaking into two sentences for readability.

**Current:**
```
The alternative specifications below differ in how much consumers substitute between credit and debit at the point of sale. The model therefore treats segmentation as a continuous parameter.
```

**Suggested revision:**
```
The alternative specifications differ in how much consumers substitute between credit and debit at the point of sale. We treat segmentation as a continuous parameter.
```

### Lines 97–99: Passive construction
"When debit generates fewer incremental sales than credit" is not wrong, but "The model needs parameters..." is slightly passive.

**Current:**
```
When debit generates fewer incremental sales than credit, the model needs parameters $\kappa_j$ for each payment method that scale the sales increase relative to credit cards.
```

**Suggested revision:**
```
When debit generates fewer incremental sales than credit, we introduce parameters $\kappa_j$ for each payment method to scale the sales increase relative to credit cards.
```

### Lines 149–150: Vague opener ("Captures")
"$N$ captures new card transactions" is correct but generic. Consider more concrete phrasing.

**Current:**
```
$N$ captures new card transactions: single-homers on credit plus the share of multi-homer spending that stays cash under partial substitution.
```

**Suggested revision:**
```
$N$ equals new card transactions—single-homers on credit plus multi-homing spending that remains as cash under partial substitution.
```


---

## [appendix_robustness.tex]

(Simplifications flagged by AI detection task — stylistic suggestions only)

### Priority 1

**Lines 57-59: Inventory-style result reporting**

The colon-list construction makes the passage feel mechanical. The proposed revision embeds the numbers directly in verb phrases, which flows more naturally and reads more like human analysis than enumeration. If revised, the passage gains fluidity without losing information.

---

**Lines 61-62: Results-first structure**

Announcing "exception" before showing what makes it exceptional reads as formulaic. The proposed revision leads with the divergence (the surprising fact) and lets the numbers support it. This creates more narrative momentum.

---

### Priority 2

**Lines 114-116: "Credit card...card" repetition**

Minor but noticeable on read-aloud. The proposed "account" variant avoids stutter-sounding repetition without altering the technical meaning.

---


---

## [appendix_surcharging.tex]

No issues found.

---

## [appendix_sorting.tex]

No simplification suggestions. The writing is already clear, efficient, and well-structured.


---

