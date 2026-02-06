-- Note
-- The documentation includes additional fields that we fetch from the source.

-- ADVERTISER_REPORTS 
-- Full documentation of reporting tables 
-- available in docs.
-- ------------
-- | Reports |
-- |--------|
-- | GMV_ADVERTISER_COUNTRY_REPORT_DAILY |

CREATE TABLE smart_plus_ad_creative_info (
    ad_material_id bigint,
    smart_plus_ad_id bigint,
    ad_format text,
    aigc_disclosure_type text,
    identity_authorized_bc_id text,
    identity_id text,
    identity_type text,
    image_info jsonb,
    material_name text,
    material_operation_status text,
    music_info_music_id text,
    tiktok_item_id text,
    video_info_file_name text,
    video_info_video_id text,
    PRIMARY KEY (ad_material_id),
    FOREIGN KEY (smart_plus_ad_id) REFERENCES smart_plus_ad_history(smart_plus_ad_id)
);

-- AD_Reports
-- Full documentation of reporting tables 
-- available in docs.
-- ----
-- | Reports |
-- |--------|
-- |AD_LANGUAGE REPORT |
-- |AD_PLATFORM_ REPORT|
-- |AD_REPORT_HOURLY|
-- |AD_REPORT_DAILY|
-- |AD_REPORT_LIFETIME|
-- |AD_AGE_GENDER_REPORT|
-- |AD_COUNTRY_ REPORT|
-- |RESERVATION_AD_REPORT_HOURLY|
-- |RESERVATION_AD_REPORT_DAILY|
CREATE TABLE ad_history (
    ad_id bigint,
    updated_at timestamp,
    adgroup_id bigint,
    advertiser_id bigint,
    campaign_id bigint,
    video_id text,
    ad_format text,
    ad_name text,
    ad_text text,
    aigc_disclosure_type text,
    app_name text,
    avatar_icon_web_uri text,
    brand_safety_postbid_partner text,
    brand_safety_vast_url text,
    branded_content_disabled boolean,
    buying_type text,
    call_to_action text,
    call_to_action_id text,
    card_id text,
    carousel_image_index integer,
    click_tracking_url text,
    cpp_url text,
    create_time timestamp,
    creative_authorized boolean,
    creative_type text,
    dark_post_status text,
    deeplink text,
    deeplink_type text,
    display_name text,
    dynamic_destination text,
    dynamic_format text,
    fallback_type text,
    identity_authorized_bc_id text,
    identity_id text,
    identity_type text,
    image_ids jsonb,
    impression_tracking_url text,
    is_aco boolean,
    is_new_structure boolean,
    item_duet_status text,
    item_stitch_status text,
    landing_page_url text,
    music_id text,
    operation_status text,
    optimization_event text,
    page_id text,
    phone_number text,
    phone_region_calling_code text,
    phone_region_code text,
    playable_url text,
    product_set_id text,
    product_specific_type text,
    profile_image_url text,
    promotional_music_disabled boolean,
    secondary_status text,
    shopping_ads_deeplink_type text,
    shopping_ads_fallback_type text,
    shopping_ads_video_package_id text,
    smart_plus_ad_id text,
    tiktok_item_id text,
    tiktok_page_category text,
    tracking_app_id text,
    tracking_pixel_id text,
    vast_moat_enabled boolean,
    vertical_video_strategy text,
    viewability_postbid_partner text,
    viewability_vast_url text,
    PRIMARY KEY (ad_id, updated_at),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup_history(adgroup_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(campaign_id),
    FOREIGN KEY (video_id) REFERENCES video_history(video_id)
);

CREATE TABLE image_history (
    image_id text,
    updated_at timestamp,
    advertiser_id text,
    created_at timestamp,
    displayable boolean,
    file_name text,
    format text,
    height integer,
    image_url text,
    is_carousel_usable boolean,
    material_id text,
    signature text,
    "size" integer,
    width integer,
    PRIMARY KEY (image_id, updated_at),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

-- CAMPAIGN_REPORTS 
-- Full documentation of reporting tables 
-- available in docs.
-- ------------
-- | Reports |
-- |--------|
-- | CAMPAIGN_LANGUAGE REPORT |
-- | CAMPAIGN_PLATFORM_ REPORT|
-- | CAMPAIGN_REPORT_HOURLY|
-- |CAMPAIGN_REPORT_DAILY|
-- |CAMPAIGN_REPORT_LIFETIME|
-- |CAMPAIGN_AGE_GENDER_REPORT|
-- |CAMPAIGN_COUNTRY_ REPORT|
-- |RESERVATION_CAMPAIGN_REPORT_HOURLY|
-- |RESERVATION_CAMPAIGN_REPORT_DAILY|
-- |GMV_CAMPAIGN_COUNTRY_REPORT_DAILY|
CREATE TABLE campaign_history (
    campaign_id bigint,
    updated_at timestamp,
    advertiser_id bigint,
    app_id text,
    app_promotion_type text,
    bid_type text,
    budget double precision,
    budget_mode text,
    budget_optimize_on boolean,
    buying_type text,
    campaign_app_profile_page_state text,
    campaign_name text,
    campaign_product_source text,
    campaign_type text,
    create_time timestamp,
    deep_bid_type text,
    is_advanced_dedicated_campaign boolean,
    is_new_structure text,
    is_search_campaign boolean,
    is_smart_performance_campaign boolean,
    objective text,
    objective_type text,
    operation_status text,
    optimization_goal text,
    postback_window_mode text,
    rf_campaign_type text,
    roas_bid double precision,
    rta_id text,
    rta_product_selection_enabled boolean,
    secondary_status text,
    split_test_variable text,
    PRIMARY KEY (campaign_id, updated_at),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE gmv_max_campaign_history (
    campaign_id bigint,
    updated_at timestamp,
    advertiser_id bigint,
    campaign_name text,
    create_time timestamp,
    gmx_max_promotion_type text,
    objective_type text,
    operation_status text,
    roi_protection_compensation_status text,
    secondary_status text,
    PRIMARY KEY (campaign_id, updated_at),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE pixel_statistic (
    _fivetran_id text,
    advertiser_id bigint,
    pixel_id bigint,
    attributed_count bigint,
    pixel_event_type text,
    preview_count bigint,
    total_count bigint,
    PRIMARY KEY (_fivetran_id, advertiser_id, pixel_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (pixel_id) REFERENCES pixel(advertiser_id)
);

CREATE TABLE smart_plus_ad_deeplink_utm_param (
    _fivetran_id text,
    smart_plus_ad_id bigint,
    custom_parameters jsonb,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (smart_plus_ad_id) REFERENCES smart_plus_ad_history(smart_plus_ad_id)
);

CREATE TABLE video_history (
    updated_at timestamp,
    video_id text,
    advertiser_id text,
    allow_download boolean,
    allowed_placements jsonb,
    bit_rate double precision,
    create_time text,
    displayable boolean,
    duration text,
    file_name text,
    format text,
    height integer,
    material_id text,
    preview_url text,
    preview_url_expire_time text,
    signature text,
    "size" integer,
    video_cover_url text,
    width integer,
    PRIMARY KEY (updated_at, video_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE smart_plus_ad_utm_param (
    _fivetran_id text,
    smart_plus_ad_id bigint,
    custom_parameters jsonb,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (smart_plus_ad_id) REFERENCES smart_plus_ad_history(smart_plus_ad_id)
);

CREATE TABLE pixel (
    id bigint,
    advertiser_id bigint,
    advanced_matching_field_email boolean,
    advanced_matching_field_phone_number boolean,
    code text,
    create_time timestamp,
    "name" text,
    partner_name text,
    script text,
    setup_mode text,
    -- asset_ownership_* (dynamic column),
    PRIMARY KEY (id, advertiser_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE pixel_event (
    id bigint,
    pixel_id bigint,
    code text,
    currency text,
    currency_value text,
    custom_event_type text,
    deprecated boolean,
    "name" text,
    optimization_event text,
    statistic_type text,
    "type" text,
    PRIMARY KEY (id, pixel_id),
    FOREIGN KEY (pixel_id) REFERENCES pixel(advertiser_id)
);

CREATE TABLE pixel_event_rule (
    _fivetran_id text,
    event_id bigint,
    operator text,
    "trigger" text,
    "value" text,
    variable text,
    PRIMARY KEY (_fivetran_id, event_id),
    FOREIGN KEY (event_id) REFERENCES pixel_event(pixel_id)
);

CREATE TABLE smart_plus_ad_history (
    smart_plus_ad_id bigint,
    updated_at timestamp,
    adgroup_id bigint,
    advertiser_id bigint,
    campaign_id bigint,
    ad_name text,
    ad_text_list jsonb,
    adgroup_name text,
    auto_disclaimer_types jsonb,
    auto_message_list jsonb,
    call_to_action_id text,
    call_to_action_list jsonb,
    campaign_name text,
    catalog_creative_toggle boolean,
    create_time timestamp,
    creative_auto_add_toggle boolean,
    custom_product_page_list jsonb,
    dark_post_status text,
    deeplink_list jsonb,
    end_card_cta text,
    fallback_type text,
    identity_id text,
    identity_type text,
    interactive_add_on_list jsonb,
    landing_page_url_list jsonb,
    operation_status text,
    page_list jsonb,
    phone_info_phone_number text,
    phone_info_phone_region_calling_code text,
    phone_info_phone_region_code text,
    product_display_field_list jsonb,
    product_ids jsonb,
    product_info_selling_points jsonb,
    product_set_id text,
    product_specific_type text,
    secondary_status text,
    tracking_info_click_tracking_url text,
    tracking_info_impression_tracking_url text,
    tracking_info_tracking_app_id text,
    tracking_info_tracking_message_event_set_id text,
    PRIMARY KEY (smart_plus_ad_id, updated_at),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup_history(adgroup_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(campaign_id)
);

-- ADGROUP_Reports
-- Full documentation of reporting tables 
-- available in docs.
-- ----
-- | Reports |
-- |--------|
-- |ADGROUP_REPORT_DAILY|
-- |ADGROUP_REPORT_HOURLY|
-- |ADGROUP_REPORT_LIFETIME|
-- |RESERVATION_ADGROUP_REPORT_DAILY|
-- |RESERVATION_ADGROUP_REPORT_HOURLY|
-- ----
-- NOTE:
-- We specify a filter buying_types in our calls and assign the filter value to the synthetic field buying_type
CREATE TABLE adgroup_history (
    adgroup_id bigint,
    updated_at timestamp,
    advertiser_id bigint,
    campaign_id bigint,
    action_categories jsonb,
    action_days integer,
    adgroup_app_profile_page_state text,
    adgroup_name text,
    age_groups jsonb,
    app_download_url text,
    app_id bigint,
    app_name text,
    app_type text,
    attribution_event_count text,
    audience jsonb,
    audience_type text,
    bid_display_mode text,
    bid_price double precision,
    bid_type text,
    billing_event text,
    brand_safety_partner text,
    brand_safety_type text,
    budget double precision,
    budget_mode text,
    buying_type text,
    category integer,
    click_attribution_window text,
    comment_disabled boolean,
    conversion_bid_price double precision,
    cpm double precision,
    cpv_video_duration text,
    create_time timestamp,
    creative_material_mode text,
    dayparting text,
    deep_bid_type text,
    deep_cpa_bid double precision,
    delivery_mode text,
    discount_amount double precision,
    discount_percentage double precision,
    discount_type text,
    display_name text,
    engaged_view_attribution_window text,
    excluded_audience jsonb,
    fallback_type text,
    feed_type text,
    frequency integer,
    frequency_schedule integer,
    gender text,
    identity_authorized_bc_id text,
    identity_id text,
    identity_type text,
    interest_category_v_2 jsonb,
    inventory_filter_enabled boolean,
    ios_14_quota_type text,
    ios_14_targeting text,
    is_comment_disable integer,
    is_hfss boolean,
    is_new_structure boolean,
    is_smart_performance_campaign boolean,
    keywords jsonb,
    landing_page_url text,
    languages jsonb,
    location jsonb,
    min_android_version text,
    min_ios_version text,
    network_types jsonb,
    next_day_retention double precision,
    open_url text,
    open_url_type text,
    operating_systems jsonb,
    operation_status text,
    optimization_event text,
    optimization_goal text,
    pacing text,
    package text,
    pangle_block_app_list_id jsonb,
    pixel_id bigint,
    placement_type text,
    placements jsonb,
    pre_discount_budget double precision,
    pre_discount_cpm double precision,
    predict_impression integer,
    product_source text,
    profile_image text,
    promotion_target_type text,
    promotion_type text,
    promotion_website_type text,
    purchased_impression integer,
    purchased_reach integer,
    rf_estimated_cpr double precision,
    rf_estimated_frequency double precision,
    rf_purchased_type text,
    roas_bid double precision,
    saved_audience_id text,
    schedule_end_time timestamp,
    schedule_start_time timestamp,
    schedule_type text,
    scheduled_budget double precision,
    search_result_enabled boolean,
    secondary_optimization_event text,
    secondary_status text,
    share_disabled boolean,
    shopping_ads_retargeting_actions_days integer,
    shopping_ads_retargeting_custom_audience_relation text,
    shopping_ads_retargeting_type text,
    shopping_ads_type text,
    skip_learning_phase integer,
    smart_audience_enabled boolean,
    smart_interest_behavior_enabled boolean,
    spending_power text,
    split_test_group_id text,
    split_test_status text,
    statistic_type text,
    store_authorized_bc_id text,
    store_id text,
    tiktok_subplacements jsonb,
    vbo_window text,
    vertical_sensitivity_id text,
    video_actions jsonb,
    video_download text,
    video_download_disabled boolean,
    view_attribution_window text,
    PRIMARY KEY (adgroup_id, updated_at),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(campaign_id)
);

CREATE TABLE advertiser (
    id bigint,
    address text,
    balance double precision,
    cellphone_number text,
    company text,
    contacter text,
    country text,
    create_time timestamp,
    currency text,
    description text,
    email text,
    industry text,
    language text,
    license_no text,
    license_url text,
    "name" text,
    promotion_area text,
    rejection_reason text,
    "role" text,
    "status" text,
    telephone_number text,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE utm_param (
    _fivetran_id text,
    ad_id bigint,
    custom_parameters jsonb,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    PRIMARY KEY (_fivetran_id, ad_id),
    FOREIGN KEY (ad_id) REFERENCES ad_history(ad_id)
);
