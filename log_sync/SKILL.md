---
name: log_sync
description: Back up Claude Code session transcripts to Dropbox, including historical sessions, subagent logs, and HPC sessions, and archive them losslessly. Activate when explicitly asked to run /log_sync or repair transcript backups.
---

# Log Sync

Run `bash ~/.claude/skills/log_sync/scripts/sync.sh` for `/log_sync`.
For `/log_sync --dry-run`, add `--dry-run`; it writes nothing.
Report the actual counts and destination, and surface any errors.

Everything is `scripts/logsync.py`: three steps composed by `run`.

| Step | What it does |
|---|---|
| `collect` | Copies changed files from `~/.claude` (projects incl. subagents and tool results, delegate-runs, logs, debug, other JSONL history; not skills, plugins, settings or credentials) into this host's entries. Unchanged files are skipped by size+mtime (copies carry the source mtime, archives too), changed ones are hash-verified and atomically published. |
| `pull` | `rsync` of `PULL_FROM`'s store into this one. No-op where unset. |
| `archive` | Compresses this host's transcripts idle for 3+ days to `.jsonl.zst` (hash-verified before the original goes) and writes a `.condensed.md` digest. Resolves a `.jsonl` beside its `.zst`: deletes it if the archive already contains it, re-archives if it extends the archive (a resumed session), reports a CONFLICT and keeps both if the contents diverge. |

Hooks (one script, `hooks/session_log.sh`, registered by `install.sh`):
Stop and SessionEnd collect the current session; SessionStart starts `run` in
the background at most every `RUN_INTERVAL_HOURS` (default 6). Hooks rather than
launchd/cron: macOS blocks background jobs from writing to `~/Library/CloudStorage`.
Background runs log to `~/.claude/log_sync_state/run.log`.

## Store layout

The same on every machine (Dropbox `claude-logs` on the Macs, `~/claude-logs`
on Quest):

```
<project>/<host>_<session>.jsonl         live transcript
<project>/<host>_<session>.jsonl.zst     same, once idle
<project>/<host>_<session>.condensed.md  readable digest (truncated; not the full record)
<project>/<host>_<session>/...           subagents, tool results
_machine/<host>/...                      everything else from ~/.claude, paths preserved
```

`<project>` is the basename of the cwd the session started in. Each host owns
the entries carrying its name: only the owner collects and compresses them,
other stores mirror them through `pull`. Quest's login nodes share one home, so
they use one name, `quest` (`LOG_HOST`).

Machines: the Macs pull Quest (`PULL_FROM`); Quest compresses its own entries,
so the Macs download them already archived. Setup: [setup](references/setup.md).

## Manual use

```
python3 scripts/logsync.py run|collect|pull|archive [--dry-run]
python3 scripts/logsync.py archive --min-age-days 0 --all-hosts   # force everything
python3 scripts/condense_log.py <file.jsonl[.zst]>                # digest one file
zstd -dc --long=31 file.jsonl.zst | less                          # read an archive
```

`archive` keeps `self-improve-cache/manifest.json` keyed by current paths.
`scripts/archive_logs.py` is a shim for self-improve's `compress_logs.py`.
`logsync.py migrate --host-map old=new,...` folded the pre-2026-10 layouts
(`raw/`, `hpc/`, timestamped names, per-turn-cwd duplicates) into this one;
it is idempotent and keeps the longest copy of each file.
