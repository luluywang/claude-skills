#!/usr/bin/env python3
"""Bulk AI-detection over many files, or one long document split into chunks.

Packs every piece into as few bulk jobs as the billable-unit limit allows,
polls to terminal, pages through the results, and prints one row per piece.

  pangram_bulk.py chapter*.md
  pangram_bulk.py paper.tex --chunk-words 300
  pangram_bulk.py drafts/*.md --chunk-words 400 --csv out.csv
  pangram_bulk.py --resume blk_123

Item IDs are "<path>#<n>", so every row maps back to a file and chunk.
"""

import argparse
import csv
import json
import sys
import time
from pathlib import Path

from pangram_api import (
    BULK_UNIT_LIMIT,
    MIN_WORDS,
    billable_units,
    block_words,
    chunks,
    excerpt,
    report,
    request,
    resolve_key,
)

TERMINAL = {"succeeded", "failed", "partial"}


def build_items(paths, chunk_words, model):
    """Turn files into {id, text, words} items, skipping pieces that are too short."""
    items, skipped = [], []
    # Label rows by basename when that is unambiguous; fall back to full paths
    # so IDs stay unique (the API requires it) without being unreadable.
    names = [Path(p).name for p in paths]
    use_basename = len(set(names)) == len(names)
    for p in paths:
        path = Path(p)
        if not path.is_file():
            sys.exit(f"No such file: {path}")
        label = path.name if use_basename else str(path)
        text = path.read_text(errors="replace").strip()
        if not text:
            skipped.append((label, "empty"))
            continue
        pieces = chunks(text, chunk_words) if chunk_words > 0 else [text]
        for i, piece in enumerate(pieces, 1):
            words = len(piece.split())
            item_id = f"{label}#{i}" if len(pieces) > 1 else label
            if words < MIN_WORDS:
                skipped.append((item_id, f"{words} words, under {MIN_WORDS}"))
                continue
            units = billable_units(words, model)
            if units > BULK_UNIT_LIMIT:
                skipped.append((item_id, f"{units} units exceeds per-job limit"))
                continue
            items.append({"id": item_id, "text": piece, "words": words})
    return items, skipped


def batch(items, model):
    """Group items so each bulk request stays within the billable-unit limit."""
    batches, cur, units = [], [], 0
    for it in items:
        u = billable_units(it["words"], model)
        if cur and units + u > BULK_UNIT_LIMIT:
            batches.append(cur)
            cur, units = [], 0
        cur.append(it)
        units += u
    if cur:
        batches.append(cur)
    return batches


def submit(items, key, model):
    payload = {
        "items": [{"id": it["id"], "text": it["text"]} for it in items],
        "model": model,
    }
    resp = request("POST", "/bulk", key, payload)
    bulk_id = resp.get("bulk_id")
    if not bulk_id:
        sys.exit(f"Unexpected bulk submit response: {json.dumps(resp)[:500]}")
    for f in resp.get("failed_items") or []:
        print(f"  rejected {f.get('id') or f.get('index')}: {f.get('error')}",
              file=sys.stderr)
    return bulk_id


def wait(bulk_id, key, poll, timeout):
    deadline = time.time() + timeout
    last = None
    while True:
        st = request("GET", f"/bulk/{bulk_id}", key)
        status = st.get("status", "")
        line = f"  {bulk_id}: {status} " \
               f"({st.get('succeeded', 0)} ok, {st.get('failed', 0)} failed " \
               f"of {st.get('total_items', 0)})"
        if line != last:
            print(line, file=sys.stderr)
            last = line
        if status in TERMINAL:
            return st
        if time.time() > deadline:
            sys.exit(
                f"Timed out after {timeout}s on bulk {bulk_id} (status {status}). "
                f"Results keep for 48h — resume with --resume {bulk_id}"
            )
        time.sleep(poll)


def fetch_results(bulk_id, key, page=100):
    """Page through /results, returning (results, failures)."""
    results, failures, offset = [], [], 0
    while True:
        resp = request("GET", f"/bulk/{bulk_id}/results", key,
                       params={"offset": offset, "limit": page})
        results.extend(resp.get("items") or [])
        failures.extend(resp.get("failed_items") or [])
        total = resp.get("total_items", 0)
        offset += page
        if offset >= total:
            return results, failures


def top_window(result):
    """The most AI-like window, which is what a reviewer should look at first."""
    windows = (result or {}).get("windows") or []
    if not windows:
        return None
    return max(windows, key=lambda w: w.get("ai_assistance_score") or 0)


def rows_from(results):
    out = []
    for item in results:
        res = item.get("result")
        if not res:
            continue  # still in progress
        w = top_window(res) or {}
        out.append({
            "id": item.get("id") or f"index-{item.get('index')}",
            "verdict": res.get("prediction_short", "?"),
            "headline": res.get("headline", ""),
            "fraction_ai": res.get("fraction_ai", 0.0),
            "fraction_ai_assisted": res.get("fraction_ai_assisted", 0.0),
            "fraction_human": res.get("fraction_human", 0.0),
            "top_score": w.get("ai_assistance_score"),
            "confidence": w.get("confidence", ""),
            "excerpt": excerpt(w.get("text", ""), 80),
            "_result": res,
        })
    return out


