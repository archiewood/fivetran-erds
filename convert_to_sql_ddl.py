#!/usr/bin/env python3
"""Convert Fivetran ERD JSON files to compact SQL DDL."""

import json
import os
import re
from collections import defaultdict

ERD_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "erd")
SQL_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "ddl")

TYPE_MAP = {
    "String": "text",
    "Int": "integer",
    "Long": "bigint",
    "Boolean": "boolean",
    "Instant": "timestamp",
    "Json": "jsonb",
    "BigDecimal": "numeric",
    "Double": "double precision",
    "Unknown": "text",
    "": "text",
}

# Postgres reserved words that need quoting
RESERVED = {
    "end", "start", "order", "group", "user", "table", "column", "index",
    "type", "comment", "key", "value", "default", "check", "primary",
    "foreign", "references", "constraint", "unique", "select", "from",
    "where", "and", "or", "not", "in", "like", "between", "join", "on",
    "create", "drop", "alter", "insert", "update", "delete", "set",
    "limit", "offset", "all", "as", "case", "when", "then", "else",
    "grant", "revoke", "role", "schema", "sequence", "trigger", "view",
    "function", "procedure", "return", "do", "begin", "declare",
    "condition", "current", "cursor", "date", "day", "hour", "interval",
    "level", "minute", "month", "name", "national", "natural", "new",
    "old", "open", "option", "output", "partition", "path", "position",
    "range", "read", "release", "repeat", "result", "row", "rows",
    "second", "section", "session", "size", "source", "state", "status",
    "time", "timestamp", "to", "transaction", "translate", "work", "write",
    "year", "zone", "action", "admin", "array", "both", "call", "cast",
}


def quote_id(name):
    if name.lower() in RESERVED or not name.isidentifier():
        return f'"{name}"'
    return name


def md_to_comment(md_text):
    """Strip markdown formatting down to plain text for SQL comments."""
    text = md_text.strip()
    text = re.sub(r'#+\s*', '', text)  # strip heading markers
    text = re.sub(r'\*\*([^*]+)\*\*', r'\1', text)  # bold
    text = re.sub(r'\*([^*]+)\*', r'\1', text)  # italic
    text = re.sub(r'\[([^\]]+)\]\([^)]+\)', r'\1', text)  # links -> text
    text = re.sub(r'^\s*[-*]\s+', '  - ', text, flags=re.MULTILINE)  # list items
    text = re.sub(r'\n{2,}', '\n', text)  # collapse blank lines
    text = text.strip()
    if not text:
        return ""
    return "\n".join(f"-- {line}" if line.strip() else "--" for line in text.splitlines())


def convert_erd(data):
    lines = []

    notes = data.get("notes", {})
    general_notes = notes.get("generalNotes", [])
    table_notes = notes.get("byTable", {})

    # Add general notes at top of file
    for gn in general_notes:
        comment = md_to_comment(gn.get("content", ""))
        if comment:
            lines.append(comment)
            lines.append("")

    # Build relation lookup: (source_table, source_col) -> (target_table, target_col)
    fk_map = defaultdict(list)
    for rel in data.get("relations", []):
        src_table = rel["sourceTable"]
        tgt_table = rel["targetTable"]
        for src_col, tgt_col in zip(rel["sourceColumns"], rel["targetColumns"]):
            fk_map[(src_table, src_col)].append((tgt_table, tgt_col))

    for table in data.get("tables", []):
        tname = table["name"]
        columns = table.get("columns", [])

        # Add table-level note as comment
        if tname in table_notes:
            comment = md_to_comment(table_notes[tname].get("content", ""))
            if comment:
                lines.append(comment)

        pks = [c["name"] for c in columns if c.get("primaryKey")]
        fks = []  # (src_col, tgt_table, tgt_col)

        col_lines = []
        for col in columns:
            cname = col["name"]
            ctype = TYPE_MAP.get(col.get("type", ""), "text")

            if col.get("wildCard"):
                col_lines.append(f"    -- {cname} (dynamic column)")
                continue

            col_lines.append(f"    {quote_id(cname)} {ctype}")

            # Collect FK info from relations
            for tgt_table, tgt_col in fk_map.get((tname, cname), []):
                fks.append((cname, tgt_table, tgt_col))

        # Add PK constraint
        if len(pks) > 0:
            pk_cols = ", ".join(quote_id(p) for p in pks)
            col_lines.append(f"    PRIMARY KEY ({pk_cols})")

        # Add FK constraints
        for src_col, tgt_table, tgt_col in fks:
            col_lines.append(
                f"    FOREIGN KEY ({quote_id(src_col)}) REFERENCES {quote_id(tgt_table)}({quote_id(tgt_col)})"
            )

        lines.append(f"CREATE TABLE {quote_id(tname)} (")
        lines.append(",\n".join(col_lines))
        lines.append(");\n")

    return "\n".join(lines)


def main():
    os.makedirs(SQL_DIR, exist_ok=True)

    with open(os.path.join(ERD_DIR, "index.json")) as f:
        index = json.load(f)

    ok = [c for c in index["connectors"] if c["status"] == "ok"]
    print(f"Converting {len(ok)} connectors to SQL DDL...\n")

    for entry in ok:
        file_id = entry.get("file_id", entry["id"])
        erd_path = os.path.join(ERD_DIR, f"{file_id}.json")

        with open(erd_path) as f:
            data = json.load(f)

        sql = convert_erd(data)
        sql_path = os.path.join(SQL_DIR, f"{file_id}.sql")
        with open(sql_path, "w") as f:
            f.write(sql)

        print(f"  {file_id}: {entry['tables']} tables -> {sql_path}")

    print(f"\nDone! {len(ok)} SQL files written to {SQL_DIR}/")


if __name__ == "__main__":
    main()
