-- Data Extensions
-- Data Extensions
-- You can find tables in your destination with the following prefixes based on the type of table that is being synced:
--   - Standard DE: ext_
--   - Shared DE: shared_ext_
--   - Salesforce DE: sf_ext_
--   - Shared Salesforce DE: shared_sf_ext_
--   - Synchronised DE: sync_ext_*

CREATE TABLE list_subscriber (
    id integer,
    list_id integer,
    subscriber_key text,
    created_date text,
    modified_date text,
    "status" text,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (subscriber_key) REFERENCES subscriber(id)
);

CREATE TABLE ott_registration (
    id text,
    application_id text,
    channel_name text,
    created_date text,
    default_response text,
    default_response_last_updated text,
    is_active boolean,
    is_customer_secret_set boolean,
    is_test_channel boolean,
    is_transactional boolean,
    modified_date text,
    ott_platform_name text,
    phone_number_id text,
    provider_name text,
    waba_id text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign (
    id text,
    campaign_code text,
    color text,
    created_date text,
    description text,
    favorite boolean,
    modified_date text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE push_message (
    id integer,
    app_name text,
    campaign text,
    android_media_url text,
    format integer,
    geofence_name text,
    ios_media_url text,
    media_alt text,
    message_content text,
    message_name text,
    page_name text,
    template text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_name) REFERENCES push_application(id),
    FOREIGN KEY (campaign) REFERENCES campaign(id)
);

CREATE TABLE subscriber (
    id integer,
    created_date text,
    email_address text,
    email_type_preference text,
    "status" text,
    subscriber_key text,
    unsubscribed_date text,
    PRIMARY KEY (id)
);

CREATE TABLE push_application (
    id text,
    apns_enabled boolean,
    created_date timestamp,
    description text,
    device_endpoint text,
    gcm_enabled boolean,
    "key" text,
    modified_date timestamp,
    "name" text,
    -- configuration_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE campaign_asset (
    id text,
    campaign_id text,
    email_asset_id integer,
    email_id integer,
    list_id integer,
    triggered_send_id text,
    created_date text,
    item_id integer,
    object_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (email_asset_id) REFERENCES email(id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (triggered_send_id) REFERENCES triggered_send(id)
);

CREATE TABLE sms_message_tracking (
    id bigint,
    action_date_time text,
    activity_id text,
    campaign_id bigint,
    code_id text,
    conversation_id text,
    conversation_state_id text,
    create_date_time text,
    delivered boolean,
    description text,
    enterprise_id bigint,
    from_name text,
    inbound boolean,
    invalidation_code bigint,
    is_test boolean,
    is_valid boolean,
    journey_definition_id text,
    keyword_id text,
    member_id bigint,
    message_id bigint,
    message_text text,
    mobile text,
    mobile_message_recurrence_id bigint,
    modified_date_time text,
    "name" text,
    ordinal bigint,
    outbound boolean,
    response_to_mobile_message_tracking_id bigint,
    send_group_id bigint,
    send_id bigint,
    send_job_id bigint,
    send_person_id bigint,
    send_segment_id bigint,
    send_split_id bigint,
    sent boolean,
    shared_keyword text,
    short_code text,
    sms_batch_id bigint,
    sms_job_id text,
    sms_standard_status_code_id bigint,
    subscriber_id bigint,
    subscriber_key text,
    undelivered boolean,
    PRIMARY KEY (id)
);

CREATE TABLE link (
    id integer,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE chat_potential_unsubs (
    contact_key text,
    eid bigint,
    mid bigint,
    channel_id text,
    first_date text,
    last_date text,
    mobile_number text,
    potential_bounce_count bigint,
    PRIMARY KEY (contact_key, eid, mid, channel_id),
    FOREIGN KEY (channel_id) REFERENCES ott_registration(id)
);

CREATE TABLE activity (
    "key" text,
    journey_id text,
    journey_version integer,
    triggered_send_id text,
    arguments jsonb,
    configuration_arguments jsonb,
    description text,
    id text,
    meta_data jsonb,
    "name" text,
    outcomes jsonb,
    "schema" jsonb,
    triggered_send_key text,
    "type" text,
    PRIMARY KEY ("key", journey_id, journey_version),
    FOREIGN KEY (journey_id) REFERENCES journey(id),
    FOREIGN KEY (journey_version) REFERENCES journey(id),
    FOREIGN KEY (triggered_send_id) REFERENCES triggered_send(id)
);

CREATE TABLE chat_inbound_message_log (
    id bigint,
    channel_id text,
    date_created text,
    message_data text,
    mobile_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES ott_registration(id)
);

CREATE TABLE journey (
    id text,
    version integer,
    category_id integer,
    channel text,
    created_date text,
    defaults jsonb,
    definition_id text,
    definition_type text,
    description text,
    entry_mode text,
    execution_mode text,
    exits jsonb,
    goals jsonb,
    "key" text,
    last_published_date text,
    meta_data jsonb,
    modified_date text,
    "name" text,
    notifiers jsonb,
    scheduled_status text,
    stats jsonb,
    "status" text,
    tags jsonb,
    triggers jsonb,
    workflow_api_version text,
    PRIMARY KEY (id, version)
);

-- Note
-- Events of multiple types (bounce_event, click_event etc.)  are put in this table, so some fields like question, url etc. may be null.
CREATE TABLE event (
    event_type text,
    id text,
    opt_in_subscriber_key text,
    send_id integer,
    subscriber_key text,
    triggered_send_id text,
    unsubscribed_list_id integer,
    batch_id integer,
    bounce_category text,
    bounce_type text,
    created_date text,
    event_date text,
    modified_date text,
    question text,
    smtp_code integer,
    smtp_reason text,
    url text,
    PRIMARY KEY (event_type, id),
    FOREIGN KEY (opt_in_subscriber_key) REFERENCES subscriber(id),
    FOREIGN KEY (send_id) REFERENCES send(id),
    FOREIGN KEY (subscriber_key) REFERENCES subscriber(id),
    FOREIGN KEY (triggered_send_id) REFERENCES triggered_send(id),
    FOREIGN KEY (unsubscribed_list_id) REFERENCES list(id)
);

CREATE TABLE chat_tracking (
    send_identifier text,
    "status" text,
    activity_id text,
    channel_id text,
    journey_definition_id text,
    activity_name text,
    asset_id bigint,
    contact_key text,
    eid bigint,
    event_date text,
    message_type_id bigint,
    mid bigint,
    mobile_number text,
    reason text,
    tracking_type text,
    PRIMARY KEY (send_identifier, "status"),
    FOREIGN KEY (activity_id) REFERENCES activity("key"),
    FOREIGN KEY (channel_id) REFERENCES ott_registration(id),
    FOREIGN KEY (journey_definition_id) REFERENCES journey(id)
);

CREATE TABLE email (
    id integer,
    character_set text,
    created_date text,
    modified_date text,
    "name" text,
    pre_header text,
    subject text,
    text_body text,
    PRIMARY KEY (id)
);

CREATE TABLE triggered_send (
    id text,
    email_id integer,
    list_id integer,
    auto_add_subscribers boolean,
    auto_update_subscribers boolean,
    bcc_email text,
    created_date text,
    description text,
    dynamic_email_subject text,
    email_subject text,
    from_address text,
    from_name text,
    is_multipart boolean,
    is_wrapped boolean,
    modified_date text,
    "name" text,
    priority text,
    send_limit text,
    send_window_close text,
    send_window_open text,
    triggered_send_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE mobile_push_detail_report (
    contact_key text,
    device_id text,
    request_id text,
    message_id integer,
    date_time_send text,
    inbox_message_downloaded text,
    inbox_message_opened text,
    message_opened text,
    open_date text,
    platform text,
    platform_version text,
    push_job_id text,
    service_response text,
    "status" text,
    system_token text,
    time_in_app integer,
    PRIMARY KEY (contact_key, device_id, request_id),
    FOREIGN KEY (message_id) REFERENCES push_message(id)
);

CREATE TABLE link_send (
    id integer,
    link_id integer,
    send_id integer,
    alias text,
    total_clicks integer,
    unique_clicks integer,
    PRIMARY KEY (id),
    FOREIGN KEY (link_id) REFERENCES link(id),
    FOREIGN KEY (send_id) REFERENCES send(id)
);

CREATE TABLE list (
    id integer,
    created_date text,
    description text,
    modified_date text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE send (
    id integer,
    email_id integer,
    bcc_email text,
    created_date text,
    duplicates integer,
    email_name text,
    existing_undeliverables integer,
    existing_unsubscribes integer,
    forwarded_emails integer,
    from_address text,
    from_name text,
    hard_bounces integer,
    invalid_addresses integer,
    is_always_on boolean,
    is_multipart boolean,
    missing_addresses integer,
    modified_date text,
    number_delivered integer,
    number_errored integer,
    number_excluded integer,
    number_sent integer,
    number_targeted integer,
    other_bounces integer,
    preview_url text,
    send_date text,
    soft_bounces integer,
    "status" text,
    subject text,
    unique_clicks integer,
    unique_opens integer,
    unsubscribes integer,
    PRIMARY KEY (id),
    FOREIGN KEY (email_id) REFERENCES email(id)
);
