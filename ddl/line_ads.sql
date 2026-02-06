CREATE TABLE adaccount_available_campaign_objective (
    "index" text,
    adaccount_id text,
    group_id text,
    available_campaign_objective text,
    PRIMARY KEY ("index", adaccount_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id)
);

CREATE TABLE adaccount_delivery_status_reason (
    "index" text,
    adaccount_id text,
    group_id text,
    code text,
    PRIMARY KEY ("index", adaccount_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id)
);

CREATE TABLE adaccount (
    group_id text,
    id text,
    modified_date timestamp,
    configured_status text,
    country text,
    created_date text,
    currency text,
    delivery_status text,
    line_account_line_id text,
    line_account_name text,
    "name" text,
    product_type text,
    removed_date text,
    timezone text,
    PRIMARY KEY (group_id, id, modified_date)
);

CREATE TABLE adgroup_delivery_status_reason (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    code text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_custom_audience (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    custom_audience_id text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_excluded_custom_audience (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    excluded_custom_audience_id text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_geo_area_include (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    area_type text,
    label text,
    radius text,
    "value" text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_geo_area_exclude (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    area_type text,
    label text,
    radius text,
    "value" text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_interest (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    interest text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_behavior (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    behavior text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_status (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    "status" text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_purchase_intent (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    purchase_intent text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_yj_interest (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    yj_interest text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_yj_purchase_intent (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    yj_purchase_intent text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_include_advanced_yj_lifestyle (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    yj_lifestyle text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_interest (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    interest text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_behavior (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    behavior text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_status (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    "status" text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_purchase_intent (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    purchase_intent text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_yj_interest (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    yj_interest text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_yj_purchase_intent (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    yj_purchase_intent text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_exclude_advanced_yj_lifestyle (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    yj_lifestyle text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_placement (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    placement text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_gender (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    gender_code text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_ssps (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    ssps text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup_targeting_user_os (
    "index" text,
    adaccount_id text,
    adgroup_id text,
    group_id text,
    os text,
    ver_max text,
    ver_min text,
    PRIMARY KEY ("index", adaccount_id, adgroup_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adgroup(adaccount_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (group_id) REFERENCES adgroup(group_id)
);

CREATE TABLE adgroup (
    id text,
    modified_date timestamp,
    adaccount_id text,
    group_id text,
    campaign_id text,
    media_app_id text,
    adgroup_learning_has_completion_history text,
    adgroup_learning_last_end_ts text,
    adgroup_learning_last_start_ts text,
    adgroup_learning_status text,
    adgroup_learning_status_code text,
    adgroup_learning_target_reach_ratio text,
    auto_bid_conversion_id text,
    auto_bid_type text,
    bid_amount_micro text,
    bid_strategy text,
    bid_type text,
    configured_status text,
    created_date text,
    daily_budget_micro text,
    delivery_status text,
    dpa_destination_type text,
    dpa_destination_url text,
    dpa_feed_type text,
    first_auto_bid_conversion_id text,
    in_stream_video_included text,
    "name" text,
    product_set_id text,
    removed_date text,
    rnf_end_date text,
    rnf_frequency text,
    rnf_frequency_interval text,
    rnf_start_date text,
    targeting_age_max text,
    targeting_age_min text,
    targeting_country text,
    targeting_geo_area_delivery_targeting_set_type text,
    targeting_mode text,
    PRIMARY KEY (id, modified_date, adaccount_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (media_app_id) REFERENCES media(id)
);

CREATE TABLE media (
    id text,
    adaccount_id text,
    group_id text,
    affected_ad_count text,
    app_bundle text,
    appstore_url text,
    "comment" text,
    created_date text,
    duration text,
    file_size text,
    frames text,
    height text,
    last_lp_rejected_date text,
    loops text,
    media_type text,
    mime_type text,
    modified_date timestamp,
    "name" text,
    object_file_name text,
    object_obs_hash text,
    object_obs_o_id text,
    object_source_url text,
    os_code text,
    related_ads_count text,
    removed_date text,
    review_comment text,
    review_re_reviewable text,
    review_reason_code text,
    review_reject_reason text,
    review_status text,
    url text,
    width text,
    PRIMARY KEY (id, adaccount_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id)
);

CREATE TABLE campaign_delivery_status_reason (
    "index" text,
    adaccount_id text,
    campaign_id text,
    group_id text,
    code text,
    PRIMARY KEY ("index", adaccount_id, campaign_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES campaign(adaccount_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (group_id) REFERENCES campaign(group_id)
);

CREATE TABLE campaign (
    id text,
    modified_date timestamp,
    adaccount_id text,
    group_id text,
    active_cbo text,
    bid_strategy text,
    campaign_objective text,
    configured_status text,
    created_date text,
    daily_budget_micro text,
    delivery_status text,
    end_date text,
    "name" text,
    removed_date text,
    spending_limit_micro text,
    spending_limit_type text,
    start_date text,
    PRIMARY KEY (id, modified_date, adaccount_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id)
);

CREATE TABLE ad_delivery_status_reason (
    "index" text,
    ad_id text,
    adaccount_id text,
    group_id text,
    code text,
    PRIMARY KEY ("index", ad_id, adaccount_id, group_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (adaccount_id) REFERENCES ad(adaccount_id),
    FOREIGN KEY (group_id) REFERENCES ad(group_id)
);

CREATE TABLE ad (
    id text,
    modified_date timestamp,
    adaccount_id text,
    group_id text,
    adgroup_id text,
    creative_animation_id text,
    creative_image_id text,
    creative_small_image_id text,
    creative_video_id text,
    configured_status text,
    created_date text,
    creative_animation_hash text,
    creative_call_to_action_app_store_url text,
    creative_call_to_action_click_url text,
    creative_call_to_action_deep_link_url text,
    creative_call_to_action_landing_page_url text,
    creative_call_to_action_type text,
    creative_description text,
    creative_format text,
    creative_id text,
    creative_image_hash text,
    creative_labels jsonb,
    creative_long_title text,
    creative_review_comment text,
    creative_review_re_reviewable text,
    creative_review_reason_code text,
    creative_review_reject_reason text,
    creative_review_status text,
    creative_slots jsonb,
    creative_small_image_hash text,
    creative_title text,
    creative_video_hash text,
    delivery_status text,
    imp_track_url text,
    "name" text,
    removed_date text,
    small_delivery text,
    view_track_url text,
    PRIMARY KEY (id, modified_date, adaccount_id, group_id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (creative_animation_id) REFERENCES media(id),
    FOREIGN KEY (creative_image_id) REFERENCES media(id),
    FOREIGN KEY (creative_small_image_id) REFERENCES media(id),
    FOREIGN KEY (creative_video_id) REFERENCES media(id)
);

CREATE TABLE ad_report (
    "day" text,
    adaccount_id text,
    group_id text,
    id text,
    adgroup_id text,
    campaign_id text,
    add_to_cart text,
    add_to_cart_rate text,
    campaign_objective text,
    category_view text,
    category_view_rate text,
    clicks text,
    cpa_checkout_started text,
    cpa_item_added_to_cart text,
    cpa_lead_generated text,
    cpa_line_tag_and_cv_api text,
    cpa_product_details_viewed text,
    cpa_purchased text,
    cpa_reservation_completed text,
    cpa_signup_completed text,
    cpm_cost_per_thousand_impressions text,
    ctr_click_through_rate text,
    currency text,
    cv_api text,
    cv_checkout_started text,
    cv_conversions text,
    cv_item_added_to_cart text,
    cv_lead_generated text,
    cv_line_tag_and_cv_api text,
    cv_product_details_viewed text,
    cv_purchased text,
    cv_reservation_completed text,
    cv_signup_completed text,
    cvr_checkout_started text,
    cvr_conversion_rate text,
    cvr_item_added_to_cart text,
    cvr_lead_generated text,
    cvr_line_tag_and_cv_api text,
    cvr_product_details_viewed text,
    cvr_purchased text,
    cvr_reservation_completed text,
    cvr_signup_completed text,
    description text,
    home_screen_view_rate text,
    impressions text,
    install_rate_clicks text,
    installs_clicks text,
    installs_clicks_and_views text,
    installs_views text,
    level_achieved text,
    level_achieved_rate text,
    open_rate text,
    opens text,
    product_view_rate text,
    purchase text,
    purchase_rate text,
    search text,
    search_rate text,
    title text,
    tutorial_complete text,
    tutorial_percent_complete text,
    view_home_screen text,
    view_product text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("day", adaccount_id, group_id, id),
    FOREIGN KEY (adaccount_id) REFERENCES adaccount(id),
    FOREIGN KEY (group_id) REFERENCES adaccount(group_id),
    FOREIGN KEY (id) REFERENCES ad(id),
    FOREIGN KEY (adgroup_id) REFERENCES adgroup(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);
