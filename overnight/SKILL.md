---
name: overnight
description: Run a long unattended work session (4-8 hours) as a careful econ RA. Scope the task, ask the user a few sharp questions while they are still here, then work alone until a deadline, making and logging reasonable assumptions, and leave a morning report in a Claude Doc. A Stop hook keeps the session working until the deadline. Use when the user invokes /overnight, or says they are going to bed / leaving for the night / "check in the morning" / "any questions before I go" and wants work to continue while they are away.
---

# /overnight

The user is about to leave for several hours. Your job has two parts that need different behavior:

1. **While the user is here (10 minutes at most):** find the few ambiguities that would send the
   night's work in the wrong direction, and resolve them with the user.
2. **After the user leaves (4-8 hours):** work like a careful research assistant whose PI is asleep.
   Never stop to ask. Make a reasonable assumption, write it down, and keep going. Produce the best
   answer the time allows, and leave a report the user can act on in five minutes over coffee.

The failures this skill exists to prevent come from the user's own logs. Across about 30 past
"I'm going to bed" sessions (June to November 2026), the median session went idle about 10 minutes
after the user left, and only two worked past 2.5 hours. Questions asked after the user left were
never seen ("I don't see the questions", "Hello?"). Morning messages then asked for things the run
should have explained on its own ("Why was demand so fast?", "Why 40 if N_BOOT is 20?"). A good
night is the opposite: questions settled before the user leaves, work until the deadline, and a
report that answers the morning questions before they are asked.

## Invocation

```
/overnight <task>              # scope, ask, then run until the default deadline (6 h)
/overnight 8h <task>           # set the length (4-8 h is normal; 0.25-12 h is allowed)
"I'm going to bed, any questions?"   # same skill; the task is the current conversation
```

Most calls come at the end of a working session. Then the conversation itself is the main context:
the goal, the user's corrections, and what already failed. Read it before anything else.

## Phase 1: Scope (user present)

Spend a few minutes, not an hour. The user is tired.

