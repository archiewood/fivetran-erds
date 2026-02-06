CREATE TABLE office (
    id bigint,
    parent_id bigint,
    primary_contact_user_id bigint,
    external_id text,
    location_name text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES office(id),
    FOREIGN KEY (primary_contact_user_id) REFERENCES users(id)
);

CREATE TABLE discipline (
    id bigint,
    "name" text,
    priority integer,
    PRIMARY KEY (id)
);

CREATE TABLE "source" (
    id bigint,
    "name" text,
    source_type_id bigint,
    source_type_name text,
    PRIMARY KEY (id)
);

CREATE TABLE hiring_team_status (
    user_id bigint,
    job_id bigint,
    active boolean,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES hiring_team(user_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE demographic_question_set (
    id bigint,
    active boolean,
    description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE offer (
    id bigint,
    application_id bigint,
    opening_id bigint,
    created_at timestamp,
    resolved_at timestamp,
    sent_at text,
    starts_at text,
    "status" text,
    updated_at timestamp,
    version bigint,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (opening_id) REFERENCES job_opening(id)
);

CREATE TABLE demographic_answer_option (
    id bigint,
    demographic_question_id bigint,
    active boolean,
    free_from boolean,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (demographic_question_id) REFERENCES demographic_questions(id)
);

CREATE TABLE school (
    id bigint,
    "name" text,
    priority integer,
    PRIMARY KEY (id)
);

CREATE TABLE rejection_reason (
    id bigint,
    reason text,
    rejection_reason_type_id bigint,
    rejection_reason_type_name text,
    PRIMARY KEY (id)
);

CREATE TABLE job_history (
    updated_at timestamp,
    job_id bigint,
    closed_at timestamp,
    confidential boolean,
    "name" text,
    notes text,
    requisition_id text,
    "status" text,
    PRIMARY KEY (updated_at, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE application_history (
    updated_at timestamp,
    application_id bigint,
    new_stage_id bigint,
    new_status text,
    PRIMARY KEY (updated_at, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (new_stage_id) REFERENCES job_stage(id)
);

CREATE TABLE degree (
    id bigint,
    "name" text,
    priority integer,
    PRIMARY KEY (id)
);

CREATE TABLE prospect_stage (
    id bigint,
    prospect_pool_id bigint,
    "name" text,
    PRIMARY KEY (id, prospect_pool_id),
    FOREIGN KEY (prospect_pool_id) REFERENCES prospect_pool(id)
);

CREATE TABLE prospect_pool (
    id bigint,
    active boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_email (
    email text,
    user_id bigint,
    is_primary boolean,
    PRIMARY KEY (email, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_linked_candidate (
    candidate_id bigint,
    user_id bigint,
    PRIMARY KEY (candidate_id, user_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id bigint,
    created_at timestamp,
    disabled boolean,
    employee_id text,
    first_name text,
    last_name text,
    primary_email_address text,
    site_admin boolean,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE close_reason (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE candidate_tag (
    candidate_id bigint,
    tag_id bigint,
    PRIMARY KEY (candidate_id, tag_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE job_department (
    department_id bigint,
    job_id bigint,
    PRIMARY KEY (department_id, job_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_office (
    job_id bigint,
    office_id bigint,
    PRIMARY KEY (job_id, office_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE hiring_team (
    "role" text,
    job_id bigint,
    user_id bigint,
    responsible boolean,
    PRIMARY KEY ("role", job_id, user_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job (
    id bigint,
    closed_at timestamp,
    confidential boolean,
    created_at timestamp,
    is_template boolean,
    "name" text,
    notes text,
    opened_at timestamp,
    requisition_id text,
    "status" text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE email_template_cc (
    email_id text,
    email_template_id bigint,
    PRIMARY KEY (email_id, email_template_id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id)
);

CREATE TABLE email_template (
    id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    description text,
    from_email text,
    html_body text,
    is_default boolean,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE interview_question (
    id bigint,
    interview_id bigint,
    question text,
    PRIMARY KEY (id, interview_id),
    FOREIGN KEY (interview_id) REFERENCES interview(id)
);

CREATE TABLE interview (
    id bigint,
    job_stage_id bigint,
    interview_kit_content text,
    "name" text,
    PRIMARY KEY (id, job_stage_id),
    FOREIGN KEY (job_stage_id) REFERENCES job_stage(id)
);

CREATE TABLE job_stage (
    id bigint,
    job_id bigint,
    active boolean,
    created_at timestamp,
    "name" text,
    priority integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE offer_history (
    updated_at timestamp,
    offer_id bigint,
    application_id bigint,
    resolved_at timestamp,
    sent_at text,
    starts_at text,
    "status" text,
    version bigint,
    PRIMARY KEY (updated_at, offer_id),
    FOREIGN KEY (offer_id) REFERENCES offer(id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE scorecard_attribute (
    "index" integer,
    scorecard_id bigint,
    "name" text,
    note text,
    rating text,
    "type" text,
    PRIMARY KEY ("index", scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard_qna (
    "index" integer,
    scorecard_id bigint,
    answer text,
    id bigint,
    question text,
    PRIMARY KEY ("index", scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard (
    id bigint,
    application_id bigint,
    candidate_id bigint,
    created_at timestamp,
    interview text,
    interviewed_at timestamp,
    overall_recommendation text,
    submitted_at timestamp,
    submitted_by_user_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE user_role (
    id bigint,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE address (
    "index" integer,
    candidate_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE website_address (
    "index" integer,
    candidate_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE email_address (
    "index" integer,
    candidate_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE social_media_address (
    "index" integer,
    candidate_id bigint,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE phone_number (
    "index" integer,
    candidate_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE attachment (
    "index" integer,
    candidate_id bigint,
    filename text,
    "type" text,
    url text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE employment (
    "index" text,
    candidate_id bigint,
    company_name text,
    date_end text,
    date_start text,
    id bigint,
    title text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE education (
    "index" text,
    candidate_id bigint,
    degree text,
    discipline text,
    school_name text,
    end_date text,
    id bigint,
    start_date text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (degree) REFERENCES degree("name"),
    FOREIGN KEY (discipline) REFERENCES discipline("name"),
    FOREIGN KEY (school_name) REFERENCES school("name")
);

CREATE TABLE candidate (
    id bigint,
    coordinator_id bigint,
    new_candidate_id bigint,
    recruiter_id bigint,
    can_email boolean,
    company text,
    created_at timestamp,
    first_name text,
    is_private boolean,
    last_activity timestamp,
    last_name text,
    photo_url text,
    title text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (coordinator_id) REFERENCES users(id),
    FOREIGN KEY (new_candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (recruiter_id) REFERENCES users(id)
);

CREATE TABLE job_opening (
    id bigint,
    job_id bigint,
    application_id bigint,
    close_reason_id bigint,
    closed_at timestamp,
    opened_at timestamp,
    opening_id text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (close_reason_id) REFERENCES close_reason(id)
);

CREATE TABLE job_post_question (
    "index" integer,
    job_post_id bigint,
    description text,
    label text,
    "name" text,
    private boolean,
    required boolean,
    "type" text,
    values jsonb,
    PRIMARY KEY ("index", job_post_id),
    FOREIGN KEY (job_post_id) REFERENCES job_post(id)
);

CREATE TABLE job_post (
    id bigint,
    job_id bigint,
    active boolean,
    content text,
    created_at timestamp,
    demographic_question_set_id bigint,
    external boolean,
    first_published_at timestamp,
    internal boolean,
    internal_content text,
    job_post_custom_location_id bigint,
    job_post_location_type_id bigint,
    job_post_location_type_name text,
    live boolean,
    location_name text,
    location_office_id text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE eeoc (
    application_id bigint,
    disability_status_description text,
    disability_status_id bigint,
    gender_description text,
    gender_id bigint,
    race_description text,
    race_id bigint,
    submitted_at timestamp,
    veteran_status_description text,
    veteran_status_id bigint,
    PRIMARY KEY (application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE department (
    id bigint,
    parent_id bigint,
    external_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES department(id)
);

CREATE TABLE demographic_questions (
    id bigint,
    demographic_question_set_id bigint,
    active boolean,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (demographic_question_set_id) REFERENCES demographic_question_set(id)
);

CREATE TABLE approver (
    id bigint,
    approval_id bigint,
    approver_group_id bigint,
    email_addresses jsonb,
    employee_id text,
    "name" text,
    PRIMARY KEY (id, approval_id, approver_group_id),
    FOREIGN KEY (approval_id) REFERENCES approver_group(approval_id),
    FOREIGN KEY (approver_group_id) REFERENCES approver_group(id)
);

CREATE TABLE approver_group (
    id bigint,
    approval_id bigint,
    approvals_required integer,
    created_at timestamp,
    job_id bigint,
    offer_id text,
    priority integer,
    resolved_at timestamp,
    PRIMARY KEY (id, approval_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id)
);

CREATE TABLE approval (
    id bigint,
    job_id bigint,
    offer_id bigint,
    requested_by_user_id bigint,
    sequential boolean,
    "status" text,
    "type" text,
    version integer,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE scheduled_interviewer (
    interviewer_id bigint,
    scheduled_interview_id bigint,
    scorecard_id bigint,
    response_status text,
    PRIMARY KEY (interviewer_id, scheduled_interview_id),
    FOREIGN KEY (interviewer_id) REFERENCES users(id),
    FOREIGN KEY (scheduled_interview_id) REFERENCES scheduled_interview(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scheduled_interview (
    id bigint,
    application_id bigint,
    created_at timestamp,
    ends timestamp,
    interview_id bigint,
    location text,
    organizer_id bigint,
    "start" timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE demographic_answer (
    id bigint,
    application_id bigint,
    demographic_answer_option_id bigint,
    demographic_question_id bigint,
    created_at timestamp,
    free_form_text text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (demographic_answer_option_id) REFERENCES demographic_answer_option(id),
    FOREIGN KEY (demographic_question_id) REFERENCES demographic_questions(id)
);

CREATE TABLE job_application (
    application_id bigint,
    job_id bigint,
    PRIMARY KEY (application_id, job_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE application_qna (
    "index" integer,
    application_id bigint,
    answer text,
    question text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_attachment (
    "index" integer,
    application_id bigint,
    created_at timestamp,
    filename text,
    "type" text,
    url text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application (
    id bigint,
    candidate_id bigint,
    coordinator_id bigint,
    credited_to_user_id bigint,
    job_post_id bigint,
    recruiter_id bigint,
    rejection_reason_id bigint,
    source_id bigint,
    applied_at timestamp,
    current_stage_id bigint,
    current_stage_name text,
    last_activity_at timestamp,
    location_address text,
    prospect boolean,
    prospect_owner_id bigint,
    prospect_pool_id bigint,
    prospect_stage_id bigint,
    prospective_department text,
    prospective_office text,
    rejected_at timestamp,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (coordinator_id) REFERENCES users(id),
    FOREIGN KEY (credited_to_user_id) REFERENCES users(id),
    FOREIGN KEY (job_post_id) REFERENCES job_post(id),
    FOREIGN KEY (recruiter_id) REFERENCES users(id),
    FOREIGN KEY (rejection_reason_id) REFERENCES rejection_reason(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE user_permission (
    id bigint,
    user_id bigint,
    job_id bigint,
    user_role_id bigint,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_role_id) REFERENCES user_role(id)
);

CREATE TABLE note (
    id bigint,
    candidate_id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    private boolean,
    visibility text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE activity (
    id bigint,
    candidate_id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    subject text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE email_cc (
    cc_email text,
    email_id bigint,
    PRIMARY KEY (cc_email, email_id),
    FOREIGN KEY (email_id) REFERENCES email(id)
);

CREATE TABLE email (
    id bigint,
    candidate_id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    from_email text,
    subject text,
    to_email text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
