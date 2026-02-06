CREATE TABLE incident_alert (
    id text,
    alert_id text,
    alert_route_id text,
    incident_id text,
    incident_external_id text,
    incident_status_category text,
    PRIMARY KEY (id),
    FOREIGN KEY (alert_id) REFERENCES alert(id),
    FOREIGN KEY (alert_route_id) REFERENCES alert_route(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_type (
    id text,
    create_in_triage text,
    created_at text,
    description text,
    is_default text,
    "name" text,
    private_incidents_only text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE identity_utility_role (
    identity_utility_name text,
    "index" text,
    identity_utility_role text,
    PRIMARY KEY (identity_utility_name, "index")
);

CREATE TABLE alert_source_jira_option (
    jira_project_id text,
    alert_source_id text,
    PRIMARY KEY (jira_project_id, alert_source_id),
    FOREIGN KEY (alert_source_id) REFERENCES alert_source(id)
);

CREATE TABLE alert_source_attribute (
    alert_attribute_id text,
    alert_source_id text,
    PRIMARY KEY (alert_attribute_id, alert_source_id),
    FOREIGN KEY (alert_attribute_id) REFERENCES alert_attribute(id),
    FOREIGN KEY (alert_source_id) REFERENCES alert_source(id)
);

CREATE TABLE alert_source_expression (
    "index" text,
    alert_source_id text,
    else_branch_result jsonb,
    label text,
    operations jsonb,
    reference text,
    return_array text,
    return_type text,
    root_reference text,
    PRIMARY KEY ("index", alert_source_id),
    FOREIGN KEY (alert_source_id) REFERENCES alert_source(id)
);

CREATE TABLE alert_source (
    id text,
    description_label text,
    description_literal text,
    description_reference text,
    email_address text,
    "name" text,
    secret_token text,
    source_type text,
    title_label text,
    title_literal text,
    title_reference text,
    PRIMARY KEY (id)
);

CREATE TABLE alert_source_attribute_binding_value (
    "index" text,
    alert_attribute_id text,
    alert_source_id text,
    label text,
    literal text,
    reference text,
    PRIMARY KEY ("index", alert_attribute_id, alert_source_id),
    FOREIGN KEY (alert_attribute_id) REFERENCES alert_source_attribute(alert_attribute_id),
    FOREIGN KEY (alert_source_id) REFERENCES alert_source_attribute(alert_source_id)
);

CREATE TABLE "action" (
    id text,
    assignee_id text,
    incident_id text,
    completed_at text,
    created_at text,
    description text,
    follow_up text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE catalog_resource (
    _fivetran_id text,
    category text,
    description text,
    label text,
    "type" text,
    value_docstring text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE workflow_condition_param_binding (
    "index" text,
    workflow_condition_index text,
    workflow_id text,
    array_value jsonb,
    value_lable text,
    value_literal text,
    value_reference text,
    PRIMARY KEY ("index", workflow_condition_index, workflow_id),
    FOREIGN KEY (workflow_condition_index) REFERENCES workflow_condition("index"),
    FOREIGN KEY (workflow_id) REFERENCES workflow_condition(workflow_id)
);

CREATE TABLE workflow_condition (
    "index" text,
    workflow_id text,
    operation_label text,
    operation_value text,
    subject_label text,
    subject_reference text,
    PRIMARY KEY ("index", workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_once_for (
    "key" text,
    workflow_id text,
    is_array text,
    label text,
    "type" text,
    PRIMARY KEY ("key", workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_step (
    "index" text,
    workflow_id text,
    label text,
    "name" text,
    PRIMARY KEY ("index", workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_expression_array_value (
    "index" text,
    workflow_expression_index text,
    workflow_id text,
    label text,
    literal text,
    reference text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression("index"),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression(workflow_id)
);

CREATE TABLE workflow_expression_operation_filter_condition_param_binding (
    "index" text,
    workflow_expression_index text,
    workflow_expression_operation_filter_condition_group_index text,
    workflow_expression_operation_index text,
    workflow_id text,
    array_value jsonb,
    value_lable text,
    value_literal text,
    value_reference text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_expression_operation_filter_condition_group_index, workflow_expression_operation_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression_operation_filter_condition_group(workflow_expression_index),
    FOREIGN KEY (workflow_expression_operation_filter_condition_group_index) REFERENCES workflow_expression_operation_filter_condition_group("index"),
    FOREIGN KEY (workflow_expression_operation_index) REFERENCES workflow_expression_operation_filter_condition_group(workflow_expression_operation_index),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression_operation_filter_condition_group(workflow_id)
);

CREATE TABLE workflow_expression_operation_filter_condition_group (
    "index" text,
    workflow_expression_index text,
    workflow_expression_operation_index text,
    workflow_id text,
    operation_label text,
    operation_value text,
    subject_label text,
    subject_reference text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_expression_operation_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression_operation(workflow_expression_index),
    FOREIGN KEY (workflow_expression_operation_index) REFERENCES workflow_expression_operation("index"),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression_operation(workflow_id)
);

CREATE TABLE workflow_expression_operation_branch_condition_param_binding (
    "index" text,
    workflow_expression_index text,
    workflow_expression_operation_branch_condition_index text,
    workflow_expression_operation_branch_index text,
    workflow_expression_operation_index text,
    workflow_id text,
    array_value jsonb,
    value_lable text,
    value_literal text,
    value_reference text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_expression_operation_branch_condition_index, workflow_expression_operation_branch_index, workflow_expression_operation_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression_operation_branch_condition(workflow_expression_index),
    FOREIGN KEY (workflow_expression_operation_branch_condition_index) REFERENCES workflow_expression_operation_branch_condition("index"),
    FOREIGN KEY (workflow_expression_operation_branch_index) REFERENCES workflow_expression_operation_branch_condition(workflow_expression_operation_branch_index),
    FOREIGN KEY (workflow_expression_operation_index) REFERENCES workflow_expression_operation_branch_condition(workflow_expression_operation_index),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression_operation_branch_condition(workflow_id)
);

CREATE TABLE workflow_expression_operation_branch_condition (
    "index" text,
    workflow_expression_index text,
    workflow_expression_operation_branch_index text,
    workflow_expression_operation_index text,
    workflow_id text,
    operation_label text,
    operation_value text,
    subject_label text,
    subject_reference text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_expression_operation_branch_index, workflow_expression_operation_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression_operation_branch(workflow_expression_index),
    FOREIGN KEY (workflow_expression_operation_branch_index) REFERENCES workflow_expression_operation_branch("index"),
    FOREIGN KEY (workflow_expression_operation_index) REFERENCES workflow_expression_operation_branch(workflow_expression_operation_index),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression_operation_branch(workflow_id)
);

CREATE TABLE workflow_expression_operation_branch (
    "index" text,
    workflow_expression_index text,
    workflow_expression_operation_index text,
    workflow_id text,
    array_value jsonb,
    value_label text,
    value_literal text,
    value_reference text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_expression_operation_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression_operation(workflow_expression_index),
    FOREIGN KEY (workflow_expression_operation_index) REFERENCES workflow_expression_operation("index"),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression_operation(workflow_id)
);

CREATE TABLE workflow_expression_operation (
    "index" text,
    workflow_expression_index text,
    workflow_id text,
    branch_return_array text,
    branch_return_type text,
    navigation_reference text,
    navigation_reference_label text,
    operation_type text,
    parse_return_array text,
    parse_return_type text,
    parse_source text,
    return_array text,
    return_type text,
    PRIMARY KEY ("index", workflow_expression_index, workflow_id),
    FOREIGN KEY (workflow_expression_index) REFERENCES workflow_expression("index"),
    FOREIGN KEY (workflow_id) REFERENCES workflow_expression(workflow_id)
);

CREATE TABLE workflow_expression (
    "index" text,
    workflow_id text,
    label text,
    reference text,
    result_value_label text,
    result_value_literal text,
    result_value_reference text,
    returns_array text,
    returns_type text,
    root_reference text,
    PRIMARY KEY ("index", workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    continue_on_step_error text,
    delay_conditions_apply_over text,
    delay_for_seconds text,
    folder text,
    include_private_incident text,
    "name" text,
    runs_from text,
    runs_on_incident text,
    runs_on_incident_modes jsonb,
    shortform text,
    "state" text,
    tigger_label text,
    tigger_name text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_option (
    id text,
    custom_field_id text,
    sort_key text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE users (
    id text,
    email text,
    "name" text,
    "role" text,
    slack_user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_status (
    id text,
    category text,
    created_at text,
    description text,
    "name" text,
    rank text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE catalog_type_required_integration (
    required_intergration text,
    catalog_type_id text,
    PRIMARY KEY (required_intergration, catalog_type_id),
    FOREIGN KEY (catalog_type_id) REFERENCES catalog_type(id)
);

CREATE TABLE catalog_type_schema_attribute (
    catalog_type_id text,
    id text,
    arrays text,
    mode text,
    "name" text,
    "type" text,
    version text,
    PRIMARY KEY (catalog_type_id, id)
);

CREATE TABLE catalog_type_annotation (
    "name" text,
    catalog_type_id text,
    "value" text,
    PRIMARY KEY ("name", catalog_type_id),
    FOREIGN KEY (catalog_type_id) REFERENCES catalog_type(id)
);

CREATE TABLE catalog_type (
    id text,
    color text,
    created_at text,
    description text,
    external_type text,
    icon text,
    is_editable text,
    "name" text,
    ranked text,
    semantic_type text,
    type_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE catalog_entry_aliases (
    "index" text,
    catalog_entry_id text,
    aliases text,
    PRIMARY KEY ("index", catalog_entry_id),
    FOREIGN KEY (catalog_entry_id) REFERENCES catalog_entry(id)
);

CREATE TABLE catalog_entry (
    id text,
    catalog_type_id text,
    archived_at text,
    created_at text,
    external_id text,
    "name" text,
    rank text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (catalog_type_id) REFERENCES catalog_type(id)
);

CREATE TABLE catalog_entry_attribute_value (
    _fivetran_id text,
    attribute_id text,
    catalog_entry_id text,
    label text,
    literal text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (attribute_id) REFERENCES catalog_type_schema_attribute(id),
    FOREIGN KEY (catalog_entry_id) REFERENCES catalog_entry(id)
);

CREATE TABLE incident_role (
    id text,
    created_at text,
    description text,
    instructions text,
    "name" text,
    role_type text,
    shortform text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE alert_attribute (
    id text,
    alert_id text,
    is_array text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert (
    id text,
    alert_source_id text,
    created_at text,
    deduplication_key text,
    description text,
    resolved_at text,
    source_url text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (alert_source_id) REFERENCES alert_source(id)
);

CREATE TABLE alert_attribute_value (
    "index" text,
    alert_attribute_id text,
    alert_id text,
    catalog_entry_id text,
    catalog_type_id text,
    label text,
    literal text,
    PRIMARY KEY ("index", alert_attribute_id, alert_id),
    FOREIGN KEY (alert_attribute_id) REFERENCES alert_attribute(id),
    FOREIGN KEY (alert_id) REFERENCES alert_attribute(alert_id),
    FOREIGN KEY (catalog_entry_id) REFERENCES catalog_entry(id),
    FOREIGN KEY (catalog_type_id) REFERENCES catalog_type(id)
);

CREATE TABLE incident_update (
    id text,
    incident_id text,
    new_incident_status_id text,
    new_severity_id text,
    updater_user_id text,
    created_at text,
    message text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (new_incident_status_id) REFERENCES incident_status(id),
    FOREIGN KEY (new_severity_id) REFERENCES severity(id),
    FOREIGN KEY (updater_user_id) REFERENCES users(id)
);

CREATE TABLE incident_attachment (
    id text,
    incident_id text,
    resource_external_id text,
    resource_permalink text,
    resource_title text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE severity (
    id text,
    created_at text,
    description text,
    "name" text,
    rank text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field (
    id text,
    catalog_type_id text,
    created_at text,
    description text,
    field_type text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (catalog_type_id) REFERENCES catalog_type(id)
);

CREATE TABLE incident_timestamp (
    id text,
    "name" text,
    rank text,
    PRIMARY KEY (id)
);

CREATE TABLE follow_up_incident (
    id text,
    assignee_id text,
    incident_id text,
    completed_at text,
    created_at text,
    description text,
    priority_description text,
    priority_id text,
    priority_name text,
    priority_rank text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE escalation_event_channel (
    "index" text,
    escalation_event_id text,
    escalation_id text,
    microsoft_teams_channel_id text,
    microsoft_teams_team_id text,
    slack_channel_id text,
    slack_team_id text,
    PRIMARY KEY ("index", escalation_event_id, escalation_id),
    FOREIGN KEY (escalation_event_id) REFERENCES escalation_event(id),
    FOREIGN KEY (escalation_id) REFERENCES escalation_event(escalation_id)
);

CREATE TABLE escalation_event_user (
    escalation_event_id text,
    escalation_id text,
    id text,
    PRIMARY KEY (escalation_event_id, escalation_id, id),
    FOREIGN KEY (escalation_event_id) REFERENCES escalation_event(id),
    FOREIGN KEY (escalation_id) REFERENCES escalation_event(escalation_id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE escalation_event (
    id text,
    escalation_id text,
    event text,
    occurred_at text,
    urgency text,
    PRIMARY KEY (id, escalation_id),
    FOREIGN KEY (escalation_id) REFERENCES escalation(id)
);

CREATE TABLE escalation_related_alert (
    related_alert_id text,
    escalation_id text,
    id text,
    PRIMARY KEY (related_alert_id, escalation_id),
    FOREIGN KEY (escalation_id) REFERENCES escalation(id),
    FOREIGN KEY (id) REFERENCES alert(id)
);

CREATE TABLE escalation_related_incident (
    related_incident_id text,
    escalation_id text,
    id text,
    PRIMARY KEY (related_incident_id, escalation_id),
    FOREIGN KEY (escalation_id) REFERENCES escalation(id),
    FOREIGN KEY (id) REFERENCES incident(id)
);

CREATE TABLE escalation (
    id text,
    creator_alter_id text,
    creator_user_id text,
    creator_wrokflow_id text,
    created_at text,
    creator_alert_id text,
    escalation_path_id text,
    priority_name text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_alter_id) REFERENCES alert(id),
    FOREIGN KEY (creator_user_id) REFERENCES users(id),
    FOREIGN KEY (creator_wrokflow_id) REFERENCES workflow(id)
);

CREATE TABLE alert_route (
    id text,
    enabled text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_role_assignment (
    incident_id text,
    incident_role_id text,
    action_assignee_id text,
    PRIMARY KEY (incident_id, incident_role_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (incident_role_id) REFERENCES incident_role(id),
    FOREIGN KEY (action_assignee_id) REFERENCES users(id)
);

CREATE TABLE incident_timestamp_value (
    incident_id text,
    incident_timestamp_id text,
    "value" text,
    PRIMARY KEY (incident_id, incident_timestamp_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (incident_timestamp_id) REFERENCES incident_timestamp(id)
);

CREATE TABLE incident_custom_field_entry_value (
    _fivetran_id text,
    catalog_entry_id text,
    custom_field_id text,
    incident_id text,
    value_option_id text,
    value_link text,
    value_numeric text,
    value_text text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (catalog_entry_id) REFERENCES catalog_entry(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (value_option_id) REFERENCES custom_field_option(id)
);

CREATE TABLE incident (
    id text,
    creator_user_id text,
    incident_status_id text,
    incident_type_id text,
    severity_id text,
    call_url text,
    created_at text,
    external_issue_reference_issue_name text,
    external_issue_reference_issue_permalink text,
    external_issue_reference_provider text,
    mode text,
    "name" text,
    permalink text,
    postmortem_document_url text,
    reference text,
    slack_channel_id text,
    slack_channel_name text,
    slack_team_id text,
    summary text,
    updated_at text,
    visibility text,
    workload_minutes_late text,
    workload_minutes_sleeping text,
    workload_minutes_total text,
    workload_minutes_working text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_user_id) REFERENCES users(id),
    FOREIGN KEY (incident_status_id) REFERENCES incident_status(id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (severity_id) REFERENCES severity(id)
);
