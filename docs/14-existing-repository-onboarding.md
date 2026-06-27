# 14. Existing Repository Onboarding Doctrine

## Purpose

Autospec should onboard established repositories by understanding them first, using evidence and
confidence scores before proposing behavior changes.

## Scope

This doctrine covers repository discovery, metadata inference, confidence scoring, first pull
request shape, gap reporting, and safe adoption of the Constitution.

## Rules

- Inspect existing code, docs, tests, configuration, CI, deployment files, and issue history when
  available.
- Infer metadata from evidence rather than assumptions.
- Record confidence scores for inferred facts.
- Make the first pull request metadata-only unless the user explicitly requests otherwise.
- Separate observed behavior from recommended improvements.
- Avoid changing runtime behavior during onboarding.

## Quality Gates

- Onboarding reports list evidence sources and confidence.
- First PR creates or updates metadata without behavior changes.
- Unknowns are tracked as gaps, not guessed into compliance.
- High-risk findings become issues with severity and remediation guidance.

## Required Metadata

- onboarding report
- inferred product purpose
- technology registry
- feature ledger
- domain model
- workflow map
- architecture map
- quality dashboard

## Acceptance Criteria

- Maintainers can review the inferred repository model before agents act on it.
- Agents have a trusted starting point for future work.
- Behavior remains unchanged during initial onboarding.

## Implementation Hints

- Use source evidence, tests, docs, CI configuration, and runtime screenshots where available.
- Label inferred facts with confidence and evidence.
- Prefer small metadata PRs that are easy to correct.

## Anti-Patterns

- Starting with refactors before understanding the repository.
- Presenting inferred architecture as certain.
- Mixing metadata generation with opportunistic code cleanup.

## Examples

- First PR: add product purpose, technology registry, inferred domain model, workflow map, and
  quality dashboard with confidence scores. Second PRs can address the highest-priority gaps.
