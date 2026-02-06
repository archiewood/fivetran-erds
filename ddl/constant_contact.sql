CREATE TABLE custom_field (
    id text,
    created_at text,
    label text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE email_campaign_summary_report (
    campaign_type text,
    last_sent_date text,
    campaign_id text,
    unique_counts_abuse text,
    unique_counts_bounces text,
    unique_counts_clicks text,
    unique_counts_forwards text,
    unique_counts_not_opened text,
    unique_counts_opens text,
    unique_counts_optouts text,
    unique_counts_sends text,
    PRIMARY KEY (campaign_type, last_sent_date, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES email_campaign(id)
);

CREATE TABLE segment (
    id text,
    created_at text,
    criteria text,
    edited_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_tag (
    id text,
    contacts_count text,
    created_at text,
    "name" text,
    tag_source text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_list (
    id text,
    created_at text,
    deleted_at text,
    description text,
    favorite text,
    membership_count text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_custom (
    contact_id text,
    custom_field_id text,
    "value" text,
    PRIMARY KEY (contact_id, custom_field_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE contact_phone_number (
    id text,
    contact_id text,
    create_source text,
    created_at text,
    kind text,
    phone_number text,
    update_source text,
    updated_at text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_street_address (
    id text,
    contact_id text,
    city text,
    country text,
    created_at text,
    kind text,
    postal_code text,
    "state" text,
    street text,
    updated_at text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_membership (
    contact_id text,
    list_id text,
    PRIMARY KEY (contact_id, list_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_tagging (
    contact_id text,
    tag_id text,
    PRIMARY KEY (contact_id, tag_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (tag_id) REFERENCES contact_tag(id)
);

CREATE TABLE contact_note (
    id text,
    contact_id text,
    content text,
    created_at text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_sms_channel_consent (
    "index" text,
    contact_id text,
    advertised_frequency text,
    advertised_interval text,
    consent_type text,
    created_at text,
    opt_in_date text,
    opt_out_date text,
    sms_consent_permission text,
    updated_at text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    anniversary text,
    birthday_day text,
    birthday_month text,
    company_name text,
    create_source text,
    created_at text,
    deleted_at text,
    email_address text,
    email_confirm_status text,
    email_created_at text,
    email_opt_in_date text,
    email_opt_in_source text,
    email_opt_out_date text,
    email_opt_out_reason text,
    email_opt_out_source text,
    email_permission_to_send text,
    email_updated_at text,
    first_name text,
    job_title text,
    last_name text,
    sms_channel_address text,
    sms_channel_country_code text,
    sms_channel_create_source text,
    sms_channel_dial_code text,
    sms_channel_id text,
    sms_channel_update_source text,
    update_source text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_sms_engagement_history (
    insert_time text,
    sms_channel_history_id text,
    sms_channel_id text,
    contact_id text,
    history_details_advertised_frequency text,
    history_details_advertised_interval text,
    history_details_consent_action_time text,
    history_details_consent_action_type text,
    history_details_consent_medium_type text,
    history_details_consent_type text,
    history_details_source text,
    history_details_source_consent_timestamp text,
    history_details_source_ip text,
    history_details_source_sms_number text,
    history_details_state text,
    PRIMARY KEY (insert_time, sms_channel_history_id, sms_channel_id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_campaign_stat_report (
    last_refresh_time text,
    campaign_id text,
    percents_bounce text,
    percents_click text,
    percents_desktop_click text,
    percents_desktop_open text,
    percents_did_not_open text,
    percents_mobile_click text,
    percents_mobile_open text,
    percents_open text,
    percents_unsubscribe text,
    stats_em_bounces text,
    stats_em_clicks text,
    stats_em_clicks_all text,
    stats_em_clicks_all_computer text,
    stats_em_clicks_all_mobile text,
    stats_em_clicks_all_none text,
    stats_em_clicks_all_other text,
    stats_em_clicks_all_tablet text,
    stats_em_forwards text,
    stats_em_not_opened text,
    stats_em_opens text,
    stats_em_opens_all text,
    stats_em_opens_all_computer text,
    stats_em_opens_all_mobile text,
    stats_em_opens_all_none text,
    stats_em_opens_all_other text,
    stats_em_opens_all_tablet text,
    stats_em_optouts text,
    stats_em_sends text,
    PRIMARY KEY (last_refresh_time, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES email_campaign(id)
);

CREATE TABLE email_campaign (
    id text,
    created_at text,
    current_status text,
    "name" text,
    "type" text,
    type_code text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE email_bounce_report (
    campaign_activity_id text,
    contact_id text,
    bounce_code text,
    created_time text,
    current_email_address text,
    deleted_at text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE campaign_activity_segment (
    campaign_activity_id text,
    segment_id text,
    PRIMARY KEY (campaign_activity_id, segment_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE campaign_activity_contact_list (
    campaign_activity_id text,
    contact_list_id text,
    PRIMARY KEY (campaign_activity_id, contact_list_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE campaign_activity (
    id text,
    campaign_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    address_optional text,
    city text,
    country_code text,
    country_name text,
    current_status text,
    format_type text,
    forward_email_link_enabled text,
    forward_email_link_name text,
    from_email text,
    from_name text,
    greeting_name_type text,
    greeting_salutation text,
    greeting_secondary text,
    html_content text,
    letter_format text,
    organization_name text,
    permalink_url text,
    permission_reminder text,
    permission_reminder_enabled text,
    postal_code text,
    preheader text,
    reply_to_email text,
    "role" text,
    state_code text,
    state_name text,
    state_non_us_name text,
    style_content text,
    subject text,
    subscribe_link_enabled text,
    subscribe_link_name text,
    template_id text,
    text_content text,
    view_as_webpage_enabled text,
    view_as_webpage_link_name text,
    view_as_webpage_text text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES email_campaign(id)
);

CREATE TABLE email_forward_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_opt_out_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    opt_out_reason text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_campaign_activity_stat_report (
    last_refresh_time text,
    campaign_activity_id text,
    campaign_id text,
    stats_em_abuse text,
    stats_em_bounces text,
    stats_em_bounces_blocked text,
    stats_em_bounces_mailbox_full text,
    stats_em_bounces_nonexistent_address text,
    stats_em_bounces_other text,
    stats_em_bounces_suspended text,
    stats_em_bounces_undeliverable text,
    stats_em_bounces_vacation text,
    stats_em_clicks text,
    stats_em_clicks_all text,
    stats_em_clicks_all_computer text,
    stats_em_clicks_all_mobile text,
    stats_em_clicks_all_none text,
    stats_em_clicks_all_other text,
    stats_em_clicks_all_tablet text,
    stats_em_forwards text,
    stats_em_not_opened text,
    stats_em_opens text,
    stats_em_opens_all text,
    stats_em_opens_all_computer text,
    stats_em_opens_all_mobile text,
    stats_em_opens_all_none text,
    stats_em_opens_all_other text,
    stats_em_opens_all_tablet text,
    stats_em_optouts text,
    stats_em_sends text,
    PRIMARY KEY (last_refresh_time, campaign_activity_id, campaign_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (campaign_id) REFERENCES email_campaign(id)
);

CREATE TABLE unique_contact_add_landing_page_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    sms_channel_country_code text,
    sms_channel_formatted_international text,
    sms_channel_formatted_national text,
    sms_channel_state text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_click_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    link_url text,
    tracking_activity_type text,
    url_id text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_send_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_open_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_unique_open_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE send_history_contact_list (
    contact_list_id text,
    send_id text,
    PRIMARY KEY (contact_list_id, send_id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (send_id) REFERENCES send_history(send_id)
);

CREATE TABLE send_history_segment (
    segment_id text,
    send_id text,
    PRIMARY KEY (segment_id, send_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (send_id) REFERENCES send_history(send_id)
);

CREATE TABLE send_history (
    send_id text,
    campaign_activity_id text,
    count text,
    reason_code text,
    run_date text,
    send_status text,
    PRIMARY KEY (send_id, campaign_activity_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id)
);

CREATE TABLE unique_contact_click_landing_page_report (
    url_id text,
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    link_url text,
    sms_channel_country_code text,
    sms_channel_formatted_international text,
    sms_channel_formatted_national text,
    sms_channel_state text,
    tracking_activity_type text,
    PRIMARY KEY (url_id, campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE unique_contact_sms_opt_in_landing_page_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    sms_channel_country_code text,
    sms_channel_formatted_international text,
    sms_channel_formatted_national text,
    sms_channel_state text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE html_preview_email_campaign_activity (
    campaign_activity_id text,
    from_email text,
    from_name text,
    preheader text,
    preview_html_content text,
    preview_text_content text,
    reply_to_email text,
    subject text,
    PRIMARY KEY (campaign_activity_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id)
);

CREATE TABLE unique_contact_open_landing_page_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    device_type text,
    sms_channel_country_code text,
    sms_channel_formatted_international text,
    sms_channel_formatted_national text,
    sms_channel_state text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_open_landing_page_report (
    created_time text,
    campaign_activity_id text,
    contact_id text,
    deleted_at text,
    device_type text,
    sms_channel_country_code text,
    sms_channel_formatted_international text,
    sms_channel_formatted_national text,
    sms_channel_state text,
    tracking_activity_type text,
    PRIMARY KEY (created_time, campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE unique_contact_update_landing_page_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    sms_channel_country_code text,
    sms_channel_formatted_international text,
    sms_channel_formatted_national text,
    sms_channel_state text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email_link_report (
    url_id text,
    campaign_activity_id text,
    list_id text,
    link_tag text,
    link_url text,
    list_action text,
    unique_clicks text,
    PRIMARY KEY (url_id, campaign_activity_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (list_id) REFERENCES contact_list(id)
);

CREATE TABLE non_opener_resend_campaign_activity (
    resend_date text,
    resend_request_id text,
    campaign_activity_id text,
    delay_days text,
    delay_minutes text,
    resend_status text,
    resend_subject text,
    PRIMARY KEY (resend_date, resend_request_id, campaign_activity_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id)
);

CREATE TABLE email_did_not_open_report (
    campaign_activity_id text,
    contact_id text,
    created_time text,
    deleted_at text,
    tracking_activity_type text,
    PRIMARY KEY (campaign_activity_id, contact_id),
    FOREIGN KEY (campaign_activity_id) REFERENCES campaign_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);
