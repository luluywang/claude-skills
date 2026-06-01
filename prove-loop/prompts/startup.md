# Prove-loop startup

The orchestrator runs this once per invocation, before creating any state file.

## What to collect

Use **AskUserQuestion** to gather four inputs (in order). If the user invoked
`/prove-loop <path>`, treat the path as an existing draft (rambly or partial)
and confirm in question 2.

### 1. Theorem statement

**Question:** "What is the theorem (or claim) you want proven? State it
precisely — definitions, quantifiers, and the conclusion."

Free-text. The statement is the **rubric** the critic grades against. Write it
verbatim into `state.json#goal`. Do not paraphrase, simplify, or "clean it up."

If the user gives only a vague target ("show this mechanism is IC"), ask them
to write the statement out — including the environment quantifiers — before
proceeding. A vague goal yields a vague critic.

### 2. Draft path (optional)

**Question:** "Do you have a draft to start from?"

- **None** — start from the statement alone. The actor produces the first
  structured proof in iter_1.
- **Path** — supply a path to a .tex / .md / .txt file. The actor uses it as
  raw material (treat it as scratch work, not a final proof).

### 3. Critic persona

**Question:** "What voice should the critic have?"

Multi-choice with a fallback free-text option:

- **Math-strict referee** — every symbol defined, every assumption used, every
  step justified; flags leaps and unstated regularity conditions. (Default.)
- **Econ-intuition** — the math may check, but where is the economic story?
  Flags mechanical first-order conditions that are not interpreted, lemmas
  with no economic meaning attached.
- **Hostile theorist** — combines math-strict with structural complaints:
  "this lemma is doing nothing," "you proved a corollary, not the theorem,"
  "the assumption set is non-minimal."
- **Generous mentor** — points out gaps but suggests the fix; preserves the
  actor's structure where possible.
- **Custom** — free-text personality sketch.

Store the chosen label in `state.json#persona`. If Custom, store the user's
free text.

### 4. Max iterations

**Question:** "Max iterations?"

Default **5**. Show the user the default and accept a number. If the user is
uncertain, do not ask further — use the default.

## After collection

1. Echo back the resolved settings as a compact table and ask for confirmation
   (AskUserQuestion, yes/no). Last chance to correct a misread of the
   theorem statement or persona.

2. Prepare the seed file. The orchestrator writes `current/seed.tex`
   containing:
   ```
   % THEOREM TO PROVE
   <statement>

   % DRAFT (if user supplied one — copied verbatim, treat as scratch)
   <draft contents>
   ```
   If no draft, omit the second section. The seed file is what `loop.sh init`
   loads as iter_0.

3. Run:
   ```bash
   SOURCE_PATH="<path/to/seed.tex>" GOAL="<statement>" \
     PERSONA="<persona>" SCOPE="whole proof" \
     bash {SKILL_DIR}/scripts/loop.sh init <max>
   ```

4. Proceed to the iteration protocol documented in `SKILL.md`.
