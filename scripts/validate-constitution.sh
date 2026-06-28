#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

python3 - "$ROOT" <<'PY'
import json
import sys
from pathlib import Path

try:
    import yaml
except Exception as exc:  # pragma: no cover - local operator dependency check
    print(f"ERROR: PyYAML is required for local validation: {exc}", file=sys.stderr)
    sys.exit(1)

root = Path(sys.argv[1])
errors = []

categories_path = root / "manifests/categories.yml"
maturity_path = root / "manifests/maturity-levels.yml"
constitution_path = root / "manifests/constitution.yml"
doctrines_path = root / "manifests/doctrines.yml"

for path in [categories_path, maturity_path, constitution_path, doctrines_path]:
    if not path.exists():
        errors.append(f"missing manifest: {path.relative_to(root)}")

schemas = [
    "schemas/rule.schema.json",
    "schemas/doctrine.schema.json",
    "schemas/quality-gate.schema.json",
    "schemas/constitution.schema.json",
]
for rel in schemas:
    path = root / rel
    if not path.exists():
        errors.append(f"missing schema: {rel}")
        continue
    try:
        json.loads(path.read_text())
    except Exception as exc:
        errors.append(f"invalid JSON schema {rel}: {exc}")

def load_yaml(path, default):
    if not path.exists():
        return default
    try:
        with path.open() as fh:
            return yaml.safe_load(fh) or default
    except Exception as exc:
        errors.append(f"invalid YAML {path.relative_to(root)}: {exc}")
        return default

categories = set((load_yaml(categories_path, {}) or {}).get("categories", []))
maturity_levels = set((load_yaml(maturity_path, {}) or {}).get("levels", {}).keys())
constitution = load_yaml(constitution_path, {})
doctrines = load_yaml(doctrines_path, {})

required_rule_fields = [
    "id",
    "rule_id",
    "title",
    "summary",
    "source",
    "category",
    "severity",
    "maturity",
    "check",
    "evidence_required",
    "acceptance_criteria",
    "remediation",
    "risk",
]
severity_values = {"required", "recommended", "optional", "forbidden"}
rule_ids = {}

for item in constitution.get("doctrines", []):
    for key in ["id", "document", "rules"]:
        if not item.get(key):
            errors.append(f"constitution doctrine entry missing {key}: {item}")
    for key in ["document", "rules"]:
        rel = item.get(key)
        if rel and not (root / rel).exists():
            errors.append(f"constitution doctrine {item.get('id')} points to missing {key}: {rel}")

for item in doctrines.get("doctrines", []):
    rel = item.get("rules")
    if not rel:
        errors.append(f"doctrine manifest entry missing rules: {item}")
        continue
    path = root / rel
    if not path.exists():
        errors.append(f"missing rule file: {rel}")
        continue
    data = load_yaml(path, {})
    for rule in data.get("rules", []):
        rid = rule.get("rule_id") or rule.get("id")
        missing = [field for field in required_rule_fields if not rule.get(field)]
        if missing:
            errors.append(f"rule {rid or '<unknown>'} missing fields: {', '.join(missing)}")
        if rule.get("id") != rule.get("rule_id"):
            errors.append(f"rule {rid or '<unknown>'} must keep id and rule_id identical")
        if rid in rule_ids:
            errors.append(f"duplicate rule id {rid}: {rel} and {rule_ids[rid]}")
        elif rid:
            rule_ids[rid] = rel
        if rule.get("category") not in categories:
            errors.append(f"rule {rid} uses unknown category {rule.get('category')}")
        if rule.get("severity") not in severity_values:
            errors.append(f"rule {rid} uses invalid severity {rule.get('severity')}")
        level = (rule.get("maturity") or {}).get("level")
        if level not in maturity_levels:
            errors.append(f"rule {rid} uses unknown maturity level {level}")
        if not (rule.get("check") or {}).get("type"):
            errors.append(f"rule {rid} missing check.type")

if not rule_ids:
    errors.append("no structured rules found")

if errors:
    for error in errors:
        print(f"ERROR: {error}", file=sys.stderr)
    sys.exit(1)

print(f"Constitution validation passed: {len(rule_ids)} structured rules")
PY
