# 01. Product Doctrine

## Purpose

Product work must connect every feature, workflow, and improvement to the product mission and
the people it serves.

## Scope

This doctrine covers mission, users, personas, workflows, non-goals, success metrics, product
risks, and feature justification.

## Rules

- Define the product mission in plain language.
- Identify primary users, secondary users, and affected stakeholders.
- Maintain personas or user archetypes when they clarify behavior.
- Document core workflows and user-visible outcomes.
- Record non-goals so agents do not expand scope accidentally.
- Define success metrics for significant features.
- Require every feature to justify itself against the mission.

## Quality Gates

- Feature issues explain the user, workflow, and intended outcome.
- Pull requests that change product behavior update user-facing docs or product metadata.
- Metrics are purposeful and tied to decisions, not collected by default.
- Non-goals are checked before broadening scope.

## Required Metadata

- `product-purpose.md`
- feature ledger entries
- user/persona notes
- workflow map
- success metric definitions

## Acceptance Criteria

- A reviewer can explain why a feature exists.
- A future agent can distinguish product goals from implementation tasks.
- The repository records what the product deliberately does not do.

## Implementation Hints

- Start with one concise product purpose document.
- Keep workflows concrete: trigger, actor, steps, output, failure states.
- Use feature ledger status values such as proposed, active, deprecated, and removed.

## Anti-Patterns

- Adding features because they are technically easy.
- Treating internal implementation work as product value without explaining the user impact.
- Expanding scope by implication.

## Examples

- Good: "Export monthly cost reports so finance reviewers can reconcile AI spend."
- Weak: "Add reporting because dashboards are useful."
