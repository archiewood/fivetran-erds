CREATE TABLE capacity_admin (
    "index" text,
    capacity_id text,
    "admin" text,
    PRIMARY KEY ("index", capacity_id),
    FOREIGN KEY (capacity_id) REFERENCES capacity(id)
);

CREATE TABLE capacity (
    id text,
    access_right text,
    display_name text,
    region text,
    sku text,
    "state" text,
    tenant_key_created_at text,
    tenant_key_id text,
    tenant_key_is_default text,
    tenant_key_name text,
    tenant_key_updated_at text,
    tenant_key_vault_identifier text,
    PRIMARY KEY (id)
);

CREATE TABLE app (
    id text,
    workspace_id text,
    description text,
    last_update text,
    "name" text,
    published_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);

CREATE TABLE gateway (
    id text,
    annotation text,
    "name" text,
    public_key_exponent text,
    public_key_modulus text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE group_user (
    "index" text,
    workspace_id text,
    display_name text,
    email_address text,
    graph_id text,
    group_user_access_right text,
    identifier text,
    principal_type text,
    profile text,
    user_type text,
    PRIMARY KEY ("index", workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);

CREATE TABLE group_workbook (
    "index" text,
    workspace_id text,
    dataset_id text,
    "name" text,
    PRIMARY KEY ("index", workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

CREATE TABLE groups (
    workspace_id text,
    capacity_id text,
    pipeline_id text,
    capacity_migration_status text,
    dataflow_storage_id text,
    default_dataset_storage_format text,
    description text,
    has_workspace_level_settings text,
    is_on_dedicated_capacity text,
    is_read_only text,
    log_analytics_workspace text,
    "name" text,
    "state" text,
    "type" text,
    PRIMARY KEY (workspace_id),
    FOREIGN KEY (capacity_id) REFERENCES capacity(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE dataflow (
    id text,
    workspace_id text,
    configured_by text,
    description text,
    generation text,
    model_url text,
    modified_by text,
    modified_date_time text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);

CREATE TABLE dataset_upstream (
    dataset_id text,
    workspace_id text,
    dataflow_id text,
    PRIMARY KEY (dataset_id, workspace_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id),
    FOREIGN KEY (dataflow_id) REFERENCES dataflow(id)
);

CREATE TABLE dataset (
    id text,
    workspace_id text,
    add_rows_api_enabled text,
    configured_by text,
    content_provider_type text,
    create_report_embed_url text,
    created_date timestamp,
    description text,
    is_effective_identity_required text,
    is_effective_identity_roles_required text,
    is_in_place_sharing_enabled text,
    is_on_prem_gateway_required text,
    is_refreshable text,
    "name" text,
    qna_embed_url text,
    query_scale_out_setting_auto_sync_read_only_replicas text,
    query_scale_out_setting_max_read_only_replicas text,
    target_storage_mode text,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);

CREATE TABLE dashboard_tile (
    id text,
    dashboard_id text,
    dataset_id text,
    report_id text,
    col_span text,
    embed_data text,
    embed_url text,
    row_span text,
    title text,
    PRIMARY KEY (id, dashboard_id),
    FOREIGN KEY (dashboard_id) REFERENCES dashboard(id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE dashboard (
    id text,
    app_id text,
    workspace_id text,
    display_name text,
    embed_url text,
    is_read_only text,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);

CREATE TABLE pipeline_stage (
    "index" text,
    pipeline_id text,
    workspace_id text,
    orders text,
    PRIMARY KEY ("index", pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);

CREATE TABLE pipeline_user (
    "index" text,
    pipeline_id text,
    access_right text,
    identifier text,
    principal_type text,
    PRIMARY KEY ("index", pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline (
    id text,
    description text,
    display_name text,
    PRIMARY KEY (id)
);

CREATE TABLE refreshable_configured_by (
    "index" text,
    refreshable_id text,
    configured_by text,
    PRIMARY KEY ("index", refreshable_id),
    FOREIGN KEY (refreshable_id) REFERENCES refreshable(id)
);

CREATE TABLE refreshable (
    id text,
    average_duration text,
    count text,
    end_time text,
    failures text,
    groups text,
    kind text,
    last_refresh_attempts text,
    last_refresh_end_time text,
    last_refresh_extended_status text,
    last_refresh_id text,
    last_refresh_request_id text,
    last_refresh_service_exception_json text,
    last_refresh_start_time text,
    last_refresh_status text,
    last_refresh_type text,
    median_duration text,
    "name" text,
    per_day text,
    refresh_schedule_days jsonb,
    refresh_schedule_enabled text,
    refresh_schedule_local_time_zone_id text,
    refresh_schedule_notify_option text,
    refresh_schedule_times jsonb,
    schedule text,
    start_time timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE report (
    id text,
    app_id text,
    dataset_id text,
    workspace_id text,
    created_by text,
    created_date_time text,
    description text,
    embed_url text,
    is_ownedby_me text,
    modified_by text,
    modified_date_time timestamp,
    "name" text,
    original_report_id text,
    "type" text,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id),
    FOREIGN KEY (workspace_id) REFERENCES groups(workspace_id)
);
