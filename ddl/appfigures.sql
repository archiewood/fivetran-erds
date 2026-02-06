CREATE TABLE payment (
    "date" text,
    storefront text,
    iso text,
    product_id text,
    converted_revenue text,
    estimated_revenue text,
    financial_revenue text,
    revenue text,
    "type" text,
    PRIMARY KEY ("date", storefront, iso, product_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE country (
    iso text,
    apple_store_no text,
    "name" text,
    PRIMARY KEY (iso)
);

CREATE TABLE installed_sdk (
    id text,
    product_id text,
    active boolean,
    found_on text,
    last_updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE event_product (
    event_id text,
    product_id text,
    PRIMARY KEY (event_id, product_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE event (
    id text,
    caption text,
    "date" text,
    details text,
    origin text,
    PRIMARY KEY (id)
);

CREATE TABLE archive (
    id text,
    external_account_id text,
    import_method text,
    import_timestamp text,
    region text,
    report_timestamp text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (external_account_id) REFERENCES external_account(account_id)
);

CREATE TABLE product (
    id text,
    currency text,
    parent_id text,
    source_external_account_id text,
    store_id text,
    accessible_features jsonb,
    added_date text,
    children jsonb,
    developer text,
    devices jsonb,
    features jsonb,
    icon text,
    "name" text,
    price text,
    ref_no text,
    release_date text,
    sku text,
    source_active boolean,
    source_added_timestamp text,
    source_hidden boolean,
    source_type text,
    "type" text,
    updated_date text,
    vendor_identifier text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (currency) REFERENCES currency(currency),
    FOREIGN KEY (parent_id) REFERENCES product(id),
    FOREIGN KEY (source_external_account_id) REFERENCES external_account(account_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE external_account (
    id text,
    account_id text,
    store_id text,
    auto_import boolean,
    nickname text,
    username text,
    vendor_id text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES users(account_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE sub_category (
    sub_category text,
    category_id text,
    PRIMARY KEY (sub_category, category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id text,
    parent_id text,
    store_id text,
    active boolean,
    device text,
    hidden boolean,
    "name" text,
    store_front text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES category(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE sdk_external_link (
    _fivetran_id text,
    sdk_id text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sdk_id) REFERENCES sdk(id)
);

CREATE TABLE sdk_tag (
    tags text,
    sdk_id text,
    PRIMARY KEY (tags, sdk_id),
    FOREIGN KEY (sdk_id) REFERENCES sdk(id)
);

CREATE TABLE sdk_platform (
    platform text,
    sdk_id text,
    PRIMARY KEY (platform, sdk_id),
    FOREIGN KEY (sdk_id) REFERENCES sdk(id)
);

CREATE TABLE sdk_tracked_platform (
    tracked_platform text,
    sdk_id text,
    PRIMARY KEY (tracked_platform, sdk_id),
    FOREIGN KEY (sdk_id) REFERENCES sdk(id)
);

CREATE TABLE sdk (
    id text,
    active boolean,
    code text,
    description text,
    developer_links jsonb,
    developer_name text,
    "name" text,
    notes text,
    release_date text,
    started_tracking text,
    PRIMARY KEY (id)
);

CREATE TABLE currency (
    currency text,
    symbol text,
    PRIMARY KEY (currency)
);

CREATE TABLE sale (
    "date" text,
    device text,
    storefront text,
    iso text,
    product_id text,
    app_downloads text,
    app_returns text,
    app_returns_amount text,
    app_revenue text,
    business_downloads text,
    business_revenue text,
    downloads text,
    edu_downloads text,
    edu_revenue text,
    gift_redemptions text,
    gifts text,
    gross_app_returns_amount text,
    gross_app_revenue text,
    gross_business_revenue text,
    gross_edu_revenue text,
    gross_iap_returns_amount text,
    gross_iap_revenue text,
    gross_returns_amount text,
    gross_revenue text,
    gross_standard_revenue text,
    gross_subscription_returns_amount text,
    gross_subscription_revenue text,
    iap_amount text,
    iap_returns text,
    iap_returns_amount text,
    iap_revenue text,
    net_downloads text,
    promos text,
    re_downloads text,
    returns text,
    returns_amount text,
    revenue text,
    standard_downloads text,
    standard_revenue text,
    store text,
    subscription_purchases text,
    subscription_returns text,
    subscription_returns_amount text,
    subscription_revenue text,
    uninstalls text,
    updates text,
    PRIMARY KEY ("date", device, storefront, iso, product_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE revenue (
    "date" text,
    iso text,
    storefront text,
    product_id text,
    ads text,
    business text,
    edu text,
    gross_business text,
    gross_edu text,
    gross_iap text,
    gross_returns text,
    gross_sales text,
    gross_subscriptions text,
    gross_total text,
    iap text,
    returns text,
    sales text,
    store text,
    subscriptions text,
    total text,
    PRIMARY KEY ("date", iso, storefront, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE subscription (
    "date" text,
    iso text,
    storefront text,
    product_id text,
    activations text,
    active_discounted_subscriptions text,
    active_free_trials text,
    active_grace text,
    active_subscriptions text,
    active_trials text,
    actual_revenue text,
    all_active_subscriptions text,
    all_subscribers text,
    cancellations text,
    cancelled_subscriptions text,
    churn text,
    first_year_subscribers text,
    grace_drop_off text,
    grace_recovery text,
    gross_monthly_recurring_revenu text,
    gross_revenue text,
    monthly_recurring_revenu text,
    new_grace text,
    new_subscriptions text,
    new_trial_grace text,
    new_trials text,
    non_first_year_subscribers text,
    paying_subscriptions text,
    reactivations text,
    renewals text,
    transitions_in text,
    transitions_out text,
    trial_cancellations text,
    trial_conversion_rate text,
    trial_conversions text,
    trial_grace_drop_off text,
    trial_grace_recovery text,
    PRIMARY KEY ("date", iso, storefront, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE advertisement_spend (
    _fivetran_id text,
    iso text,
    product_id text,
    clicks text,
    cost text,
    cpa text,
    cpc text,
    ctr text,
    "date" text,
    impressions text,
    installs text,
    network text,
    storefront text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE languages (
    code text,
    iso text,
    "name" text,
    PRIMARY KEY (code),
    FOREIGN KEY (iso) REFERENCES country(iso)
);

CREATE TABLE ad_report (
    _fivetran_id text,
    iso text,
    product_id text,
    clicks text,
    ctr text,
    "date" text,
    ecpm text,
    fillrate text,
    impressions text,
    network text,
    requests text,
    requests_filled text,
    revenue text,
    storefront text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE store_supported_feature (
    supported_feature text,
    store_id text,
    PRIMARY KEY (supported_feature, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE store_front (
    id text,
    store_id text,
    "name" text,
    short_name text,
    "type" text,
    PRIMARY KEY (id, store_id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE store_category (
    category_id integer,
    store_id text,
    PRIMARY KEY (category_id, store_id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE store_country (
    iso text,
    store_id text,
    PRIMARY KEY (iso, store_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE store (
    id text,
    code text,
    "name" text,
    short_name text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE review (
    _fivetran_id text,
    iso text,
    product_id text,
    author text,
    "date" text,
    has_response boolean,
    id text,
    original_review text,
    original_title text,
    predicted_langs jsonb,
    review text,
    stars text,
    title text,
    version text,
    weight text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE user_entitlement (
    entitlement text,
    account_id text,
    users_id text,
    PRIMARY KEY (entitlement, account_id, users_id),
    FOREIGN KEY (account_id) REFERENCES users(account_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_product (
    account_id text,
    product_id text,
    users_id text,
    PRIMARY KEY (account_id, product_id, users_id),
    FOREIGN KEY (account_id) REFERENCES users(account_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    account_id text,
    id text,
    account_auto_import boolean,
    account_company text,
    account_is_premium boolean,
    account_last_import text,
    account_name text,
    account_plan text,
    account_plan_id text,
    active boolean,
    avatar_url text,
    currency text,
    date_format text,
    email text,
    is_owner boolean,
    last_login text,
    "name" text,
    region text,
    "role" text,
    share_of_profit text,
    timezone text,
    PRIMARY KEY (account_id, id)
);

CREATE TABLE estimate (
    "date" text,
    storefront text,
    iso text,
    product_id text,
    download text,
    revenue text,
    PRIMARY KEY ("date", storefront, iso, product_id),
    FOREIGN KEY (iso) REFERENCES country(iso),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
