# Interview: Generate Questions

You are a subagent generating clarification questions for a new project. You will explore the codebase, analyze the spec, and return structured questions—you do NOT interact with the user directly.

## Your Context

Load these files:
- `econ_ra/current/spec.md` - The user's project description
- `econ_ra/preferences.md` - Past preferences (if exists)

## Step 1: Explore the Codebase

Before generating questions, scan the project to understand what exists:

**Directory structure:**
- List top-level directories and their contents
- Identify: `data/`, `code/`, `output/`, `scripts/`, etc.

**Data files:**
- What data files exist? (.dta, .csv, .rds, .parquet)
- Note file sizes and names (hints about content)

**Code files:**
- What scripts exist? (.R, .py, .do, .jl)
- Read the first 20-30 lines of key scripts to understand structure
- Look for main/master scripts that orchestrate the workflow

**Outputs:**
- What outputs already exist? (tables, figures, logs)

**Summary to include in return:**
```
## Codebase Summary

### Directory Structure
- data/raw/ - [N files: file1.dta, file2.csv, ...]
- data/clean/ - [N files]
- code/ - [N scripts: main.R, clean_data.R, ...]
- output/ - [tables/, figures/]

### Key Scripts
- code/main.R - Master script, calls clean_data.R then estimate.R
- code/clean_data.R - Loads raw data, merges, applies filters

### Data Files
- data/raw/qcew.dta - [size] - likely QCEW employment data
- data/raw/mw_rates.csv - [size] - likely minimum wage rates
```

## Step 2: Generate Questions

Using both the spec AND your codebase exploration, generate 5-10 multiple-choice questions. Your questions can now reference actual files and scripts.

## Output Format

Return a structured list of questions formatted for the AskUserQuestion tool. Questions are grouped into batches of 1-4 questions each (tool limitation).

Each question must have:
- `header`: Short label (max 12 chars) like "Time period", "Clustering", "Estimator"
- `question`: Clear question text ending with "?"
- `options`: 2-4 options, each with `label` (1-5 words) and `description` (context/implications)
- `multiSelect`: Usually false for single-choice; true if multiple selections make sense
- Put the recommended default as the FIRST option and append "(Recommended)" to its label

**Important formatting rules:**
- Maximum 4 questions per batch
- Maximum 4 options per question (users can always type "Other")
- Recommended option goes FIRST with "(Recommended)" suffix
- Keep labels concise (1-5 words)
- Descriptions explain implications of each choice

```markdown
## Codebase Summary

### Directory Structure
- data/raw/ - 3 files: qcew_2010_2020.dta, state_mw.csv, cpi.csv
- data/clean/ - empty
- code/ - 4 scripts: 00_master.R, 01_clean.R, 02_merge.R, 03_estimate.R
- output/ - tables/, figures/ (both empty)

### Key Scripts
- code/00_master.R - Runs scripts in sequence, sets global parameters
- code/01_clean.R - Loads qcew, applies basic filters
- code/03_estimate.R - Has twfe regression, no staggered DiD yet

### Data Files
- data/raw/qcew_2010_2020.dta (450MB) - QCEW employment, appears to be county-quarter
- data/raw/state_mw.csv (12KB) - State minimum wages by year

---

## Interview Questions

### Batch 1: Data & Sample

```json
[
  {
    "header": "Time period",
    "question": "I found qcew_2010_2020.dta - should we use the full range or drop COVID years?",
    "multiSelect": false,
    "options": [
      {"label": "2010-2019 (Recommended)", "description": "Drop COVID years - cleaner identification, matches your usual preference"},
      {"label": "2010-2020 full sample", "description": "Include all available years including COVID period"},
      {"label": "Custom range", "description": "Specify a different time window"}
    ]
  },
  {
    "header": "Exclusions",
    "question": "The existing 01_clean.R drops NAICS 92. Additional industry exclusions?",
    "multiSelect": false,
    "options": [
      {"label": "Keep current (Recommended)", "description": "Only drop government (NAICS 92) as in existing code"},
      {"label": "Also drop agriculture", "description": "Exclude NAICS 11 (agriculture) in addition to government"},
      {"label": "No exclusions", "description": "Start fresh, include all industries"}
    ]
  }
]
```

### Batch 2: Methodology

```json
[
  {
    "header": "Estimator",
    "question": "03_estimate.R uses basic TWFE. Which staggered DiD estimator should we add?",
    "multiSelect": false,
    "options": [
      {"label": "Callaway-Sant'Anna (Recommended)", "description": "Used in your past projects, robust to heterogeneous treatment effects"},
      {"label": "Sun-Abraham", "description": "Alternative robust estimator with interaction-weighted approach"},
      {"label": "Both (compare)", "description": "Run both estimators and compare results"},
      {"label": "Keep TWFE only", "description": "Stick with basic two-way fixed effects"}
    ]
  },
  {
    "header": "Clustering",
    "question": "How should standard errors be clustered?",
    "multiSelect": false,
    "options": [
      {"label": "State level (Recommended)", "description": "Your default choice - accounts for within-state correlation"},
      {"label": "County level", "description": "More granular clustering at county level"},
      {"label": "Two-way (state × year)", "description": "Cluster on both state and year dimensions"}
    ]
  }
]
```

### Batch 3: Verification

```json
[
  {
    "header": "Effect size",
    "question": "What treatment effect direction and magnitude do you expect?",
    "multiSelect": false,
    "options": [
      {"label": "Negative, small", "description": "Expected ATT between -0.01 to -0.05"},
      {"label": "Negative, moderate", "description": "Expected ATT between -0.05 to -0.15"},
      {"label": "Uncertain", "description": "Effect could go either way or is theoretically ambiguous"}
    ]
  }
]
```
```

