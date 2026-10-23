
- 2026-09-22: Switching delegate to gpt-6-sol, the API said the slug was "not supported with a ChatGPT account". The real cause was an old Codex CLI (0.154.0); 0.156.0 accepted it. The error text points at the account, not the version.

- 2026-10-05: copyedit `master.prompt` imported `shared/components/diagnostic_workflow.prompt`, which commit f288c18 deleted in Jan 2026. Every run hit a missing-file lookup. Fixed by inlining the three questions. A check for dangling `@IMPORT` paths in install.sh would catch this.
- 2026-10-05: A chained `git add && git commit` exited 1 right after a previous commit, with nothing staged; re-running the same `git add` alone worked. Likely a Dropbox-synced repo racing on `.git/index.lock`.

- 2026-10-16: Probing `agy` for the delegate skill, `agy -p --print-timeout 180s ... "prompt"` failed because `-p` takes the next token as the prompt. Put all flags before `-p "<prompt>"`. Also macOS has no `timeout`; agy has `--print-timeout` instead.
