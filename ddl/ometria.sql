CREATE TABLE collection (
    id text,
    count text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_store_id (
    store_id text,
    contact_id text,
    PRIMARY KEY (store_id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    collection_id text,
    customer_id text,
    profile_id text,
    collection text,
    dt_object_created text,
    dt_object_observed text,
    dt_object_updated text,
    dt_observed text,
    email text,
    marketing_optin text,
    object_version text,
    phone_number text,
    "source" text,
    PRIMARY KEY (id, collection_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (customer_id) REFERENCES profile(customer_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE unsubscribed_contact (
    _fivetran_id text,
    profile_id text,
    email_address text,
    mass_campaign_id text,
    reason text,
    reason_text text,
    send_id text,
    time_stamp text,
    trigger_campaign_id text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE list_change (
    list_id text,
    profile_id text,
    email text,
    event text,
    time_stamp text,
    PRIMARY KEY (list_id, profile_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE custom_event (
    id text,
    profile_id text,
    dt_observed text,
    event_type text,
    identity_account_id text,
    identity_email text,
    time_stamp text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile_list (
    id text,
    profile_id text,
    profile_customer_id text,
    title text,
    "type" text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile (
    id text,
    country text,
    customer_id text,
    date_of_birth text,
    default_store text,
    dt_predicted_next_order text,
    email text,
    first_name text,
    first_visit text,
    gender text,
    is_email_valid text,
    last_name text,
    lifecycle_status text,
    marketing_optin text,
    middle_name text,
    "name" text,
    phone_number text,
    phone_number_country text,
    preferred_lang text,
    prefix text,
    seen text,
    suffix text,
    tags jsonb,
    time_zone text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE list_member_store_id (
    _fivetran_id text,
    list_member_id text,
    store_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (list_member_id) REFERENCES list_member(id)
);

CREATE TABLE list_member (
    id text,
    customer_id text,
    list_id text,
    add_to_list jsonb,
    collection text,
    country_id text,
    force_optin text,
    merge text,
    remove_from_list jsonb,
    timestamp_subscribed text,
    timestamp_unsubscribed text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES collection(id),
    FOREIGN KEY (customer_id) REFERENCES profile(customer_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE product_store (
    store_id text,
    product_id text,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_attribute (
    id text,
    product_id text,
    label text,
    "type" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_listing (
    product_id text,
    store_id text,
    currency text,
    image_url text,
    is_active text,
    price text,
    store text,
    title text,
    url text,
    PRIMARY KEY (product_id, store_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (store_id) REFERENCES product_store(store_id)
);

CREATE TABLE product (
    id text,
    currency text,
    image_url text,
    is_active text,
    is_in_stock text,
    is_variant text,
    price text,
    properties jsonb,
    sku text,
    special_price text,
    special_price_dt_from text,
    special_price_dt_to text,
    title text,
    url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE orders_line_item_variant_option (
    id text,
    "type" text,
    "index" text,
    order_id text,
    label text,
    PRIMARY KEY (id, "type", "index", order_id),
    FOREIGN KEY ("index") REFERENCES orders_line_item("index"),
    FOREIGN KEY (order_id) REFERENCES orders_line_item(order_id)
);

CREATE TABLE orders_line_item (
    "index" text,
    order_id text,
    product_id text,
    base_currency text,
    base_discount text,
    base_refunded text,
    base_subtotal text,
    base_tax text,
    base_total text,
    base_unit_price text,
    currency text,
    discount text,
    local_currency text,
    local_discount text,
    local_refunded text,
    local_subtotal text,
    local_tax text,
    local_total text,
    local_unit_price text,
    quantity text,
    quantity_refunded text,
    refunded text,
    sku text,
    subtotal text,
    tax text,
    total text,
    unit_price text,
    variant_id text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    channel text,
    coupon_code text,
    currency text,
    discount text,
    grand_total text,
    ip_address text,
    is_valid text,
    payment_method text,
    shipping text,
    shipping_method text,
    "status" text,
    store text,
    subtotal text,
    tax text,
    time_stamp text,
    total_refunded text,
    total_unit_quantity text,
    total_unit_quantity_refunded text,
    web_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES profile(customer_id)
);

CREATE TABLE error (
    record_id text,
    request_id text,
    customer_id text,
    account text,
    message_error text,
    message_error_path text,
    record_type text,
    "source" text,
    time_stamp text,
    timestamp_acquired text,
    PRIMARY KEY (record_id, request_id),
    FOREIGN KEY (customer_id) REFERENCES profile(customer_id)
);

CREATE TABLE list (
    id text,
    description text,
    public_id text,
    "size" text,
    "status" text,
    timestamp_created text,
    timestamp_last_refreshed text,
    timestamp_stats_updated text,
    title text,
    total_orders text,
    total_revenue text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE data_anonymisation_request (
    _fivetran_id text,
    gdpr_related_data_anonymisation_request_id text,
    hashed_email text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (gdpr_related_data_anonymisation_request_id) REFERENCES gdpr_related_data_anonymisation_request(id)
);

CREATE TABLE gdpr_related_data_anonymisation_request (
    id text,
    "action" text,
    "comment" text,
    source_api_request_id text,
    source_origin text,
    summary text,
    timestamp_completed text,
    timestamp_created text,
    user_email text,
    user_name text,
    PRIMARY KEY (id)
);
