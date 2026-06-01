---
name: writing_standards
description: |
  Shared writing quality reference for economics academic writing. Contains the
  canonical standards used by both the copyedit and revisions skills. Not invoked
  directly — referenced by other skills via their prompts.
---

# Writing Standards Reference

Canonical source of truth for economics writing quality standards. This skill is a
**reference library**, not an orchestrator. Skills read these files; they do not invoke
this skill directly.

## Purpose

The copyedit and revisions skills both assess and enforce writing quality. This shared
directory prevents standard drift: when a rule improves, update it here once and both
skills benefit automatically.

## Contents

| File | Purpose | Used by |
|------|---------|---------|
| `economics_writing.md` | 14 prose principles + 9 LLM-vs-Human contrasts | copyedit (quality task), revisions (fixer, critic) |
| `ai_detection_rules.md` | Concrete anti-patterns: meta-commentary, transitions, hedging, template structures | copyedit (ai_detection task), revisions (fixer) |
| `vocabulary_ban_list.md` | Banned AI vocabulary + verbose economics phrases + forbidden constructions | copyedit (ai_detection, word_choice tasks), revisions (fixer, critic) |

## How to Reference These Files

Skills load whichever files are relevant to their task:

```
# In a subagent prompt:
Read writing_standards/economics_writing.md for the 14 prose principles and LLM contrast patterns.
Read writing_standards/ai_detection_rules.md for concrete anti-patterns to flag and fix.
Read writing_standards/vocabulary_ban_list.md for the full banned word and phrase lists.
```

## Maintenance

When writing quality standards evolve:
1. Update the relevant file here
2. Both copyedit and revisions automatically inherit the change
3. Do NOT maintain parallel copies in either skill's `references/` or `prompts/components/`
