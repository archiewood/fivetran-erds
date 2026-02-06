CREATE TABLE workbook_revision (
    revision_number text,
    workbook_id text,
    site_id text,
    user_id text,
    is_current text,
    is_deleted text,
    published_at text,
    size_in_byte text,
    PRIMARY KEY (revision_number, workbook_id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE data_source_permission_grantee_capabilities_capability (
    "index" text,
    data_source_permission_grantee_capability_index text,
    data_source_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", data_source_permission_grantee_capability_index, data_source_permission_id),
    FOREIGN KEY (data_source_permission_grantee_capability_index) REFERENCES data_source_permission_grantee_capability("index"),
    FOREIGN KEY (data_source_permission_id) REFERENCES data_source_permission_grantee_capability(data_source_permission_id)
);

CREATE TABLE data_source_permission_grantee_capability (
    "index" text,
    data_source_permission_id text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", data_source_permission_id),
    FOREIGN KEY (data_source_permission_id) REFERENCES data_source_permission(id)
);

CREATE TABLE data_source_permission (
    id text,
    parent_id text,
    site_id text,
    datasource_owner_id text,
    "name" text,
    parent_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES data_source(id),
    FOREIGN KEY (parent_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE project (
    id text,
    controlling_permissions_project_id text,
    owner_id text,
    parent_project_id text,
    site_id text,
    content_permission text,
    created_at text,
    datasource_count text,
    description text,
    "name" text,
    project_count text,
    top_level_project text,
    updated_at text,
    view_count text,
    workbook_count text,
    writeable text,
    PRIMARY KEY (id),
    FOREIGN KEY (controlling_permissions_project_id) REFERENCES project(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_project_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE flow_connection (
    id text,
    flow_id text,
    site_id text,
    embed_password text,
    query_tagging_enabled text,
    server_address text,
    "type" text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (flow_id) REFERENCES flow(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE "view" (
    id text,
    owner_id text,
    site_id text,
    workbook_id text,
    content_url text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE extract_refresh_task (
    id text,
    datasource_id text,
    schedule_id text,
    site_id text,
    workbook_id text,
    consecutive_failed_count text,
    priority text,
    schedule_frequency text,
    schedule_frequency_details_interval_weekday jsonb,
    schedule_frequency_details_start text,
    schedule_next_run_at text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (datasource_id) REFERENCES data_source(id),
    FOREIGN KEY (schedule_id) REFERENCES server_schedule(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE server_schedule (
    id text,
    site_id text,
    created_at text,
    end_schedule_at text,
    frequency text,
    "name" text,
    next_run_at text,
    priority text,
    "state" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE virtual_connection_permission_grantee_capabilities_capability (
    "index" text,
    virtual_connection_permission_grantee_capability_index text,
    virtual_connection_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", virtual_connection_permission_grantee_capability_index, virtual_connection_permission_id),
    FOREIGN KEY (virtual_connection_permission_grantee_capability_index) REFERENCES virtual_connection_permission_grantee_capability("index"),
    FOREIGN KEY (virtual_connection_permission_id) REFERENCES virtual_connection_permission_grantee_capability(virtual_connection_permission_id)
);

CREATE TABLE virtual_connection_permission_grantee_capability (
    "index" text,
    virtual_connection_permission_id text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", virtual_connection_permission_id),
    FOREIGN KEY (virtual_connection_permission_id) REFERENCES virtual_connection_permission(id)
);

CREATE TABLE virtual_connection_permission (
    id text,
    site_id text,
    "name" text,
    virtual_connection_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES virtual_connection(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE connected_app (
    _fivetran_id text,
    owner_id text,
    site_id text,
    workbook_id text,
    content_url text,
    id text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE data_source_connection (
    id text,
    data_source_id text,
    site_id text,
    authentication_type text,
    embed_password text,
    query_tagging_enabled text,
    server_address text,
    server_port text,
    "type" text,
    use_oauth_managed_key_chain text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_source_id) REFERENCES data_source(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE users_personal_access_token (
    id text,
    site_id text,
    expires_at text,
    last_used_at text,
    token_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE flow_parameter (
    id text,
    flow_id text,
    description text,
    domain_type text,
    domain_xsi_type text,
    "name" text,
    site_id text,
    "type" text,
    PRIMARY KEY (id, flow_id),
    FOREIGN KEY (flow_id) REFERENCES flow(id)
);

CREATE TABLE flow_tag (
    "index" text,
    flow_id text,
    label text,
    PRIMARY KEY ("index", flow_id),
    FOREIGN KEY (flow_id) REFERENCES flow(id)
);

CREATE TABLE flow (
    id text,
    owner_id text,
    project_id text,
    site_id text,
    created_at text,
    description text,
    file_type text,
    "name" text,
    updated_at text,
    webpage_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE databases_default_permission_capability (
    "index" text,
    databases_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", databases_default_permission_id),
    FOREIGN KEY (databases_default_permission_id) REFERENCES databases_default_permission(id)
);

CREATE TABLE databases_default_permission (
    id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    project_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE table_default_permission_capability (
    "index" text,
    table_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", table_default_permission_id),
    FOREIGN KEY (table_default_permission_id) REFERENCES table_default_permission(id)
);

CREATE TABLE table_default_permission (
    id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    project_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE users (
    id text,
    site_id text,
    auth_setting text,
    domain_name text,
    email text,
    external_auth_user_id text,
    full_name text,
    languages text,
    last_login text,
    locale text,
    "name" text,
    site_role text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE data_source_tag (
    label text,
    data_source_id text,
    site_id text,
    PRIMARY KEY (label, data_source_id),
    FOREIGN KEY (data_source_id) REFERENCES data_source(id)
);

CREATE TABLE data_source (
    id text,
    owner_id text,
    project_id text,
    site_id text,
    content_url text,
    created_at text,
    description text,
    encrypt_extract text,
    has_extract text,
    is_certified text,
    "name" text,
    updated_at text,
    use_remote_query_agent text,
    webpage_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE workbook_connection (
    id text,
    site_id text,
    workbook_id text,
    authentication_type text,
    datasource_id text,
    datasource_name text,
    embed_password text,
    query_tagging_enabled text,
    server_address text,
    server_port text,
    "type" text,
    use_oauth_managed_key_chain text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE virtual_connection_database_connection (
    id text,
    site_id text,
    virtual_connection_id text,
    db_class text,
    port text,
    server text,
    server_address text,
    server_port text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (virtual_connection_id) REFERENCES virtual_connection(id)
);

CREATE TABLE data_source_revision (
    revision_number text,
    data_source_id text,
    site_id text,
    user_id text,
    is_current text,
    is_deleted text,
    published_at text,
    size_in_byte text,
    PRIMARY KEY (revision_number, data_source_id),
    FOREIGN KEY (data_source_id) REFERENCES data_source(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job (
    id text,
    site_id text,
    created_at timestamp,
    ended_at text,
    job_type text,
    priority text,
    started_at text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE favorite (
    label text,
    users_id text,
    datasource_id text,
    site_id text,
    view_id text,
    workbook_id text,
    view_created_at text,
    view_updated_at text,
    view_url_name text,
    PRIMARY KEY (label, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (datasource_id) REFERENCES data_source(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (view_id) REFERENCES "view"(id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE user_notification (
    _fivetran_id text,
    site_id text,
    channel text,
    disabled_by_override text,
    enabled text,
    id text,
    notification_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE subscription (
    id text,
    schedule_id text,
    site_id text,
    user_id text,
    attach_image text,
    attach_pdf text,
    content_id text,
    content_send_if_view_empty text,
    content_type text,
    page_orientation text,
    page_size_option text,
    schedule_frequency_details_interval_weekday text,
    schedule_frequency_details_start text,
    subject text,
    suspended text,
    PRIMARY KEY (id),
    FOREIGN KEY (schedule_id) REFERENCES server_schedule(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE view_permission_grantee_capabilities_capability (
    "index" text,
    view_permission_grantee_capability_index text,
    view_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", view_permission_grantee_capability_index, view_permission_id),
    FOREIGN KEY (view_permission_grantee_capability_index) REFERENCES view_permission_grantee_capability("index"),
    FOREIGN KEY (view_permission_id) REFERENCES view_permission_grantee_capability(view_permission_id)
);

CREATE TABLE view_permission_grantee_capability (
    "index" text,
    view_permission_id text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", view_permission_id),
    FOREIGN KEY (view_permission_id) REFERENCES view_permission(id)
);

CREATE TABLE view_permission (
    id text,
    site_id text,
    view_owner_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES "view"(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (view_owner_id) REFERENCES users(id)
);

CREATE TABLE virtual_connection_default_permission_capability (
    "index" text,
    virtual_connection_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", virtual_connection_default_permission_id),
    FOREIGN KEY (virtual_connection_default_permission_id) REFERENCES virtual_connection_default_permission(id)
);

CREATE TABLE virtual_connection_default_permission (
    id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    project_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE workbook_default_permission_capability (
    "index" text,
    workbook_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", workbook_default_permission_id),
    FOREIGN KEY (workbook_default_permission_id) REFERENCES workbook_default_permission(id)
);

CREATE TABLE workbook_default_permission (
    id text,
    project_owner_id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (project_owner_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE data_source_default_permission_capability (
    "index" text,
    data_source_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", data_source_default_permission_id),
    FOREIGN KEY (data_source_default_permission_id) REFERENCES data_source_default_permission(id)
);

CREATE TABLE data_source_default_permission (
    id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    project_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE metric_default_permission_capability (
    "index" text,
    metric_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", metric_default_permission_id),
    FOREIGN KEY (metric_default_permission_id) REFERENCES metric_default_permission(id)
);

CREATE TABLE metric_default_permission (
    id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    project_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE flow_default_permission_capability (
    "index" text,
    flow_default_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", flow_default_permission_id),
    FOREIGN KEY (flow_default_permission_id) REFERENCES flow_default_permission(id)
);

CREATE TABLE flow_default_permission (
    id text,
    site_id text,
    grantee_capabilities_user_id text,
    "name" text,
    project_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE workbook_tag (
    label text,
    workbook_id text,
    site_id text,
    PRIMARY KEY (label, workbook_id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE workbook (
    id text,
    owner_id text,
    project_id text,
    site_id text,
    acceleration_enabled text,
    acceleration_last_updated_at text,
    acceleration_status text,
    content_url text,
    created_at text,
    default_view_id text,
    description text,
    encrypt_extract text,
    location_id text,
    location_name text,
    location_type text,
    "name" text,
    show_tab text,
    "size" text,
    updated_at text,
    webpage_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE flow_permission_grantee_capabilities_capability (
    "index" text,
    flow_permission_grantee_capability_index text,
    flow_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", flow_permission_grantee_capability_index, flow_permission_id),
    FOREIGN KEY (flow_permission_grantee_capability_index) REFERENCES flow_permission_grantee_capability("index"),
    FOREIGN KEY (flow_permission_id) REFERENCES flow_permission_grantee_capability(flow_permission_id)
);

CREATE TABLE flow_permission_grantee_capability (
    "index" text,
    flow_permission_id text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", flow_permission_id),
    FOREIGN KEY (flow_permission_id) REFERENCES flow_permission(id)
);

CREATE TABLE flow_permission (
    id text,
    parent_id text,
    site_id text,
    flow_owner_id text,
    "name" text,
    parent_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES flow(id),
    FOREIGN KEY (parent_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE groups (
    id text,
    user_id text,
    site_id text,
    domain_name text,
    import_domain_name text,
    import_grant_license_mode text,
    import_site_role text,
    import_source text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE virtual_connection (
    id text,
    site_id text,
    created_at timestamp,
    has_extracts text,
    is_certified text,
    "name" text,
    updated_at text,
    webpage_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    admin_mode text,
    allow_subscription_attachments text,
    ask_data_mode text,
    cache_warmup_enabled text,
    cataloging_enabled text,
    commenting_enabled text,
    content_url text,
    derived_permissions_enabled text,
    disable_subscriptions text,
    dqw_subscriptions_enabled text,
    editing_flows_enabled text,
    explain_data_enabled text,
    extract_encryption_mode text,
    guest_access_enabled text,
    is_data_alerts_enabled text,
    "name" text,
    request_access_enabled text,
    revision_history_enabled text,
    revision_limit text,
    run_now_enabled text,
    scheduling_flows_enabled text,
    "state" text,
    status_reason text,
    storage_quota text,
    subscribe_others_enabled text,
    time_zone text,
    use_default_time_zone text,
    user_quota text,
    PRIMARY KEY (id)
);

CREATE TABLE data_driven_alert (
    id text,
    created_id text,
    project_id text,
    site_id text,
    workbook_id text,
    created_at text,
    frequency text,
    owner_id text,
    public text,
    subject text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (workbook_id) REFERENCES workbook(id)
);

CREATE TABLE user_workbook (
    id text,
    owner_id text,
    project_id text,
    site_id text,
    content_url text,
    created_at text,
    data_acceleration_config text,
    default_view_id text,
    description text,
    encrypt_extract text,
    location_id text,
    location_name text,
    location_type text,
    "name" text,
    show_tabs text,
    "size" text,
    tags jsonb,
    updated_at text,
    webpage_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE project_permission_grantee_capabilities_capability (
    "index" text,
    project_permission_grantee_capability_index text,
    project_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", project_permission_grantee_capability_index, project_permission_id),
    FOREIGN KEY (project_permission_grantee_capability_index) REFERENCES project_permission_grantee_capability("index"),
    FOREIGN KEY (project_permission_id) REFERENCES project_permission_grantee_capability(project_permission_id)
);

CREATE TABLE project_permission_grantee_capability (
    "index" text,
    project_permission_id text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", project_permission_id),
    FOREIGN KEY (project_permission_id) REFERENCES project_permission(id)
);

CREATE TABLE project_permission (
    id text,
    project_owner_id text,
    site_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (project_owner_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE workbook_permission_grantee_capabilities_capability (
    "index" text,
    workbook_permission_grantee_capability_index text,
    workbook_permission_id text,
    mode text,
    "name" text,
    PRIMARY KEY ("index", workbook_permission_grantee_capability_index, workbook_permission_id),
    FOREIGN KEY (workbook_permission_grantee_capability_index) REFERENCES workbook_permission_grantee_capability("index"),
    FOREIGN KEY (workbook_permission_id) REFERENCES workbook_permission_grantee_capability(workbook_permission_id)
);

CREATE TABLE workbook_permission_grantee_capability (
    "index" text,
    workbook_permission_id text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", workbook_permission_id),
    FOREIGN KEY (workbook_permission_id) REFERENCES workbook_permission(id)
);

CREATE TABLE workbook_permission (
    id text,
    site_id text,
    "name" text,
    workbook_owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES workbook(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);
