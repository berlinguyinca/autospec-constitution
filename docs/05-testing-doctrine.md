# 05. Testing Doctrine

## Purpose

Tests should prove behavior at the right level and provide confidence for autonomous and human
changes.

## Scope

This doctrine covers unit, integration, contract, end-to-end, visual, accessibility,
performance, and migration testing.

## Rules

- Test behavior, not implementation details.
- Choose the lowest test level that proves the behavior.
- Cover high-risk workflows with integration or end-to-end tests.
- Use contract tests for external or cross-service assumptions.
- Use visual and accessibility tests for user-facing UI.
- Use migration tests for schema or data transformations.
- Prefer Playwright for web app end-to-end testing unless the repository has another standard.
- Run automated accessibility checks on representative pages and states.
- Capture visual-regression baselines and diff them when UI changes are meaningful.
- Verify keyboard and screen-reader paths for critical workflows.
- Enforce performance budgets for first load and key interactions as gates.
- Automatically generated or refined UI is evaluated on two independent tracks:
  deterministic gates (accessibility, performance budgets, contrast, visual regression,
  interaction/state assertions) and an independent design critique.
- Critic independence, the non-regression ratchet, and deterministic-over-judgment
  precedence for evaluating generated work follow the Review and Critique Doctrine (19).
- Evaluate generated artifacts of any kind (code, UI, analyses, models) with the same loop:
  deterministic gates that block, plus an independent critic scoring a fixed rubric.
- Prefer serial, deterministic test execution where shared state or side effects make
  concurrency unsafe; flakiness is a defect, not noise.

## Quality Gates

- New behavior has tests or a documented reason tests are not practical.
- Bug fixes include regression coverage where possible.
- Critical flows have executable evidence.
- Accessibility-sensitive UI is checked with automated and, where needed, manual evidence.
- Performance-sensitive work defines thresholds.
- Accessibility check results are attached as review evidence.
- Visual-regression diffs are reviewed for meaningful UI changes.
- Performance-budget pass/fail is recorded.
- Critical flows have keyboard-operable end-to-end coverage.
- Generated/refined UI has attached evidence: per-state and per-theme screenshots,
  deterministic gate results, and independent-critic rubric scores.
- Evidence exists for each meaningful state/case, not just the happy path.
- Critic scores and deterministic gate results are recorded as evidence; acceptance follows
  the Review and Critique Doctrine's non-regression gates (19).

## Required Metadata

- test strategy summary
- quality dashboard
- critical workflow list
- coverage and known gaps
- flaky test register

## Acceptance Criteria

- A reviewer can see what behavior is protected.
- Agents can choose appropriate test types for future changes.
- Known test gaps are explicit.

## Implementation Hints

- Use the test pyramid as a guide:

```text
unit
integration
contract
e2e
visual
accessibility
performance
migration
```

- Avoid asserting private implementation details unless no public behavior exists.
- Keep end-to-end tests focused on user-critical paths.

## Anti-Patterns

- Replacing unit tests with broad brittle end-to-end tests.
- Claiming manual verification without recording what was checked.
- Ignoring flaky tests until agents stop trusting the suite.

## Examples

- A checkout workflow may need unit tests for pricing rules, integration tests for order
  creation, contract tests for payment provider assumptions, and Playwright coverage for the
  primary user path.