def print_table(rows):
    if not rows:
        print("\nNo completed results.")
        return
    width = min(max(len(r["id"]) for r in rows), 48)
    print(f"\n{'ITEM'.ljust(width)}  {'VERDICT':<8} {'AI%':>5} {'SCORE':>6}  CONFIDENCE")
    print("-" * (width + 32))
    for r in rows:
        ident = r["id"] if len(r["id"]) <= width else "…" + r["id"][-(width - 1):]
        score = f"{r['top_score']:.2f}" if isinstance(r["top_score"], float) else "  n/a"
        print(
            f"{ident.ljust(width)}  {r['verdict']:<8} "
            f"{r['fraction_ai']:>4.0%} {score:>6}  {r['confidence']}"
        )
    flagged = [r for r in rows if r["fraction_ai"] > 0 or r["fraction_ai_assisted"] > 0]
    print(f"\n{len(flagged)} of {len(rows)} items carry AI-labeled text.")
    if flagged:
        print("\nMost AI-like first:")
        for r in sorted(flagged, key=lambda r: -(r["top_score"] or 0))[:10]:
            print(f"  {r['id']}  [{r['headline']}]")
            print(f"    {r['excerpt']}")


def write_csv(rows, dest):
    cols = ["id", "verdict", "headline", "fraction_ai", "fraction_ai_assisted",
            "fraction_human", "top_score", "confidence"]
    with open(dest, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=cols)
        w.writeheader()
        for r in rows:
            w.writerow({c: r[c] for c in cols})
    print(f"\nWrote {len(rows)} rows to {dest}")


def main():
    ap = argparse.ArgumentParser(
        description="Bulk AI-detection over many files or one long document.")
    ap.add_argument("files", nargs="*", help="text files to check")
    ap.add_argument("--chunk-words", type=int, default=0,
                    help="split each file into ~N-word chunks (one item per chunk)")
    ap.add_argument("--model", default="default", help="model name (default: 'default')")
    ap.add_argument("--resume", metavar="BULK_ID",
                    help="fetch results of an existing job instead of submitting")
    ap.add_argument("--csv", metavar="PATH", help="also write results to a CSV")
    ap.add_argument("--json", action="store_true", help="print raw JSON only")
    ap.add_argument("--detail", action="store_true",
                    help="print the full per-item report, not just the table")
    ap.add_argument("--show-human", action="store_true",
                    help="with --detail, include human-labeled passages")
    ap.add_argument("--dry-run", action="store_true",
                    help="show items, billable units, and job count without submitting")
    ap.add_argument("--api-key", help="API key (overrides env and key file)")
    ap.add_argument("--poll", type=float, default=3.0, help="poll interval seconds")
    ap.add_argument("--timeout", type=float, default=1800, help="poll timeout seconds")
    args = ap.parse_args()

    key = resolve_key(args.api_key)

    if args.resume:
        bulk_ids = [args.resume]
    else:
        if not args.files:
            ap.error("give at least one file, or --resume BULK_ID")
        items, skipped = build_items(args.files, args.chunk_words, args.model)
        for ident, why in skipped:
            print(f"skipping {ident}: {why}", file=sys.stderr)
        if not items:
            sys.exit("Nothing to submit.")

        batches = batch(items, args.model)
        total_units = sum(billable_units(i["words"], args.model) for i in items)
        print(
            f"{len(items)} items, ~{total_units} billable units "
            f"({block_words(args.model)}-word blocks, model '{args.model}'), "
            f"{len(batches)} bulk job(s)",
            file=sys.stderr,
        )
        if args.dry_run:
            for it in items:
                print(f"  {it['id']}  {it['words']} words  "
                      f"{billable_units(it['words'], args.model)}u", file=sys.stderr)
            return

        bulk_ids = [submit(b, key, args.model) for b in batches]

    all_results, all_failures = [], []
    for bulk_id in bulk_ids:
        wait(bulk_id, key, args.poll, args.timeout)
        res, fail = fetch_results(bulk_id, key)
        all_results.extend(res)
        all_failures.extend(fail)

    if args.json:
        print(json.dumps({"items": all_results, "failed_items": all_failures}, indent=2))
        return

    rows = rows_from(all_results)
    print_table(rows)

    for f in all_failures:
        print(f"  failed: {f.get('id') or f.get('index')}: {f.get('error')}",
              file=sys.stderr)

    if args.detail:
        for r in rows:
            print(f"\n--- {r['id']} ---")
            report(r["_result"], show_human=args.show_human)

    if args.csv:
        write_csv(rows, args.csv)

    print(f"\nBulk job(s): {', '.join(bulk_ids)}  (results keep for 48h)")


if __name__ == "__main__":
    main()
