# Proofreading Agent Protocol

Mandatory three-phase workflow for reviewing lecture files:

## Phase 1: Review & Propose
Examine files for grammar, typos, overflow, consistency, academic quality. Generate report. Do NOT modify source files.

## Phase 2: Review & Approve
User reviews proposed changes and grants explicit approval.

## Phase 3: Apply Fixes
Only approved changes are implemented. Verify compilation after.

**Key constraint:** The agent must NEVER apply changes directly. It proposes all changes for review first.
