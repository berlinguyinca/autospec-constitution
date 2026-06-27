# 17. Governance And Versioning

## Purpose

Governance keeps constitutional changes deliberate, reviewable, versioned, and separate from
Autospec engine implementation.

## Scope

This doctrine covers semantic versioning, amendments, review expectations, release notes,
deprecation, migration guidance, and policy ownership.

## Rules

- Version policy with semantic versioning.
- Propose amendments through reviewed changes.
- Explain impact on existing repositories.
- Provide migration guidance for breaking or material changes.
- Record doctrine changes in the changelog.
- Keep engine logic out of policy documents and schemas.

## Version Semantics

- Patch: clarification, typo fixes, examples, non-normative wording.
- Minor: new compatible doctrines, fields, metadata expectations, or gates.
- Major: changed expectations that may require repository migration.

## Quality Gates

- Releases include changelog entries.
- Material policy changes identify affected doctrines.
- Breaking changes include migration notes.
- Amendment proposals distinguish policy from implementation.

## Required Metadata

- version number
- release date
- doctrine ids changed
- migration notes when applicable
- amendment rationale

## Acceptance Criteria

- A governed repository can decide whether to upgrade.
- Reviewers understand whether a change is normative.
- Future agents can compare Constitution versions.

## Implementation Hints

- Keep release notes concise but explicit.
- Prefer additive compatible changes until real usage proves stricter policy is needed.
- Use examples to clarify doctrine without over-constraining engines.

## Anti-Patterns

- Shipping policy changes inside engine releases only.
- Making broad doctrine changes without migration guidance.
- Treating schemas as the sole source of policy meaning.

## Examples

- Adding a new optional profile field is a minor change. Requiring all repositories to add that
  field before compliance is a major change unless a migration window is defined.
