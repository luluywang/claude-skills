# Number Fixer Agent Prompt

## Overview

This prompt supports two modes for keeping hard-coded numbers current in the paper's `.tex` files.

- **MODE A — "Fix structure"**: One-time pass that converts hard-coded numbers to `\scalarinput{}` macros where possible, and annotates the rest.
- **MODE B — "Update all numbers"**: Run after pipeline reruns; follows annotations to refresh stale values.

---

## MODE A — Fix Structure

```
ROLE: LaTeX editor for an economics paper on payment networks.

SCALAR SYSTEM (read-only):
- Scalar files in output/tables/scalars/<name>.tex, each containing one number.
- Three macros (preamble.tex):
    \scalarinput{name}      wraps in $...$, preserves sign
    \absinput{name}         strips leading minus, wraps in $...$
    \scalarpctinput{name}   strips leading "0.", wraps in $...$
- NEVER create or modify scalar files.

STEP 1: Build scalar inventory
  List all files in output/tables/scalars/ and read each value.
  Build lookup: {scalar_name → raw_value}.

STEP 2: Identify hard-coded numbers in target file
  Find inline numeric values in prose: percentages, bps, dollar amounts, counts,
  regression coefficients.

  HOW TO READ NUMBERS THROUGH LATEX MARKUP:
  - "$25$ bps" or "$25\,$bps" → value is 25
  - "25\%" or "$25\%$" → value is 25 (scalar stores 25, not 0.25)
  - "\$120 billion" → value is 120 (scalar stores 120)
  - "around 60\%" → extract 60
  - "$-13$ billion" or "a loss of \$13 billion" → raw value is -13
  - "0.19" in prose → value is 0.19 (use \scalarpctinput if text shows percent)

  SKIP: numbers inside \begin{equation}...\end{equation}, figure dimensions,
  \parencite{}/\ref{} calls, year references (2019, 2011), table row/column indices,
  numbers inside \begin{llm}...\end{llm} blocks.

STEP 3: For each number, do one of:

  A. EXISTING SCALAR: value in inventory matches (or rounds to match)
     - Replace hard-coded digits with \scalarinput{name}. Keep surrounding LaTeX:
         "60\%"          → "\scalarinput{name}\%"
         "\$120 billion" → "\$\scalarinput{name} billion"
         "25 bps"        → "\scalarinput{name} bps"
     - Use \absinput if text already supplies a minus sign (welfare loss context).
     - Use \scalarpctinput if scalar stores 0.xx but text has \% suffix.
     - Remove any pre-existing % HARDCODED comment on that line.

  B. NO EXISTING SCALAR: look for the number in output/tables/
     - Search output/tables/*.tex for a table row whose label semantically matches
       the quantity described in the surrounding text.
     - NOTE: record the raw table value in current=N (unrounded), but when Mode B later
       writes the value into prose, it will round to 2 significant figures.
     - HOW TO READ A LATEX TABLE FILE:
         i.  Find rows: lines matching /\\hspace\{1em\}([^&]+)/ give row labels.
         ii. Split row by & to get cells; cell[0]=label, cell[1]=value, cell[2]=SE, ...
         iii. For multi-column tables, check the \multicolumn headers above the row
              to identify which column index corresponds to which scenario.
         iv. Column order in cf_table_baseline.tex and welfare_table_baseline.tex:
               col 1 = Cap Fees value, col 2 = SE
               col 3 = Uncap Debit value, col 4 = SE
               col 5 = separator (empty)
               col 6 = Monopoly value, col 7 = SE
               col 8 = Public Debit value, col 9 = SE
               col 10 = Dual Routing value, col 11 = SE
         v.  In cap_credit_channel_decomp_baseline.tex, columns are:
               Channel | Consumer | Merchant | Network | Total (SE combined in same cell)
     - Add annotation comment (do NOT change the number yet):
         <number> % HARDCODED[table: filename.tex, row: "row_label", col: col_index] current=N
       where N is the value extracted from the table.
       IMPORTANT: always place a space before the %; LaTeX's % eats the trailing
       newline, so omitting the space merges the next word onto this line.
     - If no matching table cell is found either:
         <number> % HARDCODED[scalar: suggested_name] current=N
       where N is the current hard-coded value.

  C. STATUTORY / ILLUSTRATIVE CONSTANT
     - Fixed by law, or deliberately round illustrative example.
     - Add: <number> % CONSTANT: brief reason
       (same rule: space before % is required to avoid merging with the next line)

STEP 4: Report
  - N numbers replaced with \scalarinput (case A)
  - N numbers annotated with [table:...] (case B, found in table)
  - N numbers annotated with [scalar:...] (case B, not found in table)
  - N numbers marked CONSTANT (case C)
  - List all case-B lines so user knows what scalars to request from pipeline.
```

---

## MODE B — Update All Numbers

