CREATE TABLE forecast_vs_actual (
    _fivetran_id text,
    queue text,
    cases_answered_actual text,
    cases_answered_forecasted text,
    cases_opened_actual text,
    cases_opened_forecasted text,
    cases_reopened_actual text,
    cases_reopened_forecasted text,
    cases_solved_actual text,
    cases_solved_forecasted text,
    channel text,
    contacts_abandoned_actual text,
    contacts_abandoned_forecasted text,
    contacts_received_actual text,
    contacts_received_forecasted text,
    end_time timestamp,
    first_response_time_actual text,
    first_response_time_forecasted text,
    handle_time_actual text,
    handle_time_forecasted text,
    messages_received_actual text,
    messages_received_forecasted text,
    occupancy_actual text,
    occupancy_forecasted text,
    productivity_actual text,
    productivity_forecasted text,
    reassigned_away_actual text,
    reassigned_away_forecasted text,
    service_level_actual text,
    service_level_forecasted text,
    service_level_met_actual text,
    service_level_met_forecasted text,
    service_level_missed_actual text,
    service_level_missed_forecasted text,
    staffing_net text,
    staffing_required_actual text,
    staffing_required_forecasted text,
    staffing_scheduled text,
    start_time timestamp,
    transferred_away_actual text,
    transferred_away_forecasted text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (queue) REFERENCES queue(id)
);

CREATE TABLE activity (
    id text,
    activity_type_id text,
    agent_id text,
    event_id text,
    created_at text,
    description text,
    end_time text,
    start_time text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id),
    FOREIGN KEY (agent_id) REFERENCES people(agent_id),
    FOREIGN KEY (event_id) REFERENCES event_change(event_id)
);

CREATE TABLE activity_type (
    id text,
    background_color text,
    channels jsonb,
    font_color text,
    import_id text,
    "name" text,
    productive text,
    short_name text,
    timeoff text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE team (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES team(id)
);

CREATE TABLE people_team (
    people_id text,
    team_id text,
    PRIMARY KEY (people_id, team_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE people_queue (
    people_id text,
    queue_id text,
    PRIMARY KEY (people_id, queue_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE people_skill (
    people_id text,
    skill_id text,
    PRIMARY KEY (people_id, skill_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id)
);

CREATE TABLE people (
    id text,
    agent_id text,
    site text,
    agent_role text,
    channels jsonb,
    created_at text,
    deleted text,
    email text,
    end_date text,
    first_name text,
    imported_id text,
    last_name text,
    platforms jsonb,
    productivity text,
    "role" text,
    staffable boolean,
    start_date text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES people(id),
    FOREIGN KEY (site) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES site(id)
);

CREATE TABLE queue (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES queue(id)
);

CREATE TABLE time_off_update (
    id text,
    time_off_request_id text,
    "comment" text,
    created_at timestamp,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (time_off_request_id) REFERENCES time_off_request(id)
);

CREATE TABLE time_off_request (
    id text,
    activity_type_id text,
    agent_id text,
    created_at timestamp,
    description text,
    end_time timestamp,
    start_time timestamp,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id),
    FOREIGN KEY (agent_id) REFERENCES people(id)
);

CREATE TABLE sources_used (
    "index" text,
    assist_conversation_id text,
    message_id text,
    platform text,
    title text,
    url text,
    PRIMARY KEY ("index", assist_conversation_id, message_id),
    FOREIGN KEY (assist_conversation_id) REFERENCES message(assist_conversation_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message (
    id text,
    assist_conversation_id text,
    content_text text,
    content_type text,
    content_url text,
    created_at text,
    platform_id text,
    "role" text,
    user_platform_id text,
    PRIMARY KEY (id, assist_conversation_id),
    FOREIGN KEY (assist_conversation_id) REFERENCES assist_conversation(id)
);

CREATE TABLE assist_conversation (
    id text,
    user_id text,
    agent_content text,
    agent_platform text,
    agent_platform_id text,
    conversation_type text,
    copilot_action_type text,
    created_at timestamp,
    customer_tier text,
    evaluation_custom_feedback jsonb,
    issue_complexity text,
    platform text,
    platform_id text,
    requires_escalation boolean,
    routing_destination_id text,
    routing_destination_name text,
    semantic_similarity text,
    "status" text,
    transferred_case_id text,
    transferred_case_platform text,
    trigram_similarity text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES people(id)
);

CREATE TABLE skill (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES skill(id)
);

CREATE TABLE requirement_type_activity_type (
    activity_type_id text,
    requirement_type_id text,
    PRIMARY KEY (activity_type_id, requirement_type_id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id),
    FOREIGN KEY (requirement_type_id) REFERENCES requirement_type(id)
);

CREATE TABLE requirement_type (
    id text,
    queue text,
    channel text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (queue) REFERENCES queue(id)
);

CREATE TABLE agent_state (
    _fivetran_id text,
    agent_id text,
    agent_platform_id text,
    end_time text,
    modified_at text,
    platform text,
    start_time text,
    "state" text,
    ticket_id text,
    ticket_status text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agent_id) REFERENCES people(agent_id)
);

CREATE TABLE forecast (
    _fivetran_id text,
    queue_id text,
    channel text,
    end_time timestamp,
    start_time timestamp,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE forecast_total (
    id text,
    queue_id text,
    channel text,
    end_time text,
    start_time text,
    "value" text,
    value_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE event_change (
    id text,
    event_agent_id text,
    modified_by_agent_id text,
    description text,
    event_change_type text,
    event_id text,
    modified_at timestamp,
    new_end_time timestamp,
    new_event_channel text,
    new_event_type text,
    new_google_calendar_event_id text,
    new_start_time timestamp,
    new_template_id text,
    old_end_time timestamp,
    old_event_channel text,
    old_event_type text,
    old_google_calendar_event_id text,
    old_start_time timestamp,
    old_template_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_agent_id) REFERENCES people(id),
    FOREIGN KEY (modified_by_agent_id) REFERENCES people(id)
);

CREATE TABLE requirement (
    _fivetran_id text,
    requirement_type_id text,
    end_time text,
    required text,
    scheduled text,
    start_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (requirement_type_id) REFERENCES requirement_type(id)
);

CREATE TABLE agent_ticket_stats_hourly_report (
    _fivetran_id text,
    agent_id text,
    channel text,
    end_time text,
    "name" text,
    report_type text,
    start_time text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE agent_ticket_stats_daily_report (
    _fivetran_id text,
    agent_id text,
    channel text,
    end_time text,
    "name" text,
    report_type text,
    start_time text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE hourly_report_metric (
    _fivetran_id text,
    agent_id text,
    channel text,
    end_time text,
    "name" text,
    report_type text,
    start_time text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE agent_state_handle_times_daily_report (
    _fivetran_id text,
    agent_id text,
    channel text,
    end_time text,
    "name" text,
    report_type text,
    start_time text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE daily_report_metric (
    _fivetran_id text,
    agent_id text,
    channel text,
    end_time text,
    "name" text,
    report_type text,
    start_time text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE agent_state_handle_times_hourly_report (
    _fivetran_id text,
    agent_id text,
    channel text,
    end_time text,
    "name" text,
    report_type text,
    start_time text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);
