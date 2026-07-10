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
- Bar charts start at a zero baseline; line charts may use a non-zero axis only when
  the axis is clearly labeled.
- Show the sample size and denominator behind any rate or percentage.
- Show uncertainty (intervals, error bars, bands) whenever a value is an estimate.
- Do not imply causation from a correlation view, and do not extrapolate a trend
  beyond the data.
- Prefer showing the distribution over a single aggregate when the shape carries
  meaning; label logarithmic or non-zero axes explicitly.
- Encode categories with an appropriate palette family (categorical, sequential, or
  diverging); never use rainbow/jet scales, and never rely on hue alone.
- Charts inherit the application theme and re-theme with it.
- The semantic layer is the single source of truth for metric meaning: every figure references
  a definition (name, owner, formula, grain); no ad-hoc metric redefinitions.
- Present data honestly: bar charts start at zero; disclose sample size and denominators; show
  uncertainty on estimates; never encode meaning by color alone; charts re-theme with the app.
- An analysis answers the question actually asked; consequential findings get an independent
  methodology review.

## Quality Gates

- New metrics have definitions, owners, and source data.
- Reports identify filters, date ranges, and generation time.
- Charts are accessible and readable at supported sizes.
- Exported PDFs preserve layout and meaning.
- Data quality limitations are visible.
- Every chart has a text alternative stating its takeaway and, where practical, an
  accessible data table behind it.
- Bar charts with truncated baselines are rejected or corrected.
- Estimated values display their uncertainty; encodings are not color-only.
- Charts render correctly in every supported theme.
- Data-quality and freshness checks fail before users rely on stale or broken output;
  dashboards disclose freshness and scope.
- Charts pass a statistical-honesty check (zero baselines, n and uncertainty shown,
  not color-only), judged independently.
- Consequential analyses record their question, method, and reviewer.

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
- Truncated bar-chart axes that exaggerate differences.
- Percentages reported without sample size.
- Rainbow/jet color scales that invent boundaries not present in the data.
- A mean presented where the distribution is the story.
- Charts stuck on a light surface while the rest of the product is in dark mode.

## Examples

- A cost dashboard shows spend by provider, model, workspace, and time range with a PDF export
  for finance review.
