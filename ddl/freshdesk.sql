CREATE TABLE satisfaction_rating_value (
    satisfaction_rating_id bigint,
    survey_question_id text,
    "value" text,
    PRIMARY KEY (satisfaction_rating_id, survey_question_id),
    FOREIGN KEY (satisfaction_rating_id) REFERENCES satisfaction_rating(id),
    FOREIGN KEY (survey_question_id) REFERENCES survey_question(id)
);

CREATE TABLE automation_event (
    fivetran_id text,
    automation_id bigint,
    field_name text,
    "from" text,
    related_conditions jsonb,
    "to" text,
    to_nested_field jsonb,
    "value" text,
    PRIMARY KEY (fivetran_id, automation_id),
    FOREIGN KEY (automation_id) REFERENCES automation(id)
);

CREATE TABLE source_lookup (
    id bigint,
    "source" text,
    PRIMARY KEY (id)
);

CREATE TABLE priority_lookup (
    id bigint,
    priority text,
    PRIMARY KEY (id)
);

CREATE TABLE sla_policy_escalation_reminder_next_response (
    agent_id bigint,
    sla_policy_id bigint,
    escalation_time bigint,
    PRIMARY KEY (agent_id, sla_policy_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE status_lookup (
    id bigint,
    label_for_agents text,
    label_for_customer text,
    PRIMARY KEY (id)
);

CREATE TABLE agent (
    id bigint,
    available boolean,
    available_since timestamp,
    created_at timestamp,
    deactivated boolean,
    focus_mode boolean,
    freshchat_agent boolean,
    occasional boolean,
    signature text,
    ticket_scope bigint,
    "type" text,
    updated_at timestamp,
    -- contact_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_to_email (
    email text,
    ticket_id bigint,
    PRIMARY KEY (email, ticket_id)
);

CREATE TABLE sla_policy_escalation_reminder_response (
    agent_id bigint,
    sla_policy_id bigint,
    escalation_time bigint,
    PRIMARY KEY (agent_id, sla_policy_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE email_config (
    id bigint,
    group_id bigint,
    product_id bigint,
    active boolean,
    created_at timestamp,
    "name" text,
    primary_role boolean,
    reply_email text,
    to_email text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE time_entries (
    id bigint,
    agent_id bigint,
    company_id bigint,
    billable boolean,
    created_at timestamp,
    executed_at timestamp,
    note text,
    start_time timestamp,
    ticket_id bigint,
    time_spent text,
    timer_running boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE "group" (
    id bigint,
    business_hour_id bigint,
    escalate_to bigint,
    auto_ticket_assign bigint,
    created_at timestamp,
    description text,
    group_type text,
    "name" text,
    unassigned_for text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (business_hour_id) REFERENCES business_hour(id),
    FOREIGN KEY (escalate_to) REFERENCES agent(id)
);

CREATE TABLE automation_action (
    fivetran_id text,
    automation_id bigint,
    anchor_type text,
    auth_header jsonb,
    content jsonb,
    content_layout bigint,
    content_type text,
    email_body text,
    email_subject text,
    email_to text,
    field_name text,
    field_type text,
    note_body text,
    notify_agents jsonb,
    request_type text,
    show_inherit_properties_toggle boolean,
    thread_body text,
    ticket_body text,
    ticket_subject text,
    url text,
    "value" jsonb,
    PRIMARY KEY (fivetran_id, automation_id),
    FOREIGN KEY (automation_id) REFERENCES automation(id)
);

CREATE TABLE conversation_cc_email (
    email text,
    conversation_id bigint,
    PRIMARY KEY (email, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE discussion_topic (
    id bigint,
    discussion_forum_id bigint,
    created_at timestamp,
    hits bigint,
    locked boolean,
    merged_topic_id bigint,
    posts_count bigint,
    published boolean,
    replied_at timestamp,
    replied_by bigint,
    stamp_type bigint,
    sticky boolean,
    title text,
    updated_at timestamp,
    user_id bigint,
    user_votes bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (discussion_forum_id) REFERENCES discussion_forum(id)
);

CREATE TABLE sla_policy_escalation_reminder_resolution (
    agent_id bigint,
    sla_policy_id bigint,
    escalation_time bigint,
    PRIMARY KEY (agent_id, sla_policy_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE conversation_to_email (
    email text,
    conversation_id bigint,
    PRIMARY KEY (email, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE survey_question (
    id text,
    survey_id text,
    accepted_ratings jsonb,
    label text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE company (
    id bigint,
    account_tier text,
    created_at timestamp,
    description text,
    health_score text,
    industry text,
    "name" text,
    note text,
    org_company_id text,
    renewal_date timestamp,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE company_domain (
    domain text,
    company_id bigint,
    PRIMARY KEY (domain, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE ticket_fwd_email (
    email text,
    ticket_id bigint,
    PRIMARY KEY (email, ticket_id)
);

CREATE TABLE discussion_comment (
    id bigint,
    contact_id bigint,
    discussion_topic_id bigint,
    answer boolean,
    body text,
    body_text text,
    created_at timestamp,
    published boolean,
    spam boolean,
    trash boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (discussion_topic_id) REFERENCES discussion_topic(id)
);

CREATE TABLE automation_condition (
    fivetran_id text,
    automation_id bigint,
    match_type text,
    "name" text,
    PRIMARY KEY (fivetran_id, automation_id),
    FOREIGN KEY (automation_id) REFERENCES automation(id)
);

CREATE TABLE discussion_category (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE satisfaction_rating (
    id bigint,
    agent_id bigint,
    contact_id bigint,
    group_id bigint,
    survey_id text,
    created_at timestamp,
    feedback text,
    ticket_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE conversation_bcc_email (
    email text,
    conversation_id bigint,
    PRIMARY KEY (email, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE sla_policy_escalation_resolution (
    resolution_level bigint,
    agent_id bigint,
    sla_policy_id bigint,
    escalation_time bigint,
    PRIMARY KEY (resolution_level, agent_id, sla_policy_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE automation (
    id bigint,
    active boolean,
    affected_tickets_count bigint,
    automation_type text,
    created_at timestamp,
    last_updated_by bigint,
    "name" text,
    operator text,
    outdated boolean,
    performer_type bigint,
    "position" bigint,
    summary jsonb,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE automation_performer_member (
    automation_id bigint,
    member_id bigint,
    PRIMARY KEY (automation_id, member_id),
    FOREIGN KEY (automation_id) REFERENCES automation(id),
    FOREIGN KEY (member_id) REFERENCES agent(id)
);

CREATE TABLE "role" (
    id bigint,
    created_at timestamp,
    "default" boolean,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE sla_policy_escalation_next_response (
    agent_id bigint,
    sla_policy_id bigint,
    escalation_time bigint,
    PRIMARY KEY (agent_id, sla_policy_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE ticket_history (
    id bigint,
    company_id bigint,
    email_config_id bigint,
    group_id bigint,
    priority bigint,
    product_id bigint,
    responder_id bigint,
    "source" bigint,
    "status" bigint,
    association_type integer,
    created_at timestamp,
    deleted boolean,
    description text,
    description_text text,
    due_by timestamp,
    fr_due_by timestamp,
    fr_escalated boolean,
    is_escalated boolean,
    requester_id bigint,
    spam boolean,
    subject text,
    "type" text,
    updated_at timestamp,
    -- stats_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (email_config_id) REFERENCES email_config(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (priority) REFERENCES priority_lookup(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (responder_id) REFERENCES agent(id),
    FOREIGN KEY ("source") REFERENCES source_lookup(id),
    FOREIGN KEY ("status") REFERENCES status_lookup(id)
);

CREATE TABLE discussion_forum (
    id bigint,
    discussion_category_id bigint,
    description text,
    forum_type bigint,
    forum_visibility bigint,
    "name" text,
    "position" bigint,
    posts_count bigint,
    topics_count bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (discussion_category_id) REFERENCES discussion_category(id)
);

CREATE TABLE ticket_tag (
    "index" bigint,
    ticket_id bigint,
    tag text,
    PRIMARY KEY ("index", ticket_id)
);

CREATE TABLE conversation (
    id bigint,
    ticket_id bigint,
    contact_id bigint,
    body text,
    body_text text,
    created_at timestamp,
    from_email text,
    incoming boolean,
    private boolean,
    "source" bigint,
    support_email text,
    updated_at timestamp,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE sla_policy_target (
    priority bigint,
    sla_policy_id bigint,
    business_hours boolean,
    escalation_enabled boolean,
    next_respond_within bigint,
    resolve_within bigint,
    respond_within bigint,
    PRIMARY KEY (priority, sla_policy_id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE business_hour (
    id bigint,
    created_at timestamp,
    description text,
    is_default boolean,
    "name" text,
    time_zone text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE sla_policy_escalation_response (
    agent_id bigint,
    sla_policy_id bigint,
    escalation_time bigint,
    PRIMARY KEY (agent_id, sla_policy_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE ticket_cc_email (
    email text,
    ticket_id bigint,
    PRIMARY KEY (email, ticket_id)
);

CREATE TABLE agent_role (
    agent_id bigint,
    role_id bigint,
    PRIMARY KEY (agent_id, role_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE contact (
    id bigint,
    company_id bigint,
    active boolean,
    address text,
    blocked boolean,
    created_at timestamp,
    csat_rating text,
    description text,
    email text,
    facebook_id text,
    job_title text,
    language text,
    mobile text,
    "name" text,
    phone text,
    preferred_source text,
    time_zone text,
    twitter_id text,
    unique_external_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE sla_policy_applicable_to (
    applicable_to text,
    "value" text,
    sla_policy_id bigint,
    PRIMARY KEY (applicable_to, "value", sla_policy_id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy(id)
);

CREATE TABLE conversation_attachment (
    id bigint,
    conversation_id bigint,
    attachment_url text,
    content_type text,
    created_at timestamp,
    "name" text,
    "size" bigint,
    updated_at timestamp,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE sla_policy (
    id bigint,
    active boolean,
    created_at timestamp,
    description text,
    is_default boolean,
    "name" text,
    "position" bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE survey (
    id bigint,
    created_at timestamp,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_reply_cc_email (
    email text,
    ticket_id bigint,
    PRIMARY KEY (email, ticket_id)
);

CREATE TABLE agent_group (
    agent_id bigint,
    group_id bigint,
    PRIMARY KEY (agent_id, group_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id)
);
