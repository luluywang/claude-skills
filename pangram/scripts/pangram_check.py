#!/usr/bin/env python3
"""Check text for AI-generated writing via the Pangram API (single document).

Reads text from a file argument, --text, or stdin. Submits to the async
inference API, polls until terminal, and prints a readable report.

For many files or a whole manuscript, use pangram_bulk.py instead — it packs
everything into one bulk job.
"""

import argparse
import json
import sys
import time
from pathlib import Path

from pangram_api import MIN_WORDS, report, request, resolve_key


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


def main():
    ap = argparse.ArgumentParser(description="Check text for AI writing via Pangram.")
    ap.add_argument("file", nargs="?", help="path to a text file ('-' or omit for stdin)")
    ap.add_argument("--text", help="inline text to check instead of a file")
    ap.add_argument("--model", default="pangram-4",
                    help="model name (default: 'pangram-4'; 'default' is the older, "
                         "cheaper, much less sensitive model)")
    ap.add_argument("--dashboard", action="store_true",
                    help="request a public dashboard link")
    ap.add_argument("--json", action="store_true", help="print raw JSON only")
    ap.add_argument("--show-human", action="store_true",
                    help="include human-labeled passages in the report")
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

    result = analyze(text, key, args.model, args.dashboard, args.poll, args.timeout)
    if args.json:
        print(json.dumps(result, indent=2))
    else:
        report(result, show_human=args.show_human)


if __name__ == "__main__":
    main()
