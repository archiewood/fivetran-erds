CREATE TABLE path_tag (
    tags text,
    path_id text,
    PRIMARY KEY (tags, path_id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE "path" (
    id text,
    card_banner text,
    created_at text,
    description text,
    "name" text,
    num_challenge text,
    num_guide text,
    num_resource text,
    passing_score_requiredfor_unlock text,
    sequential_unlock text,
    time_estimate_seconds text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    created_at text,
    description text,
    enterprise_id text,
    from_sso text,
    has_manager text,
    "name" text,
    original_name text,
    user_updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE academy_registration (
    id text,
    content_id text,
    user_id text,
    academy_overview_description text,
    card_banner text,
    completed_at text,
    completion_percentage text,
    content_type text,
    created_at text,
    description text,
    due_at text,
    due_date text,
    is_completed text,
    pass_status text,
    score text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_id) REFERENCES academy_training(id),
    FOREIGN KEY (user_id) REFERENCES academy_user(id)
);

CREATE TABLE certification (
    id text,
    created_at text,
    is_deleted text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE scorm (
    id text,
    created_at text,
    time_estimate text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE guide_tag (
    tags text,
    guide_id text,
    PRIMARY KEY (tags, guide_id),
    FOREIGN KEY (guide_id) REFERENCES guide(id)
);

CREATE TABLE guide (
    id text,
    created_at text,
    num_total_task text,
    num_total_test_question text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE scim_group_member (
    "value" text,
    scim_group_id text,
    display text,
    link text,
    PRIMARY KEY ("value", scim_group_id),
    FOREIGN KEY (scim_group_id) REFERENCES scim_group(id)
);

CREATE TABLE scim_group (
    id text,
    display_name text,
    PRIMARY KEY (id)
);

CREATE TABLE event_session_learner (
    event_id text,
    event_session_id text,
    user_id text,
    email text,
    groups jsonb,
    "name" text,
    registration_date text,
    registration_status text,
    PRIMARY KEY (event_id, event_session_id, user_id),
    FOREIGN KEY (event_id) REFERENCES event_session(event_id),
    FOREIGN KEY (event_session_id) REFERENCES event_session(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE event (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE academy_training (
    id text,
    created_at text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE academy_awarded_certification (
    id text,
    user_id text,
    academy_id text,
    awarded_at text,
    description text,
    "name" text,
    user_email text,
    user_name text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES academy_user(id)
);

CREATE TABLE event_session_training_class_instructor (
    id text,
    event_id text,
    session_id text,
    user_id text,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES event_session(event_id),
    FOREIGN KEY (session_id) REFERENCES event_session(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE event_session (
    id text,
    event_id text,
    ends text,
    "start" text,
    title text,
    training_class_id text,
    zoom_meeting_id text,
    zoom_meeting_join_url text,
    zoom_meeting_start_url text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE guide_assignment_path (
    id text,
    guide_assignment_id text,
    "name" text,
    PRIMARY KEY (id, guide_assignment_id),
    FOREIGN KEY (guide_assignment_id) REFERENCES guide_assignment(id)
);

CREATE TABLE guide_assignment (
    id text,
    guide_id text,
    assigner_id text,
    course_id text,
    user_id text,
    completed_at text,
    completion_percentage text,
    created_at text,
    due_date text,
    is_archived text,
    is_completed text,
    num_completed_task text,
    num_completed_test_question text,
    num_correct_test_question text,
    num_graded_test_question text,
    num_viewed_task text,
    score text,
    tags jsonb,
    title text,
    training_series_user_assignment_id text,
    updated_at text,
    PRIMARY KEY (id, guide_id),
    FOREIGN KEY (guide_id) REFERENCES guide(id),
    FOREIGN KEY (assigner_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES course_assignment(course_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE academy_certification (
    id text,
    academy_id text,
    awarded_by_name text,
    awarded_by_title text,
    created_at text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE unique_guide_assignment_change (
    id text,
    guide_id text,
    user_id text,
    guide_name text,
    occurred_at text,
    "status" text,
    training_series_id text,
    user_email text,
    PRIMARY KEY (id),
    FOREIGN KEY (guide_id) REFERENCES guide(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE academy_user_segment (
    _fivetran_id text,
    academy_user_id text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (academy_user_id) REFERENCES academy_user(id)
);

CREATE TABLE academy_user_custom_registration (
    _fivetran_id text,
    academy_user_id text,
    academy_registration_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (academy_user_id) REFERENCES academy_user(id)
);

CREATE TABLE academy_user (
    id text,
    academy_id text,
    created_at text,
    display_name text,
    email text,
    first_name text,
    last_name text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE course_assignment_tag (
    tags text,
    course_assignment_id text,
    PRIMARY KEY (tags, course_assignment_id),
    FOREIGN KEY (course_assignment_id) REFERENCES course_assignment(id)
);

CREATE TABLE course_assignment (
    id text,
    assigner_id text,
    training_series_id text,
    user_id text,
    completed_at text,
    completion_percentage text,
    course_id text,
    created_at text,
    due_date text,
    is_archived text,
    is_completed text,
    num_completed_tasks text,
    num_completed_test_questions text,
    num_correct_test_questions text,
    num_graded_test_questions text,
    num_viewed_tasks text,
    score text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigner_id) REFERENCES users(id),
    FOREIGN KEY (training_series_id) REFERENCES training_series_assignment(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE training_series_assignment_tag (
    tags text,
    training_series_assignment_id text,
    PRIMARY KEY (tags, training_series_assignment_id),
    FOREIGN KEY (training_series_assignment_id) REFERENCES training_series_assignment(id)
);

CREATE TABLE training_series_assignment (
    id text,
    assigner_id text,
    training_series_id text,
    user_id text,
    completed_at text,
    completion_percentage text,
    created_at text,
    created_through text,
    due_date text,
    is_completed text,
    modules_completed text,
    num_modules text,
    overall_grade text,
    time_spent text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigner_id) REFERENCES users(id),
    FOREIGN KEY (training_series_id) REFERENCES "path"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE challenge_assignment (
    id text,
    training_series_id text,
    user_id text,
    calculated_grade text,
    challenge_id text,
    completed_at text,
    completion_percentage text,
    created_at text,
    due_date text,
    is_fully_graded text,
    is_partially_graded text,
    is_submitted text,
    passed text,
    reviewer_due_date text,
    tags jsonb,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (training_series_id) REFERENCES training_series_assignment(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_attribute (
    id text,
    user_id text,
    api_name text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE path_assignment_tag (
    tags text,
    path_assignment_id text,
    path_id text,
    PRIMARY KEY (tags, path_assignment_id, path_id),
    FOREIGN KEY (path_assignment_id) REFERENCES path_assignment(id),
    FOREIGN KEY (path_id) REFERENCES path_assignment(path_id)
);

CREATE TABLE path_assignment (
    id text,
    path_id text,
    assigner_id text,
    user_id text,
    completed_at text,
    completion_percentage text,
    created_at text,
    created_through text,
    due_date text,
    is_completed text,
    modules_completed text,
    num_modules text,
    overall_grade text,
    time_spent text,
    title text,
    training_series_id text,
    updated_at text,
    PRIMARY KEY (id, path_id),
    FOREIGN KEY (path_id) REFERENCES "path"(id),
    FOREIGN KEY (assigner_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE scorm_assignment (
    _fivetran_id text,
    assigner text,
    scorm_id text,
    completed_at text,
    completion_percentage text,
    date_assigned text,
    due_date text,
    time_spent_in_minutes text,
    user_email text,
    user_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (assigner) REFERENCES users(id),
    FOREIGN KEY (scorm_id) REFERENCES scorm(id)
);

CREATE TABLE challenge_user_assignment (
    _fivetran_id text,
    challenge_id text,
    user_email text,
    completion_date text,
    grade_earned_points text,
    grade_incomplete text,
    grade_total_points text,
    is_fully_graded text,
    passed text,
    time_spent text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (challenge_id) REFERENCES challenge(id),
    FOREIGN KEY (user_email) REFERENCES users(email)
);

CREATE TABLE challenge (
    id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES challenge_assignment(challenge_id)
);

CREATE TABLE certification_award (
    id text,
    certification_id text,
    user_id text,
    course_user_assignment_id text,
    created_at text,
    file_url text,
    updated_at text,
    PRIMARY KEY (id, certification_id),
    FOREIGN KEY (certification_id) REFERENCES certification(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE group_user (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE academy_path_user_custom_registration (
    _fivetran_id text,
    academy_path_user_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (academy_path_user_id) REFERENCES academy_path_user(id)
);

CREATE TABLE academy_path_user (
    id text,
    path_id text,
    user_id text,
    academy_id text,
    completed_at text,
    path_description text,
    path_name text,
    segments jsonb,
    user_email text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (path_id) REFERENCES "path"(id),
    FOREIGN KEY (user_id) REFERENCES academy_user(id)
);

CREATE TABLE scim_user (
    id text,
    active text,
    external_id text,
    family_name text,
    formatted text,
    given_name text,
    location text,
    resource_type text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE users_direct_report (
    user_direct_report_id text,
    user_id text,
    PRIMARY KEY (user_direct_report_id, user_id),
    FOREIGN KEY (user_direct_report_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_certification (
    id text,
    user_id text,
    title text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    is_admin text,
    is_deleted text,
    is_permanently_deleted text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);
