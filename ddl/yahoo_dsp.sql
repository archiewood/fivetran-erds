CREATE TABLE beacon_condition (
    "index" integer,
    beacon_id integer,
    beacon_updated_at text,
    "key" text,
    operator text,
    "value" text,
    PRIMARY KEY ("index", beacon_id, beacon_updated_at),
    FOREIGN KEY (beacon_id) REFERENCES beacon_history(id),
    FOREIGN KEY (beacon_updated_at) REFERENCES beacon_history(id)
);

CREATE TABLE beacon_history (
    id integer,
    updated_at text,
    account_id integer,
    pixel_id integer,
    seat_id integer,
    app_id text,
    app_locale text,
    app_url text,
    conversion_category text,
    conversion_default_value double precision,
    created_at text,
    destination_url text,
    destination_url_operator text,
    mobile_measurement_partner text,
    "name" text,
    rule_type text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (pixel_id) REFERENCES pixel(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE campaign_history (
    id integer,
    updated_at timestamp,
    account_id integer,
    budget_type text,
    created_at timestamp,
    currency text,
    demo_vendor text,
    frequency_cap_period_type text,
    frequency_cap_value bigint,
    goal_type text,
    goal_value bigint,
    "name" text,
    package_enabled boolean,
    "status" text,
    time_zone text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE package_schedule (
    id integer,
    package_id integer,
    budget double precision,
    daily_budget double precision,
    daily_budget_type text,
    end_date timestamp,
    imp_budget bigint,
    imp_daily_budget double precision,
    "name" text,
    package_language text,
    start_date timestamp,
    PRIMARY KEY (id, package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE ad_countdown_history (
    id integer,
    ad_id integer,
    ad_updated_at timestamp,
    countdown_prefix_id integer,
    end_date timestamp,
    time_zone text,
    PRIMARY KEY (id, ad_id, ad_updated_at),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_at) REFERENCES ad_history(id)
);

CREATE TABLE advertiser_contact (
    account_id integer,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    email text,
    first_name text,
    last_name text,
    postal_code text,
    region text,
    telephone text,
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE creative_details_media (
    id integer,
    creative_id integer,
    bit_rate integer,
    frame_rate integer,
    height integer,
    media_mime_type text,
    media_url text,
    width integer,
    PRIMARY KEY (id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE audience_poi_targeting_rule_chain (
    location_id integer,
    audience_poi_id integer,
    is_excluded boolean,
    PRIMARY KEY (location_id, audience_poi_id),
    FOREIGN KEY (audience_poi_id) REFERENCES audience_poi(id)
);

CREATE TABLE deal_account (
    account_id integer,
    deal_id integer,
    PRIMARY KEY (account_id, deal_id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE audience_poi (
    id integer,
    account_id integer,
    seat_id integer,
    "name" text,
    number_of_visits integer,
    retention_days text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE contextual_category_by_taxonomy_type (
    id integer,
    taxonomy_type text,
    parent_category_id integer,
    description text,
    "level" integer,
    PRIMARY KEY (id, taxonomy_type),
    FOREIGN KEY (parent_category_id) REFERENCES contextual_category_by_taxonomy_type(id)
);

CREATE TABLE audience_ip_address_history (
    id text,
    audience_ip_address_id integer,
    created_date timestamp,
    fail_percentage double precision,
    "status" text,
    "type" text,
    PRIMARY KEY (id, audience_ip_address_id),
    FOREIGN KEY (audience_ip_address_id) REFERENCES audience_ip_address(id)
);

CREATE TABLE audience_srt_included_keyword (
    "value" text,
    audience_srt_id integer,
    PRIMARY KEY ("value", audience_srt_id),
    FOREIGN KEY (audience_srt_id) REFERENCES audience_srt(id)
);

CREATE TABLE deal (
    id integer,
    account_group_id integer,
    exchange_id integer,
    account_is_excluded boolean,
    description text,
    exchange_deal_id text,
    "name" text,
    reserve_price double precision,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_group_id) REFERENCES account_group(id),
    FOREIGN KEY (exchange_id) REFERENCES exchange(id)
);

CREATE TABLE creative_impression_tracking (
    tracking_event_type text,
    creative_id integer,
    imp_tracker_url text,
    PRIMARY KEY (tracking_event_type, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE audience_poi_targeting_rule_gid (
    gid_id integer,
    audience_poi_id integer,
    is_excluded boolean,
    PRIMARY KEY (gid_id, audience_poi_id),
    FOREIGN KEY (audience_poi_id) REFERENCES audience_poi(id)
);

CREATE TABLE targeting_ab_testing (
    id integer,
    line_id integer,
    user_group_id integer,
    lower_bound integer,
    "name" text,
    traffic_percent integer,
    upper_bound integer,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id)
);

CREATE TABLE creative_details (
    creative_id integer,
    call_to_action text,
    company_name text,
    description text,
    duration integer,
    title text,
    PRIMARY KEY (creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE line_fee_list (
    id integer,
    line_id integer,
    fee double precision,
    "name" text,
    type_name text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE creative_expand_direction (
    direction text,
    creative_id integer,
    PRIMARY KEY (direction, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE ad_schedule_history (
    id integer,
    ad_id integer,
    ad_updated_at timestamp,
    end_date timestamp,
    start_date timestamp,
    PRIMARY KEY (id, ad_id, ad_updated_at),
    FOREIGN KEY (ad_id) REFERENCES ad_history(id),
    FOREIGN KEY (ad_updated_at) REFERENCES ad_history(id)
);

CREATE TABLE audience_mail_event (
    id integer,
    account_id integer,
    seat_id integer,
    created_at text,
    even_type text,
    frequency integer,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_mail_event_time_attribute (
    "index" integer,
    audience_mail_event_id integer,
    from_date text,
    "key" text,
    "name" text,
    num_days text,
    range_type text,
    to_date text,
    PRIMARY KEY ("index", audience_mail_event_id),
    FOREIGN KEY (audience_mail_event_id) REFERENCES audience_mail_event(id)
);

CREATE TABLE targeting_frequency_capping (
    line_id integer,
    cap_period text,
    cap_value text,
    enable_viewability_freq_cap boolean,
    serve_unknown_user boolean,
    PRIMARY KEY (line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE creative_companion_banner (
    id integer,
    creative_id integer,
    mime_type text,
    "name" text,
    PRIMARY KEY (id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE targeting_demographic (
    line_id integer,
    threshold double precision,
    PRIMARY KEY (line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE targeting_segment (
    id integer,
    line_id integer,
    audience_type text,
    created_at text,
    is_excluded boolean,
    "name" text,
    reach_count bigint,
    recency integer,
    segment_type text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_mail_domain (
    id integer,
    account_id integer,
    seat_id integer,
    created_at text,
    "name" text,
    retention_days integer,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_email_address (
    id integer,
    account_id integer,
    created_at text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE targeting_deal (
    id text,
    line_id integer,
    exchange_deal_id text,
    exchange_id integer,
    account_is_excluded boolean,
    description text,
    is_excluded boolean,
    "name" text,
    reserve_price double precision,
    "status" text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id),
    FOREIGN KEY (exchange_deal_id) REFERENCES deal(id),
    FOREIGN KEY (exchange_id) REFERENCES exchange(id)
);

CREATE TABLE beacon_instrumentation_code (
    beacon_id integer,
    pixel_id integer,
    custom_event_script text,
    url_secure_multiple text,
    url_secure_single text,
    PRIMARY KEY (beacon_id),
    FOREIGN KEY (beacon_id) REFERENCES beacon_history(id),
    FOREIGN KEY (pixel_id) REFERENCES pixel(id)
);

CREATE TABLE contextual_history (
    id integer,
    updated_at timestamp,
    account_id integer,
    seat_id integer,
    "name" text,
    owner_type text,
    taxonomy_type text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_email_address_history (
    id text,
    audience_email_address_id integer,
    created_date timestamp,
    duplicated integer,
    error_message text,
    fail_percentage double precision,
    "status" text,
    total_failed integer,
    total_ids integer,
    "type" text,
    PRIMARY KEY (id, audience_email_address_id),
    FOREIGN KEY (audience_email_address_id) REFERENCES audience_email_address(id)
);

CREATE TABLE targeting_weather_temperature (
    line_id integer,
    all_temperatures boolean,
    is_fahrenheit boolean,
    max_temp integer,
    min_temp integer,
    PRIMARY KEY (line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_profile_size (
    id integer,
    profile_timestamp timestamp,
    count bigint,
    PRIMARY KEY (id, profile_timestamp)
);

CREATE TABLE audience_profile_gender (
    id integer,
    "name" text,
    count bigint,
    unique_count bigint,
    PRIMARY KEY (id, "name")
);

CREATE TABLE pixel (
    id integer,
    account_id integer,
    "name" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE targeting_dooh_screen_owner (
    id integer,
    line_id integer,
    "name" text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_mail_domain_excluded_domains (
    domain text,
    audience_mail_domain integer,
    PRIMARY KEY (domain, audience_mail_domain),
    FOREIGN KEY (audience_mail_domain) REFERENCES audience_mail_domain(id)
);

CREATE TABLE audience_srt (
    id integer,
    account_id integer,
    seat_id integer,
    broad_optimization_type text,
    created_at text,
    match_type text,
    "name" text,
    retention_days integer,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_poi_targeting_rule_woeid (
    woe_id integer,
    audience_poi_id integer,
    is_excluded boolean,
    PRIMARY KEY (woe_id, audience_poi_id),
    FOREIGN KEY (audience_poi_id) REFERENCES audience_poi(id)
);

CREATE TABLE targeting_weather_humidity (
    line_id integer,
    all_humidities boolean,
    max_humidity integer,
    min_humidity integer,
    PRIMARY KEY (line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE targeting_type (
    "name" text,
    line_id integer,
    id integer,
    is_targeted boolean,
    PRIMARY KEY ("name", line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE ad_history (
    id integer,
    updated_at timestamp,
    line_id integer,
    creative_id integer,
    media_type text,
    "name" text,
    "status" text,
    PRIMARY KEY (id, updated_at, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE creative_history (
    id integer,
    updated_at timestamp,
    account_id integer,
    ad_choice_icon_location text,
    ad_choices_enabled boolean,
    ad_type text,
    creative_language text,
    creative_tag_url text,
    creative_type text,
    is_third_party_code_secure boolean,
    landing_page_domain text,
    landing_page_url text,
    layout text,
    mime_type text,
    "name" text,
    "status" text,
    third_party_code text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE line_conversion_list (
    id integer,
    line_id integer,
    accept_view_through boolean,
    beacon_id integer,
    beacon_value_pc double precision,
    click_window integer,
    click_window_unit_type text,
    "name" text,
    view_beacon_value_discount double precision,
    view_window integer,
    view_window_unit_type text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE creative_adx_categories (
    category text,
    creative_id integer,
    PRIMARY KEY (category, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE audience_mail_event_text_attribute (
    "index" integer,
    audience_mail_event_id integer,
    group_type text,
    "key" text,
    match_type text,
    "name" text,
    operator_type text,
    "value" text,
    PRIMARY KEY ("index", audience_mail_event_id),
    FOREIGN KEY (audience_mail_event_id) REFERENCES audience_mail_event(id)
);

CREATE TABLE targeting_geo (
    id text,
    line_id integer,
    code text,
    description text,
    excluded boolean,
    "key" text,
    "level" text,
    "name" text,
    woeid text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE targeting_publisher (
    id text,
    line_id integer,
    is_excluded boolean,
    "name" text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_conversion_rule (
    id integer,
    account_id integer,
    "name" text,
    pixel_rule_id integer,
    pixel_rule_name text,
    pixel_rule_size bigint,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE audience_poi_custom_date_range (
    "index" integer,
    audience_poi_id integer,
    end_date text,
    start_date text,
    PRIMARY KEY ("index", audience_poi_id),
    FOREIGN KEY (audience_poi_id) REFERENCES audience_poi(id)
);

CREATE TABLE audience_composite_exclude_segment (
    id integer,
    composite_audience_id integer,
    "name" text,
    reach_count bigint,
    segment_type text,
    "status" text,
    PRIMARY KEY (id, composite_audience_id),
    FOREIGN KEY (composite_audience_id) REFERENCES audience_composite_list(id)
);

CREATE TABLE audience_mail_domain_categories (
    audience_mail_domain_id integer,
    id integer,
    PRIMARY KEY (audience_mail_domain_id, id),
    FOREIGN KEY (audience_mail_domain_id) REFERENCES audience_mail_domain(id),
    FOREIGN KEY (id) REFERENCES audience_mail_domain_all_categories(id)
);

CREATE TABLE audience_lookalike_country (
    country text,
    audience_lookalike_id integer,
    PRIMARY KEY (country, audience_lookalike_id),
    FOREIGN KEY (audience_lookalike_id) REFERENCES audience_lookalike(id)
);

CREATE TABLE audience_composite_include_segment (
    id integer,
    composite_audience_id integer,
    "name" text,
    reach_count bigint,
    segment_type text,
    "status" text,
    PRIMARY KEY (id, composite_audience_id),
    FOREIGN KEY (composite_audience_id) REFERENCES audience_composite_list(id)
);

CREATE TABLE line (
    id integer,
    order_id integer,
    package_id integer,
    app_id text,
    app_locale text,
    app_marketing_objective text,
    app_url text,
    bid_price double precision,
    billing_method_type text,
    billing_price double precision,
    budget_type text,
    completion_threshold integer,
    goal_amount double precision,
    goal_mode_type text,
    goal_type text,
    is_native_enabled boolean,
    margin_goal double precision,
    margin_type text,
    max_goal double precision,
    media_type text,
    "name" text,
    pacing_acceleration integer,
    pacing_mode_type text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES campaign_history(id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE order_frequency_cap (
    campaign_updated_at timestamp,
    order_id integer,
    pacing_type text,
    period_multi_hour integer,
    value_day integer,
    value_hour integer,
    value_minute integer,
    value_month integer,
    value_multi_hour integer,
    value_week integer,
    PRIMARY KEY (campaign_updated_at, order_id),
    FOREIGN KEY (campaign_updated_at) REFERENCES campaign_history(id),
    FOREIGN KEY (order_id) REFERENCES campaign_history(id)
);

CREATE TABLE advertiser_history (
    id integer,
    updated_at timestamp,
    seat_id integer,
    billing_price text,
    currency text,
    iab_category_id integer,
    iab_secondary_category_id integer,
    is_crossdevice_off boolean,
    landing_page_url text,
    "name" text,
    "status" text,
    time_zone text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_lookalike (
    id integer,
    account_id integer,
    created_at text,
    device_type text,
    expected_size bigint,
    "name" text,
    seed_audience_id integer,
    seed_audience_name text,
    seed_audience_type text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE seat (
    id integer,
    currency text,
    "name" text,
    time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE audience_srt_excluded_keyword (
    "value" text,
    audience_srt_id integer,
    PRIMARY KEY ("value", audience_srt_id),
    FOREIGN KEY (audience_srt_id) REFERENCES audience_srt(id)
);

CREATE TABLE targeting_day_parting (
    "day" text,
    line_id integer,
    hours text,
    is_whole_day boolean,
    PRIMARY KEY ("day", line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE pixel_codes (
    "index" integer,
    pixel_id integer,
    instrumentation_code text,
    protocol text,
    "type" text,
    PRIMARY KEY ("index", pixel_id),
    FOREIGN KEY (pixel_id) REFERENCES pixel(id)
);

CREATE TABLE deal_account_group (
    account_group_id integer,
    deal_id integer,
    PRIMARY KEY (account_group_id, deal_id),
    FOREIGN KEY (account_group_id) REFERENCES account_group(id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE audience_device_id_history (
    id text,
    audience_device_id integer,
    created_date timestamp,
    duplicated integer,
    error_message text,
    fail_percentage double precision,
    "status" text,
    total_failed integer,
    total_ids integer,
    "type" text,
    PRIMARY KEY (id, audience_device_id),
    FOREIGN KEY (audience_device_id) REFERENCES audience_device_id(id)
);

CREATE TABLE targeting_contextuals_history (
    id integer,
    updated_at timestamp,
    account_id integer,
    line_id integer,
    is_excluded boolean,
    "name" text,
    taxonomy_type text,
    PRIMARY KEY (id, updated_at, account_id, line_id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_profile_location (
    continent text,
    country_name text,
    id integer,
    count bigint,
    unique_count bigint,
    PRIMARY KEY (continent, country_name, id)
);

CREATE TABLE audience_composite_list (
    id integer,
    account_id integer,
    seat_id integer,
    clear_all_exclude boolean,
    "name" text,
    people_count bigint,
    "status" text,
    total_count bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_ip_address (
    id integer,
    account_id integer,
    created_at text,
    "name" text,
    retention_days integer,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE audience_device_id (
    id integer,
    account_id integer,
    created_at text,
    is_device_only boolean,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE targeting_native_lists (
    id integer,
    line_id integer,
    created_at timestamp,
    is_excluded boolean,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_profile_age (
    id integer,
    "name" text,
    count bigint,
    unique_count bigint,
    PRIMARY KEY (id, "name")
);

CREATE TABLE bid_multiplier_cap (
    id integer,
    line_id integer,
    bm_ad_learn_override boolean,
    multiplier_cap double precision,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE line_schedule (
    id integer,
    line_id integer,
    budget double precision,
    daily_budget double precision,
    daily_budget_type text,
    end_date_str timestamp,
    imp_budget integer,
    imp_daily_budget double precision,
    "name" text,
    start_date_str timestamp,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE audience_poi_location_breadcrumb (
    id integer,
    audience_poi_location_id integer,
    "name" text,
    PRIMARY KEY (id, audience_poi_location_id),
    FOREIGN KEY (audience_poi_location_id) REFERENCES audience_poi_location(id)
);

CREATE TABLE creative_user_interaction (
    "action" text,
    creative_id integer,
    PRIMARY KEY ("action", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE user_group (
    id integer,
    account_id integer,
    "name" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE audience_poi_location (
    id integer,
    has_children boolean,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE account_group (
    id integer,
    seat_id integer,
    code text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE audience_poi_targeting_rule_category (
    category_id integer,
    audience_poi_id integer,
    is_excluded boolean,
    PRIMARY KEY (category_id, audience_poi_id),
    FOREIGN KEY (audience_poi_id) REFERENCES audience_poi(id)
);

CREATE TABLE site_list_item (
    id integer,
    site_list_id integer,
    site_list_updated_at timestamp,
    item_name text,
    PRIMARY KEY (id, site_list_id, site_list_updated_at),
    FOREIGN KEY (site_list_id) REFERENCES site_list_history(id),
    FOREIGN KEY (site_list_updated_at) REFERENCES site_list_history(id)
);

CREATE TABLE audience_mail_domain_domains (
    domain text,
    audience_mail_domain_id integer,
    PRIMARY KEY (domain, audience_mail_domain_id),
    FOREIGN KEY (audience_mail_domain_id) REFERENCES audience_mail_domain(id)
);

CREATE TABLE targeting_site_list (
    id integer,
    line_id integer,
    created_at timestamp,
    is_excluded boolean,
    "name" text,
    total_sites integer,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE targeting_dooh_venue_type (
    id integer,
    line_id integer,
    label text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE budget_schedule_history (
    id integer,
    campaign_id integer,
    campaign_updated_at timestamp,
    budget_type text,
    daily_budget text,
    end_date timestamp,
    imp_budget integer,
    imp_daily_budget integer,
    schedule_budget text,
    schedule_name text,
    start_date timestamp,
    PRIMARY KEY (id, campaign_id, campaign_updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_updated_at) REFERENCES campaign_history(id)
);

CREATE TABLE exchange (
    id integer,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE creative_custom_identifier (
    id integer,
    creative_id integer,
    identifier_value text,
    PRIMARY KEY (id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(id)
);

CREATE TABLE package (
    id integer,
    order_id integer,
    billing_method_type text,
    budget_distributor_enabled boolean,
    budget_type text,
    channel_type text,
    completion_threshold bigint,
    flighting_enabled boolean,
    goal_mode_type text,
    goal_type text,
    margin_type text,
    media_type text,
    "name" text,
    objective text,
    pacing_mode_type text,
    package_language text,
    "status" text,
    supply_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES campaign_history(id)
);

CREATE TABLE site_list_history (
    id integer,
    updated_at timestamp,
    account_id integer,
    seat_id integer,
    is_shared boolean,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id),
    FOREIGN KEY (seat_id) REFERENCES seat(id)
);

CREATE TABLE user_group_entity (
    id integer,
    user_group_id integer,
    lower_bound integer,
    "name" text,
    traffic_percent integer,
    upper_bound integer,
    PRIMARY KEY (id, user_group_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id)
);

CREATE TABLE audience_mail_domain_all_categories (
    id integer,
    category text,
    PRIMARY KEY (id)
);

CREATE TABLE audience_profile_device (
    id integer,
    "name" text,
    count bigint,
    unique_count bigint,
    PRIMARY KEY (id, "name")
);

CREATE TABLE contextual_category (
    category_id integer,
    id integer,
    contextual_id integer,
    contextual_updated_at timestamp,
    PRIMARY KEY (category_id, id, contextual_id, contextual_updated_at),
    FOREIGN KEY (contextual_id) REFERENCES contextual_history(id),
    FOREIGN KEY (contextual_updated_at) REFERENCES contextual_history(id)
);

CREATE TABLE audience_composite_fees (
    currency text,
    fee_media_type text,
    composite_audience_id integer,
    fee double precision,
    PRIMARY KEY (currency, fee_media_type, composite_audience_id),
    FOREIGN KEY (composite_audience_id) REFERENCES audience_composite_list(id)
);

CREATE TABLE bid_multiplier (
    id integer,
    line_id integer,
    is_app_name boolean,
    multiplier double precision,
    target_domain text,
    target_type text,
    target_value_city text,
    target_value_country text,
    target_value_day text,
    target_value_dma_code text,
    target_value_hour integer,
    target_value_id integer,
    target_value_locality text,
    target_value_major_metro_area text,
    target_value_postal_code text,
    target_value_postal_code_prefix text,
    target_value_region text,
    target_value_sub_locality text,
    target_value_text text,
    PRIMARY KEY (id, line_id),
    FOREIGN KEY (line_id) REFERENCES line(id)
);

CREATE TABLE package_user_frequency_cap (
    package_id integer,
    period_multi_hour bigint,
    value_day bigint,
    value_hour bigint,
    value_minute bigint,
    value_month bigint,
    value_multi_hour bigint,
    value_week bigint,
    PRIMARY KEY (package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE advertiser_billing_contact (
    account_id integer,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    city text,
    country text,
    email text,
    first_name text,
    last_name text,
    legal_mandate_confirmation text,
    postal_code text,
    region text,
    telephone text,
    vat_number text,
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES advertiser_history(id)
);

CREATE TABLE package_household_frequency_cap (
    package_id integer,
    enabled boolean,
    period_multi_hour bigint,
    value_day bigint,
    value_hour bigint,
    value_minute bigint,
    value_month bigint,
    value_multi_hour bigint,
    value_week bigint,
    PRIMARY KEY (package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);
