# AI Detection Review

## NOTE ON DEDUPLICATION
Many AI pattern findings have been consolidated into simplifications.md, which contains specific rewrite recommendations. Items below represent unique AI pattern identifications; those with corresponding simplifications.md entries are marked [Also in simplifications.md].

## [intro.tex]

RESOLVED: Text has been rewritten. No outstanding AI detection issues remain.

## [institutional_details.tex]

RESOLVED: Section has been substantially rewritten and reorganized. Regulatory examples now follow clear framing of payment network structure. While "Regulatory shocks best reveal" (line 33) remains slightly editorial, it is now preceded by concrete explanation of network mechanics and followed by specific evidence from Australia and EU regulation. The improved structure addresses most rhetorical concerns.

## [reducedform.tex]

RESOLVED: Formulaic "First...Second" inventory structures have been removed. Text now flows naturally without explicit numbering patterns. Introduction (lines 4-6) clearly frames three facts. Methodological discussions have been integrated into narrative. LLM blocks remain at lines 38, 40, 42 but contain substantive explanations rather than merely scaffolding. Transitions to appendix sections are now more purposeful. Section is substantially improved.

## [data.tex]

✓ RESOLVED: LLM tags stripped from survey sources (lines 58, 66). MRI-Simmons moved to appendix (removed from main text). Added transition explaining multi-homing relevance (line 49).

## [estimation.tex]

✓ RESOLVED: Dense identification sentence split (line 52). "Reveals" language replaced with RT framework leverage (lines 53-54). Diversion table commentary tightened to connect to mechanism (lines 101-106).

## [appendix_tables.tex]

LOW PRIORITY: This file is primarily structural (table inputs and metadata). Repetitive variable definitions in table notes are standard documentation style, not necessarily AI-generated. The use of parallel structure in definitions is conventional and appropriate for reference documentation. No substantive prose to review. Low AI risk.

## [conclusion.tex]

RESOLVED: Text has been substantially rewritten. Problem definition now clearly established in line 4. Policy solutions presented with specific welfare impacts. Commented-out speculation has been removed (only lines 11-18 with comments remain, which are explicitly marked as deferred questions). Structure is much improved. No outstanding issues remain.

## [appendix_surcharging.tex]

RESOLVED: No AI-typical patterns detected. Text shows strong economic reasoning and clear exposition. Content is author-written with clear domain expertise. No issues remaining.

## [appendix_figures.tex]

✓ RESOLVED: Figure placeholder at line 39 has been replaced with actual figure `model_share_fit_baseline.pdf`. Figure is now active.

## [counterfactuals.tex]

✓ RESOLVED: Table reading redundancy removed (lines 26-33). Prisoner's dilemma explanation expanded and clarified (lines 101-108). Public options LLM block stripped (lines 152-153). Substantive economic reasoning preserved throughout.

## [appendix_model.tex]

MODERATE: Technical appendix with dense mathematical exposition. Some sections lack intuitive explanation before formal derivations. LLM meta-commentary at line 82 remains but is not high priority for mathematical appendices. The heavy definitional language is characteristic of technical documentation rather than AI generation per se. Core economic reasoning appears sound. Issues are primarily pedagogical (adding intuition before formal work) rather than indicative of problematic LLM content.

## [appendix_estimation.tex]

LOW PRIORITY: Technical appendix with standard methodology exposition structure. Repetitive use of "The model analog(s)" is formulaic but appropriate for this type of documentation. Voice issues noted are minor and consistent with how technical identification sections are typically written. Core economic logic is sound. Issues are editorial rather than indicative of problematic content.

## [appendix_data.tex]

LOW PRIORITY: Data appendix with standard methodological exposition. Repetitive "I" openings and parallel exclusion logic are typical of data documentation rather than AI artifacts. Conditional hedging language is appropriate given data construction involves empirical choices and thresholds. Text reads as technical documentation rather than argumentative prose, which is appropriate for this section type. No high-priority AI issues identified.


## [appendix_model_oa.tex]

✓ FULLY RESOLVED:
- Line 130: TODO citation replaced with \textcite{Bilal.Lhuillier2021} (trembles/equilibrium selection)
- Lines 147-165: Algorithm section — stripped LLM tags, enumerated steps preserved as appropriate for technical appendix

## [model.tex]

✓ RESOLVED: Model opener rewritten (lines 4-5). Credit-debit segmentation restructured with empirical lead (lines 242-252). Price coherence section expanded with menu cost logic (lines 285-291). Fixed costs section rewritten with intermediate cap result (lines 266-272). Merchant heterogeneity and Issuers sections tightened. Remaining LLM blocks contain substantive content; economic reasoning is sound.
## [appendix_sorting.tex]

LOW TO MODERATE: Core economic content (covariance matrices, sufficient statistics, welfare calculations) is sophisticated and appears human-authored. Organizational issues are primarily pedagogical—results-first opening could build more narrative tension, and methodological discussions could be better integrated. Hedging language ("substantial," "straightforward") is present but not excessive. No strong AI signatures detected. Issues are structural improvements rather than fundamental problems.

## [appendix_mri.tex]

RESOLVED: No AI-typical patterns detected. Text shows expert domain knowledge and clear exposition. Enumeration is appropriate for describing discrete methodological steps. No outstanding issues.

## [appendix_reduced.tex]

MODERATE: Multiple LLM blocks present. Topic-statement structure creates list-like feel in some sections. Defensiveness and qualification language could be tightened. Line 282 (ChatGPT-4o API mention) is notable—while disclosure of AI tool use is appropriate, should verify that AI-generated categories/interpretations are properly validated. Several \begin{llm} blocks could be better integrated. Structure could be improved but economic reasoning is sound. Priority: review ChatGPT-based analysis validation; improve narrative flow of robustness checks.

## [appendix_robustness.tex]

✓ OPENING RESOLVED (lines 4-7): Rewritten to lead with purpose (robustness testing, policy alternatives, social optimum comparison) rather than results. Reference to 120 bps intermediate cap corrected; framed as "more policy-relevant" to distinguish from the main paper's tourist-test cap.

✓ CROSS-SPEC COMPARISON RESOLVED (lines 225-229): Removed dense enumeration paragraph that listed results spec-by-spec. Let table speak for itself; readers can discover findings independently.

✓ INTERMEDIATE FEE CAP SECTION RESOLVED (former lines 243-276): Entire section rewritten. Removed LLM tags, meta-commentary about fixed costs and external validation, editorial language ("erosion", "partial preservation"). Now leads with core finding (half the fee reduction, 90% of welfare), reports numbers cleanly, eliminates table-reading-aloud structure. Consolidated three paragraphs into focused discussion.

✓ COMPARISON TO SOCIAL OPTIMUM SECTION RESOLVED (former lines 278-305): Removed LLM tags and entire editorial commentary (former lines 300-304). Streamlined to: problem statement → planner's constraints → optimal prices and welfare findings. Eliminated explanatory paragraphs about why the gap exists and generalizations about regulatory design. Let 88% efficiency result stand alone.

✓ [appendix_robustness.tex] FULLY RESOLVED: All LLM blocks removed, opening paragraph rewritten, intermediate cap section rewritten with correct numbers, social optimum section streamlined. No outstanding issues remain.
