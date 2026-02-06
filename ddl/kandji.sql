CREATE TABLE device_activity (
    id text,
    blueprint_id text,
    device_id text,
    action_type text,
    blueprint_is_removed text,
    computer_is_removed text,
    created_at text,
    detail_attempt text,
    detail_command_type text,
    detail_date_completed text,
    detail_date_requested text,
    detail_error_chain jsonb,
    detail_is_silent text,
    detail_last_pushed text,
    detail_metadata jsonb,
    detail_priority text,
    detail_profile_name text,
    detail_profile_uuid text,
    detail_request_requires_network_tether text,
    detail_request_type text,
    detail_skip_retry text,
    detail_status text,
    detail_user text,
    detail_username text,
    detail_uuid text,
    external_token text,
    users text,
    PRIMARY KEY (id),
    FOREIGN KEY (blueprint_id) REFERENCES blueprint(id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device_app (
    id text,
    device_id text,
    app_name text,
    app_store_vendable text,
    bundle_id text,
    bundle_size text,
    creation_date text,
    device_based_vpp text,
    modification_date text,
    "path" text,
    process text,
    signature text,
    "source" text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device_library_item (
    id text,
    blueprint_id text,
    device_id text,
    control_log text,
    control_reported_at text,
    item_id text,
    last_audit_log text,
    last_audit_run text,
    log text,
    "name" text,
    reported_at text,
    rules_present text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (blueprint_id) REFERENCES blueprint(id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device (
    id text,
    blueprint_id text,
    agent_installed text,
    agent_version text,
    asset_tag text,
    first_enrollment text,
    is_missing text,
    is_removed text,
    last_check_in text,
    last_enrollment text,
    lost_mode_status text,
    mdm_enabled text,
    model text,
    "name" text,
    os_version text,
    platform text,
    serial_number text,
    user_email text,
    user_id text,
    user_is_archived text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (blueprint_id) REFERENCES blueprint(id)
);

CREATE TABLE blueprint (
    id text,
    color text,
    computers_count text,
    description text,
    enrollment_code text,
    enrollment_is_active text,
    icon text,
    missing_computers_count bigint,
    "name" text,
    -- param_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE mdm_device (
    id text,
    device_associated_token_id text,
    deferred_install text,
    enrolled_at text,
    enrollment_status text,
    is_missing text,
    is_removed text,
    "name" text,
    "status" text,
    PRIMARY KEY (id, device_associated_token_id),
    FOREIGN KEY (device_associated_token_id) REFERENCES device_associated_token(id)
);

CREATE TABLE device_associated_token (
    id text,
    blueprint_id text,
    list_ade_id text,
    asset_tag text,
    assignment_status_received_at text,
    color text,
    dep_account_id text,
    dep_account_server_name text,
    description text,
    device_assigned_by text,
    device_assigned_date text,
    device_family text,
    failed_assignment_attempts text,
    last_assignment_status text,
    model text,
    os text,
    profile_assign_time text,
    profile_push_time text,
    profile_status text,
    serial_number text,
    users text,
    PRIMARY KEY (id),
    FOREIGN KEY (blueprint_id) REFERENCES blueprint(id),
    FOREIGN KEY (list_ade_id) REFERENCES list_ade(id)
);

CREATE TABLE device_parameter (
    id text,
    device_id text,
    category text,
    "name" text,
    "status" text,
    subcategory text,
    PRIMARY KEY (id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE list_ade (
    id text,
    access_token_expiry text,
    admin_id text,
    blueprint_id text,
    days_left text,
    default_email text,
    default_phone text,
    device_count_apple_tv bigint,
    device_count_ipad text,
    device_count_iphone text,
    device_count_mac text,
    device_count_total text,
    last_device_sync text,
    organization_address text,
    organization_email text,
    organization_name text,
    organization_phone text,
    organization_type text,
    server_name text,
    server_uuid text,
    "status" text,
    status_reason text,
    status_received_at text,
    stoken_file_name text,
    PRIMARY KEY (id)
);

CREATE TABLE blueprint_result_template (
    id text,
    blueprint_result_id text,
    category text,
    color text,
    description text,
    icon text,
    "name" text,
    rating text,
    -- param_* (dynamic column),
    PRIMARY KEY (id, blueprint_result_id),
    FOREIGN KEY (blueprint_result_id) REFERENCES blueprint_result(id)
);

CREATE TABLE blueprint_result (
    id text,
    "name" text,
    weight text,
    PRIMARY KEY (id)
);
