---
name: exam_builder
description: |
  Finance/economics exam creation and editing workflow. Checks calculator-solvability,
  hint density, topic coverage, and answer-key consistency for LaTeX exams.
  Only activate when user explicitly invokes '/exam_builder'.
  Do NOT activate for general questions about finance or exam content.
---

# Exam Builder Workflow Orchestrator

This orchestrator manages three focused, single-pass modes for iterative exam editing. Each mode spawns one subagent to perform a specific audit or refinement task and returns a structured report.

## Invocation

```
/exam_builder review @exam.tex @topics.md           # Coverage + solvability check
/exam_builder review @exam.tex                      # Review without topics file (coverage skipped)
/exam_builder refine @exam.tex "simplify hints"     # Targeted refinement pass
/exam_builder refine @exam.tex "tighten numbers"    # Any targeted instruction
/exam_builder consistency @exam.tex @answer_key.tex # Q/A alignment verification
```

### Argument parsing

| Argument | Description |
|----------|-------------|
| `@exam.tex` | Path to the exam LaTeX source (required for all modes) |
| `@topics.md` | Topics list for coverage check (review mode only; optional) |
| `"..."` | Refinement instruction string (refine mode only; required) |
| `@answer_key.tex` | Answer key LaTeX source (consistency mode only; required) |

## How It Works

The orchestrator:
1. Parses the command to identify mode and file arguments
2. Reads the referenced files directly (they are small and fit in context)
3. Spawns one subagent with the appropriate prompt and file contents
4. Returns the subagent's report to the user

The orchestrator does NOT edit exam files directly. All analysis and edits are performed by the subagent.

### Mode: review

Spawns a **review subagent** that audits the exam on three dimensions:
- **Calculator-solvability**: Every numerical problem must be solvable with a standard financial calculator (TVM keys, NPV/IRR, Black-Scholes inputs). The subagent works through each problem's arithmetic step by step.
- **Hint density**: Hints should be calibrated to exam difficulty. Too many hints reduce rigor; too few leave students without productive guidance.
- **Topic coverage**: If `@topics.md` is provided, every listed topic must appear in at least one question. Missing topics and over-represented topics are flagged.

Output: a structured review report (written inline, not to disk) listing findings by problem number.

### Mode: refine

Spawns a **refine subagent** that applies a single targeted refinement instruction to the exam. The instruction string (e.g., `"simplify hints"`, `"tighten numbers"`, `"clarify Part (b) of Question 3"`) scopes the subagent's work. The subagent:
- Makes only changes consistent with the instruction
- Does not alter exam structure (number of questions, point allocations, overall difficulty ordering)
- Returns the full revised LaTeX source plus a diff summary

Output: revised LaTeX source block and a bullet-point change log.

### Mode: consistency

Spawns a **consistency subagent** that cross-checks every question in `@exam.tex` against `@answer_key.tex`. For each question:
- Verifies a matching answer entry exists
- Confirms the answer uses correct methodology (e.g., discounting formula, put-call parity, correct IRR convention)
- Flags numerical mismatches between question parameters and answer computation
- Flags missing answers

Output: a consistency report listing PASS / FAIL / WARNING per question.

## Progress Output

At each step, output a brief status line before spawning the subagent:

```
--- [exam_builder:review] Reading exam.tex and topics.md...
--- [exam_builder:review] Spawning review subagent...
--- [exam_builder:review] Done: N issues found
```

## Orchestrator Rules

The orchestrator coordinates — it does NOT perform the analysis itself.

### The orchestrator CAN:
- Read exam files and answer-key files to pass as context
- Read prompt files from `prompts/`
- Parse invocation arguments
- Spawn subagents with file contents embedded in context
- Present the subagent's report to the user

### The orchestrator MUST NOT:
- Attempt to solve exam problems itself
- Edit LaTeX source directly
- Render opinions on exam quality before the subagent runs
- Skip spawning the subagent even if the exam looks simple

## Spawning Subagents

### review subagent

```
Task: [exam_builder:review] Audit exam for solvability, hints, and coverage
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read prompts/review.prompt for full instructions.

Context:
- Exam source: [full contents of exam.tex]
- Topics list: [full contents of topics.md, or "NOT PROVIDED" if omitted]

Your job: run the three-part audit and return a structured report.
```

### refine subagent

```
Task: [exam_builder:refine] Apply targeted refinement to exam
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read prompts/refine.prompt for full instructions.

Context:
- Exam source: [full contents of exam.tex]
- Refinement instruction: "[the instruction string from the user]"

Your job: apply only the requested refinement, return revised LaTeX + change log.
```

### consistency subagent

```
Task: [exam_builder:consistency] Verify answer key matches exam questions
model: "sonnet"
subagent_type: "general-purpose"

Instructions:
Read prompts/consistency.prompt for full instructions.

Context:
- Exam source: [full contents of exam.tex]
- Answer key source: [full contents of answer_key.tex]

Your job: check every question against its answer and return a consistency report.
```

## Output

Each mode produces output written directly to the conversation (not to disk unless the user asks):

| Mode | Output |
|------|--------|
| `review` | Structured audit report: solvability, hint density, coverage — one section per dimension |
| `refine` | Revised LaTeX source in a code block + bullet-point change log |
| `consistency` | Per-question verdict table (PASS / FAIL / WARNING) + summary |

If the subagent cannot complete a check (e.g., a problem is ambiguous), it flags it as WARNING with an explanation rather than skipping it silently.
