# Setup

Requires Python 3.9+, Bash, `zstd` and `rsync`. No jq required.

Run `bash /path/to/log_sync/install.sh` on each machine. It copies the skill to
`~/.claude/skills/log_sync/`, links `~/.claude/hooks/log-sync-session-log.sh`,
and registers it for Stop, SessionEnd and SessionStart in
`~/.claude/settings.json` (backed up as `settings.json.log-sync-backup`).
Running sessions pick up code changes at once; new hook registrations apply to
sessions started afterwards.

Per-machine settings go in `~/.claude/hooks/log_sync.conf` (`KEY=VALUE`;
environment variables override):

| Key | Default | Use |
|---|---|---|
| `CLAUDE_LOG_DIR` | Dropbox `claude-logs`, else `~/claude-logs` | the store |
| `LOG_HOST` | short hostname | name on this host's entries; set it where nodes share a home |
| `PULL_FROM` | unset | another store to mirror, `user@host:path` |
| `RUN_INTERVAL_HOURS` | 6 | SessionStart throttle |

Current machines:

```bash
# Macs: ~/.claude/hooks/log_sync.conf
PULL_FROM=kdb5009@klc0401.quest.northwestern.edu:claude-logs

# Quest: ~/.claude/hooks/log_sync.conf
LOG_HOST=quest
CLAUDE_LOG_DIR=~/claude-logs
```

A pulling machine needs non-interactive SSH (`ssh -o BatchMode=yes <host>` must
work). To update Quest after editing the skill:

```bash
rsync -az --delete --exclude=__pycache__ ~/.claude/skills/log_sync/ \
  kdb5009@klc0401.quest.northwestern.edu:.claude/skills/log_sync/
```

If backups fail, check `~/.claude/log_sync_state/run.log`, hook stderr, and
`bash ~/.claude/skills/log_sync/scripts/sync.sh --dry-run`. Commands exit
nonzero on errors or conflicts.
