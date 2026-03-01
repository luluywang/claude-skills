#!/bin/bash
# task_ops.sh - Atomic task state operations for econ_ra
# Usage:
#   ./task_ops.sh set-status <id> <status>
#     Set the status of a task by ID. Valid statuses: pending, partial, complete, flagged, blocked
#   ./task_ops.sh add-task <json>
#     Append a new task object to tasks.json. JSON must include: id, task, type, status.
#   ./task_ops.sh split-task <id> <new_tasks_json>
#     Replace task <id> with the array of tasks in <new_tasks_json>. New tasks inherit depends_on from original.
#
# All commands exit 0 on success, 1 on error, and print JSON to stdout.

set -e

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Working directory: ECON_RA_WORKDIR env var, or $PWD/econ_ra_work/
WORK_DIR="${ECON_RA_WORKDIR:-$PWD/econ_ra_work}"
CURRENT_DIR="$WORK_DIR/current"
TASKS_FILE="$CURRENT_DIR/tasks.json"

COMMAND="${1:-}"

if [ -z "$COMMAND" ]; then
    echo '{"error": "No command given. Usage: task_ops.sh set-status <id> <status> | add-task <json> | split-task <id> <new_tasks_json>", "ok": false}'
    exit 1
fi

# ── set-status ──────────────────────────────────────────────────────────────
if [ "$COMMAND" = "set-status" ]; then
    TASK_ID="${2:-}"
    NEW_STATUS="${3:-}"

    if [ -z "$TASK_ID" ] || [ -z "$NEW_STATUS" ]; then
        echo '{"error": "Usage: task_ops.sh set-status <id> <status>", "ok": false}'
        exit 1
    fi

    # Validate status
    case "$NEW_STATUS" in
        pending|partial|complete|flagged|blocked) ;;
        *)
            echo "{\"error\": \"Invalid status '$NEW_STATUS'. Valid: pending, partial, complete, flagged, blocked\", \"ok\": false}"
            exit 1
            ;;
    esac

    if [ ! -f "$TASKS_FILE" ]; then
        echo "{\"error\": \"tasks.json not found at $TASKS_FILE\", \"ok\": false}"
        exit 1
    fi

    # Use python3 for atomic JSON update (available on all target systems)
    python3 - "$TASKS_FILE" "$TASK_ID" "$NEW_STATUS" <<'PYEOF'
import sys, json, os

tasks_file, task_id_str, new_status = sys.argv[1], sys.argv[2], sys.argv[3]

try:
    task_id = int(task_id_str)
except ValueError:
    print(json.dumps({"error": f"id must be an integer, got '{task_id_str}'", "ok": False}))
    sys.exit(1)

with open(tasks_file) as f:
    data = json.load(f)

# Support both top-level array and {"tasks": [...]} format
if isinstance(data, list):
    tasks = data
    wrap = False
else:
    tasks = data.get("tasks", [])
    wrap = True

matched = [t for t in tasks if t.get("id") == task_id]
if not matched:
    print(json.dumps({"error": f"Task id {task_id} not found", "ok": False}))
    sys.exit(1)

old_status = matched[0].get("status")
matched[0]["status"] = new_status

tmp = tasks_file + ".tmp"
with open(tmp, "w") as f:
    if wrap:
        json.dump(data, f, indent=2)
    else:
        json.dump(tasks, f, indent=2)
    f.write("\n")
os.replace(tmp, tasks_file)

print(json.dumps({"ok": True, "id": task_id, "old_status": old_status, "new_status": new_status}))
PYEOF

# ── add-task ─────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "add-task" ]; then
    TASK_JSON="${2:-}"

    if [ -z "$TASK_JSON" ]; then
        echo '{"error": "Usage: task_ops.sh add-task <json>", "ok": false}'
        exit 1
    fi

    if [ ! -f "$TASKS_FILE" ]; then
        echo "{\"error\": \"tasks.json not found at $TASKS_FILE\", \"ok\": false}"
        exit 1
    fi

    python3 - "$TASKS_FILE" "$TASK_JSON" <<'PYEOF'
import sys, json, os

tasks_file, task_json_str = sys.argv[1], sys.argv[2]

try:
    new_task = json.loads(task_json_str)
