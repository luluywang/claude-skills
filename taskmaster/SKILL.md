---
name: taskmaster
description: |
  Codex wrapper plus same-process expect PTY injector
  that keeps work moving until an explicit parseable done signal is emitted.
author: blader
version: 4.3.0
---

# Taskmaster

Taskmaster for Codex uses session-log polling plus automatic continuation.
Codex TUI does not currently expose arbitrary writable stop hooks, so this
skill implements the same completion contract externally.

## How It Works

1. **Run Codex via wrapper**: `run-taskmaster-codex.sh` sets
   `CODEX_TUI_RECORD_SESSION=1` and a log path.
2. **Injector parses log events** and checks completion on each
   `task_complete` event.
3. **Parseable token contract**:
   `TASKMASTER_DONE::<session_id>`
4. **Token missing**:
   - inject follow-up user message into the same running process via
     expect PTY bridge transport, using the shared compliance prompt.
5. **Token present**: no further injection.

## Parseable Done Signal

When the work is genuinely complete, the agent must include this exact line
in its final response (on its own line):

```text
TASKMASTER_DONE::<session_id>
```

This gives external automation a deterministic completion marker to parse.

## Configuration

- `TASKMASTER_MAX` (default `0`): max warning count before suppression in the
  stop hook. `0` means unlimited warnings.

Fixed behavior (not configurable):
- Done token prefix: `TASKMASTER_DONE`
- Poll interval: `1` second
- Transport: expect only
- Expect payload mode and submit delay are fixed

## Completion Checklist

Before emitting the done signal, verify each of the following:

1. **Re-read the original user message(s).** List every discrete request or acceptance criterion. For each one, confirm it is fully addressed — not just started, FULLY done. If the user explicitly changed their mind, withdrew a request, or told you to stop or skip something, treat that item as resolved.
2. **Check the task list.** Any task not marked completed? Do it now — unless the user indicated it is no longer wanted.
3. **Check the plan.** Walk through each step — INCLUDING verification steps. Any step skipped or partially done? Finish it. If the plan includes ANY verification steps (builds, tests, lints, type-checks, manual validation, smoke tests), you MUST actually execute them and see them pass.
4. **Check for errors or incomplete work.** Did anything fail or remain unfinished? Fix it — logic errors, missing functionality, incomplete refactors, broken scripts, configuration issues, anything.
5. **Check for loose ends.** Any TODO comments, placeholder code, missing tests, untested changes, or follow-ups noted but not acted on?
6. **Check for blockers.** If something is blocking you, solve it. Try a different approach, read more code, search for examples. Never declare something a blocker and stop — own the outcome.

**User instructions always take priority.** If the user said to stop, move on, or skip something, respect that.

**DO NOT NARRATE — EXECUTE.** If incomplete work remains, do it. Do not explain what remains, describe complexity, or ask permission. Open files, write code, run commands.

**PROGRESS IS NOT COMPLETION.** "I improved X" does not satisfy a goal of Y. If the goal is not met, keep working.

**HONESTY CHECK.** Before marking anything "not possible", ask: did you actually try? Attempt it first.

## Setup

Install and run:

```bash
bash ~/.codex/skills/taskmaster/install.sh
codex-taskmaster
```
