CREATE TABLE signup (
    created_on text,
    customer_id text,
    campaign_id text,
    referral_code text,
    advocate_customer_id text,
    advocate_email text,
    advocate_name text,
    campaign_name text,
    channel text,
    email text,
    ip_address text,
    "name" text,
    new_customer text,
    user_agent text,
    PRIMARY KEY (created_on, customer_id),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id),
    FOREIGN KEY (referral_code) REFERENCES share(referral_code)
);

CREATE TABLE distributed_friend_incentive (
    friend_email text,
    campaign_id text,
    referral_code text,
    advocate_name text,
    campaign_name text,
    coupon_code text,
    friend_name text,
    incentive_amount text,
    incentive_type text,
    "trigger" text,
    PRIMARY KEY (friend_email),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id),
    FOREIGN KEY (referral_code) REFERENCES share(referral_code)
);

CREATE TABLE distributed_advocate_reward (
    _fivetran_id text,
    campaign_id text,
    referral_code text,
    advocate_customer_id text,
    advocate_name text,
    friend_customer_id text,
    reward_amount text,
    reward_type text,
    "trigger" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id),
    FOREIGN KEY (referral_code) REFERENCES share(referral_code)
);

CREATE TABLE widget_view (
    campaign_id text,
    created_on text,
    customer_id text,
    campaign_name text,
    email text,
    ip_address text,
    user_agent text,
    widget_name text,
    widget_type text,
    PRIMARY KEY (campaign_id, created_on),
    FOREIGN KEY (customer_id) REFERENCES signup(customer_id)
);

CREATE TABLE click (
    destination_url text,
    campaign_id text,
    referral_code text,
    advocate_name text,
    PRIMARY KEY (destination_url),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id),
    FOREIGN KEY (referral_code) REFERENCES share(referral_code)
);

CREATE TABLE share (
    created_on text,
    referral_code text,
    campaign_id text,
    advocate_email text,
    channel text,
    PRIMARY KEY (created_on, referral_code),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id)
);

CREATE TABLE email_capture (
    _fivetran_id text,
    campaign_id text,
    campaign_name text,
    created_on text,
    email text,
    email_capture_type text,
    ip_address text,
    "name" text,
    newsletter_opt_in text,
    widget_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id)
);

CREATE TABLE ledger_head (
    currency text,
    customer_id text,
    current_balance text,
    PRIMARY KEY (currency, customer_id),
    FOREIGN KEY (customer_id) REFERENCES signup(customer_id)
);

CREATE TABLE purchase_product (
    "index" text,
    purchase_order_id text,
    "name" text,
    price text,
    quantity text,
    sku text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase(order_id)
);

CREATE TABLE purchase (
    order_id text,
    campaign_id text,
    referral_code text,
    advocate_name text,
    amount text,
    coupon_code text,
    customer_id text,
    email text,
    "name" text,
    new_customer text,
    PRIMARY KEY (order_id),
    FOREIGN KEY (campaign_id) REFERENCES widget_view(campaign_id),
    FOREIGN KEY (referral_code) REFERENCES share(referral_code)
);
