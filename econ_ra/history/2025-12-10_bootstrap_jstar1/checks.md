# Verification Checks

## Task 1: Implement sector-by-sector bootstrap sampling

### Technical
- [ ] Bootstrap function exists and is callable
- [ ] Function accepts sector identifier and resamples within sector
- [ ] Resampling preserves sector structure (no cross-sector contamination)

### Economic Sense
- [ ] Each sector's bootstrap sample has same size as original

---

## Task 2: Run 200 bootstrap replications

### Technical
- [ ] Output file exists: `../data/intermediate_data/bootstrap_results.csv`
- [ ] Contains 200 rows (one per replication)
- [ ] Contains sufficient statistics for all 6 sectors

### Economic Sense
- [ ] Bootstrap statistics have reasonable variation (not all identical)
- [ ] Mean of bootstrap distribution close to point estimate

---

## Task 3: Aggregate bootstrap results and compute CIs

### Technical
- [ ] Output file exists: `../data/intermediate_data/bootstrap_confidence_intervals.csv`
- [ ] Contains 95% confidence intervals for each statistic
- [ ] No missing values in CI bounds

### Economic Sense
- [ ] CI widths are positive
- [ ] CIs are not implausibly wide (> 10x point estimate) or narrow (< 0.1% of estimate)

---

## Task 4: Output bootstrap standard errors table

### Technical
- [ ] Output file exists: `../output/tables/bootstrap_standard_errors.tex`
- [ ] Valid LaTeX tabular (no float environment, no caption)
- [ ] Uses booktabs formatting

### Economic Sense
- [ ] Standard errors are positive
- [ ] SE magnitudes are reasonable relative to estimates

---

## Task 5: Analyze sector effects plot

### Technical
- [ ] Identify the relevant plot showing cash/debit usage vs fee gaps
- [ ] Document the observed pattern

### Economic Sense
- [ ] Confirm: higher cash/debit sectors have smaller credit-debit fee gaps

---

## Task 6: Trace model logic for sector fee negotiations

### Technical
- [ ] Identify code that implements sector fee negotiations
- [ ] Trace counterfactual: what changes when negotiations removed

### Economic Sense
- [ ] Logic chain is documented step-by-step
- [ ] Identify where intuition breaks down

---

## Task 7: Write sector effects explanation note

### Technical
- [ ] Output file exists: `../code/notes/sector_effects_explanation.md`
- [ ] Explanation addresses the specific puzzle

### Economic Sense
- [ ] Explanation is internally consistent
- [ ] Resolves apparent contradiction between plot pattern and counterfactual results

---

## Task 8: Run J*=1 calibration for all sectors

### Technical
- [ ] Calibration runs without crashing for all 6 sectors
- [ ] Output directory exists: `../data/intermediate_data/calibration_jstar1/`
- [ ] Contains calibrated parameters for each sector

### Economic Sense
- [ ] Parameters are finite (no Inf/NaN)
- [ ] Calibration converges (even if to poor fit)

**Threshold:** Any convergence, regardless of RMSE

---

## Task 9: Produce RMSE comparison table

### Technical
- [ ] Output file exists: `../output/tables/rmse_comparison_jstar1.tex`
- [ ] Valid LaTeX tabular format
- [ ] Contains RMSE for J*=1 and baseline J* for all 6 sectors

### Economic Sense
- [ ] J*=1 RMSE is larger than baseline (expected given worse fit)

**Threshold:** Up to 5x baseline RMSE acceptable

---

## Task 10: Document J*=1 robustness findings

### Technical
- [ ] Output file exists: `../code/notes/jstar1_robustness.md`
- [ ] Documents calibration results and fit quality

### Economic Sense
- [ ] Discusses implications for incomplete pass-through
- [ ] Notes whether main conclusions are robust to J*=1 assumption
