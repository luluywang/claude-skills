# Troubleshooting

Common failure modes for the prove-loop and how to diagnose them.

- **Loop hit `max_iterations` with issues still flagged.** Look at
  `issues_history`. If monotonically decreasing, the rubric is reasonable
  but 5 iterations was too few — rerun with `max=8`. If bouncing, the
  critic and actor likely disagree about what the theorem says; check that
  the statement in `state.json#goal` is what you intended.

- **Critic says "the proof establishes a corollary, not the theorem."**
  Either the actor weakened the conclusion (rerun with stricter persona),
  or the statement was actually too ambitious for the assumption set
  (revisit and add an assumption).

- **Critic flags the same envelope issue every iteration.** The actor
  probably cannot verify the integrability condition because the model
  setting genuinely doesn't satisfy it. Treat this as a result: the
  envelope theorem doesn't apply here; switch to a direct argument.

- **Generous mentor never flags anything substantive.** By design.
  Switch to `math-strict referee` or `hostile theorist` for real grading.

- **Actor declines flags repeatedly.** Read the trailing `<!-- declined -->`
  comment in `current/iter_N/text.tex`. Persistent declines usually mean
  the critic is misreading the statement; rephrase the statement (running
  `/prove-loop reset` and starting over with a sharpened statement is
  often faster than arguing with the loop).
