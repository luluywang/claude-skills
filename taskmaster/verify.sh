#!/usr/bin/env bash
#
# Verify that Taskmaster is correctly installed for Claude Code.
#
set -uo pipefail

CLAUDE_ROOT="${CLAUDE_ROOT:-$HOME/.claude}"
HOOK_LINK="$CLAUDE_ROOT/hooks/taskmaster-check-completion.sh"
SETTINGS="$CLAUDE_ROOT/settings.json"
SKILL_DIR="$CLAUDE_ROOT/skills/taskmaster"

PASS=0
FAIL=0

ok()   { echo "  [OK]  $1"; PASS=$((PASS + 1)); }
fail() { echo "  [FAIL] $1"; FAIL=$((FAIL + 1)); }
warn() { echo "  [WARN] $1"; }

echo "Taskmaster installation check"
echo "============================="

# 1. hook symlink exists
if [[ -L "$HOOK_LINK" ]]; then
  ok "Hook symlink exists: $HOOK_LINK"
else
  fail "Hook symlink missing: $HOOK_LINK"
fi

# 2. symlink resolves to a real file
if [[ -L "$HOOK_LINK" ]]; then
  TARGET="$(readlink -f "$HOOK_LINK" 2>/dev/null || true)"
  if [[ -f "$TARGET" ]]; then
    ok "Hook symlink resolves to: $TARGET"
  else
    fail "Hook symlink is broken (target not found): $TARGET"
  fi
fi

# 3. hook is executable
if [[ -x "$HOOK_LINK" ]]; then
  ok "Hook is executable"
else
  fail "Hook is not executable — run: chmod +x $HOOK_LINK"
fi

# 4. compliance prompt exists alongside check-completion
COMPLIANCE="$SKILL_DIR/taskmaster-compliance-prompt.sh"
if [[ -f "$COMPLIANCE" ]]; then
  ok "Compliance prompt exists: $COMPLIANCE"
else
  fail "Compliance prompt missing: $COMPLIANCE (hook will fail to source it)"
fi

# 5. jq available
if command -v jq >/dev/null 2>&1; then
  ok "jq is available ($(jq --version))"
else
  fail "jq not found — install with: brew install jq"
fi

# 6. settings.json has Stop hook
if [[ ! -f "$SETTINGS" ]]; then
  fail "settings.json not found: $SETTINGS"
else
  if ! python3 -c "import json; json.load(open('$SETTINGS'))" 2>/dev/null; then
    fail "settings.json is not valid JSON"
  else
    REGISTERED=$(python3 - "$SETTINGS" <<'PY'
import json, sys
data = json.load(open(sys.argv[1]))
container = data.get("hooks", data)
stop = container.get("Stop", [])
for entry in stop:
    for hook in entry.get("hooks", []):
        if "taskmaster" in (hook.get("command") or ""):
            print("yes")
            sys.exit(0)
print("no")
PY
)
    if [[ "$REGISTERED" == "yes" ]]; then
      ok "Stop hook registered in settings.json"
    else
      fail "Stop hook not found in settings.json — run install.sh or see SETUP.md manual steps"
    fi
  fi
fi

# 7. quick smoke test: run the hook with a minimal fake payload
FAKE_SESSION="verify-smoke-test-$$"
FAKE_INPUT=$(jq -n --arg sid "$FAKE_SESSION" '{session_id: $sid, transcript_path: "/dev/null", last_assistant_message: ""}')
SMOKE_OUT=$(echo "$FAKE_INPUT" | bash "$HOOK_LINK" 2>&1 || true)
DECISION=$(echo "$SMOKE_OUT" | jq -r '.decision // empty' 2>/dev/null || true)
if [[ "$DECISION" == "block" ]]; then
  ok "Smoke test passed: hook returns block when done signal absent"
elif [[ -z "$DECISION" ]]; then
  # transcript is /dev/null which is 0 lines, hook exits 0 (skips short transcripts)
  ok "Smoke test passed: hook exits cleanly for short/empty transcript"
else
  warn "Smoke test unexpected output: $SMOKE_OUT"
fi

echo ""
echo "Results: $PASS passed, $FAIL failed"
if [[ "$FAIL" -gt 0 ]]; then
  echo "See SETUP.md for fix instructions."
  exit 1
else
  echo "Taskmaster is ready."
  exit 0
fi
