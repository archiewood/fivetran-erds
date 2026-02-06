CREATE TABLE issue_tag (
    tags text,
    issue_id text,
    PRIMARY KEY (tags, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_csat_response (
    "index" text,
    issue_id text,
    "comment" text,
    score text,
    PRIMARY KEY ("index", issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_external_issue (
    "index" text,
    issue_id text,
    external_id text,
    link text,
    "source" text,
    PRIMARY KEY ("index", issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue (
    id text,
    account_id jsonb,
    assignee_id jsonb,
    slack_channel_id text,
    business_hours_first_response_seconds text,
    business_hours_resolution_seconds text,
    created_at text,
    customer_portal_visible text,
    first_response_time text,
    latest_message_time text,
    number text,
    requester_id jsonb,
    resolution_time text,
    slack_message_ts text,
    "source" text,
    "state" text,
    title text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (slack_channel_id) REFERENCES account_channel(id)
);

CREATE TABLE issue_follower (
    id text,
    issue_id text,
    "type" text,
    PRIMARY KEY (id, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE team_user (
    "index" text,
    team_id text,
    user_ids text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_ids) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE message (
    id text,
    issue_id text,
    author_contact_id text,
    author_user_id text,
    author_name text,
    is_private text,
    message_html text,
    "source" text,
    thread_id text,
    timestamps text,
    PRIMARY KEY (id, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (author_contact_id) REFERENCES contact(id),
    FOREIGN KEY (author_user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    emails jsonb,
    "name" text,
    role_id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    object_type text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_form_field (
    "index" text,
    ticket_form_id text,
    description_html text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", ticket_form_id),
    FOREIGN KEY (ticket_form_id) REFERENCES ticket_form(id)
);

CREATE TABLE ticket_form (
    id text,
    description_html text,
    is_public text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_role (
    id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users(role_id)
);

CREATE TABLE contact (
    id text,
    account_id jsonb,
    avatar_url text,
    email text,
    emails jsonb,
    "name" text,
    portal_role text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE knowledge_base_supported_language (
    "index" text,
    knowledge_base_id text,
    supported_language text,
    PRIMARY KEY ("index", knowledge_base_id),
    FOREIGN KEY (knowledge_base_id) REFERENCES knowledge_base(id)
);

CREATE TABLE knowledge_base (
    id text,
    default_language text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE account_channel (
    id text,
    account_id text,
    "source" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_tag (
    tags text,
    account_id text,
    PRIMARY KEY (tags, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    created_at text,
    domains jsonb,
    latest_customer_activity_time text,
    "name" text,
    owner jsonb,
    primary_domain text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);
