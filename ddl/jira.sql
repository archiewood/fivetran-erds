CREATE TABLE asset_object_schema (
    id integer,
    workspace_id text,
    can_manage boolean,
    created timestamp,
    description text,
    "key" text,
    "name" text,
    "status" text,
    updated timestamp,
    PRIMARY KEY (id, workspace_id)
);

CREATE TABLE security_level (
    id integer,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE asset_object_type_attribute_object (
    value_index integer,
    workspace_id text,
    object_id integer,
    object_type_attribute_id integer,
    display_value text,
    referenced_type boolean,
    search_value text,
    "value" text,
    PRIMARY KEY (value_index, workspace_id, object_id, object_type_attribute_id),
    FOREIGN KEY (object_id) REFERENCES asset_object(id),
    FOREIGN KEY (object_type_attribute_id) REFERENCES asset_object_type_attribute(id)
);

CREATE TABLE asset_schema_status (
    id integer,
    workspace_id text,
    schema_id integer,
    category integer,
    description text,
    "name" text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (schema_id) REFERENCES asset_object_schema(id)
);

CREATE TABLE project (
    id integer,
    lead_id text,
    permission_scheme_id integer,
    project_category_id integer,
    description text,
    "key" text,
    "name" text,
    project_type_key text,
    simplified boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (lead_id) REFERENCES "user"(id),
    FOREIGN KEY (permission_scheme_id) REFERENCES permission_scheme(id),
    FOREIGN KEY (project_category_id) REFERENCES project_category(id)
);

CREATE TABLE epic (
    id integer,
    done boolean,
    "key" text,
    "name" text,
    summary text,
    PRIMARY KEY (id)
);

CREATE TABLE service (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE issue_property (
    "key" text,
    issue_id integer,
    self text,
    "value" text,
    PRIMARY KEY ("key", issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE request_comment (
    id integer,
    request_id integer,
    author_id text,
    body text,
    created timestamp,
    public boolean,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(issue_id),
    FOREIGN KEY (author_id) REFERENCES "user"(id)
);

CREATE TABLE issue_watcher (
    issue_id integer,
    user_id text,
    PRIMARY KEY (issue_id, user_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE issue_field_history (
    "time" timestamp,
    field_id text,
    issue_id integer,
    author_id text,
    is_active boolean,
    "value" text,
    PRIMARY KEY ("time", field_id, issue_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (author_id) REFERENCES "user"(id)
);

CREATE TABLE team (
    id text,
    is_shared boolean,
    is_visible boolean,
    "name" text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE asset_object_issue (
    workspace_id text,
    issue_id integer,
    object_id integer,
    PRIMARY KEY (workspace_id, issue_id, object_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (object_id) REFERENCES asset_object(id)
);

CREATE TABLE "comment" (
    id integer,
    author_id text,
    issue_id integer,
    update_author_id text,
    body text,
    created timestamp,
    is_public boolean,
    updated timestamp,
    visibility_identifier text,
    visibility_type text,
    visibility_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (update_author_id) REFERENCES "user"(id)
);

CREATE TABLE organization (
    id integer,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE field_option (
    id integer,
    parent_id integer,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES field_option(id)
);

CREATE TABLE issue_board (
    board_id integer,
    issue_id integer,
    PRIMARY KEY (board_id, issue_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE request (
    issue_id integer,
    request_type_id integer,
    link text,
    service_desk_id integer,
    PRIMARY KEY (issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (request_type_id) REFERENCES request_type(id)
);

CREATE TABLE resolution (
    id integer,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE sprint (
    id integer,
    board_id integer,
    activated_date timestamp,
    complete_date timestamp,
    end_date timestamp,
    goal text,
    "name" text,
    start_date timestamp,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE "user" (
    id text,
    email text,
    is_active boolean,
    locale text,
    "name" text,
    time_zone text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE project_role_actor (
    id integer,
    group_name text,
    project_id integer,
    project_role_id integer,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_name) REFERENCES user_group(user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (project_role_id) REFERENCES project_role(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE issue_form (
    id text,
    issue_id integer,
    form_template_id text,
    internal boolean,
    lock boolean,
    "name" text,
    state_answers text,
    state_status text,
    state_visibility text,
    submitted boolean,
    updated timestamp,
    -- design_* (dynamic column),
    PRIMARY KEY (id, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE project_role (
    id integer,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE sprint_board (
    board_id integer,
    sprint_id integer,
    PRIMARY KEY (board_id, sprint_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (sprint_id) REFERENCES sprint(id)
);

CREATE TABLE version (
    id integer,
    project_id integer,
    archived boolean,
    description text,
    driver text,
    "name" text,
    overdue boolean,
    release_date text,
    released boolean,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "status" (
    id integer,
    status_category_id integer,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (status_category_id) REFERENCES status_category(id)
);

CREATE TABLE asset_object_type (
    id integer,
    workspace_id text,
    schema_id integer,
    abstract_object_type boolean,
    created timestamp,
    description text,
    inherited boolean,
    "name" text,
    parent_id integer,
    parent_object_type_inherited boolean,
    "position" integer,
    "type" integer,
    updated timestamp,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (schema_id) REFERENCES asset_object_schema(id)
);

CREATE TABLE security_scheme (
    id integer,
    default_level_id integer,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_level_id) REFERENCES security_level(id)
);

CREATE TABLE permission_scheme (
    id integer,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE board (
    id integer,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE field (
    id text,
    description text,
    dimension_table text,
    is_array boolean,
    is_custom boolean,
    "name" text,
    PRIMARY KEY (id)
);

-- Cloud based only
CREATE TABLE worklog_property (
    "key" text,
    worklog_id integer,
    self text,
    "value" text,
    PRIMARY KEY ("key", worklog_id),
    FOREIGN KEY (worklog_id) REFERENCES worklog(id)
);

CREATE TABLE user_group (
    group_name text,
    user_id text,
    PRIMARY KEY (group_name, user_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE field_project (
    field_id text,
    project_id text,
    PRIMARY KEY (field_id, project_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE request_type (
    id integer,
    service_desk_id integer,
    issue_type_id integer,
    project_id integer,
    description text,
    help_text text,
    "name" text,
    PRIMARY KEY (id, service_desk_id),
    FOREIGN KEY (issue_type_id) REFERENCES issue_type(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_board (
    board_id integer,
    project_id integer,
    PRIMARY KEY (board_id, project_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE sla (
    _fivetran_id text,
    issue_id bigint,
    sla_id bigint,
    breached boolean,
    elapsed_time bigint,
    goal_duration bigint,
    is_ongoing_cycle boolean,
    paused boolean,
    remaining_time bigint,
    start_time timestamp,
    stop_time timestamp,
    within_calendar_hours boolean,
    PRIMARY KEY (_fivetran_id, issue_id, sla_id)
);

CREATE TABLE component (
    id integer,
    project_id integer,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE issue_multiselect_history (
    _fivetran_id text,
    "time" timestamp,
    field_id text,
    issue_id integer,
    author_id text,
    is_active boolean,
    "value" text,
    PRIMARY KEY (_fivetran_id, "time", field_id, issue_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (author_id) REFERENCES "user"(id)
);

CREATE TABLE security_scheme_level (
    level_id integer,
    scheme_id integer,
    PRIMARY KEY (level_id, scheme_id),
    FOREIGN KEY (level_id) REFERENCES security_level(id),
    FOREIGN KEY (scheme_id) REFERENCES security_scheme(id)
);

CREATE TABLE priority (
    id integer,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE permission (
    id text,
    description text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE issue_user_vote (
    issue_id integer,
    user_id text,
    PRIMARY KEY (issue_id, user_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE status_category (
    id integer,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE approval (
    id integer,
    can_answer_approval boolean,
    completed_date timestamp,
    created_date timestamp,
    final_decision text,
    "name" text,
    PRIMARY KEY (id)
);

-- issue.system_fields
-- We sync all system field from API response as is without any prefix
CREATE TABLE issue (
    id integer,
    parent_id integer,
    priority integer,
    resolution integer,
    security_level integer,
    "status" integer,
    "key" integer,
    -- system_fields_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES issue(id),
    FOREIGN KEY (priority) REFERENCES priority(id),
    FOREIGN KEY (resolution) REFERENCES resolution(id),
    FOREIGN KEY (security_level) REFERENCES security_level(id),
    FOREIGN KEY ("status") REFERENCES "status"(id)
);

CREATE TABLE asset_object_type_attribute (
    id integer,
    workspace_id text,
    object_type_id integer,
    reference_object_type_id integer,
    reference_type_id text,
    additional_value text,
    default_type_id integer,
    default_type_name text,
    description text,
    editable boolean,
    hidden boolean,
    include_child_object_types boolean,
    indexed boolean,
    is_system boolean,
    label boolean,
    max_cardinality integer,
    min_cardinality integer,
    "name" text,
    object_attribute_exists boolean,
    options text,
    "position" integer,
    ql_query text,
    regex_validation text,
    removable boolean,
    sortable boolean,
    suffix text,
    summable boolean,
    "type" integer,
    type_value text,
    type_value_multi text,
    unique_attribute boolean,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (object_type_id) REFERENCES asset_object_type(id),
    FOREIGN KEY (reference_object_type_id) REFERENCES asset_object_type(id),
    FOREIGN KEY (reference_type_id) REFERENCES asset_object_type(id)
);

CREATE TABLE asset_reference_type (
    id text,
    workspace_id text,
    schema_id integer,
    color text,
    description text,
    "name" text,
    removable boolean,
    url_16 text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (schema_id) REFERENCES asset_object_schema(id)
);

CREATE TABLE issue_type (
    id integer,
    description text,
    hierarchy_level integer,
    "name" text,
    subtask boolean,
    PRIMARY KEY (id)
);

CREATE TABLE approver (
    approval_id bigint,
    approver_id text,
    decision text,
    PRIMARY KEY (approval_id, approver_id)
);

CREATE TABLE issue_remote_link (
    id integer,
    issue_id integer,
    application_name text,
    application_type text,
    global_id text,
    relationship text,
    -- object_* (dynamic column),
    PRIMARY KEY (id, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE project_category (
    id integer,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE worklog (
    id integer,
    issue_id integer,
    author_id text,
    update_author_id text,
    "comment" text,
    started timestamp,
    time_spent_seconds bigint,
    updated timestamp,
    PRIMARY KEY (id, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (update_author_id) REFERENCES "user"(id)
);

CREATE TABLE asset_object (
    id integer,
    workspace_id text,
    object_type_id integer,
    created timestamp,
    "key" text,
    label text,
    link text,
    "name" text,
    timestamps bigint,
    updated timestamp,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (object_type_id) REFERENCES asset_object_type(id)
);

CREATE TABLE issue_link (
    relationship text,
    issue_id integer,
    related_issue_id integer,
    PRIMARY KEY (relationship, issue_id, related_issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (related_issue_id) REFERENCES issue(id)
);
