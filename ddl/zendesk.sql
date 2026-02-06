-- Notes
--   - Zendesk__ticket_metrics and other models must be created through Transformations.
--   - Tags provide additional context about tickets, organizations and users and are used in automations.

-- SLA Policies are a Zendesk Professional or Enterprise feature
CREATE TABLE group_sla_policy_history (
    id text,
    created_at timestamp,
    description text,
    "position" bigint,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE agent_condition_required_status (
    _fivetran_id text,
    agent_condition_id text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agent_condition_id) REFERENCES agent_condition(_fivetran_id)
);

CREATE TABLE alert_recipient (
    ticket_alert_id bigint,
    user_id bigint,
    PRIMARY KEY (ticket_alert_id, user_id),
    FOREIGN KEY (ticket_alert_id) REFERENCES ticket_alert(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE macro_action (
    field text,
    macro_id bigint,
    "value" jsonb,
    PRIMARY KEY (field, macro_id),
    FOREIGN KEY (macro_id) REFERENCES macro(id)
);

CREATE TABLE call_leg (
    id bigint,
    agent_id bigint,
    call_id bigint,
    user_id bigint,
    available_via text,
    call_charge text,
    completion_status text,
    conference_from bigint,
    conference_time bigint,
    conference_to bigint,
    consultation_from bigint,
    consultation_time bigint,
    consultation_to bigint,
    created_at timestamp,
    duration bigint,
    forwarded_to text,
    hold_time bigint,
    minutes_billed bigint,
    talk_time bigint,
    transferred_from bigint,
    transferred_to bigint,
    "type" text,
    updated_at timestamp,
    wrap_up_time bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id),
    FOREIGN KEY (call_id) REFERENCES call_metric(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE satisfaction_rating (
    id bigint,
    assignee_id bigint,
    group_id bigint,
    requester_id bigint,
    ticket_id bigint,
    "comment" text,
    created_at timestamp,
    reason text,
    score text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES "user"(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (requester_id) REFERENCES "user"(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_email_cc (
    ticket_id bigint,
    user_id bigint,
    PRIMARY KEY (ticket_id, user_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE csat_survey_closed_ended_option (
    option_id text,
    question_id text,
    survey_id text,
    survey_version bigint,
    label_key text,
    label_type text,
    label_value text,
    PRIMARY KEY (option_id, question_id, survey_id, survey_version)
);

CREATE TABLE badge (
    id text,
    badge_category_id text,
    created_at timestamp,
    description text,
    icon_url text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (badge_category_id) REFERENCES badge_category(id)
);

-- content_id refers to the ID of an Article, Post, Topic, or Section
-- content_type is either Article, Post, Topic, or Section
CREATE TABLE content_subscription (
    id bigint,
    user_id bigint,
    content_id bigint,
    content_type text,
    created_at timestamp,
    include_comments boolean,
    locale text,
    source_locale text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE line (
    id bigint,
    brand_id bigint,
    ivr_id bigint,
    schedule_id bigint,
    call_recording_consent text,
    country_code text,
    created_at timestamp,
    default_group_id bigint,
    display_number text,
    external boolean,
    failover_number text,
    line_type text,
    location text,
    "name" text,
    nickname text,
    number text,
    outbound_enabled boolean,
    outbound_number text,
    priority bigint,
    recorded boolean,
    sms_enabled boolean,
    sms_group_id bigint,
    token text,
    toll_free boolean,
    transcription boolean,
    voice_enabled boolean,
    -- capabilities_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (ivr_id) REFERENCES ivr(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE ticket_alert (
    id bigint,
    ticket_id bigint,
    user_id bigint,
    body text,
    created timestamp,
    resource text,
    subject text,
    "type" text,
    via_channel text,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_chat_event (
    created_at timestamp,
    chat_id text,
    actor_id text,
    chat_index bigint,
    external_message_id text,
    filename text,
    is_history_context boolean,
    message text,
    message_id text,
    message_source text,
    mime_type text,
    original_message jsonb,
    original_message_type text,
    parent_message_id text,
    reason text,
    "size" bigint,
    "status" text,
    status_updated_at timestamp,
    "type" text,
    url text,
    PRIMARY KEY (created_at, chat_id),
    FOREIGN KEY (chat_id) REFERENCES ticket_chat(chat_id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE custom_role (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    role_type bigint,
    updated_at timestamp,
    -- configuration_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE ticket_side_conversation_event (
    id text,
    side_conversation_id text,
    actor_support_agent_id text,
    actor_support_group_id text,
    actor_user_id bigint,
    message_from_support_agent_id text,
    message_from_support_group_id text,
    message_from_user_id bigint,
    actor_email text,
    actor_msteams_channel_id text,
    actor_name text,
    actor_slack_channel_id text,
    actor_slack_workspace_id text,
    created_at timestamp,
    "type" text,
    updated_state text,
    updated_subject text,
    via text,
    -- message_* (dynamic column),
    PRIMARY KEY (id, side_conversation_id),
    FOREIGN KEY (actor_support_agent_id) REFERENCES "user"(id),
    FOREIGN KEY (actor_support_group_id) REFERENCES "group"(id),
    FOREIGN KEY (actor_user_id) REFERENCES "user"(id),
    FOREIGN KEY (message_from_support_agent_id) REFERENCES "user"(id),
    FOREIGN KEY (message_from_support_group_id) REFERENCES "group"(id),
    FOREIGN KEY (message_from_user_id) REFERENCES "user"(id)
);

CREATE TABLE time_zone (
    time_zone text,
    standard_offset text,
    PRIMARY KEY (time_zone)
);

CREATE TABLE ticket_macro_reference (
    id bigint,
    ticket_id bigint,
    user_id bigint,
    created timestamp,
    macro_deleted boolean,
    macro_id text,
    macro_title text,
    via_channel text,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_attribute (
    attribute_name text,
    "value" text,
    ticket_id bigint,
    PRIMARY KEY (attribute_name, "value", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE user_segment_organization (
    organization_id bigint,
    user_segment_id bigint,
    PRIMARY KEY (organization_id, user_segment_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_segment_id) REFERENCES user_segment(id)
);

CREATE TABLE user_segment_tag (
    is_or_tag boolean,
    tag text,
    user_segment_id bigint,
    PRIMARY KEY (is_or_tag, tag, user_segment_id),
    FOREIGN KEY (user_segment_id) REFERENCES user_segment(id)
);

CREATE TABLE ticket_chat (
    chat_id text,
    ticket_id bigint,
    user_id bigint,
    authenticated boolean,
    backend text,
    channel text,
    conversation_id text,
    initiator text,
    integration_id text,
    tags jsonb,
    visitor_id text,
    webpath jsonb,
    PRIMARY KEY (chat_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_tag (
    tag text,
    ticket_id bigint,
    PRIMARY KEY (tag, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE article (
    id bigint,
    author_id bigint,
    permission_group_id bigint,
    body text,
    comments_disabled boolean,
    created_at timestamp,
    draft boolean,
    edited_at timestamp,
    html_url text,
    locale text,
    "name" text,
    outdated boolean,
    "position" integer,
    promoted boolean,
    section_id text,
    source_locale text,
    title text,
    updated_at timestamp,
    url text,
    user_segment_id bigint,
    vote_count integer,
    vote_sum integer,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (permission_group_id) REFERENCES "group"(id)
);

CREATE TABLE article_outdated_locale (
    outdated_locale text,
    article_id bigint,
    PRIMARY KEY (outdated_locale, article_id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE ivr_menu_route (
    id bigint,
    ivr_menu_id bigint,
    "action" text,
    greeting text,
    keypress text,
    option_text text,
    -- options_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ivr_menu_id) REFERENCES ivr_menu(id)
);

CREATE TABLE csat_survey_answer (
    question_id text,
    survey_response_id text,
    rating bigint,
    selections_option_id text,
    created_at timestamp,
    rating_category text,
    selections_type text,
    "type" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (question_id, survey_response_id),
    FOREIGN KEY (question_id) REFERENCES csat_survey_question(survey_id),
    FOREIGN KEY (survey_response_id) REFERENCES ticket_csat_survey(ticket_id),
    FOREIGN KEY (rating) REFERENCES csat_survey_rating_option(survey_id),
    FOREIGN KEY (selections_option_id) REFERENCES csat_survey_closed_ended_option(survey_id)
);

CREATE TABLE agent_status_type_group (
    agent_status_type_id bigint,
    group_id text,
    PRIMARY KEY (agent_status_type_id, group_id),
    FOREIGN KEY (agent_status_type_id) REFERENCES agent_status_type(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id)
);

CREATE TABLE user_identity (
    id bigint,
    user_id bigint,
    created_at timestamp,
    deliverable_state text,
    is_primary boolean,
    "type" text,
    undeliverable_count bigint,
    updated_at timestamp,
    url text,
    "value" text,
    verification_method text,
    verified boolean,
    verified_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE greeting_ivr (
    id bigint,
    greeting_id text,
    PRIMARY KEY (id, greeting_id),
    FOREIGN KEY (greeting_id) REFERENCES greeting(id)
);

CREATE TABLE automation_condition (
    _fivetran_id text,
    automation_id bigint,
    condition_type text,
    field text,
    operator text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id, automation_id),
    FOREIGN KEY (automation_id) REFERENCES automation(id)
);

CREATE TABLE organization (
    id bigint,
    group_id bigint,
    created_at timestamp,
    details text,
    external_id text,
    "name" text,
    notes text,
    shared_comments boolean,
    shared_tickets boolean,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES "group"(id)
);

CREATE TABLE article_label_name (
    label_name text,
    article_id bigint,
    PRIMARY KEY (label_name, article_id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE content_tag (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_group_sla_policy (
    group_sla_policy_id text,
    ticket_id bigint,
    group_policy_applied_at timestamp,
    PRIMARY KEY (group_sla_policy_id, ticket_id),
    FOREIGN KEY (group_sla_policy_id) REFERENCES group_sla_policy_history(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE domain_name (
    "index" integer,
    organization_id bigint,
    domain_name text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE "section" (
    id bigint,
    category_id bigint,
    created_at timestamp,
    description text,
    html_url text,
    locale text,
    "name" text,
    outdated boolean,
    parent_section_id bigint,
    "position" bigint,
    sorting text,
    source_locale text,
    theme_template text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE locale (
    id bigint,
    updated_at timestamp,
    created_at timestamp,
    "default" boolean,
    locale text,
    "name" text,
    native_name text,
    presentation_name text,
    rtl boolean,
    url text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE call_metric (
    id bigint,
    agent_id bigint,
    call_group_id bigint,
    phone_number_id bigint,
    ticket_id bigint,
    call_charge text,
    call_recording_consent text,
    call_recording_consent_action text,
    call_recording_consent_keypress text,
    callback boolean,
    callback_source text,
    completion_status text,
    consultation_time bigint,
    created_at timestamp,
    customer_requested_voicemail boolean,
    default_group boolean,
    direction text,
    duration bigint,
    exceeded_queue_wait_time boolean,
    hold_time bigint,
    ivr_action text,
    ivr_destination_group_name text,
    ivr_hops bigint,
    ivr_routed_to text,
    ivr_time_spent bigint,
    minutes_billed bigint,
    not_recording_time bigint,
    outside_business_hours boolean,
    overflowed boolean,
    overflowed_to text,
    phone_number text,
    quality_issues jsonb,
    recording_control_interactions integer,
    recording_time bigint,
    talk_time bigint,
    time_to_answer bigint,
    updated_at timestamp,
    voicemail boolean,
    wait_time bigint,
    wrap_up_time bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id),
    FOREIGN KEY (call_group_id) REFERENCES "group"(id),
    FOREIGN KEY (phone_number_id) REFERENCES line(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_field_history (
    updated timestamp,
    field_name text,
    ticket_id bigint,
    user_id bigint,
    "value" text,
    via_channel text,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    PRIMARY KEY (updated, field_name, ticket_id),
    FOREIGN KEY (field_name) REFERENCES ticket_custom_field(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_collaborator (
    ticket_id bigint,
    user_id bigint,
    PRIMARY KEY (ticket_id, user_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE agent_condition (
    _fivetran_id text,
    child_field_id bigint,
    parent_field_id bigint,
    ticket_form_id bigint,
    is_required boolean,
    parent_field_type text,
    required_on_statuses_type text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (child_field_id) REFERENCES ticket_custom_field(id),
    FOREIGN KEY (parent_field_id) REFERENCES ticket_custom_field(id),
    FOREIGN KEY (ticket_form_id) REFERENCES ticket_form_history(id)
);

CREATE TABLE user_subscription (
    id bigint,
    followed_id bigint,
    follower_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (followed_id) REFERENCES "user"(id),
    FOREIGN KEY (follower_id) REFERENCES "user"(id)
);

CREATE TABLE tweet_recipient (
    ticket_comment_id bigint,
    user_id bigint,
    PRIMARY KEY (ticket_comment_id, user_id),
    FOREIGN KEY (ticket_comment_id) REFERENCES ticket_comment(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE badge_category (
    id text,
    brand_id text,
    created_at timestamp,
    "name" text,
    slug text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE user_segment_group (
    group_id bigint,
    user_segment_id bigint,
    PRIMARY KEY (group_id, user_segment_id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (user_segment_id) REFERENCES user_segment(id)
);

CREATE TABLE user_segment_added_user (
    user_id bigint,
    user_segment_id bigint,
    PRIMARY KEY (user_id, user_segment_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (user_segment_id) REFERENCES user_segment(id)
);

CREATE TABLE suspended_ticket_attachment (
    id bigint,
    suspended_ticket_id bigint,
    content_type text,
    content_url text,
    deleted boolean,
    file_name text,
    height bigint,
    inline boolean,
    malware_access_override boolean,
    malware_scan_result text,
    mapped_content_url text,
    "size" bigint,
    width bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (suspended_ticket_id) REFERENCES suspended_ticket(id)
);

CREATE TABLE schedule_holiday (
    id bigint,
    schedule_id bigint,
    end_date text,
    "name" text,
    start_date text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE ticket_form_restricted_brand (
    brand_id bigint,
    ticket_form_id bigint,
    PRIMARY KEY (brand_id, ticket_form_id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (ticket_form_id) REFERENCES ticket_form_history(id)
);

CREATE TABLE ticket_custom_field (
    id bigint,
    active boolean,
    agent_description text,
    collapsed_for_agents boolean,
    created_at timestamp,
    description text,
    editable_in_portal boolean,
    "key" text,
    "position" integer,
    raw_description text,
    raw_title text,
    raw_title_in_portal text,
    regexp_for_validation text,
    relationship_target_type text,
    removable boolean,
    required boolean,
    required_in_portal boolean,
    sub_type_id integer,
    system boolean,
    tag text,
    title text,
    title_in_portal text,
    "type" text,
    updated_at timestamp,
    url text,
    visible_in_portal boolean,
    PRIMARY KEY (id)
);

CREATE TABLE ivr_menu_route_option (
    group_id bigint,
    ivr_menu_route_id bigint,
    PRIMARY KEY (group_id, ivr_menu_route_id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (ivr_menu_route_id) REFERENCES ivr_menu_route(id)
);

CREATE TABLE sla_policy_metric_history (
    "index" integer,
    sla_policy_id bigint,
    sla_policy_updated_at timestamp,
    business_hours boolean,
    metric text,
    priority text,
    target bigint,
    PRIMARY KEY ("index", sla_policy_id, sla_policy_updated_at),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy_history(id),
    FOREIGN KEY (sla_policy_updated_at) REFERENCES sla_policy_history(id)
);

CREATE TABLE skip_ticket_history (
    id bigint,
    updated_at timestamp,
    ticket_id bigint,
    user_id bigint,
    created_at timestamp,
    reason text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE automation_action (
    field text,
    automation_id bigint,
    "value" jsonb,
    PRIMARY KEY (field, automation_id),
    FOREIGN KEY (automation_id) REFERENCES automation(id)
);

CREATE TABLE brand (
    id bigint,
    active boolean,
    brand_url text,
    "default" boolean,
    has_help_center boolean,
    help_center_state text,
    "name" text,
    subdomain text,
    url text,
    -- logo_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE daylight_time (
    time_zone text,
    "year" integer,
    daylight_end_utc text,
    daylight_offset integer,
    daylight_start_utc text,
    PRIMARY KEY (time_zone, "year")
);

CREATE TABLE ivr (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE "trigger" (
    id bigint,
    active boolean,
    app_installation jsonb,
    category_id text,
    created_at timestamp,
    "default" boolean,
    description text,
    permissions jsonb,
    "position" text,
    raw_title text,
    title text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

-- SLA Policies are a Zendesk Professional or Enterprise feature
CREATE TABLE group_sla_policy_metric_history (
    metric text,
    priority text,
    group_sla_policy_id text,
    business_hours boolean,
    target bigint,
    PRIMARY KEY (metric, priority, group_sla_policy_id),
    FOREIGN KEY (group_sla_policy_id) REFERENCES group_sla_policy_history(id)
);

CREATE TABLE user_vote (
    id bigint,
    user_id bigint,
    created_at timestamp,
    item_id bigint,
    item_type text,
    updated_at timestamp,
    "value" bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_field_option (
    "value" text,
    ticket_custom_field_id bigint,
    "default" boolean,
    id bigint,
    "name" text,
    PRIMARY KEY ("value"),
    FOREIGN KEY (ticket_custom_field_id) REFERENCES ticket_custom_field(id)
);

CREATE TABLE ticket_custom_status (
    id bigint,
    ticket_custom_field_id bigint,
    active boolean,
    agent_label text,
    created_at text,
    "default" boolean,
    description text,
    end_user_description text,
    end_user_label text,
    status_category text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_custom_field_id) REFERENCES ticket_custom_field(id)
);

CREATE TABLE agent_status_type (
    id bigint,
    channels_messaging text,
    channels_support text,
    channels_talk text,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE post (
    id bigint,
    updated_at timestamp,
    author_id bigint,
    topic_id bigint,
    closed boolean,
    comment_count integer,
    created_at timestamp,
    details text,
    featured boolean,
    follower_count integer,
    html_url text,
    pinned boolean,
    "status" text,
    title text,
    url text,
    vote_count integer,
    vote_sum integer,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (topic_id) REFERENCES forum_topic(id)
);

CREATE TABLE forum_topic (
    id bigint,
    community_id bigint,
    created_at timestamp,
    description text,
    follower_count bigint,
    html_url text,
    manageable_by text,
    "name" text,
    "position" bigint,
    updated_at timestamp,
    url text,
    user_segment_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE agent_channel_history (
    channel text,
    agent_id bigint,
    updated_at timestamp,
    PRIMARY KEY (channel, agent_id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_form_history (
    id bigint,
    updated_at timestamp,
    active boolean,
    created_at timestamp,
    "default" boolean,
    display_name text,
    end_user_visible boolean,
    in_all_brands boolean,
    "name" text,
    "position" bigint,
    raw_display_name text,
    raw_name text,
    url text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE macro (
    id bigint,
    active boolean,
    app_installation jsonb,
    created_at timestamp,
    "default" boolean,
    description text,
    permissions jsonb,
    "position" text,
    restriction jsonb,
    title text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE audit_log (
    id bigint,
    actor_id bigint,
    "action" text,
    change_description text,
    created_at timestamp,
    source_id bigint,
    source_label text,
    source_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE user_segment (
    id bigint,
    built_in boolean,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    user_type text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_status_history (
    channel text,
    agent_id bigint,
    new_state text,
    previous_state text,
    updated_at timestamp,
    PRIMARY KEY (channel, agent_id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_comment (
    id bigint,
    ticket_id bigint,
    user_id bigint,
    body text,
    created timestamp,
    facebook_comment boolean,
    html_body text,
    metadata text,
    plain_body text,
    tweet boolean,
    via_channel text,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    voice_comment boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE agent_max_capacity_history (
    channel text,
    agent_id bigint,
    "current" bigint,
    previous bigint,
    updated_at timestamp,
    PRIMARY KEY (channel, agent_id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id)
);

CREATE TABLE ticket (
    id bigint,
    assignee_id bigint,
    brand_id bigint,
    custom_status_id bigint,
    forum_topic_id bigint,
    group_id bigint,
    organization_id bigint,
    requester_id bigint,
    submitter_id bigint,
    allow_attachments boolean,
    allow_channelback boolean,
    created_at timestamp,
    description text,
    due_at timestamp,
    external_id text,
    followup_ids jsonb,
    from_messaging_channel boolean,
    has_incidents boolean,
    is_public boolean,
    merged_ticket_ids jsonb,
    priority text,
    problem_id bigint,
    raw_subject text,
    recipient text,
    "status" text,
    subject text,
    ticket_form_id bigint,
    "type" text,
    updated_at timestamp,
    url text,
    via_channel text,
    via_followup_source_id bigint,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES "user"(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (custom_status_id) REFERENCES ticket_custom_status(id),
    FOREIGN KEY (forum_topic_id) REFERENCES forum_topic(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (requester_id) REFERENCES "user"(id),
    FOREIGN KEY (submitter_id) REFERENCES "user"(id)
);

-- SLA Policies are a Zendesk Professional or Enterprise feature
CREATE TABLE sla_policy_history (
    id bigint,
    updated_at timestamp,
    created_at timestamp,
    description text,
    "position" bigint,
    title text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE article_comment (
    id bigint,
    author_id bigint,
    non_author_editor_id bigint,
    source_id bigint,
    body text,
    created_at timestamp,
    html_url text,
    locale text,
    non_author_updated_at timestamp,
    official boolean,
    source_type text,
    updated_at timestamp,
    url text,
    vote_count bigint,
    vote_sum bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (non_author_editor_id) REFERENCES "user"(id),
    FOREIGN KEY (source_id) REFERENCES article(id)
);

CREATE TABLE ticket_comment_attachment (
    id bigint,
    ticket_comment_id bigint,
    content_type text,
    content_url text,
    deleted boolean,
    file_name text,
    height bigint,
    inline boolean,
    malware_access_override boolean,
    malware_scan_result text,
    mapped_content_url text,
    "size" bigint,
    width bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_comment_id) REFERENCES ticket_comment(id)
);

CREATE TABLE organization_member (
    id bigint,
    organization_id bigint,
    user_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE organization_tag (
    tag text,
    organization_id bigint,
    PRIMARY KEY (tag, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE automation (
    id bigint,
    active boolean,
    app_installation jsonb,
    created_at timestamp,
    "default" boolean,
    permissions jsonb,
    "position" text,
    raw_title text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE "user" (
    id bigint,
    custom_role_id bigint,
    default_group_id bigint,
    organization_id bigint,
    active boolean,
    alias text,
    authenticity_token text,
    chat_only boolean,
    created_at timestamp,
    details text,
    email text,
    external_id text,
    iana_time_zone text,
    last_login_at timestamp,
    locale text,
    locale_id bigint,
    moderator boolean,
    "name" text,
    notes text,
    only_private_comments boolean,
    phone text,
    remote_photo_url text,
    report_csv boolean,
    restricted_agent boolean,
    "role" text,
    role_type integer,
    shared boolean,
    shared_agent boolean,
    shared_phone_number text,
    signature text,
    suspended boolean,
    ticket_restriction text,
    time_zone text,
    two_factor_auth_enabled boolean,
    updated_at timestamp,
    url text,
    verified boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_role_id) REFERENCES custom_role(id),
    FOREIGN KEY (default_group_id) REFERENCES "group"(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE ivr_menu (
    id bigint,
    ivr_id bigint,
    greeting_id bigint,
    "name" text,
    system_default boolean,
    PRIMARY KEY (id, ivr_id),
    FOREIGN KEY (ivr_id) REFERENCES ivr(id),
    FOREIGN KEY (greeting_id) REFERENCES greeting(id)
);

CREATE TABLE "group" (
    id bigint,
    created_at timestamp,
    "default" boolean,
    description text,
    is_public boolean,
    "name" text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_attribute (
    attribute_name text,
    "value" text,
    agent_id bigint,
    PRIMARY KEY (attribute_name, "value", agent_id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id)
);

CREATE TABLE post_comment (
    id bigint,
    updated_at timestamp,
    author_id bigint,
    post_id bigint,
    body text,
    created_at timestamp,
    html_url text,
    official boolean,
    url text,
    vote_count integer,
    vote_sum integer,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE call_leg_quality_issue (
    issue text,
    call_leg_id bigint,
    PRIMARY KEY (issue, call_leg_id),
    FOREIGN KEY (call_leg_id) REFERENCES call_leg(id)
);

CREATE TABLE address (
    id bigint,
    city text,
    country_code text,
    "name" text,
    provider_reference text,
    province text,
    "state" text,
    street text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id bigint,
    created_at timestamp,
    description text,
    html_url text,
    locale text,
    "name" text,
    outdated boolean,
    "position" bigint,
    source_locale text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_link (
    id bigint,
    ticket_id bigint,
    created_at timestamp,
    issue_id text,
    issue_key text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_form_field (
    ticket_field_id bigint,
    ticket_form_id bigint,
    PRIMARY KEY (ticket_field_id, ticket_form_id),
    FOREIGN KEY (ticket_field_id) REFERENCES ticket_custom_field(id),
    FOREIGN KEY (ticket_form_id) REFERENCES ticket_form_history(id)
);

CREATE TABLE greeting (
    id text,
    category_id bigint,
    active boolean,
    audio_name text,
    audio_url text,
    default_lang boolean,
    has_sub_settings boolean,
    "name" text,
    pending boolean,
    system_default boolean,
    upload_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES greeting_category(id)
);

CREATE TABLE line_categorised_greeting (
    category_id text,
    greeting_id text,
    line_id bigint,
    PRIMARY KEY (category_id, greeting_id, line_id),
    FOREIGN KEY (category_id) REFERENCES greeting_category(id),
    FOREIGN KEY (greeting_id) REFERENCES greeting(id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE ticket_follower (
    ticket_id bigint,
    user_id bigint,
    PRIMARY KEY (ticket_id, user_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ticket_sla_policy (
    policy_applied_at timestamp,
    sla_policy_id bigint,
    ticket_id bigint,
    PRIMARY KEY (policy_applied_at, sla_policy_id, ticket_id),
    FOREIGN KEY (sla_policy_id) REFERENCES sla_policy_history(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE suspended_ticket (
    id bigint,
    author_id bigint,
    brand_id bigint,
    ticket_id bigint,
    author_email text,
    author_name text,
    cause text,
    cause_id bigint,
    content text,
    created_at timestamp,
    message_id text,
    recipient text,
    subject text,
    updated_at timestamp,
    url text,
    via_channel text,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE csat_survey_question (
    question_id text,
    survey_id text,
    survey_version bigint,
    alias text,
    headline_key text,
    headline_type text,
    headline_value text,
    sub_type text,
    "type" text,
    PRIMARY KEY (question_id, survey_id, survey_version)
);

CREATE TABLE agent_unified_status_history (
    agent_id bigint,
    new_id bigint,
    previous_id bigint,
    new_reason text,
    previous_reason text,
    updated_at timestamp,
    PRIMARY KEY (agent_id),
    FOREIGN KEY (agent_id) REFERENCES "user"(id),
    FOREIGN KEY (new_id) REFERENCES agent_status_type(id),
    FOREIGN KEY (previous_id) REFERENCES agent_status_type(id)
);

CREATE TABLE ticket_csat_survey (
    survey_response_id text,
    ticket_id bigint,
    survey_id text,
    survey_version bigint,
    expires_at timestamp,
    responder_id text,
    subject_zrns jsonb,
    subjects jsonb,
    survey_state text,
    PRIMARY KEY (survey_response_id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (survey_id) REFERENCES csat_survey_question(survey_id),
    FOREIGN KEY (survey_version) REFERENCES csat_survey_question(survey_id)
);

CREATE TABLE ticket_side_conversation (
    id text,
    ticket_id bigint,
    created_at timestamp,
    "state" text,
    state_updated_at timestamp,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE badge_assignment (
    id text,
    badge_id text,
    user_id text,
    created_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (badge_id) REFERENCES badge(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

-- Information about working hours.
CREATE TABLE schedule (
    end_time integer,
    id bigint,
    start_time integer,
    created_at timestamp,
    "name" text,
    time_zone text,
    PRIMARY KEY (end_time, id, start_time)
);

CREATE TABLE line_greeting (
    greeting_id text,
    line_id bigint,
    is_default boolean,
    PRIMARY KEY (greeting_id, line_id),
    FOREIGN KEY (greeting_id) REFERENCES greeting(id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE ticket_tag_history (
    tag text,
    updated timestamp,
    ticket_id bigint,
    user_id bigint,
    tagged boolean,
    via_channel text,
    via_source_from_address text,
    via_source_from_id bigint,
    via_source_from_title text,
    via_source_rel text,
    via_source_to_address text,
    via_source_to_name text,
    PRIMARY KEY (tag, updated, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE greeting_category (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE article_content_tag (
    article_id bigint,
    content_tag_id text,
    PRIMARY KEY (article_id, content_tag_id),
    FOREIGN KEY (article_id) REFERENCES article(id),
    FOREIGN KEY (content_tag_id) REFERENCES content_tag(id)
);

CREATE TABLE csat_survey_rating_option (
    rating bigint,
    question_id text,
    survey_id text,
    survey_version bigint,
    emoji_type text,
    emoji_value text,
    label_key text,
    label_type text,
    label_value text,
    PRIMARY KEY (rating, question_id, survey_id, survey_version),
    FOREIGN KEY (question_id) REFERENCES csat_survey_question(survey_id),
    FOREIGN KEY (survey_id) REFERENCES csat_survey_question(survey_id),
    FOREIGN KEY (survey_version) REFERENCES csat_survey_question(survey_id)
);

CREATE TABLE trigger_condition (
    _fivetran_id text,
    trigger_id bigint,
    condition_type text,
    field text,
    operator text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id, trigger_id),
    FOREIGN KEY (trigger_id) REFERENCES "trigger"(id)
);

CREATE TABLE ticket_side_conversation_recipient (
    _fivetran_id text,
    support_agent_id text,
    support_group_id text,
    ticket_side_conversation_event_id text,
    user_id bigint,
    email text,
    msteams_channel_id text,
    "name" text,
    slack_channel_id text,
    slack_workspace_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (support_agent_id) REFERENCES "user"(id),
    FOREIGN KEY (support_group_id) REFERENCES "group"(id),
    FOREIGN KEY (ticket_side_conversation_event_id) REFERENCES ticket_side_conversation_event(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

-- Translation will only be synced if any one of the entity Article, Section or Categories is selected.
-- If you stop syncing translation data and start re-syncing it later, the connection will not backfill missing translation records for already synced articles, sections, and categories.
CREATE TABLE translation (
    id bigint,
    body text,
    created_at timestamp,
    created_by_id bigint,
    draft boolean,
    html_url text,
    locale text,
    outdated boolean,
    source_id bigint,
    source_type text,
    title text,
    updated_at timestamp,
    updated_by_id bigint,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE end_user_condition (
    _fivetran_id text,
    child_field_id bigint,
    parent_field_id bigint,
    ticket_form_id bigint,
    is_required boolean,
    parent_field_type text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (child_field_id) REFERENCES ticket_custom_field(id),
    FOREIGN KEY (parent_field_id) REFERENCES ticket_custom_field(id),
    FOREIGN KEY (ticket_form_id) REFERENCES ticket_form_history(id)
);

CREATE TABLE group_member (
    id bigint,
    group_id bigint,
    user_id bigint,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE user_tag (
    tag text,
    user_id bigint,
    PRIMARY KEY (tag, user_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

-- Schedule assignment for tickets is a Zendesk Enterprise feature.  For all other accounts the default schedule applies to all tickets.
CREATE TABLE ticket_schedule (
    created_at timestamp,
    ticket_id bigint,
    schedule_id bigint,
    PRIMARY KEY (created_at, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE trigger_action (
    field text,
    trigger_id bigint,
    "value" jsonb,
    PRIMARY KEY (field, trigger_id),
    FOREIGN KEY (trigger_id) REFERENCES "trigger"(id)
);

CREATE TABLE line_group (
    group_id text,
    line_id bigint,
    PRIMARY KEY (group_id, line_id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);
