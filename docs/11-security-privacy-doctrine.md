# 11. Security And Privacy Doctrine

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
- Default consent and cookie choices to the most privacy-preserving option.
- Never place personal or sensitive data in URLs or query strings.
- Strip image metadata (EXIF, including GPS) from user-supplied media before storage
  or forwarding.
- Never log secrets, tokens, or personal data; set retention limits and access
  controls on logs.
- Obtain consent before sending user data to third-party services, including hosted
  model providers.
- Serve a restrictive Content Security Policy that disallows inline and eval'd scripts
  (nonce or hash based).
- Serve baseline security headers: HSTS, `X-Content-Type-Options: nosniff`, a strict
  `Referrer-Policy`, and a `Permissions-Policy` restricting powerful features.
- Apply Subresource Integrity to third-party scripts and styles.
- Scan dependencies automatically, pin/lock them, produce an SBOM, and ship no
  known-critical vulnerabilities.
- Anchor the security posture to an external standard (OWASP ASVS / Top 10).

## Quality Gates

- Sensitive features include threat-model notes.
- Permission changes include tests or review evidence.
- Secrets are not committed to source control.
- Audit log requirements are documented for high-risk workflows.
- Dependency audit results are reviewed for release-impacting issues.
- Consent defaults to minimal collection; non-essential tracking is opt-in.
- Logs are scrubbed of secrets and personal data and are retention-bounded.
- User-supplied media has metadata stripped.
- No personal data appears in query strings; third-party data egress is consented and
  documented.
- A restrictive CSP and the baseline security headers are present on responses.
- Third-party resources carry integrity attributes.
- Dependency and supply-chain scans pass with no known-critical findings.

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
