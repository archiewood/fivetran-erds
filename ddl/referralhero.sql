CREATE TABLE subscriber_reward (
    id text,
    list_id text,
    subscriber_id text,
    coupon_code text,
    coupon_group text,
    created_at text,
    recurring_count text,
    referrals text,
    referrals_type text,
    signup_type text,
    "status" text,
    PRIMARY KEY (id, list_id, subscriber_id),
    FOREIGN KEY (list_id) REFERENCES subscriber(list_id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id),
    FOREIGN KEY (coupon_code) REFERENCES coupon(code)
);

CREATE TABLE coupon (
    "index" text,
    coupon_group_id text,
    list_id text,
    available text,
    code text,
    created_at text,
    email_id text,
    sent_at text,
    PRIMARY KEY ("index", coupon_group_id, list_id),
    FOREIGN KEY (coupon_group_id) REFERENCES coupon_group(id),
    FOREIGN KEY (list_id) REFERENCES coupon_group(list_id)
);

CREATE TABLE coupon_group (
    id text,
    list_id text,
    active text,
    created_at text,
    "name" text,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE list (
    id text,
    created_at text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE subscriber (
    id text,
    list_id text,
    code text,
    referred_by_id text,
    conversion_amount text,
    created_at text,
    crypto_wallet_address text,
    crypto_wallet_provider text,
    device text,
    email text,
    extra_field text,
    extra_field_2 text,
    host text,
    last_updated_at text,
    level_2_confirmed_referrals text,
    level_3_confirmed_referrals text,
    "name" text,
    option_field text,
    other_identifier_value text,
    pending_referrals text,
    people_referred text,
    phone_number text,
    points text,
    "position" text,
    promoted text,
    referral_link text,
    referral_status text,
    referral_status_at text,
    referred text,
    referred_by_points text,
    risk_level text,
    "source" text,
    unconfirmed_referrals text,
    verified text,
    verified_at text,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (code) REFERENCES coupon("index"),
    FOREIGN KEY (referred_by_id) REFERENCES subscriber(id)
);

CREATE TABLE reward (
    id text,
    list_id text,
    category text,
    description text,
    header text,
    image text,
    label text,
    points text,
    referrals text,
    signup_type text,
    title text,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);
