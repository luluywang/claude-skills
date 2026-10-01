"""Shared helpers for the Pangram skill: auth, HTTP, billing, reporting."""

import json
import math
import os
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

BASE = "https://text.external-api.pangram.com"
DEFAULT_KEY_FILE = Path.home() / "Dropbox" / "Claude" / "pangram" / "pangram.api"

# Segments shorter than this are rejected or scored unreliably by the API.
MIN_WORDS = 50

# Billable units per bulk request, and the word block that defines a unit.
# One unit = one *started* block per item, minimum one unit per item.
BULK_UNIT_LIMIT = 1000
MODEL_BLOCK_WORDS = {"pangram-4": 100}
DEFAULT_BLOCK_WORDS = 1000


def resolve_key(cli_key=None):
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


def request(method, path, key, body=None, params=None, timeout=60):
    url = BASE + path
    if params:
        url += "?" + urllib.parse.urlencode(params)
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(url, data=data, method=method)
    req.add_header("x-api-key", key)
    if data:
        req.add_header("Content-Type", "application/json")
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return json.loads(resp.read())
    except urllib.error.HTTPError as e:
        detail = e.read().decode(errors="replace")[:500]
        hint = {
            401: " (check the API key)",
            402: " (account is out of credits)",
            403: " (model not enabled for this key, or job owned by another key)",
            413: " (bulk request over the billable-unit limit)",
            404: " (job not found, or older than the 48h retention window)",
        }.get(e.code, "")
        sys.exit(f"Pangram API error {e.code}{hint} on {method} {path}: {detail}")
    except urllib.error.URLError as e:
        sys.exit(f"Could not reach Pangram API: {e.reason}")


def block_words(model):
    return MODEL_BLOCK_WORDS.get(model, DEFAULT_BLOCK_WORDS)


def billable_units(word_count, model):
    """One started word block per item, minimum one unit."""
    return max(1, math.ceil(word_count / block_words(model)))


def excerpt(s, n=160):
    s = " ".join(s.split())
    return s if len(s) <= n else s[: n - 1] + "…"


def report(result, show_human=False):
    print("\n=== Result ===")
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
