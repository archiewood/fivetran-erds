CREATE TABLE news_item_reaction_history (
    "value" text,
    news_item_id text,
    PRIMARY KEY ("value", news_item_id),
    FOREIGN KEY (news_item_id) REFERENCES news_item_history(id)
);

CREATE TABLE ticket_type_attribute_history (
    id text,
    ticket_type_id text,
    archived boolean,
    created_at timestamp,
    data_type text,
    "default" boolean,
    description text,
    input_options jsonb,
    "name" text,
    "order" bigint,
    required_to_create boolean,
    required_to_create_for_contacts boolean,
    "type" text,
    updated_at timestamp,
    visible_on_create boolean,
    visible_to_contacts boolean,
    workspace_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_type_id) REFERENCES ticket_type_history(id)
);

-- sender_id  can point to either CONTACT.id
-- or ADMIN.id
CREATE TABLE news_item_history (
    id text,
    body text,
    cover_image_url text,
    created_at timestamp,
    deliver_silently boolean,
    sender_id text,
    "state" text,
    title text,
    "type" text,
    updated_at timestamp,
    workspace_id text,
    PRIMARY KEY (id)
);

CREATE TABLE tag (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_type_history (
    id text,
    archived boolean,
    category text,
    created_at timestamp,
    description text,
    icon text,
    is_internal boolean,
    "name" text,
    "type" text,
    updated_at timestamp,
    workspace_id text,
    PRIMARY KEY (id)
);

CREATE TABLE data_attribute (
    model text,
    "name" text,
    admin_id text,
    api_writable boolean,
    archived boolean,
    created_at timestamp,
    custom boolean,
    data_type text,
    description text,
    full_name text,
    id text,
    label text,
    messenger_writable boolean,
    "type" text,
    ui_writable boolean,
    updated_at timestamp,
    PRIMARY KEY (model, "name"),
    FOREIGN KEY (admin_id) REFERENCES "admin"(id)
);

CREATE TABLE conversation_ai_agent_content_source (
    "index" bigint,
    conversation_id text,
    content_type text,
    locale text,
    title text,
    url text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id)
);

