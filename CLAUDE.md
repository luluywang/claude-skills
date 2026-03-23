# Claude Projects

## Logs

Session logs are stored in `claude-logs/` (symlink to `~/Dropbox/claude-logs`). Projects should check this directory for logs from previous sessions.

## HPC (Kellogg)

- Host: `kdb5009@klc0401.quest.northwestern.edu`
- Skills and hooks are installed at `~/.claude/skills/` and `~/.claude/hooks/` on the HPC, mirroring the local setup.
- To update skills on the HPC, rsync from this machine:
  ```bash
  # Single skill
  rsync -az ~/.claude/skills/<skill_name>/ kdb5009@klc0401.quest.northwestern.edu:~/.claude/skills/<skill_name>/
  # All skills
  rsync -az ~/.claude/skills/ kdb5009@klc0401.quest.northwestern.edu:~/.claude/skills/
  ```
- Hooks are symlinked into skill directories, so updating the skill files updates hooks automatically.
