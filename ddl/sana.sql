CREATE TABLE path_content (
    "index" text,
    path_id text,
    content text,
    PRIMARY KEY ("index", path_id),
    FOREIGN KEY (path_id) REFERENCES "path"(id),
    FOREIGN KEY (content) REFERENCES course(id)
);

CREATE TABLE "path" (
    id text,
    description text,
    image_url text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE group_assignment (
    _fivetran_id text,
    group_id text,
    content_id text,
    content_type text,
    identity_id text,
    identity_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE course (
    id text,
    description text,
    duration_in_minutes text,
    external_id text,
    image_url text,
    "level" text,
    link text,
    title text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE group_user_list (
    group_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_assignment (
    _fivetran_id text,
    user_id text,
    assignment_time text,
    content_id text,
    content_type text,
    due_date_absolute text,
    identity_id text,
    identity_type text,
    is_status_completed text,
    passed_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    activated_at text,
    created_at text,
    disabled text,
    email text,
    first_name text,
    is_manager text,
    is_sso_email text,
    languages text,
    last_invite_sent_at text,
    last_name text,
    manager_id text,
    "role" text,
    "status" text,
    -- custom_attribute_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE exercise_submission_report (
    exercise_id text,
    submission_id text,
    content_id text,
    attempt text,
    content_progress text,
    content_title text,
    due_date text,
    email text,
    exercise_name text,
    first_name text,
    last_name text,
    response_id text,
    response_text text,
    reviewer text,
    "status" text,
    submission_date text,
    PRIMARY KEY (exercise_id, submission_id),
    FOREIGN KEY (content_id) REFERENCES course(id)
);

CREATE TABLE interactive_element_report (
    interactive_element_id text,
    content_id text,
    card_id text,
    card_title text,
    completion_rate text,
    content_title text,
    content_type text,
    first_attempt_correct_rate text,
    interactive_element_text text,
    interactive_element_type text,
    is_mandatory text,
    learners_attempted text,
    PRIMARY KEY (interactive_element_id, content_id),
    FOREIGN KEY (content_id) REFERENCES course(id)
);

CREATE TABLE course_completion_report (
    course_id text,
    user_id text,
    first_name text,
    last_name text,
    time_stamp text,
    title text,
    PRIMARY KEY (course_id, user_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE content_report (
    content_id text,
    assignments text,
    average_rating text,
    completion_rate text,
    content_type text,
    description text,
    duration_in_minute text,
    image text,
    is_visible text,
    learners text,
    number_of_ratings text,
    progress_rate_25 text,
    progress_rate_50 text,
    progress_rate_75 text,
    skill text,
    start_rate text,
    title text,
    PRIMARY KEY (content_id),
    FOREIGN KEY (content_id) REFERENCES course(id)
);

CREATE TABLE user_report (
    user_id text,
    activated_at text,
    assigned_courses text,
    created_at text,
    disabled_at text,
    progress_percentage text,
    time_spent_in_minutes text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE learner_progress_report (
    content_id text,
    user_id text,
    group_id text,
    assigned_to_user_directly text,
    assignment_method text,
    assignment_time text,
    content_title text,
    content_type text,
    due_date text,
    email text,
    first_attempt_correct_rate text,
    first_name text,
    group_name text,
    included_in_path text,
    last_name text,
    last_progress_time text,
    passed_time text,
    progress text,
    start_time text,
    user_status text,
    PRIMARY KEY (content_id, user_id),
    FOREIGN KEY (content_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE reflection_response_report (
    reflection_id text,
    response_id text,
    content_id text,
    user_id text,
    content_title text,
    created_at text,
    edited_at text,
    email text,
    first_name text,
    is_anonymous text,
    last_name text,
    reflection_text text,
    response_text text,
    PRIMARY KEY (reflection_id, response_id),
    FOREIGN KEY (content_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE poll_result_aggregate_report (
    answer_id text,
    poll_id text,
    course_id text,
    answer text,
    answer_count text,
    course_title text,
    poll_version_id text,
    question text,
    PRIMARY KEY (answer_id, poll_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);
