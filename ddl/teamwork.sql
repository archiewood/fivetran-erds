CREATE TABLE project_portfolio_card (
    portfolio_card_id text,
    project_id text,
    PRIMARY KEY (portfolio_card_id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_tag (
    tag_id text,
    project_id text,
    PRIMARY KEY (tag_id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_workflow (
    project_id text,
    workflow_id text,
    PRIMARY KEY (project_id, workflow_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE project_user (
    project_id text,
    user_id text,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE project_custom_field_value (
    custom_field_value_id text,
    project_id text,
    PRIMARY KEY (custom_field_value_id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    company_id text,
    created_by text,
    financial_budget_id text,
    time_budget_id text,
    updated_by text,
    active_page_billing text,
    active_page_board text,
    active_page_comments text,
    active_page_files text,
    active_page_finance text,
    active_page_forms text,
    active_page_gantt text,
    active_page_links text,
    active_page_list text,
    active_page_messages text,
    active_page_milestones text,
    active_page_notebooks text,
    active_page_proofs text,
    active_page_risk_register text,
    active_page_table text,
    active_page_tasks text,
    active_page_tickets text,
    active_page_time text,
    allow_notify_anyone text,
    announcement text,
    available_deadlines_found text,
    available_max_end_date text,
    available_min_start_date text,
    available_suggested_end_date text,
    available_suggested_start_date text,
    category_id text,
    completed_at text,
    completed_by text,
    created_at text,
    custom_field_value jsonb,
    default_privacy text,
    description text,
    direct_file_uploads_enabled text,
    end_date text,
    harvest_timers_enabled text,
    is_billable text,
    is_on_boarding_project text,
    is_sample_project text,
    latest_activity jsonb,
    logo text,
    logo_color text,
    logo_icon text,
    "name" text,
    notify_comment_include_creator text,
    notify_everyone text,
    notify_task_assignee text,
    overview_start_page text,
    owner_id text,
    privacy_enabled text,
    reply_by_email_enabled text,
    show_announcement text,
    skip_weekends text,
    start_date text,
    start_page text,
    "status" text,
    sub_status text,
    tag_id text,
    tasks_start_page text,
    "type" text,
    update_id text,
    updated_at text,
    -- custom_integration_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (financial_budget_id) REFERENCES project_budget(id),
    FOREIGN KEY (time_budget_id) REFERENCES project_budget(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE time_tracking_assigned_team (
    assigned_team_id text,
    time_tracking_id text,
    PRIMARY KEY (assigned_team_id, time_tracking_id),
    FOREIGN KEY (assigned_team_id) REFERENCES team(id),
    FOREIGN KEY (time_tracking_id) REFERENCES time_tracking(id)
);

CREATE TABLE time_tracking (
    id text,
    deleted_by_user_id text,
    edited_by_user_id text,
    logged_by_user_id text,
    project_billing_invoice_id text,
    project_id text,
    task_id text,
    user_id text,
    billable text,
    created_at text,
    date_created text,
    date_deleted text,
    date_edited text,
    deleted text,
    deleted_at text,
    description text,
    desk_ticket_id text,
    exchange_rate jsonb,
    has_start_time text,
    is_billable text,
    minutes text,
    rate text,
    task_id_pre_move text,
    time_logged text,
    total text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (deleted_by_user_id) REFERENCES users(id),
    FOREIGN KEY (edited_by_user_id) REFERENCES users(id),
    FOREIGN KEY (logged_by_user_id) REFERENCES users(id),
    FOREIGN KEY (project_billing_invoice_id) REFERENCES invoice(number),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE utilization (
    _fivetran_id text,
    user_id text,
    allocated_minute text,
    available_minute text,
    billable_minutes text,
    end_date text,
    estimated_minute text,
    logged_minute text,
    start_date text,
    unavailable_minute text,
    unbillable_minute text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE notebook (
    id text,
    created_by text,
    project_id text,
    updated_by text,
    category_name text,
    created_date text,
    description text,
    locked text,
    "name" text,
    private text,
    updated_date text,
    user_display_updated_date text,
    user_display_updated_time text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE workflow_project (
    project_id text,
    workflow_id text,
    PRIMARY KEY (project_id, workflow_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_stage (
    stage_id text,
    workflow_id text,
    PRIMARY KEY (stage_id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_company (
    company_id text,
    workflow_id text,
    PRIMARY KEY (company_id, workflow_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    created_by text,
    updated_by text,
    created_at text,
    default_workflow text,
    lockdown jsonb,
    "name" text,
    project_specific text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE expense (
    id text,
    company_id text,
    created_by text,
    invoice_id text,
    project_id text,
    cost text,
    "date" text,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE users_team (
    team_id text,
    users_id text,
    PRIMARY KEY (team_id, users_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    company_id text,
    amount text,
    avatar_url text,
    can_access_portfolio text,
    can_add_projects text,
    can_manage_portfolio text,
    company_role_id text,
    company_type text,
    created_at text,
    created_by_user_id text,
    currency_id text,
    deleted text,
    email text,
    first_name text,
    is_admin text,
    is_client_user text,
    is_placeholder_resource text,
    is_service_account text,
    job_role jsonb,
    last_login text,
    last_name text,
    length_of_day text,
    skill jsonb,
    timezone text,
    title text,
    "type" text,
    updated_at text,
    updated_by_user_id text,
    user_cost text,
    user_rate text,
    working_hours_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE clock_in (
    id text,
    user_id text,
    clock_in_datetime text,
    clock_in_info text,
    clock_in_source text,
    clock_out_datetime text,
    clock_out_info text,
    clock_out_source text,
    "status" text,
    updated_date_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_change_follower (
    change_follower text,
    task_id text,
    PRIMARY KEY (change_follower, task_id),
    FOREIGN KEY (change_follower) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_comment_follower (
    comment_follower text,
    task_id text,
    PRIMARY KEY (comment_follower, task_id),
    FOREIGN KEY (comment_follower) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_complete_follower (
    complete_follower text,
    task_id text,
    PRIMARY KEY (complete_follower, task_id),
    FOREIGN KEY (complete_follower) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE assignee_user_task (
    assignee_user_id text,
    task_id text,
    PRIMARY KEY (assignee_user_id, task_id),
    FOREIGN KEY (assignee_user_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE assignee_team_task (
    assignee_team_id text,
    task_id text,
    PRIMARY KEY (assignee_team_id, task_id),
    FOREIGN KEY (assignee_team_id) REFERENCES team(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_crm_deal (
    crm_deal text,
    task_id text,
    PRIMARY KEY (crm_deal, task_id),
    FOREIGN KEY (crm_deal) REFERENCES company(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_sub_task (
    sub_task_id text,
    task_id text,
    PRIMARY KEY (sub_task_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_tag (
    tag_id text,
    task_id text,
    PRIMARY KEY (tag_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_dependency (
    dependency_id text,
    task_id text,
    PRIMARY KEY (dependency_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE assignee_company_task (
    assignee_company_id text,
    task_id text,
    PRIMARY KEY (assignee_company_id, task_id),
    FOREIGN KEY (assignee_company_id) REFERENCES company(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_predecessor (
    predecessor_id text,
    task_id text,
    PRIMARY KEY (predecessor_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_workflow_stage (
    "index" text,
    task_id text,
    stage_id text,
    workflow_id text,
    stage_task_display_order text,
    PRIMARY KEY ("index", task_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (stage_id) REFERENCES workflow_stage(stage_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE task (
    id text,
    parent_task_id text,
    tasklist_id text,
    updated_by text,
    accumulated_estimated_minute text,
    assignee_ids text,
    attachments jsonb,
    capacity text,
    card text,
    columns jsonb,
    completed_at text,
    completed_by text,
    completed_on text,
    created_at text,
    created_by text,
    date_updated text,
    decimal_display_order text,
    deleted_at text,
    deleted_by text,
    description text,
    description_content_type text,
    display_order text,
    due_date text,
    due_date_offset text,
    estimate_minutes text,
    has_desk_tickets text,
    has_reminder text,
    is_archived text,
    is_blocked text,
    is_private text,
    latest_update jsonb,
    lockdown text,
    "name" text,
    notify text,
    original_due_date text,
    out_of_sequence text,
    priority text,
    progress text,
    proof jsonb,
    sequence_due_date text,
    sequence_id text,
    sequence_root_task text,
    sequence_start_date text,
    start_date text,
    start_date_offset text,
    "status" text,
    template_role_name text,
    timer text,
    updated_at text,
    user_permission_can_add_subtasks text,
    user_permission_can_complete text,
    user_permission_can_edit text,
    user_permission_can_log_time text,
    user_permission_can_view_est_time text,
    workflow_stages text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_task_id) REFERENCES task(id),
    FOREIGN KEY (tasklist_id) REFERENCES task_list(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE activity (
    id text,
    company_id text,
    for_user_id text,
    item_id text,
    project_id text,
    user_id text,
    activity_type text,
    datetime timestamp,
    description text,
    due_date text,
    extra_description text,
    from_username text,
    is_private text,
    latest_activity_type text,
    link text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (for_user_id) REFERENCES users(id),
    FOREIGN KEY (item_id) REFERENCES task_list(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE calendar_event (
    _fivetran_id text,
    added_by text,
    all_day text,
    assigned_to text,
    description text,
    end_date text,
    project text,
    start_date text,
    tags text,
    title text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE link (
    id text,
    created_by text,
    project_id text,
    category_name text,
    code text,
    created_date text,
    description text,
    "name" text,
    open_in_new_window text,
    provider text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE company_tag (
    id text,
    company_id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE company (
    id text,
    accounts text,
    address_one text,
    address_two text,
    can_see_private text,
    cid text,
    city text,
    clients text,
    collaborator text,
    contacts text,
    country text,
    country_code text,
    created_on text,
    email_one text,
    email_three text,
    email_two text,
    fax text,
    industry text,
    industry_id text,
    is_owner text,
    last_changed_on text,
    "name" text,
    phone text,
    "state" text,
    website text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE tasklist_tag (
    id text,
    task_list_id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, task_list_id),
    FOREIGN KEY (task_list_id) REFERENCES task_list(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE task_list (
    id text,
    milestone_id text,
    project_id text,
    complete text,
    created_at text,
    description text,
    is_billable text,
    is_template text,
    last_updated text,
    "name" text,
    notify_task_assignee text,
    pinned text,
    "position" text,
    private text,
    "status" text,
    tasks text,
    PRIMARY KEY (id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE user_status (
    id text,
    user_id text,
    geo_ip_location text,
    is_clocked_in text,
    last_changed_on text,
    posted_on text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_member (
    id text,
    team_id text,
    "name" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    company_id text,
    created_by_user_id text,
    project_id text,
    updated_by_user_id text,
    can_edit text,
    date_created text,
    date_updated text,
    deleted text,
    deleted_date text,
    description text,
    handle text,
    is_private text,
    "name" text,
    num_direct_children text,
    num_subteams text,
    parent_team_handle text,
    parent_team_id text,
    parent_team_name text,
    root_team_handle text,
    root_team_id text,
    root_team_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id)
);

CREATE TABLE message (
    id text,
    author_id text,
    milestone_id text,
    project_id text,
    body text,
    category_name text,
    content_type text,
    is_read text,
    last_changed_on text,
    last_comment_date text,
    posted_on text,
    private text,
    title text,
    user_display_posted_date text,
    user_display_posted_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE milestone_tasklist (
    id text,
    milestone_id text,
    PRIMARY KEY (id, milestone_id),
    FOREIGN KEY (id) REFERENCES task_list(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_change_follower (
    change_follower text,
    milestone_id text,
    PRIMARY KEY (change_follower, milestone_id),
    FOREIGN KEY (change_follower) REFERENCES users(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_comment_follower (
    comment_follower text,
    milestone_id text,
    PRIMARY KEY (comment_follower, milestone_id),
    FOREIGN KEY (comment_follower) REFERENCES users(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_responsible_party (
    milestone_id text,
    responsible_people text,
    PRIMARY KEY (milestone_id, responsible_people),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (responsible_people) REFERENCES users(id)
);

CREATE TABLE milestone_tag (
    id text,
    milestone_id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, milestone_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE milestone (
    id text,
    company_id text,
    completer_id text,
    creator_id text,
    project_id text,
    can_complete text,
    can_edit text,
    completed text,
    completed_on text,
    created_on text,
    deadline text,
    description text,
    due_date_offset text,
    is_private text,
    last_changed_on text,
    percentage_complete text,
    private text,
    reminder text,
    responsible_party_type text,
    "status" text,
    title text,
    user_following_changes text,
    user_following_comments text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (completer_id) REFERENCES users(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_budget_notification (
    id text,
    project_budget_id text,
    "type" text,
    PRIMARY KEY (id, project_budget_id),
    FOREIGN KEY (project_budget_id) REFERENCES project_budget(id)
);

CREATE TABLE project_budget (
    id text,
    created_by_user_id text,
    project_id text,
    updated_by_user_id text,
    announcement text,
    base_line_capacity text,
    capacity text,
    capacity_used text,
    carry_capacity text,
    carry_overspend text,
    carry_underspend text,
    completed_at text,
    created_at text,
    currency_code text,
    date_created text,
    date_updated text,
    default_rate text,
    end_date_time text,
    expense_type text,
    is_repeating text,
    is_retainer text,
    notification text,
    notification_type text,
    originator_budget_id text,
    originator_budget_type text,
    originator_start_date_time text,
    repeat_period text,
    repeat_unit text,
    sequence_number text,
    start_date_time text,
    "status" text,
    timelog_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(id)
);

CREATE TABLE "comment" (
    id text,
    author_id text,
    company_id text,
    project_id text,
    author_id_deprecated text,
    body text,
    commentable_id text,
    commentable_type text,
    content_type text,
    datetime text,
    emailed_from text,
    is_read text,
    item_name text,
    last_changed_on text,
    link text,
    nr_notified_people text,
    number text,
    private text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE risk (
    id text,
    company_id text,
    created_by text,
    last_changed_by text,
    project_id text,
    created_on text,
    impact text,
    impact_cost text,
    impact_performance text,
    impact_schedule text,
    impact_value text,
    last_changed_on text,
    mitigation_plan text,
    probability text,
    probability_value text,
    project_is_active text,
    "result" text,
    "source" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_changed_by) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE invoice (
    id text,
    company_id text,
    created_by text,
    exported_by text,
    project_id text,
    update_by text,
    currency_code text,
    date_created text,
    date_updated text,
    description text,
    display_date text,
    exported_date text,
    fixed_cost text,
    number text,
    po_number text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (exported_by) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (update_by) REFERENCES users(id)
);
