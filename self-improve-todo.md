# Self-Improve To-Do
Generated: 2026-02-27

## copyedit

- [ ] **P1** — Deepen writing quality beyond surface corrections: add argument support, mechanism depth, and contribution precision dimensions to `writing_quality.prompt`; add new `rigor` task prompt; update `review` alias to include `quality` by default *(Medium)*
- [ ] **P4** — Fix reflow script path hardcoding: replace hardcoded username/Dropbox paths in `reflow_sentences.py` with script-relative resolution; add path-validation check that fails loudly *(Low)*
- [ ] **P5** — Add mandatory post-reflow verification: make `reflow_verify.prompt` a required step in master orchestration; add math-environment and LaTeX-command integrity checks *(Low)*
- [ ] **P10** — Prevent orchestrator context bloat during reflow dispatch: update `master.prompt` to pass file paths only, not file contents, to the reflow script *(Low)*

## taskmaster

- [ ] **P2** — Add diagnostic command: create `taskmaster-check.sh` to verify hook installation, check log path, and print recent trigger history; update block message to name failing checklist items *(Low)*
- [ ] **P9** — Add multi-skill integration guidance: document how taskmaster interacts with econ_ra and copyedit completion semantics in SKILL.md *(Low)*

## new: writing_standards

- [ ] **P3** — Create shared writing standards skill: merge copyedit and revisions writing quality rules into a canonical shared reference; update both skills to reference it *(Medium)*

## self-improve

- [ ] **P6** — Fix session routing (grep too loose): tighten `find_skill_sessions.sh` patterns to match actual skill invocations, not just any mention of skill name; add `--validate` flag *(Medium)*
- [ ] **P8** — Add session sampling (`--sample N`): allow re-analysis of historical sessions for under-covered skills; add per-skill coverage % reporting to aggregate *(Medium)*

## cross-cutting

- [ ] **P7** — Add silent-failure guardrails: establish convention for non-zero exit codes + JSON error objects on stderr; implement in copyedit reflow script and taskmaster hook scripts *(Medium)*
