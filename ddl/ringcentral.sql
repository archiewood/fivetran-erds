CREATE TABLE meeting (
    uuid text,
    extension_id text,
    id text,
    start_time timestamp,
    topic text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE email_notification_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE message (
    id bigint,
    extension_id text,
    from_extension_id text,
    availability text,
    conversation_id text,
    cover_index text,
    cover_page_text text,
    creation_time timestamp,
    delivery_error_code text,
    direction text,
    fax_page_count text,
    fax_resolution text,
    from_location text,
    last_modified_time timestamp,
    message_status text,
    pg_to_department boolean,
    priority text,
    read_status text,
    sms_delivery_time text,
    sms_sending_attempts_count integer,
    subject text,
    "type" text,
    vm_transcription_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (from_extension_id) REFERENCES extension(id)
);

CREATE TABLE meeting_setting_audio_option (
    "value" text,
    account_id text,
    PRIMARY KEY ("value", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE service_provider_config (
    _fivetran_id text,
    bulk_max_operations integer,
    bulk_max_payload_size integer,
    bulk_supported boolean,
    change_password_supported boolean,
    etag_supported boolean,
    filter_max_results integer,
    filter_supported boolean,
    patch_supported boolean,
    sort_supported boolean,
    xml_data_format_supported boolean,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE call_recording_setting (
    account_id text,
    on_demand_enabled boolean,
    on_demand_retention_period integer,
    -- automatic_* (dynamic column),
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_assigned_role (
    id text,
    auto_assigned boolean,
    extension_id text,
    site_restricted text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES user_role(id)
);

CREATE TABLE company_directory (
    id text,
    federated_account_id text,
    department text,
    email text,
    extension_number text,
    first_name text,
    job_title text,
    last_name text,
    "name" text,
    profile_image_etag text,
    site_code text,
    site_id text,
    site_name text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (federated_account_id) REFERENCES federated_account(id)
);

CREATE TABLE extension (
    id text,
    account_id text,
    extension_number text,
    hidden boolean,
    "name" text,
    permissions_admin_enabled boolean,
    permissions_international_calling_enabled boolean,
    profile_image_content_type text,
    profile_image_etag text,
    profile_image_last_modified timestamp,
    site_code text,
    site_id text,
    site_name text,
    "status" text,
    sub_type text,
    "type" text,
    -- call_queue_info_* (dynamic column),
    -- contact_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE forwarding_number_feature (
    "value" text,
    forwarding_number_id text,
    PRIMARY KEY ("value", forwarding_number_id),
    FOREIGN KEY (forwarding_number_id) REFERENCES forwarding_number(id)
);

CREATE TABLE missed_call_notification_advanced_sms_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE call_queue_member (
    id text,
    call_queue_id text,
    extension_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (call_queue_id) REFERENCES call_queue(id),
    FOREIGN KEY (extension_number) REFERENCES extension(id)
);

CREATE TABLE meeting_assisted_user (
    id text,
    extension_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE message_to (
    _fivetran_id text,
    message_id bigint,
    extension_id text,
    extension_number text,
    fax_error_code text,
    location text,
    message_status text,
    "name" text,
    phone_number text,
    target boolean,
    PRIMARY KEY (_fivetran_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE chat_member (
    chat_id text,
    id text,
    PRIMARY KEY (chat_id, id),
    FOREIGN KEY (chat_id) REFERENCES chat(id),
    FOREIGN KEY (id) REFERENCES extension(id)
);

CREATE TABLE inbound_fax_notification_advanced_sms_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE user_auth_profile_scope (
    "value" text,
    extension_id text,
    PRIMARY KEY ("value", extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE sms_batch_rejected (
    "index" bigint,
    sms_batch_id text,
    description text,
    error_code text,
    PRIMARY KEY ("index", sms_batch_id),
    FOREIGN KEY (sms_batch_id) REFERENCES sms_batch(id)
);

CREATE TABLE user_conference_setting (
    extension_id text,
    allow_join_before_host boolean,
    host_code text,
    mode text,
    participant_code text,
    primary_phone_number text,
    tap_to_join_uri text,
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE extension_device_model_add_on (
    id text,
    extension_device_id text,
    count integer,
    "name" text,
    PRIMARY KEY (id, extension_device_id),
    FOREIGN KEY (extension_device_id) REFERENCES extension_device(id)
);

CREATE TABLE call_monitoring_group_member (
    id text,
    call_monitoring_group_id text,
    extension_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (call_monitoring_group_id) REFERENCES call_monitoring_group(id),
    FOREIGN KEY (extension_number) REFERENCES extension(id)
);

CREATE TABLE extension_device (
    id text,
    emergency_location_id text,
    emergency_service_address_country_id text,
    emergency_service_address_state_id text,
    extension_id text,
    shipping_address_country_id text,
    shipping_address_state_id text,
    box_billing_id integer,
    computer_name text,
    emergency_address_editable_status text,
    emergency_service_address_additional_customer_email text,
    emergency_service_address_additional_customer_name text,
    emergency_service_address_additional_customer_phone text,
    emergency_service_address_city text,
    emergency_service_address_customer_email text,
    emergency_service_address_customer_name text,
    emergency_service_address_customer_phone text,
    emergency_service_address_line_provisioning_status text,
    emergency_service_address_out_of_country boolean,
    emergency_service_address_street text,
    emergency_service_address_street_2 text,
    emergency_service_address_sync_status text,
    emergency_service_address_tax_id text,
    emergency_service_address_zip text,
    emergency_visibility text,
    in_company_net boolean,
    last_location_report_time text,
    line_pooling text,
    "name" text,
    serial text,
    site_id text,
    site_name text,
    sku text,
    "status" text,
    "type" text,
    use_as_common_phone boolean,
    -- model_* (dynamic column),
    -- shipping_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (emergency_location_id) REFERENCES emergency_location(id),
    FOREIGN KEY (emergency_service_address_country_id) REFERENCES country(id),
    FOREIGN KEY (emergency_service_address_state_id) REFERENCES "state"(id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (shipping_address_country_id) REFERENCES country(id),
    FOREIGN KEY (shipping_address_state_id) REFERENCES "state"(id)
);

CREATE TABLE timezone (
    id text,
    bias text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE permission_category (
    id text,
    description text,
    display_name text,
    PRIMARY KEY (id)
);

CREATE TABLE caller_blocking_setting (
    extension_id text,
    mode text,
    no_caller_id text,
    pay_phones text,
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE service_provider_config_schema (
    "value" text,
    service_provider_config_id text,
    PRIMARY KEY ("value", service_provider_config_id),
    FOREIGN KEY (service_provider_config_id) REFERENCES service_provider_config(_fivetran_id)
);

CREATE TABLE languages (
    id text,
    formatting_locale boolean,
    greeting boolean,
    iso_code text,
    locale_code text,
    "name" text,
    ui boolean,
    PRIMARY KEY (id)
);

CREATE TABLE user_call_handling_rule (
    id text,
    extension_id text,
    enabled boolean,
    "name" text,
    shared_lines_timeout integer,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE chat_post (
    id text,
    chat_id text,
    activity text,
    creation_time timestamp,
    creator_id text,
    group_id text,
    icon_emoji text,
    icon_uri text,
    last_modified_time timestamp,
    text text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (chat_id) REFERENCES chat(id)
);

CREATE TABLE chat_task_attachment (
    id text,
    chat_task_id text,
    content_uri text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, chat_task_id),
    FOREIGN KEY (chat_task_id) REFERENCES chat_task(id)
);

CREATE TABLE message_attachment (
    id bigint,
    message_id bigint,
    content_type text,
    file_name text,
    height integer,
    "size" integer,
    "type" text,
    vm_duration integer,
    width integer,
    PRIMARY KEY (id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE meeting_recording (
    content_download_uri text,
    meeting_uuid text,
    content_type text,
    end_time timestamp,
    id text,
    "size" bigint,
    start_time timestamp,
    "status" text,
    PRIMARY KEY (content_download_uri, meeting_uuid),
    FOREIGN KEY (meeting_uuid) REFERENCES meeting(uuid)
);

CREATE TABLE user_role_permission (
    id text,
    user_role_id text,
    assignable boolean,
    read_only boolean,
    site_compatible text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES user_permission(id),
    FOREIGN KEY (user_role_id) REFERENCES user_role(id)
);

CREATE TABLE call_monitoring_group (
    id text,
    account_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE emergency_location (
    id text,
    account_id text,
    address_country_id text,
    address_state_id text,
    address_city text,
    address_customer_name text,
    address_status text,
    address_street text,
    address_street_2 text,
    address_zip text,
    "name" text,
    site_id text,
    site_name text,
    sync_status text,
    usage_status text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (address_country_id) REFERENCES country(id),
    FOREIGN KEY (address_state_id) REFERENCES "state"(id)
);

CREATE TABLE extension_device_phone_line (
    id text,
    extension_device_id text,
    phone_info_country_id text,
    phone_info_extension_id text,
    emergency_address_local_only boolean,
    emergency_address_required boolean,
    line_type text,
    -- phone_info_* (dynamic column),
    PRIMARY KEY (id, extension_device_id),
    FOREIGN KEY (extension_device_id) REFERENCES extension_device(id),
    FOREIGN KEY (phone_info_country_id) REFERENCES country(id),
    FOREIGN KEY (phone_info_extension_id) REFERENCES extension(id)
);

CREATE TABLE post_attachment_field (
    style text,
    title text,
    "value" text,
    post_attachment_id text,
    PRIMARY KEY (style, title, "value", post_attachment_id),
    FOREIGN KEY (post_attachment_id) REFERENCES post_attachment(post_id)
);

CREATE TABLE user_feature (
    id text,
    extension_id text,
    available boolean,
    reason_code text,
    reason_message text,
    reason_permission text,
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE user_call_log (
    id text,
    extension_id text,
    message_id text,
    "action" text,
    billing_cost_included integer,
    billing_cost_purchased integer,
    delegate_id text,
    delegate_name text,
    deleted boolean,
    direction text,
    duration integer,
    internal_type text,
    last_modified_time timestamp,
    reason text,
    reason_description text,
    recording_id text,
    recording_type text,
    "result" text,
    session_id text,
    short_recording boolean,
    start_time timestamp,
    telephony_session_id text,
    transport text,
    "type" text,
    -- from_* (dynamic column),
    -- to_* (dynamic column),
    PRIMARY KEY (id, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE chat_note (
    id text,
    chat_id text,
    creator_id text,
    last_modified_by_id text,
    locked_by_id text,
    creation_time timestamp,
    last_modified_time timestamp,
    preview text,
    "status" text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (chat_id) REFERENCES chat(id),
    FOREIGN KEY (creator_id) REFERENCES extension(id),
    FOREIGN KEY (last_modified_by_id) REFERENCES extension(id),
    FOREIGN KEY (locked_by_id) REFERENCES extension(id)
);

CREATE TABLE inbound_text_notification_advanced_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE call_recording_extension (
    id bigint,
    call_direction text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES extension(id)
);

CREATE TABLE meeting_service_info_dial_in_number (
    phone_number text,
    extension_id text,
    country_id text,
    formatted_number text,
    location text,
    PRIMARY KEY (phone_number, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE post_added_person (
    "value" text,
    post_id text,
    PRIMARY KEY ("value", post_id),
    FOREIGN KEY (post_id) REFERENCES chat_post(id)
);

CREATE TABLE chat (
    id text,
    creation_time timestamp,
    description text,
    last_modified_time timestamp,
    "name" text,
    public boolean,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE federated_account (
    id text,
    federation_id text,
    company_name text,
    conflict_count bigint,
    federated_name text,
    link_creation_time text,
    -- main_number_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (federation_id) REFERENCES federation(id)
);

CREATE TABLE email_notification_sms_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE emergency_location_owner (
    emergency_location_id text,
    id text,
    PRIMARY KEY (emergency_location_id, id),
    FOREIGN KEY (emergency_location_id) REFERENCES emergency_location(id),
    FOREIGN KEY (id) REFERENCES extension(id)
);

CREATE TABLE forwarding_number (
    id text,
    extension_id text,
    device_id text,
    flip_number text,
    label text,
    phone_number text,
    "type" text,
    PRIMARY KEY (id, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (device_id) REFERENCES extension_device(id)
);

CREATE TABLE account_call_log_leg (
    "index" integer,
    account_call_log_id text,
    message_id text,
    "action" text,
    billing_cost_included integer,
    billing_cost_purchased integer,
    delegate_id text,
    delegate_name text,
    direction text,
    duration bigint,
    duration_ms bigint,
    extension_id text,
    internal_type text,
    leg_type text,
    master boolean,
    party_id text,
    reason text,
    reason_description text,
    recording_id text,
    recording_type text,
    "result" text,
    short_recording boolean,
    sip_uuid_info text,
    start_time timestamp,
    telephony_session_id text,
    transfer_target_telephony_session_id text,
    transferee_telephony_session_id text,
    transport text,
    "type" text,
    -- from_* (dynamic column),
    -- to_* (dynamic column),
    PRIMARY KEY ("index", account_call_log_id),
    FOREIGN KEY (account_call_log_id) REFERENCES account_call_log(id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE account_call_log (
    id text,
    account_id text,
    message_id text,
    "action" text,
    billing_cost_included integer,
    billing_cost_purchased integer,
    delegate_id text,
    delegate_name text,
    deleted boolean,
    direction text,
    duration bigint,
    duration_ms bigint,
    extension_id text,
    internal_type text,
    last_modified_time timestamp,
    party_id text,
    reason text,
    reason_description text,
    recording_id text,
    recording_type text,
    "result" text,
    session_id text,
    short_recording boolean,
    sip_uuid_info text,
    start_time timestamp,
    telephony_session_id text,
    transfer_target_telephony_session_id text,
    transferee_telephony_session_id text,
    transport text,
    "type" text,
    -- from_* (dynamic column),
    -- to_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE country (
    id text,
    calling_code text,
    emergency_calling boolean,
    free_softphone_line boolean,
    iso_code text,
    login_allowed boolean,
    "name" text,
    number_selling boolean,
    signup_allowed boolean,
    PRIMARY KEY (id)
);

CREATE TABLE sms_batch_rejected_to (
    "value" text,
    "index" bigint,
    sms_batch_id text,
    PRIMARY KEY ("value", "index", sms_batch_id),
    FOREIGN KEY ("index") REFERENCES sms_batch_rejected("index"),
    FOREIGN KEY (sms_batch_id) REFERENCES sms_batch(id)
);

CREATE TABLE meeting_assistant (
    id text,
    extension_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE sms_opt_out_number (
    account_id text,
    creation_time text,
    "from" text,
    "source" text,
    "status" text,
    "to" text,
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE user_video_configuration (
    extension_id text,
    provider text,
    user_license_type text,
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE user_feature_param (
    "name" text,
    user_feature_id text,
    "value" text,
    PRIMARY KEY ("name", user_feature_id),
    FOREIGN KEY (user_feature_id) REFERENCES user_feature(id)
);

CREATE TABLE user_role (
    id text,
    account_id text,
    custom boolean,
    description text,
    display_name text,
    hidden boolean,
    last_updated timestamp,
    scope text,
    site_compatible boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE extension_device_model_feature (
    "value" text,
    extension_device_id text,
    PRIMARY KEY ("value", extension_device_id),
    FOREIGN KEY (extension_device_id) REFERENCES extension_device(id)
);

CREATE TABLE company_directory_custom_field (
    id text,
    company_directory_id text,
    "value" text,
    PRIMARY KEY (id, company_directory_id),
    FOREIGN KEY (company_directory_id) REFERENCES company_directory(id)
);

CREATE TABLE location (
    _fivetran_id text,
    state_id text,
    area_code text,
    city text,
    npa text,
    nxx text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (state_id) REFERENCES "state"(id)
);

CREATE TABLE user_notification_setting (
    extension_id text,
    advanced_mode boolean,
    inbound_texts_notify_by_email boolean,
    inbound_texts_notify_by_sms boolean,
    include_managers boolean,
    missed_calls_notify_by_email boolean,
    missed_calls_notify_by_sms boolean,
    outbound_faxes_notify_by_email boolean,
    outbound_faxes_notify_by_sms boolean,
    -- inbound_faxes_* (dynamic column),
    -- voice_mails_* (dynamic column),
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE voicemail_notification_advanced_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE meeting_setting (
    account_id text,
    telephony_third_party_audio boolean,
    -- recording_* (dynamic column),
    -- schedule_meeting_* (dynamic column),
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_signup_state (
    "value" text,
    account_id text,
    PRIMARY KEY ("value", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE voicemail_notification_advanced_sms_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE user_call_log_leg (
    leg_type text,
    extension_id text,
    user_call_log_id text,
    master boolean,
    PRIMARY KEY (leg_type, extension_id, user_call_log_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (user_call_log_id) REFERENCES user_call_log(id)
);

CREATE TABLE user_conference_setting_dial_in_phone_number (
    phone_number text,
    extension_id text,
    country_id bigint,
    "default" boolean,
    has_greeting boolean,
    location text,
    premium boolean,
    PRIMARY KEY (phone_number, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE outbound_fax_notification_advanced_sms_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE call_queue (
    id text,
    account_id text,
    extension_number text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (extension_number) REFERENCES extension(id)
);

CREATE TABLE meeting_service_info (
    extension_id text,
    -- external_user_info* (dynamic column),
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE caller_blocking_setting_greeting (
    preset_id text,
    extension_id text,
    preset_name text,
    "type" text,
    PRIMARY KEY (preset_id, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE user_auth_profile (
    extension_id text,
    effective_role_id text,
    -- permission_* (dynamic column),
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE account_business_address (
    account_id text,
    city text,
    company text,
    country text,
    email text,
    main_site_name text,
    "state" text,
    street text,
    zip text,
    PRIMARY KEY (account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE call_monitoring_group_member_permission (
    "value" text,
    call_monitoring_group_member_id text,
    PRIMARY KEY ("value", call_monitoring_group_member_id),
    FOREIGN KEY (call_monitoring_group_member_id) REFERENCES call_monitoring_group_member(id)
);

CREATE TABLE inbound_fax_notification_advanced_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE call_standard_greeting (
    id text,
    category text,
    content_uri text,
    "name" text,
    text text,
    "type" text,
    usage_type text,
    PRIMARY KEY (id)
);

CREATE TABLE missed_call_notification_advanced_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE post_mention (
    id text,
    post_id text,
    "type" text,
    PRIMARY KEY (id, post_id),
    FOREIGN KEY (id) REFERENCES extension(id),
    FOREIGN KEY (post_id) REFERENCES chat_post(id)
);

CREATE TABLE ivr_prompt (
    id text,
    account_id text,
    content_type text,
    content_uri text,
    filename text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE contact (
    id text,
    extension_id text,
    assistant_phone text,
    availability text,
    birthday text,
    business_fax text,
    business_phone text,
    business_phone_2 text,
    callback_phone text,
    car_phone text,
    company text,
    company_phone text,
    email text,
    email_2 text,
    email_3 text,
    first_name text,
    home_phone text,
    home_phone_2 text,
    job_title text,
    last_name text,
    middle_name text,
    mobile_phone text,
    nick_name text,
    notes text,
    other_fax text,
    other_phone text,
    ringtone_index text,
    web_page text,
    -- business_address_* (dynamic column),
    -- home_address_* (dynamic column),
    -- other_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE "state" (
    id text,
    country_id text,
    iso_code text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE sms (
    id bigint,
    batch_id text,
    cost bigint,
    creation_time timestamp,
    direction text,
    error_code text,
    "from" text,
    last_modified_time timestamp,
    message_status text,
    segment_count integer,
    text text,
    PRIMARY KEY (id),
    FOREIGN KEY (batch_id) REFERENCES sms_batch(id)
);

CREATE TABLE company_phone_number (
    id bigint,
    country_id text,
    extension_id text,
    contact_center_provider_id text,
    contact_center_provider_name text,
    label text,
    location text,
    payment_type text,
    phone_number text,
    "status" text,
    temporary_number_id text,
    "type" text,
    usage_type text,
    vanity_pattern text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE chat_task (
    id text,
    chat_id text,
    creator_id text,
    color text,
    completeness_condition text,
    completeness_percentage bigint,
    creation_time timestamp,
    description text,
    due_date timestamp,
    last_modified_time timestamp,
    "section" text,
    start_date timestamp,
    "status" text,
    subject text,
    "type" text,
    -- recurrence_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (chat_id) REFERENCES chat(id),
    FOREIGN KEY (creator_id) REFERENCES extension(id)
);

CREATE TABLE user_business_hour_range (
    "day" text,
    "index" integer,
    extension_id text,
    "from" text,
    "to" text,
    PRIMARY KEY ("day", "index", extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE inbound_text_notification_advanced_sms_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE outbound_fax_notification_advanced_email (
    email_address text,
    extension_id text,
    PRIMARY KEY (email_address, extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE sms_to (
    "value" text,
    sms_id bigint,
    PRIMARY KEY ("value", sms_id),
    FOREIGN KEY (sms_id) REFERENCES sms(id)
);

CREATE TABLE account_custom_field (
    id text,
    account_id text,
    category text,
    display_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    operator_id text,
    regional_settings_formatting_locale_id text,
    regional_settings_greeting_language_id text,
    regional_settings_home_country_id text,
    regional_settings_language_id text,
    regional_settings_timezone_id text,
    service_info_brand_home_country_id text,
    service_info_contracted_country_id text,
    bsid text,
    cfid text,
    federated boolean,
    main_number text,
    outbound_call_prefix integer,
    partner_id text,
    setup_wizard_state text,
    signup_info_marketing_accepted boolean,
    signup_info_tos_accepted boolean,
    signup_info_verification_reason text,
    "status" text,
    status_info_comment text,
    status_info_reason text,
    status_info_till text,
    -- limits_* (dynamic column),
    -- regional_settings_* (dynamic column),
    -- service_info_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (operator_id) REFERENCES extension(id),
    FOREIGN KEY (regional_settings_formatting_locale_id) REFERENCES languages(id),
    FOREIGN KEY (regional_settings_greeting_language_id) REFERENCES languages(id),
    FOREIGN KEY (regional_settings_home_country_id) REFERENCES country(id),
    FOREIGN KEY (regional_settings_language_id) REFERENCES languages(id),
    FOREIGN KEY (regional_settings_timezone_id) REFERENCES timezone(id),
    FOREIGN KEY (service_info_brand_home_country_id) REFERENCES country(id),
    FOREIGN KEY (service_info_contracted_country_id) REFERENCES country(id)
);

CREATE TABLE company_business_hour_range (
    "day" text,
    "index" integer,
    account_id text,
    "from" text,
    "to" text,
    PRIMARY KEY ("day", "index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE post_attachment (
    id text,
    post_id text,
    all_day boolean,
    author_icon_uri text,
    author_name text,
    color text,
    creator_id text,
    description text,
    end_time timestamp,
    ending_after bigint,
    ending_condition text,
    ending_on text,
    fallback text,
    footnote_icon_uri text,
    footnote_text text,
    footnote_time text,
    image_uri text,
    intro text,
    location text,
    recurrence text,
    start_time timestamp,
    text text,
    thumbnail_uri text,
    title text,
    "type" text,
    PRIMARY KEY (id, post_id),
    FOREIGN KEY (post_id) REFERENCES chat_post(id)
);

CREATE TABLE user_permission (
    id text,
    category_id text,
    assignable boolean,
    description text,
    display_name text,
    read_only boolean,
    site_compatible text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES permission_category(id)
);

CREATE TABLE sms_batch (
    id text,
    account_id text,
    batch_size integer,
    creation_time timestamp,
    "from" text,
    last_modified_time timestamp,
    processed_count integer,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE call_recording_custom_greeting (
    custom_id text,
    account_id text,
    language_id text,
    "type" text,
    PRIMARY KEY (custom_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);

CREATE TABLE included_permission (
    id text,
    user_permission_id text,
    assignable boolean,
    read_only boolean,
    site_compatible text,
    PRIMARY KEY (id, user_permission_id),
    FOREIGN KEY (user_permission_id) REFERENCES user_permission(id)
);

CREATE TABLE service_provider_config_authentication_scheme (
    "name" text,
    service_provider_config_id text,
    description text,
    documentation_uri text,
    "primary" boolean,
    spec_uri text,
    PRIMARY KEY ("name", service_provider_config_id),
    FOREIGN KEY (service_provider_config_id) REFERENCES service_provider_config(_fivetran_id)
);

CREATE TABLE federation (
    id text,
    account_id text,
    creation_time text,
    display_name text,
    last_modified_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE blocked_and_allowed_number (
    id text,
    extension_id text,
    label text,
    phone_number text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE extension_grant (
    extension_id text,
    call_delegation boolean,
    call_monitoring boolean,
    call_on_behalf_of boolean,
    call_pickup boolean,
    call_queue_members_setup boolean,
    call_queue_messages boolean,
    call_queue_setup boolean,
    group_paging boolean,
    PRIMARY KEY (extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE chat_task_assignee (
    chat_task_id text,
    id text,
    "status" text,
    PRIMARY KEY (chat_task_id, id),
    FOREIGN KEY (chat_task_id) REFERENCES chat_task(id),
    FOREIGN KEY (id) REFERENCES extension(id)
);

CREATE TABLE company_directory_phone_number (
    phone_number text,
    company_directory_id text,
    formatted_phone_number text,
    hidden boolean,
    label text,
    "primary" boolean,
    "type" text,
    usage_type text,
    PRIMARY KEY (phone_number, company_directory_id),
    FOREIGN KEY (company_directory_id) REFERENCES company_directory(id)
);

CREATE TABLE user_template (
    id text,
    account_id text,
    creation_time timestamp,
    last_modified_time timestamp,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
