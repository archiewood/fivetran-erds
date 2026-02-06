CREATE TABLE location (
    id text,
    address text,
    city text,
    country text,
    email text,
    headquarter text,
    lat text,
    long text,
    "name" text,
    phone text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE job_application (
    id text,
    candidate_id text,
    job_id text,
    job_stage_id text,
    rejection_reason_id text,
    changed_stage_at text,
    cover_letter text,
    created_at text,
    referring_site text,
    referring_url text,
    rejected_at text,
    row_order text,
    sourced text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (job_stage_id) REFERENCES application_stage(id),
    FOREIGN KEY (rejection_reason_id) REFERENCES rejection_reason(id)
);

CREATE TABLE referral (
    id text,
    candidate_id text,
    job_id text,
    user_id text,
    "comment" text,
    created_at text,
    email text,
    "name" text,
    phone text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE candidate_document_upload (
    candidate_id text,
    upload_id text,
    PRIMARY KEY (candidate_id, upload_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (upload_id) REFERENCES document_upload(id)
);

CREATE TABLE candidate (
    id text,
    connected text,
    consent_future_jobs_at text,
    created_at text,
    email text,
    facebook_id text,
    facebook_profile text,
    first_name text,
    internal text,
    last_name text,
    linkedin_profile text,
    linkedin_uid text,
    linkedin_url text,
    original_resume text,
    phone text,
    picture text,
    pitch text,
    referred text,
    referring_site text,
    referring_url text,
    restricted_at text,
    resume text,
    sourced text,
    tags jsonb,
    unsubscribed text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE job_question_alternative (
    id text,
    question_id text,
    title text,
    PRIMARY KEY (id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question (
    id text,
    description text,
    end_with text,
    multiple text,
    question_type text,
    single_line text,
    start_with text,
    title text,
    unit text,
    PRIMARY KEY (id)
);

CREATE TABLE "role" (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE requisition (
    id text,
    archived_at text,
    country text,
    created_at text,
    currency text,
    hired_count text,
    job_description text,
    job_title text,
    max_salary text,
    min_salary text,
    number_of_opening text,
    salary_time_unit text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE job_tag (
    "index" text,
    job_id text,
    tags text,
    PRIMARY KEY ("index", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_location (
    job_id text,
    location_id text,
    PRIMARY KEY (job_id, location_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE job_question (
    job_id text,
    question_id text,
    PRIMARY KEY (job_id, question_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE job_candidate (
    candidate_id text,
    job_id text,
    PRIMARY KEY (candidate_id, job_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_picked_question (
    job_id text,
    question_id text,
    PRIMARY KEY (job_id, question_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE job (
    id text,
    department_id text,
    requisition_id text,
    user_id text,
    apply_button_text text,
    cover_letter_requirement text,
    created_at text,
    currency text,
    employment_type text,
    end_date text,
    external_application_url text,
    human_status text,
    internal text,
    internal_name text,
    language_code text,
    mailbox text,
    name_requirement text,
    phone_requirement text,
    picture_original text,
    picture_standard text,
    picture_thumb text,
    pinned text,
    pitch text,
    recruiter_email text,
    remote_status text,
    resume_requirement text,
    sharing_image_layout text,
    start_date text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (requisition_id) REFERENCES requisition(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE rejection_reason (
    id text,
    reason text,
    rejected_by_company text,
    PRIMARY KEY (id)
);

CREATE TABLE answer (
    id text,
    candidate_id text,
    question_id text,
    answer text,
    boolean text,
    choice jsonb,
    created_at text,
    data text,
    "date" text,
    number text,
    question_type text,
    "range" text,
    text text,
    updated_at text,
    video_token text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE department_team (
    department_id text,
    team_id text,
    PRIMARY KEY (department_id, team_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE department (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE job_offer (
    id text,
    job_application_id text,
    user_id text,
    acceptance_message text,
    answered_at text,
    approval_status text,
    created_at text,
    job_type text,
    probation_period text,
    rejection_message text,
    reporting_manager_name_and_title text,
    response text,
    salary text,
    sent_at text,
    start_date text,
    "status" text,
    working_location text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_application_id) REFERENCES job_application(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_users (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE application_stage (
    id text,
    active_job_applications_count text,
    created_at text,
    "name" text,
    rejected_job_applications_count text,
    row_order text,
    stage_type text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE team_role (
    role_id text,
    team_id text,
    PRIMARY KEY (role_id, team_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    emoji text,
    "name" text,
    no_department text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    department_id text,
    location_id text,
    description text,
    email text,
    external_id text,
    facebook_profile text,
    hide_email text,
    hide_phone text,
    instagram_profile text,
    linkedin_profile text,
    locale text,
    login_email text,
    "name" text,
    other_profile text,
    phone text,
    picture_standard text,
    "role" text,
    role_add_on text,
    signature text,
    time_format text,
    time_zone text,
    title text,
    twitter_profile text,
    username text,
    visible text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE document_upload (
    id text,
    file_name text,
    internal text,
    url text,
    PRIMARY KEY (id)
);
