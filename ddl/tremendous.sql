CREATE TABLE reward_custom_field (
    id text,
    reward_id text,
    label text,
    "value" text,
    PRIMARY KEY (id, reward_id),
    FOREIGN KEY (reward_id) REFERENCES reward(id)
);

CREATE TABLE reward (
    id text,
    order_id text,
    created_at timestamp,
    deliver_at text,
    delivery_method text,
    delivery_status text,
    recipient_email text,
    recipient_name text,
    recipient_phone text,
    value_currency_code text,
    value_denomination text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE balance_transaction (
    _fivetran_id text,
    "action" text,
    amount text,
    balance text,
    created_at text,
    description text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE product_currency_code (
    "index" text,
    product_id text,
    currency_code text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_sku (
    "index" text,
    product_id text,
    max text,
    min text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_country (
    "index" text,
    product_id text,
    abbr text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_image (
    "index" text,
    product_id text,
    src text,
    "type" text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    category text,
    description text,
    disclosure text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE "role" (
    id text,
    description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE funding_source (
    id text,
    account_number_mask text,
    account_routing_mask text,
    account_type text,
    accountholder_name text,
    available_cents text,
    bank_name text,
    expired text,
    last_4 text,
    last_payment_failed_at text,
    method text,
    network text,
    pending_cents text,
    refundable text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE organization (
    id text,
    created_at text,
    "name" text,
    "status" text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE member (
    id text,
    role_id text,
    active text,
    created_at text,
    email text,
    last_login_at text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE campaign_product (
    "index" text,
    campaign_id text,
    product text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (product) REFERENCES product(id)
);

CREATE TABLE campaign (
    id text,
    description text,
    email_button_color text,
    email_logo_background_color text,
    email_logo_image_height_px text,
    email_logo_image_url text,
    email_sender_name text,
    email_subject_line text,
    "name" text,
    webpage_background_color text,
    webpage_headline text,
    webpage_logo_background_color text,
    webpage_logo_image_height_px text,
    webpage_logo_image_url text,
    webpage_message text,
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id text,
    campaign_id text,
    invoice_id text,
    channel text,
    created_at text,
    external_id text,
    payment_channel text,
    payment_fees text,
    payment_refund_total text,
    payment_subtotal text,
    payment_total text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_order (
    "index" text,
    invoice_id text,
    order_id text,
    PRIMARY KEY ("index", invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE invoice_reward (
    "index" text,
    invoice_id text,
    reward_id text,
    PRIMARY KEY ("index", invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (reward_id) REFERENCES reward(id)
);

CREATE TABLE invoice (
    id text,
    amount text,
    created_at timestamp,
    paid_at text,
    po_number text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE fraud_review_custom_field (
    id text,
    fraud_review_reward_id text,
    label text,
    "value" text,
    PRIMARY KEY (id, fraud_review_reward_id),
    FOREIGN KEY (fraud_review_reward_id) REFERENCES fraud_review(reward_id)
);

CREATE TABLE fraud_review_reason (
    reason text,
    fraud_review_reward_id text,
    PRIMARY KEY (reason, fraud_review_reward_id),
    FOREIGN KEY (fraud_review_reward_id) REFERENCES fraud_review(reward_id)
);

CREATE TABLE fraud_review (
    reward_id text,
    order_id text,
    created_at timestamp,
    currency_code text,
    deliver_at text,
    delivery_method text,
    delivery_status text,
    denomination text,
    recipient_email text,
    recipient_name text,
    recipient_phone text,
    "status" text,
    PRIMARY KEY (reward_id),
    FOREIGN KEY (reward_id) REFERENCES reward(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
