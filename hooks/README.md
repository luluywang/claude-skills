# Claude Code Hooks

Two hooks run on every Claude Code session. Both require one-time setup per machine.

## Hooks at a glance

| Hook | Event | Script | What it does |
|------|-------|--------|--------------|
| Session logger | `SessionEnd` | `~/.claude/hooks/log-sync-session-end.sh` | Copies transcript to Dropbox; auto-pulls HPC logs via rsync |
| Taskmaster | `Stop` | `~/.claude/hooks/taskmaster-check-completion.sh` | Blocks session end until Claude emits `TASKMASTER_DONE::<session_id>` |

Both are wired into `~/.claude/settings.json`. The settings file lives in Dropbox and is symlinked on each laptop, so adding a new hook there propagates everywhere automatically.

---

## New laptop setup

Run all three installers once. Order doesn't matter.

### 1. Settings + conf (Dropbox bootstrap)

```bash
bash ~/Library/CloudStorage/Dropbox/claude-logs/setup.sh
```

This symlinks two files into `~/.claude/`:
- `settings.json` → `Dropbox/claude-logs/config/settings.json`
- `hooks/log_sync.conf` → `Dropbox/claude-logs/config/hooks/log_sync.conf`

Because `settings.json` is shared via Dropbox, the `Stop` hook for taskmaster is already registered after this step — but the hook scripts themselves still need to be installed (steps 2–3).

### 2. Session logger (log_sync)

```bash
bash ~/Library/CloudStorage/Dropbox/Documents/Economics/Projects/Claude/log_sync/install.sh
```

This copies scripts to `~/.claude/skills/log_sync/` and symlinks:
- `~/.claude/hooks/log-sync-session-end.sh`

### 3. Taskmaster

```bash
bash ~/Library/CloudStorage/Dropbox/Documents/Economics/Projects/Claude/taskmaster/install.sh
```

This copies scripts to `~/.claude/skills/taskmaster/` and symlinks:
- `~/.claude/hooks/taskmaster-check-completion.sh`
- `~/.claude/hooks/taskmaster-compliance-prompt.sh`

### Verify

```bash
# Hook files should exist and be executable
ls -la ~/.claude/hooks/

# settings.json should reference both hooks
python3 -c "
import json; d = json.load(open('$HOME/.claude/settings.json'))
hooks = d.get('hooks', d)
print('SessionEnd:', [h['command'] for e in hooks.get('SessionEnd',[]) for h in e.get('hooks',[])])
print('Stop:      ', [h['command'] for e in hooks.get('Stop',[]) for h in e.get('hooks',[])])
"
```

Expected:
```
SessionEnd: ['~/.claude/hooks/log-sync-session-end.sh']
Stop:       ['~/.claude/hooks/taskmaster-check-completion.sh']
```

---

## HPC cluster setup

HPC only needs the session logger (no taskmaster — batch jobs don't need completion gating).

See `~/Dropbox/claude-logs/README.md` → **HPC cluster** section for step-by-step instructions.

Short version:
```bash
# From your laptop
ssh user@cluster "mkdir -p ~/.claude/hooks"
scp ~/Library/CloudStorage/Dropbox/Documents/Economics/Projects/Claude/log_sync/hooks/session_end.sh \
    user@cluster:~/.claude/hooks/log-sync-session-end.sh
ssh user@cluster "chmod +x ~/.claude/hooks/log-sync-session-end.sh"

# On the cluster: create ~/.claude/settings.json with SessionEnd hook
# and add: export CLAUDE_LOG_DIR="$HOME/claude-logs" to ~/.bashrc
```

Then edit `~/Dropbox/claude-logs/config/hooks/log_sync.conf` on your laptop:
```
HPC_HOST=username@cluster.university.edu
HPC_LOG_DIR=~/claude-logs
HPC_SSH_TIMEOUT=3
```
Current: `kdb5009@klc0401.quest.northwestern.edu`

---

## Installed file layout

```
~/.claude/
├── settings.json                        → Dropbox/claude-logs/config/settings.json
├── hooks/
│   ├── log-sync-session-end.sh          → ~/.claude/skills/log_sync/hooks/session_end.sh
│   ├── log_sync.conf                    → Dropbox/claude-logs/config/hooks/log_sync.conf
│   ├── taskmaster-check-completion.sh   → ~/.claude/skills/taskmaster/check-completion.sh
│   └── taskmaster-compliance-prompt.sh  → ~/.claude/skills/taskmaster/taskmaster-compliance-prompt.sh
└── skills/
    ├── log_sync/
    │   ├── SKILL.md
    │   ├── install.sh
    │   ├── hooks/
    │   │   └── session_end.sh
    │   └── scripts/
    │       ├── detect_machine.sh
    │       └── sync.sh
    └── taskmaster/
        ├── check-completion.sh
        ├── taskmaster-compliance-prompt.sh
        └── ...

Dropbox/claude-logs/
├── config/
│   ├── settings.json                    ← source of truth for all laptops
│   └── hooks/
│       └── log_sync.conf               ← set HPC_HOST here
├── hpc/
│   ├── .rsync.log                       ← rsync history (updated each session end)
│   └── payments/                        ← logs pulled from cluster
└── <project>/                           ← logs from each machine
```

---

## Further reading

- Session logger details: `~/Dropbox/claude-logs/README.md`
- Log sync skill: `<repo>/log_sync/SKILL.md`
- Taskmaster details: `<repo>/taskmaster/SETUP.md`
