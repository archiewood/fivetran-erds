CREATE TABLE content_category (
    id text,
    member_id text,
    code text,
    description text,
    is_system text,
    last_modified text,
    "name" text,
    parent_category_id text,
    parent_category_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE yield_management_bias_member (
    id text,
    yield_management_bias_id text,
    bias_cpm text,
    bias_pct text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, yield_management_bias_id),
    FOREIGN KEY (yield_management_bias_id) REFERENCES yield_management_bias(id)
);

CREATE TABLE yield_management_bias_buyer_group (
    id text,
    yield_management_bias_id text,
    bias_cpm text,
    bias_pct text,
    "name" jsonb,
    "type" text,
    PRIMARY KEY (id, yield_management_bias_id),
    FOREIGN KEY (yield_management_bias_id) REFERENCES yield_management_bias(id)
);

CREATE TABLE yield_management_bias (
    id text,
    member_id text,
    code text,
    description text,
    last_modified text,
    "name" text,
    priority text,
    profile_id text,
    ym_profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE targeting_value (
    id text,
    targeting_key_id text,
    created_on text,
    label text,
    last_modified text,
    "name" text,
    PRIMARY KEY (id, targeting_key_id),
    FOREIGN KEY (targeting_key_id) REFERENCES targeting_key(id)
);

CREATE TABLE advertiser_label (
    id text,
    advertiser_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, advertiser_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE advertiser_third_party_pixel (
    id text,
    advertiser_id text,
    active text,
    audit_status text,
    "name" text,
    PRIMARY KEY (id, advertiser_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE advertiser (
    id text,
    allow_safety_pacing text,
    audience_size_check_last_run text,
    audience_size_check_state text,
    billing_address_1 text,
    billing_address_2 text,
    billing_city text,
    billing_country text,
    billing_internal_user text,
    billing_name text,
    billing_phone text,
    billing_state text,
    billing_zip text,
    code text,
    competitive_brands jsonb,
    competitive_categories jsonb,
    control_pct text,
    daily_budget text,
    daily_budget_imps text,
    default_brand text,
    default_brand_category_id text,
    default_brand_id text,
    default_brand_name text,
    default_category text,
    default_currency text,
    enable_pacing text,
    enable_political_io_by_default text,
    is_malicious text,
    is_mediated text,
    is_running_political_ads text,
    labels text,
    last_modified text,
    legal_entity_name text,
    lifetime_budget text,
    lifetime_budget_imps text,
    "name" text,
    object_stats text,
    partner_fees text,
    profile_id text,
    re_marketing_segment_id text,
    "state" text,
    stats jsonb,
    time_format text,
    timezone text,
    use_insertion_orders text,
    PRIMARY KEY (id)
);

CREATE TABLE bidder_info_app_media_type (
    "index" text,
    maintainer_email text,
    media_type text,
    PRIMARY KEY ("index", maintainer_email),
    FOREIGN KEY (maintainer_email) REFERENCES bidder_info(maintainer_email)
);

CREATE TABLE bidder_info_site_media_type (
    "index" text,
    maintainer_email text,
    media_type text,
    PRIMARY KEY ("index", maintainer_email),
    FOREIGN KEY (maintainer_email) REFERENCES bidder_info(maintainer_email)
);

CREATE TABLE bidder_info (
    maintainer_email text,
    "status" text,
    PRIMARY KEY (maintainer_email)
);

CREATE TABLE placement_ad_type (
    id text,
    placement_id text,
    display_name text,
    "name" text,
    renderer jsonb,
    renderer_id text,
    PRIMARY KEY (id, placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_supported_media_subtype (
    id text,
    placement_id text,
    is_private text,
    media_type_group_id text,
    "name" text,
    PRIMARY KEY (id, placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_content_category (
    id text,
    placement_id text,
    is_system text,
    "name" text,
    PRIMARY KEY (id, placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_default_creative (
    id text,
    placement_id text,
    height text,
    "name" text,
    price text,
    width text,
    PRIMARY KEY (id, placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_estimated_clear_price (
    "index" text,
    placement_id text,
    average_price text,
    clear_price text,
    geo_country text,
    height text,
    verified text,
    width text,
    PRIMARY KEY ("index", placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_inventory_attribute (
    id text,
    placement_id text,
    "name" text,
    PRIMARY KEY (id, placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_supported_media_type (
    id text,
    placement_id text,
    last_modified text,
    media_type_group_id text,
    "name" text,
    uses_sizes text,
    PRIMARY KEY (id, placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_mime_type (
    "index" text,
    placement_id text,
    id text,
    "name" text,
    PRIMARY KEY ("index", placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_private_size (
    "index" text,
    placement_id text,
    height text,
    width text,
    PRIMARY KEY ("index", placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_filtered_advertiser (
    advertiser_id text,
    placement_id text,
    PRIMARY KEY (advertiser_id, placement_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_video_aspect_ratio (
    "index" text,
    placement_id text,
    ratio_height text,
    ratio_width text,
    PRIMARY KEY ("index", placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_video_framework (
    "index" text,
    placement_id text,
    framework text,
    PRIMARY KEY ("index", placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_video_bumper (
    "index" text,
    placement_id text,
    max_duration_secs text,
    video_bumper_type text,
    PRIMARY KEY ("index", placement_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement (
    id text,
    ad_profile_id text,
    publisher_id text,
    site_id text,
    audit_level text,
    audited text,
    code text,
    code_2 text,
    code_3 text,
    content_retrieval_timeout_ms text,
    cost_cpm text,
    default_calculation_type text,
    default_creative_id text,
    default_position text,
    default_referrer_url text,
    demand_filter_action text,
    enable_for_mediation text,
    exclusive text,
    filtered_campaigns text,
    filtered_line_items text,
    floor_application_target text,
    handles_mixed_media text,
    height text,
    hide_referer text,
    intended_audience text,
    is_prohibited text,
    is_resizable text,
    is_ss_native_assembly_enabled text,
    last_modified text,
    "name" text,
    pixel_type text,
    pixel_url text,
    pixel_url_secure text,
    reserve_price text,
    segments text,
    site_audit_status text,
    "state" text,
    supported_mime_types_action_include text,
    tinytag_renderer_asset_floor_prices jsonb,
    use_detected_domain text,
    video_context text,
    video_id text,
    video_layback_method text,
    video_max_duration_secs text,
    video_maximum_ad_duration_secs text,
    video_maximum_number_ads text,
    video_mf_min_height text,
    video_mf_min_width text,
    video_min_bitrate text,
    video_player_vast_version text,
    video_skip_offset_seconds text,
    video_start_delay_secs text,
    video_supports_skippable text,
    video_vmin_ad_duration text,
    video_width text,
    visibility_profile_id text,
    width text,
    -- custom_toolbar_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE ad_server_category_mapping (
    id text,
    member_id text,
    adserver_category_code text,
    iab_sub_category_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE yield_management_auction_tier_buyer_member (
    member_id text,
    yield_management_auction_tier_id text,
    PRIMARY KEY (member_id, yield_management_auction_tier_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (yield_management_auction_tier_id) REFERENCES yield_management_auction_tier(id)
);

CREATE TABLE yield_management_auction_tier (
    id text,
    member_id text,
    code text,
    description text,
    member_action text,
    min_price text,
    "name" text,
    priority text,
    profile_id text,
    ym_profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE cross_partner_setting_price_granularity_range (
    "index" text,
    cross_partner_setting_id text,
    increment text,
    max text,
    PRIMARY KEY ("index", cross_partner_setting_id),
    FOREIGN KEY (cross_partner_setting_id) REFERENCES cross_partner_setting(id)
);

CREATE TABLE cross_partner_setting_group_role (
    "index" text,
    cross_partner_setting_id text,
    role_id text,
    PRIMARY KEY ("index", cross_partner_setting_id),
    FOREIGN KEY (cross_partner_setting_id) REFERENCES cross_partner_setting(id)
);

CREATE TABLE cross_partner_setting_group_team (
    "index" text,
    cross_partner_setting_id text,
    team_id text,
    PRIMARY KEY ("index", cross_partner_setting_id),
    FOREIGN KEY (cross_partner_setting_id) REFERENCES cross_partner_setting(id)
);

CREATE TABLE cross_partner_setting (
    id text,
    member_id text,
    bidder_timeout_ms text,
    deleted text,
    last_modified text,
    price_granularity_currency_code text,
    price_granularity_label text,
    price_granularity_precision text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE operating_system_family (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE demand_partner_schema_required (
    "index" text,
    demand_partner_schema_id text,
    required text,
    PRIMARY KEY ("index", demand_partner_schema_id),
    FOREIGN KEY (demand_partner_schema_id) REFERENCES demand_partner_schema(id)
);

CREATE TABLE demand_partner_schema_property (
    "index" text,
    demand_partner_schema_id text,
    description text,
    enum jsonb,
    pattern text,
    "type" jsonb,
    PRIMARY KEY ("index", demand_partner_schema_id),
    FOREIGN KEY (demand_partner_schema_id) REFERENCES demand_partner_schema(id)
);

CREATE TABLE demand_partner_schema (
    id text,
    description text,
    "schema" text,
    title text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE site_inventory_attribute (
    id text,
    site_id text,
    "name" text,
    PRIMARY KEY (id, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_placement (
    id text,
    site_id text,
    code text,
    PRIMARY KEY (id, site_id),
    FOREIGN KEY (id) REFERENCES placement(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_content_category (
    id text,
    site_id text,
    is_primary text,
    is_system text,
    "name" text,
    site jsonb,
    PRIMARY KEY (id, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_creative_format (
    "index" text,
    site_id text,
    creative_format text,
    PRIMARY KEY ("index", site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_allowed_click_action (
    "index" text,
    site_id text,
    allowed_click_action text,
    PRIMARY KEY ("index", site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    publisher_id text,
    code text,
    created_on text,
    creative_format_action text,
    intended_audience text,
    label text,
    last_modified text,
    mobile_app_instance_bundle_id text,
    mobile_app_instance_id text,
    mobile_app_instance_os_family_id text,
    "name" text,
    primary_content_category_id text,
    publisher_join jsonb,
    "state" text,
    supply_type text,
    "type" text,
    url text,
    -- marketplace_map_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE demand_partner_param (
    id text,
    member_id text,
    param_placement_id text,
    param_publisher_id text,
    deleted text,
    enabled text,
    last_modified text,
    last_modified_by text,
    "name" text,
    param_key_value text,
    param_placement_key text,
    param_size text,
    prebid_settings_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (param_placement_id) REFERENCES placement(id),
    FOREIGN KEY (param_publisher_id) REFERENCES publisher(id)
);

CREATE TABLE yield_management_group_buyer_member (
    member_id text,
    yield_management_buyer_group_id text,
    PRIMARY KEY (member_id, yield_management_buyer_group_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (yield_management_buyer_group_id) REFERENCES yield_management_buyer_group(id)
);

CREATE TABLE yield_management_buyer_group (
    id text,
    code text,
    description text,
    last_modified text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE targeting_key (
    id text,
    created_on text,
    label text,
    last_modified text,
    "name" text,
    "state" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE deal_creative (
    id text,
    deal_id text,
    "status" text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_brand (
    id text,
    deal_id text,
    "name" text,
    override text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_ad_server_list (
    id text,
    deal_id text,
    "name" text,
    override text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_allowed_media_subtype_native_asset (
    "index" text,
    deal_allowed_media_subtype_id text,
    deal_id text,
    max_text_length text,
    min_text_length text,
    native_asset_name text,
    requirement text,
    PRIMARY KEY ("index", deal_allowed_media_subtype_id, deal_id),
    FOREIGN KEY (deal_allowed_media_subtype_id) REFERENCES deal_allowed_media_subtype(id),
    FOREIGN KEY (deal_id) REFERENCES deal_allowed_media_subtype(deal_id)
);

CREATE TABLE deal_allowed_media_subtype_permitted_size (
    "index" text,
    deal_allowed_media_subtype_id text,
    deal_id text,
    aspect_ratio_tolerance text,
    max_image_height text,
    max_image_width text,
    min_image_height text,
    min_image_width text,
    platform_height text,
    platform_width text,
    scaling_permitted text,
    validate_image_size text,
    PRIMARY KEY ("index", deal_allowed_media_subtype_id, deal_id),
    FOREIGN KEY (deal_allowed_media_subtype_id) REFERENCES deal_allowed_media_subtype(id),
    FOREIGN KEY (deal_id) REFERENCES deal_allowed_media_subtype(deal_id)
);

CREATE TABLE deal_allowed_media_subtype (
    id text,
    deal_id text,
    last_modified text,
    media_type_group_id text,
    media_type_id text,
    media_type_name text,
    "name" text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_allowed_media_type (
    id text,
    deal_id text,
    last_modified text,
    media_type_group_id text,
    "name" text,
    uses_sizes text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_buyer_seat (
    bidder_id text,
    deal_id text,
    bidder_name text,
    code text,
    "name" text,
    PRIMARY KEY (bidder_id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_buyer_bidder (
    "index" text,
    deal_id text,
    bidder_id text,
    bidder_name text,
    PRIMARY KEY ("index", deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_buyer_member (
    bidder_id text,
    id text,
    deal_id text,
    bidder_name text,
    "name" text,
    PRIMARY KEY (bidder_id, id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_category (
    id text,
    deal_id text,
    "name" text,
    override text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_language (
    id text,
    deal_id text,
    "name" text,
    override text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_technical_attribute (
    id text,
    deal_id text,
    "name" text,
    override text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal_line_item_id (
    "index" text,
    deal_id text,
    line_item_id text,
    PRIMARY KEY ("index", deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal (
    id text,
    seller_member_id text,
    active text,
    allow_creative_add_on_click text,
    allow_creative_add_on_view text,
    ask_price text,
    auction_type_id text,
    auction_type_name text,
    audit_status_option text,
    brand_restrict text,
    buyer_bidder_id text,
    buyer_id text,
    buyer_name text,
    code text,
    currency text,
    description text,
    end_date text,
    floor_price text,
    language_restrict text,
    last_modified text,
    media_preference text,
    "name" text,
    package_id text,
    payment_type text,
    priority text,
    profile_id text,
    seller_id text,
    seller_name text,
    seller_targeting_restriction_id text,
    seller_targeting_restriction_name text,
    size_preference text,
    start_date text,
    technical_attribute_restrict text,
    type_id text,
    type_name text,
    use_deal_floor text,
    version text,
    visibility_profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (seller_member_id) REFERENCES member(id)
);

CREATE TABLE ad_size (
    _fivetran_id text,
    height text,
    is_standard text,
    width text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE publisher_brand_exception (
    "index" text,
    publisher_id text,
    brand_id text,
    PRIMARY KEY ("index", publisher_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE publisher_contact (
    "index" text,
    publisher_id text,
    email text,
    "name" text,
    phone text,
    PRIMARY KEY ("index", publisher_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE publisher_external_inv_code (
    external_inventory_code_id text,
    publisher_id text,
    PRIMARY KEY (external_inventory_code_id, publisher_id),
    FOREIGN KEY (external_inventory_code_id) REFERENCES external_inventory_code(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE publisher_label (
    id text,
    publisher_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, publisher_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE publisher_placement (
    id text,
    publisher_id text,
    code text,
    PRIMARY KEY (id, publisher_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE publisher (
    id text,
    default_ad_profile_id text,
    default_site_id text,
    member_id text,
    accept_data_provider_user_sync text,
    accept_demand_partner_user_sync text,
    accept_supply_partner_user_sync text,
    ad_quality_advanced_mode_enabled text,
    allow_cpa_external text,
    allow_cpa_managed text,
    allow_cpc_external text,
    allow_cpc_managed text,
    allow_cpm_external text,
    allow_cpm_managed text,
    allow_report_on_default_imps text,
    base_ad_quality_rule_id text,
    base_payment_rule_id text,
    billing_address_1 text,
    billing_address_2 text,
    billing_city text,
    billing_country text,
    billing_dba text,
    billing_internal_user text,
    billing_state text,
    billing_zip text,
    code text,
    cpc_reselling_disabled text,
    cpm_reselling_disabled text,
    currency text,
    description text,
    enable_cookie_tracking_default text,
    expose_domains text,
    external_cpa_bias_pct text,
    external_cpc_bias_pct text,
    inventory_relationship text,
    inventory_source text,
    inventory_source_name text,
    is_oo text,
    is_rtb text,
    last_modified text,
    learn_bypass_cpm text,
    managed_cpa_bias_pct text,
    managed_cpc_bias_pct text,
    max_learn_pct text,
    "name" text,
    pitbull_segment_id text,
    pitbull_segment_value text,
    platform_ops_notes text,
    redirect_to_rm text,
    reselling_exposed_on text,
    reselling_exposure text,
    reselling_name text,
    seller_page_cap_enabled text,
    "state" text,
    timezone text,
    use_anx_auction_logic text,
    visibility_profile_id text,
    ym_profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_ad_profile_id) REFERENCES ad_profile(id),
    FOREIGN KEY (default_site_id) REFERENCES site(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE config_price_granularity_range (
    "index" text,
    config_id text,
    increment text,
    max text,
    PRIMARY KEY ("index", config_id),
    FOREIGN KEY (config_id) REFERENCES config(id)
);

CREATE TABLE config_property_media_type (
    "index" text,
    config_id text,
    config_property_id text,
    media_type text,
    PRIMARY KEY ("index", config_id, config_property_id),
    FOREIGN KEY (config_id) REFERENCES config_property(config_id),
    FOREIGN KEY (config_property_id) REFERENCES config_property(id)
);

CREATE TABLE config_property_media_type_size (
    "index" text,
    config_id text,
    config_property_id text,
    height text,
    is_standard text,
    width text,
    PRIMARY KEY ("index", config_id, config_property_id),
    FOREIGN KEY (config_id) REFERENCES config_property(config_id),
    FOREIGN KEY (config_property_id) REFERENCES config_property(id)
);

CREATE TABLE config_property_targeting_os_family (
    config_id text,
    config_property_id text,
    operating_system_family_id text,
    PRIMARY KEY (config_id, config_property_id, operating_system_family_id),
    FOREIGN KEY (config_id) REFERENCES config_property(config_id),
    FOREIGN KEY (config_property_id) REFERENCES config_property(id),
    FOREIGN KEY (operating_system_family_id) REFERENCES operating_system_family(id)
);

CREATE TABLE demand_partner_config_param (
    id text,
    config_id text,
    config_property_id text,
    demand_partner_id text,
    deleted text,
    enabled text,
    last_modified text,
    last_modified_by text,
    "name" text,
    prebid_settings_id text,
    -- custom_param_* (dynamic column),
    PRIMARY KEY (id, config_id, config_property_id),
    FOREIGN KEY (config_id) REFERENCES config_property(config_id),
    FOREIGN KEY (config_property_id) REFERENCES config_property(id),
    FOREIGN KEY (demand_partner_id) REFERENCES demand_partner(id)
);

CREATE TABLE config_property (
    id text,
    config_id text,
    member_id text,
    deleted text,
    enabled text,
    last_modified text,
    last_modified_by text,
    "name" text,
    targeting_id text,
    targeting_level_code text,
    targeting_level_name text,
    PRIMARY KEY (id, config_id),
    FOREIGN KEY (config_id) REFERENCES config(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE config_demand_partner_setting (
    id text,
    config_id text,
    bid_cpm_adjustment text,
    enabled text,
    "name" text,
    PRIMARY KEY (id, config_id),
    FOREIGN KEY (config_id) REFERENCES config(id)
);

CREATE TABLE config (
    id text,
    member_id text,
    bidder_timeout_ms text,
    deleted text,
    last_modified text,
    price_granularity_currency_code text,
    price_granularity_label text,
    price_granularity_precision text,
    price_granularity_range jsonb,
    price_granularity_ranges_increment text,
    price_granularity_ranges_max text,
    total_configs text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE package_member (
    member_id text,
    package_id text,
    member_ask_price text,
    member_use_deal_floor text,
    "name" text,
    PRIMARY KEY (member_id, package_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package_technical_attribute (
    id text,
    package_id text,
    "name" text,
    override text,
    PRIMARY KEY (id, package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package_size (
    "index" text,
    package_id text,
    height text,
    width text,
    PRIMARY KEY ("index", package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package_allowed_media_type (
    id text,
    package_id text,
    last_modified text,
    media_type_group_id text,
    "name" text,
    uses_sizes text,
    PRIMARY KEY (id, package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package_allowed_media_subtype_native_asset (
    "index" text,
    package_allowed_media_subtype_id text,
    package_id text,
    max_text_length text,
    min_text_length text,
    native_asset_name text,
    requirement text,
    PRIMARY KEY ("index", package_allowed_media_subtype_id, package_id),
    FOREIGN KEY (package_allowed_media_subtype_id) REFERENCES package_allowed_media_subtype(id),
    FOREIGN KEY (package_id) REFERENCES package_allowed_media_subtype(package_id)
);

CREATE TABLE package_allowed_media_subtype_permitted_size (
    "index" text,
    package_allowed_media_subtype_id text,
    package_id text,
    aspect_ratio_tolerance text,
    max_image_height text,
    max_image_width text,
    min_image_height text,
    min_image_width text,
    platform_height text,
    platform_width text,
    scaling_permitted text,
    validate_image_size text,
    PRIMARY KEY ("index", package_allowed_media_subtype_id, package_id),
    FOREIGN KEY (package_allowed_media_subtype_id) REFERENCES package_allowed_media_subtype(id),
    FOREIGN KEY (package_id) REFERENCES package_allowed_media_subtype(package_id)
);

CREATE TABLE package_allowed_media_subtype (
    id text,
    package_id text,
    last_modified text,
    media_type_group_id text,
    media_type_id text,
    media_type_name text,
    "name" text,
    PRIMARY KEY (id, package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package (
    id text,
    active text,
    default_ask_price text,
    default_currency text,
    default_deal_priority text,
    default_deal_type_id text,
    default_deal_type_name text,
    default_use_deal_floor text,
    description text,
    last_modified text,
    media_preference text,
    "name" text,
    profile_id text,
    seller_id text,
    seller_name text,
    seller_rank text,
    setting_has_inventory text,
    setting_has_segments text,
    setting_has_sizes text,
    setting_inventory_description text,
    setting_segments_description text,
    size_preference text,
    technical_attribute_restrict text,
    visibility_type_id text,
    visibility_type_name text,
    PRIMARY KEY (id)
);

CREATE TABLE ad_quality_rule (
    id text,
    ad_profile_id text,
    publisher_id text,
    active text,
    code text,
    description text,
    "name" text,
    priority text,
    profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE yield_management_profile_modifier_technical_attribute (
    id text,
    yield_management_profile_id text,
    amount_cpm text,
    amount_pct text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, yield_management_profile_id),
    FOREIGN KEY (yield_management_profile_id) REFERENCES yield_management_profile(id)
);

CREATE TABLE yield_management_profile_bias (
    id text,
    yield_management_profile_id text,
    code text,
    description text,
    "name" text,
    priority text,
    profile_id text,
    PRIMARY KEY (id, yield_management_profile_id),
    FOREIGN KEY (id) REFERENCES yield_management_bias(id),
    FOREIGN KEY (yield_management_profile_id) REFERENCES yield_management_profile(id)
);

CREATE TABLE yield_management_profile_floor (
    id text,
    yield_management_profile_id text,
    apply_floor_to_direct text,
    PRIMARY KEY (id, yield_management_profile_id),
    FOREIGN KEY (id) REFERENCES yield_management_floor(id),
    FOREIGN KEY (yield_management_profile_id) REFERENCES yield_management_profile(id)
);

CREATE TABLE yield_management_profile (
    id text,
    member_id text,
    publisher_id text,
    active text,
    base_ym_bias_id text,
    base_ym_floor_id text,
    code text,
    description text,
    last_modified text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE line_item_imp_tracker_tag (
    id text,
    line_item_id text,
    line_item_imp_tracker_id text,
    "name" text,
    PRIMARY KEY (id, line_item_id, line_item_imp_tracker_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item_imp_tracker(line_item_id),
    FOREIGN KEY (line_item_imp_tracker_id) REFERENCES line_item_imp_tracker(id)
);

CREATE TABLE line_item_imp_tracker (
    id text,
    line_item_id text,
    advertiser_id text,
    member_id text,
    publisher_id text,
    click_tracker jsonb,
    code text,
    last_modified text,
    "name" text,
    payment_rule_id text,
    payment_rule_name text,
    "state" text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE line_item_click_tracker_tag (
    id text,
    line_item_click_tracker_id text,
    line_item_id text,
    "name" text,
    PRIMARY KEY (id, line_item_click_tracker_id, line_item_id),
    FOREIGN KEY (line_item_click_tracker_id) REFERENCES line_item_click_tracker(id),
    FOREIGN KEY (line_item_id) REFERENCES line_item_click_tracker(line_item_id)
);

CREATE TABLE line_item_click_tracker (
    id text,
    line_item_id text,
    advertiser_id text,
    member_id text,
    publisher_id text,
    click_url text,
    code text,
    last_modified text,
    "name" text,
    "state" text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE line_item_pixel (
    id text,
    line_item_id text,
    "name" text,
    post_click_revenue text,
    post_view_revenue text,
    "state" text,
    trigger_type text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_ad_type (
    "index" text,
    line_item_id text,
    ad_type text,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_budget_interval (
    id text,
    line_item_id text,
    code text,
    creatives text,
    daily_budget_imps_opt text,
    daily_budget_opt text,
    enable_pacing text,
    end_date text,
    lifetime_budget text,
    lifetime_budget_imps text,
    lifetime_pacing text,
    lifetime_pacing_pct text,
    object_id text,
    object_type text,
    parent_interval_id text,
    start_date text,
    sub_flight text,
    timezone text,
    under_spend_rollover_state text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_delivery_goal (
    id text,
    line_item_id text,
    disallow_non_guaranteed text,
    guaranteed_delivery_version text,
    percentage text,
    reserved text,
    "type" text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_supply_strategy (
    _fivetran_id text,
    line_item_id text,
    deals text,
    managed text,
    prebid_server_profile text,
    programmatic_guaranteed text,
    rtb text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_insertion_order (
    id text,
    line_item_id text,
    advertiser_id text,
    budget_type text,
    code text,
    currency text,
    end_date text,
    last_modified text,
    "name" text,
    political_content text,
    start_date text,
    "state" text,
    timezone text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE budget_interval_creative (
    line_item_creative_id text,
    line_item_id text,
    line_item_insertion_order_budget_interval_id text,
    line_item_insertion_order_id text,
    PRIMARY KEY (line_item_creative_id, line_item_id, line_item_insertion_order_budget_interval_id, line_item_insertion_order_id),
    FOREIGN KEY (line_item_creative_id) REFERENCES line_item_creative(id),
    FOREIGN KEY (line_item_id) REFERENCES line_item_insertion_order_budget_interval(line_item_id),
    FOREIGN KEY (line_item_insertion_order_budget_interval_id) REFERENCES line_item_insertion_order_budget_interval(id),
    FOREIGN KEY (line_item_insertion_order_id) REFERENCES line_item_insertion_order_budget_interval(line_item_insertion_order_id)
);

CREATE TABLE line_item_insertion_order_budget_interval (
    id text,
    line_item_id text,
    line_item_insertion_order_id text,
    code text,
    creatives text,
    daily_budget text,
    daily_budget_imps text,
    enable_pacing text,
    end_date text,
    lifetime_budget text,
    lifetime_budget_imps text,
    lifetime_pacing text,
    lifetime_pacing_pct text,
    object_id text,
    object_type text,
    start_date text,
    subflight text,
    timezone text,
    under_spend_rollover_state text,
    PRIMARY KEY (id, line_item_id, line_item_insertion_order_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item_insertion_order(line_item_id),
    FOREIGN KEY (line_item_insertion_order_id) REFERENCES line_item_insertion_order(id)
);

CREATE TABLE line_item_creative (
    id text,
    line_item_id text,
    all_budget_intervals text,
    audit_status text,
    code text,
    custom_date_ranges text,
    format text,
    height text,
    in_scope text,
    is_expired text,
    is_prohibited text,
    is_self_audited text,
    "name" text,
    pop_window_maximize text,
    "state" text,
    weight text,
    width text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_label (
    id text,
    line_item_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item (
    id text,
    advertiser_id text,
    insertion_order_id text,
    member_id text,
    all_stats jsonb,
    archived_on text,
    auction_event_kpi_value text,
    auction_event_kpi_value_type text,
    bid_object_type text,
    budget_scheduling_setting_underspend_catchup_type text,
    budget_set_per_flight text,
    campaigns text,
    click_url text,
    code text,
    comments text,
    created_on text,
    creative_distribution_type text,
    ctv_bundle_enabled text,
    currency text,
    custom_model text,
    custom_optimization_note text,
    daily_budget text,
    daily_budget_imps text,
    daily_budget_imps_opt text,
    daily_budget_opt text,
    deals text,
    delivery_model_type text,
    discrepancy_pct text,
    enable_pacing text,
    enable_v_8 text,
    end_date text,
    first_run text,
    flat_fee_adjustment_id text,
    flat_fee_allocation_date text,
    flat_fee_status text,
    flat_fee_type text,
    goal_pixels text,
    goal_type text,
    goal_value text,
    in_demo_measurement text,
    incrementality text,
    inventory_discovery text,
    inventory_type text,
    is_archived text,
    kpi_auction_event_type text,
    kpi_auction_event_type_code text,
    kpi_auction_type_id text,
    last_modified text,
    last_run text,
    lifetime_budget text,
    lifetime_budget_imps text,
    lifetime_pacing text,
    lifetime_pacing_pct text,
    lifetime_pacing_span text,
    manage_creative text,
    max_billable_value text,
    "name" text,
    offline_attributions text,
    payment_auction_event_type text,
    payment_auction_event_type_code text,
    payment_auction_type_id text,
    prefer_delivery_over_performance text,
    priority text,
    product text,
    profile_id text,
    publishers_allowed text,
    remaining_days text,
    require_cookie_for_tracking text,
    revenue_auction_event_type text,
    revenue_auction_event_type_code text,
    revenue_auction_type_id text,
    revenue_type text,
    revenue_value text,
    road_block_adjustment_id text,
    road_block_master_height text,
    road_block_master_width text,
    road_block_slot_type text,
    road_block_type text,
    start_date text,
    "state" text,
    subtype text,
    timezone text,
    total_days text,
    "type" text,
    underspend_rollover_state text,
    use_ip_tracking text,
    user_info_creator_id text,
    user_info_owner_id text,
    valuation_bid_price_pacing_enabled text,
    valuation_bid_price_pacing_lever text,
    valuation_campaign_group_valuation_strategy text,
    valuation_goal_confidence_threshold text,
    valuation_goal_target text,
    valuation_goal_threshold text,
    valuation_max_avg_cpm text,
    valuation_max_revenue_value text,
    valuation_min_avg_cpm text,
    valuation_min_margin_cpm text,
    valuation_min_margin_pct text,
    valuation_min_revenue_value text,
    valuation_no_revenue_log text,
    viewability_vendor text,
    waive_deductions_when_disallowed text,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (insertion_order_id) REFERENCES line_item_insertion_order(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE yield_management_floor_member (
    id text,
    yield_management_floor_id text,
    "name" text,
    PRIMARY KEY (id, yield_management_floor_id),
    FOREIGN KEY (yield_management_floor_id) REFERENCES yield_management_floor(id)
);

CREATE TABLE yield_management_floor_brand (
    id text,
    yield_management_floor_id text,
    "name" text,
    PRIMARY KEY (id, yield_management_floor_id),
    FOREIGN KEY (yield_management_floor_id) REFERENCES yield_management_floor(id)
);

CREATE TABLE yield_management_floor_category (
    id text,
    yield_management_floor_id text,
    "name" text,
    PRIMARY KEY (id, yield_management_floor_id),
    FOREIGN KEY (yield_management_floor_id) REFERENCES yield_management_floor(id)
);

CREATE TABLE yield_management_floor_allowed_media_type (
    id text,
    yield_management_floor_id text,
    "name" text,
    PRIMARY KEY (id, yield_management_floor_id),
    FOREIGN KEY (yield_management_floor_id) REFERENCES yield_management_floor(id)
);

CREATE TABLE yield_management_floor_allowed_media_subtype (
    id text,
    yield_management_floor_id text,
    "name" text,
    PRIMARY KEY (id, yield_management_floor_id),
    FOREIGN KEY (yield_management_floor_id) REFERENCES yield_management_floor(id)
);

CREATE TABLE yield_management_floor (
    id text,
    member_id text,
    allow_tag_reserve_override text,
    brands text,
    code text,
    default_calculation_type text,
    description text,
    floor_application_target text,
    floor_optimization_enabled text,
    hard_floor text,
    last_modified text,
    members text,
    "name" text,
    priority text,
    profile_id text,
    soft_floor text,
    ym_profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE visibility_profile_buyer_member (
    id text,
    visibility_profile_id text,
    custom_categories jsonb,
    expose_age text,
    expose_application_id text,
    expose_city text,
    expose_custom_categories text,
    expose_device_id text,
    expose_dma text,
    expose_gender text,
    expose_geo_lat_lon text,
    expose_ip text,
    expose_postal_code text,
    expose_query_string text,
    expose_reserve_price text,
    expose_site_id text,
    expose_state text,
    expose_user_agent text,
    expose_user_id text,
    "name" text,
    url_exposure text,
    PRIMARY KEY (id, visibility_profile_id),
    FOREIGN KEY (visibility_profile_id) REFERENCES visibility_profile(id)
);

CREATE TABLE visibility_profile_bidder_custom_category (
    id text,
    visibility_profile_bidder_id text,
    visibility_profile_id text,
    "name" text,
    PRIMARY KEY (id, visibility_profile_bidder_id, visibility_profile_id),
    FOREIGN KEY (visibility_profile_bidder_id) REFERENCES visibility_profile_bidder(id),
    FOREIGN KEY (visibility_profile_id) REFERENCES visibility_profile_bidder(visibility_profile_id)
);

CREATE TABLE visibility_profile_bidder (
    id text,
    visibility_profile_id text,
    expose_age text,
    expose_application_id text,
    expose_city text,
    expose_custom_categories jsonb,
    expose_device_id text,
    expose_dma text,
    expose_gender text,
    expose_geo_lat_lon text,
    expose_ip text,
    expose_postal_code text,
    expose_query_string text,
    expose_reserve_price text,
    expose_site_id text,
    expose_state text,
    expose_user_agent text,
    expose_user_id text,
    "name" text,
    url_exposure text,
    PRIMARY KEY (id, visibility_profile_id),
    FOREIGN KEY (visibility_profile_id) REFERENCES visibility_profile(id)
);

CREATE TABLE visibility_profile_custom_category (
    id text,
    visibility_profile_id text,
    "name" text,
    PRIMARY KEY (id, visibility_profile_id),
    FOREIGN KEY (visibility_profile_id) REFERENCES visibility_profile(id)
);

CREATE TABLE visibility_profile (
    id text,
    member_id text,
    expose_age_default text,
    expose_application_id_default text,
    expose_city_default text,
    expose_custom_categories_default text,
    expose_device_id_default text,
    expose_device_type_target text,
    expose_dma_default text,
    expose_gender_default text,
    expose_geo_lat_lon_default text,
    expose_ip_default text,
    expose_postal_code_default text,
    expose_query_string_default text,
    expose_reserve_price_default text,
    expose_segment_groups_default text,
    expose_site_id_default text,
    expose_user_agent_default text,
    expose_user_id_default text,
    expose_video_content_duration_default text,
    expose_video_content_genres_default text,
    expose_video_content_networks_default text,
    expose_video_content_ratings_default text,
    expose_video_context_default text,
    expose_video_delivery_types_default text,
    expose_video_program_types_default text,
    last_modified text,
    "name" text,
    notes text,
    url_exposure_default text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE external_inventory_code (
    id text,
    member_id text,
    code text,
    "name" text,
    publisher_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_content_category (
    id text,
    member_id text,
    "name" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_plugin (
    id text,
    member_id text,
    "status" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_floor_optimization (
    id text,
    member_id text,
    active text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_default_country (
    id text,
    member_id text,
    country_code text,
    country_name text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE inventory_trust_member (
    member_id text,
    seller_member_id text,
    allow_unaudited text,
    is_banned text,
    trust text,
    PRIMARY KEY (member_id, seller_member_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (seller_member_id) REFERENCES member(id)
);

CREATE TABLE member_third_party_pixel (
    id text,
    member_id text,
    active text,
    audit_status text,
    "name" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_standard_size (
    "index" text,
    member_id text,
    height text,
    is_standard text,
    width text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE seller_member_group (
    id text,
    member_id text,
    created_on text,
    description text,
    display_order text,
    last_modified text,
    "name" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_mediation (
    "index" text,
    member_id text,
    auto_bid_adjustment_enabled text,
    reporting_sync_enabled text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_native_custom_key (
    "index" text,
    member_id text,
    native_custom_key text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_brand_exception (
    brand_id text,
    member_id text,
    PRIMARY KEY (brand_id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member (
    id text,
    default_ad_profile_id text,
    default_placement_id text,
    account_owner_user_first_name text,
    account_owner_user_id text,
    account_owner_user_last_name text,
    active_contract_auditing_fee_per_creative text,
    active_contract_creative_priority_fee_1 text,
    active_contract_creative_priority_fee_2 text,
    age_segment_id text,
    agent_id text,
    allow_ad_profile_override text,
    allow_non_cpm_payment text,
    allow_priority_audit text,
    audit_notify_email text,
    bidder_id text,
    billing_address_1 text,
    billing_address_2 text,
    billing_city text,
    billing_country text,
    billing_postal_code text,
    billing_region text,
    buyer_clearing_fee_pct text,
    buyer_credit_limit text,
    code text,
    contact_email text,
    contact_info text,
    content_categories text,
    contract_allows_unaudited text,
    contracts jsonb,
    creative_size_fee_per_gb text,
    creative_size_minimum_bytes text,
    curation_deductions_allowed text,
    daily_budget text,
    daily_budget_imps text,
    daily_imps_self_audited text,
    daily_imps_unaudited text,
    daily_imps_verified text,
    deal_types jsonb,
    deal_visibility_profile_id text,
    default_accept_data_provider_user_sync text,
    default_accept_deals text,
    default_accept_demand_partner_user_sync text,
    default_accept_supply_partner_user_sync text,
    default_allow_cpa text,
    default_allow_cpc text,
    default_buyer_group_id text,
    default_campaign_allow_unaudited text,
    default_campaign_trust text,
    default_content_retrieval_timeout_ms text,
    default_creatives text,
    default_currency text,
    default_discrepancy_pct text,
    default_enable_for_mediation text,
    default_external_audit text,
    default_optimization_version text,
    description text,
    developer_id text,
    domain_blacklist_email text,
    dongle text,
    email_code text,
    enable_click_and_imp_trackers text,
    enable_facebook text,
    enable_mobile_ui text,
    enforce_cmp_validation text,
    entity_type text,
    expose_eap_ecp_placement_settings text,
    expose_optimization_levers text,
    gender_segment_id text,
    interface_domain text,
    interface_domain_beta text,
    inventory_trust text,
    inventory_trust_default_allow_unaudited text,
    inventory_trust_default_is_banned text,
    inventory_trust_default_trust text,
    is_iash_compliant text,
    last_modified text,
    macros text,
    max_hosted_video_size text,
    mediation text,
    "name" text,
    no_reselling_priority text,
    platform_exposure text,
    plugins_enabled text,
    pops_enabled_ui text,
    price_buckets text,
    prioritize_margin text,
    reporting_decimal_type text,
    requires_publisher_audit text,
    reselling_description text,
    reselling_exposed_on text,
    reselling_exposure text,
    seller_revshare_pct text,
    server_of_record_enforce_true_priority_tiers text,
    server_of_record_guaranteed_delivery_enabled text,
    server_of_record_guaranteed_delivery_version text,
    serving_domain_cname text,
    serving_domain_type text,
    sherlock_notify_email text,
    short_name text,
    "state" text,
    tax_region_id text,
    timezone text,
    use_insertion_orders text,
    vendor_id text,
    visibility_profile_id text,
    website_url text,
    white_label_support_email text,
    xd_coop text,
    xvm_status text,
    ym_profile_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_ad_profile_id) REFERENCES ad_profile(id),
    FOREIGN KEY (default_placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_id (
    "index" text,
    placement_set_id text,
    placement_id text,
    PRIMARY KEY ("index", placement_set_id),
    FOREIGN KEY (placement_set_id) REFERENCES placement_set(id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE placement_set (
    id text,
    member_id text,
    publisher_id text,
    code text,
    last_activity text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE ad_profile_brand (
    id text,
    ad_profile_id text,
    parent_brand_id text,
    "status" text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile_creative (
    id text,
    ad_profile_id text,
    approved text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile_excluded_landing_page_url (
    "index" text,
    ad_profile_id text,
    excluded_landing_page_url text,
    PRIMARY KEY ("index", ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile_language (
    id text,
    ad_profile_id text,
    "status" text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile_ad_server (
    id text,
    ad_profile_id text,
    "status" text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile_category (
    id text,
    ad_profile_id text,
    "status" text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile_member (
    ad_profile_id text,
    member_id text,
    audit_type text,
    exclude_unaudited text,
    require_seller_audit_status text,
    "status" text,
    PRIMARY KEY (ad_profile_id, member_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE ad_profile_technical_attribute (
    id text,
    ad_profile_id text,
    "status" text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE frequency_caps_technical_attribute (
    id text,
    ad_profile_frequency_caps_id text,
    ad_profile_id text,
    last_activity text,
    "name" text,
    PRIMARY KEY (id, ad_profile_frequency_caps_id, ad_profile_id),
    FOREIGN KEY (ad_profile_frequency_caps_id) REFERENCES ad_profile_frequency_caps(id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile_frequency_caps(ad_profile_id)
);

CREATE TABLE frequency_caps_category_country_brand (
    id text,
    ad_profile_frequency_caps_id text,
    ad_profile_id text,
    frequency_caps_category_id text,
    brand jsonb,
    brand_name text,
    country text,
    PRIMARY KEY (id, ad_profile_frequency_caps_id, ad_profile_id, frequency_caps_category_id),
    FOREIGN KEY (ad_profile_frequency_caps_id) REFERENCES frequency_caps_category(ad_profile_frequency_caps_id),
    FOREIGN KEY (ad_profile_id) REFERENCES frequency_caps_category(ad_profile_id),
    FOREIGN KEY (frequency_caps_category_id) REFERENCES frequency_caps_category(id)
);

CREATE TABLE frequency_caps_category (
    id text,
    ad_profile_frequency_caps_id text,
    ad_profile_id text,
    is_brand_eligible text,
    is_sensitive text,
    last_modified text,
    "name" text,
    requires_whitelist text,
    requires_whitelist_on_external text,
    requires_whitelist_on_managed text,
    PRIMARY KEY (id, ad_profile_frequency_caps_id, ad_profile_id),
    FOREIGN KEY (ad_profile_frequency_caps_id) REFERENCES ad_profile_frequency_caps(id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile_frequency_caps(ad_profile_id)
);

CREATE TABLE ad_profile_frequency_caps (
    id text,
    ad_profile_id text,
    cap_users_without_cookie text,
    max_day_imps text,
    max_session_imps text,
    member_id text,
    min_minutes_per_imp text,
    PRIMARY KEY (id, ad_profile_id),
    FOREIGN KEY (ad_profile_id) REFERENCES ad_profile(id)
);

CREATE TABLE ad_profile (
    id text,
    member_id text,
    publisher_id text,
    approved_creative_count text,
    audit_type_direct text,
    banned_creative_count text,
    brands_unreviewed text,
    check_attributes_direct text,
    creatives_approved_percent text,
    creatives_unreviewed text,
    default_ad_server_status text,
    default_audit_type text,
    default_brand_status text,
    default_category_status text,
    default_language_status text,
    default_member_status text,
    default_technical_attribute_status text,
    description text,
    exclude_unaudited text,
    exclude_unaudited_direct text,
    languages text,
    last_modified text,
    notes text,
    require_seller_audit_default text,
    "state" text,
    total_creative_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE demand_partner_source (
    id text,
    demand_partner_id text,
    member_owner_id text,
    "source" text,
    "status" text,
    PRIMARY KEY (id, demand_partner_id),
    FOREIGN KEY (demand_partner_id) REFERENCES demand_partner(id)
);

CREATE TABLE demand_partner (
    id text,
    member_id text,
    bid_cpm_adjustment text,
    deleted text,
    demand_partner_id text,
    enabled text,
    last_modified text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE seller_creative_review_deal_audit_status (
    deal_id text,
    seller_creative_review_id text,
    audit_feedback text,
    audit_status text,
    PRIMARY KEY (deal_id, seller_creative_review_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (seller_creative_review_id) REFERENCES seller_creative_review(id)
);

CREATE TABLE seller_creative_review (
    id text,
    member_id text,
    audit_feedback text,
    audit_status text,
    brand_id text,
    created_on text,
    creative_id text,
    deleted text,
    language_id text,
    last_modified text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE payment_rule_filtered_advertiser (
    advertiser_id text,
    payment_rule_id text,
    PRIMARY KEY (advertiser_id, payment_rule_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (payment_rule_id) REFERENCES payment_rule(id)
);

CREATE TABLE payment_rule_filtered_line_item (
    id text,
    payment_rule_id text,
    "name" text,
    PRIMARY KEY (id, payment_rule_id),
    FOREIGN KEY (id) REFERENCES line_item(id),
    FOREIGN KEY (payment_rule_id) REFERENCES payment_rule(id)
);

CREATE TABLE payment_rule_filtered_campaign (
    id text,
    payment_rule_id text,
    "name" text,
    PRIMARY KEY (id, payment_rule_id),
    FOREIGN KEY (payment_rule_id) REFERENCES payment_rule(id)
);

CREATE TABLE payment_rule (
    id text,
    publisher_id text,
    apply_cost_on_default text,
    buyer_type text,
    code text,
    cost_cpm text,
    daily_budget text,
    daily_budget_imps text,
    demand_filter_action text,
    description text,
    end_date text,
    last_modified text,
    lifetime_budget text,
    lifetime_budget_imps text,
    max_rev_share text,
    "name" text,
    pricing_type text,
    priority text,
    profile_id text,
    revshare text,
    start_date text,
    "state" text,
    target_ecpm text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE primary_ad_server (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