```
ROLE: LaTeX editor updating stale hard-coded numbers after estimation reruns.

SNAPSHOT FILE: draft_202601/authoritative_values.md
  Maintains a cached snapshot of all table and scalar values as of the last
  pipeline run. Update this file first whenever the pipeline reruns, then run
  MODE B against the paper.

  STEP 0: Before reading any output/tables/ files, check authoritative_values.md.
  - If a value is listed there, use it directly (skip re-reading the source file).
  - If the snapshot is stale or a value is missing, read the source file and
    update the snapshot before proceeding.

STEP 1: Find all % HARDCODED[...] comments in the target .tex file.

STEP 2: For each comment, get the authoritative value from the source:

  If comment is HARDCODED[scalar: name]:
    - Read output/tables/scalars/name.tex.
    - If file is empty or does not exist: leave comment unchanged (pipeline pending).
    - Otherwise, the authoritative value is the scalar file content.
    - Update current=N in comment to the scalar value.

  If comment is HARDCODED[table: file, row: "label", col: N]:
    - Open output/tables/file.
    - Find the row whose label matches "label" (search for \hspace{1em}label).
    - Split by & and read cell[N] (0-indexed after label).
    - Strip LaTeX formatting and leading/trailing whitespace from the cell value.
    - The authoritative value is this cell value.
    - Update current=N in comment to the cell value.
    - Leave comment in place (unlike scalars, table cells don't auto-update via macros).

STEP 3: For each comment, compare the authoritative value to the number in the prose:

  - Extract the number that appears in the prose immediately before the % HARDCODED comment.
  - Compare to the authoritative value (absolute value if the prose uses direction words
    like "fell by", "decline of", or "loss of").
  - If the prose number does NOT match the authoritative value: update the prose number.
  - This catches BOTH: (a) cases where the table changed since last run, and (b) pre-existing
    mismatches where the prose was never updated to match an earlier table change.

  ROUNDING RULE (2 significant figures):
  - ALL prose numbers must be rounded to at most 2 significant figures.
  - Apply this even when the authoritative value matches the prose — if the current prose
    has 3+ sig figs, round it down.
  - Examples: 199 → 200, 1.23 → 1.2, 0.047 → 0.047 (already 2 sig figs), 1150 → 1200.
  - Exception: numbers that are exact by construction (e.g., a statutory cap of 21 cents,
    a round threshold like 100 bps) should keep their exact value.

STEP 4: Report all changed values with old → new.
  - Separately list: (a) values where current=N changed (table/scalar updated), and
    (b) values where current=N was already correct but prose was wrong.

IMPORTANT PARSING NOTES:
- Table cells may contain spaces around the value: " -195 " → -195
- Negative values: "-195" in table → update prose to "-195" (or "195" if text
  uses "fell by 195 bps" phrasing with explicit direction words)
- "current=N" records the raw table value (possibly negative); match sign exactly
- The \hspace{1em} prefix on row labels may have varying spacing; use flexible match
```

---

## Key Table Structure Reference

### `output/tables/welfare_table_baseline.tex`
Rows (all in `\hspace{1em}` prefix):
- Section header: `$\Delta$ Pecuniary Welfare (bps consumption)`
  - `Low Income`, `Medium Income`, `High Income`
- Section header: `$\Delta$ Welfare ($Bn)`
  - `Consumers`, `Merchants`, `Networks`, `Total`

### `output/tables/cf_table_baseline.tex`
Rows (all in `\hspace{1em}` prefix):
- Section header: `$\Delta$ Prices (bps)`
  - `Credit Fees`, `Credit Rewards`, `Debit Fees`, `Debit Rewards`
- Section header: `$\Delta$ Shares (pp.)`
  - `Cash`, `Debit`, `Credit`
- Section header: `$\Delta$ Fees, Rewards ($Bn)`
  - `Total Fees`, `Total Rewards`

### `output/tables/cap_credit_channel_decomp_baseline.tex`
Columns: Channel | Consumer | Merchant | Network | Total (SE in same cell)
Rows: `Network Effect`, `Price Passthrough`, `Merchant Adoption`, `Total`

### Column index mapping for cf_table / welfare_table (0-indexed after label cell):
| Index | Scenario |
|-------|----------|
| 1     | Cap Fees value |
| 2     | Cap Fees SE |
| 3     | Uncap Debit value |
| 4     | Uncap Debit SE |
| 5     | separator |
| 6     | Monopoly value |
| 7     | Monopoly SE |
| 8     | Public Debit value |
| 9     | Public Debit SE |
| 10    | Dual Routing value |
| 11    | Dual Routing SE |

### `output/tables/scalars/<name>.tex`
Single raw number per file. Key scalars:
- `kilts_top_two_many_cc` — share of consumers multi-homing across CC networks (%)
- `amex_cc_second_choice` — AmEx users' multi-homing rate (%)
- `amex_visa_fee_diff` — bps gap between AmEx and Visa credit merchant fees
- `dual_routing_cc_multihome_level_baseline` — multi-homing level after dual routing (%)
- `debit_reg_coef` — Durbin DiD estimate, decline in signature debit (%)
- `param_est_cashcost_pass_baseline` — cost of cash estimate = fee cap level (bps)
- `nilson_num`, `nilson_num_treat`, `nilson_num_control` — sample counts

---

## Verification Commands

```bash
# After annotation: see all HARDCODED annotations
grep -rn "HARDCODED" draft_202601/*.tex

# After Mode A (fix structure): confirm \scalarinput usage grew
grep -c "scalarinput\|absinput\|scalarpctinput" draft_202601/*.tex

# After Mode B (update values): check for changed lines via git diff
git diff draft_202601/
```
