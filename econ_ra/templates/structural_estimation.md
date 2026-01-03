# Template: Structural Estimation Project

Use this as a starting point for structural demand/supply estimation projects. Copy and modify for your specific project.

---

## Project: [Name]

### Data

Outcome data:
- File: `data/raw/[filename]`
- Unit: [product-market-time]
- Key variables: [quantities, prices, shares]

Product characteristics:
- File: `data/raw/[filename]`  
- Variables: [list characteristics]

Cost/supply data (if applicable):
- File: `data/raw/[filename]`
- Variables: [input prices, cost shifters]

Market definition:
- Geographic: [DMA/state/national]
- Time: [quarter/year]
- Outside good: [definition and how computed]

### Model

Demand side:
- [ ] Logit
- [ ] Nested logit (nesting structure: )
- [ ] Random coefficients logit
  - Random coefficients on: [which variables]
  - Distribution: [normal/lognormal]
  - Demographics: [if using micro moments]

Supply side:
- [ ] Nash-Bertrand (single product firms)
- [ ] Nash-Bertrand (multi-product firms)
- [ ] Other: [describe]

### Instruments

For price endogeneity:
- [ ] BLP instruments (rival characteristics)
- [ ] Hausman instruments (prices in other markets)
- [ ] Cost shifters
- [ ] Differentiation IVs (Gandhi-Houde)
- [ ] Other: [describe]

### Estimation

Method:
- [ ] GMM
- [ ] MPEC
- [ ] Nested fixed point (BLP algorithm)

Software:
- [ ] PyBLP
- [ ] Custom code
- [ ] Other: [specify]

Convergence criteria:
- Inner loop: [tolerance]
- Outer loop: [tolerance]

### Post-Estimation

Compute:
- [ ] Own-price elasticities
- [ ] Cross-price elasticities (which products?)
- [ ] Marginal costs
- [ ] Markups

### Counterfactuals (if applicable)

- [ ] Merger simulation: [which firms]
- [ ] Price regulation: [describe]
- [ ] Product entry/exit: [describe]
- [ ] Other: [describe]

### Expected Results

Demand:
- Price coefficient: [expected sign and rough magnitude]
- Elasticities: [expected range for own-price]
- Nesting parameter: [if nested logit, expected range]

Supply:
- Markups: [expected range as % of price]
- Marginal costs: [sanity check—should be positive, less than price]

### Robustness Checks

- [ ] Alternative instrument sets
- [ ] Different nesting structures
- [ ] Excluding certain products/markets
- [ ] Alternative optimization starting values
- [ ] Different weighting matrices

### Deliverables

Tables:
- [ ] Summary statistics
- [ ] Demand estimates (across specifications)
- [ ] Elasticity matrix (selected products)
- [ ] Marginal costs and markups
- [ ] Counterfactual results

Figures:
- [ ] Elasticity distributions
- [ ] Markup distributions
- [ ] Counterfactual price changes

### Notes

[Data quirks, known issues, things to watch for]

---

## Sense Check Reference

Typical values from literature (adjust for your context):

| Parameter | Typical Range | Suspicious If |
|-----------|---------------|---------------|
| Price coefficient (α) | -0.1 to -1.0 | Positive, or |α| > 5 |
| Own-price elasticity | -1 to -5 | Positive, or |ε| > 10 |
| Nesting parameter (σ) | 0.3 to 0.9 | < 0 or > 1 |
| Markup (% of price) | 10% to 50% | Negative, or > 80% |
| Marginal cost | Positive | Negative |
