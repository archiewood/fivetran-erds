CREATE TABLE call_participant (
    id text,
    call_id text,
    call_status text,
    caller_id text,
    caller_name text,
    caller_number text,
    connection_type text,
    cost text,
    cost_unit text,
    created_time text,
    duration text,
    duration_unit text,
    enqueued_time text,
    participant_id text,
    participant_type text,
    updated_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE "call" (
    id text,
    agent_id text,
    team_id text,
    bill_duration text,
    bill_duration_unit text,
    call_notes text,
    call_queue_id text,
    call_queue_name text,
    created_time text,
    direction text,
    integrated_resources jsonb,
    ivr_id text,
    ivr_name text,
    parallel_call_groups jsonb,
    parent_call_id text,
    phone_number text,
    phone_number_id text,
    recording_duration text,
    recording_duration_unit text,
    recording_id text,
    recording_to_redact text,
    recording_url text,
    root_call_id text,
    updated_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE call_metric (
    id text,
    call_id text,
    answering_speed text,
    answering_speed_unit text,
    bill_duration text,
    bill_duration_unit text,
    call_work_time text,
    call_work_time_unit text,
    cost text,
    cost_unit text,
    created_time text,
    csat_outcome text,
    csat_time text,
    csat_time_unit text,
    csat_transfer_made text,
    hold_duration text,
    hold_duration_unit text,
    ivr_time text,
    ivr_time_unit text,
    recording_duration text,
    recording_duration_unit text,
    tags jsonb,
    talk_time text,
    talk_time_unit text,
    total_ringing_time text,
    total_ringing_time_unit text,
    updated_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE user_status (
    id text,
    emoji text,
    enabled text,
    "name" text,
    status_sub_type text,
    status_type text,
    PRIMARY KEY (id)
);

CREATE TABLE team (
    id text,
    description text,
    "name" text,
    omni_channel text,
    PRIMARY KEY (id)
);

CREATE TABLE user_team (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    preference text,
    confirmed text,
    deleted text,
    email text,
    language text,
    last_call_time text,
    last_seen_time text,
    "name" text,
    phone text,
    "role" text,
    "status" text,
    time_zone text,
    PRIMARY KEY (id),
    FOREIGN KEY (preference) REFERENCES user_status(id)
);

CREATE TABLE lifecycle (
    _fivetran_id text,
    call_id text,
    id text,
    leg_type text,
    "timestamp" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);
