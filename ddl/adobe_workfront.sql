CREATE TABLE timesheet_profile (
    id text,
    group_id text,
    is_overtime_disabled text,
    "name" text,
    obj_code text,
    PRIMARY KEY (id)
);

CREATE TABLE program_metadata_flag (
    _fivetran_id text,
    flag text,
    program_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_operation (
    _fivetran_id text,
    operation text,
    program_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_field_flag (
    _fivetran_id text,
    flag text,
    program_field_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_field_operation (
    _fivetran_id text,
    label text,
    program_field_label text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_field (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    program_label text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_reference (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    program_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_collection (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    program_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_search (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    program_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_custom_category (
    _fivetran_id text,
    id text,
    "name" text,
    obj_code text,
    program_custom_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_custom (
    _fivetran_id text,
    program_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_action_argument (
    _fivetran_id text,
    "name" text,
    program_action_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_action (
    _fivetran_id text,
    flags jsonb,
    label text,
    program_label text,
    result_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_query_argument (
    _fivetran_id text,
    "name" text,
    program_query_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata_query (
    _fivetran_id text,
    label text,
    program_label text,
    result_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE program_metadata (
    _fivetran_id text,
    label text,
    "name" text,
    obj_code text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_custom_value (
    column_name text,
    project_id text,
    "value" text,
    PRIMARY KEY (column_name, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_accessor (
    "index" text,
    project_id text,
    accessor_id text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_pending_update_method (
    "index" text,
    project_id text,
    pending_update_method text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_owner_privilege (
    "index" text,
    project_id text,
    owner_privilege text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_audit_type (
    "index" text,
    project_id text,
    audit_type text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_bc_completion_state (
    "index" text,
    project_id text,
    bc_completion_state text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    converted_op_task_originator_id text,
    entered_by_id text,
    last_updated_by_id text,
    owner_id text,
    portfolio_id text,
    program_id text,
    resource_pool_id text,
    sponsor_id text,
    submitted_by_id text,
    team_id text,
    actual_benefit text,
    actual_completion_date text,
    actual_cost text,
    actual_duration_minute text,
    actual_expense_cost text,
    actual_labor_cost text,
    actual_revenue text,
    actual_risk_cost text,
    actual_start_date text,
    actual_value text,
    actual_work_required text,
    alignment text,
    alignment_score_card_id text,
    approval_completion_date text,
    approval_process_id text,
    approval_start_date text,
    auto_baseline_recur_on text,
    auto_baseline_recurrence_type text,
    bcwp text,
    bcws text,
    billed_revenue text,
    budget text,
    budget_status text,
    budgeted_completion_date text,
    budgeted_cost text,
    budgeted_hour text,
    budgeted_labor_cost text,
    budgeted_start_date text,
    category_id text,
    company_id text,
    completion_type text,
    "condition" text,
    condition_type text,
    converted_op_task_entry_date text,
    converted_op_task_name text,
    cpi text,
    csi text,
    currency text,
    current_approval_step_id text,
    customer_id text,
    deliverable_score_card_id text,
    deliverable_success_score text,
    description text,
    display_order text,
    duration_minute text,
    eac text,
    eac_calculation_method text,
    enable_auto_baseline text,
    entry_date text,
    est_completion_date text,
    est_start_date text,
    ext_ref_id text,
    filter_hour_type text,
    finance_last_update_date text,
    fixed_cost text,
    fixed_end_date text,
    fixed_revenue text,
    fixed_start_date text,
    group_id text,
    has_budget_conflict text,
    has_calc_error text,
    has_document text,
    has_expense text,
    has_message text,
    has_note text,
    has_rate_override text,
    has_resolvable text,
    has_timed_notification text,
    has_timeline_exception text,
    is_original_planned_hours_set text,
    is_status_complete text,
    last_calc_date text,
    last_condition_note_id text,
    last_note_id text,
    last_update_date text,
    leveling_mode text,
    milestone_path_id text,
    "name" text,
    next_auto_baseline_date text,
    number_open_op_tasks text,
    obj_code text,
    optimization_score text,
    original_work_required text,
    pending_calculation text,
    percent_complete text,
    performance_index_method text,
    personal text,
    planned_benefit text,
    planned_completion_date text,
    planned_cost text,
    planned_expense_cost text,
    planned_labor_cost text,
    planned_revenue text,
    planned_risk_cost text,
    planned_start_date text,
    planned_value text,
    pop_account_id text,
    portfolio_priority text,
    previous_status text,
    priority text,
    progress_status text,
    project_roi text,
    projected_completion_date text,
    projected_start_date text,
    queue_def_id text,
    rejection_issue_id text,
    remaining_cost text,
    remaining_revenue text,
    remaining_risk_cost text,
    resource_planner_budgeted_labor_cost text,
    risk text,
    risk_performance_index text,
    schedule_id text,
    schedule_mode text,
    selected_on_portfolio_optimizer text,
    spi text,
    "status" text,
    status_update text,
    summary_completion_type text,
    sync_burndown_date text,
    template_id text,
    total_op_task_count text,
    total_task_count text,
    update_type text,
    url text,
    version text,
    "work" text,
    work_required text,
    work_required_expression text,
    PRIMARY KEY (id),
    FOREIGN KEY (converted_op_task_originator_id) REFERENCES users(id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (resource_pool_id) REFERENCES legacy_resource_pool(id),
    FOREIGN KEY (sponsor_id) REFERENCES users(id),
    FOREIGN KEY (submitted_by_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE program_custom_value (
    column_name text,
    program_id text,
    "value" text,
    PRIMARY KEY (column_name, program_id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE program (
    id text,
    entered_by_id text,
    last_updated_by_id text,
    owner_id text,
    portfolio_id text,
    audit_types jsonb,
    category_id text,
    customer_id text,
    description text,
    entry_date text,
    ext_ref_id text,
    group_id text,
    has_document text,
    has_message text,
    has_note text,
    is_active text,
    last_update_date text,
    "name" text,
    obj_code text,
    security_root_id text,
    security_root_obj_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id)
);

CREATE TABLE reportable_budgeted_hour (
    id text,
    project_id text,
    user_id text,
    allocation_date text,
    budgeted_hour text,
    obj_code text,
    planned_budgeted_hour text,
    role_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE portfolio_custom_value (
    column_name text,
    portfolio_id text,
    "value" text,
    PRIMARY KEY (column_name, portfolio_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id)
);

CREATE TABLE portfolio (
    id text,
    entered_by_id text,
    last_updated_by_id text,
    owner_id text,
    accessor_id text,
    aligned text,
    alignment_score_card_id text,
    audit_types jsonb,
    budget text,
    category_id text,
    currency text,
    customer_id text,
    description text,
    entry_date text,
    ext_ref_id text,
    group_id text,
    has_document text,
    has_message text,
    has_note text,
    is_active text,
    last_update_date text,
    "name" text,
    net_value text,
    obj_code text,
    on_budget text,
    on_time text,
    portfolio_net_value text,
    portfolio_roi text,
    roi text,
    PRIMARY KEY (id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE hour_type (
    id text,
    app_global_id text,
    count_as_revenue text,
    customer_id text,
    description text,
    description_key text,
    ext_ref_id text,
    is_active text,
    "name" text,
    name_key text,
    obj_code text,
    obj_id text,
    obj_obj_code text,
    overhead_type text,
    scope text,
    PRIMARY KEY (id)
);

CREATE TABLE mile (
    id text,
    color text,
    customer_id text,
    description text,
    ext_ref_id text,
    milestone_path_id text,
    "name" text,
    obj_code text,
    "sequence" text,
    PRIMARY KEY (id)
);

CREATE TABLE users_web_dav_profile (
    "index" text,
    user_id text,
    profile_type text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    default_hour_type_id text,
    entered_by_id text,
    last_updated_by_id text,
    manager_id text,
    resource_pool_id text,
    team_id text,
    access_level_id text,
    actual_deactivation_date text,
    address text,
    address_2 text,
    api_key_create_date text,
    avatar_date text,
    avatar_size text,
    avatar_x text,
    avatar_y text,
    billing_per_hour text,
    category_id text,
    city text,
    company_id text,
    cost_per_hour text,
    country text,
    customer_id text,
    default_interface text,
    delegation_to_id text,
    email_addr text,
    entry_date text,
    ext_ref_id text,
    first_name text,
    fte text,
    has_api_access text,
    has_document text,
    has_note text,
    has_proof_license text,
    has_reserved_times text,
    home_group_id text,
    home_team_id text,
    is_active text,
    last_entered_note_id text,
    last_login_date text,
    last_name text,
    last_note_id text,
    last_update_date text,
    latest_update_note_id text,
    layout_template_id text,
    license_type text,
    locale text,
    log_time_in_days text,
    login_count text,
    mobile_phone_number text,
    my_info text,
    "name" text,
    obj_code text,
    password_date text,
    persona text,
    phone_extension text,
    phone_number text,
    portal_profile_id text,
    postal_code text,
    registration_expire_date text,
    reset_password_expire_date text,
    role_id text,
    schedule_id text,
    scheduled_deactivation_date text,
    sso_access_only text,
    sso_username text,
    "state" text,
    status_update text,
    time_zone text,
    timesheet_profile_id text,
    title text,
    ui_template_id text,
    username text,
    work_hours_per_day text,
    work_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_hour_type_id) REFERENCES hour_type(id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (resource_pool_id) REFERENCES legacy_resource_pool(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE task_custom_value (
    column_name text,
    task_id text,
    "value" text,
    PRIMARY KEY (column_name, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    assigned_to_id text,
    converted_op_task_originator_id text,
    entered_by_id text,
    last_updated_by_id text,
    milestone_id text,
    parent_id text,
    project_id text,
    submitted_by_id text,
    team_id text,
    actual_completion_date text,
    actual_cost text,
    actual_duration text,
    actual_duration_minute text,
    actual_expense_cost text,
    actual_labor_cost text,
    actual_revenue text,
    actual_start_date text,
    actual_work text,
    actual_work_required text,
    approval_completion_date text,
    approval_est_start_date text,
    approval_planned_start_date text,
    approval_process_id text,
    approval_projected_start_date text,
    approval_start_date text,
    audit_type jsonb,
    backlog_order text,
    bcwp text,
    bcws text,
    billing_amount text,
    billing_record_id text,
    can_start text,
    category_id text,
    color text,
    commit_date text,
    completion_pending_date text,
    "condition" text,
    constraint_date text,
    converted_op_task_entry_date text,
    converted_op_task_name text,
    cost_amount text,
    cost_type text,
    cpi text,
    csi text,
    current_approval_step_id text,
    customer_id text,
    description text,
    duration text,
    duration_minute text,
    duration_type text,
    duration_unit text,
    eac text,
    entry_date text,
    est_completion_date text,
    est_start_date text,
    ext_ref_id text,
    group_id text,
    handoff_date text,
    has_completion_constraint text,
    has_document text,
    has_expense text,
    has_message text,
    has_note text,
    has_resolvable text,
    has_start_constraint text,
    has_timed_notification text,
    hours_per_point text,
    indent text,
    is_agile text,
    is_critical text,
    is_duration_locked text,
    is_leveling_excluded text,
    is_ready text,
    is_status_complete text,
    is_work_required_locked text,
    iteration_id text,
    kanban_board_id text,
    kanban_flag text,
    last_condition_note_id text,
    last_note_id text,
    last_update_date text,
    leveling_start_delay text,
    leveling_start_delay_minute text,
    "name" text,
    number_of_children text,
    number_open_op_task text,
    obj_code text,
    original_duration text,
    original_work_required text,
    parent_lag text,
    parent_lag_type text,
    pending_calculation text,
    pending_update_method jsonb,
    percent_complete text,
    personal text,
    planned_completion_date text,
    planned_cost text,
    planned_duration text,
    planned_duration_minute text,
    planned_expense_cost text,
    planned_labor_cost text,
    planned_revenue text,
    planned_start_date text,
    previous_status text,
    priority text,
    progress_status text,
    projected_completion_date text,
    projected_duration_minute text,
    projected_start_date text,
    recurrence_number text,
    recurrence_rule_id text,
    reference_number text,
    rejection_issue_id text,
    remaining_duration_minute text,
    resource_scope text,
    revenue_type text,
    role_id text,
    security_root_id text,
    security_root_obj_code text,
    slack_date text,
    spi text,
    "status" text,
    status_update text,
    story_point text,
    task_constraint text,
    task_number text,
    template_task_id text,
    tracking_mode text,
    url text,
    version text,
    wbs text,
    "work" text,
    work_effort text,
    work_required text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to_id) REFERENCES users(id),
    FOREIGN KEY (converted_op_task_originator_id) REFERENCES users(id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (milestone_id) REFERENCES mile(id),
    FOREIGN KEY (parent_id) REFERENCES task(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (submitted_by_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE resource_planner_filter (
    id text,
    "name" text,
    obj_code text,
    PRIMARY KEY (id)
);

CREATE TABLE resource_manager (
    id text,
    project_id text,
    resource_manager_id text,
    customer_id text,
    obj_code text,
    project_priority text,
    template_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (resource_manager_id) REFERENCES users(id)
);

CREATE TABLE project_metadata_flag (
    _fivetran_id text,
    flag text,
    project_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_operation (
    _fivetran_id text,
    operation text,
    project_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_field_flag (
    _fivetran_id text,
    flag text,
    project_field_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_field_operation (
    _fivetran_id text,
    label text,
    project_field_label text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_field (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    project_label text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_reference (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    project_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_collection (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    project_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_search (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    project_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_custom_category (
    _fivetran_id text,
    id text,
    "name" text,
    obj_code text,
    project_custom_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_custom (
    _fivetran_id text,
    project_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_action_argument (
    _fivetran_id text,
    "name" text,
    project_action_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_action (
    _fivetran_id text,
    flags jsonb,
    label text,
    project_label text,
    result_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_query_argument (
    _fivetran_id text,
    "name" text,
    project_query_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata_query (
    _fivetran_id text,
    label text,
    project_label text,
    result_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_metadata (
    _fivetran_id text,
    label text,
    "name" text,
    obj_code text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE resource_pool (
    id text,
    entered_by_id text,
    last_updated_by_id text,
    customer_id text,
    description text,
    entry_date text,
    ext_ref_id text,
    last_update_date text,
    "name" text,
    obj_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id)
);

CREATE TABLE reserved_time (
    id text,
    user_id text,
    customer_id text,
    end_date text,
    ext_ref_id text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE "hour" (
    id text,
    approved_by_id text,
    hour_type_id text,
    last_updated_by_id text,
    owner_id text,
    project_id text,
    project_overhead_id text,
    task_id text,
    timesheet_id text,
    actual_cost text,
    approved_on_date text,
    billing_record_id text,
    customer_id text,
    "day" text,
    description text,
    dup_id text,
    entry_date text,
    ext_ref_id text,
    has_rate_override text,
    "hour" text,
    last_update_date text,
    obj_code text,
    op_task_id text,
    resource_revenue text,
    role_id text,
    security_root_id text,
    security_root_obj_code text,
    "status" text,
    work_hours_per_day text,
    PRIMARY KEY (id),
    FOREIGN KEY (approved_by_id) REFERENCES project(id),
    FOREIGN KEY (hour_type_id) REFERENCES hour_type(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES project(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (project_overhead_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (timesheet_id) REFERENCES timesheet(id)
);

CREATE TABLE rate (
    id text,
    project_id text,
    company_id text,
    customer_id text,
    end_date text,
    ext_ref_id text,
    "name" text,
    obj_code text,
    rate_value text,
    role_id text,
    security_root_id text,
    security_root_obj_code text,
    start_date text,
    template_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE calendar (
    id text,
    entered_by_id text,
    calendar_info_id text,
    customer_id text,
    entry_date text,
    "name" text,
    obj_code text,
    obj_id text,
    obj_obj_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (entered_by_id) REFERENCES users(id)
);

CREATE TABLE team_op_task_bug_report_status (
    "index" text,
    team_id text,
    report_status text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_op_task_change_order_status (
    "index" text,
    team_id text,
    order_status text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_op_task_issue_status (
    "index" text,
    team_id text,
    issue_status text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_op_task_request_status (
    "index" text,
    team_id text,
    request_status text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_task_status (
    "index" text,
    team_id text,
    task_status text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_work_on_it_op_task_bug_report_status (
    "index" text,
    team_id text,
    "status" text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_work_on_it_op_task_change_order_status (
    "index" text,
    team_id text,
    "status" text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_work_on_it_op_task_issue_status (
    "index" text,
    team_id text,
    "status" text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_work_on_it_op_task_request_status (
    "index" text,
    team_id text,
    "status" text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_work_on_it_task_status (
    "index" text,
    team_id text,
    "status" text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    owner_id text,
    agile_estimate_type text,
    agile_methodology text,
    auto_add_next_story text,
    complete_days_on_kanban_board text,
    customer_id text,
    default_interface text,
    description text,
    estimate_by_hours text,
    group_id text,
    hours_per_point text,
    is_active text,
    is_agile text,
    is_standard_issue_list text,
    layout_template_id text,
    "name" text,
    obj_code text,
    schedule_id text,
    team_story_board_issue_statuses text,
    team_story_board_statuses text,
    team_type text,
    ui_template_id text,
    wip_limit text,
    work_on_it_status_change text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE legacy_resource_pool (
    id text,
    customer_id text,
    description text,
    display_order text,
    ext_ref_id text,
    "name" text,
    obj_code text,
    PRIMARY KEY (id)
);

CREATE TABLE timesheet (
    id text,
    approver_id text,
    last_updated_by_id text,
    timesheet_profile_id text,
    user_id text,
    approver_can_edit_hour text,
    customer_id text,
    display_name text,
    end_date text,
    ext_ref_id text,
    has_notes text,
    hours_duration text,
    is_overtime_disabled text,
    last_note_id text,
    last_update_date text,
    obj_code text,
    overtime_hour text,
    regular_hour text,
    start_date text,
    "status" text,
    total_hour text,
    PRIMARY KEY (id),
    FOREIGN KEY (approver_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (timesheet_profile_id) REFERENCES timesheet_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE portfolio_metadata_flag (
    _fivetran_id text,
    flag text,
    portfolio_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_operation (
    _fivetran_id text,
    operation text,
    portfolio_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_field_flag (
    _fivetran_id text,
    flag text,
    portfolio_field_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_field_operation (
    _fivetran_id text,
    label text,
    portfolio_field_label text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_field (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    portfolio_label text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_reference (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    portfolio_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_collection (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    portfolio_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_search (
    _fivetran_id text,
    enum_target_obj_code text,
    enum_type text,
    field_type text,
    label text,
    portfolio_label text,
    target_type_obj_code text,
    type_obj_code text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_custom_category (
    _fivetran_id text,
    id text,
    "name" text,
    obj_code text,
    portfolio_custom_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_custom (
    _fivetran_id text,
    portfolio_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_action_argument (
    _fivetran_id text,
    "name" text,
    portfolio_action_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_action (
    _fivetran_id text,
    flags jsonb,
    label text,
    portfolio_label text,
    result_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_query_argument (
    _fivetran_id text,
    "name" text,
    portfolio_query_label text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata_query (
    _fivetran_id text,
    label text,
    portfolio_label text,
    result_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE portfolio_metadata (
    _fivetran_id text,
    label text,
    "name" text,
    obj_code text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE work_item (
    id text,
    project_id text,
    task_id text,
    user_id text,
    assignment_id text,
    customer_id text,
    done_date text,
    ext_ref_id text,
    is_dead text,
    is_done text,
    last_viewed_date text,
    obj_code text,
    obj_id text,
    obj_obj_code text,
    op_task_id text,
    priority text,
    security_root_id text,
    security_root_obj_code text,
    snooze_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
