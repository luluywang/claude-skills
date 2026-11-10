#!/usr/bin/env python3
"""
layout_plan.py — Compare a project directory to the RA-guide layout and draft a move plan.

Usage: python3 layout_plan.py <project_root> [--out current/layout_plan.csv]

Target layout (Lulu Wang, RA Guide, section 2.4):
    code/
    data/raw_data/  data/intermediate_data/
    output/graphs/  output/tables/  output/tables/scalars/
    logs/
    .gitignore      (git covers code/ and output/, not data/)

Writes a CSV plan with columns: action, src, dst, confidence, reason, evidence
  action     = move | trash | keep | review
  confidence = high | low   (low rows must be decided by the reviewer before apply)
Prints a JSON summary of template checks to stdout.

The script only collects facts and drafts rows. It never moves anything.
"""

import argparse
import csv
import hashlib
import json
import os
import re
import subprocess
from collections import defaultdict
from pathlib import Path

TEMPLATE_DIRS = [
    "code", "data", "data/raw_data", "data/intermediate_data",
    "output", "output/graphs", "output/tables", "output/tables/scalars", "logs",
]
CODE_EXT = {".py", ".r", ".jl", ".do", ".ipynb", ".js", ".ts", ".sh", ".m", ".sql", ".lua"}
DATA_EXT = {".csv", ".tsv", ".parquet", ".feather", ".arrow", ".dta", ".rds", ".rdata",
            ".xlsx", ".xls", ".json", ".jsonl", ".txt", ".pdf", ".zip", ".gz", ".xbrl",
            ".jld2", ".h5", ".hdf5", ".pkl", ".pickle", ".sas7bdat", ".xml", ".html", ".docx"}
GRAPH_EXT = {".png", ".svg", ".eps", ".jpg", ".jpeg"}
TABLE_EXT = {".tex"}
LOG_EXT = {".log", ".out", ".err"}
# Root entries the guide allows besides the template dirs.
ROOT_KEEP = {
    ".git", ".gitignore", ".claude", "current", "Makefile", "makefile", "README.md", "README",
    "CLAUDE.md", "AGENTS.md", "PAPERCUTS.md", "TODO.md", "Project.toml", "Manifest.toml",
    "environment.yml", "renv.lock", "requirements.txt", "pyproject.toml", ".Rprofile", "dir",
}
# Root folders of writing and reading material: outside the guide, but not pipeline files.
DOC_DIRS = {"notes", "writing", "literature", "slides", "paper", "draft", "drafts", "docs",
            "spec", "specs", "tasks", "memo", "memos", "presentations", "references"}
JUNK = {".DS_Store", "__pycache__", ".ipynb_checkpoints", ".Rhistory", "Thumbs.db"}
GOOD_NAME = re.compile(r"^[a-z0-9_]+(\.[a-z0-9_]+)*$")
COPY_SUFFIX = re.compile(r"^(?P<stem>.*?)(?: \(\d+\)| copy(?: \d+)?)(?P<ext>\.[^.]+)?$")


