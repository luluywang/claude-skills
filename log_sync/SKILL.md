---
name: log_sync
description: |
  Session transcript export and cross-machine log sync. The SessionEnd hook
  copies each transcript to ~/Dropbox/claude-logs/<project>/ automatically.
  The /log_sync command bulk-syncs raw Claude logs via rsync.
  scripts/archive_logs.py compacts the log corpus (zstd archive plus a
  readable .condensed.md digest per session).
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

## 3. Two-tier log archival (`scripts/archive_logs.py`)

Keeps the log corpus small while preserving both the full record and a
readable digest. For every `<name>.jsonl` (or legacy `.jsonl.gz`) under
`~/Dropbox/claude-logs/`:

- **Condensed tier** — `<name>.condensed.md`, plain markdown readable without
  decompression. Keeps user messages, assistant text and thinking, tool calls,
  and truncated tool results; drops file snapshots, base64 images, signatures,
  and UI bookkeeping rows. Typically ~1–5% of the raw size.
- **Archive tier** — `<name>.jsonl.zst` via `zstd -19 --long=27` (about 2×
  smaller than gzip on transcripts). The round-trip is hash-verified before
  the original is deleted. Legacy `.gz` files are transcoded to `.zst`.

Idempotent (filesystem state is the manifest) and safe to re-run any time:

```
python3 scripts/archive_logs.py                # archive everything
python3 scripts/archive_logs.py --dry-run      # list what would change
python3 scripts/archive_logs.py --limit 50     # batch test
python3 scripts/condense_log.py <file.jsonl[.gz|.zst]>   # condense one file
```

It also migrates key names in `self-improve-cache/manifest.json` so the
self-improve scan cache survives the rename. To read an archive:
`zstd -dc --long=31 file.jsonl.zst | less`. The self-improve scripts read
`.jsonl.zst` natively; its old `compress_logs.py` is a shim that delegates here.

## Machine detection logic

| Hostname pattern | Machine type | Log source |
|-----------------|--------------|------------|
| Contains `cluster`, `hpc`, `slurm`, or known HPC domain suffix | HPC cluster | `~/.claude/logs/` |
| Otherwise | Local Mac | `~/Library/Application Support/Claude/logs/` |

To override detection, set `LOG_SOURCE_DIR` in the environment before calling `sync.sh`.

For first-time setup on a new machine, see [`references/setup.md`](references/setup.md).

## Files

```
log_sync/
├── SKILL.md                    # This document
├── install.sh                  # Installer (copies + symlinks + settings.json)
├── references/
│   └── setup.md                # Cross-machine setup guide (Mac, HPC, manual)
├── hooks/
│   └── session_end.sh          # SessionEnd hook (transcript export + HPC pull)
└── scripts/
    ├── detect_machine.sh       # Sets LOG_SOURCE_DIR; prints install command when run directly
    ├── sync.sh                 # Rsyncs raw logs, writes sync.log entry
    ├── condense_log.py         # One transcript -> readable .condensed.md
    └── archive_logs.py         # Walk log tree: condense + zstd-archive + verify
```
