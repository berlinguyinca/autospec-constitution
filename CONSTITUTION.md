# Autospec Constitution

Version: 0.5.0

This Constitution defines the engineering policy that Autospec-compatible systems should read,
interpret, enforce, and evolve. It contains no implementation logic. It defines principles,
doctrines, quality expectations, metadata requirements, and governance rules.

## 1. Constitutional Principles

Autospec-governed work must follow these principles:

- Understand before changing.
- Prefer simplicity over cleverness.
- Reuse existing capabilities.
- Keep business logic out of UI-only paths.
- Test behavior, not implementation details.
- Document user-visible behavior.
- Make systems observable and diagnosable.
- Use established design patterns appropriately.
- Preserve security and privacy by default.
- Make AI capabilities permissioned, auditable, and explainable.
- Keep metadata synchronized with implementation.
- Improve continuously but in bounded, reviewable steps.

## 2. Doctrine List

The Constitution is composed of doctrine chapters:

1. Product Doctrine
2. Domain Doctrine
3. Architecture Doctrine
4. Engineering Doctrine
5. Testing Doctrine
6. UI/UX Doctrine
7. AI Platform Doctrine
8. Natural Language Application Interface Doctrine
9. Documentation Doctrine
10. Analytics, Reporting, and Visualization Doctrine
11. Security and Privacy Doctrine
12. Operations and Diagnostics Doctrine
13. Metadata and Digital Twin Doctrine
14. Existing Repository Onboarding Doctrine
15. Continuous Evolution Doctrine
16. Maturity Model
17. Governance and Versioning
18. Financial Integrity Doctrine

Each doctrine should define purpose, scope, rules, quality gates, required metadata, acceptance
criteria, implementation hints, anti-patterns, and examples.

## 3. Required Quality Posture

Autospec should treat quality as a system property, not a final checklist. Changes should be:

- mission-aligned
- domain-aware
- architecturally bounded
- small enough to review
- covered by appropriate tests
- documented where user-visible
- observable in production
- reversible when practical
- evaluated against security and privacy expectations

Quality gates should require evidence. A claim such as "tested", "accessible", "secure", or
"documented" is incomplete unless the repository records what was checked and what passed.

## 4. Metadata-First Development

Repositories should maintain machine-readable and human-readable metadata describing:

- product purpose
- technology choices
- feature inventory
- domain model
- workflows
- architecture
- knowledge graph
- API surface
- UI surface
- AI capabilities
- MCP integrations
- quality status

New repositories should generate metadata early. Existing repositories should begin with an
evidence-based metadata inference pull request before behavior changes.

Metadata must stay synchronized with implementation. When a feature, workflow, API, screen,
agent, model provider, or operational boundary changes, the matching metadata should change with
it.

## 5. Human-First Output

Autospec output should be useful to humans first and machines second. Agents should prefer:

- clear prose
- rendered tables
- diagrams
- screenshots
- reports
- dashboards
- links to evidence
- concise summaries with explicit uncertainty

Raw JSON, logs, stack traces, and schemas should be exposed when requested or needed for
diagnosis, but they should not be the default user-facing format.

## 6. AI Platform Expectations

AI functionality must be treated as a reusable platform capability, not a one-off chatbot.
Autospec-compatible AI systems should support:

- OpenAI-compatible APIs
- local model providers such as Ollama where appropriate
- agents
- tools
- memory
- MCP servers
- RAG
- token tracking
- cost tracking
- provider settings
- AI admin pages
- usage dashboards

AI capabilities must be permissioned, auditable, explainable, and observable. The repository
should record what models, tools, data sources, and permissions are available.

## 7. Safety And Governance

Autospec-governed changes should preserve security, privacy, and operational stability by
default. Sensitive operations require explicit permission boundaries, audit logs, and rollback
paths. Agents should not broaden access, retain personal data, expose secrets, or execute
high-risk workflows without documented authority.

Governance should distinguish:

- policy changes in this repository
- baseline changes in future baseline repositories
- engine changes in Autospec
- application changes in governed repositories

Policy should not be silently changed by engine implementation work.

**Stakes-proportional verification and independence.** The confidence required of a check
should scale with the stakes of the change, and so should the independence of whoever signs
off. As consequences grow (money, safety, irreversible or production-affecting actions,
security boundaries, model promotion), quality assurance shifts away from model judgment toward
deterministic, provable checks plus independent human review. The actor (human or agent) that
produces a high-stakes change must never be the sole approver of it. This is one principle with
domain-specific names: segregation of duties in financial work, independent held-out evaluation
and model governance in machine learning, and independent approval for security-sensitive or
irreversible operations. Domain baselines encode the concrete form; the engine records who
verified what, and never lets a generator self-certify high-stakes work.

Cross-reference: the shared generate/evaluate/refine method, its independent-critic and
non-regression requirements, and the per-domain gate registries are described in the baselines
repository's quality-method document; doctrines compose that method rather than restating it.

## 8. Versioning

This repository uses semantic versioning for policy releases:

- patch versions clarify language without changing expected behavior
- minor versions add doctrines, gates, metadata fields, or maturity expectations in compatible ways
- major versions change constitutional expectations in ways that may require repository migration

Repositories should pin a specific version and update intentionally.

## 9. Amendments

Amendments should be proposed through normal review. A proposal should include:

- the doctrine or principle being changed
- the reason for the change
- expected impact on existing repositories
- migration guidance when needed
- examples of compliant and non-compliant behavior
- whether the change is patch, minor, or major

Amendments should be small enough to review and should preserve the separation between policy
and execution engine.
