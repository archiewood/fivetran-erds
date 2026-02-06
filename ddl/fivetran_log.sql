-- The following tables are only populated if RBAC is enabled:
--   - `role`
--   - `role_permission`
--   - `resource_membership`
--   - `team`
--   - `team_membership`

CREATE TABLE role_permission (
    permission text,
    role_id text,
    PRIMARY KEY (permission, role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE destination (
    id text,
    account_id text,
    created_at timestamp,
    deployment_type text,
    destination_type text,
    is_active boolean,
    "name" text,
    region text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE destination_column_change_event (
    attribute_name text,
    detected_at timestamp,
    column_id bigint,
    connection_id text,
    destination_id text,
    change_type text,
    new_value text,
    PRIMARY KEY (attribute_name, detected_at, column_id),
    FOREIGN KEY (column_id) REFERENCES destination_column(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE destination_table_change_event (
    detected_at timestamp,
    table_id bigint,
    connection_id text,
    destination_id text,
    change_type text,
    PRIMARY KEY (detected_at, table_id),
    FOREIGN KEY (table_id) REFERENCES destination_table(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE source_column_change_event (
    attribute_name text,
    detected_at timestamp,
    entity_type text,
    column_id bigint,
    connection_id text,
    change_type text,
    new_value text,
    PRIMARY KEY (attribute_name, detected_at, entity_type, column_id),
    FOREIGN KEY (column_id) REFERENCES source_column(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id)
);

CREATE TABLE resource_membership (
    id bigint,
    account_id text,
    connection_id text,
    destination_id text,
    role_id text,
    team_id text,
    user_id text,
    created_at timestamp,
    organization_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE table_lineage (
    destination_table_id bigint,
    source_table_id bigint,
    created_at timestamp,
    PRIMARY KEY (destination_table_id, source_table_id),
    FOREIGN KEY (destination_table_id) REFERENCES destination_table(id),
    FOREIGN KEY (source_table_id) REFERENCES source_table(id)
);

CREATE TABLE source_schema_change_event (
    detected_at timestamp,
    schema_id integer,
    connection_id text,
    change_type text,
    PRIMARY KEY (detected_at, schema_id),
    FOREIGN KEY (schema_id) REFERENCES source_schema(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id)
);

CREATE TABLE incremental_mar (
    free_type text,
    measured_date text,
    schema_name text,
    sync_type text,
    table_name text,
    connection_name text,
    destination_id text,
    incremental_rows bigint,
    updated_at timestamp,
    PRIMARY KEY (free_type, measured_date, schema_name, sync_type, table_name, connection_name, destination_id),
    FOREIGN KEY (connection_name) REFERENCES connection(connection_name),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE connector_sdk_log (
    event_time timestamp,
    id text,
    connection_id text,
    "level" text,
    message text,
    message_origin text,
    sync_id text,
    PRIMARY KEY (event_time, id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id)
);

CREATE TABLE source_table (
    id bigint,
    connection_id text,
    schema_id integer,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id),
    FOREIGN KEY (schema_id) REFERENCES source_schema(id)
);

CREATE TABLE destination_schema_change_event (
    detected_at timestamp,
    schema_id integer,
    connection_id text,
    destination_id text,
    change_type text,
    PRIMARY KEY (detected_at, schema_id),
    FOREIGN KEY (schema_id) REFERENCES destination_schema(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE "user" (
    id text,
    created_at timestamp,
    email text,
    email_disabled boolean,
    family_name text,
    given_name text,
    phone text,
    verified boolean,
    PRIMARY KEY (id)
);

CREATE TABLE column_lineage (
    destination_column_id bigint,
    source_column_id bigint,
    created_at timestamp,
    PRIMARY KEY (destination_column_id, source_column_id),
    FOREIGN KEY (destination_column_id) REFERENCES destination_column(id),
    FOREIGN KEY (source_column_id) REFERENCES source_column(id)
);

CREATE TABLE role_connector_type (
    connector_type text,
    role_id text,
    PRIMARY KEY (connector_type, role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE usage_cost (
    measured_month text,
    destination_id text,
    amount numeric,
    PRIMARY KEY (measured_month, destination_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE account (
    id text,
    country text,
    created_at timestamp,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_membership (
    role_id text,
    team_id text,
    user_id text,
    created_at timestamp,
    PRIMARY KEY (role_id, team_id, user_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE transformation_runs (
    free_type text,
    job_id text,
    measured_date text,
    project_type text,
    destination_id text,
    job_name text,
    model_runs bigint,
    updated_at timestamp,
    PRIMARY KEY (free_type, job_id, measured_date, project_type, destination_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE source_column (
    id bigint,
    connection_id text,
    table_id bigint,
    created_at timestamp,
    is_primary_key boolean,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id),
    FOREIGN KEY (table_id) REFERENCES source_table(id)
);

CREATE TABLE team (
    id text,
    account_id text,
    description text,
    "name" text,
    parent_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE credits_used (
    measured_month text,
    destination_id text,
    credits_consumed integer,
    PRIMARY KEY (measured_month, destination_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE destination_schema (
    id integer,
    destination_id text,
    connection_id text,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE connector_type (
    id text,
    availability text,
    created_at timestamp,
    deleted boolean,
    official_connector_name text,
    public_beta_at timestamp,
    release_at timestamp,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE audit_trail (
    captured_at timestamp,
    id text,
    user_id text,
    "action" text,
    interaction_method text,
    new_values text,
    old_values text,
    primary_resource_id text,
    primary_resource_type text,
    secondary_resource_id text,
    secondary_resource_type text,
    PRIMARY KEY (captured_at, id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE source_table_change_event (
    detected_at timestamp,
    table_id bigint,
    connection_id text,
    change_type text,
    PRIMARY KEY (detected_at, table_id),
    FOREIGN KEY (table_id) REFERENCES source_table(id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id)
);

-- - Log events are documented here.
CREATE TABLE log (
    id text,
    time_stamp timestamp,
    connection_id text,
    event text,
    message_data text,
    message_event text,
    sync_id text,
    PRIMARY KEY (id, time_stamp),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id)
);

CREATE TABLE destination_table (
    id bigint,
    destination_id text,
    schema_id integer,
    connection_id text,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (destination_id) REFERENCES destination(id),
    FOREIGN KEY (schema_id) REFERENCES destination_schema(id)
);

CREATE TABLE source_foreign_key (
    column_id bigint,
    created_at timestamp,
    foreign_key_reference text,
    ordinal integer,
    updated_at timestamp,
    PRIMARY KEY (column_id),
    FOREIGN KEY (column_id) REFERENCES source_column(id)
);

CREATE TABLE connection (
    connection_id text,
    connecting_user_id text,
    connector_type_id text,
    destination_id text,
    connection_name text,
    deployment_type text,
    paused boolean,
    signed_up timestamp,
    sync_frequency integer,
    PRIMARY KEY (connection_id),
    FOREIGN KEY (connecting_user_id) REFERENCES "user"(id),
    FOREIGN KEY (connector_type_id) REFERENCES connector_type(id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE source_schema (
    id integer,
    connection_id text,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (connection_id) REFERENCES connection(connection_id)
);

CREATE TABLE destination_column (
    id bigint,
    destination_id text,
    table_id bigint,
    connection_id text,
    created_at timestamp,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (destination_id) REFERENCES destination(id),
    FOREIGN KEY (table_id) REFERENCES destination_table(id)
);

CREATE TABLE "role" (
    id text,
    account_id text,
    connector_types jsonb,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE schema_lineage (
    destination_schema_id integer,
    source_schema_id integer,
    created_at timestamp,
    PRIMARY KEY (destination_schema_id, source_schema_id),
    FOREIGN KEY (destination_schema_id) REFERENCES destination_schema(id),
    FOREIGN KEY (source_schema_id) REFERENCES source_schema(id)
);
