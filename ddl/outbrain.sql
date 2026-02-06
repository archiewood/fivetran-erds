CREATE TABLE section_report (
    "day" text,
    campaign_id text,
    section_id text,
    average_value text,
    clicks integer,
    conversion_rate text,
    conversions integer,
    cpa text,
    ctr text,
    ecpc text,
    impressions integer,
    spend text,
    sum_value text,
    total_average_value text,
    total_conversions integer,
    total_cpa text,
    total_sum_value text,
    view_average_value text,
    view_conversion_rate text,
    view_sum_value text,
    views_conversions integer,
    PRIMARY KEY ("day", campaign_id, section_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE geolocation (
    id text,
    code text,
    geo_type text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_history (
    id text,
    last_modified timestamp,
    budget_id text,
    budget_last_modified timestamp,
    marketer_id text,
    marketer_last_modified timestamp,
    auto_archived boolean,
    auto_expiration_of_ads integer,
    campaign_on_air boolean,
    content_type text,
    cpc text,
    cpc_per_ad_enabled boolean,
    creation_time timestamp,
    enabled boolean,
    minimum_cpc text,
    "name" text,
    on_air_reason text,
    prefix_tracking_code text,
    prefix_tracking_code_encode boolean,
    readonly boolean,
    start_hour integer,
    targets_android boolean,
    targets_chrome boolean,
    targets_desktop boolean,
    targets_exclude_ad_block_users boolean,
    targets_firefox boolean,
    targets_in_app boolean,
    targets_include_cellular_network boolean,
    targets_internet_explorer boolean,
    targets_ios boolean,
    targets_mac_os boolean,
    targets_mobile boolean,
    targets_native_placements_enabled boolean,
    targets_opera boolean,
    targets_other_browser boolean,
    targets_other_os boolean,
    targets_safari boolean,
    targets_samsung boolean,
    targets_tablet boolean,
    targets_uc_browser boolean,
    targets_windows boolean,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (budget_id) REFERENCES budget_history(id),
    FOREIGN KEY (budget_last_modified) REFERENCES budget_history(id),
    FOREIGN KEY (marketer_id) REFERENCES marketer_history(id),
    FOREIGN KEY (marketer_last_modified) REFERENCES marketer_history(id)
);

CREATE TABLE interest (
    id text,
    can_be_targeted boolean,
    "name" text,
    reach_estimation_count integer,
    PRIMARY KEY (id)
);

CREATE TABLE bid_cpc_by_section_history (
    last_modified timestamp,
    campaign_id text,
    campaign_last_modified timestamp,
    section_id text,
    cpc_adjustment text,
    creation_time timestamp,
    PRIMARY KEY (last_modified, campaign_id, campaign_last_modified, section_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE promoted_link_history (
    id text,
    last_modified timestamp,
    campaign_id text,
    campaign_last_modified timestamp,
    image_meta_data_id text,
    approval_status text,
    approval_status_is_editable boolean,
    archived boolean,
    base_url text,
    cached_image_url text,
    call_to_action_type text,
    call_to_action_value text,
    cpc_adjustment text,
    creation_time timestamp,
    document_id text,
    document_language text,
    enabled boolean,
    section_name text,
    site_name text,
    status_reason text,
    text text,
    url text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (image_meta_data_id) REFERENCES image_metadata(id)
);

CREATE TABLE publisher (
    id text,
    "name" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE conversion_tracking_history (
    id text,
    last_modified timestamp,
    marketer_id text,
    marketer_last_modified timestamp,
    conversion_window integer,
    creation_time timestamp,
    enabled boolean,
    include_in_conversions boolean,
    "name" text,
    order_currency text,
    order_value text,
    tracking_status text,
    "type" text,
    url text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (marketer_id) REFERENCES marketer_history(id),
    FOREIGN KEY (marketer_last_modified) REFERENCES marketer_history(id)
);

CREATE TABLE marketer_history (
    id text,
    last_modified timestamp,
    creation_time timestamp,
    enabled boolean,
    "name" text,
    PRIMARY KEY (id, last_modified)
);

CREATE TABLE promoted_link_report (
    "day" text,
    promoted_link_id text,
    average_value text,
    clicks integer,
    conversion_rate text,
    conversions integer,
    cpa text,
    ctr text,
    ecpc text,
    impressions integer,
    spend text,
    sum_value text,
    total_average_value text,
    total_conversions integer,
    total_cpa text,
    total_sum_value text,
    view_average_value text,
    view_conversion_rate text,
    view_sum_value text,
    views_conversions integer,
    PRIMARY KEY ("day", promoted_link_id),
    FOREIGN KEY (promoted_link_id) REFERENCES promoted_link_history(id)
);

CREATE TABLE image_metadata (
    id text,
    original_image_url text,
    play_mode text,
    requested_image_url text,
    stream text,
    thumbnail_url text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE "section" (
    id text,
    publisher_id text,
    "name" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE budget_history (
    id text,
    last_modified timestamp,
    marketer_id text,
    marketer_last_modified timestamp,
    amount text,
    amount_remaining text,
    amount_spent text,
    creation_time timestamp,
    currency text,
    daily_target text,
    end_date text,
    maximum_amount text,
    "name" text,
    pacing text,
    run_forever boolean,
    start_date text,
    "type" text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (marketer_id) REFERENCES marketer_history(id),
    FOREIGN KEY (marketer_last_modified) REFERENCES marketer_history(id)
);

CREATE TABLE targeting_interest (
    campaign_id text,
    campaign_last_modified timestamp,
    interest_id text,
    match_op text,
    PRIMARY KEY (campaign_id, campaign_last_modified, interest_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (interest_id) REFERENCES interest(id)
);

CREATE TABLE geolocation_report (
    "day" text,
    geolocation_id text,
    average_value text,
    clicks integer,
    conversion_rate text,
    conversions integer,
    cpa text,
    ctr text,
    ecpc text,
    impressions integer,
    spend text,
    sum_value text,
    total_average_value text,
    total_conversions integer,
    total_cpa text,
    total_sum_value text,
    view_average_value text,
    view_conversion_rate text,
    view_sum_value text,
    views_conversions integer,
    PRIMARY KEY ("day", geolocation_id),
    FOREIGN KEY (geolocation_id) REFERENCES geolocation(id)
);

CREATE TABLE publisher_report (
    "day" text,
    campaign_id text,
    publisher_id text,
    average_value text,
    clicks integer,
    conversion_rate text,
    conversions integer,
    cpa text,
    ctr text,
    ecpc text,
    impressions integer,
    spend text,
    sum_value text,
    total_average_value text,
    total_conversions integer,
    total_cpa text,
    total_sum_value text,
    view_average_value text,
    view_conversion_rate text,
    view_sum_value text,
    views_conversions integer,
    PRIMARY KEY ("day", campaign_id, publisher_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE segment_history (
    id text,
    last_modified timestamp,
    marketer_id text,
    marketer_last_modified timestamp,
    archived boolean,
    availability_status text,
    creation_time timestamp,
    description text,
    enabled boolean,
    inactive_reason text,
    membership_duration integer,
    "name" text,
    segment_type text,
    "size" integer,
    tracking_status text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (marketer_id) REFERENCES marketer_history(id),
    FOREIGN KEY (marketer_last_modified) REFERENCES marketer_history(id)
);

CREATE TABLE targeting_location (
    campaign_id text,
    campaign_last_modified timestamp,
    geolocation_id text,
    PRIMARY KEY (campaign_id, campaign_last_modified, geolocation_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (geolocation_id) REFERENCES geolocation(id)
);

CREATE TABLE campaign_conversion_report (
    "day" text,
    "name" text,
    platform text,
    campaign_id text,
    average_value text,
    conversion_rate text,
    conversions text,
    cpa text,
    roas text,
    sum_value text,
    total_average_value text,
    total_conversions text,
    total_cpa text,
    total_roas text,
    total_sum_value text,
    view_average_value text,
    view_conversion_rate text,
    view_conversions text,
    view_sum_value text,
    PRIMARY KEY ("day", "name", platform, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);

CREATE TABLE campaign_segment (
    campaign_id text,
    campaign_last_modified timestamp,
    segment_id text,
    "status" text,
    PRIMARY KEY (campaign_id, campaign_last_modified, segment_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (segment_id) REFERENCES segment_history(id)
);

CREATE TABLE suffix_tracking_code_history (
    "key" text,
    campaign_id text,
    campaign_last_modified timestamp,
    "value" text,
    PRIMARY KEY ("key", campaign_id, campaign_last_modified),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id)
);

CREATE TABLE campaign_report (
    "day" text,
    platform text,
    campaign_id text,
    average_value text,
    clicks integer,
    conversion_rate text,
    conversions integer,
    cpa text,
    ctr text,
    ecpc text,
    impressions integer,
    spend text,
    sum_value text,
    total_average_value text,
    total_conversions integer,
    total_cpa text,
    total_sum_value text,
    view_average_value text,
    view_conversion_rate text,
    view_sum_value text,
    views_conversions integer,
    PRIMARY KEY ("day", platform, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id)
);
