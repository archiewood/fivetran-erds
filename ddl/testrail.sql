CREATE TABLE group_user (
    "index" text,
    group_id text,
    user_id text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE dataset_variable (
    id text,
    dataset_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, dataset_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

CREATE TABLE dataset (
    id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE case_field_config_project (
    "index" text,
    case_field_config_id text,
    case_field_id text,
    project_id text,
    PRIMARY KEY ("index", case_field_config_id, case_field_id),
    FOREIGN KEY (case_field_config_id) REFERENCES case_field_config(id),
    FOREIGN KEY (case_field_id) REFERENCES case_field_config(case_field_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE case_field_config (
    id text,
    case_field_id text,
    context_is_global text,
    options_default_value text,
    options_format text,
    options_has_additional text,
    options_has_expected text,
    options_has_reference text,
    options_is_required text,
    options_item text,
    options_row text,
    PRIMARY KEY (id, case_field_id),
    FOREIGN KEY (case_field_id) REFERENCES case_field(id)
);

CREATE TABLE case_field_template (
    "index" text,
    case_field_id text,
    template_id text,
    PRIMARY KEY ("index", case_field_id),
    FOREIGN KEY (case_field_id) REFERENCES case_field(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE case_field (
    id text,
    description text,
    display_order text,
    include_all text,
    is_active text,
    label text,
    "name" text,
    system_name text,
    type_id text,
    PRIMARY KEY (id)
);

CREATE TABLE priority (
    id text,
    is_default text,
    "name" text,
    priority text,
    short_name text,
    PRIMARY KEY (id)
);

CREATE TABLE milestone (
    id text,
    parent_id text,
    project_id text,
    completed_on text,
    description text,
    due_on text,
    is_completed text,
    is_started text,
    milestones jsonb,
    "name" text,
    refs text,
    start_on text,
    started_on text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES milestone(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE plan (
    id text,
    milestone_id text,
    project_id text,
    assigned_to_id text,
    blocked_count text,
    completed_on text,
    created_by text,
    created_on text,
    custom_status_1_count text,
    custom_status_2_count text,
    custom_status_3_count text,
    custom_status_4_count text,
    custom_status_5_count text,
    custom_status_6_count text,
    custom_status_7_count text,
    description text,
    failed_count text,
    is_completed text,
    "name" text,
    passed_count text,
    refs text,
    retest_count text,
    untested_count text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "status" (
    id text,
    color_bright text,
    color_dark text,
    color_medium text,
    is_final text,
    is_system text,
    is_untested text,
    label text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE case_status (
    case_status_id text,
    abbreviation text,
    is_approved text,
    is_default text,
    "name" text,
    PRIMARY KEY (case_status_id)
);

CREATE TABLE template (
    id text,
    project_id text,
    is_default text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE shared_custom_step (
    "index" text,
    shared_step_id text,
    additional_info text,
    content text,
    expected text,
    refs text,
    PRIMARY KEY ("index", shared_step_id),
    FOREIGN KEY (shared_step_id) REFERENCES shared_step(id)
);

CREATE TABLE shared_step_case_id (
    "index" text,
    shared_step_id text,
    case_id text,
    PRIMARY KEY ("index", shared_step_id),
    FOREIGN KEY (shared_step_id) REFERENCES shared_step(id),
    FOREIGN KEY (case_id) REFERENCES cases(id)
);

CREATE TABLE shared_step (
    id text,
    project_id text,
    created_by text,
    created_on text,
    title text,
    updated_by text,
    updated_on timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE suite (
    id text,
    project_id text,
    completed_on text,
    description text,
    is_baseline text,
    is_completed text,
    is_master text,
    "name" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    announcement text,
    case_statuses_enabled text,
    completed_on text,
    default_role text,
    default_role_id text,
    groups jsonb,
    is_completed text,
    "name" text,
    show_announcement text,
    suite_mode text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE shared_history_custom_step (
    "index" text,
    shared_step_history_id text,
    additional_info text,
    content text,
    expected text,
    refs text,
    PRIMARY KEY ("index", shared_step_history_id),
    FOREIGN KEY (shared_step_history_id) REFERENCES shared_step_history(id)
);

CREATE TABLE shared_step_history (
    id text,
    shared_step_id text,
    user_id text,
    time_stamp text,
    title text,
    PRIMARY KEY (id, shared_step_id),
    FOREIGN KEY (shared_step_id) REFERENCES shared_step(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE configuration_config (
    id text,
    configuration_id text,
    project_id text,
    group_id text,
    "name" text,
    PRIMARY KEY (id, configuration_id, project_id),
    FOREIGN KEY (configuration_id) REFERENCES configuration(id),
    FOREIGN KEY (project_id) REFERENCES configuration(project_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE configuration (
    id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE result_field_config_project (
    "index" text,
    result_field_config_id text,
    result_field_id text,
    project_id text,
    PRIMARY KEY ("index", result_field_config_id, result_field_id),
    FOREIGN KEY (result_field_config_id) REFERENCES result_field_config(id),
    FOREIGN KEY (result_field_id) REFERENCES result_field_config(result_field_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE result_field_config (
    id text,
    result_field_id text,
    context_is_global text,
    options_format text,
    options_has_actual text,
    options_has_expected text,
    options_is_required text,
    options_row text,
    PRIMARY KEY (id, result_field_id),
    FOREIGN KEY (result_field_id) REFERENCES result_field(id)
);

CREATE TABLE result_field_template (
    "index" text,
    result_field_id text,
    template_id text,
    PRIMARY KEY ("index", result_field_id),
    FOREIGN KEY (result_field_id) REFERENCES result_field(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE result_field (
    id text,
    description text,
    display_order text,
    include_all text,
    is_active text,
    label text,
    "name" text,
    system_name text,
    type_id text,
    PRIMARY KEY (id)
);

CREATE TABLE run_config_id (
    "index" text,
    run_id text,
    config_id text,
    PRIMARY KEY ("index", run_id),
    FOREIGN KEY (run_id) REFERENCES run(id)
);

CREATE TABLE run (
    id text,
    dataset_id text,
    milestone_id text,
    plan_id text,
    project_id text,
    suite_id text,
    assigned_to_id text,
    blocked_count text,
    completed_on text,
    config text,
    config_ids jsonb,
    created_by text,
    created_on text,
    custom_status_1_count text,
    custom_status_2_count text,
    custom_status_3_count text,
    custom_status_4_count text,
    custom_status_5_count text,
    custom_status_6_count text,
    custom_status_7_count text,
    description text,
    failed_count text,
    include_all text,
    is_completed text,
    "name" text,
    passed_count text,
    refs text,
    retest_count text,
    untested_count text,
    updated_on timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (suite_id) REFERENCES suite(id)
);

CREATE TABLE report (
    id text,
    cases_id text,
    project_id text,
    cases_filter text,
    cases_groupby text,
    cases_include_new text,
    cases_include_updated text,
    cases_limit text,
    changes_daterange text,
    changes_daterange_from text,
    changes_daterange_to text,
    content_hide_link text,
    description text,
    "name" text,
    notify_attachment text,
    notify_attachment_html_format text,
    notify_attachment_pdf_format text,
    notify_attachment_recipient text,
    notify_link text,
    notify_link_recipient text,
    notify_user text,
    section_id jsonb,
    sections_include text,
    suite_id jsonb,
    suites_include text,
    PRIMARY KEY (id),
    FOREIGN KEY (cases_id) REFERENCES cases(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE cases_custom_step_separated (
    "index" text,
    cases_id text,
    additional_info text,
    content text,
    expected text,
    refs text,
    PRIMARY KEY ("index", cases_id),
    FOREIGN KEY (cases_id) REFERENCES cases(id)
);

CREATE TABLE cases (
    id text,
    case_assigned_to_id text,
    milestone_id text,
    priority_id text,
    project_id text,
    section_id text,
    suite_id text,
    template_id text,
    type_id text,
    comments jsonb,
    created_by text,
    created_on text,
    custom_automation_type text,
    custom_component text,
    custom_description text,
    custom_expected text,
    custom_goal text,
    custom_mission text,
    custom_precond text,
    custom_result text,
    custom_step text,
    custom_team text,
    custom_testrail_bdd_scenario text,
    display_order text,
    estimate text,
    estimate_forecast text,
    is_deleted text,
    refs text,
    title text,
    updated_by text,
    updated_on timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (case_assigned_to_id) REFERENCES users(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (priority_id) REFERENCES priority(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (section_id) REFERENCES "section"(id),
    FOREIGN KEY (suite_id) REFERENCES suite(id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (type_id) REFERENCES case_type(id)
);

CREATE TABLE case_type (
    id text,
    is_default text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE roles (
    id text,
    is_default text,
    is_project_admin text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE test_custom_step (
    "index" text,
    test_id text,
    additional_info text,
    content text,
    expected text,
    refs text,
    shared_step_id text,
    PRIMARY KEY ("index", test_id),
    FOREIGN KEY (test_id) REFERENCES test(id)
);

CREATE TABLE test (
    id text,
    case_assigned_to_id text,
    case_id text,
    milestone_id text,
    priority_id text,
    run_id text,
    status_id text,
    template_id text,
    type_id text,
    assigned_to_id text,
    case_comments jsonb,
    cases_display_order text,
    custom_automation_type text,
    custom_component text,
    custom_description text,
    custom_expected text,
    custom_goal text,
    custom_mission text,
    custom_precond text,
    custom_result text,
    custom_step text,
    custom_team text,
    custom_testrail_bdd_scenario text,
    estimate text,
    estimate_forecast text,
    refs text,
    sections_display_order text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (case_assigned_to_id) REFERENCES users(id),
    FOREIGN KEY (case_id) REFERENCES cases(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (priority_id) REFERENCES priority(id),
    FOREIGN KEY (run_id) REFERENCES run(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (type_id) REFERENCES case_type(id)
);

CREATE TABLE user_assigned_project (
    "index" text,
    users_id text,
    assigned_project text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (assigned_project) REFERENCES project(id)
);

CREATE TABLE users (
    id text,
    project_id text,
    role_id text,
    email text,
    email_notification text,
    group_ids jsonb,
    is_active text,
    is_admin text,
    mfa_required text,
    "name" text,
    "role" text,
    sso_enabled text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE "result" (
    id text,
    test_id text,
    status_id text,
    assigned_to_id text,
    attachment_ids jsonb,
    "comment" text,
    created_by text,
    created_on text,
    custom_step_results jsonb,
    defect text,
    elapsed text,
    version text,
    PRIMARY KEY (id, test_id),
    FOREIGN KEY (test_id) REFERENCES test(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id)
);

CREATE TABLE "section" (
    id text,
    parent_id text,
    suite_id text,
    depth text,
    description text,
    display_order text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES "section"(id),
    FOREIGN KEY (suite_id) REFERENCES suite(id)
);
