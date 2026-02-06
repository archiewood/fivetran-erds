CREATE TABLE lesson_attempt (
    _fivetran_id text,
    email text,
    completed_at text,
    created_at text,
    difficulty text,
    length text,
    lesson_name text,
    questions text,
    read_transcript text,
    started_at text,
    "status" text,
    time_spent text,
    updated_at text,
    watched_video text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (email) REFERENCES users(email)
);

CREATE TABLE assignment (
    _fivetran_id text,
    email text,
    assignment_name text,
    due_date text,
    passed_lessons text,
    path_name text,
    "status" text,
    total_lessons text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (email) REFERENCES users(email)
);

CREATE TABLE users (
    email text,
    archived text,
    archived_at text,
    business_unit text,
    company text,
    first_name text,
    job_role text,
    last_name text,
    security_champion text,
    team text,
    time_spent text,
    title text,
    total_points text,
    PRIMARY KEY (email)
);

CREATE TABLE enrollment (
    _fivetran_id text,
    email text,
    completed_at text,
    created_at text,
    level_name text,
    level_type text,
    passed_lessons text,
    path_enrollment_completed_at text,
    path_enrollment_created_at text,
    path_enrollment_name text,
    path_enrollment_status text,
    path_enrollment_updated_at text,
    points_earned text,
    "status" text,
    total_lessons text,
    updated_at text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (email) REFERENCES users(email)
);
