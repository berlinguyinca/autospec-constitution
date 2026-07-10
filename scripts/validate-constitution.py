#!/usr/bin/env python3
"""Validate the constitution repo's structural invariants.

Checks:
  1. Every doctrine chapter (docs/00-*.md .. docs/15-*.md) keeps the canonical
     nine-section structure, in order. docs/16 (maturity model) and docs/17
     (governance) are intentionally structured differently and are exempt.
  2. Every schemas/*.json parses and is a valid JSON Schema.
  3. The version markers agree: CONSTITUTION.md `Version:`, the newest
     CHANGELOG.md entry, and the schema default in
     schemas/constitution.schema.json.

Exit 0 = all good; 1 = findings.
"""

import glob
import json
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NINE_SECTIONS = ["Purpose", "Scope", "Rules", "Quality Gates", "Required Metadata",
                 "Acceptance Criteria", "Implementation Hints", "Anti-Patterns", "Examples"]
EXEMPT_PREFIXES = ("16-", "17-")

findings = []


def find(msg):
    findings.append(msg)
    print(f"FINDING: {msg}")


def main():
    for path in sorted(glob.glob(os.path.join(REPO, "docs", "*.md"))):
        name = os.path.basename(path)
        if name.startswith(EXEMPT_PREFIXES):
            continue
        with open(path) as fh:
            heads = re.findall(r"^## (.+)$", fh.read(), re.M)
        if heads != NINE_SECTIONS:
            find(f"docs/{name}: sections {heads} != canonical nine-section structure")
        else:
            print(f"ok: docs/{name}")

    schema_default = ""
    for path in sorted(glob.glob(os.path.join(REPO, "schemas", "*.json"))):
        name = os.path.basename(path)
        try:
            with open(path) as fh:
                schema = json.load(fh)
        except json.JSONDecodeError as exc:
            find(f"schemas/{name}: invalid JSON: {exc}")
            continue
        try:
            import jsonschema
            jsonschema.Draft202012Validator.check_schema(schema)
        except ImportError:
            pass  # structural JSON parse still verified above
        except Exception as exc:
            find(f"schemas/{name}: not a valid JSON Schema: {exc}")
            continue
        if name == "constitution.schema.json":
            schema_default = schema.get("properties", {}).get("version", {}).get("default", "")
        print(f"ok: schemas/{name}")

    with open(os.path.join(REPO, "CONSTITUTION.md")) as fh:
        m = re.search(r"^Version:\s*(\S+)", fh.read(), re.M)
    constitution_version = m.group(1) if m else ""
    with open(os.path.join(REPO, "CHANGELOG.md")) as fh:
        m = re.search(r"^## (\S+) - ", fh.read(), re.M)
    changelog_version = m.group(1) if m else ""

    if not constitution_version:
        find("CONSTITUTION.md: no `Version:` marker found")
    if constitution_version != changelog_version:
        find(f"version drift: CONSTITUTION.md says {constitution_version!r} but the newest "
             f"CHANGELOG.md entry is {changelog_version!r}")
    if schema_default and schema_default != constitution_version:
        find(f"version drift: schemas/constitution.schema.json default is {schema_default!r} "
             f"but CONSTITUTION.md says {constitution_version!r}")
    if not findings:
        print(f"ok: version markers agree ({constitution_version})")

    if findings:
        print(f"validate-constitution: FAIL ({len(findings)} findings)")
        return 1
    print("validate-constitution: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
