CREATE TABLE contact_tag (
    "name" text,
    contact_id bigint,
    color text,
    PRIMARY KEY ("name", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id bigint,
    created_at timestamp,
    email text,
    events jsonb,
    "name" text,
    phone text,
    social_profiles jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE message_button (
    label text,
    conversation_id bigint,
    conversation_message_id bigint,
    reaction_message text,
    reaction_type text,
    style text,
    "type" text,
    "value" text,
    PRIMARY KEY (label, conversation_id, conversation_message_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_message(conversation_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message (
    id bigint,
    conversation_id bigint,
    author_id bigint,
    author_type text,
    body text,
    city text,
    country text,
    country_name text,
    created_at timestamp,
    developer_app_id text,
    href text,
    ip text,
    is_author_bot boolean,
    latitude double precision,
    locale text,
    longitude double precision,
    org_id bigint,
    postal_code text,
    pre_messages jsonb,
    referrer text,
    region text,
    timezone text,
    title text,
    "type" text,
    user_agent text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE playbook_clp (
    playbook_id bigint,
    landing_page_url text,
    playbook_name text,
    PRIMARY KEY (playbook_id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id)
);

CREATE TABLE account_custom_property (
    "name" text,
    account_id text,
    label text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY ("name", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    owner_id bigint,
    create_date_time timestamp,
    deleted boolean,
    domain text,
    "name" text,
    targeted boolean,
    update_date_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE playbook_goal (
    id text,
    playbook_id bigint,
    message text,
    "name" text,
    PRIMARY KEY (id, playbook_id),
    FOREIGN KEY (playbook_id) REFERENCES playbook(id)
);

CREATE TABLE playbook (
    id bigint,
    created_author_id bigint,
    updated_author_id bigint,
    created_at timestamp,
    interaction_id bigint,
    meta jsonb,
    "name" text,
    org_id bigint,
    report_type text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_author_id) REFERENCES users(id),
    FOREIGN KEY (updated_author_id) REFERENCES users(id)
);

CREATE TABLE users (
    id bigint,
    alias text,
    availability text,
    avatar_url text,
    bot boolean,
    created_at text,
    email text,
    locale text,
    "name" text,
    org_id bigint,
    phone text,
    "role" text,
    time_zone text,
    updated_at text,
    verified boolean,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_participant (
    conversation_id bigint,
    user_id bigint,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_tag (
    "name" text,
    conversation_id bigint,
    color text,
    PRIMARY KEY ("name", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation (
    id bigint,
    contact_id bigint,
    created_at timestamp,
    inbox_id bigint,
    related_playbook_id bigint,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);
