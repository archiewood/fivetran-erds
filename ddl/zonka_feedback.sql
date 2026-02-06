CREATE TABLE location (
    id text,
    address text,
    external_id text,
    is_active text,
    labels jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_survey (
    contact_id text,
    id text,
    PRIMARY KEY (contact_id, id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (id) REFERENCES survey(id)
);

CREATE TABLE contact (
    id text,
    created_by text,
    last_survey_viewed_id text,
    modified_by text,
    android_session_counts text,
    attributes jsonb,
    average_nps text,
    bounced text,
    company_id text,
    contact_source text,
    created_date text,
    email_address text,
    external_id text,
    first_page text,
    first_referring_site text,
    first_seen text,
    first_seen_on_android text,
    first_seen_on_ios text,
    first_seen_on_web text,
    has_note text,
    history_imported_from_anonymous text,
    ios_session_counts text,
    last_email_survey_sent_datetime text,
    last_nps text,
    last_page text,
    last_referring_site text,
    last_response_date_time text,
    last_seen text,
    last_seen_on_android text,
    last_seen_on_ios text,
    last_seen_on_web text,
    last_session_active_at text,
    last_sms_survey_sent_datetime text,
    last_survey_viewed_date text,
    last_web_widget_shown text,
    lists jsonb,
    locations jsonb,
    mau_next_count_after_date text,
    mobile text,
    modified_date text,
    "name" text,
    num_notes text,
    num_pending_tasks text,
    num_tasks text,
    pages_viewed_count text,
    pre_mongified_id text,
    session_counts text,
    "source" text,
    surveys_visits jsonb,
    thirdparty_created_date text,
    thirdparty_singup_date text,
    thirdparty_updated_date text,
    total_responses text,
    unique_id text,
    unsubscribe_email text,
    unsubscribe_sms text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    web_session_counts text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_survey_viewed_id) REFERENCES survey(id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE task_assigned (
    assigned_to text,
    task_id text,
    PRIMARY KEY (assigned_to, task_id),
    FOREIGN KEY (assigned_to) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    contact_id text,
    response_id text,
    description text,
    due_date_time text,
    is_completed text,
    "name" text,
    reminder_setting text,
    type_id text,
    type_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE device_label (
    "index" text,
    device_id text,
    label text,
    PRIMARY KEY ("index", device_id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device (
    id text,
    location_id text,
    app_status text,
    app_version text,
    charging text,
    description text,
    device_battery_level text,
    device_brand text,
    device_category text,
    device_imei text,
    device_model text,
    device_os text,
    device_os_version text,
    device_resolution text,
    device_serial_number text,
    device_time_zone text,
    friendly_name text,
    ip_address text,
    is_active text,
    is_preview_mode text,
    last_communication text,
    last_logged_user_name text,
    last_login_time text,
    "name" text,
    unique_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE survey (
    id text,
    modified_by text,
    workspace_id text,
    description text,
    is_active text,
    location_id jsonb,
    modified_date text,
    "name" text,
    web_survey_title text,
    web_survey_url jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    modified_by text,
    modified_date text,
    workspace_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE user_location (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    designation text,
    email text,
    external_id text,
    is_active text,
    is_owner text,
    labels jsonb,
    last_login text,
    mobile text,
    "name" text,
    "role" text,
    PRIMARY KEY (id)
);

CREATE TABLE response_attribute (
    "value" text,
    response_id text,
    variable_id text,
    PRIMARY KEY ("value", response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response_survey (
    question_id text,
    response_id text,
    answer text,
    question_label text,
    variable_id text,
    PRIMARY KEY (question_id, response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response_tags (
    "index" text,
    response_id text,
    tags text,
    PRIMARY KEY ("index", response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response (
    id text,
    location_id text,
    rated_user_id text,
    respondent_id text,
    survey_id text,
    taken_by_user_id text,
    browser text,
    ces text,
    channel text,
    channel_email_opened text,
    channel_sent text,
    channel_survey_opened text,
    channel_survey_submitted text,
    channel_user_agent text,
    contact_attributes jsonb,
    csat text,
    duration text,
    geo_location text,
    has_comments text,
    has_notes text,
    has_task text,
    integration_ticket_id text,
    integration_type text,
    is_important text,
    is_starred text,
    nps text,
    os text,
    rated_user_name text,
    received_date text,
    received_date_local text,
    respondent_email_address text,
    respondent_external_id text,
    respondent_mobile text,
    respondent_name text,
    response_url text,
    survey_language text,
    task_id text,
    time_zone text,
    web_device text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (rated_user_id) REFERENCES users(id),
    FOREIGN KEY (respondent_id) REFERENCES users(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (taken_by_user_id) REFERENCES users(id)
);
