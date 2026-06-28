# 16. Maturity Model

## Machine-readable rules

Structured rules for this doctrine live in:

`../rules/maturity-model.yml`

## Purpose

The maturity model helps repositories declare their target quality posture and lets agents apply
the Constitution proportionally.

## Scope

This doctrine defines levels for prototype, production, enterprise, and autonomous software.

## Levels

### Level 0: Prototype

The system explores an idea. It may have incomplete metadata, limited tests, and manual
operations. It should still avoid known security and privacy violations.

Expected posture:

- purpose is stated
- core workflows are named
- major risks are visible
- no secrets in source control
- basic setup instructions exist

### Level 1: Production

The system serves real users. It needs reliable workflows, tests, docs, observability, and
operational ownership.

Expected posture:

- product purpose and workflows are documented
- domain model covers core entities
- critical behavior is tested
- deployment and operations docs exist
- security and privacy basics are enforced
- user-visible behavior is documented

### Level 2: Enterprise

The system operates in higher-control environments with stronger governance, compliance,
auditability, and integration expectations.

Expected posture:

- architecture and integration maps are maintained
- permissions and audit logs are explicit
- compliance profiles are documented where applicable
- dependency governance is active
- reporting and operational dashboards are mature
- incident practices are defined

### Level 3: Autonomous

The system is ready for substantial autonomous maintenance under governed constraints.

Expected posture:

- metadata digital twin is current
- quality dashboard is maintained
- agents can generate safe issues from evidence
- AI capabilities are permissioned and auditable
- continuous evolution is bounded and reviewed
- repository can be understood through metadata, docs, tests, and operational evidence

## Rules

- Repositories should declare a current level and target level.
- Agents should not apply higher-level gates unless requested by profile or maturity target.
- Moving levels requires evidence, not aspiration.

## Quality Gates

- Maturity claims map to documented evidence.
- Gaps are tracked when target level exceeds current level.
- Major releases should not lower maturity without explicit governance.

## Required Metadata

- current maturity level
- target maturity level
- maturity gap report
- quality dashboard
- evidence links

## Acceptance Criteria

- Teams can choose proportional standards.
- Agents can prioritize improvements by maturity target.
- Reviewers can challenge unsupported maturity claims.

## Anti-Patterns

- Calling a prototype production-ready because it deploys.
- Applying enterprise gates to experiments without a reason.
- Treating Level 3 as permission for unbounded autonomous changes.
