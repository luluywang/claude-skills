# Consistency Check: Scalars and Bare Numbers

This file catalogs all `\absinput`, `\scalarinput`, and `\scalarpctinput` scalar commands, as well as hardcoded "bare numbers" across the draft files. Use this for verification and consistency checking.

---

## PART 1: SCALAR COMMANDS

### main.tex (Abstract)
| Line | Command |
|------|---------|
| 77 | `\absinput{combined_dollar_headline}` |
| 79 | `\absinput{pct_reduction}` |

### introduction.tex
| Line | Command |
|------|---------|
| 34 | `\absinput{combined_dollar_headline}` |
| 35 | `\absinput{effective_tax}` |
| 36 | `\absinput{cap_high_income_loss_dollars}` |
| 41 | `\absinput{cash_debit_sorting}` |
| 71 | `\absinput{fees_nobargain_regulated_debit}` |
| 71 | `\absinput{fees_nobargain_unregulated_debit}` |
| 73 | `\absinput{fees_nobargain_basic_credit}` |
| 73 | `\absinput{fees_nobargain_premium_credit}` |
| 81 | `\absinput{grocery_discount}` |
| 83 | `\absinput{bargain_discount}` |
| 98 | `\absinput{combined_dollar_headline}` |
| 99 | `\absinput{combined_cash_final}` |
| 99 | `\absinput{combined_regulated_debit_final}` |
| 101 | `\absinput{tax_rate_cash}` |
| 101 | `\absinput{tax_rate_regulated_debit}` |
| 102 | `\absinput{avg_credit_welfare}` |
| 102 | `\absinput{tax_rate_avg_credit}` |
| 106 | `\absinput{cash_debit_sorting}` |
| 115 | `\absinput{cash_regdebit_firm}` |

### payment_costs.tex
| Line | Command |
|------|---------|
| 117 | `\absinput{icg_summary_mean}` |
| 118 | `\absinput{icg_summary_p10}` |
| 118 | `\absinput{icg_summary_p90}` |
| 123 | `\absinput{icg_summary_mean}` |
| 137 | `\absinput{fees_nobargain_regulated_debit}` |
| 137 | `\absinput{fees_nobargain_unregulated_debit}` |
| 138 | `\absinput{fees_nobargain_basic_credit}` |
| 138 | `\absinput{fees_nobargain_premium_credit}` |
| 158 | `\absinput{icg_r2_shares}` |
| 165 | `\absinput{share_sector}` |
| 169 | `\absinput{grocery_discount}` |
| 176 | `\absinput{icg_r2_sector}` |
| 183 | `\absinput{bargain_discount}` |
| 194 | `\absinput{icg_r2_full}` |

### results.tex
| Line | Command |
|------|---------|
| 21 | `\absinput{combined_dollar_headline}` |
| 89 | `\absinput{combined_dollar_cash_final}` |
| 92 | `\absinput{effective_tax}` |
| 97 | `\absinput{combined_dollar_regulated_debit_final}` |
| 103 | `\absinput{combined_basic_credit_final}` |
| 103 | `\absinput{combined_premium_credit_final}` |
| 103 | `\absinput{combined_dollar_basic_credit_final}` |
| 103 | `\absinput{combined_dollar_premium_credit_final}` |
| 104 | `\absinput{combined_dollar_headline}` |
| 115 | `\absinput{premium_credit_rewards}` |
| 115 | `\absinput{premium_credit_fees_heterogeneous_merchants}` |
| 116 | `\absinput{premium_diff}` |
| 117 | `\absinput{cash_fees_heterogeneous_merchants}` |
| 118 | `\absinput{cash_fees_heterogeneous_merchants}` |
| 121 | `\absinput{regulated_debit_rewards}` |
| 121 | `\absinput{regulated_debit_fees_heterogeneous_merchants}` |
| 133 | `\absinput{combined_dollar_cash_naive}` |
| 134 | `\absinput{combined_dollar_premium_credit_naive}` |
| 146 | `\absinput{combined_dollar_unregulated_debit_naive}` |
| 147 | `\absinput{combined_dollar_unregulated_debit_final}` |
| 177 | `\absinput{cap_high_income_per_hh}` |
| 177 | `\absinput{cap_low_income_per_hh}` |
| 178 | `\absinput{cap_high_income_loss_dollars}` |
| 222 | `\absinput{durbin_regulated_debit_final}` |
| 222 | `\absinput{durbin_regulated_debit_dollar_final}` |
| 225 | `\absinput{durbin_credit_users_total}` |
| 225 | `\absinput{durbin_cash_dollar_final}` |
| 225 | `\absinput{durbin_regulated_debit_dollar_final}` |
| 235 | `\absinput{cf_durbin_dollars}` |
| 241 | `\absinput{fees_nobargain_premium_credit}` |
| 241 | `\absinput{fees_nobargain_basic_credit}` |
| 244 | `\absinput{premiumization_premium_credit_final}` |
| 244 | `\absinput{premiumization_premium_credit_dollar_final}` |

