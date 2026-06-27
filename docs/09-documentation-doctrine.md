# 09. Documentation Doctrine

## Purpose

Documentation should make product behavior, system structure, operations, and user workflows
understandable to humans and retrievable by AI systems.

## Scope

This doctrine covers repository docs, in-app docs, RAG-ready docs, tutorials, screenshots, PDFs,
generated walkthroughs, API references, and operational runbooks.

## Rules

- Document user-visible behavior when it changes.
- Keep repository onboarding docs current.
- Provide in-app help for complex workflows where appropriate.
- Make important docs RAG-ready with clear headings and stable links.
- Include screenshots or generated walkthroughs for visual workflows when helpful.
- Maintain runbooks for operational procedures.

## Quality Gates

- New features include user or maintainer documentation when behavior changes.
- Documentation links are valid.
- RAG-ready docs avoid ambiguous headings and unexplained acronyms.
- Tutorials are tested or reviewed against the current UI.
- PDFs or exports are formatted for their audience.

## Required Metadata

- documentation index
- RAG source inventory
- tutorial inventory
- screenshot and walkthrough index
- runbook index

## Acceptance Criteria

- Users can learn major workflows without reading source code.
- Maintainers can onboard and operate the repository.
- AI retrieval has clean, current source material.

## Implementation Hints

- Keep docs close to the features they explain when possible.
- Record generated artifacts and their source commands.
- Use audience labels such as user, developer, admin, operator, and auditor.

## Anti-Patterns

- Letting generated docs drift without review.
- Documenting implementation internals instead of user-visible behavior.
- Relying on chat history as the only explanation of a system.

## Examples

- A new admin dashboard ships with repo docs, an in-app help panel, screenshots, and an update
  to the RAG source index.
