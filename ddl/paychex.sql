CREATE TABLE company_location (
    id text,
    company_id text,
    location_id text,
    city text,
    communication_id text,
    country_code text,
    country_subdivision_code text,
    dial_area text,
    dial_country text,
    dial_extension text,
    dial_number text,
    moved_in text,
    moved_out text,
    "name" text,
    post_office_box text,
    postal_code text,
    postal_code_extension text,
    street_line_one text,
    street_line_two text,
    "type" text,
    uri text,
    usage_type text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES worker(location_id)
);

CREATE TABLE worker_payrate (
    id text,
    worker_id text,
    amount text,
    defaults text,
    description text,
    effective_date text,
    in_progress_worker text,
    rate_number text,
    rate_type text,
    standard_hour text,
    standard_overtime text,
    start_date text,
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE company_labour_assignment (
    id text,
    company_id text,
    location_id text,
    organization_id text,
    end_date text,
    "name" text,
    position_id text,
    start_date text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES company_location(id),
    FOREIGN KEY (organization_id) REFERENCES company_organization(id)
);

CREATE TABLE worker_assignment (
    labor_assignment_id text,
    worker_id text,
    job_id text,
    "value" text,
    PRIMARY KEY (labor_assignment_id, worker_id),
    FOREIGN KEY (labor_assignment_id) REFERENCES company_labour_assignment(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE company_worker_status (
    id text,
    company_id text,
    status_reason text,
    status_type text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE relationship_type (
    company_contact_type_id text,
    id text,
    relationship_type_name text,
    PRIMARY KEY (company_contact_type_id, id)
);

CREATE TABLE company_contact_type (
    _fivetran_id text,
    company_id text,
    contact_type_name text,
    id text,
    PRIMARY KEY (_fivetran_id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE worker (
    id text,
    company_id text,
    job_title_id text,
    birth_date text,
    clock_id text,
    current_status_effective_date text,
    current_status_status_reason text,
    current_status_status_type text,
    employee_id text,
    employment_type text,
    ethnicity_code text,
    exemption_type text,
    hire_date text,
    job_id text,
    job_title text,
    labor_assignment_id text,
    legal_id text,
    legal_id_type text,
    location_id text,
    name_family_name text,
    name_given_name text,
    name_middle_name text,
    name_preferred_name text,
    name_qualification_affix_code text,
    name_title_affix_code text,
    organization_children text,
    organization_id text,
    organization_level text,
    organization_name text,
    organization_number text,
    sex text,
    supervisor_name_family_name text,
    supervisor_name_given_name text,
    supervisor_name_qualification_affix_code text,
    supervisor_worker_id text,
    work_state text,
    worker_corelation_id text,
    worker_status_id text,
    worker_type text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (job_title_id) REFERENCES company_job_title(id)
);

CREATE TABLE worker_federal_tax (
    id text,
    worker_id text,
    deductions_amount text,
    dependents_amount text,
    extra_withholding_amount text,
    filing_status text,
    multiple_job text,
    other_income text,
    taxes_withheld text,
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE company_calculation (
    id text,
    calculation_base_name text,
    PRIMARY KEY (id)
);

CREATE TABLE communication (
    "index" text,
    company_id text,
    city text,
    "type" text,
    usage_type text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    legal_id_type text,
    display_id text,
    has_permission text,
    legal_id_value text,
    legal_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (legal_id_type) REFERENCES worker(legal_id_type)
);

CREATE TABLE company_pay_frequency (
    _fivetran_id text,
    company_id text,
    interval_1 text,
    interval_2 text,
    pay_component_frequency_applied text,
    pay_component_frequency_occurence text,
    pay_frequency text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE worker_pay_standard (
    _fivetran_id text,
    worker_id text,
    calculated_annual_salary text,
    calculated_pay_period text,
    overtime_factor text,
    pay_frequency text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_deposit (
    id text,
    worker_id text,
    account_number text,
    account_type text,
    direct_deposit_type text,
    payment_type text,
    priority text,
    routing_number text,
    start_date text,
    "value" text,
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE company_organization (
    id text,
    company_id text,
    organization_id text,
    "level" text,
    "name" text,
    number text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (organization_id) REFERENCES worker(organization_id)
);

CREATE TABLE worker_pay_component (
    id text,
    worker_id text,
    calculation_base_id text,
    applied text,
    calculation_type text,
    classification_type text,
    component_id text,
    effect_on_pay text,
    effected_checks text,
    effective_date text,
    end_date text,
    interval_1 text,
    interval_2 text,
    "name" text,
    occurence text,
    start_date text,
    "value" text,
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id),
    FOREIGN KEY (calculation_base_id) REFERENCES company_calculation(id)
);

CREATE TABLE worker_communication (
    id text,
    worker_id text,
    city text,
    country_code text,
    country_subdivision_code text,
    dial_area text,
    dial_country text,
    dial_extension text,
    dial_number text,
    post_office_box text,
    postal_code text,
    postal_code_extension text,
    street_line_one text,
    street_line_two text,
    "type" text,
    uri text,
    usage_type text,
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE company_job_segment (
    id text,
    company_id text,
    "name" text,
    segment_length text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_job_title (
    id text,
    company_id text,
    job_title_id text,
    end_date text,
    start_date text,
    title text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (job_title_id) REFERENCES worker(job_title_id)
);
