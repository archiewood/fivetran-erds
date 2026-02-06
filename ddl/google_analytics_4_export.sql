-- param_ and user_property_ columns are populated if sync mode is Columns.
-- params and user_properties columns are populated if the sync mode is JSON.

CREATE TABLE item_param (
    "name" text,
    _fivetran_id text,
    "value" text,
    PRIMARY KEY ("name", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES item("index")
);

CREATE TABLE item (
    "index" integer,
    _fivetran_id text,
    affiliation text,
    brand text,
    category text,
    category_2 text,
    category_3 text,
    category_4 text,
    category_5 text,
    coupon text,
    creative_name text,
    creative_slot text,
    event_timestamp timestamp,
    id text,
    list_id text,
    list_index text,
    list_name text,
    location_id text,
    "name" text,
    price double precision,
    price_in_usd double precision,
    promotion_id text,
    promotion_name text,
    quantity bigint,
    refund double precision,
    refund_in_usd double precision,
    revenue double precision,
    revenue_in_usd double precision,
    variant text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES event(_fivetran_id)
);

CREATE TABLE event_param (
    "name" text,
    _fivetran_id text,
    "value" text,
    PRIMARY KEY ("name", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES event(_fivetran_id)
);

CREATE TABLE user_property (
    "name" text,
    _fivetran_id text,
    "value" text,
    PRIMARY KEY ("name", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES event(_fivetran_id)
);

CREATE TABLE event (
    _fivetran_id text,
    batch_event_index bigint,
    batch_ordering_id bigint,
    batch_page_id bigint,
    bundle_sequence_id bigint,
    "date" text,
    event_dimensions_hostname text,
    is_active_user boolean,
    is_intraday boolean,
    "name" text,
    platform text,
    previous_timestamp timestamp,
    privacy_info_ads_storage text,
    privacy_info_analytics_storage text,
    privacy_info_uses_transient_token text,
    server_timestamp_offset timestamp,
    session_traffic_source_last_click_google_ads_campaign_account_name text,
    session_traffic_source_last_click_google_ads_campaign_ad_group_id text,
    session_traffic_source_last_click_google_ads_campaign_ad_group_name text,
    session_traffic_source_last_click_google_ads_campaign_campaign_id text,
    session_traffic_source_last_click_google_ads_campaign_campaign_name text,
    session_traffic_source_last_click_google_ads_campaign_customer_id text,
    session_traffic_source_last_click_manual_campaign_campaign_id text,
    session_traffic_source_last_click_manual_campaign_campaign_name text,
    session_traffic_source_last_click_manual_campaign_content text,
    session_traffic_source_last_click_manual_campaign_creative_format text,
    session_traffic_source_last_click_manual_campaign_marketing_tactic text,
    session_traffic_source_last_click_manual_campaign_medium text,
    session_traffic_source_last_click_manual_campaign_source text,
    session_traffic_source_last_click_manual_campaign_source_platform text,
    session_traffic_source_last_click_manual_campaign_term text,
    stream_id text,
    "timestamp" timestamp,
    traffic_source_medium text,
    traffic_source_name text,
    traffic_source_source text,
    user_first_touch_timestamp timestamp,
    user_id text,
    user_ltv_currency text,
    user_ltv_revenue double precision,
    user_pseudo_id text,
    value_in_usd double precision,
    -- app_info_* (dynamic column),
    -- collected_traffic_source_* (dynamic column),
    -- device_* (dynamic column),
    -- ecommerce_* (dynamic column),
    -- geo_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);
