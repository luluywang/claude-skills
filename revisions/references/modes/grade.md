# Grade Mode

`/revisions grade <theme> [files...]` is a **standalone mode** for grading the quality and consistency of all referee responses on a single thematic point. It does not require a prior full `/revisions` run — it works with just a response document and manuscript.

## When to Use

Use this mode when the user wants to:
- Assess how well they address a specific concern across all referee responses
- Find contradictions between responses on the same point
- Identify the strongest articulation of an argument to use as a model
- Get letter grades (A-F) on clarity, precision, persuasiveness, consistency, and writing quality

## Inputs

- `<theme>`: The thematic point to grade (e.g., "substitution assumption", "welfare decomposition")
- `[files...]`: Optional explicit file paths. If omitted, uses `current/config.json` paths.

If no config exists and no files are provided, use AskUserQuestion to collect:
1. Response document path
2. Manuscript path(s)

## Phase Protocol

When the invocation argument starts with `grade`, the orchestrator MUST:
1. Confirm the theme and file paths
2. Write or update `current/config.json` if needed
3. **IMMEDIATELY** spawn the grade subagent — do NOT read the response doc or manuscript yourself

```
Task: [revisions:grade] Grade responses on theme: {theme}
model: "opus"
subagent_type: "general-purpose"

Instructions:
Read revisions/prompts/grade_responses.prompt for full instructions.
Read revisions/prompts/components/writing_quality.prompt for writing standards.

Context:
- Theme: {theme}
- Response document: {path}
- Manuscript: {paths}
- Soul documents: {paths if available, else "none"}
```

## After Grade Returns

1. Read `current/grade_report.md` and present to the user
2. Suggest: "Run `/revisions fix-theme {theme}` to implement the recommended changes."
3. **Do NOT advance `.status`** — grading is standalone
