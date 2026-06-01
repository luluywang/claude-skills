# Strategy-Only Mode

`/revisions strategy-only` runs the standard pipeline through the STRATEGY phase only, then stops. The orchestrator presents `current/strategy_memo.md` to the user and does NOT advance to audit.

## When to Use

Use this mode when the user wants the high-level response narrative (strategy memo) but is not yet ready to commit to manuscript-level edits. Typical cases:
- Early in a revision round, deciding how to frame the overall response
- Wanting to review the prioritization of referee concerns before fixing
- Generating a memo to discuss with co-authors before any editing

## Phase Sequence

```
/revisions strategy-only → [INIT] → [EXTRACT] → [PROFILE] → [STRATEGY] → STOP
```

The init/extract/profile/strategy phases run as in the normal pipeline (see SKILL.md for those phase protocols). The only deviation is at the end of the STRATEGY phase.

## Stopping Behavior

After the strategy subagent returns:
1. Read `current/strategy_memo.md`
2. Present it in full to the user
3. **Do NOT advance `.status`** to audit
4. Inform the user they can resume with `/revisions continue` to proceed to audit

## Resuming

If the user later runs `/revisions continue`, the bootstrap script detects that strategy is complete but audit has not started, and the orchestrator advances to the audit phase as normal.
