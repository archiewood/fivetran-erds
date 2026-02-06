CREATE TABLE users (
    id text,
    birth_date text,
    created_at text,
    department_id text,
    email text,
    external_user_id text,
    gender text,
    is_admin boolean,
    manager_id text,
    "name" text,
    preferred_name text,
    start_date text,
    "status" text,
    timezone text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE goal_user (
    goal_id text,
    user_id text,
    PRIMARY KEY (goal_id, user_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_rating_scale (
    _fivetran_id text,
    question_id text,
    descriptor text,
    "value" double precision,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question (
    id text,
    body text,
    choices text,
    description text,
    has_free_form_text boolean,
    PRIMARY KEY (id)
);

CREATE TABLE user_direct_report (
    report_id text,
    user_id text,
    PRIMARY KEY (report_id, user_id),
    FOREIGN KEY (report_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE revision_question_rating_scale (
    _fivetran_id text,
    revision_question_id text,
    descriptor text,
    "value" double precision,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (revision_question_id) REFERENCES revision_question(id)
);

CREATE TABLE revision_question (
    id text,
    body text,
    choices text,
    description text,
    has_free_form_text boolean,
    PRIMARY KEY (id)
);

CREATE TABLE review_competency (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_competency (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task (
    id text,
    goal_id text,
    review_cycle_id text,
    user_id text,
    complete_requests_count bigint,
    due_at timestamp,
    object text,
    total_requests_count bigint,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (review_cycle_id) REFERENCES review_cycle(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE review_cycle_reviewee (
    reviewee_id text,
    review_cycle_id text,
    user_id text,
    PRIMARY KEY (reviewee_id),
    FOREIGN KEY (reviewee_id) REFERENCES users(id),
    FOREIGN KEY (review_cycle_id) REFERENCES review_cycle(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE department (
    id text,
    created_at timestamp,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_attribute (
    id text,
    "name" text,
    "type" text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_attribute_value (
    id text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_custom_attribute (
    custom_attribute_id text,
    custom_attribute_value_id text,
    custom_attribute_temp_users_id text,
    user_id text,
    PRIMARY KEY (custom_attribute_id, custom_attribute_value_id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id),
    FOREIGN KEY (custom_attribute_value_id) REFERENCES custom_attribute_value(id),
    FOREIGN KEY (custom_attribute_temp_users_id) REFERENCES users(id)
);

CREATE TABLE child_goal (
    child_goal_id text,
    goal_id text,
    PRIMARY KEY (child_goal_id, goal_id),
    FOREIGN KEY (child_goal_id) REFERENCES goal(id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE tag_goal (
    goal_id text,
    tag_id text,
    PRIMARY KEY (goal_id, tag_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE goal (
    id text,
    department_id text,
    parent_goal_id text,
    amount_type text,
    archived_at timestamp,
    completed_at timestamp,
    created_at timestamp,
    current_amount double precision,
    description text,
    due_date text,
    ending_amount double precision,
    goal_type text,
    is_private boolean,
    last_updated_at timestamp,
    "name" text,
    priority text,
    published_at timestamp,
    start_date text,
    starting_amount double precision,
    "state" text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (parent_goal_id) REFERENCES goal(id)
);

CREATE TABLE update_response (
    id text,
    update_id text,
    answer text,
    question text,
    PRIMARY KEY (id),
    FOREIGN KEY (update_id) REFERENCES updates(id)
);

CREATE TABLE updates (
    id text,
    author_id text,
    manager_id text,
    created_at timestamp,
    is_public boolean,
    published_at timestamp,
    reviewed_at timestamp,
    sentiment_id text,
    sentiment_rating double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

CREATE TABLE review (
    id text,
    competency_id text,
    goal_id text,
    question_id text,
    review_cycle_id text,
    reviewee_id text,
    reviewer_id text,
    revision_question_id text,
    calibrated_response_choices text,
    calibrated_response_comment text,
    calibrated_response_comment_sentiment double precision,
    calibrated_response_created_at timestamp,
    calibrated_response_rating double precision,
    calibrated_response_updated_at timestamp,
    declined_at timestamp,
    response_choices text,
    response_comment text,
    response_comment_sentiment double precision,
    response_created_at timestamp,
    response_rating double precision,
    response_updated_at timestamp,
    review_type text,
    submitted_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (competency_id) REFERENCES review_competency(id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (review_cycle_id) REFERENCES review_cycle(id),
    FOREIGN KEY (reviewee_id) REFERENCES review_cycle_reviewee(reviewee_id),
    FOREIGN KEY (reviewer_id) REFERENCES users(id),
    FOREIGN KEY (revision_question_id) REFERENCES revision_question(id)
);

CREATE TABLE tags (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_target (
    feedback_id text,
    user_id text,
    PRIMARY KEY (feedback_id, user_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE feedback_company (
    company_value_id text,
    feedback_id text,
    PRIMARY KEY (company_value_id, feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id)
);

CREATE TABLE feedback (
    id text,
    author_id text,
    competency_id text,
    feedback_request_author_id text,
    feedback_request_competency_id text,
    feedback_request_subject_id text,
    body text,
    created_at timestamp,
    feedback_request_body text,
    feedback_request_created_at timestamp,
    feedback_request_fulfilled_at timestamp,
    is_public boolean,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (competency_id) REFERENCES feedback_competency(id),
    FOREIGN KEY (feedback_request_author_id) REFERENCES users(id),
    FOREIGN KEY (feedback_request_competency_id) REFERENCES feedback_competency(id),
    FOREIGN KEY (feedback_request_subject_id) REFERENCES users(id)
);

CREATE TABLE review_cycle (
    id text,
    creator_id text,
    created_at timestamp,
    "name" text,
    peer_selection_started_at timestamp,
    reviews_ended_at timestamp,
    reviews_started_at timestamp,
    stage text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);
