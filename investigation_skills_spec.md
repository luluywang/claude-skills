# Investigation Skills — Specification (v2.1, 2026-07-06)

Design-only spec for three skills targeting the multi-day judgment loops mined from ~1,150
payments + crosssell session logs and the live klc0402 session `d8d97766` (the bootstrap-CF
convergence saga, Jul 5–7). Objective, per user direction, is minimizing the user's
back-and-forth — corrections, re-stated decisions, verdict adjudication, wasted runs
discovered late — not Claude-internal effort.

**Citation convention.** `[batch_209: a42f0040]` = mined batch and session id from the log
corpus (`~/Dropbox/claude-logs/…`); `[live: d8d97766]` = the klc0402 session read directly on
2026-07-06. Academic citations are standard references, not implemented dependencies.

**Shared campaign substrate** (vendored into each skill):
- VERDICT spec — deterministic classifier over solver/estimator artifacts; thresholds live in
  one version-controlled file; prose must reference verdicts by name. Rationale: verdicts were
  renegotiated and reversed at least once per project ("real divergence → stand down → IS real
  divergence" [batch_086: 33237015]; the "definitive root cause" that turned out to cap dead
  code [live: d8d97766]).
- STATUS board — regenerated from artifacts, never hand-maintained; answers "where are we" and
  "have any non-interchange outputs been created?" [live: d8d97766] at a glance.
- LEDGER — append-only hypotheses/experiments/decisions; every experiment records a
  pre-registered discriminating prediction before launch. HARD GATE (executable): proposed
  knob combos are hashed and checked against the ledger; exact repeats are refused with a
  pointer to the prior outcome. Rationale: IBR tol flip-flopped 0.005↔0.01, SOC-gate added
  then removed, "no record of what combos were already tried," "I feel like we're getting
  farther from the truth" [batch_210: klc0401_20260323; batch_205].
- DECISION MEMO — the only planned user touchpoint: status delta, hypotheses with evidence,
  ONE decision, options with paper-level implications; the answer is appended to the ledger
  and never re-asked. Rationale: the money-metric CS concern was re-explained across 4
  sessions [batch_188]; five consecutive plan rejections refined one rule nuance-by-nuance
  [batch_107: 141204].

---

## Skill 1 — eqm_triage: equilibrium-solver diagnosis campaign

**Trigger.** A counterfactual equilibrium solve fails or looks wrong for some
(preset, scenario, trial/draw): high FOC residual, oscillation, bound-railing, limit cycle.

**Evidence base.** The uncap_debit Durbin saga, strategies A→B→B2→C(IBR)→skip_final_solve→
bespoke solver across 5 sessions, 240m [batch_209: a42f0040, f996dc94, 06acaff0]; big_merger
limit cycle 0.003–0.08 with SKIP_FINE_REFINE threaded through 6 call sites and never
converging [batch_213: klc0402_20260327_214619]; multihome fine-refine diverging on 4/10 then
8/10 draws [batch_212: klc0402_20260327_202037]; 8 manual `soc_penalty_weight=0.0` edits +
full re-run [batch_207: klc0401_20260319_210310]; and the live session: trial-2 interchange
plateau at max|FOC| = 132.7 with rewards railing to the −5% floor, LM lambda oscillating
100↔1000 — a corner treated for two days as a solver failure [live: d8d97766].

### What the skill checks for (verdict spec)

| verdict | executable check | why this check (evidence) |
|---|---|---|
| INTERIOR-EQ | max|FOC| < tol at a point with interior margin to all bounds; per-firm profit Hessian negative-definite (SOC) | tol renegotiation was a recurring failure; SOC was toggled ad hoc [batch_207] |
| CORNER-EQ | active bound set nonempty; KKT holds — interior components' FOC < tol, bound components' FOC signed INTO the bound | the single costliest misclassification: profit monotone in own reward → floor-railing is a KKT corner, not a bug [live: d8d97766]; "Nash equilibrium at a CORNER … treated as a NON-equilibrium (bug)" [batch_2xx corner cluster] |
| OSCILLATING | iterate recurrence within window w with no residual downtrend | limit cycles burned walltime to SLURM kill [batch_213] |
| STALLED | residual plateau (slope test) + shrinking steps + LM damping saturation (lambda pinned high) | the 0.0745 objective crawl with lambda 100↔1000 is the textbook signature [live: d8d97766] |
| DIVERGED | unbounded iterates/residual (e.g., gradient norms 0.19→2.3e84 [batch_181: klc0401_20260213]) | |
| MULTI-EQ-SUSPECT | ≥2 distinct candidates pass INTERIOR-EQ from different starts | multistart was never run systematically in the logs |
| MC-UNRESOLVED | verdict flips between draw counts (e.g., grinds at 200 draws, converges at 400) | interchange FOC is MC-noisy at 200 draws; even the point estimate needed 400 [live: d8d97766] — draw count belongs in the verdict, not in chat memory |

