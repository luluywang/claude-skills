---
name: delegate
description: Delegate coding work to cheaper CLI agents (Codex via `codex exec`,
  Cursor via cursor-agent) to stretch the Claude subscription. Routes tasks by cost
  tier (Claude=1.0, Codex=0.5, Cursor=0.1), runs them as watchable background jobs,
  and verifies the result before reporting back. Can pick up the most recent Claude
  Code plan ('/delegate last plan') and hand it to a cheaper agent to execute.
  Supports multi-turn driving of a Codex session ('/delegate codex convo' turns
  the Claude session into a passthrough relay). Activate when the user invokes
  '/delegate', says 'delegate this', 'delegate the last plan', 'send this to
  codex/cursor', 'codex convo', or asks to save Claude tokens on a coding task.
---

# Delegate

Claude acts as the orchestrator: it scopes the task, picks the cheapest agent that
can do it well, writes a self-contained prompt, dispatches it, watches it work, and
verifies the output. Claude spends its own tokens on judgment (scoping, routing,
steering, review), not on mechanical execution.

Delegated agents run as **background processes that stream JSONL events to a run
directory**. That gives Claude two things a fire-and-forget subagent can't offer:
visibility into the work while it happens, and the ability to correct course by
resuming the agent's session instead of making it start over.

## Cost tiers

| Agent  | Relative cost | Dispatch via |
|--------|--------------|------------|
| Cursor | 0.1          | `delegate.sh start cursor` |
| Codex  | 0.5          | `delegate.sh start codex` |
| Claude | 1.0          | do it yourself / Agent subagent |

**Default down, escalate up.** Start with the cheapest tier that plausibly handles
the task. If the result fails verification once, correct it in-session with `say`;
if it fails again, escalate one tier. Never silently escalate — tell the user when
a task moves up a tier and why.

## Routing rubric

- **Cursor (0.1)** — mechanical, well-specified work where the spec already exists:
  simple CRUD, basic UI components, boilerplate, docstrings, renames and format
  conversions, straightforward first-attempt bug fixes, simple configuration
  changes, writing tests for existing behavior, applying a diff or spec Claude
  has already written.
- **Codex (0.5)** — work that benefits from a strong second engineer: complex
  backend logic, intricate algorithm work, persistent bugs that resisted 2+ fix
  attempts, race conditions and concurrency issues, unclear root causes, deep
  multi-file features from a clear spec, second-opinion diagnosis or code review.
- **Claude (1.0)** — reserve for what the cheaper tiers can't do: ambiguous
  scoping, work requiring conversation context or user preferences, economics/
  domain judgment, anything touching skills in this repo, and the verification
  step itself.

When a task decomposes, split it: Claude writes the spec (judgment), Cursor or
Codex executes it (mechanical), Claude verifies (judgment). A big task routed
whole to Claude is usually a routing failure.

"Stuck twice" is the tier-relative escalation trigger: Cursor fails verification
twice → send it to Codex; Codex fails twice → Claude takes it over. The one
exception to pure cost-ordering: if Claude itself has been stuck on a bug for
2+ attempts, hand it sideways to Codex anyway — a fresh perspective from a
different model often beats a third Claude attempt, and it's cheaper too.

## Model and effort

Codex runs default to **`gpt-5.6-sol` at `medium` reasoning effort**. Override
per run with `--model M` / `--effort E` on `start`, or per turn on `say` (the
override persists for later turns of that session). Env defaults:
`DELEGATE_CODEX_MODEL`, `DELEGATE_CODEX_EFFORT`. Tune effort to the turn: `low`
for lookups and mechanical follow-ups, `high`/`xhigh` for the hard diagnosis
turn — Sol is built to start low and turn up.

## The dispatch loop

All dispatch goes through `scripts/delegate.sh`. It handles the CLI quirks
documented at the bottom of this file; don't hand-roll `codex exec` or
`cursor-agent` invocations.

```bash
S=~/.claude/skills/delegate/scripts/delegate.sh   # or this repo's delegate/scripts/

# 1. Dispatch. Returns immediately with RUNDIR and SESSION.
"$S" start codex  /path/to/repo "<self-contained prompt>"
"$S" start cursor /path/to/repo --shell "<prompt>"      # --shell: allow shell commands
"$S" start codex  /path/to/repo --read-only "<prompt>"  # diagnosis/review, no edits
"$S" start codex  /path/to/repo --plan last "<acceptance check>"   # see below

# 2. Watch. Compact digest: agent messages, commands, file edits, token usage.
"$S" watch <rundir>            # add --tail N, --full, or --tail 0 for everything

# 3. Steer, if it's going wrong. Kill first, then resume with a correction.
"$S" stop <rundir>
"$S" say  <rundir> "<correction>"

# 4. Or just let it finish.
"$S" wait <rundir> [timeout_s]
```

