CREATE TABLE business_service_subscriber (
    id text,
    business_service_id text,
    account_id text,
    subscriber_type text,
    PRIMARY KEY (id, business_service_id),
    FOREIGN KEY (business_service_id) REFERENCES business_service(id)
);

CREATE TABLE maintenance_window_service (
    maintenance_window_id text,
    service_id text,
    PRIMARY KEY (maintenance_window_id, service_id),
    FOREIGN KEY (maintenance_window_id) REFERENCES maintenance_window(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE maintenance_window_team (
    maintenance_window_id text,
    team_id text,
    PRIMARY KEY (maintenance_window_id, team_id),
    FOREIGN KEY (maintenance_window_id) REFERENCES maintenance_window(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE maintenance_window (
    id text,
    created_by_id text,
    description text,
    end_time text,
    html_url text,
    sequence_number text,
    start_time text,
    summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id)
);

CREATE TABLE escalation_policy_target (
    id text,
    escalation_policy_rule_id text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, escalation_policy_rule_id),
    FOREIGN KEY (escalation_policy_rule_id) REFERENCES escalation_policy_rule(id)
);

CREATE TABLE escalation_policy_rule (
    id text,
    escalation_policy_id text,
    escalation_delay_in_minutes text,
    PRIMARY KEY (id, escalation_policy_id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id)
);

CREATE TABLE escalation_policy_service (
    escalation_policy_id text,
    service_id text,
    PRIMARY KEY (escalation_policy_id, service_id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE escalation_policy_team (
    escalation_policy_id text,
    team_id text,
    PRIMARY KEY (escalation_policy_id, team_id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE escalation_policy (
    id text,
    description text,
    html_url text,
    "name" text,
    num_loops text,
    on_call_handoff_notifications text,
    privilege text,
    summary text,
    PRIMARY KEY (id)
);

CREATE TABLE notification (
    id text,
    user_id text,
    address text,
    started_at text,
    "type" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE incident_custom_field_value (
    id text,
    incident_id text,
    data_type text,
    description text,
    display_name text,
    enabled text,
    field_type text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE extension_schema_option (
    _fivetran_id text,
    extension_schema_id text,
    label text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (extension_schema_id) REFERENCES extension_schema(id)
);

CREATE TABLE extension_schema_send_type (
    _fivetran_id text,
    extension_schema_id text,
    send_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (extension_schema_id) REFERENCES extension_schema(id)
);

CREATE TABLE extension_feature (
    "name" text,
    extension_schema_id text,
    PRIMARY KEY ("name", extension_schema_id),
    FOREIGN KEY (extension_schema_id) REFERENCES extension_schema(id)
);

CREATE TABLE extension_schema (
    id text,
    addon_id text,
    authorizable text,
    buttons jsonb,
    config_snow_password_encrypted text,
    config_snow_password_label text,
    config_snow_password_type text,
    config_snow_user_label text,
    config_sync_options_defaults text,
    config_sync_options_help_tip text,
    config_sync_options_label text,
    config_sync_options_type text,
    config_target_label text,
    config_target_placeholder text,
    description text,
    guide_url text,
    html_url text,
    icon_url text,
    "key" text,
    label text,
    logo_url text,
    summary text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (addon_id) REFERENCES addon(id)
);

CREATE TABLE ruleset_routing_key (
    routing_key text,
    ruleset_id text,
    PRIMARY KEY (routing_key, ruleset_id),
    FOREIGN KEY (ruleset_id) REFERENCES ruleset(id)
);

CREATE TABLE ruleset (
    id text,
    creator_id text,
    team_id text,
    updater_id text,
    created_at text,
    creator_type text,
    "name" text,
    "type" text,
    updated_at text,
    updater_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updater_id) REFERENCES users(id)
);

CREATE TABLE business_service (
    id text,
    team_id text,
    description text,
    html_url text,
    "name" text,
    point_of_contact text,
    summary text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE users_contact_method (
    id text,
    users_id text,
    address text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_notification_rule (
    id text,
    users_id text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_team (
    team_id text,
    users_id text,
    PRIMARY KEY (team_id, users_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    avatar_url text,
    billed text,
    color text,
    coordinated_incidents text,
    description text,
    email text,
    html_url text,
    invitation_sent text,
    job_title text,
    "name" text,
    "role" text,
    summary text,
    time_zone text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    html_url text,
    label text,
    summary text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE license_valid_role (
    valid_role text,
    license_id text,
    PRIMARY KEY (valid_role, license_id),
    FOREIGN KEY (license_id) REFERENCES license(id)
);

CREATE TABLE license (
    id text,
    allocations_available text,
    current_value text,
    description text,
    html_url text,
    "name" text,
    role_group text,
    summary text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE template (
    id text,
    created_by_id text,
    updated_by_id text,
    created_at text,
    created_by_type text,
    description text,
    "name" text,
    template_type text,
    updated_at text,
    updated_by_type text,
    PRIMARY KEY (id, created_by_id, updated_by_id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE extension_object (
    id text,
    extension_id text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE extension (
    id text,
    extension_schema_id text,
    endpoint_url text,
    "name" text,
    summary text,
    "type" text,
    PRIMARY KEY (id, extension_schema_id),
    FOREIGN KEY (extension_schema_id) REFERENCES extension_schema(id)
);

CREATE TABLE addon (
    id text,
    html_url text,
    "name" text,
    src text,
    summary text,
    PRIMARY KEY (id)
);

CREATE TABLE on_call (
    _fivetran_id text,
    escalation_policy_id text,
    schedule_id text,
    user_id text,
    ends text,
    escalation_level text,
    "start" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE vendor (
    id text,
    alert_creation_default text,
    alert_creation_editable text,
    connectable text,
    description text,
    developer_name text,
    documentation_url text,
    emits_change_events text,
    generic_service_type text,
    html_url text,
    integration_guide_url text,
    is_pd_cef text,
    is_pd_change_event text,
    logo_url text,
    long_name text,
    "name" text,
    summary text,
    support_email text,
    support_portal text,
    thumbnail_url text,
    "type" text,
    website_url text,
    PRIMARY KEY (id)
);

CREATE TABLE analytics_metric_service (
    range_start text,
    aggregate_unit text,
    created_at_end text,
    created_at_start text,
    mean_assignment_count text,
    mean_engaged_seconds text,
    mean_engaged_user_count text,
    mean_seconds_to_engage text,
    mean_seconds_to_first_ack text,
    mean_seconds_to_mobilize text,
    mean_seconds_to_resolve text,
    mean_user_defined_engaged_seconds text,
    total_business_hour_interruptions text,
    total_down_time_minutes text,
    total_engaged_seconds text,
    total_escalation_count text,
    total_high_urgency_incidents text,
    total_incident_count text,
    total_incidents_acknowledged text,
    total_incidents_auto_resolved text,
    total_incidents_escalated text,
    total_incidents_manual_escalated text,
    total_incidents_reassigned text,
    total_incidents_timeout_escalated text,
    total_interruptions text,
    total_low_urgency_incidents text,
    total_major_incidents text,
    total_notifications text,
    total_off_hour_interruptions text,
    total_sleep_hour_interruptions text,
    total_snoozed_seconds text,
    total_user_defined_engaged_seconds text,
    up_time_pct text,
    PRIMARY KEY (range_start)
);

CREATE TABLE audit_record_actor (
    id text,
    audit_record_id text,
    summary text,
    "type" text,
    PRIMARY KEY (id, audit_record_id),
    FOREIGN KEY (audit_record_id) REFERENCES audit_record(id)
);

CREATE TABLE audit_record_field (
    _fivetran_id text,
    audit_record_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (audit_record_id) REFERENCES audit_record(id)
);

CREATE TABLE reference_removed (
    id text,
    reference_id text,
    summary text,
    "type" text,
    PRIMARY KEY (id, reference_id),
    FOREIGN KEY (reference_id) REFERENCES reference("name")
);

CREATE TABLE reference_added (
    id text,
    reference_id text,
    summary text,
    "type" text,
    PRIMARY KEY (id, reference_id),
    FOREIGN KEY (reference_id) REFERENCES reference("name")
);

CREATE TABLE reference (
    "name" text,
    audit_record_id text,
    PRIMARY KEY ("name", audit_record_id),
    FOREIGN KEY (audit_record_id) REFERENCES audit_record(id)
);

CREATE TABLE audit_record (
    id text,
    "action" text,
    details_resource_id text,
    details_resource_summary text,
    details_resource_type text,
    execution_context_remote_address text,
    execution_context_request_id text,
    execution_time text,
    method_description text,
    method_truncated_token text,
    method_type text,
    root_resource_id text,
    root_resource_summary text,
    root_resource_type text,
    PRIMARY KEY (id)
);

CREATE TABLE users_session (
    id text,
    user_id text,
    created_at text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE change_event_service (
    change_event_id text,
    service_id text,
    "type" text,
    PRIMARY KEY (change_event_id, service_id),
    FOREIGN KEY (change_event_id) REFERENCES change_event(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE change_event (
    id text,
    custom_details_build_number text,
    custom_details_build_state text,
    custom_details_run_time text,
    integration_id text,
    integration_type text,
    "source" text,
    summary text,
    time_stamp text,
    PRIMARY KEY (id)
);

CREATE TABLE raw_incident_response (
    responder_id text,
    id text,
    incident_created_at text,
    incident_number text,
    incident_priority_id text,
    incident_priority_name text,
    incident_priority_order text,
    incident_type_id text,
    incident_urgency text,
    mean_time_to_acknowledge_seconds text,
    responder_name text,
    service_id text,
    service_name text,
    total_acknowledgements text,
    total_business_hour_interruptions text,
    total_engaged_seconds text,
    total_interruptions text,
    total_manual_escalations_from text,
    total_manual_escalations_to text,
    total_off_hour_interruptions text,
    total_reassignments_from text,
    total_reassignments_to text,
    total_sleep_hour_interruptions text,
    total_timeout_escalations_from text,
    total_timeout_escalations_to text,
    PRIMARY KEY (responder_id, id),
    FOREIGN KEY (id) REFERENCES raw_incident(id)
);

CREATE TABLE paused_incident_resolved_after_pause_alert (
    id text,
    _fivetran_id text,
    service_id text,
    created_at text,
    PRIMARY KEY (id, _fivetran_id, service_id),
    FOREIGN KEY (_fivetran_id) REFERENCES paused_incident_reporting_alert(_fivetran_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE paused_incident_triggered_after_pause_alert (
    id text,
    _fivetran_id text,
    service_id text,
    created_at text,
    PRIMARY KEY (id, _fivetran_id, service_id),
    FOREIGN KEY (_fivetran_id) REFERENCES paused_incident_reporting_alert(_fivetran_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE paused_incident_reporting_alert (
    _fivetran_id text,
    since text,
    until text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE team (
    id text,
    default_role text,
    description text,
    html_url text,
    "name" text,
    parent text,
    summary text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_workflow_team (
    id text,
    incident_workflow_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_workflow_id) REFERENCES incident_workflow(id)
);

CREATE TABLE action_input (
    "index" text,
    incident_workflow_action_id text,
    "name" text,
    parameter_type text,
    "value" text,
    PRIMARY KEY ("index", incident_workflow_action_id),
    FOREIGN KEY (incident_workflow_action_id) REFERENCES incident_workflow_action(id)
);

CREATE TABLE action_output (
    "index" text,
    incident_workflow_action_id text,
    "name" text,
    parameter_type text,
    "value" text,
    PRIMARY KEY ("index", incident_workflow_action_id),
    FOREIGN KEY (incident_workflow_action_id) REFERENCES incident_workflow_action(id)
);

CREATE TABLE incident_workflow_action (
    id text,
    incident_workflow_step_id text,
    description text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_workflow_step_id) REFERENCES incident_workflow_step(id)
);

CREATE TABLE incident_workflow_step (
    id text,
    incident_workflow_id text,
    description text,
    html_url text,
    "name" text,
    summary text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_workflow_id) REFERENCES incident_workflow(id)
);

CREATE TABLE incident_workflow (
    id text,
    created_at text,
    description text,
    html_url text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE schedule_escalation_policy (
    escalation_policy_id text,
    schedule_id text,
    PRIMARY KEY (escalation_policy_id, schedule_id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_users (
    schedule_id text,
    user_id text,
    PRIMARY KEY (schedule_id, user_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE schedule (
    id text,
    description text,
    html_url text,
    "name" text,
    summary text,
    time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE raw_incident_assigned_user_id (
    assigned_user_id text,
    raw_incident_id text,
    PRIMARY KEY (assigned_user_id, raw_incident_id),
    FOREIGN KEY (raw_incident_id) REFERENCES raw_incident(id)
);

CREATE TABLE raw_incident_assigned_user_name (
    assigned_user_name text,
    raw_incident_id text,
    PRIMARY KEY (assigned_user_name, raw_incident_id),
    FOREIGN KEY (raw_incident_id) REFERENCES raw_incident(id)
);

CREATE TABLE raw_incident_acknowledged_user_name (
    acknowledged_user_name text,
    raw_incident_id text,
    PRIMARY KEY (acknowledged_user_name, raw_incident_id),
    FOREIGN KEY (raw_incident_id) REFERENCES raw_incident(id)
);

CREATE TABLE raw_incident_acknowledged_user_id (
    acknowledged_user_id text,
    raw_incident_id text,
    PRIMARY KEY (acknowledged_user_id, raw_incident_id),
    FOREIGN KEY (raw_incident_id) REFERENCES raw_incident(id)
);

CREATE TABLE raw_incident (
    id text,
    team_id text,
    acknowledgement_count text,
    active_user_count text,
    assignment_count text,
    auto_resolved text,
    business_hour_interruptions text,
    created_at text,
    description text,
    engaged_seconds text,
    engaged_user_count text,
    escalation_count text,
    escalation_policy_id text,
    escalation_policy_name text,
    incident_number text,
    incident_type_id text,
    incident_type_name text,
    major text,
    major_incident text,
    manual_escalation_count text,
    off_hour_interruptions text,
    pd_advance_used text,
    priority_id text,
    priority_name text,
    priority_order text,
    reassignment_count text,
    resolved_at text,
    resolved_by_user_id text,
    resolved_by_user_name text,
    seconds_to_engage text,
    seconds_to_first_ack text,
    seconds_to_mobilize text,
    seconds_to_resolve text,
    service_id text,
    service_name text,
    sleep_hour_interruptions text,
    snoozed_seconds text,
    "status" text,
    timeout_escalation_count text,
    total_interruptions text,
    total_notifications text,
    updated_at text,
    urgency text,
    user_defined_effort_seconds text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE tag_entity (
    tags_id text,
    team_id text,
    "type" text,
    PRIMARY KEY (tags_id, team_id),
    FOREIGN KEY (tags_id) REFERENCES tags(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE users_notification_subscription (
    id text,
    users_id text,
    account_id text,
    subscribable_id text,
    subscribable_name text,
    subscribable_type text,
    subscriber_type text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE service_team (
    service_id text,
    team_id text,
    PRIMARY KEY (service_id, team_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE service_days_of_week (
    _fivetran_id text,
    service_id text,
    days_of_week text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_integration (
    id text,
    service_id text,
    html_url text,
    summary text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_scheduled_action (
    _fivetran_id text,
    service_id text,
    at_name text,
    at_type text,
    to_urgency text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service (
    id text,
    escalation_policy_id text,
    acknowledgement_timeout text,
    alert_creation text,
    alert_grouping text,
    alert_grouping_parameters_config_recommended_time_window text,
    alert_grouping_parameters_config_time_window text,
    alert_grouping_parameters_type text,
    auto_grouping text,
    auto_grouping_timeout text,
    auto_pause_notifications_parameters_enabled text,
    auto_pause_notifications_parameters_timeout text,
    auto_resolve_timeout text,
    created_at text,
    description text,
    html_url text,
    "name" text,
    response_play text,
    "status" text,
    summary text,
    support_hours_end_time text,
    support_hours_start_time text,
    support_hours_time_zone text,
    support_hours_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id)
);

CREATE TABLE event_orchestration (
    id text,
    created_by_id text,
    team_id text,
    updated_by_id text,
    created_at text,
    created_by_type text,
    description text,
    "name" text,
    routes text,
    updated_at text,
    updated_by_type text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE users_handoff_notification_rule (
    id text,
    users_id text,
    contact_method_id text,
    contact_method_summary text,
    contact_method_type text,
    handoff_type text,
    notify_advance_in_minutes text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE incident_team (
    incident_id text,
    team_id text,
    PRIMARY KEY (incident_id, team_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident (
    id text,
    escalation_policy_id text,
    service_id text,
    acknowledgements jsonb,
    alert_counts_all text,
    alert_counts_resolved text,
    alert_counts_triggered text,
    alert_grouping_active text,
    alert_grouping_ended_at text,
    alert_grouping_started_at text,
    alerts_grouping_type text,
    assigned_via text,
    assignments jsonb,
    basic_alert_grouping_expires_at text,
    body_details jsonb,
    conference_bridge_conference_number text,
    conference_bridge_conference_url text,
    created_at text,
    first_trigger_log_entry_html_url text,
    first_trigger_log_entry_id text,
    first_trigger_log_entry_summary text,
    html_url text,
    incident_key text,
    incident_number text,
    incident_type_name text,
    is_basic_alert_grouping text,
    last_status_change_at text,
    last_status_change_by_html_url text,
    last_status_change_by_id text,
    last_status_change_by_summary text,
    priority_account_id text,
    priority_color text,
    priority_created_at text,
    priority_description text,
    priority_html_url text,
    priority_id text,
    priority_name text,
    priority_order text,
    priority_schema_version text,
    priority_self text,
    priority_summary text,
    priority_type text,
    priority_updated_at text,
    "status" text,
    summary text,
    title text,
    urgency text,
    PRIMARY KEY (id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE log_entry_team (
    id text,
    log_entries_id text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, log_entries_id),
    FOREIGN KEY (log_entries_id) REFERENCES log_entries(id)
);

CREATE TABLE log_entry_assignee (
    id text,
    log_entries_id text,
    html_url text,
    summary text,
    "type" text,
    PRIMARY KEY (id, log_entries_id),
    FOREIGN KEY (log_entries_id) REFERENCES log_entries(id)
);

CREATE TABLE log_entries (
    id text,
    escalation_policy_id text,
    incident_id text,
    responder_id text,
    service_id text,
    user_id text,
    agent_html_url text,
    agent_id text,
    agent_summary text,
    agent_type text,
    channel_changeset_application_fields_id text,
    channel_changeset_application_fields_name text,
    channel_changeset_application_fields_namespace text,
    channel_changeset_application_fields_old_value text,
    channel_changeset_application_fields_value text,
    channel_changeset_customer_fields_id text,
    channel_changeset_customer_fields_name text,
    channel_changeset_customer_fields_namespace text,
    channel_changeset_customer_fields_old_value text,
    channel_changeset_customer_fields_value text,
    channel_notification_address text,
    channel_notification_conference_address text,
    channel_notification_status text,
    channel_notification_type text,
    channel_type text,
    contexts jsonb,
    created_at text,
    event_details_description text,
    html_url text,
    summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (escalation_policy_id) REFERENCES escalation_policy(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (responder_id) REFERENCES users(id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
