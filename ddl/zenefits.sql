CREATE TABLE locations (
    id text,
    company_id text,
    company_url text,
    labor_group_url text,
    city text,
    country text,
    "name" text,
    people_url text,
    phone text,
    "state" text,
    street_1 text,
    street_2 text,
    url text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (company_url) REFERENCES company(url),
    FOREIGN KEY (labor_group_url) REFERENCES labor_group(url)
);

CREATE TABLE labor_group_data (
    "index" text,
    labor_group_id text,
    url text,
    is_primary text,
    PRIMARY KEY ("index", labor_group_id),
    FOREIGN KEY (labor_group_id) REFERENCES labor_group(id),
    FOREIGN KEY (url) REFERENCES people(url)
);

CREATE TABLE labor_group (
    id text,
    labor_group_type_id text,
    labor_group_type_url text,
    code text,
    "name" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (labor_group_type_id) REFERENCES labor_group_type(id),
    FOREIGN KEY (labor_group_type_url) REFERENCES labor_group_type(url)
);

CREATE TABLE department (
    id text,
    company_id text,
    company_url text,
    labor_group_url text,
    "name" text,
    people_url text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (company_url) REFERENCES company(url)
);

CREATE TABLE custom_field (
    id text,
    company_url text,
    can_manager_view_field text,
    can_person_edit_field text,
    can_person_view_field text,
    company_during_hiring text,
    custom_field_type text,
    custom_field_values_url text,
    help_text text,
    help_url text,
    help_url_media text,
    is_field_completer_person text,
    is_field_required text,
    is_sensitive text,
    media_file_type text,
    "name" text,
    object text,
    person_during_onboarding text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_url) REFERENCES company(url)
);

CREATE TABLE time_duration (
    id text,
    approver_url text,
    person_url text,
    activity text,
    approved_date_time text,
    "date" text,
    end_date text,
    hours text,
    is_approved text,
    is_overnight text,
    labor_group_ids text,
    start_date text,
    "state" text,
    valid_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (approver_url) REFERENCES people(url),
    FOREIGN KEY (person_url) REFERENCES people(url)
);

CREATE TABLE labor_group_type (
    id text,
    company_url text,
    labor_groups_url text,
    "name" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_url) REFERENCES company(url)
);

CREATE TABLE vacation_type (
    id text,
    company_url text,
    counts_as text,
    "name" text,
    "status" text,
    url text,
    vacation_requests_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_url) REFERENCES company(url)
);

CREATE TABLE company (
    id text,
    company_banks_url text,
    departments_url text,
    ein text,
    legal_city text,
    legal_name text,
    legal_state text,
    legal_street_1 text,
    legal_street_2 text,
    legal_zips text,
    locations_url text,
    logo_url text,
    "name" text,
    object text,
    people_url text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE company_bank_account (
    id text,
    company_id text,
    company_url text,
    account_number text,
    account_type text,
    bank_name text,
    routing_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (company_url) REFERENCES company(url)
);

CREATE TABLE emp_bank_account (
    id text,
    people_id text,
    account_number text,
    account_type text,
    amount_per_paycheck text,
    bank_name text,
    is_primary_account text,
    is_salary_account text,
    percentage_per_paycheck text,
    priority text,
    routing_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE custom_field_value (
    id text,
    custom_field_url text,
    people_id text,
    person_url text,
    url text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_field_url) REFERENCES custom_field(url),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (person_url) REFERENCES people(url)
);

CREATE TABLE people (
    id text,
    company_id text,
    company_url text,
    department_url text,
    location_url text,
    manager_url text,
    bank_url text,
    city text,
    country text,
    date_of_birth text,
    employee_number text,
    federal_filing_status text,
    first_name text,
    gender text,
    is_admin text,
    is_full_admin text,
    last_name text,
    middle_name text,
    personal_email text,
    personal_phone text,
    personal_pronoun text,
    photo_thumbnail_url text,
    photo_url text,
    postal_code text,
    preferred_name text,
    social_security_number text,
    "state" text,
    "status" text,
    street_1 text,
    street_2 text,
    subordinates_url text,
    title text,
    "type" text,
    url text,
    work_email text,
    work_phone text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (company_url) REFERENCES company(url),
    FOREIGN KEY (department_url) REFERENCES department(url),
    FOREIGN KEY (location_url) REFERENCES locations(url),
    FOREIGN KEY (manager_url) REFERENCES people(url)
);

CREATE TABLE vacation_request (
    id text,
    creator_url text,
    person_url text,
    vacation_type_url text,
    approved_date text,
    created_date text,
    deny_reason text,
    end_date text,
    hours text,
    reason text,
    start_date text,
    "status" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_url) REFERENCES people(url),
    FOREIGN KEY (person_url) REFERENCES people(url),
    FOREIGN KEY (vacation_type_url) REFERENCES vacation_type(url)
);

CREATE TABLE employment (
    id text,
    people_id text,
    person_url text,
    amount_type text,
    annual_salary text,
    comp_type text,
    employment_sub_type text,
    employment_type text,
    hire_date text,
    is_active text,
    is_flsa_exempt text,
    pay_rate text,
    termination_date text,
    termination_type text,
    working_hours_per_week text,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (person_url) REFERENCES people(url)
);
