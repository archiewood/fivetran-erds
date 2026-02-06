CREATE TABLE form (
    id text,
    account_id text,
    blacklist jsonb,
    button_text text,
    confirmation_heading text,
    confirmation_text text,
    created_at text,
    days_between_popup text,
    days_between_popup_after_close text,
    description text,
    headline text,
    hide_on_mobile text,
    is_blacklist_enabled text,
    is_embeddable text,
    is_whitelist_enabled text,
    is_widget_enabled text,
    opacity text,
    orientation text,
    primary_color text,
    secondary_color text,
    seconds_before_popup text,
    send_ga_event text,
    show_labels text,
    whitelist jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE email_series_subscriber_active (
    account_id text,
    campaign_id text,
    id text,
    created_at timestamp,
    PRIMARY KEY (account_id, campaign_id, id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (campaign_id) REFERENCES email_series_campaign(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE single_email_campaign (
    id text,
    account_id text,
    bcc text,
    created_at timestamp,
    localize_sending_time text,
    "name" text,
    send_at text,
    "status" text,
    subject text,
    text_body text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE email_series_subscriber_removed (
    account_id text,
    campaign_id text,
    id text,
    created_at timestamp,
    PRIMARY KEY (account_id, campaign_id, id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (campaign_id) REFERENCES email_series_campaign(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE workflow_trigger_action_required (
    code text,
    message text,
    workflow_trigger_id text,
    PRIMARY KEY (code, message, workflow_trigger_id),
    FOREIGN KEY (workflow_trigger_id) REFERENCES workflow_trigger(id)
);

CREATE TABLE workflow_trigger (
    id text,
    account_id text,
    workflow_id text,
    provider text,
    trigger_type text,
    "type" text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE account (
    id text,
    created_at timestamp,
    default_from_email text,
    default_from_name text,
    default_postal_address text,
    enable_third_party_cookies text,
    "name" text,
    phone_number text,
    primary_email text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE email_series_campaign_form (
    campaign_id text,
    form_id text,
    PRIMARY KEY (campaign_id, form_id),
    FOREIGN KEY (campaign_id) REFERENCES email_series_campaign(id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE email_series_campaign (
    id text,
    account_id text,
    active_subscriber_count text,
    bcc text,
    confirmation_url text,
    created_at timestamp,
    days_of_the_week_mask text,
    double_optin text,
    email_count text,
    localize_sending_time text,
    minutes_from_midnight text,
    "name" text,
    notify_subscribe_email text,
    notify_unsubscribe_email text,
    send_to_confirmation_page text,
    start_immediately text,
    "status" text,
    unsubscribed_subscriber_count text,
    use_custom_confirmation_page text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE email_series_subscriber_unsubscribed (
    account_id text,
    campaign_id text,
    id text,
    created_at timestamp,
    PRIMARY KEY (account_id, campaign_id, id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (campaign_id) REFERENCES email_series_campaign(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE people_tag (
    id text,
    people_id text,
    PRIMARY KEY (id, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people (
    id text,
    account_id text,
    address_1 text,
    address_2 text,
    base_lead_score text,
    city text,
    country text,
    created_at timestamp,
    email text,
    eu_consent text,
    first_name text,
    ip_address text,
    landing_url text,
    last_name text,
    lead_score text,
    lifetime_value text,
    original_referrer text,
    phone text,
    prospect text,
    sms_consent text,
    sms_number text,
    "state" text,
    "status" text,
    time_zone text,
    user_agent text,
    utc_offset text,
    visitor_uuid text,
    zip text,
    -- custom_fields_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE workflow (
    id text,
    account_id text,
    created_at timestamp,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE event_action (
    event_action text,
    account_id text,
    PRIMARY KEY (event_action, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE conversation (
    id text,
    account_id text,
    counting_method text,
    created_at timestamp,
    default_value text,
    "name" text,
    "status" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE custom_field_identifier (
    custom_field_id text,
    account_id text,
    PRIMARY KEY (custom_field_id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
