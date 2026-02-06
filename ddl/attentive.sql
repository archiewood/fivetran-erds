CREATE TABLE catalog_upload_error (
    "index" text,
    catalog_upload_upload_id text,
    error_message text,
    error_type text,
    line_num text,
    PRIMARY KEY ("index", catalog_upload_upload_id),
    FOREIGN KEY (catalog_upload_upload_id) REFERENCES catalog_upload(upload_id)
);

CREATE TABLE catalog_upload (
    upload_id text,
    expires text,
    last_updated text,
    products_processed text,
    products_received text,
    "status" text,
    upload_url text,
    validate_only text,
    PRIMARY KEY (upload_id)
);

CREATE TABLE sms_email_subscribed (
    subscriber_external_id text,
    subscription_type text,
    company_display_name text,
    company_id text,
    creative_name text,
    creative_subtype text,
    creative_type text,
    subscriber_email text,
    subscriber_phone text,
    timestamps text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (subscriber_external_id, subscription_type)
);

CREATE TABLE sms_sent (
    message_id text,
    subscriber_external_id text,
    company_display_name text,
    company_id text,
    message_channel text,
    message_text text,
    message_type text,
    subscriber_email text,
    subscriber_phone text,
    timestamps text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (message_id, subscriber_external_id),
    FOREIGN KEY (subscriber_external_id) REFERENCES sms_email_subscribed(subscriber_external_id)
);

CREATE TABLE email_opened (
    message_id text,
    subscriber_external_id text,
    company_id text,
    message_channel text,
    message_name text,
    message_type text,
    timestamps text,
    "type" text,
    PRIMARY KEY (message_id, subscriber_external_id),
    FOREIGN KEY (message_id) REFERENCES email_sent(message_id),
    FOREIGN KEY (subscriber_external_id) REFERENCES email_sent(subscriber_external_id)
);

CREATE TABLE sms_email_unsubscribed (
    subscription_type text,
    subscriber_external_id text,
    company_display_name text,
    company_id text,
    subscriber_email text,
    subscriber_phone text,
    timestamps text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (subscription_type, subscriber_external_id),
    FOREIGN KEY (subscriber_external_id) REFERENCES sms_email_subscribed(subscriber_external_id)
);

CREATE TABLE custom_attribute (
    _fivetran_id text,
    subscriber_external_id text,
    company_display_name text,
    company_id text,
    subscriber_email text,
    subscriber_phone text,
    timestamps text,
    "type" text,
    user_property_id text,
    user_property_name text,
    user_property_value text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (subscriber_external_id) REFERENCES sms_email_subscribed(subscriber_external_id)
);

CREATE TABLE sms_inbound (
    _fivetran_id text,
    subscriber_external_id text,
    company_id text,
    message_text text,
    message_to_phone text,
    message_type text,
    timestamps text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (subscriber_external_id) REFERENCES sms_sent(subscriber_external_id)
);

CREATE TABLE email_sent (
    message_id text,
    subscriber_external_id text,
    company_display_name text,
    company_id text,
    message_channel text,
    message_from_email text,
    message_subject text,
    message_to_email text,
    subscriber_email text,
    subscriber_phone text,
    timestamps text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (message_id, subscriber_external_id),
    FOREIGN KEY (subscriber_external_id) REFERENCES sms_email_subscribed(subscriber_external_id)
);

CREATE TABLE sms_message_link_click (
    message_link_click_link_id text,
    message_link_click_message_id text,
    subscriber_external_id text,
    company_id text,
    message_link_click_channel text,
    message_link_click_link_target text,
    message_link_click_message_type text,
    timestamps text,
    "type" text,
    PRIMARY KEY (message_link_click_link_id, message_link_click_message_id, subscriber_external_id)
);

CREATE TABLE email_message_link_click (
    message_link_click_link_id text,
    message_link_click_message_id text,
    subscriber_external_id text,
    company_id text,
    message_link_click_channel text,
    message_link_click_link_target text,
    message_link_click_message_type text,
    timestamps text,
    "type" text,
    PRIMARY KEY (message_link_click_link_id, message_link_click_message_id, subscriber_external_id)
);