`watch` collapses the raw event stream — which is mostly token-by-token thinking
deltas — into one line per meaningful action. Read the digest, not the JSONL.

**`say` is the whole point.** It resumes the agent's existing session, so the agent
keeps everything it learned and everything it already did. This survives a hard
kill mid-turn: an agent killed after writing 3 of 12 files, then resumed, correctly
reports which 3 it wrote and picks up from there. Use `say` for verification
failures, for mid-flight course corrections, and for follow-up work. Never restate
a task from scratch when `say` will do — restarting is what costs money.

Poll `watch` rather than blocking on `wait` when a run is long or open-ended. If
the digest shows the agent editing the wrong files, misreading the spec, or looping
on a failing command, `stop` it immediately and `say` the correction. Catching a
wrong turn at minute two is the main reason to watch at all.

## Driving a conversation

The same transport supports multi-turn work: a Codex "session" is a session id
plus an append-only event log, with no live process between turns. Each
exchange is one `say`, and the process exiting is the turn boundary.

```bash
"$S" start codex /path/to/repo --read-only "<open question or task framing>"
"$S" wait <rundir> && "$S" reply <rundir>          # turn 1's answer
"$S" say <rundir> --wait "<follow-up>"             # one call = one full turn
"$S" say <rundir> --wait --effort high "<the hard turn>"
"$S" reply <rundir>                                # re-read the latest turn anytime
```

`reply` prints the latest turn's full agent message plus a footer (files
touched, command count, tokens) — read that, not the event stream. Run
`say --wait` via a background Bash task so the orchestrator is re-invoked when
the turn completes instead of blocking. For long turns, `watch --tail` mid-flight
still works.

### Convo mode: the session as a passthrough

When the user says **"/delegate codex convo"** (optionally with an opening
message), the rest of the Claude Code session becomes a relay to one Codex
session:

1. **Open**: `start codex <cwd> "<user's opening message>"` in the current
   repo. If no opening message was given, ask for one. Default `workspace-write`;
   use `--read-only` if the user frames it as investigation-only.
2. **Every subsequent user message** is forwarded verbatim with
   `say <rundir> --wait "<message>"` (run in a background Bash task), and
   Codex's reply is relayed back **in full — no summarizing, no paraphrasing**.
   Include the footer (files, commands, tokens) so the user sees cost and
   activity per turn.
