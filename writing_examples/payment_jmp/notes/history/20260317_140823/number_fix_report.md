# Number Fix Report — Mode A

Run date: 2026-03-16

## Summary

Annotated all hard-coded numbers across main.tex and 19 subfiles.

- **Already annotated**: main.tex (3), intro.tex (13), data.tex (5), institutional_details.tex (7), reducedform.tex (5), counterfactuals.tex (40+), conclusion.tex (4), estimation.tex (3), appendix_reduced.tex (6), appendix_robustness.tex (50+), response_round2.tex (30+)
- **New annotations added this pass**: ~80 annotations across all files

---

## [model.tex] — Mode A

- 1 number annotated as CONSTANT
- 0 numbers annotated as HARDCODED

### Details:
- Line 336: `5\%` → `% CONSTANT: from Stavins (2018), external survey finding`

---

## [intro.tex] — Mode A

- 3 numbers newly annotated (1 CONSTANT, 2 HARDCODED)
- 13 numbers already annotated

### Newly annotated:
- Line 8: `\$120 billion` → `% CONSTANT: from Nilson (2020a), aggregate merchant fee bill`
- Line 56: `120 basis points` → `% CONSTANT: counterfactual design choice`
- Line 100: `\$11 billion` → `% HARDCODED[table: welfare_table_baseline.tex, row: "Consumers", col: 6] current=-11`

---

## [data.tex] — Mode A

- 0 newly annotated (all key numbers already annotated)
- "around one-quarter" on line 69 is a vague characterization, not a precise number — skipped

---

## [reducedform.tex] — Mode A

- 1 number newly annotated as HARDCODED

### Newly annotated:
- Line 52: `30\%` → `% HARDCODED[tab:durbin-event-study: last signature debit coefficient, rounded] current=30`

---

## [estimation.tex] — Mode A

- 12 numbers newly annotated (7 CONSTANT, 5 HARDCODED)
- 3 numbers already annotated

### Newly annotated:
- Line 24: `75 bps` → `% CONSTANT: approximate Durbin interchange reduction, from regulatory data`
- Line 26: `25 bps` → `% CONSTANT: from Hayashi (2012), external estimate`
- Line 27: `25 bps` → `% CONSTANT: modeling choice based on Hayashi (2012)`
- Line 64: `4.3 pp` → `% HARDCODED[scalar: data_multihome_gradient] current=4.3`
- Line 75: `98\%` → `% HARDCODED[scalar: kilts_share_trips_cc_accept] current=98`
- Line 148: `3.5\%`, `0.3\%`, `0.3\%` → `% HARDCODED[table: diversion_baseline.tex]` (3 entries)
- Line 173: `4.60`, `4.00`, `3.80` → `% HARDCODED[table: param_tab_cons_baseline.tex]` (3 entries)
- Line 183: `45\%`, `30\%` → `% HARDCODED[table: baseline_equilibrium_baseline.tex]`
- Line 203: `$9$` → `% HARDCODED[source: unknown, approximate initial AmEx acceptance gap]`
- Line 204: `90\%`, `99\%` → `% CONSTANT: from AmEx 2019 annual report`
- Lines 216-217: external estimates → `% CONSTANT: from Higgins (2022), Berg et al. (2024), Edmond et al. (2022), Sraer & Thesmar (2023)`
- Line 224: cost estimates → `% CONSTANT: from Lowe (2005), Mukharlyamov & Sarin (2025), NACHA (2017), Visa (2020)`

---

## [appendix_data.tex] — Mode A

- 14 numbers newly annotated (6 CONSTANT, 8 HARDCODED)

### Newly annotated:
- Line 11: `roughly half` → `% CONSTANT: from CUToday (2016)`
- Lines 14-16: `\$2 billion`, `\$200 billion`, `50\%` → `% CONSTANT: design choices`
- Lines 30-31: `80\%`, `1.74\%`, `1.85\%` → `% HARDCODED[source: unknown, from bank annual reports]`
- Lines 34-37: `38 bps`, `20 bps`, `15 bps`, `30 bps` → `% HARDCODED / % CONSTANT` (mixed)
- Line 41: `100,000` → `% CONSTANT: NielsenIQ panel design`
- Lines 46-50: `28.9\%`, `19.7\%`, `8\%`, `91\%` → `% HARDCODED[source: unknown, from Homescan]`
- Lines 53-54: `0.7\%`, `15.7\%`, `1.5\%` → `% HARDCODED[source: unknown, from Homescan]`
- Line 60: `24 months` → `% CONSTANT: design choice`
- Lines 66-68: `2.1\%`, `21\%` → `% HARDCODED[source: unknown, from DCPC]`
- Line 76: `788`, `472`, `316` → `% HARDCODED[source: unknown, from survey]`

