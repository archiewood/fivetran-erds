CREATE TABLE event_question (
    id text,
    event_id text,
    created text,
    created_by text,
    last_modified text,
    last_modified_by text,
    text text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE attendee_insight_score (
    attendee_id text,
    attendee_insight_id text,
    event_id text,
    created text,
    created_by text,
    last_modified text,
    last_modified_by text,
    points text,
    rank text,
    PRIMARY KEY (attendee_id, attendee_insight_id, event_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (attendee_insight_id) REFERENCES attendee_insight(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE appointment_participant (
    "index" text,
    appointment_id text,
    attendee_id text,
    contact_id text,
    created text,
    created_by text,
    deleted text,
    last_modified text,
    last_modified_by text,
    participated text,
    private_note_viewer text,
    question_viewer text,
    response text,
    "type" text,
    PRIMARY KEY ("index", appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE appointment_question (
    id text,
    appointment_id text,
    "name" text,
    order_number text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id)
);

CREATE TABLE appointment (
    id text,
    appointment_event_id text,
    auto_accept_attendee text,
    code text,
    created text,
    created_by text,
    deleted text,
    end_date text,
    enforce_schedule_rule text,
    last_modified text,
    last_modified_by text,
    location_name text,
    modified text,
    "name" text,
    start_date text,
    "status" text,
    type_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (appointment_event_id) REFERENCES appointment_event(id)
);

CREATE TABLE attendance_duration (
    id text,
    attendee_id text,
    event_id text,
    session_id text,
    created text,
    created_by text,
    deleted text,
    duration text,
    duration_type text,
    first_seen text,
    last_modified text,
    last_modified_by text,
    last_seen text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE attendee_activity (
    id text,
    attendee_id text,
    event_id text,
    created text,
    data_type text,
    "name" text,
    opened text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE contact (
    id text,
    company text,
    created text,
    created_by text,
    deleted text,
    email text,
    first_name text,
    last_modified text,
    last_modified_by text,
    last_name text,
    opt_outby text,
    opt_outdate text,
    opt_outopted_out text,
    primary_address_type text,
    source_id text,
    PRIMARY KEY (id)
);

CREATE TABLE attendee_insight_stats (
    _fivetran_id text,
    attendee_insight_id text,
    activity_count text,
    attendee_count text,
    average_attendee_score text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (attendee_insight_id) REFERENCES attendee_insight(id)
);

CREATE TABLE card_transaction_reconciliation (
    "index" text,
    card_transaction_id text,
    amount text,
    budget_item_id text,
    reconciled_by text,
    reconciled_date text,
    "status" text,
    PRIMARY KEY ("index", card_transaction_id),
    FOREIGN KEY (card_transaction_id) REFERENCES card_transaction(id)
);

CREATE TABLE card_transaction_description (
    "index" text,
    card_transaction_id text,
    description text,
    PRIMARY KEY ("index", card_transaction_id),
    FOREIGN KEY (card_transaction_id) REFERENCES card_transaction(id)
);

CREATE TABLE card_transaction (
    id text,
    card_id text,
    event_id text,
    amount text,
    currency text,
    merchant text,
    transaction_date text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_role_assignment (
    id text,
    event_id text,
    user_id text,
    assigned text,
    assigned_by text,
    role_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE attendee_insight (
    id text,
    event_id text,
    created text,
    created_by text,
    defaultly text,
    description text,
    last_modified text,
    last_modified_by text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE users_email (
    "index" text,
    users_id text,
    is_primary text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_phone_number (
    "index" text,
    users_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_address (
    "index" text,
    users_id text,
    country text,
    is_primary text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    "type" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_group (
    "index" text,
    users_id text,
    display text,
    "value" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    company text,
    created text,
    family_name text,
    federated_id text,
    given_name text,
    home_fax text,
    honorific_prefix text,
    last_modified text,
    locale text,
    location text,
    middle_name text,
    "name" text,
    pager text,
    resource_type text,
    send_login_detail text,
    timezone text,
    title text,
    user_type text,
    work_fax text,
    PRIMARY KEY (id)
);

CREATE TABLE event_transaction_order (
    event_id text,
    event_transaction_id text,
    order_id text,
    PRIMARY KEY (event_id, event_transaction_id, order_id),
    FOREIGN KEY (event_id) REFERENCES event_transaction(event_id),
    FOREIGN KEY (event_transaction_id) REFERENCES event_transaction(id),
    FOREIGN KEY (order_id) REFERENCES event_order(event_id)
);

CREATE TABLE event_transaction (
    id text,
    event_id text,
    attendee_id text,
    amount text,
    batch_number text,
    billing_address_1 text,
    billing_address_2 text,
    billing_address_3 text,
    billing_city text,
    billing_country_code text,
    billing_postal_code text,
    billing_region text,
    billing_region_code text,
    cc_expiration_date text,
    created text,
    created_by text,
    currency text,
    "date" text,
    journal_number text,
    last_modified text,
    last_modified_by text,
    name_on_credit_card text,
    payment_method text,
    payment_note text,
    payment_type text,
    processor_transaction_id text,
    reference_number text,
    success text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE speaker (
    id text,
    contact_id text,
    event_id text,
    biography text,
    category_id text,
    category_name text,
    code text,
    company text,
    created text,
    created_by text,
    designation text,
    email text,
    featured text,
    first_name text,
    internal_note text,
    last_modified timestamp,
    last_modified_by text,
    last_name text,
    order_number text,
    prefix text,
    tittle text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE campaign (
    id text,
    active text,
    click_tracking_enabled text,
    company_name text,
    created text,
    created_by text,
    from_name text,
    last_modified text,
    last_modified_by text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_event (
    event_id text,
    survey_id text,
    PRIMARY KEY (event_id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    activate_date text,
    author_company text,
    author_email text,
    author_first_name text,
    author_last_name text,
    author_title text,
    code text,
    created text,
    created_by text,
    last_modified text,
    last_modified_by text,
    response_count text,
    "status" text,
    timezone text,
    title text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_event (
    id text,
    event_id text,
    deleted text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE meeting_request_form_status (
    "index" text,
    meeting_request_form_id text,
    "status" text,
    PRIMARY KEY ("index", meeting_request_form_id),
    FOREIGN KEY (meeting_request_form_id) REFERENCES meeting_request_form(id)
);

CREATE TABLE meeting_request_form_question (
    id text,
    meeting_request_form_id text,
    field text,
    hidden text,
    max_date text,
    max_length text,
    min_date text,
    "name" text,
    order_number text,
    required text,
    "type" text,
    PRIMARY KEY (id, meeting_request_form_id),
    FOREIGN KEY (meeting_request_form_id) REFERENCES meeting_request_form(id)
);

CREATE TABLE meeting_request_form (
    id text,
    consent_question jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE card_reporting_field (
    "index" text,
    card_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE card (
    id text,
    event_id text,
    available_balance text,
    billing_account_id text,
    card_holder_name text,
    company text,
    description text,
    end_date text,
    first_6 text,
    full_name text,
    issuer text,
    last_4 text,
    last_7 text,
    purchase_template text,
    spend_limit text,
    start_date text,
    "status" text,
    total_transaction_amount text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE "session" (
    id text,
    event_id text,
    capacity_unlimited text,
    code text,
    created text,
    custom_fields jsonb,
    data_tag_code text,
    description text,
    display_on_agenda text,
    enable_waitlist text,
    end_date text,
    featured text,
    group_id text,
    included_session text,
    last_modified text,
    open_for_attendee_hub text,
    open_for_registration text,
    presentation_type text,
    registration_types jsonb,
    "start" text,
    "status" text,
    timezone text,
    title text,
    type_id text,
    type_name text,
    virtual text,
    virtual_capacity_unlimited text,
    waitlist_capacity text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE session_speaker (
    session_id text,
    speaker_id text,
    PRIMARY KEY (session_id, speaker_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (speaker_id) REFERENCES speaker(id)
);

CREATE TABLE video_session (
    "index" text,
    video_id text,
    session_id text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_speaker (
    "index" text,
    video_id text,
    speaker_id text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_exhibitor (
    "index" text,
    video_id text,
    exhibitor_id text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video (
    id text,
    event_id text,
    created text,
    duration text,
    encoding_profile text,
    generated_thumbnail_url text,
    hls_input text,
    last_modified text,
    "size" text,
    source_id text,
    source_status text,
    "status" text,
    tags jsonb,
    title text,
    "type" text,
    upload_completed text,
    upload_started text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_venue (
    "index" text,
    event_id text,
    address_1 text,
    address_2 text,
    address_3 text,
    city text,
    country text,
    country_code text,
    latitude text,
    longitude text,
    "name" text,
    postal_code text,
    region text,
    region_code text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_language (
    "index" text,
    event_id text,
    languages text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_planner (
    "index" text,
    event_id text,
    deleted text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_custom_field (
    id text,
    event_id text,
    "name" text,
    order_number text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    agenda_link text,
    archive_after text,
    capacity text,
    category_name text,
    close_after text,
    code text,
    created text,
    created_by text,
    currency text,
    default_locale text,
    description text,
    end_date text,
    event_status text,
    format text,
    invitation_link text,
    last_modified text,
    last_modified_by text,
    launch_after text,
    note text,
    registration_link text,
    registration_security_level text,
    start_date text,
    "status" text,
    summary_link text,
    test_mode text,
    timezone text,
    title text,
    "type" text,
    virtual text,
    PRIMARY KEY (id)
);

CREATE TABLE email (
    id text,
    attendee_id text,
    contact_id text,
    event_id text,
    bounced text,
    clicked text,
    created text,
    created_by text,
    first_clicked text,
    first_opened text,
    from_date text,
    last_modified text,
    last_modified_by text,
    opened text,
    sent text,
    "status" text,
    subject text,
    to_date text,
    "type" text,
    undeliverable text,
    PRIMARY KEY (id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE text_track (
    id text,
    video_id text,
    auto_generated text,
    created text,
    created_by text,
    defaultly text,
    error_message text,
    kind text,
    label text,
    languages text,
    last_modified text,
    last_modified_by text,
    published text,
    "status" text,
    url text,
    PRIMARY KEY (id, video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE question_value (
    "index" text,
    attendee_id text,
    attendee_question_id text,
    "value" text,
    PRIMARY KEY ("index", attendee_id, attendee_question_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee_question(attendee_id),
    FOREIGN KEY (attendee_question_id) REFERENCES attendee_question(id)
);

CREATE TABLE attendee_question (
    id text,
    attendee_id text,
    "name" text,
    order_number text,
    "type" text,
    PRIMARY KEY (id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee_answer_value (
    "index" text,
    question_id text,
    attendee_id text,
    "value" text,
    PRIMARY KEY ("index", question_id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee (
    id text,
    contact_id text,
    event_id text,
    admission_item_code text,
    admission_item_id text,
    admission_item_name text,
    allow_appointment_push_notification text,
    attendee_last_modified text,
    attendee_segment_id text,
    checked_in text,
    confirmation_number text,
    contact_attendee_segment_id jsonb,
    contact_opt_out_attendee_segment_id jsonb,
    contact_type_attendee_segment_id jsonb,
    created text,
    created_by text,
    group_leader text,
    group_member text,
    guest text,
    home_address_address_1 text,
    home_address_address_2 text,
    home_address_city text,
    home_address_country text,
    home_address_country_code text,
    home_address_postal_code text,
    home_address_region text,
    home_address_region_code text,
    invitation_list_id text,
    invitation_list_name text,
    invited_by text,
    last_modified text,
    last_modified_by text,
    opted_out text,
    registered_at text,
    registration_last_modified text,
    registration_path_code text,
    registration_path_id text,
    registration_path_name text,
    registration_type_attendee_segment_id text,
    registration_type_code text,
    registration_type_id text,
    registration_type_name text,
    response_method text,
    "status" text,
    test_record text,
    type_attendee_segment_id text,
    type_id text,
    type_name text,
    unsubscribed text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE question_choice (
    id text,
    question_id text,
    label text,
    short_text text,
    text text,
    PRIMARY KEY (id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question_category (
    id text,
    question_id text,
    required text,
    short_text text,
    text text,
    PRIMARY KEY (id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question_sub_category (
    id text,
    question_id text,
    short_text text,
    text text,
    PRIMARY KEY (id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question_fields_choice (
    id text,
    question_field_id text,
    question_id text,
    label text,
    short_text text,
    text text,
    PRIMARY KEY (id),
    FOREIGN KEY (question_field_id) REFERENCES question_field(id),
    FOREIGN KEY (question_id) REFERENCES question_field(question_id)
);

CREATE TABLE question_field (
    id text,
    question_id text,
    notapplicableanswer_shorttext text,
    notapplicableanswer_text text,
    otheranswer_shorttext text,
    otheranswer_text text,
    required text,
    short_text text,
    text text,
    "type" text,
    PRIMARY KEY (id, question_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question (
    id text,
    event_id text,
    survey_id text,
    code text,
    comments text,
    created text,
    created_by text,
    html_text text,
    last_modified text,
    last_modified_by text,
    max_score text,
    not_applicable_answershort_text text,
    not_applicable_answertext text,
    other_answershort_text text,
    other_answertext text,
    required text,
    short_text text,
    text text,
    total_sum text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE exhibitor (
    id text,
    event_id text,
    address_1 text,
    address_2 text,
    banner_id text,
    banner_url text,
    city text,
    code text,
    country text,
    created text,
    created_by text,
    deleted text,
    description text,
    email text,
    event_sponsor text,
    facebook_url text,
    featured text,
    last_modified text,
    last_modified_by text,
    linked_in_url text,
    location text,
    mobile_phone text,
    "name" text,
    other_phone text,
    postal_code text,
    profile_logo_id text,
    profile_logo_url text,
    region text,
    source_id text,
    sponsorship_level_id text,
    twitter_url text,
    website text,
    work_phone text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE budget_item_custom_field (
    id text,
    budget_item_id text,
    "name" text,
    order_number text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (id, budget_item_id),
    FOREIGN KEY (budget_item_id) REFERENCES budget_item(id)
);

CREATE TABLE budget_item_cost_tax_detail (
    id text,
    budget_item_cost_detail_id text,
    budget_item_id text,
    applied_tax_value text,
    "name" text,
    tax text,
    tax_type text,
    PRIMARY KEY (id, budget_item_cost_detail_id, budget_item_id),
    FOREIGN KEY (budget_item_cost_detail_id) REFERENCES budget_item_cost_detail(id),
    FOREIGN KEY (budget_item_id) REFERENCES budget_item_cost_detail(budget_item_id)
);

CREATE TABLE budget_item_cost_detail (
    id text,
    budget_item_id text,
    applied_gratuity_value text,
    cost text,
    gratuity text,
    "name" text,
    total_cost text,
    unit text,
    PRIMARY KEY (id, budget_item_id),
    FOREIGN KEY (budget_item_id) REFERENCES budget_item(id)
);

CREATE TABLE budget_item_saving (
    id text,
    budget_item_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, budget_item_id),
    FOREIGN KEY (budget_item_id) REFERENCES budget_item(id)
);

CREATE TABLE budget_item_associated_registrant (
    invitee_id text,
    budget_item_id text,
    contact_id text,
    first_name text,
    hcp_status text,
    last_name text,
    PRIMARY KEY (invitee_id, budget_item_id, contact_id),
    FOREIGN KEY (budget_item_id) REFERENCES budget_item(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE budget_item (
    id text,
    event_id text,
    associated_session text,
    calculate_tax_on_gratuity text,
    category_id text,
    category_name text,
    code text,
    conversion_rate text,
    conversion_rate_locked text,
    cost_avoidance_amount text,
    cost_avoidance_description text,
    cost_includes_tax_gratuity text,
    cost_type text,
    currency text,
    "date" text,
    deleted text,
    general_ledger_code text,
    general_ledger_id text,
    general_ledger_name text,
    gratuity_type text,
    internal_note text,
    last_modified_date text,
    "name" text,
    "status" text,
    sub_category_id text,
    sub_category_name text,
    vendor_id text,
    vendor_name text,
    vendor_type text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE meeting_request_question (
    id text,
    meeting_request_id text,
    "name" text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (id, meeting_request_id),
    FOREIGN KEY (meeting_request_id) REFERENCES meeting_request(id)
);

CREATE TABLE meeting_request (
    id text,
    event_id text,
    meeting_request_form_id text,
    "name" text,
    source_id text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (meeting_request_form_id) REFERENCES meeting_request_form(id)
);

CREATE TABLE lead (
    id text,
    attendee_id text,
    event_id text,
    application text,
    appointment_id text,
    booth_staff_id text,
    company text,
    created text,
    deleted text,
    device_id text,
    email text,
    exhibitor_id text,
    first_name text,
    home_address_address_1 text,
    home_address_address_2 text,
    home_address_city text,
    home_address_country text,
    home_address_postal_code text,
    home_address_region text,
    last_modified text,
    last_name text,
    license_code text,
    matched text,
    mobile_phone text,
    qualified text,
    "source" text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE campaign_email_template (
    id text,
    campaign_id text,
    active text,
    click_tracking_enabled text,
    created text,
    created_by text,
    from_email text,
    from_name text,
    html_body text,
    last_modified text,
    last_modified_by text,
    locale text,
    "name" text,
    plaintext_body text,
    reply_to_email text,
    reply_to_name text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE enrollment (
    id text,
    attendee_id text,
    event_id text,
    session_id text,
    created text,
    deleted text,
    last_modified text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE audio_track (
    id text,
    video_id text,
    created text,
    created_by text,
    defaultly text,
    duration text,
    languages text,
    last_modified text,
    last_modified_by text,
    "status" text,
    "type" text,
    url text,
    variant text,
    PRIMARY KEY (id, video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE response_answer (
    "index" text,
    response_id text,
    category_id text,
    choice_id text,
    field_id text,
    sub_category_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response (
    id text,
    event_id text,
    question_id text,
    session_id text,
    speaker_id text,
    survey_id text,
    attempt text,
    chapter_id text,
    created text,
    created_by text,
    last_modified text,
    last_modified_by text,
    looping_choice_id text,
    respondent_id text,
    score text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (speaker_id) REFERENCES speaker(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE event_order_discount (
    "index" text,
    event_id text,
    event_order_id text,
    code text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", event_id, event_order_id),
    FOREIGN KEY (event_id) REFERENCES event_order(event_id),
    FOREIGN KEY (event_order_id) REFERENCES event_order(id)
);

CREATE TABLE event_order (
    id text,
    event_id text,
    attendee_id text,
    cancelled text,
    created text,
    created_by text,
    last_modified text,
    last_modified_by text,
    payment_method text,
    "type" text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);
