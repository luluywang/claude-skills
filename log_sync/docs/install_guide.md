# log_sync Install Guide

Cross-machine installation reference for the log_sync skill (SessionEnd hook + bulk sync).

---

## Quick start

Run `scripts/detect_machine.sh` to identify which setup applies to the current machine:

```bash
bash ~/.claude/skills/log_sync/scripts/detect_machine.sh
```

It will print the recommended install command for the detected machine type.

---

## 1. Local Mac setup

### Prerequisites
- Claude Code installed (provides `~/.claude/`)
- Dropbox syncing to `~/Library/CloudStorage/Dropbox/` or `~/Dropbox/`
- `jq` available (`brew install jq`)

### Steps

1. **Clone or copy the skill files** to `~/.claude/skills/log_sync/`:

   ```bash
   # If installing from the project repo:
   bash /path/to/repo/log_sync/install.sh
   ```

   `install.sh` will:
   - Copy all skill files to `~/.claude/skills/log_sync/`
   - Symlink the SessionEnd hook at `~/.claude/hooks/log-sync-session-end.sh`
   - Register the hook in `~/.claude/settings.json` automatically

2. **Verify the hook is registered** in `~/.claude/settings.json`:

   ```json
   {
     "hooks": {
       "SessionEnd": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "~/.claude/hooks/log-sync-session-end.sh",
               "timeout": 30
             }
           ]
         }
       ]
     }
   }
   ```

3. **(Optional) Configure HPC pull** — create `~/.claude/hooks/log_sync.conf`:

   ```bash
   HPC_HOST=username@cluster.university.edu
   HPC_LOG_DIR=~/claude-logs
   HPC_SSH_TIMEOUT=3
   ```

   When this is set, the hook will rsync HPC logs to Dropbox after each session.

4. **Test** by ending a Claude Code session. Check that a `.jsonl` file appears in
   `~/Dropbox/claude-logs/<project>/`.

---

## 2. HPC cluster setup

On HPC clusters, Dropbox is not available. Transcripts are written to a local directory
(`~/claude-logs/`) and can be pulled to a laptop later via rsync.

### Prerequisites
- Claude Code installed on the cluster (or access via SSH)
- SSH key-based authentication from your laptop (for the laptop-pull workflow)
- `rsync` available on the cluster (standard on most HPC systems)
- `jq` available (`module load jq` or install to `~/.local/bin/`)

### Steps

1. **Copy the skill files** to the cluster. From your laptop:

   ```bash
   rsync -az ~/.claude/skills/log_sync/ username@cluster.edu:~/.claude/skills/log_sync/
   ```

2. **Run the installer on the cluster**:

   ```bash
   ssh username@cluster.edu
   bash ~/.claude/skills/log_sync/install.sh
   ```

   Because Dropbox is absent, the hook will fall back to writing transcripts to
   `~/claude-logs/<project>/` on the cluster's home filesystem.

3. **Register the hook in settings.json manually** if `python3` is unavailable on
   the login node. Add this block to `~/.claude/settings.json`:

   ```json
   {
     "hooks": {
       "SessionEnd": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "~/.claude/hooks/log-sync-session-end.sh",
               "timeout": 30
             }
           ]
         }
       ]
     }
   }
   ```

4. **Pull logs to your laptop** — from the laptop, run `/log_sync` inside Claude Code,
   or run directly:

   ```bash
   LOG_SOURCE_DIR=username@cluster.edu:~/claude-logs/ \
     bash ~/.claude/skills/log_sync/scripts/sync.sh
   ```

   Alternatively, configure `HPC_HOST` in `~/.claude/hooks/log_sync.conf` on your laptop
   and let the SessionEnd hook pull automatically after each local session.

---

## 3. Hook registration in settings.json — step by step

If `install.sh` cannot update `settings.json` (e.g., `python3` is absent), register the
hook manually:

1. Open `~/.claude/settings.json` in any editor (create it if it does not exist).

2. Ensure the file contains valid JSON. The minimal skeleton is:

   ```json
   {}
   ```

3. Add (or merge) the `hooks` section:

   ```json
   {
     "hooks": {
       "SessionEnd": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "~/.claude/hooks/log-sync-session-end.sh",
               "timeout": 30
             }
           ]
         }
       ]
     }
   }
   ```

4. Verify the symlink exists:

   ```bash
   ls -la ~/.claude/hooks/log-sync-session-end.sh
   # Should point to ~/.claude/skills/log_sync/hooks/session_end.sh
   ```

   If missing, create it:

   ```bash
   ln -sf ~/.claude/skills/log_sync/hooks/session_end.sh \
          ~/.claude/hooks/log-sync-session-end.sh
   chmod +x ~/.claude/hooks/log-sync-session-end.sh
   ```

5. Restart Claude Code. The hook runs automatically on session end.

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---------|-------------|-----|
| No files appear in `claude-logs/` after session | Hook not registered in `settings.json` | Re-run `install.sh` or add entry manually (see section 3) |
| `jq: command not found` in hook output | `jq` not on PATH | `brew install jq` (Mac) or `module load jq` (HPC) |
| HPC pull never runs | `HPC_HOST` not set or SSH key missing | Set `HPC_HOST` in `log_sync.conf`; ensure `ssh $HPC_HOST true` succeeds without password |
| `rsync: source directory does not exist` | Wrong `LOG_SOURCE_DIR` | Run `detect_machine.sh` to confirm the detected path; override with `LOG_SOURCE_DIR=...` |
| Hook times out (>30 s) | Slow HPC rsync on laptop's SessionEnd | HPC pull runs in background — timeout only affects transcript copy. Increase `timeout` in `settings.json` if the copy itself is slow. |
