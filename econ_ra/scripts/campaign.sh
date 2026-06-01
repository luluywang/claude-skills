#!/bin/bash
# campaign.sh - Atomic operations on campaign state files for econ_ra
# Usage:
#   ./campaign.sh init "<objective>"
#     Create .econ_ra/campaign/ in cwd, write campaign.md, decisions.md, jobs.json.
#     Refuses if campaign.md already exists.
#   ./campaign.sh status
#     Print JSON: objective, decision_count, jobs, exists.
#   ./campaign.sh log "<entry>"
#     Append timestamped entry to decisions.md.
#   ./campaign.sh job-add <jobid> "<purpose>"
#     Append job to jobs.json with status "submitted".
#   ./campaign.sh job-update <jobid> <status> [note]
#     Update job status in jobs.json.
#   ./campaign.sh job-list
#     Print jobs.json pretty.
#   ./campaign.sh end
#     Archive .econ_ra/campaign/ to .econ_ra/history/YYYY-MM-DD_<slug>/.
#     Refuses if any job is submitted or running.
#
# Exit codes: 0 success, 1 user error (bad state), 2 script error.
# All commands print JSON.

COMMAND="${1:-}"

CAMPAIGN_DIR=".econ_ra/campaign"
HISTORY_BASE=".econ_ra/history"
CAMPAIGN_MD="$CAMPAIGN_DIR/campaign.md"
DECISIONS_MD="$CAMPAIGN_DIR/decisions.md"
JOBS_JSON="$CAMPAIGN_DIR/jobs.json"

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATE="$SKILL_DIR/templates/campaign.md"

if [ -z "$COMMAND" ]; then
    echo '{"error": "No command given. Usage: campaign.sh init|status|log|job-add|job-update|job-list|end", "ok": false}'
    exit 1
fi

# ── init ─────────────────────────────────────────────────────────────────────
if [ "$COMMAND" = "init" ]; then
    OBJECTIVE="${2:-}"
    if [ -z "$OBJECTIVE" ]; then
        echo '{"error": "Usage: campaign.sh init \"<objective>\"", "ok": false}'
        exit 1
    fi

    if [ -f "$CAMPAIGN_MD" ]; then
        echo '{"error": "Campaign already exists. Use `resume` to continue or `end` to archive it first.", "ok": false}'
        exit 1
    fi

    mkdir -p "$CAMPAIGN_DIR"

    DATE="$(date +%Y-%m-%d)"

    # Write campaign.md from template, substituting placeholders
    if [ -f "$TEMPLATE" ]; then
        sed -e "s|{objective}|$OBJECTIVE|g" -e "s|{date}|$DATE|g" "$TEMPLATE" > "$CAMPAIGN_MD"
    else
        cat > "$CAMPAIGN_MD" <<EOF
# Campaign: $OBJECTIVE

**Started:** $DATE
**Status:** active

## Objective
$OBJECTIVE

## Current focus
(Edit this as focus shifts across sessions — one or two lines.)

