#!/usr/bin/env python3
"""
scan_notebook.py — Parse .ipynb files and extract file I/O operations.

Usage: python3 scan_notebook.py <project_root> [--settings settings.R ...]
Output: JSON list of {file, language, reads, writes, unresolved} to stdout.

Handles R (fread, read.csv, readRDS, read_csv, etc.), Python (pd.read_csv,
open, etc.), and resolves path variables from settings files.
"""

import json
import os
import re
import sys
from pathlib import Path


def load_settings_vars(project_root: Path, settings_files: list[str]) -> dict[str, str]:
    """Parse settings files to build a {VAR_NAME: resolved_path} map."""
    variables: dict[str, str] = {}

    for sf in settings_files:
        sf_path = project_root / sf
        if not sf_path.exists():
            continue

        text = sf_path.read_text(errors="replace")

        if sf.endswith(".R") or sf.endswith(".r"):
            # R patterns: VAR <- "path" or VAR = "path"
            for m in re.finditer(r'''(\w+)\s*(?:<-|=)\s*["']([^"']+)["']''', text):
                variables[m.group(1)] = m.group(2)
            # R paste0() patterns: VAR = paste0(A, B, ...) — resolve in order
            for m in re.finditer(r'''(\w+)\s*(?:<-|=)\s*paste0\(([^)]+)\)''', text):
                var_name = m.group(1)
                args = [a.strip() for a in m.group(2).split(",")]
                resolved_parts = []
                all_resolved = True
                for a in args:
                    a_stripped = a.strip('"').strip("'")
                    if a.startswith('"') or a.startswith("'"):
                        resolved_parts.append(a_stripped)
                    elif a_stripped in variables:
                        resolved_parts.append(variables[a_stripped])
                    else:
                        all_resolved = False
                        break
                if all_resolved:
                    variables[var_name] = "".join(resolved_parts)

        elif sf.endswith(".jl"):
            # Julia patterns: VAR = "path" or VAR = joinpath(...)
            for m in re.finditer(r'''(\w+)\s*=\s*["']([^"']+)["']''', text):
                variables[m.group(1)] = m.group(2)
            # joinpath patterns
            for m in re.finditer(r'(\w+)\s*=\s*joinpath\(([^)]+)\)', text):
                var_name = m.group(1)
                args = [a.strip().strip('"').strip("'") for a in m.group(2).split(",")]
                resolved_args = []
                for a in args:
                    if a == "@__DIR__":
                        resolved_args.append(str(sf_path.parent))
                    elif a in variables:
                        resolved_args.append(variables[a])
                    else:
                        resolved_args.append(a)
                variables[var_name] = os.path.join(*resolved_args)

        elif sf.endswith(".py"):
            # Python patterns: VAR = "path"
            for m in re.finditer(r'''(\w+)\s*=\s*["']([^"']+)["']''', text):
                variables[m.group(1)] = m.group(2)

        elif sf == "Makefile" or sf.endswith("/Makefile"):
            # Makefile: VAR = path or VAR := path
            for m in re.finditer(r'^(\w+)\s*[:?]?=\s*(.+)$', text, re.MULTILINE):
                val = m.group(2).strip()
                # Resolve $(VAR) references
                def resolve_make_var(match):
                    ref = match.group(1)
                    return variables.get(ref, f"$({ref})")
                val = re.sub(r'\$\((\w+)\)', resolve_make_var, val)
                variables[m.group(1)] = val

    return variables


