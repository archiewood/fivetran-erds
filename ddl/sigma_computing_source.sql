CREATE TABLE dataset_grant (
    id text,
    created_by text,
    dataset_id text,
    member_id text,
    team_id text,
    updated_by text,
    created_at text,
    inode_id text,
    organization_id text,
    permission text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE dataset (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    description text,
    is_archived text,
    "name" text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE team_member (
    member_id text,
    team_id text,
    is_team_admin text,
    PRIMARY KEY (member_id, team_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE user_attribute (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    default_value text,
    default_value_type text,
    default_value_val text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE workbook_query (
    id text,
    workbook_id text,
    error text,
    "name" text,
    sql text,
    PRIMARY KEY (id, workbook_id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE workbook_element_lineage_edge (
    "index" text,
    workbook_id text,
    workbook_query_id text,
    "source" text,
    target text,
    "type" text,
    PRIMARY KEY ("index", workbook_id, workbook_query_id),
    FOREIGN KEY (workbook_id) REFERENCES workbook_query(workbook_id),
    FOREIGN KEY (workbook_query_id) REFERENCES workbook_query(id),
    FOREIGN KEY ("source") REFERENCES workbook_element_lineage_dependency("key"),
    FOREIGN KEY (target) REFERENCES workbook_element_lineage_dependency("key")
);

CREATE TABLE workbook_element_lineage_dependency (
    "key" text,
    workbook_id text,
    workbook_query_id text,
    element_id text,
    "name" text,
    node_id text,
    "type" text,
    PRIMARY KEY ("key", workbook_id, workbook_query_id),
    FOREIGN KEY (workbook_id) REFERENCES workbook_query(workbook_id),
    FOREIGN KEY (workbook_query_id) REFERENCES workbook_query(id),
    FOREIGN KEY (element_id) REFERENCES workbook_query(id)
);

CREATE TABLE member (
    id text,
    created_by text,
    updated_by text,
    can_login text,
    created_at text,
    email text,
    first_name text,
    home_folder_id text,
    is_archived text,
    is_inactive text,
    last_name text,
    member_type text,
    organization_id text,
    profile_img_url text,
    updated_at text,
    user_kind text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE connection_writeback (
    "index" text,
    connection_id text,
    database text,
    "schema" text,
    PRIMARY KEY ("index", connection_id),
    FOREIGN KEY (connection_id) REFERENCES connection(id)
);

CREATE TABLE connection (
    id text,
    created_by text,
    updated_by text,
    account text,
    adhoc_pool_size text,
    catalog_pool_size text,
    created_at text,
    friendly_name text,
    host text,
    is_archived text,
    is_audit_log text,
    is_sample text,
    last_active_at text,
    materialization_warehouse text,
    "name" text,
    organization_id text,
    result_pool_size text,
    "role" text,
    schedule_pool_size text,
    timeout_dashboard text,
    timeout_defaults text,
    timeout_download text,
    timeout_work_sheet text,
    "type" text,
    updated_at text,
    use_oauth text,
    users text,
    warehouse text,
    write_access text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE connection_grant (
    id text,
    connection_id text,
    created_by text,
    member_id text,
    team_id text,
    updated_by text,
    created_at text,
    inode_id text,
    organization_id text,
    permission text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE team_grant (
    id text,
    team_id text,
    created_by text,
    member_id text,
    updated_by text,
    created_at text,
    inode_id text,
    inode_type text,
    organization_id text,
    permission text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE workspace (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE workbook_tag (
    "index" text,
    workbook_id text,
    version_tag_id text,
    PRIMARY KEY ("index", workbook_id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id),
    FOREIGN KEY (version_tag_id) REFERENCES tags(id)
);

CREATE TABLE workbook (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    is_archived text,
    latest_version text,
    "name" text,
    owner_id text,
    "path" text,
    updated_at text,
    url text,
    workbook_url_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE team (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    description text,
    is_archived text,
    "name" text,
    updated_at text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE file (
    id text,
    created_by text,
    parent_id text,
    updated_by text,
    badge text,
    created_at text,
    description text,
    is_archived text,
    "name" text,
    parent_url_id text,
    "path" text,
    permission text,
    "type" text,
    updated_at text,
    url_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (parent_id) REFERENCES workspace(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE dataset_materialization (
    _fivetran_id text,
    dataset_id text,
    code text,
    error_code text,
    error_message text,
    finished_at text,
    num_bytes text,
    num_rows text,
    runtime_secs text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

CREATE TABLE member_grant (
    id text,
    created_by text,
    member_id text,
    team_id text,
    updated_by text,
    created_at text,
    inode_id text,
    inode_type text,
    organization_id text,
    permission text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);

CREATE TABLE tags (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    is_archived text,
    "name" text,
    owner_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (updated_by) REFERENCES member(id)
);
