CREATE TABLE reply_address (
    id text,
    created_by text,
    email_domain_id text,
    license_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    email text,
    prefix text,
    updated_at text,
    verified text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (email_domain_id) REFERENCES email_domain(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE blocked_email (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    email text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE "view" (
    id text,
    agent_id text,
    created_by text,
    license_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    filter jsonb,
    "name" text,
    ordering text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE template_attachment (
    "index" text,
    template_id text,
    cid text,
    "name" text,
    "size" text,
    "type" text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    content_appearance jsonb,
    content_text text,
    content_type text,
    created_at text,
    created_by_type text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE ticket_custom_field_team (
    team_id text,
    ticket_custom_field_id text,
    PRIMARY KEY (team_id, ticket_custom_field_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (ticket_custom_field_id) REFERENCES ticket_custom_field(id)
);

CREATE TABLE ticket_custom_field (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    api_key text,
    created_at text,
    created_by_type text,
    display_name text,
    role_level text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE license (
    id text,
    created_by text,
    default_team_id text,
    default_template_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    detected_languages jsonb,
    landing_page text,
    past_due text,
    referrer text,
    source_id text,
    "state" text,
    "type" text,
    updated_at text,
    url text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    verified_at text,
    verified_by text,
    -- flags_* (dynamic column),
    -- settings_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (default_team_id) REFERENCES team(id),
    FOREIGN KEY (default_template_id) REFERENCES template(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE canned_response_attachment (
    "index" text,
    canned_response_id text,
    cid text,
    "name" text,
    "size" text,
    "type" text,
    PRIMARY KEY ("index", canned_response_id),
    FOREIGN KEY (canned_response_id) REFERENCES canned_response(id)
);

CREATE TABLE canned_response (
    id text,
    created_by text,
    license_id text,
    team_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    rich_text_obj jsonb,
    shortcut jsonb,
    text text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE tags (
    id text,
    created_by text,
    license_id text,
    team_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE macros_team (
    macros_id text,
    team_id text,
    PRIMARY KEY (macros_id, team_id),
    FOREIGN KEY (macros_id) REFERENCES macros(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE macros_action (
    "index" text,
    macros_id text,
    agent_id text,
    canned_response_id text,
    tag_id text,
    team_id text,
    follower text,
    is_private text,
    priority text,
    random_agent text,
    round_robin text,
    spam text,
    "status" text,
    template jsonb,
    "type" text,
    PRIMARY KEY ("index", macros_id),
    FOREIGN KEY (macros_id) REFERENCES macros(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (canned_response_id) REFERENCES canned_response(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE macros (
    id text,
    agent_id text,
    created_by text,
    license_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE email_domain_dns_cname (
    "index" text,
    email_domain_id text,
    host text,
    "value" text,
    PRIMARY KEY ("index", email_domain_id),
    FOREIGN KEY (email_domain_id) REFERENCES email_domain(id)
);

CREATE TABLE email_domain_dns_txt (
    "index" text,
    email_domain_id text,
    host text,
    "value" text,
    PRIMARY KEY ("index", email_domain_id),
    FOREIGN KEY (email_domain_id) REFERENCES email_domain(id)
);

CREATE TABLE email_domain (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    inbox_used text,
    "name" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE mailbox (
    id text,
    agent_id text,
    created_by text,
    license_id text,
    team_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    description text,
    inbox_used text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE agent_role (
    "index" text,
    agent_id text,
    "role" text,
    PRIMARY KEY ("index", agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent_team (
    agent_id text,
    team_id text,
    PRIMARY KEY (agent_id, team_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE agent_attachment (
    "index" text,
    agent_id text,
    cid text,
    "name" text,
    "size" text,
    "type" text,
    PRIMARY KEY ("index", agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    auto_assignment text,
    created_at text,
    created_by_type text,
    email text,
    email_notifications_active text,
    email_verified text,
    google_analytics_client_id text,
    google_analytics_session_id text,
    invert_colors_in_dark_mode text,
    job_title text,
    "name" text,
    signature_rich_text_obj jsonb,
    signature_text text,
    "status" text,
    theme text,
    time_zone text,
    updated_at text,
    web_push_notifications_active text,
    weekly_reports text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE rule_action (
    "index" text,
    rule_id text,
    agent_id text,
    tag_id text,
    team_id text,
    canned_response_id text,
    followers text,
    is_private text,
    priority text,
    random_agent text,
    round_robin text,
    spam text,
    "status" text,
    template jsonb,
    "type" text,
    PRIMARY KEY ("index", rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE rule (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    active text,
    created_at text,
    created_by_type text,
    description text,
    limit_per_ticket text,
    "name" text,
    ordering text,
    quantifiers text,
    "trigger" jsonb,
    "type" text,
    updated_at text,
    use_counter text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE subscription (
    id text,
    license_id text,
    activated_at text,
    cancelled_at text,
    created_at text,
    current_period_ends_at text,
    current_period_started_at text,
    expires_at text,
    plan_code text,
    quantity text,
    "state" text,
    trial_ends_at text,
    trial_started_at text,
    unit_amount_in_cents text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (license_id) REFERENCES license(id)
);

CREATE TABLE trusted_email (
    id text,
    created_by text,
    license_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    email text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE team (
    id text,
    created_by text,
    license_id text,
    reply_address_id text,
    template_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    integration_external_id text,
    "name" text,
    notify_team_about_assigned_ticket text,
    notify_team_about_requesters_activity text,
    reply_name text,
    tag_reminder text,
    unauth_reply_creates_new_ticket text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (reply_address_id) REFERENCES reply_address(id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);

CREATE TABLE ticket_team (
    team_id text,
    ticket_id text,
    PRIMARY KEY (team_id, ticket_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_event (
    id text,
    ticket_id text,
    author_id text,
    author_type text,
    "date" text,
    detailed_source text,
    message_is_private text,
    message_text text,
    rich_text_obj text,
    source_from text,
    source_type text,
    status_new text,
    status_old text,
    "type" text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (author_id) REFERENCES agent(id)
);

CREATE TABLE ticket_follower (
    follower_id text,
    ticket_id text,
    PRIMARY KEY (follower_id, ticket_id),
    FOREIGN KEY (follower_id) REFERENCES agent(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_cc (
    email text,
    ticket_id text,
    "name" text,
    PRIMARY KEY (email, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_event_delivery_status (
    entity_id text,
    ticket_event_id text,
    ticket_id text,
    "date" text,
    "status" text,
    PRIMARY KEY (entity_id, ticket_event_id, ticket_id),
    FOREIGN KEY (ticket_event_id) REFERENCES ticket_event(ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket_event(id)
);

CREATE TABLE ticket_tag (
    tag_id text,
    ticket_id text,
    PRIMARY KEY (tag_id, ticket_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE child_ticket (
    id text,
    ticket_id text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    assignment_agent_id text,
    created_by text,
    license_id text,
    parent_ticket_id text,
    source_mailbox_id text,
    updated_by text,
    created_at text,
    created_by_type text,
    detected_language text,
    integration_reference_id text,
    integration_reference_type text,
    integration_reference_url text,
    integration_type text,
    integrations text,
    last_message_at text,
    priority text,
    rating_comment text,
    rating_rate text,
    rating_request_sent text,
    rating_requested_at text,
    requester_email text,
    requester_name text,
    silo text,
    source_detailed_source text,
    source_external text,
    source_from text,
    source_integration_type text,
    source_reference_id text,
    source_reference_type text,
    source_type text,
    spam_reason text,
    spam_status text,
    "status" text,
    subject text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignment_agent_id) REFERENCES agent(id),
    FOREIGN KEY (created_by) REFERENCES agent(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (parent_ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (source_mailbox_id) REFERENCES mailbox(id),
    FOREIGN KEY (updated_by) REFERENCES agent(id)
);
