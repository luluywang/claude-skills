# Number Fix Report

Mode B run — refreshing HARDCODED-annotated numbers from current source data.

Scalar dir: `output/tables/scalars/`
Tables dir: `output/tables/`

## [model.tex] — Mode B

- 1 numbers checked
- 0 numbers updated
- 1 numbers unchanged
- 0 numbers skipped (unknown source)

### Updated:
(none)

### Skipped (unknown source, manual review needed):
(none)

## [estimation.tex] — Mode B

- 12 numbers checked
- 0 numbers updated
- 11 numbers unchanged
- 1 numbers skipped (unknown source)

### Updated:
(none)

### Skipped (unknown source, manual review needed):
- Line 216: 9 — approximate initial AmEx acceptance gap from Figure (source: unknown)

## [data.tex] — Mode B

- 3 numbers checked
- 0 numbers updated
- 3 numbers unchanged
- 0 numbers skipped (unknown source)

### Updated:
(none)

### Unchanged:
- Line 50: `nilson_num` = 39 → prose "39" matches
- Line 60: `amex_uncond_share` = 4 → prose "4\%" matches
- Line 74: `share_card_cons` = 95 → prose "95\%" matches

## [conclusion.tex] — Mode B

- 4 numbers checked
- 0 numbers updated
- 4 numbers unchanged
- 0 numbers skipped (unknown source)

### Updated:
(none)

### Skipped (unknown source, manual review needed):
(none)

## [main.tex] — Mode B

- 3 numbers checked
- 0 numbers updated
- 3 numbers unchanged
- 0 numbers skipped (unknown source)

### Updated:
(none)

### Unchanged:
- Line 52: welfare_table_baseline.tex row "Total" col 1 = 27 → prose "\$27 billion" matches
- Line 55: welfare_table_baseline.tex row "Total" col 6 = 15 → prose "\$15 billion" matches
- Line 57: welfare_table_baseline.tex row "Total" Dual Routing = 3.8 → prose "\$3.8 billion" matches

### Skipped (unknown source, manual review needed):
(none)

## [appendix_data.tex] — Mode B

- 11 numbers checked
- 0 numbers updated
- 1 numbers unchanged
- 10 numbers skipped (unknown source)

### Updated:
(none)

### Unchanged:
- Line 68: `share_card_for_card_cons` = 96 → prose "96\%" matches

### Skipped (unknown source, manual review needed):
- Line 36: 80 — share of US credit card volume covered by listed banks (computed from bank annual reports)
- Line 38: 1.74, 1.85 — volume-weighted average rewards % for non-AmEx and AmEx in 2019 (computed from bank annual reports)
- Line 42: 38 — AmEx annual fees as bps of volume in 2019 (from AmEx annual report)
- Line 60: 28.9 — share of Homescan sample removed for missing payment info (from Homescan data cleaning)
- Line 62: 19.7 — DCPC share preferring cash for non-bill payments (calibrated cash cutoff from DCPC)
- Line 66: 8 — share of non-cash consumers removed by 20-trip restriction (from Homescan sample restriction)
- Line 73: 0.7, 15.7 — shares of sample dropped for low-trip stores and low-network-share stores (from Homescan sample restriction)
- Line 75: 1.5 — measured Visa residual share at confirmed non-acceptors (measured from Homescan non-acceptor stores)
- Line 90: 2.1 — share of DCPC transactions that are checks (from DCPC data)
- Line 92: 21 — share of card users writing checks due to non-acceptance (from DCPC survey)

## [reducedform.tex] — Mode B

- 6 numbers checked
- 0 numbers updated
- 5 numbers unchanged
- 1 numbers skipped (unknown source — Homescan annotation has no adjacent prose number)

### Updated:
(none)

