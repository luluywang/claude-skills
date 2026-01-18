#!/usr/bin/env python3
"""
dispatcher.py - Find tasks ready for execution
Replaces the haiku task_dispatcher subagent for faster execution

Usage:
    python3 dispatcher.py              # Sequential mode (default) - returns first ready task
    python3 dispatcher.py --parallel   # Parallel mode - returns ALL ready tasks

Returns JSON with ready_tasks and counts.
"""

import json
import sys
from pathlib import Path

def find_ready_tasks(tasks_file: Path, sequential: bool = False) -> dict:
    """
    Find tasks that are ready to execute.

    A task is ready if:
    - status == "pending"
    - All tasks in depends_on have status == "complete"
    """

    if not tasks_file.exists():
        return {
            "error": f"tasks.json not found at {tasks_file}",
            "ready_tasks": [],
            "counts": {"complete": 0, "flagged": 0, "blocked": 0, "pending": 0, "partial": 0, "total": 0}
        }

    with open(tasks_file, 'r') as f:
        data = json.load(f)

    # Handle both {"tasks": [...]} and [...] formats
    tasks = data.get("tasks", data) if isinstance(data, dict) else data

    # Build set of completed task IDs
    completed_ids = {t["id"] for t in tasks if t.get("status") == "complete"}

    # Count by status
    counts = {
        "complete": 0,
        "flagged": 0,
        "blocked": 0,
        "pending": 0,
        "partial": 0,
        "total": len(tasks)
    }

    for task in tasks:
        status = task.get("status", "pending")
        if status in counts:
            counts[status] += 1
        else:
            # Unknown status, count as pending
            counts["pending"] += 1

    # Find ready tasks
    ready_tasks = []
    for task in tasks:
        if task.get("status") != "pending":
            continue

        # Check if all dependencies are complete
        depends_on = task.get("depends_on", [])
        if all(dep_id in completed_ids for dep_id in depends_on):
            ready_tasks.append({
                "id": task["id"],
                "task": task.get("task", task.get("description", "No description")),
                "type": task.get("type", "code"),
                "depends_on": depends_on
            })

    # Sort by ID
    ready_tasks.sort(key=lambda t: t["id"])

    # Sequential mode: return only first ready task
    if sequential and ready_tasks:
        ready_tasks = [ready_tasks[0]]

    return {
        "ready_tasks": ready_tasks,
        "counts": counts
    }


def main():
    # Determine skill directory (script is in scripts/, current/ is sibling)
    script_dir = Path(__file__).parent
    skill_dir = script_dir.parent
    tasks_file = skill_dir / "current" / "tasks.json"

    # Default is sequential (safer for single worktree)
    # Use --parallel for parallel execution (requires git worktrees or independent tasks)
    sequential = "--parallel" not in sys.argv

    result = find_ready_tasks(tasks_file, sequential)

    # Pretty print JSON output
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
