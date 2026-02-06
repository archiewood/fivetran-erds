CREATE TABLE segment (
    id text,
    list_id text,
    created_at timestamp,
    member_count integer,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE product_variant (
    id text,
    product_id text,
    store_id text,
    backorders text,
    created_at timestamp,
    image_url text,
    inventory_quantity integer,
    price double precision,
    sku text,
    title text,
    updated_at timestamp,
    url text,
    visibility text,
    PRIMARY KEY (id, product_id, store_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE list (
    id text,
    beamer_address text,
    date_created timestamp,
    email_type_option boolean,
    list_rating double precision,
    "name" text,
    notify_on_subscribe text,
    notify_on_unsubscribe text,
    permission_reminder text,
    subscribe_url_long text,
    subscribe_url_short text,
    use_archive_bar boolean,
    visibility text,
    -- contact_* (dynamic column),
    -- default_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE segment_member (
    member_id text,
    segment_id text,
    list_id text,
    PRIMARY KEY (member_id, segment_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE automation_email (
    id text,
    automation_id text,
    archive_url text,
    authenticate boolean,
    auto_footer boolean,
    auto_tweet boolean,
    clicktale text,
    content_type text,
    create_time timestamp,
    drag_and_drop boolean,
    fb_comments boolean,
    folder_id text,
    from_name text,
    google_analytics text,
    inline_css boolean,
    "position" integer,
    reply_to text,
    send_time timestamp,
    start_time timestamp,
    "status" text,
    subject_line text,
    template_id integer,
    timewarp boolean,
    title text,
    to_name text,
    track_ecomm_360 boolean,
    track_goals boolean,
    track_html_clicks boolean,
    track_opens boolean,
    track_text_clicks boolean,
    use_conversation boolean,
    -- delay_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (automation_id) REFERENCES automation(id)
);

CREATE TABLE orders (
    id text,
    store_id text,
    campaign_id text,
    customer_id text,
    cancelled_at timestamp,
    currency_code text,
    discount_total double precision,
    financial_status text,
    fulfillment_status text,
    landing_site text,
    order_total double precision,
    order_url text,
    processed_at timestamp,
    shipping_total double precision,
    tax_total double precision,
    tracking_carrier text,
    tracking_code text,
    tracking_number text,
    tracking_url text,
    updated_at timestamp,
    -- billing_address_* (dynamic column),
    -- outreach_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE automation_recipient_activity (
    "action" text,
    "timestamp" timestamp,
    automation_email_id text,
    member_id text,
    list_id text,
    bounce_type text,
    ip text,
    url text,
    PRIMARY KEY ("action", "timestamp", automation_email_id, member_id),
    FOREIGN KEY (automation_email_id) REFERENCES automation_email(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE promo_code (
    id text,
    promo_rule text,
    store_id text,
    code text,
    created_at timestamp,
    enabled boolean,
    redemption_url text,
    updated_at timestamp,
    usage_count integer,
    PRIMARY KEY (id, promo_rule, store_id),
    FOREIGN KEY (promo_rule) REFERENCES promo_rule(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE tags (
    id text,
    list_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE customer (
    id text,
    store_id text,
    address_1 text,
    address_2 text,
    city text,
    company text,
    country text,
    country_code text,
    created_at timestamp,
    email_address text,
    first_name text,
    last_name text,
    opt_in_status boolean,
    orders_count integer,
    postal_code text,
    province text,
    province_code text,
    total_spent double precision,
    updated_at timestamp,
    PRIMARY KEY (id, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE campaign_recipient (
    campaign_id text,
    member_id text,
    list_id text,
    combination_id text,
    "status" text,
    PRIMARY KEY (campaign_id, member_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE store (
    id text,
    abandoned_browse_automation_id text,
    abandoned_cart_automation_id text,
    list_id text,
    abandoned_browse_automation_is_supported boolean,
    abandoned_cart_automation_is_supported boolean,
    address_1 text,
    address_2 text,
    city text,
    connected_site_foreign_id text,
    country text,
    country_code text,
    created_at timestamp,
    currency_code text,
    domain text,
    email_address text,
    is_syncing boolean,
    latitude double precision,
    list_is_active boolean,
    longitude double precision,
    money_format text,
    "name" text,
    phone text,
    platform text,
    postal_code text,
    primary_locale text,
    province text,
    province_code text,
    timezone text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (abandoned_browse_automation_id) REFERENCES automation(id),
    FOREIGN KEY (abandoned_cart_automation_id) REFERENCES automation(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE campaign (
    id text,
    list_id text,
    segment_id text,
    winning_campaign_id text,
    winning_combination_id text,
    archive_url text,
    authenticate boolean,
    auto_footer boolean,
    auto_tweet boolean,
    clicktale text,
    content_type text,
    create_time timestamp,
    drag_and_drop boolean,
    fb_comments boolean,
    folder_id text,
    from_name text,
    google_analytics text,
    inline_css boolean,
    long_archive_url text,
    reply_to text,
    segment_text text,
    send_time timestamp,
    "status" text,
    subject_line text,
    template_id integer,
    test_size integer,
    timewarp boolean,
    title text,
    to_name text,
    track_ecomm_360 boolean,
    track_goals boolean,
    track_html_clicks boolean,
    track_opens boolean,
    track_text_clicks boolean,
    "type" text,
    use_conversation boolean,
    wait_time integer,
    winner_criteria text,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (winning_campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (winning_combination_id) REFERENCES campaign_variate_combination(id)
);

-- Note
-- campaign_id contains foreign key references to the id field of both the Campaign and Automation Email  tables.  MailChimp’s API treats them as equivalent.
CREATE TABLE unsubscribe (
    list_id text,
    member_id text,
    campaign_id text,
    reason text,
    "timestamp" timestamp,
    PRIMARY KEY (list_id, member_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE order_promo_code (
    promo_code text,
    order_id text,
    store_id text,
    promo_code_amount_discounted text,
    promo_code_type text,
    PRIMARY KEY (promo_code, order_id, store_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE campaign_recipient_activity (
    "action" text,
    "timestamp" timestamp,
    campaign_id text,
    member_id text,
    list_id text,
    bounce_type text,
    combination_id text,
    ip text,
    url text,
    PRIMARY KEY ("action", "timestamp", campaign_id, member_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE order_line (
    id text,
    order_id text,
    store_id text,
    product_id text,
    product_variant_id text,
    discount double precision,
    price double precision,
    quantity integer,
    PRIMARY KEY (id, order_id, store_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE automation (
    id text,
    list_id text,
    segment_id text,
    create_time timestamp,
    segment_text text,
    start_time timestamp,
    "status" text,
    title text,
    trigger_settings jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE interest (
    id text,
    category_id text,
    list_id text,
    display_order integer,
    "name" text,
    subscriber_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES interest_category(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE cart (
    id text,
    store_id text,
    campaign_id text,
    customer_id text,
    checkout_url text,
    created_at timestamp,
    currency_code text,
    order_total double precision,
    tax_total double precision,
    updated_at timestamp,
    PRIMARY KEY (id, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE member (
    id text,
    list_id text,
    country_code text,
    dstoff double precision,
    email_address text,
    email_client text,
    email_type text,
    gmtoff double precision,
    ip_opt text,
    ip_signup text,
    language text,
    last_changed timestamp,
    latitude double precision,
    longitude double precision,
    member_rating integer,
    "source" text,
    "status" text,
    timestamp_opt timestamp,
    timestamp_signup timestamp,
    timezone text,
    unique_email_id text,
    unsubscribe_reason text,
    vip boolean,
    web_id integer,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE interest_member (
    interest_id text,
    member_id text,
    PRIMARY KEY (interest_id, member_id),
    FOREIGN KEY (interest_id) REFERENCES interest(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE product (
    id text,
    store_id text,
    currency_code text,
    description text,
    handle text,
    image_url text,
    published_at timestamp,
    title text,
    "type" text,
    url text,
    vendor text,
    PRIMARY KEY (id, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE automation_recipient (
    automation_email_id text,
    member_id text,
    list_id text,
    "status" text,
    PRIMARY KEY (automation_email_id, member_id),
    FOREIGN KEY (automation_email_id) REFERENCES automation_email(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE cart_line (
    id text,
    cart_id text,
    store_id text,
    product_id text,
    product_variant_id text,
    price double precision,
    quantity integer,
    PRIMARY KEY (id, cart_id, store_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE interest_category (
    id text,
    list_id text,
    display_order integer,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE tag_member (
    member_id text,
    tag_id text,
    PRIMARY KEY (member_id, tag_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE campaign_variate_combination (
    id text,
    campaign_id text,
    content_description text,
    from_name text,
    recipients integer,
    reply_to text,
    send_time timestamp,
    subject_line text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE promo_rule (
    id text,
    store_id text,
    amount double precision,
    created_at timestamp,
    description text,
    enabled boolean,
    ends_at timestamp,
    starts_at timestamp,
    target text,
    title text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);
