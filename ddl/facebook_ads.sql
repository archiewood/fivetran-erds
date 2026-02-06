-- Prebuilt Reports
-- Full documenation of available tables located in docs

-- |ACTION_CANVAS_COMPONENT|
-- |----|
-- _fivetran_id 🔑
-- date 🔑 
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- inline_link_clicks
-- mobile_app_purchase_roas
-- outbound_clicks
-- website_purchase_roas

-- |ACTION_REACTIONS|
-- |---|
-- _fivetran_id 🔑
-- date 🔑 
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- action_reaction
-- actions
-- action_values

-- |ACTION_CONVERSION_DEVICE|
-- |---|
-- _fivetran_id 🔑
-- date 🔑
-- device_platform 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- inline_link_clicks
-- mobile_app_purchase_roas
-- outbound_clicks
-- website_purchase_roas

-- |ACTION_PRODUCT_ID|
-- |---|
-- _fivetran_id 🔑
-- date 🔑
-- product_id 🔑
-- ad_id 🔑  ➤ AD_HISTORY.id
-- inline_link_clicks
-- mobile_app_purchase_roas
-- outbound_clicks
-- website_purchase_roas

-- |DELIVERY_PURCHASE_ROAS|
-- |---|
-- _fivetran_id 🔑
-- date 🔑
-- ad_id 🔑  ➤ AD_HISTORY.id
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- inline_link_clicks
-- mobile_app_purchase_roas
-- outbound_clicks
-- website_purchase_roas

-- |ACTION_CAROUSEL_CARD|
-- |---|
-- _fivetran_id 🔑
-- date 🔑 
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- action_carousel_card_id 🔑  
-- action_carousel_card_name
-- Inline_link_clicks
-- mobile_app_purchase_roas
-- outbound_clicks
-- website_purchase_roas

-- |ACTION_VIDEO_VIEW_TYPE|
-- |--|
-- _fivetran_id 🔑
-- date 🔑 
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- video_30_sec_watched_actions
-- video_p25_watched_actions
-- video_p50_watched_actions
-- video_p75_watched_actions
-- video_p100_watched_actions
-- video_thruplay_watched_actions
-- video_avg_time_watched_actions

-- |ACTION_VIDEO_SOUND|
-- |-|
-- _fivetran_id 🔑
-- date 🔑 
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- video_30_sec_watched_actions
-- video_p25_watched_actions
-- video_p50_watched_actions
-- video_p75_watched_actions
-- video_p100_watched_actions
-- video_thruplay_watched_actions
-- video_avg_time_watched_actions

-- |BASIC_CAMPAIGNS|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- campaign_id 🔑  ➤ CAMPAIGN_HISTORY.id
-- actions
-- campaign_name
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |BASIC_AD_SET|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- adset_id 🔑  ➤ ADSET_HISTORY.id
-- actions
-- adset_name
-- campaign_name
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |BASIC_AD|
-- |-|
-- _fivetran_id 🔑
-- date 🔑 
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- ad_id 🔑  ➤ AD_HISTORY.id
-- actions
-- ad_name
-- adset_name
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |BASIC_ALL_LEVELS|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- ad_id 🔑  ➤ AD_HISTORY.id
-- actions
-- ad_name
-- adset_name
-- campaign_name
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DELIVERY_PLATFORM|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- publisher_platform🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DELIVERY_DEVICE|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- device_platform🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DELIVERY_PLATFORM_AND_DEVICE|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- device_platform🔑
-- publisher_platform🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |MARKETING_MIX_MODELING|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- adset_id 🔑  ➤ ADSET_HISTORY.id
-- country
-- creative_media_type
-- device_platform
-- dma
-- impressions
-- platform_position
-- publisher_platform
-- region
-- spend

-- |DEMOGRAPHICS_AGE_AND_GENDER|
-- |-|
-- _fivetran_id 🔑
-- age 🔑
-- date 🔑
-- gender🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DEMOGRAPHICS_GENDER|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- gender🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DEMOGRAPHICS_REGION|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- region 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DEMOGRAPHICS_DMA_REGION|
-- |-|
-- _fivetran_id 🔑
-- date 🔑
-- dma🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DEMOGRAPHICS_COUNTRY|
-- |-|
-- _fivetran_id 🔑
-- country🔑
-- date 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

-- |DEMOGRAPHICS_AGE|
-- |-|
-- _fivetran_id 🔑
-- age 🔑
-- date 🔑
-- account_id 🔑  ➤ ACCOUNT_HISTORY.id
-- actions
-- cost_per_action_type
-- cost_per_inline_link_click
-- cpc
-- cpm
-- ctr
-- frequency
-- impressions
-- inline_link_click_ctr
-- inline_link_clicks
-- reach
-- spend