CREATE TABLE contact_segment_history (
    contact_id text,
    segment_id text,
    contact_updated_at timestamp,
    PRIMARY KEY (contact_id, segment_id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (contact_updated_at) REFERENCES contact_history(id)
);

CREATE TABLE team_admin (
    admin_id text,
    team_id text,
    PRIMARY KEY (admin_id, team_id),
    FOREIGN KEY (admin_id) REFERENCES "admin"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE ticket_history (
    id text,
    ticket_state_id text,
    ticket_type_id text,
    admin_assignee_id text,
    category text,
    created_at timestamp,
    is_shared boolean,
    linked_objects_has_more boolean,
    linked_objects_total_count bigint,
    "open" boolean,
    snoozed_until timestamp,
    team_assignee_id text,
    ticket_id text,
    ticket_parts_total_count bigint,
    ticket_state text,
    ticket_state_external_label text,
    ticket_state_internal_label text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES conversation_history(id),
    FOREIGN KEY (ticket_state_id) REFERENCES ticket_state(id),
    FOREIGN KEY (ticket_type_id) REFERENCES ticket_type_history(id)
);

CREATE TABLE newsfeed_history (
    id text,
    created_at timestamp,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE contact_subscription_history (
    contact_id text,
    subscription_id text,
    contact_updated_at timestamp,
    consent_type text,
    PRIMARY KEY (contact_id, subscription_id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_type(id),
    FOREIGN KEY (contact_updated_at) REFERENCES contact_history(id)
);

CREATE TABLE article_history (
    id text,
    collection_id text,
    author_id text,
    body text,
    created_at timestamp,
    default_locale text,
    description text,
    parent_type text,
    section_id text,
    "state" text,
    title text,
    "type" text,
    updated_at timestamp,
    url text,
    workspace_id text,
    -- statistics_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (collection_id) REFERENCES collection_history(id)
);

CREATE TABLE "admin" (
    id text,
    away_mode_enabled boolean,
    away_mode_reassigned boolean,
    email text,
    has_inbox_seat boolean,
    job_title text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_tag_history (
    conversation_id text,
    tag_id text,
    conversation_updated_at timestamp,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(id)
);

CREATE TABLE ticket_state (
    id text,
    archived boolean,
    category text,
    external_label text,
    internal_label text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_tag_history (
    contact_id text,
    tag_id text,
    contact_updated_at timestamp,
    PRIMARY KEY (contact_id, tag_id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id),
    FOREIGN KEY (contact_updated_at) REFERENCES contact_history(id)
);

CREATE TABLE email_address_header (
    _fivetran_id text,
    conversation_part_id text,
    email_address text,
    "name" text,
    "type" text,
    PRIMARY KEY (_fivetran_id, conversation_part_id),
    FOREIGN KEY (conversation_part_id) REFERENCES conversation_part_history(id)
);

CREATE TABLE segment (
    id text,
    count integer,
    created_at timestamp,
    "name" text,
    person_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE contact_history (
    id text,
    admin_id bigint,
    android_app_name text,
    android_app_version text,
    android_device text,
    android_last_seen_at timestamp,
    android_os_version text,
    android_sdk_version text,
    avatar text,
    browser text,
    browser_language text,
    browser_version text,
    created_at timestamp,
    email text,
    enabled_push_messaging boolean,
    external_id text,
    formatted_phone text,
    has_hard_bounced boolean,
    ios_app_name text,
    ios_app_version text,
    ios_device text,
    ios_last_seen_at timestamp,
    ios_os_version text,
    ios_sdk_version text,
    language_override text,
    last_contacted_at timestamp,
    last_email_clicked_at timestamp,
    last_email_opened_at timestamp,
    last_replied_at timestamp,
    last_seen_at timestamp,
    location_city text,
    location_country text,
    location_region text,
    marked_email_as_spam boolean,
    "name" text,
    os text,
    phone text,
    referrer text,
    "role" text,
    signed_up_at timestamp,
    unsubscribed_from_emails boolean,
    updated_at timestamp,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    workspace_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (admin_id) REFERENCES "admin"(id)
);

CREATE TABLE subscription_type_content_type (
    "value" text,
    subscription_type_id text,
    PRIMARY KEY ("value", subscription_type_id),
    FOREIGN KEY (subscription_type_id) REFERENCES subscription_type(id)
);

CREATE TABLE company_segment_history (
    company_id text,
    segment_id text,
    company_updated_at timestamp,
    PRIMARY KEY (company_id, segment_id),
    FOREIGN KEY (company_id) REFERENCES company_history(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (company_updated_at) REFERENCES company_history(id)
);

CREATE TABLE conversation_part_attachment_history (
    url text,
    conversation_part_id text,
    conversation_part_updated_at timestamp,
    "name" text,
    PRIMARY KEY (url, conversation_part_id),
    FOREIGN KEY (conversation_part_id) REFERENCES conversation_part_history(id),
    FOREIGN KEY (conversation_part_updated_at) REFERENCES conversation_part_history(id)
);

CREATE TABLE call_transcript (
    _fivetran_id text,
    call_id bigint,
    content text,
    end_time text,
    speaker text,
    speaker_label text,
    start_time text,
    PRIMARY KEY (_fivetran_id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE survey_question (
    question_id bigint,
    receipt_id bigint,
    question text,
    response_type text,
    PRIMARY KEY (question_id, receipt_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt_response(receipt_id)
);

CREATE TABLE contact_data_event (
    id text,
    intercom_user_id text,
    created_at timestamp,
    email text,
    event_name text,
    "type" text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (intercom_user_id) REFERENCES contact_history(id)
);

CREATE TABLE help_center_history (
    id text,
    created_at timestamp,
    display_name text,
    identifier text,
    updated_at timestamp,
    website_turned_on boolean,
    workspace_id text,
    PRIMARY KEY (id)
);

CREATE TABLE news_item_label_history (
    "value" text,
    news_item_id text,
    PRIMARY KEY ("value", news_item_id),
    FOREIGN KEY (news_item_id) REFERENCES news_item_history(id)
);

CREATE TABLE ticket_link_history (
    id text,
    ticket_id text,
    category text,
    "type" text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket_history(id)
);

CREATE TABLE receipt_response (
    content_id bigint,
    receipt_id bigint,
    ruleset_id bigint,
    company_external_id text,
    company_id text,
    content_title text,
    content_type text,
    conversation_id bigint,
    created_via text,
    device text,
    email text,
    first_answer timestamp,
    first_button_tap timestamp,
    first_checklist_step_click timestamp,
    first_checklist_step_completion timestamp,
    first_checklist_step_open timestamp,
    first_checklist_step_receipt timestamp,
    first_click timestamp,
    first_collected_email timestamp,
    first_completion timestamp,
    first_dismissal timestamp,
    first_fin_helpful_answer timestamp,
    first_fin_step_reached timestamp,
    first_goal_success timestamp,
    first_hard_bounce timestamp,
    first_keyword_reply timestamp,
    first_open timestamp,
    first_people_reached_receipt timestamp,
    first_permission_grant timestamp,
    first_push_failure timestamp,
    first_reaction timestamp,
    first_reply timestamp,
    first_screen_view timestamp,
    first_series_completion timestamp,
    first_series_disengagement timestamp,
    first_series_exit timestamp,
    first_sms_failure timestamp,
    first_soft_bounce timestamp,
    first_spam_complaint timestamp,
    first_tour_step_failure timestamp,
    first_tour_step_view timestamp,
    first_unsubscribe timestamp,
    first_webhook_failure timestamp,
    first_whatsapp_failure timestamp,
    "name" text,
    node_id text,
    received_at timestamp,
    ruleset_version_id bigint,
    series_id bigint,
    series_title text,
    user_external_id text,
    user_id text,
    PRIMARY KEY (content_id, receipt_id, ruleset_id)
);

CREATE TABLE ticket_contact_history (
    id text,
    ticket_id text,
    external_id text,
    "type" text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (id) REFERENCES contact_history(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket_history(id)
);

-- author_id can point to either CONTACT.id
-- or ADMIN.id
CREATE TABLE ticket_part_history (
    id text,
    ticket_id text,
    app_package_code text,
    assigned_to_id text,
    assigned_to_type text,
    body text,
    created_at timestamp,
    external_id text,
    part_type text,
    previous_ticket_state text,
    redacted boolean,
    ticket_state text,
    "type" text,
    updated_at timestamp,
    -- author_* (dynamic column),
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket_history(id)
);

CREATE TABLE "call" (
    id bigint,
    admin_id text,
    contact_id text,
    conversation_id text,
    answered_at timestamp,
    call_type text,
    created_at timestamp,
    direction text,
    ended_at timestamp,
    ended_reason text,
    fin_recording_url text,
    fin_transcription_url text,
    initiated_at timestamp,
    phone text,
    recording_url text,
    "state" text,
    transcript_status text,
    transcription_url text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (admin_id) REFERENCES "admin"(id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id)
);

CREATE TABLE conversation_admin_history (
    admin_id text,
    conversation_id text,
    conversation_updated_at timestamp,
    PRIMARY KEY (admin_id, conversation_id),
    FOREIGN KEY (admin_id) REFERENCES "admin"(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(id)
);

CREATE TABLE conversation_contact_history (
    contact_id text,
    conversation_id text,
    conversation_updated_at timestamp,
    PRIMARY KEY (contact_id, conversation_id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(id)
);

CREATE TABLE team (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE newsfeed_assignment (
    news_item_id text,
    newsfeed_id text,
    published_at timestamp,
    PRIMARY KEY (news_item_id, newsfeed_id),
    FOREIGN KEY (news_item_id) REFERENCES news_item_history(id),
    FOREIGN KEY (newsfeed_id) REFERENCES newsfeed_history(id)
);

CREATE TABLE conversation_history (
    id text,
    conversation_rating_contact_id text,
    source_author_id text,
    assignee_id text,
    created_at timestamp,
    first_contact_reply_created_at timestamp,
    first_contact_reply_type text,
    first_contact_reply_url text,
    "open" boolean,
    priority text,
    "read" boolean,
    sla_name text,
    sla_status text,
    snoozed_until timestamp,
    "state" text,
    team_assignee_id text,
    title text,
    updated_at timestamp,
    waiting_since timestamp,
    -- ai_agent_* (dynamic column),
    -- conversation_rating_* (dynamic column),
    -- source_* (dynamic column),
    -- statistics_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_rating_contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (source_author_id) REFERENCES contact_history(id)
);

CREATE TABLE subscription_type_translation (
    "name" text,
    subscription_type_id text,
    description text,
    locale text,
    PRIMARY KEY ("name", subscription_type_id),
    FOREIGN KEY (subscription_type_id) REFERENCES subscription_type(id)
);

CREATE TABLE conversation_topic_history (
    id text,
    conversation_id text,
    conversation_updated_at timestamp,
    "name" text,
    "type" text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(id)
);

CREATE TABLE admin_activity_log (
    id text,
    performed_by_id text,
    activity_description text,
    activity_type text,
    created_at timestamp,
    metadata jsonb,
    performed_by_ip text,
    performed_by_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (performed_by_id) REFERENCES "admin"(id)
);

-- author_id can point to either CONTACT.id
-- or ADMIN.id
-- assigned_to_id can point to either ADMIN.id or TEAM.id
CREATE TABLE conversation_part_history (
    id text,
    conversation_id text,
    conversation_updated_at timestamp,
    app_package_code text,
    assigned_to_id text,
    assigned_to_type text,
    author_id text,
    author_type text,
    body text,
    created_at timestamp,
    email_message_metadata_subject text,
    notified_at timestamp,
    part_type text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(id)
);

CREATE TABLE company_history (
    id text,
    app_id text,
    company_id text,
    created_at timestamp,
    industry text,
    last_request_at timestamp,
    monthly_spend integer,
    "name" text,
    plan_id text,
    plan_name text,
    remote_created_at timestamp,
    session_count integer,
    "size" integer,
    updated_at timestamp,
    user_count integer,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE team_admin_priority_level (
    admin_id text,
    team_id text,
    priority text,
    PRIMARY KEY (admin_id, team_id),
    FOREIGN KEY (admin_id) REFERENCES "admin"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE subscription_type (
    id text,
    consent_type text,
    default_translation_description text,
    default_translation_locale text,
    default_translation_name text,
    "state" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE collection_history (
    id text,
    help_center_id text,
    created_at timestamp,
    default_locale text,
    description text,
    icon text,
    "name" text,
    "order" integer,
    parent_id text,
    "type" text,
    updated_at timestamp,
    url text,
    workspace_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (help_center_id) REFERENCES help_center_history(id)
);

CREATE TABLE contact_social_profile_history (
    "name" text,
    user_id text,
    user_updated_at timestamp,
    url text,
    PRIMARY KEY ("name", user_id),
    FOREIGN KEY (user_id) REFERENCES contact_history(id),
    FOREIGN KEY (user_updated_at) REFERENCES contact_history(id)
);

CREATE TABLE conversation_part_tag_history (
    conversation_part_id text,
    tag_id text,
    conversation_part_updated_at timestamp,
    PRIMARY KEY (conversation_part_id, tag_id),
    FOREIGN KEY (conversation_part_id) REFERENCES conversation_part_history(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id),
    FOREIGN KEY (conversation_part_updated_at) REFERENCES conversation_part_history(id)
);

CREATE TABLE company_tag_history (
    company_id text,
    tag_id text,
    company_updated_at timestamp,
    PRIMARY KEY (company_id, tag_id),
    FOREIGN KEY (company_id) REFERENCES company_history(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id),
    FOREIGN KEY (company_updated_at) REFERENCES company_history(id)
);

CREATE TABLE survey_answer (
    question_id bigint,
    receipt_id bigint,
    answered_at timestamp,
    response text,
    PRIMARY KEY (question_id, receipt_id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id),
    FOREIGN KEY (receipt_id) REFERENCES survey_question(receipt_id)
);

CREATE TABLE contact_company_history (
    company_id text,
    contact_id text,
    contact_updated_at timestamp,
    PRIMARY KEY (company_id, contact_id),
    FOREIGN KEY (company_id) REFERENCES company_history(id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (contact_updated_at) REFERENCES contact_history(id)
);

CREATE TABLE data_attribute_option (
    "value" text,
    data_attribute_model text,
    data_attribute_name text,
    PRIMARY KEY ("value", data_attribute_model, data_attribute_name),
    FOREIGN KEY (data_attribute_model) REFERENCES data_attribute("name"),
    FOREIGN KEY (data_attribute_name) REFERENCES data_attribute("name")
);

CREATE TABLE ticket_part_attachment_history (
    "index" integer,
    ticket_id text,
    ticket_part_id text,
    content_type text,
    filesize bigint,
    height integer,
    "name" text,
    "type" text,
    url text,
    width integer,
    PRIMARY KEY ("index", ticket_id, ticket_part_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket_history(id),
    FOREIGN KEY (ticket_part_id) REFERENCES ticket_part_history(id)
);
