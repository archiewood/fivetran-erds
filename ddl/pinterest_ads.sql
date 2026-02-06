-- See the full list of available metrics in the Pinterest Developer docs:
--   - Account analytics reports
--   - Pin analytics report

CREATE TABLE pin_media (
    _fivetran_id text,
    _fivetran_pin_id text,
    cover_image_url text,
    description text,
    duration bigint,
    height integer,
    item_type text,
    link text,
    title text,
    width integer,
    PRIMARY KEY (_fivetran_id, _fivetran_pin_id),
    FOREIGN KEY (_fivetran_pin_id) REFERENCES pin_history(_fivetran_id)
);

CREATE TABLE pin_history (
    _fivetran_id text,
    board_id text,
    board_section_id text,
    parent_pin_id text,
    ad_creative_type text,
    alt_text text,
    board_owner_username text,
    created_at timestamp,
    description text,
    dominant_color text,
    id text,
    is_standard boolean,
    link text,
    media_type text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (board_id) REFERENCES board_history(_fivetran_id),
    FOREIGN KEY (board_section_id) REFERENCES board_section(id),
    FOREIGN KEY (parent_pin_id) REFERENCES pin_history(_fivetran_id)
);

CREATE TABLE catalog_product_groups_history (
    id text,
    last_update timestamp,
    feed_profile_id text,
    created_at timestamp,
    description text,
    filters jsonb,
    is_featured boolean,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, last_update),
    FOREIGN KEY (feed_profile_id) REFERENCES catalog_feed_history(id)
);

CREATE TABLE pin_promotion_history (
    id text,
    updated_time timestamp,
    ad_group_id text,
    campaign_id text,
    pin_id text,
    ad_account_id text,
    android_deep_link text,
    click_tracking_url text,
    collection_items_destination_url_template text,
    created_time timestamp,
    creative_type text,
    destination_url text,
    ios_deep_link text,
    is_pin_deleted boolean,
    is_removable boolean,
    "name" text,
    review_status text,
    "status" text,
    summary_status text,
    view_tracking_url text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (pin_id) REFERENCES pin_history(_fivetran_id)
);

