# Template: Difference-in-Differences Project

Use this as a starting point for DiD/event study projects. Copy and modify for your specific project.

---

## Project: [Name]

### Data

Main data:
- File: `data/raw/[filename]`
- Unit of observation: [establishment/firm/county/state]-[time period]
- Time period: [start] to [end]

Treatment data:
- File: `data/raw/[filename]`
- Treatment definition: [what constitutes treatment]
- Treatment timing: [when treatment occurs, how it varies]

Additional data (if any):
- Controls from: [source]
- Instruments from: [source]

### Research Question

[What causal effect are you trying to estimate?]

### Identification Strategy

Treatment variation:
- [Geographic? Policy changes? Firm-level adoption?]

Key assumptions:
- Parallel trends in absence of treatment
- [Other assumptions specific to your setting]

### Specifications to Estimate

1. **Event study**
   - Pre/post periods: [N before, M after]
   - Reference period: [which period]
   - Controls: [list]
   - Fixed effects: [list]

2. **Baseline DiD**
   - Two-way fixed effects / Callaway-Sant'Anna / Sun-Abraham
   - Controls: [list]

3. **Heterogeneity** (if applicable)
   - By: [dimension 1]
   - By: [dimension 2]

### Robustness Checks

- [ ] Alternative treatment timing definitions
- [ ] Dropping [problematic units/periods]
- [ ] Placebo tests (pre-treatment fake treatment)
- [ ] Different clustering levels
- [ ] Different control sets
- [ ] Alternative estimators (if using TWFE)

### Expected Results

Prior beliefs about:
- Sign of treatment effect: [positive/negative/ambiguous]
- Magnitude: [rough range, cite prior literature if available]
- Heterogeneity: [which groups should show larger/smaller effects]

What would be surprising:
- [Results that would make you question the analysis]

### Deliverables

Tables:
- [ ] Summary statistics
- [ ] Balance table (treated vs control pre-treatment)
- [ ] Main results
- [ ] Heterogeneity
- [ ] Robustness

Figures:
- [ ] Event study plot
- [ ] [Other figures]

### Notes

[Anything else relevant—data quirks, things to watch out for, etc.]