def resolve_path_expr(expr: str, variables: dict[str, str], project_root: Path) -> str | None:
    """Attempt to resolve a path expression using known variables."""
    original = expr

    # R paste0() patterns: paste0(VAR, "suffix") — handle with or without closing paren
    paste_match = re.match(r'paste0\((.+?)\)?$', expr)
    if paste_match:
        inner = paste_match.group(1)
        parts = [p.strip().strip('"').strip("'") for p in inner.split(",")]
        resolved = []
        all_ok = True
        for p in parts:
            if p in variables:
                resolved.append(variables[p])
            elif "/" in p or "." in p or p == "":
                resolved.append(p)
            else:
                all_ok = False
                break
        if all_ok:
            return "".join(resolved)
        return None

    # Python os.path.join / f-string patterns
    join_match = re.match(r'os\.path\.join\((.+)\)', expr)
    if join_match:
        parts = [p.strip().strip('"').strip("'") for p in join_match.group(1).split(",")]
        resolved = [variables.get(p, p) for p in parts]
        return os.path.join(*resolved)

    # Julia joinpath
    jp_match = re.match(r'joinpath\((.+)\)', expr)
    if jp_match:
        parts = [p.strip().strip('"').strip("'") for p in jp_match.group(1).split(",")]
        resolved = [variables.get(p, p) for p in parts]
        return os.path.join(*resolved)

    # Simple variable reference
    if expr in variables:
        return variables[expr]

    # String with variable interpolation: e.g. f"{VAR}/file.csv"
    def replace_var(m):
        vname = m.group(1)
        return variables.get(vname, m.group(0))

    resolved = re.sub(r'\{(\w+)\}', replace_var, expr)
    resolved = re.sub(r'\$\((\w+)\)', replace_var, resolved)

    if resolved != original:
        return resolved

    # Literal string path
    if "/" in expr or expr.endswith((".csv", ".rds", ".rda", ".pdf", ".png", ".tex", ".dta")):
        return expr

    return None


# I/O function patterns per language
R_READ_PATTERNS = [
    r'''fread\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''read[._]csv\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''readRDS\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''read\.dta\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''load\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''source\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''read_(?:xlsx?|feather|parquet)\(\s*(?:path\s*=\s*)?(.+?)\s*[,)]''',
]

