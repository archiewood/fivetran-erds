CREATE TABLE space_document (
    id text,
    project_id text,
    created_by_user_id text,
    space_id text,
    updated_by_user_id text,
    created_at text,
    "name" text,
    private text,
    template_id text,
    template_name text,
    "type" text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id)
);

CREATE TABLE project_partner_company (
    id text,
    project_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_team_member (
    id text,
    project_id text,
    email_id text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_team_customer (
    id text,
    project_id text,
    email_id text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_field (
    id text,
    project_id text,
    label text,
    "value" text,
    value_label text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES field(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_current_phase (
    id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_source (
    template_id text,
    project_id text,
    prefix text,
    start_date text,
    template_name text,
    PRIMARY KEY (template_id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    created_by_id text,
    customer_champion_user_id text,
    customer_company_id text,
    owner_id text,
    updated_by_id text,
    allocated_hours text,
    allocated_minute text,
    annualized_recurring_revenue text,
    archived text,
    auto_allocation text,
    billable_hour text,
    billable_minute text,
    budgeted_hours text,
    created_at timestamp,
    currency_code text,
    currency_name text,
    currency_symbol text,
    customer_company_name text,
    customer_company_url text,
    customers_invited text,
    customers_joined text,
    due_date text,
    due_date_actual text,
    external_reference_id text,
    fee text,
    financial_contract_type text,
    financial_fixed_fee text,
    financial_metrics_actual_cost text,
    financial_metrics_actual_profit text,
    financial_metrics_actual_profit_margin text,
    financial_metrics_actual_revenue text,
    financial_metrics_estimate_at_completion text,
    financial_metrics_estimated_cost text,
    financial_metrics_estimated_profit text,
    financial_metrics_estimated_profit_margin text,
    financial_metrics_estimated_revenue text,
    financial_metrics_estimation_to_completion_in_hours text,
    financial_subscription_contract_frequency text,
    financial_subscription_contract_no_of_periods text,
    financial_subscription_contract_period_budget text,
    financial_subscription_contract_period_minute text,
    financial_subscription_contract_start_date text,
    financial_time_and_material_contract_project_budget text,
    financial_time_and_material_contract_rate_card_id text,
    financial_time_and_material_contract_rate_card_name text,
    inferred_progress text,
    "name" text,
    non_billable_hour text,
    non_billable_minute text,
    percentage_budget_consumed text,
    planned_duration_in_days text,
    progress_percentage text,
    project_age_in_days text,
    start_date text,
    start_date_actual text,
    status_label text,
    status_value text,
    tracked_hours text,
    tracked_minute text,
    updated_at timestamp,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES project_team_member(id),
    FOREIGN KEY (customer_champion_user_id) REFERENCES project_team_customer(id),
    FOREIGN KEY (customer_company_id) REFERENCES project_partner_company(id),
    FOREIGN KEY (owner_id) REFERENCES project_team_member(id),
    FOREIGN KEY (updated_by_id) REFERENCES project_team_member(id)
);

CREATE TABLE space (
    id text,
    project_id text,
    created_by_user_id text,
    updated_by_user_id text,
    created_at text,
    "name" text,
    private text,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id)
);

CREATE TABLE timeoff_user_notification (
    time_off_id text,
    user_id text,
    PRIMARY KEY (time_off_id, user_id),
    FOREIGN KEY (time_off_id) REFERENCES time_off(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE time_off (
    id text,
    user_id text,
    created_at timestamp,
    duration_in_minutes text,
    end_date text,
    note text,
    project_owners text,
    start_date text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE resource_allocation_task (
    resource_allocation_fivetran_id text,
    task_id text,
    PRIMARY KEY (resource_allocation_fivetran_id, task_id),
    FOREIGN KEY (resource_allocation_fivetran_id) REFERENCES resource_allocation(_fivetran_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE resource_allocation (
    _fivetran_id text,
    created_by_user_id text,
    project_id text,
    updated_by_user_id text,
    user_id text,
    allocation_for text,
    allocation_type text,
    created_at text,
    duration_days_consider text,
    duration_hours text,
    duration_minutes text,
    duration_seconds text,
    end_date text,
    hours_per_day text,
    minutes_per_day text,
    placeholder_id text,
    placeholder_name text,
    role_id text,
    role_name text,
    seconds_per_day text,
    start_date text,
    updated_at timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE phase (
    id text,
    project_id text,
    created_by_user_id text,
    updated_by_user_id text,
    created_at text,
    due_date text,
    due_date_actual text,
    "name" text,
    private text,
    start_date text,
    start_date_actual text,
    status_label text,
    status_value text,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id)
);

CREATE TABLE time_entry (
    id text,
    project_id text,
    project_phase_id text,
    task_id text,
    user_id text,
    activity_name text,
    bill_rate text,
    bill_rate_currency text,
    billable text,
    category_id text,
    category_name text,
    cost_rate text,
    cost_rate_currency text,
    created_at text,
    "date" text,
    deleted boolean,
    minutes text,
    notes text,
    source_type text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (project_phase_id) REFERENCES project_current_phase(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES project_team_member(id)
);

CREATE TABLE task_field (
    id text,
    task_id text,
    label text,
    "value" text,
    value_label text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES field(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_assignee_member (
    id text,
    task_id text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES project_team_member(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_assignee_placeholder (
    id text,
    task_id text,
    "name" text,
    role_id text,
    role_name text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES project_team_member(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_follower_member (
    id text,
    task_id text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES project_team_member(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_follower_placeholder (
    id text,
    task_id text,
    "name" text,
    role_id text,
    role_name text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES project_team_member(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_dependency (
    "index" text,
    task_dependency_id text,
    task_id text,
    PRIMARY KEY ("index", task_dependency_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    created_by_id text,
    project_id text,
    updated_by_id text,
    archived text,
    at_risk text,
    billable text,
    created_at timestamp,
    csat_enabled text,
    description text,
    due_date text,
    due_date_actual text,
    effort_in_minutes text,
    external_reference_id text,
    "name" text,
    parent_task_id text,
    parent_task_name text,
    phase_id text,
    phase_name text,
    priority_label text,
    priority_value text,
    progress text,
    start_date text,
    start_date_actual text,
    status_label text,
    status_value text,
    task_private_note text,
    time_entry_category_id text,
    time_entry_category_name text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES project_team_member(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (updated_by_id) REFERENCES project_team_member(id)
);

CREATE TABLE field (
    id text,
    created_by_id text,
    updated_by_id text,
    created_at text,
    description text,
    enabled text,
    label text,
    object_type text,
    private text,
    rating_scale text,
    "type" text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES project_team_member(id),
    FOREIGN KEY (updated_by_id) REFERENCES project_team_member(id)
);

CREATE TABLE user_field (
    id text,
    users_id text,
    field_value text,
    field_value_label text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (id) REFERENCES field(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_by_user_id text,
    updated_by_user_id text,
    calender_id text,
    calender_name text,
    capacity_in_minute text,
    company_id text,
    company_name text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    permission_id text,
    permission_name text,
    profile_picture_url text,
    role_id text,
    role_name text,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id)
);
