CREATE TABLE languages (
    id text,
    kind text,
    language_code text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE audience_segment (
    id text,
    audience_segment_group_id text,
    allocation integer,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (audience_segment_group_id) REFERENCES audience_segment_group(id)
);

CREATE TABLE placement_assignment (
    ad_id text,
    placement_id text,
    active boolean,
    ssl_required boolean,
    PRIMARY KEY (ad_id, placement_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE ad_region (
    ad_id text,
    region_id text,
    PRIMARY KEY (ad_id, region_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (region_id) REFERENCES region(dart_id)
);

CREATE TABLE browser (
    browser_version_id text,
    dart_id text,
    kind text,
    major_version text,
    minor_version text,
    "name" text,
    PRIMARY KEY (browser_version_id)
);

CREATE TABLE ad_metro (
    ad_id text,
    metro_id text,
    PRIMARY KEY (ad_id, metro_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (metro_id) REFERENCES metro(dma_id)
);

CREATE TABLE creative_field (
    id text,
    profile_id text,
    account_id text,
    advertiser_id text,
    kind text,
    "name" text,
    subaccount_id text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE ad_city (
    ad_id text,
    city_id text,
    PRIMARY KEY (ad_id, city_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (city_id) REFERENCES city(dart_id)
);

CREATE TABLE creative_field_assignment (
    creative_field_id text,
    creative_field_value_id text,
    creative_id text,
    PRIMARY KEY (creative_field_id, creative_field_value_id, creative_id),
    FOREIGN KEY (creative_field_id) REFERENCES creative_field(id),
    FOREIGN KEY (creative_field_value_id) REFERENCES creative_field_value(id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE creative_field_value (
    id text,
    profile_id text,
    kind text,
    "value" text,
    PRIMARY KEY (id, profile_id)
);

CREATE TABLE placement (
    id text,
    profile_id text,
    account_id text,
    advertiser_id text,
    campaign_id text,
    site_id text,
    active_status text,
    ad_blocking_opt_out boolean,
    ad_serving_platform_id text,
    "comment" text,
    compatibility text,
    content_category_id text,
    create_info_time text,
    directory_site_id text,
    external_id text,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    is_primary boolean,
    key_name text,
    kind text,
    last_modified_info_time text,
    lookback_configuration_click_duration integer,
    lookback_configuration_post_impression_activities_duration integer,
    "name" text,
    partner_wrapping_data_link_status text,
    partner_wrapping_data_measurement_partner text,
    partner_wrapping_data_tag_wrapping_mode text,
    partner_wrapping_data_wrapped_tag text,
    payment_approved boolean,
    payment_source text,
    placement_group_id text,
    placement_strategy_id text,
    pricing_schedule_cap_cost_option text,
    pricing_schedule_end_date text,
    pricing_schedule_flighted boolean,
    pricing_schedule_floodlight_activity_id text,
    pricing_schedule_pricing_type text,
    pricing_schedule_start_date text,
    pricing_schedule_testing_start_date text,
    publisher_update_info_time text,
    site_served boolean,
    size_height integer,
    size_iab boolean,
    size_id text,
    size_kind text,
    size_width integer,
    ssl_required boolean,
    "status" text,
    subaccount_id text,
    tag_setting_additional_key_values text,
    tag_setting_include_click_through_urls boolean,
    tag_setting_include_click_tracking boolean,
    tag_setting_keyword_option text,
    video_active_view_opt_out boolean,
    video_settings_companion_settings_companions_disabled boolean,
    video_settings_companion_settings_image_only boolean,
    video_settings_companion_settings_kind text,
    video_settings_duration_seconds integer,
    video_settings_kind text,
    video_settings_oba_enabled boolean,
    video_settings_oba_settings_icon_click_through_url text,
    video_settings_oba_settings_icon_click_tracking_url text,
    video_settings_oba_settings_icon_view_tracking_url text,
    video_settings_oba_settings_program text,
    video_settings_oba_settings_resource_url text,
    video_settings_oba_settings_size_height integer,
    video_settings_oba_settings_size_iab boolean,
    video_settings_oba_settings_size_id text,
    video_settings_oba_settings_size_kind text,
    video_settings_oba_settings_size_width integer,
    video_settings_oba_settings_x_position text,
    video_settings_oba_settings_y_position text,
    video_settings_orientation text,
    video_settings_publisher_specification_id text,
    video_settings_skippable_settings_kind text,
    video_settings_skippable_settings_progress_offset_offset_percentage integer,
    video_settings_skippable_settings_progress_offset_offset_seconds integer,
    video_settings_skippable_settings_skip_offset_offset_percentage integer,
    video_settings_skippable_settings_skip_offset_offset_seconds integer,
    video_settings_skippable_settings_skippable boolean,
    video_settings_transcode_settings_enabled_video_formats text,
    video_settings_transcode_settings_kind text,
    vpaid_adapter_choice text,
    wrapping_opt_out boolean,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    profile_id text,
    account_id text,
    ad_serving_platform_id text,
    approved boolean,
    directory_site_id text,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    key_name text,
    kind text,
    "name" text,
    site_settings_active_view_opt_out boolean,
    site_settings_ad_blocking_opt_out boolean,
    site_settings_disable_new_cookie boolean,
    site_settings_tag_setting_additional_key_values text,
    site_settings_tag_setting_include_click_through_urls boolean,
    site_settings_tag_setting_include_click_tracking boolean,
    site_settings_tag_setting_keyword_option text,
    site_settings_video_active_view_opt_out_template boolean,
    site_settings_vpaid_adapter_choice_template text,
    subaccount_id text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE audience_segment_group (
    id text,
    campaign_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE third_party_tracking_url (
    _fivetran_id text,
    creative_id text,
    third_party_url_type text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE pricing_period (
    _fivetran_id text,
    placement_id text,
    end_date text,
    pricing_comment text,
    rate_or_cost_nanos text,
    start_date text,
    units text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (placement_id) REFERENCES placement(id)
);

CREATE TABLE country (
    dart_id text,
    country_code text,
    kind text,
    "name" text,
    ssl_enabled boolean,
    PRIMARY KEY (dart_id)
);

CREATE TABLE companion_creative (
    companion_creative_id text,
    creative_id text,
    PRIMARY KEY (companion_creative_id, creative_id),
    FOREIGN KEY (companion_creative_id) REFERENCES creative_asset(id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE ad_connection_type (
    ad_id text,
    connection_type_id text,
    PRIMARY KEY (ad_id, connection_type_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (connection_type_id) REFERENCES connection_type(id)
);

CREATE TABLE operating_system_version (
    id text,
    operating_system_dart_id text,
    kind text,
    major_version text,
    minor_version text,
    "name" text,
    operating_system_desktop boolean,
    operating_system_kind text,
    operating_system_mobile boolean,
    operating_system_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (operating_system_dart_id) REFERENCES operating_system(dart_id)
);

CREATE TABLE ad_language (
    ad_id text,
    language_id text,
    PRIMARY KEY (ad_id, language_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);

CREATE TABLE operating_system (
    dart_id text,
    desktop boolean,
    kind text,
    mobile boolean,
    "name" text,
    PRIMARY KEY (dart_id)
);

CREATE TABLE ad_postal_code (
    ad_id text,
    postal_code_id text,
    PRIMARY KEY (ad_id, postal_code_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (postal_code_id) REFERENCES postal_code(id)
);

CREATE TABLE creative (
    id text,
    profile_id text,
    account_id text,
    advertiser_id text,
    active boolean,
    ad_parameters text,
    allow_script_access boolean,
    archived boolean,
    artwork_type text,
    authoring_source text,
    authoring_tool text,
    auto_advance_images boolean,
    background_color text,
    backup_image_click_through_url_computed_click_through_url text,
    backup_image_click_through_url_custom_click_through_url text,
    backup_image_click_through_url_landing_page_id text,
    backup_image_reporting_label text,
    backup_image_target_window_custom_html text,
    backup_image_target_window_target_window_option text,
    commercial_id text,
    convert_flash_to_html_5 boolean,
    creative_asset_selection_default_asset_id text,
    dynamic_asset_selection boolean,
    fs_command_left integer,
    fs_command_position_option text,
    fs_command_top integer,
    fs_command_window_height integer,
    fs_command_window_width integer,
    html_code text,
    html_code_locked boolean,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    kind text,
    last_modified_info_time text,
    latest_trafficked_creative_id text,
    media_description text,
    media_duration double precision,
    "name" text,
    oba_icon_icon_click_through_url text,
    oba_icon_icon_click_tracking_url text,
    oba_icon_icon_view_tracking_url text,
    oba_icon_program text,
    oba_icon_resource_url text,
    oba_icon_size_height integer,
    oba_icon_size_iab boolean,
    oba_icon_size_id text,
    oba_icon_size_kind text,
    oba_icon_size_width integer,
    oba_icon_x_position text,
    oba_icon_y_position text,
    override_css text,
    progress_offset_offset_percentage integer,
    progress_offset_offset_seconds integer,
    redirect_url text,
    rendering_id text,
    required_flash_plugin_version text,
    required_flash_version integer,
    size_height integer,
    size_iab boolean,
    size_id text,
    size_kind text,
    size_width integer,
    skip_offset_offset_percentage integer,
    skip_offset_offset_seconds integer,
    skippable boolean,
    ssl_compliant boolean,
    ssl_override boolean,
    studio_advertiser_id text,
    studio_creative_id text,
    studio_trafficked_creative_id text,
    subaccount_id text,
    third_party_backup_image_impressions_url text,
    third_party_rich_media_impressions_url text,
    total_file_size text,
    "type" text,
    universal_ad_id_registry text,
    universal_ad_id_value text,
    version integer,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE ad_operating_system (
    ad_id text,
    operating_system_id text,
    PRIMARY KEY (ad_id, operating_system_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (operating_system_id) REFERENCES operating_system(dart_id)
);

CREATE TABLE connection_type (
    id text,
    kind text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad_mobile_carrier (
    ad_id text,
    mobile_carrier_id text,
    PRIMARY KEY (ad_id, mobile_carrier_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (mobile_carrier_id) REFERENCES mobile_carrier(id)
);

CREATE TABLE ad_operating_system_version (
    ad_id text,
    operating_system_version_id text,
    PRIMARY KEY (ad_id, operating_system_version_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (operating_system_version_id) REFERENCES operating_system_version(id)
);

CREATE TABLE region (
    dart_id text,
    country_dart_id text,
    country_code text,
    kind text,
    "name" text,
    region_code text,
    PRIMARY KEY (dart_id),
    FOREIGN KEY (country_dart_id) REFERENCES country(dart_id)
);

CREATE TABLE ad_country (
    ad_id text,
    country_id text,
    PRIMARY KEY (ad_id, country_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (country_id) REFERENCES country(dart_id)
);

CREATE TABLE metro (
    dma_id text,
    country_dart_id text,
    country_code text,
    dart_id text,
    kind text,
    metro_code text,
    "name" text,
    PRIMARY KEY (dma_id),
    FOREIGN KEY (country_dart_id) REFERENCES country(dart_id)
);

CREATE TABLE account (
    id text,
    profile_id text,
    country_id text,
    account_profile text,
    active boolean,
    active_ads_limit_tier text,
    active_view_opt_out boolean,
    currency_id text,
    default_creative_size_id text,
    description text,
    kind text,
    locale text,
    maximum_image_size text,
    "name" text,
    nielsen_ocr_enabled boolean,
    reports_configuration_exposure_to_conversion_enabled boolean,
    reports_configuration_lookback_configuration_click_duration integer,
    reports_configuration_lookback_configuration_post_impression_activities_duration integer,
    reports_configuration_report_generation_time_zone_id text,
    share_reports_with_twitter boolean,
    teaser_size_limit text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (country_id) REFERENCES country(dart_id)
);

CREATE TABLE creative_assignment (
    ad_id text,
    creative_id text,
    active boolean,
    apply_event_tags boolean,
    click_through_url_computed_click_through_url text,
    click_through_url_custom_click_through_url text,
    click_through_url_default_landing_page boolean,
    click_through_url_landing_page_id text,
    end_time text,
    "sequence" integer,
    ssl_compliant boolean,
    start_time text,
    weight integer,
    PRIMARY KEY (ad_id, creative_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE campaign (
    id text,
    profile_id text,
    account_id text,
    advertiser_id text,
    ad_blocking_configuration_enabled boolean,
    advertiser_group_id text,
    archived boolean,
    billing_invoice_code text,
    click_through_url_suffix_properties_click_through_url_suffix text,
    click_through_url_suffix_properties_override_inherited_suffix boolean,
    "comment" text,
    create_info_time text,
    default_click_through_event_tag_properties_default_click_through_event_tag_id text,
    default_click_through_event_tag_properties_override_inherited_event_tag boolean,
    default_landing_page_id text,
    end_date text,
    external_id text,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    kind text,
    last_modified_info_time text,
    measurement_partner_link_link_status text,
    measurement_partner_link_measurement_partner text,
    measurement_partner_link_partner_campaign_id text,
    "name" text,
    start_date text,
    subaccount_id text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE ad_browser (
    ad_id text,
    browser_id text,
    PRIMARY KEY (ad_id, browser_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (browser_id) REFERENCES browser(browser_version_id)
);

CREATE TABLE creative_asset (
    id text,
    creative_id text,
    action_script_3 boolean,
    active boolean,
    alignment text,
    artwork_type text,
    asset_identifier_name text,
    asset_identifier_type text,
    audio_bit_rate integer,
    audio_sample_rate integer,
    backup_image_exit_advertiser_custom_event_id text,
    backup_image_exit_advertiser_custom_event_name text,
    backup_image_exit_advertiser_custom_event_type text,
    backup_image_exit_artwork_label text,
    backup_image_exit_artwork_type text,
    backup_image_exit_exit_click_through_url_computed_click_through_url text,
    backup_image_exit_exit_click_through_url_custom_click_through_url text,
    backup_image_exit_exit_click_through_url_landing_page_id text,
    backup_image_exit_id text,
    backup_image_exit_popup_window_properties_dimension_height integer,
    backup_image_exit_popup_window_properties_dimension_iab boolean,
    backup_image_exit_popup_window_properties_dimension_id text,
    backup_image_exit_popup_window_properties_dimension_kind text,
    backup_image_exit_popup_window_properties_dimension_width integer,
    backup_image_exit_popup_window_properties_offset_left integer,
    backup_image_exit_popup_window_properties_offset_top integer,
    backup_image_exit_popup_window_properties_position_type text,
    backup_image_exit_popup_window_properties_show_address_bar boolean,
    backup_image_exit_popup_window_properties_show_menu_bar boolean,
    backup_image_exit_popup_window_properties_show_scroll_bar boolean,
    backup_image_exit_popup_window_properties_show_status_bar boolean,
    backup_image_exit_popup_window_properties_show_tool_bar boolean,
    backup_image_exit_popup_window_properties_title text,
    backup_image_exit_target_type text,
    backup_image_exit_video_reporting_id text,
    bit_rate integer,
    child_asset_type text,
    collapsed_size_height integer,
    collapsed_size_iab boolean,
    collapsed_size_id text,
    collapsed_size_kind text,
    collapsed_size_width integer,
    custom_start_time_value integer,
    display_type text,
    duration integer,
    duration_type text,
    expanded_dimension_height integer,
    expanded_dimension_iab boolean,
    expanded_dimension_id text,
    expanded_dimension_kind text,
    expanded_dimension_width integer,
    file_size text,
    flash_version integer,
    frame_rate double precision,
    hide_flash_objects boolean,
    hide_selection_boxes boolean,
    horizontally_locked boolean,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    media_duration double precision,
    mime_type text,
    offset_left integer,
    offset_top integer,
    orientation text,
    original_backup boolean,
    polite_load boolean,
    position_left integer,
    position_left_unit text,
    position_top integer,
    position_top_unit text,
    progressive_serving_url text,
    pushdown boolean,
    pushdown_duration double precision,
    "role" text,
    size_height integer,
    size_iab boolean,
    size_id text,
    size_kind text,
    size_width integer,
    ssl_compliant boolean,
    start_time_type text,
    streaming_serving_url text,
    transparency boolean,
    vertically_locked boolean,
    window_mode text,
    z_index integer,
    zip_filename text,
    zip_filesize text,
    PRIMARY KEY (id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);

CREATE TABLE city (
    dart_id text,
    country_dart_id text,
    metro_dma_id text,
    region_dart_id text,
    country_code text,
    kind text,
    metro_code text,
    "name" text,
    region_code text,
    PRIMARY KEY (dart_id),
    FOREIGN KEY (country_dart_id) REFERENCES country(dart_id),
    FOREIGN KEY (metro_dma_id) REFERENCES metro(dma_id),
    FOREIGN KEY (region_dart_id) REFERENCES region(dart_id)
);

CREATE TABLE ad_platform_type (
    ad_id text,
    platform_type_id text,
    PRIMARY KEY (ad_id, platform_type_id),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (platform_type_id) REFERENCES platform_type(id)
);

CREATE TABLE postal_code (
    id text,
    country_dart_id text,
    code text,
    country_code text,
    kind text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_dart_id) REFERENCES country(dart_id)
);

CREATE TABLE mobile_carrier (
    id text,
    country_dart_id text,
    country_code text,
    kind text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_dart_id) REFERENCES country(dart_id)
);

CREATE TABLE platform_type (
    id text,
    kind text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad (
    id text,
    profile_id text,
    account_id text,
    advertiser_id text,
    audience_segment_id text,
    campaign_id text,
    active boolean,
    archived boolean,
    click_through_url_computed_click_through_url text,
    click_through_url_custom_click_through_url text,
    click_through_url_default_landing_page boolean,
    click_through_url_landing_page_id text,
    click_through_url_suffix_properties_click_through_url_suffix text,
    click_through_url_suffix_properties_override_inherited_suffix boolean,
    comments text,
    compatibility text,
    create_info_time text,
    creative_rotation_creative_optimization_configuration_id text,
    creative_rotation_type text,
    creative_rotation_weight_calculation_strategy text,
    delivery_schedule_frequency_cap_duration text,
    delivery_schedule_frequency_cap_impressions text,
    delivery_schedule_hard_cutoff boolean,
    delivery_schedule_impression_ratio text,
    delivery_schedule_priority text,
    dynamic_click_tracker boolean,
    end_time text,
    geo_targeting_exclude_countries boolean,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    key_value_targeting_expression_expression text,
    kind text,
    last_modified_info_time text,
    "name" text,
    remarketing_list_expression_expression text,
    size_height integer,
    size_iab boolean,
    size_id text,
    size_kind text,
    size_width integer,
    ssl_compliant boolean,
    ssl_required boolean,
    start_time text,
    subaccount_id text,
    targeting_template_id text,
    "type" text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (audience_segment_id) REFERENCES audience_segment(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE advertiser (
    id text,
    profile_id text,
    account_id text,
    advertiser_group_id text,
    click_through_url_suffix text,
    default_click_through_event_tag_id text,
    default_email text,
    floodlight_configuration_id text,
    id_dimension_value_dimension_name text,
    id_dimension_value_etag text,
    id_dimension_value_id text,
    id_dimension_value_kind text,
    id_dimension_value_match_type text,
    id_dimension_value_value text,
    kind text,
    measurement_partner_link_link_status text,
    measurement_partner_link_measurement_partner text,
    measurement_partner_link_partner_advertiser_id text,
    "name" text,
    original_floodlight_configuration_id text,
    "status" text,
    subaccount_id text,
    suspended boolean,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
