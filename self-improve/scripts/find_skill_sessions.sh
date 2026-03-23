#!/usr/bin/env python3
# find_skill_sessions.sh — find log sessions per skill, output JSON map by skill.
#
# Usage: python3 find_skill_sessions.sh [logs_dir]
# Output: JSON object {"econ_ra": ["path1", ...], "copyedit": [...], ...}
#
# Routing priority:
#   1. If manifest digest has skill_invocations for a file, use that (authoritative).
#   2. Fall back to text search for files without a digest entry.
#      - Reads .jsonl.gz files with gzip, plain .jsonl files directly.
#      - Excludes sessions where the skill name appears only in a "construction"
#        context (cwd is the Claude project dir and match is on a SKILL.md write/edit).
#
# Renamed .sh for backward compat; invocable as python3 find_skill_sessions.sh

import gzip
import json
import re
import sys
from pathlib import Path

LOGS_DIR = Path(sys.argv[1]) if len(sys.argv) > 1 else \
    Path.home() / "Library/CloudStorage/Dropbox/claude-logs"

MANIFEST_PATH = Path.home() / "Library/CloudStorage/Dropbox/claude-logs/self-improve-cache/manifest.json"

# Claude project directory — sessions with this cwd are "construction" sessions.
CLAUDE_PROJECT_DIR = str(Path.home() / "Library/CloudStorage/Dropbox/Documents/Economics/Projects/Claude")

SKILLS = ["econ_ra", "copyedit", "parsepdf", "revisions", "taskmaster"]

if not LOGS_DIR.exists():
    print("{}", file=sys.stderr)
    sys.exit(1)

# ------------------------------------------------------------------
# Load manifest digest (may be absent).
# Structure: {"files": {"rel/path.jsonl": {"digested": true,
#                                           "skill_invocations": ["econ_ra", ...], ...}}}
# ------------------------------------------------------------------
manifest_digest: dict[str, dict] = {}
if MANIFEST_PATH.exists():
    try:
        raw = json.loads(MANIFEST_PATH.read_text())
        manifest_digest = raw.get("files", {})
    except Exception:
        pass

# Build a set of absolute paths that have digest entries, keyed by absolute path.
digest_by_abs: dict[str, dict] = {}
for rel, entry in manifest_digest.items():
    if not isinstance(entry, dict):
        continue
    abs_path = LOGS_DIR.parent / rel  # manifest paths are relative to LOGS_DIR parent
    digest_by_abs[str(abs_path)] = entry
    # Also try relative to LOGS_DIR itself in case paths differ.
    digest_by_abs[str(LOGS_DIR / rel)] = entry


def read_log_lines(path: Path) -> list[str]:
    """Return all text lines from a .jsonl or .jsonl.gz file."""
    try:
        if path.suffix == ".gz":
            with gzip.open(path, "rt", encoding="utf-8", errors="replace") as fh:
                return fh.readlines()
        else:
            with open(path, "r", encoding="utf-8", errors="replace") as fh:
                return fh.readlines()
    except Exception:
        return []


def is_construction_session(lines: list[str], skill: str) -> bool:
    """
    Return True if the session looks like it was about *building* the skill
    rather than *invoking* it.  Heuristic: cwd matches the Claude project dir
    AND every mention of the skill name co-occurs with a SKILL.md path in a
    write/edit tool call context.
    """
    skill_pattern = re.compile(re.escape(skill), re.IGNORECASE)
    skillmd_pattern = re.compile(rf"skills/{re.escape(skill)}/SKILL\.md", re.IGNORECASE)
    edit_context = re.compile(r'"(write|edit|create|update).*?"', re.IGNORECASE)

    in_project_cwd = False
    has_invocation_line = False

    for raw in lines:
        if CLAUDE_PROJECT_DIR in raw:
            in_project_cwd = True
        if not skill_pattern.search(raw):
            continue
        # If this line mentions the skill in a non-SKILL.md context, treat as invocation.
        if not skillmd_pattern.search(raw):
            has_invocation_line = True
            break

    if not in_project_cwd:
        return False  # Not a construction session
    if has_invocation_line:
        return False  # Has real invocation lines — keep it
    return True  # Only SKILL.md references inside project dir — construction session


# ------------------------------------------------------------------
# Collect all candidate log files.
# ------------------------------------------------------------------
all_log_files: list[Path] = sorted(
    list(LOGS_DIR.rglob("*.jsonl")) + list(LOGS_DIR.rglob("*.jsonl.gz"))
)

result: dict[str, list[str]] = {skill: [] for skill in SKILLS}

for log_path in all_log_files:
    abs_str = str(log_path)

    # Check digest entries (try both possible key forms).
    digest_entry = digest_by_abs.get(abs_str)

    if digest_entry and digest_entry.get("digested"):
        # --- Path 1: manifest-first routing (authoritative) ---
        skill_invocations = digest_entry.get("skill_invocations", [])
        for skill in SKILLS:
            if skill in skill_invocations:
                result[skill].append(abs_str)
    else:
        # --- Path 2: text-search fallback ---
        lines = read_log_lines(log_path)
        if not lines:
            continue
        for skill in SKILLS:
            pattern = f"/{skill}"
            if any(pattern in line for line in lines):
                if not is_construction_session(lines, skill):
                    result[skill].append(abs_str)

# Sort for determinism.
for skill in SKILLS:
    result[skill] = sorted(set(result[skill]))

# Warn on stderr for skills with zero sessions.
zero_skills = [s for s in SKILLS if len(result[s]) == 0]
if zero_skills:
    print(
        f"WARNING: zero sessions matched for skill(s): {', '.join(zero_skills)}",
        file=sys.stderr,
    )

print(json.dumps(result, indent=2))
