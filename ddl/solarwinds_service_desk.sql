CREATE TABLE group_membership (
    id text,
    groups_id text,
    "type" text,
    users text,
    PRIMARY KEY (id, groups_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id)
);

CREATE TABLE group_custom_field (
    id text,
    groups_id text,
    custom_field_id text,
    "name" text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, groups_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    reports_to_id text,
    description text,
    disabled text,
    is_user text,
    "name" text,
    send_notifications text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (reports_to_id) REFERENCES groups(id)
);

CREATE TABLE incident_cc (
    "index" text,
    incident_id text,
    cc text,
    PRIMARY KEY ("index", incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_problem (
    incident_id text,
    problem_id text,
    PRIMARY KEY (incident_id, problem_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE incident_change (
    change_id text,
    incident_id text,
    PRIMARY KEY (change_id, incident_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_solution (
    incident_id text,
    solution_id text,
    PRIMARY KEY (incident_id, solution_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (solution_id) REFERENCES solution(id)
);

CREATE TABLE incident_sla_violation (
    id text,
    incident_id text,
    assignee_id text,
    "name" text,
    resolved text,
    sla_id text,
    sla_type text,
    time_delay text,
    time_units text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE incident_release (
    incident_id text,
    release_id text,
    PRIMARY KEY (incident_id, release_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE incident_configuration_item (
    configuration_item_id text,
    incident_id text,
    PRIMARY KEY (configuration_item_id, incident_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_custom_field_value (
    id text,
    incident_id text,
    user_id text,
    attachment text,
    custom_field_id text,
    entity text,
    "name" text,
    "option" text,
    "type" text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE incident_statistic (
    "index" text,
    incident_id text,
    business_time_elapsed text,
    statistic_type text,
    "time" text,
    time_elapsed text,
    "value" text,
    PRIMARY KEY ("index"),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_request_variable (
    id text,
    incident_id text,
    attachment text,
    custom_field_id text,
    entity text,
    "name" text,
    options text,
    "type" text,
    type_name text,
    users text,
    "value" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_purchase_order (
    incident_id text,
    purchase_order_id text,
    PRIMARY KEY (incident_id, purchase_order_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE incident (
    id text,
    assignee_id text,
    category_id text,
    department_id text,
    resolved_by_id text,
    site_id text,
    assets jsonb,
    created_at text,
    created_by_account_id text,
    created_by_avatar_color text,
    created_by_avatar_initials text,
    created_by_avatar_type text,
    created_by_customer_satisfaction_survey_time text,
    created_by_disabled text,
    created_by_email text,
    created_by_has_gravatar text,
    created_by_id text,
    created_by_name text,
    created_by_user_id text,
    custom text,
    customer_satisfaction_response text,
    customer_satisfaction_survey_completed_at text,
    customer_satisfaction_survey_sent_at text,
    description text,
    description_no_html text,
    discovery_hardwares jsonb,
    due_at text,
    href text,
    href_account_domain text,
    is_customer_satisfied text,
    is_service_request text,
    "name" text,
    number text,
    number_of_comments text,
    origin text,
    other_assets jsonb,
    priority text,
    requester_account_id text,
    requester_avatar_color text,
    requester_avatar_initials text,
    requester_avatar_type text,
    requester_disabled text,
    requester_email text,
    requester_id text,
    requester_name text,
    requester_user_id text,
    resolution text,
    resolution_code text,
    resolution_description text,
    resolution_type text,
    "state" text,
    subcategory_default_assignee_id text,
    subcategory_default_tag text,
    subcategory_deleted text,
    subcategory_id text,
    subcategory_name text,
    tasks jsonb,
    total_time_spent text,
    updated_at text,
    user_saw_all_comments text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (resolved_by_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE change_time_track (
    id text,
    change_id text,
    creator_id text,
    parent_id text,
    created_at text,
    minutes text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, change_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES change(id)
);

CREATE TABLE problem_change (
    change_id text,
    problem_id text,
    PRIMARY KEY (change_id, problem_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE problem_asset (
    id text,
    problem_id text,
    PRIMARY KEY (id, problem_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE problem_solution (
    problem_id text,
    solution_id text,
    PRIMARY KEY (problem_id, solution_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id),
    FOREIGN KEY (solution_id) REFERENCES solution(id)
);

CREATE TABLE problem_tag (
    "name" text,
    problem_id text,
    id text,
    taggings_count text,
    PRIMARY KEY ("name", problem_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE problem_configuration_item (
    configuration_item_id text,
    problem_id text,
    configuration_item text,
    PRIMARY KEY (configuration_item_id, problem_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id),
    FOREIGN KEY (configuration_item) REFERENCES configuration_item(id)
);

CREATE TABLE problem_custom_field_value (
    id text,
    problem_id text,
    user_id text,
    custom_field_id text,
    "name" text,
    options text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, problem_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE problem (
    id text,
    assignee_id text,
    created_by_id text,
    department_id text,
    reports_to_id text,
    requester_id text,
    role_id text,
    site_id text,
    created_at text,
    custom text,
    description text,
    description_no_html text,
    href text,
    "name" text,
    number text,
    other_assets jsonb,
    priority text,
    root_cause text,
    "state" text,
    symptoms text,
    tasks jsonb,
    updated_at text,
    workaround text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (reports_to_id) REFERENCES users(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE problem_time_track (
    id text,
    problem_id text,
    creator_id text,
    parent_id text,
    created_at text,
    minutes text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, problem_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES problem(id)
);

CREATE TABLE department (
    id text,
    default_assignee_id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE release_tag (
    id text,
    release_id text,
    "name" text,
    taggings_count text,
    PRIMARY KEY (id, release_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_approver (
    id text,
    release_id text,
    PRIMARY KEY (id, release_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_change (
    change_id text,
    release_id text,
    PRIMARY KEY (change_id, release_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_custom_field (
    id text,
    release_id text,
    user_id text,
    custom_field_id text,
    "name" text,
    options text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, release_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE release_configuration_item (
    configuration_item_id text,
    release_id text,
    PRIMARY KEY (configuration_item_id, release_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_problem (
    problem_id text,
    release_id text,
    PRIMARY KEY (problem_id, release_id),
    FOREIGN KEY (problem_id) REFERENCES problem(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_solution (
    release_id text,
    solution_id text,
    PRIMARY KEY (release_id, solution_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (solution_id) REFERENCES solution(id)
);

CREATE TABLE release_purchase_order (
    purchase_order_id text,
    release_id text,
    PRIMARY KEY (purchase_order_id, release_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE "release" (
    id text,
    assignee_id text,
    created_by_id text,
    department_id text,
    requester_id text,
    site_id text,
    build text,
    deploy text,
    description text,
    "name" text,
    number text,
    plan text,
    planned_end_at text,
    planned_start_at text,
    priority text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE solution_time_track (
    id text,
    solution_id text,
    creator_id text,
    parent_id text,
    created_at text,
    minutes text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, solution_id),
    FOREIGN KEY (solution_id) REFERENCES solution(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES solution(id)
);

CREATE TABLE purchase_order_item (
    id text,
    purchase_order_id text,
    created_at text,
    description text,
    discount text,
    "name" text,
    part_number text,
    price text,
    quantity text,
    serial_number text,
    tax text,
    updated_at text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_custom_field_value (
    id text,
    purchase_order_id text,
    custom_field_id text,
    "name" text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_attachment (
    id text,
    purchase_order_id text,
    content_type text,
    filename text,
    secure_url text,
    "size" text,
    thumb_url text,
    url text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    buyer_id text,
    department_id text,
    requester_id text,
    site_id text,
    vendor_id text,
    billing_address text,
    created_at text,
    currency text,
    due_date text,
    href text,
    "name" text,
    notes text,
    number text,
    number_of_attachments text,
    order_date text,
    payment_terms text,
    recurrence text,
    shipping_address text,
    shipping_handling text,
    "state" text,
    tax text,
    terms_conditions text,
    total_cost text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (buyer_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE user_group (
    group_id text,
    users_id text,
    PRIMARY KEY (group_id, users_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_custom_field (
    id text,
    users_id text,
    custom_field_id text,
    "name" text,
    options text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    department_id text,
    reports_to_id text,
    role_id text,
    site_id text,
    available_for_assignment text,
    avatar_color text,
    avatar_initials text,
    avatar_type text,
    can_be_available_for_assignment text,
    created_at text,
    disabled text,
    email text,
    last_login text,
    mobile_phone text,
    "name" text,
    phone text,
    provider text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (reports_to_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE incident_time_track (
    id text,
    incident_id text,
    creator_id text,
    parent_id text,
    created_at text,
    minutes text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES incident(id)
);

CREATE TABLE contract_tag (
    id text,
    contract_id text,
    "name" text,
    taggings_count text,
    PRIMARY KEY (id, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract_custom_field (
    id text,
    contract_id text,
    custom_field_id text,
    "name" text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract_item (
    _fivetran_id text,
    contract_id text,
    created_at text,
    "name" text,
    notes text,
    quantity text,
    tags text,
    updated_at text,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract (
    id text,
    department_id text,
    site_id text,
    created_at text,
    end_date text,
    href text,
    manufacturer_name text,
    "name" text,
    note text,
    start_date text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE "role" (
    id text,
    description text,
    "name" text,
    portal text,
    show_my_tasks text,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id text,
    parent_id text,
    default_assignee_id text,
    default_tags text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

CREATE TABLE change_configuration_item (
    change_id text,
    configuration_item_id text,
    PRIMARY KEY (change_id, configuration_item_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id)
);

CREATE TABLE change_purchase_order (
    change_id text,
    purchase_order_id text,
    href text,
    PRIMARY KEY (change_id, purchase_order_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE change_task (
    id text,
    change_id text,
    href text,
    PRIMARY KEY (id, change_id),
    FOREIGN KEY (change_id) REFERENCES change(id)
);

CREATE TABLE change_solution (
    change_id text,
    solution_id text,
    href text,
    PRIMARY KEY (change_id, solution_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (solution_id) REFERENCES solution(id)
);

CREATE TABLE change_custom_field_value (
    id text,
    change_id text,
    user_id text,
    attachment text,
    custom_field_id text,
    entity text,
    "name" text,
    options text,
    "type" text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, change_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE change (
    id text,
    assignee_id text,
    created_by_id text,
    department_id text,
    requester_id text,
    site_id text,
    approve_denied_at text,
    approve_requested_at text,
    approved_at text,
    assets jsonb,
    category text,
    cc jsonb,
    created_at text,
    custom text,
    description text,
    description_no_html text,
    have_conflict text,
    href text,
    "name" text,
    number text,
    origin text,
    other_assets jsonb,
    plan text,
    planned_end_at text,
    planned_start_at text,
    priority text,
    request_variables jsonb,
    rollback_plan text,
    "state" text,
    sub_category text,
    tags jsonb,
    test_plan text,
    "type" text,
    updated_at text,
    workflow_tasks jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    business_record text,
    description text,
    languages text,
    location text,
    "name" text,
    time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE risk_affected_asset (
    "index" text,
    risk_id text,
    id text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", risk_id),
    FOREIGN KEY (risk_id) REFERENCES risk(id)
);

CREATE TABLE risk (
    id text,
    at text,
    category text,
    created_at text,
    discarded text,
    "name" text,
    resolved text,
    severity text,
    updated text,
    PRIMARY KEY (id)
);

CREATE TABLE solution (
    id text,
    creator_id text,
    attachments jsonb,
    created_at text,
    description text,
    description_no_html text,
    href text,
    is_allow_to_vote text,
    "name" text,
    number text,
    number_of_attachments text,
    number_of_shared_attachments text,
    shared_attachments jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE catalog_item_tag (
    "name" text,
    catalog_item_id text,
    id text,
    taggings_count text,
    PRIMARY KEY ("name", catalog_item_id),
    FOREIGN KEY (catalog_item_id) REFERENCES catalog_item(id)
);

CREATE TABLE catalog_item_variable (
    id text,
    catalog_item_id text,
    field_type text,
    helptext text,
    kind text,
    "name" text,
    options text,
    required text,
    sorted text,
    PRIMARY KEY (id, catalog_item_id),
    FOREIGN KEY (catalog_item_id) REFERENCES catalog_item(id)
);

CREATE TABLE catalog_item (
    id text,
    category_id text,
    department_id text,
    site_id text,
    created_at text,
    currency text,
    custom text,
    description text,
    due_days text,
    href text,
    image_href text,
    "name" text,
    portal_homepage text,
    price text,
    request_count text,
    show_due_days text,
    show_price text,
    "state" text,
    tags text,
    updated_at text,
    url_id text,
    variables_unparsed text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE configuration_item_mobile (
    configuration_item_id text,
    id text,
    PRIMARY KEY (configuration_item_id, id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (id) REFERENCES mobile(id)
);

CREATE TABLE configuration_item_custom_field_value (
    custom_field_id text,
    configuration_item_id text,
    attachment text,
    entity text,
    id text,
    "name" text,
    options text,
    "type" text,
    type_name text,
    users text,
    "value" text,
    PRIMARY KEY (custom_field_id, configuration_item_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id)
);

CREATE TABLE configuration_item_incident (
    configuration_item_id text,
    incident_id text,
    PRIMARY KEY (configuration_item_id, incident_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE configuration_item_problem (
    configuration_item_id text,
    problem_id text,
    PRIMARY KEY (configuration_item_id, problem_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (problem_id) REFERENCES problem(id)
);

CREATE TABLE configuration_item_purchase_order (
    configuration_item_id text,
    purchase_order_id text,
    PRIMARY KEY (configuration_item_id, purchase_order_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE configuration_item_release (
    configuration_item_id text,
    release_id text,
    PRIMARY KEY (configuration_item_id, release_id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE configuration_item_change (
    change_id text,
    configuration_item_id text,
    PRIMARY KEY (change_id, configuration_item_id),
    FOREIGN KEY (change_id) REFERENCES change(id),
    FOREIGN KEY (configuration_item_id) REFERENCES configuration_item(id)
);

CREATE TABLE configuration_item (
    id text,
    department_id text,
    manager_id text,
    site_id text,
    user_id text,
    asset_tag text,
    assets jsonb,
    attachments_count text,
    created_at text,
    deleted text,
    description text,
    discovery_hardwares jsonb,
    "name" text,
    number text,
    origin text,
    other_assets jsonb,
    parent_id text,
    parent_type text,
    state_id text,
    type_custom text,
    type_description text,
    type_icon_name text,
    type_id text,
    type_name text,
    type_parent_id text,
    type_updated_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE software (
    id text,
    category_id text,
    vendor_id text,
    created_at text,
    custom text,
    first_detected text,
    greynet text,
    hardwares_href text,
    hidden text,
    href text,
    installs text,
    is_primnary text,
    manufacturer text,
    "name" text,
    primary_id text,
    tags text,
    updated_at text,
    version text,
    windows_system_component text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE printer (
    id text,
    department_id text,
    site_id text,
    technical_contact_id text,
    driver text,
    "name" text,
    port text,
    shared text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (technical_contact_id) REFERENCES users(id)
);

CREATE TABLE other_asset_hardware_date (
    id text,
    other_asset_id text,
    "date" text,
    date_type text,
    notes text,
    user_type text,
    username text,
    PRIMARY KEY (id, other_asset_id),
    FOREIGN KEY (other_asset_id) REFERENCES other_asset(id)
);

CREATE TABLE other_asset_custom_field_value (
    id text,
    other_asset_id text,
    attachment text,
    custom_field_id text,
    entity text,
    "name" text,
    options text,
    "type" text,
    type_name text,
    users text,
    "value" text,
    PRIMARY KEY (id, other_asset_id),
    FOREIGN KEY (other_asset_id) REFERENCES other_asset(id)
);

CREATE TABLE other_asset (
    id text,
    category_id text,
    department_id text,
    owner_id text,
    site_id text,
    address text,
    asset_id text,
    asset_type_account_id text,
    asset_type_id text,
    asset_type_name text,
    asset_type_parent_id text,
    created_at text,
    custom text,
    description text,
    href text,
    incidents jsonb,
    ip_address text,
    latitude text,
    lease_contract text,
    longitude text,
    maintenance_contract text,
    manufacturer text,
    model text,
    "name" text,
    purchase_orders jsonb,
    serial_number text,
    status_id text,
    status_name text,
    tags jsonb,
    tasks jsonb,
    updated_at text,
    users text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE hardware_custom_field_value (
    id text,
    hardware_id text,
    user_id text,
    custom_field_id text,
    "name" text,
    options text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE hardware_bios (
    id text,
    hardware_id text,
    bios_date text,
    manufacturer text,
    model text,
    previous_ssn text,
    reported_at text,
    ssn text,
    version text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_network (
    id text,
    hardware_id text,
    description text,
    dhcp text,
    gateway text,
    ip_address text,
    mac_address text,
    reported_at text,
    samagent_object_hash text,
    "status" text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_drive (
    id text,
    hardware_id text,
    drive_name text,
    drive_type text,
    free_space text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    total_space text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_printer (
    hardware_id text,
    id text,
    PRIMARY KEY (hardware_id, id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id),
    FOREIGN KEY (id) REFERENCES printer(id)
);

CREATE TABLE hardware_display (
    id text,
    hardware_id text,
    description text,
    display_type text,
    manufacturer text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    serial_number text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_video (
    id text,
    hardware_id text,
    chipset text,
    memory text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_controller (
    id text,
    hardware_id text,
    controller_type text,
    description text,
    manufacturer text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    version text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_input (
    id text,
    hardware_id text,
    input_type text,
    manufacturer text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_sound (
    id text,
    hardware_id text,
    description text,
    manufacturer text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_memory (
    id text,
    hardware_id text,
    capacity text,
    description text,
    memory_type text,
    "name" text,
    purpose text,
    reported_at text,
    samagent_object_hash text,
    slot text,
    speed text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_port (
    id text,
    hardware_id text,
    description text,
    "name" text,
    port_type text,
    reported_at text,
    samagent_object_hash text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware_storage (
    id text,
    hardware_id text,
    description text,
    manufacturer text,
    model text,
    "name" text,
    reported_at text,
    samagent_object_hash text,
    "size" text,
    storage_type text,
    PRIMARY KEY (id, hardware_id),
    FOREIGN KEY (hardware_id) REFERENCES hardware(id)
);

CREATE TABLE hardware (
    id text,
    category_id text,
    department_id text,
    owner_id text,
    site_id text,
    active_directory text,
    address text,
    asset_tag text,
    audits_href text,
    barcode_encoding_format text,
    cpu text,
    created_at text,
    custom text,
    description text,
    detected_at text,
    domain text,
    external_ip text,
    hardware_spec_href text,
    hidden_softwares_href text,
    incidents_href text,
    ip text,
    latitude text,
    longitude text,
    memory text,
    model text,
    monitors text,
    "name" text,
    notes text,
    operating_system text,
    operating_system_version text,
    physical_memory text,
    processor_speed text,
    product_number text,
    purchase_orders_href text,
    risks_href text,
    serial_number text,
    softwares_href text,
    status_id text,
    status_name text,
    swap text,
    tags text,
    technical_contact_email text,
    updated_at text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE vendor (
    id text,
    address text,
    city text,
    contact_email text,
    contact_name text,
    contact_phone text,
    href text,
    "name" text,
    note text,
    "state" text,
    telephone text,
    url text,
    vendor_type_id text,
    vendor_type_name text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE mobile_custom_field_value (
    id text,
    mobile_id text,
    custom_field_id text,
    "name" text,
    type_name text,
    "value" text,
    PRIMARY KEY (id, mobile_id),
    FOREIGN KEY (mobile_id) REFERENCES mobile(id)
);

CREATE TABLE mobile (
    id text,
    department_id text,
    site_id text,
    technical_contact_id text,
    user_id text,
    company_issued text,
    description text,
    device_type text,
    imei text,
    manufacturer text,
    model text,
    serial_number text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (technical_contact_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
