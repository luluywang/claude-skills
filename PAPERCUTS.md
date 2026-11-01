
- 2026-09-22: Switching delegate to gpt-6-sol, the API said the slug was "not supported with a ChatGPT account". The real cause was an old Codex CLI (0.154.0); 0.156.0 accepted it. The error text points at the account, not the version.

- 2026-10-05: copyedit `master.prompt` imported `shared/components/diagnostic_workflow.prompt`, which commit f288c18 deleted in Jan 2026. Every run hit a missing-file lookup. Fixed by inlining the three questions. A check for dangling `@IMPORT` paths in install.sh would catch this.
- 2026-10-05: A chained `git add && git commit` exited 1 right after a previous commit, with nothing staged; re-running the same `git add` alone worked. Likely a Dropbox-synced repo racing on `.git/index.lock`.

- 2026-10-16: Probing `agy` for the delegate skill, `agy -p --print-timeout 180s ... "prompt"` failed because `-p` takes the next token as the prompt. Put all flags before `-p "<prompt>"`. Also macOS has no `timeout`; agy has `--print-timeout` instead.

- 2026-10-24: log_sync's first Mac pull from Quest hung for 15 h. The network dropped mid-rsync, and rsync had no `--timeout`. Fixed: `--timeout=300` plus ssh `ServerAliveInterval=30`. The same check showed 627 per-destination `.lock` files piling up in `~/.claude/log_sync_state`; they are now one `copy.lock`. Also, a `pgrep -f "logsync.py run"` wait loop matched its own command line, so it never ended.

- 2026-10-29: While changing the semicolon rule, I edited the installed copy (~/.claude/skills/copyedit) instead of the source (~/Dropbox/Claude/copyedit). The two copies drifted until I ported the edit and re-ran install_skill.sh. Edit the source, then install.

- 2026-10-29: Fetching an x.com tweet/article with WebFetch returned HTTP 402. `curl https://api.fxtwitter.com/<user>/status/<id>` returned the full text, including X Articles under `tweet.article.content.blocks`.

- 2026-11-01: To read a public Google Drive folder without the Drive connector, `curl https://drive.google.com/embeddedfolderview?id=<folder_id>` lists the entries, and `uc?export=download&id=<file_id>` fetches text files. A `.py` file returned Drive's "can't scan for viruses" HTML page instead of the file; it needs `drive.usercontent.google.com/download?id=<id>&export=download&confirm=t`.

- 2026-11-01: While installing the no-compaction mod, `claude` was not found in the agent's Bash shell; the binary is at `~/.local/bin/claude`, which is not on that shell's PATH. Also, `install.sh` only accepted folders with `SKILL.md`, so mods (`.claude-plugin/plugin.json`) needed a script change.

- 2026-11-01: A Bash call began with a stray `cat > file` that had no heredoc, so it waited on stdin until the 120 s timeout and blocked the rest of the command. Check that every `cat >` in a compound command has its own input.
