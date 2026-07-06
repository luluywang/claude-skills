## [appendix_credit_debit.tex]

### Summary
- Total flags: 8 (High: 1, Medium: 5, Low: 2)
- Most common pattern: Pattern 1 (word repetition in close proximity) and Pattern 10 (pronouns the ear can't anchor)

### Findings (document order)

---

### - [ ] Lines 7–8: Long preamble before the main verb `[Medium]` `[Pattern 9]`

**Comment:** "While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it." — The subject ("this appendix") does not appear until word 30. A listener must hold the suspended conditional for an uncomfortable amount of time.

**Original:**
```
While incorporating substitution would make the model more realistic along some dimensions, it also generates predictions at odds with the empirical evidence, so this appendix presents the case for segmentation and two alternatives that relax it.
```

**Proposed Revision:**
```
Incorporating substitution would make the model more realistic on the consumer side, but it also generates predictions at odds with the merchant-side evidence.
This appendix presents the case for segmentation and two alternatives that relax it.
```

**Why better:** The subject arrives at word 1 in each sentence; no suspended preamble for the ear to hold.

---

### - [ ] Line 51: "AmEx's own analysis finds customers using debit for everyday purchases below a personal threshold" — pronoun ambiguity / miscue `[Medium]` `[Pattern 4]`

**Comment:** "below a personal threshold of \$20--\$200" — the ear initially reads "below a personal threshold" as a characterization of the customers (customers below a threshold). The range "\$20--\$200" then clarifies that the threshold is monetary, but the listener has to revise. The natural parse is wrong.

**Original:**
```
AmEx's own analysis finds customers using debit for everyday purchases below a personal threshold of \$20--\$200, with Official Payments putting the switching point closer to \$300.
```

**Proposed Revision:**
```
AmEx's own analysis finds that customers switch to debit for everyday purchases once the amount falls below a personal threshold of \$20--\$200; Official Payments puts the switching point closer to \$300.
```

**Why better:** "Once the amount falls below" makes the direction of the threshold unambiguous; the listener does not have to revise the parse mid-sentence. Note: the semicolon may be flagged by surface rules — author may prefer a period and two sentences.

---

### - [ ] Lines 55–57: Repetition of "debit" in close proximity `[Low]` `[Pattern 1]`

**Comment:** "shifts grocery spending onto Discover from both cash and debit when Discover pays higher rewards, not from cash alone... The fact that debit card volumes also decline suggests that credit and debit are at least partial substitutes." — "debit" appears three times in three sentences. The ear catches the stutter, especially "debit when Discover" and "debit card volumes."

**Original:**
```
The Discover quarterly rewards program (Online Appendix~\ref{subsec:oa-discover-rewards}) shifts grocery spending onto Discover from both cash and debit when Discover pays higher rewards, not from cash alone.
Under the segmentation assumption, only the use of cash and other credit cards should decline.
The fact that debit card volumes also decline suggests that credit and debit are at least partial substitutes for consumers.
```

**Proposed Revision:**
```
The Discover quarterly rewards program (Online Appendix~\ref{subsec:oa-discover-rewards}) shifts grocery spending onto Discover from both cash and debit when Discover pays higher rewards, not from cash alone.
Under the segmentation assumption, only cash and other credit card volumes should decline.
Debit volumes decline too, suggesting that credit and debit are at least partial substitutes.
```

**Why better:** Reduces "debit" repetition; tightens the third sentence from 20 to 13 words.

---

### - [ ] Lines 76–78: "She redirects a fraction~$\zeta$" — pronoun without clear antecedent `[Medium]` `[Pattern 10]`

**Comment:** "she redirects a fraction~$\zeta$ of the transactions intended for the missing type." The subject "she" follows a long conditional clause. At a seminar, the listener might wonder "who is she?" before recalling "a multi-homer" from the previous sentence. The pronoun is plausible but the distance across the conditional clause is taxing.

**Original:**
```
When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, she redirects a fraction~$\zeta$ of the transactions intended for the missing type.
```

**Proposed Revision:**
```
When a multi-homer carrying one credit and one debit card visits a merchant that accepts only one type, the consumer redirects a fraction~$\zeta$ of the transactions intended for the missing type.
```

**Why better:** "The consumer" is unambiguous without relying on the listener's working memory for the pronoun's antecedent. (Alternatively, restructure: "A multi-homer redirects a fraction~$\zeta$...")

---

### - [ ] Lines 149–152: "N captures... D captures..." — repeated subject-verb pattern creates stutter `[Low]` `[Pattern 1]`

**Comment:** Two consecutive "$X$ captures $Y$: $Z$" sentences with the colon construction. The structural repetition is intentional for parallelism, but the ear may notice the stutter. This is borderline — the parallelism may be deliberate and worth keeping.

**Original:**
```
$N$ captures new card transactions: single-homers on credit plus the share of multi-homer spending that stays cash under partial substitution.
$D$ captures actual diversion: multi-homer spending redirected from debit to credit.
```

**Proposed Revision:** No change recommended if parallelism is intentional. If the author wants to vary: "$N$ represents new card transactions...while $D$ measures actual diversion..." But for a mathematical decomposition, parallel structure is conventional.

---

### - [ ] Line 223: "if credit merchants fees don't respond" — misparse risk at speed `[High]` `[Pattern 4]`

**Comment:** "credit merchants fees" — the ear first reads "credit merchants" as a noun phrase (merchants of credit), before "fees" arrives and forces a reparse to "credit [merchant] fees." At seminar speed, the listener may lose a beat. This is also the grammar error flagged in the grammar file ("credit merchants fees" for "credit merchant fees" or "credit card merchant fees").

**Original:**
```
The acceptance threshold also predicts that if credit merchants fees don't respond to the debit fee cap, credit card acceptance should decline.
```

**Proposed Revision:**
```
The acceptance threshold also predicts that if credit card merchant fees do not respond to the debit fee cap, credit card acceptance should decline.
```

**Why better:** "Credit card merchant fees" parses unambiguously on first hearing; "do not" is standard in academic prose (avoids the contraction).

---

### - [ ] Lines 269–270: Embedded relative clause inside a complex sentence forces listener to track two parallel paths `[Medium]` `[Pattern 5]`

**Comment:** "A merchant considering Visa Credit must account for diversion from Visa Debit holders who can now substitute across card types. This linkage exacerbates the non-differentiability problem discussed in Online Appendix~\ref{subsec:oa-conduct} and is moderated by dropping AmEx." — The second sentence has two predicates: "exacerbates" and "is moderated," the second being passive. A listener hears "this linkage exacerbates the problem... and is moderated by dropping AmEx" — the subject changes from active to passive mid-sentence.

**Original:**
```
A merchant considering Visa Credit must account for diversion from Visa Debit holders who can now substitute across card types.
This linkage exacerbates the non-differentiability problem discussed in Online Appendix~\ref{subsec:oa-conduct} and is moderated by dropping AmEx.
```

**Proposed Revision:**
```
A merchant considering Visa Credit must account for diversion from Visa Debit holders who can now substitute across card types.
This linkage exacerbates the non-differentiability problem discussed in Online Appendix~\ref{subsec:oa-conduct}; dropping AmEx moderates it.
```

**Why better:** The second clause is now active ("dropping AmEx moderates it"), matching the voice of "exacerbates." The referent of "it" (the non-differentiability problem) is one clause back and unambiguous. Note: the semicolon is flagged by surface rules; author may prefer "Dropping AmEx moderates it." as a separate sentence.

---

### - [ ] Lines 500–503: Long sentence with three stacked dependent clauses `[Medium]` `[Pattern 9]`

**Comment:** "A microfoundation building on \textcite{Koulayev.etal2016} and \textcite{Huynh.etal2022} separates usage from adoption to show that the two stages are independent." — 23 words with two participial phrases before the main verb arrives. Fine on paper; at speed the listener holds "a microfoundation building on [two citations]" for several beats before the predicate.

**Original:**
```
A microfoundation building on \textcite{Koulayev.etal2016} and \textcite{Huynh.etal2022} separates usage from adoption to show that the two stages are independent.
```

**Proposed Revision:**
```
Building on \textcite{Koulayev.etal2016} and \textcite{Huynh.etal2022}, the microfoundation separates usage from adoption and shows the two stages are independent.
```

**Why better:** The main subject ("the microfoundation") arrives sooner; "shows" is active; slight shortening.
