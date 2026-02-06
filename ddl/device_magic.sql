CREATE TABLE device (
    id text,
    description text,
    groups text,
    identifier text,
    organization_id text,
    owner text,
    pending_approval text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE form (
    id text,
    description text,
    groups text,
    "name" text,
    namespace text,
    organization_id text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE device_magic_database (
    submission_id text,
    form_id text,
    author_identifier text,
    device_identifier text,
    device_submission_identifier text,
    received_at text,
    submission jsonb,
    submission_counter text,
    submitted_at text,
    user_id text,
    username text,
    PRIMARY KEY (submission_id, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form_definition (
    identifier text,
    form_id text,
    auto_identifier text,
    calculate_expr text,
    children jsonb,
    hidden text,
    hint text,
    initial_answer text,
    max_occurrence text,
    min_occurrence text,
    options jsonb,
    options_identifier_column text,
    options_resource text,
    options_table text,
    options_text_column text,
    readonly_rule text,
    required_rule text,
    title text,
    "type" text,
    type_derived text,
    validate_expr text,
    validate_msg text,
    visible_expr text,
    visible_rule text,
    PRIMARY KEY (identifier, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);
