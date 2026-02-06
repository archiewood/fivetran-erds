CREATE TABLE device_enrollment (
    id text,
    supervision_identity_id text,
    admin_id text,
    "name" text,
    org_address text,
    org_email text,
    org_name text,
    org_phone text,
    server_name text,
    server_uuid text,
    site_id text,
    token_expiration_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (supervision_identity_id) REFERENCES supervision_identity(id)
);

CREATE TABLE startup_status (
    _fivetran_id text,
    error text,
    error_code text,
    percentage text,
    setup_assistant_necessary text,
    step text,
    step_code text,
    step_param text,
    warning text,
    warning_code text,
    warning_param text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE sso_history_object (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE server_configuration (
    id text,
    mapping_user_id text,
    deprecated_consent text,
    enabled text,
    membership_calculation_optimization_enabled text,
    migrated text,
    search_timeout text,
    tenant_id text,
    transitive_directory_membership_enabled text,
    transitive_membership_enabled text,
    transitive_membership_user_field text,
    PRIMARY KEY (id),
    FOREIGN KEY (mapping_user_id) REFERENCES mapping(user_id)
);

CREATE TABLE sso_host (
    "index" text,
    sso_id text,
    host text,
    PRIMARY KEY ("index", sso_id),
    FOREIGN KEY (sso_id) REFERENCES sso(id)
);

CREATE TABLE sso (
    id text,
    enrollment_sso_for_account_driven_enrollment_enabled text,
    federation_metadata_file text,
    group_attribute_name text,
    group_enrollment_access_enabled text,
    group_enrollment_access_name text,
    group_rdn_key text,
    idp_provider_type text,
    idp_url text,
    management_hint text,
    metadata_file_name text,
    metadata_source text,
    other_provider_type_name text,
    session_timeout text,
    sso_bypass_allowed text,
    sso_enabled text,
    sso_for_enrollment_enabled text,
    sso_for_mac_os_self_service_enabled text,
    token_expiration_disabled text,
    user_attribute_enabled text,
    user_attribute_name text,
    user_mapping text,
    PRIMARY KEY (id)
);

CREATE TABLE mobile_device_group (
    id text,
    is_smart_group text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE app_setting (
    _fivetran_id text,
    app_store_locale text,
    approver_email jsonb,
    is_enabled text,
    requester_user_group_id text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE cloud_identity (
    id text,
    display_name text,
    enabled text,
    provider_name text,
    PRIMARY KEY (id)
);

CREATE TABLE computer_inventory_capable_user (
    "index" text,
    computer_inventory_id text,
    users text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_cache_detail (
    id text,
    computer_inventory_id text,
    category_name text,
    disk_space_bytes_used text,
    PRIMARY KEY (id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_alert (
    "index" text,
    computer_inventory_id text,
    cache_bytes_limit text,
    class_name text,
    path_preventing_access text,
    post_date text,
    reserved_volume_bytes text,
    resource text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_value (
    "index" text,
    computer_inventory_extension_index text,
    computer_inventory_id text,
    "value" text,
    PRIMARY KEY ("index", computer_inventory_extension_index, computer_inventory_id),
    FOREIGN KEY (computer_inventory_extension_index) REFERENCES computer_inventory_extension("index"),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory_extension(computer_inventory_id)
);

CREATE TABLE computer_option (
    "index" text,
    computer_inventory_extension_index text,
    computer_inventory_id text,
    "option" text,
    PRIMARY KEY ("index", computer_inventory_extension_index, computer_inventory_id),
    FOREIGN KEY (computer_inventory_extension_index) REFERENCES computer_inventory_extension("index"),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory_extension(computer_inventory_id)
);

CREATE TABLE computer_inventory_extension (
    "index" text,
    computer_inventory_id text,
    data_type text,
    definition_id text,
    description text,
    enabled text,
    input_type text,
    multi_value text,
    "name" text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_parent_local_network (
    id text,
    computer_inventory_id text,
    computer_inventory_parent_id text,
    speed text,
    wired text,
    PRIMARY KEY (id, computer_inventory_id, computer_inventory_parent_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory_parent(computer_inventory_id),
    FOREIGN KEY (computer_inventory_parent_id) REFERENCES computer_inventory_parent(id)
);

CREATE TABLE computer_inventory_parent (
    id text,
    computer_inventory_id text,
    address text,
    alert_addresses jsonb,
    alert_class_name text,
    alert_content_caching_parent_alert_id text,
    alert_post_date text,
    detail_ac_power text,
    detail_cache_size_bytes text,
    detail_capability_content_caching_parent_capabilities_id text,
    detail_capability_imports text,
    detail_capability_name_space text,
    detail_capability_personal_content text,
    detail_capability_prioritization text,
    detail_capability_query_parameter text,
    detail_capability_shared_content text,
    detail_content_caching_parent_details_id text,
    detail_portable text,
    guid text,
    healthy text,
    port text,
    version text,
    PRIMARY KEY (id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_software_update (
    "index" text,
    computer_inventory_id text,
    "name" text,
    package_name text,
    version text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_attachment (
    id text,
    computer_inventory_id text,
    file_type text,
    "name" text,
    size_byte text,
    PRIMARY KEY (id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_ibeacon (
    "index" text,
    computer_inventory_id text,
    "name" text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_licensed_software (
    id text,
    computer_inventory_id text,
    "name" text,
    PRIMARY KEY (id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_font (
    "index" text,
    computer_inventory_id text,
    "name" text,
    "path" text,
    version text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_plugin (
    "index" text,
    computer_inventory_id text,
    "name" text,
    "path" text,
    version text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_certificate (
    "index" text,
    computer_inventory_id text,
    certificate_status text,
    common_name text,
    expiration_date text,
    identities text,
    issued_date text,
    lifecycle_status text,
    serial_number text,
    sha_1_fingerprint text,
    subject_name text,
    username text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_local_user_account (
    id text,
    computer_inventory_id text,
    "admin" text,
    azure_active_directory_id text,
    computer_azure_active_directory_id text,
    file_vault_2_enabled text,
    full_name text,
    home_directory text,
    home_directory_size_mb text,
    password_history_depth text,
    password_max_age text,
    password_min_complex_character text,
    password_min_length text,
    password_require_alphanumeric text,
    user_account_type text,
    user_azure_active_directory_id text,
    user_guid text,
    username text,
    PRIMARY KEY (id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_service (
    "index" text,
    computer_inventory_id text,
    "name" text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_printer (
    "index" text,
    computer_inventory_id text,
    location text,
    "name" text,
    "type" text,
    uri text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_configuration_profile (
    "index" text,
    computer_inventory_id text,
    display_name text,
    id text,
    last_installed text,
    profile_identifier text,
    removable text,
    username text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_disk_portition (
    "index" text,
    computer_inventory_disk_id text,
    computer_inventory_id text,
    available_mega text,
    bytes text,
    file_vault_2_progress_percent text,
    file_vault_2_state text,
    lvm_managed text,
    "name" text,
    partition_type text,
    percent_used text,
    size_mega_bytes text,
    PRIMARY KEY ("index", computer_inventory_disk_id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_disk_id) REFERENCES computer_inventory_disk(id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory_disk(computer_inventory_id)
);

CREATE TABLE computer_inventory_disk (
    id text,
    computer_inventory_id text,
    device text,
    model text,
    revision text,
    serial_number text,
    size_mega_bytes text,
    smart_status text,
    "type" text,
    PRIMARY KEY (id, computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_application (
    "index" text,
    computer_inventory_id text,
    bundle_id text,
    external_version_id text,
    mac_app_store text,
    "name" text,
    "path" text,
    size_megabytes text,
    update_available text,
    version text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_file_vault (
    "index" text,
    computer_inventory_id text,
    file_vault_2_enabled_user_name text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory_group_membership (
    computer_inventory_id text,
    id text,
    group_name text,
    smart_group text,
    PRIMARY KEY (computer_inventory_id, id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id),
    FOREIGN KEY (id) REFERENCES computer_group(id)
);

CREATE TABLE computer_inventory_content_caching_data_migration_user_info (
    "index" text,
    computer_inventory_id text,
    "key" text,
    "value" text,
    PRIMARY KEY ("index", computer_inventory_id),
    FOREIGN KEY (computer_inventory_id) REFERENCES computer_inventory(id)
);

CREATE TABLE computer_inventory (
    id text,
    asset_tag text,
    barcode_1 text,
    barcode_2 text,
    boot_partition_encryption_detail_partition_file_vault_2_percent text,
    boot_partition_encryption_detail_partition_file_vault_2_state text,
    boot_partition_encryption_detail_partition_name text,
    content_cache_activated text,
    content_cache_active text,
    content_cache_actual_cache_bytes_used text,
    content_cache_bytes_free text,
    content_cache_bytes_limit text,
    content_cache_bytes_used text,
    content_cache_computer_content_caching_information_id text,
    content_cache_data_migration_completed text,
    content_cache_data_migration_progress_percentage text,
    content_cache_max_cache_pressure_last_1_hour_percentage text,
    content_cache_personal_cache_bytes_free text,
    content_cache_personal_cache_bytes_limit text,
    content_cache_personal_cache_bytes_used text,
    content_cache_port text,
    content_cache_public_address text,
    content_cache_registration_error text,
    content_cache_registration_response_code text,
    content_cache_registration_started text,
    content_cache_registration_status text,
    content_cache_restricted_media text,
    content_cache_server_guid text,
    content_cache_startup_status text,
    content_cache_status text,
    content_cache_tetherator_status text,
    content_cache_total_bytes_are_since text,
    content_cache_total_bytes_dropped text,
    content_cache_total_bytes_imported text,
    content_cache_total_bytes_returned_to_children text,
    content_cache_total_bytes_returned_to_client text,
    content_cache_total_bytes_returned_to_peer text,
    content_cache_total_bytes_stored_from_origin text,
    content_cache_total_bytes_stored_from_parent text,
    content_cache_total_bytes_stored_from_peer text,
    content_caching_data_migration_error_code text,
    content_caching_data_migration_error_domain text,
    declarative_device_management_enabled text,
    disk_encryption_configuration_name text,
    disk_encryption_file_vault_2_eligibility_message text,
    disk_encryption_file_vault_2_enabled text,
    disk_encryption_individual_recovery_key_validity_status text,
    disk_encryption_institutional_recovery_key_present text,
    distribution_point text,
    enrolled_via_automated_device_enrollment text,
    general_enrollment_method_id text,
    general_enrollment_method_object_name text,
    general_enrollment_method_object_type text,
    general_mdm_capable text,
    general_remote_managed text,
    general_remote_management_username text,
    hardware_alt_mac_address text,
    hardware_alt_network_adapter_type text,
    hardware_apple_silicon text,
    hardware_battery_capacity_percent text,
    hardware_ble_capable text,
    hardware_boot_rom text,
    hardware_bus_speed_mhz text,
    hardware_cache_size_kilobytes text,
    hardware_core_count text,
    hardware_mac_address text,
    hardware_make text,
    hardware_model text,
    hardware_model_identifier text,
    hardware_network_adapter_type text,
    hardware_nic_speed text,
    hardware_open_ram_slot text,
    hardware_optical_drive text,
    hardware_processor_architecture text,
    hardware_processor_count text,
    hardware_processor_speed_mhz text,
    hardware_processor_type text,
    hardware_serial_number text,
    hardware_smc_version text,
    hardware_supports_ios_app_install text,
    hardware_total_ram_megabytes text,
    initial_entry_date text,
    is_leased text,
    is_purchased text,
    itunes_store_account_active text,
    jamf_binary_version text,
    last_cloud_backup_date text,
    last_contact_time text,
    last_enrolled_date text,
    last_ip_address text,
    last_reported_ip text,
    management_id text,
    mdm_profile_expiration text,
    "name" text,
    operating_system_active_directory_status text,
    operating_system_build text,
    operating_system_file_vault_2_status text,
    operating_system_name text,
    operating_system_rapid_security_response text,
    operating_system_software_update_device_id text,
    operating_system_supplemental_build_version text,
    operating_system_version text,
    package_receipt jsonb,
    platform text,
    purchasing_account text,
    purchasing_apple_care_id text,
    purchasing_contact text,
    purchasing_lease_date text,
    purchasing_life_expectancy text,
    purchasing_po_date text,
    purchasing_po_number text,
    purchasing_price text,
    purchasing_vendor text,
    purchasing_warranty_date text,
    report_date text,
    security_activation_lock_enabled text,
    security_attestation_status text,
    security_auto_login_disabled text,
    security_bootstrap_token_allowed text,
    security_bootstrap_token_escrowed_status text,
    security_external_boot_level text,
    security_firewall_enabled text,
    security_gate_keeper_status text,
    security_last_attestation_attempt text,
    security_last_successful_attestation text,
    security_recovery_lock_enabled text,
    security_remote_desktop_enabled text,
    security_secure_boot_level text,
    security_sip_status text,
    security_x_protect_version text,
    site_id text,
    site_name text,
    storage text,
    supervised text,
    udid text,
    user_and_location_building_id text,
    user_and_location_department_id text,
    user_and_location_email text,
    user_and_location_phone text,
    user_and_location_position text,
    user_and_location_realname text,
    user_and_location_room text,
    user_and_location_username text,
    user_approved_mdm text,
    PRIMARY KEY (id)
);

CREATE TABLE patch_software_title_configuration_extension (
    id text,
    patch_software_title_configuration_id text,
    accepted text,
    PRIMARY KEY (id, patch_software_title_configuration_id),
    FOREIGN KEY (patch_software_title_configuration_id) REFERENCES patch_software_title_configuration(id)
);

CREATE TABLE patch_software_title_configuration_package (
    id text,
    patch_software_title_configuration_id text,
    display_name text,
    version text,
    PRIMARY KEY (id, patch_software_title_configuration_id),
    FOREIGN KEY (patch_software_title_configuration_id) REFERENCES patch_software_title_configuration(id)
);

CREATE TABLE patch_software_title_configuration (
    id text,
    category_id text,
    display_name text,
    email_notification text,
    jamf_official text,
    patch_source_enabled text,
    patch_source_name text,
    site_id text,
    software_title_id text,
    software_title_name text,
    software_title_name_id text,
    software_title_publisher text,
    ui_notification text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE mapping (
    user_id text,
    group_id text,
    building text,
    department text,
    email text,
    group_name text,
    phone text,
    "position" text,
    real_name text,
    room text,
    user_name text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (group_id) REFERENCES static_group(id)
);

CREATE TABLE check_in (
    _fivetran_id text,
    check_in_frequency text,
    create_hook text,
    create_startup_script text,
    enable_local_configuration_profile text,
    hook_log text,
    hook_policy text,
    startup_log text,
    startup_policy text,
    startup_ssh text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE patch_policy_log (
    id text,
    ignored_for_patch_policy_id text,
    attempt_number text,
    device_id text,
    device_name text,
    status_code text,
    status_date text,
    status_enum text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES patch_policy(id),
    FOREIGN KEY (ignored_for_patch_policy_id) REFERENCES patch_policy(id)
);

CREATE TABLE mobile_device_object (
    id text,
    management_id text,
    model text,
    model_identifier text,
    "name" text,
    phone_number text,
    serial_number text,
    software_update_device_id text,
    "type" text,
    udid text,
    username text,
    wifi_mac_address text,
    PRIMARY KEY (id)
);

CREATE TABLE sso_dependency (
    _fivetran_id text,
    human_readable_name text,
    hyperlink text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE remote_administration_configuration (
    id text,
    display_name text,
    site_id text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE ios_configuration (
    id text,
    branding_name text,
    branding_name_color_code text,
    header_background_color_code text,
    icon_id text,
    menu_icon_color_code text,
    status_bar_text_color text,
    PRIMARY KEY (id)
);

CREATE TABLE cloud_identity_history (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES cloud_identity(id)
);

CREATE TABLE check_in_history (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE re_enrollment_object (
    _fivetran_id text,
    flush_mdm_queue text,
    is_flush_extension_attributes_enabled text,
    is_flush_location_information_enabled text,
    is_flush_location_information_history_enabled text,
    is_flush_policy_history_enabled text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE static_group (
    id text,
    count text,
    group_name text,
    site_id text,
    PRIMARY KEY (id)
);

CREATE TABLE enrollment_customization (
    id text,
    description text,
    display_name text,
    enrollment_customization_branding_setting_background_color text,
    enrollment_customization_branding_setting_button_color text,
    enrollment_customization_branding_setting_button_text_color text,
    enrollment_customization_branding_setting_icon_url text,
    enrollment_customization_branding_setting_text_color text,
    site_id text,
    PRIMARY KEY (id)
);

CREATE TABLE computer (
    id text,
    asset_tag text,
    ip_address text,
    is_managed text,
    last_contact_date text,
    last_enrolled_date text,
    last_report_date timestamp,
    location_building text,
    location_department text,
    location_email_address text,
    location_phone_number text,
    location_position text,
    location_real_name text,
    location_room text,
    location_username text,
    mac_address text,
    management_id text,
    mdm_access_right text,
    model_identifier text,
    "name" text,
    operating_system_build text,
    operating_system_rapid_security_response text,
    operating_system_supplemental_build_version text,
    operating_system_version text,
    serial_number text,
    site text,
    udid text,
    PRIMARY KEY (id)
);

CREATE TABLE api_role_privilege (
    "index" text,
    api_role_id text,
    privilege_id text,
    PRIMARY KEY ("index", api_role_id),
    FOREIGN KEY (api_role_id) REFERENCES api_role(id)
);

CREATE TABLE api_role (
    id text,
    display_name text,
    PRIMARY KEY (id)
);

CREATE TABLE authorization_detail_group_id (
    "index" text,
    authorization_detail_account_id text,
    group_id text,
    PRIMARY KEY ("index", authorization_detail_account_id),
    FOREIGN KEY (authorization_detail_account_id) REFERENCES authorization_detail(account_id),
    FOREIGN KEY (group_id) REFERENCES static_group(id)
);

CREATE TABLE authorization_account_group_member (
    "index" text,
    authorization_detail_account_group_index text,
    authorization_detail_account_id text,
    member_user_id text,
    PRIMARY KEY ("index", authorization_detail_account_group_index, authorization_detail_account_id),
    FOREIGN KEY (authorization_detail_account_group_index) REFERENCES authorization_detail_account_group("index"),
    FOREIGN KEY (authorization_detail_account_id) REFERENCES authorization_detail_account_group(authorization_detail_account_id)
);

CREATE TABLE authorization_detail_account_group (
    "index" text,
    authorization_detail_account_id text,
    access_level text,
    privilege_set text,
    privileges text,
    site_id text,
    PRIMARY KEY ("index", authorization_detail_account_id),
    FOREIGN KEY (authorization_detail_account_id) REFERENCES authorization_detail(account_id)
);

CREATE TABLE authorization_detail_site (
    id text,
    authorization_detail_account_id text,
    "name" text,
    PRIMARY KEY (id, authorization_detail_account_id),
    FOREIGN KEY (authorization_detail_account_id) REFERENCES authorization_detail(account_id)
);

CREATE TABLE authorization_detail (
    account_id text,
    account_access_level text,
    account_current_site_id text,
    account_date_format text,
    account_disable_relative_date text,
    account_email text,
    account_language text,
    account_multi_site_admin text,
    account_privilege_set text,
    account_real_name text,
    account_region text,
    account_timezone text,
    account_username text,
    -- custom_* (dynamic column),
    PRIMARY KEY (account_id)
);

CREATE TABLE mobile_device_extension_attribute_value (
    "index" text,
    mobile_device_detail_extension_attribute_id text,
    mobile_device_detail_id text,
    "value" text,
    PRIMARY KEY ("index", mobile_device_detail_extension_attribute_id, mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_extension_attribute_id) REFERENCES mobile_device_detail_extension_attribute(id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail_extension_attribute(mobile_device_detail_id)
);

CREATE TABLE mobile_device_detail_extension_attribute (
    id text,
    mobile_device_detail_id text,
    extension_attribute_collection_allowed text,
    inventory_display text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_application (
    "index" text,
    mobile_device_detail_id text,
    bundle_size text,
    dynamic_size text,
    identifier text,
    management_status text,
    "name" text,
    short_version text,
    validation_status text,
    version text,
    PRIMARY KEY ("index", mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_certificate (
    "index" text,
    mobile_device_detail_id text,
    common_name text,
    expiration_date text,
    identities text,
    PRIMARY KEY ("index", mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_profile (
    id text,
    mobile_device_detail_id text,
    display_name text,
    identifier text,
    last_installed text,
    removable text,
    version text,
    PRIMARY KEY (id, mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_user_profile (
    id text,
    mobile_device_detail_id text,
    display_name text,
    identifier text,
    last_installed text,
    removable text,
    username text,
    version text,
    PRIMARY KEY (id, mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_shared_user (
    "index" text,
    mobile_device_detail_id text,
    data_to_sync text,
    logged_in text,
    managed_apple_id text,
    PRIMARY KEY ("index", mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_service_subscription (
    e_id text,
    mobile_device_detail_id text,
    carrier_setting_version text,
    current_carrier_network text,
    current_mobile_country_code text,
    current_mobile_network_code text,
    data_preferred text,
    icc_id text,
    imei text,
    label text,
    label_id text,
    me_id text,
    phone_number text,
    roaming text,
    slot text,
    subscriber_carrier_network text,
    voice_preferred text,
    PRIMARY KEY (e_id, mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_e_book (
    "index" text,
    mobile_device_detail_id text,
    author text,
    kind text,
    management_state text,
    title text,
    version text,
    PRIMARY KEY ("index", mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail_provision_profile (
    id text,
    mobile_device_detail_id text,
    display_name text,
    expiration_date text,
    PRIMARY KEY (id, mobile_device_detail_id),
    FOREIGN KEY (mobile_device_detail_id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE mobile_device_detail (
    id text,
    air_play_password text,
    app_analytics_enabled text,
    asset_tag text,
    cloud_backup_enabled text,
    declarative_device_management_enabled text,
    device_locator_service_enabled text,
    device_ownership_type text,
    device_type text,
    diagnostic_and_usage_reporting_enabled text,
    display_name text,
    do_not_disturb_enabled text,
    enrollment_method_prestage_mobile_device_prestage_id text,
    enrollment_method_prestage_profile_name text,
    enrollment_session_token_valid text,
    exchange_device_id text,
    hardware_available_space_mb text,
    hardware_battery_level text,
    hardware_bluetooth_low_energy_capable text,
    hardware_bluetooth_mac_address text,
    hardware_capacity_mb text,
    hardware_device_id text,
    hardware_model text,
    hardware_model_identifier text,
    hardware_model_number text,
    hardware_modem_firmware_version text,
    hardware_serial_number text,
    hardware_used_space_percentage text,
    hardware_wifi_mac_address text,
    ip_address text,
    is_leased text,
    is_purchased text,
    itunes_store_account_active text,
    languages text,
    last_backup_date text,
    last_cloud_backup_date text,
    last_enrolled_date text,
    last_inventory_update_date text,
    locales text,
    location_services_for_self_service_mobile_enabled text,
    managed text,
    maximum_sharedi_pad_users_stored text,
    mdm_profile_expiration_date text,
    os_build text,
    os_rapid_security_response text,
    os_supplemental_build_version text,
    os_version text,
    purchasing_apple_care_id text,
    purchasing_contact text,
    purchasing_lease_expires_date text,
    purchasing_life_expectancy text,
    purchasing_po_date text,
    purchasing_po_number text,
    purchasing_purchase_price text,
    purchasing_purchasing_account text,
    purchasing_vendor text,
    purchasing_warranty_expires_date text,
    quota_size text,
    resident_users text,
    security_activation_lock_enabled text,
    security_block_level_encryption_capable text,
    security_data_protected text,
    security_file_level_encryption_capable text,
    security_hardware_encryption text,
    security_jail_break_detected text,
    security_last_attestation_attempt_date text,
    security_last_successful_attestation_date text,
    security_lost_mode_enabled text,
    security_lost_mode_foot_note text,
    security_lost_mode_location_altitude_meter text,
    security_lost_mode_location_course_degrees text,
    security_lost_mode_location_horizontal_accuracy_meter text,
    security_lost_mode_location_speed_meters_per_second text,
    security_lost_mode_location_timestamp text,
    security_lost_mode_location_update text,
    security_lost_mode_location_vertical_accuracy_meter text,
    security_lost_mode_message text,
    security_lost_mode_persistent text,
    security_lost_mode_phone_number text,
    security_passcode_compliant text,
    security_passcode_compliant_with_profile text,
    security_passcode_lock_grace_period_enforced_second text,
    security_passcode_present text,
    security_personal_device_profile_current text,
    shared_ipad text,
    site_id text,
    software_update_device_id text,
    supervised text,
    synced_to_computer text,
    temporary_session_only text,
    temporary_session_timeout text,
    tethered text,
    time_zone text,
    udid text,
    user_and_location_building text,
    user_and_location_building_id text,
    user_and_location_department text,
    user_and_location_department_id text,
    user_and_location_email_address text,
    user_and_location_phone_number text,
    user_and_location_position text,
    user_and_location_real_name text,
    user_and_location_room text,
    user_and_location_username text,
    user_session_timeout text,
    PRIMARY KEY (id)
);

CREATE TABLE computer_prestage_custom_package (
    "index" text,
    computer_prestage_id text,
    package_id text,
    PRIMARY KEY ("index", computer_prestage_id),
    FOREIGN KEY (computer_prestage_id) REFERENCES computer_prestage(id)
);

CREATE TABLE computer_prestaged_installed_profile (
    "index" text,
    computer_prestage_id text,
    profile_id text,
    PRIMARY KEY ("index", computer_prestage_id),
    FOREIGN KEY (computer_prestage_id) REFERENCES computer_prestage(id)
);

CREATE TABLE computer_prestage_anchor_certificate (
    "index" text,
    computer_prestage_id text,
    anchor_certificate text,
    PRIMARY KEY ("index", computer_prestage_id),
    FOREIGN KEY (computer_prestage_id) REFERENCES computer_prestage(id)
);

CREATE TABLE computer_prestage (
    id text,
    account_setting_admin_username text,
    account_setting_hidden_admin_account text,
    account_setting_id text,
    account_setting_local_admin_account_enabled text,
    account_setting_local_user_managed text,
    account_setting_payload_configured text,
    account_setting_prefill_account_full_name text,
    account_setting_prefill_account_user_name text,
    account_setting_prefill_primary_account_info_feature_enabled text,
    account_setting_prefill_type text,
    account_setting_prevent_prefill_info_from_modification text,
    account_setting_user_account_type text,
    account_setting_version_lock text,
    authentication_prompt text,
    auto_advance_setup text,
    custom_package_distribution_point_id text,
    default_prestage text,
    department text,
    device_enrollment_program_instance_id text,
    display_name text,
    enable_device_based_activation_lock text,
    enable_recovery_lock text,
    enrollment_customization_id text,
    enrollment_site_id text,
    install_profiles_during_setup text,
    is_leased text,
    is_purchased text,
    keep_existing_location_information text,
    keep_existing_site_membership text,
    languages text,
    location_building_id text,
    location_department_id text,
    location_email text,
    location_id text,
    location_phone text,
    location_position text,
    location_realname text,
    location_room text,
    location_username text,
    location_version_lock text,
    mandatory text,
    mdm_removable text,
    prevent_activation_lock text,
    profile_uuid text,
    purchase_info_apple_care_id text,
    purchase_info_id text,
    purchase_info_lease_date text,
    purchase_info_life_expectancy text,
    purchase_info_po_date text,
    purchase_info_po_number text,
    purchase_info_purchase_price text,
    purchase_info_purchasing_account text,
    purchase_info_purchasing_contact text,
    purchase_info_vendor text,
    purchase_info_version_lock text,
    purchase_info_warranty_date text,
    recovery_lock_password_type text,
    region text,
    require_authentication text,
    rotate_recovery_lock_password text,
    site_id text,
    skip_setup_item_accessibility text,
    skip_setup_item_appearance text,
    skip_setup_item_apple_id text,
    skip_setup_item_biometric text,
    skip_setup_item_diagnostics text,
    skip_setup_item_display_tone text,
    skip_setup_item_file_vault text,
    skip_setup_item_i_cloud_diagnostics text,
    skip_setup_item_i_cloud_storage text,
    skip_setup_item_location text,
    skip_setup_item_payment text,
    skip_setup_item_privacy text,
    skip_setup_item_registration text,
    skip_setup_item_restores text,
    skip_setup_item_screen_time text,
    skip_setup_item_siri text,
    skip_setup_item_terms_of_address text,
    skip_setup_item_tos text,
    support_email_address text,
    support_phone_number text,
    version_lock text,
    PRIMARY KEY (id)
);

CREATE TABLE computer_inventory_setting_application_path (
    id text,
    _fivetran_id text,
    "path" text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES computer_inventory_setting(_fivetran_id)
);

CREATE TABLE computer_inventory_setting_font_path (
    id text,
    _fivetran_id text,
    "path" text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES computer_inventory_setting(_fivetran_id)
);

CREATE TABLE computer_inventory_setting_plugin_path (
    id text,
    _fivetran_id text,
    "path" text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES computer_inventory_setting(_fivetran_id)
);

CREATE TABLE computer_inventory_setting (
    _fivetran_id text,
    collect_synced_mobile_device_info text,
    computer_allow_changing_user_and_location text,
    computer_calculate_size text,
    computer_collect_unmanaged_certificate text,
    computer_include_account text,
    computer_include_font text,
    computer_include_hidden_account text,
    computer_include_package text,
    computer_include_plugin text,
    computer_include_printer text,
    computer_include_service text,
    computer_include_software_id text,
    computer_include_software_update text,
    computer_monitor_application_usage text,
    computer_monitor_beacon text,
    computer_update_ldap_info_on_computer_inventory_submission text,
    computer_use_unix_user_path text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE department (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE re_enrollment_object_history (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE self_service_setting (
    _fivetran_id text,
    configuration_setting_alert_user_approved_mdm text,
    configuration_setting_bookmarks_name text,
    configuration_setting_default_home_category_id text,
    configuration_setting_default_landing_page text,
    configuration_setting_notifications_enabled text,
    install_automatically text,
    install_location text,
    setting_allow_remember_me text,
    setting_auth_type text,
    setting_user_login_level text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE computer_group (
    id text,
    "name" text,
    smart_group text,
    PRIMARY KEY (id)
);

CREATE TABLE advanced_search_object_criteria (
    "index" text,
    advanced_search_object_id text,
    and_or text,
    closing_paren text,
    "name" text,
    opening_paren text,
    priority text,
    search_type text,
    "value" text,
    PRIMARY KEY ("index", advanced_search_object_id),
    FOREIGN KEY (advanced_search_object_id) REFERENCES advanced_search_object(id)
);

CREATE TABLE advanced_search_object_display_field (
    "index" text,
    advanced_search_object_id text,
    display_field text,
    PRIMARY KEY ("index", advanced_search_object_id),
    FOREIGN KEY (advanced_search_object_id) REFERENCES advanced_search_object(id)
);

CREATE TABLE advanced_search_object (
    id text,
    "name" text,
    site_id text,
    PRIMARY KEY (id)
);

CREATE TABLE mobile_device_detail_network_section (
    id text,
    network_carrier_setting_version text,
    network_cellular_technology text,
    network_current_carrier_network text,
    network_current_mobile_country_code text,
    network_current_mobile_network_code text,
    network_data_roaming_enabled text,
    network_e_id text,
    network_home_carrier_network text,
    network_home_mobile_country_code text,
    network_home_mobile_network_code text,
    network_iccid text,
    network_imei text,
    network_me_id text,
    network_personal_hotspot_enabled text,
    network_phone_number text,
    network_roaming text,
    network_voice_roaming_enabled text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES mobile_device_detail(id)
);

CREATE TABLE supervision_identity (
    id text,
    common_name text,
    display_name text,
    expiration_date text,
    PRIMARY KEY (id)
);

CREATE TABLE category_history (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES category(id)
);

CREATE TABLE device_enrollment_instance (
    id text,
    time_stamp text,
    sync_state text,
    PRIMARY KEY (id, time_stamp)
);

CREATE TABLE mac_os_configuration (
    id text,
    application_name text,
    branding_header_image_id text,
    branding_name text,
    branding_name_secondary text,
    icon_id text,
    PRIMARY KEY (id)
);

CREATE TABLE patch_software_title_configuration_history (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES patch_software_title_configuration(id)
);

CREATE TABLE device_setting_history (
    id text,
    "date" timestamp,
    details text,
    note text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id text,
    "name" text,
    priority text,
    PRIMARY KEY (id)
);

CREATE TABLE static_user_group (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE patch_policy (
    id text,
    completed text,
    deferred text,
    failed text,
    pending text,
    policy_deployment_method text,
    policy_enabled text,
    policy_name text,
    policy_target_version text,
    software_title text,
    software_title_configuration_id text,
    PRIMARY KEY (id)
);
