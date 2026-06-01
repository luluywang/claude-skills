---
name: telegram-multi
description: Manage multiple Telegram bot configurations for multi-session Claude Code setups. Use when the user invokes '/telegram-multi' with no args (interactive setup wizard for a new bot), 'list' (show configured bots), 'show <name>' (show one bot's details), or 'remove' (interactive removal). Each bot gets its own state directory so multiple Claude Code sessions can run with separate tokens and allowlists.
---

# /telegram-multi — Multi-Bot Telegram Management

Interactive skill for managing named Telegram bot configurations.

---

## Convention

| Bot | State directory |
|-----|-----------------|
| Default (unnamed) | `~/.claude/channels/telegram/` |
| Named bot `<name>` | `~/.claude/channels/telegram-<name>/` |

---

## Dispatch

If `$ARGUMENTS` is `list`, `show`, or `remove` — jump to that section below.
If `$ARGUMENTS` is empty or anything else — run the **interactive setup wizard**.

### Interactive setup wizard (default)

Walk the user through setup one question at a time using AskUserQuestion.
Pre-fill answers from `$ARGUMENTS` if provided (e.g., if user passed a name
or token, skip that question).

**Step 1 — List existing bots**

Scan `~/.claude/channels/telegram` and `~/.claude/channels/telegram-*/` dirs.
Show a table of what's already configured (name, masked token, policy,
allowed user count). This gives context before asking questions.

**Step 2 — Ask: bot name**

Use AskUserQuestion: *"What name for this bot? This becomes the state
directory name and tmux session name. (lowercase, hyphens ok — e.g.,
`payments-1`, `crosssell-1`)"*

Validate: `[a-z0-9][a-z0-9-]*`, not `default`. Re-ask if invalid.

**Step 3 — Ask: bot token**

Use AskUserQuestion: *"Paste the bot token from @BotFather (looks like
`123456789:AAH...`):"*

Validate: should contain a colon. Warn but don't block if format looks off.

**Step 4 — Ask: tmux session name**

Use AskUserQuestion: *"What tmux session should this bot run in? (default:
`<name>` from step 2)"*

Accept the default if they just press enter or say "same" / "that's fine".

**Step 5 — Ask: working directory**

Use AskUserQuestion: *"What working directory should Claude start in?
(default: current directory `$PWD`)"*

**Step 6 — Create everything**

Run: `bash scripts/create_bot.sh <name> <token> <working_dir>`

The script handles directory creation, permissions, `.env`, and the
default `access.json`. It prints a summary line with the masked token.

**Step 7 — Show launch command and ask: launch now?**

Use AskUserQuestion: *"Want me to launch it now? (yes/no)"*

If yes, run: `bash scripts/launch_bot.sh <name> <tmux_session> <working_dir>`

Then remind them to:
- DM the bot on Telegram to get a pairing code
- Attach to the session (`tmux attach -t <name>`) and run
  `/telegram:access pair <code>`
- Then lock down with `/telegram:access policy allowlist`

If no, just show the command for later.

---

### `list` — show all configured bots

Scan `~/.claude/channels/telegram` and `~/.claude/channels/telegram-*/`.
For each, read `.env` (mask token) and `access.json` (policy + allowed count).
Display as a table.

### `show <name>` — show one bot's details

Read state dir for `<name>` (or `default`). Show: masked token, policy,
allowed users, pending pairings, state dir path, launch command.

### `remove` — interactive removal

1. List all configured bots.
2. AskUserQuestion: *"Which bot to remove?"*
3. Show what will be deleted (masked token, allowed users count).
4. AskUserQuestion: *"Confirm deletion? This removes the state directory.
   Type the bot name to confirm:"*
5. Only proceed if they type the exact name.
6. `rm -rf ~/.claude/channels/telegram-<name>`
7. Remind to revoke the token via @BotFather `/revoke`.

---

## Implementation notes

- Never print raw tokens. Mask as: everything up to colon + one char + `...`
- File permissions: `.env` → `chmod 600`, state dir → `chmod 700`
- `access.json` is pretty-printed JSON (2-space indent)
- If `~/.claude/channels/` doesn't exist, create it
- Always read before writing `access.json` to avoid clobbering server updates
