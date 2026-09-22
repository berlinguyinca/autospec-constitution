#!/bin/bash
# The gate for autospec-constitution: build a throwaway virtualenv and run
# scripts/validate-constitution.py, which checks the nine-section structure of
# every doctrine chapter, that every schemas/*.json is a valid JSON Schema, and
# that the three version markers (CONSTITUTION.md, CHANGELOG.md, the schema
# default) agree.
#
# This is a like-for-like port of the TeamCity build `Autospec_Constitution_Validate`.
# It is the whole of that build; nothing from it was dropped.
#
# RUN IT LOCALLY: `bash ops/ci/woodpecker-gates.sh` from a clean checkout.
set -euo pipefail

journal=""
for candidate in "${WOODPECKER_JOURNAL_DIR:-}" /home/wohlgemuth/woodpecker/logs; do
  [ -n "$candidate" ] || continue
  if mkdir -p "$candidate" 2>/dev/null && [ -w "$candidate" ]; then
    journal="$candidate/constitution-gates-${CI_COMMIT_SHA:-local}-$(date +%s).log"
    break
  fi
done

# The run goes through a PIPELINE, not `exec > >(tee ...)`.
#
# Process substitution does not make the shell wait for the reader: a script
# that fails in seconds exits before tee drains its pipe, and the agent records
# nothing at all. This gate takes seconds even when it passes, so it lives
# entirely inside that failure window. A pipeline is waited on, so the output
# survives, and PIPESTATUS carries the body's status past tee.
main() {
  echo "commit:  ${CI_COMMIT_SHA:-<local>}"
  step() { echo; echo "=== $* ==="; }

  step "python"
  if ! command -v python3 >/dev/null 2>&1; then
    echo "FATAL: python3 is not on this agent's PATH." >&2
    exit 1
  fi
  python3 --version
  # An exact pin, not a floor, and deliberately so: the point of this check is
  # that a silent interpreter change would quietly alter what the validator
  # exercises, and `>=` cannot catch that. TeamCity pinned 3.12 because its
  # agent image was Ubuntu 24.04; the Woodpecker CI image is Debian trixie and
  # ships 3.13 only, with no 3.12 available, so the pin is re-pointed rather
  # than relaxed. Both validators were verified green under 3.13.5 in that
  # image before this was changed. If a future image bump turns this red, that
  # is the check doing its job -- re-verify the validator, then move the pin.
  python3 -c 'import sys; assert sys.version_info[:2] == (3, 13), sys.version'

  step "virtualenv"
  # Rebuilt from scratch every run: a venv carried over from a previous build
  # on the same node would let a dependency that is no longer installable keep
  # the gate green.
  rm -rf .ci-venv
  python3 -m venv .ci-venv
  # jsonschema only. pyyaml happens to be present in the image system-wide,
  # but this validator does not use it and the venv should not imply it does.
  .ci-venv/bin/pip install --quiet jsonschema
  .ci-venv/bin/python -c 'import jsonschema; print("jsonschema", jsonschema.__name__, "ok")'

  step "validate doctrine structure, schemas, and version markers"
  .ci-venv/bin/python scripts/validate-constitution.py

  echo
  echo "GATES PASSED"
}

if [ -n "$journal" ]; then
  echo "journal: $journal"
  main 2>&1 | tee -a "$journal"
  exit "${PIPESTATUS[0]}"
fi
main
