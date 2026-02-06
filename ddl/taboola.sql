CREATE TABLE campaign (
    id bigint,
    account_id bigint,
    approval_state text,
    bid_strategy text,
    branding_text text,
    campaign_item_type text,
    campaign_profile text,
    cpa_goal double precision,
    cpc double precision,
    daily_ad_delivery_model text,
    daily_cap double precision,
    end_date text,
    end_date_in_utc text,
    is_active boolean,
    is_spend_guard_active text,
    learning_state text,
    marketing_objective text,
    min_expected_conversions_for_cpa_goal text,
    "name" text,
    pricing_model text,
    roas_goal double precision,
    safety_rating text,
    spending_limit double precision,
    spending_limit_model text,
    spent double precision,
    start_date text,
    start_date_in_utc text,
    "status" text,
    target_cpa double precision,
    tracking_code text,
    traffic_allocation_ab_test_end_date text,
    traffic_allocation_mode text,
    "type" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE content_provider_platform_report (
    _fivetran_id text,
    account_id bigint,
    content_provider_id bigint,
    campaigns_num integer,
    clicks integer,
    content_provider text,
    content_provider_name text,
    conversions_value double precision,
    cpa double precision,
    cpa_actions_num integer,
    cpa_actions_num_from_clicks integer,
    cpa_actions_num_from_views integer,
    cpa_clicks double precision,
    cpa_conversion_rate double precision,
    cpa_conversion_rate_clicks double precision,
    cpa_conversion_rate_views double precision,
    cpa_views double precision,
    cpc double precision,
    cpm double precision,
    ctr double precision,
    currency text,
    "date" text,
    impressions bigint,
    platform text,
    roas double precision,
    spent double precision,
    timezone text,
    vcpm double precision,
    vctr double precision,
    visible_impressions integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (content_provider_id) REFERENCES account(id)
);

CREATE TABLE targeting_sub_country (
    "index" integer,
    campaign_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE "group" (
    "index" integer,
    account_id bigint,
    id text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE platform_report (
    _fivetran_id text,
    campaign_id bigint,
    clicks integer,
    conversions_value double precision,
    cpa double precision,
    cpa_actions_num integer,
    cpa_actions_num_from_clicks integer,
    cpa_actions_num_from_views integer,
    cpa_clicks double precision,
    cpa_conversion_rate double precision,
    cpa_conversion_rate_clicks double precision,
    cpa_conversion_rate_views double precision,
    cpa_views double precision,
    cpc double precision,
    cpm double precision,
    ctr double precision,
    currency text,
    "date" text,
    impressions bigint,
    platform text,
    platform_name text,
    roas double precision,
    spent double precision,
    timezone text,
    vcpm double precision,
    vctr double precision,
    visible_impressions integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE targeting_platform (
    "index" integer,
    campaign_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE targeting_publisher (
    "index" integer,
    campaign_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE top_campaign_content_report (
    _fivetran_id text,
    campaign_id bigint,
    item bigint,
    actions double precision,
    actions_num_from_clicks integer,
    actions_num_from_views integer,
    clicks integer,
    conversions_value double precision,
    cpa double precision,
    cpa_clicks double precision,
    cpa_views double precision,
    cpc double precision,
    cpm double precision,
    create_time text,
    ctr double precision,
    currency text,
    cvr double precision,
    cvr_clicks double precision,
    cvr_views double precision,
    "date" text,
    description text,
    impressions bigint,
    item_name text,
    learning_display_status text,
    old_item_version_id text,
    roas double precision,
    spent double precision,
    thumbnail_url text,
    timezone text,
    url text,
    vcpm double precision,
    vctr double precision,
    visible_impressions integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (item) REFERENCES campaign_item(id)
);

CREATE TABLE publisher_bid_modifier (
    "index" integer,
    campaign_id bigint,
    cpc_modification double precision,
    target text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE targeting_os (
    "index" integer,
    campaign_id bigint,
    os_family text,
    sub_categories text,
    "type" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE targeting_contextual (
    "index" integer,
    campaign_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_item (
    id bigint,
    campaign_id bigint,
    approval_state text,
    is_active boolean,
    "status" text,
    thumbnail_url text,
    title text,
    "type" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_site_day_report (
    _fivetran_id text,
    campaign_id bigint,
    blocking_level text,
    campaign_name text,
    clicks integer,
    conversions_value double precision,
    cpa double precision,
    cpa_actions_num integer,
    cpa_actions_num_from_clicks integer,
    cpa_actions_num_from_views integer,
    cpa_clicks double precision,
    cpa_conversion_rate double precision,
    cpa_conversion_rate_clicks double precision,
    cpa_conversion_rate_views double precision,
    cpa_views double precision,
    cpc double precision,
    cpm double precision,
    ctr double precision,
    currency text,
    date_time timestamp,
    impressions bigint,
    roas double precision,
    site text,
    site_name text,
    spent double precision,
    timezone text,
    vcpm double precision,
    vctr double precision,
    visible_impressions integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE country_report (
    _fivetran_id text,
    campaign_id bigint,
    clicks integer,
    conversions_value double precision,
    country text,
    country_name text,
    cpa double precision,
    cpa_actions_num integer,
    cpa_actions_num_from_clicks integer,
    cpa_actions_num_from_views integer,
    cpa_clicks double precision,
    cpa_conversion_rate double precision,
    cpa_conversion_rate_clicks double precision,
    cpa_conversion_rate_views double precision,
    cpa_views double precision,
    cpc double precision,
    cpm double precision,
    ctr double precision,
    currency text,
    "date" text,
    impressions bigint,
    roas double precision,
    spent double precision,
    timezone text,
    vcpm double precision,
    vctr double precision,
    visible_impressions integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_type (
    "index" integer,
    account_id bigint,
    "type" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id bigint,
    account_id text,
    country text,
    currency text,
    default_platform text,
    is_active boolean,
    language text,
    "name" text,
    parent_network text,
    timezone text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE "comment" (
    campaign_id bigint,
    "index" integer,
    account_id bigint,
    "comment" text,
    PRIMARY KEY (campaign_id, "index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE targeting_postal_code (
    "index" integer,
    campaign_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE contained_account (
    "index" integer,
    account_id bigint,
    id text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE content_provider_country_report (
    _fivetran_id text,
    account_id bigint,
    content_provider_id bigint,
    campaigns_num integer,
    clicks integer,
    content_provider text,
    content_provider_name text,
    conversions_value double precision,
    country_name text,
    country_value text,
    cpa double precision,
    cpa_actions_num integer,
    cpa_actions_num_from_clicks integer,
    cpa_actions_num_from_views integer,
    cpa_clicks double precision,
    cpa_conversion_rate double precision,
    cpa_conversion_rate_clicks double precision,
    cpa_conversion_rate_views double precision,
    cpa_views double precision,
    cpc double precision,
    cpm double precision,
    ctr double precision,
    currency text,
    "date" text,
    impressions bigint,
    roas double precision,
    spent double precision,
    timezone text,
    vcpm double precision,
    vctr double precision,
    visible_impressions integer,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (content_provider_id) REFERENCES account(id)
);

CREATE TABLE partner_type (
    "index" integer,
    account_id bigint,
    "type" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE targeting_country (
    "index" integer,
    campaign_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE targeting_audience_segment (
    "index" integer,
    campaign_id bigint,
    "state" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);