---

## [appendix_estimation.tex] — Mode A

- 3 numbers annotated as CONSTANT

### Details:
- Line 11: `100` bootstrap samples → `% CONSTANT: design choice`
- Line 12: `five` blocks → `% CONSTANT: design choice`
- Line 28: `25 bps` → `% CONSTANT: modeling choice based on Hayashi (2012)`

---

## [appendix_model.tex] — Mode A

- No numbers to annotate. File is entirely math environments and equations.

---

## [appendix_model_oa.tex] — Mode A

- 4 numbers annotated as CONSTANT

### Details:
- Line 140: `$\kappa_1 = 0.5$` → `% CONSTANT: calibration exercise parameter`
- Line 305: `2,000` draws → `% CONSTANT: simulation draw count, design choice`
- Line 309: `2` quadrature points → `% CONSTANT: design choice`
- Line 318: `32` bundles → `% CONSTANT: 2^5 payment bundles from 5 methods`

---

## [appendix_data_oa.tex] — Mode A

- 5 annotations added (3 CONSTANT, 2 HARDCODED)

### Details:
- Lines 10-11: `25,000`, `50,000`, `214` → `% CONSTANT: MRI panel/survey design`
- Line 25: `\$10 billion` → `% CONSTANT: Durbin Amendment statutory threshold`
- Line 33: `48\%`, `38\%`, `14\%`, `8-10 pp` → `% HARDCODED[table: mri_summary_statistics.tex]`
- Line 48: `95.8\%`, `96.3\%` → `% HARDCODED[table: yelp_dcpc_comparison.tex]`
- Line 59: `47`, `12` → `% HARDCODED[source: unknown, from survey data cleaning]`

---

## [appendix_surcharging.tex] — Mode A

- 2 annotations added (1 CONSTANT, 1 HARDCODED)

### Details:
- Line 35: `5\%` → `% HARDCODED[source: unknown, from DCPC surcharge computation]`
- Lines 144-145: `2-3\%` → `% CONSTANT: approximate interchange fee range`

---

## [appendix_sorting.tex] — Mode A

- 8 annotations added (1 CONSTANT, 7 HARDCODED)

### Details:
- Line 15: `15\%` → `% HARDCODED[source: unknown, from payment share distribution]`
- Line 19: `4-9 pp`, `91-96\%` → `% HARDCODED[table: mri/kilts_appendix_welfare_ratio.tex]`
- Line 27: `10\%` → `% HARDCODED[table: welfare_ratio, max off-diagonal]`
- Line 33: `214` → `% CONSTANT: MRI survey design`
- Line 56: `40\%`, `10\%`, `80\%` → `% HARDCODED[source: unknown, Homescan]`
- Lines 194-196: `1.023`, `0.986` → `% HARDCODED[table: mri_appendix_welfare_ratio.tex]`
- Lines 198-200: `4\%`, `9\%`, `91-96\%` → `% HARDCODED[table: welfare_ratio tables]`

---

## [appendix_tables.tex] — Mode A

- No numbers to annotate. File contains only table includes and captions.

---

## [appendix_figures.tex] — Mode A

- No numbers to annotate. File contains only figure includes and captions.

---

## Unmatched Numbers (Manual Review Needed)

These HARDCODED numbers have `source: unknown` and need manual source identification:

| File | Number | Context |
|------|--------|---------|
| appendix_data.tex | 80% | Bank coverage of US credit card volume |
| appendix_data.tex | 1.74%, 1.85% | Volume-weighted average rewards rates |
| appendix_data.tex | 38 bps | AmEx annual fee as share of volume |
| appendix_data.tex | 28.9%, 19.7% | Homescan sample restriction percentages |
| appendix_data.tex | 8%, 91% | Non-cash consumer restriction, trip-spend correlation |
| appendix_data.tex | 0.7%, 15.7%, 1.5% | Store-level sample restrictions |
| appendix_data.tex | 2.1%, 21% | DCPC check transaction percentages |
| appendix_data.tex | 788, 472, 316 | Survey sample sizes (note: do not match survey_num_credit=357 / survey_num_debit=383) |
| appendix_surcharging.tex | 5% | DCPC surcharge/discount rate |
| appendix_sorting.tex | 15% | 90th percentile debit/cash share |
| appendix_sorting.tex | 40%, 10%, 80% | Homescan credit sales distribution |
| appendix_data_oa.tex | 47, 12 | Survey attention check drops |
| estimation.tex | 9 | Approximate initial AmEx acceptance gap from figure |

