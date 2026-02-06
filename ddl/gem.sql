CREATE TABLE project_value_option (
    value_option_id text,
    field_project_id text,
    project_field_index text,
    PRIMARY KEY (value_option_id, field_project_id, project_field_index),
    FOREIGN KEY (field_project_id) REFERENCES project_field(project_id),
    FOREIGN KEY (project_field_index) REFERENCES project_field("index")
);

CREATE TABLE project_field (
    "index" text,
    project_id text,
    id text,
    "name" text,
    "value" text,
    value_type text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    user_id text,
    context text,
    created_at text,
    description text,
    is_archived text,
    "name" text,
    privacy_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE candidate_custom_value_option (
    candidate_custom_field_index text,
    custom_field_candidate_id text,
    custom_value_option_id text,
    PRIMARY KEY (candidate_custom_field_index, custom_field_candidate_id, custom_value_option_id),
    FOREIGN KEY (candidate_custom_field_index) REFERENCES candidate_custom_field("index"),
    FOREIGN KEY (custom_field_candidate_id) REFERENCES candidate_custom_field(candidate_id),
    FOREIGN KEY (custom_value_option_id) REFERENCES custom_field_option(id)
);

CREATE TABLE candidate_custom_field (
    "index" text,
    candidate_id text,
    id text,
    project_id text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE candidate_work_info (
    _fivetran_id text,
    candidate_id text,
    company text,
    is_current text,
    title text,
    work_end_date text,
    work_start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_education_info (
    _fivetran_id text,
    candidate_id text,
    degree text,
    end_date text,
    field_of_study text,
    school text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_profile (
    _fivetran_id text,
    candidate_id text,
    network text,
    url text,
    user_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_email (
    _fivetran_id text,
    candidate_id text,
    email_address text,
    is_primary text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_project (
    candidate_id text,
    project_id text,
    PRIMARY KEY (candidate_id, project_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE candidate (
    id text,
    created_by text,
    user_id text,
    candidate_greenhouse_id text,
    company text,
    created_at text,
    due_date text,
    first_name text,
    last_name text,
    linked_in_handle text,
    location text,
    nickname text,
    note text,
    phone_number text,
    school text,
    sourced_from text,
    title text,
    weblink text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE ats_office (
    id text,
    child_department_external_id jsonb,
    child_id jsonb,
    deleted_at timestamp,
    location_name text,
    "name" text,
    parent_id text,
    parent_office_external_id text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_option (
    id text,
    custom_field_id text,
    is_hidden text,
    "value" text,
    PRIMARY KEY (id, custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    project_id text,
    created_at text,
    is_hidden text,
    "name" text,
    scope text,
    value_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE users (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE "sequence" (
    id text,
    user_id text,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE candidate_note (
    id text,
    candidate_id text,
    user_id text,
    content text,
    is_private text,
    time_stamp text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE candidate_uploaded_resumes (
    id text,
    candidate_id text,
    user_id text,
    created_at text,
    download_url text,
    file_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE ats_scheduled_interviewer (
    id text,
    ats_scheduled_interview_id text,
    scorecard_id text,
    email text,
    employee_id text,
    "name" text,
    response_status text,
    PRIMARY KEY (id, ats_scheduled_interview_id),
    FOREIGN KEY (ats_scheduled_interview_id) REFERENCES ats_scheduled_interview(id),
    FOREIGN KEY (scorecard_id) REFERENCES ats_scorecard(id)
);

CREATE TABLE ats_scheduled_interview_question (
    id text,
    ats_scheduled_interview_id text,
    answer text,
    "option" jsonb,
    question text,
    "type" text,
    PRIMARY KEY (id, ats_scheduled_interview_id),
    FOREIGN KEY (ats_scheduled_interview_id) REFERENCES ats_scheduled_interview(id)
);

CREATE TABLE ats_scheduled_interview (
    id text,
    ats_application_id text,
    ats_candidate_id text,
    organizer_id text,
    created_at timestamp,
    end_date_time timestamp,
    external_event_id text,
    interview_id text,
    interview_name text,
    job_stage_interview_item_id text,
    location text,
    start_date_time timestamp,
    "status" text,
    updated_at timestamp,
    video_conferencing_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (ats_application_id) REFERENCES ats_application(id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id),
    FOREIGN KEY (organizer_id) REFERENCES ats_user(id)
);

CREATE TABLE ats_application_job (
    id text,
    ats_application_id text,
    "name" text,
    PRIMARY KEY (id, ats_application_id),
    FOREIGN KEY (ats_application_id) REFERENCES ats_application(id)
);

CREATE TABLE ats_application (
    id text,
    ats_candidate_id text,
    ats_job_post_id text,
    applied_at timestamp,
    coordinator_email text,
    coordinator_id text,
    credited_to text,
    current_stage_id text,
    current_stage_name text,
    deleted_at timestamp,
    last_activity_at timestamp,
    recruiter_email text,
    recruiter_id text,
    rejected_at timestamp,
    rejection_reason_id text,
    rejection_reason_name text,
    rejection_reason_type jsonb,
    source_public_name text,
    source_user_id text,
    sourcer_email text,
    sourcer_id text,
    "status" text,
    -- custom_fields_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id),
    FOREIGN KEY (ats_job_post_id) REFERENCES ats_job_post(id)
);

CREATE TABLE ats_opening (
    id text,
    ats_application_id text,
    closed_at timestamp,
    deleted_at timestamp,
    opened_at timestamp,
    opening_id text,
    "status" text,
    target_hire_date text,
    target_start_date text,
    -- custom_fields_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ats_application_id) REFERENCES ats_application(id)
);

CREATE TABLE ats_scorecard_question (
    id text,
    ats_scorecard_id text,
    answer text,
    "option" jsonb,
    question text,
    "type" text,
    PRIMARY KEY (id, ats_scorecard_id),
    FOREIGN KEY (ats_scorecard_id) REFERENCES ats_scorecard(id)
);

CREATE TABLE ats_scorecard (
    id text,
    ats_application_id text,
    ats_candidate_id text,
    created_at timestamp,
    deleted_at timestamp,
    interview text,
    interview_id text,
    interview_step_id text,
    interview_step_name text,
    interviewed_at timestamp,
    interviewer_employee_id text,
    interviewer_first_name text,
    interviewer_id text,
    interviewer_last_name text,
    interviewer_name text,
    overall_feedback text,
    overall_recommendation text,
    submitted_at timestamp,
    submitted_by_employee_id text,
    submitted_by_first_name text,
    submitted_by_id text,
    submitted_by_last_name text,
    submitted_by_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ats_application_id) REFERENCES ats_application(id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id)
);

CREATE TABLE ats_candidate_attachment (
    "index" text,
    ats_candidate_id text,
    created_at timestamp,
    file_name text,
    "type" text,
    url text,
    PRIMARY KEY ("index", ats_candidate_id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id)
);

CREATE TABLE ats_candidate_education (
    id text,
    ats_candidate_id text,
    degree text,
    discipline text,
    end_date text,
    school_name text,
    start_date text,
    PRIMARY KEY (id, ats_candidate_id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id)
);

CREATE TABLE ats_candidate_employment (
    id text,
    ats_candidate_id text,
    company_name text,
    end_date text,
    start_date text,
    title text,
    PRIMARY KEY (id, ats_candidate_id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id)
);

CREATE TABLE ats_candidate (
    id text,
    company text,
    created_at timestamp,
    deleted_at timestamp,
    email_address jsonb,
    first_name text,
    is_private text,
    last_activity timestamp,
    last_name text,
    linked_user_id jsonb,
    phone_number jsonb,
    social_media_address jsonb,
    tags jsonb,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ats_user_office (
    ats_user_id text,
    id text,
    PRIMARY KEY (ats_user_id, id),
    FOREIGN KEY (ats_user_id) REFERENCES ats_user(id),
    FOREIGN KEY (id) REFERENCES ats_office(id)
);

CREATE TABLE ats_user_department (
    ats_user_id text,
    id text,
    PRIMARY KEY (ats_user_id, id),
    FOREIGN KEY (ats_user_id) REFERENCES ats_user(id),
    FOREIGN KEY (id) REFERENCES ats_job_department(id)
);

CREATE TABLE ats_user (
    id text,
    created_at timestamp,
    deleted_at timestamp,
    disabled text,
    email jsonb,
    employee_id text,
    first_name text,
    last_name text,
    linked_ats_candidate_id jsonb,
    "name" text,
    primary_email_address text,
    site_admin text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ats_job_post (
    id text,
    ats_job_id text,
    active text,
    content text,
    created_at timestamp,
    deleted_at timestamp,
    external text,
    first_published_at timestamp,
    internal text,
    internal_content text,
    listed text,
    live text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id)
);

CREATE TABLE ats_job_department (
    id text,
    ats_job_id text,
    parent_id text,
    child_department_external_id jsonb,
    child_id jsonb,
    deleted_at timestamp,
    "name" text,
    parent_department_external_id text,
    PRIMARY KEY (id, ats_job_id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id),
    FOREIGN KEY (parent_id) REFERENCES ats_job_department(id)
);

CREATE TABLE ats_job_office (
    ats_job_id text,
    id text,
    PRIMARY KEY (ats_job_id, id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id),
    FOREIGN KEY (id) REFERENCES ats_office(id)
);

CREATE TABLE ats_job_hiring_team_manager (
    id text,
    ats_job_id text,
    employee_id text,
    first_name text,
    last_name text,
    "name" text,
    PRIMARY KEY (id, ats_job_id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id)
);

CREATE TABLE ats_job_hiring_team_recruiter (
    id text,
    ats_job_id text,
    employee_id text,
    first_name text,
    last_name text,
    "name" text,
    PRIMARY KEY (id, ats_job_id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id)
);

CREATE TABLE ats_job_hiring_team_coordinator (
    id text,
    ats_job_id text,
    employee_id text,
    first_name text,
    last_name text,
    "name" text,
    PRIMARY KEY (id, ats_job_id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id)
);

CREATE TABLE ats_job_hiring_team_sourcer (
    id text,
    ats_job_id text,
    employee_id text,
    first_name text,
    last_name text,
    "name" text,
    PRIMARY KEY (id, ats_job_id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id)
);

CREATE TABLE ats_job (
    id text,
    closed_at timestamp,
    confidential text,
    created_at timestamp,
    deleted_at timestamp,
    is_template text,
    "name" text,
    opened_at timestamp,
    requisition_id text,
    "status" text,
    updated_at timestamp,
    -- custom_fields_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE ats_offer_compensation (
    "index" text,
    ats_offer_id text,
    currency_code text,
    "interval" text,
    "type" text,
    unit text,
    "value" text,
    value_type text,
    PRIMARY KEY ("index", ats_offer_id),
    FOREIGN KEY (ats_offer_id) REFERENCES ats_offer(id)
);

CREATE TABLE ats_offer (
    id text,
    ats_application_id text,
    ats_candidate_id text,
    ats_job_id text,
    opening_id text,
    created_at timestamp,
    deleted_at timestamp,
    sent_at text,
    starts_at text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ats_application_id) REFERENCES ats_application(id),
    FOREIGN KEY (ats_candidate_id) REFERENCES ats_candidate(id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id),
    FOREIGN KEY (opening_id) REFERENCES ats_opening(id)
);

CREATE TABLE ats_job_stage_interview_default_interviewer_user (
    id text,
    ats_job_stage_id text,
    ats_job_stage_interview_id text,
    employee_id text,
    first_name text,
    last_name text,
    "name" text,
    PRIMARY KEY (id, ats_job_stage_id, ats_job_stage_interview_id),
    FOREIGN KEY (ats_job_stage_id) REFERENCES ats_job_stage_interview(ats_job_stage_id),
    FOREIGN KEY (ats_job_stage_interview_id) REFERENCES ats_job_stage_interview(id)
);

CREATE TABLE ats_job_stage_interview_question (
    id text,
    ats_job_stage_id text,
    ats_job_stage_interview_id text,
    question text,
    PRIMARY KEY (id, ats_job_stage_id, ats_job_stage_interview_id),
    FOREIGN KEY (ats_job_stage_id) REFERENCES ats_job_stage_interview(ats_job_stage_id),
    FOREIGN KEY (ats_job_stage_interview_id) REFERENCES ats_job_stage_interview(id)
);

CREATE TABLE ats_job_stage_interview (
    id text,
    ats_job_stage_id text,
    deleted_at timestamp,
    estimated_minutes text,
    interview_kit_content text,
    interview_kit_id text,
    item_id text,
    "name" text,
    schedulable text,
    PRIMARY KEY (id, ats_job_stage_id),
    FOREIGN KEY (ats_job_stage_id) REFERENCES ats_job_stage(id)
);

CREATE TABLE ats_job_stage (
    id text,
    ats_job_id text,
    active text,
    created_at timestamp,
    deleted_at timestamp,
    "name" text,
    priority text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ats_job_id) REFERENCES ats_job(id)
);