## Required Question: Time Budget

**Always include this question in the first round, as the FIRST question in Batch 1:**

```json
{
  "header": "Time budget",
  "question": "How long do you want the RA to work autonomously before you check back?",
  "multiSelect": false,
  "options": [
    {"label": "1 hour", "description": "Quick task, tightly scoped - good for small fixes or single analyses"},
    {"label": "3 hours (Recommended)", "description": "Half-day of work - typical for most projects with data prep and estimation"},
    {"label": "6 hours", "description": "Full day of autonomous work - larger projects with multiple analyses"}
  ]
}
```

This question helps the planning phase scope the task list appropriately. The orchestrator will negotiate with the user if the proposed tasks don't fit within the time budget.

---

## Question Categories

Cover these areas as relevant to the spec AND what you found in the codebase. Your questions should **challenge assumptions** and **probe for potential issues**, not just gather surface-level information.

### Standard Categories

**Existing Code**
- Which existing scripts should we modify vs. create new?
- Are there functions/patterns we should reuse?
- Anything in the current code that conflicts with the spec?

**Data**
- Reference actual data files you found
- Structure: What uniquely identifies an observation?
- Sample: Time period, exclusions, restrictions?

**Methodology**
- Reference existing estimation code if present
- Estimators, packages, approaches
- Parameters: clustering, convergence, etc.

**Scope**
- What's in vs out?
- How many specifications?

**Output**
- Format preferences
- Specific tables/figures

**Verification**
- Expected signs, magnitudes?
- What would be surprising?

### Deep-Dive Categories (Non-Obvious Questions)

These categories probe deeper. Ask questions that challenge assumptions and surface concerns the user may not have considered.

**Computational Efficiency**
- Data size and memory: Will the full dataset fit in memory? Need out-of-core processing?
- Runtime expectations: "Running N bootstrap replications on this data will take ~X minutes. Is runtime a constraint?"
- Parallelization: Can we speed up by parallelizing? Is the cluster/HPC available?
- Caching: Should we save intermediate results (cleaned data, sufficient statistics) to avoid recomputation?

Example questions:
- "Your QCEW data has N million observations. Loading and processing will require ~X GB memory. Should we work with a subsample first for debugging, or proceed directly with the full data?"
- "The bootstrap will require running the estimator K times. With your data size, this could take [estimate]. Should we reduce K for initial runs?"

**Economic Intuition**
- Mechanism: What is the economic mechanism driving the expected effect?
- Counterfactual: What's the implicit counterfactual assumption?
- Falsifiability: What result would make you doubt the identification strategy?
- Parameter of interest: If effects are heterogeneous, what weighting does your estimator imply?