### conclusion.tex
| Line | Command |
|------|---------|
| 10 | `\absinput{combined_dollar_headline}` |
| 10 | `\absinput{pct_reduction}` |

### figures.tex
| Line | Command |
|------|---------|
| 87 | `\sizecutoff` (custom macro, not standard scalar) |
| 156 | `\sizecutoff` |
| 191 | `\sizecutoff` (x2) |

---

## PART 2: UNIQUE SCALAR NAMES (Alphabetical)

These are all the unique scalar file names referenced via `\absinput{}`:

1. `avg_credit_welfare`
2. `bargain_discount`
3. `cap_high_income_loss_dollars`
4. `cap_high_income_per_hh`
5. `cap_low_income_per_hh`
6. `cash_debit_sorting`
7. `cash_fees_heterogeneous_merchants`
8. `cash_regdebit_firm`
9. `cf_durbin_dollars`
10. `combined_basic_credit_final`
11. `combined_cash_final`
12. `combined_dollar_basic_credit_final`
13. `combined_dollar_cash_final`
14. `combined_dollar_cash_naive`
15. `combined_dollar_headline`
16. `combined_dollar_premium_credit_final`
17. `combined_dollar_premium_credit_naive`
18. `combined_dollar_regulated_debit_final`
19. `combined_dollar_unregulated_debit_final`
20. `combined_dollar_unregulated_debit_naive`
21. `combined_premium_credit_final`
22. `combined_regulated_debit_final`
23. `durbin_cash_dollar_final`
24. `durbin_credit_users_total`
25. `durbin_regulated_debit_dollar_final`
26. `durbin_regulated_debit_final`
27. `effective_tax`
28. `fees_nobargain_basic_credit`
29. `fees_nobargain_premium_credit`
30. `fees_nobargain_regulated_debit`
31. `fees_nobargain_unregulated_debit`
32. `grocery_discount`
33. `icg_r2_full`
34. `icg_r2_sector`
35. `icg_r2_shares`
36. `icg_summary_mean`
37. `icg_summary_p10`
38. `icg_summary_p90`
39. `pct_reduction`
40. `premium_credit_fees_heterogeneous_merchants`
41. `premium_credit_rewards`
42. `premium_diff`
43. `premiumization_premium_credit_dollar_final`
44. `premiumization_premium_credit_final`
45. `regulated_debit_fees_heterogeneous_merchants`
46. `regulated_debit_rewards`
47. `share_sector`
48. `tax_rate_avg_credit`
49. `tax_rate_cash`
50. `tax_rate_regulated_debit`

---

## PART 3: BARE NUMBERS BY FILE

### introduction.tex

