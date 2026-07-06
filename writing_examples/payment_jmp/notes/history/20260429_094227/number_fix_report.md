# Number Fix Report

## [appendix_data.tex] — Mode B

- 11 numbers checked
- 0 numbers updated
- 1 number unchanged (scalar source verified)
- 10 numbers skipped (unknown source)

### Unchanged:
- Line 68: 96 — scalar `share_card_for_card_cons` reads 96; prose value matches

### Skipped (unknown source, manual review needed):
- Line 36: 80 — share of US credit card volume covered by listed banks
- Line 38: 1.74, 1.85 — volume-weighted average rewards (non-AmEx and AmEx), 2019
- Line 41: 38 — AmEx annual fees in bps of volume, 2019
- Line 60: 28.9 — share of Homescan sample dropped for missing payment info
- Line 62: 19.7 — DCPC share who prefer cash for non-bill payments (calibration target)
- Line 66: 8 — share of non-cash consumers removed by 20-trip restriction
- Line 73: 0.7, 15.7 — share of store-years dropped by 500-trip and 1.5% network-share thresholds
- Line 75: 1.5 — measured Visa residual share at confirmed non-acceptor stores
- Line 92: 2.1 — share of DCPC transactions that are checks
- Line 94: 21 — share of card users who wrote checks due to non-acceptance

## [data.tex] — Mode B

- 3 numbers checked
- 0 numbers updated
- 3 numbers unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
- Line 48: 39 — scalar `nilson_num` reads 39; prose value matches
- Line 58: 4 — scalar `amex_uncond_share` reads 4; prose value matches
- Line 72: 95 — scalar `share_card_cons` reads 95; prose value matches

## [main.tex] — Mode B

- 1 number checked
- 0 numbers updated
- 1 number unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
- Line 52: 27 — `welfare_table_baseline.tex` row "Total" col 1 reads 27; prose value matches

## [counterfactuals.tex] — Mode B

- 34 numbers checked
- 0 numbers updated
- 34 numbers unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
All 34 annotated values verified against source tables. No discrepancies found.

Sources verified:
- `welfare_table_baseline.tex`: Total, Consumers, Merchants, Networks, Low/Median/High Income across Cap Fees, Uncap Debit, Monopoly, Dual Routing, CBDC scenarios
- `cf_table_baseline.tex`: Credit Fees, Credit Rewards, Credit (share), Total Fees, Total Rewards across Cap Fees, Uncap Debit, Monopoly, Dual Routing scenarios
- `baseline_network_profits.tex`: Baseline row (26)
- `appendix_cap_welfare_table_baseline.tex`: Networks and Total rows for Cap Credit/Tourist Test/Ramsey Planner
- `mechanical_dual_routing_baseline.tex`: Aggregate row (4.5)
- `welfare_table_no_passthrough.tex`: Total Cap Fees (17), consistent with prose "one-third" approximation

## [conclusion.tex] — Mode B

- 3 numbers checked
- 0 numbers updated
- 3 numbers unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
- Line 13: 27 — table `welfare_table_baseline.tex` row "Total" col 1 (Cap Fees); source reads 27
- Line 18: 7 — table `welfare_table_baseline.tex` row "Total" col 3 (Uncap Debit); source reads 7
- Line 26: 15 — table `welfare_table_baseline.tex` row "Total" col 6 (Monopoly); source reads 15

## [model.tex] — Mode B

- 1 number checked
- 0 numbers updated
- 1 number unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
- Line 313: 95 — scalar `share_card_cons` reads 95; prose value matches ("around 95\%")

## [appendix_model_oa.tex] — Mode B

- 2 numbers checked
- 0 numbers updated
- 2 numbers unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
- Line 211: 3.3 — table `welfare_table_baseline.tex` row "Consumers" Dual Routing col reads 3.3; prose value matches
- Line 211: 4.5 — table `mechanical_dual_routing_baseline.tex` row "Aggregate" reads 4.5; prose value matches

## [appendix_surcharging.tex] — Mode B

- 1 number checked
- 0 numbers updated
- 0 numbers unchanged
- 1 number skipped (unknown source)

### Skipped (unknown source, manual review needed):
- Line 38: 5 — share of DCPC transactions with card surcharges or cash discounts; source marked unknown (DCPC surcharge/discount computation)

## [appendix_reduced.tex] — Mode B

- 7 numbers checked
- 0 numbers updated
- 5 numbers unchanged
- 2 numbers skipped (figure-based, cannot auto-update)

