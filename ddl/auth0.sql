CREATE TABLE "role" (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE resource_server_scopes (
    _fivetran_id text,
    resource_server_id text,
    description text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (resource_server_id) REFERENCES resource_server(id)
);

CREATE TABLE resource_server (
    id text,
    allow_offline_access text,
    client jsonb,
    enforce_policies text,
    identifier text,
    is_system text,
    "name" text,
    signing_alg text,
    signing_secret text,
    skip_consent_for_verifiable_first_party_clients text,
    token_dialect text,
    token_lifetime text,
    token_lifetime_for_web text,
    PRIMARY KEY (id)
);

CREATE TABLE stats_daily (
    "date" text,
    created_at text,
    leaked_passwords text,
    leaked_passwords_reset text,
    leaked_passwords_signup text,
    logins text,
    signups text,
    updated_at text,
    PRIMARY KEY ("date")
);

CREATE TABLE action_trigger_runtime (
    runtime text,
    action_trigger_id text,
    action_trigger_version text,
    PRIMARY KEY (runtime, action_trigger_id, action_trigger_version),
    FOREIGN KEY (action_trigger_id) REFERENCES action_trigger(id),
    FOREIGN KEY (action_trigger_version) REFERENCES action_trigger(version)
);

CREATE TABLE action_trigger_compatible (
    "index" text,
    action_trigger_id text,
    action_trigger_version text,
    id text,
    version text,
    PRIMARY KEY ("index", action_trigger_id, action_trigger_version),
    FOREIGN KEY (action_trigger_id) REFERENCES action_trigger(id),
    FOREIGN KEY (action_trigger_version) REFERENCES action_trigger(version)
);

CREATE TABLE action_trigger (
    id text,
    version text,
    default_runtime text,
    "status" text,
    PRIMARY KEY (id, version)
);

CREATE TABLE action_supported_trigger (
    action_id text,
    id text,
    version text,
    PRIMARY KEY (action_id, id, version),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (id) REFERENCES action_trigger(id),
    FOREIGN KEY (version) REFERENCES action_trigger(version)
);

CREATE TABLE action_secret (
    _fivetran_id text,
    action_id text,
    "name" text,
    updated_at text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id)
);

CREATE TABLE action_dependency (
    _fivetran_id text,
    action_id text,
    "name" text,
    registry_url text,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id)
);

CREATE TABLE action_integration (
    id text,
    action_id text,
    catalog_id text,
    created_at text,
    description text,
    feature_type text,
    logo text,
    "name" text,
    partner_id text,
    privacy_policy_url text,
    public_support_link text,
    secrets text,
    short_description text,
    terms_of_use_url text,
    updated_at text,
    url_slug text,
    PRIMARY KEY (id, action_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id)
);

