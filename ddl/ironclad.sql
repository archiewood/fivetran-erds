CREATE TABLE schema_attribute (
    "name" text,
    schema_id text,
    description text,
    multi_valued boolean,
    mutability text,
    required boolean,
    returned text,
    sub_attributes jsonb,
    "type" text,
    PRIMARY KEY ("name", schema_id),
    FOREIGN KEY (schema_id) REFERENCES "schema"(id)
);

CREATE TABLE "schema" (
    id text,
    description text,
    meta_location text,
    meta_resource_type text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_reviewer (
    display_name text,
    "role" text,
    workflow_id text,
    reviewer_type text,
    "status" text,
    PRIMARY KEY (display_name, "role", workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_participant (
    user_id text,
    workflow_id text,
    PRIMARY KEY (user_id, workflow_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE record_link (
    link_record_id text,
    record_id text,
    PRIMARY KEY (link_record_id, record_id),
    FOREIGN KEY (link_record_id) REFERENCES record(id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record_property (
    "name" text,
    record_id text,
    "value" text,
    PRIMARY KEY ("name", record_id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record (
    id text,
    source_workflow_id text,
    ironclad_id text,
    last_updated timestamp,
    "name" text,
    signed_copy_content_type text,
    signed_copy_filename text,
    signed_copy_href text,
    source_type text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (source_workflow_id) REFERENCES workflow(id)
);

CREATE TABLE turn_history (
    turn_number text,
    turn_start_time text,
    workflow_id text,
    turn_end_time text,
    turn_location text,
    turn_party text,
    turn_user_email text,
    turn_user_id text,
    PRIMARY KEY (turn_number, turn_start_time, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_schema_property (
    "name" text,
    workflow_schema_id text,
    "value" text,
    PRIMARY KEY ("name", workflow_schema_id),
    FOREIGN KEY (workflow_schema_id) REFERENCES workflow_schema(id)
);

CREATE TABLE workflow_schema (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_record (
    record_id text,
    workflow_id text,
    PRIMARY KEY (record_id, workflow_id),
    FOREIGN KEY (record_id) REFERENCES record(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_role_assignee (
    user_id text,
    workflow_role_id text,
    workflow_role_workflow_id text,
    PRIMARY KEY (user_id, workflow_role_id, workflow_role_workflow_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workflow_role_id) REFERENCES workflow_role(id),
    FOREIGN KEY (workflow_role_workflow_id) REFERENCES workflow_role(workflow_id)
);

CREATE TABLE workflow_role (
    id text,
    workflow_id text,
    display_name text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_attribute (
    "name" text,
    workflow_id text,
    "value" text,
    PRIMARY KEY ("name", workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    creator_id text,
    template text,
    approvals_state text,
    approvals_url text,
    contract_approval_timestamp timestamp,
    contract_execution_date timestamp,
    created timestamp,
    ironclad_id text,
    is_cancelled boolean,
    is_complete boolean,
    is_revertible_to_review boolean,
    last_updated timestamp,
    signatures_state text,
    signatures_url text,
    "status" text,
    step text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (template) REFERENCES workflow_schema(id)
);

CREATE TABLE group_schema (
    groups_id text,
    schema_id text,
    PRIMARY KEY (groups_id, schema_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (schema_id) REFERENCES "schema"(id)
);

CREATE TABLE group_member (
    groups_id text,
    user_id text,
    ref text,
    "type" text,
    PRIMARY KEY (groups_id, user_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    display_name text,
    external_id text,
    PRIMARY KEY (id)
);

CREATE TABLE user_schema (
    schema_id text,
    users_id text,
    PRIMARY KEY (schema_id, users_id),
    FOREIGN KEY (schema_id) REFERENCES "schema"(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_email (
    "value" text,
    users_id text,
    is_primary boolean,
    "type" text,
    PRIMARY KEY ("value", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active boolean,
    family_name text,
    given_name text,
    user_name text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_signer_delegate (
    delegate_email text,
    workflow_signer_email text,
    workflow_signer_workflow_id text,
    delegate_name text,
    PRIMARY KEY (delegate_email, workflow_signer_email, workflow_signer_workflow_id),
    FOREIGN KEY (workflow_signer_email) REFERENCES workflow_signer(email),
    FOREIGN KEY (workflow_signer_workflow_id) REFERENCES workflow_signer(workflow_id)
);

CREATE TABLE workflow_signer (
    email text,
    workflow_id text,
    role_name text,
    signature_status text,
    PRIMARY KEY (email, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE approval_request (
    _fivetran_id text,
    workflow_id text,
    actor_id text,
    actor_type text,
    aggregate_duration text,
    approval_type text,
    duration text,
    end_time text,
    "role" text,
    role_name text,
    start_time text,
    "status" text,
    PRIMARY KEY (_fivetran_id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE type_hash_data (
    "index" text,
    entity_relationship_type_id text,
    data text,
    PRIMARY KEY ("index", entity_relationship_type_id),
    FOREIGN KEY (entity_relationship_type_id) REFERENCES entity_relationship_type(id)
);

CREATE TABLE entity_relationship_type (
    id text,
    company_id text,
    description text,
    display_name text,
    kind text,
    "name" text,
    type_hash_type text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE entity_named_type_id (
    named_type_id text,
    entity_id text,
    PRIMARY KEY (named_type_id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id)
);

CREATE TABLE entity (
    id text,
    ironclad_id text,
    last_updated text,
    "name" text,
    "status" text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id)
);
