CREATE TABLE referral (
    id text,
    affiliate_id text,
    commission text,
    commission_adjustment text,
    commission_amount text,
    commission_type text,
    created_at text,
    customer_id text,
    order_id text,
    order_number text,
    quantity text,
    refund_id text,
    "status" text,
    total_sales text,
    tracking_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (affiliate_id) REFERENCES affiliate(id)
);

CREATE TABLE coupon (
    id text,
    affiliate_id text,
    coupon text,
    created_timestamp text,
    description text,
    PRIMARY KEY (id),
    FOREIGN KEY (affiliate_id) REFERENCES affiliate(id)
);

CREATE TABLE affiliate_custom_field (
    "index" text,
    affiliate_id text,
    "key" text,
    label text,
    "value" text,
    PRIMARY KEY ("index", affiliate_id),
    FOREIGN KEY (affiliate_id) REFERENCES affiliate(id)
);

CREATE TABLE affiliate (
    id text,
    address text,
    affiliate_link text,
    city text,
    company text,
    country text,
    created_at_timestamp text,
    email text,
    email_verified text,
    facebook text,
    first_name text,
    instagram text,
    last_name text,
    phone text,
    program_id text,
    program_name text,
    "state" text,
    "status" text,
    twitter text,
    youtube text,
    zip_code text,
    PRIMARY KEY (id)
);
