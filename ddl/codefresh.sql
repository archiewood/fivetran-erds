CREATE TABLE repos (
    uuid text,
    clone_url text,
    context text,
    default_branch text,
    features_create_branch text,
    features_merge_branch text,
    features_pull_request text,
    features_remove_branch text,
    id text,
    "name" text,
    open_issues text,
    org text,
    owner_avatar_url text,
    owner_login text,
    permissions_admin text,
    private text,
    provider text,
    pushed_at text,
    ssh_url text,
    PRIMARY KEY (uuid)
);

CREATE TABLE "trigger" (
    pipeline text,
    event text,
    filter_tag text,
    PRIMARY KEY (pipeline),
    FOREIGN KEY (pipeline) REFERENCES pipeline(id),
    FOREIGN KEY (event) REFERENCES trigger_event(uri)
);

CREATE TABLE build_system_event (
    id text,
    build_id text,
    kind text,
    message text,
    retriable text,
    step text,
    PRIMARY KEY (id, build_id),
    FOREIGN KEY (build_id) REFERENCES build(id)
);

CREATE TABLE build_annotation_env (
    enviroment_type text,
    build_annotation_id text,
    build_id text,
    PRIMARY KEY (enviroment_type, build_annotation_id, build_id),
    FOREIGN KEY (build_annotation_id) REFERENCES build_annotation(id),
    FOREIGN KEY (build_id) REFERENCES build_annotation(build_id)
);

CREATE TABLE build_annotation_user (
    user_name text,
    build_annotation_id text,
    build_id text,
    PRIMARY KEY (user_name, build_annotation_id, build_id),
    FOREIGN KEY (build_annotation_id) REFERENCES build_annotation(id),
    FOREIGN KEY (build_id) REFERENCES build_annotation(build_id)
);

CREATE TABLE build_annotation (
    id text,
    build_id text,
    display text,
    "key" text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, build_id),
    FOREIGN KEY (build_id) REFERENCES build(id)
);

CREATE TABLE build_step (
    steps text,
    build_id text,
    PRIMARY KEY (steps, build_id),
    FOREIGN KEY (build_id) REFERENCES build(id)
);

CREATE TABLE build_parent_info_scm_metadata (
    "name" text,
    build_id text,
    "value" text,
    PRIMARY KEY ("name", build_id),
    FOREIGN KEY (build_id) REFERENCES build(id)
);

CREATE TABLE build (
    id text,
    project_id text,
    triggered_by text,
    account text,
    auto_generated_yaml text,
    branch_name text,
    branch_url text,
    build_strategy text,
    commit_message text,
    commit_url text,
    committer text,
    committer_avatar text,
    created text,
    cron_event_description text,
    cron_event_message text,
    delayed text,
    event text,
    event_label text,
    event_name text,
    exposed_variables_pipeline_trigger_shared text,
    final_workflow_yaml text,
    finished text,
    has_extended_yaml text,
    has_implicit_git_clone_step text,
    initiator text,
    initiator_avatar text,
    keep_p_v_cs_for_pending_approval text,
    pack_id text,
    parent_workflow_info_buil_durl text,
    parent_workflow_info_pipeline_name text,
    parent_workflow_info_trigger_type text,
    parent_workflow_info_workflow_id text,
    pending_approval_concurrency_applied text,
    pending_license text,
    permit_restart_from_failed_step text,
    pipeline_name text,
    pipeline_trigger_id text,
    pipeline_trigger_name text,
    progress text,
    project text,
    provider text,
    repo_name text,
    repo_owner text,
    repo_url text,
    request text,
    revision text,
    runtime_scheduler_config_type text,
    service_id text,
    service_name text,
    started text,
    "status" text,
    termination_request jsonb,
    "trigger" text,
    trigger_type text,
    triggers_count text,
    use_debugger text,
    user_yaml_descriptor text,
    webhook_triggered text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (triggered_by) REFERENCES team_user(id)
);

CREATE TABLE build_exposed_variable_ops (
    _fivetran_id text,
    build_id text,
    "key" text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (build_id) REFERENCES build(id)
);