### Unchanged:
- Line 43: 17%, 25% — `durbin_table.tex` total debit t=3 coeff -0.188 → exp(-0.188)-1 = -17.1% ≈ 17%; signature debit t=3 coeff -0.287 → exp(-0.287)-1 = -24.9% ≈ 25%; prose values match
- Line 311: 7.6 pp — `discover_triple_diff_spend.tex` row "Discover HH × Grocery × Reward Month" col Discover reads 0.076; prose value matches
- Line 366: 7.6 pp, -6.0 pp, -0.7 pp, -0.7 pp — same table row, cols Discover=0.076, Other Credit=-0.060, Debit=-0.007, Cash=-0.007; all prose values match
- Line 555: 27 pp — `why_by_pref.tex` row Convenience: Debit=0.61, Credit=0.34, difference=0.27; prose value matches
- Line 558: 79 — scalar `dcpc_debit_owns_credit_card` reads 79; prose value matches

### Skipped (figure-based, manual review needed):
- Line 169: 25% — sourced from figure `durbin_sig_debit_rewards.pdf` (vision-read); cannot auto-update
- Line 220: 40% — sourced from figure `mri_credit_by_checking.pdf` left panel (vision-read); cannot auto-update

## [appendix_sorting.tex] — Mode B

- 7 numbers checked
- 0 numbers updated
- 4 numbers unchanged
- 3 numbers skipped (unknown or compound source)

### Unchanged:
- Line 202: 1.023 — mri_appendix_welfare_ratio.tex row "Credit", col Credit; table reads 1.023, prose matches
- Line 204: 0.986 — mri_appendix_welfare_ratio.tex row "Debit", col Credit; table reads 0.986, prose matches (implied 1.4% = 1 - 0.986)
- Line 207: 0.959 — kilts_appendix_welfare_ratio.tex row "Cash", col Credit; table reads 0.959, prose matches (implied 4.1%)
- Line 209: 0.914 — kilts_appendix_unweighted_welfare_ratio.tex row "Cash", col Credit; table reads 0.914, prose matches (implied 8.6%)

### Skipped (unknown or compound source, manual review needed):
- Line 16: 15 — 90th-percentile credit share floor from Homescan/MRI; source marked unknown
- Line 21: 4-9 pp, 91-96% — compound annotation referencing multiple tables; cannot auto-update
- Line 30: 10 — "at most 10%" max off-diagonal attenuation; source annotation is compound; actual max across all tables is 8.6% (kilts_appendix_unweighted_welfare_ratio.tex, Cash/Credit = 0.914); manual review recommended
- Line 268: 4-9 pp, 91-96% — compound annotation; same as line 21

## [appendix_data_oa.tex] — Mode B

- 3 numbers checked
- 0 numbers updated
- 1 number unchanged
- 2 numbers skipped (unknown source)

### Unchanged:
- Line 83: 95.8, 96.3 — table `yelp_dcpc_comparison.tex` Total row reads DCPC Accept = 95.8%, Yelp (raw) = 96.3%; prose values match

### Skipped (unknown source, manual review needed):
- Line 37: 48, 38, 14, 8-10 — MRI 2022 merchant-level payment shares (credit, debit, cash averages and SDs); no scalar or table source found
- Line 100: 47, 12 — second-choice survey attention-check failures and out-of-window respondents; no scalar or table source found

## [appendix_credit_debit.tex] — Mode B

- 38 numbers checked
- 1 number updated
- 37 numbers unchanged
- 0 numbers skipped (unknown source)

### Updated:
- Line 396: 7.16 → 7.15 (source: param_tab_merch_extension.tex row "Merchant CES" col Est); annotation current= updated to 7.15

### Unchanged:
All other annotated values verified against source tables. No discrepancies found.

Sources verified:
- `welfare_table_baseline.tex`: Total Cap Fees (27), Total Uncap Debit (7), Total Monopoly (15), Total Dual Routing (3.8)
- `welfare_table_extension_half_kappa.tex`: Total Cap Fees (28), Total Uncap Debit (-10), Total Monopoly (15), Total Dual Routing (14)
- `welfare_table_extension.tex`: Total Cap Fees (23), Total Monopoly (8)
- `param_tab_merch_extension_half_kappa.tex`: Merchant CES (4.98)
- `param_tab_merch_baseline.tex`: Merchant CES (5.61)
- `param_tab_network_extension_half_kappa.tex`: Cash (30), MC Debit (60) — range 30–60 bps confirmed
- `cf_table_extension_half_kappa.tex`: Credit Fees Uncap Debit (33), Credit Rewards Uncap Debit (32), Credit Cap Fees (-22)
- `cf_table_baseline.tex`: Credit Cap Fees (-19), Cash Cap Fees (6), Debit Cap Fees (13)
- `cf_table_extension.tex`: Credit Cap Fees (-20), Cash Cap Fees (9), Debit Cap Fees (11)

