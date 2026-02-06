-- REPORTING TABLES
-- ----
-- | TABLES | 
-- |--------|
-- | [ACCOUNT_[SEGMENTATION]](https://ads-api.reddit.com/docs/v3/operations/Get%20A%20Report) | 
-- | [CAMPAIGN_[SEGMENTATION]](https://ads-api.reddit.com/docs/v3/operations/Get%20A%20Report) |
-- | [AD_GROUP_[SEGMENTATION]](https://ads-api.reddit.com/docs/v3/operations/Get%20A%20Report) |
-- |[AD_[SEGMENTATION]](https://ads-api.reddit.com/docs/v3/operations/Get%20A%20Report)|
-- |[[SEGMENTATION]](https://ads-api.reddit.com/docs/v3/operations/Get%20A%20Report)|

-- SEGMENTATION one of: 
--   - COMMUNITY
--   - INTEREST
--   - COUNTRY
--   - PLACEMENT
--   - METRO

CREATE TABLE third_party_tracker (
    "index" integer,
    ad_id text,
    "value" text,
    PRIMARY KEY ("index", ad_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id)
);

CREATE TABLE business (
    id text,
    agency_affiliated boolean,
    country text,
    created_at timestamp,
    creator_id text,
    industry text,
    modified_at timestamp,
    "name" text,
    phone text,
    website_url text,
    PRIMARY KEY (id)
);

CREATE TABLE geolocation (
    id text,
    country text,
    dma bigint,
    "name" text,
    postal_code text,
    region text,
    PRIMARY KEY (id)
);

CREATE TABLE pixel_partner_reference (
    "index" integer,
    account_id text,
    "value" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES business_account(id)
);

CREATE TABLE click_tracker (
    "index" integer,
    ad_id text,
    "value" text,
    PRIMARY KEY ("index", ad_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id)
);

CREATE TABLE targeting_keyword (
    keyword text,
    ad_group_id text,
    excluded boolean,
    PRIMARY KEY (keyword, ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id)
);

CREATE TABLE time_zone (
    id text,
    code text,
    dst_offset bigint,
    is_dst_active boolean,
    "name" text,
    "offset" bigint,
    PRIMARY KEY (id)
);

CREATE TABLE pixel_audience_targeting (
    "index" integer,
    custom_audience_id text,
    "value" text,
    PRIMARY KEY ("index", custom_audience_id),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE campaign (
    id text,
    account_id text,
    configured_status text,
    effective_status text,
    funding_instrument_id text,
    is_processing boolean,
    "name" text,
    objective text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES business_account(id)
);

CREATE TABLE interest (
    id text,
    category text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE targeting_community (
    ad_group_id text,
    community_id text,
    excluded boolean,
    PRIMARY KEY (ad_group_id, community_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (community_id) REFERENCES community(id)
);

CREATE TABLE engagement_audience_campaign (
    campaign_id text,
    custom_audience_id text,
    PRIMARY KEY (campaign_id, custom_audience_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE business_account (
    id text,
    business_id text,
    time_zone_id text,
    admin_approval text,
    attribution_type text,
    click_attribution_window text,
    created_at timestamp,
    currency text,
    modified_at timestamp,
    "name" text,
    suspension_reason text,
    "type" text,
    view_attribution_window text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_id) REFERENCES business(id),
    FOREIGN KEY (time_zone_id) REFERENCES time_zone(id)
);

CREATE TABLE targeting_custom_audience (
    ad_group_id text,
    custom_audience_id text,
    excluded boolean,
    PRIMARY KEY (ad_group_id, custom_audience_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE schedule (
    _fivetran_id text,
    ad_group_id text,
    end_day bigint,
    end_hour bigint,
    start_day bigint,
    start_hour bigint,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id)
);

CREATE TABLE engagement_audience_tracking_type (
    "index" integer,
    custom_audience_id text,
    "value" text,
    PRIMARY KEY ("index", custom_audience_id),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE pixel_audience_custom_targeting (
    "index" integer,
    custom_audience_id text,
    "value" text,
    PRIMARY KEY ("index", custom_audience_id),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE ad (
    id text,
    account_id text,
    ad_group_id text,
    campaign_id text,
    click_url text,
    configured_status text,
    effective_status text,
    is_processing boolean,
    "name" text,
    post_id text,
    post_url text,
    preview_expiry text,
    preview_url text,
    rejection_reason text,
    search_term text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES business_account(id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE community (
    id text,
    daily_impressions bigint,
    description text,
    icon_url text,
    "name" text,
    subscriber_count bigint,
    PRIMARY KEY (id)
);

CREATE TABLE targeting_placement (
    location text,
    ad_group_id text,
    PRIMARY KEY (location, ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id)
);

CREATE TABLE ad_group (
    id text,
    account_id text,
    campaign_id text,
    bid_strategy text,
    bid_value bigint,
    configured_status text,
    effective_status text,
    end_time timestamp,
    expand_targeting boolean,
    goal_type text,
    goal_value bigint,
    is_processing boolean,
    "name" text,
    optimization_strategy_type text,
    start_time timestamp,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES business_account(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE custom_audience_history (
    id text,
    account_id text,
    created_at timestamp,
    customer_list_config_external_id text,
    customer_list_config_origin text,
    engagement_audience_configlookback_window_days bigint,
    lookalike_configsource_audience_id text,
    "name" text,
    pixel_audience_configlookback_window_days text,
    size_range_lower bigint,
    size_range_upper bigint,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES business_account(id)
);

CREATE TABLE targeting_device (
    _fivetran_id text,
    ad_group_id text,
    label_map jsonb,
    max_version text,
    min_version text,
    os text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id)
);

CREATE TABLE targeting_interest (
    ad_group_id text,
    interest_id text,
    excluded boolean,
    PRIMARY KEY (ad_group_id, interest_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (interest_id) REFERENCES interest(id)
);

CREATE TABLE targeting_geolocation (
    ad_group_id text,
    geolocation_id text,
    excluded boolean,
    PRIMARY KEY (ad_group_id, geolocation_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (geolocation_id) REFERENCES geolocation(id)
);
