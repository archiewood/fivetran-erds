CREATE TABLE custom_attribute_nested_option (
    id text,
    custom_attribute_id text,
    custom_attribute_input_option_id text,
    is_deactivated text,
    label text,
    nested_option jsonb,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute_input_option(custom_attribute_id),
    FOREIGN KEY (custom_attribute_input_option_id) REFERENCES custom_attribute_input_option(id)
);

CREATE TABLE custom_attribute_input_option (
    id text,
    custom_attribute_id text,
    is_deactivated text,
    label text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id)
);

CREATE TABLE custom_attribute (
    id text,
    created_at text,
    description text,
    entity_type text,
    identifier text,
    input_definition_text text,
    is_archived text,
    is_deactivated text,
    is_required text,
    label text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE team_member (
    agent_id text,
    team_id text,
    PRIMARY KEY (agent_id, team_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE end_user (
    id text,
    avatar_url text,
    created_at timestamp,
    display_name text,
    email text,
    first_name text,
    last_name text,
    middle_name jsonb,
    phone_number text,
    PRIMARY KEY (id)
);

CREATE TABLE agent (
    id text,
    avatar_url text,
    created_at timestamp,
    display_name text,
    email text,
    first_name text,
    last_name text,
    middle_name jsonb,
    phone_number text,
    PRIMARY KEY (id)
);

CREATE TABLE cc_email (
    email_id text,
    id text,
    PRIMARY KEY (email_id, id),
    FOREIGN KEY (id) REFERENCES conversation_message(id)
);

CREATE TABLE bcc_email (
    email_id text,
    id text,
    PRIMARY KEY (email_id, id),
    FOREIGN KEY (id) REFERENCES conversation_message(id)
);

CREATE TABLE email_recipient (
    email_id text,
    id text,
    PRIMARY KEY (email_id, id),
    FOREIGN KEY (id) REFERENCES conversation_message(id)
);

CREATE TABLE attached_file (
    file_name text,
    id text,
    PRIMARY KEY (file_name, id),
    FOREIGN KEY (id) REFERENCES conversation_message(id)
);

CREATE TABLE conversation_message (
    id text,
    author_email text,
    conversation_id bigint,
    author_name text,
    chat_input_answer text,
    chat_input_question text,
    chat_menu_text text,
    created_at timestamp,
    direction text,
    duration bigint,
    from_phone_number text,
    froms text,
    initial_channel text,
    is_automated_message boolean,
    recording_url text,
    text text,
    to_phone_number text,
    voicemail_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_email) REFERENCES agent(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE email_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE facebook_messenger_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE widget_chat_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE voicemail_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE contact_form_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE whatsapp_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE callback_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE pstn_phone_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE messenger_queue (
    id text,
    queue_id text,
    PRIMARY KEY (id, queue_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE queue (
    id text,
    do_not_offer_timeouts_callback integer,
    do_not_offer_timeouts_contact_form integer,
    do_not_offer_timeouts_email integer,
    do_not_offer_timeouts_facebook_messenger integer,
    do_not_offer_timeouts_messenger integer,
    do_not_offer_timeouts_pstn_phone integer,
    do_not_offer_timeouts_voicemail integer,
    do_not_offer_timeouts_whatsapp integer,
    do_not_offer_timeouts_widget_chat integer,
    is_default boolean,
    is_do_not_offer_enabled boolean,
    is_preferred_agent_enabled boolean,
    member_list_type text,
    "name" text,
    offer_abandoned_conversations boolean,
    offer_timeout integer,
    offering_algorithm text,
    organization_id text,
    personal_agent_offline_timeout integer,
    preferred_agent_offline_timeout integer,
    preferred_agent_timeouts_callback integer,
    preferred_agent_timeouts_contact_form integer,
    preferred_agent_timeouts_email integer,
    preferred_agent_timeouts_facebook_messenger integer,
    preferred_agent_timeouts_messenger integer,
    preferred_agent_timeouts_pstn_phone integer,
    preferred_agent_timeouts_voicemail integer,
    preferred_agent_timeouts_whatsapp integer,
    preferred_agent_timeouts_widget_chat integer,
    priority integer,
    queue_thresholds_available_agents integer,
    queue_thresholds_longest_wait integer,
    queue_thresholds_sla_percentage integer,
    queue_thresholds_sla_time_limit integer,
    queue_thresholds_waiting_conversations integer,
    sla_calculation_method text,
    twilio_queue_sid text,
    wrapup_timeout integer,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_internal_note (
    id text,
    author_id text,
    conversation_id bigint,
    created_at timestamp,
    message text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES agent(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_activity_log (
    id text,
    author_id text,
    conversation_id bigint,
    activity_timestamp timestamp,
    activity_type text,
    "type" text,
    -- attribute_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES agent(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE queue_member (
    agent_id text,
    queue_id text,
    priority integer,
    PRIMARY KEY (agent_id, queue_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE team (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    color text,
    "name" text,
    "state" text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_tag (
    conversation_id bigint,
    tag_id text,
    is_deactivated boolean,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE conversation_rating (
    _fivetran_id text,
    conversation_id bigint,
    cancelled_timestamp timestamp,
    created_timestamp timestamp,
    languages text,
    message text,
    modified_timestamp timestamp,
    offered_timestamp timestamp,
    rated_timestamp timestamp,
    scheduled_for_timestamp timestamp,
    scheduled_timestamp timestamp,
    score integer,
    "status" text,
    "type" text,
    unscheduled_timestamp timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_custom_field_value (
    "index" text,
    conversation_custom_field_id text,
    conversation_id bigint,
    "value" text,
    PRIMARY KEY ("index", conversation_custom_field_id, conversation_id),
    FOREIGN KEY (conversation_custom_field_id) REFERENCES conversation_custom_field(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_custom_field(conversation_id)
);

CREATE TABLE conversation_custom_field (
    conversation_id bigint,
    id text,
    data_type text,
    PRIMARY KEY (conversation_id, id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (id) REFERENCES custom_attribute(id)
);

CREATE TABLE conversation (
    id bigint,
    assignee_id text,
    queue_id text,
    requester_id text,
    anonymized_at timestamp,
    assigned_at timestamp,
    assignee_email text,
    assignee_name text,
    assignee_phone_number text,
    closed_at timestamp,
    created_at timestamp,
    direction text,
    dixa_email_integration_id text,
    dixa_email_integration_sender_name text,
    facebook_page_id text,
    facebook_page_name text,
    forwarding_email text,
    from_provisioned_phone_number_id text,
    from_provisioned_phone_number_name text,
    handling_duration bigint,
    initial_channel text,
    last_message_created_at timestamp,
    originating_country text,
    queue_name text,
    queued_at timestamp,
    requester_email text,
    requester_name text,
    requester_phone_number text,
    "status" text,
    subject text,
    to_provisioned_phone_number_id text,
    to_provisioned_phone_number_name text,
    total_duration bigint,
    transfer_time timestamp,
    transferee_name text,
    transferee_number text,
    updated_at timestamp,
    widget_id text,
    widget_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES widget_chat_queue(id),
    FOREIGN KEY (assignee_id) REFERENCES agent(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id),
    FOREIGN KEY (requester_id) REFERENCES end_user(id)
);
