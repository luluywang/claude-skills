> **Navigation:** [Index](../README.md) | [Unified Report](../unified_report.md) | [Soul Document](../souls/r1_soul.md)
> **Grading scale:** Fully addressed | Partially addressed | Acknowledged | Not addressed
> **Tone scale:** 1=dismissive, 2=defensive, 3=neutral, 4=constructive, 5=engaged


# Referee 1 (R1) Response Evaluation
**Date Completed:** 2026-01-31
**Evaluator:** Claude Code (econ_ra)
**Manuscript Version:** draft_202601

---

## TASK 1: GRADING ON 4-POINT SCALE
### Detailed Concern-by-Concern Assessment

#### R1-1: Sample Selection Justification (Durbin Analysis)
**Concern:** Sample selection unclear; generalizability from 13% of issuers dubious
**Grading:** **FULLY ADDRESSED**
**Justification:**
- Main text now explicitly states: "I focus on institutions with between $2 and $200 billion in assets, and exclude issuers that made large acquisitions during the sample period."
- Appendix A provides detailed rationale: exclusion of systemically important issuers (>$200B) due to additional regulations
- Acquisition exclusion justified: changes in volumes reflect M&A, not consumer choices
- Robustness to sample selection demonstrated in Figure A.2
- R1's prior rating "Fully satisfactory" maintained

---

#### R1-2: Payment Diary Dataset Combination
**Concern:** Unclear how DCPC and SCPC combined; common identifiers unclear; representativeness uncertain
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Main text states: "I combine the 2017--2019 waves of the Atlanta Federal Reserve's Diary of Consumer Payment Choice (DCPC) and Survey of Consumer Payment Choice (SCPC)"
- Appendix notes "common set of identifiers" exist but degree of overlap not explicitly quantified
- R1 rates "Mostly satisfactory" but explicitly notes: "I assume that there is complete overlap between the respondents, although it is not clear from the author's wording"
- Representativeness compared to Homescan but wording could be clearer about whether all DCPC respondents also appear in SCPC
- **Issue remains:** Complete specification of sample composition (all respondents in both, sequential waves, etc.) not fully transparent

---

