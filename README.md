# Autospec Constitution

Autospec Constitution is the versioned engineering policy layer for the Autospec ecosystem.
It defines what good software should look like before any agent writes code, opens a pull
request, or evaluates a repository.

Autospec is the engine. Autospec Constitution is the law. Future Autospec Baselines are the
playbooks that adapt this law to specific stacks, domains, and maturity targets.

This repository contains Markdown doctrine, governance rules, and lightweight schemas. It does
not contain scanner code, agent supervisors, MCP servers, profile loaders, or execution logic.

## Relationship To Autospec

`berlinguyinca/autospec` is responsible for reading policies, interpreting them, planning work,
generating metadata, creating issues, running checks, and implementing changes.

`berlinguyinca/autospec-constitution` is responsible for defining durable expectations:
principles, doctrine, quality gates, metadata requirements, maturity levels, and amendment rules.

Keeping these repositories separate allows the policy to evolve deliberately without coupling it
to one implementation strategy. Autospec can improve its execution engine while repositories keep
pinning to a stable Constitution version.

## Relationship To Autospec Baselines

Future `autospec-baselines` packages should provide practical playbooks for particular project
types, such as web applications, AI platforms, analytics systems, internal tools, or enterprise
services.

Baselines should not redefine the Constitution. They should compose it:

- select applicable doctrines
- add stack-specific defaults
- define preferred tools and libraries
- provide starter metadata
- define profile-specific gates

The Constitution remains the source of cross-project engineering law.

## Pinning A Constitution Version

Repositories should pin to an explicit Constitution version so automated agents and human
reviewers evaluate the project against the same standard.

Example:

```yaml
constitution:
  source: github
  repository: berlinguyinca/autospec-constitution
  version: 0.6.0

profiles:
  - web
  - ai-platform
  - analytics
```

Pinned repositories should record the version in their repo metadata and update it through a
normal review process. Constitution upgrades should produce visible diffs: changed doctrine,
new or changed gates, metadata migrations, and any new compliance expectations.

## Why Policy And Engine Are Separate

Policy should be stable, reviewable, and readable by humans. Engine logic should be executable,
testable, and replaceable.

This separation prevents three failure modes:

- policy hidden inside implementation code
- automation changing quality bars without governance
- one engine release forcing unrelated doctrine changes

Autospec should be able to ask, "What standard applies?" before deciding, "How do I enforce it?"

## Repository Map

- [VISION.md](VISION.md) explains the long-term direction.
- [CONSTITUTION.md](CONSTITUTION.md) defines the governing principles.
- [docs/](docs/) contains doctrine chapters and maturity guidance.
- [schemas/](schemas/) contains starter schemas for future machine-readable policy.
- [CHANGELOG.md](CHANGELOG.md) records versioned policy changes.

## Current Status

Version `0.6.0` extends the initial policy draft (`0.1.0`) with design, UX, accessibility,
analytics-honesty, operations, embedded-assistant, security, testing, and onboarding
enrichments (`0.4.0`); the domain-independent quality method, the Financial Integrity
doctrine, and the stakes-proportional verification principle (`0.5.0`); and the Review &
Critique and Compliance & Regulatory doctrines with API/data-contract, migration-safety,
release-engineering, and cost enrichments (`0.6.0`). It remains intentionally lightweight
and policy-only.
Future versions should add examples, stricter schemas, profile composition, and evidence catalogs
without embedding Autospec engine behavior in this repository.
