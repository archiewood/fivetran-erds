#!/usr/bin/env python3
"""Generate README.md from erd/index.json and the Fivetran connector metadata API."""

import json
import os
from urllib.request import urlopen, Request

METADATA_URL = "https://api.fivetran.com/public/connector-types"
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
INDEX_PATH = os.path.join(BASE_DIR, "erd", "index.json")
README_PATH = os.path.join(BASE_DIR, "README.md")


def fetch_connector_metadata():
    """Fetch all connector types from the Fivetran public API."""
    req = Request(METADATA_URL, headers={"Accept": "application/json"})
    with urlopen(req, timeout=30) as resp:
        data = json.loads(resp.read().decode())
    return data.get("data", data) if isinstance(data, dict) else data


def main():
    # Load index
    with open(INDEX_PATH) as f:
        index = json.load(f)

    index_by_id = {c["id"]: c for c in index["connectors"]}

    # Fetch full connector list from API
    print("Fetching connector metadata from Fivetran API...")
    all_connectors = fetch_connector_metadata()
    print(f"Found {len(all_connectors)} total connectors")

    # Build rows sorted by display name
    rows = []
    counts = {"with_erd": 0, "empty": 0}

    for c in all_connectors:
        cid = c.get("id", "")
        name = c.get("name", cid)
        has_link = bool(c.get("link_to_erd", ""))

        if not has_link:
            # Skip connectors without ERD links
            continue
        elif cid in index_by_id:
            entry = index_by_id[cid]
            if entry["status"] == "ok":
                file_id = entry.get("file_id", cid)
                counts["with_erd"] += 1
                rows.append((name, cid, entry["tables"], file_id))
            else:
                counts["empty"] += 1
                rows.append((name, cid, 0, None))
        else:
            # Has ERD link but not in our index (shouldn't happen, but handle it)
            counts["empty"] += 1
            rows.append((name, cid, 0, None))

    rows.sort(key=lambda r: r[0].lower())
    total = len(rows)

    # Generate markdown
    lines = [
        "# Fivetran Application Connector ERDs",
        "",
        "Entity Relationship Diagram schemas for Fivetran application connectors, extracted from the [Fivetran ERD API](https://fivetran.com/docs/connectors).",
        "",
        f"**{total}** connectors with ERD links | **{counts['with_erd']}** with schema | **{counts['empty']}** no tables",
        "",
        "## Connectors",
        "",
        "| Connector | ID | DDL Statements | Mermaid |",
        "|---|---|---|---|",
    ]

    for name, cid, tables, file_id in rows:
        if file_id is not None:
            ddl = f"[{tables} tables](ddl/{file_id}.sql)"
            mermaid = f"[mermaid](mermaid/{file_id}.mermaid)"
        else:
            ddl = "no tables"
            mermaid = ""
        lines.append(f"| {name} | `{cid}` | {ddl} | {mermaid} |")

    lines.append("")

    readme = "\n".join(lines)
    with open(README_PATH, "w") as f:
        f.write(readme)

    print(f"\nGenerated README.md:")
    print(f"  {counts['with_erd']} with schema")
    print(f"  {counts['empty']} no tables")
    print(f"  {total} total")


if __name__ == "__main__":
    main()
