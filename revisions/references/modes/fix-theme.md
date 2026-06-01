# Fix-Theme Mode

`/revisions fix-theme <theme> [instructions...]` is a **standalone mode** for making targeted, cross-cutting edits on a single thematic point across the manuscript and response document. It does not require or trigger the full pipeline.

## When to Use

Use this mode when the user wants to:
- Rewrite how a specific argument is presented everywhere it appears
- Carry a structural improvement through the main text and all referee responses
- Fix terminology consistency across files
- Implement changes recommended by a prior `/revisions grade` report

## Inputs

- `<theme>`: The thematic point to fix (e.g., "substitution assumption")
- `[instructions...]`: User's direction for the edit (e.g., "lead with what the model does, then defend it")

If no config exists, use AskUserQuestion to collect file paths.

## Phase Protocol

When the invocation argument starts with `fix-theme`, the orchestrator MUST:
1. Confirm the theme, instructions, and file paths
2. Check if `current/grade_report.md` exists (from a prior `/revisions grade` on the same theme) — if so, pass it to the subagent
3. **IMMEDIATELY** spawn the fix-theme subagent — do NOT read files yourself

```
Task: [revisions:fix-theme] Fix theme: {theme}
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/fix_theme.prompt for full instructions.
Read revisions/prompts/components/writing_quality.prompt for writing standards.
Read revisions/prompts/components/response_patterns.prompt for response document conventions.
Read revisions/prompts/components/latex_conventions.prompt for LaTeX reference.

Context:
- Theme: {theme}
- User instructions: {instructions}
- Response document: {path}
- Manuscript: {paths}
- Grade report: {path if exists, else "none"}
- Config: current/config.json
```

## After Fix-Theme Returns

1. Read `current/changelog.md` and present the new entries to the user
2. **Do NOT advance `.status`** — fix-theme is standalone