CREATE TABLE ad_group_history (
    id text,
    updated_time timestamp,
    ad_account_id text,
    campaign_id text,
    auto_targeting_enabled boolean,
    bid_in_micro_currency bigint,
    bid_strategy_type text,
    billable_event text,
    budget_in_micro_currency bigint,
    budget_type text,
    conversion_learning_mode_type text,
    created_time timestamp,
    end_time timestamp,
    feed_profile_id text,
    lifetime_frequency_cap integer,
    "name" text,
    pacing_delivery_type text,
    placement_group text,
    start_time timestamp,
    "status" text,
    summary_status text,
    upgrade_status text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (ad_account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE customer_list_history (
    id text,
    updated_time timestamp,
    advertiser_id text,
    created_time timestamp,
    exceptions text,
    "name" text,
    num_batches bigint,
    num_removed_user_records bigint,
    num_uploaded_user_records bigint,
    "status" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE pin_analytics_report (
    "date" timestamp,
    device_type text,
    id text,
    advertiser_id text,
    PRIMARY KEY ("date", device_type, id),
    FOREIGN KEY (id) REFERENCES pin_history(_fivetran_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE pin_promotion_report (
    "date" timestamp,
    ad_group_id text,
    advertiser_id text,
    campaign_id text,
    pin_promotion_id text,
    PRIMARY KEY ("date", ad_group_id, advertiser_id, campaign_id, pin_promotion_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (pin_promotion_id) REFERENCES pin_promotion_history(id)
);

CREATE TABLE ad_group_report (
    "date" timestamp,
    ad_group_id text,
    advertiser_id text,
    PRIMARY KEY ("date", ad_group_id, advertiser_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE advertiser_history (
    id text,
    updated_time timestamp,
    account_permissions jsonb,
    country text,
    created_time timestamp,
    currency text,
    "name" text,
    owner_user_id text,
    owner_username text,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE mmm_ad_group_targeting_daily_report (
    app_type text,
    "date" text,
    gender text,
    location_code text,
    ad_group_id text,
    advertiser_id text,
    country text,
    cpc double precision,
    creative_type text,
    ctr double precision,
    earned_impressions integer,
    earned_pin_clicks integer,
    ecpm double precision,
    engagement_rate double precision,
    engagements integer,
    impressions integer,
    location text,
    paid_impressions integer,
    paid_pin_clicks integer,
    pin_clicks integer,
    spend double precision,
    spend_in_account_currency double precision,
    spend_order_line_id text,
    spend_order_line_paid_type text,
    PRIMARY KEY (app_type, "date", gender, location_code, ad_group_id, advertiser_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE pin_media_image (
    property_name text,
    _fivetran_media_id text,
    _fivetran_pin_id text,
    height integer,
    url text,
    width integer,
    PRIMARY KEY (property_name, _fivetran_media_id, _fivetran_pin_id),
    FOREIGN KEY (_fivetran_media_id) REFERENCES pin_media(_fivetran_pin_id),
    FOREIGN KEY (_fivetran_pin_id) REFERENCES pin_history(_fivetran_id)
);

CREATE TABLE targeting_gender (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE board_section (
    board_id text,
    id text,
    "name" text,
    PRIMARY KEY (board_id, id)
);

CREATE TABLE conversion_tag_history (
    _fivetran_id text,
    advertiser_id text,
    code_snippet text,
    enhanced_match_status text,
    id text,
    last_fired_time_ms text,
    "name" text,
    "status" text,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE campaign_report (
    "date" timestamp,
    advertiser_id text,
    campaign_id text,
    PRIMARY KEY ("date", advertiser_id, campaign_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE campaign_history (
    id text,
    updated_time timestamp,
    advertiser_id text,
    created_time timestamp,
    daily_spend_cap bigint,
    default_ad_group_budget_in_micro_currency bigint,
    end_time timestamp,
    is_automated_campaign boolean,
    is_campaign_budget_optimization boolean,
    is_flexible_daily_budgets boolean,
    lifetime_spend_cap bigint,
    "name" text,
    objective_type text,
    order_line_id text,
    start_time timestamp,
    "status" text,
    summary_status text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE targeting_age_bucket (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE product_group_targeting_report (
    "date" timestamp,
    targeting_type text,
    targeting_value text,
    advertiser_id text,
    product_group_id text,
    PRIMARY KEY ("date", targeting_type, targeting_value, advertiser_id, product_group_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (product_group_id) REFERENCES product_group_history(_fivetran_id)
);

CREATE TABLE board_pin_thumbnail_url (
    url text,
    board_id text,
    PRIMARY KEY (url, board_id),
    FOREIGN KEY (board_id) REFERENCES board_history(_fivetran_id)
);

CREATE TABLE board_history (
    _fivetran_id text,
    board_pins_modified_at timestamp,
    collaborator_count integer,
    created_at timestamp,
    description text,
    follower_count integer,
    id text,
    media_image_cover_url text,
    "name" text,
    owner_username text,
    pin_count integer,
    privacy text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE mmm_campaign_targeting_daily_report (
    app_type text,
    "date" text,
    gender text,
    location_code text,
    advertiser_id text,
    campaign_id text,
    country text,
    cpc double precision,
    creative_type text,
    ctr double precision,
    earned_impressions integer,
    earned_pin_clicks integer,
    ecpm double precision,
    engagement_rate double precision,
    engagements integer,
    impressions integer,
    location text,
    paid_impressions integer,
    paid_pin_clicks integer,
    pin_clicks integer,
    spend double precision,
    spend_in_account_currency double precision,
    spend_order_line_id text,
    spend_order_line_paid_type text,
    PRIMARY KEY (app_type, "date", gender, location_code, advertiser_id, campaign_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE rejected_reason_history (
    "index" integer,
    pin_promotion_id text,
    updated_time timestamp,
    reason text,
    PRIMARY KEY ("index", pin_promotion_id, updated_time),
    FOREIGN KEY (pin_promotion_id) REFERENCES pin_promotion_history(id),
    FOREIGN KEY (updated_time) REFERENCES pin_promotion_history(id)
);

CREATE TABLE targeting_app_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE audience_history (
    audience_type text,
    id text,
    updated_time timestamp,
    advertiser_id text,
    created_time timestamp,
    description text,
    "name" text,
    rule jsonb,
    "size" integer,
    "status" text,
    PRIMARY KEY (audience_type, id, updated_time, advertiser_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE conversion_tag_config (
    conversion_tag_fivetran_id text,
    aem_db_enabled boolean,
    aem_enabled boolean,
    aem_fnln_enabled boolean,
    aem_ge_enabled boolean,
    aem_loc_enabled boolean,
    aem_ph_enabled boolean,
    md_frequency double precision,
    PRIMARY KEY (conversion_tag_fivetran_id),
    FOREIGN KEY (conversion_tag_fivetran_id) REFERENCES conversion_tag_history(_fivetran_id)
);

CREATE TABLE targeting_locale (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE targeting_geo_region (
    region_id text,
    country_id text,
    region_name text,
    PRIMARY KEY (region_id),
    FOREIGN KEY (country_id) REFERENCES targeting_geo(country_id)
);

CREATE TABLE catalog_feed_history (
    id text,
    updated_at timestamp,
    created_at timestamp,
    default_availability text,
    default_country text,
    default_currency text,
    default_locale text,
    format text,
    location text,
    "name" text,
    preferred_processing_schedule_time text,
    preferred_processing_schedule_timezone text,
    "status" text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE advertiser_report (
    "date" timestamp,
    advertiser_id text,
    PRIMARY KEY ("date", advertiser_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id)
);

CREATE TABLE product_group_report (
    "date" timestamp,
    ad_group_id text,
    advertiser_id text,
    campaign_id text,
    product_group_id text,
    PRIMARY KEY ("date", ad_group_id, advertiser_id, campaign_id, product_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (product_group_id) REFERENCES product_group_history(_fivetran_id)
);

CREATE TABLE targeting_interest (
    id text,
    "level" integer,
    "name" text,
    parent_id text,
    PRIMARY KEY (id)
);

CREATE TABLE pin_promotion_targeting_report (
    "date" timestamp,
    targeting_type text,
    targeting_value text,
    ad_group_id text,
    advertiser_id text,
    campaign_id text,
    pin_promotion_id text,
    PRIMARY KEY ("date", targeting_type, targeting_value, ad_group_id, advertiser_id, campaign_id, pin_promotion_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (pin_promotion_id) REFERENCES pin_promotion_history(id)
);

CREATE TABLE targeting_geo_metro (
    metro_id text,
    country_id text,
    metro_name text,
    PRIMARY KEY (metro_id),
    FOREIGN KEY (country_id) REFERENCES targeting_geo(country_id)
);

CREATE TABLE targeting_location (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE keyword_history (
    _fivetran_id text,
    ad_group_id text,
    advertiser_id text,
    campaign_id text,
    archived boolean,
    bid bigint,
    id text,
    match_type text,
    parent_type text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE ad_rejected_label_history (
    label text,
    pin_promotion_id text,
    updated_time timestamp,
    PRIMARY KEY (label, pin_promotion_id, updated_time),
    FOREIGN KEY (pin_promotion_id) REFERENCES pin_promotion_history(id),
    FOREIGN KEY (updated_time) REFERENCES pin_promotion_history(id)
);

CREATE TABLE targeting_geo (
    country_id text,
    country_name text,
    PRIMARY KEY (country_id)
);

CREATE TABLE keyword_report (
    "date" timestamp,
    keyword_id text,
    ad_group_id text,
    advertiser_id text,
    campaign_id text,
    pin_id text,
    pin_promotion_id text,
    PRIMARY KEY ("date", keyword_id, ad_group_id, advertiser_id, campaign_id, pin_id, pin_promotion_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (pin_id) REFERENCES pin_history(_fivetran_id),
    FOREIGN KEY (pin_promotion_id) REFERENCES pin_promotion_history(id)
);

CREATE TABLE product_group_history (
    _fivetran_id text,
    ad_group_id text,
    catalog_product_group_id text,
    parent_id text,
    bid_in_micro_currency bigint,
    collections_hero_destination_url text,
    collections_hero_pin_id text,
    creative_type text,
    definition text,
    id text,
    included boolean,
    is_mdl boolean,
    relative_definition text,
    slideshow_collections_description text,
    slideshow_collections_title text,
    "status" text,
    tracking_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (catalog_product_group_id) REFERENCES catalog_product_groups_history(id),
    FOREIGN KEY (parent_id) REFERENCES product_group_history(_fivetran_id)
);

CREATE TABLE product_item_report (
    "date" timestamp,
    product_item_id text,
    ad_group_id text,
    advertiser_id text,
    campaign_id text,
    pin_id text,
    PRIMARY KEY ("date", product_item_id, ad_group_id, advertiser_id, campaign_id, pin_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (pin_id) REFERENCES pin_history(_fivetran_id)
);
