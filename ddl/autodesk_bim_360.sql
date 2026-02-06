CREATE TABLE iq_issues_quality_risk (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    predicted_at text,
    risk text,
    updated_at text,
    user_risk text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE markup_layer (
    uid text,
    bim_360_account_id text,
    bim_360_project_id text,
    base_entity_uid text,
    base_entity_urn text,
    "name" text,
    promotable text,
    surface_type text,
    surface_uid text,
    PRIMARY KEY (uid),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE status_step_value (
    id text,
    project_id text,
    status_step_set_id text,
    bucket text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    description text,
    is_active text,
    label text,
    sort_order text,
    updated_at text,
    updated_by text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (status_step_set_id) REFERENCES status_step(id)
);

CREATE TABLE status_step (
    id text,
    project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    description text,
    is_active text,
    is_default text,
    "name" text,
    updated_at timestamp,
    updated_by text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE transmittal_recipient (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    user_id text,
    company_name text,
    created_at text,
    downloaded_at text,
    updated_at text,
    viewed_at text,
    workflow_transmittal_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES admin_user(id)
);

CREATE TABLE schedule_activity_code (
    id text,
    activity_unique_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    schedule_id text,
    created_at text,
    "name" text,
    updated_at text,
    "value" text,
    value_description text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_unique_id) REFERENCES schedule_activity(unique_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE issue_permitted_action (
    permitted_action text,
    issue_id text,
    PRIMARY KEY (permitted_action, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_permitted_attribute (
    permitted_attribute text,
    issue_id text,
    PRIMARY KEY (permitted_attribute, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_permitted_status (
    permitted_status text,
    issue_id text,
    PRIMARY KEY (permitted_status, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_watcher (
    watcher text,
    issue_id text,
    PRIMARY KEY (watcher, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_gps_coordinate (
    _fivetran_id text,
    issue_id text,
    latitude text,
    longitude text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_custom_attribute (
    _fivetran_id text,
    attribute_definition_id text,
    issue_id text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (attribute_definition_id) REFERENCES issue_attribute(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_linked_document (
    _fivetran_id text,
    issue_id text,
    closed_at text,
    closed_at_version text,
    closed_by text,
    created_at text,
    created_at_version text,
    created_by text,
    details_external_id text,
    details_is_3_d text,
    details_name text,
    details_object_id text,
    details_position_x text,
    details_position_y text,
    details_position_z text,
    details_viewable_guid text,
    details_viewable_id text,
    details_viewer_state text,
    "type" text,
    urn text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue (
    id text,
    container_id text,
    issue_subtype_id text,
    issue_type_id text,
    project_id text,
    root_cause_id text,
    assigned_to text,
    assigned_to_type text,
    attachment_count text,
    closed_at text,
    closed_by text,
    comment_count text,
    created_at text,
    created_by text,
    deleted text,
    description text,
    display_id text,
    due_date text,
    issue_template_id text,
    linked_documents jsonb,
    links jsonb,
    location_details text,
    location_id text,
    official_response jsonb,
    opened_at text,
    opened_by text,
    owner_id text,
    published text,
    snapshot_urn text,
    start_date text,
    "status" text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (container_id) REFERENCES project(issue_container_id),
    FOREIGN KEY (issue_subtype_id) REFERENCES issue_sub_type(id),
    FOREIGN KEY (issue_type_id) REFERENCES issue_type(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (root_cause_id) REFERENCES issue_root_cause(id)
);

CREATE TABLE meeting_minute_non_member_participant (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    meeting_id text,
    company text,
    created_at text,
    created_by text,
    deleted_at text,
    email text,
    first_name text,
    last_name text,
    "status" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (meeting_id) REFERENCES meeting_minute(id)
);

CREATE TABLE iq_rfis_discipline (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    discipline text,
    predicted_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE submittal_acc_task (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    step_id text,
    assigned_to text,
    assigned_to_type text,
    completed_at text,
    completed_by text,
    created_at text,
    created_by text,
    is_required text,
    responded_at text,
    responded_by text,
    response_comment text,
    response_id text,
    response_value text,
    started_at text,
    "status" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (step_id) REFERENCES submittal_acc_step(id)
);

CREATE TABLE sheet_tag (
    "value" text,
    sheet_id text,
    PRIMARY KEY ("value", sheet_id),
    FOREIGN KEY (sheet_id) REFERENCES sheet(id)
);

CREATE TABLE meeting_minute_item (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    topic_id text,
    created_at text,
    created_by text,
    cross_series_id text,
    deleted_at text,
    description text,
    due_date text,
    order_index text,
    "status" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (topic_id) REFERENCES meeting_minute_topic(id)
);

CREATE TABLE schedule_activity (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    schedule_id text,
    actual_duration text,
    actual_finish text,
    actual_start text,
    completion_percentage text,
    created_at text,
    duration text,
    file_activity_id text,
    finish text,
    free_slack_duration text,
    free_slack_unit text,
    is_critical_path text,
    is_wbs text,
    "name" text,
    parent_unique_id text,
    planned_finish text,
    planned_start text,
    remaining_duration text,
    sequential_id text,
    "start" text,
    total_slack_duration text,
    total_slack_unit text,
    "type" text,
    unique_id text,
    updated_at text,
    wbs_code text,
    wbs_path text,
    wbs_path_text text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE issue_attribute_permitted_action (
    permitted_action text,
    issue_attribute_id text,
    PRIMARY KEY (permitted_action, issue_attribute_id),
    FOREIGN KEY (issue_attribute_id) REFERENCES issue_attribute(id)
);

CREATE TABLE issue_attribute_permitted_attribute (
    permitted_attribute text,
    issue_attribute_id text,
    PRIMARY KEY (permitted_attribute, issue_attribute_id),
    FOREIGN KEY (issue_attribute_id) REFERENCES issue_attribute(id)
);

CREATE TABLE issue_attribute_option (
    id text,
    issue_attribute_id text,
    "value" text,
    PRIMARY KEY (id, issue_attribute_id),
    FOREIGN KEY (issue_attribute_id) REFERENCES issue_attribute(id)
);

CREATE TABLE issue_attribute (
    id text,
    project_id text,
    container_id text,
    created_at text,
    created_by text,
    data_type text,
    deleted_at text,
    deleted_by text,
    description text,
    is_required_default text,
    title text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE closed_clash_group (
    clash_group_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    clash_test_id text,
    issue_id text,
    created_at text,
    created_at_model_set_version text,
    created_by text,
    description text,
    model_set_id text,
    reason text,
    title text,
    PRIMARY KEY (clash_group_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (clash_test_id) REFERENCES clash_test(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE iq_cost_impact_issue (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    cost_impact text,
    predicted_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE iq_company_daily_quality_risk_change (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    company_id text,
    created_at text,
    daily_risk text,
    daily_risk_indicator text,
    start_time text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id)
);

CREATE TABLE issue_attribute_mapping (
    id text,
    attribute_definition_id text,
    project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    is_required text,
    mapped_item_id text,
    mapped_item_type text,
    orders text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_definition_id) REFERENCES issue_attribute(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE admin_project_user_product (
    product_key text,
    bim_360_account_id text,
    bim_360_project_id text,
    user_id text,
    created_at text,
    PRIMARY KEY (product_key, bim_360_account_id, bim_360_project_id, user_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES admin_user(id)
);

CREATE TABLE admin_project_role (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE group_permission (
    permission text,
    form_template_id text,
    template_group_permission_index text,
    PRIMARY KEY (permission, form_template_id, template_group_permission_index),
    FOREIGN KEY (form_template_id) REFERENCES template_group_permission(form_template_id),
    FOREIGN KEY (template_group_permission_index) REFERENCES template_group_permission("index")
);

CREATE TABLE template_group_permission (
    "index" text,
    form_template_id text,
    role_key text,
    role_name text,
    PRIMARY KEY ("index", form_template_id),
    FOREIGN KEY (form_template_id) REFERENCES form_template(id)
);

CREATE TABLE user_permission (
    permission text,
    form_template_id text,
    template_user_permission_user_id text,
    PRIMARY KEY (permission, form_template_id, template_user_permission_user_id),
    FOREIGN KEY (form_template_id) REFERENCES template_user_permission(form_template_id),
    FOREIGN KEY (template_user_permission_user_id) REFERENCES template_user_permission(user_id)
);

CREATE TABLE template_user_permission (
    user_id text,
    form_template_id text,
    PRIMARY KEY (user_id, form_template_id),
    FOREIGN KEY (form_template_id) REFERENCES form_template(id)
);

CREATE TABLE form_template (
    id text,
    project_id text,
    created_at text,
    is_pdf text,
    "name" text,
    pdf_url text,
    "status" text,
    template_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE custom_attribute_enum_value (
    enum_value text,
    custom_attribute_id text,
    PRIMARY KEY (enum_value, custom_attribute_id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id)
);

CREATE TABLE custom_attribute_value (
    id text,
    custom_attribute_id text,
    project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    display_name text,
    is_active text,
    updated_at text,
    updated_by text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE custom_attribute (
    id text,
    project_id text,
    created_at text,
    created_by text,
    data_type text,
    default_value text,
    deleted_at text,
    deleted_by text,
    description text,
    display_name text,
    is_active text,
    max_length_on_ingress text,
    "name" text,
    required_on_ingress text,
    updated_at timestamp,
    updated_by text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE asset_status (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    description text,
    label text,
    sort_order text,
    status_set_id text,
    updated_at text,
    updated_by text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE submittal_acc_item_revision (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    item_id text,
    created_at text,
    manager text,
    manager_due_date text,
    manager_type text,
    published_by text,
    published_date text,
    received_from_review text,
    received_from_submitter text,
    responded_at text,
    responded_by text,
    response_comment text,
    response_id text,
    revision text,
    sent_to_review text,
    sent_to_review_by text,
    sent_to_submitter text,
    subcontractor text,
    subcontractor_type text,
    submitted_by text,
    submitter_due_date text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (item_id) REFERENCES submittal_acc_item(id)
);

CREATE TABLE sheet_set (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    created_by_name text,
    issuance_date text,
    "name" text,
    updated_at text,
    updated_by text,
    updated_by_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES sheet(version_set_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE submittal_acc_spec (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    identifier text,
    title text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE admin_project_user_role (
    id text,
    bim_360_account_id text,
    project_id text,
    user_id text,
    created_at text,
    PRIMARY KEY (id, bim_360_account_id, project_id, user_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES admin_user(id)
);

CREATE TABLE asset (
    id text,
    category_id text,
    project_id text,
    status_id text,
    barcode text,
    client_asset_id text,
    company_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    description text,
    is_active text,
    location_id text,
    updated_at text,
    updated_by text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (status_id) REFERENCES asset_status(id)
);

CREATE TABLE form_layout_table_column (
    uid text,
    layout_uid text,
    column_key text,
    column_type text,
    expression text,
    label text,
    presets text,
    section_item_uid text,
    sort_index text,
    value_name text,
    values_provider text,
    PRIMARY KEY (uid),
    FOREIGN KEY (layout_uid) REFERENCES form_layout(uid)
);

CREATE TABLE submittal_acc_step (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    item_id text,
    completed_at text,
    created_at text,
    created_by text,
    days_to_respond text,
    due_date text,
    started_at text,
    "status" text,
    step_number text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (item_id) REFERENCES submittal_acc_item(id)
);

CREATE TABLE project_scope (
    scope text,
    project_id text,
    PRIMARY KEY (scope, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    hub_id text,
    attributes_name text,
    attributes_project_type text,
    attributes_region text,
    attributes_type text,
    attributes_version text,
    checklist_id text,
    checklist_type text,
    cost_id text,
    cost_type text,
    issue_container_id text,
    issue_type text,
    location_id text,
    location_type text,
    markup_id text,
    markup_type text,
    rfi_container_id text,
    rfi_type text,
    root_folder_id text,
    root_folder_type text,
    submittals_id text,
    submittals_type text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (hub_id) REFERENCES hub(id)
);

CREATE TABLE admin_project_user (
    bim_360_account_id text,
    bim_360_project_id text,
    user_id text,
    created_at text,
    updated_at text,
    PRIMARY KEY (bim_360_account_id, bim_360_project_id, user_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES admin_user(id)
);

CREATE TABLE admin_project_user_company (
    id text,
    project_id text,
    user_id text,
    bim_360_account_id text,
    PRIMARY KEY (id, project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES admin_user(id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id)
);

CREATE TABLE submittal_acc_item_watcher (
    user_id text,
    item_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    user_type_id text,
    user_type_value text,
    PRIMARY KEY (user_id, item_id),
    FOREIGN KEY (item_id) REFERENCES submittal_acc_item(id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE submittal_acc_item_type (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    is_active text,
    platform_id text,
    updated_at text,
    updated_by text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE form_layout_section (
    uid text,
    assignee_id text,
    layout_uid text,
    assignee_type text,
    description text,
    display_index text,
    form_section_id text,
    label text,
    sort_index text,
    PRIMARY KEY (uid),
    FOREIGN KEY (assignee_id) REFERENCES admin_user(id),
    FOREIGN KEY (layout_uid) REFERENCES form_layout(uid)
);

CREATE TABLE assigned_clash_group (
    clash_group_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    issue_id text,
    clash_test_id text,
    created_at text,
    created_at_model_set_version text,
    created_by text,
    description text,
    model_set_id text,
    "status" text,
    title text,
    PRIMARY KEY (clash_group_id, bim_360_account_id, bim_360_project_id, issue_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (clash_test_id) REFERENCES clash_test(id)
);

CREATE TABLE clash_group_to_clash_id (
    clash_group_id text,
    clash_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    clash_test_id text,
    issue_id text,
    PRIMARY KEY (clash_group_id, clash_id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (clash_test_id) REFERENCES clash_test(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE form_layout (
    uid text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    description text,
    has_section_assignee text,
    updated_at text,
    updated_by text,
    user_created_at text,
    PRIMARY KEY (uid),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE iq_rfis_high_risk (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    predicted_at text,
    risk text,
    score text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE project_acc_product (
    "key" text,
    project_id text,
    icon text,
    languages text,
    "name" text,
    "status" text,
    PRIMARY KEY ("key", project_id),
    FOREIGN KEY (project_id) REFERENCES project_acc(id)
);

CREATE TABLE project_acc (
    id text,
    hub_id text,
    account_id text,
    address_line_1 text,
    address_line_2 text,
    admin_group_id text,
    business_unit_id text,
    city text,
    classification text,
    company_count text,
    construction_type text,
    contract_type text,
    country text,
    created_at text,
    current_phase text,
    delivery_method text,
    end_date text,
    image_url text,
    job_number text,
    last_sign_in text,
    latitude text,
    longitude text,
    member_count text,
    member_group_id text,
    "name" text,
    platform text,
    postal_code text,
    project_currency text,
    project_value text,
    sheet_count text,
    start_date text,
    state_or_province text,
    "status" text,
    template_id text,
    thumbnail_image_url text,
    timezone text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id, hub_id),
    FOREIGN KEY (hub_id) REFERENCES hub(id)
);

CREATE TABLE submittal_acc_attachment (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    item_id text,
    task_id text,
    category_id text,
    category_value text,
    created_at text,
    created_by text,
    is_file_uploaded text,
    "name" text,
    revision text,
    updated_at text,
    updated_by text,
    upload_urn text,
    urn text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (item_id) REFERENCES submittal_acc_item(id),
    FOREIGN KEY (task_id) REFERENCES submittal_acc_task(id)
);

CREATE TABLE location_node (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    parent_id text,
    created_at text,
    "name" text,
    orders text,
    tree_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (parent_id) REFERENCES location_node(id)
);

CREATE TABLE rfi_co_reviewer (
    reviewer text,
    rfi_id text,
    PRIMARY KEY (reviewer, rfi_id),
    FOREIGN KEY (rfi_id) REFERENCES rfi(id)
);

CREATE TABLE rfi_distribution_list (
    distribution text,
    rfi_id text,
    PRIMARY KEY (distribution, rfi_id),
    FOREIGN KEY (rfi_id) REFERENCES rfi(id)
);

CREATE TABLE rfi_discipline (
    discipline text,
    rfi_id text,
    PRIMARY KEY (discipline, rfi_id),
    FOREIGN KEY (rfi_id) REFERENCES rfi(id)
);

CREATE TABLE rfi_category (
    category text,
    rfi_id text,
    PRIMARY KEY (category, rfi_id),
    FOREIGN KEY (rfi_id) REFERENCES rfi(id)
);

CREATE TABLE rfi (
    id text,
    container_id text,
    project_id text,
    answered_at text,
    answered_by text,
    architect_id text,
    assigned_to text,
    assigned_to_type text,
    attachments_count text,
    closed_at text,
    closed_by text,
    comments_count text,
    construction_manager_id text,
    cost_impact text,
    created_at text,
    created_by text,
    custom_identifier text,
    due_date text,
    linked_document text,
    linked_document_close_version text,
    linked_document_version text,
    location_description text,
    manager_id text,
    official_response text,
    priority text,
    pushpin_attributes text,
    question text,
    reference text,
    responded_at text,
    responded_by text,
    reviewer_id text,
    schedule_impact text,
    sheet_metadata text,
    "status" text,
    suggested_answer text,
    title text,
    updated_at timestamp,
    updated_by text,
    virtual_folder_urn text,
    PRIMARY KEY (id),
    FOREIGN KEY (container_id) REFERENCES project(rfi_container_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE rfi_comment (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    rfi_id text,
    body text,
    created_at text,
    created_by text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (rfi_id) REFERENCES rfi(id)
);

CREATE TABLE iq_rfis_root_cause (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    predicted_at text,
    root_cause text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE issue_profile_permission (
    permission text,
    issue_profile_id text,
    PRIMARY KEY (permission, issue_profile_id),
    FOREIGN KEY (issue_profile_id) REFERENCES issue_profile(id)
);

CREATE TABLE issue_profile_permitted_action (
    permitted_action text,
    issue_profile_id text,
    PRIMARY KEY (permitted_action, issue_profile_id),
    FOREIGN KEY (issue_profile_id) REFERENCES issue_profile(id)
);

CREATE TABLE issue_profile_permitted_status (
    permitted_status text,
    issue_profile_id text,
    PRIMARY KEY (permitted_status, issue_profile_id),
    FOREIGN KEY (issue_profile_id) REFERENCES issue_profile(id)
);

CREATE TABLE issue_profile_permitted_attribute (
    permitted_attribute text,
    issue_profile_id text,
    PRIMARY KEY (permitted_attribute, issue_profile_id),
    FOREIGN KEY (issue_profile_id) REFERENCES issue_profile(id)
);

CREATE TABLE issue_profile (
    id text,
    project_id text,
    can_manage_templates text,
    is_project_admin text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE error_code_data_key (
    data_key text,
    error_code_name text,
    PRIMARY KEY (data_key, error_code_name),
    FOREIGN KEY (error_code_name) REFERENCES error_code("name")
);

CREATE TABLE error_code (
    "name" text,
    description text,
    http_status_code text,
    PRIMARY KEY ("name")
);

CREATE TABLE meeting_minute_topic (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    meeting_id text,
    created_at text,
    created_by text,
    deleted_at text,
    "name" text,
    order_index text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (meeting_id) REFERENCES meeting_minute(id)
);

CREATE TABLE admin_user (
    id text,
    bim_360_account_id text,
    default_company_id text,
    access_level_account_admin text,
    access_level_executive text,
    access_level_project_admin text,
    access_level_project_member text,
    address_line_1 text,
    address_line_2 text,
    autodesk_id text,
    city text,
    country text,
    created_at text,
    default_role_id text,
    email text,
    first_name text,
    job_title text,
    last_name text,
    last_sign_in text,
    "name" text,
    phone text,
    postal_code text,
    state_or_province text,
    "status" text,
    status_reason text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (default_company_id) REFERENCES admin_project_user_company(id)
);

CREATE TABLE submittal_acc_comment (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    item_id text,
    body text,
    created_at text,
    created_by text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (item_id) REFERENCES submittal_acc_item(id)
);

CREATE TABLE clash_test (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    backend_type text,
    completed_at text,
    model_set_id text,
    model_set_version text,
    root_folder_urn text,
    started_at text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE submittal_acc_item (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    spec_section_id text,
    type_id text,
    ball_in_court text,
    ball_in_court_company text,
    ball_in_court_role text,
    ball_in_court_user text,
    created_at text,
    created_by text,
    custom_identifier text,
    custom_identifier_human_readable text,
    custom_identifier_sort text,
    description text,
    due_date text,
    identifier text,
    lead_time text,
    manager text,
    manager_due_date text,
    manager_type text,
    package text,
    package_identifier text,
    package_title text,
    priority_id text,
    priority_value text,
    published_by text,
    published_date text,
    received_from_review text,
    received_from_submitter text,
    required_approval_date text,
    required_date text,
    required_on_job_date text,
    responded_at text,
    responded_by text,
    response_comment text,
    response_id text,
    response_value text,
    revision text,
    sent_to_review text,
    sent_to_review_by text,
    sent_to_submitter text,
    spec_identifier text,
    state_id text,
    status_id text,
    status_value text,
    subcontractor text,
    subcontractor_type text,
    submitted_by text,
    submitter_due_date text,
    subsection text,
    title text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (spec_section_id) REFERENCES submittal_acc_spec(id),
    FOREIGN KEY (type_id) REFERENCES submittal_acc_item_type(id)
);

CREATE TABLE sheet_upload (
    id text,
    project_id text,
    version_set_id text,
    created_at text,
    created_by text,
    created_by_name text,
    published_at text,
    published_by text,
    published_by_name text,
    published_count text,
    "status" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (version_set_id) REFERENCES sheet_set(id)
);

CREATE TABLE schedule_dependency (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    schedule_id text,
    created_at text,
    source_unique_id text,
    target_unique_id text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE transmittal_document (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    last_modified_user_id text,
    created_at text,
    file_name text,
    last_modified_time text,
    parent_folder_urn text,
    revision_number text,
    updated_at text,
    urn text,
    version_number text,
    workflow_transmittal_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (last_modified_user_id) REFERENCES admin_user(autodesk_id)
);

CREATE TABLE sheet (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    container_type text,
    discipline_index text,
    history_id text,
    upload_id text,
    created_at text,
    created_by text,
    created_by_name text,
    deleted text,
    deleted_at text,
    deleted_by text,
    deleted_by_name text,
    is_current text,
    "name" text,
    nat_sort_name text,
    original_set_name text,
    processing_state text,
    title text,
    updated_at text,
    updated_by text,
    updated_by_name text,
    upload_file_name text,
    version_set_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (container_type) REFERENCES sheet_discipline(container_type),
    FOREIGN KEY (discipline_index) REFERENCES sheet_discipline("index"),
    FOREIGN KEY (history_id) REFERENCES sheet_lineage(id),
    FOREIGN KEY (upload_id) REFERENCES sheet_upload(id)
);

CREATE TABLE asset_stage (
    id text,
    asset_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    bound_id text,
    bound_type text,
    completed_at text,
    completed_by text,
    completed_work text,
    completion_status text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    is_current text,
    max_work text,
    started_at text,
    started_by text,
    unit_of_work text,
    updated_at text,
    updated_by text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE iq_inspection_risk_issue (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    inspection_risk text,
    predicted_at text,
    updated_at text,
    user_category text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE iq_design_issues_building_component (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    building_component text,
    building_component_keyword text,
    predicted_at text,
    updated_at text,
    user_building_component text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE form_native_form (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    layout_uid text,
    template_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (layout_uid) REFERENCES form_layout(uid),
    FOREIGN KEY (template_id) REFERENCES form_template(id)
);

CREATE TABLE sheet_discipline (
    container_type text,
    "index" text,
    bim_360_account_id text,
    bim_360_project_id text,
    designator text,
    "name" text,
    PRIMARY KEY (container_type, "index"),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE iq_rfis_building_component (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    building_component text,
    building_component_keyword text,
    predicted_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE issue_sub_type_permitted_action (
    permitted_action text,
    issue_sub_type_id text,
    PRIMARY KEY (permitted_action, issue_sub_type_id),
    FOREIGN KEY (issue_sub_type_id) REFERENCES issue_sub_type(id)
);

CREATE TABLE issue_sub_type_permitted_attribute (
    permitted_attribute text,
    issue_sub_type_id text,
    PRIMARY KEY (permitted_attribute, issue_sub_type_id),
    FOREIGN KEY (issue_sub_type_id) REFERENCES issue_sub_type(id)
);

CREATE TABLE issue_sub_type (
    id text,
    issue_type_id text,
    code text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    is_active text,
    is_read_only text,
    order_index text,
    status_set text,
    title text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (issue_type_id) REFERENCES issue_type(id)
);

CREATE TABLE issue_type_permitted_action (
    permitted_action text,
    issue_type_id text,
    PRIMARY KEY (permitted_action, issue_type_id),
    FOREIGN KEY (issue_type_id) REFERENCES issue_type(id)
);

CREATE TABLE issue_type_permitted_attribute (
    permitted_attribute text,
    issue_type_id text,
    PRIMARY KEY (permitted_attribute, issue_type_id),
    FOREIGN KEY (issue_type_id) REFERENCES issue_type(id)
);

CREATE TABLE issue_type (
    id text,
    project_id text,
    container_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    is_active text,
    order_index text,
    status_set text,
    title text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE schedule (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    is_public text,
    "name" text,
    "type" text,
    updated_at text,
    updated_by text,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE rfi_transition (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    rfi_id text,
    created_at text,
    created_by text,
    from_status text,
    to_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (rfi_id) REFERENCES rfi(id)
);

CREATE TABLE sheet_lineage (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    container_type text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE hub (
    id text,
    data jsonb,
    extension_type text,
    "name" text,
    region text,
    "type" text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE form_pdf_value (
    _fivetran_id text,
    form_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form_hourly_weather (
    id text,
    form_id text,
    created_at text,
    fetched_at text,
    "hour" text,
    humidity text,
    temp text,
    updated_at text,
    wind_bearing text,
    wind_speed text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE custom_array_value (
    "value" text,
    form_custom_value_id text,
    PRIMARY KEY ("value", form_custom_value_id),
    FOREIGN KEY (form_custom_value_id) REFERENCES form_custom_value(id)
);

CREATE TABLE form_custom_value (
    id text,
    form_id text,
    choice_value text,
    date_value text,
    item_label text,
    notes text,
    number_value text,
    section_label text,
    svg_value text,
    text_value text,
    toggle_value text,
    value_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form (
    id text,
    form_template_id text,
    project_id text,
    assignee_id text,
    assignee_type text,
    created_by text,
    description text,
    form_date text,
    form_num text,
    location_id text,
    notes text,
    pdf_url text,
    "status" text,
    updated_at text,
    weather_humidity text,
    weather_precipitation_accumulation text,
    weather_precipitation_accumulation_unit text,
    weather_speed_unit text,
    weather_summary_key text,
    weather_temperature_max text,
    weather_temperature_min text,
    weather_temperature_unit text,
    weather_wind_bearing text,
    weather_wind_gust text,
    weather_wind_speed text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_template_id) REFERENCES form_template(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE form_entry (
    id text,
    form_id text,
    deleted text,
    description text,
    headcount text,
    timespan text,
    trade text,
    "type" text,
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE issue_comment_permitted_action (
    permitted_action text,
    issue_comment_id text,
    PRIMARY KEY (permitted_action, issue_comment_id),
    FOREIGN KEY (issue_comment_id) REFERENCES issue_comment(id)
);

CREATE TABLE issue_comment_permitted_attribute (
    permitted_attribute text,
    issue_comment_id text,
    PRIMARY KEY (permitted_attribute, issue_comment_id),
    FOREIGN KEY (issue_comment_id) REFERENCES issue_comment(id)
);

CREATE TABLE issue_comment (
    id text,
    issue_id text,
    project_id text,
    body text,
    client_created_at text,
    client_updated_at text,
    created_at text,
    deleted_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE asset_custom_attribute_value (
    asset_id text,
    custom_attribute_id text,
    bim_360_account_id text,
    bim_360_project_id text,
    value_boolean text,
    value_string text,
    PRIMARY KEY (asset_id, custom_attribute_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE schedule_resource (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    schedule_id text,
    activity_unique_id text,
    created_at text,
    email_address text,
    "name" text,
    resource_unique_id text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE meeting_minute_assignee (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    item_id text,
    non_member_participant_id text,
    created_at text,
    deleted_at text,
    participant_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id),
    FOREIGN KEY (item_id) REFERENCES meeting_minute_item(id),
    FOREIGN KEY (non_member_participant_id) REFERENCES meeting_minute_non_member_participant(id)
);

CREATE TABLE meeting_minute (
    id text,
    bim_360_account_id text,
    bim_360_project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    description text,
    duration text,
    meeting_location text,
    num_in_series text,
    series_id text,
    starts_at text,
    "status" text,
    summary text,
    title text,
    updated_at text,
    updated_by text,
    video_conference_link text,
    PRIMARY KEY (id),
    FOREIGN KEY (bim_360_account_id) REFERENCES hub(id),
    FOREIGN KEY (bim_360_project_id) REFERENCES project(id)
);

CREATE TABLE sub_category (
    category_id text,
    sub_category_id text,
    PRIMARY KEY (category_id, sub_category_id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (sub_category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id text,
    parent_id text,
    project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    description text,
    is_active text,
    is_leaf text,
    is_root text,
    "name" text,
    uid text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES category(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE root_cause_permitted_action (
    permitted_action text,
    issue_root_cause_category_id text,
    PRIMARY KEY (permitted_action, issue_root_cause_category_id),
    FOREIGN KEY (issue_root_cause_category_id) REFERENCES issue_root_cause_category(id)
);

CREATE TABLE root_cause_permitted_attribute (
    permitted_attribute text,
    issue_root_cause_category_id text,
    PRIMARY KEY (permitted_attribute, issue_root_cause_category_id),
    FOREIGN KEY (issue_root_cause_category_id) REFERENCES issue_root_cause_category(id)
);

CREATE TABLE issue_root_cause (
    id text,
    root_cause_category_id text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (root_cause_category_id) REFERENCES issue_root_cause_category(id)
);

CREATE TABLE issue_root_cause_category (
    id text,
    project_id text,
    created_at text,
    created_by text,
    deleted_at text,
    deleted_by text,
    is_active text,
    title text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