## Open questions
(List questions you're still working through. Close them in decisions.md.)

## Related paths
(Key files/dirs for this campaign — code subdirs, output paths, referee docs.)
EOF
    fi

    # Write empty decisions.md
    touch "$DECISIONS_MD"

    # Write empty jobs.json
    echo '{"jobs": []}' > "$JOBS_JSON"

    echo "{\"ok\": true, \"campaign_dir\": \"$CAMPAIGN_DIR\", \"campaign_md\": \"$CAMPAIGN_MD\", \"objective\": \"$OBJECTIVE\", \"date\": \"$DATE\"}"

# ── status ────────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "status" ]; then
    if [ ! -f "$CAMPAIGN_MD" ]; then
        echo '{"exists": false, "objective": null, "decision_count": 0, "jobs": []}'
        exit 0
    fi

    python3 - "$CAMPAIGN_MD" "$DECISIONS_MD" "$JOBS_JSON" <<'PYEOF'
import sys, json, os, re

campaign_md, decisions_md, jobs_json = sys.argv[1], sys.argv[2], sys.argv[3]

# Parse objective from campaign.md (H1 line or "Objective:" line)
objective = None
if os.path.exists(campaign_md):
    with open(campaign_md) as f:
        lines = f.readlines()
    for line in lines:
        m = re.match(r'^# Campaign:\s*(.+)', line.strip())
        if m:
            objective = m.group(1).strip()
            break
    if not objective:
        for line in lines:
            m = re.match(r'^Objective:\s*(.+)', line.strip())
            if m:
                objective = m.group(1).strip()
                break

# Count non-empty lines in decisions.md
decision_count = 0
if os.path.exists(decisions_md):
    with open(decisions_md) as f:
        decision_count = sum(1 for line in f if line.strip())

# Read jobs
jobs = []
if os.path.exists(jobs_json):
    try:
        with open(jobs_json) as f:
            data = json.load(f)
        jobs = data.get("jobs", [])
    except Exception:
        jobs = []

print(json.dumps({
    "exists": True,
    "objective": objective,
    "decision_count": decision_count,
    "jobs": jobs
}, indent=2))
PYEOF

# ── log ───────────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "log" ]; then
    ENTRY="${2:-}"
    if [ -z "$ENTRY" ]; then
        echo '{"error": "Usage: campaign.sh log \"<entry>\"", "ok": false}'
        exit 1
    fi

    if [ ! -d "$CAMPAIGN_DIR" ]; then
        mkdir -p "$CAMPAIGN_DIR"
    fi

    TIMESTAMP="$(date '+%Y-%m-%d %H:%M')"
    printf '\n## %s\n%s\n' "$TIMESTAMP" "$ENTRY" >> "$DECISIONS_MD"

    echo "{\"ok\": true, \"timestamp\": \"$TIMESTAMP\", \"decisions_md\": \"$DECISIONS_MD\"}"

# ── job-add ───────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "job-add" ]; then
    JOBID="${2:-}"
    PURPOSE="${3:-}"

    if [ -z "$JOBID" ] || [ -z "$PURPOSE" ]; then
        echo '{"error": "Usage: campaign.sh job-add <jobid> \"<purpose>\"", "ok": false}'
        exit 1
    fi

    if [ ! -f "$JOBS_JSON" ]; then
        echo '{"jobs": []}' > "$JOBS_JSON"
    fi

    python3 - "$JOBS_JSON" "$JOBID" "$PURPOSE" <<'PYEOF'
import sys, json, os
from datetime import datetime, timezone

jobs_json, jobid, purpose = sys.argv[1], sys.argv[2], sys.argv[3]

with open(jobs_json) as f:
    data = json.load(f)

jobs = data.get("jobs", [])

# Check for duplicate
if any(str(j.get("jobid")) == str(jobid) for j in jobs):
    print(json.dumps({"error": f"Job {jobid} already exists. Use job-update to change status.", "ok": False}))
    sys.exit(1)

new_job = {
    "jobid": jobid,
    "purpose": purpose,
    "status": "submitted",
    "submitted_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
    "note": ""
}
jobs.append(new_job)
data["jobs"] = jobs

tmp = jobs_json + ".tmp"
with open(tmp, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
os.replace(tmp, jobs_json)

print(json.dumps({"ok": True, "jobid": jobid, "purpose": purpose, "status": "submitted"}))
PYEOF

# ── job-update ────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "job-update" ]; then
    JOBID="${2:-}"
    STATUS="${3:-}"
    NOTE="${4:-}"

    if [ -z "$JOBID" ] || [ -z "$STATUS" ]; then
        echo '{"error": "Usage: campaign.sh job-update <jobid> <status> [note]", "ok": false}'
        exit 1
    fi

    # Validate status
    case "$STATUS" in
        submitted|running|succeeded|failed|oom|cancelled) ;;
        *)
            echo "{\"error\": \"Invalid status '$STATUS'. Valid: submitted, running, succeeded, failed, oom, cancelled\", \"ok\": false}"
            exit 1
            ;;
    esac

    if [ ! -f "$JOBS_JSON" ]; then
        echo "{\"error\": \"jobs.json not found at $JOBS_JSON\", \"ok\": false}"
        exit 1
    fi

    python3 - "$JOBS_JSON" "$JOBID" "$STATUS" "$NOTE" <<'PYEOF'
