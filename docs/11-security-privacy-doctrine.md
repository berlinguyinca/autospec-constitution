# 11. Security And Privacy Doctrine

## Machine-readable rules

Structured rules for this doctrine live in:

`../rules/security-privacy.yml`

## Purpose

Security and privacy should be preserved by default through explicit permissions, threat
modeling, auditability, secret handling, and data lifecycle controls.

## Scope

This doctrine covers threat modeling, permissioning, secret references, audit logs, PII handling,
retention and deletion policies, dependency audits, compliance profiles, and AI data access.

## Rules

- Identify sensitive data and protected workflows.
- Use permission checks at trusted boundaries, not only in UI controls.
- Reference secrets through approved secret stores or environment mechanisms.
- Maintain audit logs for sensitive actions.
- Define PII handling, retention, deletion, and export behavior.
- Review dependencies for security, license, and maintenance risk.
- Apply compliance profiles where applicable.

## Quality Gates

- Sensitive features include threat-model notes.
- Permission changes include tests or review evidence.
- Secrets are not committed to source control.
- Audit log requirements are documented for high-risk workflows.
- Dependency audit results are reviewed for release-impacting issues.

## Required Metadata

- security posture summary
- permission map
- secret reference inventory
- audit event catalog
- PII inventory
- retention and deletion policy
- dependency audit summary

## Acceptance Criteria

- Reviewers can identify sensitive data and protected operations.
- Agents can reason about access boundaries before changing behavior.
- Privacy obligations are visible and testable where possible.

## Implementation Hints

- Model permissions in domain terms before UI terms.
- Store only necessary sensitive data.
- Redact secrets and personal data from logs, prompts, traces, and exports.

## Anti-Patterns

- Treating hidden UI controls as authorization.
- Sending unrestricted data to AI providers without policy review.
- Logging secrets, tokens, prompts with sensitive data, or unredacted PII.

## Examples

- An AI report generator checks reporting permission, redacts PII fields by default, records the
  export event, and follows retention policy for generated PDFs.
