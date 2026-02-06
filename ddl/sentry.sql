CREATE TABLE project_error_event_tag (
    "key" text,
    project_error_event_id text,
    query text,
    "value" text,
    PRIMARY KEY ("key", project_error_event_id),
    FOREIGN KEY (project_error_event_id) REFERENCES project_error_event(id)
);

CREATE TABLE project_error_event (
    id text,
    project_id text,
    crash_file text,
    culprit text,
    date_created timestamp,
    event_type text,
    group_id text,
    ip_address text,
    location text,
    message text,
    "name" text,
    platform text,
    title text,
    user_data jsonb,
    user_email text,
    user_id text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE organization_repository (
    id text,
    organization_id text,
    date_created timestamp,
    external_id text,
    external_slug text,
    integration_id text,
    "name" text,
    provider_id text,
    provider_name text,
    "status" text,
    url text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE project_feature (
    feature text,
    project_id text,
    PRIMARY KEY (feature, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_access (
    access text,
    project_id text,
    PRIMARY KEY (access, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_team (
    project_id text,
    team_id text,
    PRIMARY KEY (project_id, team_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (team_id) REFERENCES organization_team(id)
);

CREATE TABLE project_allowed_domain (
    allowed_domain text,
    project_id text,
    PRIMARY KEY (allowed_domain, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_built_in_symbol_source (
    "source" text,
    project_id text,
    PRIMARY KEY ("source", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_dynamic_sampling_bias (
    id text,
    project_id text,
    active text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_platform (
    platform text,
    project_id text,
    PRIMARY KEY (platform, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_plugin_feature (
    feature text,
    project_id text,
    project_plugin_id text,
    PRIMARY KEY (feature, project_id, project_plugin_id),
    FOREIGN KEY (project_id) REFERENCES project_plugin(project_id),
    FOREIGN KEY (project_plugin_id) REFERENCES project_plugin(id)
);

CREATE TABLE project_plugin_feature_description (
    "index" text,
    project_id text,
    project_plugin_id text,
    description text,
    feature_gate text,
    PRIMARY KEY ("index", project_id, project_plugin_id),
    FOREIGN KEY (project_id) REFERENCES project_plugin(project_id),
    FOREIGN KEY (project_plugin_id) REFERENCES project_plugin(id)
);

CREATE TABLE project_plugin_resource_link (
    "index" text,
    project_id text,
    project_plugin_id text,
    title text,
    url text,
    PRIMARY KEY ("index", project_id, project_plugin_id),
    FOREIGN KEY (project_id) REFERENCES project_plugin(project_id),
    FOREIGN KEY (project_plugin_id) REFERENCES project_plugin(id)
);

CREATE TABLE project_plugin (
    id text,
    project_id text,
    alt_is_sentry_app text,
    assets jsonb,
    author_name text,
    author_url text,
    can_disable text,
    contexts jsonb,
    default_environment text,
    deprecation_date text,
    description text,
    doc text,
    enabled text,
    fingerprinting_rule text,
    first_party_alternative text,
    grouping_auto_update text,
    has_configuration text,
    is_deprecated text,
    is_hidden text,
    is_testable text,
    "name" text,
    processing_issue text,
    short_name text,
    slug text,
    "status" text,
    "type" text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    organization_id text,
    avatar_type text,
    avatar_uuid text,
    color text,
    data_scrubber text,
    data_scrubber_default text,
    date_created timestamp,
    default_environment text,
    digests_max_delay text,
    digests_min_delay text,
    fingerprinting_rule text,
    first_event text,
    first_transaction_event text,
    grouping_auto_update text,
    grouping_config text,
    grouping_enhancement_base text,
    has_access text,
    has_custom_metric text,
    has_feedback text,
    has_minified_stack_trace text,
    has_monitor text,
    has_new_feedback text,
    has_profile text,
    has_replay text,
    has_session text,
    is_bookmarked text,
    is_internal text,
    is_member text,
    is_public text,
    latest_release text,
    latest_release_version text,
    "name" text,
    organization_slug text,
    platform text,
    processing_issue text,
    recap_server_url text,
    relay_custom_metric_cardinality_limit text,
    relay_pii_config text,
    resolve_age text,
    safe_field jsonb,
    scrape_javascript text,
    scrub_ip_address text,
    secondary_grouping_config text,
    secondary_grouping_expiry text,
    security_token text,
    security_token_header text,
    sensitive_field jsonb,
    slug text,
    "status" text,
    store_crash_report text,
    subject_prefix text,
    subject_template text,
    symbol_sources jsonb,
    symbolication_degraded text,
    verify_ssl text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE project_service_hook_event (
    "index" text,
    organization_id text,
    project_id text,
    project_service_hook_id text,
    event text,
    PRIMARY KEY ("index", organization_id, project_id, project_service_hook_id),
    FOREIGN KEY (organization_id) REFERENCES project_service_hook(organization_id),
    FOREIGN KEY (project_id) REFERENCES project_service_hook(project_id),
    FOREIGN KEY (project_service_hook_id) REFERENCES project_service_hook(id)
);

CREATE TABLE project_service_hook (
    id text,
    organization_id text,
    project_id text,
    date_created timestamp,
    secret text,
    "status" text,
    url text,
    PRIMARY KEY (id, organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_issue_tag (
    "key" text,
    project_issue_id text,
    "name" text,
    organization_slug text,
    total_value text,
    PRIMARY KEY ("key", project_issue_id),
    FOREIGN KEY ("key") REFERENCES tag_detail("key"),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue(id)
);

CREATE TABLE project_issue_seen_by_email (
    id text,
    project_issue_id text,
    project_issue_seen_by_id text,
    email text,
    is_verified text,
    PRIMARY KEY (id, project_issue_id, project_issue_seen_by_id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue_seen_by(project_issue_id),
    FOREIGN KEY (project_issue_seen_by_id) REFERENCES project_issue_seen_by(id)
);

CREATE TABLE project_issue_seen_by (
    id text,
    project_issue_id text,
    author_avatar_type text,
    author_avatar_uuid text,
    avatar_url text,
    date_joined text,
    email text,
    experiments jsonb,
    has_2_factor_authentication text,
    has_password_auth text,
    is_active text,
    is_managed text,
    is_staff text,
    is_superuser text,
    last_active text,
    last_login text,
    last_seen text,
    "name" text,
    username text,
    PRIMARY KEY (id, project_issue_id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue(id)
);

CREATE TABLE project_issue_activity_email (
    id text,
    project_issue_activity_id text,
    project_issue_id text,
    email text,
    is_verified text,
    PRIMARY KEY (id, project_issue_activity_id, project_issue_id),
    FOREIGN KEY (project_issue_activity_id) REFERENCES project_issue_activity(id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue_activity(project_issue_id)
);

CREATE TABLE project_issue_activity (
    id text,
    project_issue_id text,
    data jsonb,
    date_created text,
    "type" text,
    user_author_avatar_type text,
    user_author_avatar_uuid text,
    user_avatar_url text,
    user_date_joined text,
    user_email text,
    user_experiments jsonb,
    user_has_2_factor_authentication text,
    user_has_password_auth text,
    user_is_active text,
    user_is_managed text,
    user_is_staff text,
    user_is_superuser text,
    user_last_active text,
    user_last_login text,
    user_name text,
    user_username text,
    PRIMARY KEY (id, project_issue_id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue(id)
);

CREATE TABLE project_issue_stat_daily (
    "index" text,
    project_issue_id text,
    twenty_four_hour text,
    PRIMARY KEY ("index", project_issue_id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue(id)
);

CREATE TABLE project_issue_stat_monthly (
    "index" text,
    project_issue_id text,
    thirty_day text,
    PRIMARY KEY ("index", project_issue_id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue(id)
);

CREATE TABLE project_issue (
    id text,
    first_release_id text,
    last_release_id text,
    project_id text,
    annotations jsonb,
    assigned_to text,
    count text,
    culprit text,
    first_seen text,
    has_seen text,
    is_bookmarked text,
    is_public text,
    is_subscribed text,
    is_unhandled text,
    issue_category text,
    issue_type text,
    last_seen text,
    "level" text,
    logger text,
    num_comment text,
    organization_slug text,
    participants jsonb,
    permalink text,
    platform text,
    plugin_action text,
    plugin_context jsonb,
    plugin_issue text,
    priority text,
    priority_locked_at text,
    share_id text,
    short_id text,
    "status" text,
    status_details jsonb,
    subscription_detail text,
    substatus text,
    title text,
    "type" text,
    user_count text,
    user_report_count text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (first_release_id) REFERENCES organization_release(id),
    FOREIGN KEY (last_release_id) REFERENCES organization_release(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_user (
    _fivetran_id text,
    organization_id text,
    project_id text,
    avatar_url text,
    date_created text,
    email text,
    hash text,
    id text,
    identifier text,
    ip_address text,
    "name" text,
    tag_value text,
    username text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_user_feedback (
    id text,
    project_id text,
    "comment" text,
    date_created text,
    email text,
    event_id text,
    issue jsonb,
    "name" text,
    users jsonb,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE organization_release_commit (
    id text,
    organization_release_version text,
    organization_id text,
    pull_request_repository_id text,
    repository_id text,
    author_email text,
    author_name text,
    date_created timestamp,
    message text,
    pull_request_date_created text,
    pull_request_external_url text,
    pull_request_id text,
    pull_request_message text,
    pull_request_title text,
    suspect_commit_type text,
    PRIMARY KEY (id, organization_release_version, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization_release(organization_id),
    FOREIGN KEY (pull_request_repository_id) REFERENCES organization_repository(id),
    FOREIGN KEY (repository_id) REFERENCES organization_repository(id)
);

CREATE TABLE project_release_file (
    id text,
    latest_release_version text,
    organization_slug text,
    project_slug text,
    date_created timestamp,
    dist text,
    "name" text,
    sha_1 text,
    "size" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, latest_release_version, organization_slug, project_slug)
);

CREATE TABLE repository_commit_author_email (
    id text,
    organization_id text,
    repository_commit_id text,
    email text,
    is_verified text,
    PRIMARY KEY (id, organization_id, repository_commit_id),
    FOREIGN KEY (organization_id) REFERENCES repository_commit(organization_id),
    FOREIGN KEY (repository_commit_id) REFERENCES repository_commit(id)
);

CREATE TABLE repository_commit_release (
    version text,
    organization_id text,
    repository_commit_id text,
    date_created text,
    date_released text,
    ref text,
    short_version text,
    url text,
    PRIMARY KEY (version, organization_id, repository_commit_id),
    FOREIGN KEY (organization_id) REFERENCES repository_commit(organization_id),
    FOREIGN KEY (repository_commit_id) REFERENCES repository_commit(id)
);

CREATE TABLE repository_commit (
    id text,
    organization_id text,
    repository_id text,
    author_avatar_type text,
    author_avatar_url text,
    author_avatar_uuid text,
    author_date_joined text,
    author_email text,
    author_experiments jsonb,
    author_has_2_factor_authentication text,
    author_has_password_auth text,
    author_id text,
    author_is_active text,
    author_is_managed text,
    author_is_staff text,
    author_is_superuser text,
    author_last_active text,
    author_last_login text,
    author_name text,
    author_username text,
    date_created timestamp,
    message text,
    pull_request text,
    suspect_commit_type text,
    PRIMARY KEY (id, organization_id, repository_id),
    FOREIGN KEY (organization_id) REFERENCES organization_repository(organization_id),
    FOREIGN KEY (repository_id) REFERENCES organization_repository(id)
);

CREATE TABLE organization_team_access (
    access text,
    organization_team_id text,
    PRIMARY KEY (access, organization_team_id),
    FOREIGN KEY (organization_team_id) REFERENCES organization_team(id)
);

CREATE TABLE organization_team_project (
    organization_team_id text,
    project_id text,
    PRIMARY KEY (organization_team_id, project_id),
    FOREIGN KEY (organization_team_id) REFERENCES organization_team(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE organization_team (
    id text,
    organization_id text,
    avatar_type text,
    avatar_uuid text,
    date_created timestamp,
    external_teams jsonb,
    flag_idp_provisioned text,
    has_access text,
    is_member text,
    is_pending text,
    member_count text,
    organization_role text,
    team_role text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_feature (
    feature text,
    organization_id text,
    PRIMARY KEY (feature, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_available_role (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_role_list_scope (
    scope text,
    organization_id text,
    organization_role_list_id text,
    PRIMARY KEY (scope, organization_id, organization_role_list_id),
    FOREIGN KEY (organization_id) REFERENCES organization_role_list(organization_id),
    FOREIGN KEY (organization_role_list_id) REFERENCES organization_role_list(id)
);

CREATE TABLE organization_role_list (
    id text,
    organization_id text,
    allowed text,
    descending text,
    is_allowed text,
    is_global text,
    is_retired text,
    minimum_team_role text,
    "name" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_team_role_list_scope (
    scope text,
    organization_id text,
    organization_team_role_list_id text,
    PRIMARY KEY (scope, organization_id, organization_team_role_list_id),
    FOREIGN KEY (organization_id) REFERENCES organization_team_role_list(organization_id),
    FOREIGN KEY (organization_team_role_list_id) REFERENCES organization_team_role_list(id)
);

CREATE TABLE organization_team_role_list (
    id text,
    organization_id text,
    descending text,
    is_allowed text,
    is_global text,
    is_minimum_role_for text,
    is_retired text,
    "name" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_access (
    access text,
    organization_id text,
    PRIMARY KEY (access, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_onboarding_task_user_email (
    id text,
    organization_id text,
    organization_onboarding_task_index text,
    email text,
    is_verified text,
    PRIMARY KEY (id, organization_id, organization_onboarding_task_index),
    FOREIGN KEY (organization_id) REFERENCES organization_onboarding_task(organization_id),
    FOREIGN KEY (organization_onboarding_task_index) REFERENCES organization_onboarding_task("index")
);

CREATE TABLE organization_onboarding_task (
    "index" text,
    organization_id text,
    completion_seen text,
    date_completed text,
    "status" text,
    task text,
    user_avatar_type text,
    user_avatar_url text,
    user_avatar_uuid text,
    user_date_joined text,
    user_email text,
    user_experiments jsonb,
    user_has_2_factor_authentication text,
    user_has_password_auth text,
    user_id text,
    user_is_active text,
    user_is_managed text,
    user_is_staff text,
    user_is_superuser text,
    user_last_active text,
    user_last_login text,
    user_name text,
    user_username text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    aggregated_data_consent text,
    ai_suggested_solution text,
    alert_member_write text,
    allow_join_request text,
    allow_shared_issue text,
    attachment_role text,
    avatar_type text,
    avatar_url text,
    avatar_uuid text,
    codecov_access text,
    data_scrubber text,
    data_scrubber_default text,
    date_created text,
    debug_file_role text,
    default_role text,
    desired_sample_rate text,
    enhanced_privacy text,
    event_member_admin text,
    gen_ai_consent text,
    github_nudge_invite text,
    github_pr_bot text,
    has_auth_provider text,
    is_default text,
    is_dynamically_sampled text,
    is_early_adopter text,
    links_organization_url text,
    links_region_url text,
    "name" text,
    open_membership text,
    org_role text,
    pending_access_request text,
    plan_sample_rate text,
    quota_account_limit text,
    quota_max_rate text,
    quota_max_rate_interval text,
    quota_project_limit text,
    relay_pii_config text,
    require_2_f_a text,
    require_email_verification text,
    "role" text,
    safe_fields jsonb,
    scrape_java_script text,
    scrub_ip_address text,
    sensitive_fields jsonb,
    slug text,
    status_id text,
    status_name text,
    store_crash_report text,
    trusted_relay jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE organization_release_author (
    "index" text,
    organization_id text,
    organization_release_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", organization_id, organization_release_id),
    FOREIGN KEY (organization_id) REFERENCES organization_release(organization_id),
    FOREIGN KEY (organization_release_id) REFERENCES organization_release(id)
);

CREATE TABLE organization_release_last_deploy (
    id text,
    organization_id text,
    organization_release_id text,
    date_finished text,
    date_started text,
    environment text,
    "name" text,
    url text,
    PRIMARY KEY (id, organization_id, organization_release_id),
    FOREIGN KEY (organization_id) REFERENCES organization_release(organization_id),
    FOREIGN KEY (organization_release_id) REFERENCES organization_release(id)
);

CREATE TABLE organization_release_project_platform (
    "index" text,
    organization_id text,
    organization_release_id text,
    project_id text,
    platform text,
    PRIMARY KEY ("index", organization_id, organization_release_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES organization_release_project(organization_id),
    FOREIGN KEY (organization_release_id) REFERENCES organization_release_project(organization_release_id),
    FOREIGN KEY (project_id) REFERENCES organization_release_project(project_id)
);

CREATE TABLE organization_release_project (
    organization_id text,
    organization_release_id text,
    project_id text,
    PRIMARY KEY (organization_id, organization_release_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES organization_release(organization_id),
    FOREIGN KEY (organization_release_id) REFERENCES organization_release(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE organization_release (
    id text,
    organization_id text,
    last_commit_id text,
    commit_count text,
    current_project_meta jsonb,
    data jsonb,
    date_created timestamp,
    date_released text,
    deploy_count text,
    first_event text,
    last_event text,
    new_groups text,
    owner text,
    reference text,
    short_version text,
    "status" text,
    url text,
    user_agent text,
    version text,
    version_info_build_hash text,
    version_info_description text,
    version_info_package text,
    version_info_raw text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (last_commit_id) REFERENCES organization_release_commit(id)
);

CREATE TABLE issue_event_tag (
    "key" text,
    issue_event_id text,
    query text,
    "value" text,
    PRIMARY KEY ("key", issue_event_id),
    FOREIGN KEY (issue_event_id) REFERENCES issue_event(id)
);

CREATE TABLE issue_event (
    id text,
    group_id text,
    project_id text,
    crash_file text,
    culprit text,
    date_created text,
    event_type text,
    ip_address text,
    location text,
    message text,
    "name" text,
    platform text,
    title text,
    user_data jsonb,
    user_email text,
    user_id text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES project_issue(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE tag_detail_top_value (
    "index" text,
    project_issue_id text,
    tag_detail_key text,
    "key" text,
    count text,
    first_seen text,
    last_seen text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", project_issue_id, tag_detail_key),
    FOREIGN KEY (project_issue_id) REFERENCES tag_detail(project_issue_id),
    FOREIGN KEY (tag_detail_key) REFERENCES tag_detail("key"),
    FOREIGN KEY ("key") REFERENCES tag_detail("key")
);

CREATE TABLE tag_detail (
    "key" text,
    project_issue_id text,
    "name" text,
    total_values text,
    PRIMARY KEY ("key", project_issue_id),
    FOREIGN KEY (project_issue_id) REFERENCES project_issue_tag(project_issue_id)
);

CREATE TABLE integration_platform_install (
    id text,
    organization_id text,
    app_slug text,
    app_uuid text,
    organization_slug text,
    "status" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);
