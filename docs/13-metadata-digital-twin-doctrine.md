# 13. Metadata And Digital Twin Doctrine

## Purpose

Repositories should maintain metadata that forms a practical digital twin of the product,
domain, architecture, surfaces, AI capabilities, and quality posture.

## Scope

This doctrine covers metadata files for new and existing repositories, confidence scores,
evidence links, synchronization rules, and digital twin evolution.

## Rules

- Generate metadata for new repositories early.
- Infer metadata for existing repositories from evidence and confidence scores.
- Keep metadata synchronized with implementation changes.
- Link metadata claims to source evidence where practical.
- Treat the digital twin as an aid to reasoning, not a replacement for code review.

## Quality Gates

- Required metadata files exist or missing files are tracked as gaps.
- Metadata updates accompany relevant product, API, UI, AI, workflow, or architecture changes.
- Inferred metadata records confidence and evidence.
- Quality dashboards summarize known risks and maturity gaps.

## Required Metadata

```text
product-purpose.md
technology-registry.yml
feature-ledger.json
domain-model.json
workflow-map.json
architecture-map.json
knowledge-graph.json
api-surface.json
ui-surface.json
ai-capabilities.json
mcp-registry.json
quality-dashboard.json
```

## Acceptance Criteria

- A future agent can understand the repository without starting from raw source search alone.
- Humans can review and correct the system model.
- Metadata drift is visible.

## Implementation Hints

- Use confidence values for inferred metadata: low, medium, high.
- Include source paths and line references where possible.
- Keep schemas lightweight until engine needs justify stricter validation.

## Anti-Patterns

- Treating stale metadata as authoritative.
- Generating large opaque metadata that humans cannot review.
- Changing behavior before establishing baseline metadata in an existing repository.

## Examples

- An onboarding PR adds `domain-model.json` with entities inferred from database tables and
  service names, each tagged with source evidence and confidence.
