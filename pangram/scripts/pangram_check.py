#!/usr/bin/env python3
"""Check text for AI-generated writing via the Pangram API.

Reads text from a file argument, --text, or stdin. Submits to the async
inference API, polls until terminal, and prints a readable report.

API key resolution order:
  1. --api-key
  2. $PANGRAM_API_KEY
  3. $PANGRAM_API_KEY_FILE
  4. ~/Dropbox/Claude/pangram/pangram.api
"""

import argparse
import json
import os
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

BASE = "https://text.external-api.pangram.com"
DEFAULT_KEY_FILE = Path.home() / "Dropbox" / "Claude" / "pangram" / "pangram.api"

# Segments shorter than this are rejected by the API.
MIN_WORDS = 50


def resolve_key(cli_key):
    if cli_key:
        return cli_key.strip()
    if os.environ.get("PANGRAM_API_KEY"):
        return os.environ["PANGRAM_API_KEY"].strip()
    for candidate in (os.environ.get("PANGRAM_API_KEY_FILE"), DEFAULT_KEY_FILE):
        if candidate and Path(candidate).is_file():
            return Path(candidate).read_text().strip()
    sys.exit(
        "No API key found. Set PANGRAM_API_KEY, or put the key in "
        f"{DEFAULT_KEY_FILE}, or pass --api-key."
    )


def request(method, path, key, body=None):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(BASE + path, data=data, method=method)
    req.add_header("x-api-key", key)
    if data:
        req.add_header("Content-Type", "application/json")
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            return json.loads(resp.read())
    except urllib.error.HTTPError as e:
        detail = e.read().decode(errors="replace")[:500]
        sys.exit(f"Pangram API error {e.code} on {method} {path}: {detail}")
    except urllib.error.URLError as e:
        sys.exit(f"Could not reach Pangram API: {e.reason}")


def chunks(text, target_words):
    """Split on blank lines, packing paragraphs into >= target_words chunks.

    Packing to at-least rather than at-most keeps every chunk above the API's
    minimum length. A short trailing chunk is merged back into the previous one.
    """
    paras = [p for p in text.split("\n\n") if p.strip()]
    out, buf, count = [], [], 0
    for p in paras:
        buf.append(p)
        count += len(p.split())
        if count >= target_words:
            out.append("\n\n".join(buf))
            buf, count = [], 0
    if buf:
        tail = "\n\n".join(buf)
        if out and count < MIN_WORDS:
            out[-1] += "\n\n" + tail
        else:
            out.append(tail)
    return out or [text]


def analyze(text, key, model, dashboard, poll, timeout):
    task = request(
        "POST", "/task", key,
        {"text": text, "model": model, "public_dashboard_link": dashboard},
    )
    task_id = task.get("task_id")
    if not task_id:
        sys.exit(f"Unexpected submit response: {task}")
    deadline = time.time() + timeout
    while True:
        result = request("GET", f"/task/{task_id}", key)
        stage = result.get("stage", "")
        if stage == "STAGE_SUCCESS":
            return result
        if stage == "STAGE_FAILED":
            sys.exit(f"Pangram task failed: {json.dumps(result)[:500]}")
        if time.time() > deadline:
            sys.exit(f"Timed out after {timeout}s waiting on task {task_id}")
        time.sleep(poll)


def excerpt(s, n=160):
    s = " ".join(s.split())
    return s if len(s) <= n else s[: n - 1] + "…"


def report(result, index=None, total=None, show_human=False):
    label = f"Chunk {index}/{total}" if total and total > 1 else "Result"
    print(f"\n=== {label} ===")
    print(f"Verdict:      {result.get('headline')} ({result.get('prediction_short')})")
    print(f"              {result.get('prediction')}")
    print(
        "Mix:          "
        f"AI {result.get('fraction_ai', 0):.0%} | "
        f"AI-assisted {result.get('fraction_ai_assisted', 0):.0%} | "
        f"human {result.get('fraction_human', 0):.0%}"
    )
    print(
        "Segments:     "
        f"{result.get('num_ai_segments', 0)} AI, "
        f"{result.get('num_ai_assisted_segments', 0)} AI-assisted, "
        f"{result.get('num_human_segments', 0)} human"
    )
    if result.get("dashboard_link"):
        print(f"Dashboard:    {result['dashboard_link']}")

    # Labels seen from the API: "AI-Generated", "AI-Assisted", "Human Written".
    flagged = [
        w for w in result.get("windows", [])
        if show_human or "ai" in str(w.get("label", "")).lower()
    ]
    if flagged:
        print("\nFlagged passages:")
        for w in flagged:
            score = w.get("ai_assistance_score")
            score_s = f"{score:.2f}" if isinstance(score, (int, float)) else "n/a"
            print(
                f"  [{w.get('label')}] score {score_s}, "
                f"confidence {w.get('confidence')}, "
                f"chars {w.get('start_index')}-{w.get('end_index')}"
            )
            print(f"    {excerpt(w.get('text', ''))}")
    elif not show_human:
        print("\nNo AI-flagged passages.")


def main():
    ap = argparse.ArgumentParser(description="Check text for AI writing via Pangram.")
    ap.add_argument("file", nargs="?", help="path to a text file ('-' or omit for stdin)")
    ap.add_argument("--text", help="inline text to check instead of a file")
    ap.add_argument("--model", default="default", help="model name (default: 'default')")
    ap.add_argument("--dashboard", action="store_true",
                    help="request a public dashboard link")
    ap.add_argument("--json", action="store_true", help="print raw JSON only")
    ap.add_argument("--show-human", action="store_true",
                    help="include human-labeled passages in the report")
    ap.add_argument("--chunk-words", type=int, default=0,
                    help="split input into ~N-word chunks and check each separately")
    ap.add_argument("--models", action="store_true", help="list available models and exit")
    ap.add_argument("--api-key", help="API key (overrides env and key file)")
    ap.add_argument("--poll", type=float, default=1.5, help="poll interval seconds")
    ap.add_argument("--timeout", type=float, default=300, help="poll timeout seconds")
    args = ap.parse_args()

    key = resolve_key(args.api_key)

    if args.models:
        print(json.dumps(request("GET", "/models", key), indent=2))
        return

    if args.text is not None:
        text = args.text
    elif args.file and args.file != "-":
        path = Path(args.file)
        if not path.is_file():
            sys.exit(f"No such file: {path}")
        text = path.read_text(errors="replace")
    else:
        text = sys.stdin.read()

    text = text.strip()
    if not text:
        sys.exit("No input text.")
    if len(text.split()) < MIN_WORDS:
        sys.exit(
            f"Input is {len(text.split())} words; Pangram needs at least ~{MIN_WORDS} "
            "for a reliable verdict."
        )

    pieces = chunks(text, args.chunk_words) if args.chunk_words > 0 else [text]
    results = []
    for i, piece in enumerate(pieces, 1):
        if len(piece.split()) < MIN_WORDS and len(pieces) > 1:
            print(f"\n=== Chunk {i}/{len(pieces)} === skipped (under {MIN_WORDS} words)",
                  file=sys.stderr)
            continue
        res = analyze(piece, key, args.model, args.dashboard, args.poll, args.timeout)
        results.append(res)
        if not args.json:
            report(res, i, len(pieces), args.show_human)

    if args.json:
        print(json.dumps(results if len(results) > 1 else results[0], indent=2))


if __name__ == "__main__":
    main()
