# Authoritative Values Snapshot

Last updated: 2026-02-22 (from `output/tables/` after estimation rerun)

Update this file whenever the pipeline reruns. Run MODE B against the paper after updating.

Column index key for cf_table / welfare_table (0-indexed after label cell):
1=Cap Fees, 2=Cap Fees SE, 3=Uncap Debit, 4=Uncap Debit SE, 5=sep,
6=Monopoly, 7=Monopoly SE, 8=Public Debit, 9=Public Debit SE, 10=Dual Routing, 11=Dual Routing SE

---

## output/tables/cf_table_baseline.tex

| Row | Cap Fees | Uncap Debit | Monopoly | Public Debit | Dual Routing |
|-----|----------|-------------|----------|--------------|--------------|
| Credit Fees | -195 | -3.3 | 36 | 0.6 | -13 |
| Credit Rewards | -199 | -6 | -90 | 0.6 | -15 |
| Debit Fees | -42 | 25 | 0.0 | 0.0 | 0.0 |
| Debit Rewards | -38 | 25 | -37 | 2.5 | 0.4 |
| Cash (share) | 37 | -8 | 30 | -1.5 | 0.6 |
| Debit (share) | -10 | 15 | -11 | -3.2 | 1.2 |
| Credit (share) | -27 | -7 | -20 | -0.2 | -1.8 |
| Total Fees | -101 | 4.4 | -40 | -0.4 | -7 |
| Total Rewards | -86 | 0.5 | -66 | 0.7 | -8 |

## output/tables/welfare_table_baseline.tex

| Row | Cap Fees | Uncap Debit | Monopoly | Public Debit | Dual Routing |
|-----|----------|-------------|----------|--------------|--------------|
| Low Income (bps) | 56 | 6 | 4.6 | 1.6 | 6 |
| Medium Income (bps) | 25 | 3.8 | -14 | 1.5 | 3.9 |
| High Income (bps) | -29 | 0.6 | -46 | 1.4 | 1.2 |
| Consumers ($Bn) | 37 | 4.3 | -11 | 2.3 | 8 |
| Merchants ($Bn) | 2.8 | -0.7 | -4.4 | 0.2 | -0.1 |
| Networks ($Bn) | -11 | 3.0 | 31 | -1.6 | 0.6 |
| Total ($Bn) | 29 | 7 | 16 | 0.9 | 8 |

## output/tables/cap_credit_channel_decomp_baseline.tex

Columns: Consumer | Merchant | Network | Total

| Row | Consumer | Merchant | Network | Total |
|-----|----------|----------|---------|-------|
| Network Effect | -65 | 89 | -13 | 11 |
| Price Passthrough | 102 | -86 | 0.7 | 17 |
| Merchant Adoption | 0.0 | -0.3 | 1.6 | 1.4 |
| Total | 37 | 3.0 | -11 | 30 |

## output/tables/consumer_decomp_across_cfs_baseline.tex

Columns: Cap Fees | Uncap Debit | Monopoly | Dual Routing | Social Optimum

| Row | Cap Fees | Uncap Debit | Monopoly | Dual Routing | Social Optimum |
|-----|----------|-------------|----------|--------------|----------------|
| Network Effect | -65 | 9 | -57 | -3.9 | -46 |
| Price Passthrough | 102 | -4.5 | 38 | 11 | 102 |
| Merchant Adoption | 0.0 | -0.2 | 3.0 | 1.1 | 0.1 |
| Total | 37 | 4.2 | -16 | 8 | 56 |

## output/tables/param_tab_cons_baseline.tex

| Parameter | Est |
|-----------|-----|
| Reward Sensitivity | 6.74 |

## output/tables/param_tab_cons_robustness_debit.tex

| Parameter | Est |
|-----------|-----|
| Reward Sensitivity | 5.92 |

## output/tables/appendix_intermediate_cap_welfare_baseline.tex

Consumer welfare decomposition — Cap Fees and Canada Cap (95 bps) scenarios

| Row | Cap Fees | Canada Cap (95 bps) |
|-----|----------|---------------------|
| Total Fees | -101 | -58 |
| Total Rewards | -86 | -57 |
| Low Income (bps) | 56 | 44 |
| Medium Income (bps) | 25 | 28 |
| High Income (bps) | -29 | -1.2 |
| Consumers ($Bn) | 37 | 28 |
| Merchants ($Bn) | 2.8 | 0.4 |
| Networks ($Bn) | -11 | -1.5 |
| Total ($Bn) | 29 | 27 |
| Retail Prices ($Bn) | 101 | 58 |
| Rewards ($Bn) | -86 | -57 |
| Acceptance ($Bn) | 6 | 6 |
| Credit Aversion ($Bn) | 44 | 32 |
| Option Value ($Bn) | -28 | -11 |


---

## output/tables/scalars/

### Available scalars

| Scalar name | Value | Notes |
|-------------|-------|-------|
| debit_reg_coef | 29 | |
| kilts_top_two_many_cc | 60 | |
| dual_routing_cc_multihome_level_baseline | 80 | |
| visa_cc_second_choice | 50 | |
| param_est_cashcost_pass_baseline | 30 | |
| nilson_num | 39 | |
| dcpc_accept_share | 95 | |
| nilson_num_rewards_pre | 15 | |
| nilson_num_rewards_lost | 7 | |
| kilts_singlehome_cc | 35 | |
| dcpc_debit_owns_credit_card | 79 | changed from 23; check prose context |
| cbdc_entrant_share_baseline | 0 | suspicious — likely stale pipeline; was 0.33 |
| nilson_num_control | 21 | |
| nilson_num_treat | 18 | |
| amex_cc_second_choice | 73 | |
| amex_visa_fee_diff | 15 | |

### Available in table (not standalone scalar file)

| Scalar name | Value | Source |
|-------------|-------|--------|
| consumer_welfare_acceptance_cap | 6 | appendix_intermediate_cap_welfare_baseline.tex, Acceptance row, Cap Fees col |
| consumer_welfare_credit_aversion_cap | 44 | appendix_intermediate_cap_welfare_baseline.tex, Credit Aversion row, Cap Fees col |
| consumer_welfare_option_value_cap | -28 | appendix_intermediate_cap_welfare_baseline.tex, Option Value row, Cap Fees col |

### Empty scalar files (pipeline pending)

| Scalar name | Last known value |
|-------------|-----------------|
| credit_reg_coef | 30 |
| total_reg_coef | 20 |

### Scalars not yet in pipeline output

| Scalar name | Last known value | Used in |
|-------------|-----------------|---------|
| kilts_event_sales_effect | 12 (intro) / 14 (reducedform) | intro:46, reducedform:71 |
| kilts_share_trips_cc_accept | 98 | reducedform:54, response_round2:140,191 |
| nilson_total_merchant_fees_2019 | 120 | intro:7 |
| nilson_top3_share | 90 | data:15 |
| nilson_avg_cc_mdr | 2.25 | data:16 |
| nilson_avg_debit_mdr | 0.7 | data:17 |
| kilts_share_vol_top7_banks | 80 | data:13 |
| kilts_cash_share | 25 | response_round2:665 |
| nilson_num_rewards_cont | 8 | appendix_reduced:155 |
| discover_reward_share_effect | 10 | appendix_reduced:231 |
| low_income_dollar_gain | 200 | counterfactuals:61 |
| network_profit_loss_share | 0.33 | counterfactuals:140 |
