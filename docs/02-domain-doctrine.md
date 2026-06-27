# 02. Domain Doctrine

## Purpose

Software should model the domain it serves with clear language, entities, relationships,
workflows, permissions, lifecycle states, and invariants.

## Scope

This doctrine covers domain vocabulary, entities, relationships, state machines, permissions,
business rules, workflow transitions, and domain events.

## Rules

- Maintain a domain model for important concepts.
- Use consistent domain language in code, UI, docs, metadata, and tests.
- Document lifecycle states and allowed transitions.
- Define permissions at the domain level before binding them to UI controls.
- Record domain invariants and failure modes.
- Keep business logic out of UI-only paths.

## Quality Gates

- New domain concepts update the domain model.
- State transitions have tests or explicit review evidence.
- Permission-sensitive workflows identify actors and allowed actions.
- UI copy does not introduce domain terms absent from metadata or docs.

## Required Metadata

- `domain-model.json`
- `workflow-map.json`
- permission model notes
- lifecycle state definitions
- domain glossary

## Acceptance Criteria

- A new contributor can learn the main domain concepts without reading all code.
- An agent can map features to entities, workflows, and permissions.
- Tests cover important domain invariants.

## Implementation Hints

- Prefer small entity definitions with fields, relationships, lifecycle states, and invariants.
- Record confidence scores when inferring domain models from existing repositories.
- Tie domain events to workflows and audit requirements where applicable.

## Anti-Patterns

- Hiding business rules in components, templates, or route handlers.
- Using multiple names for the same concept.
- Allowing invalid lifecycle transitions because the UI normally hides them.

## Examples

- An `Invoice` may transition from draft to issued to paid or void, but not from paid back to
  draft without an explicit corrective workflow.