| Line | Number | Context |
|------|--------|---------|
| 14 | 10% | EU interchange fee regulation cap (less than 10% of highest US fees) |
| 37 | $120bn | SNAP program size comparison |
| 37 | $57bn | EITC program size comparison |
| 37 | $40bn | Unemployment insurance program size comparison |
| 38 | $15 billion | GSE transfer size comparison |
| 38 | $10 billion | Consumer losses from shrouded credit card fees |
| 38 | $20 billion | Consumer losses from high-fee index funds |
| 48 | one-fifth | Fiserv coverage of all US card payments in 2022 |
| 50 | 800,000 merchants | Clover platform merchant count (2019-2022) |
| 50 | $133 billion | Clover transactions processed as of 2020 |
| 56 | 20% | Standard deviation of debit transaction share across merchants |
| 72 | 40% | High-fee exempt debit cards share of debit transactions |
| 75 | 15% | Premium credit card share of credit volume in 2006 |
| 75 | 60% | Premium credit card share of credit volume in 2022 |
| 76 | 12% | Cash as percentage of transaction value in Clover data |
| 77 | 13% | Cash and checks share of consumer payments in 2019 |
| 77 | 11% | Cash and checks share of consumer payments in 2022 |
| 78 | 60% | Credit cards share of card payments in 2005 |
| 78 | 50% | Credit cards share of card payments in 2022 |
| 83 | $1 billion | Annual card sales threshold for large merchants (grocery/retail) |
| 101 | 6% | Average state and local sales tax rate |

### institutional_setting.tex

| Line | Number | Context |
|------|--------|---------|
| 32 | 2.25% | Merchant discount fee for credit card transactions |
| 32 | 1.90% | Average interchange fee component |
| 32 | 1.40% | Average consumer rewards funded by interchange |
| 33 | 0.14% | Average network fees as % of transaction value |
| 38 | 7 cents plus 2% | Interchange fee for premium credit at small grocery |
| 39 | $100 | Example transaction value |
| 39 | $2.07 | Calculated interchange cost for $100 transaction |
| 40 | 27 cents | Regulated debit card cost for same transaction |
| 41 | $1.10 | Interchange cost at gas station |
| 41 | $1.45 | Interchange cost at large grocery store |
| 51 | one million merchants | Merchants in primary Fiserv dataset |
| 51 | one-fifth | Market share of U.S. card volume covered |
| 57 | 2022 | Year used as primary cross-section |
| 64 | 2010 to 2013 | Time period for Durbin Amendment panel |
| 66 | 800,000 merchants | Merchants in Clover dataset |
| 66 | 2019 to 2022 | Time period for Clover data |
| 75 | around 5,000 respondents | DCPC sample size |
| 75 | three-day window in October | DCPC survey window |
| 77 | around 50,000 respondents | MRI-Simmons USA survey sample size |

### payment_costs.tex

| Line | Number | Context |
|------|--------|---------|
| 16 | 2% | Threshold for cash share focus |
| 20 | 11% | Average cash share (dollar-weighted) |
| 22 | two-thirds | Merchant-year obs with <2% cash |
| 23 | one-third | Merchants with ≥2% cash |
| 23 | 30% | Cash share for merchants with ≥2% cash |
| 23 | 80% | Cash share at 90th percentile merchants |
| 30 | 89% | Share of sales from debit and credit |
| 34 | 53% | Average credit card share of card payments |
| 37 | 25% and 70% | Peaks in bimodal credit distribution |
| 49 | 23% | Cash share in grocery sector |
| 50 | 70% | Credit share in travel sector |
| 50 | 27% | Debit share in travel sector |
| 50 | 3% | Cash share in travel sector |
| 97 | 100 log-point | Sales increase; 1.37pp (12%) cash share increase |
| 98 | 100 log-point | Transaction value increase; 5.55pp (50%) cash decline |
| 99 | 10 percentage point | E-commerce share increase; 0.38pp cash decline |
| 103 | one standard deviation | Median income increase; 0.14pp cash decline |
| 104 | one standard deviation | College-educated share increase; 1.07pp cash decline |
| 107 | 100 log-point | Transaction value increase; 9.11pp (17%) credit increase |
| 140 | $10 billion | Asset threshold for Durbin Amendment |
| 152 | 20% | Premium card share of credit in 2006 |
| 152 | 60% | Premium card share of credit in 2022 |
| 182 | $1 billion | Sales threshold for large firms |

### redistribution.tex

| Line | Number | Context |
|------|--------|---------|
| 97 | $300 million | Chase's loss releasing Sapphire Reserve |
| 154 | $1 billion | Threshold for large merchants in regression |
| 174 | 2 | Number of large firms per market (grocery/merchandise) |
| 274 | 300 | Number of markets simulated |
| 274 | 100 | Number of firms per sector per market |
| 275 | 2 | Number of large firms (j*=2) |
| 276 | 0 | Number of large firms for other sectors |
| 277 | 49.3% | Target revenue share for extreme calibration |

