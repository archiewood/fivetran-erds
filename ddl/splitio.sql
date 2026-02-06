CREATE TABLE groups (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE environment (
    id text,
    workspace_id text,
    "name" text,
    production boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE change_request_comment (
    _fivetran_id text,
    change_request_id text,
    "comment" text,
    "role" text,
    time_stamp timestamp,
    users text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (change_request_id) REFERENCES change_request(id)
);

CREATE TABLE change_request (
    id text,
    rollout_status_id text,
    split_id text,
    approvers jsonb,
    operation_type text,
    segment text,
    split_open_change_request_id text,
    split_split_id text,
    "status" text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (rollout_status_id) REFERENCES rollout_status(id),
    FOREIGN KEY (split_id) REFERENCES split_definition_environment(split_id)
);

CREATE TABLE resource_permission_view (
    user_id text,
    workspace_restriction_resource_id text,
    PRIMARY KEY (user_id, workspace_restriction_resource_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_restriction_resource_id) REFERENCES workspace_restriction(resource_id)
);

CREATE TABLE workspace_restriction (
    resource_id text,
    id text,
    "view" boolean,
    PRIMARY KEY (resource_id),
    FOREIGN KEY (resource_id) REFERENCES workspace(id)
);

CREATE TABLE traffic_type (
    id text,
    workspace_id text,
    display_attribute_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE split_tag (
    "name" text,
    split_id text,
    PRIMARY KEY ("name", split_id),
    FOREIGN KEY (split_id) REFERENCES split(id)
);

CREATE TABLE split (
    id text,
    rollout_status_id text,
    traffic_type_id text,
    workspace_id text,
    creation_time timestamp,
    description text,
    "name" text,
    rollout_status_timestamp text,
    PRIMARY KEY (id),
    FOREIGN KEY (rollout_status_id) REFERENCES rollout_status(id),
    FOREIGN KEY (traffic_type_id) REFERENCES traffic_type(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE rollout_status (
    id text,
    workspace_id text,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE split_definition_treatment (
    _fivetran_id text,
    split_definition_environment_environment_id text,
    split_definition_environment_split_id text,
    configurations text,
    description text,
    "key" jsonb,
    "name" text,
    segment jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (split_definition_environment_environment_id) REFERENCES split_definition_environment(environment_id),
    FOREIGN KEY (split_definition_environment_split_id) REFERENCES split_definition_environment(split_id)
);

CREATE TABLE split_definition_rule (
    _fivetran_id text,
    split_definition_environment_environment_id text,
    split_definition_environment_split_id text,
    "size" integer,
    treatment text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (split_definition_environment_environment_id) REFERENCES split_definition_environment(environment_id),
    FOREIGN KEY (split_definition_environment_split_id) REFERENCES split_definition_environment(split_id)
);

CREATE TABLE split_definition_rule_bucket (
    "index" text,
    environment_id text,
    split_id text,
    "size" integer,
    treatment text,
    PRIMARY KEY ("index", environment_id, split_id),
    FOREIGN KEY (environment_id) REFERENCES split_definition_environment(environment_id),
    FOREIGN KEY (split_id) REFERENCES split_definition_environment(split_id)
);

CREATE TABLE split_definition_rule_condition (
    _fivetran_id text,
    split_definition_environment_environment_id text,
    split_definition_environment_split_id text,
    combiner text,
    matchers jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (split_definition_environment_environment_id) REFERENCES split_definition_environment(environment_id),
    FOREIGN KEY (split_definition_environment_split_id) REFERENCES split_definition_environment(split_id)
);

CREATE TABLE split_definition_environment (
    environment_id text,
    split_id text,
    traffic_type_id text,
    workspace_id text,
    baseline_treatment text,
    change_number double precision,
    creation_time timestamp,
    default_treatment text,
    killed text,
    last_update_time timestamp,
    traffic_allocation integer,
    PRIMARY KEY (environment_id, split_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (split_id) REFERENCES split(id),
    FOREIGN KEY (traffic_type_id) REFERENCES traffic_type(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    "name" text,
    requires_title_and_comments boolean,
    PRIMARY KEY (id)
);

CREATE TABLE attribute_suggested_value (
    suggested_value text,
    attribute_id text,
    PRIMARY KEY (suggested_value, attribute_id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id)
);

CREATE TABLE attribute (
    id text,
    traffic_type_id text,
    workspace_id text,
    data_type text,
    display_name text,
    is_searchable text,
    organization_id text,
    set_description text,
    PRIMARY KEY (id),
    FOREIGN KEY (traffic_type_id) REFERENCES traffic_type(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE segment_tag (
    "name" text,
    segment_name text,
    PRIMARY KEY ("name", segment_name),
    FOREIGN KEY (segment_name) REFERENCES segment("name")
);

CREATE TABLE segment (
    "name" text,
    workspace_id text,
    traffic_type_id text,
    creation_time timestamp,
    description text,
    PRIMARY KEY ("name", workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (traffic_type_id) REFERENCES traffic_type(id)
);

CREATE TABLE segment_environment (
    environment_id text,
    segment_name text,
    workspace_id text,
    traffic_type_id text,
    creation_time timestamp,
    PRIMARY KEY (environment_id, segment_name, workspace_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (segment_name) REFERENCES segment("name"),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (traffic_type_id) REFERENCES traffic_type(id)
);

CREATE TABLE segment_key_environment (
    _fivetran_id text,
    environment_id text,
    segment_environment_segment_name text,
    "key" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (environment_id) REFERENCES environment(id),
    FOREIGN KEY (segment_environment_segment_name) REFERENCES segment_environment(segment_name)
);

CREATE TABLE user_group (
    group_id text,
    users_id text,
    PRIMARY KEY (group_id, users_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    "name" text,
    "status" text,
    two_factor_authentication boolean,
    "type" text,
    PRIMARY KEY (id)
);
