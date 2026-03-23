#!/usr/bin/env bash
# staleness.sh — Compare mtimes along DAG edges to find stale files.
#
# Usage: bash staleness.sh [project_dir]
# Reads current/dag.json, compares file modification times along edges.
# Propagates staleness transitively: if A is stale, everything downstream is stale.
# Output: human-readable staleness report to stdout.

set -euo pipefail

PROJECT_DIR="${1:-$PWD}"
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

# Find project root (walk up looking for code/ or Makefile)
find_root() {
    local dir="$1"
    while [ "$dir" != "/" ]; do
        if [ -d "$dir/code" ] || [ -f "$dir/Makefile" ] || [ -d "$dir/data" ]; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    echo "$1"
}

PROJECT_ROOT="$(find_root "$PROJECT_DIR")"
DAG_FILE="$PROJECT_ROOT/current/dag.json"

if [ ! -f "$DAG_FILE" ]; then
    echo "ERROR: No DAG found at $DAG_FILE"
    echo "Run '/plumber audit' or '/plumber status' to build the DAG first."
    exit 1
fi

# Use Python to process the DAG and check staleness
python3 - "$PROJECT_ROOT" "$DAG_FILE" <<'PYEOF'
import json
import os
import sys
from datetime import datetime
from pathlib import Path

project_root = Path(sys.argv[1])
dag_file = Path(sys.argv[2])

with open(dag_file) as f:
    dag = json.load(f)

nodes_by_id = {n["id"]: n for n in dag["nodes"]}
edges = dag["edges"]

# Get mtimes for all files
mtimes = {}
missing = []
for node in dag["nodes"]:
    fp = project_root / node["id"]
    if fp.exists():
        mtimes[node["id"]] = fp.stat().st_mtime
    else:
        missing.append(node["id"])

# Find directly stale edges: producer is newer than consumer,
# or dependency is newer than the file that depends on it
stale_files = set()
stale_edges = []

for edge in edges:
    src = edge["from"]
    dst = edge["to"]

    if src not in mtimes or dst not in mtimes:
        continue

    if edge["relation"] == "produces":
        # src (script) produces dst (data) — if script is newer, data is stale
        if mtimes[src] > mtimes[dst]:
            stale_files.add(dst)
            stale_edges.append((src, dst, "script newer than output"))
    elif edge["relation"] == "consumed_by":
        # src (data) consumed by dst (script) — if data is newer, script outputs may be stale
        # Check what dst produces
        for e2 in edges:
            if e2["from"] == dst and e2["relation"] == "produces":
                output = e2["to"]
                if output in mtimes and mtimes[src] > mtimes[output]:
                    stale_files.add(output)
                    stale_edges.append((src, output, f"input newer than output (via {dst})"))

# Propagate staleness transitively
# Build downstream adjacency
downstream = {}
for edge in edges:
    if edge["relation"] == "produces":
        downstream.setdefault(edge["to"], [])
        # Find what consumes this output
        for e2 in edges:
            if e2["from"] == edge["to"] and e2["relation"] == "consumed_by":
                consumer = e2["to"]
                # Find what the consumer produces
                for e3 in edges:
                    if e3["from"] == consumer and e3["relation"] == "produces":
                        downstream.setdefault(edge["to"], []).append(e3["to"])

changed = True
while changed:
    changed = False
    for f in list(stale_files):
        for d in downstream.get(f, []):
            if d not in stale_files:
                stale_files.add(d)
                changed = True

# Report
print("=" * 60)
print("STALENESS REPORT")
print(f"Project: {project_root}")
print(f"DAG scan: {dag.get('scan_timestamp', 'unknown')}")
print("=" * 60)

if missing:
    print(f"\n## Missing files ({len(missing)})")
    for m in sorted(missing):
        node = nodes_by_id.get(m, {})
        ntype = node.get("type", "unknown")
        print(f"  [MISSING] {m} ({ntype})")

if stale_edges:
    print(f"\n## Stale edges ({len(stale_edges)})")
    for src, dst, reason in sorted(stale_edges):
        src_time = datetime.fromtimestamp(mtimes.get(src, 0)).strftime("%Y-%m-%d %H:%M")
        dst_time = datetime.fromtimestamp(mtimes.get(dst, 0)).strftime("%Y-%m-%d %H:%M")
        print(f"  [STALE] {dst}")
        print(f"          {reason}")
        print(f"          {src}: {src_time}")
        print(f"          {dst}: {dst_time}")

if stale_files:
    print(f"\n## All stale files ({len(stale_files)}, including transitive)")
    for f in sorted(stale_files):
        mtime_str = datetime.fromtimestamp(mtimes.get(f, 0)).strftime("%Y-%m-%d %H:%M") if f in mtimes else "MISSING"
        print(f"  {f}  ({mtime_str})")

if not stale_edges and not missing:
    print("\nAll files are up to date.")

print(f"\nSummary: {len(dag['nodes'])} nodes, {len(dag['edges'])} edges, "
      f"{len(stale_files)} stale, {len(missing)} missing")
PYEOF
