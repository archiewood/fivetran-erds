CREATE TABLE workspace_project (
    id text,
    workspace_id text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (id) REFERENCES project(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    can_index text,
    can_view text,
    PRIMARY KEY (id)
);

CREATE TABLE dashboard_layout_component (
    id text,
    dashboard_layout_dashboard_id text,
    dashboard_layout_id text,
    dashboard_element_id text,
    columns text,
    deleted text,
    element_title text,
    element_title_hidden text,
    height text,
    "row" text,
    vis_type text,
    width text,
    PRIMARY KEY (id, dashboard_layout_dashboard_id, dashboard_layout_id),
    FOREIGN KEY (dashboard_layout_dashboard_id) REFERENCES dashboard_layout(dashboard_id),
    FOREIGN KEY (dashboard_layout_id) REFERENCES dashboard_layout(id),
    FOREIGN KEY (dashboard_element_id) REFERENCES dashboard_element(id)
);

CREATE TABLE dashboard_layout (
    id text,
    dashboard_id text,
    active text,
    can_create text,
    can_destroy text,
    can_index text,
    can_show text,
    can_update text,
    column_width text,
    deleted text,
    "type" text,
    width text,
    PRIMARY KEY (id, dashboard_id),
    FOREIGN KEY (dashboard_id) REFERENCES dashboard(id)
);

CREATE TABLE integration_hub (
    id text,
    can_accept_legal_agreement text,
    can_create text,
    can_destroy text,
    can_index text,
    can_show text,
    can_update text,
    fetch_error_message text,
    has_authorization_token text,
    label text,
    legal_agreement_required text,
    legal_agreement_signed text,
    legal_agreement_text text,
    official text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE project (
    id text,
    allow_warnings text,
    can_deploy_ref_to_production text,
    can_index text,
    can_link_to_service text,
    can_show text,
    can_show_branches text,
    can_show_manifest text,
    can_update text,
    can_validate text,
    can_view_git_deploy_key text,
    can_webhook_deploy text,
    dependency_status text,
    git_application_server_http_port text,
    git_application_server_http_scheme text,
    git_password_user_attribute text,
    git_production_branch_name text,
    git_release_mgmt_enabled text,
    git_service_name text,
    git_username text,
    git_username_user_attribute text,
    is_example text,
    "name" text,
    pull_request_mode text,
    use_git_cookie_auth text,
    uses_git text,
    validation_required text,
    PRIMARY KEY (id)
);

CREATE TABLE connection_snippet (
    _fivetran_id text,
    connection_name text,
    label text,
    "name" text,
    sql text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (connection_name) REFERENCES connection("name")
);

CREATE TABLE dialect_connection_test (
    connection_test text,
    connection_name text,
    PRIMARY KEY (connection_test, connection_name),
    FOREIGN KEY (connection_name) REFERENCES connection("name")
);

CREATE TABLE connection (
    "name" text,
    user_id text,
    after_connect_statements text,
    can_access_data text,
    can_cost_estimate text,
    can_create text,
    can_destroy text,
    can_explore text,
    can_index text,
    can_index_limited text,
    can_refresh_schemas text,
    can_run_sql_queries text,
    can_show text,
    can_test text,
    can_update text,
    cost_estimate_enabled text,
    created_at text,
    database text,
    dialect_automatically_run_sql_runner_snippets text,
    dialect_cost_estimate_style text,
    dialect_has_ssl_support text,
    dialect_label text,
    dialect_name text,
    dialect_persistent_table_distkey text,
    dialect_persistent_table_indexes text,
    dialect_persistent_table_sortkeys text,
    dialect_supports_cost_estimate text,
    dialect_supports_inducer text,
    dialect_supports_multiple_databases text,
    dialect_supports_persistent_derived_tables text,
    dialect_supports_streaming text,
    disable_context_comment text,
    example text,
    host text,
    jdbc_additional_params text,
    last_reap_at text,
    last_regen_at text,
    managed text,
    max_billing_gigabytes text,
    max_connections text,
    pdt_api_control_enabled text,
    pdt_concurrency text,
    pdt_context_override text,
    pdts_enabled text,
    pool_timeout text,
    sql_runner_precache_tables text,
    sql_writing_with_info_schema text,
    ssl text,
    supports_data_studio_link text,
    tmp_db_name text,
    tunnel_id text,
    user_attribute_fields text,
    uses_application_default_credentials text,
    uses_oauth text,
    verify_ssl text,
    PRIMARY KEY ("name"),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_attribute_group_value (
    id text,
    group_id text,
    user_attribute_id text,
    can jsonb,
    rank text,
    "value" text,
    value_is_hidden text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_attribute_id) REFERENCES user_attribute_value(id)
);

CREATE TABLE dashboard (
    id text,
    content_metadata_id text,
    deleter_id text,
    folder_id text,
    last_updater_id text,
    model_id text,
    user_id text,
    alert_sync_with_dashboard_filter_enabled text,
    background_color text,
    can_copy text,
    can_create text,
    can_destroy text,
    can_download text,
    can_index text,
    can_move text,
    can_recover text,
    can_render text,
    can_run text,
    can_schedule text,
    can_see_aggregate_table_lookml text,
    can_see_lookml text,
    can_show text,
    can_update text,
    content_favorite_id text,
    created_at text,
    crossfilter_enabled text,
    deleted text,
    deleted_at text,
    description text,
    edit_uri text,
    enable_viz_full_screen text,
    favorite_count text,
    filters_bar_collapsed text,
    filters_location_top text,
    hidden text,
    last_accessed_at text,
    last_viewed_at text,
    load_configuration text,
    lookml_link_id text,
    model_label text,
    preferred_viewer text,
    query_timezone text,
    readonly text,
    refresh_interval text,
    refresh_interval_to_i text,
    show_filters_bar text,
    show_title text,
    slug text,
    title text,
    updated_at text,
    url text,
    view_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_metadata_id) REFERENCES content_metadata(id),
    FOREIGN KEY (deleter_id) REFERENCES users(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (last_updater_id) REFERENCES users(id),
    FOREIGN KEY (model_id) REFERENCES look(model_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE look (
    id text,
    content_metadata_id text,
    creator_id text,
    deleter_id text,
    folder_id text,
    last_updater_id text,
    parent_id text,
    user_id text,
    can_copy text,
    can_create text,
    can_destroy text,
    can_download text,
    can_download_unlimited text,
    can_explore text,
    can_find_and_replace text,
    can_index text,
    can_move text,
    can_recover text,
    can_render text,
    can_run text,
    can_schedule text,
    can_show text,
    can_show_errors text,
    can_update text,
    content_favorite_id text,
    created_at text,
    deleted text,
    deleted_at text,
    description text,
    excel_file_url text,
    favorite_count text,
    google_spreadsheet_formula text,
    is_run_on_load text,
    last_accessed_at text,
    last_viewed_at text,
    model_id text,
    model_label text,
    public text,
    public_slug text,
    public_url text,
    query_id text,
    title text,
    updated_at text,
    view_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_metadata_id) REFERENCES content_metadata(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (deleter_id) REFERENCES users(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (last_updater_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES look(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_looker_version (
    version text,
    user_id text,
    PRIMARY KEY (version, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_group (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    role_id text,
    user_id text,
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_session (
    id text,
    user_id text,
    sudo_user_id text,
    browser text,
    can text,
    city text,
    country text,
    created_at text,
    credentials_type text,
    expires_at text,
    extended_at text,
    extended_count text,
    ip_address text,
    operating_system text,
    "state" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (sudo_user_id) REFERENCES users(id)
);

CREATE TABLE user_credential_embed (
    id text,
    external_group_id text,
    external_user_id text,
    user_id text,
    can text,
    created_at text,
    logged_in_at text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (external_group_id) REFERENCES groups(id),
    FOREIGN KEY (external_user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    credentials_email_user_id text,
    embed_group_folder_id text,
    home_folder_id text,
    personal_folder_id text,
    allow_direct_roles text,
    allow_normal_group_membership text,
    allow_roles_from_normal_groups text,
    can_index text,
    can_index_details text,
    can_show text,
    can_show_creds text,
    can_show_details text,
    can_sudo text,
    can_update_creds text,
    credentials_email_account_setup_url text,
    credentials_email_created_at text,
    credentials_email_credentials_ldap text,
    credentials_email_credentials_looker_openid text,
    credentials_email_credentials_oidc text,
    credentials_email_credentials_saml text,
    credentials_email_credentials_totp text,
    credentials_email_display_name text,
    credentials_email_email text,
    credentials_email_forced_password_reset_at_next_login text,
    credentials_email_is_disabled text,
    credentials_email_logged_in_at text,
    credentials_email_type text,
    credentials_google text,
    credentials_ldap text,
    credentials_looker_openid text,
    credentials_oidc text,
    credentials_saml text,
    credentials_totp text,
    email text,
    is_disabled text,
    locale text,
    models_dir_validated text,
    presumed_looker_employee text,
    roles_externally_managed text,
    ui_state text,
    url text,
    verified_looker_employee text,
    PRIMARY KEY (id),
    FOREIGN KEY (credentials_email_user_id) REFERENCES users(id),
    FOREIGN KEY (embed_group_folder_id) REFERENCES folder(id),
    FOREIGN KEY (home_folder_id) REFERENCES folder(id),
    FOREIGN KEY (personal_folder_id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    content_metadata_id text,
    creator_id text,
    parent_id text,
    can_create text,
    can_destroy text,
    can_edit_content text,
    can_index text,
    can_move_content text,
    can_save_shared_space_as_embed_user text,
    can_see_admin_spaces text,
    can_show text,
    can_update text,
    child_count text,
    created_at text,
    external_id text,
    is_embed text,
    is_embed_shared_root text,
    is_embed_users_root text,
    is_personal text,
    is_personal_descendant text,
    is_shared_root text,
    is_users_root text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_metadata_id) REFERENCES content_metadata(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES folder(id)
);

CREATE TABLE integration_supported_format (
    supported_format text,
    integration_id text,
    PRIMARY KEY (supported_format, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_supported_action_type (
    supported_action_type text,
    integration_id text,
    PRIMARY KEY (supported_action_type, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_supported_formatting (
    supported_formatting text,
    integration_id text,
    PRIMARY KEY (supported_formatting, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_supported_visualization_format (
    supported_visualization_formatting text,
    integration_id text,
    PRIMARY KEY (supported_visualization_formatting, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_supported_download_setting (
    supported_download_setting text,
    integration_id text,
    PRIMARY KEY (supported_download_setting, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_param (
    "name" text,
    integration_id text,
    delegate_oauth_url text,
    description text,
    has_value text,
    label text,
    per_user text,
    required text,
    sensitive text,
    "value" text,
    PRIMARY KEY ("name", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_required_field (
    tags text,
    integration_id text,
    all_tags text,
    any_tag text,
    PRIMARY KEY (tags, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration (
    id text,
    integration_hub_id text,
    can_configure_user_attribute_params text,
    can_fetch_form text,
    can_index text,
    can_send_to text,
    can_show text,
    can_show_icon text,
    can_show_param_values text,
    can_test text,
    can_update text,
    delegate_oauth text,
    description text,
    enabled text,
    icon_url text,
    installed_delegate_oauth_targets text,
    label text,
    privacy_link text,
    uses_oauth text,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_hub_id) REFERENCES integration_hub(id)
);

CREATE TABLE permission_set_permission (
    permission text,
    permission_set_id text,
    PRIMARY KEY (permission, permission_set_id),
    FOREIGN KEY (permission) REFERENCES permission(permission),
    FOREIGN KEY (permission_set_id) REFERENCES permission_set(id)
);

CREATE TABLE permission_set (
    id text,
    all_access text,
    built_in text,
    can_index text,
    can_show text,
    can_update text,
    "name" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE "role" (
    id text,
    model_set_id text,
    permission_set_id text,
    can_index text,
    can_show text,
    can_update text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (model_set_id) REFERENCES model_set(id),
    FOREIGN KEY (permission_set_id) REFERENCES permission_set(id)
);

CREATE TABLE role_group (
    id text,
    external_group_id text,
    role_id text,
    can_add_to_content_metadata text,
    can_create text,
    can_delete text,
    can_edit_in_ui text,
    can_index text,
    can_show text,
    can_update text,
    contains_current_user text,
    externally_managed text,
    include_by_default text,
    "name" text,
    user_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (external_group_id) REFERENCES groups(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE content_metadata_access (
    id text,
    content_metadata_id text,
    group_id text,
    user_id text,
    can text,
    permission_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_metadata_id) REFERENCES content_metadata(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_attribute_value (
    id text,
    user_id text,
    can text,
    hidden_value_domain_whitelist text,
    label text,
    "name" text,
    rank text,
    "source" text,
    user_can_edit text,
    "value" text,
    value_is_hidden text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dashboard_result_filter (
    _fivetran_id text,
    dashboard_element_id text,
    listen text,
    model text,
    "name" text,
    "view" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dashboard_element_id) REFERENCES dashboard_element(id)
);

CREATE TABLE dashboard_look_query (
    id text,
    dashboard_element_id text,
    analysis_config text,
    client_id text,
    column_limit text,
    dynamic_fields text,
    fields text,
    fill_fields text,
    filter_config text,
    filter_expression text,
    filters text,
    has_table_calculations text,
    limits text,
    model text,
    pivots text,
    query_timezone text,
    quick_calcs text,
    row_total text,
    slug text,
    sorts text,
    sub_totals text,
    total text,
    "view" text,
    visible_ui_sections text,
    PRIMARY KEY (id),
    FOREIGN KEY (dashboard_element_id) REFERENCES dashboard_element(id)
);

CREATE TABLE dashboard_element (
    id text,
    dashboard_id text,
    look_id text,
    query_id text,
    alert_count text,
    body_text text,
    can_create text,
    can_destroy text,
    can_explore text,
    can_find_and_replace text,
    can_index text,
    can_run text,
    can_see_aggregate_table_lookml text,
    can_show text,
    can_show_errors text,
    can_update text,
    look_vis_config_conditional_formatting_ignored_fields text,
    look_vis_config_conditional_formatting_include_nulls text,
    look_vis_config_conditional_formatting_include_totals text,
    look_vis_config_enable_conditional_formatting text,
    look_vis_config_hide_row_totals text,
    look_vis_config_hide_totals text,
    look_vis_config_label_density text,
    look_vis_config_legend_position text,
    look_vis_config_limit_displayed_rows text,
    look_vis_config_ordering text,
    look_vis_config_series_types text,
    look_vis_config_show_null_labels text,
    look_vis_config_show_row_numbers text,
    look_vis_config_show_silhouette text,
    look_vis_config_show_totals_labels text,
    look_vis_config_show_value_labels text,
    look_vis_config_show_view_names text,
    look_vis_config_show_x_axis_label text,
    look_vis_config_show_x_axis_ticks text,
    look_vis_config_show_y_axis_labels text,
    look_vis_config_show_y_axis_ticks text,
    look_vis_config_stacking text,
    look_vis_config_table_theme text,
    look_vis_config_totals_color text,
    look_vis_config_truncate_column_names text,
    look_vis_config_type text,
    look_vis_config_x_axis_gridlines text,
    look_vis_config_x_axis_scale text,
    look_vis_config_y_axis_combined text,
    look_vis_config_y_axis_gridlines text,
    look_vis_config_y_axis_scale_mode text,
    look_vis_config_y_axis_tick_density text,
    look_vis_config_y_axis_tick_density_custom text,
    note_display text,
    note_state text,
    note_text text,
    refresh_interval text,
    refresh_interval_to_i text,
    result_maker_dynamic_fields text,
    result_maker_id text,
    result_maker_merge_result_id text,
    result_maker_query_id text,
    result_maker_sorts text,
    result_maker_sql_query_id text,
    result_maker_total text,
    rich_content_json text,
    subtitle_text text,
    title text,
    title_hidden text,
    title_text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (dashboard_id) REFERENCES dashboard(id),
    FOREIGN KEY (look_id) REFERENCES look(id),
    FOREIGN KEY (query_id) REFERENCES look(query_id)
);

CREATE TABLE datagroup (
    id text,
    can_index text,
    can_show text,
    can_update text,
    created_at text,
    "name" text,
    stale_before text,
    trigger_check_at text,
    trigger_error text,
    trigger_value text,
    triggered_at text,
    PRIMARY KEY (id)
);

CREATE TABLE content_metadata (
    id text,
    dashboard_id text,
    folder_id text,
    inheriting_id text,
    look_id text,
    parent_id text,
    can text,
    content_type text,
    inherits text,
    "name" text,
    slug text,
    PRIMARY KEY (id),
    FOREIGN KEY (dashboard_id) REFERENCES dashboard(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (inheriting_id) REFERENCES content_metadata(id),
    FOREIGN KEY (look_id) REFERENCES look(id),
    FOREIGN KEY (parent_id) REFERENCES content_metadata(id)
);

CREATE TABLE user_login_lockout (
    _fivetran_id text,
    user_id text,
    auth_type text,
    can jsonb,
    email text,
    fail_count text,
    ip text,
    "key" text,
    lockout_at text,
    remote_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE model_set_model (
    model text,
    model_set_id text,
    PRIMARY KEY (model, model_set_id),
    FOREIGN KEY (model_set_id) REFERENCES model_set(id)
);

CREATE TABLE model_set (
    id text,
    all_access text,
    built_in text,
    can_index text,
    can_show text,
    can_update text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE homepage_item (
    id text,
    content_created_by text,
    content_metadata_id text,
    dashboard_id text,
    homepage_section_id text,
    look_id text,
    content_favorite_id text,
    content_updated_at text,
    custom_description text,
    custom_image_data_base_64 text,
    custom_title text,
    description text,
    favourite_content text,
    location text,
    lookml_dasboard_id text,
    orders text,
    section_fetch_time text,
    title text,
    use_custom_description text,
    use_custom_image text,
    use_custom_title text,
    view_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_created_by) REFERENCES users(id),
    FOREIGN KEY (content_metadata_id) REFERENCES content_metadata(id),
    FOREIGN KEY (dashboard_id) REFERENCES dashboard(id),
    FOREIGN KEY (homepage_section_id) REFERENCES homepage_section(id),
    FOREIGN KEY (look_id) REFERENCES look(id)
);

CREATE TABLE homepage_section (
    id text,
    homepage_id text,
    can_create text,
    can_destroy text,
    can_index text,
    can_show text,
    can_update text,
    created_at text,
    deleted_at text,
    description text,
    detail_url text,
    is_header text,
    item_order text,
    title text,
    updated_at text,
    visible_item_order text,
    PRIMARY KEY (id),
    FOREIGN KEY (homepage_id) REFERENCES homepage_section(id)
);

CREATE TABLE groups (
    id text,
    external_group_id text,
    can_add_to_content_metadata text,
    can_create text,
    can_delete text,
    can_edit_in_ui text,
    can_index text,
    can_show text,
    can_update text,
    contains_current_user text,
    externally_managed text,
    include_by_default text,
    "name" text,
    user_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (external_group_id) REFERENCES groups(id)
);

CREATE TABLE git_branch (
    _fivetran_id text,
    project_id text,
    ahead_count text,
    behind_count text,
    can text,
    commit_at text,
    error text,
    is_local text,
    is_production text,
    is_remote text,
    message text,
    "name" text,
    owner_name text,
    personal text,
    readonly text,
    ref text,
    remote text,
    remote_name text,
    remote_ref text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE permission (
    permission text,
    parent text,
    can text,
    description text,
    PRIMARY KEY (permission),
    FOREIGN KEY (parent) REFERENCES permission(permission)
);

CREATE TABLE lookml_model_explore (
    "name" text,
    lookml_model_name text,
    description text,
    group_label text,
    hidden text,
    label text,
    PRIMARY KEY ("name", lookml_model_name),
    FOREIGN KEY (lookml_model_name) REFERENCES lookml_model("name")
);

CREATE TABLE lookml_model (
    "name" text,
    project_name text,
    allowed_db_connection_names text,
    can_create text,
    can_destroy text,
    can_index text,
    can_show text,
    can_update text,
    explores text,
    has_content text,
    label text,
    unlimited_db_connections text,
    PRIMARY KEY ("name"),
    FOREIGN KEY (project_name) REFERENCES project(id)
);