CREATE TABLE ad_video_history (
    id text,
    updated_time timestamp,
    account_id bigint,
    ad_breaks jsonb,
    backdated_time timestamp,
    backdated_time_granularity text,
    content_category text,
    content_tags jsonb,
    created_time timestamp,
    custom_labels jsonb,
    description text,
    embed_html text,
    embeddable boolean,
    event jsonb,
    format jsonb,
    from_object jsonb,
    icon text,
    is_crosspost_video boolean,
    is_crossposting_eligible boolean,
    is_episode boolean,
    is_instagram_eligible boolean,
    is_reference_only boolean,
    length text,
    live_status text,
    music_video_copyright jsonb,
    permalink_url text,
    picture jsonb,
    place jsonb,
    post_views bigint,
    premiere_living_room_status text,
    privacy jsonb,
    published boolean,
    scheduled_publish_time timestamp,
    "source" text,
    status_processing_progress integer,
    status_value text,
    title text,
    universal_video_id text,
    views bigint,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE ad_recommendation (
    "index" integer,
    ad_id bigint,
    ad_updated_time timestamp,
    blame_field text,
    code integer,
    confidence text,
    importance text,
    message text,
    recommendation_data jsonb,
    title text,
    PRIMARY KEY ("index", ad_id, ad_updated_time),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_time) REFERENCES ad_history(id)
);

CREATE TABLE ad_tracking (
    "index" integer,
    ad_id bigint,
    ad_updated_time timestamp,
    action_type jsonb,
    application jsonb,
    conversion_id jsonb,
    creative jsonb,
    dataset jsonb,
    event jsonb,
    event_creator jsonb,
    event_type jsonb,
    fb_pixel jsonb,
    fb_pixel_event jsonb,
    leadgen jsonb,
    object jsonb,
    object_domain jsonb,
    offer jsonb,
    offer_creator jsonb,
    offsite_pixel jsonb,
    page jsonb,
    page_parent jsonb,
    post jsonb,
    post_object jsonb,
    post_object_wall jsonb,
    post_wall jsonb,
    question jsonb,
    question_creator jsonb,
    response jsonb,
    subtype jsonb,
    PRIMARY KEY ("index", ad_id, ad_updated_time),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_time) REFERENCES ad_history(id)
);

CREATE TABLE pacing_type (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    "name" text,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE ad_conversion (
    "index" integer,
    ad_id bigint,
    ad_updated_time timestamp,
    action_type jsonb,
    application jsonb,
    conversion_id jsonb,
    creative jsonb,
    dataset jsonb,
    event jsonb,
    event_creator jsonb,
    event_type jsonb,
    fb_pixel jsonb,
    fb_pixel_event jsonb,
    leadgen jsonb,
    object jsonb,
    object_domain jsonb,
    offer jsonb,
    offer_creator jsonb,
    offsite_pixel jsonb,
    page jsonb,
    page_parent jsonb,
    post jsonb,
    post_object jsonb,
    post_object_wall jsonb,
    post_wall jsonb,
    question jsonb,
    question_creator jsonb,
    response jsonb,
    subtype jsonb,
    PRIMARY KEY ("index", ad_id, ad_updated_time),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_time) REFERENCES ad_history(id)
);

