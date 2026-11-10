#!/usr/bin/env python3
"""
layout_apply.py — Execute a reviewed layout plan (from layout_plan.py).

Usage: python3 layout_apply.py <project_root> [--plan current/layout_plan.csv] [--apply]

Without --apply: dry run. Prints every move, trash, and code-line rewrite, and changes nothing.
With --apply:    performs them and writes current/layout_undo.sh, which reverses the moves
                 and the rewrites.

Rules:
- Refuses to run if any row still has action=review, or a move row has an empty dst.
- Never overwrites: a move whose dst exists is an error.
- Never deletes: "trash" rows move to current/layout_trash/<src>.
- Uses `git mv` for git-tracked files so history follows the file.
- Rewrites string literals in code that name a moved path:
    "<src>/..."                       -> always
    "<src>" (bare)                    -> only beside a path join (/ "x", file.path(, joinpath(, os.path.join()
  Every other mention of a moved name is listed under MANUAL for the reviewer.
"""

import argparse
import csv
import os
import re
import shlex
import shutil
import subprocess
import sys
from pathlib import Path

CODE_EXT = {".py", ".r", ".jl", ".do", ".ipynb", ".js", ".ts", ".sh", ".m", ".sql", ".toml",
            ".yml", ".yaml"}
JOIN_CTX = re.compile(r"(/\s*$)|(file\.path\(|joinpath\(|os\.path\.join\(|here\()", re.I)


def git_tracked(root: Path, rel: str) -> bool:
    if not (root / ".git").exists():
        return False
    r = subprocess.run(["git", "-C", str(root), "ls-files", "--error-unmatch", rel],
                       capture_output=True)
    return r.returncode == 0


def move(root: Path, src: str, dst: str, do: bool):
    s, d = root / src, root / dst
    if d.exists():
        sys.exit(f"ERROR: destination exists, refusing to overwrite: {dst}")
    if not s.exists():
        sys.exit(f"ERROR: source missing: {src}")
    if do:
        d.parent.mkdir(parents=True, exist_ok=True)
        if git_tracked(root, src):
            subprocess.run(["git", "-C", str(root), "mv", src, dst], check=True)
        else:
            shutil.move(str(s), str(d))


def rewrite_line(line: str, mapping: list[tuple[str, str]]) -> str:
    for src, dst in mapping:
        pat = re.compile(r"""(['"])""" + re.escape(src) + r"""(?=/|\1)""")
        def sub(m):
            q = m.group(1)
            end = m.end()
            bare = line[end:end + 1] == q
            if bare:
                before, after = line[:m.start()], line[end + 1:]
                if not (JOIN_CTX.search(before) or re.match(r"\s*/", after)):
                    return m.group(0)
            return q + dst
        line = pat.sub(sub, line)
    return line


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("root")
    ap.add_argument("--plan", default=None)
    ap.add_argument("--apply", action="store_true")
    a = ap.parse_args()
    root = Path(a.root).resolve()
    plan = Path(a.plan) if a.plan else root / "current" / "layout_plan.csv"
    rows = list(csv.DictReader(open(plan)))

    bad = [r for r in rows if r["action"] == "review" or (r["action"] == "move" and not r["dst"])]
    if bad:
        sys.exit("ERROR: unresolved rows (set action and dst first):\n" +
                 "\n".join(f"  {r['src']}" for r in bad))

    moves = [(r["src"], r["dst"]) for r in rows if r["action"] == "move" and r["src"] != r["dst"]]
    trash = [r["src"] for r in rows if r["action"] == "trash"]
    undo = ["#!/usr/bin/env bash", "set -euo pipefail", f"cd {shlex.quote(str(root))}"]
    unmove = []  # reversed at the end so later moves are undone first
    tag = "APPLY" if a.apply else "DRY RUN"

    for src in trash:
        dst = f"current/layout_trash/{src}"
        print(f"[{tag}] trash {src} -> {dst}")
        move(root, src, dst, a.apply)
        unmove.append(f"mkdir -p {shlex.quote(str(Path(src).parent))} && mv {shlex.quote(dst)} {shlex.quote(src)}")
    for src, dst in moves:
        print(f"[{tag}] move  {src} -> {dst}")
        move(root, src, dst, a.apply)
        unmove.append(f"mkdir -p {shlex.quote(str(Path(src).parent))} && mv {shlex.quote(dst)} {shlex.quote(src)}")
    if a.apply:
        for d in ["code", "data/raw_data", "data/intermediate_data", "output/graphs",
                  "output/tables/scalars", "logs"]:
            (root / d).mkdir(parents=True, exist_ok=True)

    # Rewrite path literals in code. Scan the post-move locations (or pre-move in a dry run).
    mapping = sorted(moves, key=lambda m: -len(m[0]))
    loc = {s: d for s, d in moves}
    names = {Path(s).name for s, _ in moves}
    manual, nrew = [], 0
    for f in root.rglob("*"):
        if (not f.is_file() or f.suffix.lower() not in CODE_EXT
                or any(x in f.parts for x in (".git", "__pycache__", "layout_trash"))):
            continue
        rel = str(f.relative_to(root))
        if rel.split("/")[0] in ("data", "current") or "-env/" in rel:
            continue
        # Depth before and after the move, to judge script-relative roots like parents[1].
        if a.apply:
            final_rel = rel
            orig_rel = next((s + rel[len(d):] for s, d in moves if rel == d or rel.startswith(d + "/")), rel)
        else:
            orig_rel = rel
            final_rel = next((d + rel[len(s):] for s, d in moves if rel == s or rel.startswith(s + "/")), rel)
        text = f.read_text(errors="ignore")
        lines = text.splitlines(keepends=True)
        changed = False
        for i, line in enumerate(lines):
            new = rewrite_line(line, mapping)
            if new != line:
                print(f"[{tag}] edit  {rel}:{i+1}\n    - {line.strip()}\n    + {new.strip()}")
                lines[i] = new
                changed, nrew = True, nrew + 1
            elif any(re.search(r"""['"`]""" + re.escape(n) + r"""['"`/]""", line) for n in names):
                manual.append(f"{rel}:{i+1}: {line.strip()[:140]}")
            if (("__file__" in line or "@__DIR__" in line or "sys.frame" in line)
                    and len(Path(final_rel).parts) != len(Path(orig_rel).parts)):
                manual.append(f"{rel}:{i+1}: script-relative root; check depth after move: {line.strip()[:100]}")
        if changed and a.apply:
            backup = root / "current" / "layout_backup" / rel
            backup.parent.mkdir(parents=True, exist_ok=True)
            backup.write_text(text)
            f.write_text("".join(lines))
            undo.insert(3, f"cp {shlex.quote(str(backup.relative_to(root)))} {shlex.quote(rel)}")

    print(f"\n[{tag}] {len(moves)} moves, {len(trash)} trashed, {nrew} code lines rewritten")
    if manual:
        print(f"\nMANUAL ({len(manual)} lines name a moved path or use a script-relative root):")
        for m in manual:
            print("  " + m)
    if a.apply:
        u = root / "current" / "layout_undo.sh"
        u.write_text("\n".join(undo + unmove[::-1]) + "\n")
        u.chmod(0o755)
        print(f"\nUndo script: {u}")


if __name__ == "__main__":
    main()
