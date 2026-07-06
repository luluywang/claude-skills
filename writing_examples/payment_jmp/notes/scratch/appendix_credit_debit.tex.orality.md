## [appendix_credit_debit.tex]

### Summary
- Total flags: 5 (High: 2, Medium: 3, Low: 0)
- Most common pattern: Pattern 2 (truncated/incomplete sentences that stutter on read-aloud)

### Findings (document order)

### - [ ] Lines 204–204: Incomplete sentence trailing off with ".." `[High]` `[Pattern 2]`

**Comment:** The sentence abruptly ends with ".." — speaker would halt, confused. Looks like the sentence was revised but not completed.

**Original:**
```
The generalized threshold yields two testable predictions for the case when there is substitution and debit cards generate incremental sales relative to cash..
```

**Proposed Revision:**
```
The generalized threshold yields two key testable predictions when credit and debit are substitutes and debit generates incremental sales.
```

**Why better:** Completes the sentence grammatically. Reader/speaker ends on a period with conviction, not trailing off. The two predictions are named in the immediately following section headings, so the revision gestures to them.

### - [ ] Lines 236–237: Abrupt restart after incomplete clause `[High]` `[Pattern 2]`

**Comment:** "In the main text, I focus on the baseline model because it most accurately captures the effects of the D" — sentence fragment that cuts off mid-word. Then restarts: "The goal of the model is to study..." The ear hears a stutter, stops, tries to rewind.

**Original:**
```
In the main text, I focus on the baseline model because it most accurately captures the effects of the D
The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
```

**Proposed Revision:**
```
In the main text, I focus on the baseline model because it most accurately captures the empirical Durbin episode. The goal of the model is to study how regulatory changes to interchange fees shape network competition, consumer rewards, and welfare.
```

**Why better:** Completes the first sentence ("effects of the D" → "effects of the empirical Durbin episode"). The two sentences now flow: the first justifies the baseline, the second restates the model's purpose. The ear doesn't stutter.

### - [ ] Lines 8–9: Long preamble before main clause `[Medium]` `[Pattern 9]`

**Comment:** "While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it." — The verb "presents" doesn't arrive until 36 words in. The speaker must hold the subject across a long stretch.

**Original:**
```
While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Proposed Revision:**
```
Incorporating substitution would make the model more realistic in some dimensions, but it generates predictions at odds with the empirical evidence. This appendix presents the case for segmentation and two alternative specifications.
```

**Why better:** Splits long preamble into two sentences. First sentence: subject-verb arrives in 11 words ("Incorporating...would make"). Second sentence: subject-verb arrives in 5 words ("This appendix presents"). Ear doesn't lag.

### - [ ] Lines 71–73: Packed subordination in model definition `[Medium]` `[Pattern 3]`

**Comment:** "The model therefore treats segmentation as a continuous parameter. The parameter $\zeta\in[0,1]$ governs how often a consumer holding both card types reaches for the other type when a merchant accepts only one, and $\kappa_d\in[0,1]$ governs the demand boost merchants get from debit relative to credit." — The second sentence stacks two parallel independent clauses ("governs how often" AND "governs the demand boost") with heavy embedding in the first. Listener loses track of the parallel structure.

**Original:**
```
The parameter $\zeta\in[0,1]$ governs how often a consumer holding both card types reaches for the other type when a merchant accepts only one, and $\kappa_d\in[0,1]$ governs the demand boost merchants get from debit relative to credit.
```

**Proposed Revision:**
```
The parameter $\zeta\in[0,1]$ (between 0 and 1) governs how often a consumer holding both card types reaches for the secondary card when a merchant accepts only one. The parameter $\kappa_d\in[0,1]$ governs the demand boost from debit relative to credit.
```

**Why better:** Splits single 31-word sentence into two 18-word sentences. Parallel structure now visible: "The parameter X...governs [something]. The parameter Y...governs [something else]." No conjunction overload; each parameter gets its own clause.

### - [ ] Lines 75–77: Dense conditional with multiple referents `[Medium]` `[Pattern 9]`

**Comment:** "When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type." — The main verb "redirects" arrives after 28 words, and the listener must hold: (1) the consumer type (multi-homer), (2) the card types (credit, debit), (3) the merchant behavior (accepts only one), (4) the transaction type (intended for the missing). Too much in suspension.

**Original:**
```
When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type.
```

**Proposed Revision:**
```
When a consumer multi-homing across credit and debit visits a merchant that accepts only one, she redirects a fraction $\zeta$ of her intended transactions to the accepted type.
```

**Why better:** 
- Verb arrives at 15 words (vs. 28)
- "Multi-homing across credit and debit" replaces "carrying one credit and one debit card" — shorter, same meaning
- "her intended transactions to the accepted type" replaces "the transactions intended for the missing type" — simpler grammar (prepositional phrase over reduced relative clause)

---

