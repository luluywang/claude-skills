---
name: prove-loop
description: Iterative micro-theory proof writing with an actor-critic loop. At the start of each invocation, asks the user for a precise theorem statement, an optional rambly draft, and a critic persona (math-strict referee, econ-intuition, hostile theorist, generous mentor, or custom). The actor writes a structured LaTeX proof following the canonical layout (environment, assumptions, lemmas, theorem, proof); a fresh-eyes critic grades it against the statement, the structure rules, and an envelope-theorem rubric; iterate until clean, stagnant, or max iterations. Output is a compilable .tex file. Only activate when the user explicitly invokes '/prove-loop'.
---

# prove-loop

Statement-and-persona-driven iterative proof writing for micro-theory
results in LaTeX. Mirrors `write-loop`'s actor-critic structure but the
rubric is mathematical: every symbol defined, every assumption used, every
step justified, lemmas proved before they are invoked, envelope-theorem
regularity conditions verified rather than asserted.

## Invocation

```
/prove-loop                  # Asks for statement + optional draft path
/prove-loop <draft.tex>      # Treats path as draft; asks for statement
/prove-loop status           # Inspect current/state.json
/prove-loop reset            # Delete current/ and start clean
```

The skill produces LaTeX (`.tex`). Output is wrapped in a minimal
`\documentclass{article}` preamble with `amsmath, amssymb, amsthm` and
theorem environments defined, so the file compiles standalone.

## References

- `references/proof_structure.md` — canonical proof layout, failure modes. Read before/while drafting.
- `references/envelope_patterns.md` — when invoking an envelope step. Read when the proof needs a comparative-statics argument.
- `references/troubleshooting.md` — read when the loop hits max iterations or stagnates.

## Key paths

```
SKILL_DIR   = path to this skill (resolve at runtime)
CURRENT_DIR = ./prove-loop/current        # working area (gitignored via rsync exclude)
STATE_FILE  = $CURRENT_DIR/state.json
SEED_FILE   = $CURRENT_DIR/seed.tex       # statement + optional rambly draft
ITER_DIR    = $CURRENT_DIR/iter_{N}/      # per-iteration text.tex + critique.md
FINAL       = $CURRENT_DIR/final.tex      # produced by loop.sh finalize
```

`PROVE_LOOP_WORK_DIR` overrides `CURRENT_DIR` for tests or out-of-repo runs.

---

## Workflow

### Phase 1 — Startup (ask the user)

Read `@prompts/startup.md` and follow it. Use **AskUserQuestion** for each
of: theorem statement, optional draft path, persona, max iterations. After
confirmation:

1. Write the seed file. Concatenate the statement and (if supplied) the
   draft into `current/seed.tex`:
   ```
   % THEOREM TO PROVE
   <statement verbatim>

   % DRAFT (rambly scratch — actor uses as raw material, not final form)
   <draft contents>
   ```
2. Call `loop.sh init`:
   ```bash
   SOURCE_PATH="$CURRENT_DIR/seed.tex" GOAL="<statement>" \
     PERSONA="<persona>" SCOPE="whole proof" \
     bash {SKILL_DIR}/scripts/loop.sh init <max>
   ```

### Phase 2 — Actor-critic iteration

Repeat until `loop.sh status` reports `should_stop: true`:

1. **Actor** (Opus subagent, fresh context):
   ```
   Task: [prove-loop:actor] Write/rewrite iter_{N}
   model: "opus"
   subagent_type: "general-purpose"

   Instructions:
   Read {SKILL_DIR}/prompts/actor.prompt in full.

   PREV_TEXT      = current/iter_{N-1}/text.tex
   PREV_CRITIQUE  = current/iter_{N-1}/critique.md   (empty on iter 1)
   GOAL           = <state.json#goal>     (the theorem statement, verbatim)
   PERSONA        = <state.json#persona>
   SCOPE          = <state.json#scope>
   OUT_DIR        = current/iter_{N}/

   Write the structured LaTeX proof to OUT_DIR/text.tex. Apply the
   discipline checklist before writing.
   Return: {iter, bytes, declined_flags, lemmas}
   ```

2. **Critic** (Sonnet subagent, fresh context — never sees actor prompt):
   ```
   Task: [prove-loop:critic] Critique iter_{N}
   model: "sonnet"
   subagent_type: "general-purpose"

   Instructions:
   Read {SKILL_DIR}/prompts/critic.prompt in full.

   TEXT_PATH  = current/iter_{N}/text.tex
   GOAL       = <state.json#goal>
   PERSONA    = <state.json#persona>
   SCOPE      = <state.json#scope>
   OUT_PATH   = current/iter_{N}/critique.md

   Write the critique. Final line must be: "issues_remaining: N"
   ```

3. **Record** — extract `N` from the critic's last line:
   ```bash
   bash {SKILL_DIR}/scripts/loop.sh next <N>
   ```

4. **Check stopping** — parse the JSON from `next`:
   - `should_stop: true, stop_reason: "clean"` → goto Phase 3.
   - `should_stop: true, stop_reason: "max_iterations"` → goto Phase 3,
     note cap hit.
   - `should_stop: true, stop_reason: "stagnation"` → goto Phase 3, ask
     the user whether to continue. Two identical `issues_remaining` in a
     row means the loop can't close the remaining gap — usually a sign the
     critic is flagging something the actor genuinely cannot fix without
     restating the theorem.
   - `should_stop: false` → back to step 1 with N+1.

**Do not** let the actor read the critic's prompt, or the critic read
prior drafts/critiques. Independence is what makes the loop honest.

### Phase 3 — Finalize

```bash
bash {SKILL_DIR}/scripts/loop.sh finalize
```

Produces `current/final.tex` from the last iteration's `text.tex`.

Present to the user:
- Path to `current/final.tex`
- Iteration count, stop reason, `issues_history` array
- Lemma count and a one-line shape summary (e.g. "3 lemmas, theorem proof
  in 4 steps")
- Offer: write `final.tex` to a path of the user's choice (e.g. into their
  paper directory), or leave it in `current/`.

**Do not write outside `current/` without confirmation.**

### Reset

```
/prove-loop reset
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
  "goal": "Under Assumptions 1-3, the mechanism (q*, t*) is IC iff ...",
  "persona": "math-strict referee",
  "scope": "whole proof",
  "source_path": "/abs/path/to/seed.tex",
  "started_at": "2026-05-04T…Z"
}
```

`status` is one of `in_progress`, `clean`, `stagnation`, `max_iterations`.

---

## Model choice

- **Actor: Opus.** Writing a structured proof while preserving the
  user's intended argument is the hard step. Matches `write-loop`.
- **Critic: Sonnet.** Rubric-bound evaluation against the structure rules
  and the envelope checklist is well within Sonnet's range, and critic
  independence from actor is preserved. Matches `slides`/`write-loop`.

---

## Troubleshooting

For troubleshooting (loop hits max-iterations, critic never flags, etc.), see `references/troubleshooting.md`.