Thresholds seed from the project's `settings.jl` (SOLVE_TOL, FP_* constants) and change only
via a logged decision.

### Probe library (standing scripts; production solver accessed via one thin adapter, never edited)

| probe | what it checks | discriminates |
|---|---|---|
| foc_surface | 1-D profit and FOC slices per player around the candidate | true stationarity vs flat/ill-conditioned region; finds the "no root to descend to" case directly [live: d8d97766] |
| kkt_corner | one-sided FOC signs at active bounds; complementary slackness | CORNER-EQ vs bound-artifact — the check that would have ended the trial-2 saga on day 1 |
| br_trace | damped best-response path; local BR-slope estimate | |BR′|>1 structural instability vs damping artifact (chooses damped-IBR/tremble as *technique*, not as guess) |
| multistart | coarse start grid → candidate/basin map | no-eq vs bad-start vs MULTI-EQ |
| homotopy | parameter continuation from the nearest WORKING status-board cell | where the equilibrium disappears/bifurcates along the path (trial 1 → trial 2 continuation is exactly the open question in the live saga) |
| conditioning | Jacobian spectrum at candidate | STALLED root cause; rescaling lever before any knob sweep |
| draw_stability | verdict at {half, production, 2×} draws | MC-UNRESOLVED detection [live: d8d97766] |

### Additional hard gates
- **Live-code-path gate.** Any "fix" (env var, constant, penalty) must be demonstrated live by
  a trace line from the actual call path before being recorded — the prior fix wired
  `CF_INTERCHANGE_POLISH_MAXITER` into `solve_constrained_equilibrium_split`, which has no
  live callers on the CF path, and a factually wrong settings.jl comment memorialized it
  [live: d8d97766].
- **Artifact-consistency preflight.** Before diagnosing scenario S on trial T, verify all of
  T's upstream artifacts are same-spec fresh — trial-2 supply was silently stale (Jun 22,
  old block-diagonal spec) under Jul-4 draws [live: d8d97766].
- **Scenario-coverage gate for solver changes.** A solver optimization is validated per
  scenario × path, not on one scenario: `3c8201c` was timed on interchange (1227s→50s) while
  narrow-bank's expanded-(J+1) path was never re-timed, and its regression cost an evening of
  BR-round guessing [live: d8d97766].

**Definition of done.** Every status-board cell is INTERIOR-EQ, user-accepted CORNER-EQ, or
closed by a memo recording a structural conclusion.

---

## Skill 2 — bootstrap_se: inference machinery, estimator adjudication, and the Bayesian-bootstrap adapter

**Evidence base.** Four SE estimators tried serially — block-OPG, joint OPG (gradient blew to
3.6e6), IS-draw R-sweeps, Louis/Oakes — unresolved after 210m [batch_103: 5e22b9d7];
`estimate_standard_errors.jl` rewritten ~10× with per-stage Hessians [batch_084: f12c3ac3]; a
89.9-min bootstrap run exposing a real 9× alpha-SE understatement [batch_07x:
bootstrap_mle_alpha_se]; EM tables shipping "Log-Likelihood NaN" and "---" SE columns
[batch_001/013: 6f6e970a]; "Are you mixing up log and natural space?" [batch_128: 34ced55e];
the user personally catching a delta-method inversion ("4.0x → 1.66x") [batch_2xx SE
cluster]; draw 89's debit_rewards = −2321.6 (z = 9.88) passing a total-surplus-only QA filter
and moving an SE from 228 to 9 [batch_2xx]; launch_jobs.sh silently submitting 20 of 100
[batch_2xx]; a silent bank_id re-index poisoning a 22-trial bootstrap [batch_2xx]; glob
aggregation mixing stale replicates [batch_103].

### Layer A — replicate machinery: what it checks for
1. **Manifest completeness** — trial→seed→output-path→config-hash written before launch;
   aggregation REFUSES any missing, stale (older than manifest), or config-mismatched
   replicate. Fails loudly; never silently drops to B−k. (20/100 silent launch; stale-glob
   mixing.)
2. **Per-parameter QA** — z-scores for every parameter of every replicate against the
   replicate distribution; any |z| > threshold quarantines the draw with a report line. (The
   one-variable filter that let the 10-sigma draw through.)
3. **Stationarity gate** — score/gradient norm at the evaluation point reported and gated
   before any OPG/Hessian-based SE is computed (an OPG at a non-optimum is meaningless — the
   3.6e6 gradient episode). Standard asymptotics reference: Newey & McFadden (1994).