## [appendix_robustness.tex] — Mode B

- 23 numbers checked
- 4 numbers updated
- 17 numbers unchanged
- 2 numbers skipped (complex/computed source)

### Updated:
- Line 134: $0.60$ → $0.63$ — `param_tab_cons_het_baseline.tex` row "Credit Income Effect (β_y^L)" reads 0.63; annotation current= updated to 0.63
- Line 165: SE \$3.9B → SE \$4B — `welfare_table_credit_constrained.tex` Total Cap Fees SE reads (4); annotation current= updated to 4
- Line 219: 6.74 → 6.75 — `param_tab_cons_baseline.tex` row "Log Price Sensitivity (log α_0)" reads 6.75; annotation current= updated to 6.75
- Line 221: $-10$ bps → $-6$ and $-8$ bps — `param_tab_network_robustness_debit.tex` Visa Debit = -6, Visa Credit = -8; prose updated to report both values separately; annotation current= updated to -6, -8

### Unchanged:
- Lines 57–59: no-passthrough multi-value annotation (Uncap Debit=8 vs 7, Dual Routing=2.9 vs 3.8, CBDC=1.4 vs 1.6); all match tables
- Lines 62–66: no-passthrough cap fees and monopoly (17, 27, 8, 15); all match tables
- Lines 71–73: no-passthrough cap fees distribution (Merchants=49, Consumers=-31); match tables
- Lines 121–122: credit access probabilities (82%, 92%, 62%); computed from logistic params intercept=1.49, slope=1.04, ν_y=0.75; match current table
- Lines 166, 168–170: credit constrained welfare (31, 27, 22, 15); all match tables
- Lines 251–254: robustness debit monopoly (-19, SE=10, baseline=15); all match tables
- Lines 260–262: robustness debit cap fees (15, baseline=27); all match tables
- Lines 263–266: robustness debit dual routing (1.1, SE=0.2, baseline=3.8); all match tables
- Lines 331, 341: appendix cap welfare (Tourist Test=29, Cap Credit=27, Ramsey=35); all match table
- Line 343: 77% (27/35); correct

### Skipped (complex/computed source, manual review needed):
- Lines 331–335: 87% credit fee reduction under tourist test — annotation notes (195/225); numerator verified from table (-195 bps), denominator (225 bps baseline credit fee) not directly verifiable from available tables
- Lines 341–344: 77% planner capture — annotation notes (27/35); both values verified; ratio correct

## [reducedform.tex] — Mode B

- 7 numbers checked
- 0 numbers updated
- 6 numbers unchanged
- 1 number skipped (unknown source)

### Unchanged:
- Line 39: 25 — `durbin_table.tex` Signature Debit t=3 coeff -0.287; exp(-0.287)-1 = -24.9% ≈ 25%; prose value matches
- Line 47: 17 — `durbin_table.tex` Total Debit t=3 coeff -0.188; exp(-0.188)-1 = -17.1% ≈ 17%; prose value matches
- Line 99: 12 — scalar `kilts_model_sales_event` reads 0.12; as percentage = 12; rendered via `\scalarpctinput{}` macro; annotation current=12 matches
- Line 173: 57.7 — `multihome_comparison.tex` DCPC row reads 57.7%; annotation current=57.7 matches; prose rounds to 58%
- Line 174: 56.7 — `multihome_comparison.tex` Homescan row reads 56.7%; annotation current=56.7 matches
- Line 179: 50 — scalar `visa_cc_second_choice` reads 50; prose value matches

### Skipped (unknown source, manual review needed):
- Line 42: 25 — Durbin rewards robustness approximate effect size from figure `durbin_sig_debit_rewards.pdf`; no table or scalar source to verify against

## [estimation.tex] — Mode B

- 14 numbers checked
- 5 numbers updated (current= fields; 1 prose value changed)
- 8 numbers unchanged
- 1 number skipped (unknown source)

