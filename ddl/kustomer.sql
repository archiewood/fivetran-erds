CREATE TABLE customer_shared_phone (
    "index" integer,
    customer_id text,
    phone text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE business_schedule (
    id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    "default" boolean,
    modified_at timestamp,
    "name" text,
    org_id text,
    timezone text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE message_created_by_team (
    message_id text,
    team_id text,
    PRIMARY KEY (message_id, team_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE work_session (
    id text,
    created_by text,
    modified_by text,
    queue_id text,
    team_id text,
    user_id text,
    capacity_remaining bigint,
    capacity_status text,
    changed_team boolean,
    created_at timestamp,
    handled_conversation_count bigint,
    handled_item_count bigint,
    has_pending_item boolean,
    has_skills boolean,
    idle_since timestamp,
    last_assigned_item_at timestamp,
    modified_at timestamp,
    org_id text,
    paused_work_item_count bigint,
    rev integer,
    routable boolean,
    signed_in_at timestamp,
    signed_out_at timestamp,
    status_type text,
    subsystem text,
    total_available_at_capacity_business_time bigint,
    total_available_at_capacity_status_at timestamp,
    total_available_at_capacity_time bigint,
    total_available_business_time bigint,
    total_available_status_at timestamp,
    total_available_time bigint,
    total_capacity bigint,
    total_unavailable_at_capacity_business_time bigint,
    total_unavailable_at_capacity_status_at timestamp,
    total_unavailable_at_capacity_time bigint,
    total_unavailable_business_time bigint,
    total_unavailable_idle_capacity_business_time bigint,
    total_unavailable_idle_capacity_status_at timestamp,
    total_unavailable_idle_capacity_time bigint,
    total_unavailable_status_at timestamp,
    total_unavailable_time bigint,
    updated_at timestamp,
    user_name_keyword text,
    work_item_count bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE customer_watcher (
    customer_id text,
    user_id text,
    PRIMARY KEY (customer_id, user_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE team_queue (
    queue_id text,
    team_id text,
    PRIMARY KEY (queue_id, team_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE company_email (
    "index" integer,
    company_id text,
    email text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_location (
    "index" integer,
    company_id text,
    address text,
    address_2 text,
    address_3 text,
    area_code text,
    city_name text,
    country_code text,
    country_name text,
    latitude double precision,
    longitude double precision,
    "name" text,
    region_code text,
    region_name text,
    "type" text,
    zip_code text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE custom_attribute_metadata (
    id text,
    resource text,
    PRIMARY KEY (id, resource)
);

CREATE TABLE conversation_history (
    id text,
    assistant_id text,
    brand_id text,
    created_by text,
    customer_id text,
    deleted_by text,
    ended_by text,
    first_company_id text,
    first_message_in_id text,
    last_message_in_message_id text,
    last_message_out_message_id text,
    modified_by text,
    queue_id text,
    sla_id text,
    assistant_emulation boolean,
    assistant_status text,
    assistant_transferred_at timestamp,
    assistant_type text,
    created_at timestamp,
    default_lang text,
    deleted boolean,
    deleted_at timestamp,
    direction text,
    ended boolean,
    ended_at text,
    ended_reason text,
    external_id text,
    first_company_name text,
    first_done jsonb,
    first_message_in_channel text,
    first_message_in_created_at timestamp,
    first_message_in_meta_recipient_email text,
    first_message_in_meta_recipient_mailbox_hash text,
    first_message_in_meta_to text,
    first_message_in_sent_at timestamp,
    first_response_created_at timestamp,
    first_response_created_by text,
    first_response_id text,
    first_response_response_time bigint,
    first_response_sent_at timestamp,
    first_response_time bigint,
    last_activity_at timestamp,
    last_done jsonb,
    last_message_at timestamp,
    last_message_direction text,
    last_message_in_created_at timestamp,
    last_message_in_sent_at timestamp,
    last_message_out_created_at timestamp,
    last_message_out_sent_at timestamp,
    message_count integer,
    modified_at timestamp,
    "name" text,
    note_count integer,
    open_status_at timestamp,
    org_id text,
    outbound_message_count integer,
    priority integer,
    reopen_count integer,
    satisfaction integer,
    satisfaction_level_channel text,
    satisfaction_level_created_at timestamp,
    satisfaction_level_first_answer text,
    satisfaction_level_form text,
    satisfaction_level_form_response text,
    satisfaction_level_rating integer,
    satisfaction_level_scheduled_for timestamp,
    satisfaction_level_score integer,
    satisfaction_level_sent_at timestamp,
    satisfaction_level_sent_by text,
    satisfaction_level_sent_by_teams jsonb,
    satisfaction_level_status text,
    satisfaction_level_updated_at timestamp,
    sentiment_confidence double precision,
    sentiment_polarity double precision,
    sla_breach_at timestamp,
    sla_breach_metric text,
    sla_breached boolean,
    sla_matched_at timestamp,
    sla_metrics_first_response_breach_at timestamp,
    sla_metrics_longest_unresponded_message_breach_at timestamp,
    sla_metrics_total_conversation_open_time_breach_at timestamp,
    sla_metrics_total_customer_wait_time_breach_at timestamp,
    sla_name text,
    sla_status text,
    sla_summary_first_breach_at timestamp,
    sla_version integer,
    sla_version_id text,
    snooze_count integer,
    snooze_status text,
    snooze_status_at timestamp,
    snooze_time timestamp,
    spam boolean,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assistant_id) REFERENCES assistant(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (ended_by) REFERENCES "user"(id),
    FOREIGN KEY (first_company_id) REFERENCES company(id),
    FOREIGN KEY (first_message_in_id) REFERENCES message(id),
    FOREIGN KEY (last_message_in_message_id) REFERENCES message(id),
    FOREIGN KEY (last_message_out_message_id) REFERENCES message(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id),
    FOREIGN KEY (sla_id) REFERENCES sla(id)
);

CREATE TABLE queue (
    id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    description text,
    display_name text,
    item_size integer,
    "name" text,
    org_id text,
    priority integer,
    restrict_transfers_by_users boolean,
    system boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE customer_email (
    "index" integer,
    customer_id text,
    email text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE notification (
    id text,
    user_id text,
    created_at timestamp,
    "name" text,
    org_id text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE sla_criteria (
    _fivetran_id text,
    sla_id text,
    sla_version_id text,
    field text,
    field_type text,
    match_type text,
    operator text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sla_id) REFERENCES sla(id),
    FOREIGN KEY (sla_version_id) REFERENCES sla_version(id)
);

CREATE TABLE conversation_assigned_team_history (
    conversation_id text,
    team_id text,
    PRIMARY KEY (conversation_id, team_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE conversation_time_channel (
    channel text,
    conversation_id text,
    conversation_time_id text,
    PRIMARY KEY (channel, conversation_id, conversation_time_id),
    FOREIGN KEY (channel) REFERENCES conversation_channel_history(conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (conversation_time_id) REFERENCES conversation_time(id)
);

CREATE TABLE conversation_assigned_team (
    conversation_id text,
    team_id text,
    PRIMARY KEY (conversation_id, team_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE brand (
    id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE shortcut_assigned_team (
    shortcut_id text,
    team_id text,
    PRIMARY KEY (shortcut_id, team_id),
    FOREIGN KEY (shortcut_id) REFERENCES shortcut(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE customer_url (
    "index" integer,
    customer_id text,
    "type" text,
    url text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_location (
    "index" integer,
    customer_id text,
    address text,
    address_2 text,
    address_3 text,
    area_code text,
    city_name text,
    country_code text,
    country_name text,
    latitude double precision,
    longitude double precision,
    "name" text,
    region_code text,
    region_name text,
    "type" text,
    zip_code text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE business_holiday (
    id text,
    business_schedule_id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    description text,
    enabled boolean,
    end_date timestamp,
    modified_at timestamp,
    "name" text,
    org_id text,
    start_date timestamp,
    updated_at timestamp,
    PRIMARY KEY (id, business_schedule_id),
    FOREIGN KEY (business_schedule_id) REFERENCES business_schedule(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE message_assigned_team (
    message_id text,
    team_id text,
    PRIMARY KEY (message_id, team_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE company_tag (
    company_id text,
    tag_id text,
    PRIMARY KEY (company_id, tag_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE sla_version (
    id text,
    sla_id text,
    created_by text,
    created_at timestamp,
    description text,
    hours text,
    "name" text,
    org_id text,
    version integer,
    PRIMARY KEY (id, sla_id),
    FOREIGN KEY (sla_id) REFERENCES sla(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id)
);

CREATE TABLE sla (
    id text,
    created_by text,
    created_at timestamp,
    current_version integer,
    org_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id)
);

CREATE TABLE conversation_assigned_user (
    conversation_id text,
    user_id text,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE conversation_time_created_by_team (
    conversation_id text,
    conversation_time_id text,
    team_id text,
    PRIMARY KEY (conversation_id, conversation_time_id, team_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (conversation_time_id) REFERENCES conversation_time(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE user_role (
    "index" integer,
    user_id text,
    "name" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE business_schedule_hour (
    "day" text,
    "index" integer,
    business_schedule_id text,
    end_time integer,
    start_time integer,
    PRIMARY KEY ("day", "index", business_schedule_id),
    FOREIGN KEY (business_schedule_id) REFERENCES business_schedule(id)
);

CREATE TABLE company (
    id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    external_id text,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE snooze (
    id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    enabled boolean,
    "name" text,
    org_id text,
    time_day_type text,
    time_day_value text,
    time_relative integer,
    time_value text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE message_assigned_user (
    message_id text,
    user_id text,
    PRIMARY KEY (message_id, user_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE team (
    id text,
    created_by text,
    deleted_by text,
    modified_by text,
    created_at timestamp,
    deleted boolean,
    deleted_at timestamp,
    display_name text,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE tag (
    id text,
    created_by text,
    deleted_by text,
    modified_by text,
    color text,
    created_at timestamp,
    deleted boolean,
    deleted_at timestamp,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE assistant (
    id text,
    created_by text,
    modified_by text,
    avatar_url text,
    channel text,
    created_at timestamp,
    description text,
    modified_at timestamp,
    "name" text,
    org_id text,
    public_id text,
    public_name text,
    "start" text,
    "status" text,
    template text,
    "type" text,
    updated_at timestamp,
    version bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE customer_social (
    "index" integer,
    customer_id text,
    "type" text,
    url text,
    userid text,
    username text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_shared_whatsapp (
    "index" integer,
    customer_id text,
    phone text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE conversation_suggested_tag (
    conversation_id text,
    tag_id text,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE message_shortcut (
    message_id text,
    shortcut_id text,
    PRIMARY KEY (message_id, shortcut_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (shortcut_id) REFERENCES shortcut(id)
);

CREATE TABLE "user" (
    id text,
    created_by text,
    modified_by text,
    created_at timestamp,
    deleted boolean,
    deleted_at timestamp,
    display_name text,
    email text,
    email_signature text,
    mobile text,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    user_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE card_context (
    "index" integer,
    card_id text,
    "name" text,
    PRIMARY KEY ("index", card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE work_session_channel (
    _fivetran_id text,
    work_session_id text,
    capacity_max bigint,
    capacity_remaining bigint,
    "name" text,
    PRIMARY KEY (_fivetran_id, work_session_id),
    FOREIGN KEY (work_session_id) REFERENCES work_session(id)
);

CREATE TABLE customer_phone (
    "index" integer,
    customer_id text,
    phone text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE conversation_time (
    id text,
    conversation_id text,
    created_by text,
    customer_id text,
    created_at timestamp,
    handle_at text,
    handle_pause_at text,
    handle_pause_by text,
    handle_time text,
    message_at text,
    message_time text,
    note_at text,
    note_time text,
    org_id text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_shared_external_link (
    "index" integer,
    customer_id text,
    external_id text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_tag (
    customer_id text,
    tag_id text,
    PRIMARY KEY (customer_id, tag_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE customer_shared_email (
    "index" integer,
    customer_id text,
    email text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE conversation_tag (
    conversation_id text,
    tag_id text,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE customer_external_link (
    "index" integer,
    customer_id text,
    external_id text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE note_user_mention (
    note_id text,
    user_id text,
    PRIMARY KEY (note_id, user_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE message (
    id text,
    conversation_id text,
    created_by text,
    customer_id text,
    first_company_id text,
    modified_by text,
    redacted_by text,
    app text,
    auto boolean,
    channel text,
    created_at timestamp,
    direction text,
    direction_type text,
    external_id text,
    first_company_name text,
    first_delivered_client_type text,
    first_delivered_timestamp text,
    modified_at timestamp,
    org_id text,
    preview text,
    redacted boolean,
    redacted_at timestamp,
    sent_at timestamp,
    "size" integer,
    "source" text,
    "status" text,
    subject text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (first_company_id) REFERENCES company(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id),
    FOREIGN KEY (redacted_by) REFERENCES "user"(id)
);

CREATE TABLE kobject (
    id text,
    customer_id text,
    created_at timestamp,
    external_id text,
    "name" text,
    org_id text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE assistant_dialog_node (
    id text,
    assistant_dialog_id text,
    assistant_id text,
    "type" text,
    PRIMARY KEY (id, assistant_dialog_id, assistant_id),
    FOREIGN KEY (assistant_dialog_id) REFERENCES assistant_dialog(id),
    FOREIGN KEY (assistant_id) REFERENCES assistant(id)
);

CREATE TABLE conversation_channel (
    "index" integer,
    conversation_id text,
    "name" text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE customer_shared_social (
    "index" integer,
    customer_id text,
    "type" text,
    url text,
    userid text,
    username text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE shortcut_assigned_user (
    shortcut_id text,
    user_id text,
    PRIMARY KEY (shortcut_id, user_id),
    FOREIGN KEY (shortcut_id) REFERENCES shortcut(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE conversation_suggested_tag_history (
    conversation_id text,
    tag_id text,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE shortcut (
    id text,
    created_by text,
    deleted_by text,
    modified_by text,
    conversation_name text,
    conversation_snooze_id text,
    conversation_status text,
    created_at timestamp,
    deleted boolean,
    deleted_at timestamp,
    is_private boolean,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE conversation_tag_history (
    conversation_id text,
    tag_id text,
    PRIMARY KEY (conversation_id, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE conversation (
    id text,
    assistant_id text,
    brand_id text,
    created_by text,
    customer_id text,
    deleted_by text,
    ended_by text,
    first_company_id text,
    first_message_in_id text,
    last_message_in_message_id text,
    last_message_out_message_id text,
    modified_by text,
    queue_id text,
    sla_id text,
    assistant_emulation boolean,
    assistant_status text,
    assistant_transferred_at timestamp,
    assistant_type text,
    created_at timestamp,
    default_lang text,
    deleted boolean,
    deleted_at timestamp,
    direction text,
    ended boolean,
    ended_at text,
    ended_reason text,
    external_id text,
    first_company_name text,
    first_done jsonb,
    first_message_in_channel text,
    first_message_in_created_at timestamp,
    first_message_in_meta_recipient_email text,
    first_message_in_meta_recipient_mailbox_hash text,
    first_message_in_meta_to text,
    first_message_in_sent_at timestamp,
    first_response_created_at timestamp,
    first_response_created_by text,
    first_response_id text,
    first_response_response_time bigint,
    first_response_sent_at timestamp,
    first_response_time bigint,
    last_activity_at timestamp,
    last_done jsonb,
    last_message_at timestamp,
    last_message_direction text,
    last_message_in_created_at timestamp,
    last_message_in_sent_at timestamp,
    last_message_out_created_at timestamp,
    last_message_out_sent_at timestamp,
    message_count integer,
    modified_at timestamp,
    "name" text,
    note_count integer,
    open_status_at timestamp,
    org_id text,
    outbound_message_count integer,
    priority integer,
    reopen_count integer,
    satisfaction integer,
    satisfaction_level_channel text,
    satisfaction_level_created_at timestamp,
    satisfaction_level_first_answer text,
    satisfaction_level_form text,
    satisfaction_level_form_response text,
    satisfaction_level_rating integer,
    satisfaction_level_scheduled_for timestamp,
    satisfaction_level_score integer,
    satisfaction_level_sent_at timestamp,
    satisfaction_level_sent_by text,
    satisfaction_level_sent_by_teams jsonb,
    satisfaction_level_status text,
    satisfaction_level_updated_at timestamp,
    sentiment_confidence double precision,
    sentiment_polarity double precision,
    sla_breach_at timestamp,
    sla_breach_metric text,
    sla_breached boolean,
    sla_matched_at timestamp,
    sla_metrics_first_response_breach_at timestamp,
    sla_metrics_longest_unresponded_message_breach_at timestamp,
    sla_metrics_total_conversation_open_time_breach_at timestamp,
    sla_metrics_total_customer_wait_time_breach_at timestamp,
    sla_name text,
    sla_status text,
    sla_summary_first_breach_at timestamp,
    sla_version integer,
    sla_version_id text,
    snooze_count integer,
    snooze_status text,
    snooze_status_at timestamp,
    snooze_time timestamp,
    spam boolean,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assistant_id) REFERENCES assistant(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (ended_by) REFERENCES "user"(id),
    FOREIGN KEY (first_company_id) REFERENCES company(id),
    FOREIGN KEY (first_message_in_id) REFERENCES message(id),
    FOREIGN KEY (last_message_in_message_id) REFERENCES message(id),
    FOREIGN KEY (last_message_out_message_id) REFERENCES message(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id),
    FOREIGN KEY (sla_id) REFERENCES sla(id)
);

CREATE TABLE customer (
    id text,
    company_id text,
    created_by text,
    deleted_by text,
    last_conversation_id text,
    modified_by text,
    conversation_counts_all integer,
    conversation_counts_done integer,
    conversation_counts_open integer,
    conversation_counts_snoozed integer,
    created_at timestamp,
    default_lang text,
    deleted boolean,
    deleted_at timestamp,
    display_name text,
    external_id text,
    first_name text,
    last_activity_at timestamp,
    last_message_at timestamp,
    last_message_out_sent_at timestamp,
    last_name text,
    modified_at timestamp,
    "name" text,
    org_id text,
    progressive_status text,
    sentiment_confidence double precision,
    sentiment_polarity double precision,
    updated_at timestamp,
    verified boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (last_conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE note_team_mention (
    note_id text,
    team_id text,
    PRIMARY KEY (note_id, team_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE customer_last_conversation_tag (
    customer_id text,
    tag_id text,
    PRIMARY KEY (customer_id, tag_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE sla_metric (
    _fivetran_id text,
    sla_id text,
    sla_version_id text,
    commitment bigint,
    enabled boolean,
    "name" text,
    priority integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sla_id) REFERENCES sla(id),
    FOREIGN KEY (sla_version_id) REFERENCES sla_version(id)
);

CREATE TABLE company_social (
    "index" integer,
    company_id text,
    "type" text,
    url text,
    userid text,
    username text,
    verified boolean,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE conversation_assigned_user_history (
    conversation_id text,
    user_id text,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE team_member (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE company_phone (
    "index" integer,
    company_id text,
    phone text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE conversation_channel_history (
    "name" text,
    conversation_id text,
    PRIMARY KEY ("name", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE note (
    id text,
    conversation_id text,
    created_by text,
    customer_id text,
    deleted_by text,
    modified_by text,
    body text,
    created_at timestamp,
    deleted boolean,
    deleted_at timestamp,
    external_id text,
    modified_at timestamp,
    org_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (created_by) REFERENCES "user"(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (deleted_by) REFERENCES "user"(id),
    FOREIGN KEY (modified_by) REFERENCES "user"(id)
);

CREATE TABLE customer_active_user (
    customer_id text,
    user_id text,
    PRIMARY KEY (customer_id, user_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE customer_whatsapp (
    "index" integer,
    customer_id text,
    phone text,
    "type" text,
    verified boolean,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE shortcut_tag (
    shortcut_id text,
    tag_id text,
    PRIMARY KEY (shortcut_id, tag_id),
    FOREIGN KEY (shortcut_id) REFERENCES shortcut(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE kobject_tag (
    kobject_id text,
    tag_id text,
    PRIMARY KEY (kobject_id, tag_id),
    FOREIGN KEY (kobject_id) REFERENCES kobject(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE card (
    id text,
    app_id text,
    created_at timestamp,
    description text,
    modified_at timestamp,
    "name" text,
    org_id text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE work_session_capacity (
    _fivetran_id text,
    work_session_id text,
    capacity_limit bigint,
    priority bigint,
    remaining bigint,
    PRIMARY KEY (_fivetran_id, work_session_id),
    FOREIGN KEY (work_session_id) REFERENCES work_session(id)
);

CREATE TABLE assistant_dialog (
    id text,
    assistant_id text,
    "name" text,
    PRIMARY KEY (id, assistant_id),
    FOREIGN KEY (assistant_id) REFERENCES assistant(id)
);

CREATE TABLE message_attachment (
    id text,
    message_id text,
    content_length integer,
    content_type text,
    "name" text,
    org_id text,
    redacted boolean,
    related text,
    self text,
    PRIMARY KEY (id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE company_url (
    "index" integer,
    company_id text,
    "type" text,
    url text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);