4. **Space registry** — each parameter's storage space (log vs natural) declared once in a
   registry file driving delta-method transforms; SE tables print the space column. (The
   log-space SD misread that flipped a transactor-vs-revolver ranking [batch_112].)
5. **NaN/placeholder gate** — no SE table is emitted containing NaN log-likelihood or "---"
   cells without an explicit `--allow-incomplete` flag naming the reason.
6. **No-glob rule** — aggregation reads only manifest paths, structurally.

### Layer B — estimator adjudication: what it checks for
- **Admissibility per candidate SE method:** stationarity gate passed; covariance PSD; finite
  everywhere; space-consistent. Inadmissible methods are dropped with the gate value logged —
  ending serial relitigation.
- **Calibration:** every admissible method's SEs compared against the Monte-Carlo dispersion
  of the estimator on a small synthetic DGP mirroring the model's structure (phased EM, fixed
  IS draws). CALIBRATED = within tolerance of MC truth. One adjudication table
  (method × admissible × calibrated × SE-ratio-vs-MC); a memo only if nothing calibrates.
  This converts the "EM SEs are smaller than MLE — backwards?" argument [batch_103] into a
  designed experiment a Sonnet-class agent can run, because correctness is delegated to the
  benchmark rather than to judgment.

### Layer C — Bayesian-bootstrap adapter (new): turn an estimator weight-capable

**Idea.** The Bayesian bootstrap (Rubin 1981; econometric treatment Chamberlain & Imbens
2003) replaces resampled datasets with Dirichlet(1,…,1) observation weights: each replicate
re-solves the SAME estimation problem with smooth positive weights. For this codebase that is
the right bootstrap for three reasons grounded in the logs:
1. **No lost support.** Multinomial resampling can drop rare banks/consideration sets
   entirely, changing identification replicate-by-replicate; Dirichlet weights keep every
   observation with positive weight, so the replicate problem stays the same shape as the
   point estimate.
2. **Smoothness → convergence.** Replicates are small perturbations of the weight vector, so
   warm-starting from the point estimate is effective and per-replicate non-convergence (the
   current bootstrap's core failure mode — trial 2's perturbation landing in a hard regime
   [live: d8d97766]) is far less likely at the estimation stage.
3. **Cheap plumbing.** Weights slot into the existing MC-EM without re-simulating IS draws:
   the E-step responsibilities and every M-step objective become weighted sums; the draws
   stay fixed.

**What the adapter checks for / does:**
1. **Weight-injection audit** (thread_change-style site enumeration): every site where
   observations enter an objective — log-likelihood sums, E-step responsibility
   accumulation, M-step weighted regressions, moment averages, survey-moment contributions,
   steady-state weighting — enumerated with file:line and classified before any edit. Output
   is a reviewed inventory, then edits.
2. **Unit-of-weighting check.** Weights attach to the independent sampling unit (the
   consumer), not to consumer×product rows; all rows of consumer i share w_i. A structural
   check verifies the weight vector's length equals the number of unique consumer ids and
   that grouped rows receive identical weights. (The corpus's costliest data bugs were
   exactly unit/id-level mismatches: the bank_id re-index, consumer_id-vs-id schema drift
   [C17].)
3. **Identity gate (hard).** With w_i ≡ 1 the weighted estimator reproduces the unweighted
   point estimate to numerical tolerance (same optimum, same likelihood value). Run before
   any replicate is launched.
4. **Frequency-weight equivalence gate (hard).** For a seeded multinomial count vector, the
   weighted estimator matches the classical resample estimator on the same resample. This
   validates the weighting algebra end-to-end — if these two disagree, the injection is
   wrong somewhere the identity gate can't see.
5. **Normalization/scale check.** Weights normalized to mean 1 (sum n); a scale-invariance
   probe (×2 all weights) verifies estimates are unchanged, catching hidden non-homogeneous
   terms — penalties, ESS thresholds, additive constants — that would silently distort
   replicates. ESS/adaptive-IS thresholds must be checked to depend on weights correctly or
   not at all.
6. **Seeded Dirichlet manifest.** Replicate → Dirichlet seed → weight-vector hash recorded in
   the Layer-A manifest; the aggregation gates then apply unchanged. Gamma(1)/normalization
   implementation with a fixed RNG stream per trial (consistent with the repo's
   trial-seed conventions, `sim_rng_seed_trial = 1 + trial*10000`).
7. **Warm-start policy + convergence budget.** Each replicate starts at the point estimate
   with a bounded iteration budget; replicates exceeding budget are quarantined and counted,
   not silently dropped — and a quarantine rate above a threshold is itself a reported
   finding (it means the objective is fragile in weight-space, which is diagnostic, not
   noise).
