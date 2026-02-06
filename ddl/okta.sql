CREATE TABLE custom_role (
    id text,
    created timestamp,
    description text,
    label text,
    last_updated text,
    PRIMARY KEY (id)
);

CREATE TABLE policy (
    id text,
    _links_self_hints_allow jsonb,
    _links_self_href text,
    conditions jsonb,
    created timestamp,
    description text,
    is_system boolean,
    last_updated timestamp,
    "name" text,
    priority integer,
    settings jsonb,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_type (
    id text,
    _links_schema_href text,
    _links_schema_method text,
    _links_schema_rel text,
    _links_self_href text,
    _links_self_method text,
    _links_self_rel text,
    created timestamp,
    created_by text,
    "default" boolean,
    description text,
    display_name text,
    last_updated timestamp,
    last_updated_by text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_enrolled_factor (
    id text,
    user_id text,
    created timestamp,
    embedded jsonb,
    factor_type text,
    last_updated timestamp,
    profile jsonb,
    provider text,
    "status" text,
    vendor_name text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE custom_role_permission (
    label text,
    custom_role_id text,
    _links_role_href text,
    _links_self_href text,
    created timestamp,
    last_updated timestamp,
    PRIMARY KEY (label, custom_role_id),
    FOREIGN KEY (custom_role_id) REFERENCES custom_role(id)
);

CREATE TABLE device_user (
    device_id text,
    users_id text,
    created timestamp,
    management_status text,
    PRIMARY KEY (device_id, users_id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE resource (
    _fivetran_id text,
    resource_set_id text,
    _links_groups_href text,
    _links_self_href text,
    _links_users_href text,
    created timestamp,
    id text,
    last_updated timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (resource_set_id) REFERENCES resource_set(id)
);

CREATE TABLE profile_mapping_property (
    "index" text,
    profile_mapping_id text,
    expression text,
    push_status text,
    PRIMARY KEY ("index", profile_mapping_id),
    FOREIGN KEY (profile_mapping_id) REFERENCES profile_mapping(id)
);

CREATE TABLE profile_mapping (
    id text,
    _links_self_hints_allow jsonb,
    _links_self_href text,
    source_id text,
    source_name text,
    source_type text,
    target_id text,
    target_name text,
    target_type text,
    PRIMARY KEY (id)
);

CREATE TABLE resource_set (
    id text,
    _links_bindings_href text,
    _links_resources_href text,
    _links_self_href text,
    created timestamp,
    description text,
    label text,
    last_updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE user_credentials_email (
    "value" text,
    users_id text,
    "status" text,
    "type" text,
    PRIMARY KEY ("value", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_custom_profile (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    type_id text,
    _links_self_href text,
    activated timestamp,
    created timestamp,
    credentials_password_hash_value text,
    credentials_provider_name text,
    credentials_provider_type text,
    credentials_recovery_question text,
    last_login timestamp,
    last_updated timestamp,
    password_changed timestamp,
    profile_city text,
    profile_cost_center text,
    profile_country_code text,
    profile_department text,
    profile_display_name text,
    profile_division text,
    profile_email text,
    profile_employee_number text,
    profile_first_name text,
    profile_honorific_prefix text,
    profile_honorific_suffix text,
    profile_key_gr_person text,
    profile_key_guid text,
    profile_last_name text,
    profile_local text,
    profile_login text,
    profile_manager text,
    profile_manager_id text,
    profile_middle_name text,
    profile_mobile_phone text,
    profile_nick_name text,
    profile_organization text,
    profile_postal_address text,
    profile_preferred_language text,
    profile_primary_phone text,
    profile_second_email text,
    profile_state text,
    profile_street_address text,
    profile_timezone text,
    profile_title text,
    profile_url text,
    profile_user_type text,
    profile_zip_code text,
    "status" text,
    status_changed timestamp,
    transitioning_to_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES user_type(id)
);

CREATE TABLE api_token_metadata (
    id text,
    user_id text,
    client_name text,
    created text,
    expires_at text,
    last_updated text,
    "name" text,
    network_connection text,
    token_window text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE device (
    id text,
    _links_activate_hints_allow jsonb,
    _links_activate_href text,
    _links_deactivate_hints_allow jsonb,
    _links_deactivate_href text,
    _links_self_hints_allow jsonb,
    _links_self_href text,
    _links_suspend_hints_allow jsonb,
    _links_suspend_href text,
    _links_unsuspend_hints_allow jsonb,
    _links_unsuspend_href text,
    _links_users_hints_allow jsonb,
    _links_users_href text,
    created timestamp,
    last_updated timestamp,
    profile_display_name text,
    profile_imei text,
    profile_manufacturer text,
    profile_meid text,
    profile_model text,
    profile_os_version text,
    profile_platform text,
    profile_registered boolean,
    profile_secure_hardware_present boolean,
    profile_serial_number text,
    profile_sid text,
    profile_tpm_public_key_hash text,
    profile_udid text,
    resource_alternate_id text,
    resource_display_name_sensitive boolean,
    resource_display_name_value text,
    resource_id text,
    resource_type text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE network_zone_gateway (
    "value" text,
    network_zone_id text,
    "type" text,
    PRIMARY KEY ("value", network_zone_id),
    FOREIGN KEY (network_zone_id) REFERENCES network_zone(id)
);

CREATE TABLE network_zone_proxy (
    "value" text,
    network_zone_id text,
    "type" text,
    PRIMARY KEY ("value", network_zone_id),
    FOREIGN KEY (network_zone_id) REFERENCES network_zone(id)
);

CREATE TABLE network_zone (
    id text,
    created text,
    last_updated text,
    "name" text,
    "status" text,
    systems text,
    "type" text,
    usage text,
    PRIMARY KEY (id)
);

CREATE TABLE group_role (
    id text,
    groups_id text,
    custom_role_id text,
    resource_set_id text,
    _links_assignee_href text,
    _links_member_href text,
    _links_permissions_href text,
    _links_resource_set_href text,
    _links_role_href text,
    assignment_type text,
    created timestamp,
    label text,
    last_updated timestamp,
    "status" text,
    "type" text,
    PRIMARY KEY (id, groups_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (custom_role_id) REFERENCES custom_role(id),
    FOREIGN KEY (resource_set_id) REFERENCES resource_set(id)
);

CREATE TABLE assign_user_to_group_id (
    groups_id text,
    rule_id text,
    PRIMARY KEY (groups_id, rule_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE user_excluded_from_rule (
    rule_id text,
    users_id text,
    PRIMARY KEY (rule_id, users_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE group_excluded_from_rule (
    groups_id text,
    rule_id text,
    PRIMARY KEY (groups_id, rule_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE rule (
    id text,
    all_groups_valid boolean,
    conditions_expression_type text,
    conditions_expression_value text,
    created timestamp,
    last_updated timestamp,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_role (
    id text,
    users_id text,
    custom_role_id text,
    resource_set_id text,
    _links_assignee_href text,
    _links_member_href text,
    _links_permissions_href text,
    _links_resource_set_href text,
    _links_role_href text,
    assignment_type text,
    created timestamp,
    label text,
    last_updated timestamp,
    "status" text,
    "type" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (custom_role_id) REFERENCES custom_role(id),
    FOREIGN KEY (resource_set_id) REFERENCES resource_set(id)
);

CREATE TABLE application_user (
    application_id text,
    user_id text,
    _links_app_href text,
    _links_self_href text,
    _links_user_href text,
    created timestamp,
    credentials_user_name text,
    external_id text,
    last_sync timestamp,
    last_updated timestamp,
    password_changed timestamp,
    scope text,
    "status" text,
    status_changed timestamp,
    sync_state text,
    PRIMARY KEY (application_id, user_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE system_log_target (
    id text,
    system_log_id text,
    alternate_id text,
    detail_entry jsonb,
    display_name text,
    "type" text,
    PRIMARY KEY (id, system_log_id),
    FOREIGN KEY (system_log_id) REFERENCES system_log(id)
);

CREATE TABLE system_log_request (
    _fivetran_id text,
    system_log_id text,
    geographical_context text,
    ip text,
    "source" text,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (system_log_id) REFERENCES system_log(id)
);

CREATE TABLE system_log (
    id text,
    actor_alternate_id text,
    actor_detail_entry text,
    actor_display_name text,
    actor_id text,
    actor_type text,
    authentication_context_authentication_provider text,
    authentication_context_authentication_step text,
    authentication_context_credential_provider text,
    authentication_context_credential_type text,
    authentication_context_external_session_id text,
    authentication_context_interface text,
    authentication_context_issuer text,
    client_device text,
    client_geographical_context text,
    client_id text,
    client_ip_address text,
    client_user_agent_browser text,
    client_user_agent_os text,
    client_user_agent_raw_user_agent text,
    client_zone text,
    device text,
    display_message text,
    event_type text,
    legacy_event_type text,
    outcome_reason text,
    outcome_result text,
    published timestamp,
    security_context_as_number bigint,
    security_context_as_org text,
    security_context_domain text,
    security_context_is_proxy boolean,
    security_context_isp text,
    severity text,
    transaction_id text,
    transaction_type text,
    version text,
    -- debug_context_debug_data_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE group_logo_link (
    href text,
    groups_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (href, groups_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    _links_apps_href text,
    _links_self_href text,
    _links_source_href text,
    _links_users_href text,
    created timestamp,
    last_membership_updated timestamp,
    last_updated timestamp,
    object_class jsonb,
    profile_description text,
    profile_dn text,
    profile_external_id text,
    profile_name text,
    profile_sam_account_name text,
    profile_windows_domain_qualified_name text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_authenticator_enrollment (
    id text,
    user_id text,
    created timestamp,
    "key" text,
    last_updated timestamp,
    "name" text,
    nickname text,
    profile jsonb,
    "status" text,
    "type" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE application_group (
    application_id text,
    groups_id text,
    _links_app_href text,
    _links_group_href text,
    _links_self_href text,
    priority integer,
    PRIMARY KEY (application_id, groups_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (groups_id) REFERENCES groups(id)
);

CREATE TABLE identify_provider_protocol_scope (
    scope text,
    identity_provider_id text,
    PRIMARY KEY (scope, identity_provider_id),
    FOREIGN KEY (identity_provider_id) REFERENCES identity_provider(id)
);

CREATE TABLE identity_provider (
    id text,
    created text,
    issuer_mode text,
    last_updated text,
    "name" text,
    policy_account_link_action text,
    policy_account_link_filter text,
    policy_max_clock_skew text,
    policy_provisioning_action text,
    policy_provisioning_condition_deprovisioned_action text,
    policy_provisioning_condition_suspended_action text,
    policy_provisioning_group_action text,
    policy_provisioning_profile_master text,
    policy_subject_filter text,
    policy_subject_match_attribute text,
    policy_subject_match_type text,
    policy_subject_username_template text,
    protocol_endpoint_authorization_binding text,
    protocol_endpoint_authorization_url text,
    protocol_endpoint_jwks_url text,
    protocol_endpoint_token_url text,
    protocol_issuer_url text,
    protocol_token_endpoint_binding text,
    protocol_type text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE application_link (
    href text,
    application_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (href, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_logo_link (
    href text,
    application_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (href, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_client_credentials_link (
    href text,
    application_id text,
    "name" text,
    PRIMARY KEY (href, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_sign_on_attribute_statement (
    "name" text,
    application_id text,
    filter_type text,
    filter_value text,
    namespace text,
    "type" text,
    values jsonb,
    PRIMARY KEY ("name", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_sign_on_acs_endpoint (
    "index" integer,
    application_id text,
    url text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_sign_on_inline_hook (
    id text,
    application_id text,
    _links_self_hints_allow jsonb,
    _links_self_href text,
    PRIMARY KEY (id, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_feature (
    feature text,
    application_id text,
    PRIMARY KEY (feature, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE oauth_client_grant_type (
    grant_type text,
    application_id text,
    PRIMARY KEY (grant_type, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE oauth_client_response_type (
    response_type text,
    application_id text,
    PRIMARY KEY (response_type, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE oauth_client_redirect_uri (
    redirect_uri text,
    application_id text,
    PRIMARY KEY (redirect_uri, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE oauth_client_post_logout_redirect_uri (
    post_logout_redirect_uri text,
    application_id text,
    PRIMARY KEY (post_logout_redirect_uri, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application (
    id text,
    _links_access_policy_href text,
    _links_activate_href text,
    _links_deactivate_href text,
    _links_groups_href text,
    _links_help_href text,
    _links_help_type text,
    _links_metadata_href text,
    _links_metadata_type text,
    _links_policies_hints_allow jsonb,
    _links_policies_href text,
    _links_profile_enrollment text,
    _links_upload_logo_hints_allow jsonb,
    _links_upload_logo_href text,
    _links_users_href text,
    accessibility_error_redirect_url text,
    accessibility_login_redirect_url text,
    accessibility_self_service boolean,
    created timestamp,
    credentials_oauth_client_auto_key_rotation boolean,
    credentials_oauth_client_token_endpoint_auth_method text,
    credentials_reveal_password boolean,
    credentials_scheme text,
    credentials_signing_kid text,
    credentials_user_name text,
    credentials_user_name_template text,
    credentials_user_name_template_push_status text,
    credentials_user_name_template_type text,
    credentials_user_name_template_user_suffix text,
    label text,
    last_updated timestamp,
    "name" text,
    request_object_signing_alg text,
    settings_app jsonb,
    settings_notes_admin text,
    settings_notes_end_user text,
    settings_notifications_help_url text,
    settings_notifications_message text,
    settings_notifications_vpn_network_connection text,
    settings_notifications_vpn_network_include jsonb,
    settings_oauth_client_application_type text,
    settings_oauth_client_consent_method text,
    settings_oauth_client_idp_initiated_login_default_scope jsonb,
    settings_oauth_client_idp_initiated_login_mode text,
    settings_oauth_client_initiate_login_uri text,
    settings_oauth_client_issuer_mode text,
    settings_oauth_client_logo_uri text,
    settings_oauth_client_policy_uri text,
    settings_oauth_client_refresh_token_leeway integer,
    settings_oauth_client_refresh_token_rotation_type text,
    settings_oauth_client_tos_uri text,
    settings_oauth_client_uri text,
    settings_oauth_client_wildcard_redirect text,
    settings_sign_on_allow_multiple_acs_endpoints boolean,
    settings_sign_on_assertion_signed boolean,
    settings_sign_on_audience text,
    settings_sign_on_authn_context_class_ref text,
    settings_sign_on_default_relay_state text,
    settings_sign_on_destination text,
    settings_sign_on_digest_algorithm text,
    settings_sign_on_honor_force_authn boolean,
    settings_sign_on_idp_issuer text,
    settings_sign_on_login_url text,
    settings_sign_on_recipient text,
    settings_sign_on_redirect_url text,
    settings_sign_on_request_compressed boolean,
    settings_sign_on_response_signed boolean,
    settings_sign_on_signature_algorithm text,
    settings_sign_on_slo_enabled boolean,
    settings_sign_on_slo_logout_url text,
    settings_sign_on_slo_sp_issuer text,
    settings_sign_on_sp_certificate_x_5_c jsonb,
    settings_sign_on_sp_issuer text,
    settings_sign_on_sso_acs_url text,
    settings_sign_on_subject_name_id_format text,
    settings_sign_on_subject_name_id_template text,
    sign_on_mode text,
    "status" text,
    visibility_app_links jsonb,
    visibility_auto_launch boolean,
    visibility_auto_submit_toolbar boolean,
    visibility_hide_ios boolean,
    visibility_hide_web boolean,
    PRIMARY KEY (id)
);

CREATE TABLE group_member (
    groups_id text,
    users_id text,
    PRIMARY KEY (groups_id, users_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE policy_rule_condition_excluded_user (
    policy_rule_id text,
    user_id text,
    PRIMARY KEY (policy_rule_id, user_id),
    FOREIGN KEY (policy_rule_id) REFERENCES policy_rule(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE policy_rule (
    id text,
    policy_id text,
    authtype_condition text,
    created text,
    last_updated text,
    "name" text,
    network_connection_condition text,
    priority text,
    signon_access text,
    signon_primary_factor text,
    signon_remember_device_by_default text,
    signon_require_factor text,
    signon_session_max_session_idle_minute text,
    signon_session_max_session_lifetime_minute text,
    signon_session_use_persistent_cookie text,
    "status" text,
    systems text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (policy_id) REFERENCES policy(id)
);
