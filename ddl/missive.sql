CREATE TABLE contact_info (
    _fivetran_id text,
    contact_id text,
    custom_label text,
    kind text,
    label text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_membership (
    contact_id text,
    id text,
    kind text,
    "name" text,
    title text,
    PRIMARY KEY (contact_id, id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (id) REFERENCES contact_group_organization(id)
);

CREATE TABLE contact (
    id text,
    contact_book_id text,
    deleted text,
    first_name text,
    last_name text,
    middle_name text,
    modified_at text,
    starred text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_book_id) REFERENCES contact_book(id)
);

CREATE TABLE shared_label (
    id text,
    organization_id text,
    color text,
    "name" text,
    name_with_parent_names text,
    parent text,
    share_with_organization text,
    share_with_team text,
    share_with_users text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE conversation_message_in_reply_to (
    "index" text,
    conversation_message_id text,
    in_reply_to text,
    PRIMARY KEY ("index", conversation_message_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message_reference (
    "index" text,
    conversation_message_id text,
    reference text,
    PRIMARY KEY ("index", conversation_message_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message_to_field (
    _fivetran_id text,
    conversation_message_id text,
    address text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message_attachment (
    id text,
    conversation_message_id text,
    extension text,
    filename text,
    height text,
    media_type text,
    "size" text,
    sub_type text,
    url text,
    width text,
    PRIMARY KEY (id, conversation_message_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message (
    id text,
    author text,
    bcc_field jsonb,
    cc_field jsonb,
    created_at text,
    delivered_at text,
    email_message_id text,
    from_field_address text,
    from_field_name text,
    preview text,
    reply_to_field jsonb,
    subject text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_group_organization (
    id text,
    temp_contact_book_id text,
    kind text,
    "name" text,
    PRIMARY KEY (id, temp_contact_book_id)
);

CREATE TABLE contact_book (
    id text,
    organization_id text,
    share_with_team text,
    user_id text,
    description text,
    email_account_id text,
    exclude_from_search text,
    import_error_text text,
    import_processed_rows_count text,
    import_rows_count text,
    importing text,
    "name" text,
    share_with_organization text,
    share_with_users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (share_with_team) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE organization (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE team (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE users (
    id text,
    avatar_url text,
    email text,
    me text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_author (
    _fivetran_id text,
    conversation_id text,
    address text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_external_author (
    _fivetran_id text,
    conversation_id text,
    address text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_user (
    id text,
    conversation_id text,
    archived text,
    assigned text,
    closed text,
    email text,
    flagged text,
    junked text,
    "name" text,
    snoozed text,
    trashed text,
    unassigned text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_assignee (
    id text,
    conversation_id text,
    archived text,
    assigned text,
    closed text,
    email text,
    flagged text,
    junked text,
    "name" text,
    snoozed text,
    trashed text,
    unassigned text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation (
    id text,
    organization_id text,
    team_id text,
    app_url text,
    assignee_emails text,
    assignee_names text,
    attachments_count text,
    color text,
    completed_tasks_count text,
    drafts_count text,
    last_activity_at text,
    latest_message_subject text,
    messages_count text,
    send_later_messages_count text,
    shared_label_names text,
    shared_labels jsonb,
    subject text,
    tasks_count text,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);
