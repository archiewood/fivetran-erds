CREATE TABLE agent_group (
    group_id text,
    agent_id text,
    id text,
    PRIMARY KEY (group_id, agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (id) REFERENCES groups(id)
);

CREATE TABLE agent_social_profile (
    _fivetran_id text,
    agent_id text,
    id text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent (
    id text,
    role_id text,
    agent_capacity text,
    agent_status_name text,
    availability_status text,
    avatar jsonb,
    biography text,
    created_time text,
    email text,
    first_name text,
    is_deactivated boolean,
    is_deleted boolean,
    last_name text,
    locale text,
    login_status boolean,
    routing_type text,
    skill_id text,
    timezone text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    description text,
    is_custom_role boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE csat_metrics (
    _fivetran_id text,
    end_date text,
    "key" text,
    start_date text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE channel_tag (
    tags text,
    channel_id text,
    PRIMARY KEY (tags, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel_welcome_message (
    "index" text,
    channel_id text,
    content text,
    PRIMARY KEY ("index", channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel (
    id text,
    bots_private_note boolean,
    enabled boolean,
    locale text,
    message_type text,
    "name" text,
    public boolean,
    restrict_response boolean,
    updated_time text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_message_part (
    _fivetran_id text,
    conversation_message_id text,
    content text,
    content_type text,
    file_extension text,
    file_hash text,
    file_name text,
    file_size_in_bytes text,
    file_source text,
    url_button_lable text,
    url_button_target text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message (
    id text,
    channel_id text,
    conversation_id text,
    user_id text,
    actor_id text,
    actor_type text,
    app_id text,
    bots_private_note boolean,
    created_time text,
    interaction_id text,
    message_type text,
    reply_parts jsonb,
    restrict_response boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_property_choice (
    id text,
    conversation_property_id text,
    "value" text,
    PRIMARY KEY (id, conversation_property_id),
    FOREIGN KEY (conversation_property_id) REFERENCES conversation_property(id)
);

CREATE TABLE conversation_property (
    id text,
    column_name text,
    custom text,
    default_value text,
    editable text,
    label text,
    "name" text,
    "position" text,
    required text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_performance_first_response_time (
    agent_id text,
    group_id text,
    end_time text,
    first_response_time text,
    start_time text,
    PRIMARY KEY (agent_id, group_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE conversation_metrics (
    _fivetran_id text,
    end_date text,
    "key" text,
    start_date text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE team_performance_resolution_time (
    agent_id text,
    group_id text,
    end_time text,
    resolution_time text,
    start_time text,
    PRIMARY KEY (agent_id, group_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE conversation (
    id text,
    assigned_agent_id text,
    assigned_group_id text,
    assigned_org_agent_id text,
    channel_id text,
    user_id text,
    app_id text,
    created_time text,
    org_contact_id text,
    skill_id text,
    "status" text,
    updated_time text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_agent_id) REFERENCES agent(id),
    FOREIGN KEY (assigned_group_id) REFERENCES groups(id),
    FOREIGN KEY (assigned_org_agent_id) REFERENCES agent(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    description text,
    "name" text,
    routing_logic text,
    routing_type text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    avatar jsonb,
    created_time text,
    email text,
    first_name text,
    last_name text,
    phone text,
    reference_id text,
    restore_id text,
    updated_time text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE team_performance_response_time (
    agent_id text,
    group_id text,
    end_time text,
    response_time text,
    start_time text,
    PRIMARY KEY (agent_id, group_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE csat_report (
    csat_submitter_user_id text,
    interaction_id text,
    agent_id text,
    channel_id text,
    conversation_id text,
    group_id text,
    actor_belongs_to_group text,
    actor_id text,
    actor_name text,
    created_at text,
    csat_id text,
    csat_reopen text,
    csat_response text,
    csat_submitter_user_name text,
    has_response text,
    interaction_raw_id text,
    issue_resolved text,
    reopened text,
    "value" text,
    PRIMARY KEY (csat_submitter_user_id, interaction_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE conversation_report (
    interaction_id text,
    label_category_id text,
    label_sub_category_id text,
    agent_id text,
    channel_id text,
    conversation_id text,
    group_id text,
    actor_belongs_to_group text,
    actor_id text,
    actor_name text,
    actor_type text,
    created_at text,
    interaction_raw_id text,
    label_category_name text,
    labelled_by_type text,
    reopened text,
    user_name text,
    PRIMARY KEY (interaction_id, label_category_id, label_sub_category_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);
