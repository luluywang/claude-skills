# Campaign Mode — Full Reference

Campaign mode is the connective tissue **between** many small plan-sessions stretched over days or weeks. It tracks cross-session state (decisions, SLURM jobs, shifting focus) without replacing or touching the interview/planning/execution phases.

**What campaign mode is NOT:**
- Not a replacement for plan/interview/execution phases — those run as normal within each session.
- Not a SLURM monitoring daemon — job status updates are manual.
- Not for one-shot projects — use the standard workflow for those.
- Not auto-activated — user must explicitly invoke.

## State files (project-local)

Campaign state lives in `.econ_ra/campaign/` inside the **project directory** (not under `$ECON_RA_WORKDIR`). This is intentional: campaign state is project-scoped and can be committed with the code.

```
.econ_ra/
├── campaign/
│   ├── campaign.md     # Objective, current focus, open questions — keep in git
│   ├── decisions.md    # Timestamped decision log — keep in git
│   └── jobs.json       # SLURM job list — add to .gitignore (ephemeral)
└── history/
    └── YYYY-MM-DD_<slug>/   # Archived campaigns
```

Recommended `.gitignore` entry:
```
.econ_ra/campaign/jobs.json
```

## Subcommand protocols

### `/econ_ra campaign start "<objective>"`

Run:
```bash
./scripts/campaign.sh init "<objective>"
```

Show the returned `campaign_md` path. Remind user to add `.econ_ra/campaign/jobs.json` to `.gitignore`. Suggest committing `campaign.md` and `decisions.md` so the campaign survives across machines.

### `/econ_ra campaign resume`

Spawn a Haiku subagent:
```
Task: [econ_ra:campaign:resume] Import state from reality
model: "haiku"
subagent_type: "general-purpose"

Instructions:
Read prompts/campaign_resume.md for full instructions.

Context: project root is the current working directory.
```

Display the returned summary. Then ask the user (via AskUserQuestion or plain text):
> "Want to log any decisions or update campaign.md based on the above?"

If yes, handle with `campaign log` or by asking user to edit campaign.md directly.

### `/econ_ra campaign status`

Run:
```bash
./scripts/campaign.sh status
```

Pretty-print the returned JSON. If `"exists": false`, tell the user no active campaign was found and suggest `campaign start`.

### `/econ_ra campaign log "<decision>"`

Run:
```bash
./scripts/campaign.sh log "<decision>"
```

Confirm the entry was appended.

### `/econ_ra campaign job submit <jobid> "<purpose>"`

Run:
```bash
./scripts/campaign.sh job-add <jobid> "<purpose>"
```

### `/econ_ra campaign job update <jobid> <status> [note]`

Valid statuses: `submitted`, `running`, `succeeded`, `failed`, `oom`, `cancelled`.

Run:
```bash
./scripts/campaign.sh job-update <jobid> <status> [note]
```

### `/econ_ra campaign job list`

Run:
```bash
./scripts/campaign.sh job-list
```

### `/econ_ra campaign end`

Run:
```bash
./scripts/campaign.sh end
```

If the script refuses (active jobs), tell the user which jobs need status updates first. On success, report the archive path.

## Worked example

```
# Day 1 — start campaign
/econ_ra campaign start "Estimate dynamic labor demand model with adjustment costs"
→ .econ_ra/campaign/campaign.md created
→ User edits campaign.md: fills in "Related paths" and "Open questions"

# Day 1 — run a normal plan-session (unchanged workflow)
/econ_ra tackle @notes/build_gmm_moments.md
... interview → planning → execution (subagents do the work) ...

# Day 1 — log a decision and submit a job
/econ_ra campaign log "Decided to use Rust BFGS wrapper instead of scipy for outer loop"
/econ_ra campaign job submit 4821937 "First pass GMM estimation, 500 bootstrap draws"

# End of Day 1 session — no special action needed

# Day 3 — new session, pick up where we left off
/econ_ra campaign resume
→ Haiku reads campaign.md, git log, squeue, recent .out files
→ Returns: "Job 4821937 likely finished (not in squeue). Commits suggest outer loop converged.
   Suggest updating current focus to 'check bootstrap SEs and robustness specs'."

# Day 3 — update job status, log findings
/econ_ra campaign job update 4821937 succeeded "converged in 47 iterations, SE look reasonable"
/econ_ra campaign log "Bootstrap SEs are 20% wider than delta-method — use bootstrap in final tables"

# Day 3 — run another plan-session
/econ_ra tackle @notes/robustness_checks.md
...

# Campaign complete
/econ_ra campaign end
→ Archived to .econ_ra/history/2025-03-15_estimate_dynamic_labor_demand_model_with/
```
