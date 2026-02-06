CREATE TABLE session_field_choice (
    id text,
    session_field_id text,
    "name" text,
    sort text,
    PRIMARY KEY (id, session_field_id),
    FOREIGN KEY (session_field_id) REFERENCES session_field(id)
);

CREATE TABLE session_field (
    id text,
    allow_html text,
    attribute text,
    "name" text,
    required text,
    setting text,
    sort text,
    "type" text,
    visible text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_registrant (
    id text,
    contact_id text,
    event_id text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE contact (
    id text,
    account_id text,
    billing_address jsonb,
    bio text,
    birth_date text,
    cc_email text,
    company text,
    created_at text,
    email text,
    first_name text,
    gender_id text,
    gender_value text,
    home_address jsonb,
    job_title text,
    last_name text,
    middle_name text,
    mobile_phone text,
    note text,
    prefix text,
    profile_picture text,
    subscribe_status text,
    suffix text,
    twitter_handle text,
    unsubscribed_events jsonb,
    updated_at text,
    vat_number text,
    work_address jsonb,
    work_phone text,
    PRIMARY KEY (id)
);

CREATE TABLE call_for_speaker_review (
    id text,
    event_id text,
    created_at text,
    notes text,
    rating text,
    reviewer_id text,
    submission_date text,
    submission_description text,
    submission_end_time text,
    submission_id text,
    submission_name text,
    submission_reviews text,
    submission_session_status text,
    submission_start_time text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_question_choice (
    id text,
    event_question_id text,
    event_id text,
    admin_short_name text,
    badge_name text,
    capacity text,
    "name" text,
    public_short_name text,
    question_id text,
    sold_out_message text,
    sort text,
    visible text,
    PRIMARY KEY (id, event_question_id),
    FOREIGN KEY (event_question_id) REFERENCES event_question(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_question (
    id text,
    event_id text,
    page_id text,
    admin_short_name text,
    attribute text,
    created_at text,
    hint text,
    "name" text,
    public_short_name text,
    sort text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE registrant_type (
    id text,
    event_id text,
    admin_short_name text,
    capacity text,
    created_at text,
    description text,
    max_group_size text,
    min_group_size text,
    "name" text,
    public_short_name text,
    sold_out_message text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE "transaction" (
    id text,
    event_id text,
    registrant_id text,
    amount text,
    card_number_last_4 text,
    card_type text,
    created_at text,
    created_by text,
    datetime text,
    gateway_id text,
    name_on_card text,
    note text,
    payment_gateway_name text,
    "status" text,
    "type" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (registrant_id) REFERENCES registrant(id)
);

CREATE TABLE call_for_speaker_submission (
    id text,
    event_id text,
    created_at text,
    "date" text,
    description text,
    direct_link text,
    end_time text,
    location text,
    "name" text,
    note text,
    reviews text,
    session_included text,
    session_status text,
    start_time text,
    timezone text,
    track text,
    updated_at text,
    virtual_link text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE speaker (
    id text,
    event_id text,
    bio text,
    company text,
    created_at text,
    email text,
    first_name text,
    job_title text,
    last_name text,
    profile_picture text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE contact_field (
    id text,
    admin_short_name text,
    attribute text,
    default_response text,
    hint text,
    icon text,
    icon_alignment text,
    max_length text,
    min_length text,
    "name" text,
    note text,
    public_short_name text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE event_language (
    "index" text,
    event_id text,
    languages text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    folder_id text,
    capacity text,
    close_date text,
    close_time text,
    created_at text,
    created_by text,
    currency text,
    description text,
    domain text,
    end_date text,
    end_time text,
    event_venue_type text,
    free_event text,
    hashtag text,
    location_city text,
    location_company text,
    location_country_code text,
    location_country_continent text,
    location_country_currency_code text,
    location_country_name text,
    location_country_tax_name text,
    location_country_zipcode_required text,
    location_latitude text,
    location_line_1 text,
    location_line_2 text,
    location_line_3 text,
    location_longitude text,
    location_name text,
    location_phone text,
    location_state text,
    location_website text,
    location_zip text,
    "name" text,
    organizer_id text,
    reg_count text,
    start_date text,
    start_time text,
    "status" text,
    swoogo_virtual_location text,
    target_attendance text,
    timezone text,
    translation jsonb,
    type_id text,
    type_value text,
    updated_at text,
    updated_by text,
    url text,
    virtual_host text,
    webinar_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES event_folder(id)
);

CREATE TABLE event_folder (
    id text,
    parent_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES event_folder(id)
);

CREATE TABLE call_for_speaker_contact (
    id text,
    contact_id text,
    event_id text,
    created_at text,
    reviewer text,
    reviewer_role text,
    submitter text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE registrant (
    id text,
    contact_id text,
    event_id text,
    group_id text,
    package_id text,
    reg_type_id text,
    cancelled_at text,
    checked_in_at text,
    created_at text,
    group_balance_due text,
    group_gross text,
    group_net text,
    group_paid text,
    group_tax text,
    group_tax_2 text,
    individual_gross text,
    individual_net text,
    individual_tax text,
    individual_tax_2 text,
    ip_address text,
    languages text,
    payment_method text,
    payment_plan jsonb,
    po_number text,
    reference text,
    reg_type_value text,
    registered_at text,
    registration_status text,
    "session" jsonb,
    session_attendance jsonb,
    sponsor_attendance jsonb,
    timezone text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (group_id) REFERENCES event(id),
    FOREIGN KEY (package_id) REFERENCES package(id),
    FOREIGN KEY (reg_type_id) REFERENCES registrant_type(id)
);

CREATE TABLE package (
    id text,
    event_id text,
    admin_short_name text,
    capacity text,
    created_at text,
    description text,
    max_group_size text,
    min_group_size text,
    "name" text,
    public_short_name text,
    sold_out_message text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_field_choice (
    id text,
    event_field_id text,
    "name" text,
    sort text,
    PRIMARY KEY (id, event_field_id),
    FOREIGN KEY (event_field_id) REFERENCES event_field(id)
);

CREATE TABLE event_field (
    id text,
    allow_html text,
    attribute text,
    "name" text,
    required text,
    s_button_text text,
    s_hint text,
    s_link_collection_field text,
    s_max_link text,
    s_url_display_format text,
    s_url_image_id text,
    sort text,
    "type" text,
    visible text,
    PRIMARY KEY (id)
);

CREATE TABLE scan (
    _fivetran_id text,
    event_id text,
    registrant_id text,
    created_by text,
    scan_id text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (registrant_id) REFERENCES registrant(id)
);

CREATE TABLE registrant_line_item (
    _fivetran_id text,
    event_id text,
    group_id text,
    question_id text,
    registrant_id text,
    datetime text,
    full_price_gross text,
    full_price_net text,
    gross text,
    net text,
    object text,
    object_id text,
    quantity text,
    "status" text,
    tax text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (group_id) REFERENCES registrant(id),
    FOREIGN KEY (question_id) REFERENCES event_question_choice(question_id),
    FOREIGN KEY (registrant_id) REFERENCES registrant(id)
);

CREATE TABLE sponsor (
    id text,
    event_id text,
    created_at text,
    description text,
    level_id text,
    level_value text,
    logo_id text,
    "name" text,
    notes text,
    updated_at text,
    website text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE sponsor_field_choice (
    id text,
    sponsor_field_id text,
    "name" text,
    sort text,
    PRIMARY KEY (id, sponsor_field_id),
    FOREIGN KEY (sponsor_field_id) REFERENCES sponsor_field(id)
);

CREATE TABLE sponsor_field (
    id text,
    allow_html text,
    attribute text,
    "name" text,
    required text,
    s_button_text text,
    s_hint text,
    s_link_collection_field text,
    s_max_link text,
    s_url_display_format text,
    s_url_image_id text,
    settings text,
    sort text,
    "type" text,
    visible text,
    PRIMARY KEY (id)
);

CREATE TABLE "session" (
    id text,
    event_id text,
    capacity text,
    created_at text,
    "date" text,
    description text,
    end_time text,
    location text,
    location_id text,
    "name" text,
    notes text,
    start_time text,
    track text,
    track_id text,
    type_id text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE page (
    id text,
    event_id text,
    event_website_id text,
    parent_id text,
    created_at text,
    event_question text,
    full_url text,
    icon text,
    "name" text,
    slug text,
    sort text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (event_website_id) REFERENCES event_website(id),
    FOREIGN KEY (parent_id) REFERENCES page(id)
);

CREATE TABLE event_badge (
    id text,
    event_id text,
    active text,
    created_at text,
    created_by text,
    "name" text,
    note text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_website (
    id text,
    account_id text,
    event_id text,
    module text,
    theme_id text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES contact(account_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE data_list (
    id text,
    account_id text,
    "name" text,
    note text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES contact(account_id)
);
