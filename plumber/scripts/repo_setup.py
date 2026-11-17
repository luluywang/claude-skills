#!/usr/bin/env python3
"""
repo_setup.py — Git repo over code/ and output/, plus agent instructions for the layout.

Usage: python3 repo_setup.py <project_root> [--apply] [--max-mb 2] [--track DIR ...]

Steps (dry run prints them; --apply does them):
1. Refuse if lightweight_audit finds heavy items in code/ or output/ (fix those first).
2. Write the plumber block of .gitignore: a whitelist of code/, output/, root docs and
   env files, plus any --track folders. Text outside the block is kept.
3. `git init` if the project has no repo.
4. Install .git/hooks/pre-commit: rejects staged files over --max-mb, staged .jsonl files,
   and staged files that break the output/ and writing/ rules in layout_rules.py
   (e.g. a .csv in output/tables/, anything in output/analysis/, a .csv in writing/).
5. Write the layout block (templates/agent_layout.md) into CLAUDE.md and AGENTS.md,
   creating either file if missing. Re-runs replace the block in place.
6. If the repo has no commits, stage everything the whitelist allows and make the first commit.
"""

import argparse
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from layout_rules import hook_case_lines  # noqa: E402
from lightweight_audit import audit, sizes  # noqa: E402

SKILL = Path(__file__).resolve().parents[1]
ROOT_FILES = ["README.md", "CLAUDE.md", "AGENTS.md", "PAPERCUTS.md", "TODO.md", "Makefile",
              "Project.toml", "Manifest.toml", "environment.yml", "renv.lock",
              "requirements.txt", "pyproject.toml", ".Rprofile"]
GI_START, GI_END = "# >>> plumber layout", "# <<< plumber layout"
MD_START, MD_END = "<!-- plumber:layout start -->", "<!-- plumber:layout end -->"

HOOK = """#!/usr/bin/env bash
# Installed by plumber repo_setup.py: keep code/ and output/ lightweight, and keep data out of
# output/ and writing/ (data goes to data/intermediate_data/).
max=$(( {max_mb} * 1048576 ))
fail=0
shopt -s nocasematch
bad() { echo "pre-commit: $1: $2. Move it to data/intermediate_data/." >&2; fail=1; }
while IFS= read -r -d '' f; do
  case "$f" in
{case_lines}
  esac
  s=$(git cat-file -s ":$f")
  if [ "$s" -gt "$max" ]; then
    echo "pre-commit: $f is $(( s / 1048576 )) MB (cap {max_mb} MB). Move it to data/intermediate_data/." >&2
    fail=1
  fi
  case "$f" in *.jsonl)
    echo "pre-commit: $f is a .jsonl journal. Keep it in data/intermediate_data/." >&2
    fail=1;;
  esac
done < <(git diff --cached --name-only -z --diff-filter=AMR)
exit $fail
"""


def replace_block(text: str, start: str, end: str, block: str) -> str:
    new = f"{start}\n{block.rstrip()}\n{end}\n"
    pat = re.compile(re.escape(start) + r".*?" + re.escape(end) + r"\n?", re.S)
    if pat.search(text):
        return pat.sub(lambda _: new, text)
    return (text.rstrip() + "\n\n" if text.strip() else "") + new


def git(root: Path, *args, check=True) -> subprocess.CompletedProcess:
    return subprocess.run(["git", "-C", str(root), *args], capture_output=True, text=True, check=check)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("root")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--max-mb", type=int, default=2)
    ap.add_argument("--track", nargs="*", default=[], help="extra root folders to track (e.g. spec)")
    a = ap.parse_args()
    root = Path(a.root).resolve()
    tag = "APPLY" if a.apply else "DRY RUN"

    heavy = audit(root, a.max_mb)
    print(f"[{tag}] tracked folder sizes (MB): {sizes(root)}")
    if heavy:
        print(f"ERROR: {len(heavy)} heavy or misplaced items in code/, output/, or writing/. "
              "Run lightweight_audit.py "
              "and layout_apply.py first:")
        for r in heavy:
            print(f"  {r['src']}  ({r['reason']})")
        sys.exit(1)

    # 1. .gitignore whitelist
    allow = ["/*", "!/.gitignore", "!/code/", "!/output/"]
    allow += [f"!/{f}" for f in ROOT_FILES]
    allow += [f"!/{d.strip('/')}/" for d in a.track]
    allow += ["__pycache__/", ".ipynb_checkpoints/", ".DS_Store", "*.pyc", ".Rhistory", "*.jsonl"]
    block = ("# git tracks code/ and output/ only (RA guide 2.5). data/, logs/, current/ stay out.\n"
             + "\n".join(allow))
    gi = root / ".gitignore"
    gi_text = replace_block(gi.read_text() if gi.exists() else "", GI_START, GI_END, block)
    print(f"[{tag}] write .gitignore whitelist: code/, output/, root docs" +
          (f", {', '.join(a.track)}" if a.track else ""))

    # 2. agent docs
    layout = (SKILL / "templates" / "agent_layout.md").read_text().replace("{MAX_MB}", str(a.max_mb))
    docs = {}
    for name in ("CLAUDE.md", "AGENTS.md"):
        p = root / name
        docs[p] = replace_block(p.read_text() if p.exists() else "", MD_START, MD_END, layout)
        print(f"[{tag}] {'update' if p.exists() else 'create'} {name} layout block")

    is_repo = (root / ".git").exists()
    print(f"[{tag}] {'repo exists' if is_repo else 'git init'}; install pre-commit hook (cap {a.max_mb} MB)")
    if not a.apply:
        return

    gi.write_text(gi_text)
    for p, t in docs.items():
        p.write_text(t)
    if not is_repo:
        git(root, "init", "-q")
    hook = root / ".git" / "hooks" / "pre-commit"
    hook.write_text(HOOK.replace("{max_mb}", str(a.max_mb)).replace("{case_lines}", hook_case_lines()))
    hook.chmod(0o755)

    if git(root, "rev-parse", "--verify", "HEAD", check=False).returncode != 0:
        git(root, "add", "-A")
        staged = git(root, "diff", "--cached", "--name-only").stdout.split()
        tops = sorted({s.split("/")[0] for s in staged})
        print(f"[{tag}] staged {len(staged)} files under: {', '.join(tops)}")
        r = subprocess.run(["git", "-C", str(root), "commit", "-q", "-m",
                            "Track code/ and output/ (plumber repo setup)"], capture_output=True, text=True)
        if r.returncode != 0:
            sys.exit(f"ERROR: first commit failed:\n{r.stdout}{r.stderr}")
        print(f"[{tag}] first commit: {git(root, 'log', '--oneline', '-1').stdout.strip()}")
    else:
        print(f"[{tag}] repo already has commits; review `git status` and commit the setup changes.")


if __name__ == "__main__":
    main()