8. **Posterior summarization.** SEs as SD (and percentile intervals) over BB draws, with the
   note that BB draws approximate a posterior over the parameter (Rubin 1981) — the SE-table
   emitter and space registry from Layer A apply as-is.
9. **Downstream propagation flag.** BB fixes estimation-stage resampling; counterfactual
   solves per replicate can still hit corners (trial 2's no-interior-Nash is a property of
   that replicate's parameters, not of the resampling scheme). The adapter's report states
   explicitly which stages consume the weights and which consume only the replicate
   parameter vectors — so an eqm_triage campaign is triggered knowingly, not discovered at
   3am [live: d8d97766, "Kill it, do it right"].

**Harness sketch.** A stdlib weighted-MLE toy (e.g., two-type mixture with per-consumer
panels) where (a) the analytic SE is known, (b) the generator can plant each failure the
gates target: a row-level (wrong-unit) weight bug, a non-homogeneous penalty term (scale
check must fire), an integer-weight mismatch (frequency gate must fire), and a degenerate
replicate (QA quarantine must fire). Grade: identity gate exact; frequency gate exact on a
fixed seed; BB SEs within tolerance of analytic/MC truth; every planted bug caught by the
designated gate (negative tests); manifest refuses a deleted replicate.

---

## Skill 3 — julia_triage: crash kit + pre-submit gate

**Evidence base.** rho drifting to 1.003 → PosDefException at iter 98 [batch_04x: 7d24c4db,
f09fd170]; `solve_steady_state_from_q!` mutating Q, FOC residual 9.5 instead of ~0, fixed by
`copy(Q)` after 5 throwaway tests [b064: f9748d4c]; log-vs-natural SD misread [batch_112];
Julia 1.10.2 parallel-GC segfault mitigated by `--gcthreads=1` [batch_130; live: d8d97766];
a SLURM array dead in 20s on a stale column with the user teaching the process — "Why don't
you run locally first" [batch_2xx: C12]; jobs failing with no log from a relative
`--output` [batch_04x: f09fd170].

**What the skill checks for:**
1. **Pre-flight lint (static):** covariance construction without PD jitter/eigenvalue floor;
   drawn parameters missing the floors/clamps their siblings have (LAMBDA_FLOOR-class);
   correlations parameterized without a (−1,1) squash; in-place mutation (`.=`, `!`-function)
   of an argument that is read again in the same scope (the `Q .= Q'` class);
   `Threads.@threads` over `+=` accumulators without `:static`/thread-local buffers;
   log/exp round-trips crossing the space registry (shared with bootstrap_se #4).
2. **Smoke gate (hard, wraps sbatch):** minimum-scale local run (1 consumer / 1 draw / 2
   iterations) through the SAME entry script; validates data schema against the code's
   expected columns, include paths (`@__DIR__` discipline), env vars, output-dir
   writability, and absolute `--output` in the sbatch template. An unsmoked submit fails.
3. **Runtime crash kit:** exception wrapper dumping stacktrace + offending state (draw
   index, eigmin of failing matrix, current parameter vector, iteration) to a crash report;
   SKILL.md maps exception type → checklist → minimal-repro recipe; known environment
   signatures (GC segfault → `--gcthreads=1`) are looked up, not re-diagnosed.
4. **Regression probes:** each diagnosed bug appends a small repro test to a standing suite
   plus a ledger line, so a bug class returning is caught by the suite rather than by the
   user weeks later.

---

## Explicitly not new skills
Scalar/number drift → harden /copyedit number_fix (deterministic Mode B); referee-response
coverage → /revisions; staleness/DAG → /plumber; slides/TikZ → /beamer + /slides; status
pings → Monitor/PushNotification discipline + taskmaster hook config; log_sync HPC detection
bug found in [live: d8d97766] → fix in this repo's log_sync and rsync per CLAUDE.md.

## References
- Rubin, D. B. (1981). "The Bayesian Bootstrap." Annals of Statistics 9(1), 130–134.
- Chamberlain, G., and G. Imbens (2003). "Nonparametric Applications of Bayesian Inference."
  Journal of Business & Economic Statistics 21(1), 12–18.
- Newey, W. K., and D. McFadden (1994). "Large Sample Estimation and Hypothesis Testing."
  Handbook of Econometrics IV, ch. 36. (Stationarity/sandwich conditions behind Layer A #3.)
- Louis, T. A. (1982). "Finding the Observed Information Matrix when Using the EM Algorithm."
  JRSS-B 44(2), 226–233. (Layer B candidate method.)

## Open questions (unchanged from v2)
1. Bless the thin profits/FOC adapter interface to the payments solver (once).
2. Approve the Layer-B calibration DGP design (once).
3. Verdict thresholds seed from settings.jl; changes are logged decisions.
