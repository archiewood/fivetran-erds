CREATE TABLE worklog_attribute_value (
    _fivetran_id text,
    "key" text,
    worklog_worklog_id bigint,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY ("key") REFERENCES work_attribute("key"),
    FOREIGN KEY (worklog_worklog_id) REFERENCES worklog(worklog_id)
);

CREATE TABLE worklog (
    worklog_id bigint,
    author_account_id text,
    billable_seconds bigint,
    created_at timestamp,
    description text,
    issue_id bigint,
    issue_key text,
    jira_worklog_id bigint,
    start_date text,
    start_time text,
    time_spent_seconds bigint,
    updated_at timestamp,
    PRIMARY KEY (worklog_id)
);

CREATE TABLE workload_scheme_day (
    _fivetran_id text,
    workload_scheme_id bigint,
    "day" text,
    required_seconds bigint,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (workload_scheme_id) REFERENCES workload_scheme(id)
);

CREATE TABLE workload_scheme (
    id bigint,
    default_scheme boolean,
    description text,
    member_count bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE global_configuration (
    _fivetran_id text,
    allow_logging_on_closed_account boolean,
    approval_period text,
    approval_week_start bigint,
    max_hours_per_day_per_user bigint,
    number_of_days_allowed_into_future bigint,
    remaining_estimate_optional boolean,
    week_start bigint,
    worklog_description_optional boolean,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE plan_period_value (
    _fivetran_id text,
    plan_id bigint,
    "from" text,
    planned_seconds bigint,
    "to" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (plan_id) REFERENCES plan(id)
);

CREATE TABLE planned_time_day_value (
    _fivetran_id text,
    plan_id bigint,
    "date" text,
    planned_seconds bigint,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (plan_id) REFERENCES plan(id)
);

CREATE TABLE plan (
    id bigint,
    account_id bigint,
    assignee_id text,
    assignee_type text,
    description text,
    end_date text,
    include_non_working_days boolean,
    period_count bigint,
    plan_approval_account_id text,
    plan_approval_status text,
    plan_item_id integer,
    plan_item_type text,
    planned_seconds_per_day bigint,
    planned_time_day_count bigint,
    recurrence_end_date text,
    rule text,
    start_date text,
    total_planned_seconds_in_scope bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE "role" (
    id bigint,
    "default" boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE account (
    id bigint,
    customer_id bigint,
    category_id bigint,
    category_key text,
    category_name text,
    category_type_name text,
    contact_account_id text,
    contact_type text,
    global boolean,
    "key" text,
    lead_account_id text,
    monthly_budget bigint,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE permission_access_entity (
    id bigint,
    permission_role_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (permission_role_id) REFERENCES permission_role(id)
);

CREATE TABLE permission (
    "key" text,
    permission_role_id bigint,
    PRIMARY KEY ("key"),
    FOREIGN KEY (permission_role_id) REFERENCES permission_role(id)
);

CREATE TABLE permission_role (
    id bigint,
    access_type text,
    editable boolean,
    "name" text,
    permitted_account_id text,
    PRIMARY KEY (id)
);

CREATE TABLE holiday (
    id bigint,
    scheme_id bigint,
    "date" text,
    description text,
    duration_seconds bigint,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (scheme_id) REFERENCES holiday_scheme(id)
);

CREATE TABLE work_attribute (
    "key" text,
    "name" text,
    required boolean,
    some_value text,
    "type" text,
    values jsonb,
    PRIMARY KEY ("key")
);

CREATE TABLE customer (
    id bigint,
    "key" text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE holiday_scheme (
    id bigint,
    default_scheme boolean,
    description text,
    member_count bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE generic_resource (
    id bigint,
    team_id bigint,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE global_permission_access_entity (
    id bigint,
    global_permission_role_id bigint,
    PRIMARY KEY (id, global_permission_role_id),
    FOREIGN KEY (global_permission_role_id) REFERENCES global_permission_role(id)
);

CREATE TABLE global_permission (
    "key" text,
    global_permission_role_id bigint,
    PRIMARY KEY ("key", global_permission_role_id),
    FOREIGN KEY (global_permission_role_id) REFERENCES global_permission_role(id)
);

CREATE TABLE global_permitted_user (
    account_id text,
    global_permission_role_id bigint,
    PRIMARY KEY (account_id, global_permission_role_id),
    FOREIGN KEY (global_permission_role_id) REFERENCES global_permission_role(id)
);

CREATE TABLE global_permission_role (
    id bigint,
    access_type text,
    editable boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_membership (
    id bigint,
    role_id bigint,
    team_id bigint,
    commitment_percent bigint,
    "from" text,
    member_account_id text,
    "to" text,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE workload_member (
    _fivetran_id text,
    workload_scheme_id bigint,
    account_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (workload_scheme_id) REFERENCES workload_scheme(id)
);

CREATE TABLE timesheet_approval (
    _fivetran_id text,
    team_id bigint,
    period_from text,
    period_to text,
    required_seconds bigint,
    reviewer_account_id text,
    status_account_id text,
    status_comment text,
    status_key text,
    status_required_seconds_at_submit bigint,
    status_time_spent_seconds_at_submit bigint,
    status_updated_at timestamp,
    time_spent_seconds bigint,
    user_account_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE holiday_member (
    _fivetran_id text,
    holiday_scheme_id bigint,
    account_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (holiday_scheme_id) REFERENCES holiday_scheme(id)
);

CREATE TABLE team (
    id bigint,
    program_id bigint,
    lead_account_id text,
    "name" text,
    summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE user_schedule (
    _fivetran_id text,
    holiday_id bigint,
    scheme_id bigint,
    "date" text,
    required_seconds bigint,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (holiday_id) REFERENCES holiday(id),
    FOREIGN KEY (scheme_id) REFERENCES holiday_scheme(id)
);

CREATE TABLE timesheet_reviewer (
    _fivetran_id text,
    account_id bigint,
    account_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE program_team_value (
    program_id bigint,
    team_id bigint,
    PRIMARY KEY (program_id, team_id),
    FOREIGN KEY (program_id) REFERENCES program(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE program (
    id bigint,
    manager_account_id text,
    "name" text,
    PRIMARY KEY (id)
);