### Unchanged:
- Line 39: `durbin_table.tex` Signature Debit t=3 = -0.287 → exp(-0.287)-1 ≈ 25% → prose "25\%" matches
- Line 47: `durbin_table.tex` Total Debit t=3 = -0.188 → exp(-0.188)-1 ≈ 17% → prose "17\%" matches
- Line 99: `kilts_model_sales_event` scalar = 0.12 → 12% → annotation current=12 matches (prose uses \scalarpctinput macro)
- Line 174: `multihome_comparison.tex` row DCPC = 57.7 → rounded 2 sig figs = 58 → prose "58\%" matches
- Line 180: `visa_cc_second_choice` scalar = 50 → prose "50\%" matches

### Skipped (unknown source, manual review needed):
- Line 175: Homescan annotation (current=56.7) — no adjacent prose number found to update; Homescan value 56.7% (→ 57% at 2 sig figs) does not appear explicitly in surrounding prose

## [appendix_surcharging.tex] — Mode B

- 1 numbers checked
- 0 numbers updated
- 0 numbers unchanged
- 1 numbers skipped (unknown source)

### Updated:
(none)

### Skipped (unknown source, manual review needed):
- Line 38: 5 — share of DCPC transactions involving card surcharges or cash discounts (source: unknown, from DCPC surcharge/discount computation)

## [appendix_data_oa.tex] — Mode B

- 3 numbers checked
- 0 numbers updated
- 1 numbers unchanged
- 2 numbers skipped (unknown source)

### Updated:
(none)

### Unchanged:
- Line 83: yelp_dcpc_comparison.tex row "Total" col 1 (DCPC Accept) = 95.8% and col 4 (Yelp raw) = 96.3% → prose "95.8\% vs.\ 96.3\%" matches

### Skipped (unknown source, manual review needed):
- Line 37: 48, 38, 14, 8–10 — MRI 2022 merchant-level payment shares; no machine-readable source file
- Line 100: 47, 12 — second-choice survey attention-check drop counts; source: unknown

## [appendix_model_oa.tex] — Mode B

- 2 numbers checked
- 0 numbers updated
- 2 numbers unchanged
- 0 numbers skipped (unknown source)

### Updated:
(none)

### Unchanged:
- Line 211: welfare_table_baseline.tex row "Consumers" col "Dual Routing" = 3.3 → prose "\$3.3 billion" matches
- Line 211: mechanical_dual_routing_baseline.tex row "Aggregate" = 4.5 → prose "\$4.5 billion" matches

### Skipped (unknown source, manual review needed):
(none)

## [appendix_reduced.tex] — Mode B

- 7 numbers checked
- 0 numbers updated
- 5 numbers unchanged
- 2 numbers skipped (vision-read figure source)

### Updated:
(none)

### Unchanged:
- Line 43: durbin_table.tex exp(coeff)-1 for total debit (t=3): exp(-0.188)-1 ≈ -0.171 → 17%; sig debit (t=3): exp(-0.287)-1 ≈ -0.249 → 25% — prose "17\% versus 25\%" matches
- Line 308: discover_triple_diff_spend.tex row "Discover HH × Grocery × Reward Month" col Discover = 0.076 → 7.6 pp — prose "7.6 pp" matches
- Line 363: discover_triple_diff_spend.tex same row, all cols: 0.076, -0.060, -0.007, -0.007 — prose "7.6 pp", "−6.0 pp", "−0.7 pp", "−0.7 pp" matches
- Line 547: why_by_pref.tex row "Convenience" debit (0.61) minus credit (0.34) = 0.27 → 27 pp — prose "about 27 pp" matches
- Line 550: scalar `dcpc_debit_owns_credit_card` = 79 — prose "79\%" matches

### Skipped (vision-read source, cannot auto-update):
- Line 172: 25 — approximate effect size read from figure durbin_sig_debit_rewards.pdf (vision-read)
- Line 219: 40 — share read from figure mri_credit_by_checking.pdf left panel (vision-read)

## [appendix_robustness.tex] — Mode B

- 29 numbers checked
- 0 numbers updated
- 27 numbers unchanged
- 2 numbers skipped (multi-value annotations without standard current= format)

### Updated:
(none)

