# Write-loop startup

The orchestrator runs this once per invocation, before creating any state file.

## What to collect

Use **AskUserQuestion** to gather four inputs (in order). Keep prompts tight —
the user has already named a target file by invocation argument (or it was
inferred from the most recent mention). Confirm it in question 3.

### 1. Goal

**Question:** "What should this text accomplish after iteration?"

Free-text. Examples to show the user (not pre-selected):
- "Sound less AI — less formal, less padded"
- "Tighter mechanism — every result has a causal chain"
- "AER-submission-ready introduction"
- "Match the voice of my existing intro paragraphs"

Goal is the **rubric** the critic grades against. Write it verbatim into
`state.json#goal`. Do not paraphrase.

### 2. Critic persona

**Question:** "What voice should the critic have?"

Multi-choice with a fallback free-text option:

- **Harsh senior editor** — cuts anything not load-bearing; terse.
- **McCloskey-strict** — economic writing virtues: mechanism first, motivation first, one point per paragraph, no throat-clearing.
- **Generous mentor** — preserves voice; suggests rather than demands; rationale-first.
- **Hostile referee** — adversarial, looking for weakness; asks what could derail this at review.
- **Custom** — free-text personality sketch (e.g. "a tired journal editor who has read 30 of these this week").

Store the chosen label in `state.json#persona`. If Custom, store the user's free text.

### 3. Scope

**Question:** "What text should I iterate on?"

Options:
- Whole file (default — the path passed on invocation)
- Named section (user provides a section heading; loop reads only that subtree)
- Paragraph range (user provides line numbers or the first-sentence of the range)

Store the resolved scope description in `state.json#scope`.

### 4. Max iterations

**Question:** "Max iterations?"

Default **5**. Show the user the default and accept a number. If the user is
uncertain, do not ask further — use the default.

## After collection

1. Echo back the resolved settings as a compact table and ask for confirmation
   (AskUserQuestion, yes/no). Do not skip this — it is the last chance to
   correct a misread of goal or persona.
2. On confirmation, run:
   ```bash
   SOURCE_PATH="<resolved>" GOAL="<goal>" PERSONA="<persona>" SCOPE="<scope>" \
     bash {SKILL_DIR}/scripts/loop.sh init <max>
   ```
3. Proceed to the iteration protocol documented in `SKILL.md`.
