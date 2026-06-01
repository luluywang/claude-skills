#!/usr/bin/env python3
"""
extract_writing_turns.py — Find prose-review signals in session transcripts.

Walks JSONL transcripts under a project directory, emitting per-session records
of user turns that look like writing/editing feedback plus the assistant's
immediately-following edit action (Write/Edit tool call).

Usage:
    python3 extract_writing_turns.py --project crosssell
    python3 extract_writing_turns.py --project payment-network-competition --since 30d
    python3 extract_writing_turns.py --project fiserv_interchange --out /tmp/writing.jsonl

Output (JSON lines, one record per detected user turn):
    {session, rel_path, ts, signals, user_excerpt, edit_target, edit_kind}

Also usable as a module: extract_turns(jsonl_path) → list[dict].
"""

import argparse
import gzip
import json
import re
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path

LOGS_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs"
DEFAULT_OUT_DIR = LOGS_DIR / "self-improve-cache/writing-loop-mining"
MIN_SIZE_KB = 10

# Signals that a user turn is giving prose-review / iterative-writing feedback.
# Each pattern carries a short tag so downstream can count categories.
SIGNAL_PATTERNS = [
    ("rewrite_verb",   re.compile(r"\b(rewrite|rewrote|revise|revised|redraft|redraft it|rephrase|tighten|trim|cut it|shorten|edit|reword)\b", re.I)),
    ("ai_tell",        re.compile(r"\b(too ai|sounds? like ai|ai-?generated|ai-?sounding|robotic|chatgpt)\b", re.I)),
    ("more_human",     re.compile(r"\b(more human|sound(s)? human|natural(er)?|conversational|less formal|less stiff)\b", re.I)),
    ("verdict",        re.compile(r"\b(no good|not good|not right|not quite|doesn'?t work|off|weak|bland|boring|flat|dull|stilted|awkward|clunky|purple|flowery|wordy|verbose|bloated|meh)\b", re.I)),
    ("ask_critic",     re.compile(r"\b(critique|critic|be harsh|be tough|roast|pick apart|tear (it )?apart|what'?s wrong|why (is this|doesn)|how could this be better)\b", re.I)),
    ("ban_phrase",     re.compile(r"\b(ban(ned)?|don'?t use|stop using|avoid|never (say|use)|kill the)\b", re.I)),
    ("keep_preserve",  re.compile(r"\b(keep|preserve|don'?t touch|leave alone|retain)\b.*(voice|tone|style|sentence|phrasing)", re.I)),
    ("goal_language",  re.compile(r"\b(goal|objective|aim|trying to|want it to|should (sound|read|feel))\b", re.I)),
    ("iteration_cue",  re.compile(r"\b(try again|another pass|one more|again|redo|do it over|still|nope|nah|better but|closer but|almost)\b", re.I)),
    ("length_cue",     re.compile(r"\b(too long|too short|cut \w+ words?|shorten|expand|more detail|less detail|drop the|trim the)\b", re.I)),
    ("mccloskey",      re.compile(r"\b(mechanism|motivat(e|ion)|throat[- ]clearing|hedge|hedging|load[- ]bearing|tell (me |)why)\b", re.I)),
    ("voice_request",  re.compile(r"\b(in the voice of|like .+ would|punchier|terse(r)?|direct(er|ly)|crisp|sharper)\b", re.I)),
]

# Assistant-side cues for an edit action (Write / Edit / file-change).
# We don't re-parse tool calls; cheap grep on stringified message content.
EDIT_HINTS = re.compile(r'"(name|tool_name|tool_use_name)"\s*:\s*"(Write|Edit|MultiEdit|NotebookEdit)"', re.I)
EDIT_PATH_RE = re.compile(r'"(file_path|path)"\s*:\s*"([^"]+)"')


def _open(path: Path):
    opener = gzip.open if path.suffix == ".gz" else open
    return opener(path, "rt", encoding="utf-8", errors="replace")


def _text_of(content) -> str:
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        out = []
        for block in content:
            if isinstance(block, dict) and block.get("type") == "text":
                out.append(block.get("text", ""))
        return "\n".join(out)
    return ""


def _detect_signals(text: str) -> list[str]:
    hits = []
    for tag, rx in SIGNAL_PATTERNS:
        if rx.search(text):
            hits.append(tag)
    return hits