### Unchanged:
- Line 63: welfare_table_no_passthrough.tex Total / Cap Fees = 17 → prose "\$17B" matches
- Line 64: welfare_table_baseline.tex Total / Cap Fees = 27 → prose "\$27B" matches
- Line 65: welfare_table_no_passthrough.tex Total / Monopoly = 8 → prose "\$8B" matches
- Line 66: welfare_table_baseline.tex Total / Monopoly = 15 → prose "\$15B" matches
- Line 72: welfare_table_no_passthrough.tex Merchants / Cap Fees = 49 → prose "\$49B" matches
- Line 73: welfare_table_no_passthrough.tex Consumers / Cap Fees = -31 → prose "\$31B" matches
- Line 122: dcpc_credit_income_reg.tex intercept=1.49, slope=1.04; computed access probabilities 82%, 92%, 62% all match
- Line 135: param_tab_cons_het_baseline.tex β_y^L = 0.60 and param_tab_cons_het_credit_constrained.tex β_y^L = 0.20 → prose "0.60 to 0.20" matches
- Line 166: welfare_table_credit_constrained.tex Total / Cap Fees = 31 → prose "\$31B" matches
- Line 167: welfare_table_credit_constrained.tex Total SE / Cap Fees = 3.9 → prose "SE \$3.9B" matches
- Line 168: welfare_table_baseline.tex Total / Cap Fees = 27 → prose "\$27B" matches
- Line 169: welfare_table_credit_constrained.tex Total / Monopoly = 22 → prose "\$22B" matches
- Line 170: welfare_table_baseline.tex Total / Monopoly = 15 → prose "\$15B" matches
- Line 220: param_tab_cons_baseline.tex log α_0 = 6.74 and param_tab_cons_robustness_debit.tex log α_0 = 5.92 → prose "6.74 to 5.92" matches
- Line 222: param_tab_network_robustness_debit.tex Visa Debit = -10 and Visa Credit = -10 → prose "−10 bps" matches
- Line 252: welfare_table_robustness_debit.tex Total / Monopoly = -19 → prose "−\$19B" matches
- Line 253: welfare_table_robustness_debit.tex Total SE / Monopoly = 10 → prose "SE \$10B" matches
- Line 254: welfare_table_baseline.tex Total / Monopoly = 15 → prose "\$15B" matches
- Line 261: welfare_table_robustness_debit.tex Total / Cap Fees = 15 → prose "\$15B" matches
- Line 262: welfare_table_baseline.tex Total / Cap Fees = 27 → prose "\$27B" matches
- Line 264: welfare_table_robustness_debit.tex Total / Dual Routing = 1.1 → prose "\$1.1B" matches
- Line 265: welfare_table_robustness_debit.tex Total SE / Dual Routing = 0.2 → prose "SE \$0.2B" matches
- Line 266: welfare_table_baseline.tex Total / Dual Routing = 3.8 → prose "\$3.8B" matches
- Line 332: appendix_cap_welfare_table_baseline.tex Total / Tourist Test = 29 and Cap Credit = 27 → prose "\$29B vs \$27B" matches
- Line 335: appendix_cap_table_baseline.tex Credit Fees / Tourist Test = -195 → 195/225 = 87% → prose "87\%" matches
- Line 342: appendix_cap_welfare_table_baseline.tex Total / Ramsey Planner = 35 and Cap Credit = 27 → prose "\$35B vs \$27B" matches
- Line 344: 27/35 = 77% → prose "77\%" matches

### Skipped (multi-value annotations, no standard current= field):
- Lines 58–59: Multi-column annotations for no-passthrough and baseline welfare tables (Uncap Debit, Dual Routing, CBDC); values verified manually and all match prose
- Lines 332, 342, 344: Multi-column or ratio annotations; values verified manually and all match prose

## [intro.tex] — Mode B

- 16 numbers checked
- 0 numbers updated
- 15 numbers unchanged
- 1 numbers skipped (derived source, not auto-updatable)

### Updated:
(none)

