# Taskmaster Setup Guide

This guide walks through installing Taskmaster for Claude Code, verifying it works,
and fixing common problems.

## Prerequisites

- Claude Code CLI (`claude`) installed
- `python3` available (used to update `settings.json`)
- `jq` available (used by the hook at runtime)

Check:
```bash
which claude && which python3 && which jq
```

## Install

Run the installer from this directory:

```bash
bash ~/path/to/taskmaster/install.sh
```

If this skill lives inside a project folder (not in `~/.claude/skills`), you can run:

```bash
bash "$(dirname "$0")/install.sh"
# or navigate here first:
cd ~/Dropbox/Documents/Economics/Projects/Claude/taskmaster
bash install.sh
```

The installer will:
1. Copy skill files to `~/.claude/skills/taskmaster/`
2. Create symlinks in `~/.claude/hooks/`
3. Add a `Stop` hook entry to `~/.claude/settings.json`

## Verify Installation

Run this to confirm everything is wired up:

```bash
bash ~/Dropbox/Documents/Economics/Projects/Claude/taskmaster/verify.sh
```

(See `verify.sh` in this directory for what it checks.)

Or manually:

```bash
# 1. Hook symlink exists and is executable
ls -la ~/.claude/hooks/taskmaster-check-completion.sh

# 2. Points to the right file
readlink ~/.claude/hooks/taskmaster-check-completion.sh

# 3. Settings.json has the Stop hook
python3 -c "
import json
data = json.load(open('$HOME/.claude/settings.json'))
hooks = data.get('hooks', data)
stop = hooks.get('Stop', [])
cmds = [h.get('command') for e in stop for h in e.get('hooks', [])]
print('Stop hooks:', cmds)
found = any('taskmaster' in (c or '') for c in cmds)
print('Taskmaster hook registered:', found)
"
```

Expected output for step 3:
```
Stop hooks: ['~/.claude/hooks/taskmaster-check-completion.sh']
Taskmaster hook registered: True
```

## Manual Setup (if the installer fails)

If `install.sh` doesn't work, do these three steps by hand:

### Step 1 — Copy the check-completion script

```bash
mkdir -p ~/.claude/skills/taskmaster
cp ~/Dropbox/Documents/Economics/Projects/Claude/taskmaster/check-completion.sh \
   ~/.claude/skills/taskmaster/check-completion.sh
cp ~/Dropbox/Documents/Economics/Projects/Claude/taskmaster/taskmaster-compliance-prompt.sh \
   ~/.claude/skills/taskmaster/taskmaster-compliance-prompt.sh
chmod +x ~/.claude/skills/taskmaster/check-completion.sh
chmod +x ~/.claude/skills/taskmaster/taskmaster-compliance-prompt.sh
```

### Step 2 — Create the hook symlink

```bash
mkdir -p ~/.claude/hooks
ln -sf ~/.claude/skills/taskmaster/check-completion.sh \
       ~/.claude/hooks/taskmaster-check-completion.sh
chmod +x ~/.claude/hooks/taskmaster-check-completion.sh
```

### Step 3 — Register the Stop hook in settings.json

Open `~/.claude/settings.json` (create it if missing) and add the `Stop` hook:

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/hooks/taskmaster-check-completion.sh"
          }
        ]
      }
    ]
  }
}
```

If `settings.json` already has a `hooks` block, add the `Stop` array alongside
the existing keys — do not replace the whole file.

## Troubleshooting

### Hook fires but says "command not found"

The `check-completion.sh` script sources `taskmaster-compliance-prompt.sh` from the
same directory. If the symlink target is wrong, sourcing fails.

Check:
```bash
readlink -f ~/.claude/hooks/taskmaster-check-completion.sh
# Should resolve to a real file, not a broken link
```

Fix:
```bash
ln -sf ~/.claude/skills/taskmaster/check-completion.sh \
       ~/.claude/hooks/taskmaster-check-completion.sh
```

### Hook fires on every stop, even after TASKMASTER_DONE

The hook reads the session transcript and `last_assistant_message` to detect the
done signal. Common causes of false-continues:

- The done token was in a code block and got reformatted — emit it as a plain line
- The session_id was empty — the hook falls back to `unknown-session`; the transcript
  search uses that literal string

### `jq` not found at hook runtime

The hook requires `jq`. Install it:
```bash
brew install jq        # macOS
# or
sudo apt install jq    # Ubuntu/Debian
```

### settings.json is invalid JSON after manual edits

Validate and fix:
```bash
python3 -m json.tool ~/.claude/settings.json
```

### Uninstall

```bash
bash ~/.claude/skills/taskmaster/uninstall.sh
```

Or manually:
```bash
rm -f ~/.claude/hooks/taskmaster-check-completion.sh
rm -f ~/.claude/hooks/taskmaster-compliance-prompt.sh
# Then remove the Stop hook entry from ~/.claude/settings.json
```