def md5(p: Path) -> str:
    h = hashlib.md5()
    with open(p, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def ext_profile(path: Path) -> dict:
    """Count files by class under a directory (or for one file)."""
    files = [path] if path.is_file() else [p for p in path.rglob("*") if p.is_file()]
    prof = defaultdict(int)
    for f in files:
        if f.name in JUNK or any(part in JUNK for part in f.parts):
            continue
        e = f.suffix.lower()
        cls = ("code" if e in CODE_EXT else "graph" if e in GRAPH_EXT else
               "table" if e in TABLE_EXT else "log" if e in LOG_EXT else
               "data" if e in DATA_EXT else "other")
        prof[cls] += 1
    return dict(prof)


def code_files(root: Path) -> list[Path]:
    out = []
    for p in root.rglob("*"):
        if (p.is_file() and p.suffix.lower() in CODE_EXT | {".toml", ".yml", ".yaml"}
                and not any(x in p.parts for x in (".git", "current", "__pycache__"))
                and "data" not in p.relative_to(root).parts[:1]):
            out.append(p)
    return out


def mentions(name: str, files: list[Path], root: Path) -> list[str]:
    """Code lines that name this root entry inside a string literal."""
    pat = re.compile(r"""['"`]""" + re.escape(name) + r"""(?:/[^'"`]*)?['"`]""")
    hits = []
    for f in files:
        try:
            for i, line in enumerate(f.read_text(errors="ignore").splitlines(), 1):
                if pat.search(line):
                    hits.append(f"{f.relative_to(root)}:{i}: {line.strip()[:140]}")
        except OSError:
            pass
    return hits


def writes_to(hits: list[str]) -> bool:
    w = re.compile(r"write|to_csv|save|open\(.+['\"]w|mkdir|OUT\s*=|out\s*=|dump|export|sink")
    return any(w.search(h) for h in hits)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("root")
    ap.add_argument("--out", default=None)
    a = ap.parse_args()
    root = Path(a.root).resolve()
    out = Path(a.out) if a.out else root / "current" / "layout_plan.csv"
    out.parent.mkdir(parents=True, exist_ok=True)

    cfiles = code_files(root)
    rows = []

    def row(action, src, dst="", conf="high", reason="", evidence=""):
        rows.append(dict(action=action, src=src, dst=dst, confidence=conf,
                         reason=reason, evidence=evidence))

    # Duplicate copies at any depth: "name (1).pdf" next to identical "name.pdf".
    trashed = set()
    for p in root.rglob("*"):
        if not p.is_file() or ".git" in p.parts or "current" in p.relative_to(root).parts[:1]:
            continue
        m = COPY_SUFFIX.match(p.name)
        if not m:
            continue
        twin = p.with_name(m.group("stem") + (m.group("ext") or ""))
        if twin.exists() and twin != p and md5(twin) == md5(p):
            rel = str(p.relative_to(root))
            trashed.add(rel)
            row("trash", rel, str(twin.relative_to(root)), "high",
                "byte-identical copy of dst")

    for entry in sorted(root.iterdir(), key=lambda p: p.name.lower()):
        name = entry.name
        rel = name
        if rel in trashed:
            continue
        if name in JUNK:
            if name != ".DS_Store":
                row("trash", rel, "", "high", "cache or editor junk")
            continue
        if name in ROOT_KEEP or name in TEMPLATE_DIRS[:1] + ["data", "output", "logs"]:
            row("keep", rel, rel, "high", "allowed at root by the guide")
            continue
        if entry.is_dir() and (name.lower() in DOC_DIRS or name.endswith("-env")):
            row("keep", rel, rel, "high", "documents or environment folder; outside the pipeline")
            continue
        prof = ext_profile(entry)
        total = sum(prof.values()) or 1
        dominant = max(prof, key=prof.get) if prof else "other"
        share = prof.get(dominant, 0) / total
        hits = mentions(name, cfiles, root) if entry.is_dir() or entry.suffix.lower() in DATA_EXT else []
        ev = " | ".join(hits[:6])
        produced = writes_to(hits)
        if dominant == "code" and share >= 0.8:
            dst = "code" if entry.is_dir() else f"code/{name}"
            row("move", rel, dst, "high", f"code ({prof})")
        elif dominant == "log":
            row("move", rel, "logs" if entry.is_dir() else f"logs/{name}", "high", f"logs ({prof})")
        elif dominant in ("graph", "table") and share >= 0.8:
            sub = "graphs" if dominant == "graph" else "tables"
            row("move", rel, f"output/{sub}/{name}", "low", f"{sub} ({prof}); check it is a final output")
        elif dominant == "data" or (entry.is_file() and entry.suffix.lower() in DATA_EXT):
            if produced:
                row("move", rel, f"data/intermediate_data/{name}", "low",
                    f"data a script appears to write ({prof})", ev)
            elif hits:
                row("move", rel, f"data/raw_data/{name}", "low",
                    f"data that code reads; no write seen ({prof})", ev)
            else:
                row("move", rel, f"data/raw_data/{name}", "low" if entry.is_dir() else "high",
                    f"data no code names directly ({prof})")
        else:
            row("review", rel, "", "low", f"no clear class ({prof})", ev)

    # Template checks.
    checks = {d: (root / d).is_dir() for d in TEMPLATE_DIRS}
    is_git = (root / ".git").exists()
    gi = (root / ".gitignore").read_text() if (root / ".gitignore").exists() else ""
    abs_paths, bad_names = [], []
    for f in cfiles:
        try:
            for i, line in enumerate(f.read_text(errors="ignore").splitlines(), 1):
                if re.search(r"""['"](/Users/|/home/|/kellogg/|/projects/|[A-Z]:\\\\)""", line):
                    abs_paths.append(f"{f.relative_to(root)}:{i}: {line.strip()[:140]}")
        except OSError:
            pass
        if not GOOD_NAME.match(f.name):
            bad_names.append(str(f.relative_to(root)))
    settings = [str(p.relative_to(root)) for p in root.rglob("*")
                if p.stem.lower() in ("settings", "config", "paths") and p.suffix.lower() in CODE_EXT]

    with open(out, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["action", "src", "dst", "confidence", "reason", "evidence"])
        w.writeheader()
        w.writerows(rows)

    summary = dict(
        project_root=str(root), plan=str(out),
        rows={k: sum(r["action"] == k for r in rows) for k in ("move", "trash", "keep", "review")},
        low_confidence=sum(r["confidence"] == "low" for r in rows),
        template_dirs_missing=[d for d, ok in checks.items() if not ok],
        git_repo=is_git,
        gitignore_excludes_data=bool(re.search(r"^/?data/?$", gi, re.M)),
        makefile=any((root / m).exists() for m in ("Makefile", "code/Makefile")),
        settings_files=settings,
        absolute_paths=abs_paths,
        code_names_not_lowercase=bad_names,
    )
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
