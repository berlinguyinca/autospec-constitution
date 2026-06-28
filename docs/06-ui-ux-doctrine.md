# 06. UI/UX Doctrine

## Machine-readable rules

Structured rules for this doctrine live in:

`../rules/ui-ux.yml`

## Purpose

User interfaces should be usable, accessible, responsive, visually coherent, and aligned with
the product domain.

## Scope

This doctrine covers mobile-first responsive design, accessibility, design tokens, component
reuse, states, visual polish, and multi-platform layouts.

## Rules

- Design mobile-first, then expand to larger layouts.
- Use accessible semantics, keyboard navigation, focus states, and sufficient contrast.
- Reuse components and design tokens before introducing one-off styles.
- Provide empty, loading, error, partial, and success states.
- Keep workflows ergonomic for repeated use.
- Match visual density and tone to the product context.
- Validate layouts across relevant viewport sizes.

## Quality Gates

- User-facing screens include responsive evidence.
- Interactive controls are keyboard accessible.
- New UI uses existing components or explains why a new component is needed.
- Empty, loading, and error states are present for data-dependent views.
- Visual regressions are checked when UI changes are meaningful.

## Required Metadata

- `ui-surface.json`
- design token registry
- component inventory
- accessibility notes
- screenshot or visual evidence index

## Acceptance Criteria

- Users can complete primary workflows on supported devices.
- A future agent can identify screens, components, states, and accessibility obligations.
- UI behavior is documented where user-visible.

## Implementation Hints

- Prefer stable dimensions for fixed-format UI elements.
- Use common control patterns for common jobs.
- Keep text concise and ensure it fits containers at supported sizes.

## Anti-Patterns

- Desktop-only designs for general web applications.
- One-off colors, spacing, or components without design-system rationale.
- Hiding important errors in logs or raw responses.

## Examples

- A report page provides a loading state while queries run, an empty state when no data exists,
  an error state with retry guidance, and a printable layout for export.
