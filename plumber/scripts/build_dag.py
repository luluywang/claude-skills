#!/usr/bin/env python3
"""
build_dag.py — Assemble a unified DAG from scan outputs and existing Makefile.

Usage: python3 build_dag.py <project_root> [--notebook-scan nb.json] [--script-scan sc.json]
       python3 build_dag.py <project_root>  # reads from stdin if piped, or runs scanners

If --notebook-scan / --script-scan are not provided, runs the scanners itself.
Output: writes current/dag.json and current/dag_meta.json in project_root.
"""

import hashlib
import json
import os
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path


def parse_makefile(makefile_path: Path) -> dict[str, dict]:
    """Parse Makefile targets into {target: {recipe, deps}}."""
    if not makefile_path.exists():
        return {}

    text = makefile_path.read_text(errors="replace")
    targets = {}

    # Parse variable definitions first
    variables = {}
    for m in re.finditer(r'^(\w+)\s*[:?]?=\s*(.+)$', text, re.MULTILINE):
        val = m.group(2).strip()
        def resolve(match):
            return variables.get(match.group(1), match.group(0))
        val = re.sub(r'\$\((\w+)\)', resolve, val)
        variables[m.group(1)] = val

    # Parse targets: target: deps\n\trecipe
    # Match lines like: $(INT)/file.csv: dep1 dep2
    for m in re.finditer(r'^([^\t#\n][^:=\n]*?):\s*([^\n]*)\n((?:\t[^\n]*\n?)*)', text, re.MULTILINE):
        target = m.group(1).strip()
        deps = m.group(2).strip()
        recipe = m.group(3).strip()

        # Resolve variables in target and deps
        def resolve(match):
            return variables.get(match.group(1), match.group(0))
        target = re.sub(r'\$\((\w+)\)', resolve, target)
        deps = re.sub(r'\$\((\w+)\)', resolve, deps)

        # Skip phony and special targets
        if target.startswith(".") or target in ("all", "clean", "help"):
            continue

        dep_list = [d.strip() for d in deps.split() if d.strip()]
        targets[target] = {
            "recipe": recipe,
            "deps": dep_list,
            "declared": True,
        }

    return targets


def classify_data_node(path: str) -> str:
    """Classify a data node as raw, intermediate, or output."""
    path_lower = path.lower()
    if any(x in path_lower for x in ["raw_data", "raw/", "/raw"]):
        return "raw"
    if any(x in path_lower for x in ["intermediate", "int_data", "int/"]):
        return "intermediate"
    if any(x in path_lower for x in ["output", "graphs", "tables", "figures", "results"]):
        return "output"
    return "intermediate"  # default


def build_dag(project_root: Path, notebook_scan: list[dict], script_scan: list[dict],
              makefile_targets: dict[str, dict]) -> dict:
    """Build unified DAG from scan results."""
    nodes = {}  # id -> node dict
    edges = []
    warnings = []
    all_unresolved = []

    # Process all scan results
    for scan in notebook_scan + script_scan:
        file_id = scan["file"]
        language = scan.get("language", "unknown")

        # Add script node
        if file_id not in nodes:
            nodes[file_id] = {
                "id": file_id,
                "type": "script",
                "language": language,
            }

        # Add read edges (data -> script)
        for read_path in scan.get("reads", []):
            # Normalize path
            read_id = normalize_path(read_path, project_root)
            if read_id not in nodes:
                nodes[read_id] = {
                    "id": read_id,
                    "type": "data",
                    "subtype": classify_data_node(read_id),
                }
            edges.append({
                "from": read_id,
                "to": file_id,
                "relation": "consumed_by",
            })

        # Add write edges (script -> data)
        for write_path in scan.get("writes", []):
            write_id = normalize_path(write_path, project_root)
            if write_id not in nodes:
                nodes[write_id] = {
                    "id": write_id,
                    "type": "data",
                    "subtype": classify_data_node(write_id),
                }
            edges.append({
                "from": file_id,
                "to": write_id,
                "relation": "produces",
            })

        # Collect unresolved
        for u in scan.get("unresolved", []):
            all_unresolved.append({"file": file_id, "expression": u})

    # Merge with Makefile targets
    makefile_merged = {}
    for target, info in makefile_targets.items():
        target_id = normalize_path(target, project_root)
        makefile_merged[target_id] = info

        # Check if target exists in our DAG
        if target_id not in nodes:
            nodes[target_id] = {
                "id": target_id,
                "type": "data",
                "subtype": classify_data_node(target_id),
            }

        # Check for orphan targets (in Makefile but no script produces them)
        producing_edges = [e for e in edges if e["to"] == target_id and e["relation"] == "produces"]
        if not producing_edges:
            warnings.append({
                "type": "makefile_target_no_producer",
                "target": target_id,
                "message": f"Makefile target '{target_id}' has no producing script in scan results",
            })

    # Check for data nodes that aren't in Makefile
    for node_id, node in nodes.items():
        if node["type"] == "data" and node.get("subtype") != "raw":
            producing = [e for e in edges if e["to"] == node_id and e["relation"] == "produces"]
            if producing and node_id not in makefile_merged:
                warnings.append({
                    "type": "missing_makefile_target",
                    "target": node_id,
                    "message": f"'{node_id}' is produced by a script but has no Makefile target",
                })

    # Detect cycles (simple DFS)
    adjacency = {}
    for e in edges:
        adjacency.setdefault(e["from"], []).append(e["to"])

    visited, in_stack = set(), set()
    cycle_nodes = []

    def dfs(node):
        if node in in_stack:
            cycle_nodes.append(node)
            return True
        if node in visited:
            return False
        visited.add(node)
        in_stack.add(node)
        for neighbor in adjacency.get(node, []):
            if dfs(neighbor):
                return True
        in_stack.discard(node)
        return False

    for n in list(adjacency.keys()):
        if n not in visited:
            dfs(n)

    if cycle_nodes:
        warnings.append({
            "type": "cycle_detected",
            "nodes": cycle_nodes,
            "message": "Dependency cycle detected in the DAG",
        })

    # Deduplicate edges
    seen_edges = set()
    unique_edges = []
    for e in edges:
        key = (e["from"], e["to"], e["relation"])
        if key not in seen_edges:
            seen_edges.add(key)
            unique_edges.append(e)

    return {
        "project_root": str(project_root),
        "nodes": sorted(nodes.values(), key=lambda n: n["id"]),
        "edges": unique_edges,
        "makefile_targets": makefile_merged,
        "warnings": warnings,
        "unresolved": all_unresolved,
        "scan_timestamp": datetime.now(timezone.utc).isoformat().replace("+00:00", "Z"),
    }


