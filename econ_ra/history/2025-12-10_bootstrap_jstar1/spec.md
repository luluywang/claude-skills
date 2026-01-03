# Project Specification

## Source
From: `code/notes/long_todo.md`

## Tasks

### 1. Bootstrap Standard Errors
The bootstrap procedure needs revision. When computing bootstrap confidence intervals, we need to bootstrap sector-by-sector to match the statistics from the data. The goal is to understand how all the sufficient statistics add up and what kind of uncertainty propagates throughout.

### 2. Sector Effects Explanation
The current explanation of sector effects isn't satisfying. We have a plot showing that sectors with higher cash and debit card usage have smaller gaps between credit and debit card fees due to sector effects. This should predict that removing sector fee negotiations would hurt debit card holders and benefit credit card holders—but the results appear to show the opposite. Need to investigate and explain this discrepancy.

### 3. J*=1 Calibration Exploration
Explore how a J*=1 calibration would work. This is extreme and RMSEs will be strange, but the purpose is to amplify incomplete pass-through effects and demonstrate robustness to quantitatively important forms of market power.
