CREATE TABLE story_allocation_day (
    id bigint,
    assignment_id bigint,
    story_id bigint,
    created_at timestamp,
    "current" boolean,
    "date" text,
    minutes integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE "role" (
    id bigint,
    created_at timestamp,
    deleted_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE assignment (
    id bigint,
    assignee_id bigint,
    story_id bigint,
    allocated_minutes integer,
    created_at timestamp,
    "current" boolean,
    estimated_minutes integer,
    resource_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES "user"(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE workspace_invoice_preference (
    id bigint,
    workspace_id bigint,
    client_invoice_address text,
    client_invoice_name text,
    consultant_invoice_address text,
    consultant_invoice_name text,
    project_code text,
    purchase_order text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE time_off_entry (
    id bigint,
    user_id bigint,
    hours text,
    requested_date text,
    submission_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE holiday (
    id bigint,
    end_date text,
    "name" text,
    paid boolean,
    start_date text,
    total_hours integer,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_time_entry (
    invoice_id bigint,
    time_entry_id bigint,
    PRIMARY KEY (invoice_id, time_entry_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id)
);

CREATE TABLE account_membership (
    id bigint,
    default_role_id bigint,
    manager_id bigint,
    user_id bigint,
    bill_rate_in_cents bigint,
    billability_target bigint,
    can_create_workspace boolean,
    can_view_reports boolean,
    cost_rate_in_cents bigint,
    created_at timestamp,
    default_read_only boolean,
    disabled_at timestamp,
    is_administrator boolean,
    is_backup_approver boolean,
    is_owner boolean,
    is_project_lead boolean,
    is_punch_clock_user boolean,
    manager_can_approve boolean,
    permission text,
    should_show_alert_on_timesheet_submission boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (default_role_id) REFERENCES "role"(id),
    FOREIGN KEY (manager_id) REFERENCES "user"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE rate_card_version_history (
    id bigint,
    updated_at timestamp,
    rate_card_id bigint,
    created_at timestamp,
    default_rate integer,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (rate_card_id) REFERENCES rate_card_history(id)
);

CREATE TABLE skill_membership (
    id bigint,
    creator_id bigint,
    skill_id bigint,
    user_id bigint,
    created_at timestamp,
    "level" integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE account_location (
    id bigint,
    archived boolean,
    in_use boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE workweek (
    id bigint,
    created_at timestamp,
    "default" boolean,
    end_date text,
    friday_minutes integer,
    monday_minutes integer,
    saturday_minutes integer,
    start_date text,
    sunday_minutes integer,
    thursday_minutes integer,
    total_minutes integer,
    tuesday_minutes integer,
    updated_at timestamp,
    wednesday_minutes integer,
    PRIMARY KEY (id)
);

CREATE TABLE estimate_scenario (
    id bigint,
    estimate_id bigint,
    rate_card_id bigint,
    budget_in_cents bigint,
    created_at timestamp,
    "name" text,
    start_date text,
    target_margin_percent integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (estimate_id) REFERENCES estimate(id),
    FOREIGN KEY (rate_card_id) REFERENCES rate_card_history(id)
);

CREATE TABLE skill (
    id bigint,
    skill_category_id bigint,
    created_at timestamp,
    description text,
    max_level text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (skill_category_id) REFERENCES skill_category(id)
);

CREATE TABLE participation (
    id bigint,
    workspace_id bigint,
    user_id bigint,
    active_role_name text,
    allocated_workspace_minutes bigint,
    can_invite boolean,
    cost_in_cents bigint,
    created_at timestamp,
    default_rate_in_cents bigint,
    estimated_workspace_minutes bigint,
    is_team_lead boolean,
    permissions text,
    rate_in_cents bigint,
    "role" text,
    show_as_read_only boolean,
    updated_at timestamp,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE workspace_resource (
    id bigint,
    participation_id bigint,
    role_id bigint,
    user_id bigint,
    workspace_id bigint,
    created_at timestamp,
    display_label text,
    full_name text,
    label text,
    photo_path text,
    role_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (participation_id) REFERENCES participation(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE rate_card_set_history (
    id bigint,
    updated_at timestamp,
    account_default boolean,
    active_currencies jsonb,
    created_at timestamp,
    default_currencies jsonb,
    destroyable boolean,
    title text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE rate_card_role_history (
    id bigint,
    updated_at timestamp,
    rate_card_version_id bigint,
    role_id bigint,
    created_at timestamp,
    rate integer,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (rate_card_version_id) REFERENCES rate_card_version_history(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "user" (
    id bigint,
    role_id bigint,
    account_id bigint,
    email_address text,
    full_name text,
    headline text,
    photo_path text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE expense (
    id bigint,
    expense_category_id bigint,
    story_id bigint,
    user_id bigint,
    workspace_id bigint,
    amount_in_cents bigint,
    category text,
    created_at timestamp,
    currency text,
    currency_base_unit integer,
    currency_symbol text,
    "date" text,
    is_billable boolean,
    is_invoiced boolean,
    notes text,
    taxable boolean,
    updated_at timestamp,
    user_can_edit boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_association (
    workspace_group_id bigint,
    workspace_id bigint,
    PRIMARY KEY (workspace_group_id, workspace_id),
    FOREIGN KEY (workspace_group_id) REFERENCES workspace_group(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE billable_utilizations (
    id bigint,
    account_membership_id bigint,
    creator_id bigint,
    created_at timestamp,
    effective_date text,
    target integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_membership_id) REFERENCES account_membership(id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE workspace (
    id bigint,
    account_color_id bigint,
    creator_id bigint,
    primary_workspace_group_id bigint,
    rate_card_id bigint,
    access_level text,
    account_feature_has_time_entry_role_picker boolean,
    account_feature_time_trackable boolean,
    archived boolean,
    budget_used_in_cents bigint,
    budgeted boolean,
    can_create_line_items boolean,
    can_invite boolean,
    change_orders_enabled boolean,
    client_role_name text,
    consultant_role_name text,
    created_at timestamp,
    currency text,
    currency_base_unit integer,
    currency_symbol text,
    default_rate numeric,
    description text,
    due_date text,
    effective_due_date text,
    exclude_archived_stories_percent_complete boolean,
    expenses_in_burn_rate boolean,
    has_active_expense_report_submissions boolean,
    has_active_timesheet_submissions boolean,
    has_budget_access boolean,
    over_budget boolean,
    percentage_complete integer,
    posts_require_privacy_decision boolean,
    price_in_cents bigint,
    primary_counterpart_id integer,
    provider_lead_name text,
    require_expense_approvals boolean,
    require_time_approvals boolean,
    start_date text,
    status_color text,
    status_key integer,
    status_message text,
    stories_are_fixed_fee_by_default boolean,
    target_margin integer,
    tasks_default_non_billable boolean,
    title text,
    total_expenses_in_cents bigint,
    updated_at timestamp,
    -- custom_* (dynamic column),
    -- permission_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_color_id) REFERENCES account_color(id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (primary_workspace_group_id) REFERENCES workspace_group(id),
    FOREIGN KEY (rate_card_id) REFERENCES rate_card_history(id)
);

CREATE TABLE timesheet_submission (
    id bigint,
    user_id bigint,
    workspace_id bigint,
    "comment" text,
    created_at timestamp,
    currency text,
    currency_base_unit integer,
    currency_symbol text,
    current_resolution_created_at_date timestamp,
    current_resolution_creator_id integer,
    current_resolution_description text,
    end_date text,
    line_item_total_formatted text,
    line_item_total_in_cents bigint,
    resolution_description text,
    start_date text,
    "status" text,
    title text,
    "type" text,
    updated_at timestamp,
    -- permission_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE story_state_change (
    id bigint,
    story_id bigint,
    user_id bigint,
    created_at timestamp,
    formatted_state text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE story (
    id bigint,
    creator_id bigint,
    parent_id bigint,
    root_id bigint,
    workspace_id bigint,
    archived boolean,
    assignment_timestamped_at timestamp,
    billable boolean,
    budget_estimate_in_cents bigint,
    budget_used_in_cents bigint,
    created_at timestamp,
    deleted_at timestamp,
    description text,
    due_date text,
    fixed_fee boolean,
    has_proofing_access boolean,
    invoiced_balance_in_cents bigint,
    logged_billable_time_in_minutes integer,
    logged_nonbillable_time_in_minutes integer,
    percentage_complete integer,
    "position" integer,
    priority text,
    start_date text,
    "state" text,
    story_type text,
    sub_stories_billable_time_in_minutes integer,
    sub_stories_budget_estimate_in_cents bigint,
    sub_stories_budget_used_in_cents bigint,
    sub_stories_time_estimate_in_minutes integer,
    sub_story_count integer,
    subtree_depth integer,
    time_estimate_in_minutes integer,
    time_trackable boolean,
    title text,
    uninvoiced_balance_in_cents bigint,
    updated_at timestamp,
    weight integer,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (parent_id) REFERENCES story(id),
    FOREIGN KEY (root_id) REFERENCES story(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE invoice_expense (
    expense_id bigint,
    invoice_id bigint,
    PRIMARY KEY (expense_id, invoice_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE estimate (
    id bigint,
    creator_id bigint,
    workspace_group_id bigint,
    created_at timestamp,
    currency text,
    is_locked boolean,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_group_id) REFERENCES workspace_group(id)
);

CREATE TABLE timesheet_submission_time_entry (
    time_entry_id bigint,
    timesheet_submission_id bigint,
    PRIMARY KEY (time_entry_id, timesheet_submission_id),
    FOREIGN KEY (time_entry_id) REFERENCES time_entry(id),
    FOREIGN KEY (timesheet_submission_id) REFERENCES timesheet_submission(id)
);

CREATE TABLE workspace_user (
    user_id bigint,
    workspace_id bigint,
    PRIMARY KEY (user_id, workspace_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE invoice_fixed_fee_item (
    fixed_fee_item_id bigint,
    invoice_id bigint,
    PRIMARY KEY (fixed_fee_item_id, invoice_id),
    FOREIGN KEY (fixed_fee_item_id) REFERENCES fixed_fee_item(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE fixed_fee_item (
    id bigint,
    story_id bigint,
    workspace_id bigint,
    amount_in_cents bigint,
    currency text,
    notes text,
    taxable boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE invoice_workspace (
    invoice_id bigint,
    workspace_id bigint,
    PRIMARY KEY (invoice_id, workspace_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_status_change (
    id bigint,
    from_color text,
    to_color text,
    user_id bigint,
    workspace_id bigint,
    created_at timestamp,
    from_message text,
    from_status_key text,
    to_message text,
    to_status_key text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (from_color) REFERENCES account_color(id),
    FOREIGN KEY (to_color) REFERENCES account_color(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE holiday_calendar_membership (
    id bigint,
    holiday_calendar_id bigint,
    user_id bigint,
    created_at timestamp,
    end_date text,
    in_use boolean,
    start_date text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (holiday_calendar_id) REFERENCES holiday_calendar(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE holiday_calendar (
    id bigint,
    "default" boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE time_entry (
    id bigint,
    location_id bigint,
    story_id bigint,
    user_id bigint,
    workspace_id bigint,
    active_submission_id bigint,
    approved boolean,
    billable boolean,
    cost_rate_in_cents bigint,
    created_at timestamp,
    currency text,
    currency_base_unit integer,
    currency_symbol text,
    date_performed text,
    is_invoiced boolean,
    notes text,
    rate_in_cents bigint,
    taxable boolean,
    time_in_minutes integer,
    updated_at timestamp,
    user_can_edit boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES account_location(id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE account_color (
    id bigint,
    created_at timestamp,
    default_color boolean,
    enabled boolean,
    hex text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE estimate_scenario_resource (
    id bigint,
    estimate_scenario_id bigint,
    role_id bigint,
    user_id bigint,
    bill_rate bigint,
    cost_rate bigint,
    created_at timestamp,
    geography_id bigint,
    label text,
    updated_at timestamp,
    PRIMARY KEY (id, estimate_scenario_id),
    FOREIGN KEY (estimate_scenario_id) REFERENCES estimate_scenario(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE invoice (
    id bigint,
    recipient_id bigint,
    user_id bigint,
    balance_in_cents bigint,
    created_at timestamp,
    currency text,
    currency_base_unit integer,
    currency_symbol text,
    draft boolean,
    due_date text,
    invoice_date text,
    message text,
    payment_schedule integer,
    project_code text,
    purchase_order text,
    "status" text,
    tax_rate text,
    title text,
    updated_at timestamp,
    user_invoice_number bigint,
    user_invoice_title text,
    PRIMARY KEY (id),
    FOREIGN KEY (recipient_id) REFERENCES "user"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE rate_card_history (
    id bigint,
    updated_at timestamp,
    rate_card_set_id bigint,
    created_at timestamp,
    currency text,
    uses integer,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (rate_card_set_id) REFERENCES rate_card_set_history(id)
);

CREATE TABLE status_reports (
    id bigint,
    creator_id bigint,
    updater_id bigint,
    workspace_id bigint,
    color text,
    created_at timestamp,
    description text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (updater_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE post (
    id bigint,
    story_id bigint,
    subject_id bigint,
    user_id bigint,
    workspace_id bigint,
    created_at timestamp,
    formatted_message text,
    has_attachment boolean,
    has_attachments boolean,
    message text,
    newest_reply_at timestamp,
    private boolean,
    reply boolean,
    reply_count bigint,
    subject_title text,
    subject_type text,
    updated_at timestamp,
    workspace_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (subject_id) REFERENCES post(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workweek_membership (
    id bigint,
    user_id bigint,
    workweek_id bigint,
    created_at timestamp,
    end_date text,
    start_date text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (workweek_id) REFERENCES workweek(id)
);

CREATE TABLE account_invitation (
    id bigint,
    default_role_id bigint,
    invitee_id bigint,
    inviter_id bigint,
    bill_rate_in_cents bigint,
    cost_rate_in_cents bigint,
    created_at timestamp,
    email_address text,
    full_name text,
    pending boolean,
    permission text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_role_id) REFERENCES "role"(id),
    FOREIGN KEY (invitee_id) REFERENCES "user"(id),
    FOREIGN KEY (inviter_id) REFERENCES "user"(id)
);

CREATE TABLE checklist (
    id bigint,
    story_id bigint,
    completed_by_id bigint,
    completed boolean,
    completed_at timestamp,
    created_at timestamp,
    "name" text,
    "position" integer,
    updated_at timestamp,
    PRIMARY KEY (id, story_id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (completed_by_id) REFERENCES "user"(id)
);

CREATE TABLE expense_category (
    id bigint,
    deleted_at timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE holiday_calendar_association (
    holiday_calendar_id bigint,
    holiday_id bigint,
    PRIMARY KEY (holiday_calendar_id, holiday_id),
    FOREIGN KEY (holiday_calendar_id) REFERENCES holiday_calendar(id),
    FOREIGN KEY (holiday_id) REFERENCES holiday(id)
);

CREATE TABLE workspace_allocation (
    id bigint,
    workspace_resource_id bigint,
    created_at timestamp,
    end_date text,
    hard boolean,
    minutes integer,
    notes text,
    percentage text,
    start_date text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_resource_id) REFERENCES workspace_resource(id)
);

CREATE TABLE workspace_group (
    id bigint,
    address text,
    company boolean,
    contact_name text,
    created_at timestamp,
    email text,
    "name" text,
    notes text,
    phone_number text,
    updated_at timestamp,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE skill_category (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);
