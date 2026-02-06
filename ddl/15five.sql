CREATE TABLE security_audit (
    create_ts text,
    actor text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (create_ts),
    FOREIGN KEY (actor) REFERENCES users(id)
);

CREATE TABLE group_type (
    id text,
    company_group_set jsonb,
    create_ts text,
    name_plural text,
    name_singular text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_group_set) REFERENCES groups(id)
);

CREATE TABLE feature (
    _fivetran_id text,
    demographic_attribute text,
    pulse text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE one_on_one (
    id text,
    user_1_details_id text,
    user_2_details_id text,
    create_ts text,
    end_ts text,
    for_date text,
    is_draft text,
    user_1 text,
    user_1_role text,
    user_2 text,
    user_2_role text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_1_details_id) REFERENCES users(reviewer_id),
    FOREIGN KEY (user_2_details_id) REFERENCES users(id)
);

CREATE TABLE user_vacation (
    id text,
    user_id text,
    creation_date text,
    end_dt text,
    note text,
    start_dt text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question (
    id text,
    groups text,
    is_active text,
    is_optional text,
    metrics_params jsonb,
    question_frequency text,
    question_text text,
    question_type text,
    users text,
    PRIMARY KEY (id)
);

CREATE TABLE check_in_comment (
    _fivetran_id text,
    check_in_id text,
    comment_text text,
    users text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (check_in_id) REFERENCES check_in(id)
);

CREATE TABLE check_in_goal (
    _fivetran_id text,
    check_in_id text,
    goals jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (check_in_id) REFERENCES check_in(id)
);

CREATE TABLE check_in_accomplishment (
    _fivetran_id text,
    check_in_id text,
    goals jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (check_in_id) REFERENCES check_in(id)
);

CREATE TABLE check_in (
    id text,
    due_date text,
    high_five jsonb,
    objective jsonb,
    reporting_period text,
    reporting_period_end text,
    reporting_period_start text,
    reviewed_by text,
    reviewed_ts text,
    submit_ts text,
    users text,
    was_submitted_late text,
    PRIMARY KEY (id)
);

CREATE TABLE check_in_answer (
    _fivetran_id text,
    answer_text text,
    check_in_id text,
    create_ts text,
    goal_completed_ts text,
    goal_status text,
    goal_status_comment jsonb,
    metrics_value text,
    object_type text,
    question_text text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE groups (
    id text,
    create_ts text,
    group_admin jsonb,
    group_type text,
    group_type_name text,
    is_peer_drilldown text,
    is_peer_view text,
    member jsonb,
    members_count text,
    mention_name text,
    "name" text,
    skip_company_wide_question text,
    PRIMARY KEY (id)
);

CREATE TABLE company_group_id (
    "index" text,
    users_id text,
    company_group_id text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (company_group_id) REFERENCES groups(id)
);

CREATE TABLE users (
    id text,
    bi_weekly_due_day text,
    bi_weekly_due_day_which_week text,
    current_checkin_streak text,
    due_day text,
    email text,
    employee_id text,
    first_login_ts text,
    first_name text,
    hire_date_ts text,
    is_active text,
    is_company_admin text,
    is_reporter text,
    is_reviewer text,
    last_login_ts text,
    last_name text,
    location text,
    mention_name text,
    monthly_due_day text,
    monthly_due_day_which_in_month text,
    phone text,
    reporting_period text,
    reviewer_id text,
    skip_company_wide_question text,
    start_date_ts text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE answer (
    id text,
    answer_text text,
    "comment" jsonb,
    create_ts text,
    goal_completed_ts text,
    goal_status text,
    goal_status_comment jsonb,
    metrics_value text,
    question text,
    users text,
    PRIMARY KEY (id)
);

CREATE TABLE pulse (
    id text,
    create_ts text,
    report text,
    users text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE people_attribute (
    id text,
    datatype text,
    is_default text,
    is_only_admin_editable text,
    "name" text,
    slug text,
    PRIMARY KEY (id)
);
