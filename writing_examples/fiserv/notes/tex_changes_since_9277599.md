# Changes to .tex files since commit 9277599

Summary of non-formatting `.tex` file changes between commit `927759987e` and `HEAD` (commit `4795139`). Excludes ~57 instances of `\textit{...}` removal.

---

## `main.tex` (Abstract)

- **Typo fix**: "intro redistribution" → "into redistribution"
- **Typo fix**: "howlighting" → "highlighting"

## `introduction.tex`

- Replaced straight quotes with LaTeX double quotes: `"tax"` → `` ``tax'' ``
- Replaced en-dash `—` with LaTeX triple-dash `---` (two instances)
- Removed extra space before comma: `"of transfer , and"` → `"of transfer, and"`
- Merged broken sentence: `"Under these assumptions,\nOur sufficient statistic"` → `"Under these assumptions, our sufficient statistic"`

## `institutional_setting.tex`

- Removed line break inside a footnote (consolidated into single paragraph)

## `payment_costs.tex`

- "This variation in fees that can generate" → "This variation in fees can generate" (removed erroneous "that")
- "The data shows" → "The data show"
- Added missing comma after "Sections \ref{sec:institutional-data} and \ref{sec:costs}"

## `redistribution.tex`

- Added comma: "consumers' price elasticity) so a higher" → "consumers' price elasticity), so a higher"

## `results.tex`

- Fixed LaTeX quotes: `"pay"` → `` ``pay'' ``
- Added period to paragraph heading: `\paragraph{Putting the numbers in context}` → `\paragraph{Putting the numbers in context.}`

## `figures.tex`

- **Figure `merchant_cs_credit_share_by_sector`**: Changed "firms in the broader settlement data" → "merchants in the settlement data in 2022" and added sample restriction note.
- **Figure `payment_income`**: Replaced brief generic note with detailed description of data sources (DCPC 2022--2023, MRI-Simmons 2022), payment categories, and reweighting methodology.
- **Figure `interchange_decomp`**: Replaced brief note with detailed description of each model line (card type composition, sector, firm characteristics).
- **Figure `scatter_interchange`**: Fixed typo "abd" → "and".
- **Figure `redistribution` (Panel a)**: Renamed subcaption from "Eliminating Interchange Fees" → "Effects of Current Interchange Fees vs Zero Interchange".
- **Figure `redistribution` (combined)**: Rewrote note to describe each panel's counterfactual clearly using "vs." framing.

## `tables.tex`

- Standardized `\emph{Notes:}` → `\textit{Notes:}` (two instances)
- Added missing period at end of three table notes (redistribution, Durbin, premiumization)
- **Table `redist`**: Renamed from "Effects of Capping Interchange Fees" → "Net Transfers from Interchange Fees"; rewrote note to say "net transfers from interchange fees relative to a world with zero interchange fees."
- **Table `durbin`**: Fixed double space and capitalization: `"Table \ref{tab:durbin}  Shows"` → `"Table \ref{tab:durbin} shows"`

## `appendix_cash_model.tex`

- Removed duplicate word: "credit cards and and the average" → "credit cards and the average" (in commented-out text)

## `appendix_data.tex`

- Fixed accidental capitalization: "shows THE summary statistics" → "shows the summary statistics"

## `appendix_durbin.tex`

- Fixed accidental capitalization: "WHICH WAS driven" → "which was driven"

## `benchmark_calculation.tex`

- Replaced en-dashes with LaTeX triple-dashes: "half—cash" → "half---cash" and "users—collectively" → "users---collectively"

## `real_effects.tex`

- Capitalization: "zip-code" → "ZIP-code"
