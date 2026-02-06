-- NOTE
--   - SB - Sponsored Brands
--   - SD - Sponsored Display
--   - No prefix tables - Sponsored Products

CREATE TABLE sb_campaign_report (
    report_date text,
    campaign_id text,
    applicable_budget_rule_id text,
    attributed_branded_searches_14_d integer,
    attributed_conversions_14_d integer,
    attributed_conversions_14_d_same_sku integer,
    attributed_detail_page_views_clicks_14_d integer,
    attributed_order_rate_new_to_brand_14_d double precision,
    attributed_orders_new_to_brand_14_d integer,
    attributed_orders_new_to_brand_percentage_14_d double precision,
    attributed_sales_14_d double precision,
    attributed_sales_14_d_same_sku double precision,
    attributed_sales_new_to_brand_14_d double precision,
    attributed_sales_new_to_brand_percentage_14_d double precision,
    attributed_units_ordered_new_to_brand_14_d integer,
    attributed_units_ordered_new_to_brand_percentage_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    dpv_14_d integer,
    impressions integer,
    top_of_search_impression_share double precision,
    units_sold_14_d integer,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (report_date, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date),
    FOREIGN KEY (applicable_budget_rule_id) REFERENCES sb_budget_rule_history(last_updated_date)
);

CREATE TABLE sb_benchmark_brand_and_category (
    end_time text,
    start_time text,
    brand text,
    category_id text,
    -- acos_* (dynamic column),
    -- ctr_* (dynamic column),
    -- impressions_* (dynamic column),
    -- roas_* (dynamic column),
    PRIMARY KEY (end_time, start_time, brand, category_id),
    FOREIGN KEY (brand) REFERENCES sb_brand(_fivetran_id),
    FOREIGN KEY (category_id) REFERENCES sb_product_targeting_category(id)
);

