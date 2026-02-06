CREATE TABLE application_users (
    id text,
    application_id text,
    deleted text,
    email text,
    last_login_dtm text,
    last_modified_dtm text,
    "status" text,
    PRIMARY KEY (id, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_license (
    "index" text,
    application_id text,
    last_modified_dtm text,
    "name" text,
    renewal_date text,
    start_date text,
    terminated_date text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_role_member (
    application_role_index text,
    user_id text,
    email text,
    "name" text,
    PRIMARY KEY (application_role_index, user_id),
    FOREIGN KEY (application_role_index) REFERENCES application_role("index"),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE application_role (
    "index" text,
    application_id text,
    "name" text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application (
    id text,
    created_by_user_id text,
    created_dtm text,
    deleted text,
    last_modified_dtm text,
    "name" text,
    risk_level text,
    "status" text,
    vendor_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id)
);

CREATE TABLE audit_log_target (
    id text,
    audit_log_id text,
    alternate_id text,
    display_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES application(id),
    FOREIGN KEY (audit_log_id) REFERENCES audit_log(id)
);

CREATE TABLE audit_log (
    id text,
    actor_id text,
    details jsonb,
    event_type text,
    published text,
    PRIMARY KEY (id),
    FOREIGN KEY (actor_id) REFERENCES users(id)
);

CREATE TABLE contract_lineitem (
    "index" text,
    contract_id text,
    amount text,
    base_amount text,
    base_currency text,
    currency text,
    description text,
    end_date text,
    start_date text,
    unit_count text,
    PRIMARY KEY ("index", contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract_document (
    "index" text,
    contract_id text,
    description text,
    link_url text,
    PRIMARY KEY ("index", contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract (
    id text,
    created_by_user_id text,
    last_modified_by_user_id text,
    agreement_date text,
    business_owner_email text,
    created_dtm text,
    is_automatic_renewal text,
    last_modified_dtm text,
    ref text,
    renewal_date text,
    "type" text,
    vendor_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_user_id) REFERENCES users(id)
);

CREATE TABLE asset (
    id text,
    created_by_user_id text,
    last_modified_by_user_id text,
    asset_tag text,
    created_dtm text,
    custom_fields jsonb,
    device_name text,
    hardware_vendor text,
    is_encrypted text,
    last_modified_dtm text,
    location_country_code text,
    location_name text,
    model_name text,
    serial_number text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_user_id) REFERENCES users(id)
);

CREATE TABLE people_team (
    id text,
    people_id text,
    "name" text,
    PRIMARY KEY (id, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_aliases (
    "index" text,
    people_id text,
    aliases text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people (
    id text,
    cost_center text,
    created_by text,
    created_dtm text,
    email text,
    first_name text,
    job_title text,
    last_modified_by text,
    last_modified_dtm text,
    last_name text,
    leaving_date text,
    location text,
    person_type text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE users_schema (
    "index" text,
    users_id text,
    schemas text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_email (
    "index" text,
    users_id text,
    primaries text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_phone_number (
    "index" text,
    users_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_role (
    "index" text,
    users_id text,
    primaries text,
    "value" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    display_name text,
    external_id text,
    locale text,
    meta_created text,
    meta_resource_type text,
    preferred_language text,
    user_name text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_run_step (
    id text,
    workflow_run_id text,
    completed jsonb,
    failed jsonb,
    "name" text,
    "status" text,
    "type" text,
    waiting jsonb,
    PRIMARY KEY (id, workflow_run_id),
    FOREIGN KEY (workflow_run_id) REFERENCES workflow_run(id)
);

CREATE TABLE workflow_run (
    id text,
    created_by_user_id text,
    last_modified_by_user_id text,
    workflow_id text,
    context jsonb,
    created_dtm text,
    deleted text,
    last_modified_dtm text,
    "name" text,
    "status" text,
    "trigger" jsonb,
    waiting_until_dtm text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_user_id) REFERENCES users(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_step (
    id text,
    workflow_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    created_by_user_id text,
    last_modified_by_user_id text,
    created_dtm text,
    enabled text,
    last_modified_dtm text,
    "name" text,
    trigger_day_of_week text,
    trigger_every_n_periods text,
    trigger_hour text,
    trigger_id text,
    trigger_name text,
    trigger_period text,
    trigger_start_date text,
    trigger_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_user_id) REFERENCES users(id)
);
