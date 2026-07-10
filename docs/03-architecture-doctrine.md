# 03. Architecture Doctrine

## Purpose

Architecture should make system boundaries, dependencies, integrations, deployment shape, and
change impact visible before implementation.

## Scope

This doctrine covers ADRs, diagrams, dependency boundaries, integration maps, deployment maps,
data flows, ownership boundaries, and impact analysis.

## Rules

- Record meaningful architectural decisions in ADRs.
- Maintain diagrams for important runtime, deployment, and integration relationships.
- Define module and service boundaries.
- Document external integrations and data flows.
- Analyze impact before cross-boundary changes.
- Prefer simple, established patterns over clever custom structures.
- Treat module and service boundaries, shared contracts, and the error taxonomy as canonical
  vocabulary: defined once and referenced, never redefined locally.
- Prefer the simplest structure that meets the requirement; resist speculative layers and
  generated boilerplate that add indirection without reuse.
- A change stays within its boundary; crossing one is a deliberate, recorded decision.

## Quality Gates

- Significant architectural changes include an ADR or update an existing one.
- New integrations appear in the integration map.
- Deployment-affecting changes update deployment documentation.
- Cross-boundary changes identify affected owners, tests, and rollback concerns.
- Cross-boundary changes are justified by an ADR.
- Structure is reviewed for simplicity; over-engineering is a rejectable finding, judged
  independently of the author.

## Required Metadata

- `architecture-map.json`
- ADR index
- dependency map
- integration map
- deployment map
- data-flow notes

## Acceptance Criteria

- A reviewer can identify what boundary a change touches.
- A future agent can find the relevant integration and deployment context.
- Architecture decisions include rationale and rejected alternatives.

## Implementation Hints

- Keep ADRs short: context, decision, consequences, alternatives.
- Use diagrams that can be regenerated or edited easily.
- Prefer boundaries that match domain and operational ownership.

## Anti-Patterns

- Introducing new layers without reducing real complexity.
- Allowing shared utilities to become hidden domain services.
- Changing deployment behavior without updating operational docs.

## Examples

- Adding a payment provider requires an integration map update, secret handling notes, retry and
  failure behavior, and tests for provider contract assumptions.
