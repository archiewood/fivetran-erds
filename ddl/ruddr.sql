CREATE TABLE location (
    id text,
    created_at text,
    is_active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE project_tag (
    id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    client_id text,
    practice_id text,
    billing_type_id text,
    budget_billable_expense text,
    budget_billable_hour text,
    budget_mode text,
    budget_non_billable_expense text,
    budget_non_billable_hour text,
    budget_other_revenue text,
    budget_revenue text,
    budget_services_revenue text,
    code text,
    created_at text,
    currency text,
    ends text,
    fixed_fee text,
    fixed_recurring_end text,
    fixed_recurring_fee text,
    fixed_recurring_start text,
    is_billable text,
    is_productive text,
    "key" text,
    monthly_budget_billable_expense text,
    monthly_budget_billable_hour text,
    monthly_budget_mode text,
    monthly_budget_non_billable_expense text,
    monthly_budget_non_billable_hour text,
    monthly_budget_other_revenue text,
    monthly_budget_revenue text,
    monthly_budget_services_revenue text,
    "name" text,
    notes text,
    po_number text,
    project_type_id text,
    project_type_name text,
    record_status_id text,
    requires_notes text,
    requires_tasks text,
    revenue_recognition_method text,
    "start" text,
    status_id text,
    use_budget text,
    use_monthly_budget text,
    use_roles text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (practice_id) REFERENCES practice(id)
);

CREATE TABLE practice (
    id text,
    created_at text,
    is_active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE project_task_tag (
    id text,
    project_task_id text,
    "name" text,
    PRIMARY KEY (id, project_task_id),
    FOREIGN KEY (project_task_id) REFERENCES project_task(id)
);

CREATE TABLE project_task_role (
    id text,
    project_task_id text,
    hours text,
    "name" text,
    PRIMARY KEY (id, project_task_id),
    FOREIGN KEY (project_task_id) REFERENCES project_task(id)
);

CREATE TABLE project_task (
    id text,
    client_id text,
    member_id text,
    project_id text,
    budgeted_hours text,
    budgeted_services_revenue text,
    cap_assigned_hours text,
    cap_hours text,
    code text,
    created_at text,
    ends text,
    for_assigned_only text,
    is_billable text,
    lock_time text,
    "name" text,
    notes text,
    orders text,
    project_member_hour text,
    project_member_id text,
    require_notes text,
    "start" text,
    status_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE allocation (
    id text,
    client_id text,
    member_id text,
    project_id text,
    role_id text,
    allocate_on_time_off_days text,
    assignment_type_id text,
    created_at text,
    ends text,
    entity text,
    hours_per_allocation text,
    hours_per_day text,
    hours_per_month text,
    hours_per_week text,
    hours_ratio_of_capacity text,
    is_billable text,
    notes text,
    placeholder_id text,
    placeholder_name text,
    read_only text,
    resource_type_id text,
    role_name text,
    "start" text,
    task_id text,
    task_name text,
    time_off_type_id text,
    time_off_type_name text,
    total_hours text,
    unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (role_id) REFERENCES project_task_role(id)
);

CREATE TABLE client_email (
    "index" text,
    client_id text,
    email text,
    PRIMARY KEY ("index", client_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client_tag (
    id text,
    client_id text,
    "name" text,
    PRIMARY KEY (id, client_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client (
    id text,
    practice_id text,
    code text,
    created_at text,
    currency text,
    invoice_notes text,
    is_internal text,
    "key" text,
    "name" text,
    notes text,
    owner_id text,
    owner_name text,
    payment_terms_id text,
    record_status_id text,
    street_address text,
    use_workspace_invoice_details text,
    PRIMARY KEY (id),
    FOREIGN KEY (practice_id) REFERENCES practice(id)
);

CREATE TABLE member_tag (
    id text,
    member_id text,
    "name" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_skill (
    id text,
    member_id text,
    "name" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_availability_period_hour_per_day (
    "index" text,
    member_availability_period_id text,
    member_id text,
    hour_per_day text,
    PRIMARY KEY ("index", member_availability_period_id, member_id),
    FOREIGN KEY (member_availability_period_id) REFERENCES member_availability_period(id),
    FOREIGN KEY (member_id) REFERENCES member_availability_period(member_id)
);

CREATE TABLE member_availability_period (
    id text,
    member_id text,
    ends text,
    "start" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_cost_period (
    id text,
    member_id text,
    cost_per_hour text,
    currency text,
    ends text,
    overhead_cost_per_hour text,
    "start" text,
    total_cost_per_hour text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_utilization_target_period (
    id text,
    member_id text,
    currency text,
    ends text,
    "start" text,
    target_percentage text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member (
    id text,
    location_id text,
    practice_id text,
    active_end_date text,
    active_start_date text,
    cost_method_id text,
    created_at text,
    default_rate text,
    default_rate_currency text,
    discipline_id text,
    discipline_name text,
    email text,
    employment_type_id text,
    forbid_timesheet_submission_when_below_capacity text,
    holiday_schedule_id text,
    holiday_schedule_name text,
    internal_id text,
    internal_notes text,
    invitation_status_id text,
    is_active text,
    is_billable text,
    job_title_id text,
    job_title_name text,
    login_enabled text,
    manager_id text,
    manager_name text,
    "name" text,
    receive_missing_time_reminders text,
    security_role_id text,
    security_role_name text,
    time_off_allowed text,
    time_off_approval_mode text,
    time_off_approver_id text,
    time_off_approver_name text,
    unsubmitted_timesheet_reminders text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (practice_id) REFERENCES practice(id)
);

CREATE TABLE time_entry (
    id text,
    client_id text,
    member_id text,
    project_id text,
    role_id text,
    created_at text,
    "date" text,
    invoice_id text,
    invoice_number text,
    invoiced text,
    is_billable text,
    minutes text,
    notes text,
    role_name text,
    status_id text,
    task_id text,
    task_name text,
    time_off_type_id text,
    time_off_type_name text,
    timer_started_at text,
    type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (role_id) REFERENCES project_task_role(id)
);
