CREATE TABLE booking_daily_allocation (
    "date" text,
    booking_allocation_booking_id text,
    booking_allocation_index text,
    effort_minutes text,
    PRIMARY KEY ("date", booking_allocation_booking_id, booking_allocation_index),
    FOREIGN KEY (booking_allocation_booking_id) REFERENCES booking_allocation(booking_id),
    FOREIGN KEY (booking_allocation_index) REFERENCES booking_allocation("index")
);

CREATE TABLE booking_allocation (
    "index" text,
    booking_id text,
    user_id text,
    mode text,
    placeholder_id text,
    total_effort double precision,
    PRIMARY KEY ("index", booking_id),
    FOREIGN KEY (booking_id) REFERENCES booking(id),
    FOREIGN KEY (user_id) REFERENCES contact(id)
);

CREATE TABLE booking (
    id text,
    folder_id text,
    placeholder_id text,
    responsible_id text,
    booking_duration double precision,
    booking_finish_date text,
    booking_start_date text,
    booking_work_on_weekends boolean,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder_project(id),
    FOREIGN KEY (placeholder_id) REFERENCES placeholder(id),
    FOREIGN KEY (responsible_id) REFERENCES contact(id)
);

CREATE TABLE job_role (
    id text,
    is_deleted boolean,
    short_title text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE access_role (
    id text,
    description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE space_task_dependency_id (
    "index" text,
    space_task_id text,
    dependency_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_super_parent_id (
    "index" text,
    space_task_id text,
    super_parent_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_sub_task_id (
    "index" text,
    space_task_id text,
    sub_task_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_super_task_id (
    "index" text,
    space_task_id text,
    space_super_task_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_parent_id (
    "index" text,
    space_task_id text,
    parent_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_responsible_id (
    "index" text,
    space_task_id text,
    responsible_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_responsible_placeholder_id (
    "index" text,
    space_task_id text,
    responsible_placeholder_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_author_id (
    "index" text,
    space_task_id text,
    author_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_follower_id (
    "index" text,
    space_task_id text,
    follower_id text,
    PRIMARY KEY ("index", space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task_custom_field (
    id text,
    space_task_id text,
    "value" text,
    PRIMARY KEY (id, space_task_id),
    FOREIGN KEY (space_task_id) REFERENCES space_task(id)
);

CREATE TABLE space_task (
    id text,
    account_id text,
    attachment_count text,
    billing_type text,
    brief_description text,
    completed_date text,
    created_date text,
    date_type text,
    description text,
    due_date text,
    duration text,
    effort_allocation_allocated_effort text,
    effort_allocation_daily_allocation_percentage text,
    effort_allocation_mode text,
    effort_allocation_total_effort text,
    followed_by_me text,
    has_attachment text,
    importance text,
    permalink text,
    priority text,
    recurrent text,
    responsible_allocation jsonb,
    scope text,
    shared_id jsonb,
    start_date text,
    "status" text,
    title text,
    updated_date text,
    work_on_weekend text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES space(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE space_member (
    contact_id text,
    space_id text,
    access_role_id text,
    is_manager boolean,
    PRIMARY KEY (contact_id, space_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (access_role_id) REFERENCES access_role(id)
);

CREATE TABLE space_project_workflow (
    space_id text,
    workflow_id text,
    PRIMARY KEY (space_id, workflow_id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE space_task_workflow (
    space_id text,
    workflow_id text,
    PRIMARY KEY (space_id, workflow_id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE space (
    id text,
    default_project_workflow_id text,
    default_task_workflow_id text,
    guest_role_id text,
    access_type text,
    archived boolean,
    description text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_project_workflow_id) REFERENCES workflow(id),
    FOREIGN KEY (default_task_workflow_id) REFERENCES workflow(id),
    FOREIGN KEY (guest_role_id) REFERENCES access_role(id)
);

CREATE TABLE folder_finance (
    id text,
    actual_cost text,
    actual_fees text,
    budget text,
    currency text,
    planned_cost text,
    planned_fees text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES folder_project(id)
);

CREATE TABLE contact_member (
    contact_id text,
    member_id text,
    PRIMARY KEY (contact_id, member_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (member_id) REFERENCES contact(id)
);

CREATE TABLE contact_profile (
    account_id text,
    contact_id text,
    "admin" boolean,
    email text,
    external boolean,
    owner boolean,
    "role" text,
    PRIMARY KEY (account_id, contact_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    job_role_id text,
    work_schedule_id text,
    company_name text,
    current_bill_rate_source text,
    current_bill_rate_value double precision,
    current_cost_rate_source text,
    current_cost_rate_value double precision,
    deleted boolean,
    first_name text,
    last_name text,
    locale text,
    location text,
    me boolean,
    my_team boolean,
    phone text,
    timezone text,
    title text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (job_role_id) REFERENCES job_role(id),
    FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
);

CREATE TABLE custom_item_type (
    id text,
    space_id text,
    description text,
    related_type text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE timelog_category (
    id text,
    hidden boolean,
    "name" text,
    orders integer,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_custom_status (
    id text,
    workflow_id text,
    groups text,
    hidden boolean,
    "name" text,
    standard boolean,
    standard_name boolean,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    space_id text,
    hidden boolean,
    "name" text,
    standard boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE invitation (
    id text,
    account_id text,
    inviter_id text,
    external boolean,
    invitation_date timestamp,
    resolved_date timestamp,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (inviter_id) REFERENCES contact(id)
);

CREATE TABLE user_schedule_exception (
    id text,
    contact_id text,
    exclusion_type text,
    from_date text,
    is_work_days text,
    to_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE folder_task_dependency_id (
    "index" text,
    folder_task_id text,
    dependency_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_super_parent_id (
    "index" text,
    folder_task_id text,
    super_parent_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_sub_task_id (
    "index" text,
    folder_task_id text,
    sub_task_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_super_task_id (
    "index" text,
    folder_task_id text,
    folder_super_task_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_parent_id (
    "index" text,
    folder_task_id text,
    parent_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_responsible_id (
    "index" text,
    folder_task_id text,
    responsible_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_responsible_placeholder_id (
    "index" text,
    folder_task_id text,
    responsible_placeholder_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_author_id (
    "index" text,
    folder_task_id text,
    author_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_follower_id (
    "index" text,
    folder_task_id text,
    follower_id text,
    PRIMARY KEY ("index", folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task_custom_field (
    id text,
    folder_task_id text,
    "value" text,
    PRIMARY KEY (id, folder_task_id),
    FOREIGN KEY (folder_task_id) REFERENCES folder_task(id)
);

CREATE TABLE folder_task (
    id text,
    account_id text,
    attachment_count text,
    billing_type text,
    brief_description text,
    completed_date text,
    created_date text,
    date_type text,
    description text,
    due_date text,
    duration text,
    effort_allocation_allocated_effort text,
    effort_allocation_daily_allocation_percentage text,
    effort_allocation_mode text,
    effort_allocation_total_effort text,
    finance_actual_cost text,
    finance_actual_fees text,
    finance_currency text,
    finance_planned_cost text,
    finance_planned_fees text,
    followed_by_me text,
    has_attachment text,
    importance text,
    permalink text,
    priority text,
    recurrent text,
    responsible_allocation jsonb,
    scope text,
    shared_id jsonb,
    start_date text,
    "status" text,
    title text,
    updated_date text,
    work_on_weekends text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES folder_project(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE folder_project_owner (
    folder_project_id text,
    owner_id text,
    PRIMARY KEY (folder_project_id, owner_id),
    FOREIGN KEY (folder_project_id) REFERENCES folder_project(id),
    FOREIGN KEY (owner_id) REFERENCES contact(id)
);

CREATE TABLE folder_project_child (
    child_id text,
    folder_project_id text,
    PRIMARY KEY (child_id, folder_project_id),
    FOREIGN KEY (child_id) REFERENCES folder_project(id),
    FOREIGN KEY (folder_project_id) REFERENCES folder_project(id)
);

CREATE TABLE folder_project_share (
    folder_project_id text,
    shared_id text,
    PRIMARY KEY (folder_project_id, shared_id),
    FOREIGN KEY (folder_project_id) REFERENCES folder_project(id),
    FOREIGN KEY (shared_id) REFERENCES contact(id)
);

CREATE TABLE folder_project_parent (
    folder_project_id text,
    parent_id text,
    PRIMARY KEY (folder_project_id, parent_id),
    FOREIGN KEY (folder_project_id) REFERENCES folder_project(id),
    FOREIGN KEY (parent_id) REFERENCES folder_project(id)
);

CREATE TABLE folder_project_super_parent (
    folder_project_id text,
    super_parent_id text,
    PRIMARY KEY (folder_project_id, super_parent_id),
    FOREIGN KEY (folder_project_id) REFERENCES folder_project(id),
    FOREIGN KEY (super_parent_id) REFERENCES folder_project(id)
);

CREATE TABLE folder_project_custom_field (
    custom_column_id text,
    folder_project_id text,
    custom_field_value text,
    PRIMARY KEY (custom_column_id, folder_project_id),
    FOREIGN KEY (custom_column_id) REFERENCES custom_field(id),
    FOREIGN KEY (folder_project_id) REFERENCES folder_project(id)
);

CREATE TABLE folder_project (
    id text,
    account_id text,
    project_author_id text,
    project_custom_status_id text,
    workflow_id text,
    attachment_count text,
    created_date timestamp,
    description text,
    has_attachment boolean,
    permalink text,
    project_completed_date timestamp,
    project_contract_type text,
    project_created_date timestamp,
    project_end_date text,
    project_owner_id jsonb,
    project_start_date text,
    project_status text,
    scope text,
    space boolean,
    title text,
    updated_date timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (project_author_id) REFERENCES contact(id),
    FOREIGN KEY (project_custom_status_id) REFERENCES workflow_custom_status(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workweek_schedule (
    _fivetran_id text,
    work_schedule_id text,
    capacity_minutes text,
    work_day jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
);

CREATE TABLE user_work_schedule (
    user_id text,
    work_schedule_id text,
    PRIMARY KEY (user_id, work_schedule_id),
    FOREIGN KEY (user_id) REFERENCES contact(id),
    FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
);

CREATE TABLE work_schedule (
    id text,
    schedule_type text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE attachment_review (
    review_id text,
    attachment_id text,
    PRIMARY KEY (review_id, attachment_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE attachment (
    id text,
    author_id text,
    comment_id text,
    current_attachment_id text,
    folder_id text,
    task_id text,
    content_type text,
    created_date timestamp,
    "name" text,
    "type" text,
    version double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES contact(id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (current_attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (folder_id) REFERENCES folder_project(id),
    FOREIGN KEY (task_id) REFERENCES space_task(id)
);

CREATE TABLE placeholder (
    id text,
    job_role_id text,
    deleted boolean,
    short_title text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_role_id) REFERENCES job_role(id)
);

CREATE TABLE custom_field_share (
    custom_field_id text,
    share_id text,
    PRIMARY KEY (custom_field_id, share_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (share_id) REFERENCES contact(id)
);

CREATE TABLE custom_field_contact (
    contact_id text,
    custom_field_id text,
    PRIMARY KEY (contact_id, custom_field_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    account_id text,
    space_id text,
    setting_aggregation text,
    setting_allow_other_values boolean,
    setting_allow_time boolean,
    setting_currency text,
    setting_decimal_places double precision,
    setting_inheritance_type text,
    setting_read_only boolean,
    setting_timezone text,
    setting_use_thousands_separator boolean,
    setting_values jsonb,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE approval_attachment (
    approval_id text,
    attachment_id text,
    PRIMARY KEY (approval_id, attachment_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE approval_decision (
    approval_id text,
    approver_id text,
    "comment" text,
    "status" text,
    updated_date timestamp,
    PRIMARY KEY (approval_id, approver_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (approver_id) REFERENCES contact(id)
);

CREATE TABLE approval (
    id text,
    author_id text,
    finisher_id text,
    folder_id text,
    task_id text,
    auto_finish_on_approve boolean,
    auto_finish_on_reject boolean,
    description text,
    due_date text,
    finished boolean,
    review_id text,
    "status" text,
    title text,
    "type" text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES contact(id),
    FOREIGN KEY (finisher_id) REFERENCES contact(id),
    FOREIGN KEY (folder_id) REFERENCES folder_project(id),
    FOREIGN KEY (task_id) REFERENCES folder_task(id)
);

CREATE TABLE parent_group (
    group_id text,
    parent_id text,
    PRIMARY KEY (group_id, parent_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (parent_id) REFERENCES contact(id)
);

CREATE TABLE child_group (
    child_id text,
    group_id text,
    PRIMARY KEY (child_id, group_id),
    FOREIGN KEY (child_id) REFERENCES contact(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE member_group (
    group_id text,
    member_id text,
    PRIMARY KEY (group_id, member_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES contact(id)
);

CREATE TABLE groups (
    id text,
    account_id text,
    my_team boolean,
    title text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE timelog (
    id text,
    category_id text,
    task_id text,
    user_id text,
    billing_type text,
    created_date timestamp,
    finance_actual_cost double precision,
    finance_actual_fees double precision,
    finance_currency text,
    hours double precision,
    tracked_date text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES timelog_category(id),
    FOREIGN KEY (task_id) REFERENCES space_task(id),
    FOREIGN KEY (user_id) REFERENCES contact(id)
);

CREATE TABLE "comment" (
    id text,
    author_id text,
    folder_id text,
    task_id text,
    created_date timestamp,
    direction text,
    email_subject text,
    external_requester_first_name text,
    external_requester_id text,
    external_requester_last_name text,
    text text,
    "type" text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES contact(id),
    FOREIGN KEY (folder_id) REFERENCES folder_project(id),
    FOREIGN KEY (task_id) REFERENCES space_task(id)
);

CREATE TABLE account_custom_field (
    account_id text,
    custom_field_id text,
    PRIMARY KEY (account_id, custom_field_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE account_workday (
    workday text,
    account_id text,
    PRIMARY KEY (workday, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    recycle_bin_id text,
    root_folder_id text,
    created_date timestamp,
    date_format text,
    first_day_of_week text,
    joined_date timestamp,
    "name" text,
    subscription_paid boolean,
    subscription_suspended boolean,
    subscription_type text,
    subscription_user_limit double precision,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (recycle_bin_id) REFERENCES folder_project(id),
    FOREIGN KEY (root_folder_id) REFERENCES folder_project(id)
);
