CREATE TABLE associated_asset (
    asset_display_id bigint,
    parent_entity_id bigint,
    parent_entity_type text,
    PRIMARY KEY (asset_display_id, parent_entity_id, parent_entity_type)
);

CREATE TABLE service_item (
    id bigint,
    category_id bigint,
    ci_type_id bigint,
    product_id bigint,
    allow_attachments boolean,
    allow_quantity boolean,
    botified boolean,
    configs jsonb,
    cost_visibility boolean,
    create_child boolean,
    created_at timestamp,
    delivery_time integer,
    delivery_time_visibility boolean,
    display_id bigint,
    group_visibility integer,
    icon_name text,
    is_bundle boolean,
    item_type integer,
    "name" text,
    quantity integer,
    updated_at timestamp,
    visibility integer,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES service_category(id),
    FOREIGN KEY (ci_type_id) REFERENCES asset_type(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE user_group (
    "type" text,
    group_id bigint,
    user_id bigint,
    PRIMARY KEY ("type", group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE solution_folder_relation_id (
    entity_id bigint,
    relation_type text,
    folder_id bigint,
    PRIMARY KEY (entity_id, relation_type, folder_id),
    FOREIGN KEY (folder_id) REFERENCES solution_folder(id)
);

CREATE TABLE solution_folder_approval (
    approval_type integer,
    approver_id bigint,
    folder_id bigint,
    PRIMARY KEY (approval_type, approver_id, folder_id),
    FOREIGN KEY (approver_id) REFERENCES service_user(id),
    FOREIGN KEY (folder_id) REFERENCES solution_folder(id)
);

CREATE TABLE announcement_email (
    email text,
    announcement_id bigint,
    PRIMARY KEY (email, announcement_id),
    FOREIGN KEY (announcement_id) REFERENCES announcement(id)
);

CREATE TABLE ticket_email (
    email text,
    "type" text,
    ticket_id bigint,
    PRIMARY KEY (email, "type", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE department (
    id bigint,
    head_user_id bigint,
    prime_user_id bigint,
    created_at timestamp,
    description text,
    "name" text,
    note text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (head_user_id) REFERENCES service_user(id),
    FOREIGN KEY (prime_user_id) REFERENCES service_user(id)
);

CREATE TABLE ticket (
    id bigint,
    department_id bigint,
    group_id bigint,
    requested_for_id bigint,
    requester_id bigint,
    responder_id bigint,
    approval_status integer,
    approval_status_name text,
    association_type integer,
    category text,
    created_at timestamp,
    description text,
    description_text text,
    due_by timestamp,
    fr_due_by timestamp,
    is_escalated boolean,
    item_category text,
    priority text,
    "source" text,
    spam boolean,
    stats_closed_at timestamp,
    stats_first_responded_at timestamp,
    stats_resolved_at timestamp,
    "status" text,
    sub_category text,
    subject text,
    "type" text,
    updated_at timestamp,
    workspace_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (requested_for_id) REFERENCES service_user(id),
    FOREIGN KEY (requester_id) REFERENCES service_user(id),
    FOREIGN KEY (responder_id) REFERENCES service_user(id)
);

CREATE TABLE software_user (
    id bigint,
    license_id bigint,
    software_id bigint,
    user_id bigint,
    allocated_date timestamp,
    created_at timestamp,
    first_used timestamp,
    last_used timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (license_id) REFERENCES contract(id),
    FOREIGN KEY (software_id) REFERENCES software(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE purchase_order (
    id bigint,
    created_by bigint,
    department_id bigint,
    vendor_id bigint,
    billing_address text,
    billing_same_as_shipping boolean,
    created_at timestamp,
    discount_percentage bigint,
    expected_delivery_date timestamp,
    "name" text,
    po_number text,
    shipping_address text,
    shipping_cost bigint,
    "status" bigint,
    tax_percentage bigint,
    updated_at timestamp,
    vendor_details text,
    -- currency_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES service_user(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE task (
    id bigint,
    agent_id bigint,
    group_id bigint,
    closed_at timestamp,
    created_at timestamp,
    description text,
    due_date timestamp,
    parent_object_id bigint,
    parent_object_type text,
    "status" integer,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (group_id) REFERENCES service_group(id)
);

CREATE TABLE solution_article_feature (
    "type" text,
    "value" text,
    article_id bigint,
    PRIMARY KEY ("type", "value", article_id),
    FOREIGN KEY (article_id) REFERENCES solution_article(id)
);

CREATE TABLE service_group (
    id bigint,
    business_hour_id bigint,
    escalate_to bigint,
    approval_required boolean,
    auto_ticket_assign boolean,
    created_at timestamp,
    description text,
    is_requester_group boolean,
    "name" text,
    "type" text,
    unassigned_for text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (business_hour_id) REFERENCES business_hour(id),
    FOREIGN KEY (escalate_to) REFERENCES service_user(id)
);

CREATE TABLE project_task (
    id bigint,
    assignee_id bigint,
    parent_id bigint,
    priority_id bigint,
    project_id bigint,
    reporter_id bigint,
    sprint_id bigint,
    status_id bigint,
    type_id bigint,
    version_id bigint,
    created_at timestamp,
    display_key text,
    end_date timestamp,
    planned_duration text,
    planned_effort text,
    planned_end_date timestamp,
    planned_start_date timestamp,
    start_date timestamp,
    story_points bigint,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES service_user(id),
    FOREIGN KEY (parent_id) REFERENCES project_task(id),
    FOREIGN KEY (priority_id) REFERENCES project_task_priority(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (reporter_id) REFERENCES service_user(id),
    FOREIGN KEY (sprint_id) REFERENCES project_sprint(id),
    FOREIGN KEY (status_id) REFERENCES project_task_status(id),
    FOREIGN KEY (type_id) REFERENCES project_task_type(id),
    FOREIGN KEY (version_id) REFERENCES project_version(id)
);

CREATE TABLE vendor (
    id bigint,
    primary_contact_id bigint,
    contact_name text,
    created_at timestamp,
    description text,
    email text,
    mobile text,
    "name" text,
    phone text,
    updated_at timestamp,
    -- address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (primary_contact_id) REFERENCES service_user(id)
);

CREATE TABLE associated_change (
    change_id bigint,
    release_id bigint,
    PRIMARY KEY (change_id, release_id)
);

CREATE TABLE ticket_attachment (
    id bigint,
    ticket_id bigint,
    attachment_url text,
    content_type text,
    created_at timestamp,
    "name" text,
    "size" bigint,
    updated_at timestamp,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE change (
    id bigint,
    agent_id bigint,
    department_id bigint,
    group_id bigint,
    requester_id bigint,
    approval_status integer,
    category text,
    change_type integer,
    created_at timestamp,
    description text,
    description_text text,
    due_by timestamp,
    impact integer,
    item_category text,
    known_error boolean,
    planned_end_date timestamp,
    planned_start_date timestamp,
    priority integer,
    risk integer,
    "status" integer,
    sub_category text,
    subject text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (requester_id) REFERENCES service_user(id)
);

CREATE TABLE time_entry (
    id bigint,
    agent_id bigint,
    task_id bigint,
    billable boolean,
    created_at timestamp,
    executed_at timestamp,
    note text,
    parent_entity_id bigint,
    parent_entity_type text,
    start_time timestamp,
    time_spent text,
    timer_running boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE project_membership (
    id bigint,
    project_id bigint,
    user_id bigint,
    access_type bigint,
    created_at timestamp,
    manage_settings boolean,
    project_manager boolean,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE department_domain (
    domain text,
    department_id bigint,
    PRIMARY KEY (domain, department_id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE asset_component (
    id bigint,
    asset_id bigint,
    component_data jsonb,
    component_type text,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE project_task_priority (
    id bigint,
    project_id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE contract (
    id bigint,
    approver_id bigint,
    contract_type_id bigint,
    delegatee_id bigint,
    future_contract_id bigint,
    requester_id bigint,
    software_id bigint,
    vendor_id bigint,
    visible_to_id bigint,
    auto_renew boolean,
    billing_cycle text,
    contract_number text,
    cost text,
    created_at timestamp,
    description text,
    end_date timestamp,
    expiry_notified boolean,
    has_associated_assets boolean,
    has_attachments boolean,
    license_key text,
    license_type text,
    "name" text,
    notify_before integer,
    notify_expiry boolean,
    start_date timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (approver_id) REFERENCES service_user(id),
    FOREIGN KEY (contract_type_id) REFERENCES contract_type(id),
    FOREIGN KEY (delegatee_id) REFERENCES service_user(id),
    FOREIGN KEY (future_contract_id) REFERENCES contract(id),
    FOREIGN KEY (requester_id) REFERENCES service_user(id),
    FOREIGN KEY (software_id) REFERENCES software(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id),
    FOREIGN KEY (visible_to_id) REFERENCES service_group(id)
);

CREATE TABLE location (
    id bigint,
    parent_location_id bigint,
    primary_contact_id bigint,
    created_at timestamp,
    email text,
    "name" text,
    phone text,
    updated_at timestamp,
    -- address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_location_id) REFERENCES location(id),
    FOREIGN KEY (primary_contact_id) REFERENCES service_user(id)
);

CREATE TABLE announcement_relation (
    entity_id bigint,
    relation_type text,
    announcement_id bigint,
    PRIMARY KEY (entity_id, relation_type, announcement_id),
    FOREIGN KEY (announcement_id) REFERENCES announcement(id)
);

CREATE TABLE "release" (
    id bigint,
    agent_id bigint,
    department_id bigint,
    group_id bigint,
    requester_id bigint,
    approval_status integer,
    category text,
    created_at timestamp,
    description text,
    description_text text,
    due_by timestamp,
    impact integer,
    item_category text,
    known_error boolean,
    planned_end_date timestamp,
    planned_start_date timestamp,
    priority integer,
    release_type integer,
    risk integer,
    "status" integer,
    sub_category text,
    subject text,
    updated_at timestamp,
    work_end_date timestamp,
    work_start_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (requester_id) REFERENCES service_user(id)
);

CREATE TABLE project_task_type_field (
    type_id bigint,
    project_id bigint,
    choices jsonb,
    created_at timestamp,
    "default" boolean,
    label text,
    mandatory boolean,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (type_id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id bigint,
    group_id bigint,
    manager_id bigint,
    archived boolean,
    closed_at timestamp,
    created_at timestamp,
    description text,
    end_date text,
    "key" text,
    "name" text,
    priority_code bigint,
    project_type text,
    sprint_duration bigint,
    start_date text,
    status_code bigint,
    updated_at timestamp,
    visibility bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (manager_id) REFERENCES service_user(id)
);

CREATE TABLE agent_department (
    agent_id bigint,
    department_id bigint,
    PRIMARY KEY (agent_id, department_id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE project_sprint (
    id bigint,
    project_id bigint,
    created_at timestamp,
    goal text,
    planned_end_date timestamp,
    planned_start_date timestamp,
    "state" bigint,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE contract_type (
    id bigint,
    created_at timestamp,
    description text,
    is_default boolean,
    "name" text,
    needs_approval boolean,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE problem (
    id bigint,
    agent_id bigint,
    department_id bigint,
    group_id bigint,
    requester_id bigint,
    category text,
    created_at timestamp,
    description text,
    description_text text,
    due_by timestamp,
    impact integer,
    item_category text,
    known_error boolean,
    priority integer,
    "status" integer,
    sub_category text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (requester_id) REFERENCES service_user(id)
);

CREATE TABLE project_task_type (
    id bigint,
    project_id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE purchase_order_item (
    id bigint,
    order_id bigint,
    item_id bigint,
    cost text,
    created_at timestamp,
    description text,
    item_name text,
    item_type integer,
    quantity bigint,
    received bigint,
    tax_percentage text,
    total_cost text,
    updated_at timestamp,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (item_id) REFERENCES product(id)
);

CREATE TABLE notify_email (
    email text,
    parent_entity_id bigint,
    parent_entity_type text,
    PRIMARY KEY (email, parent_entity_id, parent_entity_type)
);

CREATE TABLE project_version (
    id bigint,
    project_id bigint,
    owner_id bigint,
    created_at timestamp,
    description text,
    due_date timestamp,
    "name" text,
    start_date timestamp,
    status_code bigint,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (owner_id) REFERENCES service_user(id)
);

CREATE TABLE software_relationship (
    id bigint,
    created_at timestamp,
    primary_id bigint,
    primary_type text,
    relationship_type_id bigint,
    secondary_id bigint,
    secondary_type text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id bigint,
    asset_type_id bigint,
    created_at timestamp,
    depreciation_type_id bigint,
    description text,
    description_text text,
    manufacturer text,
    mode_of_procurement text,
    "name" text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_type_id) REFERENCES asset_type(id)
);

CREATE TABLE service_category (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    "position" integer,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_tag (
    tag_name text,
    ticket_id bigint,
    PRIMARY KEY (tag_name, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE announcement (
    id bigint,
    created_by bigint,
    body text,
    body_html text,
    created_at timestamp,
    is_read boolean,
    send_email boolean,
    "state" text,
    title text,
    updated_at timestamp,
    visibility text,
    visible_from timestamp,
    visible_till timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES service_user(id)
);

CREATE TABLE associated_attachment (
    id bigint,
    parent_entity_id bigint,
    parent_entity_type text,
    attachment_url text,
    canonical_url text,
    content_type text,
    created_at timestamp,
    "name" text,
    "size" bigint,
    updated_at timestamp,
    PRIMARY KEY (id, parent_entity_id, parent_entity_type)
);

CREATE TABLE project_task_status (
    id bigint,
    project_id bigint,
    category_code bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "role" (
    id bigint,
    created_at timestamp,
    "default" boolean,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_item (
    id bigint,
    ticket_id bigint,
    cost_per_request double precision,
    created_at timestamp,
    delivery_time integer,
    is_parent boolean,
    loaned boolean,
    quantity integer,
    remarks text,
    service_item_id bigint,
    stage integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE contract_item_detail (
    id bigint,
    contract_id bigint,
    comments text,
    cost text,
    count text,
    created_at timestamp,
    item_name text,
    pricing_model text,
    updated_at timestamp,
    PRIMARY KEY (id, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE software_installation (
    id bigint,
    department_id bigint,
    installation_machine_id bigint,
    software_id bigint,
    user_id bigint,
    created_at timestamp,
    installation_date timestamp,
    installation_path text,
    updated_at timestamp,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (installation_machine_id) REFERENCES asset(id),
    FOREIGN KEY (software_id) REFERENCES software(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE asset (
    id bigint,
    agent_id bigint,
    asset_type_id bigint,
    department_id bigint,
    group_id bigint,
    location_id bigint,
    user_id bigint,
    asset_tag text,
    assigned_on timestamp,
    author_type text,
    created_at timestamp,
    description text,
    display_id bigint,
    impact text,
    "name" text,
    updated_at timestamp,
    usage_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (asset_type_id) REFERENCES asset_type(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (group_id) REFERENCES service_group(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE service_user (
    id bigint,
    location_id bigint,
    reporting_manager_id bigint,
    active boolean,
    address text,
    blocked boolean,
    created_at timestamp,
    first_name text,
    is_agent boolean,
    job_title text,
    language text,
    last_active_at timestamp,
    last_login_at timestamp,
    last_name text,
    mobile_phone_number text,
    occasional boolean,
    primary_email text,
    signature text,
    time_zone text,
    updated_at timestamp,
    vip_user boolean,
    work_phone_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (reporting_manager_id) REFERENCES service_user(id)
);

CREATE TABLE software (
    id bigint,
    managed_by_id bigint,
    publisher_id bigint,
    application_type text,
    category text,
    created_at timestamp,
    description text,
    installation_count bigint,
    "name" text,
    notes text,
    "status" text,
    updated_at timestamp,
    user_count bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (managed_by_id) REFERENCES service_user(id),
    FOREIGN KEY (publisher_id) REFERENCES vendor(id)
);

CREATE TABLE note (
    id bigint,
    parent_entity_id bigint,
    parent_entity_type text,
    user_id bigint,
    body text,
    body_text text,
    from_email text,
    PRIMARY KEY (id, parent_entity_id, parent_entity_type),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE business_hour (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE agent_role (
    agent_id bigint,
    role_id bigint,
    PRIMARY KEY (agent_id, role_id),
    FOREIGN KEY (agent_id) REFERENCES service_user(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE solution_article (
    id bigint,
    category_id bigint,
    folder_id bigint,
    modified_by bigint,
    user_id bigint,
    approval_status bigint,
    article_type integer,
    created_at timestamp,
    description text,
    description_text text,
    inserted_into_tickets integer,
    modified_at timestamp,
    "position" integer,
    review_date timestamp,
    "status" integer,
    thumbs_down integer,
    thumbs_up integer,
    title text,
    updated_at timestamp,
    url text,
    views integer,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES solution_category(id),
    FOREIGN KEY (folder_id) REFERENCES solution_folder(id),
    FOREIGN KEY (modified_by) REFERENCES service_user(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE conversation (
    id bigint,
    ticket_id bigint,
    user_id bigint,
    body text,
    body_text text,
    created_at timestamp,
    from_email text,
    incoming boolean,
    private boolean,
    "source" bigint,
    support_email text,
    updated_at timestamp,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES service_user(id)
);

CREATE TABLE software_license (
    id bigint,
    software_id bigint,
    contract_id text,
    created_time timestamp,
    updated_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (software_id) REFERENCES software(id)
);

CREATE TABLE asset_type (
    id bigint,
    parent_asset_type_id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    visible boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_asset_type_id) REFERENCES asset_type(id)
);

CREATE TABLE solution_category (
    id bigint,
    created_at timestamp,
    default_category boolean,
    description text,
    "name" text,
    "position" integer,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE solution_folder (
    id bigint,
    category_id bigint,
    created_at timestamp,
    default_folder boolean,
    description text,
    "name" text,
    "position" integer,
    updated_at timestamp,
    visibility integer,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES solution_category(id)
);
