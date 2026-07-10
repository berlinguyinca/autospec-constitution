# 19. Review and Critique Doctrine

## Purpose

Define how work is judged, so evaluation is independent, calibrated, non-regressive, and
actionable — for code, designs, analyses, models, and documents alike.

## Scope

Any acceptance decision on generated or authored work: automated gates, model critique, and
human review.

## Rules

- The reviewer or critic is independent of the producer for any high-stakes change; the actor
  that made the work never single-handedly accepts it.
- Critique against a fixed standard (a rubric, the applicable gates), not against personal
  taste; the goal is to judge the work, not to rewrite it into the reviewer's own version.
- A model critic is given only the artifact, its brief, and the rubric — never its own prior
  output to grade, and never authority to approve high-stakes work alone.
- Enforce the non-regression ratchet at review: never accept a change that lowered any
  deterministic gate or rubric score relative to the base.
- Findings are specific, tied to a named rule or rubric dimension, and actionable.
- Deterministic evidence outranks judgment; when a gate and an opinion disagree, the gate wins.

## Quality Gates

- High-stakes acceptance records an approver distinct from the producer.
- Every rubric dimension is scored; the deterministic gates and scores are recorded as evidence.
- No accepted change regresses a gate or rubric score versus the base.
- Review findings cite specific rules and propose concrete fixes.

## Required Metadata

- The rubric and gate registry used for the decision.
- Reviewer/critic identity and independence relative to the producer.
- Recorded scores, gate results, and findings.

## Acceptance Criteria

- A third party can see what standard the work was judged against, who judged it, and why it
  passed or failed.
- No high-stakes work was self-certified.

## Implementation Hints

- Wire the independent critic and non-regression check into the generate/evaluate/refine loop
  described in the baselines quality-method document; do not let the generator grade itself.
- Store the evidence bundle (scores, gate results, findings) alongside the change.

## Anti-Patterns

- The producer approving its own high-stakes change.
- A model grading its own output.
- Rewriting to taste instead of critiquing against the standard.
- Accepting a change that regressed a gate because other things improved.
- Scores with no actionable findings; nitpicking without rule anchors.

## Examples

- A generated service change is accepted only after the deterministic gates pass, an
  independent critic scores every rubric dimension with no regression versus the base, and the
  findings — each tied to a specific rule — are resolved; the scores and gate results are stored
  with the pull request as evidence.
