# 15. Continuous Evolution Doctrine

## Machine-readable rules

Structured rules for this doctrine live in:

`../rules/continuous-evolution.yml`

## Purpose

Autospec should continuously discover improvement opportunities, score them, file issues, and
implement small reviewable pull requests.

## Scope

This doctrine covers improvement discovery, scoring, issue generation, prioritization, bounded
implementation, review, and learning loops.

## Rules

- Continuously look for gaps in quality, documentation, tests, metadata, operations, security,
  and user experience.
- Score opportunities by impact, risk, confidence, effort, and maturity alignment.
- File issues before significant autonomous implementation.
- Implement changes in small reviewable pull requests.
- Preserve existing behavior unless the issue explicitly changes it.
- Update metadata and docs with relevant changes.

## Quality Gates

- Improvement issues include evidence, expected benefit, risk, and acceptance criteria.
- Pull requests are scoped to a coherent change.
- Verification evidence is attached or summarized.
- Follow-up issues are created for deferred risks.

## Required Metadata

- improvement backlog
- quality dashboard
- maturity score history
- issue-to-doctrine mapping
- verification evidence index

## Acceptance Criteria

- Continuous improvement remains governable.
- Maintainers can see why work was proposed and how it was verified.
- Agents avoid broad unreviewable rewrites.

## Implementation Hints

- Prefer recurring sweeps that produce ranked findings.
- Use doctrine ids in issue labels or descriptions.
- Keep improvement PRs independent when possible.

## Anti-Patterns

- Opening large "fix everything" pull requests.
- Repeating the same recommendations without learning from accepted and rejected work.
- Optimizing for metric movement without product or user value.

## Examples

- A weekly sweep finds missing Playwright coverage for a critical workflow, files an issue with
  evidence, and later implements one focused test PR.
