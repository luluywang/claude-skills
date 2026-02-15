# /commit -- Stage, PR, and Merge

Stages changes, creates a descriptive branch, commits, pushes, creates PR, and merges.

## Critical Requirements
- Always create a NEW branch -- never commit directly to main
- Exclude `.claude/settings.local.json` and sensitive files
- Never use `git add -A` -- explicitly list files to stage
- If no argument provided, analyze staged changes and write a message explaining *why*, not just *what*
- If commit message argument supplied, use it exactly

## PR and Merge
- Use `--merge` flag (not squash or rebase) unless specified otherwise
- Standard footer: "Generated with Claude Code"

## Workflow
1. `git status` to check state
2. Create descriptive branch
3. Stage specific files
4. Commit with explanatory message
5. Push with `-u` flag
6. Create PR via `gh pr create`
7. Merge via `gh pr merge --merge`
8. Clean up branch
