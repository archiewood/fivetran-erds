CREATE TABLE template_widget_2 (
    _fivetran_id text,
    template_widget_1_index text,
    widget_id text,
    "path" text,
    title text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (template_widget_1_index) REFERENCES template_widget_1("index"),
    FOREIGN KEY (widget_id) REFERENCES template_widget_1(widget_id)
);

CREATE TABLE template_widget_1 (
    "index" text,
    widget_id text,
    "path" text,
    title text,
    "type" text,
    PRIMARY KEY ("index", widget_id),
    FOREIGN KEY (widget_id) REFERENCES widget(id)
);

CREATE TABLE widget (
    id text,
    app_id text,
    context text,
    created_datetime timestamp,
    deactivated_datetime text,
    orders text,
    template_type text,
    "type" text,
    updated_datetime text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_fields (
    id text,
    created_datetime text,
    deactivated_datetime text,
    definition_data_type text,
    definition_input_settings jsonb,
    description text,
    external_id text,
    label text,
    managed_type text,
    object_type text,
    priority text,
    required text,
    requirement_type text,
    updated_datetime text,
    PRIMARY KEY (id)
);

CREATE TABLE rules (
    id text,
    code text,
    created_datetime timestamp,
    deactivated_datetime text,
    description text,
    event_types text,
    "name" text,
    priority text,
    settings jsonb,
    "type" text,
    updated_datetime text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE satisfaction_survey (
    id text,
    customer_id text,
    ticket_id text,
    body_text text,
    created_datetime timestamp,
    score text,
    scored_datetime text,
    sent_datetime text,
    should_send_datetime text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE view_field (
    _fivetran_id text,
    view_id text,
    field text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE view_shared_with_team (
    id text,
    view_id text,
    decoration text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES team(id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE view_shared_with_user (
    id text,
    view_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE "view" (
    id text,
    category text,
    created_datetime timestamp,
    deactivated_datetime text,
    decoration_emoji text,
    filters text,
    "name" text,
    order_by text,
    order_dir text,
    search text,
    section_id text,
    shared_with_teams text,
    shared_with_users text,
    slug text,
    "type" text,
    visibility text,
    -- custom_filters_ast_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE view_item_channel (
    id text,
    customer_id text,
    user_id text,
    view_item_id text,
    address text,
    created_datetime text,
    deleted_datetime text,
    preferred text,
    "type" text,
    updated_datetime text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (view_item_id) REFERENCES view_item(id)
);

CREATE TABLE view_item (
    id text,
    assignee_team_id text,
    assignee_user_id text,
    customer_id text,
    view_id text,
    integration jsonb,
    languages text,
    meta text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_team_id) REFERENCES team(id),
    FOREIGN KEY (assignee_user_id) REFERENCES users(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE macro_action (
    _fivetran_id text,
    macro_id text,
    "name" text,
    title text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (macro_id) REFERENCES macro(id)
);

CREATE TABLE macro (
    id text,
    created_datetime text,
    external_id text,
    intent text,
    languages text,
    "name" text,
    updated_datetime timestamp,
    usage text,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_custom_field (
    id text,
    ticket_id text,
    "value" text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (id) REFERENCES custom_fields(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_tag (
    id text,
    ticket_id text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    assignee_user text,
    customer_id text,
    channel text,
    closed_datetime text,
    created_datetime text,
    customer_data_city text,
    customer_integration jsonb,
    customer_meta_postion text,
    excerpt text,
    external_id text,
    from_agent text,
    is_unread text,
    languages text,
    last_message_datetime text,
    last_received_message_datetime text,
    messages_count text,
    opened_datetime text,
    snooze_datetime text,
    spam text,
    "status" text,
    subject text,
    trashed_datetime text,
    updated_datetime timestamp,
    via text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_user) REFERENCES users(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE team_member (
    id text,
    team_id text,
    email text,
    meta text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    created_datetime timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE message_source_to (
    _fivetran_id text,
    message_id text,
    address text,
    msg_source_to_id text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message (
    id text,
    integration_id text,
    rule_id text,
    ticket_id text,
    actions text,
    attachments jsonb,
    body_html text,
    body_text text,
    channel text,
    created_datetime timestamp,
    deleted_datetime text,
    external_id text,
    failed_datetime text,
    from_agent text,
    headers_from text,
    headers_to text,
    intents jsonb,
    is_retriable text,
    last_sending_error text,
    macros jsonb,
    message_id text,
    meta text,
    opened_datetime text,
    public text,
    receiver_email text,
    receiver_firstname text,
    receiver_id text,
    receiver_lastname text,
    receiver_meta text,
    receiver_name text,
    sender_email text,
    sender_firstname text,
    sender_id text,
    sender_lastname text,
    sender_meta text,
    sender_name text,
    sent_datetime text,
    source_type text,
    stripped_html text,
    stripped_signature text,
    stripped_text text,
    subject text,
    uri text,
    via text,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (rule_id) REFERENCES rules(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE users (
    id text,
    active text,
    bio text,
    country text,
    created_datetime timestamp,
    deactivated_datetime text,
    email text,
    first_name text,
    has_2_fa_enabled text,
    has_password text,
    languages text,
    last_name text,
    "name" text,
    role_name text,
    timezone text,
    updated_datetime text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    created_datetime timestamp,
    decoration_color text,
    deleted_datetime text,
    description text,
    "name" text,
    usage text,
    PRIMARY KEY (id)
);

CREATE TABLE integration (
    id text,
    ticket_id text,
    user_id text,
    created_datetime timestamp,
    deactivated_datetime text,
    decoration text,
    deleted_datetime text,
    description text,
    form_hello text,
    http_id text,
    http_method text,
    locked_datetime text,
    meta_address text,
    meta_email_forwarding_activated text,
    meta_preferred text,
    meta_provider text,
    meta_verified text,
    "name" text,
    outbound_verification_status_domain text,
    outbound_verification_status_single_sender text,
    triggers_ticket_created text,
    triggers_ticket_message_created text,
    triggers_ticket_updated text,
    "type" text,
    updated_datetime text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job_ticket (
    job_id text,
    ticket_id text,
    PRIMARY KEY (job_id, ticket_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE job (
    id text,
    user_id text,
    cancel_requested_datetime text,
    cancelled_datetime text,
    created_datetime timestamp,
    ended_datetime text,
    failed_datetime text,
    locked_datetime text,
    param_updates_status text,
    scheduled_datetime text,
    started_datetime text,
    "status" text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE customer_custom_field (
    customer_id text,
    id text,
    "value" text,
    PRIMARY KEY (customer_id, id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (id) REFERENCES custom_fields(id)
);

CREATE TABLE customer (
    id text,
    active text,
    created_datetime text,
    data text,
    email text,
    external_id text,
    first_name text,
    languages text,
    last_name text,
    "name" text,
    note text,
    timezone text,
    updated_datetime timestamp,
    PRIMARY KEY (id)
);
