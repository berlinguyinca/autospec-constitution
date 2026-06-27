# 10. Analytics, Reporting, And Visualization Doctrine

## Purpose

Analytics and reporting should help people make decisions with accurate, purposeful, and
well-presented information.

## Scope

This doctrine covers metrics, chart selection, report generation, PDF formatting, visualization
library standardization, dashboards, exports, and human-readable outputs.

## Rules

- Define why each metric exists and what decision it supports.
- Choose chart types appropriate to the data and comparison.
- Standardize visualization libraries within a repository.
- Format reports and PDFs for the intended audience.
- Show filters, time ranges, units, and data freshness.
- Prefer readable summaries and visuals over raw data dumps.

## Quality Gates

- New metrics have definitions, owners, and source data.
- Reports identify filters, date ranges, and generation time.
- Charts are accessible and readable at supported sizes.
- Exported PDFs preserve layout and meaning.
- Data quality limitations are visible.

## Required Metadata

- metric catalog
- report inventory
- visualization library registry
- dashboard map
- export format catalog

## Acceptance Criteria

- A user can understand what a metric means and when not to trust it.
- Reports render cleanly in target formats.
- Agents can generate issues for missing, misleading, or duplicated metrics.

## Implementation Hints

- Use consistent color, number, date, and currency formats.
- Include annotations for major data caveats.
- Separate operational metrics from product analytics.

## Anti-Patterns

- Collecting metrics without a decision they support.
- Using visually impressive charts that obscure meaning.
- Returning raw JSON when a table, chart, or report is expected.

## Examples

- A cost dashboard shows spend by provider, model, workspace, and time range with a PDF export
  for finance review.
