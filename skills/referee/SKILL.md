---
name: referee
description: |
  Generate mock journal referee reports for academic economics papers. Produces senior
  referee report (contribution/novelty), junior referee report (methods/robustness),
  and synthesized editor letter with recommendation.
---

# Referee Skill

Generate mock journal referee reports for academic economics papers, following AER review standards.

## Invocation

### Full Review (Default)

```
/referee paper.pdf              # Full review: senior + junior + editor letter
/referee review paper.pdf       # Same as above
```

### Single Referee

```
/referee senior paper.pdf       # Senior referee only (contribution/novelty)
/referee junior paper.pdf       # Junior referee only (methods/robustness)
```

### With Literature Search

```
/referee paper.pdf              # Literature search runs automatically for senior
```

---

## Available Tasks

| Task | File | Description |
|------|------|-------------|
| `senior` | `prompts/tasks/senior.prompt` | Contribution, novelty, literature positioning |
| `junior` | `prompts/tasks/junior.prompt` | Identification, robustness, credibility |
| `senior_search` | `prompts/tasks/senior_search.prompt` | Literature search via Gemini CLI |
| `synthesis` | `prompts/components/editor_synthesis.prompt` | Combine into editor letter |

---

## Request Mapping

| User Says | Tasks Invoked |
|-----------|---------------|
| "senior referee", "Is this contribution significant?" | senior_search + senior |
| "junior referee", "Do you believe my identification?" | junior |
| "full referee review", "Mock journal review", "both referees" | senior_search + senior + junior + synthesis |
| "desk reject risk?", "Is this AER quality?" | senior_search + senior |

---

## Workflow

Read the orchestration instructions from `@prompts/master.prompt` and follow its 10-step workflow:

1. **PDF Detection** - If input is PDF, extract text via parsepdf
2. **Interpret request** - Determine referee perspective(s) needed
3. **Diagnostic questions** - Determine paper type and scope
4. **Assess paper length** - Check word count, plan reading strategy
5. **Load modules** - Compose prompts with paper type overlay
6. **First-pass read** - Main text only (skip appendices)
7. **Section evaluation** - For long papers (>15k words), dispatch section subagents
8. **Execute review** - Launch referee agents with Extended Thinking
9. **Second-pass read** - Consult appendix only for flagged items
10. **Verify citations** - Run citation verification before delivery

---

## Output Location

All outputs saved to **same directory as input PDF**:

```
/path/to/paper.pdf
/path/to/{short_title}_{YYYYMMDD}_claude_senior_report.tex
/path/to/{short_title}_{YYYYMMDD}_claude_junior_report.tex
/path/to/{short_title}_{YYYYMMDD}_claude_editor_letter.tex
/path/to/Lulu_Wang_Signature.jpg    # Copied for compilation
```

### Short Title Generation

1. Take 2-3 key words from paper title (skip articles: The, A, An)
2. Convert to lowercase, replace spaces with underscores
3. Example: "The Effect of Minimum Wage on Employment" (reviewed 2025-12-31)
   → `minimum_wage_employment_20251231_claude_senior_report.tex`

---

## Paper Types

The skill adapts review focus based on paper type:

| Type | Description | Senior Focus | Junior Focus |
|------|-------------|--------------|--------------|
| **A** | Intuitive topic, complex ID | Novelty in identification | Scrutinize ID relentlessly |
| **B** | Specialized topic needing context | Transcend specific setting | Institutional details affect ID |
| **C** | Methodological innovation | Does method enable new research? | Monte Carlo, finite sample |
| **D** | Theory applied to data | Non-trivial theoretical insight | Parameter identification |

---

## Decision Matrix

| Senior (Contribution) | Junior (Methods) | Recommendation |
|----------------------|------------------|----------------|
| Insufficient | Any | **Reject** |
| Unclear | Any issues | **Reject** |
| Sufficient | Fatally flawed | **Reject** |
| Sufficient | Needs substantial work | **Reject** |
| Sufficient | Credible with minor gaps | **Major Revisions** (rare) |
| Sufficient | Credible | **Minor Revisions** or **Accept** |

**Key principle:** Unless BOTH contribution AND methods are strong, recommend rejection.

---

## Dependencies

- **parsepdf** - PDF text extraction (`../parsepdf/scripts/process_paper.sh`)
- **copyedit** - AI detection post-processing (`../copyedit/prompts/tasks/ai_detection.prompt`)
- **Gemini CLI** - Literature search for senior referee

---

## Post-Processing

After generating reports, automatically:

1. **Citation verification** - Run `scripts/verify_citations.sh`
2. **AI detection** - Screen and fix AI tells via copyedit skill
3. **Copy signature** - Place `Lulu_Wang_Signature.jpg` in output directory

---

## Review Standards

Referee reviews **enforce high standards**:

- Assess whether work meets top journal standards in current form
- Default to rejection when contribution OR methods has serious issues
- Provide clear accept/reject signal, not just improvement suggestions
- Recommendation goes in editor letter; referee report has NO recommendation

**Guiding principle:** When senior OR junior has serious concerns → Default to REJECT.

---

## Examples

### Example 1: Full Review

```
/referee paper.pdf
```

Output:
- `minimum_wage_employment_20260127_claude_senior_report.tex`
- `minimum_wage_employment_20260127_claude_junior_report.tex`
- `minimum_wage_employment_20260127_claude_editor_letter.tex`

### Example 2: Senior Referee Only

```
/referee senior paper.pdf
```

Output: `minimum_wage_employment_20260127_claude_senior_report.tex`

### Example 3: Methods Check

```
/referee junior paper.pdf
```

Output: `minimum_wage_employment_20260127_claude_junior_report.tex`

---

## Task Prompts

Individual task prompts located at:

- `prompts/tasks/senior.prompt` - Senior referee evaluation
- `prompts/tasks/junior.prompt` - Junior referee evaluation
- `prompts/tasks/senior_search.prompt` - Literature search
- `prompts/components/editor_synthesis.prompt` - Editor letter synthesis
- `prompts/components/senior_output.prompt` - Senior report LaTeX template
- `prompts/components/junior_output.prompt` - Junior report LaTeX template