3. **Claude stays out of the way.** Do not answer the user's questions
   yourself, add commentary, or start doing the work — you are the pipe. The
   exceptions, handled without forwarding: obvious orchestration asks
   ("switch to high effort" → `--effort high` on the next say; "show me the
   diff" → run `git diff`; "is it done? verify" → run the acceptance check),
   and relaying a turn failure with the stderr tail.
4. **Exit** when the user says so ("stop convo", "back to claude", "you take
   over"). On exit, `stop` the rundir to clear the write-lock and resume
   normal behavior — including full-strength Claude review of whatever the
   conversation produced, which is the usual reason to take over.

Session state (rundir, session id) survives Claude Code context compaction —
it's on disk. If the rundir is lost from context, the newest dir in
`~/.claude/delegate-runs/` is the live conversation.

**Dispatch or converse?** One test: can you write the acceptance check right
now? If yes, the spec is complete — dispatch it one-shot (the flow above under
"The dispatch loop"). If your next instruction depends on what Codex finds —
diagnosis, root-cause hunts, investigate-then-decide, iterative numerical
work — start a conversation, usually `--read-only` first, and end it with a
dispatch-style turn ("apply the fix; acceptance: <cmd> passes"). The modes
converge anyway: a dispatch whose verification fails becomes a conversation via
`say`, so the only real decision is whether the first turn carries a complete
spec or an open question.

## Delegating the last plan

"/delegate last plan" means: take the plan Claude Code most recently wrote in plan
mode and hand it to a cheaper agent to execute. A plan is already a spec — design
decisions settled, files named — which makes it close to the ideal delegated task.

```bash
"$S" plan                      # what would 'last' resolve to? (source, title, cwd, match)
"$S" plan --list               # recent plans, newest first; flags foreign cwds
"$S" plan --repo /path/to/repo # prefer plans authored in that working directory

"$S" start codex /path/to/repo --plan last "Acceptance check: run <cmd>, must print PASS."
"$S" start codex /path/to/repo --plan any  "<extra>"   # newest plan, wherever from
"$S" start codex /path/to/repo --plan ~/.claude/plans/some-plan.md "<extra>"
```

`--plan` wraps the plan in an instruction to *execute, not redesign* — the agent is
told to stop and report if a step is ambiguous or wrong rather than improvise. Any
prompt text you pass alongside `--plan` is appended as orchestrator instructions;
that is where the acceptance check belongs, since a plan rarely carries one.

Resolution checks two sources and takes the newest:

1. `$CLAUDE_PLANS_DIR` (default `~/.claude/plans/*.md`), where plan mode writes plans.
2. `ExitPlanMode` tool calls in `~/.claude/projects/**/*.jsonl` transcripts, which
   embed the full plan text.

The second source matters: the plans directory is often absent or pruned, and the
transcript copy survives the file's deletion. A plan file recovered from disk has no
`cwd` of its own, so it inherits one from its transcript twin (matched on filename).

**`--plan last` refuses to cross repo boundaries.** If the newest plan was authored
in a different working directory, resolution exits non-zero rather than dispatch it —
"most recent" is a guess about intent, and a plan aimed at another repo reads
plausibly while doing entirely the wrong work. Plans with no recorded `cwd` are
allowed through (they can't be attributed to anywhere). Override with `--plan any`,
or name a plan file explicitly. Always show the user the `PLAN=` line — it reports
source, match kind, title, and `cwd` — and confirm before a write-mode run.

`--logs-dir` (or `$CLAUDE_LOGS_DIR`) adds an archived transcript tree such as
`~/Dropbox/claude-logs`. It is **off by default on purpose**: that archive syncs
across machines, so most of its plans name working directories that don't exist
here. `plan --list` marks those `[cwd missing here]`.

## Writing the delegated prompt

The delegate has none of this conversation's context. The prompt must be
self-contained:

1. **Goal** — one sentence on what done looks like.
2. **Files** — exact paths to touch; say explicitly what must NOT be touched.
3. **Spec** — the design decisions already made; the agent executes, not designs.
   (For read-only diagnosis tasks, the spec is instead: symptoms, repro steps,
   and what's already been ruled out.)
4. **Acceptance check** — a command the agent should run before finishing
   (test suite, build, script) and what its output must show.
5. **Report format** — end with a short summary of files changed and check results.

If you can't write items 2–4 concretely, the task isn't scoped enough to
delegate — scope it first (that's Claude-tier work), then delegate the pieces.

## Verify before reporting

Never relay the delegate's self-report as fact. After the run finishes:

1. `git diff --stat`, then read the actual diff for anything surprising.
2. Run the acceptance check yourself.
3. If it fails, `say` the specific failure back to the same session — include the
   command you ran and its output. One correction round at the same tier; if it
   fails again, escalate one tier with a fresh `start`.

Report to the user: which agent ran, what changed, the verification result, and
the token usage from the `watch` digest's `tokens:` line — that's measured cost,
not an estimate.

## Guardrails

- Never delegate work on this skills repo, memory files, or anything where the
  user's preferences are the spec — cheaper agents don't know them.
- Never pass `--yolo` or sandbox-bypass flags. Codex runs under `workspace-write`
  (or `read-only`); Cursor's `--shell` uses `--force --sandbox enabled` so commands
  run sandboxed rather than unsandboxed. Don't reach past the script for more.
- `start` refuses to launch a second **writing** agent in a repo that already has a
  live one — parallel writers conflict. Read-only runs and other repos are fine.
- Don't delegate tasks whose prompt would be longer than doing the work: for
  trivial one-file edits, Claude just doing it is cheaper than orchestrating.

## CLI quirks the script handles

Recorded because each one silently corrupts a hand-rolled invocation:

- **Codex blocks on stdin** unless it gets `< /dev/null`.
- **Codex writes notices to stderr** (`Reading additional input from stdin...`).
  Merging stderr into the event log with `2>&1` corrupts the JSONL.
- **`codex exec resume` takes no `-s/--sandbox`** (plain `codex exec` does). The
  sandbox mode goes through `-c sandbox_mode=…`, and flags must precede the
  positional session id.
- **Cursor's `--resume` needs the `=` form** (`--resume=<id>`), and headless runs
  need `--trust`.
- **Cursor's `--output-format text` prints nothing on a resumed session.** Only
  `stream-json` shows the reply — which is why every run uses stream-json.
- Session id lands on the first event: `thread.started.thread_id` (Codex),
  `system/init.session_id` (Cursor). The script captures it into `meta.env`.
