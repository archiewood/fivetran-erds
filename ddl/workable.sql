CREATE TABLE job_activity (
    "action" text,
    job_id text,
    candidate_id text,
    member_id text,
    body text,
    created_at text,
    stage_name text,
    PRIMARY KEY ("action", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE job_stage (
    job_id text,
    "position" text,
    PRIMARY KEY (job_id, "position"),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY ("position") REFERENCES stage("position")
);

CREATE TABLE candidate_education_entry (
    id text,
    candidate_id text,
    degree text,
    end_date text,
    field_of_study text,
    school text,
    start_date text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_experience_entry (
    id text,
    candidate_id text,
    company text,
    "current" text,
    end_date text,
    industry text,
    start_date text,
    summary text,
    title text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_social_profile (
    "index" text,
    candidate_id text,
    "name" text,
    "type" text,
    url text,
    username text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_answer (
    _fivetran_id text,
    candidate_id text,
    question text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate (
    id text,
    job_shortcode text,
    account_name text,
    account_sub_domain text,
    address text,
    cover_letter text,
    created_at text,
    disqualification_reason text,
    disqualified text,
    disqualified_at text,
    domain text,
    email text,
    first_name text,
    head_line text,
    hired_at text,
    last_name text,
    location_city text,
    location_country text,
    location_country_code text,
    location_region text,
    location_region_code text,
    location_str text,
    location_zip_code text,
    "name" text,
    originating_candidate_id text,
    phone text,
    resume_url text,
    skills jsonb,
    sourced text,
    stage text,
    summary text,
    updated_at text,
    uploader_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_shortcode) REFERENCES job(shortcode)
);

CREATE TABLE event_member (
    event_id text,
    id text,
    PRIMARY KEY (event_id, id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (id) REFERENCES member(id)
);

CREATE TABLE event (
    id text,
    candidate_id text,
    job_shortcode text,
    description text,
    ends_at text,
    starts_at text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_shortcode) REFERENCES job(shortcode)
);

CREATE TABLE member (
    id text,
    email text,
    head_line text,
    "name" text,
    "role" text,
    PRIMARY KEY (id)
);

CREATE TABLE recruiter (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE requisition_approver (
    id text,
    requisition_approval_group_id text,
    decision text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES member(id),
    FOREIGN KEY (requisition_approval_group_id) REFERENCES requisition_approval_group(id)
);

CREATE TABLE requisition_approval_group (
    id text,
    requisition_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (requisition_id) REFERENCES requisition(id)
);

CREATE TABLE requisition (
    id text,
    department_id text,
    hiring_manager_id text,
    job_id text,
    owner_id text,
    codes text,
    employment_type text,
    location_city text,
    location_country text,
    location_country_code text,
    location_region text,
    location_region_code text,
    location_str text,
    location_zip_code text,
    plan_date text,
    reason text,
    requester_id text,
    requester_name text,
    salary_range_currency text,
    salary_range_frequency text,
    salary_range_salary_from text,
    salary_range_salary_to text,
    start_date text,
    "state" text,
    -- requisition_custom_attributes_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES job_deparment_hierarchy(id),
    FOREIGN KEY (hiring_manager_id) REFERENCES member(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (owner_id) REFERENCES member(id)
);

CREATE TABLE job_member (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES member(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE candidate_document_variable (
    _fivetran_id text,
    candidate_offer_candidate_id text,
    "name" text,
    slug text,
    -- custom_value_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (candidate_offer_candidate_id) REFERENCES candidate_offer(candidate_id)
);

CREATE TABLE candidate_offer_document (
    _fivetran_id text,
    candidate_offer_candidate_id text,
    kind text,
    "name" text,
    preview_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (candidate_offer_candidate_id) REFERENCES candidate_offer(candidate_id)
);

CREATE TABLE candidate_offer (
    candidate_id text,
    created_at text,
    "state" text,
    PRIMARY KEY (candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE job_deparment_hierarchy (
    id text,
    job_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_keyword (
    keyword text,
    job_id text,
    PRIMARY KEY (keyword, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    application_url text,
    benefits text,
    code text,
    created_at text,
    department text,
    education text,
    employment_type text,
    experience text,
    full_description text,
    full_title text,
    "function" text,
    industry text,
    location_city text,
    location_country text,
    location_country_code text,
    location_region text,
    location_region_code text,
    location_str text,
    location_telecommuting text,
    location_zip_code text,
    requirements text,
    shortcode text,
    shortlink text,
    "state" text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE job_question_choice (
    id text,
    job_question_id text,
    body text,
    PRIMARY KEY (id, job_question_id),
    FOREIGN KEY (job_question_id) REFERENCES job_question(id)
);

CREATE TABLE job_question_file_type (
    "index" text,
    job_question_id text,
    file_type text,
    PRIMARY KEY ("index", job_question_id),
    FOREIGN KEY (job_question_id) REFERENCES job_question(id)
);

CREATE TABLE job_question (
    id text,
    job_id text,
    body text,
    max_file_size text,
    required text,
    single_answer text,
    "type" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE stage (
    "position" text,
    "name" text,
    slug text,
    PRIMARY KEY ("position")
);

CREATE TABLE job_recruiter (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES recruiter(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_application_supported_file_type (
    "index" text,
    job_application_form_key text,
    job_id text,
    file_type text,
    PRIMARY KEY ("index", job_application_form_key, job_id),
    FOREIGN KEY (job_application_form_key) REFERENCES job_application_form("key"),
    FOREIGN KEY (job_id) REFERENCES job_application_form(job_id)
);

CREATE TABLE job_application_field (
    "key" text,
    job_application_form_key text,
    job_id text,
    label text,
    required text,
    "type" text,
    PRIMARY KEY ("key", job_application_form_key, job_id),
    FOREIGN KEY (job_application_form_key) REFERENCES job_application_form("key"),
    FOREIGN KEY (job_id) REFERENCES job_application_form(job_id)
);

CREATE TABLE job_application_form (
    "key" text,
    job_id text,
    label text,
    max_file_size text,
    multiple text,
    required text,
    "type" text,
    PRIMARY KEY ("key", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE candidate_activity (
    id text,
    candidate_id text,
    member_id text,
    "action" text,
    body text,
    created_at text,
    stage_name text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE job_custom_attribute_choice (
    id text,
    job_custom_attribute_id text,
    body text,
    PRIMARY KEY (id, job_custom_attribute_id),
    FOREIGN KEY (job_custom_attribute_id) REFERENCES job_custom_attribute(id)
);

CREATE TABLE job_custom_attribute_file_type (
    "index" text,
    job_custom_attribute_id text,
    file_type text,
    PRIMARY KEY ("index", job_custom_attribute_id),
    FOREIGN KEY (job_custom_attribute_id) REFERENCES job_custom_attribute(id)
);

CREATE TABLE job_custom_attribute (
    id text,
    job_id text,
    label text,
    max_file_size text,
    provider text,
    required text,
    single_answer text,
    "type" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);
