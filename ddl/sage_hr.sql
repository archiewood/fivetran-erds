CREATE TABLE employee (
    id text,
    position_id text,
    reports_to_employee_id text,
    team_id text,
    city text,
    country text,
    date_of_birth text,
    email text,
    employee_number text,
    employment_start_date text,
    employment_status text,
    first_name text,
    gender text,
    home_phone text,
    is_terminated text,
    last_name text,
    marital_status text,
    mobile_phone text,
    nationality text,
    personal_identification_number text,
    picture_url text,
    "position" text,
    post_code text,
    street_first text,
    street_second text,
    tax_number text,
    termination_date text,
    work_phone text,
    PRIMARY KEY (id),
    FOREIGN KEY (position_id) REFERENCES "position"(id),
    FOREIGN KEY (reports_to_employee_id) REFERENCES employee(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE individual_team_quarterly_goal (
    _fivetran_id text,
    "name" text,
    progress_actual text,
    progress_to_date text,
    quarterly_data_progress_actual text,
    quarterly_data_progress_to_date text,
    title text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY ("name") REFERENCES team("name")
);

CREATE TABLE "position" (
    id text,
    code text,
    description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE employee_custom_field_option (
    custom_field_option text,
    employee_custom_field_employee_id text,
    employee_custom_field_id text,
    PRIMARY KEY (custom_field_option, employee_custom_field_employee_id, employee_custom_field_id),
    FOREIGN KEY (employee_custom_field_employee_id) REFERENCES employee_custom_field(employee_id),
    FOREIGN KEY (employee_custom_field_id) REFERENCES employee_custom_field(id)
);

CREATE TABLE employee_custom_field_value (
    custom_field_value text,
    employee_custom_field_employee_id text,
    employee_custom_field_id text,
    PRIMARY KEY (custom_field_value, employee_custom_field_employee_id, employee_custom_field_id),
    FOREIGN KEY (employee_custom_field_employee_id) REFERENCES employee_custom_field(employee_id),
    FOREIGN KEY (employee_custom_field_id) REFERENCES employee_custom_field(id)
);

CREATE TABLE employee_custom_field (
    id text,
    employee_id text,
    label text,
    "type" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE kit_day_of_employee_in_policy (
    id text,
    employee_id text,
    leave_policy_id text,
    end_date text,
    start_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (leave_policy_id) REFERENCES leave_policy(id)
);

CREATE TABLE employee_team_history (
    employee_id text,
    team_id text,
    end_date text,
    start_date text,
    PRIMARY KEY (employee_id, team_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE employee_history (
    employee_id text,
    parent_id text,
    employment_status_name text,
    end_date text,
    start_date text,
    "type" text,
    PRIMARY KEY (employee_id, parent_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (parent_id) REFERENCES "position"(id)
);

CREATE TABLE time_off_request_field (
    title text,
    time_off_request_id text,
    answer text,
    PRIMARY KEY (title, time_off_request_id),
    FOREIGN KEY (time_off_request_id) REFERENCES time_off_request(id)
);

CREATE TABLE time_off_request (
    id text,
    employee_id text,
    policy_id text,
    approval_date text,
    details text,
    end_date text,
    first_part_of_day text,
    hours text,
    is_multi_date text,
    is_part_of_day text,
    is_single_day text,
    request_date text,
    second_part_of_day text,
    start_date text,
    "status" text,
    status_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (policy_id) REFERENCES leave_policy(id)
);

CREATE TABLE employee_compensation (
    _fivetran_id text,
    employee_id text,
    amount text,
    category text,
    "comment" text,
    currency text,
    end_date text,
    period text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE quarterly_company_data (
    _fivetran_id text,
    progress_actual text,
    progress_to_date text,
    title text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE individual_allowance_eligibility (
    individual_allowance_id text,
    policy_id text,
    carryover text,
    quantity text,
    unit text,
    PRIMARY KEY (individual_allowance_id, policy_id),
    FOREIGN KEY (individual_allowance_id) REFERENCES report_with_individual_allowance(employee_id),
    FOREIGN KEY (policy_id) REFERENCES leave_policy(id)
);

CREATE TABLE report_with_individual_allowance (
    employee_id text,
    full_name text,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE team_employee (
    employee_id text,
    team_id text,
    PRIMARY KEY (employee_id, team_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_manager (
    manager_id text,
    team_id text,
    PRIMARY KEY (manager_id, team_id),
    FOREIGN KEY (manager_id) REFERENCES employee(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE leave_policy (
    id text,
    accrue_at_start text,
    accrue_type text,
    additional_field text,
    auto_approves text,
    blocks_enabled text,
    child_allowance_enabled text,
    color text,
    default_allowance text,
    do_not_accrue text,
    dont_allow_negative_amount text,
    enable_attachment text,
    enable_dependent_policy text,
    enable_details text,
    enable_duplicate_time_offs text,
    enable_employee_access text,
    enable_limited_days text,
    enable_minimum_days text,
    enable_monthly_expiration text,
    enable_negative_carryover text,
    enable_probation_period text,
    enable_replacement text,
    enable_replacement_away text,
    enable_scopped_replacement text,
    enable_service_accruals text,
    enable_specific_approvers text,
    max_accrual text,
    max_carryover text,
    "name" text,
    no_reset text,
    only_full_days text,
    override_approvers_enabled text,
    replacement_required text,
    requests_in_advance_required text,
    require_details text,
    starter_monthly_accrual_limitation text,
    starter_yearly_accrual_limitation text,
    termination_recalculation text,
    unit text,
    PRIMARY KEY (id)
);