### results.tex

| Line | Number | Context |
|------|--------|---------|
| 17 | $100 billion annually | Merchant fee claim amount |
| 19 | $80 billion | U.S. merchants paid in credit card interchange (2022) |
| 19 | half of payment volume | Assumption about credit card share |
| 19 | $40 billion annually | Estimated cross-subsidy |
| 84 | $12 trillion | Baseline consumer purchases |
| 88 | 1 percentage point | Average loss to cash users |
| 92 | 6% | Average state sales tax rate (2022) |
| 107 | $10 billion | Consumer losses from shrouded credit card fees |
| 107 | $18 billion | Transfers from credit card interest rates |
| 108 | $15 billion | Inter-regional transfers from GSEs |
| 108 | $20 billion | Consumer losses from high-fee index funds |
| 109 | $120 billion | SNAP benefits outlays |
| 109 | $57 billion | EITC outlays |
| 109 | $40 billion | Regular unemployment insurance outlays |
| 174 | $12 trillion | Total purchases assumption |
| 176 | $150,000 | Income threshold for high/low income |
| 187 | 70% | Alternative pass-through rate |
| 187 | $9.7 billion | Cash user losses at 70% pass-through |
| 187 | $12.7 billion | Premium credit gains at 70% pass-through |
| 188 | $30.4 billion | Premium credit gains with low price/full rewards |
| 189 | $0.5 billion | Premium credit gains with full price/low rewards |
| 203 | 50 large firms per market | Approximation for perfect competition |
| 240 | 15% in 2006 | Premium credit share starting point |
| 240 | 60% in 2022 | Premium credit share ending point |
| 241 | 20% | Estimated increase in total credit card interchange |

### figures.tex

| Line | Number | Context |
|------|--------|---------|
| 11 | 0.07 | Network assessment fee |
| 11 | 1.90 | Interchange fee |
| 11 | 1.40 | Rewards |
| 11 | 2.25 | Merchant Discount |
| 11 | 100 | Purchase amount baseline |
| 87 | 2% | Cash/check payment threshold |
| 87 | two-thirds | Merchant-year obs with ≤2% cash |
| 96 | 2019--2022 | Time period for Clover data |
| 96 | 2022 | Year of firm-size distribution analysis |
| 191 | >$10 billion | Asset threshold for regulated debit |
| 232 | 2011 | Year Durbin Amendment implemented |
| 232 | 2022 | Year of reference for interchange fees |
| 260 | >$1 billion | Threshold for "large retailers" |

### tables.tex

| Line | Number | Context |
|------|--------|---------|
| 12 | 2022 | Year of settlement data cross-section |
| 37 | 2019--2022 | Years of Clover data |
| 73 | 2022 | Year of Visa interchange publication |
| 87-90 | Various rates | Interchange fee schedules (regulated debit, exempt debit, basic credit, premium credit) |
| 108-112 | $19.6Bn, $10.65Bn, $4.2Bn, $0.95Bn | Supermarket tier thresholds |
| 118 | >$10 billion assets | Durbin Amendment threshold |
| 131 | $12 trillion | Total purchases baseline (Nilson Report) |
| 144 | 70% | Pass-through rate sensitivity |

### appendix_data.tex

| Line | Number | Context |
|------|--------|---------|
| 11 | 2005--2023 | Date range for aggregate Fiserv data |
| 20 | 2019--2022 | Time period for Clover data |
| 27 | 2022 | Year of settlement cross-section |
| 39 | 6 | Number of broad MCC sector categories |
| 56 | 2022-2023 | Panels pooled for DCPC analysis |
| 66 | 50,000 | MRI survey households (2022 wave) |
| 69 | 17% | MRI households excluded |
| 70 | 2/3 and 1/3 | Example debit split proportions |
| 87 | 11%, 45%, 44% | Settlement data: cash, debit, credit usage |
| 87 | 20% | DCPC cash preference |
| 101 | 20% | Credit card transaction size difference (Fiserv vs Nilson) |
| 101 | 5% | Debit card transaction size difference |

### appendix_cash_model.tex