### Updated:
- Line 171: current= 4.60 → 4.65 (source: param_tab_cons_baseline.tex row "Card-Credit Complement" col Est); prose in commented block updated from $4.60$ to $4.7$ (rounded to 2 sig figs) on line 178
- Line 172: current= 4.00 → 3.97 (source: param_tab_cons_baseline.tex row "Credit-Card Complement" col Est); prose rounds to 4.0 = 4.00, no prose change
- Line 173: current= -4.80 → -4.82 (source: param_tab_cons_baseline.tex row "Credit-Credit Complement" col Est); prose rounds to -4.8 = -4.80, no prose change
- Line 179: current= 4.60 → 4.65 (duplicate annotation for Card-Credit Complement)
- Line 180: current= 4.00 → 3.97 (duplicate annotation for Credit-Card Complement)

### Unchanged:
- Line 61: 4.3 — scalar `data_multihome_gradient` reads 4.3; matches prose
- Line 147: 3.7 — diversion_baseline.tex Visa Credit/Visa Credit; matches prose
- Line 148: -3.5 — diversion_baseline.tex MC Credit/Visa Credit; matches prose
- Line 149: -0.3 — diversion_baseline.tex MC Debit/Visa Credit; matches prose
- Line 150: -0.3 — diversion_baseline.tex Cash/Visa Credit; matches prose
- Line 181: 3.80 — derived 4.65+3.97-4.82=3.80; matches annotation
- Line 191: 41 — baseline_equilibrium_baseline.tex Debit Market Share; matches prose
- Line 192: 33 — baseline_equilibrium_baseline.tex Credit Market Share; matches prose

### Skipped (unknown source, manual review needed):
- Line 213: 9 — approximate initial AmEx-Visa acceptance gap from figure; source marked unknown

## [response_round2.tex] — Mode B

- 63 numbers checked
- 2 numbers updated
- 59 numbers unchanged
- 2 numbers skipped (figure-based, cannot auto-update)

### Updated:
- Line 145: "declines by around 0.82" → "declines by around 0.83"; baseline log price sensitivity is 6.75 (not 6.74) per `param_tab_cons_baseline.tex`; 6.75−5.92=0.83; annotation label and `current=` updated to match
- Line 1392: "from 6.74 to 5.92" → "from 6.75 to 5.92"; same source; annotation `current=6.74 -> 5.92` updated to `current=6.75 -> 5.92`

### Unchanged:
All other annotated values verified against source tables/scalars:
- `welfare_table_baseline.tex`: Total Cap Fees=27, Total Monopoly=15, Total Dual Routing=3.8, Consumers Cap Fees=28, Consumers Dual Routing=3.3 — all match
- `welfare_table_extension.tex`: Total Cap Fees=23, Total Monopoly=8, Total Dual Routing=2.6 — all match
- `welfare_table_extension_half_kappa.tex`: Total Cap Fees=28, Total Monopoly=15, Total Dual Routing=14 — all match
- `welfare_table_credit_constrained.tex`: Total Cap Fees=31 — matches
- `appendix_cap_welfare_table_baseline.tex`: Cap Credit=27, Tourist Test=29, Ramsey Planner=35; ratio 27/35=77% — all match
- `cf_table_baseline.tex`: Credit Fees Dual Routing=−13, Credit Rewards Dual Routing=−15 — match
- `cap_credit_channel_decomp_baseline.tex`: Network Effect Merchant=50, Price Passthrough Merchant=−49, Network Effect Total=14 — all match
- `discover_triple_diff.tex`: grocery share 0.002 (SE 0.001) — matches
- `discover_triple_diff_spend.tex`: Discover col 0.076 (SE 0.003) — matches
- `discover_triple_diff_disc_only_spend.tex`: Discover col 0.025 — matches
- `yelp_dcpc_comparison.tex`: aggregate DCPC=95.8%, Yelp=96.3% — match
- `param_tab_cons_het_baseline.tex`: Income Elasticity Est=0.20, SE=0.06 — match
- `param_tab_cons_robustness_debit.tex`: Log Price Sensitivity=5.92 — match
- `welfare_table_no_passthrough.tex`: Total Uncap Debit=8, Dual Routing=2.9, CBDC=1.4, Cap Fees=17, Monopoly=8, Merchants Cap Fees=49, Consumers Cap Fees=−31 — all match
- `cc_balances_by_pref.tex`: Debit Owns credit card=0.79, Owns rewards CC=0.53, Credit utilization=0.27 — all match
- `baseline_equilibrium_baseline.tex`: Share of Spending Debit=36, Credit=44 — match
- `appendix_cap_table_baseline.tex`: Debit Tourist Test=−5, Credit Tourist Test=−30 — match
- scalar `share_card_cons`=95 — matches

