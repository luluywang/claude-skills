## Directory structure (RA guide layout — keep it)

| Folder | What goes here |
|---|---|
| `code/` | every script, notebook, workflow script, and the one settings file that holds project paths |
| `data/raw_data/` | inputs no project code produced: downloads, vendor files, PDFs. Never edit or rename them. |
| `data/intermediate_data/` | anything project code or an agent writes that a later step reads: cleaned data, extracted text, agent journals, per-item model output, panels |
| `output/graphs/` | final figures |
| `output/tables/` | final `.tex` tables; `output/tables/scalars/` holds one-number `.tex` files |
| `output/` (other) | small human-read results: summary CSVs, memos |
| `logs/` | logs from runs |

Rules:
- Put each new file in the folder its kind belongs to. Do not create new top-level folders.
- Git tracks `code/` and `output/` only (`.gitignore` is a whitelist). `data/` and `logs/` are never committed.
- Keep `code/` and `output/` lightweight: no file over {MAX_MB} MB and no `.jsonl` journals or folders of per-item machine output. Those go to `data/intermediate_data/`. A pre-commit hook enforces the size cap.
- File names: lowercase letters, digits, underscores.
- Paths in code are relative to the project root. Absolute paths appear only in the settings file, if anywhere.
- Commit code and output changes together, so each output in git matches the code that made it.
- Run `/plumber restructure` to check the layout after large changes.
