#!/usr/bin/env bash
# Unit tests for the Stop hook and run state. Uses a throwaway HOME. Run: bash overnight/tests/test_hook.sh
set -u
OV="$(cd "$(dirname "$0")/.." && pwd)/scripts/overnight.py"
T=$(mktemp -d "${TMPDIR:-/tmp}/ovtest.XXXX"); export HOME=$T
PROJ=$T/proj; mkdir -p $PROJ/.git/info; TR=$T/t.jsonl
pass=0; fail=0
check() { if [[ "$2" == *"$3"* ]]; then pass=$((pass+1)); echo "PASS $1"; else fail=$((fail+1)); echo "FAIL $1 :: got [$2]"; fi; }
hook() { echo "{\"session_id\":\"$1\",\"transcript_path\":\"$TR\"}" | python3 $OV hook; }
reg() { python3 - "$HOME/.claude/overnight/$RID.json" "$1" <<'PY'
import json,sys; p=sys.argv[1]; r=json.load(open(p)); exec(sys.argv[2]); json.dump(r,open(p,'w'))
PY
}
echo '{"type":"user"}' > $TR
check "no registry: allow" "[$(hook S1)]" "[]"
OUT=$(python3 $OV start --hours 6 --project $PROJ --goal "test goal"); RID=$(echo "$OUT" | sed -n 's/^OVERNIGHT_RUN:://p')
check "start prints marker" "$OUT" "OVERNIGHT_RUN::"
check "git exclude updated" "$(cat $PROJ/.git/info/exclude)" ".overnight/"
check "other session, no marker: allow" "[$(hook OTHER)]" "[]"
echo "{\"type\":\"tool_use\"} OVERNIGHT_RUN::$RID" >> $TR
check "owner session: block" "$(hook S1)" '"decision": "block"'
check "session id recorded" "$(cat $HOME/.claude/overnight/$RID.json)" '"session_id": "S1"'
check "other session still allowed" "[$(hook OTHER)]" "[]"
echo '{"type":"tool_use"}' >> $TR
check "progress resets stalls" "$(hook S1)" 'block'
check "no progress 1: block" "$(hook S1)" 'block'
check "no progress 2: block" "$(hook S1)" 'block'
check "no progress 3: allow + stalled" "[$(hook S1)]" "[]"
check "status stalled" "$(cat $HOME/.claude/overnight/$RID.json)" '"status": "stalled"'
reg "r['status']='active'; r['stalls']=0"
python3 $OV wait --run $RID --minutes 30 --on "jobs 123" >/dev/null
check "inside wait: allow" "[$(hook S1)]" "[]"
reg "from datetime import datetime,timedelta; r['wait_until']=(datetime.now().astimezone()-timedelta(minutes=1)).isoformat()"
echo '{"type":"tool_use"}' >> $TR
check "wait expired: block" "$(hook S1)" 'block'
check "wait cleared" "$(cat $HOME/.claude/overnight/$RID.json)" '"status": "active"'
check "early finish w/o reason refused" "$(python3 $OV finish --run $RID 2>&1)" "pass --reason"
reg "from datetime import datetime,timedelta; r['deadline']=(datetime.now().astimezone()-timedelta(minutes=1)).isoformat()"
check "after deadline: reminder 1" "$(hook S1)" 'deadline has passed'
check "after deadline: reminder 2" "$(hook S1)" 'deadline has passed'
check "after deadline: allow" "[$(hook S1)]" "[]"
check "status expired" "$(cat $HOME/.claude/overnight/$RID.json)" '"status": "expired"'
OUT=$(python3 $OV start --hours 1 --project $PROJ --goal g2); RID=$(echo "$OUT" | sed -n 's/^OVERNIGHT_RUN:://p')
echo "OVERNIGHT_RUN::$RID" >> $TR
check "second run: block" "$(hook S1)" 'block'
check "finish early with reason" "$(python3 $OV finish --run $RID --reason done)" "finished"
check "after finish: allow" "[$(hook S1)]" "[]"
check "bad hook input: allow" "[$(echo notjson | python3 $OV hook)]" "[]"
mkdir -p $HOME/.claude; echo '{"hooks":{"Stop":[{"hooks":[{"type":"command","command":"x"}]}]}}' > $HOME/.claude/settings.json
python3 $OV install-hook >/dev/null; python3 $OV install-hook >/dev/null
check "install-hook idempotent" "$(python3 -c "import json;d=json.load(open('$HOME/.claude/settings.json'));print(len(d['hooks']['Stop']))")" "2"
echo "passed $pass failed $fail"; rm -rf "$T"
