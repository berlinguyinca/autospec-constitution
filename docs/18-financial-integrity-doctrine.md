# 18. Financial Integrity Doctrine

## Purpose

Ensure that software recording, calculating, reconciling, or reporting financial results
produces numbers that are correct, controlled, auditable, and reproducible.

## Scope

Any system that posts, calculates, reconciles, or reports monetary amounts, balances, or
financial metrics — ledgers, billing, revenue, FP&A, and financial reporting.

## Rules

- Treat the chart of accounts, entities, and currencies as canonical vocabulary; every figure
  traces to a defined account or metric, never an ad-hoc amount.
- Preserve the accounting identity: debits equal credits; balances net to zero.
- Enforce segregation of duties: the actor that records or generates a figure is never the
  actor that approves it.
- Keep an immutable, timestamped audit trail (who, what, when) for every posting and
  adjustment, distinct from debug logs.
- Make figures deterministically reproducible from versioned inputs and formulas.
- Route material amounts and judgment items to human review with recorded rationale;
  deterministic checks outrank model judgment on any figure.

## Quality Gates

- Debits equal credits on every entry; the trial balance nets to zero.
- Reconciliations tie to a source of truth, or reconciling items are itemized and explained.
- No posting is approved by its creator.
- The audit trail is complete and immutable, and carries no secrets or PII beyond what the
  record requires.
- Figures recompute deterministically; restatements are reproducible.
- Amounts above materiality carry a human-reviewed rationale.

## Required Metadata

- Chart of accounts, entities, and currencies.
- Source-of-truth systems and reconciliation mappings.
- Approval matrix and materiality thresholds.
- Retention and access policy for financial records and the audit trail.

## Acceptance Criteria

- A reviewer can trace any reported figure to its accounts, inputs, formula, and approver.
- A prior period cannot change silently; a restatement is explicit and reproducible.

## Implementation Hints

- Model postings as balanced journal entries; assert the identity in code and in tests.
- Store the audit trail append-only; separate it from application debug logs.
- Compose the `application/financial` baseline pack for the concrete gates and evidence.

## Anti-Patterns

- Figures computed by ad-hoc queries that bypass the chart of accounts.
- The same actor creating and approving an entry.
- Mutable history; recomputation that does not reproduce a prior result.
- An assistant posting or approving records without an independent human approver.

## Examples

- A month-end accrual booked as a balanced entry against defined accounts, reconciled to the
  source system, approved by someone other than its author, written to an immutable trail, and
  reproducible from the versioned inputs — with the amount's rationale recorded because it
  exceeds materiality.
