CREATE TABLE team_log (
    _fivetran_id text,
    team_id text,
    created_date text,
    log text,
    owner text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_responder (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (id) REFERENCES team(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_tag (
    "index" text,
    incident_id text,
    tags text,
    PRIMARY KEY ("index", incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_service (
    "index" text,
    incident_id text,
    service_id text,
    PRIMARY KEY ("index", incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE incident (
    id text,
    created_at text,
    impact_detect_date text,
    impact_end_date text,
    impact_start_date text,
    message text,
    priority text,
    region text,
    server_name text,
    "status" text,
    tiny_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE alert_tag (
    "index" text,
    alert_id text,
    tag_name text,
    PRIMARY KEY ("index", alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_responder (
    "index" text,
    alert_id text,
    "type" text,
    type_id text,
    PRIMARY KEY ("index", alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_action (
    "index" text,
    alert_id text,
    "action" text,
    PRIMARY KEY ("index", alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert (
    id text,
    acknowledged text,
    alias text,
    count text,
    created_at text,
    description text,
    details_region text,
    details_server_name text,
    entity text,
    integration_id text,
    integration_name text,
    integration_type text,
    is_seen text,
    last_occurred_at text,
    message text,
    owner text,
    priority text,
    report_ack_time text,
    report_acknowledged_by text,
    report_close_time text,
    report_closed_by text,
    snoozed text,
    snoozed_until text,
    "source" text,
    "status" text,
    tiny_id text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE incident_template (
    incident_id text,
    description text,
    details jsonb,
    impacted_service jsonb,
    message text,
    "name" text,
    priority text,
    stake_holder_description text,
    stake_holder_enabled text,
    stake_holder_message text,
    tags jsonb,
    PRIMARY KEY (incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE forwarding_rule (
    id text,
    from_user_id text,
    to_user_id text,
    alias text,
    end_date text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

CREATE TABLE account (
    _fivetran_id text,
    is_yearly text,
    max_user_count text,
    "name" text,
    plan_name text,
    user_count text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE service (
    id text,
    team_id text,
    description text,
    is_external text,
    "name" text,
    tags jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE schedule_participant (
    _fivetran_id text,
    id text,
    schedule_id text,
    schedule_rotation_id text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id) REFERENCES team(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule_rotation(schedule_id),
    FOREIGN KEY (schedule_rotation_id) REFERENCES schedule_rotation(id)
);

CREATE TABLE schedule_rotation (
    id text,
    schedule_id text,
    end_date text,
    length text,
    "name" text,
    start_date text,
    "type" text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule (
    id text,
    team_id text,
    description text,
    enabled text,
    "name" text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_request (
    incident_id text,
    integration_id text,
    "action" text,
    is_success text,
    processed_at text,
    "status" text,
    success text,
    PRIMARY KEY (incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE maintenance_rule (
    id text,
    maintenance_id text,
    "state" text,
    "type" text,
    PRIMARY KEY (id, maintenance_id),
    FOREIGN KEY (id) REFERENCES policy(id),
    FOREIGN KEY (maintenance_id) REFERENCES maintenance(id)
);

CREATE TABLE maintenance (
    id text,
    description text,
    end_date text,
    start_date text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE policy_condition (
    field_ text,
    policy_id text,
    expected_value text,
    not_ text,
    operation text,
    orders text,
    PRIMARY KEY (field_, policy_id),
    FOREIGN KEY (policy_id) REFERENCES policy(id)
);

CREATE TABLE policy (
    id text,
    delay_action_duration text,
    delay_action_option text,
    delay_action_until_hour text,
    delay_action_until_minute text,
    enabled text,
    filter_type text,
    "name" text,
    policy_description text,
    suppress text,
    time_restriction_end_hour text,
    time_restriction_end_min text,
    time_restriction_start_hour text,
    time_restriction_start_min text,
    time_restriction_type text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE service_condition (
    "index" text,
    service_id text,
    service_incident_id text,
    expected_value text,
    field text,
    not_ text,
    operation text,
    PRIMARY KEY ("index", service_id, service_incident_id),
    FOREIGN KEY (service_id) REFERENCES service_incident(service_id),
    FOREIGN KEY (service_incident_id) REFERENCES service_incident(id)
);

CREATE TABLE service_incident_tag (
    "index" text,
    service_id text,
    service_incident_id text,
    tags text,
    PRIMARY KEY ("index", service_id, service_incident_id),
    FOREIGN KEY (service_id) REFERENCES service_incident(service_id),
    FOREIGN KEY (service_incident_id) REFERENCES service_incident(id)
);

CREATE TABLE service_incident (
    id text,
    service_id text,
    condition_match_type text,
    incident_description text,
    incident_details jsonb,
    incident_message text,
    incident_priority text,
    orders text,
    stakeholder_description text,
    stakeholder_enabled text,
    stakeholder_message text,
    PRIMARY KEY (id, service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE incident_note (
    _fivetran_id text,
    incident_id text,
    created_at text,
    note text,
    offsets text,
    owner text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE user_tag (
    "index" text,
    user_id text,
    tags text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    role_id text,
    blocked text,
    city text,
    country text,
    created_at text,
    full_name text,
    line text,
    locale text,
    skype_username text,
    "state" text,
    time_zone text,
    username text,
    verified text,
    zip_code text,
    -- details_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE incident_timeline (
    id text,
    incident_id text,
    actor_name text,
    actor_type text,
    description_name text,
    description_type text,
    edit_time text,
    event_time text,
    groups text,
    hidden text,
    last_editname text,
    last_edittype text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE heartbeat (
    _fivetran_id text,
    team_id text,
    alert_message text,
    alert_priority text,
    alert_tag jsonb,
    description text,
    enabled text,
    "interval" text,
    interval_unit text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE role_grant_right (
    "index" text,
    role_id text,
    granted_right text,
    PRIMARY KEY ("index", role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE role_disallow_right (
    "index" text,
    role_id text,
    disallow_right text,
    PRIMARY KEY ("index", role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    extended_role text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE routing_condition (
    "index" text,
    team_routing_rule_id text,
    expected_value text,
    field text,
    "key" text,
    not_ text,
    operation text,
    order_ text,
    PRIMARY KEY ("index", team_routing_rule_id),
    FOREIGN KEY (team_routing_rule_id) REFERENCES team_routing_rule(id)
);

CREATE TABLE routing_restriction (
    "index" text,
    team_routing_rule_id text,
    end_day text,
    end_hour text,
    end_min text,
    start_day text,
    start_hour text,
    start_min text,
    PRIMARY KEY ("index", team_routing_rule_id),
    FOREIGN KEY (team_routing_rule_id) REFERENCES team_routing_rule(id)
);

CREATE TABLE team_routing_rule (
    id text,
    notify_id text,
    team_id text,
    criteria_type text,
    is_default text,
    "name" text,
    notify_name text,
    notify_type text,
    order_ text,
    time_restriction_type text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (notify_id) REFERENCES schedule(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE user_notification_rule_time (
    "index" text,
    user_id text,
    user_notification_rule_id text,
    notification_time text,
    PRIMARY KEY ("index", user_id, user_notification_rule_id),
    FOREIGN KEY (user_id) REFERENCES user_notification_rule(user_id),
    FOREIGN KEY (user_notification_rule_id) REFERENCES user_notification_rule(id)
);

CREATE TABLE user_notification_rule_step (
    id text,
    user_id text,
    user_notification_rule_id text,
    contact_method text,
    contact_to text,
    enabled text,
    parent_name text,
    send_time text,
    send_time_unit text,
    PRIMARY KEY (id, user_id, user_notification_rule_id),
    FOREIGN KEY (user_id) REFERENCES user_notification_rule(user_id),
    FOREIGN KEY (user_notification_rule_id) REFERENCES user_notification_rule(id)
);

CREATE TABLE user_notification_rule_schedule (
    id text,
    user_id text,
    user_notification_rule_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, user_id, user_notification_rule_id),
    FOREIGN KEY (user_id) REFERENCES user_notification_rule(user_id),
    FOREIGN KEY (user_notification_rule_id) REFERENCES user_notification_rule(id)
);

CREATE TABLE user_notification_rule (
    id text,
    user_id text,
    action_type text,
    criteria_type text,
    enabled text,
    "name" text,
    orders text,
    repeat_enabled text,
    restriction_end_hour text,
    restriction_end_min text,
    restriction_start_hour text,
    restriction_start_min text,
    restriction_type text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE escalation_rule (
    "index" text,
    escalation_id text,
    "condition" text,
    delay_time text,
    delay_time_unit text,
    notify_type text,
    recipient_id text,
    recipient_name text,
    recipient_type text,
    PRIMARY KEY ("index", escalation_id),
    FOREIGN KEY (escalation_id) REFERENCES escalation(id)
);

CREATE TABLE escalation (
    id text,
    team_id text,
    close_alert_after_all text,
    count text,
    description text,
    "name" text,
    reset_recipient_states text,
    wait_interval text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE incident_log (
    _fivetran_id text,
    incident_id text,
    created_at text,
    log text,
    offsets text,
    owner text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE user_contact (
    id text,
    user_id text,
    apply_order text,
    contact_method text,
    disabled_reason text,
    enabled text,
    to_ text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE integration_read_only (
    "index" text,
    integration_id text,
    read_only text,
    PRIMARY KEY ("index", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration (
    id text,
    advanced text,
    alert_action jsonb,
    alert_filter jsonb,
    allow_configuration_access text,
    allow_delete_access text,
    allow_read_access text,
    allow_write_access text,
    custom_priority text,
    enabled text,
    extra_property jsonb,
    ignore_extra_property_from_payload text,
    ignore_recipient_from_payload text,
    ignore_responder_from_payload text,
    ignore_tag_from_payload text,
    ignore_team_from_payload text,
    is_advanced text,
    is_default_integration text,
    is_global text,
    "name" text,
    priority text,
    recipient jsonb,
    responder jsonb,
    send_alert_action text,
    suppress_notification text,
    tags jsonb,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE integration_action_info_acknowledge_condition (
    "index" text,
    integration_action_info_acknowledge_index text,
    integration_action_info_acknowledge_type text,
    integration_id text,
    expected_value text,
    field text,
    is_not text,
    operation text,
    PRIMARY KEY ("index", integration_action_info_acknowledge_index, integration_action_info_acknowledge_type, integration_id),
    FOREIGN KEY (integration_action_info_acknowledge_index) REFERENCES integration_action_info_acknowledge("index"),
    FOREIGN KEY (integration_action_info_acknowledge_type) REFERENCES integration_action_info_acknowledge("type"),
    FOREIGN KEY (integration_id) REFERENCES integration_action_info_acknowledge(integration_id)
);

CREATE TABLE integration_action_info_acknowledge (
    "index" text,
    "type" text,
    integration_id text,
    alias text,
    condition_match_type text,
    id text,
    "name" text,
    note text,
    orders text,
    users text,
    PRIMARY KEY ("index", "type", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration_action(integration_id)
);

CREATE TABLE integration_action_info_addnote_condition (
    "index" text,
    integration_action_info_addnote_index text,
    integration_id text,
    "type" text,
    expected_value text,
    field text,
    is_not text,
    operation text,
    PRIMARY KEY ("index", integration_action_info_addnote_index, integration_id, "type"),
    FOREIGN KEY (integration_action_info_addnote_index) REFERENCES integration_action_info_addnote("index"),
    FOREIGN KEY (integration_id) REFERENCES integration_action_info_addnote(integration_id),
    FOREIGN KEY ("type") REFERENCES integration_action_info_addnote("type")
);

CREATE TABLE integration_action_info_addnote (
    "index" text,
    "type" text,
    integration_id text,
    alias text,
    condition_match_type text,
    id text,
    "name" text,
    note text,
    orders text,
    users text,
    PRIMARY KEY ("index", "type", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration_action(integration_id)
);

CREATE TABLE integration_action_info_close_condition (
    "index" text,
    integration_action_info_close_index text,
    integration_id text,
    "type" text,
    expected_value text,
    field text,
    is_not text,
    operation text,
    PRIMARY KEY ("index", integration_action_info_close_index, integration_id, "type"),
    FOREIGN KEY (integration_action_info_close_index) REFERENCES integration_action_info_close("index"),
    FOREIGN KEY (integration_id) REFERENCES integration_action_info_close(integration_id),
    FOREIGN KEY ("type") REFERENCES integration_action_info_close("type")
);

CREATE TABLE integration_action_info_close (
    "index" text,
    "type" text,
    integration_id text,
    alias text,
    condition_match_type text,
    id text,
    "name" text,
    note text,
    orders text,
    users text,
    PRIMARY KEY ("index", "type", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration_action(integration_id)
);

CREATE TABLE integration_action_create_condition (
    "index" text,
    integration_action_create_index text,
    integration_id text,
    "type" text,
    expected_value text,
    field text,
    is_not text,
    operation text,
    PRIMARY KEY ("index", integration_action_create_index, integration_id, "type"),
    FOREIGN KEY (integration_action_create_index) REFERENCES integration_action_create("index"),
    FOREIGN KEY (integration_id) REFERENCES integration_action_create(integration_id),
    FOREIGN KEY ("type") REFERENCES integration_action_create("type")
);

CREATE TABLE integration_action_create (
    "index" text,
    "type" text,
    integration_id text,
    alert_action jsonb,
    alias text,
    append_attachment text,
    condition_match_type text,
    custom_priority text,
    description text,
    entity text,
    extra_property jsonb,
    id text,
    ignore_alert_action_payload text,
    ignore_extra_property_payload text,
    ignore_recipient_payload text,
    ignore_responder_payload text,
    ignore_tag_payload text,
    ignore_team_payload text,
    message text,
    "name" text,
    note text,
    orders text,
    priority text,
    recipient jsonb,
    responder jsonb,
    "source" text,
    tags jsonb,
    users text,
    PRIMARY KEY ("index", "type", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration_action(integration_id)
);

CREATE TABLE integration_action (
    integration_id text,
    ignored jsonb,
    version text,
    PRIMARY KEY (integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE team_role (
    role_id text,
    team_id text,
    "name" text,
    PRIMARY KEY (role_id, team_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_member (
    team_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);
