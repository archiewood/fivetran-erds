CREATE TABLE contact_list (
    contact_id bigint,
    list_id text,
    PRIMARY KEY (contact_id, list_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE contact_attribute_object (
    "name" text,
    contact_id bigint,
    "value" text,
    PRIMARY KEY ("name", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id bigint,
    created_at text,
    email text,
    email_blacklisted boolean,
    list_unsubscribed text,
    modified_at text,
    sms_blacklisted boolean,
    PRIMARY KEY (id)
);

CREATE TABLE attribute_enumeration (
    "index" text,
    "value" text,
    attribute_name text,
    label text,
    PRIMARY KEY ("index", "value")
);

CREATE TABLE attribute (
    _fivetran_id text,
    calculated_value text,
    category text,
    "name" text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE ips (
    _fivetran_id text,
    sender_id text,
    domain text,
    ip text,
    weight text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sender_id) REFERENCES sender(id)
);

CREATE TABLE sender (
    id text,
    active text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE email_template (
    id text,
    sender_id text,
    created_at text,
    doi_template text,
    html_content text,
    is_active text,
    modified_at text,
    "name" text,
    reply_to text,
    subject text,
    tag text,
    test_sent text,
    to_field text,
    PRIMARY KEY (id),
    FOREIGN KEY (sender_id) REFERENCES sender(id)
);

CREATE TABLE email_campaign_list (
    email_campaign_id text,
    list_id text,
    PRIMARY KEY (email_campaign_id, list_id),
    FOREIGN KEY (email_campaign_id) REFERENCES email_campaign(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE email_campaign_exclusion_list (
    exclusion_list_id text,
    email_campaign_id text,
    list_id text,
    PRIMARY KEY (exclusion_list_id, email_campaign_id),
    FOREIGN KEY (email_campaign_id) REFERENCES email_campaign(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE email_campaign_stats (
    email_campaign_id text,
    email_statistics_index text,
    list_id text,
    clicker text,
    complaint text,
    deferred text,
    delivered text,
    hard_bounce text,
    sent text,
    soft_bounce text,
    trackable_view text,
    unique_click text,
    unique_view text,
    unsubscriptions text,
    viewed text,
    PRIMARY KEY (email_campaign_id, email_statistics_index, list_id),
    FOREIGN KEY (email_campaign_id) REFERENCES email_statistics(email_campaign_id),
    FOREIGN KEY (email_statistics_index) REFERENCES email_statistics("index"),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE email_statistics (
    "index" text,
    email_campaign_id text,
    global_stats_clicker text,
    global_stats_complaint text,
    global_stats_delivered text,
    global_stats_estimated_view text,
    global_stats_hard_bounce text,
    global_stats_sent text,
    global_stats_soft_bounce text,
    global_stats_trackable_views text,
    global_stats_trackable_views_rate text,
    global_stats_unique_click text,
    global_stats_unique_view text,
    global_stats_unsubscriptions text,
    global_stats_viewed text,
    links_stats jsonb,
    mirror_click text,
    remaining text,
    -- stats_by_domain_* (dynamic column),
    PRIMARY KEY ("index", email_campaign_id),
    FOREIGN KEY (email_campaign_id) REFERENCES email_campaign(id)
);

CREATE TABLE email_campaign (
    id text,
    ab_testing text,
    created_at text,
    footer text,
    header text,
    html_content text,
    inline_image_activation text,
    mirror_active text,
    modified_at text,
    "name" text,
    recurring text,
    reply_to text,
    return_bounce text,
    scheduled_at text,
    send_at_best_time text,
    sender_id text,
    sent_date text,
    share_link text,
    split_rule text,
    "status" text,
    subject text,
    subject_a text,
    subject_b text,
    tag text,
    test_sent text,
    to_field text,
    "type" text,
    winner_criteria text,
    winner_delay text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES sender(id)
);

CREATE TABLE sms_campaign_list (
    list_id text,
    sms_campaign_id text,
    PRIMARY KEY (list_id, sms_campaign_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (sms_campaign_id) REFERENCES sms_campaign(id)
);

CREATE TABLE sms_campaign_exclusion_list (
    exclusion_list_id text,
    sms_campaign_id text,
    list_id text,
    PRIMARY KEY (exclusion_list_id, sms_campaign_id),
    FOREIGN KEY (sms_campaign_id) REFERENCES sms_campaign(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE sms_campaign (
    id text,
    content text,
    created_at text,
    modified_at text,
    "name" text,
    organisation_prefix text,
    scheduled_at text,
    sender text,
    "status" text,
    unsubscribe_instruction text,
    PRIMARY KEY (id)
);

CREATE TABLE product_category (
    category_id text,
    product_id text,
    PRIMARY KEY (category_id, product_id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    parent_id text,
    created_at text,
    image_url text,
    modified_at text,
    "name" text,
    price text,
    s_3_original text,
    s_3_thumb_analytics text,
    s_3_thumb_editor text,
    sku text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES product(id)
);

CREATE TABLE category (
    id text,
    created_at text,
    modified_at text,
    "name" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE process (
    id text,
    export_url text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE list (
    id text,
    folder_id text,
    "name" text,
    total_blacklisted text,
    total_subscribers text,
    unique_subscribers text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE inbound_event (
    id text,
    email text,
    "date" text,
    recipient text,
    sender text,
    PRIMARY KEY (id),
    FOREIGN KEY (email) REFERENCES sender(email)
);

CREATE TABLE folder (
    id text,
    "name" text,
    total_blacklisted text,
    total_subscriber text,
    unique_subscriber text,
    PRIMARY KEY (id)
);
