CREATE TABLE segment_definition (
    id text,
    ims_org_id text,
    merge_policy_id text,
    creation_time timestamp,
    data_governance_policy_exclude_opt_out text,
    description text,
    evalutioninfo_batch_enabled text,
    evalutioninfo_continuous_enabled text,
    evalutioninfo_synchronous_enabled text,
    expression_format text,
    expression_type text,
    expression_value text,
    "name" text,
    payload_schema text,
    profile_instance_id text,
    update_epoch timestamp,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ims_org_id) REFERENCES connection(username),
    FOREIGN KEY (merge_policy_id) REFERENCES merge_policy(id)
);

CREATE TABLE dataset_label_optional_label (
    "index" text,
    dataset_id text,
    labels jsonb,
    option_content_type text,
    option_id text,
    option_schema_path text,
    PRIMARY KEY ("index", dataset_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

CREATE TABLE dataset_label_parent (
    "index" text,
    dataset_id text,
    id text,
    namespace text,
    "type" text,
    PRIMARY KEY ("index", dataset_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

CREATE TABLE alert (
    id text,
    alert_type text,
    asset_id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE merge_policy (
    id text,
    attribute_merge_order jsonb,
    attribute_merge_type text,
    identity_graph_type text,
    is_active_on_edge text,
    is_default text,
    "name" text,
    schema_name text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE connection_database (
    "index" text,
    connection_username text,
    db_name text,
    "name" text,
    PRIMARY KEY ("index", connection_username),
    FOREIGN KEY (connection_username) REFERENCES connection(username)
);

CREATE TABLE connection (
    username text,
    disable_psql_creds text,
    host text,
    port text,
    version text,
    websocket_host text,
    PRIMARY KEY (username)
);

CREATE TABLE query_template (
    id text,
    last_updated_by text,
    links jsonb,
    "name" text,
    query_parameters jsonb,
    sql text,
    updated timestamp,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE destination_configuaration_custom_data_field (
    "index" text,
    destination_configuaration_id text,
    description text,
    enum jsonb,
    is_required text,
    "name" text,
    title text,
    "type" text,
    PRIMARY KEY ("index", destination_configuaration_id),
    FOREIGN KEY (destination_configuaration_id) REFERENCES destination_configuaration(id)
);

CREATE TABLE destination_configuaration_profile_field (
    "index" text,
    destination_configuaration_id text,
    defaults text,
    description text,
    format text,
    hidden text,
    is_required text,
    "name" text,
    pattern text,
    read_only text,
    title text,
    "type" text,
    PRIMARY KEY ("index", destination_configuaration_id),
    FOREIGN KEY (destination_configuaration_id) REFERENCES destination_configuaration(id)
);

CREATE TABLE destination_configuaration_delivery (
    "index" text,
    destination_configuaration_id text,
    authentication_id text,
    authentication_rule text,
    destination_server_id text,
    PRIMARY KEY ("index", destination_configuaration_id),
    FOREIGN KEY (destination_configuaration_id) REFERENCES destination_configuaration(id)
);

CREATE TABLE destination_configuaration (
    id text,
    ims_org text,
    aggregation_type text,
    backfill_historical_profile_data text,
    batch_config_allow_dedupe_key_field_selection text,
    batch_config_allow_mandatory_field_selection text,
    batch_config_allowed_export_modes text,
    batch_config_allowed_filename_append_options jsonb,
    batch_config_allowed_schedule_frequency text,
    batch_config_default_export_mode text,
    batch_config_default_filename text,
    batch_config_default_filename_append_options jsonb,
    batch_config_default_frequency text,
    batch_config_default_start_time text,
    batch_config_segment_grouping_enabled text,
    best_effort_aggregation text,
    best_effort_aggregation_max_users_per_request text,
    best_effort_aggregation_split_user_by_id text,
    configurable_aggregation_aggregation_key text,
    configurable_aggregation_max_batch_age_in_secs text,
    configurable_aggregation_max_num_events_in_batch text,
    configurable_aggregation_split_user_by_id text,
    created_date timestamp,
    customer_authentication_configuration text,
    description text,
    destination_delivery text,
    dule_labels jsonb,
    identity_another_attribute text,
    identity_another_custom_namespace text,
    identity_external_attribute text,
    identity_external_custom_namespace text,
    identity_external_global_namespaces jsonb,
    identity_external_transformation text,
    last_modified_date timestamp,
    marketing_actions jsonb,
    "name" text,
    schema_config_identity_required text,
    schema_config_profile_required text,
    schema_config_segment_namespace_allow_list jsonb,
    schema_config_segment_namespace_deny_list jsonb,
    schema_config_segment_required text,
    segment_config_audience_template_id text,
    segment_config_map_experience_platform_segment_id text,
    segment_config_map_experience_platform_segment_name text,
    segment_config_map_user_input text,
    "status" text,
    ui_attributes_category text,
    ui_attributes_connection_type text,
    ui_attributes_documentation_link text,
    ui_attributes_frequency text,
    PRIMARY KEY (id),
    FOREIGN KEY (ims_org) REFERENCES connection(username)
);

CREATE TABLE flow_source_connection (
    id text,
    flow_id text,
    base_connection_spec_id text,
    connection_spec_id text,
    base_connection_id text,
    base_connection_spec_version text,
    connection_spec_version text,
    PRIMARY KEY (id, flow_id),
    FOREIGN KEY (flow_id) REFERENCES flow(id),
    FOREIGN KEY (base_connection_spec_id) REFERENCES connection_spec(id),
    FOREIGN KEY (connection_spec_id) REFERENCES connection_spec(id)
);

CREATE TABLE flow_target_connection (
    id text,
    flow_id text,
    connection_spec_id text,
    connection_spec_version text,
    PRIMARY KEY (id, flow_id),
    FOREIGN KEY (flow_id) REFERENCES flow(id),
    FOREIGN KEY (connection_spec_id) REFERENCES connection_spec(id)
);

CREATE TABLE flow_transformation (
    "index" text,
    flow_id text,
    mapping_id text,
    mapping_version text,
    "name" text,
    PRIMARY KEY ("index", flow_id),
    FOREIGN KEY (flow_id) REFERENCES flow(id)
);

CREATE TABLE flow (
    id text,
    ims_org_id text,
    provider_ref_id text,
    created_at timestamp,
    created_by text,
    created_client text,
    description text,
    etag text,
    flow_spec_id text,
    flow_spec_version text,
    is_source_flow text,
    labels jsonb,
    last_operation_operation text,
    last_operation_started timestamp,
    last_operation_updated text,
    last_run_details_completed_at_utc timestamp,
    last_run_details_id text,
    last_run_details_started_at_utc timestamp,
    last_run_details_state text,
    "name" text,
    record_type jsonb,
    runs text,
    schedule_params_backfill text,
    schedule_params_frequency text,
    schedule_params_interval text,
    schedule_params_start_time timestamp,
    "state" text,
    updated_at timestamp,
    updated_by text,
    updated_client text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (ims_org_id) REFERENCES connection(username),
    FOREIGN KEY (provider_ref_id) REFERENCES dataset(id)
);

CREATE TABLE connection_spec_permissions_manage (
    "index" text,
    connection_spec_id text,
    "name" text,
    permission jsonb,
    "type" text,
    PRIMARY KEY ("index", connection_spec_id),
    FOREIGN KEY (connection_spec_id) REFERENCES connection_spec(id)
);

CREATE TABLE connection_spec_permissions_view (
    "index" text,
    connection_spec_id text,
    "name" text,
    permission jsonb,
    "type" text,
    PRIMARY KEY ("index", connection_spec_id),
    FOREIGN KEY (connection_spec_id) REFERENCES connection_spec(id)
);

CREATE TABLE connection_spec (
    id text,
    "name" text,
    provider_id text,
    version text,
    -- attributes_* (dynamic column),
    -- explore_spec_* (dynamic column),
    -- source_spec_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE audience_label (
    "index" text,
    audience_id text,
    label text,
    PRIMARY KEY ("index", audience_id),
    FOREIGN KEY (audience_id) REFERENCES audience(id)
);

CREATE TABLE audience (
    id text,
    dataset_id text,
    merge_policy_id text,
    create_epoch timestamp,
    created_by text,
    creation_time timestamp,
    data_governance_policy_exclude_opt_out text,
    dependencies jsonb,
    dependents jsonb,
    description text,
    evaluation_info_batch_enabled text,
    evaluation_info_continuous_enabled text,
    evaluation_info_synchronous_enabled text,
    expression_format text,
    expression_type text,
    expression_value text,
    is_system text,
    lifecycle_state text,
    linked_audience_ref_flow_id text,
    "name" text,
    profile_instance_id text,
    "type" text,
    update_epoch timestamp,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id),
    FOREIGN KEY (merge_policy_id) REFERENCES merge_policy(id)
);

CREATE TABLE schedule (
    id text,
    query_template_id text,
    created timestamp,
    query_ctas_parameters_dataset_name text,
    query_ctas_parameters_description text,
    query_ctas_parameters_target_schema_title text,
    query_db_name text,
    query_description text,
    query_insert_into_parameters_dataset_name text,
    schedule text,
    schedule_end_date text,
    schedule_max_active_runs text,
    schedule_start_date text,
    "state" text,
    updated timestamp,
    updated_user_id text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (query_template_id) REFERENCES query_template(id)
);

CREATE TABLE destination_server (
    id text,
    adls_gen_2_destination_path_templating_strategy text,
    adls_gen_2_destination_path_value text,
    azure_blob_destination_container_templating_strategy text,
    azure_blob_destination_container_value text,
    azure_blob_destination_path_templating_strategy text,
    azure_blob_destination_path_value text,
    created_date text,
    destination_server_type text,
    destination_url_templating_strategy text,
    destination_url_value text,
    dlz_destination_path_templating_strategy text,
    dlz_destination_path_value text,
    dlz_destination_use_case text,
    google_cloud_storage_destination_bucket_templating_strategy text,
    google_cloud_storage_destination_bucket_value text,
    google_cloud_storage_destination_path_templating_strategy text,
    google_cloud_storage_destination_path_value text,
    http_template_content_type text,
    http_template_headers text,
    http_template_http_method text,
    http_template_query_parameters_templating_strategy text,
    http_template_query_parameters_value text,
    http_template_request_body_templating_strategy text,
    http_template_request_body_value text,
    last_modified_date text,
    "name" text,
    s_3_destination_bucket_templating_strategy text,
    s_3_destination_bucket_value text,
    s_3_destination_path_templating_strategy text,
    s_3_destination_path_value text,
    sftp_destination_encryption_mode text,
    sftp_destination_host_name_templating_strategy text,
    sftp_destination_host_name_value text,
    sftp_destination_port text,
    sftp_destination_root_directory_templating_strategy text,
    sftp_destination_root_directory_value text,
    PRIMARY KEY (id)
);

CREATE TABLE computed_attribute_defined (
    "index" text,
    computed_attribute_id text,
    meta_container_id text,
    meta_resource_type text,
    PRIMARY KEY ("index", computed_attribute_id),
    FOREIGN KEY (computed_attribute_id) REFERENCES computed_attribute(id)
);

CREATE TABLE computed_attribute (
    id text,
    ims_org_id text,
    create_epoch timestamp,
    created_by text,
    description text,
    display_name text,
    expression_format text,
    expression_type text,
    expression_value text,
    keep_current text,
    last_evaluation_ts text,
    merge_function_value text,
    "name" text,
    "path" text,
    return_schema_meta_xdm_type text,
    schema_name text,
    "status" text,
    "type" text,
    update_epoch timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ims_org_id) REFERENCES connection(username)
);

CREATE TABLE schema_registry_class (
    id text,
    alt_id text,
    description text,
    resource_type text,
    title text,
    "type" text,
    version text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE dataset (
    id text,
    ims_org_id text,
    base_path text,
    classification_data_behavior text,
    classification_managed_by text,
    created timestamp,
    created_client text,
    created_user text,
    data_ingested text,
    data_source_id text,
    datastream_source text,
    description text,
    enable_error_diagnostics text,
    extensions_adobe_lakehouse_metrics_as_of text,
    extensions_adobe_lakehouse_metrics_row_count text,
    extensions_adobe_lakehouse_metrics_storage_size text,
    file text,
    file_description_charset text,
    file_description_delimiters text,
    file_description_escapes text,
    file_description_format text,
    file_description_header text,
    file_description_null_markers text,
    file_description_quotes text,
    ingestion_type text,
    last_batch_id text,
    last_batch_status text,
    last_failed_batch text,
    last_successful_batch text,
    "name" text,
    observable_schema jsonb,
    persistence_adls_location text,
    persistence_adls_type text,
    "schema" text,
    schema_ref_content_type text,
    schema_ref_id text,
    tags jsonb,
    updated timestamp,
    updated_user text,
    version text,
    view_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (ims_org_id) REFERENCES connection(username)
);

CREATE TABLE entity_identity (
    "index" text,
    entity_id text,
    id text,
    is_primary text,
    namespace_code text,
    PRIMARY KEY ("index", entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id)
);

CREATE TABLE entity (
    id text,
    last_modified_at timestamp,
    person_first_name text,
    person_last_name text,
    person_middle_name text,
    work_email_address text,
    work_email_is_primary text,
    work_email_label text,
    work_email_status text,
    work_email_type text,
    PRIMARY KEY (id)
);
