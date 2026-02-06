CREATE TABLE directory_role_member (
    directory_role_id text,
    user_id text,
    PRIMARY KEY (directory_role_id, user_id),
    FOREIGN KEY (directory_role_id) REFERENCES directory_role(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE channel (
    id text,
    team_id text,
    created_date_time text,
    description text,
    display_name text,
    membership_type text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE directory_audit_target_resource_modified_property (
    "index" text,
    directory_audit_id text,
    directory_audit_target_resource_id text,
    display_name text,
    new_value text,
    old_value text,
    PRIMARY KEY ("index", directory_audit_id, directory_audit_target_resource_id),
    FOREIGN KEY (directory_audit_id) REFERENCES directory_audit_target_resource(directory_audit_id),
    FOREIGN KEY (directory_audit_target_resource_id) REFERENCES directory_audit_target_resource(id)
);

CREATE TABLE directory_audit_target_resource (
    id text,
    directory_audit_id text,
    display_name text,
    group_type text,
    "type" text,
    user_principal_name text,
    PRIMARY KEY (id, directory_audit_id),
    FOREIGN KEY (directory_audit_id) REFERENCES directory_audit(id)
);

CREATE TABLE directory_audit (
    id text,
    initiated_by_user_id text,
    activity_date_time text,
    activity_display_name text,
    category text,
    correlation_id text,
    initiated_by_app text,
    logged_by_service text,
    "result" text,
    result_reason text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (initiated_by_user_id) REFERENCES users(id)
);

CREATE TABLE group_owner (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE sign_in_applied_conditional_access_policy (
    id text,
    sign_in_id text,
    display_name text,
    enforced_grant_control jsonb,
    enforced_session_control jsonb,
    "result" text,
    PRIMARY KEY (id, sign_in_id),
    FOREIGN KEY (sign_in_id) REFERENCES sign_in(id)
);

CREATE TABLE sign_in (
    id text,
    user_id text,
    app_display_name text,
    app_id text,
    client_app_used text,
    conditional_access_status text,
    correlation_id text,
    created_date_time text,
    geo_coordinate_altitude text,
    geo_coordinate_latitude text,
    geo_coordinate_longitude text,
    ip_address text,
    is_interactive text,
    resource_display_name text,
    resource_id text,
    risk_detail text,
    risk_event_type jsonb,
    risk_level_aggregated text,
    risk_level_during_sign_in text,
    risk_state text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_registration_detail (
    user_id text,
    is_admin text,
    is_mfa_capable text,
    is_mfa_registered text,
    is_passwordless_capable text,
    is_sspr_enabled text,
    is_sspr_registered text,
    is_system_preferred_authentication_enabled text,
    last_updated_date_time text,
    methods_registered jsonb,
    system_preferred_authentication_methods jsonb,
    user_preferred_secondary_authentication_method text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE manager (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_member_role (
    "index" text,
    team_member_id text,
    "role" text,
    PRIMARY KEY ("index", team_member_id),
    FOREIGN KEY (team_member_id) REFERENCES team_member(id)
);

CREATE TABLE team_member (
    id text,
    team_id text,
    user_id text,
    display_name text,
    email text,
    odata_type text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE group_proxy_address (
    "index" text,
    group_id text,
    proxy_address text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_type (
    "index" text,
    group_id text,
    group_type text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_resource_provisioning_option (
    "index" text,
    group_id text,
    resource_provisioning_option text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_resource_behaviour_option (
    "index" text,
    group_id text,
    resource_behaviour_option text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_on_premise_provisioning_error (
    "index" text,
    group_id text,
    on_premises_provisioning_errors text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_creation_option (
    "index" text,
    group_id text,
    creation_option text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    allow_external_senders text,
    assigned_labels text,
    assigned_licenses text,
    auto_subscribe_new_members text,
    classification text,
    created_date_time text,
    deleted_date_time text,
    description text,
    display_name text,
    expiration_date_time text,
    hide_from_address_lists text,
    hide_from_outlook_clients text,
    is_archived text,
    is_assignable_to_role text,
    is_subscribed_by_mail text,
    license_processing_state text,
    mail text,
    mail_enabled text,
    mail_nickname text,
    membership_rule text,
    membership_rule_processing_state text,
    on_premises_domain_name text,
    on_premises_last_sync_date_time text,
    on_premises_net_bios_name text,
    on_premises_sam_account_name text,
    on_premises_security_identifier text,
    on_premises_sync_enabled text,
    preferred_data_location text,
    preferred_language text,
    renewed_date_time text,
    security_enabled text,
    security_identifier text,
    service_provisioning_error text,
    theme text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE team (
    id text,
    description text,
    display_name text,
    PRIMARY KEY (id)
);

CREATE TABLE user_provisioned_plan (
    "index" text,
    user_id text,
    capability_status text,
    provisioning_status text,
    service text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_assigned_license (
    id text,
    user_id text,
    disabled_plan jsonb,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_assigned_plan (
    id text,
    user_id text,
    assigned_date_time text,
    capability_status text,
    service text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_identity (
    "index" text,
    user_id text,
    id text,
    issuer text,
    sign_in_type text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_license_assignment_state (
    id text,
    user_id text,
    assigned_by_group text,
    disabled_plan jsonb,
    error text,
    last_updated_date_time text,
    "state" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES license(sku_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE on_premise_attribute_custom (
    "name" text,
    user_id text,
    "value" text,
    PRIMARY KEY ("name", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    about_me text,
    account_enabled text,
    age_group text,
    birthday text,
    business_phones text,
    city text,
    company_name text,
    consent_provided_for_minor text,
    country text,
    created_date_time timestamp,
    creation_type text,
    deleted_date_time text,
    department text,
    display_name text,
    employee_hire_date text,
    employee_id text,
    employee_leave_date_time text,
    employee_org_data text,
    employee_type text,
    external_user_state text,
    external_user_state_change_date_time text,
    fax_number text,
    given_name text,
    hire_date text,
    im_addresses text,
    interests text,
    is_resource_account text,
    job_title text,
    last_password_change_date_time text,
    legal_age_group_classification text,
    mail text,
    mail_nick_name text,
    mobile_phone text,
    my_site text,
    office_location text,
    on_premises_distinguished_name text,
    on_premises_domain_name text,
    on_premises_immutable_id text,
    on_premises_last_sync_date_time text,
    on_premises_provisioning_errors text,
    on_premises_sam_account_name text,
    on_premises_security_identifier text,
    on_premises_sync_enabled text,
    on_premises_user_principal_name text,
    other_mails jsonb,
    password_policies text,
    past_projects text,
    postal_code text,
    preferred_data_location text,
    preferred_language text,
    preferred_name text,
    profile_force_change_password_next_sign_in text,
    profile_force_change_password_next_sign_in_with_mfa text,
    profile_password text,
    proxy_addresses jsonb,
    refresh_tokens_valid_from_date_time text,
    responsibilities text,
    schools text,
    show_in_address_list text,
    sign_in_sessions_valid_from_date_time text,
    skills text,
    "state" text,
    street_address text,
    surname text,
    usage_location text,
    user_principal_name text,
    user_type text,
    PRIMARY KEY (id)
);

CREATE TABLE license_service_plan (
    id text,
    license_id text,
    applies_to text,
    provisioning_status text,
    service_plan_name text,
    PRIMARY KEY (id, license_id),
    FOREIGN KEY (license_id) REFERENCES license(id)
);

CREATE TABLE license (
    id text,
    user_id text,
    sku_id text,
    sku_part_number text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE directory_role (
    id text,
    deleted_date_time text,
    description text,
    display_name text,
    role_template_id text,
    PRIMARY KEY (id)
);

CREATE TABLE group_member (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