CREATE TABLE failed_delivery_checks (
    "index" integer,
    _fivetran_id text,
    account_id bigint,
    check_name text,
    description text,
    summary text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE performance_recommendation (
    _fivetran_id text,
    account_id bigint,
    object_id text,
    recommendation_signature text,
    "type" text,
    PRIMARY KEY (_fivetran_id, account_id),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE ad_set_custom_audience (
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    custom_audience_id bigint,
    is_excluded boolean,
    PRIMARY KEY (ad_set_id, ad_set_updated_time, custom_audience_id),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE creative_label (
    creative_id bigint,
    label_id bigint,
    PRIMARY KEY (creative_id, label_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id),
    FOREIGN KEY (label_id) REFERENCES label_history(id)
);

CREATE TABLE creative_history (
    _fivetran_id text,
    account_id bigint,
    actor_id bigint,
    applink_treatment text,
    authorization_category text,
    body text,
    branded_content_sponsor_page_id bigint,
    bundle_folder_id bigint,
    call_to_action_type text,
    carousel_ad_link text,
    categorization_criteria text,
    category_media_source text,
    destination_set_id bigint,
    dynamic_ad_voice text,
    effective_authorization_category text,
    effective_instagram_media_id bigint,
    effective_object_story_id text,
    enable_direct_install boolean,
    id bigint,
    image_hash text,
    image_url text,
    instagram_permalink_url text,
    instagram_user_id text,
    link_destination_display_url text,
    link_og_id bigint,
    link_url text,
    "name" text,
    object_id bigint,
    object_store_url text,
    object_story_id text,
    object_story_link_data_app_link_spec_android jsonb,
    object_story_link_data_app_link_spec_ios jsonb,
    object_story_link_data_app_link_spec_ipad jsonb,
    object_story_link_data_app_link_spec_iphone jsonb,
    object_story_link_data_caption text,
    object_story_link_data_child_attachments jsonb,
    object_story_link_data_description text,
    object_story_link_data_link text,
    object_story_link_data_message text,
    object_type text,
    object_url text,
    page_link text,
    page_message text,
    place_page_set_id bigint,
    platform_customizations_instagram_caption_ids jsonb,
    platform_customizations_instagram_image_hash text,
    platform_customizations_instagram_image_url text,
    platform_customizations_instagram_video_id bigint,
    playable_asset_id bigint,
    product_set_id bigint,
    source_instagram_media_id bigint,
    "status" text,
    template_app_link_spec_android jsonb,
    template_app_link_spec_ios jsonb,
    template_app_link_spec_ipad jsonb,
    template_app_link_spec_iphone jsonb,
    template_caption text,
    template_child_attachments jsonb,
    template_description text,
    template_link text,
    template_message text,
    template_page_link text,
    template_url text,
    thumbnail_id bigint,
    thumbnail_url text,
    title text,
    url_tags jsonb,
    use_page_actor_override boolean,
    video_call_to_action_value_link text,
    video_id bigint,
    video_video_id bigint,
    -- asset_feed_spec_* (dynamic column),
    -- template_url_spec_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_asset_customization_rule (
    "index" integer,
    creative_id bigint,
    body_label jsonb,
    call_to_action_label jsonb,
    call_to_action_type_label jsonb,
    caption_label jsonb,
    carousel_label jsonb,
    customization_spec jsonb,
    description_label jsonb,
    image_label jsonb,
    is_default boolean,
    link_url_label jsonb,
    priority integer,
    title_label jsonb,
    video_label jsonb,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE creative_sequence (
    ad_id text,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    PRIMARY KEY (ad_id, ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE reach_frequency (
    country_code text,
    _fivetran_id text,
    account_id bigint,
    max_campaign_duration bigint,
    max_days_to_finish bigint,
    min_campaign_duration bigint,
    min_reach_limits bigint,
    PRIMARY KEY (country_code, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE ad_set_attribution (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE frequency_control (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    event text,
    interval_days integer,
    max_frequency integer,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE ad_history (
    id bigint,
    updated_time timestamp,
    account_id bigint,
    ad_set_id bigint,
    ad_source_id bigint,
    campaign_id bigint,
    creative_id bigint,
    bid_amount integer,
    bid_type text,
    configured_status text,
    conversion_domain text,
    created_time timestamp,
    effective_status text,
    last_updated_by_app_id text,
    "name" text,
    preview_shareable_link text,
    "status" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_source_id) REFERENCES ad_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_link_url (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    carousel_link_url text,
    deeplink_url text,
    display_url text,
    object_store_urls jsonb,
    url_tags text,
    website_url text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_upcoming_event (
    "index" integer,
    creative_id bigint,
    end_time timestamp,
    event_id text,
    event_title text,
    start_time timestamp,
    updated_time timestamp,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE label_history (
    id bigint,
    updated_time timestamp,
    account_id bigint,
    created_time timestamp,
    "name" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_onsite_destination (
    "index" integer,
    creative_id bigint,
    details_page_product_id bigint,
    shop_collection_product_set_id bigint,
    storefront_shop_id bigint,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE campaign_label (
    ad_label_id bigint,
    campaign_id bigint,
    campaign_updated_time timestamp,
    PRIMARY KEY (ad_label_id, campaign_id, campaign_updated_time),
    FOREIGN KEY (ad_label_id) REFERENCES label_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_updated_time) REFERENCES campaign_history(id)
);

CREATE TABLE lookalike_origin (
    "index" integer,
    custom_audience_id bigint,
    custom_audience_updated_time timestamp,
    origin_custom_audience_id bigint,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", custom_audience_id, custom_audience_updated_time),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id),
    FOREIGN KEY (custom_audience_updated_time) REFERENCES custom_audience_history(id),
    FOREIGN KEY (origin_custom_audience_id) REFERENCES custom_audience_history(id)
);

CREATE TABLE ad_label (
    ad_id bigint,
    ad_updated_time timestamp,
    label_id bigint,
    PRIMARY KEY (ad_id, ad_updated_time, label_id),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_time) REFERENCES ad_history(id),
    FOREIGN KEY (label_id) REFERENCES label_history(id)
);

CREATE TABLE lookalike_target_country_name (
    country_name text,
    custom_audience_id bigint,
    custom_audience_updated_time timestamp,
    PRIMARY KEY (country_name, custom_audience_id, custom_audience_updated_time),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id),
    FOREIGN KEY (custom_audience_updated_time) REFERENCES custom_audience_history(id)
);

CREATE TABLE ad_asset_feed_spec_group_rule (
    "index" integer,
    creative_id bigint,
    body_label jsonb,
    caption_label jsonb,
    description_label jsonb,
    image_label jsonb,
    link_url_label jsonb,
    title_label jsonb,
    video_label jsonb,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_autotranslate (
    "index" integer,
    creative_id bigint,
    "name" text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_video (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    caption_ids jsonb,
    thumbnail_hash text,
    thumbnail_url text,
    url_tags text,
    video_id text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_title (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    text text,
    url_tags text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_rotation_interval (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    date_range_start_time bigint,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE ad_group_issues_info (
    "index" integer,
    ad_id bigint,
    ad_updated_time timestamp,
    error_code integer,
    error_message text,
    error_summary text,
    error_type text,
    "level" text,
    PRIMARY KEY ("index", ad_id, ad_updated_time),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_time) REFERENCES ad_history(id)
);

CREATE TABLE ad_asset_feed_spec_event (
    "index" integer,
    creative_id bigint,
    id text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_body (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    text text,
    url_tags text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE campaign_history (
    id bigint,
    updated_time timestamp,
    account_id bigint,
    source_campaign_id bigint,
    bid_strategy text,
    boosted_object_id bigint,
    budget_rebalance_flag boolean,
    budget_remaining double precision,
    buying_type text,
    can_create_brand_lift_study boolean,
    can_use_spend_cap boolean,
    configured_status text,
    created_time timestamp,
    daily_budget bigint,
    effective_status text,
    is_skadnetwork_attribution boolean,
    last_budget_toggling_time timestamp,
    lifetime_budget bigint,
    "name" text,
    objective text,
    pacing_type jsonb,
    smart_promotion_type text,
    special_ad_categories jsonb,
    special_ad_category text,
    special_ad_category_country jsonb,
    spend_cap bigint,
    start_time timestamp,
    "status" text,
    stop_time timestamp,
    topline_id bigint,
    -- promoted_object_* (dynamic column),
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id),
    FOREIGN KEY (source_campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE ad_asset_feed_spec_message_extension (
    "index" integer,
    creative_id bigint,
    "type" text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_image (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    hash text,
    image_crops jsonb,
    url text,
    url_tags text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_description (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    text text,
    url_tags text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_campaign_issues_info (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    error_code integer,
    error_message text,
    error_summary text,
    error_type text,
    "level" text,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE ad_set_history (
    id bigint,
    updated_time timestamp,
    account_id bigint,
    adset_source_id bigint,
    campaign_id bigint,
    asset_feed_id bigint,
    bid_amount bigint,
    bid_strategy text,
    billing_event text,
    budget_remaining bigint,
    configured_status text,
    created_time timestamp,
    daily_budget bigint,
    daily_min_spend_target bigint,
    daily_spend_cap bigint,
    destination_type text,
    effective_status text,
    end_time timestamp,
    instagram_user_id bigint,
    is_dynamic_creative boolean,
    lifetime_budget bigint,
    lifetime_imps integer,
    lifetime_min_spend_target bigint,
    lifetime_spend_cap bigint,
    multi_optimization_goal_weight text,
    "name" text,
    optimization_goal text,
    optimization_sub_event text,
    recurring_budget_semantics boolean,
    review_feedback text,
    rf_prediction_id text,
    start_time timestamp,
    "status" text,
    use_new_app_click boolean,
    -- learning_stage_info_* (dynamic column),
    -- promoted_object_* (dynamic column),
    -- targeting_* (dynamic column),
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id),
    FOREIGN KEY (adset_source_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE lookalike_target_country (
    country text,
    custom_audience_id bigint,
    custom_audience_updated_time timestamp,
    PRIMARY KEY (country, custom_audience_id, custom_audience_updated_time),
    FOREIGN KEY (custom_audience_id) REFERENCES custom_audience_history(id),
    FOREIGN KEY (custom_audience_updated_time) REFERENCES custom_audience_history(id)
);

CREATE TABLE adset_schedule (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    days jsonb,
    end_minute integer,
    start_minute integer,
    timezone_type text,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE ad_asset_feed_spec_ad_format (
    "index" integer,
    creative_id bigint,
    "name" text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE targeting_optimization_types (
    "index" integer,
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    "key" text,
    "value" integer,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_time),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id)
);

CREATE TABLE ad_set_label (
    ad_set_id bigint,
    ad_set_updated_time timestamp,
    label_id bigint,
    PRIMARY KEY (ad_set_id, ad_set_updated_time, label_id),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set_history(id),
    FOREIGN KEY (ad_set_updated_time) REFERENCES ad_set_history(id),
    FOREIGN KEY (label_id) REFERENCES label_history(id)
);

CREATE TABLE custom_audience_history (
    id bigint,
    updated_time timestamp,
    account_id bigint,
    approximate_count_lower_bound bigint,
    approximate_count_upper_bound bigint,
    content_updated_time timestamp,
    created_time timestamp,
    customer_file_source text,
    data_source_creation_params text,
    data_source_sub_type text,
    data_source_type text,
    delivery_status_code integer,
    delivery_status_description text,
    description text,
    is_value_based boolean,
    "name" text,
    operation_status_code integer,
    operation_status_description text,
    opt_out_link text,
    pixel_id bigint,
    retention_days integer,
    rule text,
    rule_aggregation text,
    subtype text,
    -- external_event_source_* (dynamic column),
    -- lookalike_* (dynamic column),
    -- permission_for_actions_* (dynamic column),
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE custom_conversion_history (
    id bigint,
    account_id bigint,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE account_history (
    _fivetran_id text,
    account_status text,
    age text,
    amount_spent bigint,
    balance bigint,
    business_city text,
    business_country_code text,
    business_name text,
    business_state text,
    business_street text,
    business_street_2 text,
    business_zip text,
    can_create_brand_lift_study boolean,
    capabilities jsonb,
    created_time timestamp,
    currency text,
    disable_reason text,
    end_advertiser bigint,
    end_advertiser_name text,
    funding_source bigint,
    has_migrated_permissions boolean,
    id bigint,
    io_number bigint,
    is_attribution_spec_system_default boolean,
    is_direct_deals_enabled boolean,
    is_in_3_ds_authorization_enabled_market boolean,
    is_notifications_enabled boolean,
    is_personal integer,
    is_prepay_account boolean,
    is_tax_id_required boolean,
    media_agency bigint,
    min_campaign_group_spend_cap bigint,
    min_daily_budget integer,
    "name" text,
    next_bill_date timestamp,
    offsite_pixels_tos_accepted boolean,
    owner bigint,
    partner bigint,
    salesforce_invoice_group_id text,
    spend_cap bigint,
    tax_id text,
    tax_id_status text,
    tax_id_type text,
    timezone_id integer,
    timezone_name text,
    timezone_offset_hours_utc text,
    -- agency_client_declaration_* (dynamic column),
    -- business_manager_* (dynamic column),
    -- extended_credit_invoice_group_* (dynamic column),
    -- funding_source_details_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_caption (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    text text,
    url_tags text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_asset_feed_spec_call_to_action (
    "index" integer,
    creative_id bigint,
    adlabels jsonb,
    "type" text,
    -- value_* (dynamic column),
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(_fivetran_id)
);

CREATE TABLE ad_image_history (
    hash text,
    id text,
    updated_time timestamp,
    account_id bigint,
    created_time timestamp,
    creatives jsonb,
    height bigint,
    is_associated_creatives_in_adgroups boolean,
    "name" text,
    original_height bigint,
    original_width bigint,
    permalink_url text,
    "status" text,
    url text,
    url_128 text,
    width bigint,
    PRIMARY KEY (hash, id, updated_time),
    FOREIGN KEY (account_id) REFERENCES account_history(_fivetran_id)
);

CREATE TABLE ad_study (
    "index" integer,
    campaign_id bigint,
    campaign_updated_time timestamp,
    canceled_time timestamp,
    cooldown_start_time timestamp,
    created_time timestamp,
    description text,
    end_time timestamp,
    id bigint,
    "name" text,
    observation_end_time timestamp,
    results_first_available_date text,
    start_time timestamp,
    "type" text,
    updated_time timestamp,
    PRIMARY KEY ("index", campaign_id, campaign_updated_time),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_updated_time) REFERENCES campaign_history(id)
);

CREATE TABLE ad_video_thumbnail (
    id text,
    video_id text,
    height bigint,
    is_preferred boolean,
    "name" text,
    scale text,
    uri text,
    width bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (video_id) REFERENCES ad_video_history(id)
);
