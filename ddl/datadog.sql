CREATE TABLE container_image_associated_tag (
    "index" text,
    container_id text,
    associated_tag text,
    PRIMARY KEY ("index", container_id),
    FOREIGN KEY (container_id) REFERENCES container(id)
);

CREATE TABLE container_tag (
    "index" text,
    container_id text,
    tags text,
    PRIMARY KEY ("index", container_id),
    FOREIGN KEY (container_id) REFERENCES container(id)
);

CREATE TABLE container (
    id text,
    host text,
    image_name text,
    created_at text,
    image_digest text,
    "name" text,
    started_at text,
    "state" text,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (host) REFERENCES host("name"),
    FOREIGN KEY (image_name) REFERENCES container_image("name")
);

CREATE TABLE apm_retention (
    id text,
    created_by text,
    modified_by text,
    created_at text,
    editable text,
    enabled text,
    execution_order text,
    filter_query text,
    filter_type text,
    modified_at text,
    "name" text,
    rate text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES dashboard(author_handle),
    FOREIGN KEY (modified_by) REFERENCES dashboard(author_handle)
);

CREATE TABLE service_level_objective_tag (
    "index" text,
    service_level_objective_id text,
    tags text,
    PRIMARY KEY ("index", service_level_objective_id),
    FOREIGN KEY (service_level_objective_id) REFERENCES service_level_objective(id)
);

CREATE TABLE service_level_objective_monitor_tag (
    "index" text,
    service_level_objective_id text,
    monitor_tag text,
    PRIMARY KEY ("index", service_level_objective_id),
    FOREIGN KEY (service_level_objective_id) REFERENCES service_level_objective(id)
);

CREATE TABLE service_level_objective_monitor (
    monitor_id text,
    service_level_objective_id text,
    PRIMARY KEY (monitor_id, service_level_objective_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id),
    FOREIGN KEY (service_level_objective_id) REFERENCES service_level_objective(id)
);

CREATE TABLE service_level_objective_group (
    "index" text,
    service_level_objective_id text,
    group_name text,
    PRIMARY KEY ("index", service_level_objective_id),
    FOREIGN KEY (service_level_objective_id) REFERENCES service_level_objective(id)
);

CREATE TABLE service_level_objective_threshold (
    _fivetran_id text,
    service_level_objective_id text,
    target text,
    target_display text,
    timeframe text,
    warning text,
    warning_display text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (service_level_objective_id) REFERENCES service_level_objective(id)
);

CREATE TABLE service_level_objective (
    id text,
    creator_handle text,
    created_at text,
    creator_email text,
    creator_name text,
    description text,
    modified_at text,
    "name" text,
    query_denominator text,
    query_numerator text,
    target_threshold text,
    timeframe text,
    "type" text,
    type_id text,
    warning_threshold text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_handle) REFERENCES dashboard(author_handle)
);

CREATE TABLE aws_log_integration_lambda (
    _fivetran_id text,
    aws_log_integration_id text,
    arn text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (aws_log_integration_id) REFERENCES aws_log_integration(id)
);

CREATE TABLE aws_log_integration_service (
    "index" text,
    aws_log_integration_id text,
    service text,
    PRIMARY KEY ("index", aws_log_integration_id),
    FOREIGN KEY (aws_log_integration_id) REFERENCES aws_log_integration(id)
);

CREATE TABLE aws_log_integration_service_trigger (
    "index" text,
    aws_log_integration_id text,
    "trigger" text,
    PRIMARY KEY ("index", aws_log_integration_id),
    FOREIGN KEY (aws_log_integration_id) REFERENCES aws_log_integration(id)
);

CREATE TABLE aws_log_integration (
    id text,
    synced_by_service_id jsonb,
    touched text,
    PRIMARY KEY (id)
);

CREATE TABLE hourly_usage_attribution (
    "hour" text,
    public_id text,
    region text,
    tag_config_source text,
    tags jsonb,
    total_usage_sum text,
    updated_at text,
    usage_type text,
    PRIMARY KEY ("hour", public_id),
    FOREIGN KEY (public_id) REFERENCES organization(id)
);

CREATE TABLE gcp_integration_account_tag (
    "index" text,
    gcp_integration_id text,
    account_tag text,
    PRIMARY KEY ("index", gcp_integration_id),
    FOREIGN KEY (gcp_integration_id) REFERENCES gcp_integration(id)
);

CREATE TABLE gcp_integration_cloud_run_revision_filter (
    "index" text,
    gcp_integration_id text,
    cloud_run_revision_filter text,
    PRIMARY KEY ("index", gcp_integration_id),
    FOREIGN KEY (gcp_integration_id) REFERENCES gcp_integration(id)
);

CREATE TABLE gcp_integration_host (
    "index" text,
    gcp_integration_id text,
    host_filter text,
    PRIMARY KEY ("index", gcp_integration_id),
    FOREIGN KEY (gcp_integration_id) REFERENCES gcp_integration(id)
);

