CREATE TABLE section_faq (
    faq_id text,
    section_id text,
    PRIMARY KEY (faq_id, section_id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE "section" (
    id text,
    app_id text,
    created_at text,
    icon text,
    image text,
    title text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE platform (
    id text,
    app_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app (
    id text,
    logo text,
    publish_id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE analytic_faq (
    _fivetran_id text,
    app_id text,
    section_id text,
    dislike text,
    id text,
    languages text,
    last_updated_at text,
    likes text,
    platform_type text,
    row_id text,
    section_title text,
    "time" text,
    title text,
    "view" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE data_portability (
    hs_request_id text,
    encrypted_zip text,
    eta text,
    external_request_id text,
    hs_data_url text,
    reason text,
    request_app_publish_id text,
    request_external_request_id text,
    request_property text,
    request_value text,
    "status" text,
    url_valid_until text,
    PRIMARY KEY (hs_request_id)
);

CREATE TABLE agent (
    id text,
    avatar text,
    email text,
    last_login_at text,
    "name" text,
    nickname text,
    "role" text,
    team_name text,
    PRIMARY KEY (id)
);

CREATE TABLE issue_tag (
    tag_name text,
    issue_id text,
    PRIMARY KEY (tag_name, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE private_note_email (
    email text,
    issue_id text,
    private_note_author_id text,
    PRIMARY KEY (email, issue_id, private_note_author_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (private_note_author_id) REFERENCES private_note(author_id)
);

CREATE TABLE private_note (
    author_id text,
    issue_id text,
    author_name text,
    body text,
    created_at text,
    phone_number text,
    PRIMARY KEY (author_id, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE message_author_email (
    email text,
    message_author_id text,
    message_id text,
    PRIMARY KEY (email, message_author_id, message_id),
    FOREIGN KEY (message_author_id) REFERENCES message(author_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_intent_label (
    label_id text,
    message_author_id text,
    message_id text,
    PRIMARY KEY (label_id, message_author_id, message_id),
    FOREIGN KEY (message_author_id) REFERENCES message(author_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_attachment (
    _fivetran_id text,
    message_author_id text,
    message_id text,
    content_type text,
    file_name text,
    "size" text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (message_author_id) REFERENCES message(author_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message (
    author_id text,
    id text,
    issue_id text,
    attachment_content_type text,
    attachment_file_name text,
    attachment_size text,
    attachment_url text,
    author_name text,
    author_phone_number text,
    body text,
    created_at text,
    origin text,
    PRIMARY KEY (author_id, id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue (
    id text,
    app_publish_id text,
    assignee_id text,
    queue_id text,
    app_id text,
    author_email text,
    author_name text,
    changed_at text,
    created_at text,
    current_predict_label text,
    domain text,
    feedback_comment text,
    feedback_rating text,
    hs_user_id text,
    intent_group_id text,
    intent_group_name text,
    intent_id text,
    intent_name text,
    original_predict_label text,
    redacted text,
    "state" text,
    title text,
    updated_at text,
    -- custom_* (dynamic column),
    -- meta_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (app_publish_id) REFERENCES app(publish_id),
    FOREIGN KEY (assignee_id) REFERENCES agent(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE analytic_custom_bot (
    id text,
    agent_interruption text,
    automation_interruption text,
    avg_completion_time text,
    cifs_mapped text,
    completion text,
    inbound_messages text,
    invocation text,
    issues_rejected text,
    issues_reopened text,
    issues_resolved text,
    "name" text,
    outbound_message text,
    row_id text,
    "status" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE queue (
    id text,
    active text,
    auto_assignment_enabled text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE analytic_open_issue (
    _fivetran_id text,
    app_id text,
    languages text,
    open_issues text,
    platform_type text,
    row_id text,
    "time" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE analytic_agent_group (
    "type" text,
    analytic_agent_id text,
    analytic_agent_time text,
    PRIMARY KEY ("type", analytic_agent_id, analytic_agent_time),
    FOREIGN KEY (analytic_agent_id) REFERENCES analytic_agent(id),
    FOREIGN KEY (analytic_agent_time) REFERENCES analytic_agent("time")
);

CREATE TABLE analytic_agent (
    id text,
    "time" text,
    accepted_resolution text,
    available_time text,
    avg_csat text,
    avg_outbound_messages_per_resolved text,
    avg_tter text,
    avg_ttfr text,
    avg_ttr text,
    csat_1_count text,
    csat_2_count text,
    csat_3_count text,
    csat_4_count text,
    csat_5_count text,
    csat_count text,
    duplicates_marked text,
    email text,
    inbound_phone_call text,
    issue_assign text,
    issue_reject text,
    issue_resolve text,
    loggedin_time text,
    "name" text,
    online_time text,
    outbound_message text,
    outbound_phone_call text,
    rejected_resolution text,
    reopen text,
    row_id text,
    team_id text,
    team_name text,
    tter_count text,
    ttfr_count text,
    ttr_count text,
    PRIMARY KEY (id, "time")
);

CREATE TABLE analytic_custom_bot_step (
    id text,
    custom_bot_id text,
    custom_bot_name text,
    invocation text,
    "name" text,
    row_id text,
    skip text,
    "time" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES analytic_custom_bot(id)
);

CREATE TABLE analytic_support (
    _fivetran_id text,
    app_id text,
    avg_csat text,
    avg_tter text,
    avg_ttfr text,
    avg_ttr text,
    conversations_started text,
    csat_1_count text,
    csat_2_count text,
    csat_3_count text,
    csat_4_count text,
    csat_5_count text,
    csat_count text,
    inbound_message text,
    issue_assign text,
    issues_created text,
    issues_first_responded text,
    languages text,
    outbound_message text,
    platform_type text,
    rejects_by_agent text,
    rejects_by_automation text,
    reopen text,
    resolves_by_agent text,
    resolves_by_automation text,
    row_id text,
    "time" text,
    tter_count text,
    ttfr_count text,
    ttr_count text,
    widget_load text,
    widget_opens_existing_issue text,
    widget_opens_no_existing_issue text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE translation_lg_stag (
    stag text,
    faq_id text,
    PRIMARY KEY (stag, faq_id),
    FOREIGN KEY (faq_id) REFERENCES faq(id)
);

CREATE TABLE faq_issue_tag (
    tag_name text,
    faq_id text,
    PRIMARY KEY (tag_name, faq_id),
    FOREIGN KEY (faq_id) REFERENCES faq(id)
);

CREATE TABLE platform_type (
    "type" text,
    faq_id text,
    PRIMARY KEY ("type", faq_id),
    FOREIGN KEY (faq_id) REFERENCES faq(id)
);

CREATE TABLE linked_faq (
    id text,
    faq_id text,
    PRIMARY KEY (id, faq_id),
    FOREIGN KEY (faq_id) REFERENCES faq(id)
);

CREATE TABLE faq (
    id text,
    app_id text,
    publish_id text,
    section_id text,
    created_at text,
    last_updated_by text,
    published text,
    slug text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (publish_id) REFERENCES app(publish_id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE translation_lg (
    _fivetran_id text,
    faq_id text,
    body text,
    content_updated_at text,
    title text,
    translation_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (faq_id) REFERENCES faq(id)
);

CREATE TABLE analytic_issue_tag (
    tag_name text,
    analytic_issue_id text,
    PRIMARY KEY (tag_name, analytic_issue_id),
    FOREIGN KEY (analytic_issue_id) REFERENCES analytic_issue(id)
);

CREATE TABLE analytic_issue (
    id text,
    assignee_id text,
    accepted_resolution text,
    agent_outbound_message text,
    app_id text,
    automation_category_by_outbound_message text,
    automation_subcategory_by_outbound_message text,
    avg_tter text,
    created_at text,
    current_queue_id text,
    current_queue_name text,
    custombot_outbound_message text,
    email text,
    external_user_id text,
    feedback_at text,
    feedback_comment text,
    feedback_rating text,
    first_assigned_at text,
    first_responded_at text,
    handling_time text,
    holding_time text,
    inbound_message text,
    inbound_phone_call text,
    initial_queue_id text,
    initial_queue_name text,
    is_from_phone_deflection text,
    languages text,
    last_resolved_at text,
    original_issue_id text,
    other_outbound_message text,
    outbound_message text,
    outbound_phone_call text,
    phone_escalation text,
    platform_type text,
    rejected_resolution text,
    reopen text,
    row_id text,
    "state" text,
    tter_count text,
    tter_sum text,
    ttfa text,
    ttfr text,
    ttr text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES agent(id)
);
