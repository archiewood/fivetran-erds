CREATE TABLE email_template (
    id text,
    created timestamp,
    editor_type text,
    html text,
    "name" text,
    text text,
    updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE coupon_code (
    id text,
    coupon_id text,
    person_id text,
    expires_at timestamp,
    "status" text,
    unique_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE flow (
    id text,
    archived boolean,
    created timestamp,
    "name" text,
    "status" text,
    trigger_type text,
    updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE segment_person (
    person_id text,
    segment_id text,
    PRIMARY KEY (person_id, segment_id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE campaign_list (
    campaign_id text,
    list_id text,
    list_included_or_excluded text,
    PRIMARY KEY (campaign_id, list_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE campaign_tracking_utm_param (
    "name" text,
    campaign_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("name", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE list (
    id text,
    created timestamp,
    list_name text,
    updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE list_exclusion (
    id text,
    list_id text,
    created timestamp,
    reason text,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (id) REFERENCES person(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE segment_tag (
    segment_id text,
    tag_id text,
    PRIMARY KEY (segment_id, tag_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE metric (
    id text,
    created timestamp,
    integration_category text,
    integration_id text,
    integration_name text,
    integration_object text,
    "name" text,
    updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE segment (
    id text,
    created timestamp,
    definition jsonb,
    "name" text,
    updated timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE flow_action (
    id text,
    flow_id text,
    action_type text,
    created timestamp,
    render_options_add_info_link boolean,
    render_options_add_opt_out_language boolean,
    render_options_add_org_prefix boolean,
    render_options_include_contact_card boolean,
    render_options_shorten_links boolean,
    send_options_is_transactional boolean,
    send_options_use_smart_sending boolean,
    "status" text,
    tracking_options_add_utm boolean,
    tracking_options_is_tracking_clicks boolean,
    tracking_options_is_tracking_opens boolean,
    updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (flow_id) REFERENCES flow(id)
);

CREATE TABLE coupon (
    id text,
    description text,
    external_id text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_message_send_time (
    datetime timestamp,
    campaign_message_id text,
    is_local boolean,
    PRIMARY KEY (datetime, campaign_message_id),
    FOREIGN KEY (campaign_message_id) REFERENCES campaign_message(id)
);

CREATE TABLE list_person (
    list_id text,
    person_id text,
    joined_group_at timestamp,
    PRIMARY KEY (list_id, person_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE tag_group (
    id text,
    "default" boolean,
    exclusive boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE flow_action_tracking_utm_param (
    "name" text,
    flow_action_id text,
    "value" text,
    PRIMARY KEY ("name", flow_action_id),
    FOREIGN KEY (flow_action_id) REFERENCES flow_action(id)
);

CREATE TABLE campaign_tag (
    campaign_id text,
    tag_id text,
    PRIMARY KEY (campaign_id, tag_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- Custom fields are added separately with the prefix property_ if the packing mode is UNPACKED. All custom fields are combined in custom_property_fields if packing mode is PACKED. For more information, please see here.
CREATE TABLE event (
    id text,
    campaign_id text,
    flow_id text,
    flow_message_id text,
    metric_id text,
    person_id text,
    _variation text,
    datetime timestamp,
    "timestamp" timestamp,
    "type" text,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (flow_id) REFERENCES flow(id),
    FOREIGN KEY (flow_message_id) REFERENCES flow_message(id),
    FOREIGN KEY (metric_id) REFERENCES metric(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE tags (
    id text,
    tag_group_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (tag_group_id) REFERENCES tag_group(id)
);

CREATE TABLE flow_tag (
    flow_id text,
    tag_id text,
    PRIMARY KEY (flow_id, tag_id),
    FOREIGN KEY (flow_id) REFERENCES flow(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE list_tag (
    list_id text,
    tag_id text,
    PRIMARY KEY (list_id, tag_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE global_exclusion (
    person_id text,
    reason text,
    "timestamp" timestamp,
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE campaign_message (
    id text,
    campaign_id text,
    template_id text,
    channel text,
    content_bcc_email text,
    content_body text,
    content_cc_email text,
    content_from_email text,
    content_from_label text,
    content_media_url text,
    content_preview_text text,
    content_reply_to_email text,
    content_subject text,
    created timestamp,
    label text,
    render_options_add_info_link boolean,
    render_options_add_opt_out_language boolean,
    render_options_add_org_prefix boolean,
    render_options_include_contact_card boolean,
    render_options_shorten_links boolean,
    updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (template_id) REFERENCES email_template(id)
);

-- Custom fields are added separately with the prefix custom_ if the packing mode is UNPACKED. All custom fields are combined in custom_fields if packing mode is PACKED. For more information, please see here.
CREATE TABLE person (
    id text,
    address_1 text,
    address_2 text,
    city text,
    country text,
    created timestamp,
    email text,
    external_id text,
    first_name text,
    image text,
    ip text,
    last_event_date timestamp,
    last_name text,
    latitude text,
    longitude text,
    organization text,
    phone_number text,
    predictive_analytics_average_days_between_orders double precision,
    predictive_analytics_average_order_value double precision,
    predictive_analytics_churn_probability double precision,
    predictive_analytics_expected_date_of_next_order timestamp,
    predictive_analytics_historic_clv double precision,
    predictive_analytics_historic_number_of_orders double precision,
    predictive_analytics_predicted_clv double precision,
    predictive_analytics_predicted_number_of_orders double precision,
    predictive_analytics_total_clv double precision,
    region text,
    subscriptions_email_marketing_can_receive_email_marketing boolean,
    subscriptions_email_marketing_consent text,
    subscriptions_email_marketing_custom_method_detail text,
    subscriptions_email_marketing_double_optin text,
    subscriptions_email_marketing_last_updated timestamp,
    subscriptions_email_marketing_method text,
    subscriptions_email_marketing_method_detail text,
    subscriptions_email_marketing_timestamp timestamp,
    subscriptions_sms_marketing_can_receive_sms_marketing boolean,
    subscriptions_sms_marketing_consent text,
    subscriptions_sms_marketing_last_updated timestamp,
    subscriptions_sms_marketing_method text,
    subscriptions_sms_marketing_method_detail text,
    subscriptions_sms_marketing_timestamp timestamp,
    timezone text,
    title text,
    updated timestamp,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE flow_message (
    id text,
    flow_action_id text,
    template_id text,
    channel text,
    content_bcc_email text,
    content_cc_email text,
    content_from_email text,
    content_from_label text,
    content_preview_text text,
    content_reply_to_email text,
    content_subject text,
    created timestamp,
    "name" text,
    updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (flow_action_id) REFERENCES flow_action(id),
    FOREIGN KEY (template_id) REFERENCES email_template(id)
);

CREATE TABLE campaign (
    id text,
    archived boolean,
    created timestamp,
    "name" text,
    scheduled timestamp,
    send_option_ignore_unsubscribes boolean,
    send_option_use_smart_sending boolean,
    send_strategy_datetime timestamp,
    send_strategy_method text,
    send_strategy_options_is_local boolean,
    send_strategy_options_send_past_recipients_immediately boolean,
    send_strategy_options_static_datetime timestamp,
    send_strategy_options_static_is_local boolean,
    send_strategy_options_static_send_past_recipients_immediately boolean,
    send_strategy_options_sto_date text,
    send_strategy_options_throttled_datetime timestamp,
    send_strategy_options_throttled_throttle_percentage double precision,
    send_time timestamp,
    "status" text,
    tracking_options_add_tracking_params boolean,
    tracking_options_is_add_utm boolean,
    tracking_options_is_tracking_clicks boolean,
    tracking_options_is_tracking_opens boolean,
    updated timestamp,
    PRIMARY KEY (id)
);