CREATE TABLE gcp_integration (
    id text,
    automute text,
    client_email text,
    is_cspm_enabled text,
    is_security_command_center_enabled text,
    resource_collection_enabled text,
    PRIMARY KEY (id)
);

CREATE TABLE log_archive_rehydration_tag (
    "index" text,
    log_archive_id text,
    rehydration_tag text,
    PRIMARY KEY ("index", log_archive_id),
    FOREIGN KEY (log_archive_id) REFERENCES log_archive(id)
);

CREATE TABLE log_archive_destination (
    "name" text,
    log_archive_id text,
    "value" text,
    PRIMARY KEY ("name", log_archive_id),
    FOREIGN KEY (log_archive_id) REFERENCES log_archive(id)
);

CREATE TABLE log_archive (
    id text,
    include_tags text,
    "name" text,
    query text,
    rehydration_max_scan_size_in_gb text,
    "state" text,
    PRIMARY KEY (id)
);

CREATE TABLE security_monitoring_rule_query (
    _fivetran_id text,
    security_monitoring_rule_id text,
    aggregation text,
    distinct_fields jsonb,
    group_by_fields jsonb,
    has_optional_group_by_fields text,
    "name" text,
    query text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule_case_notification (
    "index" text,
    _fivetran_id text,
    notification text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES security_monitoring_rule_case(_fivetran_id)
);

CREATE TABLE security_monitoring_rule_case (
    _fivetran_id text,
    security_monitoring_rule_id text,
    "condition" text,
    "name" text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule_tag (
    "index" text,
    security_monitoring_rule_id text,
    tags text,
    PRIMARY KEY ("index", security_monitoring_rule_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule_default_tag (
    "index" text,
    security_monitoring_rule_id text,
    default_tag text,
    PRIMARY KEY ("index", security_monitoring_rule_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule_filter (
    _fivetran_id text,
    security_monitoring_rule_id text,
    "action" text,
    query text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule_group_signal (
    "index" text,
    security_monitoring_rule_id text,
    group_signal text,
    PRIMARY KEY ("index", security_monitoring_rule_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule_option (
    "name" text,
    security_monitoring_rule_id text,
    "value" text,
    PRIMARY KEY ("name", security_monitoring_rule_id),
    FOREIGN KEY (security_monitoring_rule_id) REFERENCES security_monitoring_rule(id)
);

CREATE TABLE security_monitoring_rule (
    id text,
    blocking text,
    compliance_signal_option_default_activation_status text,
    compliance_signal_option_default_group_by_fields jsonb,
    compliance_signal_option_user_activation_status text,
    compliance_signal_option_user_group_by_fields jsonb,
    created_at text,
    creation_author_id text,
    has_extended_title text,
    is_default text,
    is_deleted text,
    is_deprecated text,
    is_enabled text,
    is_partner text,
    message text,
    "name" text,
    third_party_case_name text,
    third_party_case_notifications text,
    third_party_case_query text,
    third_party_case_status text,
    "type" text,
    update_author_id text,
    updated_at text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE service_level_objective_history_groups (
    "index" text,
    service_level_objective_history_slo_id text,
    errors jsonb,
    groups text,
    history jsonb,
    monitor_modified text,
    monitor_type text,
    "name" text,
    preview text,
    sli_value text,
    span_precision text,
    uptime text,
    PRIMARY KEY ("index", service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_monitor (
    "index" text,
    service_level_objective_history_slo_id text,
    errors jsonb,
    groups text,
    histroy jsonb,
    monitor_modified text,
    monitor_type text,
    "name" text,
    preview text,
    sli_value text,
    span_precision text,
    uptime text,
    PRIMARY KEY ("index", service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_threshold (
    "index" text,
    service_level_objective_history_slo_id text,
    target text,
    target_display text,
    timeframe text,
    warning text,
    warning_display text,
    PRIMARY KEY ("index", service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_series_time (
    "time" text,
    service_level_objective_history_slo_id text,
    PRIMARY KEY ("time", service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_numerator_value (
    numerator_value text,
    service_level_objective_history_slo_id text,
    PRIMARY KEY (numerator_value, service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_denominator_value (
    denominator_value text,
    service_level_objective_history_slo_id text,
    PRIMARY KEY (denominator_value, service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_numerator_value_unit (
    "index" text,
    service_level_objective_history_slo_id text,
    family text,
    id text,
    "name" text,
    plural text,
    scale_factor text,
    short_name text,
    PRIMARY KEY ("index", service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history_denominator_value_unit (
    "index" text,
    service_level_objective_history_slo_id text,
    family text,
    id text,
    "name" text,
    plural text,
    scale_factor text,
    short_name text,
    PRIMARY KEY ("index", service_level_objective_history_slo_id),
    FOREIGN KEY (service_level_objective_history_slo_id) REFERENCES service_level_objective_history(slo_id)
);

CREATE TABLE service_level_objective_history (
    slo_id text,
    denominator_metadata_aggr text,
    denominator_metadata_expression text,
    denominator_metadata_metric text,
    denominator_metadata_query_index text,
    denominator_metadata_scope text,
    denominator_metadata_tag_set jsonb,
    errors jsonb,
    from_ts text,
    group_by jsonb,
    numerator_metadata_aggr text,
    numerator_metadata_expression text,
    numerator_metadata_metric text,
    numerator_metadata_query_index text,
    numerator_metadata_scope text,
    numerator_metadata_tag_set jsonb,
    overall_corrections jsonb,
    overall_errors jsonb,
    overall_group text,
    overall_history jsonb,
    overall_monitor_modified text,
    overall_monitor_type text,
    overall_name text,
    overall_preview text,
    overall_sli_value text,
    overall_span_precision text,
    overall_state text,
    overall_uptime text,
    series_bad_series_query text,
    series_denominator_count text,
    series_denominator_query text,
    series_denominator_sum text,
    series_from_date text,
    series_graph_query text,
    series_interval text,
    series_message text,
    series_numerator_count text,
    series_numerator_query text,
    series_numerator_sum text,
    series_query text,
    series_res_type text,
    series_resp_version text,
    series_to_date text,
    to_ts text,
    "type" text,
    type_id text,
    PRIMARY KEY (slo_id),
    FOREIGN KEY (slo_id) REFERENCES service_level_objective(id)
);

CREATE TABLE dashboard (
    id text,
    author_handle text,
    created_at text,
    deleted_at text,
    description text,
    is_read_only text,
    layout_type text,
    modified_at text,
    title text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE standard_pattern_tag (
    "index" text,
    standard_pattern_id text,
    tags text,
    PRIMARY KEY ("index", standard_pattern_id),
    FOREIGN KEY (standard_pattern_id) REFERENCES standard_pattern(id)
);

CREATE TABLE standard_pattern_keyword (
    "index" text,
    standard_pattern_id text,
    keyword text,
    PRIMARY KEY ("index", standard_pattern_id),
    FOREIGN KEY (standard_pattern_id) REFERENCES standard_pattern(id)
);

CREATE TABLE standard_pattern (
    id text,
    description text,
    "name" text,
    pattern text,
    priority text,
    PRIMARY KEY (id)
);

CREATE TABLE metric_tag_tag (
    "index" text,
    metric_tag_id text,
    metric_type text,
    tags text,
    PRIMARY KEY ("index", metric_tag_id, metric_type),
    FOREIGN KEY (metric_tag_id) REFERENCES metric_tag(id),
    FOREIGN KEY (metric_type) REFERENCES metric_tag(metric_type)
);

CREATE TABLE metric_tag (
    id text,
    metric_type text,
    "type" text,
    PRIMARY KEY (id, metric_type),
    FOREIGN KEY (id) REFERENCES metric(id),
    FOREIGN KEY (metric_type) REFERENCES metric("type")
);

CREATE TABLE okta_integration (
    id text,
    auth_method text,
    client_id text,
    domain text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE log_index_exclusion_filter (
    _fivetran_id text,
    log_index_name text,
    filter_query text,
    filter_sample_rate text,
    is_enabled text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (log_index_name) REFERENCES log_index("name")
);

CREATE TABLE log_index (
    "name" text,
    daily_limit text,
    daily_limit_reset_time text,
    daily_limit_reset_utc_offset text,
    daily_limit_warning_threshold_percentage text,
    is_rate_limited text,
    num_retention_days text,
    query_filter text,
    PRIMARY KEY ("name")
);

CREATE TABLE confluent_cloud_tag (
    "index" text,
    confluent_cloud_id text,
    tags text,
    PRIMARY KEY ("index", confluent_cloud_id),
    FOREIGN KEY (confluent_cloud_id) REFERENCES confluent_cloud(id)
);

CREATE TABLE confluent_cloud_resource_tag (
    "index" text,
    confluent_cloud_id text,
    confluent_cloud_resource_id text,
    tags text,
    PRIMARY KEY ("index", confluent_cloud_id, confluent_cloud_resource_id),
    FOREIGN KEY (confluent_cloud_id) REFERENCES confluent_cloud_resource(confluent_cloud_id),
    FOREIGN KEY (confluent_cloud_resource_id) REFERENCES confluent_cloud_resource(id)
);

CREATE TABLE confluent_cloud_resource (
    id text,
    confluent_cloud_id text,
    enable_custom_metrics text,
    resource_type text,
    PRIMARY KEY (id, confluent_cloud_id),
    FOREIGN KEY (confluent_cloud_id) REFERENCES confluent_cloud(id)
);

CREATE TABLE confluent_cloud (
    id text,
    api_key text,
    PRIMARY KEY (id)
);

CREATE TABLE role_permission (
    permission_id text,
    role_id text,
    PRIMARY KEY (permission_id, role_id),
    FOREIGN KEY (permission_id) REFERENCES permission(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    created_at text,
    modified_at timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE log (
    id text,
    host text,
    log_attribute jsonb,
    message text,
    service text,
    "status" text,
    tags jsonb,
    timestamps timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (host) REFERENCES host("name")
);

CREATE TABLE auth_n_mapping (
    id text,
    role_id text,
    created_at text,
    "key" text,
    modified_at text,
    saml_assertion_id text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE azure_integration_error (
    "index" text,
    azure_integration_id text,
    error text,
    PRIMARY KEY ("index", azure_integration_id),
    FOREIGN KEY (azure_integration_id) REFERENCES azure_integration(id)
);

CREATE TABLE azure_integration (
    id text,
    app_service_plan_filters text,
    automute text,
    client_secret text,
    container_app_filters text,
    cspm_enabled text,
    custom_metrics_enabled text,
    host_filters text,
    new_client_id text,
    new_tenant_name text,
    resource_collection_enabled text,
    tenant_name text,
    PRIMARY KEY (id)
);

CREATE TABLE synthetic_variable_tag (
    "index" text,
    synthetic_variable_id text,
    tags text,
    PRIMARY KEY ("index", synthetic_variable_id),
    FOREIGN KEY (synthetic_variable_id) REFERENCES synthetic_variable(id)
);

CREATE TABLE synthetic_variable (
    id text,
    creator_handle text,
    editor_handle text,
    created_at text,
    creator_email text,
    creator_name text,
    description text,
    editor_email text,
    editor_name text,
    is_fido text,
    is_totp text,
    last_error text,
    modified_at text,
    "name" text,
    parse_test_extracted_at text,
    parse_test_name text,
    parse_test_options text,
    parse_test_public_id text,
    "type" text,
    value_options jsonb,
    value_secure text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_handle) REFERENCES dashboard(author_handle),
    FOREIGN KEY (editor_handle) REFERENCES dashboard(author_handle)
);

CREATE TABLE aws_integration_host_tag (
    "index" text,
    aws_integration_id text,
    host_tag text,
    PRIMARY KEY ("index", aws_integration_id),
    FOREIGN KEY (aws_integration_id) REFERENCES aws_integration(id)
);

CREATE TABLE aws_integration_excluded_region (
    "index" text,
    aws_integration_id text,
    excluded_region text,
    PRIMARY KEY ("index", aws_integration_id),
    FOREIGN KEY (aws_integration_id) REFERENCES aws_integration(id)
);

CREATE TABLE aws_integration_filter_tag (
    "index" text,
    aws_integration_id text,
    filter_tag text,
    PRIMARY KEY ("index", aws_integration_id),
    FOREIGN KEY (aws_integration_id) REFERENCES aws_integration(id)
);

CREATE TABLE aws_integration_namespace_rule (
    "name" text,
    aws_integration_id text,
    "value" text,
    PRIMARY KEY ("name", aws_integration_id),
    FOREIGN KEY (aws_integration_id) REFERENCES aws_integration(id)
);

CREATE TABLE aws_integration (
    id text,
    access_key_id text,
    cspm_resource_collection_enabled text,
    errors jsonb,
    extended_resource_collection_enabled text,
    metrics_collection_enabled text,
    resource_collection_enabled text,
    role_name text,
    secret_access_key text,
    PRIMARY KEY (id)
);

CREATE TABLE team_hidden_module (
    "index" text,
    team_id text,
    hidden_module text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_visible_module (
    "index" text,
    team_id text,
    visible_module text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    avatar text,
    banner text,
    created_at text,
    description text,
    handle text,
    link_count text,
    modified_at text,
    "name" text,
    summary text,
    PRIMARY KEY (id)
);

CREATE TABLE container_image_flavor (
    "index" text,
    container_image_id text,
    built_at text,
    os_architecture text,
    os_name text,
    os_version text,
    "size" text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_tag (
    "index" text,
    container_image_id text,
    tags text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_image_tag (
    "index" text,
    container_image_id text,
    image_tag text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_built (
    "index" text,
    container_image_id text,
    built_at text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_os_architechure (
    "index" text,
    container_image_id text,
    os_architecture text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_os_name (
    "index" text,
    container_image_id text,
    "name" text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_os_version (
    "index" text,
    container_image_id text,
    version text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_size (
    "index" text,
    container_image_id text,
    "size" text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image_source (
    "index" text,
    container_image_id text,
    "source" text,
    PRIMARY KEY ("index", container_image_id),
    FOREIGN KEY (container_image_id) REFERENCES container_image(id)
);

CREATE TABLE container_image (
    id text,
    "name" text,
    published_at text,
    registry text,
    repo_digest text,
    repository text,
    short_image text,
    sizes text,
    sources text,
    vulnerability_count_asset_id text,
    vulnerability_count_critical text,
    vulnerability_count_high text,
    vulnerability_count_low text,
    vulnerability_count_medium text,
    vulnerability_count_none text,
    vulnerability_count_unknown text,
    PRIMARY KEY (id)
);

CREATE TABLE synthetic_location (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE downtime_monitor_tag (
    "index" text,
    downtime_id text,
    monitor_tag text,
    PRIMARY KEY ("index", downtime_id),
    FOREIGN KEY (downtime_id) REFERENCES downtime(id)
);

CREATE TABLE downtime_recurrence (
    "index" text,
    downtime_id text,
    duration text,
    r_rule text,
    "start" text,
    PRIMARY KEY ("index", downtime_id),
    FOREIGN KEY (downtime_id) REFERENCES downtime(id)
);

CREATE TABLE downtime_notify_end_type (
    "index" text,
    downtime_id text,
    notify_end_type text,
    PRIMARY KEY ("index", downtime_id),
    FOREIGN KEY (downtime_id) REFERENCES downtime(id)
);

CREATE TABLE downtime_notify_end_state (
    "index" text,
    downtime_id text,
    notify_end_state text,
    PRIMARY KEY ("index", downtime_id),
    FOREIGN KEY (downtime_id) REFERENCES downtime(id)
);

CREATE TABLE downtime (
    id text,
    child_id text,
    created_by_id text,
    identifier_monitor_id text,
    monitor_id text,
    parent_id text,
    active text,
    canceled text,
    created text,
    creator_id text,
    disabled text,
    display_timezone text,
    message text,
    modified text,
    mute_first_recovery_notification text,
    recurrence text,
    schedule_end text,
    schedule_start text,
    scope text,
    "status" text,
    timezone text,
    "type" text,
    updater_id text,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (child_id) REFERENCES downtime(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (identifier_monitor_id) REFERENCES monitor(id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id),
    FOREIGN KEY (parent_id) REFERENCES downtime(id)
);

CREATE TABLE metric (
    id text,
    "type" text,
    PRIMARY KEY (id, "type")
);

CREATE TABLE rum_application (
    id text,
    created_by_handle text,
    organization_id text,
    updated_by_handle text,
    created_at text,
    hash text,
    is_active text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_handle) REFERENCES dashboard(author_handle),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (updated_by_handle) REFERENCES dashboard(author_handle)
);

CREATE TABLE organization_saml_user_domain (
    "index" text,
    organization_id text,
    domain text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    created text,
    description text,
    "name" text,
    settings_custom_landing_page text,
    settings_default_landing_page text,
    settings_manage_reports text,
    settings_private_widget_share text,
    settings_saml_autocreate_access_role text,
    settings_saml_autocreate_users_domains_enabled text,
    settings_saml_can_be_enabled text,
    settings_saml_enabled text,
    settings_saml_idp_endpoint text,
    settings_saml_idp_initiated_login_enabled text,
    settings_saml_idp_metadata_uploaded text,
    settings_saml_idp_metadata_valid_until text,
    settings_saml_login_url text,
    settings_saml_strict_mode_enabled text,
    trial text,
    PRIMARY KEY (id)
);

CREATE TABLE log_metric_group_by (
    "index" text,
    log_metric_id text,
    "path" text,
    tag_name text,
    PRIMARY KEY ("index", log_metric_id),
    FOREIGN KEY (log_metric_id) REFERENCES log_metric(id)
);

CREATE TABLE log_metric (
    id text,
    compute_aggregation_type text,
    compute_include_percentiles text,
    compute_path text,
    filter_query text,
    PRIMARY KEY (id)
);

CREATE TABLE synthetic_test_tag (
    "index" text,
    synthetic_test_id text,
    tags text,
    PRIMARY KEY ("index", synthetic_test_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_location (
    "index" text,
    synthetic_test_id text,
    location text,
    PRIMARY KEY ("index", synthetic_test_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_assertion (
    _fivetran_id text,
    synthetic_test_id text,
    operator text,
    property text,
    target text,
    timing_scope text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_step (
    id text,
    synthetic_test_id text,
    allow_failure text,
    is_critical text,
    "name" text,
    no_screenshot text,
    params jsonb,
    sub_type text,
    timeout text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, synthetic_test_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_config_variable (
    _fivetran_id text,
    synthetic_test_id text,
    example text,
    id text,
    "name" text,
    pattern text,
    secure text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_variable (
    _fivetran_id text,
    synthetic_test_id text,
    example text,
    id text,
    "name" text,
    pattern text,
    secure text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_config_request (
    "name" text,
    synthetic_test_id text,
    "value" text,
    PRIMARY KEY ("name", synthetic_test_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test_option (
    "name" text,
    synthetic_test_id text,
    "value" text,
    PRIMARY KEY ("name", synthetic_test_id),
    FOREIGN KEY (synthetic_test_id) REFERENCES synthetic_test(id)
);

CREATE TABLE synthetic_test (
    id text,
    creator_handle text,
    monitor_id text,
    created_at text,
    creator_email text,
    creator_name text,
    message text,
    modified_at text,
    "name" text,
    "status" text,
    subtype text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_handle) REFERENCES dashboard(author_handle),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id)
);

CREATE TABLE span_metric_group_by (
    _fivetran_id text,
    span_metric_id text,
    "path" text,
    tag_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (span_metric_id) REFERENCES span_metric(id)
);

CREATE TABLE span_metric (
    id text,
    compute_aggregation_type text,
    compute_include_percentiles text,
    compute_path text,
    filter_query text,
    PRIMARY KEY (id)
);

CREATE TABLE scanning_group_relationship (
    id text,
    scanning_group_id text,
    PRIMARY KEY (id, scanning_group_id),
    FOREIGN KEY (scanning_group_id) REFERENCES scanning_group(id)
);

CREATE TABLE scanning_group_attribute (
    "name" text,
    scanning_group_id text,
    "value" text,
    PRIMARY KEY ("name", scanning_group_id),
    FOREIGN KEY (scanning_group_id) REFERENCES scanning_group(id)
);

CREATE TABLE scanning_group (
    id text,
    PRIMARY KEY (id)
);

CREATE TABLE host_alias (
    "index" text,
    host_id text,
    alias text,
    PRIMARY KEY ("index", host_id),
    FOREIGN KEY (host_id) REFERENCES host(id)
);

CREATE TABLE host_app (
    "index" text,
    host_id text,
    app_name text,
    PRIMARY KEY ("index", host_id),
    FOREIGN KEY (host_id) REFERENCES host(id)
);

CREATE TABLE host_source (
    "index" text,
    host_id text,
    "source" text,
    PRIMARY KEY ("index", host_id),
    FOREIGN KEY (host_id) REFERENCES host(id)
);

CREATE TABLE host_metadata (
    "name" text,
    host_id text,
    "value" text,
    PRIMARY KEY ("name", host_id),
    FOREIGN KEY (host_id) REFERENCES host(id)
);

CREATE TABLE host_tag_source (
    "name" text,
    host_id text,
    "value" text,
    PRIMARY KEY ("name", host_id),
    FOREIGN KEY (host_id) REFERENCES host(id)
);

CREATE TABLE host (
    id text,
    aws_id text,
    aws_name text,
    is_muted text,
    last_reported_time text,
    metrics_cpu text,
    metrics_io_wait text,
    metrics_load text,
    mute_timeout text,
    "name" text,
    up text,
    PRIMARY KEY (id)
);

CREATE TABLE log_restriction_query (
    id text,
    created_at text,
    modified_at text,
    restriction_query text,
    PRIMARY KEY (id)
);

CREATE TABLE cloudfare_integration_resource (
    "index" text,
    cloudfare_integration_id text,
    resource text,
    PRIMARY KEY ("index", cloudfare_integration_id),
    FOREIGN KEY (cloudfare_integration_id) REFERENCES cloudfare_integration(id)
);

CREATE TABLE cloudfare_integration_zone (
    "index" text,
    cloudfare_integration_id text,
    "zone" text,
    PRIMARY KEY ("index", cloudfare_integration_id),
    FOREIGN KEY (cloudfare_integration_id) REFERENCES cloudfare_integration(id)
);

CREATE TABLE cloudfare_integration (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE cloud_cost_management_azure_cur_config_error_message (
    "index" text,
    azure_config_id text,
    cloud_cost_management_azure_cur_config_id text,
    message text,
    PRIMARY KEY ("index", azure_config_id, cloud_cost_management_azure_cur_config_id),
    FOREIGN KEY (azure_config_id) REFERENCES cloud_cost_management_azure_cur_config(azure_config_id),
    FOREIGN KEY (cloud_cost_management_azure_cur_config_id) REFERENCES cloud_cost_management_azure_cur_config(id)
);

CREATE TABLE cloud_cost_management_azure_cur_config (
    azure_config_id text,
    id text,
    account_id text,
    client_id text,
    created_at text,
    dataset_type text,
    export_name text,
    export_path text,
    scope text,
    "status" text,
    status_updated_at text,
    storage_account text,
    storage_container text,
    updated_at text,
    PRIMARY KEY (azure_config_id, id)
);

CREATE TABLE other_user (
    other_user_id text,
    user_id text,
    PRIMARY KEY (other_user_id, user_id),
    FOREIGN KEY (other_user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_other_organization (
    organization_id text,
    user_id text,
    PRIMARY KEY (organization_id, user_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    role_id text,
    user_id text,
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    organization_id text,
    allowed_login_methods jsonb,
    created_at timestamp,
    disabled text,
    email text,
    handle text,
    icon text,
    mfa_enabled text,
    modified_at timestamp,
    "name" text,
    service_account text,
    "status" text,
    title text,
    verified text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE service_level_objective_correction (
    id text,
    creator_id text,
    modifier_id text,
    service_level_objective_id text,
    category text,
    created_at text,
    description text,
    duration text,
    ends text,
    modified_at text,
    rule text,
    "start" text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (modifier_id) REFERENCES users(id),
    FOREIGN KEY (service_level_objective_id) REFERENCES service_level_objective(id)
);

CREATE TABLE ip_allow_list_entry (
    id text,
    ip_allow_list_id text,
    cidr_block text,
    created_at text,
    modified_at text,
    note text,
    "type" text,
    PRIMARY KEY (id, ip_allow_list_id),
    FOREIGN KEY (ip_allow_list_id) REFERENCES ip_allow_list(id)
);

CREATE TABLE ip_allow_list (
    id text,
    enabled text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE dashboard_list (
    id text,
    author_handle text,
    author_email text,
    author_name text,
    created text,
    is_favorite text,
    modified text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_handle) REFERENCES dashboard(author_handle)
);

CREATE TABLE service_definition_schema_contact (
    _fivetran_id text,
    service_definition_id text,
    contact text,
    "name" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (service_definition_id) REFERENCES service_definition(id)
);

CREATE TABLE service_definition_schema_link (
    _fivetran_id text,
    service_definition_id text,
    "name" text,
    provider text,
    "type" text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (service_definition_id) REFERENCES service_definition(id)
);

CREATE TABLE service_definition_schema_tag (
    "index" text,
    service_definition_id text,
    tags text,
    PRIMARY KEY ("index", service_definition_id),
    FOREIGN KEY (service_definition_id) REFERENCES service_definition(id)
);

CREATE TABLE service_definition_schema_language (
    "index" text,
    service_definition_id text,
    languages text,
    PRIMARY KEY ("index", service_definition_id),
    FOREIGN KEY (service_definition_id) REFERENCES service_definition(id)
);

CREATE TABLE service_definition_warning (
    _fivetran_id text,
    service_definition_id text,
    instance_location text,
    keyword_location text,
    message text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (service_definition_id) REFERENCES service_definition(id)
);

CREATE TABLE service_definition (
    id text,
    meta_github_html_url text,
    meta_ingested_schema_version text,
    meta_ingestion_source text,
    meta_last_modified_time text,
    meta_origin text,
    meta_origin_detail text,
    schema_dd_service text,
    schema_docs text,
    schema_extensions text,
    schema_integrations jsonb,
    schema_repos text,
    schema_team text,
    schema_version text,
    PRIMARY KEY (id)
);

CREATE TABLE log_pipeline_processor (
    "index" text,
    log_pipeline_id text,
    grok_match_rules text,
    grok_support_rules text,
    is_enabled text,
    "name" text,
    samples jsonb,
    PRIMARY KEY ("index", log_pipeline_id),
    FOREIGN KEY (log_pipeline_id) REFERENCES log_pipeline(id)
);

CREATE TABLE log_pipeline (
    id text,
    filter_query text,
    is_enabled text,
    is_read_only text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE opsgenie_integration (
    id text,
    custom_url text,
    "name" text,
    region text,
    PRIMARY KEY (id)
);

CREATE TABLE cloud_cost_management_aws_cur_config_error_message (
    "index" text,
    cloud_cost_management_aws_cur_config_id text,
    message text,
    PRIMARY KEY ("index", cloud_cost_management_aws_cur_config_id),
    FOREIGN KEY (cloud_cost_management_aws_cur_config_id) REFERENCES cloud_cost_management_aws_cur_config(id)
);

CREATE TABLE cloud_cost_management_aws_cur_config (
    id text,
    account_id text,
    bucket_name text,
    bucket_region text,
    created_at text,
    months text,
    report_name text,
    report_prefix text,
    "status" text,
    status_updated_at text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE rum_event (
    id text,
    rum_event_attrubute jsonb,
    service text,
    tags jsonb,
    timestamps timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE incident_service (
    id text,
    created_by_id text,
    last_modified_by_id text,
    created text,
    modified text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_id) REFERENCES users(id)
);

CREATE TABLE permission (
    id text,
    created text,
    description text,
    display_name text,
    display_type text,
    group_name text,
    "name" text,
    restricted text,
    PRIMARY KEY (id)
);

CREATE TABLE monitor_tag (
    "index" text,
    monitor_id text,
    tags text,
    PRIMARY KEY ("index", monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id)
);

CREATE TABLE monitor_matching_downtime_scope (
    "index" text,
    monitor_matching_downtime_id text,
    monitor_id text,
    scope text,
    PRIMARY KEY ("index", monitor_matching_downtime_id, monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor_matching_downtime(monitor_id)
);

CREATE TABLE monitor_matching_downtime (
    "index" text,
    monitor_id text,
    active text,
    ends_at text,
    groups jsonb,
    id text,
    "start" text,
    PRIMARY KEY ("index", monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id)
);

CREATE TABLE monitor_option (
    "name" text,
    monitor_id text,
    "value" text,
    PRIMARY KEY ("name", monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id)
);

CREATE TABLE monitor (
    id text,
    creator_handle text,
    organization_id text,
    created text,
    created_at text,
    creator_email text,
    creator_id text,
    creator_name text,
    deleted text,
    message text,
    modified text,
    multi text,
    "name" text,
    overall_state text,
    overall_state_modified text,
    priority text,
    query text,
    restricted_roles text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_handle) REFERENCES dashboard(author_handle),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE incident_impact_summary_field (
    "name" text,
    incident_id text,
    incident_impact_summary_id text,
    "value" text,
    PRIMARY KEY ("name", incident_id, incident_impact_summary_id),
    FOREIGN KEY (incident_id) REFERENCES incident_impact_summary(incident_id),
    FOREIGN KEY (incident_impact_summary_id) REFERENCES incident_impact_summary(id)
);

CREATE TABLE incident_impact_summary (
    id text,
    incident_id text,
    created_user_id text,
    modified_user_id text,
    created text,
    description text,
    end_at text,
    modified text,
    start_at text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (modified_user_id) REFERENCES users(id)
);

CREATE TABLE embedded_grapgh (
    id text,
    dash_name text,
    dash_url text,
    html text,
    revoked text,
    shared_by text,
    template_variables jsonb,
    tiledef text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE security_monitoring_exclusion_filter (
    "index" text,
    security_monitoring_filter_id text,
    "name" text,
    query text,
    PRIMARY KEY ("index", security_monitoring_filter_id),
    FOREIGN KEY (security_monitoring_filter_id) REFERENCES security_monitoring_filter(id)
);

CREATE TABLE security_monitoring_filter (
    id text,
    filtered_data_type text,
    is_builtin text,
    is_enabled text,
    "name" text,
    query text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_notification (
    _fivetran_id text,
    handle text,
    incident_id text,
    created_at text,
    display_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (handle) REFERENCES dashboard(author_handle),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_attachment (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_responder (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_impact (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_integration (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_user_defined_field (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_field (
    "name" text,
    incident_id text,
    "value" text,
    PRIMARY KEY ("name", incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident (
    id text,
    commander_user_id text,
    created_user_id text,
    modified_user_id text,
    archived text,
    case_id text,
    created text,
    created_by_uuid text,
    creation_idempotency_key text,
    customer_impact_duration text,
    customer_impact_end text,
    customer_impact_scope text,
    customer_impact_start text,
    customer_impacted text,
    detected text,
    field_analytics text,
    incident_type_uuid text,
    last_modified_by_uuid text,
    modified text,
    non_datadog_creator text,
    non_datadog_creator_image_48_px text,
    non_datadog_creator_name text,
    public_id text,
    resolved text,
    severity text,
    "state" text,
    time_to_detect text,
    time_to_internal_response text,
    time_to_repair text,
    time_to_resolve text,
    title text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (commander_user_id) REFERENCES users(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (modified_user_id) REFERENCES users(id)
);

CREATE TABLE fastly_account_service_tag (
    fastly_account_id text,
    fastly_account_service_id text,
    "index" text,
    tags text,
    PRIMARY KEY (fastly_account_id, fastly_account_service_id, "index")
);

CREATE TABLE fastly_account (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE metric_volume_attribute (
    "name" text,
    metric_volume_id text,
    metric_volume_metric_type text,
    "value" text,
    PRIMARY KEY ("name", metric_volume_id, metric_volume_metric_type),
    FOREIGN KEY (metric_volume_id) REFERENCES metric_volume(id),
    FOREIGN KEY (metric_volume_metric_type) REFERENCES metric_volume(metric_type)
);

CREATE TABLE metric_volume (
    id text,
    metric_type text,
    "type" text,
    PRIMARY KEY (id, metric_type),
    FOREIGN KEY (id) REFERENCES metric(id),
    FOREIGN KEY (metric_type) REFERENCES metric("type")
);

CREATE TABLE audit_tag (
    "index" text,
    audit_id text,
    tags text,
    PRIMARY KEY ("index", audit_id),
    FOREIGN KEY (audit_id) REFERENCES audit(id)
);

CREATE TABLE audit_attribute (
    "name" text,
    audit_id text,
    "value" text,
    PRIMARY KEY ("name", audit_id),
    FOREIGN KEY (audit_id) REFERENCES audit(id)
);

CREATE TABLE audit (
    id text,
    message text,
    service text,
    timestamps timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    id text,
    event_attribute jsonb,
    message text,
    tags jsonb,
    timestamps timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ci_visibility_pipeline (
    id text,
    ci_level text,
    ci_visibility_pipeline_attribute jsonb,
    tags jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE ci_visibility_test (
    id text,
    ci_visibility_test_attribute jsonb,
    tags jsonb,
    test_level text,
    PRIMARY KEY (id)
);
