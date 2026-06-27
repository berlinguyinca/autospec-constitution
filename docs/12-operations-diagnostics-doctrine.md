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

## Quality Gates

- New services expose health or readiness checks.
- Critical failures include useful log context without leaking secrets.
- Operational dashboards cover key availability and latency signals.
- UI failure reports include browser, route, screenshot or trace, and reproduction steps.
- Incident follow-ups create bounded issues.

## Required Metadata

- operations runbook index
- health check inventory
- log and metric catalog
- trace coverage notes
- incident register
- diagnostic tool registry

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

## Examples

- A failed dashboard load includes route, request id, console error, backend trace id, and a
  Playwright reproduction attached to the issue.
