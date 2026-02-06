CREATE TABLE document_custom_field (
    "index" text,
    document_id text,
    field_id text,
    "value" jsonb,
    PRIMARY KEY ("index", document_id),
    FOREIGN KEY (document_id) REFERENCES document(id),
    FOREIGN KEY (field_id) REFERENCES custom_field(id)
);

CREATE TABLE document (
    id text,
    parent_document_id text,
    parent_folder_id text,
    deleted boolean,
    description text,
    document_hub_id text,
    folder_ids jsonb,
    nav_link_folder_ids jsonb,
    nav_links_count text,
    template_id text,
    title text,
    ts_created timestamp,
    ts_deleted timestamp,
    ts_updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_document_id) REFERENCES document(id),
    FOREIGN KEY (parent_folder_id) REFERENCES folder(id)
);

CREATE TABLE term_custom_field (
    field_id text,
    term_id text,
    field_name text,
    "value" jsonb,
    PRIMARY KEY (field_id, term_id),
    FOREIGN KEY (field_id) REFERENCES custom_field(id),
    FOREIGN KEY (term_id) REFERENCES term(id)
);

CREATE TABLE term (
    id text,
    deleted boolean,
    description text,
    glossary_ids jsonb,
    template_id text,
    title text,
    ts_created timestamp,
    ts_deleted timestamp,
    ts_updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE policy_steward (
    id text,
    policy_id text,
    deleted boolean,
    email text,
    "name" text,
    otype text,
    otype_display_name text,
    photo_url text,
    snippet text,
    title text,
    url text,
    PRIMARY KEY (id, policy_id),
    FOREIGN KEY (policy_id) REFERENCES policy(id)
);

CREATE TABLE policy (
    id text,
    description text,
    otype text,
    title text,
    ts_created timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE policy_group_steward (
    id text,
    policy_group_id text,
    deleted boolean,
    email text,
    "name" text,
    otype text,
    otype_display_name text,
    photo_url text,
    snippet text,
    title text,
    url text,
    PRIMARY KEY (id, policy_group_id),
    FOREIGN KEY (policy_group_id) REFERENCES policy_group(id)
);

CREATE TABLE policy_group (
    id text,
    description text,
    otype text,
    policies_count text,
    title text,
    ts_created timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_allowed_otype (
    otype text,
    custom_field_id text,
    PRIMARY KEY (otype, custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field_option (
    "option" text,
    custom_field_id text,
    PRIMARY KEY ("option", custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    allow_multiple boolean,
    backref_name text,
    backref_tooltip_text text,
    builtin_name text,
    field_type text,
    name_plural text,
    name_singular text,
    tooltip_text text,
    PRIMARY KEY (id)
);

CREATE TABLE column_custom_field (
    "index" text,
    column_detail_id text,
    field_id text,
    field_name text,
    source_tag_applied_state text,
    "value" jsonb,
    PRIMARY KEY ("index", column_detail_id),
    FOREIGN KEY (column_detail_id) REFERENCES column_detail(id),
    FOREIGN KEY (field_id) REFERENCES custom_field(id)
);

CREATE TABLE column_detail (
    id text,
    datasource_id text,
    schema_id text,
    table_id text,
    column_comment text,
    column_type text,
    description text,
    index_is_foreign_key text,
    index_is_other_index text,
    index_is_primary_key text,
    index_referenced_column_id text,
    "key" text,
    "name" text,
    nullable boolean,
    "position" text,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (datasource_id) REFERENCES datasource_ocf(id),
    FOREIGN KEY (schema_id) REFERENCES schema_detail(id),
    FOREIGN KEY (table_id) REFERENCES table_detail(id)
);

CREATE TABLE child_column_detail (
    id text,
    column_id text,
    children jsonb,
    description text,
    "key" text,
    other_metadata jsonb,
    "path" text,
    title text,
    "type" text,
    PRIMARY KEY (id, column_id),
    FOREIGN KEY (column_id) REFERENCES column_detail(id)
);

CREATE TABLE datasource_ocf (
    id text,
    all_schemas text,
    auth_tip text,
    aws_access_key_id text,
    aws_region text,
    builtin_datasource text,
    can_data_upload boolean,
    can_toggle_ds_privacy boolean,
    compose_oauth_enabled boolean,
    connector_id text,
    cron_extraction text,
    data_upload_disabled_message text,
    db_username text,
    dbname text,
    dbtype text,
    delete_status text,
    deleted boolean,
    deployment_setup_complete boolean,
    description text,
    disable_auto_extraction boolean,
    enable_complex_type boolean,
    enable_default_schema_extraction boolean,
    enable_designated_credential boolean,
    enable_preserve_query_result boolean,
    enable_query_result_export boolean,
    exclude_additional_columns_in_qli boolean,
    exclude_schemas text,
    favorited_by_list jsonb,
    has_aws_glue_metastore boolean,
    has_aws_s_3_based_qli boolean,
    has_hdfs_based_qli boolean,
    has_metastore_uri boolean,
    has_previewable_qli boolean,
    hive_logs_source text,
    hive_logs_source_type text,
    hive_tez_logs_source text,
    host text,
    icon text,
    is_gone boolean,
    is_hidden boolean,
    is_hive boolean,
    is_presto_hive boolean,
    is_virtual boolean,
    jdbc_driver text,
    latest_extraction_successful boolean,
    latest_extraction_time timestamp,
    limit_schemas text,
    metastore_type text,
    metastore_uri text,
    negative_filter_words jsonb,
    nosql_mde_sample_size text,
    obfuscate_literals jsonb,
    otype text,
    owner_ids jsonb,
    port text,
    private boolean,
    profiling_tip text,
    qli_aws_access_key_id text,
    qli_aws_region text,
    qli_hive_connection_source text,
    qualified_name text,
    remove_filtered_schemas boolean,
    result_sharing_permission text,
    supports_compose boolean,
    supports_default_schema_extraction boolean,
    supports_explain boolean,
    supports_md_diagnostics boolean,
    supports_ocf_query_service_api boolean,
    supports_profiling boolean,
    supports_profiling_v_2 boolean,
    supports_qli_daterange boolean,
    supports_qli_diagnostics boolean,
    supports_query_cancellation boolean,
    title text,
    unresolved_mention_fingerprint_method text,
    uri text,
    url text,
    use_query_service text,
    uses_ocf_agent boolean,
    webhdfs_port text,
    webhdfs_server text,
    webhdfs_username text,
    PRIMARY KEY (id)
);

CREATE TABLE schema_custom_field (
    "index" text,
    schema_detail_id text,
    field_id text,
    field_name text,
    source_tag_applied_state text,
    "value" text,
    PRIMARY KEY ("index", schema_detail_id),
    FOREIGN KEY (schema_detail_id) REFERENCES schema_detail(id),
    FOREIGN KEY (field_id) REFERENCES custom_field(id)
);

CREATE TABLE schema_detail (
    id text,
    datasource_id text,
    db_comment text,
    description text,
    "key" text,
    "name" text,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (datasource_id) REFERENCES datasource_ocf(id)
);

CREATE TABLE custom_field_value_detail (
    ts_updated timestamp,
    field_id text,
    object_id text,
    otype text,
    source_tag_applied_state text,
    "value" jsonb,
    PRIMARY KEY (ts_updated, field_id),
    FOREIGN KEY (field_id) REFERENCES custom_field(id)
);

CREATE TABLE table_custom_field (
    "index" text,
    table_detail_id text,
    field_id text,
    source_tag_applied_state text,
    "value" jsonb,
    PRIMARY KEY ("index", table_detail_id),
    FOREIGN KEY (table_detail_id) REFERENCES table_detail(id),
    FOREIGN KEY (field_id) REFERENCES custom_field(id)
);

CREATE TABLE table_detail (
    id text,
    datasource_id text,
    schema_id text,
    base_table_key text,
    description text,
    "key" text,
    "name" text,
    partition_columns jsonb,
    partition_definition text,
    sql text,
    table_comment text,
    table_type text,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (datasource_id) REFERENCES datasource_ocf(id),
    FOREIGN KEY (schema_id) REFERENCES schema_detail(id)
);

CREATE TABLE folder_custom_field (
    custom_field_id text,
    folder_id text,
    PRIMARY KEY (custom_field_id, folder_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    parent_folder_id text,
    deleted boolean,
    description text,
    document_hub_id text,
    nav_links_count text,
    template_id text,
    title text,
    ts_created timestamp,
    ts_deleted timestamp,
    ts_updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_folder_id) REFERENCES folder(id)
);
