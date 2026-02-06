CREATE TABLE audit_log_event (
    id text,
    account_id text,
    actor text,
    created_at text,
    event_context text,
    event_label text,
    event_type text,
    service text,
    "source" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE project (
    id text,
    account_id text,
    connection_id text,
    docs_job_id text,
    freshness_job_id text,
    repository_id text,
    created_at text,
    dbt_project_subdirectory text,
    group_permissions jsonb,
    "name" text,
    semantic_layer_config_id text,
    skipped_setup text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (docs_job_id) REFERENCES job(id),
    FOREIGN KEY (freshness_job_id) REFERENCES job(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE run_step (
    id text,
    account_id text,
    run_id text,
    created_at text,
    debug_log text,
    debug_log_path text,
    duration text,
    duration_humanized text,
    finished_at text,
    "index" text,
    log_archive_type text,
    log_location text,
    log_path text,
    "name" text,
    run_step_command text,
    started_at text,
    "status" text,
    status_color text,
    status_humanized text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (run_id) REFERENCES run(id)
);

CREATE TABLE run_trigger (
    id text,
    run_id text,
    azure_pull_request_id text,
    cause_category text,
    cause_humanized text,
    created_at text,
    dbt_version_override text,
    generate_docs_override text,
    git_branch text,
    git_sha text,
    github_pull_request_id text,
    gitlab_merge_request_id text,
    job text,
    job_definition_id text,
    non_native_pull_request_id text,
    schema_override text,
    steps_override text,
    target_name_override text,
    threads_override text,
    timeout_seconds_override text,
    PRIMARY KEY (id),
    FOREIGN KEY (run_id) REFERENCES run(id)
);

CREATE TABLE run (
    id text,
    account_id text,
    environment_id text,
    job_id text,
    project_id text,
    artifact_s_3_path text,
    artifacts_saved text,
    blocked_by jsonb,
    created_at text,
    created_at_humanized text,
    dbt_version text,
    deferring_run_id text,
    dequeued_at text,
    duration text,
    duration_humanized text,
    executed_by_thread_id text,
    finished_at text,
    finished_at_humanized text,
    git_branch text,
    git_sha text,
    has_docs_generated text,
    has_sources_generated text,
    href text,
    in_progress text,
    is_cancelled text,
    is_complete text,
    is_error text,
    is_running text,
    is_success text,
    last_checked_at text,
    last_heartbeat_at text,
    notifications_sent text,
    owner_thread_id text,
    queued_duration text,
    queued_duration_humanized text,
    run_duration text,
    run_duration_humanized text,
    scribe_enabled text,
    should_start_at text,
    started_at text,
    "status" text,
    status_humanized text,
    status_message text,
    trigger_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE repository (
    id text,
    account_id text,
    project_id text,
    created_at text,
    deploy_key_id text,
    deploy_key_state text,
    full_name text,
    git_clone_strategy text,
    git_provider_id text,
    git_provider_state text,
    github_installation_id text,
    github_repo text,
    github_webhook_id text,
    gitlab_id text,
    gitlab_project_access_token_id text,
    gitlab_state text,
    "name" text,
    private_link_endpoint_id text,
    pull_request_url_template text,
    remote_backend text,
    remote_url text,
    repository_credentials_id text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE notification_on_failure (
    "index" text,
    notification_id text,
    on_failure text,
    PRIMARY KEY ("index", notification_id),
    FOREIGN KEY (notification_id) REFERENCES notification(id)
);

CREATE TABLE notification_on_cancel (
    "index" text,
    notification_id text,
    on_cancel text,
    PRIMARY KEY ("index", notification_id),
    FOREIGN KEY (notification_id) REFERENCES notification(id)
);

CREATE TABLE notification_on_success (
    "index" text,
    notification_id text,
    on_success text,
    PRIMARY KEY ("index", notification_id),
    FOREIGN KEY (notification_id) REFERENCES notification(id)
);

CREATE TABLE notification (
    id text,
    account_id text,
    user_id text,
    created_at text,
    external_email text,
    slack_channel_id text,
    slack_channel_name text,
    "state" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE connection (
    id text,
    account_id text,
    adapter_version text,
    created_at text,
    is_ssh_tunnel_enabled text,
    "name" text,
    oauth_configuration_id text,
    platform_metadata_credentials_id text,
    private_link_endpoint_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE run_artifact (
    run_artifact_id text,
    account_id text,
    run_id text,
    PRIMARY KEY (run_artifact_id, account_id, run_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (run_id) REFERENCES run(id)
);

CREATE TABLE auth_provider_user_groups (
    _fivetran_id text,
    users_id text,
    group_name text,
    PRIMARY KEY (_fivetran_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE group_permission (
    id text,
    account_id text,
    group_id text,
    project_id text,
    all_projects text,
    created_at text,
    permission_level text,
    permission_set text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE groups (
    id text,
    permission_id text,
    account_id text,
    assign_by_default text,
    created_at text,
    "name" text,
    sso_mapping_group jsonb,
    "state" text,
    updated_at text,
    PRIMARY KEY (id, permission_id),
    FOREIGN KEY (permission_id) REFERENCES permission(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE permission_statement (
    _fivetran_id text,
    permission_id text,
    all_resources text,
    permission text,
    target_resource text,
    PRIMARY KEY (_fivetran_id, permission_id),
    FOREIGN KEY (permission_id) REFERENCES permission(id)
);

CREATE TABLE permission (
    id text,
    account_id text,
    user_id text,
    created_at text,
    license_type text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    auth_provider_infos_qw_corp_auth_provider_type text,
    auth_provider_infos_qw_corp_domain text,
    avatar_url text,
    azure_active_directory_connected text,
    azure_active_directory_username text,
    created_at text,
    email text,
    email_connected text,
    email_verified text,
    enterprise_authentication_method text,
    enterprise_connected text,
    first_name text,
    fullname text,
    github_connected text,
    github_username text,
    gitlab_connected text,
    gitlab_username text,
    is_active text,
    is_staff text,
    last_login text,
    last_name text,
    show_existing_user_email_verification text,
    slack_connected text,
    PRIMARY KEY (id)
);

CREATE TABLE environment (
    id text,
    account_id text,
    connection_id text,
    created_by_id text,
    project_id text,
    repository_id text,
    credentials_id text,
    custom_branch text,
    dbt_project_subdirectory text,
    dbt_version text,
    "name" text,
    raw_dbt_version text,
    "state" text,
    supports_docs text,
    updated_at text,
    use_custom_branch text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE job_execute_step (
    "index" text,
    job_id text,
    execute_step text,
    PRIMARY KEY ("index", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_schedule_date_day (
    "index" text,
    job_id text,
    schedule_date_day text,
    PRIMARY KEY ("index", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    account_id text,
    environment_id text,
    project_id text,
    created_at text,
    cron_humanized text,
    dbt_version text,
    deactivated text,
    deferring_environment_id text,
    deferring_job_definition_id text,
    execution_timeout_seconds text,
    generate_docs text,
    generate_sources text,
    is_deferrable text,
    job_type text,
    lifecycle_webhooks text,
    lifecycle_webhooks_url text,
    most_recent_completed_run jsonb,
    most_recent_run jsonb,
    "name" text,
    next_run text,
    next_run_humanized text,
    raw_dbt_version text,
    run_failure_count text,
    run_generate_sources text,
    schedule_cron text,
    schedule_date_type text,
    schedule_time_interval text,
    schedule_time_type text,
    settings_target_name text,
    settings_threads text,
    "state" text,
    triggers_custom_branch_only text,
    triggers_git_provider_webhook text,
    triggers_github_webhook text,
    triggers_schedule text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE account_migration_event (
    "index" text,
    account_id text,
    account_has_static_subdomain text,
    account_identifier text,
    background_job_id text,
    completed_at text,
    failed_at text,
    is_minidump text,
    "key" text,
    started_at text,
    "type" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_group (
    "index" text,
    account_id text,
    assign_by_default text,
    "name" text,
    sso_mapping_group text,
    "state" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    billing_email_address text,
    business_critical text,
    created_at text,
    develop_file_system text,
    develop_pod_memory_request_mebibyte text,
    developer_seat text,
    discovery_api_url text,
    enterprise_authentication_method text,
    enterprise_login_slug text,
    enterprise_unique_identifier text,
    explorer_seat text,
    git_auth_level text,
    identifier text,
    ip_restricted text,
    it_seat text,
    lock_cause text,
    lock_reason text,
    locked text,
    metronome_customer_id text,
    migration_scheduled_at text,
    "name" text,
    pending_cancel text,
    plan text,
    pod_memory_request_mebibyte text,
    queue_limit text,
    read_only_seat text,
    run_duration_limit_second text,
    run_locked_until text,
    run_slot text,
    salesforce_customer_id text,
    semantic_layer_graphql_api_url text,
    semantic_layer_jdbc_url text,
    semantic_layer_url text,
    starter_repo_url text,
    "state" text,
    static_subdomain text,
    static_url text,
    third_party_billing text,
    trial_end_date text,
    unlock_if_subscription_renewed text,
    unlocked_at text,
    updated_at text,
    PRIMARY KEY (id)
);
