CREATE TABLE user_project (
    project_id text,
    user_id text,
    slug text,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_project (
    project_id text,
    team_id text,
    PRIMARY KEY (project_id, team_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE project_version (
    version text,
    project_id text,
    PRIMARY KEY (version, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_global (
    "index" text,
    project_id text,
    "condition" jsonb,
    fingerprint text,
    title text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_ai (
    "index" text,
    project_id text,
    "condition" jsonb,
    fingerprint text,
    title text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_setting_data_custom (
    "name" text,
    project_id text,
    "value" text,
    PRIMARY KEY ("name", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    account_id text,
    auto_upgrade text,
    date_created text,
    date_modified text,
    encryption_at_rest_enabled text,
    encryption_at_rest_enabled_at text,
    encryption_at_rest_enabled_at_creation text,
    encryption_at_rest_key text,
    integrations_additional_prop jsonb,
    integrations_asana_api_key_user_id text,
    integrations_asana_enabled text,
    integrations_asana_project_id text,
    integrations_asana_team_id text,
    integrations_asana_workspace_id text,
    integrations_azuredevops jsonb,
    integrations_bitbucket jsonb,
    integrations_campfire jsonb,
    integrations_ciscospark jsonb,
    integrations_clubhouse jsonb,
    integrations_datadog jsonb,
    integrations_email_enabled text,
    integrations_email_scrub_params text,
    integrations_flowdock jsonb,
    integrations_github_default_branch text,
    integrations_github_project_root text,
    integrations_github_scm_owner_access_token_user_id text,
    integrations_gitlab jsonb,
    integrations_hipchat jsonb,
    integrations_jira_credentials_user_id text,
    integrations_jira_custom_fields jsonb,
    integrations_jira_default_create_credentials text,
    integrations_jira_enabled text,
    integrations_jira_issue_active_status text,
    integrations_jira_issue_resolved_status text,
    integrations_jira_issue_type text,
    integrations_jira_project_key text,
    integrations_launchdarkly jsonb,
    integrations_lightstep jsonb,
    integrations_pagerduty_enabled text,
    integrations_pivotal jsonb,
    integrations_slack_access_token_user_id text,
    integrations_slack_bot_token_team_id text,
    integrations_slack_channel_id text,
    integrations_slack_default_actions_enabled text,
    integrations_slack_enabled text,
    integrations_sprintly jsonb,
    integrations_trello jsonb,
    integrations_victorops jsonb,
    integrations_webhook jsonb,
    "name" text,
    settings_data_scm_provider text,
    settings_data_time_format text,
    settings_data_timezone text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE item_occurrence (
    id text,
    item_id text,
    project_id text,
    billable text,
    data jsonb,
    timestamps text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE environment (
    id text,
    project_id text,
    environment text,
    visible text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE query_language_job (
    id text,
    project_id text,
    date_created text,
    date_modified text,
    job_hash text,
    query_string text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE team_user (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE invitation (
    id text,
    from_user_id text,
    team_id text,
    date_created text,
    date_redeemed text,
    "status" text,
    to_email text,
    PRIMARY KEY (id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE item (
    id text,
    activating_occurrence_id text,
    assigned_user_id text,
    environment text,
    first_occurrence_id text,
    group_item_id text,
    last_occurrence_id text,
    project_id text,
    public_item_id text,
    resolved_in_version text,
    controlling_id text,
    counter text,
    first_occurrence_timestamp text,
    framework text,
    group_status text,
    hash text,
    integrations_data text,
    last_activated_timestamp text,
    last_modified_by text,
    last_occurrence_timestamp text,
    last_resolved_timestamp text,
    "level" text,
    level_lock text,
    platform text,
    "status" text,
    title text,
    title_lock text,
    total_occurrences text,
    unique_occurrences text,
    PRIMARY KEY (id),
    FOREIGN KEY (activating_occurrence_id) REFERENCES item_occurrence(id),
    FOREIGN KEY (assigned_user_id) REFERENCES users(id),
    FOREIGN KEY (environment) REFERENCES environment(environment),
    FOREIGN KEY (first_occurrence_id) REFERENCES item_occurrence(id),
    FOREIGN KEY (group_item_id) REFERENCES item(id),
    FOREIGN KEY (last_occurrence_id) REFERENCES item_occurrence(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (public_item_id) REFERENCES item(id),
    FOREIGN KEY (resolved_in_version) REFERENCES project_version(version)
);

CREATE TABLE project_occurrence (
    id text,
    item_id text,
    project_id text,
    billable text,
    data jsonb,
    timestamps text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE team (
    id text,
    account_id text,
    access_level text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES project(account_id)
);

CREATE TABLE deploy (
    id text,
    environment text,
    project_id text,
    user_id text,
    "comment" text,
    finish_time text,
    revision text,
    start_time text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (environment) REFERENCES environment(environment),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    username text,
    PRIMARY KEY (id)
);
