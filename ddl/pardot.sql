CREATE TABLE tag_object (
    object_id bigint,
    tag_id bigint,
    PRIMARY KEY (object_id, tag_id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE opportunity_prospect (
    opportunity_id bigint,
    prospect_id bigint,
    updated_at timestamp,
    PRIMARY KEY (opportunity_id, prospect_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE email_template (
    id bigint,
    campaign_id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    folder_id bigint,
    html_message text,
    is_auto_responder_email boolean,
    is_drip_email boolean,
    is_list_email boolean,
    is_one_to_one_email boolean,
    "name" text,
    subject text,
    tag_replacement_language text,
    text_message text,
    tracker_domain_id bigint,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE visitor_activity (
    id bigint,
    campaign_id bigint,
    email_id bigint,
    email_template_id bigint,
    list_email_id bigint,
    opportunity_id text,
    prospect_id bigint,
    visit_id bigint,
    visitor_id bigint,
    created_at timestamp,
    custom_redirect_id bigint,
    details text,
    file_id bigint,
    form_handler_id bigint,
    form_id bigint,
    landing_page_id bigint,
    multivariate_test_variation_id bigint,
    paid_search_ad_id bigint,
    site_search_query_id bigint,
    "type" bigint,
    type_name text,
    updated_at timestamp,
    visitor_page_view_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id),
    FOREIGN KEY (list_email_id) REFERENCES list_email(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (visit_id) REFERENCES visit(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(id)
);

CREATE TABLE lifecycle_stage (
    id bigint,
    created_at timestamp,
    is_locked boolean,
    match_type text,
    "name" text,
    "position" integer,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE reply_to_option (
    _fivetran_id text,
    account_custom_field_id bigint,
    email_template_id bigint,
    prospect_custom_field_id bigint,
    user_id bigint,
    address text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id),
    FOREIGN KEY (prospect_custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE form_handler (
    id bigint,
    campaign_id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    embed_code text,
    error_location text,
    folder_id bigint,
    is_always_email boolean,
    is_cookieless boolean,
    is_data_forwarded boolean,
    is_deleted boolean,
    "name" text,
    salesforce_id text,
    success_location text,
    tracker_domain_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE prospect (
    id bigint,
    campaign_id bigint,
    prospect_account_id bigint,
    user_id bigint,
    address_one text,
    address_two text,
    annual_revenue text,
    city text,
    comments text,
    company text,
    country text,
    created_at timestamp,
    crm_account_fid text,
    crm_contact_fid text,
    crm_last_sync timestamp,
    crm_lead_fid text,
    crm_owner_fid text,
    crm_url text,
    department text,
    email text,
    employees text,
    fax text,
    first_name text,
    grade text,
    industry text,
    is_do_not_call boolean,
    is_do_not_email boolean,
    is_permanently_deleted boolean,
    is_reviewed boolean,
    is_starred boolean,
    job_title text,
    last_activity_at timestamp,
    last_name text,
    notes text,
    opted_out boolean,
    password text,
    phone text,
    recent_interaction text,
    salutation text,
    score bigint,
    "source" text,
    "state" text,
    territory text,
    updated_at timestamp,
    website text,
    years_in_business text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (prospect_account_id) REFERENCES prospect_account(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE form_field_progressive (
    prospect_api_field_id text,
    form_field_id bigint,
    PRIMARY KEY (prospect_api_field_id, form_field_id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id)
);

CREATE TABLE form_field (
    id bigint,
    created_by_id bigint,
    form_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    css_classes text,
    data_format text,
    error_message text,
    has_dependents boolean,
    has_progressives boolean,
    has_values boolean,
    is_always_display boolean,
    is_do_not_prefill boolean,
    is_maintain_initial_value boolean,
    is_required boolean,
    label text,
    prospect_api_field_id text,
    sort_order integer,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE email (
    id bigint,
    list_email_id bigint,
    campaign_id bigint,
    client_type text,
    created_at timestamp,
    created_by_id bigint,
    list_id bigint,
    "name" text,
    prospect_id bigint,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (list_email_id) REFERENCES list_email(id)
);

CREATE TABLE engagement_studio_program (
    id bigint,
    created_by_id bigint,
    schedule_created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    description text,
    folder_id bigint,
    "name" text,
    prospects_multiple_entry_maximum_entries integer,
    prospects_multiple_entry_minimum_duration_in_days integer,
    recipient_list_ids text,
    salesforce_id text,
    schedule_created_at timestamp,
    schedule_start_on timestamp,
    schedule_stop_on timestamp,
    "status" text,
    suppression_list_ids text,
    updated_at timestamp,
    -- business_hours_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (schedule_created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE visitor_page_view (
    id bigint,
    campaign_id bigint,
    visit_id bigint,
    visitor_id bigint,
    created_at timestamp,
    duration_in_seconds bigint,
    salesforce_id text,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (visit_id) REFERENCES visit(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(id)
);

CREATE TABLE form_field_dependent (
    dependent_form_field_id bigint,
    form_field_id bigint,
    "value" text,
    PRIMARY KEY (dependent_form_field_id, form_field_id),
    FOREIGN KEY (dependent_form_field_id) REFERENCES form_field(id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id)
);

CREATE TABLE external_activity (
    id bigint,
    created_by_id bigint,
    prospect_id bigint,
    activity_date timestamp,
    created_at timestamp,
    extension text,
    extension_salesforce_id text,
    "type" text,
    type_salesforce_id text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE opportunity (
    id bigint,
    campaign_id bigint,
    closed_at timestamp,
    created_at timestamp,
    "name" text,
    probability bigint,
    stage text,
    "status" text,
    "type" text,
    updated_at timestamp,
    "value" double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE visit (
    id bigint,
    prospect_id bigint,
    visitor_id bigint,
    campaign_parameter text,
    content_parameter text,
    created_at timestamp,
    duration_in_seconds bigint,
    first_visitor_page_view_at timestamp,
    last_visitor_page_view_at timestamp,
    medium_parameter text,
    source_parameter text,
    term_parameter text,
    updated_at timestamp,
    visitor_page_view_count bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor(id)
);

CREATE TABLE custom_field (
    id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    field_id text,
    is_analytics_synced boolean,
    is_record_multiple_responses boolean,
    is_required boolean,
    is_use_values boolean,
    "name" text,
    salesforce_id text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE custom_redirect (
    id bigint,
    campaign_id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    bitly_is_personalized boolean,
    bitly_short_url text,
    created_at timestamp,
    destination_url text,
    folder_id bigint,
    ga_campaign text,
    ga_content text,
    ga_medium text,
    ga_source text,
    ga_term text,
    "name" text,
    salesforce_id text,
    tracked_url text,
    tracker_domain_id bigint,
    updated_at timestamp,
    url text,
    vanity_url text,
    vanity_url_path text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE lifecycle_history (
    id bigint,
    next_stage_id bigint,
    previous_stage_id bigint,
    prospect_id bigint,
    created_at timestamp,
    seconds_elapsed integer,
    PRIMARY KEY (id),
    FOREIGN KEY (next_stage_id) REFERENCES lifecycle_stage(id),
    FOREIGN KEY (previous_stage_id) REFERENCES lifecycle_stage(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE campaign (
    id bigint,
    created_by_id bigint,
    parent_campaign_id text,
    updated_by_id bigint,
    cost bigint,
    created_at timestamp,
    folder_id bigint,
    "name" text,
    salesforce_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (parent_campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE prospect_account (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE sender_option (
    _fivetran_id text,
    account_custom_field_id bigint,
    email_template_id bigint,
    prospect_custom_field_id bigint,
    user_id bigint,
    address text,
    "name" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id),
    FOREIGN KEY (prospect_custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE list (
    id bigint,
    campaign_id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    description text,
    folder_id bigint,
    is_dynamic boolean,
    is_public boolean,
    "name" text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE list_email (
    id bigint,
    campaign_id bigint,
    email_template_id bigint,
    client_type text,
    created_at timestamp,
    created_by_id bigint,
    html_message text,
    is_deleted boolean,
    is_paused boolean,
    is_sent boolean,
    "name" text,
    operational_email boolean,
    sent_at timestamp,
    subject text,
    text_message text,
    tracker_domain_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id)
);

CREATE TABLE form_handler_field (
    id bigint,
    created_by_id bigint,
    form_handler_id bigint,
    created_at timestamp,
    data_format text,
    error_message text,
    is_maintain_initial_value boolean,
    is_required boolean,
    "name" text,
    prospect_api_field_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (form_handler_id) REFERENCES form_handler(id)
);

CREATE TABLE "user" (
    id bigint,
    account integer,
    created_at timestamp,
    email text,
    first_name text,
    job_title text,
    last_name text,
    "role" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE tag (
    id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE list_membership (
    id bigint,
    created_by_id bigint,
    list_id bigint,
    prospect_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    opted_out boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE visitor (
    id bigint,
    campaign_id bigint,
    prospect_id bigint,
    campaign_parameter text,
    content_parameter text,
    created_at timestamp,
    do_not_sell boolean,
    hostname text,
    ip_address text,
    is_identified boolean,
    medium_parameter text,
    page_view_count bigint,
    source_parameter text,
    term_parameter text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE form_field_value (
    sort_order bigint,
    form_field_id bigint,
    list_id bigint,
    label text,
    profile_id bigint,
    "value" text,
    PRIMARY KEY (sort_order, form_field_id),
    FOREIGN KEY (form_field_id) REFERENCES form_field(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE form (
    id bigint,
    campaign_id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    after_form_content text,
    before_form_content text,
    checkbox_alignment text,
    created_at timestamp,
    embed_code text,
    folder_id bigint,
    font_color text,
    font_family text,
    font_size text,
    is_always_display boolean,
    is_captcha_enabled boolean,
    is_cookieless boolean,
    is_use_redirect_location boolean,
    label_alignment text,
    layout_template_id text,
    "name" text,
    radio_alignment text,
    redirect_location text,
    required_character text,
    salesforce_id text,
    show_not_prospect boolean,
    submit_button_text text,
    thank_you_code text,
    thank_you_content text,
    tracker_domain_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);
