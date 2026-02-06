CREATE TABLE preference_center (
    id text,
    created_date text,
    "name" text,
    organization_name text,
    published_date text,
    "status" text,
    template text,
    PRIMARY KEY (id)
);

CREATE TABLE preference_center_schema_language (
    "index" text,
    _fivetran_id text,
    preference_center_id text,
    content text,
    description text,
    is_default boolean,
    "name" text,
    translated_language text,
    PRIMARY KEY ("index", _fivetran_id, preference_center_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema(preference_center_id)
);

CREATE TABLE preference_center_schema_notification_purpose_custom_preference (
    id text,
    _fivetran_id text,
    preference_center_id text,
    preference_center_schema_notification_purpose_id text,
    custom_preference_options jsonb,
    description text,
    display_as text,
    is_required boolean,
    languages jsonb,
    "name" text,
    selection_type text,
    PRIMARY KEY (id, _fivetran_id, preference_center_id, preference_center_schema_notification_purpose_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema_notification_purpose(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema_notification_purpose(preference_center_id),
    FOREIGN KEY (preference_center_schema_notification_purpose_id) REFERENCES preference_center_schema_notification_purpose(id)
);

CREATE TABLE preference_center_schema_notification_purpose_language (
    "index" text,
    _fivetran_id text,
    preference_center_id text,
    preference_center_schema_notification_purpose_id text,
    content text,
    description text,
    is_default boolean,
    "name" text,
    translated_language text,
    PRIMARY KEY ("index", _fivetran_id, preference_center_id, preference_center_schema_notification_purpose_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema_notification_purpose(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema_notification_purpose(preference_center_id),
    FOREIGN KEY (preference_center_schema_notification_purpose_id) REFERENCES preference_center_schema_notification_purpose(id)
);

CREATE TABLE preference_center_schema_notification_purpose_topic (
    id text,
    _fivetran_id text,
    preference_center_id text,
    preference_center_schema_notification_purpose_id text,
    languages jsonb,
    "name" text,
    PRIMARY KEY (id, _fivetran_id, preference_center_id, preference_center_schema_notification_purpose_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema_notification_purpose(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema_notification_purpose(preference_center_id),
    FOREIGN KEY (preference_center_schema_notification_purpose_id) REFERENCES preference_center_schema_notification_purpose(id)
);

CREATE TABLE preference_center_schema_notification_purpose (
    id text,
    _fivetran_id text,
    preference_center_id text,
    description text,
    label text,
    purpose_order text,
    version text,
    visibility text,
    PRIMARY KEY (id, _fivetran_id, preference_center_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema(preference_center_id)
);

CREATE TABLE preference_center_schema_page_language (
    "index" text,
    _fivetran_id text,
    preference_center_id text,
    preference_center_schema_page_id text,
    content text,
    description text,
    is_default boolean,
    "name" text,
    translated_language text,
    PRIMARY KEY ("index", _fivetran_id, preference_center_id, preference_center_schema_page_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema_page(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema_page(preference_center_id),
    FOREIGN KEY (preference_center_schema_page_id) REFERENCES preference_center_schema_page(id)
);

CREATE TABLE preference_center_schema_page_section_notification_purpose (
    id text,
    _fivetran_id text,
    preference_center_id text,
    preference_center_schema_page_id text,
    preference_center_schema_page_section_id text,
    custom_preferences jsonb,
    description text,
    label text,
    languages jsonb,
    purpose_order text,
    topics jsonb,
    version text,
    visibility text,
    PRIMARY KEY (id, _fivetran_id, preference_center_id, preference_center_schema_page_id, preference_center_schema_page_section_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema_page_section(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema_page_section(preference_center_id),
    FOREIGN KEY (preference_center_schema_page_id) REFERENCES preference_center_schema_page_section(preference_center_schema_page_id),
    FOREIGN KEY (preference_center_schema_page_section_id) REFERENCES preference_center_schema_page_section(id)
);

CREATE TABLE preference_center_schema_page_section (
    id text,
    _fivetran_id text,
    preference_center_id text,
    preference_center_schema_page_id text,
    custom_data_elements_id text,
    custom_data_elements_is_hidden boolean,
    custom_data_elements_is_read_only text,
    custom_data_elements_languages jsonb,
    custom_data_elements_name text,
    custom_data_elements_order text,
    elements_id text,
    elements_languages jsonb,
    elements_order text,
    identifier_type text,
    is_header_hidden boolean,
    languages jsonb,
    preference_center_order text,
    PRIMARY KEY (id, _fivetran_id, preference_center_id, preference_center_schema_page_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema_page(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema_page(preference_center_id),
    FOREIGN KEY (preference_center_schema_page_id) REFERENCES preference_center_schema_page(id)
);

CREATE TABLE preference_center_schema_page (
    id text,
    _fivetran_id text,
    preference_center_id text,
    display_subscribe_all boolean,
    display_subscribe_settings boolean,
    display_unsubscribe_all boolean,
    navigation_enabled boolean,
    page_order text,
    PRIMARY KEY (id, _fivetran_id, preference_center_id),
    FOREIGN KEY (_fivetran_id) REFERENCES preference_center_schema(_fivetran_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center_schema(preference_center_id)
);

CREATE TABLE preference_center_schema (
    _fivetran_id text,
    preference_center_id text,
    auto_check_topics boolean,
    default_language text,
    display_notification_purpose text,
    display_page_level_subscribe_settings text,
    display_subscribe_all text,
    display_subscribe_settings text,
    display_unsubscribe_all text,
    enable_multiple_identities text,
    hierarchical_access_control text,
    preference_center_settings_change_preferences_label text,
    preference_center_settings_company_logo text,
    preference_center_settings_country_code_placeholder text,
    preference_center_settings_email_input_title text,
    preference_center_settings_email_login_error text,
    preference_center_settings_email_login_option text,
    preference_center_settings_email_placeholder text,
    preference_center_settings_language_selector text,
    preference_center_settings_login_method text,
    preference_center_settings_login_title text,
    preference_center_settings_logout_description text,
    preference_center_settings_logout_title text,
    preference_center_settings_notification_purpose_description text,
    preference_center_settings_notification_purpose_label text,
    preference_center_settings_onbehalf_login_error text,
    preference_center_settings_page_title text,
    preference_center_settings_phone_login_error text,
    preference_center_settings_phone_login_option text,
    preference_center_settings_phone_number_input_title text,
    preference_center_settings_phone_number_placeholder text,
    preference_center_settings_purpose_toggle_active_label text,
    preference_center_settings_purpose_toggle_inactive_label text,
    preference_center_settings_reasons_label text,
    preference_center_settings_reasons_message text,
    preference_center_settings_reasons_title text,
    preference_center_settings_select_identifier_label text,
    preference_center_settings_send_request text,
    preference_center_settings_sso_login_title text,
    preference_center_settings_subscribe_all_label text,
    preference_center_settings_subscribed_badge_label text,
    preference_center_settings_subscription_settings_label text,
    preference_center_settings_subscription_status_label text,
    preference_center_settings_title text,
    preference_center_settings_topics_label text,
    preference_center_settings_undo_changes_label text,
    preference_center_settings_unsubscribe_all_label text,
    preference_center_settings_unsubscribe_error text,
    preference_center_settings_unsubscribe_link text,
    preference_center_settings_unsubscribe_success_label text,
    preference_center_settings_unsubscribe_successful text,
    preference_center_settings_unsubscribed_badge_label text,
    preference_center_settings_update_error_label text,
    preference_center_settings_update_success_label text,
    update_not_opted_out_to_active_status text,
    PRIMARY KEY (_fivetran_id, preference_center_id),
    FOREIGN KEY (preference_center_id) REFERENCES preference_center(id)
);

CREATE TABLE assessment (
    id text,
    create_date text,
    inherent_risk_score text,
    last_updated_date timestamp,
    "name" text,
    number text,
    open_risk_count text,
    org_group_name text,
    primary_inventory_id text,
    primary_inventory_name text,
    primary_inventory_number text,
    residual_risk_score text,
    "result" text,
    result_id text,
    result_name text,
    "state" text,
    "status" text,
    tags jsonb,
    target_risk_score text,
    template_id text,
    template_name text,
    template_root_version_id text,
    PRIMARY KEY (id)
);

CREATE TABLE login_history (
    id text,
    ipaddress text,
    login_datetime text,
    os_info text,
    "status" text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE storage_scan_result (
    id text,
    web_scan_domain_id text,
    web_scan_id text,
    host text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE consent_group_data_subject_purpose (
    id text,
    consent_group_data_subject_id text,
    consent_group_id text,
    effective_status text,
    "status" text,
    version text,
    PRIMARY KEY (id, consent_group_data_subject_id, consent_group_id),
    FOREIGN KEY (consent_group_data_subject_id) REFERENCES consent_group_data_subject(id),
    FOREIGN KEY (consent_group_id) REFERENCES consent_group_data_subject(consent_group_id)
);

CREATE TABLE consent_group_data_subject (
    id text,
    consent_group_id text,
    identifier text,
    PRIMARY KEY (id, consent_group_id),
    FOREIGN KEY (consent_group_id) REFERENCES consent_group(id)
);

CREATE TABLE consent_group_purpose_rule (
    id text,
    consent_group_id text,
    effective_status text,
    enforced_status text,
    PRIMARY KEY (id, consent_group_id),
    FOREIGN KEY (consent_group_id) REFERENCES consent_group(id)
);

CREATE TABLE consent_group (
    id text,
    consent_groups jsonb,
    description text,
    external_name text,
    membership_type text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE data_subject_group_primary_data_subject (
    data_subject_group_id text,
    id text,
    identifier text,
    identifier_type text,
    PRIMARY KEY (data_subject_group_id, id),
    FOREIGN KEY (data_subject_group_id) REFERENCES data_subject_group(id),
    FOREIGN KEY (id) REFERENCES data_subject(id)
);

CREATE TABLE data_subject_group (
    id text,
    primary_data_subject_id text,
    created_date text,
    group_name text,
    identifier_key text,
    is_primary boolean,
    last_modified_date text,
    number_of_data_subject text,
    organizations jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (primary_data_subject_id) REFERENCES data_subject(id)
);

CREATE TABLE user_group (
    id text,
    created_by text,
    last_modified_by text,
    created_date text,
    description text,
    last_modified_date text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES login_history(id),
    FOREIGN KEY (last_modified_by) REFERENCES login_history(id)
);

CREATE TABLE resource_schema_extension (
    "index" text,
    resource_id text,
    is_required boolean,
    "schema" text,
    PRIMARY KEY ("index", resource_id),
    FOREIGN KEY (resource_id) REFERENCES resource(id)
);

CREATE TABLE resource (
    id text,
    description text,
    endpoint text,
    meta_attributes jsonb,
    meta_created_date text,
    meta_last_modified_date text,
    meta_location text,
    meta_resource_type text,
    meta_version text,
    "name" text,
    "schema" text,
    PRIMARY KEY (id)
);

CREATE TABLE users_email (
    id text,
    users_id text,
    display text,
    is_primary boolean,
    reference text,
    "type" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_group (
    id text,
    users_id text,
    display text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active boolean,
    external_id text,
    family_name text,
    given_name text,
    meta_created_date text,
    meta_last_modified_date text,
    meta_location text,
    meta_resource_type text,
    meta_version text,
    roles jsonb,
    schema_enterprise_business_unit text,
    schema_enterprise_department text,
    schema_enterprise_division text,
    schema_enterprise_employee_number text,
    schema_enterprise_manager jsonb,
    schema_enterprise_office_location text,
    schema_enterprise_organization text,
    schemas jsonb,
    title text,
    user_name text,
    user_type text,
    PRIMARY KEY (id)
);

CREATE TABLE page_scan_result (
    id text,
    web_scan_domain_id text,
    web_scan_id text,
    audit_url text,
    cookie_count text,
    error_message text,
    is_behind_login boolean,
    is_cookie_policy text,
    is_login_form boolean,
    is_privacy_policy text,
    scan_order text,
    source_url text,
    PRIMARY KEY (id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE receipt_purpose_custom_preference_language (
    "index" text,
    receipt_id text,
    receipt_purpose_custom_preference_id text,
    receipt_purpose_id text,
    description text,
    is_default boolean,
    language_code text,
    "name" text,
    options jsonb,
    PRIMARY KEY ("index", receipt_id, receipt_purpose_custom_preference_id, receipt_purpose_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt_purpose_custom_preference(receipt_id),
    FOREIGN KEY (receipt_purpose_custom_preference_id) REFERENCES receipt_purpose_custom_preference(id),
    FOREIGN KEY (receipt_purpose_id) REFERENCES receipt_purpose_custom_preference(receipt_purpose_id)
);

CREATE TABLE receipt_purpose_custom_preference (
    id text,
    receipt_id text,
    receipt_purpose_id text,
    custom_preference_options jsonb,
    display_as text,
    "name" text,
    PRIMARY KEY (id, receipt_id, receipt_purpose_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt_purpose(receipt_id),
    FOREIGN KEY (receipt_purpose_id) REFERENCES receipt_purpose(id)
);

CREATE TABLE receipt_purpose_topic (
    id text,
    receipt_id text,
    receipt_purpose_id text,
    integration_key text,
    languages jsonb,
    "name" text,
    PRIMARY KEY (id, receipt_id, receipt_purpose_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt_purpose(receipt_id),
    FOREIGN KEY (receipt_purpose_id) REFERENCES receipt_purpose(id)
);

CREATE TABLE receipt_purpose (
    id text,
    receipt_id text,
    transaction_id text,
    consent_lifespan text,
    description text,
    expiry_date text,
    external_reference text,
    is_valid_note boolean,
    "name" text,
    note_id text,
    note_langauge text,
    note_text text,
    note_type text,
    "status" text,
    "type" text,
    version text,
    PRIMARY KEY (id, receipt_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE receipt_rule_evaluation_result (
    id text,
    receipt_id text,
    action_results jsonb,
    additional_params jsonb,
    consent_rule_type text,
    evaluation_result boolean,
    group_id text,
    result_data jsonb,
    PRIMARY KEY (id, receipt_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(id)
);

CREATE TABLE receipt (
    id text,
    collection_point_uuid text,
    organization_id text,
    attributes jsonb,
    consent_creation_date text,
    consent_string_content text,
    consent_string_type text,
    country text,
    custom_payload jsonb,
    data_elements jsonb,
    data_subject_identifier text,
    data_subject_identifier_hash text,
    double_opt_in boolean,
    geo_location_purpose_ids jsonb,
    interaction_date text,
    is_anonymous boolean,
    is_test boolean,
    jwt_version text,
    origin text,
    recorded_language text,
    "source" jsonb,
    "state" text,
    state_name text,
    unsubscribe_all boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (collection_point_uuid) REFERENCES collection_point(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE schema_attribute (
    "index" text,
    schema_id text,
    description text,
    is_case_exact boolean,
    is_multi_valued boolean,
    is_required boolean,
    mutability text,
    "name" text,
    reference_type text,
    returned text,
    sub_attributes jsonb,
    "type" text,
    uniqueness text,
    PRIMARY KEY ("index", schema_id),
    FOREIGN KEY (schema_id) REFERENCES "schema"(id)
);

CREATE TABLE "schema" (
    id text,
    description text,
    location text,
    "name" text,
    resource_type text,
    PRIMARY KEY (id)
);

CREATE TABLE inventories (
    id text,
    organization_id text,
    "name" text,
    organization_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE purpose_version_custom_preference_language (
    "index" text,
    purpose_id text,
    purpose_version_custom_preference_id text,
    purpose_version_index text,
    description text,
    is_default boolean,
    language_code text,
    "name" text,
    options jsonb,
    PRIMARY KEY ("index", purpose_id, purpose_version_custom_preference_id, purpose_version_index),
    FOREIGN KEY (purpose_id) REFERENCES purpose_version_custom_preference(purpose_id),
    FOREIGN KEY (purpose_version_custom_preference_id) REFERENCES purpose_version_custom_preference(id),
    FOREIGN KEY (purpose_version_index) REFERENCES purpose_version_custom_preference(purpose_version_index)
);

CREATE TABLE purpose_version_custom_preference (
    id text,
    purpose_id text,
    purpose_version_index text,
    custom_preference_options jsonb,
    display_as text,
    "name" text,
    PRIMARY KEY (id, purpose_id, purpose_version_index),
    FOREIGN KEY (purpose_id) REFERENCES purpose_version(purpose_id),
    FOREIGN KEY (purpose_version_index) REFERENCES purpose_version("index")
);

CREATE TABLE purpose_version_topic (
    id text,
    purpose_id text,
    purpose_version_index text,
    integration_key text,
    languages jsonb,
    "name" text,
    PRIMARY KEY (id, purpose_id, purpose_version_index),
    FOREIGN KEY (purpose_id) REFERENCES purpose_version(purpose_id),
    FOREIGN KEY (purpose_version_index) REFERENCES purpose_version("index")
);

CREATE TABLE purpose_version (
    "index" text,
    purpose_id text,
    consent_lifespan text,
    created_by text,
    created_date timestamp,
    description text,
    detail text,
    enable_geo_location boolean,
    expiry_date_type text,
    implicit_consent_confirm_desc text,
    implicit_consent_life_span text,
    label text,
    last_modified_by text,
    last_modified_date timestamp,
    organizations jsonb,
    parent_purpose_id text,
    published_by text,
    published_date timestamp,
    purpose_type text,
    retired_on_date timestamp,
    "status" text,
    version text,
    PRIMARY KEY ("index", purpose_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id)
);

CREATE TABLE purpose (
    id text,
    attributes jsonb,
    created_date timestamp,
    last_modified_date timestamp,
    published_by text,
    published_date timestamp,
    retired_on_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE link_token (
    id text,
    data_subject_id text,
    created_date text,
    expiry_date text,
    url_encoded_link_token text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_subject_id) REFERENCES data_subject(id)
);

CREATE TABLE tag_scan_result (
    id text,
    web_scan_domain_id text,
    web_scan_id text,
    added text,
    age text,
    change_since_previous_scan text,
    child_url text,
    created_date text,
    host text,
    params text,
    parent_url text,
    removed text,
    src_url text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE service_provider_configuration_authentication_scheme (
    "index" text,
    service_provider_configuration_fivetran_id text,
    description text,
    documentation_link text,
    is_primary boolean,
    "name" text,
    spec_link text,
    "type" text,
    PRIMARY KEY ("index", service_provider_configuration_fivetran_id),
    FOREIGN KEY (service_provider_configuration_fivetran_id) REFERENCES service_provider_configuration(_fivetran_id)
);

CREATE TABLE service_provider_configuration (
    _fivetran_id text,
    attributes jsonb,
    bulk_max_operation text,
    bulk_max_payload_size text,
    bulk_supported boolean,
    change_password_supported boolean,
    created_date text,
    e_tag_supported boolean,
    filter_max_result text,
    filter_supported boolean,
    last_modified_date text,
    location text,
    patch_supported boolean,
    resource_type text,
    schemas jsonb,
    sort_supported boolean,
    version text,
    xml_data_format_supported boolean,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE collection_point_purpose_custom_preference (
    id text,
    collection_point_id text,
    collection_point_purpose_id text,
    "name" text,
    options_disabled text,
    options_id text,
    options_label text,
    PRIMARY KEY (id, collection_point_id, collection_point_purpose_id),
    FOREIGN KEY (collection_point_id) REFERENCES collection_point_purpose(collection_point_id),
    FOREIGN KEY (collection_point_purpose_id) REFERENCES collection_point_purpose(id)
);

CREATE TABLE collection_point_purpose_topic (
    id text,
    collection_point_id text,
    collection_point_purpose_id text,
    can_delete boolean,
    integration_key text,
    "name" text,
    PRIMARY KEY (id, collection_point_id, collection_point_purpose_id),
    FOREIGN KEY (collection_point_id) REFERENCES collection_point_purpose(collection_point_id),
    FOREIGN KEY (collection_point_purpose_id) REFERENCES collection_point_purpose(id)
);

CREATE TABLE collection_point_purpose (
    id text,
    collection_point_id text,
    attributes jsonb,
    created_by text,
    created_date timestamp,
    description text,
    enable_geolocation boolean,
    external_reference text,
    implicit_consent_confirm_desc text,
    implicit_consent_life_span text,
    label text,
    life_span text,
    new_version_available boolean,
    organizations jsonb,
    parent_purpose_id text,
    published_by text,
    published_date timestamp,
    purpose_id_with_version text,
    purpose_languages jsonb,
    "status" text,
    "type" text,
    updated_by text,
    updated_date timestamp,
    version text,
    PRIMARY KEY (id, collection_point_id),
    FOREIGN KEY (collection_point_id) REFERENCES collection_point(id)
);

CREATE TABLE collection_point (
    id text,
    organization_id text,
    ack_email_identifier text,
    activation_date text,
    allow_multiple_identifier_types boolean,
    attributes jsonb,
    can_create_new_version boolean,
    consent_doi_cancel_option boolean,
    consent_type text,
    cookie_consent_update text,
    created_by text,
    created_date text,
    data_controller_name text,
    data_elements jsonb,
    data_subject_identifier text,
    default_language_code text,
    description text,
    disable_reports boolean,
    disabled boolean,
    doi_email_identifier text,
    doi_email_to_parent boolean,
    doi_send_confirmation_email boolean,
    enable_captcha boolean,
    enable_custom_preference_event boolean,
    enable_data_element_event boolean,
    enable_geo_location boolean,
    enable_geo_location_for_data_elements boolean,
    enable_new_consent_integration boolean,
    enable_prefill_identifier boolean,
    enable_primary_identifier boolean,
    enable_publish_event boolean,
    enable_purpose_event boolean,
    first_consent_receipt_on text,
    hosted_web_form_branding_data jsonb,
    hosted_web_form_captcha_url text,
    hosted_web_form_default_language_translations jsonb,
    hosted_web_form_draft_link text,
    hosted_web_form_ds_portal_base_url text,
    hosted_web_form_geo_location_url text,
    hosted_web_form_id text,
    hosted_web_form_integration_settings jsonb,
    hosted_web_form_integration_urls jsonb,
    hosted_web_form_name text,
    hosted_web_form_new_selected_languages jsonb,
    hosted_web_form_portal_data jsonb,
    hosted_web_form_preview_id text,
    hosted_web_form_prod_publish_version text,
    hosted_web_form_prod_script_guid text,
    hosted_web_form_published_link text,
    hosted_web_form_sdk_version text,
    hosted_web_form_supported_script_version text,
    hosted_web_form_template text,
    hosted_web_form_test_publish_version text,
    hosted_web_form_test_script_guid text,
    hosted_web_form_translation_cf_worker_url text,
    hosted_web_form_version_id text,
    hosted_web_form_web_form_data jsonb,
    how_to_withdraw text,
    iab_vendor_id text,
    identifier_data_element_allow_multi_value boolean,
    identifier_data_element_can_delete boolean,
    identifier_data_element_can_edit boolean,
    identifier_data_element_collection_points text,
    identifier_data_element_collection_points_without_retired text,
    identifier_data_element_created_date timestamp,
    identifier_data_element_data_element_fields jsonb,
    identifier_data_element_id text,
    identifier_data_element_is_identifier boolean,
    identifier_data_element_label text,
    identifier_data_element_languages jsonb,
    identifier_data_element_linked_data_subject_element_exists boolean,
    identifier_data_element_number_of_languages text,
    identifier_data_element_organizations jsonb,
    identifier_data_element_pi_info boolean,
    identifier_data_element_preference_centers text,
    identifier_data_element_total_active_preference_centers text,
    identifier_data_element_updated_date timestamp,
    identifier_types jsonb,
    include_identifier_parameter boolean,
    include_parameter boolean,
    is_authentication_required boolean,
    is_consent_integration boolean,
    is_double_opt_in boolean,
    is_dynamic_collection_point boolean,
    is_hosted_sdk boolean,
    jwt_token text,
    languages jsonb,
    last_activity_date text,
    last_modified_by text,
    last_sdk_integration_date text,
    "name" text,
    new_sdk_integration_enabled boolean,
    no_consent_transactions text,
    notices_with_versions jsonb,
    other_information text,
    override_active_purpose boolean,
    parent_identifier_types jsonb,
    preference_center_id text,
    preference_center_name text,
    preference_center_organization_name text,
    preference_center_template text,
    prefill_identifier text,
    primary_identifier_type text,
    privacy_policy_url text,
    published_by text,
    reconfirm_active_purpose boolean,
    redirect_on_form_submission boolean,
    redirect_url text,
    responsible_group_id text,
    responsible_user_id text,
    right_to_withdraw text,
    send_consent_email boolean,
    show_dl_notification boolean,
    show_warning boolean,
    "status" text,
    "type" text,
    version text,
    warning_reasons jsonb,
    web_form_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE cookie_scan_result (
    id text,
    web_scan_domain_id text,
    web_scan_id text,
    category_id text,
    color text,
    cookie_category text,
    description text,
    expiry_date text,
    expiry_unit text,
    first_party text,
    host text,
    host_description text,
    is_behind_login boolean,
    is_http_only boolean,
    is_new_found boolean,
    is_newly_added boolean,
    is_secure boolean,
    is_session boolean,
    "name" text,
    "path" text,
    purpose text,
    "status" text,
    third_party_description text,
    url_domain text,
    PRIMARY KEY (id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE groups_member (
    id text,
    groups_id text,
    hyperlink text,
    "type" text,
    PRIMARY KEY (id, groups_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    created_date timestamp,
    display_name text,
    external_id text,
    last_modified_date timestamp,
    location text,
    resource_type text,
    schemas jsonb,
    schemas_group_category text,
    schemas_group_description text,
    PRIMARY KEY (id)
);

CREATE TABLE form_scan_result_form_data_field (
    "index" text,
    form_scan_result_id text,
    field_name text,
    form_name text,
    form_value text,
    label text,
    personal_data text,
    title text,
    "type" text,
    PRIMARY KEY ("index", form_scan_result_id),
    FOREIGN KEY (form_scan_result_id) REFERENCES form_scan_result(id)
);

CREATE TABLE form_scan_result (
    id text,
    web_scan_domain_id text,
    web_scan_id text,
    "name" text,
    number_of_pages_found text,
    PRIMARY KEY (id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE scan_delta_added_cookie (
    id text,
    scan_delta_id text,
    category_id text,
    color text,
    cookie_category text,
    description text,
    expiry_date text,
    expiry_unit text,
    first_party text,
    host text,
    host_description text,
    is_behind_login text,
    is_http_only text,
    is_new_found text,
    is_newly_added text,
    is_secure text,
    is_session text,
    "name" text,
    "path" text,
    purpose text,
    "status" text,
    third_party_description text,
    url_domain text,
    PRIMARY KEY (id, scan_delta_id),
    FOREIGN KEY (scan_delta_id) REFERENCES scan_delta(id)
);

CREATE TABLE scan_delta_removed_cookie (
    id text,
    scan_delta_id text,
    category_id text,
    color text,
    cookie_category text,
    description text,
    expiry_date text,
    expiry_unit text,
    first_party text,
    host text,
    host_description text,
    is_behind_login text,
    is_http_only text,
    is_new_found text,
    is_newly_added text,
    is_secure text,
    is_session text,
    "name" text,
    "path" text,
    purpose text,
    "status" text,
    third_party_description text,
    url_domain text,
    PRIMARY KEY (id, scan_delta_id),
    FOREIGN KEY (scan_delta_id) REFERENCES scan_delta(id)
);

CREATE TABLE scan_delta (
    id text,
    web_scan_domain_id text,
    web_scan_id text,
    source_scan_id text,
    target_scan_date timestamp,
    target_scan_deleted text,
    target_scan_id text,
    PRIMARY KEY (id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE organization_children (
    "index" text,
    organization_id text,
    children jsonb,
    default_approver text,
    default_language_code text,
    description text,
    external_id text,
    "name" text,
    parent_external_id text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    parent_id text,
    default_approver text,
    default_language_code text,
    description text,
    external_id text,
    "name" text,
    parent_external_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES organization(id)
);

CREATE TABLE purpose_preference (
    id text,
    created_date timestamp,
    default_language text,
    description text,
    display_as text,
    is_disabled boolean,
    is_required boolean,
    languages jsonb,
    "name" text,
    number_of_languages text,
    number_of_options text,
    options jsonb,
    organizations jsonb,
    selection_type text,
    total_linked_active_purposes text,
    updated_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE transaction_custom_preference (
    id text,
    transaction_id text,
    choices jsonb,
    options jsonb,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_topic (
    id text,
    transaction_id text,
    "type" text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    collection_point_uuid text,
    receipt_id text,
    activation_date text,
    auto_generated text,
    collection_point_privacy_notices jsonb,
    consent_creation_date text,
    consent_date text,
    created_by text,
    double_opt_in boolean,
    expiry_date text,
    guid text,
    identifier text,
    interaction_date text,
    is_test boolean,
    issue_date text,
    purpose_privacy_notices jsonb,
    "type" text,
    withdrawal_date text,
    withdrawn_by text,
    -- custom_attributes_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (collection_point_uuid) REFERENCES collection_point(id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(id)
);

CREATE TABLE service_scan_result (
    _fivetran_id text,
    web_scan_domain_id text,
    web_scan_id text,
    added text,
    category text,
    change_since_previous_scan text,
    description text,
    location text,
    privacy_policy text,
    removed text,
    service_name text,
    vendor text,
    PRIMARY KEY (_fivetran_id, web_scan_domain_id, web_scan_id)
);

CREATE TABLE data_subject_purpose_custom_preference (
    id text,
    data_subject_id text,
    data_subject_purpose_id text,
    "name" text,
    options jsonb,
    PRIMARY KEY (id, data_subject_id, data_subject_purpose_id),
    FOREIGN KEY (data_subject_id) REFERENCES data_subject_purpose(data_subject_id),
    FOREIGN KEY (data_subject_purpose_id) REFERENCES data_subject_purpose(id)
);

CREATE TABLE data_subject_purpose_topic (
    id text,
    data_subject_id text,
    data_subject_purpose_id text,
    is_consented boolean,
    "name" text,
    PRIMARY KEY (id, data_subject_id, data_subject_purpose_id),
    FOREIGN KEY (data_subject_id) REFERENCES data_subject_purpose(data_subject_id),
    FOREIGN KEY (data_subject_purpose_id) REFERENCES data_subject_purpose(id)
);

CREATE TABLE data_subject_purpose (
    id text,
    data_subject_id text,
    last_receipt_id text,
    last_transaction_collection_point_id text,
    attributes jsonb,
    consent_date text,
    expiry_date text,
    first_transaction_date text,
    geo_location_country text,
    geo_location_data_subject_id text,
    geo_location_receipt_id text,
    geo_location_state text,
    geo_location_state_name text,
    group_effective_id text,
    group_effective_status text,
    last_interaction_date text,
    last_transaction_date text,
    last_updated_date text,
    "name" text,
    purpose_note text,
    "status" text,
    version text,
    withdrawal_date text,
    PRIMARY KEY (id, data_subject_id),
    FOREIGN KEY (data_subject_id) REFERENCES data_subject(id),
    FOREIGN KEY (last_receipt_id) REFERENCES receipt(id),
    FOREIGN KEY (last_transaction_collection_point_id) REFERENCES collection_point(id)
);

CREATE TABLE data_subject_data_element (
    "index" text,
    data_subject_id text,
    is_dnc boolean,
    is_linked boolean,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", data_subject_id),
    FOREIGN KEY (data_subject_id) REFERENCES data_subject(id)
);

CREATE TABLE data_subject_notice (
    id text,
    data_subject_id text,
    collection_point_id text,
    collection_point_name text,
    collection_point_version text,
    guid text,
    "name" text,
    notice_type text,
    privacy_notice_version text,
    privacy_notice_version_id text,
    privacy_notice_version_name text,
    purposes jsonb,
    "type" text,
    url text,
    PRIMARY KEY (id, data_subject_id),
    FOREIGN KEY (data_subject_id) REFERENCES data_subject(id)
);

CREATE TABLE data_subject (
    id text,
    link_token text,
    created_date text,
    identifier text,
    last_updated_date text,
    latest_geo_location_country text,
    latest_geo_location_data_subject_id text,
    latest_geo_location_receipt_id text,
    latest_geo_location_state text,
    latest_geo_location_state_name text,
    pref_language text,
    test_data_subject boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (link_token) REFERENCES link_token(id)
);