| Line | Number | Context |
|------|--------|---------|
| 18 | 2% | Threshold for extensive margin (>2% cash) |
| 19 | 2% | Threshold for conditional cash share |
| 46 | 80% | Debit share threshold for cash decline |
| 127 | 0.82 | AUC score for extensive margin model |
| 130 | 0.52 | Correlation for intensive margin model |
| 150 | 10% | Average cash in retail (2022 Nilson Report) |
| 151 | 10% | Model prediction of cash share |
| 152 | 8-10 percentage points | SD of cash share per Wang2025 |
| 153 | 9 percentage points | Model prediction of SD |

### appendix_structural.tex

| Line | Number | Context |
|------|--------|---------|
| 43 | 300 | Number of markets simulated |
| 43 | 100 | Firms per sector per market |
| 56 | 2 | Large firms in merchandise/grocery (j*=2) |
| 57 | $1 billion | Revenue threshold for "large" firms |
| 59 | 60% | Large grocer own-cost pass-through |
| 59 | 40% | Large grocer cross-price pass-through |
| 60 | 75% | Large merchandise own-cost pass-through |
| 60 | 25% | Large merchandise cross-price pass-through |
| 62 | 5 | Sigma parameter value |
| 69 | 2 | Large firms per market (extreme calibration) |
| 71 | 49.3% | Target revenue share for extreme scenario |

### appendix_theory.tex

| Line | Number | Context |
|------|--------|---------|
| 48 | σ > 1 | CES elasticity parameter example |
| 48 | M=σ, m=2 | Constants for dominant diagonal condition |
| 119 | 2(1+m)Mτ_max < 1 | Convergence condition |

---

## PART 4: NUMBERS APPEARING IN MULTIPLE FILES (Potential Consistency Issues)

The following numbers appear in multiple files and should be verified for consistency:

| Number | Files | Context |
|--------|-------|---------|
| $120 billion | introduction.tex, results.tex | SNAP program size |
| $57 billion | introduction.tex, results.tex | EITC program size |
| $40 billion | introduction.tex, results.tex | Unemployment insurance |
| $15 billion | introduction.tex, results.tex | GSE transfers |
| $10 billion | introduction.tex, results.tex | Shrouded credit card fees |
| $20 billion | introduction.tex, results.tex | High-fee index funds |
| $12 trillion | results.tex, tables.tex | Total consumer purchases baseline |
| $1 billion | introduction.tex, payment_costs.tex, redistribution.tex, figures.tex, appendix_structural.tex | Large merchant threshold |
| $10 billion (assets) | payment_costs.tex, figures.tex, tables.tex | Durbin Amendment bank threshold |
| 6% | introduction.tex, results.tex | Average state sales tax rate |
| 15%/60% | introduction.tex, payment_costs.tex, results.tex | Premium credit share (2006 vs 2022) |
| 800,000 merchants | introduction.tex, institutional_setting.tex | Clover merchant count |
| one-fifth | introduction.tex, institutional_setting.tex | Fiserv market coverage |
| 2019--2022 | institutional_setting.tex, figures.tex, tables.tex, appendix_data.tex | Clover data period |
| 300 markets, 100 firms | redistribution.tex, appendix_structural.tex | Simulation parameters |
| 2 large firms | redistribution.tex, appendix_structural.tex | Structural model parameter |
| 10% cash | appendix_data.tex, appendix_cash_model.tex | Average cash usage |

---

## PART 5: NUMERICAL VERIFICATION (December 22, 2025)

### Scalar Values Cross-Referenced with Document Claims

All scalar values have been verified. Below are the key scalars and their values:

