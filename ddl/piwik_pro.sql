CREATE TABLE app_site_query_param (
    "index" text,
    app_id text,
    query_param text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app_site_category_param (
    "index" text,
    app_id text,
    category_param text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app_excluded_url_param (
    "index" text,
    app_id text,
    excluded_url_param text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app_excluded_ip (
    "index" text,
    app_id text,
    excluded_ip text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app_excluded_user_agent (
    "index" text,
    app_id text,
    excluded_user_agent text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app_url (
    "index" text,
    app_id text,
    url text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app_privacy_coookie_domain (
    "index" text,
    app_id text,
    privacy_cookie_domain text,
    PRIMARY KEY ("index", app_id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE app (
    id text,
    added_at text,
    app_type text,
    cnil text,
    currency text,
    delay text,
    e_commerce_tracking text,
    exclude_unknown_url text,
    gdpr text,
    gdpr_data_anonymization text,
    gdpr_data_anonymization_mode text,
    gdpr_location_recognition text,
    gdpr_usermode_enabled text,
    keep_url_fragment text,
    "name" text,
    organization text,
    privacy_cookie_domains_enabled text,
    privacy_cookie_expiration_period text,
    privacy_use_cookies text,
    privacy_use_finger_printing text,
    session_id_strict_privacy_mode text,
    sharepoint_integration text,
    site_search_tracking text,
    timezone text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    event_id text,
    session_id text,
    website_id text,
    content_name text,
    content_piece text,
    content_target text,
    custom_event_name text,
    download_url text,
    event_index text,
    goal_id text,
    goal_id_label text,
    goal_revenue text,
    goal_uuid_id text,
    goal_uuid_label text,
    item_count text,
    lost_revenue text,
    next_event_title text,
    next_event_url text,
    order_id text,
    outlink_url text,
    page_generation_time text,
    page_view_index text,
    previous_event_title text,
    previous_event_url text,
    revenue text,
    revenue_discount text,
    revenue_shipping text,
    revenue_subtotal text,
    revenue_tax text,
    search_category text,
    search_keyword text,
    search_results_count text,
    time_on_page text,
    timestamps text,
    title text,
    type_id text,
    type_label text,
    url text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE session_location (
    session_id text,
    website_id text,
    city_name_id text,
    city_name_label text,
    continent_iso_code_id text,
    continent_iso_code_label text,
    country_name_id text,
    country_name_label text,
    latitude text,
    longitude text,
    metro_code_id text,
    metro_code_label text,
    organization text,
    provider text,
    subdivision_1_name_id text,
    subdivision_1_name_label text,
    subdivision_2_name_id text,
    subdivision_2_name_label text,
    timestamps text,
    visitor_id text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE event_custom_variable (
    event_id text,
    session_id text,
    website_id text,
    dimension_1 text,
    dimension_2 text,
    dimension_3 text,
    dimension_4 text,
    dimension_5 text,
    key_1 text,
    key_2 text,
    key_3 text,
    key_4 text,
    key_5 text,
    timestamps text,
    value_1 text,
    value_2 text,
    value_3 text,
    value_4 text,
    value_5 text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE session_custom_variables (
    session_id text,
    website_id text,
    dimension_1 text,
    dimension_2 text,
    dimension_3 text,
    dimension_4 text,
    dimension_5 text,
    key_1 text,
    key_2 text,
    key_3 text,
    key_4 text,
    key_5 text,
    timestamps text,
    value_1 text,
    value_2 text,
    value_3 text,
    value_4 text,
    value_5 text,
    visitor_id text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE session_users (
    session_id text,
    website_id text,
    cookie_id text,
    timestamps text,
    visitor_days_since_first_session text,
    visitor_days_since_last_session text,
    visitor_days_since_order text,
    visitor_id text,
    visitor_returning_id text,
    visitor_returning_label text,
    visitor_session_number text,
    website_name_id text,
    website_name_label text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE event_consent (
    event_id text,
    session_id text,
    website_id text,
    action_id text,
    action_label text,
    form_button_id text,
    form_button_label text,
    scope_id text,
    scope_label text,
    source_id text,
    source_label text,
    timestamps text,
    type_ab_testing_personalization text,
    type_analytics text,
    type_conversion_tracking text,
    type_custom_1 text,
    type_marketing_automation text,
    type_remarketing text,
    type_user_feedback text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE session_device_and_platform (
    session_id text,
    website_id text,
    browser_engine text,
    browser_fingerprint text,
    browser_language_iso_639_id text,
    browser_language_iso_639_label text,
    browser_name_id text,
    browser_name_label text,
    browser_version text,
    device_brand_id text,
    device_brand_label text,
    device_model text,
    device_type_id text,
    device_type_label text,
    ipv_4_address text,
    ipv_6_address text,
    operating_system_id text,
    operating_system_label text,
    operating_system_version text,
    plugin_cookie text,
    plugin_director text,
    plugin_flash text,
    plugin_gear text,
    plugin_java text,
    plugin_pdf text,
    plugin_quicktime text,
    plugin_realplayer text,
    plugin_silverlight text,
    plugin_windowsmedia text,
    resolution text,
    resolution_height text,
    resolution_width text,
    timestamps text,
    visitor_id text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE session_traffic (
    session_id text,
    website_id text,
    campaign_content text,
    campaign_id text,
    campaign_name text,
    keyword text,
    medium text,
    referrer_type_id text,
    referrer_type_label text,
    referrer_url text,
    "source" text,
    source_medium text,
    timestamps text,
    visitor_id text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE event_website_performance (
    event_id text,
    session_id text,
    website_id text,
    domain_lookup_time text,
    is_entry text,
    is_exit text,
    page_rendering_time text,
    redirections_time text,
    server_connection_time text,
    server_response_time text,
    timestamps text,
    timing_dom_interactive text,
    timing_event_end text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE session_goal (
    "index" text,
    session_id text,
    session_goals text,
    PRIMARY KEY ("index", session_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id)
);

CREATE TABLE session_goal_id (
    "index" text,
    session_id text,
    session_goal_id text,
    PRIMARY KEY ("index", session_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id)
);

CREATE TABLE "session" (
    session_id text,
    website_id text,
    campaign_gclid text,
    ecommerce_status_id text,
    ecommerce_status_label text,
    entry_title text,
    entry_url text,
    exit_title text,
    exit_url text,
    is_bounce text,
    local_hour text,
    second_title text,
    second_url text,
    timestamps text,
    total_abandoned_cart text,
    total_cart_addition text,
    total_cart_removal text,
    total_content_impression text,
    total_content_interaction text,
    total_custom_event text,
    total_download text,
    total_ecommerce_conversion text,
    total_event text,
    total_goal_conversion text,
    total_outlink text,
    total_page_view text,
    total_product_detail_view text,
    total_site_search text,
    total_time text,
    unique_content_impression text,
    unique_content_interaction text,
    unique_custom_event text,
    unique_download text,
    unique_outlink text,
    unique_page_view text,
    unique_searche text,
    user_id text,
    visitor_id text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE product_name (
    "index" text,
    event_id text,
    product_name text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_sku (
    "index" text,
    event_id text,
    product_sku text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_brand (
    "index" text,
    event_id text,
    product_sku text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_price (
    "index" text,
    event_id text,
    product_price text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_quantity (
    "index" text,
    event_id text,
    product_quantity text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_revenue (
    "index" text,
    event_id text,
    product_revenue text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_variant (
    "index" text,
    event_id text,
    product_variant text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_category (
    "index" text,
    event_id text,
    product_category text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_category_1 (
    "index" text,
    event_id text,
    product_category_1 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_category_2 (
    "index" text,
    event_id text,
    product_category_2 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_category_3 (
    "index" text,
    event_id text,
    product_category_3 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_category_4 (
    "index" text,
    event_id text,
    product_category_4 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_category_5 (
    "index" text,
    event_id text,
    product_category_5 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_1 (
    "index" text,
    event_id text,
    product_dimension_1 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_2 (
    "index" text,
    event_id text,
    product_dimension_2 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_3 (
    "index" text,
    event_id text,
    product_dimension_3 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_4 (
    "index" text,
    event_id text,
    product_dimension_4 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_5 (
    "index" text,
    event_id text,
    product_dimension_5 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_6 (
    "index" text,
    event_id text,
    product_dimension_6 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_7 (
    "index" text,
    event_id text,
    product_dimension_7 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_8 (
    "index" text,
    event_id text,
    product_dimension_8 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_9 (
    "index" text,
    event_id text,
    product_dimension_9 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_10 (
    "index" text,
    event_id text,
    product_dimension_10 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_11 (
    "index" text,
    event_id text,
    product_dimension_11 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_12 (
    "index" text,
    event_id text,
    product_dimension_12 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_13 (
    "index" text,
    event_id text,
    product_dimension_13 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_14 (
    "index" text,
    event_id text,
    product_dimension_14 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_15 (
    "index" text,
    event_id text,
    product_dimension_15 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_16 (
    "index" text,
    event_id text,
    product_dimension_16 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_17 (
    "index" text,
    event_id text,
    product_dimension_17 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_18 (
    "index" text,
    event_id text,
    product_dimension_18 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_19 (
    "index" text,
    event_id text,
    product_dimension_19 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE product_dimension_20 (
    "index" text,
    event_id text,
    product_dimension_20 text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event_product(event_id)
);

CREATE TABLE event_product (
    event_id text,
    session_id text,
    website_id text,
    product_count text,
    timestamps text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);

CREATE TABLE event_custom_events (
    event_id text,
    session_id text,
    website_id text,
    "action" text,
    category text,
    "name" text,
    timestamps text,
    "value" text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(session_id),
    FOREIGN KEY (website_id) REFERENCES app(id)
);
