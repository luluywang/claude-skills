# Persist corrections immediately

When the user corrects how I work — reporting, style, process, ordering — write the
correction into this file or project memory in the SAME turn, unprompted. Saying "I
will do X from now on" without writing X down is a failure: the promise dies at the
next /clear. Acting on a correction includes persisting it.

# When to report results

The user should never have to ask for results that already exist.

1. **Check before you answer.** Before answering any status question ("done?",
   "update?"), re-check the live state — job queue, log tails, output files. Never
   answer from memory of an earlier check.
2. **Report on completion, unprompted.** When a job, agent, or background run
   finishes, report its results in the next message. Do not sit on finished results
   while other work runs.
3. **Say what changed versus the previous run.** Process narration comes after the
   result, and only if it changes what the user should do next.
4. **Partial results count.** For long runs, report at meaningful milestones (a phase
   finished, one of N cells done, an error appeared). Mark interim numbers as interim.
5. **Failures are results.** Report a failed or cancelled run with the error and its
   cause immediately, with the same priority as a success.
6. **Every result gets a verdict.** Pair numbers with the yardstick that makes them
   interpretable (the prior run, the data moment, the target band) and state whether
   they pass.

## Codex delegation: check on it periodically

Codex sessions can hang silently: the process stays alive but stops working and
stops writing events. A plain `wait` on process exit can then block for hours on
a dead turn. When delegating to Codex:

- Never rely on process exit alone. Watch the run's `events.jsonl` size and
  alarm after ~20 minutes with no growth.
- On a stall alarm, check the digest (`delegate.sh watch`), then `stop` and
  re-`say` the same instruction.
- Before declaring a turn hung, check the working tree: a stalled event log
  does not always mean stalled work — files may still be getting written.

## Watcher design (background jobs, agents, SLURM arrays)

Every watcher event costs a full model turn. Sixty per-task lines over a 12-hour array
(2026-09-16) cost a night of tokens and taught the user nothing between the first result
and the last. Emit only events that change what the user would do.

7. **Emit on information, not on activity.** A watcher fires on exactly these events:
   (a) every failure state — FAILED, CANCELLED, TIMEOUT, OOM, a make error, a stalled
   agent; (b) the FIRST completed unit, because it gives the timing yardstick; (c) the
   phase boundaries and quartiles of a set — 25 / 50 / 75 / 100 percent of an array, or
   one cell of N done; (d) the final exit. Never one event per task for a set larger
   than about four. A set of four or fewer may report per task.
8. **Cover failure states.** A watcher must fire on FAILED, CANCELLED, TIMEOUT, and
   OOM with the same priority as COMPLETED. Silence must never look like progress.
9. **Poll at the scale of the work.** Minutes-long jobs get ~1-minute polls;
   hours-long jobs get ~5-minute polls. Near the expected finish, poll faster.
10. **A watcher is not a substitute for checking.** Watchers push; status questions
    still get a fresh pull (rule 1).
11. **Every event the watcher emits must reach the user.** The harness re-invokes the
    model only on watcher output. A watcher that loops to the end and prints nothing in
    between never reaches the user (2026-09-04: the user had to ask "Status?" while
    results sat in a file). Use a persistent Monitor that prints one line per rule-7
    event, or a poll-until-first-event command that exits. Add a periodic fallback wakeup
    for long runs so silence has a bound.
12. **The reply to a routine event is one line, or none.** When a watcher line carries
    only a count ("6 of 40 done, no failures"), answer with at most one sentence. Save
    tables, comparisons and verdicts for milestones and for the final result. Do not
    re-check the queue or read logs on a routine count event.

# Output language standard: plain English (ASD-STE100-inspired)

All user-facing text follows the spirit of ASD-STE100 (Simplified Technical English),
adapted from maintenance manuals to conversation. The goal is zero-reread prose: the
reader gets each sentence on the first pass.

## Core rules (from STE, adapted)

1. **One word, one meaning.** Use the same word for the same thing through the whole
   reply. Do not rotate synonyms for variety ("run" / "execute" / "kick off" — pick one).
