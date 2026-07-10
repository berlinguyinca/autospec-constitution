# 12. Operations And Diagnostics Doctrine

## Purpose

Systems should be observable, diagnosable, recoverable, and understandable when they fail.

## Scope

This doctrine covers health checks, logs, metrics, tracing, incident reports, white-screen
diagnosis, Playwright reproductions, MCP-based diagnostics, and self-healing boundaries.

## Rules

- Provide health checks for deployable services.
- Emit structured logs for important workflows and failures.
- Track metrics and traces for critical paths.
- Maintain incident report practices for production-impacting failures.
- Capture reproducible evidence for UI failures, including Playwright repros where applicable.
- Define self-healing boundaries and escalation behavior.
- Keep diagnostics safe for sensitive data.
- Thread a correlation/request id from the client-side failure through every backend
  hop, and surface that same id to the user as an error reference.
- Classify user-facing failures and handle each distinctly: validation (user can
  fix), transient (offer retry), permission (explain), offline (detect and inform),
  and system (apologize in the interface's voice, offer a path forward).
- Isolate failures with error boundaries and a branded global fallback so one broken
  region does not take down the whole surface.
- Retry transient failures with backoff, and make retried operations idempotent.
- Instrument the three pillars (logs, metrics, traces); collect Real User Monitoring
  for user-facing performance signals.
- Alert on service-level objectives and error budgets, not on every error.
- Keep audit logs distinct from debug logs, with their own retention and access.
- Never leak internal details (stack traces, subsystem names, raw messages) to users,
  and never log secrets or personal data.
- Instrument new services with the three pillars (logs, metrics, traces); structured logs carry
  a correlation id threaded end to end, the same id surfaced to users on failure.
- Alert on SLOs and error budgets, not on every error; give operational procedures a runbook
  with a rollback path.
- Feed production signal (errors, RUM, incidents) back into the refinement backlog.

## Quality Gates

- New services expose health or readiness checks.
- Critical failures include useful log context without leaking secrets.
- Operational dashboards cover key availability and latency signals.
- UI failure reports include browser, route, screenshot or trace, and reproduction steps.
- Incident follow-ups create bounded issues.
- User-facing failures show an actionable message plus a correlation id and never
  expose internals.
- The same correlation id appears in structured logs and traces.
- Client-side error monitoring is active with readable stack traces (source maps) and
  release tagging.
- Real User Monitoring reports field performance for key interactions.
- Alerts are objective-based and actionable; audit logs are separated; logs are
  scrubbed of secrets and personal data.
- User-facing services define SLOs; alerting is SLO-based; health and synthetic checks feed a
  status signal.
- New operational procedures have a runbook; incidents produce a blameless postmortem.

## Required Metadata

- operations runbook index
- health check inventory
- log and metric catalog
- trace coverage notes
- incident register
- diagnostic tool registry
- correlation-id scheme
- error-class catalog (the five classes and their handling)
- SLO / error-budget register
- RUM / performance dashboard reference
- log privacy and retention policy

## Acceptance Criteria

- Operators can determine whether the system is healthy.
- Engineers can reproduce and diagnose common failures.
- Agents can collect evidence before proposing fixes.

## Implementation Hints

- Prefer structured events with stable names.
- Capture Playwright traces for web regressions.
- Use MCP-based diagnostics where they provide safe, auditable access to system state.

## Anti-Patterns

- Reporting "white screen" without route, console errors, network evidence, or reproduction.
- Logging too little to diagnose or too much sensitive data to be safe.
- Building self-healing actions that hide repeated failures.
- A generic "something went wrong" with no class, no id, and no next step.
- Leaking stack traces or subsystem names to end users.
- Alerting on every error until the team ignores alerts.
- Personal data or secrets written to logs.

## Examples

- A failed dashboard load includes route, request id, console error, backend trace id, and a
  Playwright reproduction attached to the issue.
