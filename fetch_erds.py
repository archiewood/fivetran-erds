#!/usr/bin/env python3
"""Fetch ERD JSON for all Fivetran application connectors."""

import json
import os
from concurrent.futures import ThreadPoolExecutor, as_completed
from urllib.request import urlopen, Request
from urllib.error import HTTPError, URLError

METADATA_URL = "https://api.fivetran.com/public/connector-types"
ERD_URL_TEMPLATE = "https://fivetran.com/_/api/service-erd/{id}/schema-content/public"
OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "erd")
MAX_WORKERS = 5


def fetch_json(url):
    req = Request(url, headers={"Accept": "application/json"})
    with urlopen(req, timeout=30) as resp:
        return json.loads(resp.read().decode())


def get_connector_ids():
    """Fetch all connector types and return those with ERD links."""
    print("Fetching connector metadata from Fivetran API...")
    data = fetch_json(METADATA_URL)
    connectors = data.get("data", data) if isinstance(data, dict) else data

    with_erd = []
    for c in connectors:
        cid = c.get("id", "")
        name = c.get("name", cid)
        link = c.get("link_to_erd", "")
        if link:
            with_erd.append({"id": cid, "name": name})

    print(f"Found {len(with_erd)} connectors with ERD data (out of {len(connectors)} total)")
    return with_erd


def fetch_erd(connector):
    """Fetch ERD JSON for a single connector. Returns (connector, result_dict)."""
    cid = connector["id"]
    url = ERD_URL_TEMPLATE.format(id=cid)
    try:
        erd_data = fetch_json(url)
        table_count = len(erd_data.get("tables", []))
        return connector, {"success": True, "tables": table_count, "data": erd_data}
    except HTTPError as e:
        # Try with hyphens if the ID had underscores
        if "_" in cid:
            alt_id = cid.replace("_", "-")
            alt_url = ERD_URL_TEMPLATE.format(id=alt_id)
            try:
                erd_data = fetch_json(alt_url)
                table_count = len(erd_data.get("tables", []))
                return connector, {"success": True, "tables": table_count, "data": erd_data, "used_id": alt_id}
            except Exception:
                pass
        return connector, {"success": False, "error": f"HTTP {e.code}"}
    except (URLError, Exception) as e:
        return connector, {"success": False, "error": str(e)}


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    connectors = get_connector_ids()

    index = []
    success_count = 0
    fail_count = 0

    print(f"Fetching ERD data for {len(connectors)} connectors ({MAX_WORKERS} parallel)...\n")

    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as pool:
        futures = {pool.submit(fetch_erd, c): c for c in connectors}

        for i, future in enumerate(as_completed(futures), 1):
            connector, result = future.result()
            cid = connector["id"]
            name = connector["name"]

            if result["success"]:
                # Save the ERD JSON
                file_id = result.get("used_id", cid)
                path = os.path.join(OUTPUT_DIR, f"{file_id}.json")
                with open(path, "w") as f:
                    json.dump(result["data"], f, indent=2)

                success_count += 1
                index.append({
                    "id": cid,
                    "file_id": file_id,
                    "name": name,
                    "tables": result["tables"],
                    "status": "ok",
                })
                print(f"  [{i}/{len(connectors)}] {cid}: {result['tables']} tables")
            else:
                fail_count += 1
                index.append({
                    "id": cid,
                    "name": name,
                    "status": "error",
                    "error": result["error"],
                })
                print(f"  [{i}/{len(connectors)}] {cid}: FAILED - {result['error']}")

    # Sort index by id
    index.sort(key=lambda x: x["id"])

    # Write index
    index_path = os.path.join(OUTPUT_DIR, "index.json")
    with open(index_path, "w") as f:
        json.dump({"total": len(connectors), "success": success_count, "failed": fail_count, "connectors": index}, f, indent=2)

    print(f"\nDone! {success_count} succeeded, {fail_count} failed.")
    print(f"Files saved to: {OUTPUT_DIR}/")
    print(f"Index: {index_path}")


if __name__ == "__main__":
    main()