### Unchanged:
- Line 30: durbin_table.tex signature debit t=3 coefficient -0.287 → exp(-0.287)-1 ≈ -25% → prose "25\%" matches
- Line 33: scalar kilts_model_sales_event = 0.12 (12%) → prose uses \scalarpctinput macro, current=12 matches
- Line 49: scalar divert_inst_merchant_price_visa = -0.4 → prose "$0.4\%$" matches
- Line 50: diversion_baseline.tex row "Visa Credit" col "Visa Credit" = 3.7 → prose "$3.7\%$" matches
- Line 58: appendix_cap_welfare_table_baseline.tex Total row: Cap Credit=27, Tourist Test=29, Ramsey Planner=35 → 27/29=93%, 27/35=77% → prose "93\%" and "77\%" match
- Line 67: welfare_table_baseline.tex row "Total" col 1 = 27 → prose "\$27 billion" matches
- Line 80: welfare_table_baseline.tex row "Low" col 1 = 48 → prose "48 bp" matches
- Line 81: welfare_table_baseline.tex row "High" col 1 = 15 → prose "15 bp" matches
- Line 86: welfare_table_baseline.tex row "Total" col 3 = 7 → prose "\$7 billion" matches
- Line 92: welfare_table_baseline.tex row "Total" col 6 = 15 → prose "\$15 billion" matches
- Line 96: welfare_table_baseline.tex row "Consumers" col 6 = -11 → prose "\$11 billion" matches
- Line 98: welfare_table_baseline.tex row "Total" col 6 = 15 → prose "\$15 billion" matches (duplicate annotation)
- Line 107: welfare_table_baseline.tex row "Total" Dual Routing col = 3.8 → prose "\$3.8 billion" matches
- Line 110: cf_table_baseline.tex row "Credit Fees" col 8 = -13 → prose "13 bp" matches
- Line 111: cf_table_baseline.tex row "Credit Rewards" col 8 = -15 → prose "15 bp" matches

### Skipped (derived source, manual review needed):
- Line 21: derived ratio 3.7/0.4=9.25 (≈"ten times") — derived from two other annotated values; prose approximation "ten times" is reasonable but cannot be auto-updated

## [appendix_credit_debit.tex] — Mode B

- 28 numbers checked
- 0 numbers updated
- 27 numbers unchanged
- 1 numbers skipped (unknown source)

### Updated:
(none)

### Unchanged:
- Line 231: param_tab_merch_extension_half_kappa.tex "Merchant CES" Est = 4.98 → prose "4.98" matches
- Line 232: param_tab_merch_baseline.tex "Merchant CES" Est = 5.61 → prose "5.61" matches
- Line 234: param_tab_network_extension_half_kappa.tex Cash=30, MC Debit=60 → prose "30--60 bps" matches
- Line 251: cf_table_extension_half_kappa.tex "Credit Fees" Uncap Debit = 33 → prose "33 bps" matches
- Line 290: welfare_table_extension_half_kappa.tex "Total" Cap Fees = 28 → prose "\$28B" matches
- Line 291: welfare_table_baseline.tex "Total" Cap Fees = 27 → prose "\$27B" matches
- Line 293: cf_table_extension_half_kappa.tex "Credit" Cap Fees = -22 → prose "22 pp" matches
- Line 294: cf_table_baseline.tex "Credit" Cap Fees = -19 → prose "19" matches
- Line 297: welfare_table_extension_half_kappa.tex "Total" Uncap Debit = -10 → prose "\$10B" matches
- Line 298 (33 bps): cf_table_extension_half_kappa.tex "Credit Fees" Uncap Debit = 33 → prose "33 bps" matches
- Line 298 (32 bps): cf_table_extension_half_kappa.tex "Credit Rewards" Uncap Debit = 32 → prose "32 bps" matches
- Line 302: welfare_table_extension_half_kappa.tex "Total" Uncap Debit = -10 → annotation current=-10 matches
- Line 303: welfare_table_baseline.tex "Total" Uncap Debit = 7 → annotation current=7 matches
- Line 305: welfare_table_extension_half_kappa.tex "Total" Dual Routing = 14 → prose "\$14B" matches
- Line 310: welfare_table_baseline.tex "Total" Dual Routing = 3.8 → prose "\$3.8B" matches
- Line 368: param_tab_merch_extension.tex "Merchant CES" Est = 7.16 → prose "7.16" matches
- Line 369: param_tab_merch_baseline.tex "Merchant CES" Est = 5.61 → prose "5.61" matches
- Line 421: welfare_table_baseline.tex "Total" Cap Fees = 27 → prose "\$27B" matches
- Line 422: welfare_table_extension_half_kappa.tex "Total" Cap Fees = 28 → prose "\$28B" matches
- Line 423: welfare_table_extension.tex "Total" Cap Fees = 23 → prose "\$23B" matches
- Line 425 (20 pp): cf_table_extension.tex "Credit" Cap Fees = -20 → prose "20 pp" matches
- Line 425 (19 pp): cf_table_baseline.tex "Credit" Cap Fees = -19 → prose "19 pp" matches
- Line 425 (9 pp): cf_table_extension.tex "Cash" Cap Fees = 9 → prose "9 pp" matches
- Line 425 (6): cf_table_baseline.tex "Cash" Cap Fees = 6 → prose "6" matches
- Line 425 (11): cf_table_extension.tex "Debit" Cap Fees = 11 → prose "11 pp" matches
- Line 425 (13): cf_table_baseline.tex "Debit" Cap Fees = 13 → prose "13" matches
- Line 434: welfare_table_extension.tex "Total" Monopoly = 8 → prose "\$8B" matches
- Line 435: welfare_table_baseline.tex "Total" Monopoly = 15 → prose "\$15B" matches

