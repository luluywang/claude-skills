
- 2026-09-22: Switching delegate to gpt-6-sol, the API said the slug was "not supported with a ChatGPT account". The real cause was an old Codex CLI (0.154.0); 0.156.0 accepted it. The error text points at the account, not the version.

- 2026-10-05: copyedit `master.prompt` imported `shared/components/diagnostic_workflow.prompt`, which commit f288c18 deleted in Jan 2026. Every run hit a missing-file lookup. Fixed by inlining the three questions. A check for dangling `@IMPORT` paths in install.sh would catch this.
