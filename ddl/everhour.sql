CREATE TABLE project_user (
    project_id text,
    user_id text,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE project (
    id text,
    client_id text,
    attributes jsonb,
    billing_fee text,
    billing_type text,
    can_sync_tasks text,
    change_protected text,
    connection_status text,
    created_at text,
    editable text,
    estimate_type text,
    favorite text,
    foreigns text,
    has_webhook text,
    is_template text,
    "name" text,
    platform text,
    privacy text,
    project_budget text,
    project_budget_applied_from text,
    project_budget_disallow_over_budget text,
    project_budget_exclude_expenses text,
    project_budget_exclude_unbillable_time text,
    project_budget_expense_progress text,
    project_budget_period text,
    project_budget_progress text,
    project_budget_show_to_users text,
    project_budget_threshold text,
    project_budget_time_progress text,
    project_budget_type text,
    rate text,
    rate_type text,
    "status" text,
    "type" text,
    user_cost_overrides jsonb,
    user_rate_overrides jsonb,
    workspace_id text,
    workspace_name text,
    -- custom_field_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client_project (
    client_id text,
    project_id text,
    PRIMARY KEY (client_id, project_id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE client_email (
    email_id text,
    client_id text,
    PRIMARY KEY (email_id, client_id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE client (
    id text,
    budget text,
    budget_applied_from text,
    budget_disallow_over_budget text,
    budget_exclude_expenses text,
    budget_exclude_unbillable_time text,
    budget_expense_progress text,
    budget_month_start_date text,
    budget_period text,
    budget_progress text,
    budget_show_to_users text,
    budget_threshold text,
    budget_time_progress text,
    budget_type text,
    business_details text,
    created_at text,
    default_discount text,
    default_tax_rate text,
    enable_resource_planner text,
    excluded_labels jsonb,
    favorite text,
    invoice_public_notes text,
    line_item_mask text,
    "name" text,
    payment_due_days text,
    reference text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE allocation (
    id text,
    time_off_type_id text,
    user_id text,
    accrual_frequency text,
    completed text,
    contract_start_date text,
    created_at text,
    created_by text,
    "day" text,
    day_allocated text,
    day_carried text,
    day_used text,
    end_date text,
    note text,
    restrict_over_allocation text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (time_off_type_id) REFERENCES time_off_type(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE time_off_type (
    id text,
    color text,
    description text,
    "name" text,
    paid text,
    PRIMARY KEY (id)
);

CREATE TABLE assignment (
    id text,
    project_id text,
    user_id text,
    days text,
    end_date text,
    start_date text,
    "time" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE timecard_history (
    "index" text,
    user_id text,
    "action" text,
    previous_time text,
    "time" text,
    "trigger" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES timecard(user_id)
);

CREATE TABLE timecard (
    user_id text,
    break_time text,
    clock_in text,
    clock_out text,
    work_time text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE expense_attachment (
    id text,
    expense_id text,
    "name" text,
    token text,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_id) REFERENCES expense(id)
);

CREATE TABLE expense (
    id text,
    category_id text,
    project_id text,
    amount text,
    billable text,
    "date" text,
    details text,
    quantity text,
    users text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE user_cost_history (
    id text,
    user_id text,
    cost text,
    created_at text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    access_edit_all text,
    access_edit_mine text,
    access_view_all text,
    access_view_mine text,
    allow_exceed_estimate text,
    allow_future_time text,
    allow_manage_estimates text,
    allow_manual_time_input text,
    allow_time_without_estimate text,
    allow_time_without_task text,
    avatar_url text,
    capacity text,
    created_at text,
    email text,
    enable_resource_planner text,
    groups jsonb,
    headline text,
    is_email_verified text,
    "name" text,
    rate text,
    "role" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_timer (
    started_at text,
    user_id text,
    task_id text,
    duration text,
    "status" text,
    today text,
    user_date text,
    PRIMARY KEY (started_at, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE time_record_history (
    id text,
    time_record_id text,
    "action" text,
    created_at text,
    created_by text,
    previous_time text,
    "time" text,
    PRIMARY KEY (id),
    FOREIGN KEY (time_record_id) REFERENCES time_record(id)
);

CREATE TABLE time_record (
    id text,
    task_id text,
    user_id text,
    "comment" text,
    "date" text,
    is_invoiced text,
    is_locked text,
    "time" text,
    PRIMARY KEY (id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_label (
    label text,
    task_id text,
    PRIMARY KEY (label, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_project (
    project_id text,
    task_id text,
    PRIMARY KEY (project_id, task_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    created_by_user_id text,
    project_section_id text,
    attributes_client text,
    attributes_priority text,
    completed text,
    created_at text,
    due_at text,
    estimate_type text,
    estimate_users jsonb,
    metrics_efforts text,
    metrics_expenses text,
    "name" text,
    "position" text,
    "status" text,
    "type" text,
    -- custom_field_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (project_section_id) REFERENCES project_section(id)
);

CREATE TABLE invoice_project (
    invoice_id text,
    project_id text,
    PRIMARY KEY (invoice_id, project_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE invoice_item (
    id text,
    invoice_id text,
    billed_time text,
    created_at text,
    custom text,
    list_amount text,
    "name" text,
    net_amount text,
    "position" text,
    taxable text,
    total_amount text,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice (
    id text,
    client_id text,
    user_id text,
    created_at text,
    date_from text,
    date_till text,
    discount_amount text,
    discount_rate text,
    due_date text,
    expense_mask text,
    include_expenses text,
    include_time text,
    is_sent text,
    issue_date text,
    limit_date_from text,
    limit_date_till text,
    list_amount text,
    net_amount text,
    payment_amount text,
    public_id text,
    public_notes text,
    show_row_numbers text,
    "status" text,
    tax_amount text,
    tax_rate text,
    template text,
    time_mask text,
    total_amount text,
    total_hours text,
    total_time text,
    valid text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE project_section (
    id text,
    project_id text,
    "name" text,
    "position" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE category (
    id text,
    color text,
    "name" text,
    unit_based text,
    unit_name text,
    unit_price text,
    PRIMARY KEY (id)
);