### Skipped (figure-based, cannot auto-update):
- Line 134: 25% — sourced from figure `durbin_sig_debit_rewards.pdf`; cannot auto-update
- Line 1352: ~75% — sourced from figure `prob_of_secondary_given_primary`; cannot auto-update

## [intro.tex] — Mode B

- 13 numbers checked
- 0 numbers updated
- 13 numbers unchanged
- 0 numbers skipped (unknown source)

### Unchanged:
- Line 21: "ten times" (derived ratio 3.7/0.4=9.25) — `diversion_baseline.tex` row "Visa Credit" col "Visa Credit" reads 3.7; scalar `divert_inst_merchant_price_visa_baseline` reads -0.4; ratio 9.25 rounds to "ten"; prose value matches
- Line 30: 25 — `durbin_table.tex` row "Treat, t=3" Signature Debit coeff=-0.287; exp(-0.287)-1=-0.249 rounds to 25%; prose value matches
- Line 33: 12 — scalar `kilts_model_sales_event` reads 0.12 (12%); prose uses `\scalarpctinput{}` macro; value matches
- Line 50: -0.4 — scalar `divert_inst_merchant_price_visa` reads -0.4; prose value matches
- Line 51: 3.7 — `diversion_baseline.tex` row "Visa Credit" col "Visa Credit" reads 3.7; prose value matches
- Line 80: 48 — `welfare_table_baseline.tex` row "Low" col 1 (Cap Fees) reads 48; prose value matches
- Line 81: 15 — `welfare_table_baseline.tex` row "High" col 1 (Cap Fees) reads 15; prose value matches
- Line 86: 7 — `welfare_table_baseline.tex` row "Total" col 3 (Uncap Debit) reads 7; prose value matches
- Line 93: 15 — `welfare_table_baseline.tex` row "Total" col 6 (Monopoly) reads 15; prose value matches
- Line 98: -11 — `welfare_table_baseline.tex` row "Consumers" col 6 (Monopoly) reads -11; prose value matches
- Line 100: 15 — `welfare_table_baseline.tex` row "Total" col 6 (Monopoly) reads 15; prose value matches (duplicate annotation)
- Line 110: -13 — `cf_table_baseline.tex` row "Credit Fees" col 8 (Dual Routing) reads -13; prose value matches
- Line 111: -15 — `cf_table_baseline.tex` row "Credit Rewards" col 8 (Dual Routing) reads -15; prose value matches

## [appendix_robustness.tex] — Mode B (welfare_table_credit_constrained.tex only)

- 4 numbers checked
- 2 numbers updated
- 2 numbers unchanged

### Updated:
- Line 167: 31 → 32 (table welfare_table_credit_constrained.tex, row "Total", col Cap Fees)
- Line 167: 22 → 24 (table welfare_table_credit_constrained.tex, row "Total", col Monopoly)

### Unchanged:
- Line 167: 4 (Cap Fees Total SE — still 4)
- Line 167: 27 / 15 (baseline values — out of scope; still match welfare_table_baseline.tex)

## [response_round2.tex] — Mode B (welfare_table_credit_constrained.tex only)

- 2 numbers checked
- 1 number updated
- 1 number unchanged

### Updated:
- Line 269: 31 → 32 (table welfare_table_credit_constrained.tex, row "Total", col 1)

### Unchanged:
- Line 269: 27 (baseline value — out of scope; still matches welfare_table_baseline.tex)

## [appendix_robustness.tex] — Mode B (credit-access logit)

- 5 numbers checked
- 4 numbers updated
- 1 number unchanged

### Updated:
- Line 123: 82 → 79 (access % at median; intercept 1.49→1.33, slope 1.04→1.32)
- Line 123: 92 → 93 (access % at 90th percentile)
- Line 123: 62 → 52 (access % at 10th percentile)
- Line 136: β_y^L credit-constrained 0.20 → 0.15 (param_tab_cons_het_credit_constrained.tex)

### Unchanged:
- Line 136: β_y^L baseline 0.63 (param_tab_cons_het_baseline.tex unchanged)