CREATE TABLE "action" (
    id text,
    all_changes_deployed text,
    built_at text,
    code text,
    created_at text,
    current_version_build_time text,
    current_version_code text,
    current_version_created_at text,
    current_version_id text,
    current_version_number text,
    current_version_runtime text,
    current_version_status text,
    current_version_updated_at text,
    deployed_version_built_at text,
    deployed_version_code text,
    deployed_version_created_at text,
    deployed_version_deployed text,
    deployed_version_id text,
    deployed_version_number text,
    deployed_version_runtime text,
    deployed_version_secrets text,
    deployed_version_status text,
    deployed_version_supported_triggers text,
    deployed_version_updated_at text,
    installed_integration_id text,
    "name" text,
    runtime text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE client_grant_type (
    "index" text,
    client_id text,
    grant_type text,
    PRIMARY KEY ("index", client_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client_callback (
    _fivetran_id text,
    client_id text,
    callback text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client_metadata (
    "name" text,
    client_id text,
    "value" text,
    PRIMARY KEY ("name", client_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client (
    id text,
    allowed_origins text,
    backchannel_logout_urls text,
    callback_url_template text,
    cross_origin_auth text,
    cross_origin_authentication text,
    cross_origin_loc text,
    custom_login_page_on text,
    encryption_key_cert text,
    encryption_key_pub text,
    encryption_key_subject text,
    global text,
    is_first_party text,
    is_token_endpoint_ip_header_trusted text,
    jwt_configuration_alg text,
    jwt_configuration_lifetime_in_seconds text,
    jwt_configuration_secret_encoded text,
    "name" text,
    oidc_conformant text,
    refresh_token_expiration_type text,
    refresh_token_idle_token_lifetime text,
    refresh_token_infinite_idle_token_lifetime text,
    refresh_token_infinite_token_lifetime text,
    refresh_token_leeway text,
    refresh_token_rotation_type text,
    refresh_token_token_lifetime text,
    sso text,
    sso_disabled text,
    tenant text,
    PRIMARY KEY (id)
);

CREATE TABLE connection_realm (
    "index" text,
    connection_id text,
    realms text,
    PRIMARY KEY ("index", connection_id),
    FOREIGN KEY (connection_id) REFERENCES connection(id)
);

CREATE TABLE connection_enabled_client (
    client_id text,
    connection_id text,
    PRIMARY KEY (client_id, connection_id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (connection_id) REFERENCES connection(id)
);

CREATE TABLE connection_metadata (
    "name" text,
    connection_id text,
    "value" text,
    PRIMARY KEY ("name", connection_id),
    FOREIGN KEY (connection_id) REFERENCES connection(id)
);

CREATE TABLE connection (
    id text,
    is_domain_connection text,
    "name" text,
    strategy text,
    PRIMARY KEY (id)
);

CREATE TABLE log_detail_accessed_secret (
    "index" text,
    log_id text,
    accessedsecret text,
    PRIMARY KEY ("index", log_id),
    FOREIGN KEY (log_id) REFERENCES logs(log_id)
);

CREATE TABLE logs (
    log_id text,
    client_id text,
    connection_id text,
    user_id text,
    audience text,
    city_name text,
    client_name text,
    continent_code text,
    country_code text,
    country_code_3 text,
    country_name text,
    "date" timestamp,
    description text,
    hostname text,
    ip text,
    is_mobile text,
    latitude text,
    longitude text,
    page text,
    request_auth_credential jsonb,
    request_auth_strategy text,
    request_auth_user jsonb,
    request_channel text,
    request_ip text,
    request_method text,
    request_path text,
    request_user_agent text,
    response_client_id text,
    response_status_code text,
    scope text,
    strategy text,
    strategy_type text,
    time_zone text,
    "type" text,
    user_agent text,
    PRIMARY KEY (log_id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (connection_id) REFERENCES connection(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE log_stream_sink (
    "name" text,
    log_stream_id text,
    "value" text,
    PRIMARY KEY ("name", log_stream_id),
    FOREIGN KEY (log_stream_id) REFERENCES log_stream(id)
);

CREATE TABLE log_stream (
    id text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE grant_scope (
    "index" text,
    grant_id text,
    scope text,
    PRIMARY KEY ("index", grant_id),
    FOREIGN KEY (grant_id) REFERENCES grants(id)
);

CREATE TABLE grants (
    id text,
    client_id text,
    user_id text,
    audience text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE organization_member_role (
    id text,
    member_id text,
    organization_id text,
    PRIMARY KEY (id, member_id, organization_id),
    FOREIGN KEY (id) REFERENCES "role"(id),
    FOREIGN KEY (member_id) REFERENCES organization_member(id),
    FOREIGN KEY (organization_id) REFERENCES organization_member(organization_id)
);

CREATE TABLE event_stream (
    id text,
    created_at text,
    destination_configuration jsonb,
    destination_type text,
    "name" text,
    "status" text,
    subscription jsonb,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE organization_member (
    id text,
    organization_id text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE client_grant_scope (
    "index" text,
    client_grant_id text,
    client_id text,
    scope text,
    PRIMARY KEY ("index", client_grant_id, client_id),
    FOREIGN KEY (client_grant_id) REFERENCES client_grant(id),
    FOREIGN KEY (client_id) REFERENCES client_grant(client_id)
);

CREATE TABLE client_grant (
    id text,
    client_id text,
    audience text,
    PRIMARY KEY (id, client_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE organization_metadata (
    "name" text,
    organization_id text,
    "value" text,
    PRIMARY KEY ("name", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    branding_colors_page_background text,
    branding_colors_primary text,
    branding_logo_url text,
    display_name text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE role_permission (
    _fivetran_id text,
    role_id text,
    description text,
    permission_name text,
    resource_server_identifier text,
    resource_server_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE user_profile_data (
    "name" text,
    user_identities_index text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", user_identities_index, users_id),
    FOREIGN KEY (user_identities_index) REFERENCES user_identities("index"),
    FOREIGN KEY (users_id) REFERENCES user_identities(users_id)
);

CREATE TABLE user_identities (
    "index" text,
    users_id text,
    access_token text,
    connection text,
    expires_in text,
    is_social text,
    provider text,
    user_identity_id text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_app_metadata (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_metadata (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    blocked text,
    created_at text,
    deleted text,
    deleted_at text,
    email text,
    email_verified text,
    family_name text,
    first_name text,
    given_name text,
    identity_api text,
    idp_tenant_domain text,
    is_private_email text,
    last_ip text,
    last_login text,
    last_name text,
    last_password_reset text,
    logins_count text,
    "name" text,
    nickname text,
    nonce_supported text,
    o_id text,
    phone_number text,
    phone_verified text,
    picture text,
    principal_name text,
    real_user_status text,
    tenant_id text,
    updated_at text,
    username text,
    PRIMARY KEY (id)
);
