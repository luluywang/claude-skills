# Research Project Orchestrator

Simplified workflow for R-based research projects.

## Core Loop
Plan approved -> orchestrator activates -> implement -> verify -> score

## Verification Checklist
- Scripts execute cleanly
- All package dependencies at top
- No absolute paths
- set.seed() for stochastic operations
- Output files at specified locations
- Tolerance checks pass

## Quality Gate
Score >= 80 -> complete. Score < 80 -> fix, re-verify, re-score.

## Scope
Applies to R scripts, simulations, and data analysis in scripts/, explorations/, and Figures/ directories.
