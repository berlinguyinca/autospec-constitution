# 06. UI/UX Doctrine

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
- Derive every visual value from a layered token system (primitive -> semantic -> component);
  components consume semantic tokens only. Ship tokens as a versioned, interoperable
  deliverable; theme by swapping the semantic layer (light and dark as distinct designs).
- Use non-linear type, spacing, and elevation scales; cap the reading measure; scale
  line-height and tracking inversely with size.
- Build interaction patterns on vetted accessible primitives and the WAI-ARIA APG rather than
  hand-rolling focus management and ARIA; prefer native platform primitives with
  progressive-enhancement fallbacks.
- Choose the least interruptive surface for the task; never stack modal dialogs. Give every
  interactive element its full state set and every data view its container states.
- Make the primary action singular and distinct; match conventions for placement and
  terminology; keep an action's verb consistent through its flow; honor reduced motion.
- Related pages share a persistent shell and a small set of reused page templates; content
  measure, gutters, vertical rhythm, and recurring-element placement are consistent across
  pages. Structural layout values are tokens composed from intrinsic layout primitives;
  spacing is owned centrally, not scattered in per-element margins.
- Adapt to viewport class *and input modality*, not width alone: components respond to their
  container, the shell to the viewport; touch gets larger targets and no hover-only
  affordances; full-height layouts account for mobile browser chrome and device safe areas.
- Collapse navigation only when space-constrained; collapsible chrome has an accessible,
  keyboard-operable toggle that persists state across pages and sessions.
- Design for everyone: reduce cognitive load, write at the audience's reading level in plain
  user-side language, and keep core content and workflows usable on low-end devices and
  without full JavaScript.
- Choose a design direction before generating (pin subject, audience, and a single signature);
  guard against generic default looks; use realistic, domain-specific content, not placeholder.

## Quality Gates

- User-facing screens include responsive evidence.
- Interactive controls are keyboard accessible.
- New UI uses existing components or explains why a new component is needed.
- Empty, loading, and error states are present for data-dependent views.
- Visual regressions are checked when UI changes are meaningful.
- Visual values trace to tokens; tokens validate against their standard schema; a lint forbids
  raw literals in components.
- Contrast meets WCAG 2.2 AA in every supported theme; status is never color-only.
- Keyboard operability verified (visible focus-visible; overlays trap, restore, and Escape);
  component patterns follow the APG or a vetted primitive; native-primitive usage degrades
  where unsupported.
- Empty, loading, error, and success states present for data-dependent views; the reduced-
  motion path degrades to visible.
- The app shell does not shift or resize between navigations; sibling pages of the same
  template are consistent in shell, gutters, and rhythm; layout values trace to layout tokens.
- The interface is correct across viewport classes, orientations, and input modalities with
  safe-area insets respected; navigation is not hidden when it fits and its toggle is
  keyboard-operable and state-persisted.
- Primary content meets the target reading level and a low-end performance budget; core flows
  work with a feature or JavaScript absent.
- A design brief pinning subject/audience/signature exists before generation, and the output
  passes an anti-sameness check.

## Required Metadata

- `ui-surface.json`
- design token registry
- component inventory
- accessibility notes
- screenshot or visual evidence index
- design-token registry (semantic theme map), component inventory and state matrix,
  motion/duration tokens
- interruption-surface inventory
- page-template (archetype) inventory
- layout-token set (container widths, gutters, sidebar/rail widths, breakpoints)

## Acceptance Criteria

- Users can complete primary workflows on supported devices.
- A future agent can identify screens, components, states, and accessibility obligations.
- UI behavior is documented where user-visible.
- A user can complete primary workflows by keyboard and screen reader, in any supported theme,
  across supported viewport classes and input modalities.
- A future agent can enumerate themes, tokens, component states, page templates, and overlay/
  focus behavior from metadata.

## Implementation Hints

- Prefer stable dimensions for fixed-format UI elements.
- Use common control patterns for common jobs.
- Keep text concise and ensure it fits containers at supported sizes.

## Anti-Patterns

- Desktop-only designs for general web applications.
- One-off colors, spacing, or components without design-system rationale.
- Hiding important errors in logs or raw responses.
- Raw values bypassing tokens; dark mode by inversion; a modal for everything; stacked modals;
  color-only status; hover-only actions; tabs whose active state is not in the URL; charts or
  overlays that do not re-theme; a hamburger when the nav fits; layout that resets user state
  on navigation; convergence on the generic AI-default looks.

## Examples

- A report page provides a loading state while queries run, an empty state when no data exists,
  an error state with retry guidance, and a printable layout for export.
- A data table with sticky header, `aria-sort`, selection + bulk-action bar, pagination, an
  explicit responsive strategy, and all container states — styled entirely from semantic
  tokens, correct in both themes, on a persistent app shell shared with its sibling pages.