### Skipped (unknown source, manual review needed):
- Line 285: ~20 — share of AmEx consumers also using debit (vision-read from figure prob_of_secondary_given_primary.pdf; no machine-readable source)

## [appendix_sorting.tex] — Mode B

- 8 numbers checked
- 2 numbers updated
- 2 numbers unchanged
- 4 numbers skipped (unknown/composite source)

### Updated:
- Line 207: "4\%" → "4.1\%" (source: kilts_appendix_welfare_ratio.tex row "Cash" col Credit = 0.959; derived: 1−0.959 = 0.041 → 4.1% at 2 sig figs)
- Line 209: "9\%" → "8.6\%" (source: kilts_appendix_unweighted_welfare_ratio.tex row "Cash" col Credit = 0.914; derived: 1−0.914 = 0.086 → 8.6% at 2 sig figs)

### Unchanged:
- Line 202: mri_appendix_welfare_ratio.tex Credit/Credit = 1.023 → prose "1.023" matches; derived "2.3\%" on line 201 also matches
- Line 205: mri_appendix_welfare_ratio.tex Debit/Credit = 0.986 → prose "0.986" matches; derived "1.4\%" on line 204 also matches

### Skipped (unknown/composite source, manual review needed):
- Line 16: 15 — 90th-percentile credit store debit/cash share (source: unknown, Homescan/MRI distribution)
- Line 21: "4--9 pp., 91--96\%" — composite of multiple table entries, no specific row/col in annotation
- Line 30: 10 — maximum off-diagonal attenuation (source: vague, no specific row/col in annotation)
- Line 268: "4--9 pp., 91--96\%" — composite of mri_appendix_welfare_ratio.tex + mri_appendix_unweighted_welfare_ratio.tex, no specific row/col

## [counterfactuals.tex] — Mode B

- 37 numbers checked
- 0 numbers updated
- 33 numbers unchanged
- 4 numbers skipped (derived/unknown source)

### Updated:
(none)