R_WRITE_PATTERNS = [
    r'''fwrite\(.+?,\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''write[._]csv\(.+?,\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''saveRDS\(.+?,\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''ggsave\(\s*(?:filename\s*=\s*)?(.+?)\s*[,)]''',
    r'''save\(.+?,\s*file\s*=\s*(.+?)\s*[,)]''',
    r'''cat\(.+?,\s*file\s*=\s*(.+?)\s*[,)]''',
    r'''write_(?:xlsx?|feather|parquet)\(.+?,\s*(?:path\s*=\s*)?(.+?)\s*[,)]''',
    r'''pdf\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''png\(\s*(?:filename\s*=\s*)?(.+?)\s*[,)]''',
    r'''sink\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
    r'''tex\(\s*(?:file\s*=\s*)?(.+?)\s*[,)]''',
]

PY_READ_PATTERNS = [
    r'''pd\.read_csv\(\s*(.+?)\s*[,)]''',
    r'''pd\.read_excel\(\s*(.+?)\s*[,)]''',
    r'''pd\.read_parquet\(\s*(.+?)\s*[,)]''',
    r'''pd\.read_stata\(\s*(.+?)\s*[,)]''',
    r'''open\(\s*(.+?)\s*[,)]''',
    r'''np\.load(?:txt)?\(\s*(.+?)\s*[,)]''',
]

PY_WRITE_PATTERNS = [
    r'''\.to_csv\(\s*(.+?)\s*[,)]''',
    r'''\.to_excel\(\s*(.+?)\s*[,)]''',
    r'''\.to_parquet\(\s*(.+?)\s*[,)]''',
    r'''\.savefig\(\s*(.+?)\s*[,)]''',
    r'''plt\.savefig\(\s*(.+?)\s*[,)]''',
    r'''np\.save(?:txt)?\(.+?,\s*(.+?)\s*[,)]''',
]


def detect_notebook_language(cells: list[dict]) -> str:
    """Detect language from notebook metadata or cell content."""
    for cell in cells:
        if cell.get("cell_type") != "code":
            continue
        source = "".join(cell.get("source", []))
        if re.search(r'library\(|require\(|<-|fread|fwrite|ggplot', source):
            return "R"
        if re.search(r'import\s+pandas|import\s+numpy|\.to_csv|pd\.read', source):
            return "python"
    return "R"  # default for economics projects


def extract_io_from_code(code: str, language: str, variables: dict[str, str],
                         project_root: Path) -> tuple[list[str], list[str], list[str]]:
    """Extract reads, writes, and unresolved paths from code."""
    reads, writes, unresolved = [], [], []

    if language == "R":
        read_patterns = R_READ_PATTERNS
        write_patterns = R_WRITE_PATTERNS
    else:
        read_patterns = PY_READ_PATTERNS
        write_patterns = PY_WRITE_PATTERNS

    for pattern in read_patterns:
        for m in re.finditer(pattern, code):
            raw = m.group(1).strip().strip('"').strip("'")
            resolved = resolve_path_expr(raw, variables, project_root)
            if resolved and not resolved.startswith("{"):
                reads.append(resolved)
            else:
                unresolved.append(f"READ: {raw}")

    for pattern in write_patterns:
        for m in re.finditer(pattern, code):
            raw = m.group(1).strip().strip('"').strip("'")
            resolved = resolve_path_expr(raw, variables, project_root)
            if resolved and not resolved.startswith("{"):
                writes.append(resolved)
            else:
                unresolved.append(f"WRITE: {raw}")

    # Also catch piped R patterns: "path" %>% fread() or paste0(...) %>% fread()
    for m in re.finditer(r'''["']([^"']+)["']\s*(?:%>%|\|>)\s*(?:fread|read[._]csv|readRDS)''', code):
        reads.append(m.group(1))
    # Piped paste0: paste0(VAR, 'suffix') %>% fread()
    if language == "R":
        for m in re.finditer(r'''paste0\(([^)]+)\)\s*(?:%>%|\|>)\s*(?:fread|read[._]csv|readRDS)''', code):
            resolved = resolve_path_expr(f"paste0({m.group(1)})", variables, project_root)
            if resolved:
                reads.append(resolved)
            else:
                unresolved.append(f"READ: paste0({m.group(1)})")
        # Piped paste0 for writes: ... %>% fwrite(paste0(VAR, 'suffix'))
        for m in re.finditer(r'''(?:fwrite|write[._]csv|saveRDS)\([^,]+,\s*paste0\(([^)]+)\)''', code):
            resolved = resolve_path_expr(f"paste0({m.group(1)})", variables, project_root)
            if resolved:
                writes.append(resolved)
            else:
                unresolved.append(f"WRITE: paste0({m.group(1)})")

    return reads, writes, unresolved


def scan_notebook(nb_path: Path, variables: dict[str, str],
                  project_root: Path) -> dict:
    """Scan a single .ipynb file for I/O operations."""
    try:
        with open(nb_path, encoding="utf-8", errors="replace") as f:
            nb = json.load(f)
    except (json.JSONDecodeError, OSError):
        return {"file": str(nb_path.relative_to(project_root)), "error": "Could not parse notebook"}

    cells = nb.get("cells", [])
    language = detect_notebook_language(cells)

    all_reads, all_writes, all_unresolved = [], [], []

    for cell in cells:
        if cell.get("cell_type") != "code":
            continue
        code = "".join(cell.get("source", []))
        reads, writes, unresolved = extract_io_from_code(code, language, variables, project_root)
        all_reads.extend(reads)
        all_writes.extend(writes)
        all_unresolved.extend(unresolved)

    return {
        "file": str(nb_path.relative_to(project_root)),
        "language": language,
        "reads": sorted(set(all_reads)),
        "writes": sorted(set(all_writes)),
        "unresolved": sorted(set(all_unresolved)),
    }


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 scan_notebook.py <project_root> [--settings file1 file2 ...]",
              file=sys.stderr)
        sys.exit(1)

    project_root = Path(sys.argv[1]).resolve()

    # Parse --settings if provided
    settings_files = []
    if "--settings" in sys.argv:
        idx = sys.argv.index("--settings")
        settings_files = sys.argv[idx + 1:]
    else:
        # Auto-discover settings files
        for name in ["settings.R", "settings.jl", "config.py", "settings.py"]:
            for p in project_root.rglob(name):
                settings_files.append(str(p.relative_to(project_root)))
        # Check for Makefiles
        for mf in ["Makefile", "code/Makefile"]:
            if (project_root / mf).exists():
                settings_files.append(mf)

    variables = load_settings_vars(project_root, settings_files)

    # Find all notebooks
    notebooks = sorted(project_root.rglob("*.ipynb"))
    # Exclude checkpoints and server_copy dirs
    notebooks = [nb for nb in notebooks
                 if ".ipynb_checkpoints" not in str(nb)
                 and "server_copy" not in str(nb)]

    results = []
    for nb_path in notebooks:
        result = scan_notebook(nb_path, variables, project_root)
        if result.get("reads") or result.get("writes") or result.get("unresolved"):
            results.append(result)

    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
