---
name: log_sync
description: |
  Session transcript export and cross-machine log sync. The SessionEnd hook
  copies each transcript to ~/Dropbox/claude-logs/<project>/ automatically.
  The /log_sync command bulk-syncs raw Claude logs via rsync.
  Only activate when user explicitly invokes '/log_sync' or '/log_sync --dry-run'.
---

# Log Sync

## 1. Automatic session export (SessionEnd hook)

Every time a Claude Code session ends, `hooks/session_end.sh` runs automatically:

1. Reads the transcript path and session ID from the hook input
2. Extracts the project name (git root basename, or working directory basename)
3. Copies the transcript to `~/Dropbox/claude-logs/<project>/<host>_<date>_<session>.jsonl`
4. On laptops, pulls any new HPC logs via rsync in the background

### Configuration

Edit `~/.claude/hooks/log_sync.conf` (falls back to `export-session.conf`):

```
HPC_HOST=username@cluster.university.edu
HPC_LOG_DIR=~/claude-logs
HPC_SSH_TIMEOUT=3
```

Set `CLAUDE_LOG_DIR` in the environment to override the destination root.

## 2. Manual bulk sync (`/log_sync`)

Syncs raw Claude Code session logs from the current machine to Dropbox.

### Invocation

```
/log_sync              # Sync logs to Dropbox
/log_sync --dry-run    # Preview what would be synced (no changes made)
```

### How it works

1. **Detect machine** — `scripts/detect_machine.sh` checks hostname for HPC
   patterns (`cluster`, `hpc`, `slurm`, known HPC domains). Sets `LOG_SOURCE_DIR`.
2. **Rsync** — `scripts/sync.sh` rsyncs `LOG_SOURCE_DIR` to
   `~/Dropbox/claude-logs/claude/` with `--archive --compress --update` flags.
3. **Log** — Appends a timestamped entry to `~/Dropbox/claude-logs/sync.log`
   with machine name, source path, and count of files transferred.

### Output

```
[log_sync] Machine: MacBook-Pro (local)
[log_sync] Source:  ~/Library/Application Support/Claude/logs/
[log_sync] Dest:    ~/Dropbox/claude-logs/claude/
[log_sync] Synced:  12 files
[log_sync] Log:     ~/Dropbox/claude-logs/sync.log
```

In dry-run mode, files are listed but nothing is transferred or logged.

## Machine detection logic

| Hostname pattern | Machine type | Log source |
|-----------------|--------------|------------|
| Contains `cluster`, `hpc`, `slurm`, or known HPC domain suffix | HPC cluster | `~/.claude/logs/` |
| Otherwise | Local Mac | `~/Library/Application Support/Claude/logs/` |

To override detection, set `LOG_SOURCE_DIR` in the environment before calling `sync.sh`.

## Getting Started on a New Machine

Run `detect_machine.sh` first — it identifies the machine type and prints the
correct install command:

```bash
bash ~/.claude/skills/log_sync/scripts/detect_machine.sh
```

For detailed step-by-step instructions see
[`docs/install_guide.md`](docs/install_guide.md), which covers:

- **Local Mac** (section 1): `install.sh` + optional HPC pull config
- **HPC cluster** (section 2): rsync skill files over SSH, manual hook registration
- **Manual settings.json** (section 3): step-by-step hook entry when `install.sh` cannot write it

## Installation

```bash
bash <repo>/log_sync/install.sh
```

This copies scripts to `~/.claude/skills/log_sync/` and symlinks the SessionEnd
hook at `~/.claude/hooks/log-sync-session-end.sh`.

## Files

```
log_sync/
├── SKILL.md                    # This document
├── install.sh                  # Installer (copies + symlinks + settings.json)
├── docs/
│   └── install_guide.md        # Cross-machine install guide (Mac, HPC, manual)
├── hooks/
│   └── session_end.sh          # SessionEnd hook (transcript export + HPC pull)
└── scripts/
    ├── detect_machine.sh       # Sets LOG_SOURCE_DIR; prints install command when run directly
    └── sync.sh                 # Rsyncs raw logs, writes sync.log entry
```
