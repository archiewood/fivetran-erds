CREATE TABLE tag (
    id text,
    created_at timestamp,
    description text,
    highlight text,
    is_private boolean,
    is_visible_in_conversation_lists boolean,
    "name" text,
    parent_tag_id text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE contact_link (
    "index" integer,
    contact_id text,
    link text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE conversation (
    id text,
    last_message_id text,
    teammate_id text,
    created_at timestamp,
    recipient_handle text,
    recipient_role text,
    "status" text,
    status_category text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (last_message_id) REFERENCES message(id),
    FOREIGN KEY (teammate_id) REFERENCES teammate(id)
);

CREATE TABLE inbox (
    id text,
    address text,
    "name" text,
    send_as text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE follower (
    conversation_id text,
    teammate_id text,
    PRIMARY KEY (conversation_id, teammate_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (teammate_id) REFERENCES teammate(id)
);

CREATE TABLE inbox_channel (
    channel_id text,
    inbox_id text,
    PRIMARY KEY (channel_id, inbox_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (inbox_id) REFERENCES inbox(id)
);

CREATE TABLE conversation_tag (
    conversation_id text,
    tag_id text,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE account (
    id text,
    created_at timestamp,
    description text,
    domains jsonb,
    external_id text,
    logo_url text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE rule_action (
    "index" integer,
    rule_id text,
    "action" text,
    PRIMARY KEY ("index", rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE shift (
    id text,
    created_at timestamp,
    "name" text,
    times jsonb,
    timezone text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_inbox (
    conversation_id text,
    inbox_id text,
    PRIMARY KEY (conversation_id, inbox_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (inbox_id) REFERENCES inbox(id)
);

CREATE TABLE conversation_link (
    conversation_id text,
    link_id text,
    PRIMARY KEY (conversation_id, link_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (link_id) REFERENCES link(id)
);

CREATE TABLE contact_handle (
    "index" integer,
    contact_id text,
    handle text,
    "source" text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE list (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_tag_history (
    tag_id text,
    updated_at timestamp,
    conversation_id text,
    source_rule_id text,
    source_teammate_id text,
    event_type text,
    source_type text,
    PRIMARY KEY (tag_id, updated_at, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (source_rule_id) REFERENCES rule(id),
    FOREIGN KEY (source_teammate_id) REFERENCES teammate(id)
);

CREATE TABLE rule (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE message (
    id text,
    author_id text,
    conversation_id text,
    blurb text,
    body text,
    created_at timestamp,
    duration integer,
    have_been_answered boolean,
    have_been_favorited boolean,
    have_been_retweeted boolean,
    headers jsonb,
    intercom_url text,
    is_inbound boolean,
    is_retweet boolean,
    text text,
    thread_ref text,
    twitter_url text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES teammate(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE team_inbox (
    inbox_id text,
    team_id text,
    PRIMARY KEY (inbox_id, team_id),
    FOREIGN KEY (inbox_id) REFERENCES inbox(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE channel (
    id text,
    address text,
    send_as text,
    settings jsonb,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE "comment" (
    id text,
    conversation_id text,
    author_id text,
    body text,
    posted_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE message_recipient (
    "index" integer,
    message_id text,
    contact_id text,
    handle text,
    "role" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE teammate (
    id text,
    email text,
    first_name text,
    is_admin boolean,
    is_available boolean,
    last_name text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE comment_mention (
    teammate_id text,
    comment_id text,
    PRIMARY KEY (teammate_id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id)
);

CREATE TABLE team_teammate (
    team_id text,
    teammate_id text,
    PRIMARY KEY (team_id, teammate_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (teammate_id) REFERENCES teammate(id)
);

CREATE TABLE contact_list (
    contact_id text,
    list_id text,
    PRIMARY KEY (contact_id, list_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE conversation_link_history (
    link_id text,
    updated_at timestamp,
    conversation_id text,
    source_rule_id text,
    source_teammate_id text,
    event_type text,
    source_type text,
    PRIMARY KEY (link_id, updated_at, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (source_rule_id) REFERENCES rule(id),
    FOREIGN KEY (source_teammate_id) REFERENCES teammate(id)
);

CREATE TABLE contact (
    id text,
    account_id text,
    avatar_url text,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE attachment (
    "index" integer,
    message_id text,
    cid text,
    content_type text,
    filename text,
    is_inline boolean,
    "size" integer,
    url text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES attachment(message_id)
);

CREATE TABLE shift_teammate (
    shift_id text,
    teammate_id text,
    PRIMARY KEY (shift_id, teammate_id),
    FOREIGN KEY (shift_id) REFERENCES shift(id),
    FOREIGN KEY (teammate_id) REFERENCES teammate(id)
);

CREATE TABLE inbox_teammate (
    inbox_id text,
    teammate_id text,
    PRIMARY KEY (inbox_id, teammate_id),
    FOREIGN KEY (inbox_id) REFERENCES inbox(id),
    FOREIGN KEY (teammate_id) REFERENCES teammate(id)
);

CREATE TABLE link (
    id text,
    external_url text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_note (
    "index" integer,
    contact_id text,
    author_id text,
    body text,
    created_at timestamp,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (author_id) REFERENCES teammate(id)
);

CREATE TABLE conversation_status_history (
    "status" text,
    updated_at timestamp,
    conversation_id text,
    source_rule_id text,
    source_teammate_id text,
    target_teammate_id text,
    source_type text,
    PRIMARY KEY ("status", updated_at, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (source_rule_id) REFERENCES rule(id),
    FOREIGN KEY (source_teammate_id) REFERENCES teammate(id),
    FOREIGN KEY (target_teammate_id) REFERENCES teammate(id)
);

CREATE TABLE team (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
