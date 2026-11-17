#!/usr/bin/env python3
"""
lightweight_audit.py — Keep code/ and output/ small enough for git.

Usage: python3 lightweight_audit.py <project_root> [--max-mb 2] [--bulk 10] [--out PATH]

code/ and output/ are the git-tracked folders. code/ holds scripts. output/ holds only
figures (output/graphs/) and .tex tables (output/tables/, output/tables/scalars/).
writing/ holds prose only. Every dataset, CSV, regression summary, and panel belongs in
data/intermediate_data/. This script flags:
  - in output/ and writing/: every file the folder rules in layout_rules.py forbid
    (a .csv anywhere in output/, a folder like output/analysis/, a .csv in writing/)
  - under code/ and output/: any file larger than --max-mb
  - any .jsonl file (agent journals, logs of model calls)
  - the shallowest folder holding only .json/.jsonl/.txt files, --bulk (10) or more (per-item machine output)
Each flagged output/ item gets a move row to the mirrored path under data/intermediate_data/.
Flagged code/ items get a review row. The CSV uses the layout_plan.py schema, so
layout_apply.py --plan <out> executes it.
"""

import argparse
import csv
import json
from pathlib import Path

from layout_rules import content_rows

TRACKED = ("code", "output")
MACHINE_EXT = {".json", ".jsonl", ".txt"}
SKIP = {".DS_Store", "__pycache__", ".ipynb_checkpoints"}


def files_under(d: Path):
    return [p for p in d.rglob("*") if p.is_file() and not (SKIP & set(p.parts)) and p.name not in SKIP]


def audit(root: Path, max_mb: float = 2, bulk: int = 10) -> list[dict]:
    """Return plan rows for misplaced files (output/, writing/) and heavy items (code/, output/)."""
    rows = content_rows(root)
    covered = {root / r["src"] for r in rows}

    def add(p: Path, reason: str):
        rel = p.relative_to(root)
        top, rest = rel.parts[0], Path(*rel.parts[1:])
        if top == "output":
            rows.append(dict(action="move", src=str(rel), dst=str(Path("data/intermediate_data") / rest),
                             confidence="low", reason=reason, evidence=""))
        else:
            rows.append(dict(action="review", src=str(rel), dst="", confidence="low",
                             reason=reason + "; data inside code/", evidence=""))

    for top in TRACKED:
        base = root / top
        if not base.is_dir():
            continue
        # Bulk folders in code/: the shallowest folder whose files are all machine output
        # (.json/.jsonl/.txt), at least --bulk of them. In output/ the folder rules already flag them.
        dirs = base.rglob("*") if top == "code" else []
        for d in sorted((p for p in dirs if p.is_dir() and not (SKIP & set(p.parts))),
                        key=lambda p: len(p.parts)):
            if any(d == c or str(d).startswith(str(c) + "/") for c in covered):
                continue
            fs = files_under(d)
            if len(fs) >= bulk and all(f.suffix in MACHINE_EXT for f in fs):
                size = sum(f.stat().st_size for f in fs) / 2**20
                add(d, f"bulk machine output: {len(fs)} files, {size:.1f} MB")
                covered.add(d)
        for f in files_under(base):
            if f in covered or any(str(f).startswith(str(c) + "/") for c in covered):
                continue
            mb = f.stat().st_size / 2**20
            if mb > max_mb:
                add(f, f"{mb:.1f} MB file (cap {max_mb} MB)")
            elif f.suffix == ".jsonl":
                add(f, f"agent journal or log ({mb:.1f} MB)")
    return rows


def sizes(root: Path) -> dict:
    return {t: round(sum(f.stat().st_size for f in files_under(root / t)) / 2**20, 1)
            for t in TRACKED if (root / t).is_dir()}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("root")
    ap.add_argument("--max-mb", type=float, default=2)
    ap.add_argument("--bulk", type=int, default=10)
    ap.add_argument("--out", default=None)
    a = ap.parse_args()
    root = Path(a.root).resolve()
    rows = audit(root, a.max_mb, a.bulk)
    out = Path(a.out) if a.out else root / "current" / "lightweight_plan.csv"
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["action", "src", "dst", "confidence", "reason", "evidence"])
        w.writeheader()
        w.writerows(rows)
    print(json.dumps(dict(sizes_mb=sizes(root), flagged=len(rows), plan=str(out),
                          rows=[f"{r['src']} -> {r['dst'] or '?'}  ({r['reason']})" for r in rows]),
                     indent=2))


if __name__ == "__main__":
    main()
