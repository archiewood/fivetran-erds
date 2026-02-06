-- NOTE:
-- _fivetran_id in USER_ tables is computed by taking hash of user_id and/or email fields depending on the project type.
-- _fivetran_id in EVENT_ tables is computed by taking hash of campaign_id, created_at and event_name fields

CREATE TABLE user_unsubscribed_channel_history (
    channel_id bigint,
    email text,
    updated_at timestamp,
    PRIMARY KEY (channel_id, email, updated_at),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (email) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (updated_at) REFERENCES user_history(_fivetran_id)
);

CREATE TABLE push_template_history (
    updated_at timestamp,
    id bigint,
    campaign_id bigint,
    badge text,
    buttons jsonb,
    cache_data_feed boolean,
    data_feed_ids jsonb,
    deeplink_android text,
    deeplink_ios text,
    interruption_level text,
    is_default_locale boolean,
    is_silent_push boolean,
    locale text,
    merge_data_feed_context boolean,
    message text,
    payload jsonb,
    relevance_score double precision,
    rich_media_android text,
    rich_media_ios text,
    sound text,
    title text,
    wake boolean,
    PRIMARY KEY (updated_at, id),
    FOREIGN KEY (id) REFERENCES template_history(updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE event (
    _fivetran_id text,
    _fivetran_user_id text,
    campaign_id bigint,
    additional_properties jsonb,
    content_id bigint,
    created_at timestamp,
    event_name text,
    ip text,
    is_custom_event boolean,
    message_bus_id text,
    message_id text,
    message_type_id bigint,
    recipient_state text,
    "status" text,
    transactional_data jsonb,
    unsub_source text,
    user_agent text,
    user_agent_device text,
    PRIMARY KEY (_fivetran_id, _fivetran_user_id),
    FOREIGN KEY (_fivetran_user_id) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE bcc_email_history (
    email text,
    template_id bigint,
    updated_at timestamp,
    PRIMARY KEY (email, template_id, updated_at),
    FOREIGN KEY (email) REFERENCES user_history(email),
    FOREIGN KEY (template_id) REFERENCES email_template_history(updated_at),
    FOREIGN KEY (updated_at) REFERENCES email_template_history(updated_at)
);

CREATE TABLE experiment_metrics (
    campaign_id bigint,
    "date" text,
    experiment_id bigint,
    template_id bigint,
    average_order_value double precision,
    confidence text,
    created_by text,
    creation_date timestamp,
    improvement text,
    in_app_click_rate double precision,
    last_modified timestamp,
    "name" text,
    revenue double precision,
    subject text,
    total_in_app_clicks double precision,
    total_in_app_closes double precision,
    total_in_app_deletes double precision,
    total_in_app_holdout double precision,
    total_in_app_opens double precision,
    total_in_app_send_skips double precision,
    total_in_app_sent double precision,
    total_in_apps_delivered double precision,
    total_inbox_impressions double precision,
    total_purchases double precision,
    total_unsubscribes double precision,
    "type" text,
    unique_in_app_clicks double precision,
    unique_in_app_opens double precision,
    unique_in_app_sends double precision,
    unique_in_apps_delivered double precision,
    unique_purchases double precision,
    unique_unsubscribes double precision,
    PRIMARY KEY (campaign_id, "date", experiment_id, template_id)
);

CREATE TABLE message_type (
    id bigint,
    channel_id bigint,
    created_at timestamp,
    frequency_cap jsonb,
    "name" text,
    rate_limit_per_minute bigint,
    subscription_policy text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE campaign_history (
    id bigint,
    updated_at timestamp,
    recurring_campaign_id bigint,
    template_id bigint,
    campaign_state text,
    created_at timestamp,
    created_by_user_id text,
    ended_at timestamp,
    message_medium text,
    "name" text,
    send_size bigint,
    start_at timestamp,
    "type" text,
    updated_by_user_id text,
    workflow_id bigint,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (recurring_campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (template_id) REFERENCES template_history(updated_at)
);

CREATE TABLE campaign_label_history (
    label text,
    campaign_id bigint,
    updated_at timestamp,
    PRIMARY KEY (label, campaign_id, updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (updated_at) REFERENCES campaign_history(id)
);

CREATE TABLE channel (
    id bigint,
    channel_type text,
    message_medium text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE sms_template_history (
    updated_at timestamp,
    id bigint,
    campaign_id bigint,
    google_analytics_campaign_name text,
    image_url text,
    is_default_locale boolean,
    locale text,
    message text,
    tracking_domain text,
    PRIMARY KEY (updated_at, id),
    FOREIGN KEY (id) REFERENCES template_history(updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE user_history (
    _fivetran_id text,
    updated_at timestamp,
    email text,
    email_list_ids jsonb,
    first_name text,
    iterable_user_id text,
    last_name text,
    phone_number text,
    phone_number_carrier text,
    phone_number_country_code_iso text,
    phone_number_details text,
    phone_number_line_type text,
    phone_number_updated_at text,
    signup_date timestamp,
    signup_source text,
    user_id text,
    PRIMARY KEY (_fivetran_id, updated_at)
);

CREATE TABLE template_history (
    id bigint,
    updated_at timestamp,
    message_type_id bigint,
    client_template_id text,
    created_at timestamp,
    creator_user_id text,
    "name" text,
    template_type text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (message_type_id) REFERENCES message_type(id)
);

CREATE TABLE bcc_email (
    email text,
    template_id bigint,
    PRIMARY KEY (email, template_id),
    FOREIGN KEY (email) REFERENCES user_history(email),
    FOREIGN KEY (template_id) REFERENCES email_template_history(updated_at)
);

CREATE TABLE cc_email (
    email text,
    template_id bigint,
    PRIMARY KEY (email, template_id),
    FOREIGN KEY (email) REFERENCES user_history(email),
    FOREIGN KEY (template_id) REFERENCES email_template_history(updated_at)
);

CREATE TABLE user_unsubscribed_message_type_history (
    email text,
    message_type_id bigint,
    updated_at timestamp,
    PRIMARY KEY (email, message_type_id, updated_at),
    FOREIGN KEY (email) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (message_type_id) REFERENCES message_type(id),
    FOREIGN KEY (updated_at) REFERENCES user_history(_fivetran_id)
);

CREATE TABLE user_device (
    "index" bigint,
    _fivetran_id text,
    application_name text,
    endpoint_enabled boolean,
    identifier_for_vendor text,
    localized_model text,
    model text,
    platform text,
    platform_endpoint text,
    system_name text,
    system_version text,
    token text,
    user_interface_idiom text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES user_history(_fivetran_id)
);

CREATE TABLE email_template_history (
    updated_at timestamp,
    id bigint,
    campaign_id bigint,
    cache_data_feed boolean,
    data_feed_id bigint,
    data_feed_ids jsonb,
    from_email text,
    from_name text,
    google_analytics_campaign_name text,
    html text,
    is_default_locale boolean,
    locale text,
    merge_data_feed_context boolean,
    plain_text text,
    preheader_text text,
    reply_to_email text,
    subject text,
    PRIMARY KEY (updated_at, id),
    FOREIGN KEY (id) REFERENCES template_history(updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE in_app_template_history (
    id bigint,
    updated_at timestamp,
    campaign_id text,
    expiration_date_time timestamp,
    expiration_duration text,
    html text,
    in_app_display_settings jsonb,
    inbox_metadata jsonb,
    is_default_locale boolean,
    locale text,
    payload jsonb,
    web_in_app_display_settings jsonb,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (id) REFERENCES template_history(updated_at),
    FOREIGN KEY (updated_at) REFERENCES template_history(updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE campaign_list_history (
    campaign_id bigint,
    list_id bigint,
    updated_at timestamp,
    PRIMARY KEY (campaign_id, list_id, updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (updated_at) REFERENCES campaign_history(id)
);

CREATE TABLE email_link_param_history (
    "key" text,
    "value" text,
    template_id bigint,
    updated_at timestamp,
    PRIMARY KEY ("key", "value", template_id, updated_at),
    FOREIGN KEY (template_id) REFERENCES email_template_history(updated_at),
    FOREIGN KEY (updated_at) REFERENCES email_template_history(updated_at)
);

CREATE TABLE campaign_metrics (
    "date" text,
    id bigint,
    average_order_value double precision,
    purchases double precision,
    revenue double precision,
    revenue_m double precision,
    total_app_uninstalls double precision,
    total_complaints double precision,
    total_email_bounced double precision,
    total_email_clicked double precision,
    total_email_delivered double precision,
    total_email_opens double precision,
    total_email_sends double precision,
    total_hosted_unsubscribe_clicks double precision,
    total_purchases double precision,
    total_pushes_bounced double precision,
    total_pushes_delivered double precision,
    total_pushes_opened double precision,
    total_pushes_sent double precision,
    total_unsubscribes double precision,
    unique_email_bounced double precision,
    unique_email_clicks double precision,
    unique_email_opens_or_clicks double precision,
    unique_hosted_unsubscribe_clicks double precision,
    unique_purchases double precision,
    unique_pushes_bounced double precision,
    unique_pushes_opened double precision,
    unique_pushes_sent double precision,
    unique_unsubscribes double precision,
    PRIMARY KEY ("date", id),
    FOREIGN KEY (id) REFERENCES campaign_history(id)
);

CREATE TABLE cc_email_history (
    email text,
    template_id bigint,
    updated_at timestamp,
    PRIMARY KEY (email, template_id, updated_at),
    FOREIGN KEY (email) REFERENCES user_history(email),
    FOREIGN KEY (template_id) REFERENCES email_template_history(updated_at),
    FOREIGN KEY (updated_at) REFERENCES email_template_history(updated_at)
);

CREATE TABLE list_user_history (
    _fivetran_id text,
    list_id bigint,
    updated_at timestamp,
    PRIMARY KEY (_fivetran_id, list_id, updated_at),
    FOREIGN KEY (_fivetran_id) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (updated_at) REFERENCES user_history(_fivetran_id)
);

CREATE TABLE campaign_suppression_list_history (
    campaign_id bigint,
    suppressed_list_id bigint,
    updated_at timestamp,
    PRIMARY KEY (campaign_id, suppressed_list_id, updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (suppressed_list_id) REFERENCES list(id),
    FOREIGN KEY (updated_at) REFERENCES campaign_history(id)
);

CREATE TABLE event_extension (
    _fivetran_id text,
    _fivetran_user_id text,
    app_already_running boolean,
    badge text,
    browser_token text,
    canonical_url_id text,
    catalog_collection_count bigint,
    catalog_lookup_count bigint,
    city text,
    clicked_url text,
    content_available boolean,
    content_id bigint,
    country text,
    deeplink_android text,
    deeplink_ios text,
    device text,
    email_id text,
    email_subject text,
    error_code text,
    experiment_id text,
    expires_at timestamp,
    from_phone_number text,
    from_phone_number_id bigint,
    from_smssender_id bigint,
    image_url text,
    in_app_body text,
    is_ghost_push boolean,
    is_sms_estimation boolean,
    labels jsonb,
    link_id text,
    link_url text,
    locale text,
    message_context jsonb,
    message_status text,
    mms_send_count bigint,
    payload jsonb,
    platform_endpoint text,
    product_recommendation_count bigint,
    proxy_source text,
    push_message text,
    reason text,
    region text,
    sms_message text,
    sms_send_count bigint,
    sound text,
    to_phone_number text,
    url text,
    web_push_body text,
    web_push_click_action text,
    web_push_icon text,
    web_push_message text,
    workflow_id text,
    workflow_name text,
    -- sms_provider_response_* (dynamic column),
    PRIMARY KEY (_fivetran_id, _fivetran_user_id),
    FOREIGN KEY (_fivetran_id) REFERENCES event(_fivetran_id),
    FOREIGN KEY (_fivetran_user_id) REFERENCES user_history(_fivetran_id)
);

CREATE TABLE user_unsubscribed_channel (
    _fivetran_id text,
    channel_id bigint,
    PRIMARY KEY (_fivetran_id, channel_id),
    FOREIGN KEY (_fivetran_id) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE list_user (
    "index" bigint,
    _fivetran_id text,
    list_id bigint,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE journey (
    id bigint,
    created_at timestamp,
    creator_user_id text,
    description text,
    enabled boolean,
    is_archived boolean,
    journey_type text,
    lifetime_limit bigint,
    "name" text,
    simultaneous_limit bigint,
    start_tile_id bigint,
    trigger_event_names jsonb,
    updated_at timestamp,
    -- draft_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE user_unsubscribed_message_type (
    _fivetran_id text,
    message_type_id bigint,
    PRIMARY KEY (_fivetran_id, message_type_id),
    FOREIGN KEY (_fivetran_id) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (message_type_id) REFERENCES message_type(id)
);

CREATE TABLE list (
    id bigint,
    created_at timestamp,
    description text,
    list_type text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_device_history (
    "index" bigint,
    email text,
    updated_at timestamp,
    application_name text,
    endpoint_enabled boolean,
    identifier_for_vendor text,
    localized_model text,
    model text,
    platform text,
    platform_endpoint text,
    system_name text,
    system_version text,
    token text,
    user_interface_idiom text,
    PRIMARY KEY ("index", email, updated_at),
    FOREIGN KEY (email) REFERENCES user_history(_fivetran_id),
    FOREIGN KEY (updated_at) REFERENCES user_history(_fivetran_id)
);

CREATE TABLE sms_link_param_history (
    "key" text,
    "value" text,
    template_id bigint,
    updated_at timestamp,
    PRIMARY KEY ("key", "value", template_id, updated_at),
    FOREIGN KEY (template_id) REFERENCES sms_template_history(updated_at),
    FOREIGN KEY (updated_at) REFERENCES sms_template_history(updated_at)
);