def normalize_path(path: str, project_root: Path) -> str:
    """Normalize a path to be relative to project_root."""
    # Handle absolute paths
    if os.path.isabs(path):
        try:
            return str(Path(path).relative_to(project_root))
        except ValueError:
            return path

    # Handle ../ and ./ prefixes
    try:
        resolved = (project_root / path).resolve()
        return str(resolved.relative_to(project_root))
    except (ValueError, OSError):
        return path


def compute_file_hashes(project_root: Path, nodes: list[dict]) -> dict[str, str]:
    """Compute hashes for script files for incremental rescan."""
    hashes = {}
    for node in nodes:
        if node["type"] == "script":
            fp = project_root / node["id"]
            if fp.exists():
                content = fp.read_bytes()
                hashes[node["id"]] = hashlib.sha256(content).hexdigest()[:16]
    return hashes


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 build_dag.py <project_root> [--notebook-scan nb.json] [--script-scan sc.json]",
              file=sys.stderr)
        sys.exit(1)

    project_root = Path(sys.argv[1]).resolve()
    scripts_dir = Path(__file__).parent

    nb_scan_path = None
    sc_scan_path = None
    for i, arg in enumerate(sys.argv):
        if arg == "--notebook-scan" and i + 1 < len(sys.argv):
            nb_scan_path = sys.argv[i + 1]
        elif arg == "--script-scan" and i + 1 < len(sys.argv):
            sc_scan_path = sys.argv[i + 1]

    # Load or run notebook scan
    if nb_scan_path:
        with open(nb_scan_path) as f:
            notebook_scan = json.load(f)
    else:
        result = subprocess.run(
            [sys.executable, str(scripts_dir / "scan_notebook.py"), str(project_root)],
            capture_output=True, text=True
        )
        notebook_scan = json.loads(result.stdout) if result.stdout.strip() else []

    # Load or run script scan
    if sc_scan_path:
        with open(sc_scan_path) as f:
            script_scan = json.load(f)
    else:
        result = subprocess.run(
            [sys.executable, str(scripts_dir / "scan_script.py"), str(project_root)],
            capture_output=True, text=True
        )
        script_scan = json.loads(result.stdout) if result.stdout.strip() else []

    # Parse Makefile
    makefile_targets = {}
    for mf_path in [project_root / "code" / "Makefile", project_root / "Makefile"]:
        if mf_path.exists():
            makefile_targets = parse_makefile(mf_path)
            break

    # Build DAG
    dag = build_dag(project_root, notebook_scan, script_scan, makefile_targets)

    # Detect project type
    languages = set()
    for n in dag["nodes"]:
        if n["type"] == "script":
            languages.add(n.get("language", "unknown"))
    if len(languages) > 1:
        dag["project_type"] = "mixed"
    elif languages:
        dag["project_type"] = languages.pop()
    else:
        dag["project_type"] = "unknown"

    # Write output
    out_dir = project_root / "current"
    out_dir.mkdir(exist_ok=True)

    dag_path = out_dir / "dag.json"
    with open(dag_path, "w") as f:
        json.dump(dag, f, indent=2)
        f.write("\n")

    # Write metadata for incremental rescan
    meta = {
        "file_hashes": compute_file_hashes(project_root, dag["nodes"]),
        "scan_timestamp": dag["scan_timestamp"],
        "node_count": len(dag["nodes"]),
        "edge_count": len(dag["edges"]),
        "warning_count": len(dag["warnings"]),
    }
    meta_path = out_dir / "dag_meta.json"
    with open(meta_path, "w") as f:
        json.dump(meta, f, indent=2)
        f.write("\n")

    # Summary to stderr
    n_scripts = sum(1 for n in dag["nodes"] if n["type"] == "script")
    n_data = sum(1 for n in dag["nodes"] if n["type"] == "data")
    print(f"DAG built: {n_scripts} scripts, {n_data} data files, "
          f"{len(dag['edges'])} edges, {len(dag['warnings'])} warnings",
          file=sys.stderr)
    print(str(dag_path))


if __name__ == "__main__":
    main()
