CREATE TABLE ticket_project_field_map_body_case (
    "index" text,
    ticket_project_field_map_body_index text,
    ticket_project_id text,
    external_value text,
    external_value_attribute text,
    external_value_presentation text,
    external_value_type text,
    -- logic_* (dynamic column),
    PRIMARY KEY ("index", ticket_project_field_map_body_index, ticket_project_id),
    FOREIGN KEY (ticket_project_field_map_body_index) REFERENCES ticket_project_field_map_body("index"),
    FOREIGN KEY (ticket_project_id) REFERENCES ticket_project_field_map_body(ticket_project_id)
);

CREATE TABLE ticket_project_field_map_body (
    "index" text,
    ticket_project_id text,
    else_external_value_attribute text,
    else_external_value_presentation text,
    else_external_value_type text,
    else_external_value_value text,
    external_field text,
    external_value text,
    external_value_attribute text,
    external_value_presentation text,
    external_value_type text,
    strategy text,
    user_data jsonb,
    PRIMARY KEY ("index", ticket_project_id),
    FOREIGN KEY (ticket_project_id) REFERENCES ticket_project(id)
);

CREATE TABLE ticket_project (
    id text,
    config_connection_id text,
    config_connection_type text,
    config_details jsonb,
    config_id text,
    config_ticketing_project_id text,
    config_ticketing_project_name text,
    connection_slug text,
    field_map text,
    field_map_connection_id text,
    field_map_connection_type text,
    field_map_id text,
    field_map_ticketing_project_id text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field (
    id text,
    description text,
    display_name text,
    field_type text,
    permissible_value text,
    required text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_change_event_attachment (
    change_event_attachment text,
    incident_id text,
    related_change_on_incident_id text,
    PRIMARY KEY (change_event_attachment, incident_id, related_change_on_incident_id),
    FOREIGN KEY (incident_id) REFERENCES related_change_on_incident(incident_id),
    FOREIGN KEY (related_change_on_incident_id) REFERENCES related_change_on_incident(id)
);

CREATE TABLE incident_change_event_environment (
    environment_id text,
    incident_id text,
    related_change_on_incident_id text,
    PRIMARY KEY (environment_id, incident_id, related_change_on_incident_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (incident_id) REFERENCES related_change_on_incident(incident_id),
    FOREIGN KEY (related_change_on_incident_id) REFERENCES related_change_on_incident(id)
);

CREATE TABLE incident_event_related_change (
    id text,
    incident_id text,
    related_change_on_incident_id text,
    created_at text,
    description text,
    summary text,
    updated_at text,
    -- label_* (dynamic column),
    PRIMARY KEY (id, incident_id, related_change_on_incident_id),
    FOREIGN KEY (incident_id) REFERENCES related_change_on_incident(incident_id),
    FOREIGN KEY (related_change_on_incident_id) REFERENCES related_change_on_incident(id)
);

CREATE TABLE incident_change_event_identity (
    id text,
    incident_id text,
    related_change_on_incident_id text,
    change_id text,
    created_at text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, incident_id, related_change_on_incident_id),
    FOREIGN KEY (incident_id) REFERENCES related_change_on_incident(incident_id),
    FOREIGN KEY (related_change_on_incident_id) REFERENCES related_change_on_incident(id)
);

CREATE TABLE incident_change_event_author (
    id text,
    incident_id text,
    related_change_on_incident_id text,
    email text,
    "name" text,
    "source" text,
    PRIMARY KEY (id, incident_id, related_change_on_incident_id),
    FOREIGN KEY (incident_id) REFERENCES related_change_on_incident(incident_id),
    FOREIGN KEY (related_change_on_incident_id) REFERENCES related_change_on_incident(id)
);

CREATE TABLE incident_change_event_service (
    incident_id text,
    related_change_on_incident_id text,
    service_id text,
    PRIMARY KEY (incident_id, related_change_on_incident_id, service_id),
    FOREIGN KEY (incident_id) REFERENCES related_change_on_incident(incident_id),
    FOREIGN KEY (related_change_on_incident_id) REFERENCES related_change_on_incident(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE related_change_on_incident (
    id text,
    incident_id text,
    change_event_id text,
    created_at text,
    created_by_email text,
    created_by_id text,
    created_by_name text,
    created_by_source text,
    "type" text,
    updated_at text,
    why text,
    -- change_event_label_* (dynamic column),
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE contributing_factor_conversation (
    id text,
    contributing_factor_id text,
    channel_name text,
    comments_url text,
    field text,
    resource_class text,
    resource_id text,
    PRIMARY KEY (id, contributing_factor_id),
    FOREIGN KEY (contributing_factor_id) REFERENCES contributing_factor(id)
);

CREATE TABLE contributing_factor (
    id text,
    post_mortem_report_id text,
    created_by_email text,
    created_by_id text,
    created_by_name text,
    created_by_source text,
    "position" text,
    summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (post_mortem_report_id) REFERENCES post_mortem_report(id)
);

CREATE TABLE severity_matrix_impact (
    id text,
    affects_id text,
    "name" text,
    "position" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    "name" text,
    slack_linked text,
    slack_user_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE severity (
    _fivetran_id text,
    color text,
    created_at text,
    description text,
    "position" text,
    slug text,
    system_record text,
    "type" text,
    updated_at text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE incident_alert_environment (
    environment_id text,
    incident_alert_id text,
    PRIMARY KEY (environment_id, incident_alert_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (incident_alert_id) REFERENCES incident_alert(id)
);

CREATE TABLE incident_alert_service (
    incident_alert_id text,
    service_id text,
    PRIMARY KEY (incident_alert_id, service_id),
    FOREIGN KEY (incident_alert_id) REFERENCES incident_alert(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE incident_alert (
    id text,
    alert_team_id text,
    incident_id text,
    signal_rule_team_id text,
    alert_description text,
    alert_duration_iso_8601 text,
    alert_duration_ms text,
    alert_ends_at text,
    alert_id text,
    alert_integration_name text,
    alert_priority text,
    alert_remote_id text,
    alert_remote_url text,
    alert_signal_id text,
    alert_signal_rule text,
    alert_signal_rule_created_at text,
    alert_signal_rule_created_by text,
    alert_signal_rule_created_by_email text,
    alert_signal_rule_created_by_id text,
    alert_signal_rule_created_by_name text,
    alert_signal_rule_created_by_source text,
    alert_signal_rule_expression text,
    alert_signal_rule_id text,
    alert_signal_rule_name text,
    alert_signal_rule_target_id text,
    alert_signal_rule_target_name text,
    alert_signal_rule_target_type text,
    alert_signal_rule_team_id text,
    alert_signal_rule_updated_at text,
    alert_source_icon text,
    alert_starts_at text,
    alert_status text,
    alert_summary text,
    alert_team_name text,
    primarys text,
    -- label_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (alert_team_id) REFERENCES team(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (signal_rule_team_id) REFERENCES team(id)
);

CREATE TABLE status_page (
    id text,
    incident_id text,
    integration_id text,
    external_id text,
    "name" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_connection_detail_allowed_modal_field (
    "index" text,
    integration_connection_id text,
    allowed_modal_field text,
    PRIMARY KEY ("index", integration_connection_id),
    FOREIGN KEY (integration_connection_id) REFERENCES integration_connection(id)
);

CREATE TABLE integration_connection (
    id text,
    integration_id text,
    authorized_by text,
    authorized_by_id text,
    configuration_url text,
    created_at text,
    default_authorized_actor_email text,
    default_authorized_actor_id text,
    default_authorized_actor_name text,
    default_authorized_actor_source text,
    detail_alerts_channel_name text,
    detail_allowed_modal_fields text,
    detail_default_workspace_id text,
    detail_default_workspace_name text,
    detail_follow_up_event_emojis text,
    detail_modal_fields text,
    detail_new_incident_view_type text,
    detail_starred_confirmation text,
    detail_starred_event_emojis text,
    detail_task_event_emojis text,
    detail_team_domain text,
    detail_thread_broadcast text,
    detail_tutorial_enabled text,
    display_name text,
    integration_slug text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE incident_impacted_infrastructure_customer (
    id text,
    incident_id text,
    infrastructure_id text,
    infrastructure_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_tag (
    _fivetran_id text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE incident_conference_bridge (
    id text,
    incident_id text,
    is_archived text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident (
    id text,
    created_by_id text,
    severity_condition_id text,
    ticket_created_by_id text,
    ticket_id text,
    active text,
    channel_id text,
    channel_name text,
    channel_reference text,
    channel_status text,
    context_object_description text,
    context_object_id text,
    context_object_tag text,
    context_object_type text,
    created_at text,
    created_by_source text,
    current_milestone text,
    customer_impact_summary text,
    customers_impacted text,
    description text,
    discarded_at text,
    incident_url text,
    is_archived text,
    last_note_body text,
    last_note_conversations text,
    last_note_created_at text,
    last_note_id text,
    last_update text,
    link_deletable text,
    link_display_text text,
    link_editable text,
    link_href_url text,
    link_icon_url text,
    link_id text,
    link_type text,
    monetary_impact text,
    monetary_impact_cents text,
    "name" text,
    number text,
    organization_id text,
    organization_name text,
    priority text,
    private_id text,
    private_status_page_url text,
    report_id text,
    restricted text,
    severity text,
    severity_color text,
    severity_condition text,
    severity_impact text,
    severity_impact_object_affects_id text,
    severity_impact_object_id text,
    severity_impact_object_name text,
    severity_impact_object_position text,
    severity_impact_object_type text,
    started_at text,
    summary text,
    ticket_created_by_source text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (severity_condition_id) REFERENCES severity_matrix_condition(id),
    FOREIGN KEY (ticket_created_by_id) REFERENCES users(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE incident_service (
    incident_id text,
    service_id text,
    is_archived text,
    PRIMARY KEY (incident_id, service_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE incident_role_assignment (
    id text,
    incident_id text,
    incident_role_id text,
    user_id text,
    created_at text,
    is_archived text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (incident_role_id) REFERENCES incident_role(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE incident_environment (
    environment_id text,
    incident_id text,
    is_archived text,
    PRIMARY KEY (environment_id, incident_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_ticket (
    incident_id text,
    ticket_id text,
    is_archived text,
    PRIMARY KEY (incident_id, ticket_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE incident_team_assignment (
    id text,
    incident_id text,
    team_id text,
    created_at text,
    is_archived text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_tag_list (
    tag_list text,
    incident_id text,
    is_archived text,
    PRIMARY KEY (tag_list, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_conference_bridge_attachment (
    attachment text,
    incident_id text,
    incident_conference_bridge_id text,
    is_archived text,
    PRIMARY KEY (attachment, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident_conference_bridge(incident_id),
    FOREIGN KEY (incident_conference_bridge_id) REFERENCES incident_conference_bridge(id)
);

CREATE TABLE incident_milestone (
    id text,
    incident_id text,
    created_at text,
    duration text,
    is_archived text,
    occurred_at text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_last_note_status_page (
    incident_id text,
    last_note_status_page_id text,
    integration_id text,
    is_archived text,
    PRIMARY KEY (incident_id, last_note_status_page_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (last_note_status_page_id) REFERENCES status_page(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE incident_custom_field (
    id text,
    incident_id text,
    description text,
    is_archived text,
    "name" text,
    value_array text,
    value_string text,
    value_type text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_impact (
    incident_id text,
    impact_id text,
    id text,
    severity_matrix_condition_id text,
    is_archived text,
    PRIMARY KEY (incident_id, impact_id),
    FOREIGN KEY (impact_id) REFERENCES severity_matrix_impact(id),
    FOREIGN KEY (id) REFERENCES incident(id),
    FOREIGN KEY (severity_matrix_condition_id) REFERENCES severity_matrix_condition(id)
);

CREATE TABLE incident_channel (
    incident_id text,
    id text,
    icon_url text,
    is_archived text,
    "name" text,
    "source" text,
    source_id text,
    source_name text,
    "status" text,
    url text,
    PRIMARY KEY (incident_id, id),
    FOREIGN KEY (id) REFERENCES incident(id)
);

CREATE TABLE incident_impact_conversation (
    id text,
    incident_id text,
    incident_impact_id text,
    channel_name text,
    comments_url text,
    field text,
    is_archived text,
    resource_class text,
    resource_id text,
    PRIMARY KEY (id, incident_id, incident_impact_id),
    FOREIGN KEY (incident_id) REFERENCES incident_impact(incident_id),
    FOREIGN KEY (incident_impact_id) REFERENCES incident_impact(impact_id)
);

CREATE TABLE incident_functionality (
    functionality_id text,
    incident_id text,
    is_archived text,
    PRIMARY KEY (functionality_id, incident_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_status_page (
    incident_id text,
    status_page_id text,
    is_archived text,
    PRIMARY KEY (incident_id, status_page_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (status_page_id) REFERENCES status_page(id)
);

CREATE TABLE incident_conversation (
    id text,
    incident_id text,
    channel_name text,
    comments_url text,
    field text,
    is_archived text,
    resource_class text,
    resource_id text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_last_note_conversation (
    last_note_conversation_id text,
    incident_id text,
    channel_name text,
    comments_url text,
    field text,
    is_archived text,
    resource_class text,
    resource_id text,
    PRIMARY KEY (last_note_conversation_id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_retro_export (
    retro_export text,
    incident_id text,
    is_archived text,
    PRIMARY KEY (retro_export, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE user_metric_bucket (
    ends_at text,
    starts_at text,
    metrics_total_incident_count text,
    metrics_total_time_spent text,
    metrics_total_user_count text,
    PRIMARY KEY (ends_at, starts_at)
);

CREATE TABLE incident_impacted_infrastructure_functionality (
    id text,
    incident_id text,
    infrastructure_id text,
    infrastructure_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE ticket_tag_list (
    "index" text,
    ticket_id text,
    tag_list text,
    PRIMARY KEY ("index", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_assignee (
    id text,
    ticket_id text,
    email text,
    "name" text,
    "source" text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_attachment (
    id text,
    ticket_id text,
    deletable text,
    display_text text,
    editable text,
    href_url text,
    icon_url text,
    "type" text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    incident_id text,
    created_at text,
    created_by_email text,
    created_by_id text,
    created_by_name text,
    created_by_source text,
    description text,
    link_deletable text,
    link_display_text text,
    link_editable text,
    link_href_url text,
    link_icon_url text,
    link_id text,
    link_type text,
    priority_created_at text,
    priority_id text,
    priority_name text,
    priority_position text,
    priority_updated_at text,
    "state" text,
    summary text,
    tag_list jsonb,
    task_id text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE team_owned_functionality (
    team_id text,
    team_owned_functionality_id text,
    PRIMARY KEY (team_id, team_owned_functionality_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (team_owned_functionality_id) REFERENCES functionality(id)
);

CREATE TABLE team_owned_service (
    team_id text,
    team_owned_service_id text,
    PRIMARY KEY (team_id, team_owned_service_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (team_owned_service_id) REFERENCES service(id)
);

CREATE TABLE team_functionalitity (
    functionality_id text,
    team_id text,
    PRIMARY KEY (functionality_id, team_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_owned_checklist_template_check (
    id text,
    team_id text,
    team_owned_checklist_template_id text,
    description text,
    "name" text,
    "status" text,
    PRIMARY KEY (id, team_id, team_owned_checklist_template_id),
    FOREIGN KEY (team_id) REFERENCES team_owned_checklist_template(team_id),
    FOREIGN KEY (team_owned_checklist_template_id) REFERENCES team_owned_checklist_template(id)
);

CREATE TABLE team_owned_checklist_template_owner (
    id text,
    team_id text,
    team_owned_checklist_template_id text,
    PRIMARY KEY (id, team_id, team_owned_checklist_template_id),
    FOREIGN KEY (id) REFERENCES team(id),
    FOREIGN KEY (team_id) REFERENCES team_owned_checklist_template(team_id),
    FOREIGN KEY (team_owned_checklist_template_id) REFERENCES team_owned_checklist_template(id)
);

CREATE TABLE team_owned_checklist_template_connected_service (
    service_id text,
    team_id text,
    team_owned_checklist_template_id text,
    PRIMARY KEY (service_id, team_id, team_owned_checklist_template_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (team_id) REFERENCES team_owned_checklist_template(team_id),
    FOREIGN KEY (team_owned_checklist_template_id) REFERENCES team_owned_checklist_template(id)
);

CREATE TABLE team_owned_checklist_template (
    id text,
    team_id text,
    created_at text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_membership (
    _fivetran_id text,
    default_incident_role_id text,
    schedule_id text,
    team_id text,
    user_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (default_incident_role_id) REFERENCES incident_role(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_owned_runbook (
    runbook_id text,
    team_id text,
    PRIMARY KEY (runbook_id, team_id),
    FOREIGN KEY (runbook_id) REFERENCES runbook(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_responding_service (
    responding_service_id text,
    team_id text,
    PRIMARY KEY (responding_service_id, team_id),
    FOREIGN KEY (responding_service_id) REFERENCES service(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_service (
    service_id text,
    team_id text,
    PRIMARY KEY (service_id, team_id),
    FOREIGN KEY (service_id) REFERENCES service(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    description text,
    "name" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_type_template_tag_list (
    "index" text,
    incident_type_id text,
    tag_list text,
    PRIMARY KEY ("index", incident_type_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type_template_runbook (
    incident_type_id text,
    runbook_id text,
    PRIMARY KEY (incident_type_id, runbook_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (runbook_id) REFERENCES runbook(id)
);

CREATE TABLE incident_type_template_team (
    incident_type_id text,
    team_id text,
    PRIMARY KEY (incident_type_id, team_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_type_template_impact (
    condition_id text,
    id text,
    incident_type_id text,
    condition_name text,
    "name" text,
    "type" text,
    PRIMARY KEY (condition_id, id, incident_type_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type_template_value_service (
    incident_type_id text,
    service_id text,
    PRIMARY KEY (incident_type_id, service_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE incident_type_template_value_functionality (
    functionality_id text,
    incident_type_id text,
    PRIMARY KEY (functionality_id, incident_type_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type_template_value_environment (
    environment_id text,
    incident_type_id text,
    PRIMARY KEY (environment_id, incident_type_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id)
);

CREATE TABLE incident_type_template_value_team (
    incident_type_id text,
    team_id text,
    PRIMARY KEY (incident_type_id, team_id),
    FOREIGN KEY (incident_type_id) REFERENCES incident_type(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_type (
    id text,
    created_at text,
    "name" text,
    template_custom_fields text,
    template_customer_impact_summary text,
    template_description text,
    template_impacts text,
    template_priority text,
    template_private_incident text,
    template_severity text,
    template_summary text,
    template_value_runbook jsonb,
    updated_at text,
    -- template_label_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE incident_impacted_infrastructure_service (
    id text,
    incident_id text,
    infrastructure_id text,
    infrastructure_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_metric_bucket (
    ends_at text,
    starts_at text,
    metrics_total_count text,
    metrics_total_mtta text,
    metrics_total_mttd text,
    metrics_total_mttm text,
    metrics_total_mttr text,
    metrics_total_total_time text,
    PRIMARY KEY (ends_at, starts_at)
);

CREATE TABLE functionality_service (
    functionality_id text,
    service_id text,
    PRIMARY KEY (functionality_id, service_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE functionality_link (
    id text,
    functionality_id text,
    href_url text,
    icon_url text,
    "name" text,
    PRIMARY KEY (id, functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id)
);

CREATE TABLE functionality_external_resource (
    connection_id text,
    functionality_id text,
    connection_name text,
    connection_type text,
    created_at text,
    "name" text,
    remote_id text,
    remote_url text,
    updated_at text,
    PRIMARY KEY (connection_id, functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id)
);

CREATE TABLE functionality_active_incident (
    "index" text,
    functionality_id text,
    active_incident text,
    PRIMARY KEY ("index", functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (active_incident) REFERENCES incident(id)
);

CREATE TABLE functionality (
    id text,
    team_owner_id text,
    updated_by_id text,
    alert_on_add text,
    auto_add_responding_team text,
    created_at text,
    description text,
    labels jsonb,
    "name" text,
    owner text,
    slug text,
    updated_at text,
    updated_by_source text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_owner_id) REFERENCES team(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE service_active_incident (
    "index" text,
    service_id text,
    active_incident text,
    PRIMARY KEY ("index", service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_external_resource (
    connection_id text,
    service_id text,
    connection_name text,
    connection_type text,
    created_at text,
    "name" text,
    remote_id text,
    remote_url text,
    updated_at text,
    PRIMARY KEY (connection_id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_functionality (
    functionality_id text,
    service_id text,
    PRIMARY KEY (functionality_id),
    FOREIGN KEY (functionality_id) REFERENCES functionality(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_checklist_check (
    id text,
    service_checklist_id text,
    service_id text,
    description text,
    "name" text,
    "status" text,
    PRIMARY KEY (id, service_checklist_id, service_id),
    FOREIGN KEY (service_checklist_id) REFERENCES service_checklist(id),
    FOREIGN KEY (service_id) REFERENCES service_checklist(service_id)
);

CREATE TABLE service_checklist_owner (
    service_checklist_id text,
    service_id text,
    team_id text,
    PRIMARY KEY (service_checklist_id, service_id, team_id),
    FOREIGN KEY (service_checklist_id) REFERENCES service_checklist(id),
    FOREIGN KEY (service_id) REFERENCES service_checklist(service_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE checklist_connected_service (
    id text,
    service_checklist_id text,
    service_id text,
    PRIMARY KEY (id, service_checklist_id, service_id),
    FOREIGN KEY (id) REFERENCES service(id),
    FOREIGN KEY (service_checklist_id) REFERENCES service_checklist(id),
    FOREIGN KEY (service_id) REFERENCES service_checklist(service_id)
);

CREATE TABLE service_checklist (
    id text,
    service_id text,
    created_at text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_allowed_param (
    "index" text,
    service_id text,
    allowed_param text,
    PRIMARY KEY ("index", service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_link (
    id text,
    service_id text,
    href_url text,
    icon_url text,
    "name" text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service_last_import_error (
    id text,
    service_id text,
    created_at text,
    data jsonb,
    message text,
    resource_id text,
    resource_name text,
    resource_type text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service (
    id text,
    team_owner_id text,
    updated_by_id text,
    alert_on_add text,
    auto_add_responding_team text,
    completed_checks text,
    created_at text,
    description text,
    label_lacework_service_owner text,
    label_lifecycle text,
    label_tags text,
    label_type text,
    last_import_remote_id text,
    last_import_state text,
    last_imported_at text,
    managed_by text,
    managed_by_setting_format text,
    managed_by_setting_target jsonb,
    "name" text,
    service_checklist_updated_at text,
    service_tier text,
    slug text,
    updated_at text,
    updated_by_source text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_owner_id) REFERENCES team(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE schedule (
    id text,
    integration_name text,
    discarded text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_name) REFERENCES integration("name")
);

CREATE TABLE post_mortem_report_tag_list (
    "index" text,
    post_mortem_report_id text,
    tag_list text,
    PRIMARY KEY ("index", post_mortem_report_id),
    FOREIGN KEY (post_mortem_report_id) REFERENCES post_mortem_report(id),
    FOREIGN KEY (tag_list) REFERENCES incident_tag("name")
);

CREATE TABLE post_mortem_report_additional_detail (
    "index" text,
    post_mortem_report_id text,
    additional_detail text,
    PRIMARY KEY ("index", post_mortem_report_id),
    FOREIGN KEY (post_mortem_report_id) REFERENCES post_mortem_report(id)
);

CREATE TABLE post_mortem_report_question_available_option (
    "index" text,
    post_mortem_report_id text,
    post_mortem_report_question_id text,
    available_option text,
    PRIMARY KEY ("index", post_mortem_report_id, post_mortem_report_question_id),
    FOREIGN KEY (post_mortem_report_id) REFERENCES post_mortem_report_question(post_mortem_report_id),
    FOREIGN KEY (post_mortem_report_question_id) REFERENCES post_mortem_report_question(id)
);

CREATE TABLE post_mortem_report_question_conversation (
    id text,
    post_mortem_report_id text,
    post_mortem_report_question_id text,
    channel_name text,
    comments_url text,
    field text,
    resource_class text,
    resource_id text,
    PRIMARY KEY (id, post_mortem_report_id, post_mortem_report_question_id),
    FOREIGN KEY (post_mortem_report_id) REFERENCES post_mortem_report_question(post_mortem_report_id),
    FOREIGN KEY (post_mortem_report_question_id) REFERENCES post_mortem_report_question(id)
);

CREATE TABLE post_mortem_report_question (
    id text,
    post_mortem_report_id text,
    body text,
    is_required text,
    kind text,
    title text,
    tool_tip text,
    PRIMARY KEY (id, post_mortem_report_id),
    FOREIGN KEY (post_mortem_report_id) REFERENCES post_mortem_report(id)
);

CREATE TABLE post_mortem_report (
    id text,
    incident_id text,
    additional_details text,
    created_at text,
    "name" text,
    summary text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_role (
    id text,
    created_at text,
    description text,
    discarded_at text,
    "name" text,
    summary text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_event_conversation (
    id text,
    incident_event_id text,
    channel_name text,
    comments_url text,
    field text,
    resource_class text,
    resource_id text,
    PRIMARY KEY (id, incident_event_id),
    FOREIGN KEY (incident_event_id) REFERENCES incident_event(id)
);

CREATE TABLE incident_event (
    id text,
    incident_id text,
    author_email text,
    author_id text,
    author_name text,
    author_source text,
    context text,
    data_body text,
    data_body_replaced text,
    occurred_at text,
    "type" text,
    visibility text,
    vote_disliked text,
    vote_dislikes text,
    vote_liked text,
    vote_likes text,
    voted text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE environment_active_incident (
    "index" text,
    environment_id text,
    active_incident text,
    PRIMARY KEY ("index", environment_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (active_incident) REFERENCES incident(id)
);

CREATE TABLE environment_external_resource (
    "index" text,
    environment_id text,
    connection_id text,
    connection_name text,
    connection_type text,
    created_at text,
    "name" text,
    remote_id text,
    remote_url text,
    updated_at text,
    PRIMARY KEY ("index", environment_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id)
);

CREATE TABLE environment (
    id text,
    created_at text,
    description text,
    "name" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE severity_matrix_condition (
    id text,
    "name" text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_task (
    id text,
    incident_id text,
    assignee_email text,
    assignee_id text,
    assignee_name text,
    assignee_source text,
    created_at text,
    created_by_email text,
    created_by_id text,
    created_by_name text,
    created_by_source text,
    description text,
    "state" text,
    title text,
    updated_at text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE entitlement_error (
    "index" text,
    entitlement_id text,
    entitlement_tier text,
    error text,
    PRIMARY KEY ("index", entitlement_id, entitlement_tier),
    FOREIGN KEY (entitlement_id) REFERENCES entitlement(id),
    FOREIGN KEY (entitlement_tier) REFERENCES entitlement(tier)
);

CREATE TABLE entitlement (
    id text,
    tier text,
    available text,
    current_count text,
    exists text,
    maximum text,
    "name" text,
    PRIMARY KEY (id, tier)
);

CREATE TABLE runbook_step_action_element_option (
    "index" text,
    runbook_id text,
    label text,
    "value" text,
    PRIMARY KEY ("index", runbook_id),
    FOREIGN KEY (runbook_id) REFERENCES runbook(id)
);

CREATE TABLE runbook_step_action_supported_type (
    "index" text,
    runbook_id text,
    supported_runbook_type text,
    PRIMARY KEY ("index", runbook_id),
    FOREIGN KEY (runbook_id) REFERENCES runbook(id)
);

CREATE TABLE runbooks_attachment_rule_user_data_value (
    "type" text,
    runbook_id text,
    label text,
    "value" jsonb,
    PRIMARY KEY ("type", runbook_id),
    FOREIGN KEY (runbook_id) REFERENCES runbook(id)
);

CREATE TABLE runbook (
    id text,
    step_action_integration_id text,
    team_owner_id text,
    attachment_rule_logic jsonb,
    auto_attach_to_restricted_incidents text,
    created_at text,
    created_by_email text,
    created_by_id text,
    created_by_name text,
    created_by_source text,
    description text,
    is_editable text,
    "name" text,
    owner text,
    runbook_template_id text,
    step_action_automatable text,
    step_action_config_documentation_url text,
    step_action_config_element_id text,
    step_action_config_element_markdown_text text,
    step_action_config_element_plain_text text,
    step_action_config_element_text_area_default_value text,
    step_action_config_element_text_area_label text,
    step_action_config_element_text_area_placeholder text,
    step_action_config_element_type text,
    step_action_created_at text,
    step_action_default_logic jsonb,
    step_action_default_rule_data jsonb,
    step_action_description text,
    step_action_id text,
    step_action_name text,
    step_action_repeatable text,
    step_action_slug text,
    step_action_updated_at text,
    step_elements jsonb,
    step_rule_logic text,
    step_vote_disliked text,
    step_vote_dislikes text,
    step_vote_liked text,
    step_vote_likes text,
    step_voted text,
    steps_action_config_elements_dynamic_select_async_url text,
    steps_action_config_elements_dynamic_select_clearable text,
    steps_action_config_elements_dynamic_select_default_value_label text,
    steps_action_config_elements_dynamic_select_default_value_value text,
    steps_action_config_elements_dynamic_select_is_multi text,
    steps_action_config_elements_dynamic_select_label text,
    steps_action_config_elements_dynamic_select_placeholder text,
    steps_action_config_elements_dynamic_select_required text,
    steps_action_config_elements_input_default_value text,
    steps_action_config_elements_input_label text,
    steps_action_config_elements_input_placeholder text,
    steps_action_config_elements_input_required text,
    steps_action_elements jsonb,
    steps_action_id text,
    steps_automatic text,
    steps_delay_duration text,
    steps_id text,
    steps_name text,
    steps_repeat text,
    steps_repeat_duration text,
    steps_rule_user_data_label text,
    steps_rule_user_data_type text,
    steps_rule_user_data_value text,
    summary text,
    "type" text,
    updated_at text,
    updated_by_email text,
    updated_by_id text,
    updated_by_name text,
    updated_by_source text,
    vote_disliked text,
    vote_dislikes text,
    vote_liked text,
    vote_likes text,
    voted text,
    -- steps_config_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (step_action_integration_id) REFERENCES integration(id),
    FOREIGN KEY (team_owner_id) REFERENCES team(id)
);

CREATE TABLE scheduled_maintenance_status_page (
    scheduled_maintenance_id text,
    status_page_id text,
    integration_id text,
    PRIMARY KEY (scheduled_maintenance_id, status_page_id),
    FOREIGN KEY (scheduled_maintenance_id) REFERENCES scheduled_maintenance(id),
    FOREIGN KEY (status_page_id) REFERENCES status_page(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE scheduled_maintenance_impact (
    id text,
    scheduled_maintenance_id text,
    condition_id text,
    impact_id text,
    impact_name text,
    "type" text,
    PRIMARY KEY (id, scheduled_maintenance_id),
    FOREIGN KEY (scheduled_maintenance_id) REFERENCES scheduled_maintenance(id),
    FOREIGN KEY (condition_id) REFERENCES severity_matrix_condition(id)
);

CREATE TABLE scheduled_maintenance (
    id text,
    incident_id text,
    created_at text,
    description text,
    ends_at text,
    "name" text,
    starts_at text,
    summary text,
    updated_at text,
    -- label_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE integration_connections (
    id text,
    integration_id text,
    PRIMARY KEY (id, integration_id),
    FOREIGN KEY (id) REFERENCES integration_connection(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration (
    id text,
    created_at text,
    deprecated text,
    description text,
    enabled text,
    installed text,
    logo_url text,
    "name" text,
    nat_ip text,
    setup_url text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_impacted_infrastructure_environment (
    id text,
    incident_id text,
    infrastructure_id text,
    infrastructure_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);
