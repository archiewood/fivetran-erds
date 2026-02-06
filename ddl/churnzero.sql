CREATE TABLE contact_custom (
    "name" text,
    contact_id text,
    "value" text,
    PRIMARY KEY ("name", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    account_id text,
    crm_id text,
    email text,
    external_id text,
    first_name text,
    full_name text,
    last_name text,
    marketing_email_unsubscribed text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    tags jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE journey_progress (
    id text,
    account_id text,
    journey_id text,
    journey_instance_id text,
    begin_date text,
    days_in text,
    days_left text,
    days_over text,
    end_date text,
    evaluation_day text,
    failure_comment text,
    failure_reason text,
    is_completed text,
    is_failed text,
    object_created_date text,
    object_last_modified_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (journey_id) REFERENCES journey(id),
    FOREIGN KEY (journey_instance_id) REFERENCES journey_instance(id)
);

CREATE TABLE task_status (
    id text,
    is_closed text,
    is_default text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE event_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task_priority (
    id text,
    is_default text,
    is_high_priority text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    id text,
    account_id text,
    contact_id text,
    type_id text,
    "date" text,
    description text,
    quantity text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (type_id) REFERENCES event_type(id)
);

CREATE TABLE journey (
    id text,
    description text,
    expected_duration text,
    is_active text,
    is_shared_externally text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    progress_bottom text,
    progress_top text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE churn_score_factor_calculation (
    id text,
    account_id text,
    churn_score_factor_id text,
    churn_score_id text,
    "day" text,
    score text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (churn_score_factor_id) REFERENCES churn_score_factor(id),
    FOREIGN KEY (churn_score_id) REFERENCES churn_score(id)
);

CREATE TABLE account_custom (
    "name" text,
    account_id text,
    "value" text,
    PRIMARY KEY ("name", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    parent_account_id text,
    primary_churn_score_id text,
    user_account_id text,
    billing_address_city text,
    billing_address_country text,
    billing_address_line_1 text,
    billing_address_line_2 text,
    billing_address_state text,
    billing_address_zip text,
    contacts_count text,
    crm_id text,
    end_date text,
    external_id text,
    is_active text,
    license_count text,
    "name" text,
    next_renewal_date text,
    object_created_date text,
    object_last_modified_date text,
    parent_next_renewal_date text,
    parent_total_contract_amount text,
    primary_churn_score_value text,
    start_date text,
    tags jsonb,
    tenure_in_days text,
    total_contract_amount text,
    usage_frequency text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_account_id) REFERENCES account(id),
    FOREIGN KEY (primary_churn_score_id) REFERENCES churn_score(id),
    FOREIGN KEY (user_account_id) REFERENCES user_account(id)
);

CREATE TABLE journey_milestone_progress (
    id text,
    account_id text,
    journey_id text,
    journey_instance_id text,
    journey_milestone_id text,
    begin_date text,
    days_in text,
    days_left text,
    days_over text,
    end_date text,
    evaluation_day text,
    is_completed text,
    is_failed text,
    object_created_date text,
    object_last_modified_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (journey_id) REFERENCES journey(id),
    FOREIGN KEY (journey_instance_id) REFERENCES journey_instance(id),
    FOREIGN KEY (journey_milestone_id) REFERENCES journey_milestone(id)
);

CREATE TABLE journey_milestone_task (
    id text,
    journey_milestone_id text,
    is_conditional text,
    is_externally_visible text,
    is_optional text,
    object_created_date text,
    object_last_modified_date text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (journey_milestone_id) REFERENCES journey_milestone(id)
);

CREATE TABLE journey_milestone_step_progress (
    id text,
    account_id text,
    journey_id text,
    journey_instance_id text,
    journey_milestone_achievement_id text,
    journey_milestone_id text,
    journey_milestone_task_id text,
    task_id text,
    task_status_id text,
    is_completed text,
    object_created_date text,
    object_last_modified_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (journey_id) REFERENCES journey(id),
    FOREIGN KEY (journey_instance_id) REFERENCES journey_instance(id),
    FOREIGN KEY (journey_milestone_achievement_id) REFERENCES journey_milestone_achievement(id),
    FOREIGN KEY (journey_milestone_id) REFERENCES journey_milestone(id),
    FOREIGN KEY (journey_milestone_task_id) REFERENCES journey_milestone_task(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (task_status_id) REFERENCES task_status(id)
);

CREATE TABLE survey_response (
    id text,
    account_id text,
    contact_id text,
    survey_id text,
    "comment" text,
    "date" text,
    follow_up_answer_type text,
    follow_up_question text,
    follow_up_response text,
    next_reminder_date text,
    score text,
    "source" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE journey_milestone (
    id text,
    journey_id text,
    description text,
    expected_duration text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    progress_bottom text,
    progress_top text,
    PRIMARY KEY (id),
    FOREIGN KEY (journey_id) REFERENCES journey(id)
);

CREATE TABLE user_account (
    id text,
    avatar_url text,
    can_log_in text,
    crm_id text,
    email text,
    first_name text,
    has_account text,
    is_active text,
    last_name text,
    mobile_phone text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    office_phone text,
    title text,
    user_name text,
    PRIMARY KEY (id)
);

CREATE TABLE churn_score_factor (
    id text,
    churn_score_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (churn_score_id) REFERENCES churn_score(id)
);

CREATE TABLE task (
    id text,
    account_id text,
    contact_id text,
    priority_id text,
    status_id text,
    user_account_id text,
    close_date text,
    "comment" text,
    crm_id text,
    due_date text,
    is_closed text,
    is_high_priority text,
    object_created_date text,
    object_last_modified_date text,
    subject text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (priority_id) REFERENCES task_priority(id),
    FOREIGN KEY (status_id) REFERENCES task_status(id),
    FOREIGN KEY (user_account_id) REFERENCES user_account(id)
);

CREATE TABLE segment (
    id text,
    user_account_id text,
    entity text,
    is_global text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_account_id) REFERENCES user_account(id)
);

CREATE TABLE journey_milestone_achievement (
    id text,
    journey_milestone_id text,
    is_conditional text,
    is_externally_visible text,
    is_optional text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (journey_milestone_id) REFERENCES journey_milestone(id)
);

CREATE TABLE segment_column_set (
    id text,
    user_account_id text,
    entity text,
    "name" text,
    object_created_date text,
    object_last_modified_date text,
    share_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_account_id) REFERENCES user_account(id)
);

CREATE TABLE survey_segment (
    id text,
    survey_id text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (id) REFERENCES segment(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey_follow_up (
    "index" text,
    survey_id text,
    answer_type text,
    question text,
    PRIMARY KEY ("index", survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    campaign_status text,
    campaign_type text,
    drip_over_month text,
    is_active text,
    "name" text,
    question text,
    recurring_every_month text,
    settings_answer_type text,
    settings_choice_count text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE churn_score (
    id text,
    grading_bottom text,
    grading_top text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE churn_score_calculation (
    id text,
    account_id text,
    churn_score_id text,
    "day" text,
    is_active text,
    is_primary text,
    score text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (churn_score_id) REFERENCES churn_score(id)
);

CREATE TABLE journey_instance (
    id text,
    account_id text,
    journey_id text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (journey_id) REFERENCES journey(id)
);
