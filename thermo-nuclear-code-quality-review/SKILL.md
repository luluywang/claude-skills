---
name: thermo-nuclear-code-quality-review
description: Run an extremely strict maintainability review for abstraction quality, giant files, and spaghetti-condition growth. Use for a thermo-nuclear code quality review, thermonuclear review, deep code quality audit, or especially harsh maintainability review.
disable-model-invocation: true
---

# Thermo-Nuclear Code Quality Review

An unusually strict review of implementation quality, maintainability, and abstraction quality. Be **ambitious** about structure: do not stop at local cleanups. Hunt for "code judo" moves, restructurings that keep behavior but make the implementation dramatically simpler, smaller, and more direct. Prefer deleting complexity over rearranging it.

## Baseline prompt

> Perform a deep code quality audit of the current branch's changes.
> Rethink how to structure / implement the changes to meaningfully improve code quality without impacting behavior.
> Work to improve abstractions, modularity, reduce Spaghetti code, improve succinctness and legibility.
> Be ambitious, if there is a clear path to improving the implementation that involves restructuring some of the codebase, go for it.
> Be extremely thorough and rigorous. Measure twice, cut once.

## Workflow (load files only at the step that needs them)

**1. Scope.** Get the diff (`git diff <base>...HEAD`, or what the user names). Read the changed files and their immediate callers. Note any file the diff pushes across 1000 lines.

**2. Review.** Read `references/standards.md` (the 8 rules and the questions to ask of every change) and review against it. Before writing findings, read `references/flags_and_remedies.md` for what to escalate and which fixes to suggest.

**3. Report.** Read `references/output_and_approval.md` for finding order, tone, and the approval bar. Do not read it earlier; it does not affect how you review, only how you report.

## Always-on rules (one line each)

- Ambition: look for a reframing that makes whole branches, helpers, or layers disappear.
- Under-1k-line file crossing 1000 lines: presumptive blocker.
- No ad-hoc conditionals or one-off flags bolted onto unrelated flows.
- Prefer clean design over "it works"; direct and boring beats magic.
- Question casts, `any`, `unknown`, and needless optionality.
- Logic belongs in the canonical layer; reuse existing helpers.
- Flag needless sequential or non-atomic orchestration.
- Few high-conviction findings beat a long list of nits.
