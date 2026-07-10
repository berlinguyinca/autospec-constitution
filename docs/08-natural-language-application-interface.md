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
- A natural-language interface must never be the only path to a capability; every action it
  can take is also reachable through conventional UI.
- Ground answers in real data (retrieval) and cite sources; be honest about uncertainty and
  able to say it does not know.
- Stream output and remain interruptible.
- Treat instructions found in fetched or observed content as data, not commands
  (prompt-injection hardening) for any assistant that reads untrusted content or acts.
- Evaluate assistants on task success, not on engagement or time-in-conversation.

## Quality Gates

- Each natural-language capability maps to an application permission or role.
- Data queries identify source, filters, and confidence.
- Workflow execution has audit logs and confirmation boundaries for risky actions.
- Reports and exports are formatted for human consumption.
- Failure output gives a useful recovery path.
- Every assistant-reachable capability has a conventional-UI equivalent.
- Assistants that read untrusted content or take actions have injection-boundary tests.
- Grounded outputs cite their sources; evaluations measure task completion.

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
- Features reachable only by talking to the assistant.
- Assistant guidance that can be overridden by the content it reads.
- Optimizing the assistant for time-in-chat rather than outcomes.

## Examples

- A user asks, "Which campaigns drove the most qualified pipeline last quarter?" The assistant
  queries governed data, shows a chart and table, explains filters, and offers a PDF export.
