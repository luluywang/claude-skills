# Claude Code Hooks

Two hooks run on every Claude Code session. Both require one-time setup per machine.

## Hooks at a glance

| Hook | Event | Script | What it does |
|------|-------|--------|--------------|
| Session logger | `SessionEnd` | `~/.claude/hooks/export-session.sh` | Copies transcript to Dropbox; auto-pulls HPC logs via rsync |
| Taskmaster | `Stop` | `~/.claude/hooks/taskmaster-check-completion.sh` | Blocks session end until Claude emits `TASKMASTER_DONE::<session_id>` |

Both are wired into `~/.claude/settings.json`. The settings file lives in Dropbox and is symlinked on each laptop, so adding a new hook there propagates everywhere automatically.

---

## New laptop setup

Run both installers once. Order doesn't matter.

### 1. Session logger

```bash
bash ~/Library/CloudStorage/Dropbox/claude-logs/setup.sh
```

This symlinks three files into `~/.claude/`:
- `settings.json` → `Dropbox/claude-logs/config/settings.json`
- `hooks/export-session.sh` → `Dropbox/claude-logs/config/hooks/export-session.sh`
- `hooks/export-session.conf` → `Dropbox/claude-logs/config/hooks/export-session.conf`

Because `settings.json` is shared via Dropbox, the `Stop` hook for taskmaster is already registered after this step — but the taskmaster scripts themselves still need to be installed (step 2).

### 2. Taskmaster

```bash
bash ~/Library/CloudStorage/Dropbox/Documents/Economics/Projects/Claude/taskmaster/install.sh
```

This copies scripts to `~/.claude/skills/taskmaster/` and symlinks:
- `~/.claude/hooks/taskmaster-check-completion.sh`
- `~/.claude/hooks/taskmaster-compliance-prompt.sh`

### Verify

```bash
# All four hook files should exist and be executable
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
SessionEnd: ['~/.claude/hooks/export-session.sh']
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
scp ~/Library/CloudStorage/Dropbox/claude-logs/config/hooks/export-session.sh \
    user@cluster:~/.claude/hooks/export-session.sh
ssh user@cluster "chmod +x ~/.claude/hooks/export-session.sh"

# On the cluster: create ~/.claude/settings.json with SessionEnd hook
# and add: export CLAUDE_LOG_DIR="$HOME/claude-logs" to ~/.bashrc
```

Then edit `~/Dropbox/claude-logs/config/hooks/export-session.conf` on your laptop:
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
│   ├── export-session.sh                → Dropbox/claude-logs/config/hooks/export-session.sh
│   ├── export-session.conf              → Dropbox/claude-logs/config/hooks/export-session.conf
│   ├── taskmaster-check-completion.sh   → ~/.claude/skills/taskmaster/check-completion.sh
│   └── taskmaster-compliance-prompt.sh  → ~/.claude/skills/taskmaster/taskmaster-compliance-prompt.sh
└── skills/
    └── taskmaster/
        ├── check-completion.sh
        ├── taskmaster-compliance-prompt.sh
        └── ...

Dropbox/claude-logs/
├── config/
│   ├── settings.json                    ← source of truth for all laptops
│   └── hooks/
│       ├── export-session.sh
│       └── export-session.conf          ← set HPC_HOST here
├── hpc/
│   ├── .rsync.log                       ← rsync history (updated each session end)
│   └── payments/                        ← logs pulled from cluster
└── <project>/                           ← logs from each machine
```

---

## Further reading

- Session logger details: `~/Dropbox/claude-logs/README.md`
- Taskmaster details: `~/Dropbox/Documents/Economics/Projects/Claude/taskmaster/SETUP.md`
