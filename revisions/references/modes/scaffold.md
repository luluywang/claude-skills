# Scaffold Mode

`/revisions scaffold [editor_letter] [ref1] [ref2] ...` is a **standalone mode** for building a response document scaffold from raw referee/editor report files. It runs before any response document exists — once the user fills in replies, they run `/revisions` normally.

## When to Use

Use this mode at the start of a new revision round, when the user has raw referee/editor letters but no response document yet. The output is `current/response_scaffold.tex`, which the user fills in and then passes to `/revisions` as the response document.

## Inputs

- `[editor_letter]`: Path to the editor letter file (plain text or .tex). Optional — pass `none` or omit to skip.
- `[ref1]`, `[ref2]`, ...: Paths to referee report files in order.

If file paths are not provided as CLI arguments, use AskUserQuestion to collect them:
1. Ask which file is the editor letter (if any)
2. Ask for referee report files one by one (ref1, ref2, ...)

## Phase Protocol

When the invocation argument is `scaffold`, the orchestrator MUST:
1. Confirm input paths (from CLI args or via AskUserQuestion)
2. **IMMEDIATELY** spawn the scaffold subagent — do NOT read the report files yourself
3. After the subagent returns, present the output path and remind the user to fill in replies

```
Task: [revisions:scaffold] Build response document scaffold from raw reports
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/scaffold_response.prompt for full instructions.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.

Context:
- Editor letter: {path or "none"}
- Referee reports: {ref1: path, ref2: path, ...}
```

## After Subagent Returns

1. Output summary: "Scaffold written to `current/response_scaffold.tex` — N total comments (editor: X, ref1: Y, ref2: Z)"
2. Remind user: "Fill in the `\textbf{Reply:}` placeholders, then run `/revisions` with `current/response_scaffold.tex` as the response document."
3. **Do NOT advance `.status`** — workflow stays at `init` so the user can run `/revisions` normally after filling in replies.
