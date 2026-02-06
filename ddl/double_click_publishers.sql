CREATE TABLE order_applied_label (
    label_id bigint,
    order_id bigint,
    is_negated boolean,
    PRIMARY KEY (label_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE creative_tracking_url (
    "index" integer,
    "key" text,
    creative_id bigint,
    "value" text,
    PRIMARY KEY ("index", "key", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE company (
    id bigint,
    address text,
    applied_team_ids jsonb,
    "comment" text,
    credit_status text,
    email text,
    external_id text,
    fax_phone text,
    last_modified_date_time timestamp,
    "name" text,
    primary_contact_id bigint,
    primary_phone text,
    third_party_company_id integer,
    "type" text,
    -- child_publisher_* (dynamic column),
    -- viewability_provider_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE line_item_frequency_cap (
    "index" integer,
    line_item_id bigint,
    max_impressions integer,
    num_time_units integer,
    time_unit text,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE order_applied_team (
    team_id bigint,
    order_id bigint,
    PRIMARY KEY (team_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE creative_applied_label (
    label_id bigint,
    creative_id bigint,
    is_negated boolean,
    PRIMARY KEY (label_id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative_third_party_company (
    third_party_company_id bigint,
    creative_id bigint,
    PRIMARY KEY (third_party_company_id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE orders (
    id bigint,
    advertiser_id bigint,
    agency_id bigint,
    creator_id bigint,
    salesperson_id bigint,
    trafficker_id bigint,
    currency_code text,
    end_date_time timestamp,
    external_order_id integer,
    is_archived boolean,
    is_programmatic boolean,
    last_modified_by_app text,
    last_modified_date_time timestamp,
    "name" text,
    notes text,
    po_number text,
    start_date_time timestamp,
    "status" text,
    total_budget_currency_code text,
    total_budget_micro_amount bigint,
    total_clicks_delivered bigint,
    total_impressions_delivered bigint,
    total_viewable_impressions_delivered bigint,
    unlimited_end_date_time boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES company(id),
    FOREIGN KEY (agency_id) REFERENCES company(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (salesperson_id) REFERENCES users(id),
    FOREIGN KEY (trafficker_id) REFERENCES users(id)
);

CREATE TABLE targeting_preset_geo_excluded_location (
    id bigint,
    targeting_preset_id bigint,
    canonical_parent_id integer,
    display_name text,
    "type" text,
    PRIMARY KEY (id, targeting_preset_id),
    FOREIGN KEY (targeting_preset_id) REFERENCES targeting_preset(id)
);

CREATE TABLE order_secondary_trafficker (
    order_id bigint,
    user_id bigint,
    PRIMARY KEY (order_id, user_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_custom_field_value (
    custom_field_id bigint,
    order_id bigint,
    PRIMARY KEY (custom_field_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE line_item_applied_label (
    label_id bigint,
    line_item_id bigint,
    is_negated boolean,
    PRIMARY KEY (label_id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE ad_unit_size (
    environment_type text,
    "index" integer,
    ad_unit_id text,
    full_display_string text,
    is_audio boolean,
    size_height integer,
    size_is_aspect_ratio boolean,
    size_width integer,
    PRIMARY KEY (environment_type, "index", ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE line_item_secondary_goal (
    "index" integer,
    line_item_id bigint,
    goal_type text,
    unit_type text,
    units bigint,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_creative_association_size (
    "index" integer,
    creative_id bigint,
    line_item_id bigint,
    height integer,
    is_aspect_ratio boolean,
    width integer,
    PRIMARY KEY ("index", creative_id, line_item_id),
    FOREIGN KEY (creative_id) REFERENCES line_item_creative_association(creative_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item_creative_association(line_item_id)
);

CREATE TABLE order_agency_contact (
    agency_contact_id bigint,
    order_id bigint,
    PRIMARY KEY (agency_contact_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE line_item_custom_field_value (
    custom_field_id bigint,
    line_item_id bigint,
    custom_field_option_id bigint,
    "type" text,
    "value" text,
    value_type text,
    PRIMARY KEY (custom_field_id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE ad_unit_effective_team (
    team_id bigint,
    ad_unit_id text,
    PRIMARY KEY (team_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE ad_unit_applied_team (
    team_id bigint,
    ad_unit_id text,
    PRIMARY KEY (team_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE placement_targeted_ad_unit (
    ad_unit_id text,
    placement_id bigint,
    PRIMARY KEY (ad_unit_id, placement_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE creative_audio_asset (
    "index" integer,
    creative_id bigint,
    redirect_url text,
    -- metadata_* (dynamic column),
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative_video_asset (
    "index" integer,
    creative_id bigint,
    redirect_url text,
    -- metadata_* (dynamic column),
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE line_item (
    id bigint,
    allow_overbook boolean,
    allowed_formats text,
    auto_extension_days integer,
    budget_currency_code text,
    budget_micro_amount bigint,
    child_content_eligibility text,
    companion_delivery_option text,
    competitive_constraint_scope text,
    contracted_units_bought bigint,
    cost_per_unit_currency_code text,
    cost_per_unit_micro_amount bigint,
    cost_type text,
    creation_date_time timestamp,
    creative_rotation_type text,
    custom_pacing_curve_custom_pacing_goal_unit text,
    custom_vast_extension text,
    deal_info_external_deal_id bigint,
    delivery_forecast_source text,
    delivery_indicator_actual_delivery_percentage double precision,
    delivery_indicator_expected_delivery_percentage double precision,
    delivery_rate_type text,
    disable_same_advertiser_competitive_exclusion boolean,
    discount double precision,
    discount_type text,
    end_date_time timestamp,
    environment_type text,
    external_id text,
    is_archived boolean,
    is_missing_creatives boolean,
    last_modified_by_app text,
    last_modified_date_time timestamp,
    line_item_type text,
    "name" text,
    notes text,
    order_id bigint,
    order_name text,
    primary_goal_goal_type text,
    primary_goal_unit_type text,
    primary_goal_units bigint,
    priority integer,
    programmatic_creative_source text,
    repeated_creative_serving_enabled boolean,
    reservation_status text,
    reserve_at_creation boolean,
    roadblocking_type text,
    skip_cross_selling_rule_warning_checks boolean,
    skip_inventory_check boolean,
    skippable_ad_type text,
    start_date_time timestamp,
    start_date_time_type text,
    "status" text,
    unlimited_end_date_time boolean,
    value_cost_per_unit_currency_code text,
    value_cost_per_unit_micro_amount bigint,
    video_max_duration bigint,
    web_property_code text,
    youtube_kids_restricted boolean,
    -- grp_settings_* (dynamic column),
    -- stats_* (dynamic column),
    -- targeting_* (dynamic column),
    -- third_party_ms_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE targeting_preset_geo_targeted_location (
    id bigint,
    targeting_preset_id bigint,
    canonical_parent_id integer,
    display_name text,
    "type" text,
    PRIMARY KEY (id, targeting_preset_id),
    FOREIGN KEY (targeting_preset_id) REFERENCES targeting_preset(id)
);

CREATE TABLE order_advertiser_contact (
    advertiser_contact_id bigint,
    order_id bigint,
    PRIMARY KEY (advertiser_contact_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE line_item_effective_applied_label (
    label_id bigint,
    line_item_id bigint,
    is_negated boolean,
    PRIMARY KEY (label_id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE ad_unit (
    id text,
    parent_id text,
    ad_unit_code text,
    application_id bigint,
    description text,
    explicitly_targeted boolean,
    external_set_top_box_channel_id text,
    has_children boolean,
    is_fluid boolean,
    is_interstitial boolean,
    is_native boolean,
    is_set_top_box_enabled boolean,
    last_modified_date_time timestamp,
    "name" text,
    refresh_rate integer,
    smart_size_mode text,
    "status" text,
    target_window text,
    -- ad_sense_settings_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES ad_unit(id)
);

CREATE TABLE ad_unit_applied_label (
    label_id bigint,
    ad_unit_id text,
    is_negated boolean,
    PRIMARY KEY (label_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE ad_unit_effective_applied_label (
    label_id bigint,
    ad_unit_id text,
    is_negated boolean,
    PRIMARY KEY (label_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE targeting_preset_inventory_targeted_ad_unit (
    ad_unit_id text,
    targeting_preset_id bigint,
    include_descendants boolean,
    PRIMARY KEY (ad_unit_id, targeting_preset_id),
    FOREIGN KEY (targeting_preset_id) REFERENCES targeting_preset(id)
);

CREATE TABLE ad_unit_parent_path (
    parent_ad_unit_id text,
    ad_unit_id text,
    parent_ad_unit_code text,
    parent_ad_unit_name text,
    PRIMARY KEY (parent_ad_unit_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE users (
    id bigint,
    external_id text,
    is_active boolean,
    is_service_account boolean,
    "name" text,
    orders_ui_local_time_zone_id text,
    role_id bigint,
    role_name text,
    PRIMARY KEY (id)
);

CREATE TABLE targeting_preset_inventory_excluded_ad_unit (
    ad_unit_id text,
    targeting_preset_id bigint,
    include_descendants boolean,
    PRIMARY KEY (ad_unit_id, targeting_preset_id),
    FOREIGN KEY (targeting_preset_id) REFERENCES targeting_preset(id)
);

CREATE TABLE targeting_preset_inventory_targeted_placement_id (
    placement_id bigint,
    targeting_preset_id bigint,
    PRIMARY KEY (placement_id, targeting_preset_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id),
    FOREIGN KEY (targeting_preset_id) REFERENCES targeting_preset(id)
);

CREATE TABLE targeting_preset (
    id bigint,
    "name" text,
    -- targeting_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE creative_third_party_impression_tracking_url (
    "index" integer,
    creative_id bigint,
    "value" text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE line_item_creative_association (
    creative_id bigint,
    line_item_id bigint,
    creative_set_id bigint,
    destination_url text,
    end_date_time timestamp,
    last_modified_date_time timestamp,
    manual_creative_rotation_weight double precision,
    sequential_creative_rotation_index integer,
    start_date_time timestamp,
    start_date_time_type text,
    stats_stats_clicks_delivered bigint,
    stats_stats_impressions_delivered bigint,
    stats_stats_video_completions_delivered bigint,
    stats_stats_video_starts_delivered bigint,
    stats_stats_viewable_impressions_delivered bigint,
    "status" text,
    targeting_name text,
    PRIMARY KEY (creative_id, line_item_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE creative_asset_property (
    "index" integer,
    creative_id bigint,
    height integer,
    "name" text,
    total_file_size bigint,
    "type" text,
    url text,
    width integer,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE order_effective_applied_label (
    label_id bigint,
    order_id bigint,
    is_negated boolean,
    PRIMARY KEY (label_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE creative_ad_tag_key (
    "index" integer,
    creative_id bigint,
    "value" text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE placement (
    id bigint,
    description text,
    last_modified_date_time timestamp,
    "name" text,
    placement_code text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE creative (
    id bigint,
    advertiser_id bigint,
    ad_badging_enabled boolean,
    ad_id text,
    ad_id_type text,
    all_impressions_url text,
    allow_duration_override boolean,
    alt_text text,
    amp_redirect_url text,
    artwork_type text,
    asset_size_height integer,
    asset_size_is_aspect_ratio boolean,
    asset_size_width integer,
    audio_source_url text,
    backup_image_impressions_url text,
    billing_attribute text,
    click_tracking_url text,
    code_snippet text,
    creative_format text,
    creative_template_id bigint,
    custom_parameters text,
    destination_url text,
    destination_url_type text,
    duration integer,
    expanded_snippet text,
    external_asset_id text,
    html_snippet text,
    image_url text,
    internal_redirect_url text,
    is_allows_all_requested_sizes boolean,
    is_audio boolean,
    is_interstitial boolean,
    is_native_eligible boolean,
    is_safe_frame_compatible boolean,
    last_modified_date_time timestamp,
    license_window_end_date_time timestamp,
    license_window_start_date_time timestamp,
    locked_orientation text,
    mezzanine_file_metadata_bit_rate integer,
    mezzanine_file_metadata_delivery_type text,
    mezzanine_file_metadata_duration integer,
    mezzanine_file_metadata_maximum_bit_rate integer,
    mezzanine_file_metadata_mime_type text,
    mezzanine_file_metadata_minimum_bit_rate integer,
    mezzanine_file_metadata_scalable_type text,
    mezzanine_file_metadata_size_height integer,
    mezzanine_file_metadata_size_is_aspect_ratio boolean,
    mezzanine_file_metadata_size_width integer,
    mezzanine_file_redirect_url text,
    "name" text,
    override_css text,
    override_size boolean,
    preview_url text,
    provider_id text,
    required_flash_plugin_version text,
    rich_media_impressions_url text,
    scan_result text,
    size_height integer,
    size_is_aspect_ratio boolean,
    size_width integer,
    skippable_ad_type text,
    snippet text,
    ssl_manual_override text,
    studio_creative_id bigint,
    survey_url text,
    third_party_click_tracking_url text,
    total_file_size bigint,
    "type" text,
    unsupported_creative_type text,
    vast_preview_url text,
    vast_redirect_type text,
    vast_xml_url text,
    video_source_url text,
    -- html5_asset_* (dynamic column),
    -- primary_image_asset_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES company(id)
);

CREATE TABLE line_item_delivery_data_unit (
    "index" integer,
    line_item_id bigint,
    units bigint,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_creative_targeting (
    "index" integer,
    line_item_id bigint,
    "name" text,
    -- targeting_* (dynamic column),
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE order_secondary_salesperson (
    order_id bigint,
    user_id bigint,
    PRIMARY KEY (order_id, user_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE creative_asset (
    "index" integer,
    creative_id bigint,
    asset_byte_array text,
    asset_url text,
    file_name text,
    file_size bigint,
    id bigint,
    image_density text,
    size_height integer,
    size_is_aspect_ratio boolean,
    size_width integer,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative_policy_label (
    label text,
    creative_id bigint,
    PRIMARY KEY (label, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative_companion (
    companion_creative_id bigint,
    creative_id bigint,
    PRIMARY KEY (companion_creative_id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE line_item_activity_association (
    activity_id integer,
    line_item_id bigint,
    click_through_conversion_cost numeric,
    view_through_conversion_cost numeric,
    PRIMARY KEY (activity_id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE creative_custom_field_value (
    custom_field_id bigint,
    creative_id bigint,
    custom_field_option_id bigint,
    "type" text,
    "value" text,
    value_type text,
    PRIMARY KEY (custom_field_id, creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE ad_unit_applied_label_frequency_cap (
    label_id bigint,
    ad_unit_id text,
    max_impressions integer,
    num_time_units integer,
    time_unit text,
    PRIMARY KEY (label_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);

CREATE TABLE line_item_viewability_provider_company (
    company_id bigint,
    line_item_id bigint,
    PRIMARY KEY (company_id, line_item_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE creative_custom_key_value (
    "index" integer,
    creative_id bigint,
    "value" text,
    PRIMARY KEY ("index", creative_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative_placeholder (
    "index" integer,
    line_item_id bigint,
    creative_size_type text,
    creative_template_id bigint,
    expected_creative_count integer,
    is_amp_only boolean,
    size_height integer,
    size_is_aspect_ratio boolean,
    size_width integer,
    targeting_name text,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item_custom_pacing_goal (
    "index" integer,
    line_item_id bigint,
    amount bigint,
    start_date_time timestamp,
    use_line_item_start_date_time boolean,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE ad_unit_effective_label_frequency_cap (
    label_id bigint,
    ad_unit_id text,
    max_impressions integer,
    num_time_units integer,
    time_unit text,
    PRIMARY KEY (label_id, ad_unit_id),
    FOREIGN KEY (ad_unit_id) REFERENCES ad_unit(id)
);
