CREATE TABLE "call" (
    id text,
    account_id text,
    agent_email text,
    answered text,
    business_phone_number text,
    customer_city text,
    customer_country text,
    customer_name text,
    customer_phone_number text,
    customer_state text,
    direction text,
    duration text,
    gclid text,
    recording text,
    recording_duration text,
    recording_player text,
    start_time text,
    tracking_phone_number text,
    voicemail text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE outer_bound (
    id text,
    account_id text,
    company_id text,
    created_at text,
    "name" text,
    validation_code text,
    verified text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE summary_email (
    id text,
    account_id text,
    user_id text,
    config_call_log text,
    config_summary_statistic text,
    config_top_keyword text,
    config_top_source text,
    frequency jsonb,
    scope_id text,
    scope_name text,
    scope_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE summarized_call (
    _fivetran_id text,
    account_id text,
    end_date text,
    start_date text,
    time_zone text,
    total_results_average_duration text,
    total_results_first_time_caller text,
    total_results_formatted_average_duration text,
    total_results_lead text,
    total_results_missed_call text,
    total_results_total_call text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE company (
    id text,
    account_id text,
    call_score_enabled text,
    call_scribe_enabled text,
    created_at text,
    disabled_at text,
    dni_active text,
    form_capture text,
    keyword_spotting_enabled text,
    lead_scoring_enabled text,
    "name" text,
    script_url text,
    "status" text,
    swap_cookie_duration text,
    swap_exclude_jquery text,
    swap_landing_override text,
    swap_ppc_override text,
    time_zone text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE notification (
    id text,
    account_id text,
    company_id text,
    tracker_id text,
    user_id text,
    agent_id text,
    alert_type text,
    call_enabled text,
    email text,
    "name" text,
    send_desktop text,
    send_email text,
    send_push text,
    sms_enabled text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (tracker_id) REFERENCES tracker(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE form_submission (
    id text,
    account_id text,
    company_id text,
    campaign text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    first_form text,
    form_url text,
    formatted_customer_name text,
    formatted_customer_phone_number text,
    keywords text,
    landing_page_url text,
    medium text,
    person_id text,
    referrer text,
    referring_url text,
    "source" text,
    submitted_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE milestone (
    _fivetran_id text,
    form_submission_id text,
    ad_position text,
    device text,
    event_date text,
    keywords text,
    landing text,
    landing_page_adgroup_id text,
    landing_page_campaign_id text,
    landing_page_creative text,
    landing_page_fbclid text,
    landing_page_gad_source text,
    landing_page_gbraid text,
    landing_page_gclid text,
    landing_page_network text,
    landing_page_placement text,
    match_type text,
    referrer text,
    referrer_url_param jsonb,
    session_browser text,
    "type" text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    PRIMARY KEY (_fivetran_id, form_submission_id),
    FOREIGN KEY (form_submission_id) REFERENCES form_submission(id)
);

CREATE TABLE account (
    id text,
    agency_in_trial text,
    brand_status text,
    created_at text,
    has_zuora_account text,
    hipaa_account text,
    "name" text,
    numeric_id text,
    outbound_recording_enabled text,
    PRIMARY KEY (id)
);

CREATE TABLE text_message_recent_message (
    "index" text,
    text_message_id text,
    content text,
    created_at text,
    direction text,
    PRIMARY KEY ("index", text_message_id),
    FOREIGN KEY (text_message_id) REFERENCES text_message(id)
);

CREATE TABLE text_message (
    id text,
    account_id text,
    company_id text,
    initial_tracker_id text,
    company_time_zone text,
    current_tracker_id text,
    customer_name text,
    customer_phone_number text,
    formatted_current_tracking_number text,
    formatted_customer_name text,
    formatted_customer_phone_number text,
    formatted_initial_tracking_number text,
    last_message_at text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (initial_tracker_id) REFERENCES tracker(id)
);

CREATE TABLE integration (
    id text,
    account_id text,
    company_id text,
    api_key text,
    "state" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE tracker_tracking_number (
    "index" text,
    tracker_id text,
    tracking_number text,
    PRIMARY KEY ("index", tracker_id),
    FOREIGN KEY (tracker_id) REFERENCES tracker(id),
    FOREIGN KEY (tracking_number) REFERENCES "call"(tracking_phone_number)
);

CREATE TABLE tracker (
    id text,
    account_id text,
    company_id text,
    created_at text,
    disabled_at text,
    "name" text,
    sms_enabled text,
    sms_supported text,
    source_search_engine text,
    source_search_type text,
    source_type text,
    "status" text,
    tracking_number jsonb,
    "type" text,
    whisper_message text,
    -- call_flow_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE users (
    id text,
    account_id text,
    accepted text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    "name" text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE integration_trigger (
    id text,
    account_id text,
    company_id text,
    integration_id text,
    call_type text,
    lead_status text,
    max_duration text,
    min_duration text,
    tracker_id jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE tags (
    id text,
    account_id text,
    company_id text,
    background_color text,
    color text,
    created_at text,
    "name" text,
    "status" text,
    tag_level text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);
