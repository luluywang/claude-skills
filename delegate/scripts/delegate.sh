#!/usr/bin/env bash
# Dispatch a delegated coding agent (codex | cursor) as a background process that
# streams JSONL events to a run directory, so the orchestrator can watch progress,
# intervene early, and resume with corrections instead of restarting.
#
#   delegate.sh start  <codex|cursor> <repo> [--read-only] [--shell]
#                      [--plan last|<file>] [<prompt>]
#   delegate.sh watch  <rundir> [--tail N] [--full]
#   delegate.sh say    <rundir> <prompt>        # resume with a correction
#   delegate.sh wait   <rundir> [timeout_s]
#   delegate.sh stop   <rundir>
#   delegate.sh sid    <rundir>
#   delegate.sh plan   [--repo <path>] [--list] # resolve the last Claude Code plan
#
# Run state lives in $DELEGATE_RUNS (default ~/.claude/delegate-runs/<agent>-<ts>).
set -uo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIGEST="$HERE/digest.py"
LASTPLAN="$HERE/last_plan.py"
RUNS="${DELEGATE_RUNS:-$HOME/.claude/delegate-runs}"

die() { echo "delegate: $*" >&2; exit 1; }

# Wrap a plan document into an executable instruction. The plan is a spec, not a
# brief: the delegate executes it and reports rather than redesigning it.
plan_prompt() {
  local plan_file="$1" extra="$2"
  cat <<EOF
Implement the following plan exactly as written. The design decisions in it are
already settled -- execute them, do not redesign. If a step is ambiguous, wrong,
or cannot be done as specified, STOP and report that instead of improvising.

--- BEGIN PLAN ---
$(cat "$plan_file")
--- END PLAN ---
${extra:+
Additional instructions from the orchestrator:
$extra}
When finished, report the files you changed and the result of any checks you ran.
EOF
}

# --- session id: codex emits thread.started, cursor emits system/init -----------
sid_of() {
  local ev="$1"
  [ -s "$ev" ] || return 1
  python3 - "$ev" <<'PY'
import json,sys
for line in open(sys.argv[1]):
    try: e=json.loads(line)
    except Exception: continue
    if e.get("type")=="thread.started" and e.get("thread_id"):
        print(e["thread_id"]); break
    if e.get("type")=="system" and e.get("session_id"):
        print(e["session_id"]); break
PY
}

# Repo lock: one writing delegate per repo (parallel writers conflict).
lock_path() { printf '%s/.lock-%s' "$RUNS" "$(printf '%s' "$1" | shasum | cut -c1-12)"; }

cmd_start() {
  local agent="$1" repo="$2"; shift 2
  local mode=write shell=0 plan=""
  while [ $# -gt 0 ]; do
    case "$1" in
      --read-only) mode=read; shift;;
      --shell) shell=1; shift;;
      --plan) plan="${2:-}"; [ -n "$plan" ] || die "--plan needs 'last' or a file path"; shift 2;;
      *) break;;
    esac
  done
  local prompt="$*"
  [ -d "$repo" ] || die "no such repo: $repo"
  repo="$(cd "$repo" && pwd)"

  mkdir -p "$RUNS"

  # --plan: resolve the plan, then fold any remaining prompt text in as extra
  # instructions (typically the acceptance check).
  local plan_src=""
  if [ -n "$plan" ]; then
    local plan_file
    if [ "$plan" = last ]; then
      plan_file="$(mktemp -t delegate-plan)"
      python3 "$LASTPLAN" --repo "$repo" --out "$plan_file" >/dev/null || die "no plan found; write one in plan mode first"
      plan_src="$(python3 "$LASTPLAN" --repo "$repo" | python3 -c 'import json,sys; d=json.load(sys.stdin); print(d["source"]+": "+(d["title"] or "?"))')"
    else
      [ -f "$plan" ] || die "no such plan file: $plan"
      plan_file="$plan"; plan_src="file: $plan"
    fi
    prompt="$(plan_prompt "$plan_file" "$prompt")"
    echo "PLAN=$plan_src" >&2
  fi
  [ -n "$prompt" ] || die "empty prompt (pass a prompt, or --plan last)"
  local lock; lock="$(lock_path "$repo")"
  if [ "$mode" = write ]; then
    if [ -f "$lock" ] && kill -0 "$(cat "$lock" 2>/dev/null)" 2>/dev/null; then
      die "a writing delegate is already live in $repo (pid $(cat "$lock")). stop it first."
    fi
  fi

  local run="$RUNS/${agent}-$(date -u +%Y%m%dT%H%M%SZ)-$$"
  mkdir -p "$run"
  local ev="$run/events.jsonl" err="$run/err.log"
  printf '%s' "$prompt" > "$run/prompt.txt"

  # stderr MUST stay out of events.jsonl -- codex writes non-JSON notices there.
  # stdin MUST be /dev/null -- codex otherwise blocks waiting on it.
  case "$agent" in
    codex)
      local sandbox=workspace-write
      [ "$mode" = read ] && sandbox=read-only
      local extra=()
      git -C "$repo" rev-parse --git-dir >/dev/null 2>&1 || extra+=(--skip-git-repo-check)
      # ${a[@]+"${a[@]}"} -- bash 3.2 (macOS) calls an empty array unbound under `set -u`.
      ( cd "$repo" && exec codex exec --json -s "$sandbox" ${extra[@]+"${extra[@]}"} "$prompt" \
          < /dev/null > "$ev" 2> "$err" ) &
      ;;
    cursor)
      local flags=(-p --trust --output-format stream-json)
      if [ "$mode" = read ]; then
        flags+=(--mode plan)
      elif [ "$shell" = 1 ]; then
        # --force lets sandboxed shell commands run without an approval prompt.
        flags+=(--force --sandbox enabled)
      fi
      ( cd "$repo" && exec cursor-agent "${flags[@]}" "$prompt" \
          < /dev/null > "$ev" 2> "$err" ) &
      ;;
    *) die "unknown agent: $agent (want codex|cursor)";;
  esac
  local pid=$!

  { echo "AGENT=$agent"; echo "REPO=$repo"; echo "PID=$pid"; echo "MODE=$mode"; } > "$run/meta.env"
  [ "$mode" = write ] && echo "$pid" > "$lock"

  # Wait briefly for the session id -- it lands on the very first event.
  local sid="" i=0
  while [ $i -lt 60 ]; do
    sid="$(sid_of "$ev" 2>/dev/null || true)"
    [ -n "$sid" ] && break
    kill -0 "$pid" 2>/dev/null || break
    sleep 0.5; i=$((i+1))
  done
  if [ -n "$sid" ]; then echo "SESSION=$sid" >> "$run/meta.env"; else
    echo "delegate: warning: no session id yet; see $err" >&2
  fi

  echo "RUNDIR=$run"; echo "AGENT=$agent"; echo "PID=$pid"; echo "SESSION=${sid:-unknown}"
}

