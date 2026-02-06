CREATE TABLE contact_list_contact (
    contact_id bigint,
    contact_list_id bigint,
    PRIMARY KEY (contact_id, contact_list_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE campaign (
    id bigint,
    created_by bigint,
    updated_by text,
    accessed_at timestamp,
    actual_cost numeric,
    badge_id text,
    budgeted_cost numeric,
    campaign_category text,
    campaign_type text,
    clr_end_date text,
    created_at timestamp,
    crm_id text,
    current_status text,
    description text,
    end_at timestamp,
    first_activation timestamp,
    folder_id bigint,
    is_email_marketing_campaign boolean,
    is_included_in_roi boolean,
    is_member_allowed_re_entry boolean,
    is_read_only boolean,
    is_synced_with_crm boolean,
    member_count bigint,
    "name" text,
    product text,
    region text,
    run_as_user_id bigint,
    scheduled_for text,
    source_template_id text,
    start_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

-- Note
-- This table represents metadata related to a session for an event. It's essentially the template use for an even and it's sessions.
CREATE TABLE event_registration_session_field (
    id bigint,
    event_registration_id bigint,
    data_type text,
    "name" text,
    "type" text,
    -- output_format_* (dynamic column),
    PRIMARY KEY (id, event_registration_id),
    FOREIGN KEY (event_registration_id) REFERENCES event_registration(id)
);

CREATE TABLE contact_list_segment_element (
    id bigint,
    segment_id bigint,
    contact_list_id bigint,
    count bigint,
    is_included boolean,
    last_calculated_at timestamp,
    "type" text,
    PRIMARY KEY (id, segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_list (
    id bigint,
    created_by text,
    updated_by text,
    created_at timestamp,
    current_status text,
    data_lookup_id text,
    folder_id bigint,
    "name" text,
    scope text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

-- Note 
-- This table contains the actual values and details associated with those values for a session.
CREATE TABLE event_registration_session_field_value (
    id bigint,
    event_registration_id bigint,
    session_id bigint,
    session_field_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY (id, event_registration_id, session_id),
    FOREIGN KEY (event_registration_id) REFERENCES event_registration(id),
    FOREIGN KEY (session_id) REFERENCES event_registration_session(event_registration_id),
    FOREIGN KEY (session_field_id) REFERENCES event_registration_session_field(event_registration_id)
);

CREATE TABLE event_registration_session (
    id bigint,
    event_registration_id bigint,
    "name" text,
    participants_limit integer,
    "type" text,
    PRIMARY KEY (id, event_registration_id),
    FOREIGN KEY (event_registration_id) REFERENCES event_registration(id)
);

CREATE TABLE email_form (
    email_id bigint,
    form_id bigint,
    PRIMARY KEY (email_id, form_id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form (
    id bigint,
    created_at timestamp,
    current_status text,
    "name" text,
    processing_type text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE form_submission (
    id bigint,
    form_id bigint,
    submitted_by_contact_id bigint,
    submitted_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (submitted_by_contact_id) REFERENCES contact(id)
);

CREATE TABLE "option" (
    "value" text,
    option_list_id bigint,
    display_name text,
    "type" text,
    PRIMARY KEY ("value", option_list_id),
    FOREIGN KEY (option_list_id) REFERENCES option_list(id)
);

CREATE TABLE event_registration_registrant (
    id bigint,
    account_id bigint,
    contact_id bigint,
    event_registration_id bigint,
    created_at timestamp,
    custom_object_record_status text,
    is_mapped text,
    "name" text,
    "type" text,
    unique_code text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_registration_id) REFERENCES event_registration(id)
);

CREATE TABLE event_registration (
    id bigint,
    created_by bigint,
    updated_by bigint,
    created_at timestamp,
    description text,
    email_address_field_id bigint,
    event_group_by_field_id bigint,
    folder_id bigint,
    "name" text,
    "type" text,
    unique_code_field_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

CREATE TABLE contact_activity (
    activity_type text,
    id bigint,
    campaign_id bigint,
    contact_id bigint,
    form_id bigint,
    visitor_id bigint,
    activity_date timestamp,
    asset_id bigint,
    asset_name text,
    asset_type text,
    contact_id_ext text,
    deployment_id bigint,
    duration text,
    email_address text,
    email_clicked_thru_link text,
    email_recipient_id text,
    email_send_type text,
    email_web_link text,
    external_asset_name text,
    external_asset_type text,
    external_id text,
    external_type text,
    first_page_view_url text,
    ip_address text,
    is_web_tracking_opted_in text,
    number_of_pages bigint,
    raw_data text,
    referrer_url text,
    smtp_error_code text,
    smtp_message text,
    smtp_status_code bigint,
    subject_line text,
    url text,
    visitor_external_id text,
    web_visit_id text,
    PRIMARY KEY (activity_type, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(id)
);

CREATE TABLE account (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE contact_segment (
    contact_id bigint,
    segment_id bigint,
    PRIMARY KEY (contact_id, segment_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE visitor (
    id bigint,
    last_visit_date_and_time timestamp,
    contact_id bigint,
    browser_type text,
    city_from_ip text,
    company_dns_name text,
    company_name_from_ip_1 text,
    country_from_ip text,
    country_name text,
    created_at timestamp,
    current_status text,
    current_total_pages bigint,
    current_visit_length bigint,
    external_id text,
    first_page_in_visit text,
    first_visit_date_and_time timestamp,
    host_name text,
    ip_address text,
    isp_from_ip text,
    last_page_in_visit text,
    latitude_from_ip text,
    longitude_from_ip text,
    "name" text,
    province_from_ip text,
    time_zone text,
    time_zone_offset_min text,
    total_pages bigint,
    total_time bigint,
    total_visits bigint,
    "type" text,
    zip_code_from_ip text,
    PRIMARY KEY (id, last_visit_date_and_time),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email (
    id bigint,
    created_by text,
    updated_by text,
    archived text,
    bounce_back_email text,
    created_at timestamp,
    current_status text,
    html_content_content_source text,
    html_content_html text,
    html_content_type text,
    is_content_protected boolean,
    is_plain_text_editable boolean,
    is_private boolean,
    is_tracked boolean,
    "name" text,
    plain_text text,
    render_mode text,
    reply_to_email text,
    reply_to_name text,
    send_plain_text_only boolean,
    sender_email text,
    sender_name text,
    subject text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

CREATE TABLE event_registration_field (
    id bigint,
    event_registration_id bigint,
    checked_value text,
    data_type text,
    default_value text,
    display_type text,
    internal_name text,
    "name" text,
    option_list_id text,
    "type" text,
    unchecked_value text,
    PRIMARY KEY (id, event_registration_id),
    FOREIGN KEY (event_registration_id) REFERENCES event_registration(id)
);

CREATE TABLE contact (
    id bigint,
    created_by bigint,
    updated_by bigint,
    account_name text,
    address_1 text,
    address_2 text,
    address_3 text,
    bounceback_date timestamp,
    business_phone text,
    city text,
    country text,
    created_at timestamp,
    current_status text,
    email_address text,
    fax text,
    first_name text,
    is_bounceback boolean,
    is_subscribed boolean,
    last_name text,
    mobile_phone text,
    "name" text,
    postal_code text,
    province text,
    sales_person text,
    subscription_date timestamp,
    title text,
    unsubscription_date timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

CREATE TABLE contact_filter (
    id bigint,
    created_by text,
    updated_by text,
    created_at timestamp,
    current_status text,
    folder_id bigint,
    "name" text,
    scope text,
    statement text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

CREATE TABLE segment (
    id bigint,
    created_by text,
    updated_by text,
    count bigint,
    created_at timestamp,
    current_status text,
    folder_id bigint,
    is_stale boolean,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

CREATE TABLE event_registration_registrant_field_value (
    id bigint,
    event_registration_id bigint,
    registrant_id bigint,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, event_registration_id, registrant_id),
    FOREIGN KEY (event_registration_id) REFERENCES event_registration(id),
    FOREIGN KEY (registrant_id) REFERENCES event_registration_registrant(id)
);

CREATE TABLE contact_filter_segment_element (
    id bigint,
    segment_id bigint,
    contact_filter_id bigint,
    count bigint,
    is_included boolean,
    last_calculated_at timestamp,
    "type" text,
    PRIMARY KEY (id, segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (contact_filter_id) REFERENCES contact_filter(id)
);

CREATE TABLE option_list (
    id bigint,
    created_by text,
    updated_by text,
    created_at timestamp,
    current_status text,
    description text,
    "name" text,
    permissions jsonb,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES user_info(id),
    FOREIGN KEY (updated_by) REFERENCES user_info(id)
);

CREATE TABLE email_hyperlink (
    id text,
    email_id bigint,
    href text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, email_id),
    FOREIGN KEY (email_id) REFERENCES email(id)
);

CREATE TABLE user_info (
    id bigint,
    city text,
    company_display_name text,
    company_url text,
    country text,
    created_at timestamp,
    created_by bigint,
    department text,
    description text,
    digital_signature_id text,
    email_address text,
    first_name text,
    folder_id bigint,
    is_disabled boolean,
    job_title text,
    last_name text,
    login_name text,
    "name" text,
    reply_to_address text,
    sender_display_name text,
    sender_email_address text,
    "state" text,
    "type" text,
    updated_at timestamp,
    updated_by bigint,
    zip_code text,
    PRIMARY KEY (id)
);
