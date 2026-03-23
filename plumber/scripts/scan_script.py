#!/usr/bin/env python3
"""
scan_script.py — Parse .R, .jl, .py, .do standalone scripts for file I/O.

Usage: python3 scan_script.py <project_root> [--settings file1 file2 ...]
Output: JSON list of {file, language, reads, writes, unresolved} to stdout.
"""

import json
import os
import re
import sys
from pathlib import Path

# Reuse the shared logic from scan_notebook
sys.path.insert(0, str(Path(__file__).parent))
from scan_notebook import (
    load_settings_vars,
    resolve_path_expr,
    extract_io_from_code,
    R_READ_PATTERNS,
    R_WRITE_PATTERNS,
)

# Julia-specific I/O patterns
JL_READ_PATTERNS = [
    r'''CSV\.read\(\s*(.+?)\s*[,)]''',
    r'''readdlm\(\s*(.+?)\s*[,)]''',
    r'''open\(\s*(.+?)\s*[,)]''',
    r'''load\(\s*(.+?)\s*[,)]''',
    r'''read\(\s*(.+?)\s*,\s*String\)''',
    r'''DataFrame\(\s*CSV\.File\(\s*(.+?)\s*[,)]''',
    r'''Arrow\.Table\(\s*(.+?)\s*[,)]''',
]

JL_WRITE_PATTERNS = [
    r'''CSV\.write\(\s*(.+?)\s*[,)]''',
    r'''writedlm\(\s*(.+?)\s*[,)]''',
    r'''savefig\(\s*(.+?)\s*[,)]''',
    r'''save\(\s*(.+?)\s*[,)]''',
    r'''write\(\s*(.+?)\s*,''',
    r'''Arrow\.write\(\s*(.+?)\s*[,)]''',
    r'''serialize\(\s*(.+?)\s*[,)]''',
]

# Stata I/O patterns
STATA_READ_PATTERNS = [
    r'''use\s+"?([^",\n]+)"?''',
    r'''import\s+(?:delimited|excel)\s+(?:using\s+)?"?([^",\n]+)"?''',
    r'''insheet\s+using\s+"?([^",\n]+)"?''',
    r'''merge\s+\w+\s+using\s+"?([^",\n]+)"?''',
]

STATA_WRITE_PATTERNS = [
    r'''save\s+"?([^",\n]+)"?''',
    r'''export\s+(?:delimited|excel)\s+(?:using\s+)?"?([^",\n]+)"?''',
    r'''outsheet\s+.*using\s+"?([^",\n]+)"?''',
    r'''graph\s+export\s+"?([^",\n]+)"?''',
    r'''esttab\s+.*using\s+"?([^",\n]+)"?''',
    r'''file\s+open\s+\w+\s+using\s+"?([^",\n]+)"?''',
]

EXTENSIONS_TO_LANGUAGE = {
    ".R": "R", ".r": "R",
    ".jl": "julia",
    ".py": "python",
    ".do": "stata",
}


def extract_julia_io(code: str, variables: dict[str, str],
                     project_root: Path) -> tuple[list[str], list[str], list[str]]:
    """Extract I/O from Julia code."""
    reads, writes, unresolved = [], [], []

    for pattern in JL_READ_PATTERNS:
        for m in re.finditer(pattern, code):
            raw = m.group(1).strip().strip('"').strip("'")
            resolved = resolve_path_expr(raw, variables, project_root)
            if resolved and not resolved.startswith("{"):
                reads.append(resolved)
            else:
                unresolved.append(f"READ: {raw}")

    for pattern in JL_WRITE_PATTERNS:
        for m in re.finditer(pattern, code):
            raw = m.group(1).strip().strip('"').strip("'")
            resolved = resolve_path_expr(raw, variables, project_root)
            if resolved and not resolved.startswith("{"):
                writes.append(resolved)
            else:
                unresolved.append(f"WRITE: {raw}")

    # Julia joinpath expressions used inline
    for m in re.finditer(r'joinpath\(([^)]+)\)', code):
        args = [a.strip().strip('"').strip("'") for a in m.group(1).split(",")]
        resolved_args = []
        all_resolved = True
        for a in args:
            if a in variables:
                resolved_args.append(variables[a])
            elif a == "@__DIR__":
                resolved_args.append(".")
            elif "/" not in a and "." not in a and a.isupper():
                all_resolved = False
                break
            else:
                resolved_args.append(a)
        if all_resolved and resolved_args:
            path = os.path.join(*resolved_args)
            # Determine if read or write based on context
            # (heuristic: if it appears in CSV.write/savefig context, it's a write)
            full_match_start = max(0, m.start() - 20)
            context = code[full_match_start:m.start()]
            if re.search(r'write|save|export', context, re.IGNORECASE):
                writes.append(path)
            else:
                reads.append(path)

    return reads, writes, unresolved


