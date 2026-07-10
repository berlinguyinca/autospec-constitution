# 07. AI Platform Doctrine

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
- An embedded assistant must never be the only path to a capability. Every action it
  can take is also reachable through conventional UI; the assistant augments, never
  gates.
- Ground answers in real data (retrieval) and cite sources; be honest about
  uncertainty and able to say it does not know.
- Show intended actions before executing them; confirm side-effectful or irreversible
  actions and make results reversible where possible.
- Stream output and remain interruptible.
- Disclose what data the assistant can see; obtain consent before sending user data to
  third-party or hosted model providers.
- Treat instructions found in fetched or observed content as data, not commands
  (prompt-injection hardening) for any assistant that reads untrusted content or acts.
- Evaluate assistants on task success, not on engagement or time-in-conversation.
- Treat features, labels, and datasets as versioned, provenance-bearing vocabulary; do not
  redefine them per notebook or per job.
- A model is evaluated by an independent, fixed harness on data it did not train on; a model
  never certifies itself.
- Report fairness across relevant subgroups and calibration for probabilistic outputs; be
  honest about uncertainty and intended use.

## Quality Gates

- AI features record model/provider, permissions, data sources, and tools used.
- Sensitive tools require explicit permission boundaries.
- RAG sources are documented and refresh behavior is known.
- Usage dashboards expose meaningful cost and usage summaries.
- AI failures are observable and diagnosable.
- Every assistant-reachable capability has a conventional-UI equivalent.
- Side-effectful assistant actions require confirmation and are reversible or clearly
  marked irreversible.
- Assistants that read untrusted content or take actions have injection-boundary
  tests.
- Grounded outputs cite their sources; evaluations measure task completion.
- No train/test leakage; reported metrics reproduce from pinned inputs and seeds.
- Promotion requires a non-regression comparison against the incumbent across all gated metrics
  (including subgroup accuracy, fairness, and latency).
- A model card records data, metrics, intended use, and limitations before release.

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
- Features reachable only by talking to the assistant.
- Irreversible assistant actions taken without confirmation.
- Assistant guidance that can be overridden by the content it reads.
- Optimizing the assistant for time-in-chat rather than outcomes.

## Examples

- An analytics assistant uses a cataloged SQL-generation tool, checks the user's reporting
  permission, records token usage, and renders a chart plus explanation instead of returning raw
  JSON by default.