import sys, json, os

jobs_json, jobid, new_status, note = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]

with open(jobs_json) as f:
    data = json.load(f)

jobs = data.get("jobs", [])
matched = [j for j in jobs if str(j.get("jobid")) == str(jobid)]
if not matched:
    print(json.dumps({"error": f"Job {jobid} not found", "ok": False}))
    sys.exit(1)

old_status = matched[0].get("status")
matched[0]["status"] = new_status
if note:
    matched[0]["note"] = note

data["jobs"] = jobs

tmp = jobs_json + ".tmp"
with open(tmp, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
os.replace(tmp, jobs_json)

print(json.dumps({"ok": True, "jobid": jobid, "old_status": old_status, "new_status": new_status}))
PYEOF

# ── job-list ──────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "job-list" ]; then
    if [ ! -f "$JOBS_JSON" ]; then
        echo '{"jobs": []}'
        exit 0
    fi

    python3 - "$JOBS_JSON" <<'PYEOF'
import sys, json

with open(sys.argv[1]) as f:
    data = json.load(f)
print(json.dumps(data, indent=2))
PYEOF

# ── end ───────────────────────────────────────────────────────────────────────
elif [ "$COMMAND" = "end" ]; then
    if [ ! -f "$CAMPAIGN_MD" ]; then
        echo '{"error": "No active campaign found. Nothing to end.", "ok": false}'
        exit 1
    fi

    # Refuse if any job is submitted or running
    if [ -f "$JOBS_JSON" ]; then
        python3 - "$JOBS_JSON" <<'PYEOF'
import sys, json

with open(sys.argv[1]) as f:
    data = json.load(f)

active = [j for j in data.get("jobs", []) if j.get("status") in ("submitted", "running")]
if active:
    ids = [str(j.get("jobid")) for j in active]
    print(json.dumps({
        "error": f"Cannot end campaign: {len(active)} job(s) still active ({', '.join(ids)}). Update job statuses first.",
        "ok": False
    }))
    sys.exit(1)

print(json.dumps({"ok": True}))
PYEOF
        if [ $? -ne 0 ]; then
            exit 1
        fi
    fi

    # Parse objective for slug
    python3 - "$CAMPAIGN_MD" "$CAMPAIGN_DIR" "$HISTORY_BASE" <<'PYEOF'
import sys, json, os, re, shutil
from datetime import date

campaign_md, campaign_dir, history_base = sys.argv[1], sys.argv[2], sys.argv[3]

# Parse objective from H1 line
objective = "campaign"
with open(campaign_md) as f:
    for line in f:
        m = re.match(r'^# Campaign:\s*(.+)', line.strip())
        if m:
            objective = m.group(1).strip()
            break

# Build slug: lowercase, spaces to underscores, strip non-alnum/underscore
slug = re.sub(r'[^a-z0-9_]', '', objective.lower().replace(' ', '_'))[:40]
slug = slug.strip('_') or "campaign"

today = date.today().strftime("%Y-%m-%d")
archive_name = f"{today}_{slug}"
archive_path = os.path.join(history_base, archive_name)

# Avoid collision
counter = 1
base_path = archive_path
while os.path.exists(archive_path):
    archive_path = f"{base_path}_{counter}"
    counter += 1

os.makedirs(os.path.dirname(archive_path), exist_ok=True)
shutil.move(campaign_dir, archive_path)

print(json.dumps({
    "ok": True,
    "archived_to": archive_path,
    "archive_name": os.path.basename(archive_path)
}))
PYEOF

else
    echo "{\"error\": \"Unknown command '$COMMAND'. Valid: init, status, log, job-add, job-update, job-list, end\", \"ok\": false}"
    exit 1
fi
