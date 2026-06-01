# Interview Phase — Full Reference

The interview phase runs an iterative loop until the user explicitly chooses "Move to planning".

## Loop pseudocode

```
WHILE user has not selected "Move to planning":
    1. Spawn interview_generate subagent (generates clarifying questions)
       - Pass user's original request as context
       - Subagent reads files, explores codebase, generates questions
    2. Present questions to user via AskUserQuestion
    3. Spawn interview_process subagent (updates full_spec.md)
    4. Present spec summary to user
    5. Ask user what they want to do (AskUserQuestion)
       - IF "Move to planning" → update status, exit loop
       - IF "Continue interview" → loop again with more questions
       - IF "Show full spec" → display full_spec.md, loop again
```

**CRITICAL:** Your FIRST action in interview phase MUST be spawning `interview_generate`. Do NOT read user project files (referee.tex, draft.tex, data files), do NOT start analyzing the user's request yourself, do NOT spawn generic Task agents to "explore" or "create tables". The interview_generate subagent handles all codebase exploration. Pass the user's request to it as context.

## Step 1: Spawn interview_generate subagent

```
Task: [econ_ra:interview:generate] Explore codebase and generate questions (round N)
model: "sonnet"
subagent_type: "Explore"

Instructions:
Read prompts/interview_generate.md for full instructions.

Context:
- User's project spec: [paste spec content here, or reference current/spec.md]
- Preferences file: references/preferences.md
- Interview round: [N]
- Prior clarifications: [if round > 1, paste current full_spec.md content]
- Prior Q&A: [if round > 1, paste questions and answers from previous rounds]

Your job:
1. IF round 1: Explore the codebase (directory structure, scripts, data files)
   ELSE: Skip exploration, use prior codebase_summary
2. Analyze spec for ambiguities NOT yet resolved by prior clarifications
3. Generate 3-7 targeted questions (fewer in later rounds, more specific)
4. Return codebase summary (round 1 only) + questions

Return format: Codebase summary + structured questions ready to present to user.
```

## Step 2: Present questions to user using AskUserQuestion

Display the codebase summary (first round), then use the **AskUserQuestion tool** to present questions interactively.

## Step 3: Spawn interview_process subagent (Haiku)

```
Task: [econ_ra:interview:process] Process user answers (round N)
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read prompts/interview_process.md for full instructions.

Context:
- Original spec: [content]
- Codebase summary: [from generate step or prior round]
- Questions asked: [from generate step]
- User answers: [collected responses]
- Prior full spec: [if round > 1, paste existing full_spec.md]
- Interview round: [N]

Your job:
1. Parse user answers
2. Merge with prior full spec (if any)
3. Identify remaining ambiguities that could affect implementation
4. Write/update current/full_spec.md
5. Write current/codebase_summary.md (round 1 only)
6. Copy spec to current/spec.md (round 1 only)
7. Return: { status, ambiguities: [...], preferences: [...], spec_summary: "..." }

Note: Do NOT commit internal workflow files (they are in .claude/ which is typically gitignored).
Note: Do NOT update status to "planning" - the orchestrator handles this after user confirmation.
```

## Step 4: Ask User Before Proceeding

After interview_process returns the spec summary, use AskUserQuestion:

```json
{
  "header": "Spec review",
  "question": "I've updated the project specification based on your answers. What would you like to do?",
  "multiSelect": false,
  "options": [
    {"label": "Move to planning (Recommended)", "description": "Spec is complete - generate the task list"},
    {"label": "Continue interview", "description": "Ask more clarifying questions about the project"},
    {"label": "Show full spec", "description": "Display the full specification for review"}
  ]
}
```

**If user selects "Move to planning":**
1. Update status: `echo "planning" > current/.status`
2. Proceed to Planning Phase

**If user selects "Continue interview":**
1. Loop back to Step 1 with round N+1

**If user selects "Show full spec":**
1. Read and display `current/full_spec.md`
2. Ask the same question again

## Key files created by Interview phase
- `spec.md` - Original user spec (preserved unchanged)
- `full_spec.md` - Consolidated specification with all clarifications, concerns, tradeoffs
- `codebase_summary.md` - Directory structure, scripts, data files
