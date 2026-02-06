CREATE TABLE project (
    id text,
    last_scan_id text,
    archived text,
    completed_scans text,
    critical text,
    high text,
    language text,
    last_scan_time text,
    low text,
    medium text,
    "name" text,
    note text,
    organization_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (last_scan_id) REFERENCES scan(id)
);

CREATE TABLE vulnerability_physical_location (
    _fivetran_id text,
    vulnerability_id text,
    artifact_location_uri text,
    context_region_snippet_rendered_text text,
    context_region_snippet_text text,
    context_region_start_line text,
    region_snippet_rendered_text text,
    region_snippet_text text,
    region_start_line text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (vulnerability_id) REFERENCES vulnerability(id)
);

CREATE TABLE vulnerability_code_flow_logical_location (
    _fivetran_id text,
    vulnerability_id text,
    fully_qualified_name text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (vulnerability_id) REFERENCES vulnerability_code_flow_location(vulnerability_id)
);

CREATE TABLE vulnerability_code_flow_location (
    vulnerability_id text,
    vulnerability_code_flow_index text,
    artifact_location_uri text,
    artifact_location_uri_base_id text,
    importance text,
    location_message_text text,
    location_regionsnippet_rendered_text text,
    location_regionsnippet_text text,
    location_regionstart_line text,
    -- region_property_* (dynamic column),
    -- state_property_* (dynamic column),
    PRIMARY KEY (vulnerability_id),
    FOREIGN KEY (vulnerability_id) REFERENCES vulnerability_code_flow(vulnerability_id),
    FOREIGN KEY (vulnerability_code_flow_index) REFERENCES vulnerability_code_flow("index")
);

CREATE TABLE vulnerability_code_flow (
    "index" text,
    vulnerability_id text,
    message_text text,
    -- code_flow_property_* (dynamic column),
    PRIMARY KEY ("index", vulnerability_id),
    FOREIGN KEY (vulnerability_id) REFERENCES vulnerability(id)
);

CREATE TABLE vulnerability (
    id text,
    project_id text,
    scan_id text,
    advice text,
    cwe jsonb,
    description text,
    first_created_time text,
    is_new text,
    issue text,
    last_seen_time text,
    last_updated_time text,
    learn jsonb,
    "level" text,
    message_text text,
    "name" text,
    organization_id text,
    owasp jsonb,
    recommendation text,
    reference jsonb,
    risk text,
    rule_id text,
    severity text,
    "status" text,
    -- fingerprint_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (scan_id) REFERENCES scan(id)
);

CREATE TABLE scan (
    id text,
    project_id text,
    code_artifact_id text,
    completed_time text,
    created_time text,
    error_message text,
    label text,
    started_time text,
    "status" text,
    total_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
