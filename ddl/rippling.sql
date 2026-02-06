CREATE TABLE leave_type (
    id text,
    created_at text,
    description text,
    is_managed_by_external_system text,
    is_paid text,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE timecard (
    id text,
    worker_id text,
    created_at text,
    pay_period_end_date text,
    pay_period_schedule_id text,
    pay_period_start_date text,
    summary_approved_hours text,
    summary_double_overtime_hours text,
    summary_earnings jsonb,
    summary_hours_worked_by_job_code jsonb,
    summary_overtime_hours text,
    summary_paid_hours text,
    summary_premiums jsonb,
    summary_regular_hours text,
    summary_total_holiday_hours text,
    summary_total_hours text,
    summary_total_paid_time_off_hours text,
    summary_total_unpaid_time_off_hours text,
    summary_unpaid_break_hours_by_entry jsonb,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_team (
    team_id text,
    worker_id text,
    PRIMARY KEY (team_id, worker_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_custom_field (
    "index" text,
    worker_id text,
    "name" text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY ("index", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker (
    id text,
    department_id text,
    level_id text,
    manager_id text,
    user_id text,
    work_location_id text,
    citizenship text,
    country text,
    created_at text,
    date_of_birth text,
    end_date text,
    ethnicity text,
    gender text,
    legal_entity_id text,
    location_type text,
    number text,
    overtime_exemption text,
    personal_email text,
    race text,
    start_date text,
    "status" text,
    termination_reason text,
    termination_type text,
    title text,
    updated_at timestamp,
    work_email text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (level_id) REFERENCES "level"(id),
    FOREIGN KEY (manager_id) REFERENCES worker(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (work_location_id) REFERENCES work_location(id)
);

CREATE TABLE custom_field (
    id text,
    created_at text,
    description text,
    "name" text,
    required text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE time_entry_comment (
    author_id text,
    time_entry_id text,
    created_at text,
    text text,
    PRIMARY KEY (author_id, time_entry_id),
    FOREIGN KEY (author_id) REFERENCES worker(id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE time_entry_job_shift (
    "index" text,
    time_entry_id text,
    end_time text,
    is_hours_only_input text,
    job_codes_id jsonb,
    original_end_time text,
    original_start_time text,
    start_time text,
    PRIMARY KEY ("index", time_entry_id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE time_entry_break (
    break_type_id text,
    time_entry_id text,
    end_time text,
    original_end_time text,
    original_start_time text,
    start_time text,
    PRIMARY KEY (break_type_id, time_entry_id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE time_entry_segment (
    "index" text,
    time_entry_id text,
    break_type_id text,
    display_name text,
    end_time text,
    job_codes_id jsonb,
    ot_multiplier text,
    pay_rate text,
    start_time text,
    PRIMARY KEY ("index", time_entry_id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE time_entry (
    id text,
    time_card_id text,
    worker_id text,
    create_extra_hours_run text,
    created_at text,
    end_time text,
    idempotency_key text,
    pay_period_end_date text,
    pay_period_schedule_id text,
    pay_period_start_date text,
    piece_rate_premiums jsonb,
    premiums jsonb,
    shift_input_values jsonb,
    start_time text,
    "status" text,
    tags jsonb,
    time_entry_summary_double_over_time_hours text,
    time_entry_summary_duration text,
    time_entry_summary_over_time_hours text,
    time_entry_summary_regular_hours text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (time_card_id) REFERENCES timecard(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE work_location (
    id text,
    address_country text,
    address_formatted text,
    address_locality text,
    address_postal_code text,
    address_region text,
    address_street_address text,
    address_type text,
    created_at text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE leave_request_day_take_off (
    "date" text,
    leave_request_id text,
    number_of_minutes_taken_off text,
    PRIMARY KEY ("date", leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id)
);

CREATE TABLE leave_request (
    id text,
    leave_type_id text,
    requester_id text,
    reviewer_id text,
    worker_id text,
    comments text,
    created_at text,
    end_date text,
    end_time text,
    is_managed_by_external_system text,
    leave_event_id text,
    leave_policy_id text,
    number_of_minutes_requested text,
    reason_for_leave text,
    requester text,
    reviewed_at text,
    reviewer text,
    start_date text,
    start_time text,
    "status" text,
    updated_at timestamp,
    worker text,
    PRIMARY KEY (id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_type(id),
    FOREIGN KEY (requester_id) REFERENCES worker(id),
    FOREIGN KEY (reviewer_id) REFERENCES worker(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE department (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    reference_code text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES department(id)
);

CREATE TABLE "level" (
    id text,
    parent_id text,
    created_at text,
    description text,
    global_level text,
    "name" text,
    rank text,
    track_created_at text,
    track_id text,
    track_name text,
    track_updated_at text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES "level"(id)
);

CREATE TABLE company_legal_entity_id (
    "index" text,
    company_id text,
    legal_entities_id text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    created_at text,
    doing_business_as_name text,
    legal_entities text,
    legal_name text,
    "name" text,
    parent_legal_entity_id text,
    phone text,
    physical_address_country text,
    physical_address_formatted text,
    physical_address_locality text,
    physical_address_postal_code text,
    physical_address_region text,
    physical_address_street_address text,
    physical_address_type text,
    primary_email text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE worker_detail (
    id text,
    compensation_worker_id text,
    annual_compensation_currency_type text,
    annual_compensation_value text,
    compensation_annual_salary_equivalent text,
    compensation_bonus_schedule text,
    compensation_created_at text,
    compensation_id text,
    compensation_payment_term text,
    compensation_payment_type text,
    compensation_target_annual_bonus_percent text,
    compensation_updated_at text,
    employment_type_amount_worked text,
    employment_type_compensation_time_period text,
    employment_type_created_at text,
    employment_type_id text,
    employment_type_label text,
    employment_type_name text,
    employment_type_type text,
    employment_type_updated_at text,
    hourly_wage_currency_type text,
    hourly_wage_value text,
    monthly_compensation_currency_type text,
    monthly_compensation_value text,
    on_target_commission_currency_type text,
    on_target_commission_value text,
    relocation_reimbursement_currency_type text,
    relocation_reimbursement_value text,
    signing_bonus_currency_type text,
    signing_bonus_value text,
    target_annual_bonus_currency_type text,
    target_annual_bonus_value text,
    updated_at timestamp,
    weekly_compensation_currency_type text,
    weekly_compensation_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES worker(id),
    FOREIGN KEY (compensation_worker_id) REFERENCES worker(id)
);

CREATE TABLE team (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES team(id)
);

CREATE TABLE user_email (
    "index" text,
    user_id text,
    display text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_phone_number (
    "index" text,
    user_id text,
    display text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_address (
    "index" text,
    user_id text,
    country text,
    formatted text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_photo (
    "index" text,
    user_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    created_at text,
    display_name text,
    locale text,
    name_family_name text,
    name_formatted text,
    name_given_name text,
    name_middle_name text,
    name_preferred_family_name text,
    name_preferred_given_name text,
    number text,
    preferred_language text,
    timezone text,
    updated_at timestamp,
    username text,
    PRIMARY KEY (id)
);
