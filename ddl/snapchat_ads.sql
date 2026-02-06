CREATE TABLE creative_history (
    id text,
    updated_at timestamp,
    ad_account_id text,
    app_install_icon_media_id text,
    deep_link_icon_media_id text,
    longform_video_media_id text,
    top_snap_media_id text,
    ad_product text,
    app_install_android_app_url text,
    app_install_app_name text,
    app_install_ios_app_id text,
    attachment_type text,
    brand_name text,
    call_to_action text,
    created_at timestamp,
    deep_link_android_app_url text,
    deep_link_app_name text,
    deep_link_ios_app_id text,
    deep_link_uri text,
    headline text,
    "name" text,
    packaging_status text,
    playback_type text,
    preview_creative_id text,
    review_status text,
    shareable boolean,
    top_snap_crop_position text,
    "type" text,
    -- web_view_* (dynamic column),
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account_history(id),
    FOREIGN KEY (app_install_icon_media_id) REFERENCES media_history(id),
    FOREIGN KEY (deep_link_icon_media_id) REFERENCES media_history(id),
    FOREIGN KEY (longform_video_media_id) REFERENCES media_history(id),
    FOREIGN KEY (top_snap_media_id) REFERENCES media_history(id)
);

CREATE TABLE funding_source_history (
    id text,
    updated_at timestamp,
    organization_id text,
    available_credit_micro bigint,
    budget_spent_micro bigint,
    card_type text,
    created_at timestamp,
    currency text,
    daily_spend_limit_currency text,
    daily_spend_limit_micro bigint,
    email text,
    end_date text,
    expiration_month text,
    expiration_year text,
    last_4_digits_of_card text,
    "name" text,
    start_date text,
    "status" text,
    total_budget_micro bigint,
    "type" text,
    value_micro bigint,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (organization_id) REFERENCES organization_history(id)
);

CREATE TABLE organization_history (
    id text,
    updated_at timestamp,
    address_line_1 text,
    administrative_district_level_1 text,
    country text,
    created_at timestamp,
    locality text,
    "name" text,
    postal_code text,
    "type" text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE targeting_geolocation_history (
    _fivetran_id text,
    ad_squad_id text,
    ad_squad_updated_at timestamp,
    country_code text,
    geo_type text,
    geo_value text,
    operation text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_squad_id) REFERENCES ad_squad_history(id),
    FOREIGN KEY (ad_squad_updated_at) REFERENCES ad_squad_history(id)
);

CREATE TABLE ad_account_history (
    id text,
    updated_at timestamp,
    organization_id text,
    advertiser text,
    created_at timestamp,
    currency text,
    lifetime_spend_cap_micro bigint,
    "name" text,
    "status" text,
    timezone text,
    "type" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (organization_id) REFERENCES organization_history(id)
);

-- Campaign Reporting Tables
-- Full documentation of reporting tables available in docs
-- ----
-- | Available Reporting Tables |
-- |---------------------------|
-- | CAMPAIGN_HOURLY_REPORT |
-- | CAMPAIGN_DAILY_REPORT |
-- | CAMPAIGN_UNIQUE_IMPRESSION_DAILY_REPORT |
-- | CAMPAIGN_GEO_COUNTRY_DAILY_REPORT |
-- | CAMPAIGN_GEO_REGION_DAILY_REPORT |
-- | CAMPAIGN_GEO_DMA_DAILY_REPORT |
-- | CAMPAIGN_INTEREST_DAILY_REPORT |
-- | CAMPAIGN_DEVICE_OS_DAILY_REPORT |
-- | CAMPAIGN_DEVICE_MAKE_DAILY_REPORT |
-- | CAMPAIGN_DEMOGRAPHIC_DAILY_REPORT |
CREATE TABLE campaign_history (
    id text,
    updated_at timestamp,
    ad_account_id text,
    created_at timestamp,
    daily_budget_micro bigint,
    end_time timestamp,
    lifetime_spend_cap_micro bigint,
    "name" text,
    objective text,
    start_time timestamp,
    "status" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account_history(id)
);

CREATE TABLE ad_account_funding_source (
    ad_account_id text,
    funding_source_id text,
    PRIMARY KEY (ad_account_id, funding_source_id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account_history(id),
    FOREIGN KEY (funding_source_id) REFERENCES funding_source_history(id)
);

CREATE TABLE creative_url_tag_history (
    "key" text,
    "value" text,
    creative_id text,
    updated_at timestamp,
    PRIMARY KEY ("key", "value", creative_id, updated_at),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id),
    FOREIGN KEY (updated_at) REFERENCES creative_history(id)
);

CREATE TABLE audience_segment_history (
    id text,
    updated_at timestamp,
    ad_account_id text,
    approximate_number_users bigint,
    created_at timestamp,
    description text,
    "name" text,
    retention_in_days integer,
    source_type text,
    "status" text,
    targetable_status text,
    upload_status text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account_history(id)
);

