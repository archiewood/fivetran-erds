CREATE TABLE emergency_contact (
    id text,
    employee_id text,
    organisation_id text,
    after_hours_no text,
    after_mobile_no text,
    contact_name text,
    contact_type text,
    daytime_contact_number text,
    relationship text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE pay_detail (
    id text,
    employee_id text,
    organisation_id text,
    anniversary_date text,
    change_reason text,
    classification text,
    "comment" text,
    effective_from text,
    industrial_instrument text,
    leave_allowance_template text,
    pay_category text,
    pay_rate_template text,
    pay_unit text,
    salary text,
    salary_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE payslip (
    id text,
    employee_id text,
    organisation_id text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    base_rate text,
    base_rate_unit text,
    business_abn text,
    business_address text,
    business_name text,
    employment_type text,
    hourly_rate text,
    "name" text,
    net_pay text,
    note text,
    pay_period_ending text,
    pay_period_starting text,
    payment_date text,
    payroll_type text,
    post_tax_deduction text,
    postcode text,
    pre_tax_deduction text,
    reimbursements text,
    suburb text,
    super text,
    tax text,
    total_deduction text,
    wages text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE employee (
    id text,
    organisation_id text,
    primary_cost_centre_id text,
    primary_manager_id text,
    secondary_manager_id text,
    account_email text,
    address text,
    avatar_url text,
    code text,
    company_email text,
    company_landline text,
    company_mobile text,
    country text,
    date_of_birth text,
    employing_entity text,
    external_id text,
    first_name text,
    gender text,
    home_phone text,
    job_title text,
    known_as text,
    last_name text,
    location text,
    marital_status text,
    middle_name text,
    nationality text,
    personal_email text,
    personal_mobile_number text,
    "role" text,
    secondary_cost_centres jsonb,
    start_date text,
    termination_date text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (primary_cost_centre_id) REFERENCES employee(id),
    FOREIGN KEY (primary_manager_id) REFERENCES employee(id),
    FOREIGN KEY (secondary_manager_id) REFERENCES employee(id)
);

CREATE TABLE team_employee (
    employee_id text,
    organisation_id text,
    team_id text,
    PRIMARY KEY (employee_id, organisation_id, team_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE leave_request (
    id text,
    employee_id text,
    organisation_id text,
    "comment" text,
    end_date text,
    leave_balance_amount text,
    leave_category_name text,
    reason text,
    start_date text,
    "status" text,
    total_hours text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE superannuation_detail (
    employee_id text,
    organisation_id text,
    electronic_service_address text,
    employer_nominated_fund text,
    fund_abn text,
    fund_email text,
    fund_name text,
    member_number text,
    product_code text,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE certification (
    id text,
    organisation_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE payroll_admin_email (
    payroll_admin_email text,
    organisation_id text,
    PRIMARY KEY (payroll_admin_email, organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation (
    id text,
    active_employees_count text,
    business_account_id text,
    country text,
    created_at text,
    employees_count text,
    end_of_week text,
    logo_url text,
    "name" text,
    pending_employees_count text,
    phone text,
    primary_address text,
    subscription_plan text,
    superfund_name text,
    time_zone text,
    typical_work_day text,
    PRIMARY KEY (id)
);

CREATE TABLE policy (
    id text,
    organisation_id text,
    created_at text,
    induction text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE employee_history (
    id text,
    employee_id text,
    organisation_id text,
    employment_type text,
    end_date text,
    start_date text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE bank_account (
    id text,
    employee_id text,
    organisation_id text,
    account_name text,
    account_number text,
    amount text,
    bsb text,
    external_id text,
    primary_account text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES superannuation_detail(employee_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE employee_certification (
    id text,
    certification_id text,
    employee_id text,
    organisation_id text,
    completion_date text,
    driver_details text,
    driver_problem text,
    expiry_date text,
    "name" text,
    reason text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (certification_id) REFERENCES certification(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE timesheet_entry (
    id text,
    employee_id text,
    organisation_id text,
    "comment" text,
    "date" text,
    end_time text,
    reason text,
    start_time text,
    "status" text,
    "time" text,
    units text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE tax_declaration (
    employee_id text,
    organisation_id text,
    tax_au_resident text,
    tax_file_number text,
    tax_financial_supplement_debt text,
    tax_foreign_resident text,
    tax_free text,
    tax_help_debt text,
    working_holiday_maker text,
    PRIMARY KEY (employee_id, organisation_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE team (
    id text,
    organisation_id text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);
