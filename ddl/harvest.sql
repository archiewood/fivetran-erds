CREATE TABLE estimate_item_category (
    id text,
    updated_at text,
    created_at text,
    "name" text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE contact (
    id text,
    updated_at text,
    client_id text,
    created_at text,
    email text,
    fax text,
    first_name text,
    last_name text,
    phone_mobile text,
    phone_office text,
    title text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE project_user_assignment (
    id text,
    updated_at text,
    project_id text,
    user_id text,
    budget text,
    created_at text,
    hourly_rate text,
    is_active text,
    is_project_manager text,
    use_default_rates text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE role_user (
    role_user_id text,
    role_id text,
    PRIMARY KEY (role_user_id, role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    updated_at text,
    created_at text,
    "name" text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE time_entry (
    id text,
    updated_at text,
    client_id text,
    invoice_id text,
    project_id text,
    task_assignment_id text,
    task_id text,
    user_assignment_id text,
    user_id text,
    billable text,
    billable_rate text,
    budgeted text,
    cost_rate text,
    created_at text,
    ended_time text,
    external_reference text,
    hours text,
    hours_without_timer text,
    is_billed text,
    is_closed text,
    is_locked text,
    is_running text,
    locked_reason text,
    notes text,
    rounded_hours text,
    spent_date text,
    started_time text,
    timer_started_at text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_assignment_id) REFERENCES project_task_assignment(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_assignment_id) REFERENCES project_user_assignment(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE project_task_assignment (
    id text,
    updated_at text,
    project_id text,
    task_id text,
    billable text,
    budget text,
    created_at text,
    hourly_rate text,
    is_active text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE invoice_item_category (
    id text,
    updated_at text,
    created_at text,
    "name" text,
    use_as_expense text,
    use_as_service text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE invoice_message_recipient (
    email text,
    invoice_message_id text,
    "name" text,
    PRIMARY KEY (email, invoice_message_id),
    FOREIGN KEY (invoice_message_id) REFERENCES invoice_message(id)
);

CREATE TABLE invoice_message (
    id text,
    updated_at text,
    invoice_id text,
    attach_pdf text,
    body text,
    created_at text,
    event_type text,
    include_link_to_client_invoice text,
    reminder text,
    send_me_a_copy text,
    send_reminder_on text,
    sent_by text,
    sent_by_email text,
    sent_from text,
    sent_from_email text,
    subject text,
    thank_you text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE user_cost_rate (
    id text,
    updated_at text,
    users_id text,
    amount text,
    created_at text,
    end_date text,
    start_date text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE expense_category (
    id text,
    updated_at text,
    created_at text,
    is_active text,
    "name" text,
    unit_name text,
    unit_price text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE user_project_assignment_task_assignment (
    id text,
    updated_at text,
    task_id text,
    users_id text,
    billable text,
    budget text,
    created_at text,
    hourly_rate text,
    is_active text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_project_assignment (
    id text,
    updated_at text,
    client_id text,
    project_id text,
    users_id text,
    budget text,
    created_at text,
    hourly_rate text,
    is_active text,
    is_project_manager text,
    use_default_rates text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE task (
    id text,
    updated_at text,
    billable_by_default text,
    created_at text,
    default_hourly_rate text,
    is_active text,
    is_default text,
    "name" text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE project (
    id text,
    updated_at text,
    client_id text,
    bill_by text,
    budget text,
    budget_by text,
    budget_is_monthly text,
    code text,
    cost_budget text,
    cost_budget_include_expenses text,
    created_at text,
    ends_on text,
    fee text,
    hourly_rate text,
    is_active text,
    is_billable text,
    is_fixed_fee text,
    "name" text,
    notes text,
    notify_when_over_budget text,
    over_budget_notification_date text,
    over_budget_notification_percentage text,
    show_budget_to_all text,
    starts_on text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE invoice_payment (
    id text,
    updated_at text,
    invoice_id text,
    amount text,
    created_at text,
    notes text,
    paid_at text,
    paid_date text,
    payment_gateway_id text,
    payment_gateway_name text,
    recorded_by text,
    recorded_by_email text,
    transaction_id text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_line_item (
    id text,
    invoice_id text,
    project_id text,
    amount text,
    description text,
    kind text,
    quantity text,
    taxed text,
    taxed_2 text,
    unit_price text,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE invoice (
    id text,
    updated_at text,
    client_id text,
    creator_id text,
    amount text,
    client_key text,
    closed_at text,
    created_at text,
    currency text,
    discount text,
    discount_amount text,
    due_amount text,
    due_date text,
    issue_date text,
    notes text,
    number text,
    paid_at text,
    paid_date text,
    payment_term text,
    period_end text,
    period_start text,
    purchase_order text,
    recurring_invoice_id text,
    sent_at text,
    "state" text,
    subject text,
    tax text,
    tax_2 text,
    tax_2_amount text,
    tax_amount text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE client (
    id text,
    updated_at text,
    address text,
    created_at text,
    currency text,
    is_active text,
    "name" text,
    statement_key text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE expense (
    id text,
    updated_at text,
    client_id text,
    expense_category_id text,
    invoice_id text,
    project_id text,
    user_assignment_id text,
    user_id text,
    billable text,
    created_at text,
    is_billed text,
    is_closed text,
    is_locked text,
    locked_reason text,
    notes text,
    receipt_content_type text,
    receipt_file_name text,
    receipt_file_size text,
    receipt_url text,
    spent_date text,
    total_cost text,
    units text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_assignment_id) REFERENCES project_user_assignment(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_billable_rate (
    id text,
    updated_at text,
    users_id text,
    amount text,
    created_at text,
    end_date text,
    start_date text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE estimate_message_recipient (
    email text,
    estimate_message_id text,
    "name" text,
    PRIMARY KEY (email, estimate_message_id),
    FOREIGN KEY (estimate_message_id) REFERENCES estimate_message(id)
);

CREATE TABLE estimate_message (
    id text,
    updated_at text,
    estimate_id text,
    body text,
    created_at text,
    event_type text,
    send_me_a_copy text,
    sent_by text,
    sent_by_email text,
    sent_from text,
    sent_from_email text,
    subject text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (estimate_id) REFERENCES estimate(id)
);

CREATE TABLE users_permission_claim (
    permission_claim_name text,
    users_id text,
    PRIMARY KEY (permission_claim_name, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    updated_at text,
    avatar_url text,
    calendar_integration_enabled text,
    calendar_integration_source text,
    can_close_account text,
    can_create_invoices text,
    can_create_projects text,
    can_see_rates text,
    cost_rate text,
    created_at text,
    default_hourly_rate text,
    email text,
    first_name text,
    has_access_to_all_future_projects text,
    is_active text,
    is_admin text,
    is_contractor text,
    is_project_manager text,
    last_name text,
    telephone text,
    timezone text,
    weekly_capacity text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE estimate_line_item (
    id text,
    estimate_id text,
    amount text,
    description text,
    kind text,
    quantity text,
    taxed text,
    taxed_2 text,
    unit_price text,
    PRIMARY KEY (id),
    FOREIGN KEY (estimate_id) REFERENCES estimate(id)
);

CREATE TABLE estimate (
    id text,
    updated_at text,
    client_id text,
    creator_id text,
    accepted_at text,
    amount text,
    client_key text,
    created_at text,
    currency text,
    declined_at text,
    discount text,
    discount_amount text,
    issue_date text,
    notes text,
    number text,
    purchase_order text,
    sent_at text,
    "state" text,
    subject text,
    tax text,
    tax_2 text,
    tax_2_amount text,
    tax_amount text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);
