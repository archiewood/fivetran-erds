CREATE TABLE task (
    id text,
    assigned_to_id text,
    created_by_id text,
    associated_to_id text,
    associated_to_type text,
    completed text,
    completed_at text,
    created_at timestamp,
    ends_on text,
    starts_on text,
    title text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to_id) REFERENCES employee(id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id)
);

CREATE TABLE competencie (
    id text,
    created_at timestamp,
    description text,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE employment_type (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE leave_policy (
    id text,
    leave_type_id text,
    activity_type text,
    counted_as text,
    created_at timestamp,
    "name" text,
    "type" text,
    updated_at timestamp,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id)
);

CREATE TABLE working_pattern (
    id text,
    created_at timestamp,
    friday_hours text,
    monday_hours text,
    "name" text,
    saturday_hours text,
    sunday_hours text,
    thursday_hours text,
    tuesday_hours text,
    updated_at timestamp,
    wednesday_hours text,
    PRIMARY KEY (id)
);

CREATE TABLE holiday (
    id text,
    compensated_on text,
    country_code text,
    created_at timestamp,
    ends_on text,
    holiday_policy_id text,
    "name" text,
    observed_on text,
    occurs_on text,
    starts_on text,
    updated_at timestamp,
    working text,
    PRIMARY KEY (id)
);

CREATE TABLE objective_key_result (
    id text,
    objective_id text,
    currency_code text,
    metric text,
    progress text,
    "start" text,
    "status" text,
    target text,
    title text,
    weight text,
    PRIMARY KEY (id, objective_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective (
    id text,
    owner_id text,
    created_at timestamp,
    ends_on text,
    parent_id text,
    progress text,
    starts_on text,
    "status" text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES employee(id)
);

CREATE TABLE division (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE job_level (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id text,
    manager_id text,
    created_at timestamp,
    "name" text,
    parent_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES employee(id)
);

CREATE TABLE vacancy_applicant_phone_number (
    "index" text,
    vacancy_application_id text,
    phone_numbers text,
    PRIMARY KEY ("index", vacancy_application_id),
    FOREIGN KEY (vacancy_application_id) REFERENCES vacancy_application(id)
);

CREATE TABLE vacancy_application (
    id text,
    vacancy_id text,
    applicant_email text,
    applicant_full_name text,
    applicant_id text,
    applicant_phone_numbers text,
    created_at timestamp,
    disqualified_at text,
    pipeline_state_id text,
    pipeline_state_name text,
    updated_at timestamp,
    PRIMARY KEY (id, vacancy_id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(id)
);

CREATE TABLE disqualify_reason (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE kpi (
    id text,
    department_id text,
    division_id text,
    location_id text,
    owner_id text,
    created_at timestamp,
    currency_code text,
    description text,
    kpi_type text,
    metric text,
    progress_percentage text,
    "status" text,
    title text,
    updated_at timestamp,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (owner_id) REFERENCES employee(id)
);

CREATE TABLE holiday_policy (
    id text,
    country_code text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE team_member (
    id text,
    team_id text,
    user_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES employee(id)
);

CREATE TABLE team (
    id text,
    team_lead_id text,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (team_lead_id) REFERENCES employee(id)
);

CREATE TABLE leave_type (
    id text,
    created_at timestamp,
    fa_class text,
    hex_color text,
    "name" text,
    unit text,
    PRIMARY KEY (id)
);

CREATE TABLE location (
    id text,
    holiday_policy_id text,
    address text,
    country_code text,
    created_at timestamp,
    "name" text,
    time_zone text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (holiday_policy_id) REFERENCES holiday_policy(id)
);

CREATE TABLE "position" (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE vacancies_custom_fields (
    "index" text,
    vacancy_id text,
    internal_name text,
    "name" text,
    vacancy_field_id text,
    "value" text,
    PRIMARY KEY ("index", vacancy_id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(id)
);

CREATE TABLE vacancies_collaborators (
    "index" text,
    vacancy_id text,
    email text,
    first_name text,
    id text,
    last_name text,
    PRIMARY KEY ("index", vacancy_id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(id)
);

CREATE TABLE vacancies_recruitment_pipeline_stage (
    "index" text,
    vacancy_id text,
    created_at timestamp,
    id text,
    "name" text,
    "position" text,
    updated_at timestamp,
    PRIMARY KEY ("index", vacancy_id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(id)
);

CREATE TABLE vacancy (
    id text,
    department_id text,
    employment_type_id text,
    hiring_lead_id text,
    job_level_id text,
    location_id text,
    applications_count text,
    created_at timestamp,
    currency_code text,
    description text,
    division text,
    ends_on text,
    maximum_salary text,
    minimum_salary text,
    opened_at text,
    "position" text,
    positions text,
    post_on_careers text,
    priority text,
    recruitment_pipeline_created_at timestamp,
    recruitment_pipeline_id text,
    recruitment_pipeline_name text,
    recruitment_pipeline_stages text,
    recruitment_pipeline_updated_at timestamp,
    skills jsonb,
    starts_on text,
    "state" text,
    tags jsonb,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (employment_type_id) REFERENCES employment_type(id),
    FOREIGN KEY (hiring_lead_id) REFERENCES employee(id),
    FOREIGN KEY (job_level_id) REFERENCES job_level(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE employee (
    id text,
    department_id text,
    division_id text,
    employment_type_id text,
    job_level_id text,
    location_id text,
    position_id text,
    reporting_to_id text,
    access text,
    active text,
    avatar_url text,
    created_at timestamp,
    date_of_birth text,
    email text,
    facebook_url text,
    first_name text,
    full_name text,
    gender text,
    gender_id text,
    hired_on text,
    last_name text,
    legal_entity text,
    linkedin_url text,
    middle_name text,
    mobile_number text,
    personal_email text,
    probation_ends_on text,
    skype_username text,
    slack_username text,
    "status" text,
    termination_comment text,
    termination_effective_on text,
    termination_eligible_for_rehire text,
    termination_reason_id text,
    termination_reason_name text,
    termination_type_id text,
    termination_type_name text,
    twitter_username text,
    updated_at timestamp,
    work_phone_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (employment_type_id) REFERENCES employment_type(id),
    FOREIGN KEY (job_level_id) REFERENCES job_level(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (position_id) REFERENCES "position"(id),
    FOREIGN KEY (reporting_to_id) REFERENCES employee(id)
);

CREATE TABLE employee_anniversary (
    id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES employee(id)
);

CREATE TABLE calendar (
    starts_on text,
    user_id text,
    leave_type_id text,
    ends_on text,
    title text,
    "type" text,
    PRIMARY KEY (starts_on, user_id),
    FOREIGN KEY (user_id) REFERENCES employee(id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id)
);

CREATE TABLE candidates_phone_number (
    "index" text,
    candidates_id text,
    phone_numbers text,
    PRIMARY KEY ("index", candidates_id),
    FOREIGN KEY (candidates_id) REFERENCES candidates(id)
);

CREATE TABLE candidates_urls (
    "index" text,
    candidates_id text,
    urls text,
    PRIMARY KEY ("index", candidates_id),
    FOREIGN KEY (candidates_id) REFERENCES candidates(id)
);

CREATE TABLE candidates_skills (
    "index" text,
    candidates_id text,
    skills text,
    PRIMARY KEY ("index", candidates_id),
    FOREIGN KEY (candidates_id) REFERENCES candidates(id)
);

CREATE TABLE candidates_application (
    id text,
    candidates_id text,
    vacancy_id text,
    created_at timestamp,
    disqualified_at text,
    disqualify_reason text,
    updated_at timestamp,
    PRIMARY KEY (id, candidates_id),
    FOREIGN KEY (candidates_id) REFERENCES candidates(id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy(id)
);

CREATE TABLE candidates (
    id text,
    cover_letter text,
    created_at timestamp,
    created_by text,
    currency_code text,
    desired_salary text,
    email text,
    full_name text,
    gender text,
    last_contacted_at text,
    "level" text,
    location text,
    "position" text,
    resume text,
    "source" text,
    tags jsonb,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE leave_request_entries (
    "index" text,
    leave_request_id text,
    amount text,
    "date" text,
    ends_at text,
    starts_at text,
    PRIMARY KEY ("index", leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id)
);

CREATE TABLE leave_request_approval (
    "index" text,
    leave_request_id text,
    assigned_to_id text,
    "state" text,
    PRIMARY KEY ("index", leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id),
    FOREIGN KEY (assigned_to_id) REFERENCES employee(id)
);

CREATE TABLE leave_request (
    id text,
    employee_id text,
    leave_type_id text,
    amount text,
    attachment_url text,
    attachments jsonb,
    "comment" text,
    created_at timestamp,
    ends_on text,
    hours text,
    leave_type_policy_activity_type text,
    leave_type_policy_name text,
    leave_type_policy_visibility text,
    on_demand text,
    starts_on text,
    "state" text,
    tracking_time_in text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id)
);

CREATE TABLE salary (
    id text,
    employee_id text,
    amount text,
    "comment" text,
    created_at timestamp,
    currency_code text,
    effective_on text,
    overtime text,
    pay_schedule_id text,
    pay_schedule_name text,
    per text,
    updated_at timestamp,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE leave_balance (
    id text,
    employee_id text,
    leave_policy_id text,
    leave_type_id text,
    balance text,
    created_at timestamp,
    effective_on text,
    updated_at timestamp,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (leave_policy_id) REFERENCES leave_policy(id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id)
);
