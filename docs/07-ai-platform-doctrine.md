# 07. AI Platform Doctrine

## Machine-readable rules

Structured rules for this doctrine live in:

`../rules/ai-platform.yml`

## Purpose

AI must be a reusable, governed platform capability rather than a one-off chatbot or hidden
integration.

## Scope

This doctrine covers model providers, OpenAI-compatible APIs, local model support, agents,
tools, memory, MCP servers, RAG, token and cost tracking, provider settings, admin pages, and
usage dashboards.

## Rules

- Define AI capabilities as platform services with permissions and audit trails.
- Support OpenAI-compatible APIs where practical.
- Support local providers such as Ollama where privacy, cost, or offline requirements justify it.
- Catalog agents, tools, memories, RAG sources, MCP servers, and model providers.
- Track token usage and cost where providers expose the data.
- Provide admin controls for provider settings and capability access.
- Explain AI actions and outputs in human-readable terms.

## Quality Gates

- AI features record model/provider, permissions, data sources, and tools used.
- Sensitive tools require explicit permission boundaries.
- RAG sources are documented and refresh behavior is known.
- Usage dashboards expose meaningful cost and usage summaries.
- AI failures are observable and diagnosable.

## Required Metadata

- `ai-capabilities.json`
- `mcp-registry.json`
- provider settings registry
- tool catalog
- memory and RAG source inventory
- token and cost dashboard entries

## Acceptance Criteria

- A reviewer can determine what AI can do, what data it can access, and who may invoke it.
- AI capabilities can be reused across application surfaces.
- Outputs are explainable and auditable.

## Implementation Hints

- Separate provider configuration from application behavior.
- Record prompt, tool, and retrieval boundaries without storing sensitive content unnecessarily.
- Treat local models as provider options, not a separate product architecture.

## Anti-Patterns

- Building a single chat box with untracked data access.
- Letting AI tools bypass application permissions.
- Hiding cost, token usage, or model identity from administrators.

## Examples

- An analytics assistant uses a cataloged SQL-generation tool, checks the user's reporting
  permission, records token usage, and renders a chart plus explanation instead of returning raw
  JSON by default.
