# Number Fix Report — 2026-04-13

Ran Mode A (annotate new) + Mode B (refresh existing) across main.tex and all subfiles.

## Headline: Mode B found ZERO value mismatches

Every existing `% HARDCODED[...]` annotation matched its current source value at 2 sig figs. No prose numbers were changed. This means the last pipeline rerun and the current prose are consistent.

## Mode A: new annotations added

| File | Line | Value | Source |
|---|---|---|---|
| data.tex | 59 | 4% | scalar `amex_uncond_share` |
| appendix_model_oa.tex | 211 | \$8B | `welfare_table_baseline.tex` row Total col 4 |
| appendix_credit_debit.tex | 234 | 30–60 bps | `param_tab_network_extension_half_kappa.tex` range |
| appendix_credit_debit.tex | 285 | ~20% ("a fifth") | **unknown** — manual review |
| appendix_surcharging.tex | 27 | 40 states | CONSTANT (legal fact) |
| appendix_reduced.tex | 219 | ~40% | **unknown** — MRI-Simmons figure |
| intro.tex | 20 | 10× ("ten times") | **unknown** — derived ratio |
| appendix_data.tex | 68 | 96 | scalar `share_card_for_card_cons` (upgraded from unknown) |

## Unmatched — need manual source

These three need you to fill in the source manually or confirm they're CONSTANT:

1. **intro.tex:20** — "consumers are ten times more sensitive to rewards than merchants are to fees." Agent flagged this as an approximate ratio (~3.7/0.4) without a single source.
2. **appendix_reduced.tex:219** — "around 40\%" of small-bank customers holding large-bank credit cards. Agent said this comes from an MRI-Simmons figure, not a scalar/table.
3. **appendix_credit_debit.tex:285** — "about a fifth" of Amex consumers holding debit. Agent said this comes from a figure, not a pipeline table.

## Files with no changes

- main.tex — 3 abstract annotations verified ✓
- institutional_details.tex — no data numbers in prose (all math or CONSTANT)
- conclusion.tex — 4 annotations verified ✓
- reducedform.tex — 6 annotations verified ✓
- model.tex — 1 annotation verified ✓
- estimation.tex — 10 annotations verified ✓
- counterfactuals.tex — 35 annotations verified ✓
- appendix_data_oa.tex — 3 annotations verified ✓
- appendix_robustness.tex — 17 annotations verified ✓
- appendix_sorting.tex — 7 annotations verified ✓
- appendix_model.tex, appendix_estimation.tex — math-only or design constants
- appendix_tables.tex, appendix_figures.tex — wrappers, no prose numbers
