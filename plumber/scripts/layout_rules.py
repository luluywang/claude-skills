#!/usr/bin/env python3
"""
layout_rules.py — File classes and the content rules for output/ and writing/.

One implementation, used by layout_plan.py (restructure plan), lightweight_audit.py
(pre-git check), and repo_setup.py (pre-commit hook).

Rules (RA Guide §2.4–2.5, §4):
  output/                 an output is a table or a graph: only output/graphs/ and output/tables/,
                          no other folder and no loose files. Subfolders inside graphs/ and
                          tables/ are allowed; their files must match the parent's type.
  output/graphs/          figures only: GRAPH_FILE_EXT.
  output/tables/          .tex only (output/tables/scalars/ holds one-number .tex files).
  writing/                prose and its build files; no data files (WRITING_BANNED_EXT).
Anything else found there belongs in data/intermediate_data/, at the mirrored path:
  output/analysis/        -> data/intermediate_data/analysis/
  output/tables/x.csv     -> data/intermediate_data/tables/x.csv
  writing/draft/x.csv     -> data/intermediate_data/writing/draft/x.csv
"""

from pathlib import Path

CODE_EXT = {".py", ".r", ".jl", ".do", ".ipynb", ".js", ".ts", ".sh", ".m", ".sql", ".lua"}
DATA_EXT = {".csv", ".tsv", ".parquet", ".feather", ".arrow", ".dta", ".rds", ".rdata",
            ".xlsx", ".xls", ".json", ".jsonl", ".txt", ".pdf", ".zip", ".gz", ".xbrl",
            ".jld2", ".h5", ".hdf5", ".pkl", ".pickle", ".sas7bdat", ".xml", ".html", ".docx"}
GRAPH_EXT = {".png", ".svg", ".eps", ".jpg", ".jpeg"}
TABLE_EXT = {".tex"}
LOG_EXT = {".log", ".out", ".err"}

# Allowed file types per presentation folder under output/.
OUTPUT_ALLOWED = {"graphs": GRAPH_EXT | {".pdf"}, "tables": TABLE_EXT}
# Data formats that never belong in writing/ (documents such as .pdf, .txt, .docx stay).
WRITING_BANNED_EXT = DATA_EXT - {".pdf", ".txt", ".docx", ".html"}

INTERMEDIATE = Path("data/intermediate_data")
SKIP = {".DS_Store", "__pycache__", ".ipynb_checkpoints", ".git"}


def _files(d: Path) -> list[Path]:
    return [p for p in d.rglob("*") if p.is_file() and not (SKIP & set(p.parts))]


def _visible(d: Path):
    return sorted(p for p in d.iterdir() if p.name not in SKIP)


def content_rows(root: Path) -> list[dict]:
    """Move rows for files in output/ or writing/ that break the folder rules."""
    rows = []

    def move(p: Path, reason: str):
        rel = p.relative_to(root)
        rest = rel.relative_to("output") if rel.parts[0] == "output" else rel
        rows.append(dict(action="move", src=str(rel), dst=str(INTERMEDIATE / rest),
                         confidence="low", reason=reason, evidence=""))

    out = root / "output"
    if out.is_dir():
        for p in _visible(out):
            if p.is_dir() and p.name in OUTPUT_ALLOWED:
                ok = OUTPUT_ALLOWED[p.name]
                for f in _files(p):
                    if f.suffix.lower() not in ok:
                        move(f, f"{f.suffix or 'no-extension'} file in output/{p.name}/ "
                                f"(allowed: {', '.join(sorted(ok))})")
            elif p.is_dir():
                move(p, f"output/{p.name}/ is not a presentation folder "
                        f"(only output/graphs/ and output/tables/)")
            else:
                move(p, "loose file in output/ (only output/graphs/ and output/tables/)")

    wr = root / "writing"
    if wr.is_dir():
        for f in _files(wr):
            if f.suffix.lower() in WRITING_BANNED_EXT:
                move(f, f"data file ({f.suffix}) in writing/")
    return rows


def hook_case_lines() -> str:
    """Bash `case` arms that reject the same files at commit time (repo_setup.py hook)."""
    arms = []
    for sub, ok in OUTPUT_ALLOWED.items():
        allowed = "|".join(f"output/{sub}/*{e}" for e in sorted(ok))
        arms.append(f"    {allowed}) ;;")
        arms.append(f'    output/{sub}/*) bad "$f" "output/{sub}/ takes only {" ".join(sorted(ok))}";;')
    arms.append('    output/*) bad "$f" "output/ holds only graphs/ and tables/";;')
    banned = "|".join(f"writing/*{e}" for e in sorted(WRITING_BANNED_EXT))
    arms.append(f'    {banned}) bad "$f" "data file in writing/";;')
    return "\n".join(arms)
