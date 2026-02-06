CREATE TABLE employee_absence_balance (
    id text,
    employee_id text,
    balance text,
    category jsonb,
    "name" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE time_off_type (
    id text,
    approval_required text,
    category text,
    certification_required text,
    certification_submission_timeframe text,
    half_day_requests_enabled text,
    legacy_category text,
    "name" text,
    substitute_option text,
    unit text,
    PRIMARY KEY (id)
);

CREATE TABLE document_category (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE project (
    id text,
    active text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE absence_period (
    id text,
    absence_type_id text,
    employee_id text,
    absence_type_name text,
    approved_at text,
    breakdowns jsonb,
    certificate_status text,
    "comment" text,
    created_at text,
    created_by text,
    effective_duration text,
    end_ text,
    half_day_end text,
    half_day_start text,
    measurement_unit text,
    origin text,
    "start" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (absence_type_id) REFERENCES time_off_type(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE absence_entitlement (
    id text,
    employee_id text,
    category text,
    entitlement text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE cost_center (
    id text,
    employee_id text,
    "name" text,
    percentage text,
    "type" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee (
    id text,
    supervisor_id text,
    contract_end_date text,
    created_at text,
    department_id text,
    department_name text,
    email text,
    employment_type text,
    first_name text,
    fix_salary text,
    fix_salary_currency text,
    fix_salary_interval text,
    gender text,
    hire_date text,
    holiday_calendar_country text,
    holiday_calendar_id text,
    holiday_calendar_label text,
    holiday_calendar_name text,
    holiday_calendar_state text,
    hourly_salary text,
    hourly_salary_currency text,
    last_modified_at text,
    last_name text,
    last_working_day text,
    office_id text,
    office_name text,
    "position" text,
    probation_period_end text,
    profile_picture_url text,
    "status" text,
    subcompany_id text,
    subcompany_name text,
    team_id text,
    team_name text,
    termination_date text,
    termination_reason text,
    termination_type text,
    vacation_day_balance text,
    weekly_working_hours text,
    work_schedule_friday text,
    work_schedule_id text,
    work_schedule_monday text,
    work_schedule_name text,
    work_schedule_saturday text,
    work_schedule_sunday text,
    work_schedule_thursday text,
    work_schedule_tuesday text,
    work_schedule_type text,
    work_schedule_valid_from text,
    work_schedule_wednesday text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (supervisor_id) REFERENCES employee(id)
);

CREATE TABLE time_off (
    id text,
    employee_id text,
    time_off_type_id text,
    certificate_status text,
    created_at text,
    created_by text,
    days_count text,
    end_date text,
    half_day_end text,
    half_day_start text,
    start_date text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (time_off_type_id) REFERENCES time_off_type(id)
);

CREATE TABLE report_column (
    "index" text,
    report_id text,
    columns text,
    PRIMARY KEY ("index", report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_filter (
    "index" text,
    report_id text,
    columns text,
    comparison text,
    "value" text,
    PRIMARY KEY ("index", report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_employee (
    employee_id text,
    report_id text,
    PRIMARY KEY (employee_id, report_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report (
    id text,
    author_first_name text,
    author_last_name text,
    created_at text,
    data_refreshed_at text,
    description text,
    end_date text,
    "name" text,
    period_type text,
    start_date text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE attendance (
    id text,
    employee_id text,
    project_id text,
    break text,
    "comment" text,
    "date" text,
    end_time text,
    is_holiday text,
    is_on_time_off text,
    start_time text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
