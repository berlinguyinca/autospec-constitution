# 08. Natural Language Application Interface Doctrine

## Purpose

Natural-language application interfaces should expose real application capabilities in a
human-readable, permissioned, and visually useful way.

## Scope

This doctrine covers assistants that query and visualize data, generate SQL, inspect files,
generate reports, execute workflows, create exports, and explain application state.

## Rules

- Natural-language interfaces must respect application permissions.
- Outputs should be human-readable and visually rendered by default.
- Raw JSON should be avoided unless explicitly requested or needed for diagnostics.
- Generated SQL, reports, workflow actions, and exports should be reviewable before risky
  execution.
- The assistant should explain what it did, what evidence it used, and what remains uncertain.
- Application capabilities exposed through natural language should be cataloged.

## Quality Gates

- Each natural-language capability maps to an application permission or role.
- Data queries identify source, filters, and confidence.
- Workflow execution has audit logs and confirmation boundaries for risky actions.
- Reports and exports are formatted for human consumption.
- Failure output gives a useful recovery path.

## Required Metadata

- natural-language capability catalog
- `ai-capabilities.json`
- permission map
- report/export inventory
- audit log requirements

## Acceptance Criteria

- Users can ask for application outcomes, not just chat responses.
- Reviewers can trace assistant actions to tools, permissions, and evidence.
- Human-readable output is the default.

## Implementation Hints

- Render tables, charts, summaries, files, and PDFs where appropriate.
- Use confirmations for destructive or externally visible actions.
- Include SQL text when useful, but pair it with explanation and visualization.

## Anti-Patterns

- Returning raw tool responses directly to users.
- Allowing natural language to bypass normal workflow validation.
- Treating the assistant as separate from the application permission model.

## Examples

- A user asks, "Which campaigns drove the most qualified pipeline last quarter?" The assistant
  queries governed data, shows a chart and table, explains filters, and offers a PDF export.
