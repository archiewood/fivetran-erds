CREATE TABLE sub_team_user (
    team_id text,
    user_id text,
    manager_id text,
    parent_team_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (user_id) REFERENCES team_user(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (parent_team_id) REFERENCES team(id)
);

CREATE TABLE team_user_tag (
    "index" text,
    team_id text,
    user_id text,
    tags text,
    PRIMARY KEY ("index", team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team_user(team_id),
    FOREIGN KEY (user_id) REFERENCES team_user(id)
);

CREATE TABLE team_user (
    id text,
    team_id text,
    manager_id text,
    parent_team_id text,
    parent_team_manager_id text,
    primary_team_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (parent_team_id) REFERENCES team(id),
    FOREIGN KEY (parent_team_manager_id) REFERENCES users(id),
    FOREIGN KEY (primary_team_id) REFERENCES team(id)
);

CREATE TABLE item (
    id text,
    item_category text,
    item_type text,
    short_description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE channel (
    id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE verb (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE learn_list (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_secondary_manager (
    id text,
    team_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    manager_id text,
    "name" text,
    parent_team_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

CREATE TABLE task (
    id text,
    assigner_id text,
    set_for_id text,
    taskable_added_by_user_id text,
    assigned_at text,
    certificate_awarded_at text,
    certificate_expires_at text,
    certificate_id text,
    completed text,
    completed_at text,
    created_at text,
    deadline text,
    expired text,
    expired_at text,
    lifecycle text,
    mandatory text,
    overdue text,
    started_at text,
    taskable_display_added_by text,
    taskable_id text,
    taskable_name text,
    taskable_short_description text,
    taskable_tags jsonb,
    taskable_total_time_estimate text,
    taskable_type text,
    type_label text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigner_id) REFERENCES users(id),
    FOREIGN KEY (set_for_id) REFERENCES users(id),
    FOREIGN KEY (taskable_added_by_user_id) REFERENCES users(id)
);

CREATE TABLE event (
    id text,
    created_at text,
    "name" text,
    short_description text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE enrollment (
    id text,
    enrolled_by_id text,
    event_id text,
    host_id text,
    user_id text,
    attendance text,
    created_at text,
    enrolled_at text,
    enrollment_deadline text,
    enrollment_type text,
    event_session_created_at text,
    event_session_ends_at text,
    event_session_id text,
    event_session_location_address text,
    event_session_location_type text,
    event_session_starts_at text,
    event_session_updated_at text,
    is_host text,
    space text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (enrolled_by_id) REFERENCES users(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (host_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_secondary_team (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    manager_id text,
    primary_team_id text,
    department text,
    email text,
    first_name text,
    hire_date text,
    job_title text,
    languages text,
    last_name text,
    location text,
    "role" text,
    "status" text,
    "time" text,
    time_zone text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (primary_team_id) REFERENCES team(id)
);

CREATE TABLE activity (
    id text,
    activityable_added_by_user_id text,
    user_id text,
    activityable_display_added_by text,
    activityable_id text,
    activityable_name text,
    activityable_short_description text,
    activityable_tags jsonb,
    activityable_total_time_estimate text,
    activityable_type text,
    certificate_awarded_at text,
    certificate_expires_at text,
    certificate_id text,
    completed text,
    created_at text,
    expired text,
    expired_at text,
    "result" text,
    score text,
    total_time text,
    verb text,
    PRIMARY KEY (id),
    FOREIGN KEY (activityable_added_by_user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
