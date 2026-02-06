CREATE TABLE user_project (
    project_id text,
    user_id text,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE assignable (
    id text,
    owner_id text,
    parent_id text,
    project_state_id text,
    client text,
    created_at text,
    deleted_at timestamp,
    description text,
    ends_at text,
    guid text,
    "name" text,
    phase_name text,
    secure_url text,
    secure_url_expiration text,
    settings text,
    starts_at text,
    thumbnail text,
    time_entry_lockout text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES assignable(id),
    FOREIGN KEY (project_state_id) REFERENCES project(state_id)
);

CREATE TABLE custom_field (
    id text,
    created_at text,
    data_type text,
    default_value text,
    description text,
    is_editable_only_by_admins text,
    is_visible_as_filter text,
    is_visible_on_info_page text,
    "name" text,
    namespace text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_option (
    _fivetran_id text,
    custom_field_id text,
    "option" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE approval (
    id text,
    approvable_id text,
    approvee_user_id text,
    approver_user_id text,
    approvable_type text,
    approved_at text,
    created_at text,
    "status" text,
    submitted_at text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (approvable_id) REFERENCES project_expense_item(id),
    FOREIGN KEY (approvee_user_id) REFERENCES users(id),
    FOREIGN KEY (approver_user_id) REFERENCES users(id)
);

CREATE TABLE "role" (
    id text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE phase (
    id text,
    owner_id text,
    project_id text,
    archived text,
    archived_at text,
    client text,
    created_at text,
    deleted_at text,
    description text,
    ends_at text,
    guid text,
    has_pending_updates text,
    "name" text,
    phase_name text,
    secure_url text,
    secure_url_expiration text,
    settings text,
    starts_at text,
    thumbnail text,
    time_entry_lockout text,
    "type" text,
    updated_at timestamp,
    use_parent_bill_rates text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "status" (
    id text,
    assignable_id text,
    user_id text,
    created_at text,
    current_task text,
    ends text,
    message text,
    "start" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE time_entry (
    id text,
    assignable_id text,
    bill_rate_id text,
    user_id text,
    created_at text,
    "date" text,
    hours text,
    is_suggestion text,
    note text,
    scheduled_hours text,
    task text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id),
    FOREIGN KEY (bill_rate_id) REFERENCES bill_rate(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE discipline (
    id text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE status_option (
    id text,
    color text,
    created_at text,
    deleted_at timestamp,
    label text,
    orders text,
    stage text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE assignment (
    id text,
    assignable_id text,
    bill_rate_id text,
    status_option_id text,
    user_id text,
    all_day_assignment text,
    allocation_mode text,
    created_at text,
    description text,
    ends_at text,
    hours_per_day text,
    note text,
    repetition_id text,
    resource_request_id text,
    starts_at text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id),
    FOREIGN KEY (bill_rate_id) REFERENCES bill_rate(id),
    FOREIGN KEY (status_option_id) REFERENCES status_option(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE bill_rate (
    id text,
    assignable_id text,
    discipline_id text,
    role_id text,
    user_id text,
    created_at text,
    ends_at text,
    rate text,
    starts_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id),
    FOREIGN KEY (discipline_id) REFERENCES discipline(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE project_custom_field_value (
    id text,
    project_id text,
    custom_field_id text,
    created_at text,
    updated_at text,
    "value" jsonb,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE project_budget_item (
    id text,
    project_id text,
    assignable_id text,
    assignable_parent_id text,
    amount text,
    category text,
    created_at text,
    per_item_amount text,
    per_item_label text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id),
    FOREIGN KEY (assignable_parent_id) REFERENCES assignable(id)
);

CREATE TABLE project_tag (
    id text,
    project_id text,
    "value" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    owner_id text,
    parent_id text,
    approved_dollars text,
    approved_hours text,
    archived text,
    archived_at text,
    bounding_end_date text,
    bounding_end_date_assignables text,
    bounding_end_date_assignments text,
    bounding_end_date_expense_items text,
    bounding_end_date_time_entries text,
    bounding_start_date text,
    bounding_start_date_assignables text,
    bounding_start_date_assignments text,
    bounding_start_date_expense_items text,
    bounding_start_date_time_entries text,
    client text,
    code text,
    confirmed_dollars text,
    confirmed_hours text,
    created_at text,
    deleted_at timestamp,
    description text,
    employee_number text,
    ends_at text,
    future_dollars text,
    future_hours text,
    guid text,
    has_pending_updates text,
    "name" text,
    scheduled_dollars text,
    scheduled_hours text,
    secure_url text,
    secure_url_expiration text,
    settings text,
    starts_at text,
    "state" text,
    state_id text,
    thumbnail text,
    time_entry_lockout text,
    "type" text,
    unconfirmed_dollars text,
    unconfirmed_hours text,
    updated_at timestamp,
    use_parent_bill_rates text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES project(id)
);

CREATE TABLE project_expense_item (
    id text,
    project_id text,
    assignable_id text,
    amount text,
    category text,
    created_at text,
    "date" text,
    note text,
    updated_at text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id)
);

CREATE TABLE report (
    _fivetran_id text,
    project_id text,
    user_id text,
    "date" text,
    difference_from_past_scheduled_hours text,
    future_scheduled_hours text,
    incurred_hours text,
    leave_type text,
    scheduled_hours text,
    total_hours text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE placeholder_resource_assignment (
    assignment_id text,
    placeholder_resource_id text,
    PRIMARY KEY (assignment_id, placeholder_resource_id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(id),
    FOREIGN KEY (placeholder_resource_id) REFERENCES placeholder_resource(id)
);

CREATE TABLE placeholder_resource_custom_field_value (
    id text,
    placeholder_resource_id text,
    custom_field_id text,
    created_at text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, placeholder_resource_id),
    FOREIGN KEY (placeholder_resource_id) REFERENCES placeholder_resource(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE placeholder_resource (
    id text,
    user_type_id text,
    abbreviation text,
    bill_rate text,
    color text,
    created_at text,
    discipline text,
    display_name text,
    guid text,
    location text,
    "role" text,
    thumbnail text,
    title text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_type_id) REFERENCES users(type_id)
);

CREATE TABLE user_expense_item (
    id text,
    user_id text,
    assignable_id text,
    amount text,
    category text,
    created_at text,
    "date" text,
    note text,
    updated_at text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (assignable_id) REFERENCES assignable(id)
);

CREATE TABLE user_custom_field_value (
    id text,
    user_id text,
    custom_field_id text,
    created_at text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE user_availability (
    id text,
    user_id text,
    created_at text,
    day_0 text,
    day_1 text,
    day_2 text,
    day_3 text,
    day_4 text,
    day_5 text,
    day_6 text,
    ends_at text,
    starts_at text,
    updated_at text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_tag (
    id text,
    user_id text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    account_owner text,
    archived text,
    archived_at text,
    bill_rate text,
    billability_target text,
    billable text,
    created_at text,
    deleted text,
    deleted_at text,
    discipline text,
    display_name text,
    email text,
    first_name text,
    guid text,
    has_login text,
    hire_date text,
    invitation_pending text,
    last_login_time text,
    last_name text,
    license_type text,
    location text,
    location_id text,
    login_type text,
    mobile_phone text,
    office_phone text,
    "role" text,
    settings text,
    termination_date text,
    thumbnail text,
    "type" text,
    type_id text,
    updated_at timestamp,
    PRIMARY KEY (id)
);
