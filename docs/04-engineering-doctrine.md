# 04. Engineering Doctrine

## Purpose

Engineering work should be maintainable, standardized, modernized deliberately, and delivered in
small reviewable changes.

## Scope

This doctrine covers design patterns, library standardization, dependency governance,
maintainability, modernization, code review shape, and refactoring discipline.

## Rules

- Reuse existing utilities, conventions, and framework patterns before adding new abstractions.
- Use established design patterns appropriately.
- Keep changes small, focused, and reversible where practical.
- Standardize libraries for common responsibilities.
- Govern dependencies by maintenance, license, security, and ecosystem fit.
- Modernize deliberately with tests and migration notes.
- Prefer deletion and simplification over new layers.
- Express quality as a machine-readable gate registry: every check is deterministic-and-blocking,
  independent-critique, or human-review, and each rule has a single canonical home.
- Review of generated or refactored work — independence, no self-certification, and the
  non-regression ratchet — is governed by the Review and Critique Doctrine (19).

## Quality Gates

- New dependencies include rationale and alternatives considered.
- Refactors preserve behavior with tests or explicit verification evidence.
- Large changes are split into reviewable units.
- Shared abstractions have more than speculative reuse.
- The Review and Critique Doctrine's gates (19) apply: an independent approver for
  high-stakes changes and no gate (tests, coverage, performance, lint, type-check)
  regression versus the base revision.
- Critical logic is hardened by mutation or property tests, not only example tests.

## Required Metadata

- `technology-registry.yml`
- dependency policy notes
- modernization backlog
- feature ledger references
- quality dashboard entries

## Acceptance Criteria

- A reviewer can understand why a pattern or dependency was chosen.
- Maintenance risk is visible.
- Code changes do not mix unrelated cleanup with product behavior unless justified.

## Implementation Hints

- Maintain a technology registry with owner, purpose, version, replacement policy, and risk.
- Record deprecations and migration paths.
- Prefer repository-native linters, formatters, and test tools.

## Anti-Patterns

- Adding a package for a small problem already solved in the codebase.
- Rewriting a subsystem without first locking behavior.
- Creating abstractions before there are real repeated needs.

## Examples

- A repository standardizes on one date library and records why alternatives are not used.
