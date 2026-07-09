---
name: delegate
description: Delegate coding work to cheaper CLI agents (Codex via the codex plugin,
  Cursor via cursor-agent) to stretch the Claude subscription. Routes tasks by cost
  tier (Claude=1.0, Codex=0.5, Cursor=0.1), runs them, then verifies the result
  before reporting back. Activate when the user invokes '/delegate', says 'delegate
  this', 'send this to codex/cursor', or asks to save Claude tokens on a coding task.
---

# Delegate

Claude acts as the orchestrator: it scopes the task, picks the cheapest agent that
can do it well, writes a self-contained prompt, dispatches it, and verifies the
output. Claude spends its own tokens on judgment (scoping, routing, review), not
on mechanical execution.

## Cost tiers

| Agent  | Relative cost | Dispatch via |
|--------|--------------|------------|
| Cursor | 0.1          | `cursor-agent -p` through Bash |
| Codex  | 0.5          | `codex:codex-rescue` subagent (codex plugin) |
| Claude | 1.0          | do it yourself / Agent subagent |

**Default down, escalate up.** Start with the cheapest tier that plausibly handles
the task. If the result fails verification once, retry the same tier with a
corrected prompt; if it fails twice, escalate one tier. Never silently escalate —
tell the user when a task moves up a tier and why.

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

## Dispatching to Codex (0.5)

Use the codex plugin, not raw `codex exec` — it manages auth, session resume, and
background execution through its companion runtime.

Spawn the subagent directly with the Agent tool:

```
Agent(subagent_type: "codex:codex-rescue", prompt: "<flags> <self-contained task>")
```

- It is a **subagent, not a skill**: never call `Skill(codex:rescue)` from here
  (that re-enters the command layer) — always go through the Agent tool.
- Prepend flags to the prompt text as needed:
  - `--background` for long/open-ended tasks, `--wait` for small bounded ones
    (the subagent also infers this if unspecified).
  - `--resume` to continue the previous Codex thread — use this for retries
    after a failed verification, it's cheaper than re-explaining. `--fresh` for
    a new thread.
  - Write access is the default; say "read-only, no edits" in the task text for
    pure diagnosis/review.
  - Leave `--model` and `--effort` unset unless the user asks.
- The subagent returns Codex's output verbatim as the tool result. That
  self-report is input to verification, not a substitute for it.
- If it reports Codex missing or unauthenticated, tell the user to run
  `/codex:setup`.

## Dispatching to Cursor (0.1)

Cursor has no plugin; run it headlessly through Bash, from the target repo root.
Use `run_in_background: true` if the task will take more than ~1 minute.

```bash
cd <repo> && cursor-agent -p --output-format text "<prompt>"
```

- Add `--mode plan` for read-only analysis (diagnosis, review) — no edits possible.
- Add `--force` only when the task requires shell commands and the prompt is tight.
- `--model` can pin a model; default is fine for tier-0.1 work.
- For a retry, send a fresh corrected prompt (or `--resume` the chat if the
  context is expensive to restate).

## Writing the delegated prompt

The delegate has none of this conversation's context. The prompt must be
self-contained:

1. **Goal** — one sentence on what done looks like.
2. **Files** — exact paths to touch; say explicitly what must NOT be touched.
3. **Spec** — the design decisions already made; the agent executes, not designs.
   (For Codex-tier diagnosis tasks, the spec is instead: symptoms, repro steps,
   and what's already been ruled out.)
4. **Acceptance check** — a command the agent should run before finishing
   (test suite, build, script) and what its output must show.
5. **Report format** — end with a short summary of files changed and check results.

If you can't write items 2–4 concretely, the task isn't scoped enough to
delegate — scope it first (that's Claude-tier work), then delegate the pieces.

## Verify before reporting

After the delegated run finishes, Claude must check the work — never relay the
delegate's self-report as fact:

1. `git diff --stat` then read the actual diff for anything surprising.
2. Run the acceptance check yourself.
3. If it fails: one retry at the same tier (`--resume` for Codex, corrected
   prompt for Cursor), then escalate one tier.

Report to the user: which agent ran, roughly what it cost relative to doing it
in Claude, what changed, and the verification result.

## Guardrails

- Never delegate work on this skills repo, memory files, or anything where the
  user's preferences are the spec — cheaper agents don't know them.
- Never pass `--yolo` or sandbox-bypass flags to Cursor.
- Don't delegate tasks whose prompt would be longer than doing the work: for
  trivial one-file edits, Claude just doing it is cheaper than orchestrating.
- One delegated agent at a time per repo — parallel writers conflict. Parallel
  is fine across different repos or with read-only modes.
