CREATE TABLE survey_category (
    id text,
    organization_id text,
    "name" text,
    sort_order text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE survey (
    id text,
    organization_id text,
    category_id text,
    activity_id text,
    allow_only_users_with_special_access text,
    description_is_displayed text,
    description_text text,
    display_in_calendar text,
    end_date text,
    footer_is_displayed text,
    footer_text text,
    has_instant_feedback text,
    is_active text,
    is_anonymous text,
    "name" text,
    prevent_moving_backwards text,
    shuffle text,
    sort_order text,
    start_date text,
    submission_text text,
    user_response_attempt_allowed_type_id text,
    user_response_number_of_attempts text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (category_id) REFERENCES survey_category(id)
);

CREATE TABLE survey_question_info (
    "name" text,
    survey_question_id text,
    survey_question_organization_id text,
    survey_question_survey_id text,
    "value" text,
    PRIMARY KEY ("name", survey_question_id, survey_question_organization_id, survey_question_survey_id),
    FOREIGN KEY (survey_question_id) REFERENCES survey_question(id),
    FOREIGN KEY (survey_question_organization_id) REFERENCES survey_question(organization_id),
    FOREIGN KEY (survey_question_survey_id) REFERENCES survey_question(survey_id)
);

CREATE TABLE survey_question (
    id text,
    organization_id text,
    survey_id text,
    bonus text,
    difficulty text,
    feedback text,
    hint text,
    last_modified text,
    last_modified_by text,
    mandatory text,
    "name" text,
    points text,
    section_id text,
    template_id text,
    template_version_id text,
    text text,
    type_id text,
    PRIMARY KEY (id, organization_id, survey_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE organization (
    id text,
    code text,
    "name" text,
    "path" text,
    type_code text,
    type_id text,
    type_name text,
    PRIMARY KEY (id)
);

CREATE TABLE enrollement_class_list (
    id text,
    organization_id text,
    classlist_role_display_name text,
    display_name text,
    email text,
    is_online text,
    org_defined_id text,
    profile_id text,
    role_id text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE topic (
    id text,
    module_id text,
    organization_id text,
    activity_id text,
    activity_type text,
    bookmarked text,
    completion_type text,
    description_text text,
    end_date_time text,
    grade_item_id text,
    identifier text,
    is_broken text,
    is_exempt text,
    is_hidden text,
    is_locked text,
    last_modified_date text,
    sort_order text,
    start_date_time text,
    title text,
    tool_id text,
    tool_item_id text,
    type_identifier text,
    unread text,
    url text,
    PRIMARY KEY (id, module_id, organization_id),
    FOREIGN KEY (module_id) REFERENCES module(id),
    FOREIGN KEY (organization_id) REFERENCES module(organization_id)
);

CREATE TABLE module (
    id text,
    organization_id text,
    default_path text,
    description_text text,
    end_date_time text,
    is_hidden text,
    is_locked text,
    last_modified_date text,
    pacing_end_date text,
    pacing_start_date text,
    sort_order text,
    start_date_time text,
    sub_modules jsonb,
    title text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE quiz (
    id text,
    organization_id text,
    activity_id text,
    allow_hints text,
    allow_only_users_with_special_access text,
    auto_export_to_grade text,
    calc_type_id text,
    category_id text,
    description_is_displayed text,
    description_text text,
    disable_pager_and_alerts text,
    disable_right_click text,
    display_in_calendar text,
    due_date text,
    end_date text,
    footer_is_displayed text,
    footer_text text,
    grade_item_id text,
    header_is_displayed text,
    header_text text,
    instructions_is_displayed text,
    instructions_text text,
    is_active text,
    is_attempts_unlimited text,
    is_auto_set_graded text,
    is_retake_incorrect_only text,
    late_limit_minutes text,
    late_submission_option text,
    "name" text,
    notification_email text,
    number_of_attempts_allowed text,
    password text,
    prevent_moving_backwards text,
    restrict_ip_address_range jsonb,
    shuffle text,
    sort_order text,
    start_date text,
    submission_grace_period text,
    submission_time_limit_is_enforced text,
    submission_time_limit_show_clock text,
    submission_time_limit_time_limit_value text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE completion (
    org_id text,
    topic_id text,
    user_id text,
    completion_date text,
    completion_type text,
    PRIMARY KEY (org_id, topic_id, user_id),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE enrollment_user (
    id text,
    organization_id text,
    email text,
    org_defined_id text,
    profile_badge_url text,
    profile_id text,
    role_code text,
    role_id text,
    role_name text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE users (
    id text,
    org_id text,
    display_name text,
    external_email text,
    first_name text,
    is_active text,
    last_accessed_date text,
    last_name text,
    middle_name text,
    org_defined_id text,
    pronoun text,
    unique_identifier text,
    user_name text,
    PRIMARY KEY (id, org_id),
    FOREIGN KEY (org_id) REFERENCES organization(id)
);

CREATE TABLE survey_attempt (
    id text,
    organization_id text,
    survey_id text,
    user_id text,
    attempt_number text,
    completed text,
    started text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
