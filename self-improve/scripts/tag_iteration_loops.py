#!/usr/bin/env python3
"""
tag_iteration_loops.py — Detect rewrite→feedback→rewrite chains per session.

Reads a turns.jsonl produced by extract_writing_turns.py (records share a
`session` + `edit_target`) and groups consecutive turns that edit the same
file or passage. Outputs one record per detected loop.

Usage:
    python3 tag_iteration_loops.py --project crosssell
    python3 tag_iteration_loops.py --in /path/turns.jsonl --out loops.jsonl

Loop record fields:
    session, rel_path, target, turn_range, iteration_count,
    signal_histogram, terminating_excerpt, satisfaction
`satisfaction` is a coarse label derived from the last user excerpt in the
loop: "satisfied" | "stopped_unfixed" | "unclear".
"""

import argparse
import json
import re
import sys
from collections import Counter
from pathlib import Path

LOGS_DIR = Path.home() / "Library/CloudStorage/Dropbox/claude-logs"
DEFAULT_CACHE = LOGS_DIR / "self-improve-cache/writing-loop-mining"

# Loops are contiguous turns on the same session+target with at most GAP gap.
GAP = 2  # allow 1 unrelated turn between related edits

SATISFIED_RE = re.compile(
    r"\b(great|perfect|ship it|good|looks good|lgtm|nice|love it|done|that works|yes exactly|nailed it|thank you|that'?s it|keep that|good enough)\b",
    re.I,
)
UNFIXED_RE = re.compile(
    r"\b(never mind|forget it|leave it|give up|move on|skip|stop|enough|whatever|close enough|i'?ll do it myself)\b",
    re.I,
)


def load_turns(in_path: Path) -> list[dict]:
    out = []
    with open(in_path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                out.append(json.loads(line))
            except json.JSONDecodeError:
                continue
    return out


def tag_loops(turns: list[dict]) -> list[dict]:
    # Group by session, preserving order
    by_session: dict[str, list[dict]] = {}
    for t in turns:
        by_session.setdefault(t["session"], []).append(t)

    loops = []
    for session, items in by_session.items():
        # Split into runs on the same target (file or passage). Gap tolerance
        # lets us cross a turn or two of unrelated back-and-forth.
        runs: list[list[dict]] = []
        current: list[dict] = []
        last_idx = None
        last_target = None
        for t in items:
            target = t.get("edit_target") or "__no_target__"
            idx = t.get("turn_idx", 0)
            if (
                current
                and target == last_target
                and last_idx is not None
                and idx - last_idx <= GAP + 1  # within tolerance
            ):
                current.append(t)
            else:
                if len(current) >= 2:
                    runs.append(current)
                current = [t]
                last_target = target
            last_idx = idx
        if len(current) >= 2:
            runs.append(current)

        for run in runs:
            last_text = run[-1]["user_excerpt"]
            if SATISFIED_RE.search(last_text):
                satisfaction = "satisfied"
            elif UNFIXED_RE.search(last_text):
                satisfaction = "stopped_unfixed"
            else:
                satisfaction = "unclear"
            sig_hist = Counter()
            for t in run:
                sig_hist.update(t.get("signals", []))
            loops.append({
                "session": session,
                "rel_path": run[0]["rel_path"],
                "target": run[0].get("edit_target"),
                "turn_range": [run[0]["turn_idx"], run[-1]["turn_idx"]],
                "iteration_count": len(run),
                "signal_histogram": dict(sig_hist),
                "terminating_excerpt": last_text,
                "satisfaction": satisfaction,
            })
    return loops


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--project", default=None,
                    help="Read <CACHE>/writing-loop-mining/<project>/turns.jsonl")
    ap.add_argument("--in", dest="in_path", default=None,
                    help="Explicit turns.jsonl input path (overrides --project)")
    ap.add_argument("--out", default=None, help="Output loops.jsonl path")
    args = ap.parse_args()

    if args.in_path:
        in_path = Path(args.in_path)
        out_path = Path(args.out) if args.out else in_path.with_name("loops.jsonl")
    elif args.project:
        in_path = DEFAULT_CACHE / args.project / "turns.jsonl"
        out_path = Path(args.out) if args.out else DEFAULT_CACHE / args.project / "loops.jsonl"
    else:
        print("[error] pass --project or --in", file=sys.stderr)
        sys.exit(2)

    if not in_path.exists():
        print(f"[error] no turns file: {in_path}", file=sys.stderr)
        sys.exit(1)

    turns = load_turns(in_path)
    loops = tag_loops(turns)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        for r in loops:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    print(json.dumps({
        "turns_read": len(turns),
        "loops_found": len(loops),
        "out": str(out_path),
    }, indent=2))


if __name__ == "__main__":
    main()
