## Directory structure (RA guide layout — keep it)

| Folder | What goes here |
|---|---|
| `code/` | every script, notebook, workflow script, and the one settings file that holds project paths |
| `data/raw_data/` | inputs no project code produced: downloads, vendor files, PDFs. Never edit or rename them. |
| `data/intermediate_data/` | anything project code or an agent writes that a later step reads: cleaned data, extracted text, agent journals, per-item model output, panels |
| `output/graphs/` | final figures only (`.pdf`, `.png`, `.eps`, `.svg`, `.jpg`) |
| `output/tables/` | final `.tex` tables only; `output/tables/scalars/` holds one-number `.tex` files |
| `writing/` | prose only: papers, notes, slides, `.bib` files. No data files. |
| `logs/` | logs from runs |

Rules:
- Put each new file in the folder its kind belongs to. Do not create new top-level folders.
- An output is either a table or a graph. `output/` holds only `output/graphs/` and
  `output/tables/` (with `output/tables/scalars/`); no other folder (such as `output/analysis/`)
  goes in it. Subfolders inside them are fine (e.g. `output/graphs/appendix/`) if their files
  match the parent: figures under `graphs/`, `.tex` under `tables/`. No `.csv`, `.parquet`,
  `.dta`, `.rds`, `.json`, or other data file goes anywhere in `output/`.
- Every machine-written dataset goes in `data/intermediate_data/`: analysis CSVs, regression
  summaries, the numbers behind a table or figure, panels. A table's CSV goes next to the
  other data, e.g. `data/intermediate_data/tables/`; only its `.tex` goes in `output/tables/`.
- `writing/` holds no `.csv` or other data file. Read numbers into the text from
  `output/tables/scalars/`.
- Git tracks `code/` and `output/` only (`.gitignore` is a whitelist). `data/` and `logs/` are never committed.
- Keep `code/` and `output/` lightweight: no file over {MAX_MB} MB and no `.jsonl` journals or folders of per-item machine output. Those go to `data/intermediate_data/`. A pre-commit hook enforces the size cap and rejects data files in `output/` and `writing/`.
- File names: lowercase letters, digits, underscores.
- Paths in code are relative to the project root. Absolute paths appear only in the settings file, if anywhere.
- Commit code and output changes together, so each output in git matches the code that made it.
- Run `/plumber restructure` to check the layout after large changes.