load() {
  local run="$1"
  [ -d "$run" ] || die "no such rundir: $run"
  # shellcheck disable=SC1091
  . "$run/meta.env"
}

cmd_watch() {
  local run="$1"; shift
  load "$run"
  local alive=dead
  kill -0 "$PID" 2>/dev/null && alive=running
  echo "status=$alive rundir=$run"
  python3 "$DIGEST" "$run/events.jsonl" --root "$REPO" "$@"
  if [ -s "$run/err.log" ]; then
    echo "--- stderr (last 3) ---"; tail -3 "$run/err.log"
  fi
}

cmd_wait() {
  local run="$1" timeout="${2:-900}"
  load "$run"
  local waited=0
  while kill -0 "$PID" 2>/dev/null; do
    [ "$waited" -ge "$timeout" ] && { echo "still running after ${timeout}s"; return 2; }
    sleep 2; waited=$((waited+2))
  done
  echo "exited after ~${waited}s"
}

cmd_stop() {
  local run="$1"
  load "$run"
  if kill -0 "$PID" 2>/dev/null; then kill -9 "$PID" 2>/dev/null; echo "killed $PID"; else echo "not running"; fi
  rm -f "$(lock_path "$REPO")"
}

# Resume the existing session with more context. Survives a mid-turn kill: the
# thread retains everything it did before dying. Events append to the same log.
cmd_say() {
  local run="$1"; shift
  local prompt="$*"
  load "$run"
  [ -n "$prompt" ] || die "empty prompt"
  local sid; sid="$(sid_of "$run/events.jsonl")" || die "no session id in $run"
  [ -n "$sid" ] || die "no session id in $run"
  kill -0 "$PID" 2>/dev/null && die "run still live (pid $PID); 'stop' it before 'say'"

  local ev="$run/events.jsonl" err="$run/err.log"
  case "$AGENT" in
    codex)
      local sandbox=workspace-write
      [ "$MODE" = read ] && sandbox=read-only
      # `exec resume` takes no -s/--sandbox (unlike `exec`), so the mode goes through
      # -c sandbox_mode=. Flags must also precede the positional SESSION_ID.
      ( cd "$REPO" && exec codex exec resume --json -c sandbox_mode="$sandbox" "$sid" "$prompt" \
          < /dev/null >> "$ev" 2>> "$err" ) &
      ;;
    cursor)
      # NOTE: --resume needs the '=' form, and text output prints nothing on a
      # resumed session -- stream-json is the only format that shows the reply.
      local rflags=(-p --trust "--resume=$sid" --output-format stream-json)
      [ "$MODE" = read ] && rflags+=(--mode plan)
      ( cd "$REPO" && exec cursor-agent "${rflags[@]}" "$prompt" \
          < /dev/null >> "$ev" 2>> "$err" ) &
      ;;
  esac
  local pid=$!
  sed -i.bak "s/^PID=.*/PID=$pid/" "$run/meta.env" && rm -f "$run/meta.env.bak"
  [ "$MODE" = write ] && echo "$pid" > "$(lock_path "$REPO")"
  echo "RUNDIR=$run"; echo "PID=$pid"; echo "SESSION=$sid (resumed)"
}

cmd_sid() { load "$1"; sid_of "$1/events.jsonl"; }

cmd_plan() { python3 "$LASTPLAN" "$@"; }

[ $# -ge 1 ] || die "usage: delegate.sh {start|watch|say|wait|stop|sid|plan} ..."
sub="$1"; shift
case "$sub" in
  start) [ $# -ge 3 ] || die "start <codex|cursor> <repo> [--read-only] [--shell] [--plan last|<file>] [<prompt>]"; cmd_start "$@";;
  plan)  cmd_plan "$@";;
  watch) [ $# -ge 1 ] || die "watch <rundir>"; cmd_watch "$@";;
  say)   [ $# -ge 2 ] || die "say <rundir> <prompt>"; cmd_say "$@";;
  wait)  [ $# -ge 1 ] || die "wait <rundir> [timeout_s]"; cmd_wait "$@";;
  stop)  [ $# -ge 1 ] || die "stop <rundir>"; cmd_stop "$@";;
  sid)   [ $# -ge 1 ] || die "sid <rundir>"; cmd_sid "$@";;
  *) die "unknown subcommand: $sub";;
esac
