CREATE TABLE campaign_bounce (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    list_id text,
    bounce_type text,
    "date" text,
    email_address text,
    reason text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE sent_campaign_tag (
    client_id text,
    client_sent_campaign_campaign_id text,
    sent_tag text,
    PRIMARY KEY (client_id, client_sent_campaign_campaign_id, sent_tag),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id),
    FOREIGN KEY (client_sent_campaign_campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (sent_tag) REFERENCES client_tag("name")
);

CREATE TABLE client_sent_campaign (
    campaign_id text,
    client_id text,
    from_email text,
    from_name text,
    "name" text,
    reply_to text,
    sent_date text,
    subject text,
    total_recipients bigint,
    web_version_text_url text,
    web_version_url text,
    PRIMARY KEY (campaign_id, client_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE client_segment (
    segment_id text,
    client_id text,
    list_id text,
    title text,
    PRIMARY KEY (segment_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id),
    FOREIGN KEY (list_id) REFERENCES client_subscriber_list(list_id)
);

CREATE TABLE scheduled_campaign_tag (
    client_scheduled_campaign_campaign_id text,
    scheduled_tag text,
    client_id text,
    PRIMARY KEY (client_scheduled_campaign_campaign_id, scheduled_tag),
    FOREIGN KEY (client_scheduled_campaign_campaign_id) REFERENCES client_scheduled_campaign(campaign_id),
    FOREIGN KEY (scheduled_tag) REFERENCES client_tag("name"),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE client_scheduled_campaign (
    campaign_id text,
    client_id text,
    date_created text,
    date_scheduled text,
    from_email text,
    from_name text,
    "name" text,
    preview_text_url text,
    preview_url text,
    reply_to text,
    scheduled_time_zone text,
    subject text,
    PRIMARY KEY (campaign_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE campaign_recipient (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    list_id text,
    email_address text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE campaign_click (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    list_id text,
    city text,
    country_code text,
    country_name text,
    "date" text,
    email_address text,
    ip_address text,
    latitude double precision,
    longitude double precision,
    region text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE campaign_open (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    list_id text,
    city text,
    country_code text,
    country_name text,
    "date" text,
    email_address text,
    ip_address text,
    latitude double precision,
    longitude double precision,
    region text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE client_suppression_list (
    _fivetran_id text,
    client_id text,
    "date" text,
    email_address text,
    "state" text,
    suppression_reason text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE draft_campaign_tag (
    client_draft_campaign_campaign_id text,
    draft_tag text,
    client_id text,
    PRIMARY KEY (client_draft_campaign_campaign_id, draft_tag),
    FOREIGN KEY (client_draft_campaign_campaign_id) REFERENCES client_draft_campaign(campaign_id),
    FOREIGN KEY (draft_tag) REFERENCES client_tag("name"),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE client_draft_campaign (
    campaign_id text,
    client_id text,
    date_created text,
    from_email text,
    from_name text,
    "name" text,
    preview_text_url text,
    preview_url text,
    reply_to text,
    subject text,
    PRIMARY KEY (campaign_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE account_client (
    client_id text,
    base_delivery_rate double precision,
    base_design_spam_test_rate double precision,
    base_rate_per_recipient double precision,
    can_purchase_credits boolean,
    client_pays boolean,
    company_name text,
    contact_email_address text,
    contact_name text,
    country text,
    credits double precision,
    currency text,
    markup_on_delivery double precision,
    markup_on_design_spam_test double precision,
    markup_per_recipient double precision,
    "name" text,
    time_zone text,
    PRIMARY KEY (client_id)
);

CREATE TABLE client_subscriber_list (
    list_id text,
    client_id text,
    "name" text,
    PRIMARY KEY (list_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE campaign_summary (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    bounced bigint,
    clicks bigint,
    forwards bigint,
    likes bigint,
    mentions bigint,
    "name" text,
    recipients bigint,
    spam_complaints bigint,
    total_opened bigint,
    unique_opened bigint,
    unsubscribed bigint,
    webversion_text_url text,
    webversion_url text,
    worldview_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id)
);

CREATE TABLE campaign_unsubscribe (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    list_id text,
    "date" text,
    email_address text,
    ip_address text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE campaign_segment (
    segment_id text,
    campaign_id text,
    client_id text,
    list_id text,
    title text,
    PRIMARY KEY (segment_id, campaign_id, client_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_list(campaign_id),
    FOREIGN KEY (client_id) REFERENCES campaign_list(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE campaign_list (
    list_id text,
    campaign_id text,
    client_id text,
    "name" text,
    PRIMARY KEY (list_id, campaign_id, client_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id)
);

CREATE TABLE client_people (
    email_address text,
    client_id text,
    access_level bigint,
    "name" text,
    "status" text,
    PRIMARY KEY (email_address),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE account_administrator (
    email_address text,
    "name" text,
    "status" text,
    PRIMARY KEY (email_address)
);

CREATE TABLE client_tag (
    "name" text,
    client_id text,
    number_of_campaign bigint,
    PRIMARY KEY ("name", client_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);

CREATE TABLE campaign_spam_complaint (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    list_id text,
    "date" text,
    email_address text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id),
    FOREIGN KEY (list_id) REFERENCES campaign_list(list_id)
);

CREATE TABLE campaign_email_client (
    _fivetran_id text,
    campaign_id text,
    client_id text,
    client text,
    percentage double precision,
    subscribers bigint,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES client_sent_campaign(campaign_id),
    FOREIGN KEY (client_id) REFERENCES client_sent_campaign(client_id)
);

CREATE TABLE client_template (
    template_id text,
    client_id text,
    "name" text,
    preview_url text,
    screenshot_url text,
    PRIMARY KEY (template_id),
    FOREIGN KEY (client_id) REFERENCES account_client(client_id)
);
