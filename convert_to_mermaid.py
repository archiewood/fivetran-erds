#!/usr/bin/env python3
"""Convert Fivetran ERD JSON files to Mermaid ER diagrams."""

import json
import os
import re

ERD_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "erd")
MERMAID_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "mermaid")

TYPE_MAP = {
    "String": "text",
    "Int": "integer",
    "Long": "bigint",
    "Boolean": "boolean",
    "Instant": "timestamp",
    "Json": "jsonb",
    "BigDecimal": "numeric",
    "Double": "double_precision",
    "Unknown": "text",
    "": "text",
}


def sanitize_name(name):
    """Mermaid entity/attribute names can't contain special chars; replace them."""
    return re.sub(r'[^a-zA-Z0-9_]', '_', name)


def md_to_comment(md_text):
    """Strip markdown formatting to plain text for Mermaid comments."""
    text = md_text.strip()
    text = re.sub(r'#+\s*', '', text)
    text = re.sub(r'\*\*([^*]+)\*\*', r'\1', text)
    text = re.sub(r'\*([^*]+)\*', r'\1', text)
    text = re.sub(r'\[([^\]]+)\]\([^)]+\)', r'\1', text)
    text = re.sub(r'^\s*[-*]\s+', '  - ', text, flags=re.MULTILINE)
    text = re.sub(r'\n{2,}', '\n', text)
    text = text.strip()
    if not text:
        return ""
    return "\n".join(f"%% {line}" if line.strip() else "%%" for line in text.splitlines())


def convert_erd(data):
    lines = ["erDiagram"]

    notes = data.get("notes", {})
    general_notes = notes.get("generalNotes", [])
    table_notes = notes.get("byTable", {})

    for gn in general_notes:
        comment = md_to_comment(gn.get("content", ""))
        if comment:
            lines.append(comment)

    for table in data.get("tables", []):
        tname = table["name"]
        safe_tname = sanitize_name(tname)
        columns = table.get("columns", [])

        if tname in table_notes:
            comment = md_to_comment(table_notes[tname].get("content", ""))
            if comment:
                lines.append(f"    {comment}")

        lines.append(f"    {safe_tname} {{")
        for col in columns:
            if col.get("wildCard"):
                continue
            cname = sanitize_name(col["name"])
            ctype = TYPE_MAP.get(col.get("type", ""), "text")
            marker = ""
            if col.get("primaryKey"):
                marker = " PK"
            elif col.get("foreignKey"):
                marker = " FK"
            lines.append(f"        {ctype} {cname}{marker}")
        lines.append("    }")

    for rel in data.get("relations", []):
        src = sanitize_name(rel["sourceTable"])
        tgt = sanitize_name(rel["targetTable"])
        lines.append(f"    {src} }}o--|| {tgt} : \"fk\"")

    return "\n".join(lines) + "\n"


def main():
    os.makedirs(MERMAID_DIR, exist_ok=True)

    with open(os.path.join(ERD_DIR, "index.json")) as f:
        index = json.load(f)

    ok = [c for c in index["connectors"] if c["status"] == "ok"]
    print(f"Converting {len(ok)} connectors to Mermaid ER diagrams...\n")

    for entry in ok:
        file_id = entry.get("file_id", entry["id"])
        erd_path = os.path.join(ERD_DIR, f"{file_id}.json")

        with open(erd_path) as f:
            data = json.load(f)

        mermaid = convert_erd(data)
        mermaid_path = os.path.join(MERMAID_DIR, f"{file_id}.mermaid")
        with open(mermaid_path, "w") as f:
            f.write(mermaid)

        print(f"  {file_id}: {entry['tables']} tables -> {mermaid_path}")

    print(f"\nDone! {len(ok)} Mermaid files written to {MERMAID_DIR}/")


if __name__ == "__main__":
    main()