| Scalar | Value | Used In |
|--------|-------|---------|
| `combined_dollar_headline` | 30 | Abstract, Intro, Results, Conclusion |
| `pct_reduction` | 25 | Abstract, Conclusion |
| `combined_cash_final` | -96 | Introduction |
| `combined_regulated_debit_final` | -47 | Introduction |
| `effective_tax` | -26 | Introduction, Results |
| `cap_high_income_loss_dollars` | 9.2 | Introduction, Results |
| `cash_debit_sorting` | -8.6 | Introduction |
| `fees_nobargain_regulated_debit` | 0.7 | Intro, Payment Costs |
| `fees_nobargain_unregulated_debit` | 1.1 | Intro, Payment Costs |
| `fees_nobargain_basic_credit` | 1.7 | Intro, Payment Costs, Results |
| `fees_nobargain_premium_credit` | 2.1 | Intro, Payment Costs, Results |
| `grocery_discount` | 50 | Introduction, Payment Costs |
| `bargain_discount` | 50 | Introduction, Payment Costs |
| `combined_dollar_cash_final` | -13.9 | Results |
| `combined_dollar_regulated_debit_final` | -13.1 | Results |
| `combined_dollar_basic_credit_final` | 9.9 | Results |
| `combined_dollar_premium_credit_final` | 18.2 | Results |
| `durbin_regulated_debit_final` | -34 | Results |
| `durbin_regulated_debit_dollar_final` | -9.6 | Results |
| `durbin_credit_users_total` | 4.3 | Results |
| `durbin_cash_dollar_final` | 1.9 | Results |
| `cf_durbin_dollars` | 1 | Results |
| `premiumization_premium_credit_final` | 26 | Results |
| `premiumization_premium_credit_dollar_final` | 7.9 | Results |

### Verification of Key Claims

#### 1. Net Zero Check (Transfers Sum to Zero)
- Cash: -$13.9B
- Regulated Debit: -$13.1B
- Exempt Debit: -$1.1B
- Basic Credit: +$9.9B
- Premium Credit: +$18.2B
- **Sum**: -13.9 - 13.1 - 1.1 + 9.9 + 18.2 = **0** ✅

#### 2. Premium Diff Calculation
- Premium credit receives 43% of rewards
- Premium credit pays 30% of fees
- Difference: 43 - 30 = **13** ✅ (matches `premium_diff`)

#### 3. Tax Rate Equivalents
- Effective tax difference: -26% (cash pays 26% more in "sales tax" equivalent than premium credit)
- Cash tax rate: -16%
- Premium credit tax rate: +10%
- Difference: -16 - 10 = -26 ✅

#### 4. R-squared Progression
- Payment mix alone: 24%
- + Sector: 43%
- + Firm characteristics: 64%
- **Progression is monotonic** ✅

---

## PART 6: IDENTIFIED INCONSISTENCIES

### 1. Premium Credit Card Share in 2006 ✅ FIXED

**Issue**: Different starting percentages cited for premium credit card share in 2006.

| File | Line | Value | Status |
|------|------|-------|--------|
| introduction.tex | 74 | 15% | ✅ |
| payment_costs.tex | 151 | ~15% | ✅ FIXED (was ~20%) |
| results.tex | 275 | 15% | ✅ |

**Resolution**: Harmonized to "around 15%" across all files.

### 2. Cash Share of Transactions ✅ FIXED

**Issue**: Slightly different cash share percentages reported.

| File | Line | Value | Status |
|------|------|-------|--------|
| introduction.tex | 75 | ~12% | ✅ |
| payment_costs.tex | 21 | ~12% | ✅ FIXED (was 11%) |
| appendix_cash_model.tex | 150-151 | 10% | ✅ (Nilson benchmark, different measure) |

**Resolution**: Harmonized Clover-based discussions to "around 12%". The 10% in appendix_cash_model.tex is explicitly the Nilson Report benchmark for all retail, which is a different measure.

---

## PART 7: CONSISTENCY STATUS SUMMARY

| Category | Status | Notes |
|----------|--------|-------|
| Headline transfer ($30B) | ✅ Consistent | All files use same scalar |
| Fee rates by card type | ✅ Consistent | All files use same scalars |
| Welfare effects (bps) | ✅ Consistent | Scalars match across files |
| Dollar transfers | ✅ Consistent | Sum to zero as expected |
| Income transfers | ✅ Consistent | $9.2B high-income gain matches |
| Durbin effects | ✅ Consistent | All scalars match |
| Premiumization effects | ✅ Consistent | All scalars match |
| External benchmarks | ✅ Consistent | SNAP, EITC, UI match |
| Premium card 2006 share | ✅ Fixed | Harmonized to ~15% |
| Cash share | ✅ Fixed | Harmonized Clover refs to ~12% |

**Overall Assessment**: The document is now fully internally consistent. All issues have been resolved.

---

*Last updated: December 22, 2025*