### Unchanged:
- Line 20: welfare_table_baseline.tex Total col 1 = 27 → prose "\$27 billion" matches
- Line 29: cf_table_baseline.tex Credit Rewards col 1 = -110 → prose "1.1 pp." matches (derived: 110 bps = 1.10 pp)
- Line 37: cf_table_baseline.tex Total Fees col 1 = -58 → prose "\$58 billion" matches
- Line 38: cf_table_baseline.tex Total Rewards col 1 = -57 → annotation current=-57; prose says "roughly equal amounts" (no explicit number to update)
- Line 100: welfare_table_baseline.tex Total col 1 = 27 (annotation before consumers/merchants prose)
- Line 101: welfare_table_baseline.tex Consumers col 1 = 28 → prose "\$28 billion" matches
- Line 103: welfare_table_baseline.tex Merchants col 1 = 0.4 → prose "\$0.4 billion" matches
- Line 104: welfare_table_baseline.tex Networks col 1 = -1.5 → prose "\$1.5 billion" matches
- Line 106: baseline_network_profits.tex Baseline = 26; -1.5/26 ≈ 5.8% → prose "6\%" matches
- Line 121: appendix_cap_welfare_table_baseline.tex Networks col 1 = -1.5 → prose "\$1.5 billion" matches
- Line 133: cap_credit_channel_decomp_baseline.tex Network Effect Total = 14 → prose "\$14 billion" matches
- Line 149: welfare_table_baseline.tex Low col 1 = 48 → prose "48 bp" matches
- Line 151: welfare_table_baseline.tex Median col 1 = 37 → prose "37 bp" matches
- Line 153: welfare_table_baseline.tex High col 1 = 15 → prose "15 bp" matches
- Line 178: cf_table_baseline.tex Credit Rewards col 3 = -6 → prose "6 bps" matches
- Line 179: cf_table_baseline.tex Credit Fees col 3 = -3.3 → prose "3.3 bps" matches
- Line 181: cf_table_baseline.tex Total Fees col 3 = 4.4 → prose "\$4.4 billion" matches
- Line 182: cf_table_baseline.tex Total Rewards col 3 = 0.5 → prose "\$0.5 billion" matches
- Line 186: welfare_table_baseline.tex Consumers col 3 = 4.3 → prose "\$4.3 billion" matches
- Line 188: welfare_table_baseline.tex Total col 3 = 7 → prose "\$7 billion" matches
- Line 190: welfare_table_baseline.tex Low col 3 = 7 → prose "7 bps" matches
- Line 191: welfare_table_baseline.tex High col 3 = 2.4 → prose "2.4 bps" matches
- Line 204: cf_table_baseline.tex Credit Rewards col 6 = -90 → prose "90 bps" matches
- Line 206: cf_table_baseline.tex Credit col 6 = -23 → prose "23 pp" matches
- Line 208: cf_table_baseline.tex Credit Fees col 6 = 36 → prose "36 bps" matches
- Line 209: cf_table_baseline.tex Total Fees col 6 = -40 → prose "\$40 billion" matches
- Line 213: welfare_table_baseline.tex Total col 6 = 15 → prose "\$15 billion" matches
- Line 216: welfare_table_baseline.tex Consumers col 6 = -11 → prose "\$11 billion" matches
- Line 218: welfare_table_baseline.tex Networks col 6 = 31 → prose "\$31 billion" matches
- Line 221: welfare_table_baseline.tex Low col 6 = 13 → prose "13 bps" matches
- Line 223: welfare_table_baseline.tex High col 6 = -29 → prose "29 bps" matches
- Line 238: cf_table_baseline.tex Credit Fees col 8 = -13 → prose "13 bps" matches
- Line 240: cf_table_baseline.tex Credit Rewards col 8 = -15 → prose "15 bps" matches
- Line 242: welfare_table_baseline.tex Consumers Dual Routing = 3.3 → prose "\$3.3 billion" matches
- Line 243: welfare_table_baseline.tex Total Dual Routing = 3.8 → prose "\$3.8 billion" matches
- Line 246: mechanical_dual_routing_baseline.tex Aggregate = 4.5 → prose "\$4.5 billion" matches
- Line 266: welfare_table_baseline.tex Consumers CBDC = 3.7 → prose "\$3.7 billion" matches
- Line 307: appendix_cap_welfare_table_baseline.tex: 27/29=93%, 27/35=77% → prose "93\% and 77\%" matches

