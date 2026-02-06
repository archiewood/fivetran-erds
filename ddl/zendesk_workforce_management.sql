CREATE TABLE agent_attendance (
    end_time text,
    "interval" text,
    start_time text,
    agent_id text,
    attendance_rate text,
    attendance_time text,
    late_occurrence text,
    late_time text,
    left_early_occurrence text,
    left_early_time text,
    occupancy_rate text,
    overtime_occurrence text,
    overtime_time text,
    scheduled_time text,
    team_id text,
    team_is_deleted text,
    team_name text,
    total_time text,
    unpaid_general_task_time text,
    PRIMARY KEY (end_time, "interval", start_time, agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE activity_type_id (
    activity_id text,
    activity_type_id text,
    PRIMARY KEY (activity_id, activity_type_id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id)
);

CREATE TABLE activity (
    id text,
    agent_id text,
    color text,
    duration text,
    end_time text,
    event_type text,
    is_paid text,
    lock_interval text,
    "name" text,
    start_time text,
    ticket_id text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE agent (
    id text,
    deactivated text,
    email text,
    is_deleted text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE activity_type (
    id text,
    color text,
    is_deleted text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_time_off (
    end_time text,
    "interval" text,
    start_time text,
    time_off_reason_id text,
    agent_id text,
    planned_time_off_occurrence text,
    planned_time_off_time text,
    time_off_reason_is_deleted text,
    time_off_reason_name text,
    time_off_reason_type text,
    total_time_off_occurrence text,
    total_time_off_time text,
    unplanned_time_off_occurrence text,
    unplanned_time_off_time text,
    PRIMARY KEY (end_time, "interval", start_time, time_off_reason_id, agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent_activity (
    end_time text,
    "interval" text,
    start_time text,
    activity_type_id text,
    agent_id text,
    adherence_rate text,
    assigned_point text,
    attend_point text,
    escalate_point text,
    paid_general_task_time text,
    paid_time text,
    reopen_point text,
    scheduled_time text,
    solved_point text,
    total_time text,
    unpaid_general_task_time text,
    PRIMARY KEY (end_time, "interval", start_time, activity_type_id, agent_id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);
