---
name: write-loop
description: Iterative writing with an actor-critic loop. Asks the user for a goal (e.g. "sound less AI") and a critic persona (harsh editor, McCloskey-strict, generous mentor, hostile referee, diagnostic voice, or custom), then rewrites the target text, has a fresh-eyes critic grade against the goal and shared writing standards, and iterates until clean, stagnant, or max iterations. Only activate when the user explicitly invokes '/write-loop'.
---

# write-loop

## Invocation

```
/write-loop <path>                 # Iterate on a file
/write-loop                        # Then path is asked in startup
/write-loop status                 # Inspect current/state.json
/write-loop reset                  # Delete current/ and start clean
```

The skill assumes the target is a text file (`.md`, `.tex`, `.txt`). Non-text
formats are out of scope.

## Dependencies

- The `copyedit` skill must be installed at `~/.claude/skills/copyedit/`.
  This skill reads copyedit's files at runtime through `@` references:
  - `~/.claude/skills/copyedit/references/writing_quality_standards.md`
  - `~/.claude/skills/copyedit/prompts/shared/components/surface_critic.prompt`
- The `writing_standards` skill must be installed at `~/.claude/skills/writing_standards/`.
  The actor and critic read its author-voice spec at runtime:
  - `~/.claude/skills/writing_standards/voice_spec.md`

  **Design constraint:** write-loop never copies those files. Editing
  copyedit's principles or surface rules automatically propagates to
  write-loop on the next invocation. If you update copyedit, run
  `./install.sh copyedit` once; nothing else is needed.

## Key paths

```
SKILL_DIR   = path to this skill (resolve at runtime)
CURRENT_DIR = ./write-loop/current        # working area (gitignored via rsync exclude)
STATE_FILE  = $CURRENT_DIR/state.json
ITER_DIR    = $CURRENT_DIR/iter_{N}/      # per-iteration text.md + critique.md
FINAL       = $CURRENT_DIR/final.md       # produced by loop.sh finalize
```

`WRITE_LOOP_WORK_DIR` overrides `CURRENT_DIR` for tests or out-of-repo runs.

---

## Workflow

### Phase 1 — Startup (ask the user)

Read `@prompts/startup.md` and follow it. Use **AskUserQuestion** for each of:
goal, persona, scope, max iterations. On confirmation, call:

```bash
SOURCE_PATH="<path>" GOAL="<goal>" PERSONA="<persona>" SCOPE="<scope>" \
  bash {SKILL_DIR}/scripts/loop.sh init <max>
```

`loop.sh init` seeds `current/iter_0/text.md` from `SOURCE_PATH` and writes
`state.json`.

### Phase 2 — Actor-critic iteration

Repeat until `loop.sh status` reports `should_stop: true`:

1. **Actor** (Opus subagent, fresh context):
   ```
   Task: [write-loop:actor] Rewrite iter_{N}
   model: "opus"
   subagent_type: "general-purpose"

   Instructions:
   Read {SKILL_DIR}/prompts/actor.prompt in full.

   PREV_TEXT      = current/iter_{N-1}/text.md
   PREV_CRITIQUE  = current/iter_{N-1}/critique.md   (empty on iter 1)
   GOAL           = <state.json#goal>
   PERSONA        = <state.json#persona>
   SCOPE          = <state.json#scope>
   OUT_DIR        = current/iter_{N}/

   Rewrite to OUT_DIR/text.md. Apply the surface gate before writing.
   Return: {iter, bytes, declined_flags}
   ```

2. **Critic** (Sonnet subagent, fresh context — never sees actor prompt):
   ```
   Task: [write-loop:critic] Critique iter_{N}
   model: "sonnet"
   subagent_type: "general-purpose"

   Instructions:
   Read {SKILL_DIR}/prompts/critic.prompt in full.

   TEXT_PATH  = current/iter_{N}/text.md
   GOAL       = <state.json#goal>
   PERSONA    = <state.json#persona>
   SCOPE      = <state.json#scope>
   OUT_PATH   = current/iter_{N}/critique.md

   Write the critique; final line must be: "issues_remaining: N"
   ```

3. **Record** — extract `N` from the critic's last line and advance state:
   ```bash
   bash {SKILL_DIR}/scripts/loop.sh next <N>
   ```

4. **Check stopping** — parse the JSON from `next`:
   - `should_stop: true, stop_reason: "clean"` → goto Phase 3.
   - `should_stop: true, stop_reason: "max_iterations"` → goto Phase 3, note cap hit.
   - `should_stop: true, stop_reason: "stagnation"` → goto Phase 3, ask the
     user whether to continue (AskUserQuestion). Two identical `issues_remaining`
     in a row means the loop can't close the remaining gap — useful signal.
   - `should_stop: false` → back to step 1 with N+1.

**Do not** let the actor read the critic's prompt, or the critic read prior
drafts/critiques. Independence is what makes the loop honest.

### Phase 3 — Finalize

```bash
bash {SKILL_DIR}/scripts/loop.sh finalize
```

Produces `current/final.md` from the last iteration's `text.md`.

Present to the user:
- Path to `current/final.md`
- Iteration count, stop reason, `issues_history` array
- A one-line diff summary vs. the original (`wc -l` / `wc -w` before/after)
- Offer: overwrite the source file with `final.md`, or leave it to the user.

**Do not overwrite the source without confirmation.**

### Reset

```
/write-loop reset
```
Deletes `current/` so the next invocation starts fresh.

---

## State schema (`current/state.json`)

```json
{
  "iteration": 2,
  "max_iterations": 5,
  "issues_remaining": 3,
  "issues_history": [7, 4, 3],
  "status": "in_progress",
  "goal": "sound less AI",
  "persona": "harsh senior editor",
  "scope": "whole file",
  "source_path": "/abs/path/to/file.md",
  "started_at": "2026-04-24T…Z"
}
```

`status` is one of `in_progress`, `clean`, `stagnation`, `max_iterations`.

---

## Troubleshooting

- **Loop hit `max_iterations` with issues still flagged.** Look at
  `issues_history`. If it's monotonically decreasing, the goal is probably
  reasonable but 5 iterations was too few — rerun with `max=8`. If it's
  bouncing, the critic is probably flagging things the actor can't fix without
  violating the goal — rerun with a clearer goal.
- **Critic never flags anything.** Check the persona. "Generous mentor" is
  forgiving by design. Switch to "harsh senior editor" or "hostile referee."
- **Actor declined flags repeatedly.** Read `current/iter_N/text.md`'s trailing
  `<!-- declined -->` comment. Persistent declines usually mean the critic is
  misreading the goal; rephrase goal or switch persona.
