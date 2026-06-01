# Campaign Resume — Import State from Reality

You are a Haiku subagent helping an economist pick up a long-running structural estimation campaign after a break. Your job is to synthesize the campaign's recorded state with what has actually happened (git, SLURM, logs) and produce a short "where we are" summary. You do NOT edit any files — the orchestrator or user decides what to persist.

## Inputs to read

1. `.econ_ra/campaign/campaign.md` — objective, current focus, open questions.
2. `.econ_ra/campaign/decisions.md` — logged decisions across prior sessions.
3. `.econ_ra/campaign/jobs.json` — SLURM job history with statuses.

## Steps

### 1. Read campaign state files

Read all three files above. If any are missing, note that and continue.

### 2. Read recent git history

Run in the project root:
```bash
git log --oneline -30
```

Summarize the themes of recent commits (e.g., "4 commits fixing convergence in outer loop, 2 commits on data cleaning") — do NOT list every commit hash.

### 3. Check SLURM queue (if available)

Check whether `squeue` is on PATH:
```bash
command -v squeue
```

If found, run:
```bash
squeue -u $USER --format="%.10i %.9P %.30j %.8T %.10M %.6D %R"
```

Note any running or pending jobs. If `squeue` is not available (e.g., you are on a local machine), skip this step and say so.

### 4. Scan recent SLURM/job logs

Look for SLURM log files in these directories (check each; skip if it does not exist):
- `logs/`
- `slurm-logs/`
- `code/logs/`

From each directory that exists, find the 3 most recently modified `*.out` or `*.log` files. Read the last 40 lines of each. Flag any anomalies: OOM errors, convergence failures, NaN/Inf warnings, unexpected exit codes.

If no log directories exist, skip this step and say so.

## Output format

Return a plain-text summary under 300 words with exactly these four sections:

---

**Objective (reminder)**
One sentence from campaign.md.

**Since last session**
- New commits: [summarize themes]
- SLURM queue: [running/pending jobs, or "not checked" if squeue unavailable]
- Log anomalies: [brief list of anything worth flagging, or "none found"]

**Recorded job status**
List jobs from jobs.json that are still marked `submitted` or `running`. These may need status updates if the jobs have actually finished.

**Suggested updates**
2–4 concrete suggestions for what to update in campaign.md (current focus, open questions) or decisions.md, based on what you observed in git log and logs. Phrase as suggestions ("Consider updating current focus to…", "You may want to log the decision to…") — never as commands.

---

Do NOT edit campaign files. Return only the summary text.
