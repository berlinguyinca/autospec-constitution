# 00. Overview

## Purpose

This overview explains how the Autospec Constitution is organized and how future agents should
use it. The Constitution defines policy only. It does not implement scanners, agents, loaders,
or enforcement logic.

## Scope

The Constitution applies to repositories that choose to pin an Autospec Constitution version.
It provides doctrine for gap analysis, issue generation, review, metadata generation, and quality
gates.

## Rules

- Treat doctrine as policy, not executable engine behavior.
- Prefer explicit evidence over inferred compliance.
- Apply only the doctrines and profiles relevant to the repository unless a governing baseline
  requires more.
- Record uncertainty when repository evidence is incomplete.

## Quality Gates

- A governed repository pins a Constitution version.
- Applicable profiles are declared.
- Required metadata exists or an onboarding issue records why it is missing.
- Review output distinguishes evidence from inference.

## Required Metadata

- constitution source and version
- selected profiles
- maturity target
- doctrine compliance summary
- known gaps and confidence scores

## Acceptance Criteria

- A human can understand what standard applies.
- An agent can determine which doctrine chapters to evaluate.
- Policy and engine responsibilities remain separated.

## Implementation Hints

- Store repository-specific adoption data in the governed repository, not in this policy repo.
- Use stable doctrine ids in reports and issues.
- Link every compliance claim to source files, tests, screenshots, docs, or operational evidence.

## Anti-Patterns

- Embedding execution code in the Constitution.
- Treating unverified assumptions as compliance.
- Applying every doctrine rigidly to prototypes without a declared maturity target.

## Examples

- A web analytics product pins Constitution `0.4.0` and selects `web`, `analytics`, and
  `ai-platform` profiles.
- An established repository opens a metadata-only onboarding PR before feature changes.
