CREATE TABLE "source" (
    id text,
    is_archived text,
    source_type_id text,
    source_type_is_archived text,
    source_type_title text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE offer_custom_field (
    id text,
    offer_id text,
    "value" text,
    PRIMARY KEY (id, offer_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE offer_file_handle (
    id text,
    offer_id text,
    handle text,
    "name" text,
    PRIMARY KEY (id, offer_id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE offer_version_custom_field (
    id text,
    offer_id text,
    offer_version_id text,
    "value" text,
    PRIMARY KEY (id, offer_id, offer_version_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (offer_id) REFERENCES offer_version(offer_id),
    FOREIGN KEY (offer_version_id) REFERENCES offer_version(id)
);

CREATE TABLE offer_version_file_handle (
    id text,
    offer_id text,
    offer_version_id text,
    handle text,
    "name" text,
    PRIMARY KEY (id, offer_id, offer_version_id),
    FOREIGN KEY (offer_id) REFERENCES offer_version(offer_id),
    FOREIGN KEY (offer_version_id) REFERENCES offer_version(id)
);

CREATE TABLE offer_version (
    id text,
    offer_id text,
    author_id text,
    created_at text,
    salary_currency_code text,
    salary_value text,
    start_date text,
    PRIMARY KEY (id, offer_id),
    FOREIGN KEY (offer_id) REFERENCES offer(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE offer (
    id text,
    application_id text,
    author_id text,
    acceptance_status text,
    decided_at text,
    latest_version_created_at text,
    latest_version_id text,
    latest_version_salary_currency_code text,
    latest_version_salary_value text,
    latest_version_start_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE application_feedback_form_definition_section_field_value (
    "index" text,
    application_feedback_id text,
    section_field_index text,
    section_field_value_index text,
    label text,
    "value" text,
    PRIMARY KEY ("index", application_feedback_id, section_field_index, section_field_value_index),
    FOREIGN KEY (application_feedback_id) REFERENCES application_feedback_form_definition_section_field(application_feedback_id),
    FOREIGN KEY (section_field_index) REFERENCES application_feedback_form_definition_section_field(section_field_index),
    FOREIGN KEY (section_field_value_index) REFERENCES application_feedback_form_definition_section_field("index")
);

CREATE TABLE application_feedback_form_definition_section_field (
    "index" text,
    section_field_index text,
    application_feedback_id text,
    description_html text,
    description_plain text,
    field_human_readable_path text,
    field_id text,
    field_is_nullable text,
    field_path text,
    field_title text,
    field_type text,
    is_required text,
    section_description_html text,
    section_description_plain text,
    title text,
    PRIMARY KEY ("index", section_field_index, application_feedback_id),
    FOREIGN KEY (application_feedback_id) REFERENCES application_feedback(id)
);

CREATE TABLE application_feedback_submitted_value (
    "name" text,
    application_feedback_id text,
    "value" text,
    PRIMARY KEY ("name", application_feedback_id),
    FOREIGN KEY (application_feedback_id) REFERENCES application_feedback(id)
);

CREATE TABLE application_feedback (
    id text,
    application_history_id text,
    application_id text,
    interview_id text,
    submitted_by_user_id text,
    feedback_form_definition_id text,
    submitted_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (application_history_id) REFERENCES application_history(id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (interview_id) REFERENCES interview(id),
    FOREIGN KEY (submitted_by_user_id) REFERENCES users(id)
);

CREATE TABLE source_tracking_link (
    id text,
    source_id text,
    code text,
    enabled text,
    link text,
    PRIMARY KEY (id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE application_history_allowed_action (
    "index" text,
    application_history_id text,
    application_id text,
    "action" text,
    PRIMARY KEY ("index", application_history_id, application_id),
    FOREIGN KEY (application_history_id) REFERENCES application_history(id),
    FOREIGN KEY (application_id) REFERENCES application_history(application_id)
);

CREATE TABLE application_history (
    id text,
    application_id text,
    actor_id text,
    entered_stage_at text,
    left_stage_at text,
    stage_id text,
    stage_number text,
    title text,
    PRIMARY KEY (id, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (actor_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    first_name text,
    global_role text,
    is_enabled text,
    last_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE job_board (
    id text,
    is_internal text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE interview_schedule_event_user_id (
    interview_schedule_event_id text,
    interview_schedule_id text,
    user_id text,
    PRIMARY KEY (interview_schedule_event_id, interview_schedule_id, user_id),
    FOREIGN KEY (interview_schedule_event_id) REFERENCES interview_schedule_event(id),
    FOREIGN KEY (interview_schedule_id) REFERENCES interview_schedule_event(interview_schedule_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE interview_schedule_event (
    id text,
    interview_schedule_id text,
    interview_id text,
    created_at text,
    end_time text,
    feedback_link text,
    has_submitted_feedback text,
    location text,
    meeting_link text,
    start_time text,
    updated_at text,
    PRIMARY KEY (id, interview_schedule_id),
    FOREIGN KEY (interview_schedule_id) REFERENCES interview_schedule(id),
    FOREIGN KEY (interview_id) REFERENCES interview(id)
);

CREATE TABLE interview_schedule (
    id text,
    application_id text,
    interview_stage_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE job_posting_location (
    "index" text,
    job_posting_id text,
    location_id text,
    PRIMARY KEY ("index", job_posting_id),
    FOREIGN KEY (job_posting_id) REFERENCES job_posting(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE job_posting (
    id text,
    job_id text,
    primary_location_id text,
    application_deadline text,
    apply_link text,
    compensation_tier_summary text,
    department_name text,
    employment_type text,
    external_link text,
    is_listed text,
    location_name text,
    published_date text,
    should_display_compensation_on_job_board text,
    team_name text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (primary_location_id) REFERENCES location(id)
);

CREATE TABLE job_opening (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES opening(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_interview_plan_id (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_posting_id (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES job_posting(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_custom_field (
    id text,
    job_id text,
    "value" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_hiring_team (
    job_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (job_id, user_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job (
    id text,
    author_id text,
    department_id text,
    location_id text,
    brand_id text,
    closed_at text,
    confidential text,
    created_at text,
    custom_requisition_id text,
    default_interview_plan_id text,
    employment_type text,
    opened_at text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE application_hiring_team_role (
    id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES hiring_team_role(id)
);

CREATE TABLE candidate_email_address (
    "index" text,
    candidate_id text,
    is_primary text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_phone_number (
    "index" text,
    candidate_id text,
    is_primary text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_social_link (
    "index" text,
    candidate_id text,
    "type" text,
    url text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_application_id (
    candidate_id text,
    id text,
    PRIMARY KEY (candidate_id, id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (id) REFERENCES application(id)
);

CREATE TABLE candidate_tag (
    id text,
    candidate_id text,
    is_archived text,
    title text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_file_hadle (
    id text,
    candidate_id text,
    handle text,
    "name" text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_custom_field (
    candidate_id text,
    id text,
    "value" text,
    PRIMARY KEY (candidate_id, id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (id) REFERENCES custom_field(id)
);

CREATE TABLE candidate (
    id text,
    credited_to_user_id text,
    primary_location_id text,
    source_id text,
    company text,
    created_at text,
    "name" text,
    "position" text,
    primary_location_summary text,
    profile_url text,
    resume_file_handle_handle text,
    resume_file_handle_id text,
    resume_file_handle_name text,
    school text,
    timezone text,
    updated_at text,
    -- primary_location_component_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (credited_to_user_id) REFERENCES users(id),
    FOREIGN KEY (primary_location_id) REFERENCES location(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE department (
    id text,
    parent_id text,
    is_archived text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES department(id)
);

CREATE TABLE custom_field_value (
    "index" text,
    custom_field_id text,
    is_archived text,
    label text,
    "value" text,
    PRIMARY KEY ("index", custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    field_type text,
    is_archived text,
    is_private text,
    object_type text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE hiring_team_role (
    id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE opening_job_id (
    "index" text,
    opening_id text,
    job_id text,
    PRIMARY KEY ("index", opening_id),
    FOREIGN KEY (opening_id) REFERENCES opening(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE opening_location_id (
    "index" text,
    opening_id text,
    location_id text,
    PRIMARY KEY ("index", opening_id),
    FOREIGN KEY (opening_id) REFERENCES opening(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE opening_hiring_team (
    opening_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (opening_id, user_id),
    FOREIGN KEY (opening_id) REFERENCES opening(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE opening_custom_field (
    id text,
    opening_id text,
    "value" text,
    PRIMARY KEY (id, opening_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (opening_id) REFERENCES opening(id)
);

CREATE TABLE opening (
    id text,
    archived_at text,
    closed_at text,
    is_archived text,
    latest_version_author_id text,
    latest_version_created_at text,
    latest_version_description text,
    latest_version_employment_type text,
    latest_version_id text,
    latest_version_identifier text,
    latest_version_is_backfill text,
    latest_version_target_hire_date text,
    latest_version_target_start_date text,
    latest_version_team_id text,
    opened_at text,
    opening_state text,
    PRIMARY KEY (id)
);

CREATE TABLE candidate_note (
    id text,
    candidate_id text,
    author_id text,
    content text,
    created_at text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE application_custom_field (
    application_id text,
    id text,
    "value" text,
    PRIMARY KEY (application_id, id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (id) REFERENCES custom_field(id)
);

CREATE TABLE application_hiring_team (
    application_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (application_id, user_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE application_opening (
    application_id text,
    id text,
    PRIMARY KEY (application_id, id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (id) REFERENCES opening(id)
);

CREATE TABLE application (
    id text,
    candidate_id text,
    credit_to_user_id text,
    job_id text,
    source_id text,
    applied_via_job_posting_id text,
    archive_reason_id text,
    archive_reason_is_archived text,
    archive_reason_text text,
    archive_reason_type text,
    archived_at text,
    created_at text,
    current_interview_stage_group_id text,
    current_interview_stage_id text,
    current_interview_stage_order_in_interview_plan text,
    current_interview_stage_plan_id text,
    current_interview_stage_title text,
    current_interview_stage_type text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (credit_to_user_id) REFERENCES users(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE interview_pool_training_stage_approval (
    id text,
    interview_pool_id text,
    interview_pool_training_stage_id text,
    PRIMARY KEY (id, interview_pool_id, interview_pool_training_stage_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (interview_pool_id) REFERENCES interview_pool_training_stage(interview_pool_id),
    FOREIGN KEY (interview_pool_training_stage_id) REFERENCES interview_pool_training_stage(id)
);

CREATE TABLE interview_pool_training_stage (
    id text,
    interview_pool_id text,
    approval_required text,
    interviewer_required text,
    interviewer_role text,
    PRIMARY KEY (id, interview_pool_id),
    FOREIGN KEY (interview_pool_id) REFERENCES interview_pool(id)
);

CREATE TABLE interview_pool (
    id text,
    is_archived text,
    title text,
    training_path_enabled text,
    training_path_id text,
    PRIMARY KEY (id)
);

CREATE TABLE location (
    id text,
    parent_location_id text,
    is_archived text,
    is_remote text,
    "name" text,
    postal_address_country text,
    postal_address_locality text,
    postal_address_region text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_location_id) REFERENCES location(id)
);

CREATE TABLE interview (
    id text,
    job_id text,
    feedback_form_definition_id text,
    instruction_html text,
    instruction_plain text,
    is_archived text,
    is_debrief text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);
