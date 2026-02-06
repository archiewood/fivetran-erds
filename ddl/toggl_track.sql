CREATE TABLE workspace (
    id text,
    "admin" text,
    business_ws text,
    constraint_description_present text,
    constraint_project_present text,
    constraint_tag_present text,
    constraint_task_present text,
    constraint_time_entry_constraints_enabled text,
    csv_upload_at text,
    csv_upload_log_id text,
    default_currency text,
    default_hourly_rate text,
    ical_enabled text,
    ical_url text,
    logo_url text,
    "name" text,
    only_admins_may_create_projects text,
    only_admins_may_create_tags text,
    only_admins_see_billable_rates text,
    only_admins_see_team_dashboard text,
    organization_id text,
    premium text,
    profile text,
    projects_billable_by_default text,
    rate_last_updated text,
    reports_collapse text,
    rounding text,
    rounding_minutes text,
    server_deleted_at text,
    subscription_auto_renew text,
    subscription_card_details text,
    subscription_company_id text,
    subscription_contact_detail text,
    subscription_created_at text,
    subscription_currency text,
    subscription_customer_id text,
    subscription_deleted_at text,
    subscription_last_pricing_plan_id text,
    subscription_organization_id text,
    subscription_payment_details text,
    subscription_pricing_plan_id text,
    subscription_renewal_at text,
    subscription_subscription_id text,
    subscription_subscription_period text,
    subscription_workspace_id text,
    suspended_at text,
    updated_at text,
    working_hours_in_minutes text,
    PRIMARY KEY (id)
);

CREATE TABLE client (
    id text,
    workspace_id text,
    archived text,
    "name" text,
    server_deleted_at text,
    update_at text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_project_group (
    id text,
    workspace_id text,
    group_id text,
    project_id text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE group_user (
    group_id text,
    user_id text,
    avatar_url text,
    joined text,
    "name" text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE group_workspace (
    group_id text,
    workspace_id text,
    PRIMARY KEY (group_id, workspace_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE groups (
    id text,
    organization_id text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE project (
    id text,
    workspace_id text,
    client_id text,
    active text,
    actual_hours text,
    auto_estimates text,
    billable text,
    color text,
    created_at text,
    currency text,
    current_period text,
    estimated_hours text,
    fixed_fee text,
    is_private text,
    "name" text,
    rate text,
    rate_last_updated text,
    recurring text,
    recurring_parameters text,
    server_deleted_at text,
    template text,
    updated_at text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE users_group (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE users (
    organization_id text,
    user_id text,
    workspace_id text,
    active text,
    avatar_file_name text,
    email text,
    id text,
    invitation_code text,
    invite_url text,
    is_admin text,
    is_direct text,
    is_inactive text,
    labour_cost text,
    "name" text,
    organization_admin text,
    rate text,
    rate_last_updated text,
    timezone text,
    updated_at text,
    working_hours_in_minutes text,
    workspace_admin text,
    PRIMARY KEY (organization_id, user_id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE tags (
    id text,
    workspace_id text,
    deleted_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE project_user (
    id text,
    workspace_id text,
    group_id text,
    project_id text,
    user_id text,
    manager text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE timesheet_approver (
    "index" text,
    member_id text,
    start_date text,
    timesheet_id text,
    workspace_id text,
    active text,
    avatar_url text,
    deleted text,
    "name" text,
    user_id text,
    PRIMARY KEY ("index", member_id, start_date, timesheet_id, workspace_id),
    FOREIGN KEY (member_id) REFERENCES timesheet(member_id),
    FOREIGN KEY (start_date) REFERENCES timesheet(start_date),
    FOREIGN KEY (timesheet_id) REFERENCES timesheet(id),
    FOREIGN KEY (workspace_id) REFERENCES timesheet(workspace_id)
);

CREATE TABLE timesheet_error (
    "index" text,
    member_id text,
    start_date text,
    timesheet_id text,
    workspace_id text,
    code text,
    message text,
    PRIMARY KEY ("index", member_id, start_date, timesheet_id, workspace_id),
    FOREIGN KEY (member_id) REFERENCES timesheet(member_id),
    FOREIGN KEY (start_date) REFERENCES timesheet(start_date),
    FOREIGN KEY (timesheet_id) REFERENCES timesheet(id),
    FOREIGN KEY (workspace_id) REFERENCES timesheet(workspace_id)
);

CREATE TABLE timesheet_review (
    "index" text,
    member_id text,
    start_date text,
    timesheet_id text,
    workspace_id text,
    approved text,
    avatar_url text,
    force_approved text,
    "name" text,
    rejection_comment text,
    updated_at text,
    user_id text,
    PRIMARY KEY ("index", member_id, start_date, timesheet_id, workspace_id),
    FOREIGN KEY (member_id) REFERENCES timesheet(member_id),
    FOREIGN KEY (start_date) REFERENCES timesheet(start_date),
    FOREIGN KEY (timesheet_id) REFERENCES timesheet(id),
    FOREIGN KEY (workspace_id) REFERENCES timesheet(workspace_id)
);

CREATE TABLE timesheet (
    id text,
    member_id text,
    start_date text,
    workspace_id text,
    approved_or_rejected_at text,
    approved_or_rejected_id text,
    approved_or_rejected_name text,
    approver_avatar_url text,
    approver_id text,
    approver_name text,
    approvers_layers jsonb,
    end_date text,
    member_avatar_url text,
    member_name text,
    period_editable text,
    period_end text,
    period_locked text,
    period_start text,
    periodicity text,
    permission jsonb,
    rejection_comment text,
    reminder_day text,
    reminder_sent_at text,
    reminder_time text,
    review_layer text,
    "status" text,
    submitted_at text,
    timezone text,
    working_hours_in_minutes text,
    PRIMARY KEY (id, member_id, start_date, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE time_entry (
    id text,
    project_id text,
    task_id text,
    user_id text,
    billable text,
    billable_amount_in_cents text,
    currency text,
    description text,
    hourly_rate_in_cents text,
    seconds text,
    "start" text,
    stop text,
    updated_at text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE time_entry_tag (
    tag_id text,
    time_entry_id text,
    PRIMARY KEY (tag_id, time_entry_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE task (
    id text,
    workspace_id text,
    project_id text,
    user_id text,
    active text,
    estimated_seconds text,
    "name" text,
    recurring text,
    server_deleted_at text,
    tracked_seconds text,
    updated_at text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE organization (
    id text,
    created_at text,
    is_admin text,
    is_multi_workspace_enabled text,
    is_trial text,
    is_trial_available text,
    is_unified text,
    last_pricing_plan_id text,
    max_workspace text,
    modified_at text,
    "name" text,
    next_payment_date text,
    owner text,
    payment_methods text,
    pricing_plan_id text,
    server_deleted_at text,
    suspended_at text,
    trial_end_date text,
    user_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES workspace(organization_id)
);