def _first_edit_after(records, start_idx: int, window: int = 6) -> dict | None:
    """Scan the next `window` records for a Write/Edit tool_use. Returns kind/path."""
    for rec in records[start_idx + 1: start_idx + 1 + window]:
        blob = json.dumps(rec, default=str)
        m = EDIT_HINTS.search(blob)
        if not m:
            continue
        kind = m.group(2)
        path_m = EDIT_PATH_RE.search(blob)
        return {"edit_kind": kind, "edit_target": path_m.group(2) if path_m else None}
    return None


def _user_text_from_record(rec) -> str | None:
    if not isinstance(rec, dict):
        return None
    msg = None
    if rec.get("type") == "user" and "message" in rec:
        msg = rec["message"]
    elif rec.get("type") == "user":
        msg = rec
    elif "message" in rec and isinstance(rec["message"], dict) and rec["message"].get("role") == "user":
        msg = rec["message"]
    if msg is None:
        return None
    return _text_of(msg.get("content", "")).strip() or None


def extract_turns(jsonl_path: Path) -> list[dict]:
    """Per-file extractor. Loads all records once so we can peek forward for edits."""
    records: list = []
    try:
        with _open(jsonl_path) as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    records.append(json.loads(line))
                except json.JSONDecodeError:
                    continue
    except (OSError, EOFError) as e:
        print(f"[warn] {jsonl_path}: {e}", file=sys.stderr)
        return []

    session_id = None
    for rec in records[:5]:
        if isinstance(rec, dict) and rec.get("sessionId"):
            session_id = rec["sessionId"]
            break
    if session_id is None:
        session_id = jsonl_path.stem

    rel_path = str(jsonl_path)
    results = []
    for i, rec in enumerate(records):
        text = _user_text_from_record(rec)
        if text is None:
            continue
        if text.startswith("<") and ">" in text[:40]:
            # skip hook / system-reminder wrappers; they are not editorial feedback
            continue
        signals = _detect_signals(text)
        if not signals:
            continue
        ts = rec.get("timestamp") if isinstance(rec, dict) else None
        edit = _first_edit_after(records, i) or {}
        excerpt = text[:400].replace("\n", " ")
        results.append({
            "session": session_id,
            "rel_path": rel_path,
            "ts": ts,
            "turn_idx": i,
            "signals": signals,
            "user_excerpt": excerpt,
            "edit_target": edit.get("edit_target"),
            "edit_kind": edit.get("edit_kind"),
        })
    return results


def parse_since(since_str: str) -> datetime:
    s = since_str.strip().lower()
    if s.endswith("d"):
        return datetime.now(timezone.utc) - timedelta(days=int(s[:-1]))
    raise ValueError(f"--since expects Nd, got {since_str!r}")


def iter_project_files(project: str, since: datetime | None):
    proj_dir = LOGS_DIR / project
    if not proj_dir.exists():
        raise SystemExit(f"[error] no logs dir: {proj_dir}")
    for pattern in ("*.jsonl", "*.jsonl.gz"):
        for p in sorted(proj_dir.rglob(pattern)):
            size_kb = p.stat().st_size / 1024
            if size_kb < MIN_SIZE_KB:
                continue
            if since is not None:
                mtime = datetime.fromtimestamp(p.stat().st_mtime, tz=timezone.utc)
                if mtime < since:
                    continue
            yield p


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--project", required=True,
                    help="Project directory name under LOGS_DIR (e.g. crosssell)")
    ap.add_argument("--since", default=None, help="Look back N days (e.g. 60d)")
    ap.add_argument("--out", default=None,
                    help="Output JSONL path. Default: "
                         "<CACHE>/writing-loop-mining/<project>/turns.jsonl")
    args = ap.parse_args()

    since = parse_since(args.since) if args.since else None
    out_path = Path(args.out) if args.out else (DEFAULT_OUT_DIR / args.project / "turns.jsonl")
    out_path.parent.mkdir(parents=True, exist_ok=True)

    n_files = n_turns = 0
    with open(out_path, "w", encoding="utf-8") as f:
        for p in iter_project_files(args.project, since):
            n_files += 1
            for rec in extract_turns(p):
                f.write(json.dumps(rec, ensure_ascii=False) + "\n")
                n_turns += 1

    print(json.dumps({
        "project": args.project,
        "files_scanned": n_files,
        "turns_written": n_turns,
        "out": str(out_path),
    }, indent=2))


if __name__ == "__main__":
    main()
