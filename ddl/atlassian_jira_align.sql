CREATE TABLE dependency_link (
    id text,
    dependency_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, dependency_id),
    FOREIGN KEY (dependency_id) REFERENCES dependency(id)
);

CREATE TABLE dependency_story (
    "index" text,
    dependency_id text,
    story_id text,
    PRIMARY KEY ("index", dependency_id),
    FOREIGN KEY (dependency_id) REFERENCES dependency(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE dependency (
    id text,
    depends_on_program_id text,
    depends_on_team_id text,
    epic_id text,
    feature_id text,
    release_id text,
    requesting_program_id text,
    requesting_team_id text,
    blocked text,
    blocked_reason text,
    capability_id text,
    commit_date text,
    committed text,
    committed_by_sprint_id text,
    committed_sync_sprint_id text,
    create_date text,
    created_by text,
    custom_fields text,
    delivered text,
    dependency_type text,
    depends_on_external_id text,
    description text,
    has_no_work text,
    is_blocked text,
    is_committed text,
    is_delivered text,
    is_proposed text,
    is_rejected text,
    is_response_blocked text,
    last_updated_by text,
    last_updated_date timestamp,
    needed_by text,
    needed_by_sprint_id text,
    no_work text,
    no_work_reason text,
    proposed text,
    rejected text,
    related_dependency_id text,
    response_blocked text,
    response_blocked_reason text,
    self text,
    "status" text,
    title text,
    type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (depends_on_program_id) REFERENCES program(id),
    FOREIGN KEY (depends_on_team_id) REFERENCES team(id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (requesting_program_id) REFERENCES program(id),
    FOREIGN KEY (requesting_team_id) REFERENCES team(id)
);

CREATE TABLE customer (
    id text,
    last_updated_date timestamp,
    "name" text,
    self text,
    PRIMARY KEY (id)
);

CREATE TABLE epic_custom_field (
    id text,
    epic_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, epic_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id)
);

CREATE TABLE epic_point (
    "index" text,
    epic_id text,
    release_id text,
    estimation_system text,
    estimation_value text,
    PRIMARY KEY ("index", epic_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE epic_customer (
    customer_id text,
    epic_id text,
    PRIMARY KEY (customer_id, epic_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (epic_id) REFERENCES epic(id)
);

CREATE TABLE epic (
    id text,
    accepted_user_id text,
    created_by text,
    in_progress_by text,
    last_updated_by text,
    not_started_by text,
    owner_id text,
    primary_program_id text,
    theme_id text,
    ability_to_exec text,
    accepted_date text,
    additional_process_step_id jsonb,
    additional_program_id jsonb,
    budget text,
    business_impact text,
    capitalized text,
    connector_id text,
    create_date text,
    description text,
    design_stage text,
    discount_rate text,
    efficiency_dividend text,
    effort_swag text,
    epic_object_id text,
    estimate_at_completion text,
    external_cap_ex text,
    external_id text,
    external_key text,
    external_op_ex text,
    external_project text,
    failure_impact text,
    failure_probability text,
    fcast_share text,
    forecast_years text,
    funding_stage text,
    hypothesis text,
    in_progress_date text,
    in_progress_date_end text,
    initial_investment text,
    investment_type text,
    is_canceled text,
    is_recycled text,
    is_split text,
    it_risk text,
    last_updated_date timestamp,
    lean_ux_canvas text,
    links jsonb,
    mvp text,
    not_started_date text,
    not_started_date_end text,
    parent_split_id text,
    planning_mode text,
    portfolio_ask_date text,
    process_step_id text,
    proto_type text,
    quadrant text,
    report_color text,
    revenue_assurance text,
    risk_appetite text,
    roi text,
    self text,
    spend_to_date text,
    start_initiation_date text,
    "state" text,
    strategic_driver text,
    strategic_horizon text,
    strategic_value_score text,
    tags text,
    target_completion_date text,
    title text,
    total_cap_ex text,
    total_op_ex text,
    "type" text,
    work_code_created_date text,
    work_code_deleted_date text,
    work_code_description text,
    work_code_external_id text,
    work_code_id text,
    work_code_is_active text,
    work_code_name text,
    work_code_type_id text,
    yearly_cash_flow text,
    PRIMARY KEY (id),
    FOREIGN KEY (accepted_user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (in_progress_by) REFERENCES users(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (not_started_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (primary_program_id) REFERENCES program(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE release_region (
    region_id text,
    release_id text,
    PRIMARY KEY (region_id, release_id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_product (
    product_id text,
    release_id text,
    PRIMARY KEY (product_id, release_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_program (
    program_id text,
    release_id text,
    PRIMARY KEY (program_id, release_id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_anchor_sprint (
    id text,
    release_id text,
    defect_allocation text,
    end_date text,
    max_allocation text,
    "name" text,
    short text,
    sprint_schedule text,
    start_date text,
    test_suite_iteration text,
    "type" text,
    PRIMARY KEY (id, release_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE "release" (
    id text,
    division_id text,
    last_updated_by text,
    portfolio_id text,
    blended_hourly_rate text,
    budget text,
    create_date text,
    description text,
    end_date text,
    health text,
    last_updated_date timestamp,
    predecessor_id text,
    release_number text,
    roadmap text,
    schedule_type text,
    score_1 text,
    score_2 text,
    score_3 text,
    score_4 text,
    self text,
    short_name text,
    start_date text,
    "status" text,
    test_suite text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id)
);

CREATE TABLE capability_custom_field (
    id text,
    capability_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, capability_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id)
);

CREATE TABLE capability_link (
    id text,
    capability_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, capability_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id)
);

CREATE TABLE capability_point (
    "index" text,
    capability_id text,
    release_id text,
    estimation_system text,
    estimation_value text,
    PRIMARY KEY ("index", capability_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE capability_country (
    country_id text,
    capability_id text,
    PRIMARY KEY (country_id, capability_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id)
);

CREATE TABLE capability_process_step (
    process_step_id text,
    capability_id text,
    PRIMARY KEY (process_step_id, capability_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id)
);

CREATE TABLE capability_program (
    capability_id text,
    program_id text,
    PRIMARY KEY (capability_id, program_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE capability_customer (
    capability_id text,
    customer_id text,
    PRIMARY KEY (capability_id, customer_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE capability_release (
    capability_id text,
    release_id text,
    PRIMARY KEY (capability_id, release_id),
    FOREIGN KEY (capability_id) REFERENCES capability(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE capability (
    id text,
    accepted_user_id text,
    created_by text,
    last_updated_by text,
    owner_id text,
    parent_id text,
    primary_program_id text,
    accepted_date text,
    connector_id text,
    create_date text,
    description text,
    design_stage text,
    effort_swag text,
    external_id text,
    external_key text,
    external_project text,
    hypothesis text,
    is_canceled text,
    is_recycled text,
    is_split text,
    last_updated_date timestamp,
    lean_ux_canvas text,
    mvp text,
    parent_split_id text,
    portfolio_ask_date text,
    process_step_id text,
    proto_type text,
    quadrant text,
    report_color text,
    self text,
    start_initiation_date text,
    "state" text,
    strategic_horizon text,
    strategic_value_score text,
    tags text,
    target_completion_date text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (accepted_user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES capability(id),
    FOREIGN KEY (primary_program_id) REFERENCES program(id)
);

CREATE TABLE region (
    id text,
    last_updated_date timestamp,
    "name" text,
    self text,
    PRIMARY KEY (id)
);

CREATE TABLE goal_link (
    id text,
    goal_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, goal_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE goal_snap_shot (
    goal_id text,
    snapshot_id text,
    PRIMARY KEY (goal_id, snapshot_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (snapshot_id) REFERENCES snap_shot(id)
);

CREATE TABLE goal (
    id text,
    division_id text,
    owner_id text,
    create_date text,
    description text,
    feasibility text,
    importance text,
    last_updated_date timestamp,
    market_assessment text,
    measurement text,
    parent_id text,
    percent_complete text,
    reference text,
    self text,
    target_date text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (owner_id) REFERENCES goal(id)
);

CREATE TABLE users_team (
    team_id text,
    user_id text,
    role_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    user_id text,
    create_date text,
    description text,
    is_system_role text,
    is_time_tracking text,
    "name" text,
    self text,
    "type" text,
    update_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE division (
    id text,
    user_id text,
    category text,
    company_code text,
    "name" text,
    parent_id text,
    product_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_time_track_role (
    time_track_role text,
    user_id text,
    PRIMARY KEY (time_track_role, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    city_id text,
    division_id text,
    holiday_city_id text,
    holiday_region_id text,
    manager_id text,
    region_id text,
    role_id text,
    company text,
    company_id text,
    connector_id text,
    cost_center_description text,
    cost_center_external_key text,
    cost_center_id text,
    cost_center_name text,
    cost_center_owner text,
    cost_center_upload_flag text,
    create_date text,
    email text,
    employee_classification text,
    employee_id text,
    enterprise_hierarchy text,
    external_id text,
    first_name text,
    full_name text,
    holiday_calendar_id text,
    holiday_calendar_last_updated_date text,
    holiday_calendar_name text,
    holiday_calendar_self text,
    include_hours text,
    is_compliance_manager text,
    is_external text,
    is_locked text,
    is_time_tracking text,
    is_user_manager text,
    last_login_date text,
    last_name text,
    last_updated_date timestamp,
    notes text,
    password text,
    self text,
    "status" text,
    time_approver_id text,
    time_tracking_start_date text,
    time_zone text,
    title text,
    uid text,
    user_end_date text,
    user_start_date text,
    user_type text,
    view_public_ers text,
    PRIMARY KEY (id),
    FOREIGN KEY (city_id) REFERENCES city(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (holiday_city_id) REFERENCES city(id),
    FOREIGN KEY (holiday_region_id) REFERENCES region(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE program (
    id text,
    portfolio_id text,
    region_id text,
    team_id text,
    case_development_id text,
    intake_form_id text,
    is_solution text,
    last_updated_date timestamp,
    score_card_id text,
    self text,
    solution_id text,
    team_description text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE theme_group (
    id text,
    last_updated_by text,
    parent_goal_id text,
    active text,
    description text,
    last_updated_date timestamp,
    "name" text,
    non_edit text,
    rank text,
    self text,
    PRIMARY KEY (id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (parent_goal_id) REFERENCES goal(id)
);

CREATE TABLE objective_custom_field (
    id text,
    objective_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, objective_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective_link (
    id text,
    objective_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, objective_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective_team (
    objective_id text,
    team_id text,
    PRIMARY KEY (objective_id, team_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE objective_dependency (
    dependency_id text,
    objective_id text,
    id text,
    PRIMARY KEY (dependency_id, objective_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id),
    FOREIGN KEY (id) REFERENCES dependency(id)
);

CREATE TABLE objective_risk (
    objective_id text,
    risk_id text,
    PRIMARY KEY (objective_id, risk_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id),
    FOREIGN KEY (risk_id) REFERENCES risk(id)
);

CREATE TABLE objective_impediment (
    impediment_id text,
    objective_id text,
    PRIMARY KEY (impediment_id, objective_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective_feature (
    feature_id text,
    objective_id text,
    PRIMARY KEY (feature_id, objective_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective_epic (
    epic_id text,
    objective_id text,
    PRIMARY KEY (epic_id, objective_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective_release (
    objective_id text,
    release_id text,
    PRIMARY KEY (objective_id, release_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE objective_program (
    objective_id text,
    program_id text,
    PRIMARY KEY (objective_id, program_id),
    FOREIGN KEY (objective_id) REFERENCES objective(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE objective (
    id text,
    goal_id text,
    last_updated_by text,
    owner_id text,
    parent_id text,
    portfolio_id text,
    program_id text,
    theme_id text,
    blocked_reason text,
    category text,
    create_date text,
    delivered_value text,
    description text,
    end_date text,
    health text,
    is_blocked text,
    last_updated_date timestamp,
    "name" text,
    note text,
    notification_frequency text,
    notification_start_date text,
    planned_value text,
    portfolio_ask_date text,
    reference text,
    score text,
    self text,
    solution_id text,
    start_initiation_date text,
    "status" text,
    target_completion_date text,
    target_sync_sprint_id text,
    tier text,
    PRIMARY KEY (id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES objective(id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE release_vehicle_feature (
    feature_id text,
    release_vehicle_id text,
    PRIMARY KEY (feature_id, release_vehicle_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id)
);

CREATE TABLE release_vehicle_story (
    release_vehicle_id text,
    story_id text,
    PRIMARY KEY (release_vehicle_id, story_id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE release_vehicle_program (
    program_id text,
    release_vehicle_id text,
    PRIMARY KEY (program_id, release_vehicle_id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id)
);

CREATE TABLE release_vehicle_defect (
    defect_id text,
    release_vehicle_id text,
    PRIMARY KEY (defect_id, release_vehicle_id),
    FOREIGN KEY (defect_id) REFERENCES defect(id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id)
);

CREATE TABLE release_vehicle_team (
    release_vehicle_id text,
    team_id text,
    PRIMARY KEY (release_vehicle_id, team_id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE release_vehicle (
    id text,
    owner_id text,
    release_id text,
    closed_date text,
    connector_id text,
    create_date text,
    external_id text,
    external_project_id text,
    go_live_date text,
    health text,
    is_time_tracking_only text,
    jira_project_key text,
    last_updated_date timestamp,
    "name" text,
    self text,
    ship_date text,
    start_date text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE theme_custom_field (
    id text,
    theme_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, theme_id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE strategy (
    id text,
    strategy_id text,
    division_id text,
    goal_id text,
    theme_id text,
    competitive text,
    description text,
    feasibility text,
    goal_parent text,
    goal_quarter text,
    goal_state text,
    goal_type text,
    goal_year text,
    importance text,
    link text,
    measurement text,
    owner text,
    percent_comp text,
    rank text,
    strategy_date text,
    strategy_type text,
    strategy_value text,
    target_date text,
    PRIMARY KEY (id, strategy_id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE theme_link (
    id text,
    theme_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, theme_id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE theme_release (
    release_id text,
    theme_id text,
    PRIMARY KEY (release_id, theme_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE theme_program (
    program_id text,
    theme_id text,
    PRIMARY KEY (program_id, theme_id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE theme (
    id text,
    created_by text,
    created_by_user_id text,
    external_release_id text,
    goal_id text,
    theme_group_id text,
    connector_id text,
    create_date text,
    description text,
    external_id text,
    external_key text,
    external_project text,
    is_active text,
    is_import text,
    is_major text,
    last_updated_date timestamp,
    owner text,
    planned_budget text,
    portfolio_ask_date text,
    process_step_id text,
    rank text,
    report_color text,
    self text,
    start_initiation_date text,
    "state" text,
    strategic text,
    target_completion_date text,
    theme_story text,
    title text,
    unassigned_theme_bucket text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (external_release_id) REFERENCES "release"(id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (theme_group_id) REFERENCES theme_group(id)
);

CREATE TABLE snap_shot_member (
    snap_shot_id text,
    user_id text,
    PRIMARY KEY (snap_shot_id, user_id),
    FOREIGN KEY (snap_shot_id) REFERENCES snap_shot(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE snap_shot_release (
    release_id text,
    snap_shot_id text,
    PRIMARY KEY (release_id, snap_shot_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (snap_shot_id) REFERENCES snap_shot(id)
);

CREATE TABLE snap_shot_division (
    division_id text,
    snapshot_id text,
    PRIMARY KEY (division_id, snapshot_id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (snapshot_id) REFERENCES snap_shot(id)
);

CREATE TABLE snap_shot_product (
    product_id text,
    snap_shot_id text,
    PRIMARY KEY (product_id, snap_shot_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (snap_shot_id) REFERENCES snap_shot(id)
);

CREATE TABLE snap_shot_funding_level (
    division_id text,
    snapshot_id text,
    fund text,
    PRIMARY KEY (division_id, snapshot_id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (snapshot_id) REFERENCES snap_shot(id)
);

CREATE TABLE snap_shot (
    id text,
    owner_id text,
    budget text,
    description text,
    enable_snapshot_notification text,
    enable_strategy_notification text,
    end_date timestamp,
    horizon_percentage_1 text,
    horizon_percentage_2 text,
    horizon_percentage_3 text,
    self text,
    start_date text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE story_custom_field (
    id text,
    story_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, story_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_release_vehicle (
    release_vehicle_id text,
    story_id text,
    PRIMARY KEY (release_vehicle_id, story_id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_link (
    id text,
    story_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, story_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story (
    id text,
    accepted_by text,
    created_by text,
    feature_id text,
    iteration_id text,
    last_updated_by text,
    owner_id text,
    program_id text,
    release_id text,
    team_id text,
    accepted_date text,
    assumption text,
    automation text,
    connector_id text,
    create_date text,
    description text,
    effort_points text,
    external_id text,
    external_key text,
    external_project text,
    is_accepted text,
    is_canceled text,
    is_parent_split text,
    is_recycled text,
    item_to_sync_date text,
    jira_project_key text,
    last_updated_date timestamp,
    mmf text,
    parent_split_id text,
    persona_id text,
    process_step_id text,
    self text,
    split_reason text,
    split_type text,
    "state" text,
    tags text,
    title text,
    "type" text,
    value_points text,
    PRIMARY KEY (id),
    FOREIGN KEY (accepted_by) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE city (
    id text,
    region_id text,
    apply_time_tracking text,
    last_updated_date timestamp,
    "name" text,
    self text,
    PRIMARY KEY (id),
    FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE team_community (
    id text,
    team_id text,
    posted_by text,
    link text,
    posted text,
    text text,
    title text,
    "type" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (posted_by) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    owner_id text,
    program_id text,
    region_id text,
    track_by text,
    allow_task_deletion text,
    allow_team_to_run_standup text,
    auto_estimate_value text,
    create_date text,
    description text,
    enable_auto_estimate text,
    is_active text,
    is_kanban_team text,
    last_updated_date timestamp,
    max_allocation text,
    "name" text,
    rank text,
    self text,
    short_name text,
    sprint_prefix text,
    through_put text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (track_by) REFERENCES users(id)
);

CREATE TABLE defect_custom_field (
    id text,
    defect_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, defect_id),
    FOREIGN KEY (defect_id) REFERENCES defect(id)
);

CREATE TABLE defect_release_vehicle (
    defect_id text,
    release_vehicle_id text,
    PRIMARY KEY (defect_id, release_vehicle_id),
    FOREIGN KEY (defect_id) REFERENCES defect(id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id)
);

CREATE TABLE defect (
    id text,
    closed_by text,
    created_by text,
    fixed_by text,
    iteration_id text,
    program_id text,
    release_id text,
    story_id text,
    team_id text,
    actual_results text,
    assigned_to text,
    blocked_reason text,
    browser text,
    category text,
    close_date text,
    connector_id text,
    create_date text,
    database text,
    defect_story_id_convert text,
    defect_suite_id text,
    description text,
    duplicate_of text,
    expected_results text,
    external_id text,
    external_key text,
    external_project text,
    fix_results text,
    fixed_build text,
    found_build text,
    frequency text,
    functional_area text,
    hours_estimate text,
    hours_remaining text,
    impact text,
    is_affecting_doc text,
    is_blocked text,
    is_commercialized text,
    is_customer_issue text,
    is_duplicate text,
    is_pm_reviewed text,
    is_recycled text,
    is_status_open text,
    item_to_sync_date text,
    kanban_status text,
    last_updated_date timestamp,
    notify text,
    os_client text,
    os_server text,
    points_estimate text,
    priority text,
    self text,
    severity text,
    "state" text,
    steps_to_reproduce text,
    tags text,
    title text,
    verified_build text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (closed_by) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (fixed_by) REFERENCES users(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE key_result_value_update (
    id text,
    key_result_id text,
    score_by text,
    score_date text,
    score_note text,
    score_value double precision,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (key_result_id) REFERENCES key_result(id),
    FOREIGN KEY (score_by) REFERENCES users(id)
);

CREATE TABLE key_result_score_override (
    id text,
    key_result_id text,
    override_by text,
    override_date text,
    override_note text,
    override_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (key_result_id) REFERENCES key_result(id),
    FOREIGN KEY (override_by) REFERENCES users(id)
);

CREATE TABLE key_result (
    id text,
    owner_id text,
    parent_id text,
    baseline_value text,
    create_date text,
    description text,
    is_score_overidden text,
    last_updated_date timestamp,
    parent_type text,
    score text,
    self text,
    target_date text,
    target_value text,
    "type" text,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES key_result(id)
);

CREATE TABLE product_snap_shot (
    product_id text,
    snapshot_id text,
    PRIMARY KEY (product_id, snapshot_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (snapshot_id) REFERENCES snap_shot(id)
);

CREATE TABLE product_competitor (
    id text,
    product_id text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_personal (
    id text,
    product_id text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    division_id text,
    parent_product_id text,
    is_active text,
    last_updated_date timestamp,
    self text,
    short_name text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (parent_product_id) REFERENCES product(id)
);

CREATE TABLE iteration (
    id text,
    anchor_sprint_id text,
    program_id text,
    region_id text,
    release_id text,
    team_id text,
    actual_end_date text,
    begin_date text,
    color text,
    create_date text,
    defect_allocation text,
    description text,
    end_date text,
    goal text,
    is_locked text,
    last_updated_date timestamp,
    max_allocation text,
    override_velocity text,
    regression_hours text,
    schedule text,
    self text,
    short_name text,
    "state" text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (anchor_sprint_id) REFERENCES release_anchor_sprint(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE task_custom_field (
    id text,
    task_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    created_by text,
    last_updated_by text,
    owner_id text,
    qa_task_id text,
    story_id text,
    completed_date text,
    connector_id text,
    create_date text,
    dependency_id text,
    description text,
    effort_hours text,
    external_id text,
    external_key text,
    external_project text,
    in_progress_date text,
    is_assigned text,
    is_automation_task text,
    is_blocked text,
    is_import text,
    is_recycled text,
    iteration_completed text,
    last_updated_date timestamp,
    not_started_date text,
    notes text,
    post_add text,
    rank text,
    reviewed text,
    self text,
    "sequence" text,
    "state" text,
    test_task_id text,
    tested_date text,
    tester_uid text,
    title text,
    total_hours text,
    "type" text,
    unassigned_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (qa_task_id) REFERENCES task(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE feature_custom_field (
    id text,
    feature_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature_link (
    id text,
    feature_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature_process_step (
    process_step_id text,
    feature_id text,
    PRIMARY KEY (process_step_id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature_test_category (
    test_category_id text,
    feature_id text,
    PRIMARY KEY (test_category_id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature_affected_country (
    country_id text,
    feature_id text,
    PRIMARY KEY (country_id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature_customer (
    customer_id text,
    feature_id text,
    PRIMARY KEY (customer_id, feature_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature_objective (
    feature_id text,
    objective_id text,
    PRIMARY KEY (feature_id, objective_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE feature_additional_program (
    feature_id text,
    program_id text,
    PRIMARY KEY (feature_id, program_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE feature_release_vehicle (
    feature_id text,
    release_vehicle_id text,
    PRIMARY KEY (feature_id, release_vehicle_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (release_vehicle_id) REFERENCES release_vehicle(id)
);

CREATE TABLE feature (
    id text,
    accepted_user_id text,
    created_by text,
    dev_complete_by text,
    in_progress_by text,
    last_updated_by text,
    owner_id text,
    parent_id text,
    pending_approval_by text,
    primary_program_id text,
    product_id text,
    release_id text,
    test_complete_by text,
    theme_id text,
    vehicle_id text,
    work_code_id text,
    accepted_date text,
    associated_ticket text,
    benefits text,
    blocked_reason text,
    budget text,
    business_driver text,
    business_impact text,
    business_value text,
    capitalized text,
    category text,
    complexity text,
    connector_id text,
    create_date text,
    description text,
    description_rich text,
    design_stage text,
    dev_complete_date text,
    discount_rate text,
    end_sprint_id text,
    estimate_at_completion text,
    estimate_tshirt text,
    estimation_effort_percent text,
    expense_savings text,
    external_cap_ex text,
    external_id text,
    external_key text,
    external_op_ex text,
    external_project text,
    external_user text,
    failure_impact text,
    failure_probability text,
    feature_rank text,
    feature_summary text,
    forecast_years text,
    functional_area text,
    hypothesis text,
    in_progress_date text,
    in_scope text,
    initial_investment text,
    is_blocked text,
    is_canceled text,
    is_import text,
    is_multi_program text,
    is_recycled text,
    is_split text,
    it_risk text,
    item_to_sync_date text,
    iteration_sort text,
    jira_project_key text,
    last_updated_date timestamp,
    lean_ux_canvas text,
    man_weeks text,
    mmf text,
    parent_split_id text,
    pending_approval_date text,
    points text,
    portfolio_ask_date text,
    priority text,
    process_step_id text,
    prototype text,
    ready_to_start_by text,
    ready_to_start_date text,
    report_color text,
    requester_id text,
    revenue_growth text,
    risk_appetite text,
    score text,
    self text,
    "source" text,
    spend_to_date text,
    start_initiation_date text,
    start_sprint_id text,
    "state" text,
    tags text,
    target_completion_date text,
    test_complete_date text,
    title text,
    total_cap_ex text,
    total_op_ex text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (accepted_user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (dev_complete_by) REFERENCES users(id),
    FOREIGN KEY (in_progress_by) REFERENCES users(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES epic(id),
    FOREIGN KEY (pending_approval_by) REFERENCES users(id),
    FOREIGN KEY (primary_program_id) REFERENCES program(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (test_complete_by) REFERENCES users(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id),
    FOREIGN KEY (vehicle_id) REFERENCES release_vehicle(id),
    FOREIGN KEY (work_code_id) REFERENCES epic(work_code_id)
);

CREATE TABLE milestone_custom_field (
    id text,
    milestone_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, milestone_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_link (
    id text,
    milestone_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, milestone_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_team (
    milestone_id text,
    team_id text,
    PRIMARY KEY (milestone_id, team_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE milestone_dependency (
    dependency_id text,
    milestone_id text,
    PRIMARY KEY (dependency_id, milestone_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_risk (
    milestone_id text,
    risk_id text,
    PRIMARY KEY (milestone_id, risk_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (risk_id) REFERENCES risk(id)
);

CREATE TABLE milestone_impediment (
    impediment_id text,
    milestone_id text,
    PRIMARY KEY (impediment_id, milestone_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_feature (
    feature_id text,
    milestone_id text,
    PRIMARY KEY (feature_id, milestone_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_epic (
    epic_id text,
    milestone_id text,
    PRIMARY KEY (epic_id, milestone_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE milestone_release (
    milestone_id text,
    release_id text,
    PRIMARY KEY (milestone_id, release_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE milestone_program (
    milestone_id text,
    program_id text,
    PRIMARY KEY (milestone_id, program_id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE milestone (
    id text,
    goal_id text,
    last_updated_by text,
    owner_id text,
    parent_id text,
    portfolio_id text,
    program_id text,
    theme_id text,
    blocked_reason text,
    category text,
    create_date text,
    delivered_value text,
    description text,
    end_date text,
    health text,
    is_blocked text,
    last_updated_date timestamp,
    "name" text,
    note text,
    notification_frequency text,
    notification_start_date text,
    planned_value text,
    portfolio_ask_date text,
    reference text,
    score text,
    self text,
    solution_id text,
    start_initiation_date text,
    "status" text,
    target_completion_date text,
    target_sync_sprint_id text,
    tier text,
    PRIMARY KEY (id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES milestone(id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE idea (
    id text,
    created_by text,
    owner_id text,
    product_id text,
    category_id text,
    company_id text,
    create_date text,
    description text,
    group_id text,
    is_external text,
    is_public text,
    last_updated_date timestamp,
    self text,
    "status" text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE portfolio (
    id text,
    division_id text,
    organization_product_id text,
    region_id text,
    team_id text,
    case_development_id text,
    description text,
    intake_form_id text,
    is_active text,
    is_private text,
    last_updated_date timestamp,
    organization_company_code text,
    organization_cost_center text,
    organization_division_category text,
    organization_id text,
    organization_name text,
    organization_parent_id text,
    score_card_id text,
    self text,
    team_description text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (organization_product_id) REFERENCES product(id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE process_step_wip_limit (
    process_step_id text,
    program_id text,
    program_value_stream_relation_id text,
    wip_limit text,
    PRIMARY KEY (process_step_id, program_id),
    FOREIGN KEY (process_step_id) REFERENCES value_stream_process_step(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE value_stream_process_step (
    id text,
    portfolio_id text,
    value_stream_id text,
    efficiency_hour text,
    function_id text,
    is_active text,
    mapped_state_id text,
    mapped_state_name text,
    "name" text,
    send_email text,
    sort_order text,
    step_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (value_stream_id) REFERENCES value_stream(id)
);

CREATE TABLE value_stream_customer (
    customer_id text,
    value_stream_id text,
    PRIMARY KEY (customer_id, value_stream_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (value_stream_id) REFERENCES value_stream(id)
);

CREATE TABLE value_stream_program (
    program_id text,
    value_stream_id text,
    PRIMARY KEY (program_id, value_stream_id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (value_stream_id) REFERENCES value_stream(id)
);

CREATE TABLE value_stream (
    id text,
    region_id text,
    team_id text,
    is_active text,
    last_updated_date timestamp,
    "level" text,
    map_to_state text,
    "name" text,
    self text,
    team_description text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE risk_custom_field (
    id text,
    risk_id text,
    field_name text,
    "value" text,
    PRIMARY KEY (id, risk_id),
    FOREIGN KEY (risk_id) REFERENCES risk(id)
);

CREATE TABLE risk_notify (
    email text,
    risk_id text,
    PRIMARY KEY (email, risk_id),
    FOREIGN KEY (email) REFERENCES users(email),
    FOREIGN KEY (risk_id) REFERENCES risk(id)
);

CREATE TABLE risk_link (
    id text,
    risk_id text,
    link text,
    "name" text,
    PRIMARY KEY (id, risk_id),
    FOREIGN KEY (risk_id) REFERENCES risk(id)
);

CREATE TABLE risk (
    id text,
    closed_by text,
    created_by text,
    last_updated_by text,
    owner_id text,
    program_id text,
    release_id text,
    close_date text,
    consequence text,
    contingency text,
    create_date text,
    critical_path text,
    description text,
    exposure text,
    external_id text,
    external_key text,
    impact text,
    last_updated_date timestamp,
    mitigation text,
    notify_send_email_date text,
    notify_send_email_update text,
    occurrence text,
    rank text,
    related_item_id text,
    relationship text,
    resolution_method text,
    resolution_status text,
    risk_type text,
    self text,
    "status" text,
    tags text,
    target_resolution_date text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (closed_by) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_updated_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);
