CREATE TABLE lambda_vpc_security_group (
    security_group_id text,
    function_arn text,
    PRIMARY KEY (security_group_id, function_arn),
    FOREIGN KEY (function_arn) REFERENCES lambda_function(arn)
);

CREATE TABLE account_password_policy (
    account_id text,
    allow_users_to_change_password boolean,
    expire_passwords boolean,
    hard_expiry boolean,
    max_password_age integer,
    minimum_password_length integer,
    password_reuse_prevention integer,
    require_lowercase_characters boolean,
    require_numbers boolean,
    require_symbols boolean,
    require_uppercase_characters boolean,
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES account_summary(account_id)
);

CREATE TABLE vpc (
    id text,
    cidr_block text,
    cidr_block_association_set jsonb,
    dhcp_options_id text,
    instance_tenancy text,
    ipv_6_cidr_block_association_set jsonb,
    is_default boolean,
    "state" text,
    tags jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE account_virtual_mfa_device (
    serial_number text,
    base_32_string_seed jsonb,
    enable_date text,
    q_rcode_png jsonb,
    "user" jsonb,
    PRIMARY KEY (serial_number)
);

CREATE TABLE iam_user (
    id text,
    arn text,
    create_date timestamp,
    "path" text,
    user_name text,
    PRIMARY KEY (id)
);

CREATE TABLE iam_inline_user_policy (
    policy_name text,
    user_id text,
    PRIMARY KEY (policy_name, user_id),
    FOREIGN KEY (policy_name) REFERENCES iam_policy(policy_id),
    FOREIGN KEY (user_id) REFERENCES iam_user(id)
);

CREATE TABLE route_53_hosted_zone (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE config_event (
    _file text,
    _line bigint,
    _modified timestamp,
    "index" bigint,
    arn text,
    availability_zone text,
    aws_account_id text,
    aws_region text,
    configuration jsonb,
    configuration_item_capture_time timestamp,
    configuration_item_status text,
    configuration_item_version text,
    configuration_state_id bigint,
    configuration_state_md_5_hash text,
    hash_raw bigint,
    raw jsonb,
    related_events jsonb,
    relationships jsonb,
    resource_creation_time timestamp,
    resource_id text,
    resource_name text,
    resource_type text,
    supplementary_configuration jsonb,
    tags jsonb,
    PRIMARY KEY (_file, _line, _modified, "index")
);

CREATE TABLE lambda_function (
    arn text,
    vpc_config_id text,
    code_sha_256 text,
    code_size bigint,
    dead_letter_config_target_arn text,
    description text,
    destination_config_on_failure_destination text,
    destination_config_on_success_destination text,
    event_invoke_config_max_event_age_in_seconds integer,
    event_invoke_config_max_retry_attempt integer,
    function_name text,
    handler text,
    kms_key_arn text,
    last_modified text,
    last_update_status text,
    last_update_status_reason text,
    last_update_status_reason_code text,
    master_arn text,
    memory_size integer,
    package_type text,
    policy text,
    policy_revision_id text,
    revision_id text,
    "role" text,
    runtime text,
    signing_job_arn text,
    signing_profile_version_arn text,
    "state" text,
    state_reason text,
    state_reason_code text,
    timeout integer,
    tracing_config_response_mode text,
    version text,
    PRIMARY KEY (arn),
    FOREIGN KEY (vpc_config_id) REFERENCES vpc(id)
);

CREATE TABLE lambda_vpc_subnet (
    subnet_id text,
    function_arn text,
    PRIMARY KEY (subnet_id, function_arn),
    FOREIGN KEY (function_arn) REFERENCES lambda_function(arn)
);

CREATE TABLE account_summary (
    account_id text,
    PRIMARY KEY (account_id)
);

CREATE TABLE iam_policy_role (
    role_id text,
    policy_arn text,
    role_name text,
    PRIMARY KEY (role_id, policy_arn),
    FOREIGN KEY (policy_arn) REFERENCES iam_policy(policy_id)
);

CREATE TABLE iam_policy_version (
    version_id text,
    policy_arn text,
    create_date timestamp,
    document text,
    is_default_version boolean,
    PRIMARY KEY (version_id, policy_arn),
    FOREIGN KEY (policy_arn) REFERENCES iam_policy(policy_id)
);

CREATE TABLE cloud_trail (
    "name" text,
    kms_key_id text,
    s_3_bucket_name text,
    cloud_watch_logs_log_group_arn text,
    cloud_watch_logs_role_arn text,
    has_custom_event_selectors boolean,
    has_insight_selectors boolean,
    home_region text,
    include_global_service_events boolean,
    is_multi_region_trail boolean,
    is_organization_trail boolean,
    log_file_validation_enabled boolean,
    s_3_key_prefix text,
    sns_topic_arn text,
    trail_arn text,
    PRIMARY KEY ("name"),
    FOREIGN KEY (kms_key_id) REFERENCES kms_key(key_id),
    FOREIGN KEY (s_3_bucket_name) REFERENCES s_3_bucket("name")
);

CREATE TABLE iam_user_access_key (
    access_key_id text,
    user_id text,
    create_date timestamp,
    "status" text,
    PRIMARY KEY (access_key_id, user_id),
    FOREIGN KEY (user_id) REFERENCES iam_user(id)
);

CREATE TABLE load_balancer_security_group (
    load_balancer_arn text,
    security_group_id text,
    PRIMARY KEY (load_balancer_arn, security_group_id),
    FOREIGN KEY (load_balancer_arn) REFERENCES load_balancer(arn),
    FOREIGN KEY (security_group_id) REFERENCES security_group(id)
);

CREATE TABLE load_balancer (
    arn text,
    vpc_id text,
    canonical_hosted_zone_id text,
    created_time timestamp,
    d_nsname text,
    ip_address_type text,
    load_balancer_name text,
    "schema" text,
    state_code text,
    state_reason text,
    "type" text,
    PRIMARY KEY (arn),
    FOREIGN KEY (vpc_id) REFERENCES vpc(id)
);

CREATE TABLE lambda_layer (
    arn text,
    function_arn text,
    code_size bigint,
    signing_job_arn text,
    signing_profile_version_arn text,
    PRIMARY KEY (arn, function_arn),
    FOREIGN KEY (function_arn) REFERENCES lambda_function(arn)
);

CREATE TABLE kms_key (
    key_id text,
    key_arn text,
    key_rotation_enabled boolean,
    PRIMARY KEY (key_id)
);

CREATE TABLE s_3_bucket_acl (
    grantee text,
    bucket_name text,
    permission text,
    PRIMARY KEY (grantee, bucket_name),
    FOREIGN KEY (bucket_name) REFERENCES s_3_bucket("name")
);

CREATE TABLE config_recorder (
    "name" text,
    recording_group jsonb,
    role_arn text,
    PRIMARY KEY ("name")
);

CREATE TABLE iam_managed_user_policy (
    policy_name text,
    user_id text,
    policy_arn text,
    PRIMARY KEY (policy_name, user_id),
    FOREIGN KEY (policy_name) REFERENCES iam_policy(policy_id),
    FOREIGN KEY (user_id) REFERENCES iam_user(id)
);

CREATE TABLE security_group_tag (
    "key" text,
    group_id text,
    "value" text,
    PRIMARY KEY ("key", group_id),
    FOREIGN KEY (group_id) REFERENCES security_group(id)
);

CREATE TABLE cloud_trail_status (
    trail_name text,
    is_logging boolean,
    latest_cloud_watch_logs_delivery_error text,
    latest_cloud_watch_logs_delivery_time timestamp,
    latest_delivery_attempt_succeeded text,
    latest_delivery_attempt_time timestamp,
    latest_delivery_error text,
    latest_delivery_time timestamp,
    latest_digest_delivery_error text,
    latest_digest_delivery_time timestamp,
    latest_notification_attempt_succeeded text,
    latest_notification_attempt_time timestamp,
    latest_notification_error text,
    latest_notification_time timestamp,
    start_logging_time timestamp,
    stop_logging_time timestamp,
    time_logging_started text,
    time_logging_stopped text,
    PRIMARY KEY (trail_name),
    FOREIGN KEY (trail_name) REFERENCES cloud_trail("name")
);

CREATE TABLE security_group (
    id text,
    vpc_id text,
    description text,
    group_name text,
    ip_permissions jsonb,
    ip_permissions_egress jsonb,
    owner_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (vpc_id) REFERENCES vpc(id)
);

CREATE TABLE iam_policy (
    policy_id text,
    arn text,
    attachment_count integer,
    create_date timestamp,
    default_version_id text,
    description text,
    is_attachable boolean,
    "path" text,
    permissions_boundary_usage_count integer,
    policy_name text,
    update_date timestamp,
    PRIMARY KEY (policy_id)
);

CREATE TABLE instance (
    id text,
    iam_instance_profile_id text,
    image_id text,
    vpc_id text,
    ami_launch_index text,
    architecture text,
    client_token text,
    cpu_option_core_count integer,
    cpu_option_threads_per_core integer,
    ebs_optimized boolean,
    ena_support boolean,
    hypervisor text,
    iam_instance_profile_arn text,
    instance_lifecycle text,
    instance_type text,
    kernel_id text,
    key_name text,
    launch_time text,
    monitoring_state text,
    platform text,
    private_dns_name text,
    private_ip_address text,
    public_dns_name text,
    public_ip_address text,
    ramdisk_id text,
    root_device_name text,
    root_device_type text,
    source_dest_check boolean,
    spot_instance_request_id text,
    sriov_net_support text,
    state_code integer,
    state_name text,
    state_reason_code text,
    state_reason_message text,
    state_transition_reason text,
    subnet_id text,
    virtualization_type text,
    -- placement_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (iam_instance_profile_id) REFERENCES iam_user(id),
    FOREIGN KEY (image_id) REFERENCES image(id),
    FOREIGN KEY (vpc_id) REFERENCES vpc(id)
);

CREATE TABLE account_credential_report (
    account_id text,
    description text,
    "state" text,
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES account_summary(account_id)
);

CREATE TABLE image (
    id text,
    architecture text,
    description text,
    hypervisor text,
    image_location text,
    image_owner_alias text,
    image_owner_id text,
    image_state text,
    image_type text,
    is_public boolean,
    kernel_id text,
    "name" text,
    root_device_name text,
    root_device_type text,
    virtualization_type text,
    PRIMARY KEY (id)
);

CREATE TABLE iam_user_mfa_device (
    serial_number text,
    user_id text,
    enable_date timestamp,
    PRIMARY KEY (serial_number, user_id),
    FOREIGN KEY (serial_number) REFERENCES account_virtual_mfa_device(serial_number),
    FOREIGN KEY (user_id) REFERENCES iam_user(id)
);

CREATE TABLE s_3_bucket (
    "name" text,
    owner_id text,
    creation_date timestamp,
    log_file_prefix text,
    logging_destination_bucket_name text,
    owner_display_name text,
    policy_text text,
    PRIMARY KEY ("name"),
    FOREIGN KEY (owner_id) REFERENCES iam_user(id)
);

CREATE TABLE iam_policy_group (
    group_id text,
    policy_arn text,
    group_name text,
    PRIMARY KEY (group_id, policy_arn),
    FOREIGN KEY (policy_arn) REFERENCES iam_policy(policy_id)
);

CREATE TABLE cloud_trail_event_selector (
    "index" integer,
    trail_name text,
    data_resources jsonb,
    exclude_management_event_sources jsonb,
    include_management_events boolean,
    read_write_type text,
    PRIMARY KEY ("index", trail_name),
    FOREIGN KEY (trail_name) REFERENCES cloud_trail("name")
);

CREATE TABLE route_53_resource_record_set (
    "name" text,
    "type" text,
    hosted_zone_id text,
    PRIMARY KEY ("name", "type", hosted_zone_id),
    FOREIGN KEY (hosted_zone_id) REFERENCES route_53_hosted_zone(id)
);

CREATE TABLE iam_user_group (
    group_id text,
    user_id text,
    arn text,
    create_date timestamp,
    group_name text,
    "path" text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (user_id) REFERENCES iam_user(id)
);

CREATE TABLE account_alias (
    alias_name text,
    account_id text,
    PRIMARY KEY (alias_name, account_id),
    FOREIGN KEY (account_id) REFERENCES account_summary(account_id)
);

CREATE TABLE iam_user_login_profile (
    user_id text,
    create_date timestamp,
    password_reset_required boolean,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES iam_user(id)
);
