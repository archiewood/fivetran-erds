-- *zendesk_ticket_id refers to the  Zendesk Ticket which you can sync through our Zendesk connector, it's available under Tickets table. Visit Zendesk Documentation to learn more about it.

CREATE TABLE agent_status_history (
    agent_id bigint,
    account_id bigint,
    event_id text,
    "value" text,
    PRIMARY KEY (agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent_engagement_history (
    agent_id bigint,
    account_id bigint,
    event_id text,
    "value" text,
    PRIMARY KEY (agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE engagement (
    id text,
    agent_id bigint,
    chat_id text,
    department_id bigint,
    accepted text,
    assigned text,
    "comment" text,
    duration bigint,
    rating text,
    started_by text,
    timestamps timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (chat_id) REFERENCES chat(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE visitor (
    id text,
    email text,
    "name" text,
    notes text,
    phone text,
    PRIMARY KEY (id)
);

CREATE TABLE chat_history (
    "index" bigint,
    timestamps timestamp,
    chat_id text,
    agent_id bigint,
    department_id bigint,
    prev_department_id bigint,
    channel text,
    msg text,
    msg_id text,
    "name" text,
    sender_type text,
    "type" text,
    PRIMARY KEY ("index", timestamps, chat_id),
    FOREIGN KEY (chat_id) REFERENCES chat(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (prev_department_id) REFERENCES department(id)
);

CREATE TABLE chat_agent (
    agent_id bigint,
    chat_id text,
    PRIMARY KEY (agent_id, chat_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (chat_id) REFERENCES chat(id)
);

CREATE TABLE chat_tag (
    tags text,
    chat_id text,
    PRIMARY KEY (tags, chat_id),
    FOREIGN KEY (chat_id) REFERENCES chat(id)
);

CREATE TABLE chat (
    id text,
    visitor_id text,
    "comment" text,
    count_agent bigint,
    count_total bigint,
    count_visitor bigint,
    dropped boolean,
    duration bigint,
    missed boolean,
    preview text,
    rating text,
    response_time_avg bigint,
    response_time_first bigint,
    response_time_max bigint,
    session_browser text,
    session_city text,
    session_country_code text,
    session_country_name text,
    session_end_date timestamp,
    session_id text,
    session_ip text,
    session_platform text,
    session_region text,
    session_start_date timestamp,
    session_user_agent text,
    started_by text,
    timestamps timestamp,
    triggered boolean,
    triggered_response boolean,
    "type" text,
    unread boolean,
    zendesk_ticket_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(id)
);

CREATE TABLE department_member (
    agent_id bigint,
    department_id bigint,
    PRIMARY KEY (agent_id, department_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department (
    id bigint,
    description text,
    enabled boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ban_visitor (
    id bigint,
    visitor_id text,
    reason text,
    PRIMARY KEY (id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(id)
);

CREATE TABLE ban_ip (
    id bigint,
    ip_address text,
    reason text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_role (
    agent_id bigint,
    "role" text,
    PRIMARY KEY (agent_id, "role")
);

CREATE TABLE agent (
    id bigint,
    create_date timestamp,
    display_name text,
    email text,
    enabled boolean,
    first_name text,
    im_server_id text,
    last_login timestamp,
    last_name text,
    login_count bigint,
    PRIMARY KEY (id)
);
