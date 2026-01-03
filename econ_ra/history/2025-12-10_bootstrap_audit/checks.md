# Verification Checks

## Task 1: Audit redistribution/welfare tables for bootstrap SEs

### Technical
- [ ] Identify all main redistribution/welfare tables in output/tables/
- [ ] Each table contains standard error columns or rows
- [ ] SEs are computed from bootstrap (not analytical)

### Economic Sense
- [ ] Bootstrap SEs are reasonable relative to point estimates (not too large/small)
- [ ] SEs are consistent across similar quantities

---

## Task 2: Update J* calibration for non-large-firm sectors

### Technical
- [ ] Code modification complete for sectors 0, 5, 13, 15
- [ ] J*=0 (or equivalent "no large firms") for sectors 0, 5, 13, 15
- [ ] J*=1 preserved for sectors 7, 9

### Economic Sense
- [ ] Setting makes economic sense: non-large-firm sectors have no bargaining power

---

## Task 3: Re-run J* calibration with corrected spec

### Technical
- [ ] Calibration runs without errors for all 6 sectors
- [ ] Output files created in ../data/intermediate_data/calibration_jstar_corrected/
- [ ] Calibration converges for each sector

### Economic Sense
- [ ] Calibrated parameters are in reasonable ranges
- [ ] RMSE values indicate reasonable fit (may be worse than baseline, that's expected)

---

## Task 4: Run zero fees counterfactual

### Technical
- [ ] Counterfactual script runs without errors
- [ ] Output file created: counterfactual_zero_fees_jstar_corrected.csv
- [ ] Contains welfare measures for all consumer groups

### Economic Sense
- [ ] Welfare changes have expected signs
- [ ] Magnitudes are comparable to baseline zero-fees counterfactual

---

## Task 5: Add welfare effects to four-way comparison table

### Technical
- [ ] Table file created/updated: four_way_comparison_with_jstar.tex
- [ ] LaTeX compiles without errors
- [ ] Contains J* robustness column alongside baseline

### Economic Sense
- [ ] Welfare effects are directionally consistent with baseline
- [ ] Differences from baseline are interpretable

---

## Task 6: Create sector fee breakdown table

### Technical
- [ ] Table created: sector_fee_breakdown.tex
- [ ] Contains 5 card types (cash, reg debit, unreg debit, basic credit, premium credit)
- [ ] Contains 3 consumer groups (cash users, debit users, credit users)
- [ ] LaTeX tabular format (no float environment)

### Economic Sense
- [ ] Credit card effects show expected pattern (benefits to credit users)
- [ ] Regulated debit effects are visible for diagnosis

---

## Task 7: Document sector fee breakdown findings

### Technical
- [ ] Analysis note created: ../code/notes/sector_fee_breakdown_analysis.md
- [ ] Covers credit card intuition verification
- [ ] Addresses regulated debit puzzle

### Economic Sense
- [ ] Explanation is economically coherent
- [ ] Identifies mechanism for regulated debit "wrong way" result
