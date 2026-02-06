CREATE TABLE project (
    created text,
    "name" text,
    description text,
    label text,
    url text,
    PRIMARY KEY (created, "name")
);

CREATE TABLE config_list (
    "name" text,
    category text,
    label text,
    "level" text,
    "value" text,
    PRIMARY KEY ("name")
);

CREATE TABLE config_meta_list (
    "key" text,
    auth_required text,
    category text,
    datatype text,
    default_value text,
    description text,
    encrypted text,
    label text,
    link text,
    required text,
    restart text,
    strata text,
    visibility text,
    PRIMARY KEY ("key")
);

CREATE TABLE plugin (
    "name" text,
    artifact_name text,
    author text,
    builtin text,
    description text,
    icon_url text,
    id text,
    plugin_version text,
    provider_metadata_faicon text,
    service text,
    title text,
    PRIMARY KEY ("name")
);

CREATE TABLE execution_successful_node (
    "index" text,
    execution_id text,
    successfulnode text,
    PRIMARY KEY ("index", execution_id),
    FOREIGN KEY (execution_id) REFERENCES execution(id)
);

CREATE TABLE execution_failed_node (
    "index" text,
    execution_id text,
    failednode text,
    PRIMARY KEY ("index", execution_id),
    FOREIGN KEY (execution_id) REFERENCES execution(id)
);

CREATE TABLE execution (
    id text,
    job_id text,
    argstring text,
    custom_status text,
    date_ended_date text,
    date_ended_unixtime text,
    date_started_date text,
    date_started_unixtime text,
    job_average_duration text,
    project text,
    server_uuid text,
    "status" text,
    users text,
    -- custom_options_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE system_info (
    _fivetran_id text,
    rundeck_server_uuid text,
    cpu_load_average text,
    cpu_processor text,
    duration text,
    epoch text,
    executions_active text,
    executions_execution_mode text,
    extended_rundeck_pro_build_git text,
    extended_rundeck_pro_edition text,
    extended_rundeck_pro_version text,
    healthcheck_content_type text,
    healthcheck_href text,
    jvm_implementation_version text,
    jvm_name text,
    jvm_vendor text,
    jvm_version text,
    load_average_average text,
    load_average_unit text,
    metrics_content_type text,
    metrics_href text,
    os_arch text,
    os_name text,
    os_version text,
    ping_content_type text,
    ping_href text,
    processors text,
    rundeck_apiversion text,
    rundeck_base text,
    rundeck_build text,
    rundeck_build_git text,
    rundeck_node text,
    rundeck_version text,
    stats_cpu_load_average_average text,
    stats_cpu_load_average_unit text,
    stats_memory_free text,
    stats_memory_max text,
    stats_memory_total text,
    stats_memory_unit text,
    stats_scheduler_running text,
    stats_scheduler_thread_pool_size text,
    stats_threads_active text,
    stats_uptime_since_datetime text,
    stats_uptime_since_unit text,
    thread_dump_content_type text,
    thread_dump_href text,
    timestamp_datetime text,
    timestamp_epoch text,
    timestamp_unit text,
    unit text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (rundeck_server_uuid) REFERENCES job(server_node_uuid)
);

CREATE TABLE log_storage (
    plugin_name text,
    enabled text,
    failed_count text,
    incomplete_count text,
    missing_count text,
    queued_count text,
    queued_incomplete_count text,
    queued_request_count text,
    queued_retries_count text,
    retries_count text,
    succeeded_count text,
    total_count text,
    PRIMARY KEY (plugin_name),
    FOREIGN KEY (plugin_name) REFERENCES plugin("name")
);

CREATE TABLE user_class (
    _fivetran_id text,
    message text,
    "state" text,
    -- custom_allocations_* (dynamic column),
    -- custom_entitled_* (dynamic column),
    -- custom_exceeded_* (dynamic column),
    -- custom_summary_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE user_profile (
    created text,
    login text,
    email text,
    first_name text,
    last_job text,
    last_name text,
    token text,
    updated text,
    PRIMARY KEY (created, login)
);

CREATE TABLE job (
    id text,
    project_name text,
    description text,
    enabled text,
    groups text,
    href text,
    "name" text,
    perma_link text,
    schedule_enabled text,
    scheduled text,
    server_node_uuid text,
    server_owner text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_name) REFERENCES project("name")
);
