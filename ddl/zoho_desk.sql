CREATE TABLE contact (
    id text,
    account_id text,
    layout_id text,
    owner_id text,
    city text,
    country text,
    created_time timestamp,
    customer_happiness_bad_percentage text,
    customer_happiness_good_percentage text,
    customer_happiness_ok_percentage text,
    description text,
    email text,
    facebook text,
    first_name text,
    is_anonymous text,
    is_end_user text,
    is_spam text,
    last_name text,
    mobile text,
    modified_time timestamp,
    phone text,
    photo_url text,
    secondary_email text,
    "state" text,
    street text,
    title text,
    twitter text,
    "type" text,
    web_url text,
    zip text,
    zoho_crm_contact text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id)
);

CREATE TABLE groups (
    id text,
    creator_id text,
    modifier_id text,
    count text,
    created_time timestamp,
    description text,
    help_center_id text,
    logo_url text,
    modified_time timestamp,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (modifier_id) REFERENCES users(id)
);

CREATE TABLE layout_profile (
    layout_id text,
    profile_id text,
    PRIMARY KEY (layout_id, profile_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE layout (
    id text,
    created_by_id text,
    department_id text,
    modified_by_id text,
    created_time text,
    has_logo text,
    is_default_layout text,
    is_standard_layout text,
    layout_desc text,
    layout_display_name text,
    layout_name text,
    modified_time text,
    module text,
    photo_url text,
    skip_dept_access_validation text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (modified_by_id) REFERENCES agent(id)
);

CREATE TABLE account (
    id text,
    layout_id text,
    owner_id text,
    annual_revenue text,
    city text,
    code text,
    country text,
    created_time timestamp,
    customer_happiness_bad_percentage text,
    customer_happiness_good_percentage text,
    customer_happiness_ok_percentage text,
    description text,
    email text,
    fax text,
    industry text,
    modified_time timestamp,
    "name" text,
    phone text,
    "state" text,
    street text,
    web_url text,
    website text,
    zoho_crm_account text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id)
);

CREATE TABLE product_department (
    department_id text,
    product_id text,
    PRIMARY KEY (department_id, product_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    created_by_id text,
    layout_id text,
    modified_by_id text,
    owner_id text,
    category text,
    code text,
    created_time timestamp,
    description text,
    manufacturer text,
    modified_time timestamp,
    "name" text,
    unit_price text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (modified_by_id) REFERENCES agent(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id)
);

CREATE TABLE ticket_approval (
    id text,
    approver_id text,
    requester_id text,
    ticket_id text,
    description text,
    processed_time text,
    requested_time text,
    "status" text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (approver_id) REFERENCES agent(id),
    FOREIGN KEY (requester_id) REFERENCES agent(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE label (
    id text,
    creator_id text,
    modifier_id text,
    count text,
    created_time timestamp,
    help_center_id text,
    logo_url text,
    modified_time timestamp,
    "name" text,
    preferences_bg_color text,
    preferences_shape text,
    preferences_text_color text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (modifier_id) REFERENCES users(id)
);

CREATE TABLE task (
    id text,
    assignee_id text,
    call_id text,
    contact_id text,
    creator_id text,
    department_id text,
    layout_id text,
    modified_by_id text,
    owner_id text,
    product_id text,
    team_id text,
    ticket_id text,
    activity_time text,
    category text,
    completed_time text,
    created_time timestamp,
    due_date text,
    is_commented text,
    is_spam text,
    is_trashed text,
    modified_time timestamp,
    priority text,
    "status" text,
    status_type text,
    subject text,
    web_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES agent(id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (creator_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (modified_by_id) REFERENCES agent(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_follower (
    id text,
    ticket_id text,
    email text,
    first_name text,
    following text,
    last_name text,
    photo_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE department (
    id text,
    agent_id text,
    chat_status text,
    created_time text,
    description text,
    has_logo text,
    is_assign_to_team_enabled text,
    is_default text,
    is_enabled text,
    is_visible_in_customer_portal text,
    "name" text,
    name_in_customer_portal text,
    sanitized_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE module (
    id text,
    api_key text,
    display_label text,
    is_enabled text,
    name_field text,
    plural_label text,
    singular_label text,
    PRIMARY KEY (id)
);

CREATE TABLE channel_content_type (
    content_type text,
    channel_id text,
    PRIMARY KEY (content_type, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel (
    id text,
    department_id text,
    accepts_replie text,
    app_name text,
    external_id text,
    mapped_integration text,
    "name" text,
    photo_url text,
    reply_config_accepts_attachment text,
    reply_config_include_quoted_message text,
    reply_config_update_record text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE users (
    id text,
    label_id text,
    email_address text,
    last_accessed_time text,
    "name" text,
    photo_url text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE contact_time_entry_owner (
    contact_time_entry_id text,
    owner_id text,
    PRIMARY KEY (contact_time_entry_id, owner_id),
    FOREIGN KEY (contact_time_entry_id) REFERENCES contact_time_entry(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id)
);

CREATE TABLE contact_time_entry (
    id text,
    agent_id text,
    contact_id text,
    created_by_id text,
    department_id text,
    layout_id text,
    owner_id text,
    request_id text,
    task_id text,
    additional_cost text,
    agent_cost_per_hour text,
    billing_type text,
    created_time timestamp,
    description text,
    executed_time text,
    fixed_cost text,
    hours_spent text,
    invoice_id text,
    is_billable text,
    is_trashed text,
    minutes_spent text,
    mode text,
    request_charge_type text,
    seconds_spent text,
    total_cost text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (request_id) REFERENCES task(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE "call" (
    id text,
    assignee_id text,
    contact_id text,
    creator_id text,
    department_id text,
    owner_id text,
    ticket_id text,
    activity_type text,
    category text,
    completed_time text,
    contact text,
    created_time timestamp,
    direction text,
    due_date text,
    is_commented text,
    is_spam text,
    priority text,
    start_time text,
    "status" text,
    subject text,
    team text,
    web_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES agent(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (creator_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE agent_time_entry_owner (
    agent_time_entry_id text,
    owner_id text,
    PRIMARY KEY (agent_time_entry_id, owner_id),
    FOREIGN KEY (agent_time_entry_id) REFERENCES agent_time_entry(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id)
);

CREATE TABLE agent_time_entry (
    id text,
    agent_id text,
    created_by_id text,
    creator_id text,
    department_id text,
    layout_id text,
    owner_id text,
    request_id text,
    task_id text,
    additional_cost text,
    agent_cost_per_hour text,
    billing_type text,
    created_time timestamp,
    description text,
    executed_time text,
    fixed_cost text,
    hours_spent text,
    invoice_id text,
    is_billable text,
    is_trashed text,
    minutes_spent text,
    mode text,
    request_charge_type text,
    seconds_spent text,
    total_cost text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (creator_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (request_id) REFERENCES task(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE contract_notification_agent (
    agent_id text,
    contract_id text,
    PRIMARY KEY (agent_id, contract_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract (
    id text,
    account_id text,
    created_by_id text,
    department_id text,
    modified_by_id text,
    owner_id text,
    product_id text,
    created_time text,
    description text,
    end_date text,
    modified_time timestamp,
    "name" text,
    notify_before text,
    notify_on text,
    number text,
    sla_id text,
    sla_name text,
    start_date text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (modified_by_id) REFERENCES agent(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE agent_associated_department (
    agent_id text,
    associated_department_id text,
    PRIMARY KEY (agent_id, associated_department_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (associated_department_id) REFERENCES department(id)
);

CREATE TABLE agent_channel (
    agent_id text,
    channel_id text,
    PRIMARY KEY (agent_id, channel_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE agent (
    id text,
    profile_id text,
    role_id text,
    about_info text,
    country_code text,
    email_id text,
    extn text,
    first_name text,
    is_confirmed text,
    lang_code text,
    last_name text,
    mobile text,
    "name" text,
    phone text,
    photo_url text,
    role_permission_type text,
    "status" text,
    time_zone text,
    zuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (profile_id) REFERENCES profile(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE organization (
    id text,
    alias text,
    city text,
    company_name text,
    country text,
    currency_code text,
    currency_locale text,
    currency_symbol text,
    description text,
    edition text,
    employee_count text,
    favicon_url text,
    fax text,
    is_admin_in_org text,
    is_default text,
    logo_url text,
    mobile text,
    phone_number text,
    portal_name text,
    portal_url text,
    primary_contact text,
    "state" text,
    street text,
    website text,
    zip text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE immediate_sub_role (
    role_id text,
    sub_role_id text,
    PRIMARY KEY (role_id, sub_role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (sub_role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    reports_to text,
    description text,
    is_default text,
    is_visible text,
    "name" text,
    share_data_with_peers text,
    PRIMARY KEY (id),
    FOREIGN KEY (reports_to) REFERENCES "role"(id)
);

CREATE TABLE profile (
    id text,
    defaults text,
    description text,
    is_visible text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_time_entry_owner (
    owner_id text,
    ticket_time_entry_id text,
    PRIMARY KEY (owner_id, ticket_time_entry_id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (ticket_time_entry_id) REFERENCES ticket_time_entry(id)
);

CREATE TABLE ticket_time_entry (
    id text,
    agent_id text,
    created_by_id text,
    department_id text,
    layout_id text,
    owner_id text,
    request_id text,
    ticket_id text,
    additional_cost text,
    agent_cost_per_hour text,
    billing_type text,
    created_time timestamp,
    description text,
    executed_time text,
    fixed_cost text,
    hours_spent text,
    invoice_id text,
    is_billable text,
    is_trashed text,
    minutes_spent text,
    mode text,
    request_charge_type text,
    seconds_spent text,
    total_cost text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (request_id) REFERENCES ticket(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE account_time_entry_owner (
    account_time_entry_id text,
    owner_id text,
    PRIMARY KEY (account_time_entry_id, owner_id),
    FOREIGN KEY (account_time_entry_id) REFERENCES account_time_entry(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id)
);

CREATE TABLE account_time_entry (
    id text,
    account_id text,
    agent_id text,
    created_by_id text,
    department_id text,
    layout_id text,
    owner_id text,
    request_id text,
    task_id text,
    additional_cost text,
    agent_cost_per_hour text,
    billing_type text,
    created_time timestamp,
    description text,
    executed_time text,
    fixed_cost text,
    hours_spent text,
    invoice_id text,
    is_billable text,
    is_trashed text,
    minutes_spent text,
    mode text,
    request_charge_type text,
    seconds_spent text,
    total_cost text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (request_id) REFERENCES task(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE ticket_comment_attachment (
    id text,
    ticket_comment_id text,
    href text,
    "name" text,
    "size" text,
    PRIMARY KEY (id, ticket_comment_id),
    FOREIGN KEY (ticket_comment_id) REFERENCES ticket_comment(id)
);

CREATE TABLE ticket_comment_mention (
    id text,
    ticket_comment_id text,
    email text,
    first_name text,
    last_name text,
    length text,
    "name" text,
    offsets text,
    photo_url text,
    "type" text,
    zuid text,
    PRIMARY KEY (id, ticket_comment_id),
    FOREIGN KEY (ticket_comment_id) REFERENCES ticket_comment(id)
);

CREATE TABLE ticket_comment (
    id text,
    agent_id text,
    ticket_id text,
    commented_time text,
    content text,
    content_type text,
    is_public text,
    modified_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_shared_department (
    department_id text,
    ticket_id text,
    PRIMARY KEY (department_id, ticket_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_secondary_contact (
    contact_id text,
    ticket_id text,
    PRIMARY KEY (contact_id, ticket_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_entity_skill (
    skill_id text,
    ticket_id text,
    PRIMARY KEY (skill_id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    account_id text,
    agent_id text,
    channel_id text,
    contact_id text,
    created_by_id text,
    department_id text,
    last_thread_channel_id text,
    layout_id text,
    modified_by_id text,
    product_id text,
    team_id text,
    category text,
    classification text,
    closed_time text,
    created_time timestamp,
    customer_response_time text,
    description text,
    due_date text,
    email text,
    is_archived text,
    is_escalated text,
    is_over_due text,
    is_read text,
    is_spam text,
    languages text,
    modified_time timestamp,
    number text,
    onhold_time text,
    phone text,
    priority text,
    resolution text,
    response_due_date text,
    sentiment text,
    sla_id text,
    source_app_name text,
    source_app_photo_url text,
    source_ext_id text,
    source_permanent_link text,
    source_type text,
    "status" text,
    status_type text,
    sub_category text,
    subject text,
    web_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES agent(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (last_thread_channel_id) REFERENCES channel(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (modified_by_id) REFERENCES agent(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_derived_agent (
    derived_agent_id text,
    team_id text,
    PRIMARY KEY (derived_agent_id, team_id),
    FOREIGN KEY (derived_agent_id) REFERENCES agent(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_agent (
    agent_id text,
    team_id text,
    PRIMARY KEY (agent_id, team_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_role (
    role_id text,
    team_id text,
    PRIMARY KEY (role_id, team_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_role_with_subordinate (
    subordinate text,
    team_id text,
    PRIMARY KEY (subordinate, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_sub_team (
    sub_team_id text,
    team_id text,
    PRIMARY KEY (sub_team_id, team_id),
    FOREIGN KEY (sub_team_id) REFERENCES team(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    department_id text,
    description text,
    logo_url text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE task_time_entry_owner (
    owner_id text,
    task_time_entry_id text,
    PRIMARY KEY (owner_id, task_time_entry_id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (task_time_entry_id) REFERENCES task_time_entry(id)
);

CREATE TABLE task_time_entry (
    id text,
    agent_id text,
    created_by_id text,
    department_id text,
    layout_id text,
    owner_id text,
    request_id text,
    task_id text,
    additional_cost text,
    agent_cost_per_hour text,
    billing_type text,
    created_time timestamp,
    description text,
    executed_time text,
    fixed_cost text,
    hours_spent text,
    invoice_id text,
    is_billable text,
    is_trashed text,
    minutes_spent text,
    mode text,
    request_charge_type text,
    seconds_spent text,
    total_cost text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (layout_id) REFERENCES layout(id),
    FOREIGN KEY (owner_id) REFERENCES agent(id),
    FOREIGN KEY (request_id) REFERENCES task(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);