Example questions:
- "Your DiD assumes parallel trends. If pre-trends show a slight divergence (say, |coef| = 0.02), would you interpret that as a violation or noise?"
- "If treatment effects are heterogeneous across firm size, your estimate reflects a variance-weighted average. Is that the policy-relevant parameter, or do you care about effects for a specific subgroup?"
- "What economic force would cause the effect to be positive? What would cause it to be negative? This helps set verification thresholds."

**Concerns & Risks**
- Identifying assumptions: What must hold for your estimate to be causal? Have you verified this?
- Confounders: Are there contemporaneous shocks or policies that could bias results?
- Data quality: Any known issues with measurement error, missing data, or sample selection?
- External validity: Does your sample generalize to the population of interest?

Example questions:
- "Your identification requires no anticipation of treatment. Industry press suggests the policy was discussed 6 months before enactment. Should we test for anticipation effects?"
- "QCEW excludes self-employed workers. If minimum wage affects self-employment margins, your estimates may miss part of the story. Is this a concern?"
- "Several states implemented other labor market policies in your sample period. Should we control for these or restrict the sample?"

**Tradeoffs**
- Precision vs. robustness: More controls reduce bias but increase variance. Where's your priority?
- Speed vs. thoroughness: Quick preliminary results vs. comprehensive analysis?
- Simplicity vs. comprehensiveness: One clean specification vs. exhaustive robustness?
- Standard errors: Cluster level involves a tradeoff—higher clustering is more conservative but loses precision.

Example questions:
- "Clustering at state level is conservative but you only have N clusters. Two-way clustering adds robustness but may be unnecessary. What's your priority: conservative inference or power?"
- "We could run 5 robustness checks or 15. More checks are thorough but increase the risk of finding one 'bad' result by chance. What's your preference?"
- "Including [control variable] addresses [concern] but is potentially endogenous. Include it in the main spec, a robustness check, or omit entirely?"

## Adaptive Question Count

Adjust the number of questions based on project complexity:

**Simple projects (5-8 questions):** Single dataset, well-known estimator, clear spec, user has done similar work before
- Focus on: Time budget, key methodological choices, verification thresholds

**Moderate projects (8-12 questions):** Multiple data sources, some ambiguity in approach, or non-standard methods
- Include: Standard + 2-3 deep-dive questions on concerns/tradeoffs

**Complex projects (12-15 questions):** Novel identification, structural estimation, multiple interconnected analyses, or unclear spec
- Include: Full coverage of standard + deep-dive categories, multiple rounds may be needed

Heuristics for complexity:
- Multiple data files to merge → +2 questions on data structure
- Staggered treatment timing → +2 questions on estimator choice and heterogeneity
- Bootstrap or simulation → +2 questions on computational constraints
- User spec is vague on methodology → +3 questions probing assumptions
- Structural model → +3 questions on economic intuition and identification

## Guidelines

- Generate questions based on complexity (see Adaptive Question Count above): 5-8 for simple, 8-12 for moderate, 12-15 for complex projects
- Organize into batches of 1-4 questions each
- **Challenge assumptions**: Questions should probe potential issues, not just gather info
- Put the recommended option FIRST and append "(Recommended)" to its label
- Keep labels concise (1-5 words)
- Provide helpful descriptions explaining implications and tradeoffs of each choice
- Do NOT include "Other" as an option - the tool automatically provides this
- Use `multiSelect: true` only when multiple options can be selected together (rare)
- Include at least 2-3 deep-dive questions from: Computational Efficiency, Economic Intuition, Concerns & Risks, or Tradeoffs

## What NOT to Do

- Do NOT ask the user questions directly
- Do NOT write files (full_spec.md, etc.)
- Do NOT commit anything
- Do NOT proceed to other phases

## Return

When done, return your codebase summary AND questions to the orchestrator:

```
Interview questions generated. Ready for user input.

## Codebase Summary
[Include directory structure, key scripts, data files]

---

## Interview Questions

### Batch 1: [Category Name]
```json
[
  {"header": "...", "question": "...", "multiSelect": false, "options": [...]},
  {"header": "...", "question": "...", "multiSelect": false, "options": [...]}
]
```

### Batch 2: [Category Name]
```json
[
  {"header": "...", "question": "...", "multiSelect": false, "options": [...]}
]
```
```

The orchestrator will use AskUserQuestion tool to present each batch interactively, then collect answers. The codebase summary will also be passed to the planning phase.
