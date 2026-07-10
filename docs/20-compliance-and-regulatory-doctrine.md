# 20. Compliance and Regulatory Doctrine

## Purpose

Ensure that software meets its regulatory and licensing obligations by design and produces the
evidence needed to demonstrate it.

## Scope

Systems subject to privacy law (e.g. GDPR, CCPA, HIPAA), data-residency or retention
obligations, consent requirements, or open-source license obligations.

## Rules

- Maintain an obligations register mapping each applicable regulation to a requirement, a
  control that satisfies it, and the evidence that proves it (the compliance analog of a chart
  of accounts).
- Apply privacy by design: data minimization and purpose limitation are reviewed before a new
  data flow launches.
- Enforce data residency and retention in code and configuration, not only in policy documents.
- Support data-subject rights (access, erasure, portability) for regulated personal data.
- Comply with open-source licenses: maintain an SBOM and a license policy; do not ship
  disallowed licenses.
- Produce an auditable evidence bundle suitable for external attestation.

## Quality Gates

- Applicable obligations are registered and mapped to controls and evidence.
- New data flows pass a privacy-by-design review; residency and retention are enforced in code.
- Data-subject rights are supported for regulated PII.
- The license gate passes (SBOM present, no disallowed licenses).
- An audit-ready evidence bundle is produced for regulated changes.

## Required Metadata

- Obligations register (regulation -> requirement -> control -> evidence).
- Data classification, residency, and retention configuration.
- SBOM and license policy.
- Consent and data-subject-request records where applicable.

## Acceptance Criteria

- A reviewer or auditor can trace any obligation to the control that satisfies it and the
  evidence that proves it.
- Regulated data flows cannot launch without a recorded privacy review.

## Implementation Hints

- Reuse the evidence-bundle pattern from the Financial Integrity Doctrine; treat compliance
  evidence like an audit workpaper.
- Enforce residency/retention and license policy as deterministic gates, not manual checklists.

## Anti-Patterns

- Compliance as documentation with no enforced controls.
- Retention or residency promised in policy but not enforced in code.
- Shipping dependencies without a license check.
- No evidence trail for regulated changes.

## Examples

- A feature that stores personal data launches only after a privacy-by-design review is
  recorded, residency and retention are enforced in configuration, the erasure workflow is
  wired and tested, the license gate passes, and the obligations register links each
  requirement to its control and evidence.