def extract_stata_io(code: str, variables: dict[str, str],
                     project_root: Path) -> tuple[list[str], list[str], list[str]]:
    """Extract I/O from Stata code."""
    reads, writes, unresolved = [], [], []

    for pattern in STATA_READ_PATTERNS:
        for m in re.finditer(pattern, code, re.IGNORECASE):
            raw = m.group(1).strip().strip('"').strip("'")
            resolved = resolve_path_expr(raw, variables, project_root)
            if resolved:
                reads.append(resolved)
            else:
                unresolved.append(f"READ: {raw}")

    for pattern in STATA_WRITE_PATTERNS:
        for m in re.finditer(pattern, code, re.IGNORECASE):
            raw = m.group(1).strip().strip('"').strip("'")
            resolved = resolve_path_expr(raw, variables, project_root)
            if resolved:
                writes.append(resolved)
            else:
                unresolved.append(f"WRITE: {raw}")

    return reads, writes, unresolved


def scan_script(script_path: Path, variables: dict[str, str],
                project_root: Path) -> dict:
    """Scan a single script file for I/O operations."""
    try:
        code = script_path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return {"file": str(script_path.relative_to(project_root)), "error": "Could not read file"}

    ext = script_path.suffix.lower()
    language = EXTENSIONS_TO_LANGUAGE.get(ext, "unknown")

    if language == "julia":
        reads, writes, unresolved = extract_julia_io(code, variables, project_root)
    elif language == "stata":
        reads, writes, unresolved = extract_stata_io(code, variables, project_root)
    else:
        # R or Python — use shared logic
        reads, writes, unresolved = extract_io_from_code(code, language, variables, project_root)

    return {
        "file": str(script_path.relative_to(project_root)),
        "language": language,
        "reads": sorted(set(reads)),
        "writes": sorted(set(writes)),
        "unresolved": sorted(set(unresolved)),
    }


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 scan_script.py <project_root> [--settings file1 ...]",
              file=sys.stderr)
        sys.exit(1)

    project_root = Path(sys.argv[1]).resolve()

    settings_files = []
    if "--settings" in sys.argv:
        idx = sys.argv.index("--settings")
        settings_files = sys.argv[idx + 1:]
    else:
        for name in ["settings.R", "settings.jl", "config.py", "settings.py"]:
            for p in project_root.rglob(name):
                settings_files.append(str(p.relative_to(project_root)))
        for mf in ["Makefile", "code/Makefile"]:
            if (project_root / mf).exists():
                settings_files.append(mf)

    variables = load_settings_vars(project_root, settings_files)

    # Find all script files
    script_exts = {".R", ".r", ".jl", ".py", ".do"}
    scripts = []
    for ext in script_exts:
        scripts.extend(project_root.rglob(f"*{ext}"))

    # Exclude server_copy, __pycache__, .ipynb_checkpoints, venv
    exclude_dirs = {"server_copy", "__pycache__", ".ipynb_checkpoints", "venv", ".venv", "node_modules"}
    scripts = [s for s in scripts
               if not any(ex in str(s) for ex in exclude_dirs)
               and s.suffix.lower() in script_exts]

    # Also exclude settings files themselves
    settings_abs = {(project_root / sf).resolve() for sf in settings_files}
    scripts = [s for s in scripts if s.resolve() not in settings_abs]

    scripts.sort()

    results = []
    for script_path in scripts:
        result = scan_script(script_path, variables, project_root)
        if result.get("reads") or result.get("writes") or result.get("unresolved"):
            results.append(result)

    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