CREATE TABLE view_type_field (
    "name" text,
    view_type_name text,
    description text,
    PRIMARY KEY ("name", view_type_name),
    FOREIGN KEY (view_type_name) REFERENCES view_type("name")
);

CREATE TABLE view_type (
    "name" text,
    PRIMARY KEY ("name")
);

CREATE TABLE view_filter_value (
    "value" text,
    view_filter_id text,
    view_id text,
    PRIMARY KEY ("value", view_filter_id, view_id),
    FOREIGN KEY (view_filter_id) REFERENCES view_filter(id),
    FOREIGN KEY (view_id) REFERENCES view_filter(view_id)
);

CREATE TABLE view_filter (
    id text,
    view_id text,
    find_type text,
    selected_value text,
    PRIMARY KEY (id, view_id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE "view" (
    id text,
    account text,
    last_updated text,
    "name" text,
    tags jsonb,
    time_frame_start text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE context (
    _fivetran_id text,
    api_version text,
    kind text,
    metadata_default text,
    metadata_name text,
    metadata_system text,
    owner text,
    spec_sharing_policy text,
    spec_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE execution_context_assignment (
    execution_context_id text,
    pipeline_id text,
    id text,
    account text,
    PRIMARY KEY (execution_context_id, pipeline_id),
    FOREIGN KEY (id) REFERENCES execution_context(id)
);

CREATE TABLE summary (
    _fivetran_id text,
    environment_id text,
    deployments_fail text,
    deployments_pending text,
    deployments_ready text,
    pods_fail text,
    pods_pending text,
    pods_ready text,
    services_fail text,
    services_pending text,
    services_ready text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE all_existing_trigger_type_config (
    "index" text,
    all_existing_trigger_type_kind text,
    all_existing_trigger_type_type text,
    help text,
    image text,
    "name" text,
    name_label text,
    options_push text,
    required text,
    "type" text,
    validator text,
    PRIMARY KEY ("index", all_existing_trigger_type_kind, all_existing_trigger_type_type),
    FOREIGN KEY (all_existing_trigger_type_kind) REFERENCES all_existing_trigger_type(kind),
    FOREIGN KEY (all_existing_trigger_type_type) REFERENCES all_existing_trigger_type("type")
);

CREATE TABLE all_existing_trigger_type_filter (
    "index" text,
    all_existing_trigger_type_kind text,
    all_existing_trigger_type_type text,
    help text,
    "name" text,
    "type" text,
    validator text,
    PRIMARY KEY ("index", all_existing_trigger_type_kind, all_existing_trigger_type_type),
    FOREIGN KEY (all_existing_trigger_type_kind) REFERENCES all_existing_trigger_type(kind),
    FOREIGN KEY (all_existing_trigger_type_type) REFERENCES all_existing_trigger_type("type")
);

CREATE TABLE all_existing_trigger_type (
    kind text,
    "type" text,
    help_url text,
    service_url text,
    uri_regex text,
    uri_template text,
    PRIMARY KEY (kind, "type")
);

CREATE TABLE cluster (
    id text,
    account_id text,
    behind_firewall text,
    cluster_config text,
    helm_3 text,
    namespaces jsonb,
    provider text,
    provider_agent text,
    selector text,
    PRIMARY KEY (id)
);

CREATE TABLE project_tag (
    tags text,
    project_id text,
    PRIMARY KEY (tags, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_variable (
    _fivetran_id text,
    project_id text,
    encrypted text,
    "key" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_metadata (
    "name" text,
    project_id text,
    "value" text,
    PRIMARY KEY ("name", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    account_id text,
    favorite text,
    image text,
    pipeline_number text,
    project_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE runtime_environment_extend (
    "index" text,
    runtime_environment_name text,
    extends text,
    PRIMARY KEY ("index", runtime_environment_name),
    FOREIGN KEY (runtime_environment_name) REFERENCES runtime_environment("name")
);

CREATE TABLE runtime_environment (
    "name" text,
    description text,
    docker_daemon_scheduler_default_dind_resources_limits_cpu text,
    docker_daemon_scheduler_default_dind_resources_limits_dind_storage text,
    docker_daemon_scheduler_default_dind_resources_limits_memory text,
    status_healthy text,
    status_last_report_id text,
    status_manual_resolving text,
    status_valid_until text,
    version text,
    PRIMARY KEY ("name")
);

CREATE TABLE registry (
    id text,
    behind_firewall text,
    defaults text,
    deny_composite_domain text,
    domain text,
    fallback_registry text,
    internal text,
    is_primary text,
    kind text,
    "name" text,
    provider text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE incorrectly_configured_trigger_of_pipeline (
    id text,
    context text,
    "name" text,
    pipeline_name text,
    provider text,
    repo text,
    PRIMARY KEY (id)
);

CREATE TABLE environment_spec_filter (
    _fivetran_id text,
    environment_id text,
    cluster text,
    namespace text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE environment_spec_endpoint (
    _fivetran_id text,
    environment_id text,
    "name" text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE environment (
    id text,
    account_id text,
    created_at text,
    kind text,
    "name" text,
    spec_activities jsonb,
    spec_type text,
    updated_at text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_runtime (
    "index" text,
    agent_id text,
    agent_runtime text,
    PRIMARY KEY ("index", agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent (
    id text,
    account text,
    "name" text,
    status_health_status text,
    status_reported_at text,
    token_name text,
    PRIMARY KEY (id)
);

CREATE TABLE composition (
    id text,
    created_by text,
    updated_by text,
    account text,
    created text,
    entry_point text,
    is_advanced text,
    "name" text,
    updated text,
    v text,
    vars jsonb,
    yaml_json text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES team_user(id),
    FOREIGN KEY (updated_by) REFERENCES team_user(id)
);

CREATE TABLE rule_attribute (
    attributes text,
    rule_id text,
    PRIMARY KEY (attributes, rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE rule (
    id text,
    "action" text,
    resource text,
    "role" text,
    PRIMARY KEY (id)
);

CREATE TABLE pipeline_spec_stage (
    stage text,
    pipeline_id text,
    PRIMARY KEY (stage, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_spec_variable (
    _fivetran_id text,
    pipeline_id text,
    encrypted text,
    "key" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_spec_trigger_event (
    event text,
    pipeline_id text,
    pipeline_spec_trigger_id text,
    PRIMARY KEY (event, pipeline_id, pipeline_spec_trigger_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline_spec_trigger(pipeline_id),
    FOREIGN KEY (pipeline_spec_trigger_id) REFERENCES pipeline_spec_trigger(id)
);

CREATE TABLE pipeline_spec_trigger (
    id text,
    pipeline_id text,
    branch_regex text,
    branch_regex_input text,
    comment_regex text,
    context text,
    contexts jsonb,
    disabled text,
    gerrit_ci_status_labels text,
    last_execution_date text,
    "name" text,
    provider text,
    pull_request_allow_fork_events text,
    pull_request_target_branch_regex text,
    repo text,
    "status" text,
    "type" text,
    variables text,
    verified text,
    PRIMARY KEY (id, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_spec_step_init_command (
    command text,
    pipeline_id text,
    PRIMARY KEY (command, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_spec_step_update_ltaf_service_command (
    command text,
    pipeline_id text,
    PRIMARY KEY (command, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline (
    id text,
    project_id text,
    account_id text,
    created_at text,
    deprecate jsonb,
    kind text,
    label_tag jsonb,
    last_executed text,
    "name" text,
    original_yaml_string text,
    revision text,
    short_name text,
    spec_cluster_info_inject_all text,
    spec_context jsonb,
    spec_external_resources jsonb,
    spec_permit_restart_from_failed_steps text,
    spec_runtime_environment_cpu text,
    spec_runtime_environment_dind_storage text,
    spec_runtime_environment_memory text,
    spec_runtime_environment_name text,
    spec_step_init_image text,
    spec_step_init_stage text,
    spec_step_init_title text,
    spec_steps text,
    spec_steps_clone_helm_3_platform_git text,
    spec_steps_clone_helm_3_platform_repo text,
    spec_steps_clone_helm_3_platform_revision text,
    spec_steps_clone_helm_3_platform_stage text,
    spec_steps_clone_helm_3_platform_title text,
    spec_steps_clone_helm_3_platform_type text,
    spec_steps_freestyle_argument_image text,
    spec_steps_freestyle_title text,
    spec_steps_freestyle_type text,
    spec_steps_freestyle_working_directory text,
    spec_steps_update_ltaf_service_image text,
    spec_steps_update_ltaf_service_stage text,
    spec_steps_update_ltaf_service_title text,
    spec_steps_update_ltaf_service_working_directory text,
    spec_termination_policy jsonb,
    updated_at text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE trigger_event (
    _fivetran_id text,
    account text,
    description text,
    endpoint text,
    help text,
    kind text,
    secret text,
    "status" text,
    "type" text,
    uri text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE trigger_of_pipeline (
    id text,
    context text,
    "name" text,
    pipeline_name text,
    provider text,
    repo text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES build(pipeline_trigger_id),
    FOREIGN KEY (context) REFERENCES pipeline_spec_trigger(context)
);

CREATE TABLE team_user_role (
    user_role text,
    team_id text,
    team_user_id text,
    PRIMARY KEY (user_role, team_id, team_user_id),
    FOREIGN KEY (team_id) REFERENCES team_user(team_id),
    FOREIGN KEY (team_user_id) REFERENCES team_user(id)
);

CREATE TABLE team_user_account (
    account text,
    team_id text,
    team_user_id text,
    PRIMARY KEY (account, team_id, team_user_id),
    FOREIGN KEY (team_id) REFERENCES team_user(team_id),
    FOREIGN KEY (team_user_id) REFERENCES team_user(id)
);

CREATE TABLE team_user_email (
    user_email text,
    team_id text,
    team_user_id text,
    PRIMARY KEY (user_email, team_id, team_user_id),
    FOREIGN KEY (team_id) REFERENCES team_user(team_id),
    FOREIGN KEY (team_user_id) REFERENCES team_user(id)
);

CREATE TABLE team_user_notification (
    "index" text,
    team_id text,
    team_user_id text,
    event text,
    "type" text,
    PRIMARY KEY ("index", team_id, team_user_id),
    FOREIGN KEY (team_id) REFERENCES team_user(team_id),
    FOREIGN KEY (team_user_id) REFERENCES team_user(id)
);

CREATE TABLE team_user_login (
    "index" text,
    team_id text,
    team_user_id text,
    idp_id text,
    permission jsonb,
    personal_git text,
    sso text,
    user_id text,
    user_name text,
    PRIMARY KEY ("index", team_id, team_user_id),
    FOREIGN KEY (team_id) REFERENCES team_user(team_id),
    FOREIGN KEY (team_user_id) REFERENCES team_user(id)
);

CREATE TABLE team_user (
    id text,
    team_id text,
    default_account text,
    git_ops_setting jsonb,
    has_password text,
    invited_account text,
    last_login_date text,
    notification_email text,
    register_date text,
    setting_allow_admin_to_login text,
    setting_date_format text,
    setting_display_welcome_screen text,
    setting_filter_inaccessible_kubernetes text,
    setting_notify_my_changes text,
    setting_send_weekly_report text,
    setting_theme text,
    setting_time_format text,
    short_profile_username text,
    show_sso_invite_screen text,
    "status" text,
    user_data_email text,
    user_data_image text,
    user_data_name text,
    user_name text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    account text,
    created_at text,
    "name" text,
    tags jsonb,
    "type" text,
    updated_at text,
    v text,
    PRIMARY KEY (id)
);

CREATE TABLE execution_context_tag (
    tags text,
    execution_context_id text,
    PRIMARY KEY (tags, execution_context_id),
    FOREIGN KEY (execution_context_id) REFERENCES execution_context(id)
);

CREATE TABLE execution_context (
    id text,
    account text,
    account_default text,
    created_at text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);
