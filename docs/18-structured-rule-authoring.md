# Structured Rule Authoring

Autospec Constitution remains human-readable law. Structured rules are the machine-readable index that lets Autospec evaluate doctrine against a repository Digital Twin without guessing from prose.

## Rule IDs

Use deterministic dot-separated IDs:

```text
<category>.<subject>.<obligation>
```

Examples:

- `testing.playwright.required_for_web`
- `metadata.digital_twin.required`
- `engineering.dependency_sprawl.forbidden`

Keep `id` and `rule_id` identical. `id` is author-facing. `rule_id` is preserved for current Autospec engine compatibility.

## Severity

- `required`: missing evidence is a blocking gap for the matching maturity/profile.
- `recommended`: missing evidence should produce a backlog candidate.
- `optional`: available for documentation and future matching, but not a blocker.
- `forbidden`: detected evidence is a violation unless waived.

## Maturity Levels

Rules target one of:

- `prototype`
- `production`
- `enterprise`
- `autonomous`

See `manifests/maturity-levels.yml` for purpose, posture, graduation criteria, and examples.

## Applicability

`applies_when` narrows a rule by:

- `application_types`
- `profiles`
- `technologies`
- `repo_conditions`

Leave arrays empty when a rule is broadly applicable.

## Check Types

Use check types supported by Autospec rule interpretation:

- `required_file`
- `required_directory`
- `required_capability`
- `required_tool`
- `required_dependency`
- `required_metadata`
- `required_test`
- `required_doc`
- `required_surface`
- `required_setting`
- `required_ai_capability`
- `required_mcp_capability`
- `required_report`
- `required_tutorial`
- `required_visualization_standard`
- `forbidden_dependency_sprawl`
- `forbidden_missing_metadata`
- `manual_review`

When a doctrine statement cannot be checked deterministically yet, use `manual_review` and include clear evidence requirements.

## Evidence And Acceptance Criteria

Every rule must list:

- `evidence_required`: what Autospec or a reviewer should look for.
- `acceptance_criteria`: what makes the rule satisfied.
- `metadata_required`: Digital Twin metadata surfaces that support the check.
- `quality_gates`: reviewer-facing gates related to the rule.

## Remediation

Every rule includes a remediation hint, suggested issue title, and labels. These fields let Autospec create useful local issue drafts without inventing policy.

## How Autospec Consumes Rules

Autospec reads local Constitution repositories, scans YAML/JSON files with top-level `rules`, resolves effective rules against profiles, maturity, waivers, and opt-outs, then evaluates them against Digital Twin metadata.

Structured rules should be preferred over Markdown inference. The prose doctrine remains the human explanation and authority.

## Validation

Run:

```bash
bash scripts/validate-constitution.sh
```

The validator checks manifests, rule files, required fields, unique rule IDs, known categories, severity values, maturity levels, and JSON schema validity.
