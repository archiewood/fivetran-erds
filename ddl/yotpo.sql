CREATE TABLE review (
    id text,
    "comment" text,
    content text,
    created_at text,
    external_order_id text,
    external_product_id text,
    images_data jsonb,
    incentive_type text,
    is_incentivized text,
    order_id text,
    published text,
    score text,
    source_review_id text,
    title text,
    user_display_name text,
    user_email text,
    user_id text,
    user_last_email_sent text,
    user_social_image text,
    user_type text,
    verified_buyer text,
    votes_down text,
    votes_up text,
    -- custom_* (dynamic column),
    -- product_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE customer_list (
    id text,
    customer_fivetran_id text,
    since text,
    PRIMARY KEY (id, customer_fivetran_id),
    FOREIGN KEY (customer_fivetran_id) REFERENCES customer(_fivetran_id)
);

CREATE TABLE customer_ugc_top_topic (
    "index" text,
    customer_fivetran_id text,
    topic text,
    PRIMARY KEY ("index", customer_fivetran_id),
    FOREIGN KEY (customer_fivetran_id) REFERENCES customer(_fivetran_id)
);

CREATE TABLE customer_sms_response_message (
    id text,
    customer_fivetran_id text,
    flow_id text,
    keyword text,
    timestamps text,
    PRIMARY KEY (id, customer_fivetran_id),
    FOREIGN KEY (customer_fivetran_id) REFERENCES customer(_fivetran_id)
);

CREATE TABLE customer (
    _fivetran_id text,
    accepts_email_marketing text,
    accepts_sms_marketing text,
    account_created_at text,
    account_status text,
    account_updated_at text,
    address_1 text,
    address_2 text,
    address_city text,
    address_company text,
    address_country_code text,
    address_phone_number text,
    address_province_code text,
    address_state text,
    address_zip text,
    default_currency text,
    default_language text,
    email text,
    email_last_converted text,
    email_last_delivered text,
    email_last_engaged text,
    email_last_opened text,
    email_last_promotional_sent text,
    email_last_sent text,
    email_last_spam text,
    email_marketing_consent text,
    email_marketing_suppression_reason text,
    email_marketing_suppression_timestamp text,
    email_marketing_timestamp text,
    external_id text,
    first_name text,
    gender text,
    last_name text,
    loyalty_credit_balance_amount text,
    loyalty_credit_balance_customer_currency text,
    loyalty_has_store_account text,
    loyalty_is_opt_in text,
    loyalty_is_referred_by_other_customer text,
    loyalty_last_seen_at text,
    loyalty_opt_in_date text,
    loyalty_opt_out_date text,
    loyalty_points_balance text,
    loyalty_points_earned text,
    loyalty_points_expire_date text,
    loyalty_referrals_made_and_clicked text,
    loyalty_referred_by_customer text,
    loyalty_successful_referral text,
    loyalty_total_points_redeemed text,
    loyalty_total_redemption text,
    loyalty_vip_entry_date text,
    loyalty_vip_expiration_date text,
    loyalty_vip_tier_name text,
    phone_number text,
    sms_last_converted text,
    sms_last_engaged text,
    sms_last_sent text,
    sms_marketing_consent text,
    sms_marketing_timestamp text,
    tags text,
    ugc_avg_product_rating text,
    ugc_avg_site_rating text,
    ugc_last_review_date text,
    ugc_last_sentiment text,
    ugc_last_star_rating text,
    ugc_sentiment_avg_product text,
    ugc_sentiment_avg_site text,
    ugc_total_avg_rating text,
    ugc_total_avg_sentiment text,
    ugc_total_reviews text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE customer_subscription (
    "index" text,
    "type" text,
    customer_fivetran_id text,
    external_product_id text,
    external_variant_id text,
    PRIMARY KEY ("index", "type", customer_fivetran_id),
    FOREIGN KEY (customer_fivetran_id) REFERENCES customer(_fivetran_id)
);

CREATE TABLE customer_campaign (
    id text,
    "type" text,
    customer_fivetran_id text,
    clicked text,
    converted text,
    PRIMARY KEY (id, "type", customer_fivetran_id),
    FOREIGN KEY (customer_fivetran_id) REFERENCES customer(_fivetran_id)
);

CREATE TABLE customer_flow (
    id text,
    "type" text,
    customer_fivetran_id text,
    clicked text,
    converted text,
    opened text,
    PRIMARY KEY (id, "type", customer_fivetran_id),
    FOREIGN KEY (customer_fivetran_id) REFERENCES customer(_fivetran_id)
);
