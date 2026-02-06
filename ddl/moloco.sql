CREATE TABLE ad_group_user_bucket (
    _fivetran_id text,
    ad_group_id text,
    ends text,
    "start" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id)
);

CREATE TABLE ad_group_creative_group (
    creative_group_id text,
    ad_group_id text,
    PRIMARY KEY (creative_group_id, ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id)
);

CREATE TABLE ad_group_audience_target (
    audience_target_id text,
    ad_group_id text,
    id text,
    PRIMARY KEY (audience_target_id, ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (id) REFERENCES audience_target(id)
);

CREATE TABLE ad_group (
    id text,
    ad_account_id text,
    campaign_id text,
    product_id text,
    capper_amount text,
    capper_unit text,
    created_at text,
    enabling_state text,
    is_secondary text,
    paired_ad_group_id text,
    pricing_model_id text,
    title text,
    updated_at text,
    -- targeting_condition_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE tracking_link_attempt_id (
    attempt_id text,
    tracking_link_id text,
    PRIMARY KEY (attempt_id, tracking_link_id),
    FOREIGN KEY (tracking_link_id) REFERENCES tracking_link(id)
);

CREATE TABLE tracking_link (
    id text,
    ad_account_id text,
    product_id text,
    click_through_link_status text,
    click_through_link_unverified_status_data_stored_at text,
    click_through_link_url text,
    created_at text,
    description text,
    device_os text,
    title text,
    tracking_company text,
    updated_at text,
    verified_attempt_ad_account_id text,
    verified_attempt_id text,
    verified_attempt_resolved_idfa text,
    verified_attempt_resolved_url text,
    verified_attempt_started_at text,
    verified_attempt_tracking_bundle_id text,
    verified_attempt_tracking_link_id text,
    verified_attempt_url_data_type text,
    verified_attempt_user_email text,
    verified_attempt_user_id text,
    verified_attempt_user_name text,
    verified_attempt_verified_at text,
    view_through_link_status text,
    view_through_link_stored_at text,
    view_through_link_unverified_status_data_stored_at text,
    view_through_link_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    ad_account_id text,
    advertiser_domain text,
    app_bundle_id text,
    app_category text,
    app_mmp text,
    app_rating text,
    app_store_url text,
    content_rating text,
    created_at text,
    developer_name text,
    device_os text,
    dynamic_creative_property jsonb,
    mmp_allow_fingerprinting text,
    mmp_bundle_id text,
    mmp_id text,
    mmp_mmp text,
    mmp_status text,
    mmp_updated_at text,
    skadn_bundle_id text,
    skadn_effective_date text,
    skadn_mmp text,
    skadn_ownership text,
    skadn_scheme text,
    skadn_status text,
    storekit_enabled text,
    title text,
    "type" text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id)
);

CREATE TABLE ad_account_product_id (
    product_id text,
    ad_account_id text,
    PRIMARY KEY (product_id, ad_account_id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id)
);

CREATE TABLE ad_account (
    id text,
    billing_account_id text,
    created_at text,
    currency text,
    custom_key_values_additional_prop text,
    description text,
    targets_future_preferences_product_scope text,
    timezone text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE creative_review_creative_group (
    creative_group_id text,
    creative_review_id text,
    title text,
    PRIMARY KEY (creative_group_id, creative_review_id),
    FOREIGN KEY (creative_review_id) REFERENCES creative_review(id)
);

CREATE TABLE creative_review_action_history (
    _fivetran_id text,
    creative_review_id text,
    assigned_status text,
    "comment" text,
    created_at text,
    reason_detail text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creative_review_id) REFERENCES creative_review(id)
);

CREATE TABLE creative_review (
    id text,
    creative_id text,
    adx_status text,
    fyber_status text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE customer_set (
    id text,
    auto_delete_at text,
    created_at text,
    data_file_path text,
    description text,
    file_info_file_name text,
    file_info_status text,
    file_info_timestamp text,
    hash_algorithm text,
    id_type text,
    is_hashed text,
    is_upper text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE creative_companion_image (
    _fivetran_id text,
    creative_id text,
    height text,
    size_in_bytes text,
    url text,
    width text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative (
    id text,
    ad_account_id text,
    product_id text,
    advertiser_info_description text,
    advertiser_info_id text,
    advertiser_info_title text,
    created_at text,
    creator_tag text,
    custom_height text,
    custom_html text,
    custom_image_url text,
    custom_key_values_additional_prop text,
    custom_width text,
    enabling_state text,
    feature_type text,
    icon_image_height text,
    icon_image_size_in_byte text,
    icon_image_url text,
    icon_image_width text,
    image_height text,
    image_size_in_byte text,
    image_url text,
    image_width text,
    main_image_height text,
    main_image_size_in_byte text,
    main_image_url text,
    main_image_width text,
    original_filename text,
    shrunk_main_imageheight text,
    shrunk_main_imagesize_in_byte text,
    shrunk_main_imageurl text,
    shrunk_main_imagewidth text,
    size_in_byte text,
    title text,
    "type" text,
    updated_at text,
    -- dynamic_html_* (dynamic column),
    -- rich_custom_html_* (dynamic column),
    -- template_html_* (dynamic column),
    -- video_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE campaign_creative_group (
    creative_group_id text,
    campaign_id text,
    PRIMARY KEY (creative_group_id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_country (
    "index" text,
    campaign_id text,
    country text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_audience_target (
    audience_target_id text,
    campaign_id text,
    id text,
    PRIMARY KEY (audience_target_id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES audience_target(id)
);

CREATE TABLE campaign (
    id text,
    ad_account_id text,
    product_id text,
    tracking_link_id text,
    ad_tracking_allowance text,
    auto_delete_at text,
    budget_schedule jsonb,
    created_at text,
    currency text,
    custom_key_values_additional_prop text,
    description text,
    device_os text,
    enabling_state text,
    goal jsonb,
    is_deleted text,
    landing_url text,
    priority text,
    schedule_end text,
    schedule_start text,
    skadn_input_include_traffic_without_attribution text,
    skadn_input_targeting_state text,
    "state" text,
    title text,
    tracking_company text,
    "type" text,
    updated_at text,
    -- targeting_condition_*_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (tracking_link_id) REFERENCES tracking_link(id)
);

CREATE TABLE audience_target (
    id text,
    auto_delete_at text,
    created_at text,
    targeting_condition jsonb,
    title text,
    updated_at text,
    -- targeting_condition_*_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE creative_group_id (
    creative_id text,
    creative_group_id text,
    PRIMARY KEY (creative_id, creative_group_id),
    FOREIGN KEY (creative_group_id) REFERENCES creative_group(id)
);

CREATE TABLE creative_group_action_histroy (
    id text,
    creative_group_id text,
    action_type text,
    "comment" text,
    created_at text,
    user_display_name text,
    user_id text,
    PRIMARY KEY (id, creative_group_id),
    FOREIGN KEY (creative_group_id) REFERENCES creative_group(id)
);

CREATE TABLE creative_group_audience_target (
    audience_target_id text,
    creative_group_id text,
    PRIMARY KEY (audience_target_id, creative_group_id),
    FOREIGN KEY (creative_group_id) REFERENCES creative_group(id)
);

CREATE TABLE creative_group (
    id text,
    ad_account_id text,
    product_id text,
    tracking_link_id text,
    app_icon_url text,
    background_color text,
    brand_logo_url text,
    business_title text,
    created_at text,
    cta_color text,
    cta_text text,
    cta_text_color text,
    description text,
    disclaimer_text text,
    disclaimer_text_color text,
    enabling_state text,
    feature_type text,
    final_landing_url text,
    image_border_color text,
    landing_url text,
    main_text text,
    main_text_color text,
    mmp_tag text,
    price_locale text,
    "status" text,
    title text,
    title_preamble text,
    updated_at text,
    -- targeting_condition_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (tracking_link_id) REFERENCES tracking_link(id)
);

CREATE TABLE ad_performance_report (
    _fivetran_id text,
    ad_account_id text,
    ad_group_id text,
    campaign_id text,
    creative_group_id text,
    creative_id text,
    app_id text,
    app_os text,
    app_store_id text,
    app_title text,
    campaign_country text,
    clicks text,
    creative_main_asset_location text,
    "date" text,
    engaged_views text,
    exchange_id text,
    impressions text,
    installs text,
    revenue text,
    site_domain text,
    site_id text,
    site_title text,
    skan_conversion_count text,
    skan_conversion_value text,
    spend text,
    sub_publisher_id text,
    sub_publisher_title text,
    traffic_is_lat text,
    traffic_mmp_effective text,
    traffic_skan_bid text,
    video_play_1_q text,
    video_play_2_q text,
    video_play_3_q text,
    video_play_4_q text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (creative_group_id) REFERENCES creative_group(id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);