1. **Read the context.** The conversation so far; the project's `CLAUDE.md`, notes, and README; `git
   log -15` and `git status`; any plan or notes file the user named. On Quest, also `squeue -u $USER`.
2. **Write the charter** to yourself (it goes in PLAN.md in Phase 2):
   - The goal in one sentence, as a question the night should answer.
   - The deliverable: what exists in the morning (a table, a draft section, a fixed pipeline, a memo).
   - The yardstick: how the user will judge whether the answer is good (a benchmark number, a
     replication target, a referee's objection, a test that passes).
   - The plan: core items that produce a first end-to-end answer, then improvement items, then
     stretch items for spare time.
   - The deadline. Default 6 hours. If the user said when they will be back, use that, capped at 8.
3. **Find the real ambiguities.** List every open choice, then sort them:
   - *Direction-changing and expensive to redo* (which sample, which estimand, which section to
     rewrite, whether to change the model or only the code): ask about these.
   - *Reversible or cheap* (file names, plot styles, a tuning constant, the order of tasks): do not
     ask. Decide, and log the choice as an assumption.
   - *Answerable from the files*: do not ask. Look it up.
4. **Ask at most four questions** with AskUserQuestion, in one call, now. A question in plain text
   at the end of a long message gets missed, and a question asked after launch is never answered. Before the call, show the charter
   in five lines or fewer so the user can correct it. For each question:
   - Name the decision and say what the night does under each answer.
   - Put your recommended answer first, marked "(Recommended)". The user should be able to accept
     all your defaults in a few clicks.
   - If there is nothing direction-changing to ask, say so and ask nothing. Zero questions is fine.
5. If the user answers "just go" or does not engage, use the recommended defaults and log them.

## Phase 2: Launch

Do all of this in one turn, right after the answers arrive, so the user sees it before they leave.

1. **Make a branch.** If the project is a git repo: `git switch -c overnight/<YYYY-MM-DD>` from the
   current branch. Commit any uncommitted work of the user's first, as its own commit, so your changes
   stay separable. Never push.
2. **Create the morning-report Claude Doc.** Load the docs skill first if it is listed
   (`anthropic-skills:docs`). Title: `Overnight: <short goal> (<date>)`. Sections, each a pending
   block: Status, Verdict, Results, Assumptions to confirm, Questions for you, What failed or was
   skipped, Changes made, Next steps, Run log. If the Docs tools are not available (for example on a
   machine without claude.ai connectors), use `<run dir>/MORNING.md` with the same sections instead.
3. **Start the run.**
   ```bash
   python3 ~/.claude/skills/overnight/scripts/overnight.py start --hours <H> --project <repo root> \
       --doc '<doc url>' --goal '<one-sentence goal>'
   ```
   It prints `OVERNIGHT_RUN::<run_id>` and the run directory `<project>/.overnight/<run_id>/`. The Stop
   hook uses that marker to find this session. Until the deadline, the hook blocks every attempt to
   end the turn and sends you back to the plan.
4. **Write `PLAN.md` and `LOG.md`** in the run directory. PLAN.md holds the charter and a checklist
   you keep current. LOG.md holds decisions and assumptions as they happen (format below). These two
   files are what you reread after a context reset, so keep them current enough to resume from.
5. **Say goodnight in three lines:** the doc link, the deadline, and the one assumption the user
   would most want to veto. Then start working in the same turn. Do not wait for a reply.

## Phase 3: Work (user away)

### Order of work

- **First, a crude end-to-end answer, within about the first 20% of the time.** A rough number with
  every step working beats a polished half-pipeline. Write it into the doc's Verdict section as
  interim. Every later hour improves an answer that already exists.
- **Then improve where the answer is weakest.** Ask what a skeptical referee would attack first, and
  work on that. Re-estimate, add the missing robustness check, fix the step you faked.
- **At about 60% of the time, get a fresh-eyes review.** Spawn a subagent that has not seen your
  reasoning. Give it the question, the code, and the results, not your conclusion, and ask it to find
  what is wrong. Fix what it finds or record why not.
- **At about 85% of the time, stop starting new branches of work.** Verify, clean up, commit, and
  write the report.

### Making assumptions

The user chose to be away, so a blocked question costs the whole night. When you hit an ambiguity:

1. Check the files, the conversation, and the project's notes. Most answers are there.
2. Prefer the choice that is easiest to reverse, and the one closest to what the user did before.
3. If two choices are both plausible and cheap, do both and report the comparison. That turns a
   guess into a result.
4. Write it in LOG.md at once, and later in the doc's Assumptions table:

   | Assumption | Why | Effect if wrong | How to undo |
   |---|---|---|---|
   | Dropped 2020Q2 as a COVID outlier | Same choice as `clean.do` line 40 | Coefficient moves; see robustness row 3 | Remove the filter in `build.py:88` |

An assumption the user would plainly reject if asked (it changes the research question, discards
their data, or contradicts their notes) is not an assumption. Take the safe branch and put the
question in "Questions for you".

### What you may do

The user has allowed, for overnight runs:
- Commit to the `overnight/<date>` branch (never push).
- Submit and monitor SLURM jobs on Quest. Request a small number of CPUs per job (the user asked
  for this after an earlier night); many narrow jobs start sooner than a few wide ones. Keep total
  use reasonable for one night, and say in the report what you used.
- Heavy fan-out: Workflow runs with many subagents, delegation to Codex (`/delegate`), and paid APIs
  such as Refine or Pangram. Use them when they buy a better answer, not by habit. For delegated
  coding, prefer Opus subagents: the user wants to see what delegates did, and outside agents have
  been hard to watch. Judge every delegate's result. If it is lazy or thin, write a sharper brief and
  delegate again rather than accept it or stop.
- Edit paper and draft files in place. The branch and the commits are the safety net, so commit before
  each large edit.

Never, even overnight: push to a remote, send email or messages to anyone, delete or overwrite raw
data or files you did not create, write into the output directories of runs you did not start
(production runs on other branches are the common case), change anything outside the project (except your own scratch and
the run registry), or cancel jobs you did not submit. Put any such step in "Next steps" as a proposal.

### Waiting for jobs

Foreground `sleep` is blocked, and a session that ends its turn idles until something wakes it. To
wait for SLURM jobs or a long script:

1. Start a background command (Bash with `run_in_background`) that polls and exits when the jobs
   leave the queue, a job fails, or a time cap passes. Use `timeout` for the cap. Follow the user's
   watcher rules: fire on failure states and on completion, not per task.
2. Run `overnight.py wait --run <id> --minutes <cap> --on '<what>'`. The hook then allows the session
   to go idle until the cap.
3. End the turn. The background command's exit wakes the session.

While jobs run, do other plan items first if there are any. Waiting is for when nothing else is useful.

### Staying on track

- **Context fills up.** The no-compaction mod clears the context and points you at the transcript.
  Read PLAN.md and LOG.md in the run directory first: they are shorter and say where you are.
- **An approach fails twice.** Stop retrying. Write down why it failed, and replan from PLAN.md.
  Repeating a failed step all night is the worst use of the time.
- **Update the doc at milestones only:** the first end-to-end answer, each improved answer, a failure
  that changes the plan, the fresh-eyes review, and the end. Put a one-line Status at the top with the
  time and the current step, so a user who checks from their phone sees where things stand.
- **Finished early.** First take the stretch items, more robustness, or a second method that checks
  the first. Finish early (`overnight.py finish --run <id> --reason '<why>'`) only if more work would
  not improve the answer, or every remaining step needs the user.

## Phase 4: Morning report

Write the report for a reader who has five minutes and was asleep. Use plain, literal English, short
sentences, and the same word for the same thing throughout. Fill the doc's sections:

- **Status:** finished / stopped at the deadline / stalled, with the time.
- **Verdict:** two or three sentences. The answer to the night's question, how sure you are, and why.
  Lead with it.
- **Results:** each number paired with its yardstick (the target, the previous run, the benchmark)
  and whether it passes. Tables over prose where there are more than three numbers. Explain anything
  surprising before the user has to ask: a run that was much faster or slower than expected, a count
  that does not match a setting, an estimate far from the last one. Say what caused it, or say that
  you do not know yet.
- **Assumptions to confirm:** the table above, the most consequential first.
- **Questions for you:** ranked. Each states the decision, your default, and what changes under the
  other answer.
- **What failed or was skipped:** with the error and its cause. A failure is a result.
- **Changes made:** the branch name, commits (`git log --oneline main..HEAD` or the base branch), files
  changed, SLURM job IDs and core-hours, and paid API use.
- **Next steps:** what you would do with another night, and proposals you were not allowed to carry
  out.
- **Run log:** the milestone lines, oldest first.

Then commit, run `overnight.py finish --run <id>` (with `--reason` if before the deadline), and end
the turn. After the deadline the hook reminds you twice to finish the report, then lets the session
stop.

## How the Stop hook behaves

`install.sh` registers `overnight.py hook` as a Stop hook. For any session without an
`OVERNIGHT_RUN::` marker it does nothing. For the session that owns a live run:

| Situation | Hook |
|---|---|
| Before the deadline, status active | Blocks the stop and sends you back to PLAN.md |
| Inside a registered `wait` | Allows the stop; the watcher wakes the session |
| Three blocked stops in a row with no tool call in between | Allows the stop; marks the run `stalled` |
| After the deadline | Two reminders to finish the report, then allows the stop |
| After `finish` | Allows the stop |

Other commands: `overnight.py status --run <id>` shows time left; runs live in
`~/.claude/overnight/<run_id>.json`.