except json.JSONDecodeError as e:
    print(json.dumps({"error": f"Invalid JSON: {e}", "ok": False}))
    sys.exit(1)

# Validate required fields
for field in ("id", "task", "type", "status"):
    if field not in new_task:
        print(json.dumps({"error": f"Missing required field '{field}'", "ok": False}))
        sys.exit(1)

with open(tasks_file) as f:
    data = json.load(f)

if isinstance(data, list):
    tasks = data
    wrap = False
else:
    tasks = data.get("tasks", [])
    wrap = True

# Check for duplicate id
if any(t.get("id") == new_task["id"] for t in tasks):
    print(json.dumps({"error": f"Task id {new_task['id']} already exists", "ok": False}))
    sys.exit(1)

tasks.append(new_task)

tmp = tasks_file + ".tmp"
with open(tmp, "w") as f:
    if wrap:
        json.dump(data, f, indent=2)
    else:
        json.dump(tasks, f, indent=2)
    f.write("\n")
os.replace(tmp, tasks_file)

print(json.dumps({"ok": True, "added_id": new_task["id"], "total_tasks": len(tasks)}))
PYEOF

# ── split-task ────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "split-task" ]; then
    TASK_ID="${2:-}"
    NEW_TASKS_JSON="${3:-}"

    if [ -z "$TASK_ID" ] || [ -z "$NEW_TASKS_JSON" ]; then
        echo '{"error": "Usage: task_ops.sh split-task <id> <new_tasks_json>", "ok": false}'
        exit 1
    fi

    if [ ! -f "$TASKS_FILE" ]; then
        echo "{\"error\": \"tasks.json not found at $TASKS_FILE\", \"ok\": false}"
        exit 1
    fi

    python3 - "$TASKS_FILE" "$TASK_ID" "$NEW_TASKS_JSON" <<'PYEOF'
import sys, json, os

tasks_file, task_id_str, new_tasks_json_str = sys.argv[1], sys.argv[2], sys.argv[3]

try:
    task_id = int(task_id_str)
except ValueError:
    print(json.dumps({"error": f"id must be an integer, got '{task_id_str}'", "ok": False}))
    sys.exit(1)

try:
    new_tasks = json.loads(new_tasks_json_str)
except json.JSONDecodeError as e:
    print(json.dumps({"error": f"Invalid JSON for new_tasks: {e}", "ok": False}))
    sys.exit(1)

if not isinstance(new_tasks, list) or len(new_tasks) < 2:
    print(json.dumps({"error": "new_tasks_json must be a JSON array with at least 2 tasks", "ok": False}))
    sys.exit(1)

with open(tasks_file) as f:
    data = json.load(f)

if isinstance(data, list):
    tasks = data
    wrap = False
else:
    tasks = data.get("tasks", [])
    wrap = True

# Find the task to split
original = None
original_index = None
for i, t in enumerate(tasks):
    if t.get("id") == task_id:
        original = t
        original_index = i
        break

if original is None:
    print(json.dumps({"error": f"Task id {task_id} not found", "ok": False}))
    sys.exit(1)

# Check for duplicate ids in new_tasks
existing_ids = {t.get("id") for t in tasks if t.get("id") != task_id}
new_ids = [t.get("id") for t in new_tasks]
conflicts = [nid for nid in new_ids if nid in existing_ids]
if conflicts:
    print(json.dumps({"error": f"Duplicate task ids in new_tasks: {conflicts}", "ok": False}))
    sys.exit(1)

# Replace original task with new tasks at the same position
tasks[original_index:original_index + 1] = new_tasks

tmp = tasks_file + ".tmp"
with open(tmp, "w") as f:
    if wrap:
        json.dump(data, f, indent=2)
    else:
        json.dump(tasks, f, indent=2)
    f.write("\n")
os.replace(tmp, tasks_file)

print(json.dumps({
    "ok": True,
    "split_id": task_id,
    "original_task": original.get("task"),
    "new_ids": new_ids,
    "total_tasks": len(tasks)
}))
PYEOF

else
    echo "{\"error\": \"Unknown command '$COMMAND'. Valid commands: set-status, add-task, split-task\", \"ok\": false}"
    exit 1
fi
