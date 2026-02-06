CREATE TABLE incident_type_slack_channel (
    id text,
    incident_type_id text,
    "name" text,
    PRIMARY KEY (id, incident_type_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type_slack_alias (
    id text,
    incident_type_id text,
    "name" text,
    PRIMARY KEY (id, incident_type_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type_notify_email (
    notify_email text,
    incident_type_id text,
    PRIMARY KEY (notify_email, incident_type_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type (
    id text,
    created_at text,
    description text,
    "name" text,
    "position" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE audit (
    id text,
    user_id text,
    created_at timestamp,
    event text,
    item_id text,
    item_type text,
    object text,
    object_changes text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE post_mortem (
    id text,
    incident_id text,
    cancelled_at text,
    content text,
    created_at text,
    mitigated_at text,
    published_at text,
    resolved_at text,
    short_url text,
    show_action_items text,
    show_alerts_attached text,
    show_functionalities_impacted text,
    show_groups_impacted text,
    show_services_impacted text,
    show_timeline text,
    show_timeline_action_items text,
    show_timeline_genius text,
    show_timeline_order text,
    show_timeline_starred_only text,
    show_timeline_tasks text,
    show_timeline_trail text,
    started_at text,
    "status" text,
    title text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE form_field_option (
    id text,
    form_field_id text,
    color text,
    created_at text,
    is_default text,
    "position" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id)
);

CREATE TABLE incident_role (
    incident_id text,
    role_id text,
    PRIMARY KEY (incident_id, role_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE incident_environment (
    environment_id text,
    incident_id text,
    PRIMARY KEY (environment_id, incident_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_type_data (
    incident_id text,
    incident_type_id text,
    PRIMARY KEY (incident_id, incident_type_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_service (
    incident_id text,
    service_id text,
    PRIMARY KEY (incident_id, service_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE incident_functionality (
    functionality_id text,
    incident_id text,
    PRIMARY KEY (functionality_id, incident_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_team (
    incident_id text,
    team_id text,
    PRIMARY KEY (incident_id, team_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_event (
    event_id text,
    incident_id text,
    PRIMARY KEY (event_id, incident_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_action_item (
    action_item_id text,
    incident_id text,
    PRIMARY KEY (action_item_id, incident_id),
    FOREIGN KEY (action_item_id) REFERENCES action_item(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_feedback (
    feedback_id text,
    incident_id text,
    PRIMARY KEY (feedback_id, incident_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_post_mortem (
    incident_id text,
    post_mortem_id text,
    PRIMARY KEY (incident_id, post_mortem_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (post_mortem_id) REFERENCES post_mortem(id)
);

CREATE TABLE incident (
    id text,
    cancelled_by text,
    mitigated_by text,
    parent_incident_id text,
    resolved_by text,
    severity_id text,
    started_by_id text,
    user_id text,
    acknowledged_at text,
    airtable_base_key text,
    airtable_record_id text,
    airtable_record_url text,
    airtable_table_name text,
    asana_task_id text,
    asana_task_url text,
    cancellation_message text,
    cancelled_at text,
    confluence_page_id text,
    confluence_page_url text,
    created_at text,
    datadog_notebook_id text,
    datadog_notebook_url text,
    detected_at text,
    duplicate_incident_id text,
    freshservice_task_id text,
    freshservice_task_url text,
    freshservice_ticket_id text,
    freshservice_ticket_url text,
    github_issue_id text,
    github_issue_url text,
    google_drive_id text,
    google_drive_url text,
    google_meeting_id text,
    google_meeting_url text,
    jira_issue_id text,
    jira_issue_key text,
    jira_issue_url text,
    kind text,
    labels jsonb,
    linear_issue_id text,
    linear_issue_url text,
    mattermost_channel_id text,
    mattermost_channel_name text,
    mattermost_channel_url text,
    mitigated_at text,
    mitigation_message text,
    opsgenie_alert_id text,
    opsgenie_alert_url text,
    opsgenie_incident_id text,
    opsgenie_incident_url text,
    pagerduty_incident_id text,
    pagerduty_incident_url text,
    private text,
    public_title text,
    quip_page_id text,
    quip_page_url text,
    resolution_message text,
    resolved_at text,
    scheduled_for text,
    scheduled_until text,
    sequential_id text,
    service_now_incident_id text,
    service_now_incident_key text,
    service_now_incident_url text,
    short_url text,
    shortcut_story_id text,
    shortcut_story_url text,
    shortcut_task_id text,
    shortcut_task_url text,
    slack_channel_id text,
    slack_channel_name text,
    slack_channel_short_url text,
    slack_channel_url text,
    slug text,
    "source" text,
    started_at text,
    "status" text,
    summary text,
    title text,
    trello_card_id text,
    trello_card_url text,
    updated_at timestamp,
    url text,
    victor_ops_incident_id text,
    victor_ops_incident_url text,
    zendesk_ticket_id text,
    zendesk_ticket_url text,
    zoom_meeting_id text,
    zoom_meeting_join_url text,
    zoom_meeting_start_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (cancelled_by) REFERENCES users(id),
    FOREIGN KEY (mitigated_by) REFERENCES users(id),
    FOREIGN KEY (parent_incident_id) REFERENCES incident(id),
    FOREIGN KEY (resolved_by) REFERENCES users(id),
    FOREIGN KEY (severity_id) REFERENCES severity(id),
    FOREIGN KEY (started_by_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cause (
    id text,
    created_at timestamp,
    description text,
    "name" text,
    "position" text,
    slug text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE action_item_team (
    action_item_id text,
    team_id text,
    PRIMARY KEY (action_item_id, team_id),
    FOREIGN KEY (action_item_id) REFERENCES action_item(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE action_item_administrating_team (
    action_item_id text,
    administrating_team_id text,
    PRIMARY KEY (action_item_id, administrating_team_id),
    FOREIGN KEY (action_item_id) REFERENCES action_item(id),
    FOREIGN KEY (administrating_team_id) REFERENCES team(id)
);

CREATE TABLE action_item_notify_email (
    notify_email text,
    action_item_id text,
    PRIMARY KEY (notify_email, action_item_id),
    FOREIGN KEY (action_item_id) REFERENCES action_item(id)
);

CREATE TABLE action_item (
    id text,
    airtable_record_id text,
    asana_task_id text,
    assignee_id text,
    freshservice_task_id text,
    freshservice_ticket_id text,
    github_issue_id text,
    incident_id text,
    jira_issue_id text,
    linear_issue_id text,
    shortcut_story_id text,
    shortcut_task_id text,
    trello_card_id text,
    zendesk_ticket_id text,
    assignee_accept_marketing text,
    assignee_accept_terms text,
    assignee_created_through_sso text,
    assignee_current_team_id text,
    assignee_incidents_backfilled_count text,
    assignee_incidents_count text,
    assignee_incidents_example_count text,
    assignee_incidents_normal_count text,
    assignee_incidents_scheduled_count text,
    assignee_incidents_test_count text,
    assignee_last_notification_email_sent_at text,
    assignee_last_seen_at text,
    assignee_onboarding_completed text,
    assignee_profile_photo_id text,
    assignee_scim_uid text,
    assignee_service_user text,
    assignee_session_token text,
    assignee_teams_count text,
    assignee_theme text,
    assignee_time_zone text,
    created_at text,
    deleted_at text,
    description text,
    due_date text,
    kind text,
    priority text,
    short_url text,
    "status" text,
    summary text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (airtable_record_id) REFERENCES incident(airtable_record_id),
    FOREIGN KEY (asana_task_id) REFERENCES incident(asana_task_id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (freshservice_task_id) REFERENCES incident(freshservice_task_id),
    FOREIGN KEY (freshservice_ticket_id) REFERENCES incident(freshservice_ticket_id),
    FOREIGN KEY (github_issue_id) REFERENCES incident(github_issue_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (jira_issue_id) REFERENCES incident(jira_issue_id),
    FOREIGN KEY (linear_issue_id) REFERENCES incident(linear_issue_id),
    FOREIGN KEY (shortcut_story_id) REFERENCES incident(shortcut_story_id),
    FOREIGN KEY (shortcut_task_id) REFERENCES incident(shortcut_task_id),
    FOREIGN KEY (trello_card_id) REFERENCES incident(trello_card_id),
    FOREIGN KEY (zendesk_ticket_id) REFERENCES incident(zendesk_ticket_id)
);

CREATE TABLE retrospective_process (
    id text,
    created_at text,
    description text,
    is_default text,
    matching_criteria jsonb,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    id text,
    incident_id text,
    created_at text,
    event text,
    event_raw text,
    kind text,
    occurred_at text,
    "source" text,
    starred_at text,
    updated_at text,
    user_display_name text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE retrospective (
    id text,
    incident_role_id text,
    retrospective_process_id text,
    canceled_at text,
    created_at text,
    description text,
    due_after_days text,
    "position" text,
    skippable text,
    slug text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_role_id) REFERENCES "role"(id),
    FOREIGN KEY (retrospective_process_id) REFERENCES retrospective_process(id)
);

CREATE TABLE functionality_slack_channel (
    id text,
    functionality_id text,
    "name" text,
    PRIMARY KEY (id, functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id)
);

CREATE TABLE functionality_slack_alias (
    id text,
    functionality_id text,
    "name" text,
    PRIMARY KEY (id, functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id)
);

CREATE TABLE functionality_notify_email (
    notify_email text,
    functionality_id text,
    PRIMARY KEY (notify_email, functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id)
);

CREATE TABLE functionality_owner_user (
    functionality_id text,
    user_id text,
    PRIMARY KEY (functionality_id, user_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE functionality_owner_team (
    functionality_id text,
    team_id text,
    PRIMARY KEY (functionality_id, team_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE functionality_service_id (
    functionality_id text,
    service_id text,
    PRIMARY KEY (functionality_id, service_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE functionality_environment (
    environment_id text,
    functionality_id text,
    PRIMARY KEY (environment_id, functionality_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id)
);

CREATE TABLE functionality (
    id text,
    created_at text,
    description text,
    "name" text,
    opsgenie_id text,
    pagerduty_id text,
    "position" text,
    public_description text,
    show_uptime text,
    show_uptime_last_days text,
    slug text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE service_slack_channel (
    id text,
    service_id text,
    "name" text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_slack_alias (
    id text,
    service_id text,
    "name" text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_owner_user (
    service_id text,
    user_id text,
    PRIMARY KEY (service_id, user_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE service_owner_team (
    service_id text,
    team_id text,
    PRIMARY KEY (service_id, team_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE service_dependent_id (
    dependent_service_id text,
    service_id text,
    PRIMARY KEY (dependent_service_id, service_id),
    FOREIGN KEY (dependent_service_id) REFERENCES service(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_environment (
    environment_id text,
    service_id text,
    PRIMARY KEY (environment_id, service_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_notify_email (
    notify_email text,
    service_id text,
    PRIMARY KEY (notify_email, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service (
    id text,
    backstage_id text,
    created_at text,
    description text,
    github_repository_branch text,
    github_repository_name text,
    gitlab_repository_branch text,
    gitlab_repository_name text,
    "name" text,
    opsgenie_id text,
    pagerduty_id text,
    "position" text,
    public_description text,
    show_uptime text,
    show_uptime_last_days text,
    slug text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE form_field_selection_user (
    user_id text,
    form_field_selection_id text,
    PRIMARY KEY (user_id, form_field_selection_id),
    FOREIGN KEY (form_field_selection_id) REFERENCES form_field_selection(id)
);

CREATE TABLE form_field_selection_option (
    "index" text,
    form_field_selection_id text,
    color text,
    created_at text,
    form_field_id text,
    id text,
    is_default text,
    "position" text,
    updated_at text,
    "value" text,
    PRIMARY KEY ("index", form_field_selection_id),
    FOREIGN KEY (form_field_selection_id) REFERENCES form_field_selection(id)
);

CREATE TABLE form_field_selection (
    id text,
    form_field_id text,
    incident_id text,
    custom_field_id text,
    description text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE post_mortem_template (
    id text,
    content text,
    created_at text,
    format text,
    is_default text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE dashboard_panel_dataset_operation_rule (
    "index" text,
    dashboard_panel_dataset_index text,
    dashboard_panel_id text,
    "condition" text,
    "key" text,
    operation text,
    "value" text,
    PRIMARY KEY ("index", dashboard_panel_dataset_index, dashboard_panel_id),
    FOREIGN KEY (dashboard_panel_dataset_index) REFERENCES dashboard_panel_dataset("index"),
    FOREIGN KEY (dashboard_panel_id) REFERENCES dashboard_panel_dataset(dashboard_panel_id)
);

CREATE TABLE dashboard_panel_dataset (
    "index" text,
    dashboard_panel_id text,
    aggregate_cumulative text,
    aggregate_key text,
    aggregate_operation text,
    collection text,
    group_by text,
    "name" text,
    PRIMARY KEY ("index", dashboard_panel_id),
    FOREIGN KEY (dashboard_panel_id) REFERENCES dashboard_panel(id)
);

CREATE TABLE dashboard_panel (
    id text,
    dashboard_id text,
    created_at text,
    data jsonb,
    "name" text,
    params_display text,
    params_legend jsonb,
    position_h text,
    position_w text,
    position_x text,
    position_y text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (dashboard_id) REFERENCES dashboard(id)
);

CREATE TABLE form_field_shown (
    "index" text,
    form_field_id text,
    shown text,
    PRIMARY KEY ("index", form_field_id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id)
);

CREATE TABLE form_field_required (
    "index" text,
    form_field_id text,
    required text,
    PRIMARY KEY ("index", form_field_id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id)
);

CREATE TABLE form_field (
    id text,
    created_at timestamp,
    default_values jsonb,
    description text,
    enabled text,
    input_kind text,
    kind text,
    "name" text,
    show_on_incident_details text,
    slug text,
    team_id text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE playbook_task (
    id text,
    playbook_id text,
    created_at text,
    description text,
    "position" text,
    task text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id)
);

CREATE TABLE playbook_severity (
    playbook_id text,
    severity_id text,
    PRIMARY KEY (playbook_id, severity_id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id),
    FOREIGN KEY (severity_id) REFERENCES severity(id)
);

CREATE TABLE playbook_environment (
    environment_id text,
    playbook_id text,
    PRIMARY KEY (environment_id, playbook_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id)
);

CREATE TABLE playbook_functionality (
    functionality_id text,
    playbook_id text,
    PRIMARY KEY (functionality_id, playbook_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id)
);

CREATE TABLE playbook_service (
    playbook_id text,
    service_id text,
    PRIMARY KEY (playbook_id, service_id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE playbook_team (
    playbook_id text,
    team_id text,
    PRIMARY KEY (playbook_id, team_id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE playbook_incident_type (
    incident_type_id text,
    playbook_id text,
    PRIMARY KEY (incident_type_id, playbook_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id)
);

CREATE TABLE playbook (
    id text,
    user_id text,
    created_at text,
    external_url text,
    summary text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    full_name text,
    full_name_with_team text,
    "name" text,
    phone text,
    phone_2 text,
    slack_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE severity_slack_channel (
    id text,
    severity_id text,
    "name" text,
    PRIMARY KEY (id, severity_id),
    FOREIGN KEY (severity_id) REFERENCES severity(id)
);

CREATE TABLE severity_slack_alias (
    id text,
    severity_id text,
    "name" text,
    PRIMARY KEY (id, severity_id),
    FOREIGN KEY (severity_id) REFERENCES severity(id)
);

CREATE TABLE severity_notify_email (
    notify_email text,
    severity_id text,
    PRIMARY KEY (notify_email, severity_id),
    FOREIGN KEY (severity_id) REFERENCES severity(id)
);

CREATE TABLE severity (
    id text,
    created_at text,
    description text,
    "name" text,
    "position" text,
    severity text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE secret (
    id text,
    created_at text,
    hashicorp_vault_mount text,
    hashicorp_vault_path text,
    hashicorp_vault_version text,
    "name" text,
    secret text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback (
    id text,
    incident_id text,
    anonymous text,
    created_at text,
    feedback text,
    rating text,
    rating_humanized text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE environment_slack_channel (
    id text,
    environment_id text,
    "name" text,
    PRIMARY KEY (id, environment_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE environment_slack_alias (
    id text,
    environment_id text,
    "name" text,
    PRIMARY KEY (id, environment_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE environment_notify_email (
    notify_email text,
    environment_id text,
    PRIMARY KEY (notify_email, environment_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE environment (
    id text,
    created_at text,
    description text,
    "name" text,
    "position" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE "role" (
    id text,
    allow_multi_user_assignment text,
    created_at timestamp,
    description text,
    enabled text,
    "name" text,
    optional text,
    "position" text,
    slug text,
    summary text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE dashboard (
    id text,
    user_id text,
    auto_refresh text,
    color text,
    created_at text,
    description text,
    icon text,
    "name" text,
    owner text,
    period text,
    public text,
    "range" text,
    slug text,
    team_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE workflow_group (
    id text,
    expanded text,
    kind text,
    "name" text,
    "position" text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE form_field_position (
    id text,
    form_field_id text,
    form text,
    "position" text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id)
);

CREATE TABLE team_slack_channel (
    id text,
    team_id text,
    "name" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_slack_alias (
    id text,
    team_id text,
    "name" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_notify_email (
    notify_email text,
    team_id text,
    PRIMARY KEY (notify_email, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    description text,
    "name" text,
    opsgenie_id text,
    pagerduty_id text,
    "position" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_task_run_output (
    "index" text,
    workflow_id text,
    workflow_run_id text,
    workflow_task_run_id text,
    event text,
    timestamps text,
    PRIMARY KEY ("index", workflow_id, workflow_run_id, workflow_task_run_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow_task_run(workflow_id),
    FOREIGN KEY (workflow_run_id) REFERENCES workflow_task_run(workflow_run_id),
    FOREIGN KEY (workflow_task_run_id) REFERENCES workflow_task_run(id)
);

CREATE TABLE workflow_task_run (
    id text,
    workflow_id text,
    workflow_run_id text,
    canceled_at text,
    completed_at text,
    created_at text,
    failed_at text,
    "position" text,
    skip_on_failure text,
    started_at text,
    "status" text,
    triggered_by text,
    updated_at text,
    PRIMARY KEY (id, workflow_id, workflow_run_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow_run(workflow_id),
    FOREIGN KEY (workflow_run_id) REFERENCES workflow_run(id)
);

CREATE TABLE workflow_run (
    id text,
    workflow_id text,
    action_item_id text,
    incident_id text,
    post_mortem_id text,
    user_id text,
    alert_id text,
    canceled_at text,
    completed_at text,
    created_at text,
    failed_at text,
    kind text,
    pulse_id text,
    queued_at text,
    started_at text,
    "status" text,
    status_message text,
    triggered_by text,
    updated_at text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id),
    FOREIGN KEY (action_item_id) REFERENCES action_item(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (post_mortem_id) REFERENCES post_mortem(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE workflow_environment (
    environment_id text,
    workflow_id text,
    PRIMARY KEY (environment_id, workflow_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_severity (
    severity_id text,
    workflow_id text,
    PRIMARY KEY (severity_id, workflow_id),
    FOREIGN KEY (severity_id) REFERENCES severity(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_incident_type (
    incident_type_id text,
    workflow_id text,
    PRIMARY KEY (incident_type_id, workflow_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_role (
    role_id text,
    workflow_id text,
    PRIMARY KEY (role_id, workflow_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_service (
    service_id text,
    workflow_id text,
    PRIMARY KEY (service_id, workflow_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_functionality (
    functionality_id text,
    workflow_id text,
    PRIMARY KEY (functionality_id, workflow_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    workflow_group_id text,
    command text,
    command_feedback_enabled text,
    created_at timestamp,
    description text,
    enabled text,
    expanded text,
    incident_condition text,
    incident_condition_acknowledged_at text,
    incident_condition_detected_at text,
    incident_condition_environment text,
    incident_condition_functionality text,
    incident_condition_group text,
    incident_condition_incident_roles text,
    incident_condition_incident_type text,
    incident_condition_kind text,
    incident_condition_mitigated_at text,
    incident_condition_resolved_at text,
    incident_condition_service text,
    incident_condition_severity text,
    incident_condition_started_at text,
    incident_condition_status text,
    incident_condition_summary text,
    incident_condition_visibility text,
    incident_conditional_inactivity text,
    incident_inactivity_duration text,
    "name" text,
    "position" text,
    repeat_every_duration text,
    slug text,
    trigger_type text,
    updated_at timestamp,
    wait text,
    PRIMARY KEY (id),
    FOREIGN KEY (workflow_group_id) REFERENCES workflow_group(id)
);
