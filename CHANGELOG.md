# Changelog

## 0.6.0 - 2026-07-10

- Added the Review and Critique Doctrine (docs/19): independent, rubric-anchored evaluation
  with the non-regression ratchet, actionable rule-tied findings, and no self-certification of
  high-stakes work — formalizing the stakes-proportional verification principle.
- Added the Compliance and Regulatory Doctrine (docs/20): obligations register, privacy by
  design, residency/retention enforced in code, data-subject rights, license/SBOM gates, and
  audit-ready evidence bundles.
- Enriched the architecture doctrine with API-as-product contracts (machine-readable specs,
  breaking-change detection), data-pipeline contracts, and expand/contract migration rules.
- Enriched the operations doctrine with deploy/release decoupling (progressive rollout,
  removable flags, rollback triggers), migration-compatible deploy gates, signed artifacts
  with provenance, and cost-as-operational-signal rules and gates.
- No breaking changes; all additions are backward compatible.

## 0.5.0 - 2026-07-09

- Added the Financial Integrity Doctrine (docs/18): canonical chart-of-accounts vocabulary,
  the accounting identity, segregation of duties, immutable audit trails, deterministic
  reproducibility, and materiality-based human review.
- Added the stakes-proportional verification and independence principle to CONSTITUTION.md
  paragraph 7, with a cross-reference to the baselines quality-method document.
- Enriched the architecture doctrine with canonical-vocabulary boundaries, simplicity-first
  structure, and cross-boundary ADR gates.
- Enriched the engineering doctrine with the machine-readable gate registry, independent
  review of generated code, and monotonic (non-regressing) improvement gates.
- Generalized the testing doctrine's evaluation loop to all generated artifacts with an
  independent critic and no self-grading.
- Enriched the AI platform doctrine with versioned feature/dataset vocabulary, independent
  model evaluation, fairness/calibration reporting, and non-regression promotion gates.
- Added tested-documentation rules and gates to the documentation doctrine.
- Added semantic-layer single-source-of-truth, statistical honesty, and independent
  methodology-review rules to the analytics doctrine.
- Added threat-model-before-build, ASVS mapping, and independent-approver rules to the
  security/privacy doctrine.
- Added runbook-with-rollback and production-signal-feedback rules and SLO/status-signal
  gates to the operations doctrine.
- No breaking changes; all additions are backward compatible.

## 0.4.0 - 2026-07-09

- Enriched the UI/UX doctrine with token architecture, theming, the interruption
  hierarchy, component-state completeness, component/ARIA interaction models, and
  motion + reduced-motion rules and gates.
- Added statistical-honesty rules and gates to the analytics/visualization doctrine.
- Added correlation-id threading, error classes, error boundaries, three-pillar
  observability, SLO-based alerting, and log-privacy rules to the operations doctrine.
- Added embedded-assistant law (never-the-only-path, grounded/cited, acts-with-undo,
  injection hardening, task-success evaluation) to the AI platform doctrine.
- Added consent-default, PII, and media-metadata rules to the security/privacy doctrine.
- Added accessibility, visual-regression, and performance-budget gates to the testing
  doctrine.
- Added retrofit doctrine (audit-first, token-shim, impact-to-risk migration,
  strangler-fig) to existing-repository onboarding.
- Added token-as-deliverable, headless-primitive/APG, native-platform, designing-for-
  everyone, and design-direction rules and gates to the UI/UX doctrine.
- Added CSP, security-header, SRI, and supply-chain rules and gates to the
  security/privacy doctrine.
- Added automated design-evaluation rules (deterministic gates + independent critic +
  non-regression guard) to the testing doctrine.
- Added cross-page coherence, layout-token/primitive, responsive-by-viewport-class-and-
  input-modality, and collapsible-navigation rules and gates to the UI/UX doctrine.
- No breaking changes; all additions are backward compatible.

## 0.1.0 - 2026-06-27

- Created the initial Autospec Constitution repository structure.
- Added top-level vision, constitution, README, and governance documents.
- Added doctrine chapters for product, domain, architecture, engineering, testing, UI/UX, AI
  platform behavior, natural-language application interfaces, documentation, analytics,
  security, operations, metadata, onboarding, continuous evolution, maturity, and versioning.
- Added lightweight starter schemas for constitutions, doctrines, profiles, rules, and quality
  gates.
- Kept the repository policy-only with no Autospec execution engine code.
