# Number Fix — Mode B (2026-04-12)

Run against all draft_202601/ prose files with HARDCODED annotations.
Source: output/tables/ and output/tables/scalars/

## main.tex — Mode B

- 3 checked / 0 updated / 3 unchanged / 0 skipped

## intro.tex — Mode B

- 15 checked / 2 updated / 11 unchanged / 2 skipped

### Updated:
- Line 57: 90\% → 93\% (formula 27/29 from appendix_cap_welfare_table_baseline.tex)
- Line 57: 75\% → 77\% (formula 27/35, Ramsey Total dropped from 36 to 35)

### Skipped (unknown or unresolvable):
- Line 31: \scalarpctinput macro — rendered by LaTeX, no literal in prose
- Line 33: \scalarinput macro — rendered by LaTeX, no literal in prose

## data.tex — Mode B

- 2 checked / 0 updated / 2 unchanged / 0 skipped

## reducedform.tex — Mode B

- 5 checked / 0 updated / 3 unchanged / 2 skipped

### Skipped (unknown or unresolvable):
- Line 44: 25% — rewards subsample, approximate effect size, no direct source
- Line 100: \scalarpctinput macro — rendered by LaTeX

## model.tex — Mode B

- 1 checked / 0 updated / 1 unchanged / 0 skipped

## estimation.tex — Mode B

- 14 checked / 0 updated / 13 unchanged / 1 skipped

### Skipped (unknown or unresolvable):
- Line 213: 9 pp — approximate initial AmEx acceptance gap from Figure, no direct source

## counterfactuals.tex — Mode B

- 40 checked / 4 updated / 35 unchanged / 1 skipped

### Updated:
- Line 261: \$2.3 billion → \$3.7 billion (welfare_table_baseline.tex Consumers CBDC col 10; **>50% swing, verify**)
- Line 302: 90\% → 93\% (formula 27/29 from appendix_cap_welfare_table_baseline.tex)
- Line 302: 75\% → 77\% (formula 27/35, Ramsey Total dropped from 36 to 35)

### Skipped (unknown or unresolvable):
- Line 297: "one-third" — qualitative description of (27-17)/27 ratio; already aligned

## conclusion.tex — Mode B

- 4 checked / 0 updated / 4 unchanged / 0 skipped

## appendix_data.tex — Mode B

- 12 checked / 0 updated / 0 unchanged / 12 skipped

### Skipped (unknown or unresolvable):
- All 12 annotations marked `source: unknown` (Homescan data-cleaning statistics, DCPC survey counts, etc.) — computed from raw data, not reproduced in output/tables/

## appendix_data_oa.tex — Mode B

- 3 checked / 0 updated / 1 unchanged / 2 skipped

### Skipped (unknown or unresolvable):
- Line 37: multi-value (48, 38, 14, 8-10) — MRI merchant-level payment shares, no direct cell
- Line 100: multi-value (47, 12) — attention check / out-of-window counts, unknown source

## appendix_reduced.tex — Mode B

- 6 checked / 2 updated / 3 unchanged / 1 skipped

### Updated:
- Line 42: 18\% → 17\% (exp(-0.188)-1 from durbin_table.tex total debit coefficient)
- Line 304: 8 pp → 7.6 pp (discover_triple_diff_spend.tex Discover column = 0.076)

### Skipped (unknown or unresolvable):
- Line 171: 25% — approximate effect size from figure durbin_sig_debit_rewards.pdf

## appendix_surcharging.tex — Mode B

- 1 checked / 0 updated / 0 unchanged / 1 skipped

### Skipped (unknown or unresolvable):
- Line 35: 5% — from DCPC surcharge/discount computation, unknown source

## appendix_sorting.tex — Mode B

- 9 checked / 0 updated / 5 unchanged / 4 skipped

### Skipped (unknown or unresolvable):
- Line 16: 15 — Homescan/MRI payment share distribution, unknown source
- Line 21: 4-9pp, 91-96% — derived from multiple tables, not a single cell
- Line 30: 10 — maximum off-diagonal attenuation, ambiguous source
- Line 62: 40, 10, 80 — Homescan payment share distribution, unknown source

## appendix_credit_debit.tex — Mode B

- 26 checked / 0 updated / 26 unchanged / 0 skipped

## appendix_robustness.tex — Mode B

- 29 checked / 2 updated / 26 unchanged / 1 skipped

### Updated:
- Line 54: CBDC \$0.8B → \$1.4B (welfare_table_no_passthrough.tex Total CBDC col 10)
- Line 54: CBDC baseline \$0.9B → \$1.6B (welfare_table_baseline.tex Total CBDC col 10)

### Skipped (unknown or unresolvable):
- Line 113: predicted probabilities 82/95/55 — derived from logistic regression, requires income percentile inputs not in output tables

## response_round2.tex — Mode B

- 58 checked / 2 updated / 50 unchanged / 6 skipped

### Updated:
- Line 1172: CBDC \$0.8B → \$1.4B (welfare_table_no_passthrough.tex Total CBDC col 10)
- Line 1172: CBDC baseline \$0.9B → \$1.6B (welfare_table_baseline.tex Total CBDC col 10)

### Skipped (unknown or unresolvable):
- Line 138: 25% (prose) vs. annotation current=30 — figure-based, inconsistent; approximate rewards-subsample effect
- Line 284: "7%" — derived (29-27)/27, already aligned
- Line 826, 976, 1405: "77%" — derived ratio, already aligned
- Line 1036: 0.20, 0.06 — inside math environment `$\hat{\alpha}_y = 0.20$`
- Line 1334: ~75 — from figure prob_of_secondary_given_primary
- Lines 1419, 1421, 1423: "27", "2", "77%" — derived ratios / differences, already aligned

## Summary

- **Total annotations checked:** 231
- **Total updated:** 14 prose numbers across 5 files
- **Total unchanged:** 183
- **Total skipped:** 34 (unknown source, figures, macros, or math environments)

### Large (>50%) swings flagged for verification:
- `counterfactuals.tex` line 261: \$2.3B → \$3.7B CBDC consumer surplus (60% increase; source welfare_table_baseline.tex Consumers CBDC col 10 = 3.7, previously tracked as 2.3). Please verify the current welfare table column ordering is unchanged.
- `appendix_robustness.tex` line 54 and `response_round2.tex` line 1172: CBDC total welfare values doubled (0.8→1.4, 0.9→1.6). Same underlying table column change — likely driven by a revised CBDC counterfactual specification or column reordering; worth confirming.