CREATE TABLE sb_campaign_bid_adjustments_by_placement (
    placement text,
    campaign_id text,
    percentage integer,
    PRIMARY KEY (placement, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sd_brand_safety_history (
    domain_id text,
    last_modified timestamp,
    created_at timestamp,
    "name" text,
    "state" text,
    "type" text,
    PRIMARY KEY (domain_id, last_modified)
);

CREATE TABLE sb_store (
    id text,
    brand_entity_id text,
    store_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_entity_id) REFERENCES sb_brand(_fivetran_id)
);

CREATE TABLE negative_keyword_history (
    id text,
    last_updated_date timestamp,
    ad_group_id text,
    campaign_id text,
    creation_date timestamp,
    keyword_text text,
    match_type text,
    native_language_keyword text,
    native_language_locale text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_budget_rule_recurrence_day (
    day_of_week text,
    rule_id text,
    PRIMARY KEY (day_of_week, rule_id),
    FOREIGN KEY (rule_id) REFERENCES sb_budget_rule_history(last_updated_date)
);

CREATE TABLE product_ad_serving_status_detail (
    "name" text,
    product_ad_id text,
    help_url text,
    message text,
    PRIMARY KEY ("name", product_ad_id),
    FOREIGN KEY (product_ad_id) REFERENCES product_ad_history(last_updated_date)
);

CREATE TABLE sb_placement_report (
    placement text,
    report_date text,
    campaign_id text,
    applicable_budget_rule_id text,
    attributed_branded_searches_14_d integer,
    attributed_conversions_14_d integer,
    attributed_conversions_14_d_same_sku integer,
    attributed_detail_page_views_clicks_14_d integer,
    attributed_order_rate_new_to_brand_14_d double precision,
    attributed_orders_new_to_brand_14_d integer,
    attributed_orders_new_to_brand_percentage_14_d double precision,
    attributed_sales_14_d double precision,
    attributed_sales_14_d_same_sku double precision,
    attributed_sales_new_to_brand_14_d double precision,
    attributed_sales_new_to_brand_percentage_14_d double precision,
    attributed_units_ordered_new_to_brand_14_d integer,
    attributed_units_ordered_new_to_brand_percentage_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    dpv_14_d integer,
    impressions integer,
    units_sold_14_d integer,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (placement, report_date, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date),
    FOREIGN KEY (applicable_budget_rule_id) REFERENCES sb_budget_rule_history(last_updated_date)
);

CREATE TABLE sb_budget_recommendation (
    seven_days_end_date text,
    seven_days_start_date text,
    campaign_id text,
    seven_days_estimated_missed_clicks_lower integer,
    seven_days_estimated_missed_clicks_upper integer,
    seven_days_estimated_missed_impressions_lower integer,
    seven_days_estimated_missed_impressions_upper integer,
    seven_days_estimated_missed_sales_lower double precision,
    seven_days_estimated_missed_sales_upper double precision,
    seven_days_percent_time_in_budget double precision,
    suggested_budget double precision,
    PRIMARY KEY (seven_days_end_date, seven_days_start_date, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE ad_group_theme_based_bid_recommendation (
    _fivetran_id text,
    ad_group_id bigint,
    campaign_id bigint,
    profile_id bigint,
    estimated_impression_lower integer,
    estimated_impression_upper integer,
    targeting_type text,
    theme text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sb_ad_sub_page (
    asin text,
    url text,
    _fivetran_id text,
    page_title text,
    PRIMARY KEY (asin, url, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES sb_creative_history(_fivetran_id)
);

CREATE TABLE sd_negative_targeting_expression (
    _fivetran_id text,
    target_id text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (target_id) REFERENCES sd_negative_targeting_history(last_updated_date)
);

CREATE TABLE asin_bid_analysis (
    _fivetran_id text,
    profile_id bigint,
    asin text,
    bid double precision,
    estimated_impression_avg integer,
    estimated_impression_lower integer,
    estimated_impression_upper integer,
    placement text,
    strategy text,
    targeting_type text,
    theme text,
    type_of_bid text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sb_negative_product_target_expression (
    "type" text,
    target_id text,
    "value" text,
    PRIMARY KEY ("type", target_id),
    FOREIGN KEY (target_id) REFERENCES sb_product_target(id)
);

CREATE TABLE sd_product_ad_report (
    "date" text,
    ad_id text,
    ad_group_id text,
    campaign_id text,
    add_to_cart integer,
    add_to_cart_clicks integer,
    add_to_cart_rate double precision,
    add_to_cart_views integer,
    add_to_list integer,
    add_to_list_from_clicks integer,
    add_to_list_from_views integer,
    bid_optimization text,
    branded_search_rate double precision,
    branded_searches integer,
    branded_searches_clicks integer,
    branded_searches_views integer,
    campaign_budget_currency_code text,
    clicks integer,
    cost double precision,
    cumulative_reach integer,
    detail_page_views integer,
    detail_page_views_clicks integer,
    e_cpadd_to_cart double precision,
    e_cpbrand_search double precision,
    impressions integer,
    impressions_frequency_average double precision,
    impressions_views integer,
    lead_form_opens integer,
    leads integer,
    link_outs integer,
    new_to_brand_detail_page_view_clicks integer,
    new_to_brand_detail_page_view_rate double precision,
    new_to_brand_detail_page_view_views integer,
    new_to_brand_detail_page_views integer,
    new_to_brand_ecpdetail_page_view double precision,
    new_to_brand_purchases integer,
    new_to_brand_purchases_clicks integer,
    new_to_brand_sales double precision,
    new_to_brand_sales_clicks double precision,
    new_to_brand_units_sold integer,
    new_to_brand_units_sold_clicks integer,
    purchases integer,
    purchases_clicks integer,
    purchases_promoted_clicks integer,
    qualified_borrows integer,
    qualified_borrows_from_clicks integer,
    qualified_borrows_from_views integer,
    royalty_qualified_borrows integer,
    royalty_qualified_borrows_from_clicks integer,
    royalty_qualified_borrows_from_views integer,
    sales double precision,
    sales_clicks double precision,
    sales_promoted_clicks double precision,
    units_sold integer,
    units_sold_clicks integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    view_click_through_rate double precision,
    viewability_rate double precision,
    PRIMARY KEY ("date", ad_id),
    FOREIGN KEY (ad_id) REFERENCES sd_product_ad_history(last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE sb_campaign_violation_policy (
    _fivetran_id text,
    campaign_id text,
    policy_description text,
    policy_link_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_product_target_resolved_expression (
    "type" text,
    target_id text,
    "value" text,
    PRIMARY KEY ("type", target_id),
    FOREIGN KEY (target_id) REFERENCES sb_product_target(id)
);

CREATE TABLE sb_target_report (
    report_date text,
    target_id text,
    ad_group_id text,
    campaign_id text,
    attributed_branded_searches_14_d integer,
    attributed_conversions_14_d integer,
    attributed_conversions_14_d_same_sku integer,
    attributed_detail_page_views_clicks_14_d integer,
    attributed_order_rate_new_to_brand_14_d double precision,
    attributed_orders_new_to_brand_14_d integer,
    attributed_orders_new_to_brand_percentage_14_d double precision,
    attributed_sales_14_d double precision,
    attributed_sales_14_d_same_sku double precision,
    attributed_sales_new_to_brand_14_d double precision,
    attributed_sales_new_to_brand_percentage_14_d double precision,
    attributed_units_ordered_new_to_brand_14_d integer,
    attributed_units_ordered_new_to_brand_percentage_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    dpv_14_d integer,
    impressions integer,
    targeting_expression text,
    targeting_text text,
    targeting_type text,
    top_of_search_impression_share double precision,
    units_sold_14_d integer,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (report_date, target_id),
    FOREIGN KEY (target_id) REFERENCES sb_product_target(id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_campaign_tag (
    tag_name text,
    campaign_id text,
    "value" text,
    PRIMARY KEY (tag_name, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_campaign_violation_image_content (
    _fivetran_id text,
    _fivetran_violation_policy_id text,
    moderated_component text,
    reviewed_image_url text,
    PRIMARY KEY (_fivetran_id, _fivetran_violation_policy_id),
    FOREIGN KEY (_fivetran_violation_policy_id) REFERENCES sb_campaign_violation_policy(_fivetran_id)
);

CREATE TABLE campaign_tag (
    campaign_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (campaign_id, "name")
);

CREATE TABLE asin_suggested_keyword (
    _fivetran_id text,
    asin text,
    keyword_text text,
    match_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE sd_creative (
    id text,
    ad_group_id text,
    creative_type text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date)
);

CREATE TABLE sb_budget_usage_history (
    usage_updated_timestamp timestamp,
    campaign_id text,
    budget double precision,
    budget_usage_percent double precision,
    PRIMARY KEY (usage_updated_timestamp, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sd_targeting_history (
    id text,
    last_updated_date timestamp,
    ad_group_id text,
    creation_date timestamp,
    expression_type text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date)
);

CREATE TABLE campaign_negative_keyword_history (
    id text,
    last_updated_date timestamp,
    campaign_id text,
    creation_date timestamp,
    keyword_text text,
    match_type text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sd_brand_safety_status_history (
    request_id text,
    domain_id text,
    details text,
    "status" text,
    PRIMARY KEY (request_id),
    FOREIGN KEY (domain_id) REFERENCES sd_brand_safety_history(domain_id)
);

CREATE TABLE sb_search_term_report (
    query_term text,
    report_date text,
    keyword_id text,
    ad_group_id text,
    campaign_id text,
    attributed_conversions_14_d integer,
    attributed_sales_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    impressions integer,
    search_term_impression_rank integer,
    search_term_impression_share double precision,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (query_term, report_date, keyword_id),
    FOREIGN KEY (keyword_id) REFERENCES sb_keyword(id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE purchased_product_targeting_report (
    "date" text,
    purchased_asin text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_id bigint,
    add_to_list integer,
    advertised_asin text,
    advertised_sku text,
    campaign_budget_currency_code text,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    match_type text,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_other_sku_14_d integer,
    purchases_other_sku_1_d integer,
    purchases_other_sku_30_d integer,
    purchases_other_sku_7_d integer,
    qualified_borrows integer,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_14_d double precision,
    sales_other_sku_1_d double precision,
    sales_other_sku_30_d double precision,
    sales_other_sku_7_d double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_14_d integer,
    units_sold_other_sku_1_d integer,
    units_sold_other_sku_30_d integer,
    units_sold_other_sku_7_d integer,
    PRIMARY KEY ("date", purchased_asin, ad_group_id, campaign_id, keyword_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE sb_budget_rule_campaign (
    campaign_id text,
    rule_id text,
    PRIMARY KEY (campaign_id, rule_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date),
    FOREIGN KEY (rule_id) REFERENCES sb_budget_rule_history(last_updated_date)
);

CREATE TABLE negative_targeting_clause_history (
    last_updated_date timestamp,
    target_id text,
    ad_group_id text,
    campaign_id text,
    creation_date timestamp,
    expression_type text,
    serving_status text,
    "state" text,
    PRIMARY KEY (last_updated_date, target_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE targeting_keyword_report (
    "date" text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_id bigint,
    acos_clicks_14_d double precision,
    acos_clicks_7_d double precision,
    ad_keyword_status text,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    campaign_budget_type text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions integer,
    keyword_bid double precision,
    keyword_type text,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    match_type text,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    roas_clicks_14_d double precision,
    roas_clicks_7_d double precision,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_7_d bigint,
    targeting text,
    top_of_search_impression_share double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", ad_group_id, campaign_id, keyword_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE sb_ad_landing_page_asin (
    asin text,
    ad_id text,
    PRIMARY KEY (asin, ad_id),
    FOREIGN KEY (ad_id) REFERENCES sb_ad_history(last_update_date)
);

CREATE TABLE campaign_serving_status_detail (
    "name" text,
    campaign_id text,
    help_url text,
    message text,
    PRIMARY KEY ("name", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE profile (
    id bigint,
    country_code text,
    currency_code text,
    daily_budget bigint,
    timezone text,
    -- account_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE sb_keyword_recommendation_url (
    id text,
    url text,
    match_type text,
    search_term_impression_rank double precision,
    search_term_impression_share double precision,
    translation text,
    "type" text,
    url_type text,
    "value" text,
    PRIMARY KEY (id, url)
);

CREATE TABLE sb_campaign_bid_adjustment (
    bid_adjustment_predicate text,
    campaign_draft_id text,
    bid_adjustment_percent double precision,
    PRIMARY KEY (bid_adjustment_predicate, campaign_draft_id),
    FOREIGN KEY (campaign_draft_id) REFERENCES sb_campaign_draft(id)
);

CREATE TABLE sb_campaign_violation_text_content (
    _fivetran_id text,
    _fivetran_violation_policy_id text,
    moderated_component text,
    reviewed_text text,
    PRIMARY KEY (_fivetran_id, _fivetran_violation_policy_id),
    FOREIGN KEY (_fivetran_violation_policy_id) REFERENCES sb_campaign_violation_policy(_fivetran_id)
);

CREATE TABLE sd_product_ad_history (
    id text,
    last_updated_date timestamp,
    ad_group_id text,
    campaign_id text,
    ad_name text,
    asin text,
    creation_date timestamp,
    landing_page_type text,
    landing_page_url text,
    serving_status text,
    sku text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE sd_creative_moderation (
    moderation_status text,
    creative_id text,
    eta_for_moderation text,
    PRIMARY KEY (moderation_status, creative_id),
    FOREIGN KEY (creative_id) REFERENCES sd_creative(id)
);

CREATE TABLE campaign_placement_report (
    "date" text,
    placement text,
    campaign_id bigint,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_bidding_strategy text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions bigint,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    spend double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", placement, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_targeting_recommendation_category (
    id text,
    asin text,
    estimated_reach text,
    is_targetable text,
    "name" text,
    "path" text,
    supply_source text,
    translated_name text,
    translated_path text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES sb_product_targeting_category(id)
);

CREATE TABLE sb_keyword (
    id text,
    ad_group_id text,
    campaign_id text,
    bid double precision,
    keyword_text text,
    match_type text,
    native_language_keyword text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sd_target_report (
    "date" text,
    ad_group_id text,
    campaign_id text,
    targeting_id text,
    ad_keyword_status text,
    add_to_cart integer,
    add_to_cart_clicks integer,
    add_to_cart_rate double precision,
    add_to_cart_views integer,
    add_to_list integer,
    add_to_list_from_clicks integer,
    add_to_list_from_views integer,
    branded_search_rate double precision,
    branded_searches integer,
    branded_searches_clicks integer,
    branded_searches_views integer,
    campaign_budget_currency_code text,
    clicks integer,
    cost double precision,
    detail_page_views integer,
    detail_page_views_clicks integer,
    e_cpadd_to_cart double precision,
    e_cpbrand_search double precision,
    impressions integer,
    impressions_views integer,
    lead_form_opens integer,
    leads integer,
    link_outs integer,
    new_to_brand_detail_page_view_clicks integer,
    new_to_brand_detail_page_view_rate double precision,
    new_to_brand_detail_page_view_views integer,
    new_to_brand_detail_page_views integer,
    new_to_brand_ecpdetail_page_view double precision,
    new_to_brand_purchases integer,
    new_to_brand_purchases_clicks integer,
    new_to_brand_sales double precision,
    new_to_brand_sales_clicks double precision,
    new_to_brand_units_sold integer,
    new_to_brand_units_sold_clicks integer,
    purchases integer,
    purchases_clicks integer,
    purchases_promoted_clicks integer,
    qualified_borrows integer,
    qualified_borrows_from_clicks integer,
    qualified_borrows_from_views integer,
    royalty_qualified_borrows integer,
    royalty_qualified_borrows_from_clicks integer,
    royalty_qualified_borrows_from_views integer,
    sales double precision,
    sales_clicks double precision,
    sales_promoted_clicks double precision,
    targeting_expression text,
    targeting_text text,
    units_sold integer,
    units_sold_clicks integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    view_click_through_rate double precision,
    viewability_rate double precision,
    PRIMARY KEY ("date", ad_group_id, campaign_id, targeting_id),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date),
    FOREIGN KEY (targeting_id) REFERENCES sd_targeting_history(last_updated_date)
);

CREATE TABLE keyword_serving_status_detail (
    "name" text,
    keyword_id text,
    help_url text,
    message text,
    PRIMARY KEY ("name", keyword_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE search_term_targeting_report (
    "date" text,
    search_term text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_id bigint,
    acos_clicks_14_d double precision,
    acos_clicks_7_d double precision,
    ad_keyword_status text,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    campaign_budget_type text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions integer,
    keyword_bid double precision,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    roas_clicks_14_d double precision,
    roas_clicks_7_d double precision,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_7_d bigint,
    targeting text,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", search_term, ad_group_id, campaign_id, keyword_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE sb_keyword_report (
    report_date text,
    keyword_id text,
    ad_group_id text,
    applicable_budget_rule_id text,
    campaign_id text,
    attributed_branded_searches_14_d integer,
    attributed_conversions_14_d integer,
    attributed_conversions_14_d_same_sku integer,
    attributed_detail_page_views_clicks_14_d integer,
    attributed_order_rate_new_to_brand_14_d double precision,
    attributed_orders_new_to_brand_14_d integer,
    attributed_orders_new_to_brand_percentage_14_d double precision,
    attributed_sales_14_d double precision,
    attributed_sales_14_d_same_sku double precision,
    attributed_sales_new_to_brand_14_d double precision,
    attributed_sales_new_to_brand_percentage_14_d double precision,
    attributed_units_ordered_new_to_brand_14_d integer,
    attributed_units_ordered_new_to_brand_percentage_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    dpv_14_d integer,
    impressions integer,
    search_term_impression_rank integer,
    search_term_impression_share double precision,
    top_of_search_impression_share double precision,
    units_sold_14_d integer,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (report_date, keyword_id),
    FOREIGN KEY (keyword_id) REFERENCES sb_keyword(id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (applicable_budget_rule_id) REFERENCES sb_budget_rule_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sd_purchased_products_reports (
    asin_brand_halo text,
    "date" text,
    promoted_asin text,
    promoted_sku text,
    ad_group_id text,
    campaign_id text,
    add_to_list integer,
    add_to_list_from_clicks integer,
    add_to_list_from_views integer,
    campaign_budget_currency_code text,
    conversions_brand_halo integer,
    conversions_brand_halo_clicks integer,
    qualified_borrows integer,
    qualified_borrows_from_clicks integer,
    qualified_borrows_from_views integer,
    royalty_qualified_borrows integer,
    royalty_qualified_borrows_from_clicks integer,
    royalty_qualified_borrows_from_views integer,
    sales_brand_halo double precision,
    sales_brand_halo_clicks double precision,
    units_sold_brand_halo integer,
    units_sold_brand_halo_clicks integer,
    PRIMARY KEY (asin_brand_halo, "date", promoted_asin, promoted_sku, ad_group_id, campaign_id),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE sd_targeting_expression (
    _fivetran_id text,
    target_id text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (target_id) REFERENCES sd_targeting_history(last_updated_date)
);

CREATE TABLE sd_campaign_report (
    "date" text,
    campaign_id text,
    add_to_cart integer,
    add_to_cart_clicks integer,
    add_to_cart_rate double precision,
    add_to_cart_views integer,
    add_to_list integer,
    add_to_list_from_clicks integer,
    add_to_list_from_views integer,
    branded_search_rate double precision,
    branded_searches integer,
    branded_searches_clicks integer,
    branded_searches_views integer,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    clicks integer,
    cost double precision,
    cost_type text,
    cumulative_reach integer,
    detail_page_views integer,
    detail_page_views_clicks integer,
    e_cpadd_to_cart double precision,
    e_cpbrand_search double precision,
    impressions integer,
    impressions_frequency_average double precision,
    impressions_views integer,
    lead_form_opens integer,
    leads integer,
    link_outs integer,
    new_to_brand_detail_page_view_clicks integer,
    new_to_brand_detail_page_view_rate double precision,
    new_to_brand_detail_page_view_views integer,
    new_to_brand_detail_page_views integer,
    new_to_brand_ecpdetail_page_view double precision,
    new_to_brand_purchases integer,
    new_to_brand_purchases_clicks integer,
    new_to_brand_sales double precision,
    new_to_brand_sales_clicks double precision,
    new_to_brand_units_sold integer,
    new_to_brand_units_sold_clicks integer,
    purchases integer,
    purchases_clicks integer,
    purchases_promoted_clicks integer,
    qualified_borrows integer,
    qualified_borrows_from_clicks integer,
    qualified_borrows_from_views integer,
    royalty_qualified_borrows integer,
    royalty_qualified_borrows_from_clicks integer,
    royalty_qualified_borrows_from_views integer,
    sales double precision,
    sales_clicks double precision,
    sales_promoted_clicks double precision,
    units_sold integer,
    units_sold_clicks integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    view_click_through_rate double precision,
    viewability_rate double precision,
    PRIMARY KEY ("date", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE product_ad_history (
    id text,
    last_updated_date timestamp,
    ad_group_id text,
    campaign_id text,
    asin text,
    creation_date timestamp,
    custom_text text,
    serving_status text,
    sku text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_keyword_recommendation_asin (
    asin text,
    id text,
    match_type text,
    search_term_impression_rank double precision,
    search_term_impression_share double precision,
    translation text,
    "type" text,
    "value" text,
    PRIMARY KEY (asin, id)
);

CREATE TABLE sb_creative_video_asset (
    id text,
    _fivetran_id text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES sb_creative_history(_fivetran_id)
);

CREATE TABLE sd_budget_usage_history (
    usage_updated_timestamp timestamp,
    campaign_id text,
    budget double precision,
    budget_usage_percent double precision,
    PRIMARY KEY (usage_updated_timestamp, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE budget_rule_campaign (
    campaign_id bigint,
    rule_id text,
    PRIMARY KEY (campaign_id, rule_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (rule_id) REFERENCES budget_rule(id)
);

CREATE TABLE sb_campaign_bid_adjustments_by_shopper_segment (
    shopper_segment text,
    campaign_id text,
    percentage integer,
    PRIMARY KEY (shopper_segment, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE targeting_clause_history (
    last_updated_date timestamp,
    target_id text,
    ad_group_id text,
    campaign_id text,
    bid double precision,
    creation_date timestamp,
    expression_type text,
    serving_status text,
    "state" text,
    PRIMARY KEY (last_updated_date, target_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_product_target_expression (
    "type" text,
    target_id text,
    "value" text,
    PRIMARY KEY ("type", target_id),
    FOREIGN KEY (target_id) REFERENCES sb_product_target(id)
);

CREATE TABLE sb_campaign_draft (
    id text,
    ad_format text,
    bid_multiplier integer,
    bid_optimization boolean,
    bid_optimization_strategy text,
    budget double precision,
    budget_type text,
    end_date text,
    landing_page_page_type text,
    landing_page_url text,
    "name" text,
    portfolio_id text,
    start_date text,
    tags jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE sb_campaign_history (
    id text,
    last_update_date timestamp,
    brand_entity_id text,
    portfolio_id text,
    profile_id bigint,
    bid_optimization boolean,
    bid_optimization_strategy text,
    budget double precision,
    budget_type text,
    cost_type text,
    creation_date timestamp,
    end_date text,
    goal text,
    is_multi_ad_groups_enabled boolean,
    "name" text,
    outcome text,
    product_location text,
    serving_status text,
    start_date text,
    "state" text,
    -- rule_based_budget_* (dynamic column),
    PRIMARY KEY (id, last_update_date),
    FOREIGN KEY (brand_entity_id) REFERENCES sb_brand(_fivetran_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio_history(last_updated_date),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sb_targeting_recommendation_product (
    asin text,
    recommended_target_asin text,
    PRIMARY KEY (asin)
);

CREATE TABLE ad_group_bid_recommendation_value (
    "index" integer,
    parent_id text,
    suggested_bid double precision,
    PRIMARY KEY ("index", parent_id),
    FOREIGN KEY (parent_id) REFERENCES ad_group_theme_based_bid_recommendation(_fivetran_id)
);

CREATE TABLE sb_creative_custom_image (
    asset_id text,
    _fivetran_id text,
    url text,
    -- crop_* (dynamic column),
    PRIMARY KEY (asset_id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES sb_creative_history(_fivetran_id)
);

CREATE TABLE campaign_level_report (
    "date" text,
    campaign_id bigint,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_applicable_budget_rule_id text,
    campaign_applicable_budget_rule_name text,
    campaign_bidding_strategy text,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    campaign_budget_type text,
    campaign_rule_based_budget_amount double precision,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions bigint,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    spend double precision,
    top_of_search_impression_share double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_product_targeting_category (
    id text,
    asin_count_range_max integer,
    asin_count_range_min integer,
    estimated_reach_max integer,
    estimated_reach_min integer,
    is_targetable boolean,
    "name" text,
    parent_category_refinement_id text,
    supply_source text,
    translated_name text,
    PRIMARY KEY (id)
);

CREATE TABLE portfolio_history (
    id bigint,
    last_updated_date timestamp,
    profile_id bigint,
    creation_date timestamp,
    in_budget boolean,
    "name" text,
    serving_status text,
    "state" text,
    -- budget_* (dynamic column),
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE budget_rule (
    id text,
    budget_increase_by_type text,
    budget_increase_by_value double precision,
    created_date timestamp,
    date_range_type_duration_end_date text,
    date_range_type_duration_start_date text,
    event_type_duration_end_date text,
    event_type_duration_event_id text,
    event_type_duration_event_name text,
    event_type_duration_start_date text,
    last_updated_date timestamp,
    "name" text,
    performance_measure_comparison_operator text,
    performance_measure_metric_name text,
    performance_measure_threshold double precision,
    recurrence_type text,
    "state" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE sd_ad_group_report (
    "date" text,
    ad_group_id text,
    campaign_id text,
    add_to_cart integer,
    add_to_cart_clicks integer,
    add_to_cart_rate double precision,
    add_to_cart_views integer,
    add_to_list integer,
    add_to_list_from_clicks integer,
    add_to_list_from_views integer,
    bid_optimization text,
    branded_search_rate double precision,
    branded_searches integer,
    branded_searches_clicks integer,
    branded_searches_views integer,
    campaign_budget_currency_code text,
    clicks integer,
    cost double precision,
    cumulative_reach integer,
    detail_page_views integer,
    detail_page_views_clicks integer,
    e_cpadd_to_cart double precision,
    e_cpbrand_search double precision,
    impressions integer,
    impressions_frequency_average double precision,
    impressions_views integer,
    lead_form_opens integer,
    leads integer,
    link_outs integer,
    new_to_brand_detail_page_view_clicks integer,
    new_to_brand_detail_page_view_rate double precision,
    new_to_brand_detail_page_view_views integer,
    new_to_brand_detail_page_views integer,
    new_to_brand_ecpdetail_page_view double precision,
    new_to_brand_purchases integer,
    new_to_brand_purchases_clicks integer,
    new_to_brand_sales double precision,
    new_to_brand_sales_clicks double precision,
    new_to_brand_units_sold integer,
    new_to_brand_units_sold_clicks integer,
    purchases integer,
    purchases_clicks integer,
    purchases_promoted_clicks integer,
    qualified_borrows integer,
    qualified_borrows_from_clicks integer,
    qualified_borrows_from_views integer,
    royalty_qualified_borrows integer,
    royalty_qualified_borrows_from_clicks integer,
    royalty_qualified_borrows_from_views integer,
    sales double precision,
    sales_clicks double precision,
    sales_promoted_clicks double precision,
    units_sold integer,
    units_sold_clicks integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    view_click_through_rate double precision,
    viewability_rate double precision,
    PRIMARY KEY ("date", ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE ad_group_level_report (
    "date" text,
    ad_group_id bigint,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_bidding_strategy text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions bigint,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    spend double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date)
);

CREATE TABLE advertised_product_report (
    "date" text,
    ad_group_id bigint,
    ad_id bigint,
    campaign_id bigint,
    acos_clicks_14_d double precision,
    acos_clicks_7_d double precision,
    add_to_list integer,
    advertised_asin text,
    advertised_sku text,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    campaign_budget_type text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions integer,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    roas_clicks_14_d double precision,
    roas_clicks_7_d double precision,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_7_d bigint,
    spend double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", ad_group_id, ad_id, campaign_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (ad_id) REFERENCES product_ad_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE asin_bid_recommendation_value (
    "index" integer,
    parent_id text,
    suggested_bid double precision,
    PRIMARY KEY ("index", parent_id),
    FOREIGN KEY (parent_id) REFERENCES asin_theme_based_bid_recommendation(_fivetran_id)
);

CREATE TABLE sd_budget_rule_history (
    id text,
    last_updated_date timestamp,
    campaign_id text,
    created_date timestamp,
    rule_state text,
    rule_status text,
    -- rule_detail_* (dynamic column),
    PRIMARY KEY (id, last_updated_date, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE sd_matched_target_report (
    "date" text,
    matched_target_asin text,
    ad_group_id text,
    campaign_id text,
    targeting_id text,
    add_to_cart integer,
    add_to_cart_clicks integer,
    add_to_cart_rate double precision,
    add_to_cart_views integer,
    add_to_list integer,
    add_to_list_from_clicks integer,
    add_to_list_from_views integer,
    branded_search_rate double precision,
    branded_searches integer,
    branded_searches_clicks integer,
    branded_searches_views integer,
    campaign_budget_currency_code text,
    clicks integer,
    cost double precision,
    detail_page_views integer,
    detail_page_views_clicks integer,
    e_cpadd_to_cart double precision,
    e_cpbrand_search double precision,
    impressions integer,
    impressions_views integer,
    lead_form_opens integer,
    leads integer,
    link_outs integer,
    new_to_brand_purchases integer,
    new_to_brand_purchases_clicks integer,
    new_to_brand_sales double precision,
    new_to_brand_sales_clicks double precision,
    new_to_brand_units_sold integer,
    new_to_brand_units_sold_clicks integer,
    purchases integer,
    purchases_clicks integer,
    purchases_promoted_clicks integer,
    qualified_borrows integer,
    qualified_borrows_from_clicks integer,
    qualified_borrows_from_views integer,
    royalty_qualified_borrows integer,
    royalty_qualified_borrows_from_clicks integer,
    royalty_qualified_borrows_from_views integer,
    sales double precision,
    sales_clicks double precision,
    sales_promoted_clicks double precision,
    targeting_expression text,
    targeting_text text,
    units_sold integer,
    units_sold_clicks integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    view_click_through_rate double precision,
    viewability_rate double precision,
    PRIMARY KEY ("date", matched_target_asin, ad_group_id, campaign_id, targeting_id),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date),
    FOREIGN KEY (targeting_id) REFERENCES sd_targeting_history(last_updated_date)
);

CREATE TABLE campaign_placement_bidding (
    placement text,
    campaign_id text,
    percentage integer,
    PRIMARY KEY (placement, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_negative_keyword (
    id text,
    ad_group_id text,
    campaign_id text,
    keyword_text text,
    match_type text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sd_negative_targeting_history (
    id text,
    last_updated_date timestamp,
    ad_group_id text,
    creation_date timestamp,
    expression_type text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES sd_ad_group_history(last_updated_date)
);

CREATE TABLE sb_ad_group_history (
    id text,
    last_update_date timestamp,
    campaign_id text,
    creation_date timestamp,
    "name" text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_brand (
    _fivetran_id text,
    brand_entity_id text,
    brand_id text,
    brand_registry_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE sd_campaign_history (
    id text,
    last_updated_date timestamp,
    portfolio_id text,
    profile_id bigint,
    budget double precision,
    budget_type text,
    cost_type text,
    creation_date timestamp,
    end_date text,
    "name" text,
    serving_status text,
    start_date text,
    "state" text,
    tactic text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio_history(last_updated_date),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sd_targeting_resolved_expression (
    _fivetran_id text,
    target_id text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (target_id) REFERENCES sd_targeting_history(last_updated_date)
);

CREATE TABLE sd_targeting_recommendation_product (
    asin text,
    target_asin text,
    rank bigint,
    PRIMARY KEY (asin, target_asin)
);

CREATE TABLE sb_campaign_draft_subpage (
    asin text,
    campaign_draft_id text,
    page_title text,
    url text,
    PRIMARY KEY (asin, campaign_draft_id),
    FOREIGN KEY (campaign_draft_id) REFERENCES sb_campaign_draft(id)
);

CREATE TABLE sd_targeting_recommendation_audience (
    audience text,
    target_asin text,
    category text,
    "name" text,
    rank bigint,
    PRIMARY KEY (audience, target_asin)
);

CREATE TABLE search_term_ad_keyword_report (
    "date" text,
    search_term text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_id bigint,
    acos_clicks_14_d double precision,
    acos_clicks_7_d double precision,
    ad_keyword_status text,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    campaign_budget_type text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions integer,
    keyword_bid double precision,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    roas_clicks_14_d double precision,
    roas_clicks_7_d double precision,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_7_d bigint,
    targeting text,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", search_term, ad_group_id, campaign_id, keyword_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE sb_negative_product_target (
    id text,
    ad_group_id text,
    campaign_id text,
    bid double precision,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_campaign_violation_text_evidence (
    violating_text text,
    _fivetran_violation_text_content_id text,
    text_position_end integer,
    text_position_start integer,
    PRIMARY KEY (violating_text, _fivetran_violation_text_content_id),
    FOREIGN KEY (_fivetran_violation_text_content_id) REFERENCES sb_campaign_violation_text_content(_fivetran_id)
);

CREATE TABLE ad_group_history (
    id text,
    last_updated_date timestamp,
    campaign_id text,
    creation_date timestamp,
    default_bid double precision,
    "name" text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE campaign_history (
    id text,
    last_updated_date timestamp,
    portfolio_id text,
    profile_id bigint,
    bidding_strategy text,
    budget double precision,
    budget_type text,
    creation_date timestamp,
    effective_budget double precision,
    end_date text,
    "name" text,
    serving_status text,
    start_date text,
    "state" text,
    targeting_type text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio_history(last_updated_date),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sb_campaign_violation_asin_content (
    _fivetran_id text,
    _fivetran_violation_policy_id text,
    moderated_component text,
    PRIMARY KEY (_fivetran_id, _fivetran_violation_policy_id),
    FOREIGN KEY (_fivetran_violation_policy_id) REFERENCES sb_campaign_violation_policy(_fivetran_id)
);

CREATE TABLE sb_budget_rule_recommendation (
    event_id text,
    campaign_id text,
    end_date text,
    event_name text,
    start_date text,
    suggested_budget_increase_percent integer,
    PRIMARY KEY (event_id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE asin_theme_based_bid_recommendation (
    _fivetran_id text,
    profile_id bigint,
    asin text,
    estimated_impression_lower integer,
    estimated_impression_upper integer,
    strategy text,
    targeting_type text,
    theme text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sb_campaign_draft_video_media (
    campaign_draft_id text,
    id text,
    PRIMARY KEY (campaign_draft_id),
    FOREIGN KEY (campaign_draft_id) REFERENCES sb_campaign_draft(id)
);

CREATE TABLE sb_ad_group_report (
    report_date text,
    ad_group_id bigint,
    campaign_id text,
    attributed_branded_searches_14_d integer,
    attributed_conversions_14_d integer,
    attributed_conversions_14_d_same_sku integer,
    attributed_detail_page_views_clicks_14_d integer,
    attributed_order_rate_new_to_brand_14_d double precision,
    attributed_orders_new_to_brand_14_d integer,
    attributed_orders_new_to_brand_percentage_14_d double precision,
    attributed_sales_14_d double precision,
    attributed_sales_14_d_same_sku double precision,
    attributed_sales_new_to_brand_14_d double precision,
    attributed_sales_new_to_brand_percentage_14_d double precision,
    attributed_units_ordered_new_to_brand_14_d integer,
    attributed_units_ordered_new_to_brand_percentage_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    dpv_14_d integer,
    impressions integer,
    units_sold_14_d integer,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (report_date, ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_store_page_info (
    store_page_id text,
    store_id text,
    store_page_name text,
    store_page_url text,
    PRIMARY KEY (store_page_id, store_id),
    FOREIGN KEY (store_id) REFERENCES sb_store(id)
);

CREATE TABLE sb_creative_original_video_asset (
    id text,
    _fivetran_id text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES sb_creative_history(_fivetran_id)
);

CREATE TABLE sd_bid_recommendation (
    asin text,
    target_id text,
    bid_optimization text,
    cost_type text,
    range_lower double precision,
    range_upper double precision,
    recommended double precision,
    PRIMARY KEY (asin, target_id),
    FOREIGN KEY (target_id) REFERENCES sd_targeting_history(last_updated_date)
);

CREATE TABLE sd_negative_targeting_resolved_expression (
    _fivetran_id text,
    target_id text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (target_id) REFERENCES sd_negative_targeting_history(last_updated_date)
);

CREATE TABLE sb_campaign_violation_asin_evidence (
    asin text,
    _fivetran_violation_asin_content_id text,
    PRIMARY KEY (asin, _fivetran_violation_asin_content_id),
    FOREIGN KEY (_fivetran_violation_asin_content_id) REFERENCES sb_campaign_violation_asin_content(_fivetran_id)
);

CREATE TABLE sb_purchased_product (
    _fivetran_id text,
    "date" text,
    ad_group_id text,
    campaign_id text,
    attribution_type text,
    campaign_budget_currency_code text,
    new_to_brand_purchases_14_d integer,
    new_to_brand_purchases_percentage_14_d double precision,
    new_to_brand_sales_14_d double precision,
    new_to_brand_sales_percentage_14_d double precision,
    new_to_brand_units_sold_14_d integer,
    new_to_brand_units_sold_percentage_14_d double precision,
    orders_14_d integer,
    product_category text,
    product_name text,
    purchased_asin text,
    sales_14_d double precision,
    units_sold_14_d integer,
    PRIMARY KEY (_fivetran_id, "date"),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sd_targeting_recommendation_category (
    category text,
    tactic text,
    target_asin text,
    "name" text,
    rank bigint,
    targetable_asin_count_range_lower bigint,
    targetable_asin_count_range_upper bigint,
    translated_name text,
    PRIMARY KEY (category, tactic, target_asin)
);

CREATE TABLE budget_rule_recurrence_day (
    day_of_week text,
    rule_id text,
    PRIMARY KEY (day_of_week, rule_id),
    FOREIGN KEY (rule_id) REFERENCES budget_rule(id)
);

CREATE TABLE ad_group_bid_analysis (
    _fivetran_id text,
    ad_group_id bigint,
    campaign_id bigint,
    profile_id bigint,
    bid double precision,
    estimated_impression_avg integer,
    estimated_impression_lower integer,
    estimated_impression_upper integer,
    placement text,
    targeting_type text,
    theme text,
    type_of_bid text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE sb_targeting_recommendation_brand_category (
    category_id text,
    id text,
    "name" text,
    PRIMARY KEY (category_id),
    FOREIGN KEY (category_id) REFERENCES sb_product_targeting_category(id),
    FOREIGN KEY (id) REFERENCES sb_brand(_fivetran_id)
);

CREATE TABLE sb_negative_product_target_resolved_expression (
    "type" text,
    target_id text,
    "value" text,
    PRIMARY KEY ("type", target_id),
    FOREIGN KEY (target_id) REFERENCES sb_product_target(id)
);

CREATE TABLE sb_product_target (
    id text,
    ad_group_id text,
    campaign_id text,
    bid double precision,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE targeting_report (
    "date" text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_id bigint,
    acos_clicks_14_d double precision,
    acos_clicks_7_d double precision,
    ad_keyword_status text,
    add_to_list integer,
    attributed_sales_same_sku_14_d double precision,
    attributed_sales_same_sku_1_d double precision,
    attributed_sales_same_sku_30_d double precision,
    attributed_sales_same_sku_7_d double precision,
    campaign_budget_amount double precision,
    campaign_budget_currency_code text,
    campaign_budget_type text,
    click_through_rate double precision,
    clicks integer,
    cost double precision,
    cost_per_click double precision,
    impressions integer,
    keyword_bid double precision,
    keyword_type text,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    match_type text,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_same_sku_14_d integer,
    purchases_same_sku_1_d integer,
    purchases_same_sku_30_d integer,
    purchases_same_sku_7_d integer,
    qualified_borrows integer,
    roas_clicks_14_d double precision,
    roas_clicks_7_d double precision,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_7_d bigint,
    targeting text,
    top_of_search_impression_share double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_7_d integer,
    units_sold_same_sku_14_d integer,
    units_sold_same_sku_1_d integer,
    units_sold_same_sku_30_d integer,
    units_sold_same_sku_7_d integer,
    PRIMARY KEY ("date", ad_group_id, campaign_id, keyword_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE sb_budget_rule_history (
    id text,
    last_updated_date timestamp,
    budget_increase_by_type text,
    budget_increase_by_value double precision,
    created_date timestamp,
    date_range_type_duration_end_date text,
    date_range_type_duration_start_date text,
    event_type_rule_duration_end_date text,
    event_type_rule_duration_event_id text,
    event_type_rule_duration_event_name text,
    event_type_rule_duration_start_date text,
    performance_measure_condition_comparison_operator text,
    performance_measure_condition_metric_name text,
    performance_measure_condition_threshold double precision,
    recurrence_type text,
    rule_state text,
    rule_status text,
    rule_type text,
    PRIMARY KEY (id, last_updated_date)
);

CREATE TABLE sb_ad_history (
    _fivetran_id text,
    last_update_date timestamp,
    ad_group_id text,
    campaign_id text,
    creation_date timestamp,
    id text,
    landing_page_page_type text,
    landing_page_url text,
    "name" text,
    serving_status text,
    "state" text,
    PRIMARY KEY (_fivetran_id, last_update_date),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_creative_history (
    _fivetran_id text,
    ad_id text,
    brand_logo_asset_id text,
    brand_logo_crop_height integer,
    brand_logo_crop_left integer,
    brand_logo_crop_top integer,
    brand_logo_crop_width integer,
    brand_logo_url text,
    brand_name text,
    consent_to_translate boolean,
    creation_time timestamp,
    creative_status text,
    creative_type text,
    creative_version text,
    custom_image_asset_id text,
    custom_image_crop_height integer,
    custom_image_crop_left integer,
    custom_image_crop_top integer,
    custom_image_crop_width integer,
    custom_image_url text,
    headline text,
    landing_page_type text,
    landing_page_value text,
    last_update_time timestamp,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_id) REFERENCES sb_ad_history(last_update_date)
);

CREATE TABLE sb_creative_asin (
    id text,
    _fivetran_id text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES sb_creative_history(_fivetran_id)
);

CREATE TABLE purchased_product_keyword_report (
    "date" text,
    purchased_asin text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_id bigint,
    add_to_list integer,
    advertised_asin text,
    advertised_sku text,
    campaign_budget_currency_code text,
    kindle_edition_normalized_pages_read_14_d integer,
    kindle_edition_normalized_pages_royalties_14_d double precision,
    match_type text,
    purchases_14_d integer,
    purchases_1_d integer,
    purchases_30_d integer,
    purchases_7_d integer,
    purchases_other_sku_14_d integer,
    purchases_other_sku_1_d integer,
    purchases_other_sku_30_d integer,
    purchases_other_sku_7_d integer,
    qualified_borrows integer,
    royalty_qualified_borrows integer,
    sales_14_d double precision,
    sales_1_d double precision,
    sales_30_d double precision,
    sales_7_d double precision,
    sales_other_sku_14_d double precision,
    sales_other_sku_1_d double precision,
    sales_other_sku_30_d double precision,
    sales_other_sku_7_d double precision,
    units_sold_clicks_14_d integer,
    units_sold_clicks_1_d integer,
    units_sold_clicks_30_d integer,
    units_sold_clicks_7_d integer,
    units_sold_other_sku_14_d integer,
    units_sold_other_sku_1_d integer,
    units_sold_other_sku_30_d integer,
    units_sold_other_sku_7_d integer,
    PRIMARY KEY ("date", purchased_asin, ad_group_id, campaign_id, keyword_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_updated_date)
);

CREATE TABLE sb_store_asset (
    id text,
    brand_entity_id text,
    height integer,
    media_type text,
    "name" text,
    url text,
    width integer,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_entity_id) REFERENCES sb_brand(_fivetran_id)
);

CREATE TABLE ad_group_serving_status_detail (
    "name" text,
    ad_group_id text,
    help_url text,
    message text,
    PRIMARY KEY ("name", ad_group_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date)
);

CREATE TABLE keyword_history (
    id text,
    last_updated_date timestamp,
    ad_group_id text,
    campaign_id text,
    bid double precision,
    creation_date timestamp,
    keyword_text text,
    match_type text,
    native_language_keyword text,
    native_language_locale text,
    serving_status text,
    "state" text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE ad_group_suggested_keyword (
    _fivetran_id text,
    ad_group_id bigint,
    campaign_id bigint,
    keyword_text text,
    match_type text,
    "state" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ad_group_id) REFERENCES ad_group_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_updated_date)
);

CREATE TABLE sb_campaign_draft_creative_asin (
    campaign_draft_id text,
    asin text,
    PRIMARY KEY (campaign_draft_id),
    FOREIGN KEY (campaign_draft_id) REFERENCES sb_campaign_draft(id)
);

CREATE TABLE sb_campaign_violation_image_evidence (
    _fivetran_id text,
    _fivetran_violation_image_content_id text,
    -- image_crop_* (dynamic column),
    PRIMARY KEY (_fivetran_id, _fivetran_violation_image_content_id),
    FOREIGN KEY (_fivetran_violation_image_content_id) REFERENCES sb_campaign_violation_image_content(_fivetran_id)
);

CREATE TABLE sd_ad_group_history (
    id text,
    last_updated_date timestamp,
    campaign_id text,
    bid_optimization text,
    creation_date timestamp,
    creative_type text,
    default_bid double precision,
    "name" text,
    serving_status text,
    "state" text,
    tactic text,
    PRIMARY KEY (id, last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sd_campaign_history(last_updated_date)
);

CREATE TABLE sb_ad_report (
    report_date text,
    _fivetran_id text,
    ad_group_id text,
    ad_id text,
    applicable_budget_rule_id text,
    campaign_id text,
    attributed_branded_searches_14_d integer,
    attributed_conversions_14_d integer,
    attributed_conversions_14_d_same_sku integer,
    attributed_detail_page_views_clicks_14_d integer,
    attributed_order_rate_new_to_brand_14_d double precision,
    attributed_orders_new_to_brand_14_d integer,
    attributed_orders_new_to_brand_percentage_14_d double precision,
    attributed_sales_14_d double precision,
    attributed_sales_14_d_same_sku double precision,
    attributed_sales_new_to_brand_14_d double precision,
    attributed_sales_new_to_brand_percentage_14_d double precision,
    attributed_units_ordered_new_to_brand_14_d integer,
    attributed_units_ordered_new_to_brand_percentage_14_d double precision,
    clicks integer,
    cost double precision,
    currency text,
    dpv_14_d integer,
    impressions integer,
    units_sold_14_d integer,
    vctr double precision,
    video_5_second_view_rate double precision,
    video_5_second_views integer,
    video_complete_views integer,
    video_first_quartile_views integer,
    video_midpoint_views integer,
    video_third_quartile_views integer,
    video_unmutes integer,
    viewable_impressions integer,
    vtr double precision,
    PRIMARY KEY (report_date, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES sb_ad_history(last_update_date),
    FOREIGN KEY (ad_group_id) REFERENCES sb_ad_group_history(last_update_date),
    FOREIGN KEY (ad_id) REFERENCES sb_ad_history(last_update_date),
    FOREIGN KEY (applicable_budget_rule_id) REFERENCES sb_budget_rule_history(last_updated_date),
    FOREIGN KEY (campaign_id) REFERENCES sb_campaign_history(last_update_date)
);

CREATE TABLE sb_campaign_moderation (
    campaign_id text,
    eta_for_moderation text,
    moderation_status text,
    PRIMARY KEY (campaign_id)
);
