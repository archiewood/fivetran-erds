CREATE TABLE privacy_domain_settings_history (
    created text,
    created_by text,
    last_updated text,
    domains jsonb,
    last_updated_by text,
    only_record_known_domain text,
    "type" text,
    PRIMARY KEY (created, created_by, last_updated)
);

CREATE TABLE segment (
    id text,
    created timestamp,
    creator text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE privacy_block_rule_history (
    created text,
    created_by text,
    last_updated text,
    blocked_app_ids jsonb,
    blocked_ips jsonb,
    blocked_uas jsonb,
    last_updated_by text,
    PRIMARY KEY (created, created_by, last_updated)
);

CREATE TABLE privacy_recording_feature_history (
    created text,
    created_by text,
    last_updated text,
    ajax_watcher text,
    client_side_rage_click text,
    console_watcher text,
    enabled text,
    last_updated_by text,
    recording_shutoff text,
    resource_uploading text,
    "type" text,
    PRIMARY KEY (created, created_by, last_updated)
);

CREATE TABLE privacy_geo_settings_history (
    created text,
    created_by text,
    last_updated text,
    last_updated_by text,
    record_geo_mode text,
    record_geo_zones jsonb,
    PRIMARY KEY (created, created_by, last_updated)
);

CREATE TABLE privacy_ajax_watch (
    _fivetran_id text,
    privacy_setting_history_created text,
    privacy_setting_history_created_by text,
    record_req text,
    record_rsp text,
    url_regex text,
    white_list_req text,
    white_list_rsp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (privacy_setting_history_created) REFERENCES privacy_setting_history(created),
    FOREIGN KEY (privacy_setting_history_created_by) REFERENCES privacy_setting_history(created_by)
);

CREATE TABLE privacy_element_block (
    group_id text,
    privacy_setting_history_created text,
    privacy_setting_history_created_by text,
    consent text,
    editable text,
    exception_selectors jsonb,
    label text,
    last_updated text,
    notes text,
    scope text,
    selector text,
    targeting_condition jsonb,
    "type" text,
    PRIMARY KEY (group_id, privacy_setting_history_created, privacy_setting_history_created_by),
    FOREIGN KEY (privacy_setting_history_created) REFERENCES privacy_setting_history(created),
    FOREIGN KEY (privacy_setting_history_created_by) REFERENCES privacy_setting_history(created_by)
);

CREATE TABLE privacy_element_group (
    group_id text,
    privacy_setting_history_created text,
    privacy_setting_history_created_by text,
    editable text,
    note text,
    scope text,
    template_id text,
    PRIMARY KEY (group_id, privacy_setting_history_created, privacy_setting_history_created_by),
    FOREIGN KEY (privacy_setting_history_created) REFERENCES privacy_setting_history(created),
    FOREIGN KEY (privacy_setting_history_created_by) REFERENCES privacy_setting_history(created_by)
);

CREATE TABLE privacy_setting_history (
    created text,
    created_by text,
    last_updated text,
    default_privacy_mode text,
    discard_ip_addresse text,
    last_updated_by text,
    PRIMARY KEY (created, created_by, last_updated)
);

CREATE TABLE user_property (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    app_url text,
    display_name text,
    email text,
    is_being_deleted text,
    "schema" text,
    type_conflict text,
    uid text,
    PRIMARY KEY (id)
);

CREATE TABLE segment_event (
    _fivetran_id text,
    user_id text,
    active_sec text,
    app_device_model text,
    app_device_vendor text,
    app_name text,
    app_os_version text,
    app_package_name text,
    app_version text,
    app_view_name text,
    avg_session_active_sec text,
    avg_session_sec text,
    display_name text,
    email text,
    event_cumulative_layout_shift text,
    event_custom_name text,
    event_duration text,
    event_first_input_delay text,
    event_mobile_source_file text,
    event_mod_dead text,
    event_mod_error text,
    event_mod_frustrated text,
    event_mod_suspicious text,
    event_page_offset text,
    event_secondary_duration text,
    event_session_offset text,
    event_start text,
    event_sub_type text,
    event_target_selector text,
    event_target_text text,
    event_type text,
    event_var_error_kind text,
    event_var_fields text,
    event_web_source_file_url text,
    indv_id text,
    last_browser text,
    last_device text,
    last_event_start text,
    last_ip text,
    last_lat_long text,
    last_opperating_system text,
    last_page text,
    last_platform text,
    last_session_active_sec text,
    last_session_num_events text,
    last_session_num_pages text,
    last_session_sec text,
    last_session_start text,
    load_dom_content_time text,
    load_event_time text,
    load_first_paint_time text,
    load_largest_paint_time text,
    max_session_sec text,
    page_active_duration text,
    page_browser text,
    page_browser_version text,
    page_cluster_id text,
    page_device text,
    page_duration text,
    page_id text,
    page_ip text,
    page_lat_long text,
    page_max_scroll_depth_percent text,
    page_name text,
    page_num_derived_events text,
    page_num_errors text,
    page_num_events text,
    page_num_infos text,
    page_num_warnings text,
    page_operating_system text,
    page_platform text,
    page_referer_url text,
    page_screen_height text,
    page_screen_width text,
    page_start text,
    page_url text,
    page_user_agent text,
    page_viewport_height text,
    page_viewport_width text,
    req_method text,
    req_status text,
    req_url text,
    session_id text,
    session_start text,
    total_sec text,
    uid text,
    user_app_key text,
    user_business_id_real text,
    user_created text,
    user_display_name text,
    user_email text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
