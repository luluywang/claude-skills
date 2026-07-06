# AI Detection — Issues Only
<!-- Auto-generated: passes and clean sections suppressed. Source: ai_detection.md -->

## [appendix_reduced.tex]

### Critical
- [x] Lines 114-117: Missing causal mechanism in mechanism summary `Critical` (applied)

**Comment:** Part C: Results-First Opening with missing causal mechanism. The paragraph opens with conclusions ("Three tests point to...") without first stating the puzzle or creating tension. The mechanism section should open with WHY this mechanism matters before announcing what tests were done.

**Original:**
```
Three tests point to within-bank payment switching, driven by the loss of debit rewards, as the mechanism behind the volume decline.
Banks that ended debit rewards lost volumes comparable to the full treatment effect.
Deposits did not shift from large to small banks, ruling out bank switching.
And credit card rewards did not differentially improve at large banks, ruling out a pull toward credit.
```

**Proposed Revision:**
```
The debit volume decline could reflect three alternative mechanisms: consumers switching between banks to avoid Durbin-exposed institutions, withdrawal of debit because credit rewards improved at large banks, or within-bank substitution driven by loss of debit rewards.
Evidence points strongly to the last mechanism.
Banks that ended debit rewards lost volumes comparable to the full treatment effect.
Deposits did not shift from large to small banks, ruling out bank switching.
And credit card rewards did not differentially improve at large banks, ruling out a pull toward credit.
```

**Why better:** Opens with the interpretive puzzle (three possible mechanisms) before stating the answer. This creates tension and shows the reader why the tests matter.

### High
- [x] Lines 290-300: AI-vocabulary overuse and implicit transitions `High` (applied)

**Comment:** Part B: Transition overuse ("Together, these results rule out") and implicit mechanism reporting without explicit causal chain. Also Part B: fence-sitting language ("point to... as the mechanism" rather than direct attribution).

**Original:**
```
Consumers at small banks (credit unions or community banks, largely exempt from Durbin) did not report higher rates of recent bank switching compared to consumers at large banks.
Together, these results rule out bank switching as the driver of the debit volume decline and point instead to within-bank payment substitution.
```

**Proposed Revision:**
```
Consumers at small banks did not report higher bank switching rates.
The evidence rules out bank switching as the driver: deposit flows and consumer behavior both stay stable across bank sizes.
Debit volumes fall without customers leaving; they must be substituting toward other payment methods within their current banks.
```

**Why better:** Removes "Together" transition, makes the causal chain explicit (deposits + switching rates → no bank switching), and states the conclusion directly rather than "point to."

- [x] Lines 195-200: Inventory-style number reporting `High` (applied)

**Comment:** Part C: Inventory-style presentation of results without causal embedding. Multiple statistics presented as parallel facts rather than evidence building toward a claim.

**Original:**
```
Figure \ref{fig:big-small-credit} tests this prediction using MRI-Simmons survey data.
The left panel plots the probability that a consumer holds a credit card from a large issuer, separately for consumers whose primary deposit institution is large versus small.
Consumers at large deposit institutions hold credit cards from large issuers at higher rates throughout the sample---as expected, since many hold credit and deposit accounts at the same bank---but this gap did not widen after Durbin.
The right panel plots the probability of receiving credit card rewards, again by deposit institution size.
Reward receipt rates were similar across bank types throughout, with no differential increase at large banks after 2011.
These patterns are inconsistent with cross-subsidization: large banks do not appear to have differentially improved credit card rewards.
```

**Proposed Revision:**
```
If large banks substituted toward credit rewards, we should see them offering higher rewards and holding rates should shift.
Figure \ref{fig:big-small-credit} shows neither: the gap in credit card holdings at large versus small institutions remained stable after Durbin, and reward receipt rates did not increase differentially at large banks.
Large banks do not appear to have cross-subsidized credit card rewards.
```

**Why better:** Leads with the hypothesis being tested, then presents evidence as support rather than as a list of facts.

### Medium
- [-] Lines 136-137: Weakly hedged claim about channel substitution `Medium`

**Comment:** Part B: "If these channels are substitutes" introduces contingency without stating what the data will show. The sentence structure masks the actual finding.

**Original:**
```
Banks fund debit promotion from interchange revenue, allocating across rewards, advertising, and teller incentives.
If these channels are substitutes, banks that relied on rewards to promote debit spent less on non-price promotion.
```

**Proposed Revision:**
```
Banks fund debit promotion from interchange revenue, allocating across rewards, advertising, and teller incentives.
If these channels substitute for each other, banks that relied on rewards should have spent less on advertising and teller incentives.
I test this by comparing debit volume changes between banks that cut versus maintained rewards.
```

**Why better:** Makes the hypothesis explicit before presenting the test, reducing the felt need for hedging.

### Low
- [-] Lines 153: Soft hedge on small sample `Low`

**Comment:** Part B: "though the small sample size limits further decomposition" is a defensive hedge. In academic writing, limitations are best stated directly and separately rather than hedged inline.

**Original:**
```
That rewards alone can account for the full decline suggests they drove much of the overall effect, though the small sample size limits further decomposition.
```

**Proposed Revision:**
```
That rewards alone account for the full decline suggests they drove much of the overall effect.
The small sample (n=15) prevents decomposing rewards into sub-mechanisms (e.g., magnitude vs. eligibility changes).
```

**Why better:** Separates the main finding from the caveat. The finding is stated directly; the limitation is named plainly in a separate sentence.

## [reducedform.tex]

### Medium

### - [ ] Lines 4-6 + 184-185: Repeated three-fact enumeration `Medium`

**Comment:** The opening (lines 4-5) lists the three facts, and the bottleneck wrap-up (lines 184-185) restates the same three facts in nearly the same order. Restating all three reads as template structure.

**Original:**
```
Together, these three facts provide evidence for a ``competitive bottleneck'' in which networks compete primarily for consumers, not merchants \parencite{Armstrong2006}.
Consumers respond to rewards, card acceptance increases merchant sales, and single-homing limits merchants' ability to steer consumers between networks.
```

**Proposed Revision:**
```
These patterns are consistent with a ``competitive bottleneck'' \parencite{Armstrong2006} in which networks compete primarily for consumers, not merchants.
```

**Why better:** Eliminates redundant re-enumeration. One sentence suffices.

### - [ ] Lines 6 and 184: "Together" transition opener used twice `Medium`

**Comment:** "Together" at sentence start is a transition signpost. Using it in both the opening and wrap-up creates a formulaic bookend.

### - [ ] Line 6: Em-dash in "bottleneck---but" `Medium`

**Comment:** Em-dash used to pivot to contrasting clause. A comma works.

### - [ ] Line 176: Em-dash in "single-homers---consumers" `Medium`

**Comment:** Appositive em-dash. Relative clause is less heavy: "single-homers, who cannot substitute to a rival."

### Low

### - [ ] Line 177: Colon construction "but rates vary across networks: Visa users..." `Low`

**Comment:** CLAUSE: LONGER CLAUSE construction. Borderline acceptable since it introduces examples, not a dramatic punchline.

### - [ ] Lines 165-166: Parallel "If X... if Y..." conditional structure `Low`

**Comment:** Template-like parallel conditionals. Content is genuinely conditional so low confidence.
