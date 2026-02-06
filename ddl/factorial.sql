CREATE TABLE document (
    id text,
    employee_id text,
    folder_id text,
    author_id text,
    company_id text,
    content_type text,
    created_at text,
    deleted_at text,
    extension text,
    file_size text,
    filename text,
    is_company_document text,
    is_management_document text,
    is_pending_assignment text,
    leave_id text,
    public text,
    signature_status text,
    signees jsonb,
    space text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE policies (
    id text,
    company_id text,
    description text,
    main text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE shift_management (
    id text,
    employee_id text,
    location_id text,
    company_id text,
    default_shift_title text,
    end_at text,
    extra_hours text,
    local_end_at text,
    local_start_at text,
    locations_work_area_id text,
    "name" text,
    notes text,
    start_at text,
    "state" text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE taxonomy (
    id text,
    legal_entity_id text,
    archived text,
    defaults text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (legal_entity_id) REFERENCES legal_entities(id)
);

CREATE TABLE employee (
    id text,
    legal_entity_id text,
    location_id text,
    manager_id text,
    timeoff_manager_id text,
    access_id text,
    active text,
    address_line_1 text,
    address_line_2 text,
    age_number text,
    attendable text,
    bank_number text,
    bank_number_format text,
    birth_name text,
    birthday_on text,
    birthplace text,
    city text,
    company_id text,
    company_identifier text,
    contact_name text,
    contact_number text,
    country text,
    country_of_birth text,
    created_at text,
    disability_percentage_cents text,
    email text,
    first_name text,
    full_name text,
    gender text,
    identifier text,
    identifier_expiration_date text,
    identifier_type text,
    is_terminating text,
    last_name text,
    login_email text,
    nationality text,
    personal_email text,
    phone_number text,
    postal_code text,
    preferred_name text,
    pronouns text,
    seniority_calculation_date text,
    social_security_number text,
    "state" text,
    swift_bic text,
    terminated_on text,
    termination_observations text,
    termination_reason text,
    termination_reason_type text,
    termination_type_description text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (legal_entity_id) REFERENCES legal_entities(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (manager_id) REFERENCES employee(id),
    FOREIGN KEY (timeoff_manager_id) REFERENCES employee(id)
);

CREATE TABLE ats_job_posting_id (
    ats_job_posting_id text,
    candidate_id text,
    PRIMARY KEY (ats_job_posting_id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate (
    id text,
    company_id text,
    consent_expiration_date text,
    consent_given_at text,
    consent_to_talent_pool text,
    created_at text,
    email text,
    first_name text,
    full_name text,
    gender text,
    inactive_since text,
    last_name text,
    medium text,
    personal_url text,
    phone_number text,
    score text,
    source_id text,
    talent_pool text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE post (
    id text,
    allow_comments_and_reactions text,
    comments_count text,
    cover_image_url text,
    created_at text,
    description text,
    posts_group_id text,
    published_at text,
    title text,
    updated_at text,
    visits_count text,
    PRIMARY KEY (id)
);

CREATE TABLE leave (
    id text,
    employee_id text,
    leave_type_id text,
    approved text,
    company_id text,
    created_at text,
    description text,
    employee_full_name text,
    finish_on text,
    half_day text,
    hours_amount_in_cents text,
    leave_type_name text,
    reason text,
    start_on text,
    start_time text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id)
);

CREATE TABLE contract (
    id text,
    employee_id text,
    annual_working_time_distribution text,
    bank_holiday_treatment text,
    company_id text,
    contracts_es_tariff_group_id text,
    country text,
    created_at text,
    de_contract_type_id text,
    effective_on text,
    ends_on text,
    es_contract_observations text,
    es_contract_type_id text,
    es_cotization_group text,
    es_education_level_id text,
    es_has_teleworking_contract text,
    es_job_description text,
    es_professional_category_id text,
    es_working_day_type_id text,
    fr_coefficient text,
    fr_contract_type_id text,
    fr_employee_type text,
    fr_forfait_jours text,
    fr_jours_par_an text,
    fr_level_id text,
    fr_mutual_id text,
    fr_professional_category_id text,
    fr_step_id text,
    fr_work_type_id text,
    has_payroll text,
    has_trial_period text,
    job_catalog_level_id text,
    job_title text,
    max_legal_yearly_hours text,
    max_work_days_in_row text,
    max_work_minutes_per_day text,
    maximum_weekly_hours text,
    min_rest_hours_in_row text,
    min_rest_minutes_between_days text,
    pt_contract_type_id text,
    salary_amount text,
    salary_frequency text,
    starts_on text,
    trial_period_ends_on text,
    updated_at text,
    working_hours text,
    working_hours_frequency text,
    working_time_percentage_in_cents text,
    working_week_days text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE team_lead (
    lead_id text,
    team_id text,
    PRIMARY KEY (lead_id, team_id),
    FOREIGN KEY (lead_id) REFERENCES employee(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_employee (
    employee_id text,
    team_id text,
    PRIMARY KEY (employee_id, team_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    avatar text,
    company_id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE company_holiday (
    id text,
    location_id text,
    "date" text,
    description text,
    half_day text,
    summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE folder (
    id text,
    parent_folder_id text,
    active text,
    company_id text,
    "name" text,
    space text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_folder_id) REFERENCES folder(id)
);

CREATE TABLE task_assignee (
    employee_id text,
    task_id text,
    PRIMARY KEY (employee_id, task_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    author_employee_id text,
    company_id text,
    completed_at text,
    completed_by_id text,
    content text,
    created_at text,
    due_on text,
    "name" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE task_file (
    id text,
    task_id text,
    content_type text,
    created_at text,
    filename text,
    "path" text,
    PRIMARY KEY (id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE leave_type_allowance (
    allowance_id text,
    leave_type_id text,
    PRIMARY KEY (allowance_id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id)
);

CREATE TABLE leave_type (
    id text,
    accrues text,
    active text,
    allow_endless text,
    approval_required text,
    attachment text,
    color text,
    company_id text,
    description text,
    details_required text,
    editable text,
    half_days_units_enabled text,
    identifier text,
    is_attachment_mandatory text,
    max_days_in_cents text,
    min_days_in_cents text,
    "name" text,
    payable text,
    restricted text,
    translated_name text,
    visibility text,
    workable text,
    PRIMARY KEY (id)
);

CREATE TABLE supplement_employee_observation (
    employee_observation text,
    supplement_id text,
    PRIMARY KEY (employee_observation, supplement_id),
    FOREIGN KEY (supplement_id) REFERENCES supplement(id)
);

CREATE TABLE supplement (
    id text,
    contracts_compensation_id text,
    contracts_taxonomy_id text,
    employee_id text,
    amount_in_cents text,
    company_id text,
    created_at text,
    currency text,
    description text,
    effective_on text,
    equivalent_minutes_in_cents text,
    legal_entity_id text,
    minutes_in_cents text,
    payroll_policy_period_id text,
    raw_minutes_in_cents text,
    unit text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (contracts_compensation_id) REFERENCES compensation(id),
    FOREIGN KEY (contracts_taxonomy_id) REFERENCES taxonomy(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE compensation (
    id text,
    contract_version_id text,
    contracts_taxonomy_id text,
    payroll_policy_id text,
    amount text,
    calculation text,
    compensation_type text,
    currency text,
    description text,
    first_payment_on text,
    minimum_amount_of_hours text,
    minimum_amount_of_hours_in_cents text,
    recurrence text,
    recurrence_count text,
    starts_on text,
    sync_with_supplements text,
    time_condition text,
    unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_version_id) REFERENCES contract(id),
    FOREIGN KEY (contracts_taxonomy_id) REFERENCES taxonomy(id),
    FOREIGN KEY (payroll_policy_id) REFERENCES policies(id)
);

CREATE TABLE location (
    id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    company_id text,
    country text,
    latitude text,
    longitude text,
    main text,
    "name" text,
    phone_number text,
    postal_code text,
    radius text,
    siret text,
    "state" text,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE job_posting (
    id text,
    legal_entity_id text,
    location_id text,
    team_id text,
    ats_company_id text,
    company_id text,
    contract_type text,
    cover_letter_requirement text,
    created_at text,
    cv_requirement text,
    description text,
    hide_salary text,
    phone_requirement text,
    photo_requirement text,
    preview_token text,
    published_at text,
    remote text,
    salary_format text,
    salary_from_amount_in_cents text,
    salary_period text,
    salary_to_amount_in_cents text,
    schedule_type text,
    "status" text,
    title text,
    url text,
    workplace_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (legal_entity_id) REFERENCES legal_entities(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE workplace (
    id text,
    location_id text,
    archived_at text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE legal_entities (
    id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    company_id text,
    country text,
    currency text,
    legal_name text,
    postal_code text,
    "state" text,
    tin text,
    PRIMARY KEY (id)
);

CREATE TABLE attendance (
    id text,
    employee_id text,
    workplace_id text,
    clock_in text,
    clock_in_with_second text,
    clock_out text,
    company_id text,
    created_at text,
    "date" text,
    half_day text,
    in_location_accuracy text,
    in_location_latitude text,
    in_location_longitude text,
    in_source text,
    location_type text,
    minutes text,
    observation text,
    out_location_accuracy text,
    out_location_latitude text,
    out_location_longitude text,
    out_source text,
    reference_date text,
    time_settings_break_configuration_id text,
    updated_at text,
    workable text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (workplace_id) REFERENCES workplace(id)
);
