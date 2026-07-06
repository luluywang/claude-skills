## [appendix_reduced.tex]

### Summary

This appendix is human-written with careful argumentation, strong mechanisms, and appropriate claim-evidence matching. The writing shows:
- Proper mechanism explanation throughout (not results-first)
- Careful use of verbs ("suggests," "shows," "rules out") matched to evidence type
- Varied paragraph and sentence structure
- Clear causal chains even in complex sections
- Proper hedging discipline

No Critical or High severity AI patterns detected.

### Medium Severity

- [ ] Lines 142-147: Multi-item description **`[Medium]`**

**Comment:** Lines 142-147 present three alternative mechanisms in rapid succession without individual elaboration. This "Three Explanations" template is LLM-typical, though in this context it's functional.

**Original:**
```
The debit volume decline could reflect three mechanisms: bank switching by consumers fleeing Durbin-exposed institutions, a pull toward credit from improved large-bank rewards, or within-bank substitution driven by loss of debit rewards.
```

**Proposed Revision:**
```
The debit volume decline could reflect three mechanisms. First, bank switching by consumers fleeing Durbin-exposed institutions. Second, a pull toward credit from improved large-bank rewards. Third, within-bank substitution driven by loss of debit rewards.
```

**Why better:** Breaks the rule-of-three list into separate statements, allowing each mechanism its own introductory heft and making the subsequent evidence for each clearer.

---

### Low Severity

- [ ] Line 243-244: Bare demonstrative **`[Low]`**

**Comment:** "The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale (Online Appendix~\ref{sec:oa-credit-debit})."

The parenthetical cross-reference is long (~15 words) and could be a footnote to streamline the sentence.

**Original:**
```
The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale (Online Appendix~\ref{sec:oa-credit-debit}).
```

**Proposed Revision:**
```
The remaining gain comes from debit and cash in equal amounts ($-0.7$ pp each; Table~\ref{tab:discover-triple-diff}), so debit and cash appear equally good substitutes for credit at the point of sale.\footnote{For analysis of credit-debit substitution margins, see Online Appendix \ref{sec:oa-credit-debit}.}
```

**Why better:** Footnotes minor cross-references, keeping the main argument tighter and the supporting detail accessible without inline clutter.

---

**Overall Assessment:** The appendix demonstrates strong human writing. Mechanisms are explicit, evidence is substantial, and claims are appropriately scoped. No systematic AI tells detected.

**Total Flags: 2** (both are stylistic suggestions, not revisions required)
