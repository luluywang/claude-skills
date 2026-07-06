---
name: log_sync
description: |
  Session transcript export and cross-machine log sync. A jq-free logger runs
  on both the Stop hook (every turn) and SessionEnd, copying each transcript to
  ~/claude-logs/<project>/ continuously — so sessions that are killed rather
  than exited cleanly are still captured.
  The /log_sync command bulk-syncs raw Claude logs via rsync.
  scripts/archive_logs.py compacts the log corpus (zstd archive plus a
  readable .condensed.md digest per session).
  Only activate when user explicitly invokes '/log_sync' or '/log_sync --dry-run'.
---

# Log Sync

## 1. Automatic session export (continuous)

`hooks/session_log.sh` is wired to **two** hooks in `settings.json`:

- **`Stop`** — fires at the end of every assistant turn, so logging is
  continuous. If a session is later *killed* (e.g. a `/remote-control` bridge
  whose login-node connection drops), its transcript is already captured up to
  the last completed turn instead of being lost.
- **`SessionEnd`** — fires on graceful exit as a final snapshot.

Each run:

1. Reads `transcript_path`, `session_id`, and `cwd` from the hook input using
   **pure bash — no `jq`**. (On the HPC `jq` is module-only and absent from the
   default PATH; the old jq-based hook silently logged nothing whenever it
   wasn't loaded.)
2. Derives the project name (git root basename → cwd basename → encoded-dir tail).
3. Copies the transcript to `<dest>/<project>/<host>_<session>.jsonl`.

The filename is **keyed on the session id** (no copy-time in the name), so the
repeated Stop writes overwrite the same file in place rather than piling up one
duplicate per turn.

### Configuration

Destination root resolution: `CLAUDE_LOG_DIR` (if set) → `~/Library/CloudStorage/Dropbox/claude-logs`
(if Dropbox exists) → `~/claude-logs`. Config is read from
`~/.claude/hooks/log_sync.conf` (falls back to `export-session.conf`):

```
CLAUDE_LOG_DIR=/path/to/logs   # override destination root
```

`hooks/session_end.sh` remains as a deprecated shim that delegates to
`session_log.sh`, so any lingering reference keeps working. The old hook's
laptop-side background HPC pull (`HPC_HOST`/`HPC_LOG_DIR`/`HPC_SSH_TIMEOUT`)
was dropped with it — use `/log_sync` for cross-machine sync.

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
├── install.sh                  # Installer (copies + symlinks + wires Stop & SessionEnd)
├── references/
│   └── setup.md                # Cross-machine setup guide (Mac, HPC, manual)
├── hooks/
│   ├── session_log.sh          # Active jq-free logger (wired to Stop + SessionEnd)
│   └── session_end.sh          # Deprecated shim -> delegates to session_log.sh
└── scripts/
    ├── detect_machine.sh       # Sets LOG_SOURCE_DIR; prints install command when run directly
    ├── sync.sh                 # Rsyncs raw logs, writes sync.log entry
    ├── condense_log.py         # One transcript -> readable .condensed.md
    └── archive_logs.py         # Walk log tree: condense + zstd-archive + verify
```