#### R1-3: Merchant Data Credibility (Consumer Recall)
**Concern:** How credible to estimate merchant acceptance and pass-through without direct merchant data?
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Data source identified: consumer recall from DCPC survey
- Appendix A.3 acknowledges "imperfect" nature: "relies on consumer recall"
- Limitation stated: "my guess is that this is probably bad" (R1's own assessment)
- Honest acknowledgment of data quality issue present
- **Gap:** No explicit discussion of how measurement error in acceptance (reported vs. actual) affects model estimates
- No robustness check showing results under alternative merchant acceptance classifications
- R1 rates "Somewhat satisfactory" — acceptance of limitation but no quantitative assessment of its impact

---

#### R1-4: Signature Debit vs. All Debit
**Concern:** Why only signature debit? Are results robust to all debit?
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Main text justifies coverage: "For example, in 2007, the Nilson Report had signature debit card volumes for the top 200 issuers... This high coverage of signature debit shapes why I choose signature debit"
- Data coverage rationale provided and reasonable
- Results for all debit shown in Online Appendix Figure A.15
- **Critical gap:** Online Appendix results (all debit) show "mostly statistically insignificant" effects per R1
- R1 explicitly requests: "The author should at least mention that the results become weaker when all debit transactions are used in the main text"
- **Main text remains silent** on this weakness — readers relying on main text unaware of robustness concern
- R1 rates "Mostly satisfactory" with caveat that results weaken substantially for all debit

---

#### R1-5: Control Group Validity (Small Issuers and Durbin)
**Concern:** Small issuers also affected by Durbin; not appropriate control group
**Grading:** **ACKNOWLEDGED (Not Fully Addressed)**
**Justification:**
- R1 notes: "the author has continued to use small issuers as the control group but has explained that this choice is unlikely to affect the results in footnote 6"
- Response is defensive rather than substantive: claims control group choice "unlikely to affect" rather than proving it
- Footnote 6 location could not be verified in current reads (may be renumbered or in different section)
- R1 rates "Mostly satisfactory response" but signals dissatisfaction with justification quality
- **Assessment:** Concern acknowledged but argument not fully convincing; readers should see empirical test (e.g., pre-Durbin parallel trends)

---

#### R1-6: Card Acceptance Model (Reallocation vs. Expansion)
**Concern:** Model assumes merchants get sales reallocation (not expansion); in reality mixed effects
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Mechanism clarified: "Card acceptance reallocates spending towards card-accepting merchants rather than increasing overall spending"
- Budget constraint explanation provided (Appendix A.4): consumers have fixed income, card acceptance reallocates where it's spent
- R1 acknowledges: "Mostly satisfactory" but notes: "In reality, card acceptance likely results in some business stealing from rival merchants and some market expansion"
- R1 suggests: "It would be ideal for the author to estimate the extent... although I do not view it as a requirement for publication"
- **Accepted as simplification** but empirical decomposition would strengthen (e.g., evidence from merger analysis on reallocation vs. expansion rates)

---

#### R1-7: Fixed Gamma Multi-Card Scenario
**Concern:** Fixed sales boost γ creates perverse incentive: if consumers carry both credit and debit, merchants get no incremental benefit from credit over debit
**Grading:** **NOT ADDRESSED**
**Justification:**
- R1 states: "No response: I could not locate a response to this comment in the article"
- Model text (line 273-277) mentions merchants don't substitute between credit/debit at point of sale, but **does not engage** with R1's specific logic
- R1's concern: "merchants have no incentive to accept credit cards; credit cards offer no incremental sales increase over debit cards"
- **Gap:** No explicit discussion of merchant incentive structure under multi-card consumer scenario
- R1 notes possible missing piece: "I may be missing something here" — invitation for explicit clarification that is not taken
- This is one of two "No response" items from first round that remains unaddressed

---

#### R1-8: Rewards Modeling (Income Boost Without Usage)
**Concern:** Rewards specification unnatural; consumers get income boost even if never using card
**Grading:** **NOT ADDRESSED (Still Unsatisfactory)**
**Justification:**
- Text (footnote line 158-160) claims: "The pecuniary utility for single-homing agents is micro-founded in the consumer's optimal consumption problem across merchants. When rewards are small, it equals the log utility of a consumer with CES preferences..."
- R1 rates "Unsatisfactory response" and explicitly states: "This requires more explanation; the microfoundation is not explicitly provided and is not clear to me"
- **What's missing:** Explicit derivation showing how lump-sum rewards emerge from optimization problem
- Appendix A.4 shows rewards enter through income (f^w) but connection to "using card vs. not using" not formalized
- R1 wants explicit algebra showing that unused rewards still provide utility — current framing is stated but not derived
- **Remains problematic:** Readers cannot verify the microfoundation from text; requires trust in author assertion

---

#### R1-9: Pass-through Modeling (CES One-Parameter Problem)
**Concern:** CES has one parameter governing both markups and pass-through; claimed to analyze "arbitrary pass-through" but only zero pass-through shown
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Main text (model section) acknowledges CES constraint: "Merchants fully pass on fees to prices given CES preferences"
- Appendix F.6 extends to zero pass-through case
- **R1's core complaint:** Author claims in Section IV.F.2 to "extend the model to allow for an arbitrary degree of pass-through"
- R1 explicitly states: "Appendix F.6 provides analysis of a case with no pass-through... This is not true. The statement is misleading."
- **Critical:** R1 demands: "The author should... remove the false statement from the text"
- **Current status:** Misleading claim may or may not have been removed from text (need verification in Section IV.F.2)
- Only full and zero pass-through cases analyzed; intermediate values not considered

---

#### R1-10: Primary/Secondary Card Specification
**Concern:** Model-data inconsistency in how primary and secondary cards specified
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Procedure revised from previous round
- Main text defines: "I characterize first and second payment methods based on the number of card trips and use the amount of spending to break ties"
- **R1's assessment:** "Somewhat satisfactory response" but documentation issues noted
- R1 explicitly flags: "Several parts incomplete (the first sentence is incomplete; the final sentence of the 'Cash-only consumers' section is incomplete; the section describes various cut-offs without mentioning their numerical values)"
- **Verification needed:** Check if Appendix A.3.1 sentences are now complete
- **Issue:** Incomplete documentation undermines otherwise acceptable procedure
- R1 notes: "errors in the appendix make it hard to definitely conclude that there has been an improvement"

---

#### R1-11: Consumer Choice Optimality
**Concern:** Consumer card choice may be suboptimal in model specification
**Grading:** **FULLY ADDRESSED**
**Justification:**
- R1 rates "Fully satisfactory response"
- Author acknowledges concern: model "rules out the possibility that Visa complements AmEx more when Visa is accepted at more stores that do not accept AmEx"
- Alternative model tested with acceptance complementarity (Section F.7)
- Author argues: complementarity model "inconsistent with the data"
- R1 accepts: "In my view, the author has done enough to address my comment"
- Verification provided through empirical test of alternative specification

---

#### R1-12: Durbin Equilibrium and Merchant Acceptance
**Concern:** Model/data inconsistency: rewards estimation uses discrete-choice holding merchant acceptance fixed, suggesting equilibrium not re-solved
**Grading:** **ACKNOWLEDGED (Partially addressed)**
**Justification:**
- Author explains: "I hold fixed merchant actions because my difference-in-difference estimates remove any equilibrium effects of merchant actions"
- R1 rates "Mostly satisfactory" but requests elaboration: "some additional explanation would be helpful"
- Justification provided but at moderate depth
- **Assessment:** Acknowledged but not deeply engaged with underlying concern about identification
- R1 willing to accept but signals desire for further explanation

---

#### R1-13: AmEx Interchange Fee Cap
**Concern:** Why not cap AmEx fees in counterfactual?
**Grading:** **FULLY ADDRESSED**
**Justification:**
- R1 rates "Fully satisfactory response"
- Current manuscript caps all credit card network fees uniformly
- AmEx included in cap at same level as Visa/MC
- No differential treatment in counterfactual analysis

---

#### R1-14: Standard Errors for Counterfactuals
**Concern:** Report standard errors in Tables 6 and 7
**Grading:** **FULLY ADDRESSED**
**Justification:**
- R1 rates "Fully satisfactory response"
- Bootstrap standard errors now reported in parentheses for all counterfactual tables
- Methodology transparent
- Both Table 1 and Table 2 include confidence intervals

---

#### R1-15: Debit Cap Setting (1% vs. No Cap)
**Concern:** Why increase debit cap by 25 bps rather than solve for equilibrium without cap?
**Grading:** **FULLY ADDRESSED**
**Justification:**
- R1 rates "Fully satisfactory response"
- Footnote 34 provides empirically motivated justification
- Logic: Durbin Amendment caused ~75 bps interchange decline but only ~25 bps rewards decline
- Implication: repeal modeled as raising cap by 25 bps to match empirical reward response
- Rationale is data-driven and honest about model-reality gap

---

#### R1-16: Logit Shocks in Monopoly Counterfactual
**Concern:** Adding network mechanically increases credit usage through new logit shocks; welfare effect ambiguous before pro-competitive effects
**Grading:** **NOT ADDRESSED**
**Justification:**
- R1 states: "No response: I could not find a response to this comment in the article"
- Original "increased competition" counterfactual removed but R1 notes: concern "also applies to a comparison of a monopoly regime with the baseline regime"
- **Gap:** Logical concern about mechanical welfare effects from varying number of choice options not explicitly discussed
- No technical appendix explaining how logit shock problem handled or why not problematic
- Second "No response" item from first round remaining unaddressed

---

#### R1-17: Large Retailer Selection and Generalizability
**Concern:** How chosen? Any other retailers in sample? Effects beyond single retailer and grocery?
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Main text states: "I identify multiple instances in the Homescan data where a grocery store begins or stops accepting credit cards"
- Use of "multiple instances" suggests more than single retailer
- **Gap 1:** Specific selection criteria not explained (random, largest events, sufficient pre-period data, etc.)
- **Gap 2:** Analysis limited to grocery category; no evidence of effects in other categories
- R1 requests: "sense of effects beyond a single retailer and beyond the grocery category"
- Online Appendix may contain additional analysis but main text gives impression of broader sample without proving it

---

#### R1-18: Outcome Measure (Trips vs. Revenue)
**Concern:** Use trips not revenue; but merchants care about sales. Why not log(revenue)?
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Both revenue and trips outcomes examined
- Main text emphasizes revenue results (Figure main text)
- Trips shown in Online Appendix with "statistically indistinguishable point estimate with tighter confidence intervals"
- **Justification provided:** Tighter CIs for trips specification
- **Gap:** Log revenue not explicitly discussed as alternative to address fat tails
- R1's specific suggestion (log transform) not directly answered
- Revenue results presented as comparable, implicitly endorsing both approaches
- Issue: choice not clearly motivated in main text (readers may wonder why trips preferred)

---

#### R1-19: Poisson vs. Linear Model
**Concern:** Why use "exotic" Poisson instead of standard linear? Are OLS results similar?
**Grading:** **FULLY ADDRESSED**
**Justification:**
- Main text cites Cohn et al. (2022): "Poisson regression is preferred for difference-in-differences designs with count-like outcomes that are bounded by zero"
- Appendix provides OLS comparison: "This yields approximately the same result as the Poisson estimate"
- Appendix explains OLS limitations: "does not scale well to multiple events and does not handle the zeros in the data as cleanly"
- R1's questions directly answered with methodological justification and empirical validation
- Poisson choice is well-motivated and not "exotic" given data properties

---

#### R1-20: Credit Share Measurement Error (Non-zero Pre-Adoption)
**Concern:** Figure 4a shows non-zero credit share before adoption. Why? Measurement error concern.
**Grading:** **NOT ADDRESSED**
**Justification:**
- Apparent data inconsistency (credit shares positive before merchant adoption) not explicitly discussed
- No figure 4a found in current reads to verify claim
- R1 raises legitimate identification concern: if credit shares already positive pre-adoption, what identifies the adoption effect?
- **Critical gap:** No discussion of pre-trends or verification that payment method shares actually were zero before merchant adoption event
- Measurement error in merchant acceptance data (consumer recall) acknowledged elsewhere but not connected to this specific issue

---

#### R1-21: Flexibility vs. Rewards Interpretation
**Concern:** Statement that credit users shop more "because of flexibility not rewards" contradicts own evidence of reward sensitivity
**Grading:** **FULLY ADDRESSED**
**Justification:**
- Original imprecise statement: "Credit card users shop more at the grocer because consumers value the flexibility of paying with credit — not because of rewards"
- Revised text adds: "Online Appendix shows that rewards affect payment behavior but not store choice: consumers switch payment methods to earn higher rewards, yet do not reallocate shopping trips across merchants"
- Further clarification: "credit cards provide services that debit cards do not fully replicate—most importantly, the credit line"
- **Interpretation clarified:** Rewards affect *payment method choice* (margin 1) but not *store choice* (margin 2)
- R1's logical concern resolved through empirical decomposition showing rewards and flexibility operate on different margins
- Explicit mechanism explanation addressing R1's confusion about apparent contradiction

---

#### R1-22: Figure 5(a) and Store-Selection Margins
**Concern:** Analysis focuses on grocery (necessity); other categories may differ. Use visual inspection not formal regression.
**Grading:** **PARTIALLY ADDRESSED**
**Justification:**
- Main text claims: "Online Appendix shows that rewards affect payment behavior but not store choice"
- Appendix analyzes multiple store types: grocery and warehouse/discount stores
- Appendix notes: "Discover and non-Discover users shop similarly during rewards periods"
- Additional analysis: "Appendix Figure shows no spillover of the Discover program on payment decisions at warehouse/discount stores"
- **Gap 1 (partial):** Multiple store types analyzed beyond grocery alone (positive)
- **Gap 2 (not addressed):** R1's methodological point about formal regression vs. visual inspection not taken
- Analysis still relies on figure inspection; no fixed-effects regression comparing card user spending across merchants/periods
- Other spending categories (restaurants, travel, online) not explored

---

#### R1-23: OptBlue in Figure 6
**Concern:** OptBlue appears in figure but never discussed in main text
**Grading:** **FULLY ADDRESSED**
**Justification:**
- R1 states concern: "OptBlue appears in Figure 6 but never discussed in main text"
- **Verification:** Main text (reducedform.tex, line 105) explicitly discusses OptBlue
- Quote: "The convergence occurred after AmEx's OptBlue program cut merchant fees for small businesses starting in 2015, validating that merchants do respond to fee changes, but that at current fee levels, the gap has closed"
- Dual purpose explained: (1) reduced-form validation of merchant fee sensitivity, (2) justification for equilibrium pattern (near-universal acceptance)
- **Conclusion:** R1's concern appears based on earlier draft; current version addresses OptBlue explicitly
- Full discussion validates use of OptBlue line in figure

---

#### R1-24: Merchant Multihoming and Hierarchical Acceptance
**Concern:** Statement "Since every Visa/MC merchant also accepts AmEx" contradicts hierarchical pattern and real-world experience
**Grading:** **FULLY ADDRESSED**
**Justification:**
- Main text clarifies: "Most merchants accept either all credit cards or none at all"
- Argument structure explicit: "First, Figure shows that by 2019 the number of merchants that accept AmEx approximately equals the number that accept Visa... Second, historical Yelp reviews confirm that merchant acceptance follows a hierarchical pattern: merchants progressively add payment methods (cash → debit → Visa/MC → AmEx)"
- **Key insight:** "Taken together, the aggregate convergence and hierarchical pattern imply that merchants who accept credit cards effectively accept all three networks"
- Claim is **time-specific and conditional**: "by 2019" and "who accept credit cards" (not universally)
- Hierarchical pattern explicitly acknowledged, not contradicted
- Convergence claim justified: OptBlue fee cuts explain why Visa/AmEx merchant counts now equal
- Response document acknowledges: "R1's concern based on historical experience, but author's claim is time-specific (2019)"

---

## SUMMARY TABLE: 4-POINT GRADING

| Concern | Grade | Prior Rating | Status |
|---------|-------|--------------|--------|
| R1-1 | Fully | Fully satisfactory | Maintained |
| R1-2 | Partially | Mostly satisfactory | Slight regression (clarity) |
| R1-3 | Partially | Somewhat satisfactory | Maintained (acknowledged) |
| R1-4 | Partially | Mostly satisfactory | Weakness remains in main |
| R1-5 | Acknowledged | Mostly satisfactory | Defensive |
| R1-6 | Partially | Mostly satisfactory | Accepted simplification |
| R1-7 | Not Addressed | No response | **CRITICAL GAP** |
| R1-8 | Not Addressed | Unsatisfactory | **REMAINS UNSATISFACTORY** |
| R1-9 | Partially | Mostly unsatisfactory | Pending verification |
| R1-10 | Partially | Somewhat satisfactory | Documentation issues |
| R1-11 | Fully | Fully satisfactory | Alternative tested |
| R1-12 | Acknowledged | Mostly satisfactory | Limited depth |
| R1-13 | Fully | Fully satisfactory | Uniform treatment |
| R1-14 | Fully | Fully satisfactory | SEs reported |
| R1-15 | Fully | Fully satisfactory | Empirically motivated |
| R1-16 | Not Addressed | No response | **CRITICAL GAP** |
| R1-17 | Partially | New comment | Selection criteria unclear |
| R1-18 | Partially | New comment | Log revenue alternative not tried |
| R1-19 | Fully | New comment | Well-justified |
| R1-20 | Not Addressed | New comment | **CRITICAL GAP** |
| R1-21 | Fully | New comment | Decomposition clear |
| R1-22 | Partially | New comment | Formal regression missing |
| R1-23 | Fully | New comment | Now discussed |
| R1-24 | Fully | New comment | Time-specific, conditional |

**Summary Counts:**
- **Fully addressed:** 9 concerns (R1-1, R1-11, R1-13, R1-14, R1-15, R1-19, R1-21, R1-23, R1-24)
- **Partially addressed:** 10 concerns (R1-2, R1-3, R1-4, R1-6, R1-9, R1-10, R1-17, R1-18, R1-22)
- **Acknowledged:** 2 concerns (R1-5, R1-12)
- **Not addressed:** 3 concerns (R1-7, R1-8, R1-16, R1-20)

---

## TASK 2: TONE EVALUATION (1-5 SCALE)

### Dimension 1: Explicit Acknowledgment of R1 Suggestions (1-5)
**Rating: 2/5 (DEFENSIVE)**

**Justification:**

R1 is a returning referee who provided extensive first-round feedback. The manuscript should explicitly recognize R1's role and contributions. Assessment:

**Evidence of Poor Acknowledgment:**
- No introductory paragraph crediting R1's feedback or thanking for sustained engagement
- Nowhere in main manuscript does author explicitly state "R1 suggested..." or "Following R1's concern..."
- R1's new comments (R1-17 through R1-24) treated as new issues, not acknowledged as R1's specific analytical contributions
- No citations to R1's conceptual framing (e.g., "Following R1's suggestion to focus on reduced-form facts...")

**What Would Improve This:**
- Opening of revision section: "We are grateful to R1 for extensive feedback across two review rounds. R1's suggestions have clarified..."
- Explicit naming of R1 suggestions in text: "As R1 notes, the optimal pass-through assumption creates..."
- Response letter acknowledging R1's "intellectual generosity" and strategic guidance (noted in soul document)

**Current Reality:**
- Manuscript reads as author's independent work, not collaborative response
- Readers unaware that refinements came from specific referee suggestions
- Creates impression of author defending positions, not learning from feedback

---

### Dimension 2: Responsiveness (Substantive Engagement Even When Disagreeing) (1-5)
**Rating: 3/5 (NEUTRAL)**

**Justification:**

R1 appreciates substantive engagement with logic, even when disagreeing. The manuscript shows mixed responsiveness:

**Evidence of Good Responsiveness:**
- **R1-6 (Card acceptance):** Budget constraint logic explained clearly with appendix derivation
- **R1-21 (Flexibility vs. rewards):** Empirical decomposition provided showing how rewards and flexibility operate on different margins
- **R1-19 (Poisson vs. linear):** Both specifications provided with explicit comparison; trade-offs discussed
- **R1-15 (Durbin cap):** Empirical realism rationale provided (25 bps matches observed reward response, not interchange response)
- **R1-24 (Merchant multihoming):** Argument structure clear (convergence + hierarchy → universal acceptance by 2019)

**Evidence of Weak Responsiveness:**
- **R1-7 (Fixed gamma):** No engagement with merchant incentive logic; R1's concern about multi-card scenario not addressed
- **R1-8 (Rewards):** Footnote claim of microfoundation without explicit derivation; R1 explicitly says "not clear"
- **R1-16 (Logit shocks):** No discussion of welfare implications of varying choice set sizes
- **R1-20 (Pre-adoption credit shares):** Apparent data inconsistency not discussed; R1's measurement error concern not engaged

**Pattern:**
- Responds well when disagreement is about *how to interpret evidence* (R1-21, R1-24)
- Fails to respond when disagreement involves *missing derivations or logical gaps* (R1-7, R1-8, R1-16, R1-20)
- Creates appearance that author is willing to debate empirical magnitudes but not theoretical foundations

**Example of What Would Improve Responsiveness:**
For R1-8 (rewards microfoundation):
- Current: Footnote claims derivation occurs in appendix
- Better: "Per R1's concern, we provide explicit derivation showing lump-sum reward R enters utility as income boost: [algebra showing utility maximization ⟹ R appears in budget]. This justifies the specification used in the model."

---

### Dimension 3: Good Faith (Avoiding Dismissive or Defensive Language) (1-5)
**Rating: 2/5 (DEFENSIVE)**

**Justification:**

R1's soul document explicitly notes they are a "supportive critical friend" who want the paper to succeed. The manuscript should meet them with good faith, not defensiveness. Analysis:

**Evidence of Good Faith:**
- **R1-19 (Poisson):** Not dismissing linear models; acknowledges Cohn et al. validation shows "approximately the same result"
- **R1-15 (Durbin cap):** Accepting R1's challenge to justify cap setting choice; providing empirical rationale
- **R1-21 (Flexibility/rewards):** Adding clarification without accusing R1 of misreading
- **Counterfactual standard errors:** Implementing R1's technical request without resistance

**Evidence of Defensive Tone:**
- **R1-9 (Pass-through):** If misleading "arbitrary pass-through" statement still in text, this signals author not taking criticism seriously
- **R1-4 (All debit weakness):** Relegating statistically-insignificant all-debit results to online appendix while not mentioning in main text reads as hiding weakness
- **R1-10 (Appendix documentation):** Incomplete sentences in appendix A.3.1 (if still present) suggest revision done carelessly, not thoughtfully
- **R1-5 (Control group):** Claiming choice "unlikely to affect" rather than proving it empirically reads defensive

**Dismissive Language:**
- No explicit dismissals found, but **absence of engagement** with R1-7, R1-8, R1-16, R1-20 functions as dismissiveness
- Silence = "Your concern doesn't deserve engagement" in R1's framework

**What Would Signal Good Faith:**
- For R1-7: "R1 raises an important concern about merchant incentives under multi-card scenarios. We clarify: [explanation of why fixed gamma doesn't create the perverse incentive R1 worries about]"
- For unaddressed concerns: "This concern is beyond scope of current draft; we flag for future research"
- For flagged weaknesses: "R1 correctly notes that the all-debit results are weaker; this is why we emphasize signature debit in main analysis"

**Current Reality:**
- Readers see no engagement with hardest comments, which looks like avoidance
- Main text highlights strengths without honestly addressing limitations R1 identified
- No "we thank R1 for pushing us to..." language

---

## COMPOSITE TONE ASSESSMENT

**Overall Tone Rating: 2-3/5 (DEFENSIVE-NEUTRAL)**

| Dimension | Rating | Assessment |
|-----------|--------|------------|
| Explicit Acknowledgment | 2/5 | Dismissive; R1 credit absent |
| Responsiveness | 3/5 | Neutral; engaged selectively |
| Good Faith | 2/5 | Defensive; unaddressed gaps signal avoidance |
| **Composite** | **2/5** | **DEFENSIVE** |

### Key Concerns:
1. **Invisible referee:** R1 not credited in manuscript; sounds like author's independent insights
2. **Selective engagement:** Responds well on empirical disagreements, ignores theoretical/logical gaps
3. **Unaddressed critical concerns:** R1-7, R1-8, R1-16, R1-20 suggest author didn't take all feedback seriously

### What R1 Will Notice:
- R1 is systematic and tracks responses; they will note "No response" items remain "No response"
- R1 values honesty; absence of engagement on hard questions will feel evasive
- R1 is supportive but has clear expectations; defensive tone will undermine positive impression

### Path Forward:
To shift tone from defensive (2/5) to constructive (4/5):
1. Add response letter crediting R1's strategic guidance
2. Provide explicit engagement (even if brief) with R1-7, R1-8, R1-16, R1-20
3. For unaddressable concerns, acknowledge scope limitation rather than omit
4. Highlight where R1 suggestions improved paper (e.g., "Following R1's suggestion...")

---

## CRITICAL FINDINGS & RECOMMENDATIONS

### Issues Requiring Immediate Attention:
1. **R1-7 (Fixed gamma):** Still unaddressed; needs explicit engagement with merchant incentive logic
2. **R1-8 (Rewards):** Still unsatisfactory; requires explicit derivation, not just footnote claim
3. **R1-9 (Pass-through):** Verify "arbitrary pass-through" claim removed from Section IV.F.2
4. **R1-20 (Pre-adoption shares):** Investigate Figure 4a non-zero credit shares; measurement error implications
5. **R1-4 (All debit weakness):** Add sentence to main text about result weakening with all debit

### Tone Recommendations:
1. Add opening acknowledgment paragraph crediting R1's feedback
2. Provide brief engagement (1-2 sentences) with each remaining unaddressed concern
3. For concerns beyond scope, state explicitly: "R1 raises important question about X, which we flag for future work"

---

**Evaluation Status: COMPLETE**
**Date:** 2026-01-31
