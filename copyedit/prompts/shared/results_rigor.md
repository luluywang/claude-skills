# Results Rigor (rewrite and task_edit)

Applies when the target paragraph reports results, estimates, or model findings and the supporting material (tables, macro values, neighboring paragraphs, the model section) is available. Read the material before editing.

Validated 2026-10 on mined AI-draft -> Lulu-revision pairs (writing-evals, rigor checklists): out of sample, these rules doubled the rate at which unsupported claims were cut (0.22 -> 0.49), with no loss of kept content and no voice cost in blind A/B. Rules for cutting out-of-place material, adding mechanisms, and a readability guard were tested and dropped (no effect, or the mechanism rule added unrequested derivations).

## Claim only what the material shows

Check every claim against the material (tables, macro values, the model brief, neighboring paragraphs). Delete, rather than soften, claims the material does not establish:
- superlatives and uniqueness claims ("the key ingredient", "the one force", "the cleanest", "the most sensitive");
- importance comparisons with other policies, papers, or channels;
- mechanisms offered to explain a result that the material does not show;
- generalizations beyond the sample, sector, or specification estimated;
- blanket robustness claims, and readings of a parameter that do not follow from how the model defines it.
If a claim is supported only by a stated assumption, keep it and say what it rests on.

## Calibrate and name precisely

- Attribute an effect to exactly what changed. If a shock moved several things (e.g., a policy that moved several margins at once), do not credit one of them alone.
- When an estimate rests on an identifying assumption, say which assumption, and present supporting evidence as support rather than as the source.
- Do not hedge what the material supports. Drop "largely", "I infer", "suggests" when the result is a direct model output or a direct reading of the data.
- Name things exactly: the specific estimate a parameter is matched to, the specific source of error, the specific specification a caveat applies to, and the model's own names for its components.
- Keep a result's scope: say which substitution, which population, which specification.

These rules override "Preserve: the argument's claims" for claims the material does not support: delete those rather than preserve them.
