CREATE TABLE group_user (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    workspace_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE time_entry_tag (
    tag_id text,
    time_entry_id text,
    PRIMARY KEY (tag_id, time_entry_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE time_entry_custom_field (
    id text,
    time_entry_id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, time_entry_id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE time_entry (
    id text,
    project_id text,
    task_id text,
    user_id text,
    workspace_id text,
    billable text,
    cost_rate_amount text,
    cost_rate_currency text,
    description text,
    hourly_rate_amount text,
    hourly_rate_currency text,
    is_locked text,
    kiosk_id text,
    time_interval_duration text,
    time_interval_end text,
    time_interval_start text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE time_entry_report_tag (
    id text,
    time_entry_report_id text,
    PRIMARY KEY (id, time_entry_report_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (time_entry_report_id) REFERENCES time_entry_report(id)
);

CREATE TABLE time_entry_report (
    id text,
    client_id text,
    project_id text,
    task_id text,
    user_id text,
    amount text,
    approval_date text,
    approval_request_id text,
    approved_by text,
    billable text,
    cost_amount text,
    cost_rate text,
    currency text,
    description text,
    earned_amount text,
    earned_rate text,
    is_locked text,
    rate text,
    time_interval_duration text,
    time_interval_end text,
    time_interval_start text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_report (
    "date" text,
    user_id text,
    break text,
    capacity text,
    end_time text,
    has_running_entry text,
    image_url text,
    overtime text,
    remaining_capacity text,
    start_time text,
    time_off text,
    total_duration text,
    PRIMARY KEY ("date", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE holiday_user (
    holiday_id text,
    user_id text,
    PRIMARY KEY (holiday_id, user_id),
    FOREIGN KEY (holiday_id) REFERENCES holiday(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE holiday (
    id text,
    project_id text,
    task_id text,
    workspace_id text,
    automatic_time_entry_creation text,
    end_date text,
    everyone_including_new text,
    "name" text,
    occurs_annually text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE assignment (
    id text,
    client_id text,
    project_id text,
    user_id text,
    workspace_id text,
    billable text,
    hours_per_day text,
    note text,
    period_end text,
    period_start text,
    start_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_feature (
    "index" text,
    workspace_id text,
    feature text,
    PRIMARY KEY ("index", workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_currency (
    id text,
    workspace_id text,
    code text,
    is_default text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    admin_only_pages jsonb,
    automatic_lock text,
    can_see_time_sheet text,
    can_see_tracker text,
    cost_rate_amount text,
    cost_rate_currency text,
    currency_format text,
    default_billable_projects text,
    duration_format text,
    feature_subscription_type text,
    force_description text,
    force_projects text,
    force_tags text,
    force_tasks text,
    hourly_rate_amount text,
    hourly_rate_currency text,
    image_url text,
    is_project_public_by_default text,
    lock_time_entries text,
    lock_time_zone text,
    multi_factor_enabled text,
    "name" text,
    number_format text,
    only_admins_create_project text,
    only_admins_create_tag text,
    only_admins_create_task text,
    only_admins_see_all_time_entries text,
    only_admins_see_billable_rates text,
    only_admins_see_dashboard text,
    only_admins_see_public_projects_entries text,
    project_favorites text,
    project_grouping_label text,
    project_picker_special_filter text,
    round text,
    round_minutes text,
    subdomain_enabled text,
    subdomain_name text,
    time_rounding_in_reports text,
    time_tracking_mode text,
    track_time_down_to_second text,
    PRIMARY KEY (id)
);

CREATE TABLE approval_request_entry (
    _fivetran_id text,
    id text,
    PRIMARY KEY (_fivetran_id, id),
    FOREIGN KEY (_fivetran_id) REFERENCES approval_request(_fivetran_id),
    FOREIGN KEY (id) REFERENCES time_entry(id)
);

CREATE TABLE approval_request_expense (
    id text,
    _fivetran_id text,
    project_id text,
    task_id text,
    user_id text,
    approval_request_id text,
    approval_status text,
    billable text,
    category_archived text,
    category_has_unit_price text,
    category_id text,
    category_name text,
    category_price_in_cents text,
    category_unit text,
    category_workspace_id text,
    currency text,
    "date" text,
    file_id text,
    file_name text,
    locked text,
    notes text,
    quantity text,
    total text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES approval_request(_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE approval_request (
    _fivetran_id text,
    creator_id text,
    owner_id text,
    status_updated_by text,
    workspace_id text,
    approved_time text,
    billable_amount text,
    billable_time text,
    break_time text,
    cost_amount text,
    date_range_end text,
    date_range_start text,
    expense_total text,
    id text,
    owner_start_of_week text,
    pending_time text,
    status_note text,
    status_updated_at timestamp,
    tracked_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (status_updated_by) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE task_assignee (
    assignee_id text,
    task_id text,
    PRIMARY KEY (assignee_id, task_id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    project_id text,
    workspace_id text,
    billable text,
    budget_estimate text,
    cost_rate_amount text,
    cost_rate_currency text,
    duration text,
    estimate text,
    hourly_rate_amount text,
    hourly_rate_currency text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE project (
    id text,
    client_id text,
    workspace_id text,
    archived text,
    billable text,
    budget_estimate text,
    color text,
    cost_rate_amount text,
    cost_rate_currency text,
    duration text,
    estimate text,
    estimate_reset text,
    estimate_type text,
    hourly_rate_amount text,
    hourly_rate_currency text,
    "name" text,
    note text,
    public text,
    template text,
    time_estimate text,
    time_estimate_active text,
    time_estimate_include_non_billable text,
    time_estimate_reset_option text,
    time_estimate_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE invoice_item_time_entry (
    id text,
    invoice_item_index text,
    invoice_item_invoice_id text,
    PRIMARY KEY (id, invoice_item_index, invoice_item_invoice_id),
    FOREIGN KEY (id) REFERENCES time_entry(id),
    FOREIGN KEY (invoice_item_index) REFERENCES invoice_item("index"),
    FOREIGN KEY (invoice_item_invoice_id) REFERENCES invoice_item(invoice_id)
);

CREATE TABLE invoice_item (
    "index" text,
    invoice_id text,
    amount text,
    description text,
    item_type text,
    orders text,
    quantity text,
    unit_price text,
    PRIMARY KEY ("index", invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice (
    id text,
    client_id text,
    user_id text,
    amount text,
    balance text,
    bill_from text,
    company_id text,
    contains_imported_expenses text,
    contains_imported_times text,
    currency text,
    discount text,
    discount_amount text,
    due_date text,
    issued_date text,
    note text,
    paid text,
    "status" text,
    subject text,
    subtotal text,
    tax text,
    tax_2 text,
    tax_2_amount text,
    tax_amount text,
    visible_zero_fields jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE client (
    id text,
    currency_id text,
    workspace_id text,
    address text,
    archived text,
    email text,
    "name" text,
    note text,
    PRIMARY KEY (id),
    FOREIGN KEY (currency_id) REFERENCES workspace_currency(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE user_membership (
    target_id text,
    user_id text,
    cost_rate_amount text,
    cost_rate_currency text,
    hourly_rate_amount text,
    hourly_rate_currency text,
    "status" text,
    "type" text,
    PRIMARY KEY (target_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_field (
    id text,
    user_id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    workspace_id text,
    active_workspace text,
    alerts text,
    approval text,
    collapse_all_project_lists text,
    dashboard_pin_to_top text,
    dashboard_selection text,
    dashboard_view_type text,
    date_format text,
    default_workspace text,
    email text,
    group_similar_entries_disabled text,
    is_compact_view_on text,
    lang text,
    long_running text,
    multi_factor_enabled text,
    my_start_of_day text,
    "name" text,
    onboarding text,
    profile_picture text,
    project_list_collapse text,
    project_picker_task_filter text,
    pto text,
    reminders text,
    scheduled_reports text,
    scheduling text,
    send_newsletter text,
    show_only_working_days text,
    "status" text,
    summary_report_setting_groups text,
    summary_report_setting_subgroup text,
    theme text,
    time_format text,
    time_tracking_manual text,
    time_zone text,
    week_start text,
    weekly_updates text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE tags (
    id text,
    workspace_id text,
    archived text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);