CREATE TABLE ad_squad_segment_history (
    ad_squad_id text,
    ad_squad_updated_at timestamp,
    audience_segment_id text,
    operation text,
    PRIMARY KEY (ad_squad_id, ad_squad_updated_at, audience_segment_id),
    FOREIGN KEY (ad_squad_id) REFERENCES ad_squad_history(id),
    FOREIGN KEY (ad_squad_updated_at) REFERENCES ad_squad_history(id),
    FOREIGN KEY (audience_segment_id) REFERENCES audience_segment_history(id)
);

CREATE TABLE targeting_demographic_history (
    "index" bigint,
    ad_squad_id text,
    ad_squad_updated_at timestamp,
    advanced_demographics jsonb,
    age_groups jsonb,
    gender text,
    languages jsonb,
    min_age text,
    operation text,
    PRIMARY KEY ("index", ad_squad_id, ad_squad_updated_at),
    FOREIGN KEY (ad_squad_id) REFERENCES ad_squad_history(id),
    FOREIGN KEY (ad_squad_updated_at) REFERENCES ad_squad_history(id)
);

CREATE TABLE snap_pixel_history (
    id text,
    updated_at timestamp,
    ad_account_id text,
    created_at timestamp,
    effective_status text,
    "name" text,
    pixel_javascript text,
    "status" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account_history(id)
);

CREATE TABLE targeting_device_history (
    "index" bigint,
    ad_squad_id text,
    ad_squad_updated_at timestamp,
    os_type text,
    PRIMARY KEY ("index", ad_squad_id, ad_squad_updated_at),
    FOREIGN KEY (ad_squad_id) REFERENCES ad_squad_history(id),
    FOREIGN KEY (ad_squad_updated_at) REFERENCES ad_squad_history(id)
);

-- AD REPORTING TABLES
-- Full documentation of reporting tables available in docs
-- ----
-- | Reporting Tables |
-- |---------------------|
-- | AD_HOURLY_REPORT |
-- | AD_DAILY_REPORT |
-- | AD_UNIQUE_IMPRESSION_DAILY_REPORT |
-- | AD_GEO_COUNTRY_DAILY_REPORT |
-- | AD_GEO_REGION_DAILY_REPORT |
-- | AD_GEO_DMA_DAILY_REPORT |
-- | AD_INTEREST_DAILY_REPORT |
-- | AD_DEVICE_OS_DAILY_REPORT |
-- | AD_DEVICE_MAKE_DAILY_REPORT |
-- | AD_DEMOGRAPHIC_DAILY_REPORT |
CREATE TABLE ad_history (
    id text,
    updated_at timestamp,
    ad_squad_id text,
    creative_id text,
    created_at timestamp,
    deleted boolean,
    "name" text,
    review_status text,
    review_status_reason text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ad_squad_id) REFERENCES ad_squad_history(id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE media_history (
    id text,
    updated_at timestamp,
    ad_account_id text,
    created_at timestamp,
    download_link text,
    file_name text,
    media_status text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account_history(id)
);

CREATE TABLE targeting_interest_history (
    "index" bigint,
    ad_squad_id text,
    ad_squad_updated_at timestamp,
    category_id jsonb,
    PRIMARY KEY ("index", ad_squad_id, ad_squad_updated_at),
    FOREIGN KEY (ad_squad_id) REFERENCES ad_squad_history(id),
    FOREIGN KEY (ad_squad_updated_at) REFERENCES ad_squad_history(id)
);

-- AD SQUAD REPORTING TABLES
-- Full documentation of reporting tables available in docs
-- ----
-- |Reporting Tables |
-- |---------------------------|
-- | AD_SQUAD_HOURLY_REPORT |
-- | AD_SQUAD_DAILY_REPORT |
-- | AD_SQUAD_UNIQUE_IMPRESSION_DAILY_REPORT |
-- | AD_SQUAD_GEO_COUNTRY_DAILY_REPORT |
-- | AD_SQUAD_GEO_REGION_DAILY_REPORT |
-- | AD_SQUAD_GEO_DMA_DAILY_REPORT |
-- | AD_SQUAD_INTEREST_DAILY_REPORT |
-- | AD_SQUAD_DEVICE_OS_DAILY_REPORT |
-- | AD_SQUAD_DEVICE_MAKE_DAILY_REPORT |
-- | AD_SQUAD_DEMOGRAPHIC_DAILY_REPORT |
CREATE TABLE ad_squad_history (
    id text,
    updated_at timestamp,
    campaign_id text,
    audience_size_maximum bigint,
    audience_size_minimum bigint,
    auto_bid boolean,
    bid_estimate_maximum bigint,
    bid_estimate_minimum bigint,
    bid_micro bigint,
    bid_strategy text,
    billing_event text,
    created_at timestamp,
    daily_budget_micro bigint,
    delivery_constraint text,
    end_time timestamp,
    lifetime_budget_micro bigint,
    lifetime_spend_micro bigint,
    "name" text,
    optimization_goal text,
    pacing_type text,
    placement text,
    start_time timestamp,
    "status" text,
    target_bid boolean,
    targeting_regulated_content boolean,
    "type" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);
