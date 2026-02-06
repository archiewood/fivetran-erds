CREATE TABLE payment (
    id text,
    customer_id text,
    billing_address text,
    cc_exp_date text,
    cc_holder text,
    cc_number_ending text,
    cc_type text,
    created text,
    label text,
    last_updated text,
    live text,
    payment_method text,
    token_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE offer_profile_offer_id (
    offer_id text,
    offer_profile_id text,
    PRIMARY KEY (offer_id, offer_profile_id),
    FOREIGN KEY (offer_profile_id) REFERENCES offer_profile(id)
);

CREATE TABLE offer_profile_initial_coupon_discount (
    id text,
    offer_profile_id text,
    coupon text,
    field text,
    has_condition text,
    "name" text,
    object text,
    threshold_field text,
    threshold_value text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, offer_profile_id),
    FOREIGN KEY (offer_profile_id) REFERENCES offer_profile(id)
);

CREATE TABLE offer_profile_recurring_coupon_discount (
    id text,
    offer_profile_id text,
    coupon text,
    field text,
    has_condition text,
    "name" text,
    object text,
    threshold_field text,
    threshold_value text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, offer_profile_id),
    FOREIGN KEY (offer_profile_id) REFERENCES offer_profile(id)
);

CREATE TABLE offer_profile (
    id text,
    initial_coupon_code text,
    initial_coupon_has_condition text,
    initial_coupon_name text,
    initial_coupon_public_id text,
    live text,
    merchant text,
    "name" text,
    recurring_coupon_code text,
    recurring_coupon_has_condition text,
    recurring_coupon_name text,
    recurring_coupon_public_id text,
    weight text,
    PRIMARY KEY (id)
);

CREATE TABLE item (
    id text,
    offer_id text,
    order_id text,
    product_id text,
    subscription_id text,
    component jsonb,
    extra_cost text,
    first_placed text,
    frozen text,
    one_time text,
    order_placed_end_date text,
    order_placed_start_date text,
    price text,
    product_attribute text,
    quantity text,
    subscription_component text,
    total_price text,
    PRIMARY KEY (id),
    FOREIGN KEY (offer_id) REFERENCES offer_profile(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE product_group (
    _fivetran_id text,
    product_id text,
    group_type text,
    "name" text,
    PRIMARY KEY (_fivetran_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_selection_rule_element (
    id text,
    product_id text,
    product_selection_rule_id text,
    starting_date text,
    PRIMARY KEY (id, product_id, product_selection_rule_id),
    FOREIGN KEY (product_id) REFERENCES product_selection_rule(product_id),
    FOREIGN KEY (product_selection_rule_id) REFERENCES product_selection_rule(id)
);

CREATE TABLE product_selection_rule (
    id text,
    product_id text,
    selection_rule_type text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    autoship_by_default text,
    autoship_enabled text,
    created text,
    detail_url text,
    discontinued text,
    every text,
    every_period text,
    extra_data jsonb,
    image_url text,
    incentive_group text,
    last_update text,
    live text,
    merchant text,
    "name" text,
    offer_profile text,
    premier_enabled text,
    prepaid_eligible text,
    price text,
    product_type text,
    sku text,
    PRIMARY KEY (id)
);

CREATE TABLE address (
    id text,
    customer_id text,
    address text,
    address_2 text,
    city text,
    company_name text,
    country_code text,
    created text,
    fax text,
    first_name text,
    label text,
    last_name text,
    live text,
    phone text,
    state_province_code text,
    store_public_id text,
    token_id text,
    zip_postal_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    created text,
    email text,
    extra_data text,
    first_name text,
    last_login text,
    last_name text,
    last_updated text,
    live text,
    locale text,
    merchant text,
    phone_number text,
    phone_type text,
    price_code text,
    session_id text,
    user_token_id text,
    PRIMARY KEY (id)
);

CREATE TABLE incentive (
    id text,
    customer_id text,
    order_id text,
    created text,
    description text,
    discount_type text,
    expires text,
    external_code text,
    field text,
    item text,
    last_updated text,
    merchant text,
    "name" text,
    public_id text,
    stacking_type text,
    target text,
    threshold_field text,
    threshold_value text,
    "type" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE merchant_cancel_reason (
    _fivetran_id text,
    application text,
    cancel_reason text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE subscription_component (
    id text,
    subscription_id text,
    product_id text,
    quantity text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE subscription (
    id text,
    customer_id text,
    payment_id text,
    product_id text,
    shipping_address text,
    cancel_reason text,
    cancel_reason_code text,
    cancelled text,
    club text,
    created text,
    currency_code text,
    customer_rep text,
    every text,
    every_period text,
    external_id text,
    extra_data_commitment_committed text,
    extra_data_commitment_version text,
    extra_data_migration_sub_id text,
    extra_data_shopify_contract_id text,
    frequency_days text,
    iteration text,
    live text,
    merchant text,
    merchant_order_id text,
    offer text,
    prepaid_subscription_context text,
    price text,
    product_attribute text,
    quantity text,
    raw_subscription_type text,
    reminder_days text,
    "sequence" text,
    session_id text,
    start_date text,
    subscription_type text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_id) REFERENCES payment(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (shipping_address) REFERENCES address(id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    payment_id text,
    shipping_address text,
    cancelled text,
    created text,
    currency_code text,
    discount_total text,
    extra_data text,
    generic_error_count text,
    locked text,
    merchant text,
    oos_free_shipping text,
    order_merchant_id text,
    place text,
    rejected_message text,
    shipping_total text,
    "status" text,
    sub_total text,
    tax_total text,
    total text,
    tries text,
    "type" text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_id) REFERENCES payment(id),
    FOREIGN KEY (shipping_address) REFERENCES address(id)
);

CREATE TABLE subscription_discount (
    _fivetran_id text,
    subscription_id text,
    title text,
    PRIMARY KEY (_fivetran_id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);
