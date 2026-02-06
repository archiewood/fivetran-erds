CREATE TABLE trustcenter_access_request (
    request_id text,
    company text,
    created_at text,
    email text,
    expiration_date text,
    flow_type text,
    is_auto_approved text,
    lastname text,
    "name" text,
    reviewed_at text,
    "status" text,
    PRIMARY KEY (request_id)
);

CREATE TABLE workspace_framework (
    id text,
    workspace_id text,
    active_logo text,
    bg_color text,
    color text,
    controls_enabled text,
    created_at text,
    custom_framework_id text,
    description text,
    enabled_at text,
    framework_enabled text,
    has_level text,
    inactive_logo text,
    is_ready text,
    label text,
    level_label text,
    long_description text,
    "name" text,
    num_in_scope_requirement text,
    num_ready_in_scope_requirement text,
    privacy text,
    product_framework_enabled text,
    selected_level text,
    slug text,
    tags text,
    total_enabled_control text,
    total_in_scope_control text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    description text,
    how_it_works text,
    logo text,
    "name" text,
    primary_ text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE control_external_evidence (
    id text,
    control_id text,
    created_at text,
    description text,
    file text,
    is_expired text,
    "name" text,
    renewal_date text,
    renewal_schedule_type text,
    url text,
    PRIMARY KEY (id, control_id),
    FOREIGN KEY (control_id) REFERENCES control(id)
);

CREATE TABLE user_identities_infrastruture (
    id text,
    connection_id text,
    service_account_designator text,
    admin_access text,
    connected_at timestamp,
    created_at text,
    db_access text,
    disconnected_at text,
    email text,
    has_mfa text,
    identity_id text,
    last_checked_at text,
    service_account text,
    service_account_reason text,
    updated_at text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (service_account_designator) REFERENCES users(id)
);

CREATE TABLE connection_provider_type (
    _fivetran_id text,
    connection_id text,
    is_enabled text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (connection_id) REFERENCES connection(id)
);

CREATE TABLE connection (
    id text,
    account_id text,
    alias_updated_at text,
    authorized text,
    client_alias text,
    client_id text,
    client_type text,
    code text,
    connected text,
    connected_at timestamp,
    deleted_at text,
    failed_at text,
    "key" text,
    manually_updated_at text,
    "state" text,
    workspace jsonb,
    write_access_enabled text,
    PRIMARY KEY (id)
);

CREATE TABLE user_role (
    "index" text,
    user_id text,
    role_name text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_background_check (
    id text,
    user_id text,
    case_id text,
    case_invitation_id text,
    created_at text,
    invitation_email text,
    linked_at text,
    manual_check_date text,
    manually_check_url text,
    out_of_scope_at text,
    out_of_scope_reason text,
    report_data text,
    "source" text,
    "status" text,
    types text,
    updated_at text,
    url text,
    users jsonb,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_identity (
    id text,
    user_id text,
    connection_id text,
    connected_at text,
    disconnected_at text,
    first_name text,
    has_idp text,
    has_mfa text,
    identity_id text,
    is_contractor text,
    job_title text,
    last_name text,
    manager_id text,
    manager_name text,
    secondary_email text,
    separated_at text,
    started_at text,
    username text,
    users jsonb,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (connection_id) REFERENCES connection(id)
);

CREATE TABLE users (
    id text,
    avatar_url text,
    created_at text,
    drata_terms_agreed_at text,
    email text,
    entry_id text,
    first_name text,
    job_title text,
    last_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE trustcenter_monitor_control (
    _fivetran_id text,
    category text,
    control_code text,
    description text,
    is_enabled text,
    "name" text,
    "status" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE control_owner (
    control_id text,
    id text,
    avatar_url text,
    created_at text,
    drata_terms_agreed_at text,
    email text,
    first_name text,
    job_title text,
    last_name text,
    updated_at text,
    PRIMARY KEY (control_id, id),
    FOREIGN KEY (control_id) REFERENCES control(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE user_identities_version_control (
    id text,
    connection_id text,
    service_account_designator text,
    connected_at timestamp,
    created_at text,
    disconnected_at text,
    email text,
    has_mfa text,
    identity_id text,
    last_checked_at text,
    push_production_code_access text,
    service_account text,
    service_account_reason text,
    updated_at text,
    username text,
    write_access text,
    PRIMARY KEY (id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (service_account_designator) REFERENCES users(id)
);

CREATE TABLE device_compliance_check (
    id text,
    device_id text,
    check_frequency text,
    created_at text,
    expires_at text,
    last_checked_at text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, device_id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device_identifier (
    id text,
    device_id text,
    created_at text,
    identifier text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, device_id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device_document (
    id text,
    device_id text,
    created_at text,
    file_url text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, device_id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device (
    id text,
    asset_id text,
    user_id text,
    antivirus_enabled text,
    antivirus_explanation text,
    apps_count text,
    auto_update_enabled text,
    auto_update_explanation text,
    created_at text,
    deleted_at text,
    encryption_enabled text,
    encryption_explanation text,
    external_id text,
    firewall_enabled text,
    firewall_explanation text,
    gate_keeper_enabled text,
    is_device_compliant text,
    last_checked_at text,
    mac_address text,
    model text,
    os_version text,
    password_manager_enabled text,
    password_manager_explanation text,
    personnel_id text,
    screen_lock_explanation text,
    screen_lock_time text,
    serial_number text,
    source_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE vendor_document (
    id text,
    vendor_id text,
    created_at text,
    file_url text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_review_trust_service_category (
    id text,
    vendor_id text,
    vendor_review_id text,
    category text,
    PRIMARY KEY (id, vendor_id, vendor_review_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_review(vendor_id),
    FOREIGN KEY (vendor_review_id) REFERENCES vendor_review(id)
);

CREATE TABLE vendor_review_user_control (
    id text,
    vendor_id text,
    vendor_review_id text,
    in_place text,
    "name" text,
    PRIMARY KEY (id, vendor_id, vendor_review_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_review(vendor_id),
    FOREIGN KEY (vendor_review_id) REFERENCES vendor_review(id)
);

CREATE TABLE vendor_review_service (
    id text,
    vendor_id text,
    vendor_review_id text,
    "name" text,
    PRIMARY KEY (id, vendor_id, vendor_review_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_review(vendor_id),
    FOREIGN KEY (vendor_review_id) REFERENCES vendor_review(id)
);

CREATE TABLE vendor_review_location (
    id text,
    vendor_id text,
    vendor_review_id text,
    city text,
    state_country text,
    PRIMARY KEY (id, vendor_id, vendor_review_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_review(vendor_id),
    FOREIGN KEY (vendor_review_id) REFERENCES vendor_review(id)
);

CREATE TABLE vendor_review_finding (
    id text,
    vendor_id text,
    vendor_review_id text,
    description text,
    PRIMARY KEY (id, vendor_id, vendor_review_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_review(vendor_id),
    FOREIGN KEY (vendor_review_id) REFERENCES vendor_review(id)
);

CREATE TABLE vendor_review (
    id text,
    vendor_id text,
    cpa_firm text,
    cpa_procedure_performed text,
    encompass_business_need text,
    follow_up_activity text,
    has_material_impact text,
    report_issue_date text,
    report_opinion text,
    review_date text,
    reviewer text,
    soc_report text,
    soc_report_type_1 text,
    soc_report_type_2 text,
    soc_type_1_end_date text,
    soc_type_1_start_date text,
    soc_type_2_end_date text,
    soc_type_2_start_date text,
    subservice_organization text,
    subservice_organization_procedure_performed text,
    subservice_organization_using_inclusive_method text,
    updated_at text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    user_id text,
    account_manager_email text,
    account_manager_name text,
    archived_at text,
    category text,
    confirmed_at text,
    created_at text,
    critical text,
    data_stored text,
    has_pii text,
    is_compliance_review_required text,
    is_sub_processor text,
    is_sub_processor_active text,
    last_questionnaire text,
    location text,
    logo_url text,
    "name" text,
    note text,
    password_mfa_enabled text,
    password_min_length text,
    password_policy text,
    password_requires_min_length text,
    password_requires_number text,
    password_requires_symbol text,
    privacy_url text,
    renewal_date text,
    renewal_date_status text,
    renewal_schedule_type text,
    risk text,
    services_provided text,
    terms_url text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE control_mapped_requirement (
    id text,
    control_id text,
    additional_info text,
    additional_info_2 text,
    additional_info_3 text,
    archived_at text,
    description text,
    framework_name text,
    framework_pill text,
    framework_slug text,
    framework_tag text,
    long_description text,
    "name" text,
    rationale text,
    PRIMARY KEY (id, control_id),
    FOREIGN KEY (control_id) REFERENCES control(id)
);

CREATE TABLE trustcenter_private_access (
    _fivetran_id text,
    created_at text,
    deleted_at text,
    flow_type text,
    id text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE venodr_questionnaire (
    id text,
    vendor_id text,
    completed_by text,
    date_sent text,
    is_completed text,
    is_manual_upload text,
    recipient_email text,
    response_id text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id),
    FOREIGN KEY (completed_by) REFERENCES users(id)
);

CREATE TABLE control (
    id text,
    archived_at text,
    code text,
    description text,
    framework_tag jsonb,
    has_evidence text,
    has_owner text,
    has_ticket text,
    is_monitored text,
    is_ready text,
    "name" text,
    slug text,
    topic jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE monitor_control (
    id text,
    monitor_id text,
    activity text,
    archived_at text,
    code text,
    description text,
    "name" text,
    question text,
    slug text,
    PRIMARY KEY (id, monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id)
);

CREATE TABLE monitor_instance_check_type (
    id text,
    monitor_id text,
    check_type text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id, monitor_id),
    FOREIGN KEY (id) REFERENCES monitor_instance(id),
    FOREIGN KEY (monitor_id) REFERENCES monitor_instance(monitor_id)
);

CREATE TABLE monitor_instance_metadata_exclusion (
    _fivetran_id text,
    monitor_instance_exclusion_id text,
    monitor_id text,
    monitor_instance_id text,
    PRIMARY KEY (_fivetran_id, monitor_instance_exclusion_id),
    FOREIGN KEY (_fivetran_id) REFERENCES monitor_instance_metadata(_fivetran_id),
    FOREIGN KEY (monitor_instance_exclusion_id) REFERENCES monitor_instance_exclusion(id),
    FOREIGN KEY (monitor_id) REFERENCES monitor_instance_metadata(monitor_id),
    FOREIGN KEY (monitor_instance_id) REFERENCES monitor_instance_metadata(monitor_instance_id)
);

CREATE TABLE monitor_instance_metadata (
    _fivetran_id text,
    monitor_id text,
    monitor_instance_id text,
    check_result_status text,
    client_alias text,
    client_id text,
    client_type text,
    connection_id text,
    groups jsonb,
    message text,
    policy_name text,
    policy_scope text,
    "source" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor_instance(monitor_id),
    FOREIGN KEY (monitor_instance_id) REFERENCES monitor_instance(id)
);

CREATE TABLE monitor_instance (
    id text,
    monitor_id text,
    autopilot_task_type text,
    check_frequency text,
    check_result_status text,
    created_at text,
    enabled text,
    evidence_collection_description text,
    failed_test_description text,
    remedy_description text,
    updated_at text,
    url text,
    PRIMARY KEY (id, monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id)
);

CREATE TABLE monitor_instance_exclusion (
    id text,
    monitor_id text,
    connection_id text,
    exclusion_designator_id text,
    created_at text,
    exclusion_reason text,
    target_id text,
    target_name text,
    updated_at text,
    PRIMARY KEY (id, monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (exclusion_designator_id) REFERENCES users(id)
);

CREATE TABLE monitor (
    id text,
    disabling_user_id text,
    auto_enabled_at text,
    check_result_status text,
    check_status text,
    created_at text,
    description text,
    disabled_message text,
    disabling_user text,
    graph jsonb,
    last_check text,
    "name" text,
    priority text,
    test_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (disabling_user_id) REFERENCES users(id)
);

CREATE TABLE monitor_instance_metadata_pass_fail (
    "index" text,
    _fivetran_id text,
    monitor_id text,
    monitor_instance_id text,
    avatar_url text,
    display_name text,
    email text,
    id text,
    "name" text,
    "type" text,
    url text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES monitor_instance_metadata(_fivetran_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor_instance_metadata(monitor_id),
    FOREIGN KEY (monitor_instance_id) REFERENCES monitor_instance_metadata(monitor_instance_id)
);

CREATE TABLE personnel_compliance_test (
    monitor_id text,
    personnel_id text,
    autopilot_task_type text,
    check_result_status text,
    check_status text,
    control_test_instance_id text,
    last_check text,
    "name" text,
    test_id text,
    PRIMARY KEY (monitor_id, personnel_id),
    FOREIGN KEY (monitor_id) REFERENCES monitor(id),
    FOREIGN KEY (personnel_id) REFERENCES personnel(id)
);

CREATE TABLE personnel_compliance_check (
    id text,
    personnel_id text,
    check_frequency text,
    compliant text,
    created_at text,
    expires_at text,
    last_checked_at text,
    types text,
    updated_at text,
    PRIMARY KEY (id, personnel_id),
    FOREIGN KEY (personnel_id) REFERENCES personnel(id)
);

CREATE TABLE personnel_device (
    id text,
    personnel_id text,
    PRIMARY KEY (id, personnel_id),
    FOREIGN KEY (id) REFERENCES device(id),
    FOREIGN KEY (personnel_id) REFERENCES personnel(id)
);

CREATE TABLE personnel (
    id text,
    reason_provider_id text,
    user_id text,
    agent_enabled text,
    apps_count text,
    apps_count_last_checked_at text,
    background_check_excluded text,
    background_check_excluded_reason text,
    created_at text,
    data_agent_version text,
    data_created_at text,
    data_graphics text,
    data_hdd_size text,
    data_lastchecked_at text,
    data_mac_address text,
    data_memory text,
    data_os_version text,
    data_processor text,
    data_screen_lock_time text,
    data_serial_number text,
    data_updated_at text,
    devices_count text,
    devices_failing_compliance_count text,
    employment_status text,
    manual_upload_enabled text,
    not_human_reason text,
    os_version text,
    separation_date text,
    serial_number text,
    start_date text,
    status_updated_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (reason_provider_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE trustcenter_private_document (
    id text,
    "type" text,
    created_at text,
    "name" text,
    PRIMARY KEY (id, "type")
);

CREATE TABLE asset_class_type (
    id text,
    asset_id text,
    asset_class_type text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset (
    id text,
    device_id text,
    owner_id text,
    approved_at text,
    asset_provider text,
    asset_reference_type text,
    asset_type text,
    company text,
    created_at timestamp,
    description text,
    employment_status text,
    external_id text,
    external_owner_id text,
    "name" text,
    note text,
    removed_at text,
    unique_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);