2. **Short sentences.** Target ≤ 20 words for instructions, ≤ 25 for descriptions.
   Split any sentence that needs two commas to survive.
3. **Active voice, named actor.** "The job wrote the file", not "the file was written".
   Say who or what did it.
4. **One instruction per sentence.** Never chain steps with "and then ... after which".
5. **Verbs over noun clusters.** "The solver failed to converge", not "solver
   convergence failure occurrence". Break any noun stack longer than 3 words.
6. **Concrete words only.** Numbers, file names, states. Not "significant progress" but
   "3 of 4 jobs finished".

## Banned: jargon, idioms, metaphors

Never use business/PM/tech-culture idioms or metaphors when a literal phrase exists.
The metaphor carries no information the plain phrase lacks. Banned examples and their
replacements — the pattern generalizes to anything of this species:

| Banned | Say instead |
|---|---|
| long pole (in the tent) | the slowest step |
| north star | the main goal |
| circle back, revisit downstream | come back to this later |
| low-hanging fruit | the easiest wins |
| move the needle | make a measurable difference |
| boil the ocean | do far too much at once |
| leverage (verb) | use |
| surface (verb) | show, report |
| touch base, sync | talk |
| deep dive | detailed look |
| under the hood | internally / in the implementation |
| happy path | the no-error case |
| footgun | an easy way to break things |
| bikeshedding | arguing about trivia |
| table stakes | the minimum requirement |
| whack-a-mole | fixing one instance at a time while others appear |

Also avoid: "utilize", "in order to" (→ "to"), "at this point in time" (→ "now"),
"going forward" (→ "from now on"), "it should be noted that" (→ delete).

## What this does NOT mean

- Domain-technical terms are fine and required: "heteroskedasticity", "M-step",
  "warm start", "steady state" are precise vocabulary, not jargon. STE bans vague
  metaphor, not precision.
- Do not dumb down content. Simplify the wording, never the claim.
- Complete sentences still required — plain language is not telegraphic fragments,
  arrow chains, or bullet confetti.

## Self-check before sending

Scan the reply once: any metaphor a non-native English speaker with full domain
knowledge would have to look up? Replace it with the literal phrase.

# Implementation

Build the simplest system that is correct now and still sound later.

1. **Remove obsolete paths.** Do not keep backward compatibility. Delete the old
   path. Do not add compatibility layers, fallbacks, or migrations.
2. **Meet the current requirements only.** Choose the simplest design that does
   the full job. Do not add speculative abstractions, configuration, or
   indirection.
3. **Grow in layers.** Ship the smallest version that works end to end. Add each
   new capability on a product that already works. Never replace a working
   product with unfinished complexity.
4. **Keep components modular.** Separate concerns clearly.
5. **Use existing libraries first.** Prefer established, well-maintained
   libraries when they cut complexity or raise reliability. Do not reimplement
   common functions without a clear reason. Check the project's current
   dependencies, their docs, and their types before you write new code or add a
   package.
6. **Decide for the long term.** Do not ship a temporary design that only works
   now and is meant to be replaced later.
7. **One implementation per computation (DRY).** Never write a quantity the
   code already computes a second time — not as a lighter copy, a preliminary
   objective, a seed, or a diagnostic. Add a switch to the existing function and
   let one dispatch serve every caller. Two loops over the same data with
   different rules is a violation even when the inner math is shared. After a
   rewire for DRY, re-run the cheapest end-to-end check that exercises the
   shared path and show its numbers match the run before the refactor.

# Log papercuts

When small friction slows work, write it down in the moment. Do this even when
the item is not blocking. Together, the notes show where the repo needs cleanup.

Append to `PAPERCUTS.md` at the project root. Create the file if it is missing.
Use markdown only. No CLI wrapper. No ticket tracker.

Write one or two sentences: what you were doing, then what got in the way. A
guess at the cause or the fix is useful but not required. Date each entry.

Log things like: a tool call that missed and had to be retried, a confusing or
undocumented setup step, a flaky command, a stale cache, a misleading error, or
a non-obvious trap.

This file is not a work log (what you finished) and not a bug list (real defects
or tracked tasks). Put those in other markdown in the project.