### Skipped (derived/unknown source, manual review needed):
- Line 32: cf_table_baseline.tex Credit col 1 = -19; annotation tracks "nearly half" — no explicit number in prose to update
- Line 123: derived ratio annotation (current=-1.5 / 26) — "6\%" confirmed via line 106; line 123 is a duplicate tracking note
- Line 210: cf_table_baseline.tex Total Rewards col 6 = -66 → no explicit dollar figure in adjacent prose
- Line 301: derived fraction (27-17)/27 ≈ 37% → prose "one-third" is a qualitative approximation; underlying values confirm it holds

## [response_round2.tex] — Mode B

- 58 numbers checked
- 2 numbers updated
- 54 numbers unchanged
- 2 numbers skipped (figure sources, cannot auto-update)

### Updated:
- Line 141: "around 0.8" → "around 0.82" (source: param_tab_cons_baseline.tex log α₀ = 6.74, param_tab_cons_robustness_debit.tex log α₀ = 5.92; diff = 0.82 at 2 sig figs; annotation current=0.82 unchanged)
- Line 282: "7\%" → "7.4\%" (source: appendix_cap_welfare_table_baseline.tex (Tourist Test=29 − Cap Credit=27)/27 = 7.41%; annotation current=7 updated to current=7.41)

### Unchanged (selected highlights):
- Lines 230–238: fee cap range \$23--28B, merger range \$8--15B, dual routing range \$2.6--14B — all match welfare_table_baseline/extension/half_kappa
- Lines 257–258: \$27B (baseline) and \$31B (credit-constrained) — match welfare_table_baseline.tex and welfare_table_credit_constrained.tex
- Lines 317–319: Credit Fees −13 bp, Credit Rewards −15 bp, Total welfare \$3.8B (dual routing) — match cf_table_baseline and welfare_table_baseline
- Lines 478–479: Merchant \$50Bn (Network Effect), −\$49Bn (Price Passthrough) — match cap_credit_channel_decomp_baseline.tex
- Lines 507–510: dual routing credit fees −13 bp, rewards −15 bp, consumer welfare \$3.3B — match tables
- Lines 606–607: Discover triple-diff grocery share 0.002 (SE 0.001), Discover share 0.076 (SE 0.003) — match discover_triple_diff.tex and discover_triple_diff_spend.tex
- Lines 755: aggregate acceptance 95.8% vs 96.3% — match yelp_dcpc_comparison.tex Total row
- Lines 821, 970, 1399: 77% = 27/35 — match appendix_cap_welfare_table_baseline.tex
- Lines 1165–1180: no-passthrough welfare results (Uncap Debit \$8B, Dual Routing \$2.9B, CBDC \$1.4B; Cap Fees \$17B; Merchants \$49B, Consumers −\$31B) — all match welfare_table_no_passthrough.tex
- Lines 1328–1330: cc_balances_by_pref.tex Debit row: owns credit 79%, owns rewards credit 53%, credit utilization 27% — all match
- Lines 1357–1358: baseline_equilibrium_baseline.tex Share of Spending: Debit=36%, Credit=44% — match (prose 45:55 is card-only ratio, correct)
- Lines 1361–1362: appendix_cap_table_baseline.tex Tourist Test: Debit=−5, Credit=−30 — match
- Line 1382: param_tab_cons_baseline/robustness log α₀ = 6.74 → 5.92 — prose matches exactly

### Skipped (figure sources, cannot auto-read):
- Line 136: figure durbin_sig_debit_rewards.pdf, approximate effect size current=30 — prose says "around 25\%"; discrepancy noted but cannot verify programmatically
- Line 1326: figure prob_of_secondary_given_primary, debit-primary secondary-credit bar, current=~75 — prose says "around 75\%"; cannot verify programmatically

### Non-standard annotation format (no current= field):
- Line 821: `% HARDCODED[table: appendix_cap_welfare_table_baseline, 27/35] rounded=77%` — uses `rounded=` not `current=`; value 27/35=77% confirmed correct but annotation format should be standardized
- Line 970: same annotation pattern for 77%
- Line 1399: same annotation pattern for 77%
