CREATE TABLE candidate_screening_answer_record_value (
    id text,
    candidate_screening_answer_id text,
    candidate_screening_answer_record_id text,
    label text,
    PRIMARY KEY (id, candidate_screening_answer_id, candidate_screening_answer_record_id),
    FOREIGN KEY (candidate_screening_answer_id) REFERENCES candidate_screening_answer_record(candidate_screening_answer_id),
    FOREIGN KEY (candidate_screening_answer_record_id) REFERENCES candidate_screening_answer_record(id)
);

CREATE TABLE candidate_screening_answer_record (
    id text,
    candidate_screening_answer_id text,
    label text,
    PRIMARY KEY (id, candidate_screening_answer_id),
    FOREIGN KEY (candidate_screening_answer_id) REFERENCES candidate_screening_answer(id)
);

CREATE TABLE candidate_screening_answer (
    candidate_primary_assignment_job_id text,
    id text,
    candidate_id text,
    category text,
    label text,
    "name" text,
    "type" text,
    PRIMARY KEY (candidate_primary_assignment_job_id, id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE offer (
    id text,
    candidate_id text,
    job_id text,
    created_on text,
    "status" text,
    updated_on text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE candidate_status_history (
    changed_on text,
    candidate_id text,
    job_id text,
    "status" text,
    sub_status text,
    PRIMARY KEY (changed_on, candidate_id, job_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE candidate_education (
    _fivetran_id text,
    candidate_id text,
    "current" text,
    degree text,
    description text,
    end_date text,
    institution text,
    location text,
    major text,
    start_date text,
    PRIMARY KEY (_fivetran_id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_experience (
    _fivetran_id text,
    candidate_id text,
    company text,
    "current" text,
    description text,
    end_date text,
    location text,
    start_date text,
    title text,
    PRIMARY KEY (_fivetran_id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_secondary_assignment (
    candidate_id text,
    job_id text,
    job_title text,
    reason_of_rejection_id text,
    reason_of_rejection_label text,
    reason_of_withdrawal_id text,
    reason_of_withdrawal_label text,
    "source" text,
    starts_on text,
    "status" text,
    sub_status text,
    PRIMARY KEY (candidate_id, job_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE candidate (
    id text,
    primary_assignment_job_id text,
    created_on text,
    email text,
    first_name text,
    internal text,
    last_name text,
    location_city text,
    location_country text,
    location_country_code text,
    location_latitude text,
    location_longitude text,
    location_region text,
    location_region_code text,
    phone_number text,
    primary_assignment_job_title text,
    primary_assignment_reason_of_rejection_id text,
    primary_assignment_reason_of_rejection_label text,
    primary_assignment_reason_of_withdrawal_id text,
    primary_assignment_reason_of_withdrawal_label text,
    primary_assignment_source text,
    primary_assignment_starts_on text,
    primary_assignment_status text,
    primary_assignment_sub_status text,
    tags jsonb,
    updated_on text,
    web_facebook text,
    web_linkedin text,
    web_skype text,
    web_twitter text,
    web_website text,
    PRIMARY KEY (id),
    FOREIGN KEY (primary_assignment_job_id) REFERENCES job(id)
);

CREATE TABLE reviews (
    id text,
    candidate_id text,
    job_id text,
    reviewer_id text,
    "comment" text,
    created_on text,
    overall_rating text,
    updated_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (reviewer_id) REFERENCES users(id)
);

CREATE TABLE hiring_process_substatus_in_review (
    "index" text,
    hiring_process_id text,
    "value" text,
    PRIMARY KEY ("index", hiring_process_id),
    FOREIGN KEY (hiring_process_id) REFERENCES hiring_process(id)
);

CREATE TABLE hiring_process_substatus_interview (
    "index" text,
    hiring_process_id text,
    "value" text,
    PRIMARY KEY ("index", hiring_process_id),
    FOREIGN KEY (hiring_process_id) REFERENCES hiring_process(id)
);

CREATE TABLE hiring_process_substatus_offered (
    "index" text,
    hiring_process_id text,
    "value" text,
    PRIMARY KEY ("index", hiring_process_id),
    FOREIGN KEY (hiring_process_id) REFERENCES hiring_process(id)
);

CREATE TABLE hiring_process (
    id text,
    active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE company (
    id text,
    industry_id text,
    industry_label text,
    location_address text,
    location_city text,
    location_country text,
    location_country_code text,
    location_latitude text,
    location_longitude text,
    location_postal_code text,
    location_region text,
    location_region_code text,
    logo text,
    "name" text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id text,
    archived text,
    description text,
    label text,
    PRIMARY KEY (id)
);

CREATE TABLE candidate_application (
    id text,
    candidate_id text,
    job_id text,
    "source" text,
    reason_of_rejection_id text,
    reason_of_rejection_label text,
    reason_of_withdrawal_id text,
    reason_of_withdrawal_label text,
    start_on text,
    "status" text,
    sub_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY ("source") REFERENCES candidate_source(label)
);

CREATE TABLE approval_step_approver (
    id text,
    approval_id text,
    decided_on text,
    decision text,
    PRIMARY KEY (id, approval_id),
    FOREIGN KEY (approval_id) REFERENCES approval_step(approval_id)
);

CREATE TABLE approval_step (
    "index" text,
    approval_id text,
    "status" text,
    PRIMARY KEY ("index", approval_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id)
);

CREATE TABLE approval (
    id text,
    job_approval_request_id text,
    decision_mode text,
    "status" text,
    subject_id text,
    subject_type text,
    "type" text,
    PRIMARY KEY (id, job_approval_request_id),
    FOREIGN KEY (job_approval_request_id) REFERENCES job_approval_request(id)
);

CREATE TABLE job_position (
    id text,
    job_id text,
    created_on text,
    incumbent_name text,
    position_id text,
    position_open_date text,
    "status" text,
    target_start_date text,
    "type" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_status_history (
    "status" text,
    job_id text,
    user_id text,
    changed_on text,
    PRIMARY KEY ("status", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_access_groups (
    group_id text,
    users_id text,
    PRIMARY KEY (group_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_seats (
    "value" text,
    users_id text,
    PRIMARY KEY ("value", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    email text,
    exteral_data text,
    first_name text,
    language_code text,
    last_name text,
    sso_identifier text,
    sso_login_mode text,
    system_role_id text,
    system_role_name text,
    updated_on text,
    PRIMARY KEY (id)
);

CREATE TABLE candidate_source (
    id text,
    source_type_id text,
    label text,
    source_subtype_id text,
    PRIMARY KEY (id, source_type_id)
);

CREATE TABLE company_active_posting_custom_field (
    "index" text,
    company_active_posting_id text,
    field_id text,
    field_label text,
    value_id text,
    value_label text,
    PRIMARY KEY ("index", company_active_posting_id),
    FOREIGN KEY (company_active_posting_id) REFERENCES company_active_posting(id)
);

CREATE TABLE company_active_posting (
    id text,
    company_id text,
    job_id text,
    creator_name text,
    default_job_ad text,
    "name" text,
    ref text,
    ref_number text,
    released_date text,
    uuid text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_application (
    job_id text,
    profile_id text,
    create_date text,
    source_identifier text,
    "status" text,
    sub_status text,
    PRIMARY KEY (job_id, profile_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (profile_id) REFERENCES candidate_application(id)
);

CREATE TABLE job_approval_position (
    "index" text,
    job_approval_request_id text,
    job_approval_request_job_id text,
    job_position_id text,
    PRIMARY KEY ("index", job_approval_request_id, job_approval_request_job_id),
    FOREIGN KEY (job_approval_request_id) REFERENCES job_approval_request(id),
    FOREIGN KEY (job_approval_request_job_id) REFERENCES job_approval_request(job_id),
    FOREIGN KEY (job_position_id) REFERENCES job_position(id)
);

CREATE TABLE job_approval_request (
    id text,
    job_id text,
    salary_range_currency text,
    salary_range_max text,
    salary_range_min text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_property (
    id text,
    job_id text,
    label text,
    value_id text,
    value_label text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    creator_id text,
    department_id text,
    compensation_currency text,
    compensation_max text,
    compensation_min text,
    created_on text,
    eeo_category_id text,
    eeo_category_label text,
    employment_type_id text,
    employment_type_label text,
    experience_level_id text,
    experience_level_label text,
    function_id text,
    function_label text,
    industry_id text,
    industry_label text,
    job_ad_additionl_information_text text,
    job_ad_additionl_information_title text,
    job_ad_company_text text,
    job_ad_company_title text,
    job_ad_job_text text,
    job_ad_job_title text,
    job_ad_qualification_text text,
    job_ad_qualification_title text,
    job_ad_videos jsonb,
    language_code text,
    language_label text,
    language_label_native text,
    last_activity_on text,
    location_address text,
    location_city text,
    location_country text,
    location_country_code text,
    location_latitude text,
    location_longitude text,
    location_manual text,
    location_postal_code text,
    location_region text,
    location_region_code text,
    location_remote text,
    posting_status text,
    ref_number text,
    "status" text,
    target_hiring_date text,
    template text,
    title text,
    updated_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE candidate_property (
    id text,
    candidate_id text,
    job_id text,
    label text,
    "type" text,
    "value" text,
    value_label text,
    PRIMARY KEY (id, candidate_id, job_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE interviewer (
    interview_id text,
    interview_timeslot_id text,
    interviewer_id text,
    "status" text,
    PRIMARY KEY (interview_id, interview_timeslot_id, interviewer_id),
    FOREIGN KEY (interview_id) REFERENCES interview_timeslot(interview_id),
    FOREIGN KEY (interview_timeslot_id) REFERENCES interview_timeslot(id),
    FOREIGN KEY (interviewer_id) REFERENCES users(id)
);

CREATE TABLE interview_timeslot (
    id text,
    interview_id text,
    candidate_status text,
    ends_on text,
    interview_type text,
    no_show text,
    place text,
    starts_on text,
    title text,
    PRIMARY KEY (id, interview_id),
    FOREIGN KEY (interview_id) REFERENCES interview(id)
);

CREATE TABLE interview (
    id text,
    candidate_application_id text,
    candidate_id text,
    job_id text,
    organizer_id text,
    created_on text,
    location text,
    ref_url text,
    "source" text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_application_id) REFERENCES candidate_application(id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (organizer_id) REFERENCES users(id)
);

CREATE TABLE job_publication (
    _fivetran_id text,
    job_id text,
    source_name text,
    posting_id text,
    published_on text,
    "type" text,
    unpublished_on text,
    PRIMARY KEY (_fivetran_id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (source_name) REFERENCES candidate_source(label)
);

CREATE TABLE job_hiring_team (
    id text,
    job_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
