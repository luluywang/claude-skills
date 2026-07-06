## [appendix_reduced.tex]

### Summary

Total flags: 2 (High: 0, Medium: 2, Low: 0)

The appendix reads clearly when spoken aloud with minimal stumbles. The writing is direct, parallelism is sound, and ambiguous references are rare. Two minor issues flagged for polish.

---

### Findings (Document Order)

### - [ ] Lines 54-55: Demonstrative pronoun clarity `[Medium]` `[Pattern #10]`

**Comment:** "Only 15 paid debit rewards before Durbin. Of these, 7 ended rewards after Durbin while 8 continued."

The pronoun "these" refers back to the 15 institutions, which requires the listener to hold that number in working memory across a sentence break. Acceptable on the page but trips the ear slightly when read aloud because the specific referent isn't reinforced.

**Original:**
```
Of the \scalarinput{nilson_num.tex} institutions in my baseline panel, only 15 paid debit rewards before Durbin.
% CONSTANT: 15 institutions paid debit rewards pre-Durbin, from internet scraping of bank reward programs
Of these, 7 ended rewards after Durbin
% CONSTANT: 7 institutions ended debit rewards post-Durbin, from internet scraping of bank reward programs
while 8 continued.
```

**Proposed Revision:**
```
Of the \scalarinput{nilson_num.tex} institutions in my baseline panel, only 15 paid debit rewards before Durbin.
% CONSTANT: 15 institutions paid debit rewards pre-Durbin, from internet scraping of bank reward programs
Among these 15 institutions, 7 ended rewards after Durbin
% CONSTANT: 7 institutions ended debit rewards post-Durbin, from internet scraping of bank reward programs
while 8 continued.
```

**Why better:** Explicitly restating "15 institutions" as "these 15 institutions" reinforces the antecedent for the listener, preventing the need to backtrack mentally. The ear now anchors "7 ended" and "8 continued" to a concrete set.

---

### - [ ] Lines 383-393: Repetition of "multi-homing" and related terms `[Medium]` `[Pattern #1]`

**Comment:** The section heading, opening sentence, and surrounding text repeat "multi-homing" 5 times within ~80 words. While each instance is technically distinct, the repetition creates a stutter-like effect in spoken delivery.

**Original:**
```
\subsection{Hierarchical Card Acceptance}
\label{subsec:oa-yelp-card-acceptance}

In the main text, I show that the number of merchants that accepts AmEx is similar to the number of merchants that accepts Visa. 
However, aggregate acceptance counts alone cannot prove that merchants multi-home.
This section uses Yelp reviews to show that when AmEx and Visa charged different fees, acceptance patterns were hierarchical.
Merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network at the expense of another.
This provides evidence of the multi-homing fact.

I collect roughly 3,000 Yelp reviews that mention at least two payment methods by name (see Online Appendix \ref{subsec:appendix-yelp-data} for details on the sample construction).
% CONSTANT: count of Yelp reviews, from dataset
The reviews come primarily from the period 2010--2018, before AmEx's acceptance gap with Visa had fully closed, so they capture merchant acceptance decisions during a period of meaningful variation across networks.

Figure \ref{fig:merchant-multihoming} shows a clear hierarchy in which payment methods co-occur in reviews.
```

**Proposed Revision:**
```
\subsection{Hierarchical Card Acceptance}
\label{subsec:oa-yelp-card-acceptance}

In the main text, I show that the number of merchants that accepts AmEx is similar to the number of merchants that accepts Visa. 
However, aggregate acceptance counts alone cannot prove that merchants maintain relationships with multiple networks.
This section uses Yelp reviews to show that when AmEx and Visa charged different fees, acceptance patterns were hierarchical.
Merchants add payment methods sequentially---cash, then debit, then Visa/MC, then AmEx---rather than specializing in one network at the expense of another.
This sequential pattern provides evidence of multi-homing behavior.

I collect roughly 3,000 Yelp reviews that mention at least two payment methods by name (see Online Appendix \ref{subsec:appendix-yelp-data} for details on the sample construction).
% CONSTANT: count of Yelp reviews, from dataset
The reviews come primarily from the period 2010--2018, before AmEx's acceptance gap with Visa had fully closed, so they capture merchant acceptance decisions during a period of meaningful variation across networks.

Figure \ref{fig:merchant-multihoming} shows a clear hierarchy in which payment methods co-occur in reviews.
```

**Why better:**
- Line 381 (second paragraph): replaced "merchants multi-home" with "merchants maintain relationships with multiple networks" (more concrete, avoids near repetition)
- Line 384: replaced final "the multi-homing fact" with "multi-homing behavior" (slightly less repetitive)
- The section title still contains the key term, but the body prose no longer stutters on repetition
- "Multi-homing" is used 3 times instead of 5, reserving heavy use for the section heading and conclusion

---

**Overall Assessment:** The appendix is crisp and reads smoothly aloud. Both flagged issues are minor and cosmetic. The prose demonstrates:
- Strong control of demonstrative pronouns (mostly well-anchored)
- Sound parallel structure throughout
- No noun pile-ups or ambiguous list attachments
- Clear active constructions that avoid stumbling points

**Estimated readability:** High. Suitable for seminar presentation with minimal editing.