---

# Number Fix Report — Mode B

Run date: 2026-03-17

## Summary

- **222 annotations checked** across 14 tex files
- **15 numbers updated** (prose + annotation)
- **2 annotation-only updates** (prose uses macros)
- **~170 numbers unchanged**
- **~35 numbers skipped** (deleted scalar, unknown source, or figure-based)

## Updated Numbers

### estimation.tex — Mode B
- Line 195: `45\%` → `41\%` (source: baseline_equilibrium_baseline.tex, Market Share, Debit)
- Line 195: `30\%` → `33\%` (source: baseline_equilibrium_baseline.tex, Market Share, Credit)

### counterfactuals.tex — Mode B
- Line 205: `20 pp` → `23 pp` (source: cf_table_baseline.tex, Credit share, Monopoly: -23)
- Line 259: `\$2 billion` → `\$2.3 billion` (source: welfare_table_baseline.tex, Consumers, CBDC: 2.3)
- Line 31: annotation current=-21 → -19 (source: cf_table_baseline.tex, Credit share, Cap Fees: -19). **FLAG**: Prose says "two-thirds" which was ~64% drop (21/33) and is now ~58% (19/33). Consider revising to "roughly three-fifths" or "more than half".

### response_round2.tex — Mode B
- Line 252: `\$32 bn` → `\$31 bn` (source: welfare_table_credit_constrained.tex, Total, Cap Fees: 31)
- Line 518: `(SE 3.4)` → `(SE 3.2)` (source: cf_table_baseline.tex, Credit Fees, Dual Routing)
- Line 518: `(SE 3.6)` → `(SE 3.4)` (source: cf_table_baseline.tex, Credit Rewards, Dual Routing)
- Line 521: `(SE 1.6)` → `(SE 1.5)` (source: welfare_table_baseline.tex, Consumers, Dual Routing)
- Line 1504: `(SE 1.6)` → `(SE 1.5)` (same source)

### appendix_robustness.tex — Mode B
- Line 61: `21 percentage points` → `20` (source: cf_table_no_passthrough.tex, Credit, Cap Fees: -20)
- Line 165: `18 percentage points (versus 21)` → `19 percentage points (versus 19 at baseline)` (source: cf_table_credit_constrained=-19, cf_table_baseline=-19). **FLAG**: Both specifications now give identical credit share drops. Consider revising comparison sentence.
- Line 249: `12 percentage points (versus 21)` → `10 percentage points (versus 19)` (source: cf_table_robustness_debit=-10, cf_table_baseline=-19)
- Line 287: `21 percentage points` → `20` (source: cf_table_extension.tex, Credit, Cap Fees: -20)

### intro.tex — Mode B (annotation only)
- Line 32: annotation current=13 → current=12 (scalar kilts_model_sales_event=0.12; prose uses `\scalarpctinput{}` macro)

### reducedform.tex — Mode B (annotation only)
- Line 105: annotation current=13 → current=12 (same scalar; prose uses macro)

## Skipped (deleted scalars, cannot verify)

| Scalar | Referenced in |
|--------|---------------|
| debit_reg_coef | intro.tex:29 |
| kilts_share_trips_cc_accept | estimation.tex:81, reducedform.tex:70, response_round2.tex:154,198 |
| total_reg_coef | reducedform.tex:42 |
| nilson_num_rewards_pre | appendix_reduced.tex:137 |
| nilson_num_rewards_lost | appendix_reduced.tex:139 |
| nilson_num_rewards_cont | appendix_reduced.tex:141 |
| discover_reward_share_effect | appendix_reduced.tex:278 |
| kilts_share_vol_top6_banks | data.tex:16 |
| nilson_top3_share | data.tex:20 |
| nilson_avg_cc_mdr | data.tex:22 |
| nilson_avg_debit_mdr | data.tex:24 |
| kilts_cash_share | response_round2.tex:700 |

## Flagged for Manual Review

1. **counterfactuals.tex:30** — "Credit card adoption drops by two-thirds" was based on -21pp/-33% ≈ 64%. Now -19pp/33% ≈ 58%. Description is less accurate.
2. **appendix_robustness.tex:165** — Credit-constrained and baseline credit share drops are now both 19pp, making the comparison "(versus 19 at baseline)" uninformative. Consider rephrasing.
