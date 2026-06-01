# Taskmaster Setup

Installation and troubleshooting reference for the taskmaster skill.

## Setup

Install and run:

```bash
bash ~/.codex/skills/taskmaster/install.sh
codex-taskmaster
```

## Installation Verification

`install.sh` automatically runs a smoke test after installation. You can also
run it manually at any time:

```bash
bash ~/.claude/skills/taskmaster/scripts/verify_install.sh
```

The smoke test checks:

1. **Hook symlink exists** — `~/.claude/hooks/taskmaster-check-completion.sh`
   is present and resolves to a real file.
2. **Hook is executable** — the symlink target has the execute bit set.
3. **Settings registration** — `~/.claude/settings.json` contains a Stop hook
   entry whose `command` includes `taskmaster`.
4. **Mock stop invocation** — feeds a synthetic JSON payload to the hook and
   confirms it returns a valid JSON response (either `block` decision or a
   clean exit for short/empty transcripts).

A passing run looks like:

```
Taskmaster installation check
=============================
  [OK]  Hook symlink exists: /Users/you/.claude/hooks/taskmaster-check-completion.sh
  [OK]  Hook symlink resolves to: /Users/you/.claude/skills/taskmaster/check-completion.sh
  [OK]  Hook is executable
  [OK]  Compliance prompt exists: ...
  [OK]  jq is available (jq-1.7)
  [OK]  Stop hook registered in settings.json
  [OK]  Smoke test passed: hook returns block when done signal absent

Results: 7 passed, 0 failed
Taskmaster is ready.
```

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `Hook symlink missing` | Re-run `install.sh`; check that `~/.claude/hooks/` is writable. |
| `Hook is not executable` | `chmod +x ~/.claude/hooks/taskmaster-check-completion.sh` |
| `Stop hook not found in settings.json` | Re-run `install.sh`, or add the hook manually. |
| `jq not found` | `brew install jq` (macOS) or `apt install jq` (Linux). |
| `settings.json is not valid JSON` | Fix or delete `~/.claude/settings.json` and re-run `install.sh`. |
| Hook fires but does nothing | Check that `TASKMASTER_MIN_TOOLS` is not set too high for your sessions. |
| Hook never fires | Confirm the hook command path in settings.json matches the actual symlink path. |

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

## Uninstall

```bash
bash ~/.claude/skills/taskmaster/uninstall.sh
```

Or manually:

```bash
rm -f ~/.claude/hooks/taskmaster-check-completion.sh
rm -f ~/.claude/hooks/taskmaster-compliance-prompt.sh
# Then remove the Stop hook entry from ~/.claude/settings.json
```
