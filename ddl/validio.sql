CREATE TABLE namespace_user (
    namespace_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (namespace_id, user_id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE namespace_team (
    namespace_id text,
    team_id text,
    "role" text,
    PRIMARY KEY (namespace_id, team_id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE namespace (
    id text,
    avatar text,
    avatar_thumbnail text,
    created_at text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE validator_incident (
    incident_id text,
    source_id text,
    validator_id text,
    PRIMARY KEY (incident_id, source_id, validator_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (source_id) REFERENCES validator(source_id),
    FOREIGN KEY (validator_id) REFERENCES validator(id)
);

CREATE TABLE validator_segment (
    segment_id text,
    source_id text,
    validator_id text,
    PRIMARY KEY (segment_id, source_id, validator_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (source_id) REFERENCES validator(source_id),
    FOREIGN KEY (validator_id) REFERENCES validator(id)
);

CREATE TABLE validator_tag (
    source_id text,
    tag_id text,
    validator_id text,
    PRIMARY KEY (source_id, tag_id, validator_id),
    FOREIGN KEY (source_id) REFERENCES validator(source_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (validator_id) REFERENCES validator(id)
);

CREATE TABLE validator (
    id text,
    source_id text,
    filter_id text,
    namespace_id text,
    owner_id text,
    reference_filter_id text,
    reference_window_id text,
    segmentation_id text,
    window_id text,
    config_initialize_with_backfill text,
    config_metadata_enabled text,
    config_metric text,
    config_minimum_reference_data_point text,
    config_minimum_relative_difference_percent text,
    config_mininum_absolute_difference text,
    config_query text,
    config_reference_source_field text,
    config_sensitivity text,
    config_source_field text,
    config_source_field_minuend text,
    config_source_field_subtrahend text,
    config_source_fields jsonb,
    config_threshold_adaption_rate text,
    config_threshold_decision_bounds_type text,
    config_threshold_difference_type text,
    config_threshold_number_of_window text,
    config_threshold_operator text,
    config_threshold_sensitivity text,
    config_threshold_value text,
    created_at text,
    data_quality text,
    data_quality_diff text,
    data_quality_incident_count text,
    data_quality_total_count text,
    description text,
    metric_value_format text,
    "name" text,
    progress_percentage text,
    progress_processed text,
    progress_total text,
    reference_source_config_filter text,
    reference_source_config_history text,
    reference_source_config_offset text,
    resource_name text,
    "state" text,
    state_updated_at text,
    stats_last_artifact_at text,
    stats_last_incident_at text,
    updated_at text,
    PRIMARY KEY (id, source_id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (filter_id) REFERENCES filter(id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (reference_filter_id) REFERENCES filter(id),
    FOREIGN KEY (reference_window_id) REFERENCES window(id),
    FOREIGN KEY (segmentation_id) REFERENCES segmentation(id),
    FOREIGN KEY (window_id) REFERENCES window(id)
);

CREATE TABLE incident (
    id text,
    backfill_mode text,
    created_at text,
    deviation text,
    end_time text,
    lower_bound text,
    severity text,
    start_time text,
    "status" text,
    updated_at text,
    upper_bound text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE lineage_graph_edge (
    id text,
    source_catalog_asset_id text,
    downstream_field text,
    sql_query text,
    upstream_field text,
    PRIMARY KEY (id, source_catalog_asset_id),
    FOREIGN KEY (source_catalog_asset_id) REFERENCES lineage_graph(source_catalog_asset_id)
);

CREATE TABLE lineage_graph (
    source_catalog_asset_id text,
    total_asset_count text,
    total_edge_count text,
    total_source_count text,
    PRIMARY KEY (source_catalog_asset_id),
    FOREIGN KEY (source_catalog_asset_id) REFERENCES source_catalog_asset(id)
);

CREATE TABLE validator_metric (
    _fivetran_id text,
    segment_id text,
    validator_id text,
    bound text,
    decision_bounds_type text,
    end_time text,
    is_burn_in text,
    is_incident text,
    lower_bound text,
    operator text,
    severity text,
    start_time text,
    upper_bound text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (segment_id) REFERENCES validator_segment(segment_id),
    FOREIGN KEY (validator_id) REFERENCES validator_segment(validator_id)
);

CREATE TABLE incident_group_comment (
    id text,
    incident_group_id text,
    author_id text,
    body text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id, incident_group_id),
    FOREIGN KEY (incident_group_id) REFERENCES incident_group(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE incident_group (
    id text,
    owner_id text,
    source_id text,
    validator_id text,
    comment_count text,
    first_seen_at text,
    last_seen_at text,
    mute_until text,
    priority text,
    severity_stat_high_count text,
    severity_stat_low_count text,
    severity_stat_medium_count text,
    severity_stat_total_count text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (validator_id) REFERENCES validator(id)
);

CREATE TABLE notification_rule_owner_condition (
    user_id text,
    notification_rule_id text,
    id text,
    PRIMARY KEY (user_id, notification_rule_id),
    FOREIGN KEY (notification_rule_id) REFERENCES notification_rule(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE notification_rule_segment_condition (
    id text,
    notification_rule_id text,
    config_segment jsonb,
    created_at text,
    updated_at text,
    PRIMARY KEY (id, notification_rule_id),
    FOREIGN KEY (notification_rule_id) REFERENCES notification_rule(id)
);

CREATE TABLE notification_rule_source_condition (
    source_id text,
    notification_rule_id text,
    id text,
    PRIMARY KEY (source_id, notification_rule_id),
    FOREIGN KEY (notification_rule_id) REFERENCES notification_rule(id),
    FOREIGN KEY (id) REFERENCES "source"(id)
);

CREATE TABLE notification_rule_tag_condition (
    notification_rule_id text,
    tag_id text,
    PRIMARY KEY (notification_rule_id, tag_id),
    FOREIGN KEY (notification_rule_id) REFERENCES notification_rule(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE notification_rule (
    id text,
    channel_id text,
    namespace_id text,
    config_owner_condition_created_at text,
    config_owner_condition_id text,
    config_owner_condition_updated_at text,
    config_severity_condition jsonb,
    config_severity_condition_created_at text,
    config_severity_condition_id text,
    config_severity_condition_updated_at text,
    config_source_condition_created_at text,
    config_source_condition_id text,
    config_source_condition_updated_at text,
    config_tag_condition_created_at text,
    config_tag_condition_id text,
    config_tag_condition_updated_at text,
    config_type_condition jsonb,
    config_type_condition_created_at text,
    config_type_condition_id text,
    config_type_condition_updated_at text,
    created_at text,
    "name" text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id)
);

CREATE TABLE segment (
    id text,
    segmentation_id text,
    data_quality text,
    data_quality_diff text,
    data_quality_incident_count text,
    data_quality_total_count text,
    field jsonb,
    PRIMARY KEY (id, segmentation_id),
    FOREIGN KEY (segmentation_id) REFERENCES segmentation(id)
);

CREATE TABLE filter (
    id text,
    namespace_id text,
    config_field text,
    config_operator text,
    config_query text,
    config_value text,
    config_values jsonb,
    created_at text,
    "name" text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id)
);

CREATE TABLE window (
    id text,
    namespace_id text,
    config_batch_size text,
    config_batch_timeout_secs text,
    config_segment_retention_period_days text,
    config_segmented_batching text,
    config_time_unit text,
    config_window_size text,
    config_window_timout_disabled text,
    created_at text,
    data_time_field text,
    "name" text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id)
);

CREATE TABLE channel_notification_rule (
    channel_id text,
    notification_rule_id text,
    PRIMARY KEY (channel_id, notification_rule_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (notification_rule_id) REFERENCES notification_rule(id)
);

CREATE TABLE channel (
    id text,
    namespace_id text,
    config_application_link_url text,
    config_auth_address text,
    config_auth_encryption text,
    config_auth_port text,
    config_auth_username text,
    config_interactive_message_enabled text,
    config_microsoft_teams_channel_id text,
    config_recipient_address jsonb,
    config_sender_address text,
    config_slack_channel_id text,
    created_at text,
    "name" text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id)
);

CREATE TABLE source_catalog_asset_description (
    "index" text,
    source_catalog_asset_id text,
    source_id text,
    description text,
    origin text,
    PRIMARY KEY ("index", source_catalog_asset_id, source_id),
    FOREIGN KEY (source_catalog_asset_id) REFERENCES source_catalog_asset(id),
    FOREIGN KEY (source_id) REFERENCES source_catalog_asset(source_id)
);

CREATE TABLE source_catalog_asset_tag (
    source_catalog_asset_id text,
    source_id text,
    tag_id text,
    PRIMARY KEY (source_catalog_asset_id, source_id, tag_id),
    FOREIGN KEY (source_catalog_asset_id) REFERENCES source_catalog_asset(id),
    FOREIGN KEY (source_id) REFERENCES source_catalog_asset(source_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE source_catalog_asset_external_tag (
    source_catalog_asset_id text,
    source_id text,
    tag_id text,
    PRIMARY KEY (source_catalog_asset_id, source_id, tag_id),
    FOREIGN KEY (source_catalog_asset_id) REFERENCES source_catalog_asset(id),
    FOREIGN KEY (source_id) REFERENCES source_catalog_asset(source_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE source_catalog_asset_joined_table (
    id text,
    source_id text,
    PRIMARY KEY (id, source_id),
    FOREIGN KEY (id) REFERENCES source_catalog_asset(id),
    FOREIGN KEY (source_id) REFERENCES source_catalog_asset(source_id)
);

CREATE TABLE source_catalog_asset (
    id text,
    source_id text,
    asset_type text,
    config_bucket text,
    config_catalog text,
    config_dashboard_id text,
    config_database text,
    config_dataset text,
    config_explore_id text,
    config_folder text,
    config_prefix text,
    config_project text,
    config_schema text,
    config_stream_name text,
    config_subscription_id text,
    config_table text,
    config_tile_id text,
    config_title text,
    config_topic text,
    config_workbook_id text,
    created_at text,
    description text,
    field_count text,
    is_dbt_model text,
    "name" text,
    query_user jsonb,
    stats_number_of_reads text,
    stats_number_of_writes text,
    stats_utilization text,
    updated_at text,
    PRIMARY KEY (id, source_id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE source_window (
    source_id text,
    window_id text,
    PRIMARY KEY (source_id, window_id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (window_id) REFERENCES window(id)
);

CREATE TABLE source_tag (
    source_id text,
    tag_id text,
    PRIMARY KEY (source_id, tag_id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE source_filter (
    filter_id text,
    source_id text,
    PRIMARY KEY (filter_id, source_id),
    FOREIGN KEY (filter_id) REFERENCES filter(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE source_segmentation (
    segmentation_id text,
    source_id text,
    PRIMARY KEY (segmentation_id, source_id),
    FOREIGN KEY (segmentation_id) REFERENCES segmentation(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE "source" (
    id text,
    credential_id text,
    namespace_id text,
    owner_id text,
    config_bucket text,
    config_catalog text,
    config_csv_delimiter text,
    config_csv_null_marker text,
    config_cursor_field text,
    config_database text,
    config_dataset text,
    config_file_format text,
    config_file_pattern text,
    config_folder text,
    config_http_path text,
    config_job_name text,
    config_look_back_day text,
    config_message_format text,
    config_message_format_schema text,
    config_prefix text,
    config_project text,
    config_project_name text,
    config_region text,
    config_role text,
    config_schedule text,
    config_schema text,
    config_stream_name text,
    config_subscription_id text,
    config_table text,
    config_topic text,
    config_warehouse text,
    created_at text,
    description text,
    jtd_schema_additional_property text,
    jtd_schema_nullable text,
    jtd_schema_optional_property jsonb,
    "name" text,
    resource_name text,
    "state" text,
    state_updated_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (credential_id) REFERENCES credential(id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE segmentation_field (
    "index" text,
    segmentation_id text,
    field text,
    PRIMARY KEY ("index", segmentation_id),
    FOREIGN KEY (segmentation_id) REFERENCES segmentation(id)
);

CREATE TABLE segmentation (
    id text,
    filter_id text,
    namespace_id text,
    source_id text,
    created_at text,
    "name" text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (filter_id) REFERENCES filter(id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE credential (
    id text,
    namespace_id text,
    config_account text,
    config_account_id text,
    config_api_base_url text,
    config_application_link_url text,
    config_auth_client_id text,
    config_auth_tenant_id text,
    config_auth_user text,
    config_backend_type text,
    config_base_url text,
    config_boot_strap_server text,
    config_ca_certificate text,
    config_client_id text,
    config_database text,
    config_default_database text,
    config_host text,
    config_http_path text,
    config_port text,
    config_protocol text,
    config_query_result_location text,
    config_region text,
    config_role text,
    config_secret_id text,
    config_site text,
    config_token_name text,
    config_user text,
    config_username text,
    config_warehouse text,
    created_at text,
    enable_catalog text,
    "name" text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (namespace_id) REFERENCES namespace(id)
);

CREATE TABLE team (
    id text,
    avatar text,
    avatar_thumbnail text,
    created_at text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE user_team (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_identity (
    id text,
    user_id text,
    created_at text,
    idp_config_cert text,
    idp_config_entity_id text,
    idp_config_entry_point text,
    idp_created_at text,
    idp_disabled text,
    idp_id text,
    idp_name text,
    idp_resource_name text,
    idp_updated_at text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    avatar text,
    avatar_thumbnail text,
    created_at text,
    display_name text,
    email text,
    full_name text,
    global_role text,
    last_login_at text,
    login_type text,
    resource_name text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    created_at text,
    "key" text,
    origin text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id)
);
