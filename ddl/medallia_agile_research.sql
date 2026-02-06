CREATE TABLE lookup_survey_language (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_distribution (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_responserate (
    panelist_status_id text,
    survey_id text,
    groups text,
    panelist_count text,
    PRIMARY KEY (panelist_status_id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE lookup_state (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_respondent_response_tag (
    "index" text,
    survey_id text,
    survey_respondent_id text,
    survey_respondent_response_index text,
    salience_score text,
    sentiment_score text,
    tag_id text,
    tagged_by_text_mining text,
    PRIMARY KEY ("index", survey_id, survey_respondent_id, survey_respondent_response_index),
    FOREIGN KEY (survey_id) REFERENCES survey_respondent_response(survey_id),
    FOREIGN KEY (survey_respondent_id) REFERENCES survey_respondent_response(survey_respondent_id),
    FOREIGN KEY (survey_respondent_response_index) REFERENCES survey_respondent_response("index")
);

CREATE TABLE survey_respondent_response (
    "index" text,
    survey_id text,
    survey_respondent_id text,
    question_id text,
    response_id text,
    data_label text,
    response_caption text,
    scale_value text,
    score text,
    "value" text,
    PRIMARY KEY ("index", survey_id, survey_respondent_id),
    FOREIGN KEY (survey_id) REFERENCES survey_respondent(survey_id),
    FOREIGN KEY (survey_respondent_id) REFERENCES survey_respondent(id),
    FOREIGN KEY (question_id) REFERENCES survey_question(id),
    FOREIGN KEY (response_id) REFERENCES survey_question_response(id)
);

CREATE TABLE survey_respondent (
    id text,
    survey_id text,
    browser_id text,
    contact_id text,
    contact_status_id text,
    distribution_method_id text,
    location_country_id text,
    os_id text,
    respondent_status_id text,
    completion_time text,
    date_responded timestamp,
    edit_url text,
    ip_address text,
    is_mobile text,
    language_code text,
    location_city text,
    location_latitude text,
    location_longitude text,
    report_url text,
    respondent_hash text,
    respondent_report_url text,
    response_date text,
    score text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (browser_id) REFERENCES lookup_browser(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (contact_status_id) REFERENCES lookup_contact_status(id),
    FOREIGN KEY (distribution_method_id) REFERENCES lookup_distribution(id),
    FOREIGN KEY (location_country_id) REFERENCES lookup_country(id),
    FOREIGN KEY (os_id) REFERENCES lookup_os(id),
    FOREIGN KEY (respondent_status_id) REFERENCES lookup_respondent_status(id)
);

CREATE TABLE contact_group (
    id text,
    contact_id text,
    "name" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    country_id text,
    "state" text,
    city text,
    date_of_birth text,
    email text,
    first_name text,
    gender text,
    house_number text,
    is_bounced text,
    is_opted_out text,
    lang_code text,
    last_name text,
    phone text,
    postal_code text,
    province text,
    street text,
    suite text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES lookup_country(id),
    FOREIGN KEY ("state") REFERENCES lookup_state(id)
);

CREATE TABLE lookup_data_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_contact (
    contact_id text,
    survey_id text,
    contact_status_id text,
    optout_source_id text,
    panelist_status_id text,
    date_added text,
    date_clicked_through text,
    date_invited text,
    date_last_modified timestamp,
    date_reminded text,
    date_reminded_partial text,
    date_responded text,
    date_saw_mail text,
    date_second_reminder text,
    date_sent_thank_you_mail text,
    date_to_be_invited text,
    date_to_expire text,
    live_url text,
    mail_preview_url text,
    password text,
    preview_url text,
    report_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (contact_id, survey_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (contact_status_id) REFERENCES lookup_contact_status(id),
    FOREIGN KEY (optout_source_id) REFERENCES lookup_optout_source(id),
    FOREIGN KEY (panelist_status_id) REFERENCES survey_responserate(panelist_status_id)
);

CREATE TABLE lookup_os (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_question_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_scale_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_contact_status (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_optout (
    _fivetran_id text,
    contact_id text,
    country_id text,
    optout_source_id text,
    date_opt_out timestamp,
    survey_participation text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (country_id) REFERENCES lookup_country(id),
    FOREIGN KEY (optout_source_id) REFERENCES lookup_optout_source(id)
);

CREATE TABLE import_config_column_mapping (
    _fivetran_id text,
    import_config_id text,
    source_column_number text,
    target_column_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (import_config_id) REFERENCES import_config(id)
);

CREATE TABLE import_config (
    id text,
    contact_group_id text,
    contact_id text,
    survey_id text,
    update_type_id text,
    back_office_user_id text,
    date_format text,
    default_language_code text,
    email_is_required text,
    email_must_be_unique_within_account text,
    email_must_be_unique_within_file text,
    email_must_be_unique_within_group text,
    field_delimiter text,
    first_row text,
    is_custom text,
    is_reusable text,
    "name" text,
    row_delimiter text,
    send_answer_notification text,
    send_notification_mail text,
    survey_setting_account_cooldown_after_invitation text,
    survey_setting_account_cooldown_after_response text,
    survey_setting_consider_cooldown_period text,
    survey_setting_expiration_after_days text,
    survey_setting_expiration_time text,
    survey_setting_invitation_delay_in_days text,
    survey_setting_invitation_time text,
    survey_setting_survey_cooldown_after_invitation text,
    survey_setting_survey_cooldown_after_response text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_group_id) REFERENCES contact_group(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (update_type_id) REFERENCES lookup_import_config_update_type(id)
);

CREATE TABLE lookup_import_config_update_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_question_sub_question_response (
    id text,
    survey_id text,
    survey_question_id text,
    survey_question_sub_question_id text,
    caption text,
    hidden text,
    not_applicable text,
    orders text,
    other text,
    scale_value text,
    "value" text,
    PRIMARY KEY (id, survey_id, survey_question_id, survey_question_sub_question_id),
    FOREIGN KEY (survey_id) REFERENCES survey_question_sub_question(survey_id),
    FOREIGN KEY (survey_question_id) REFERENCES survey_question_sub_question(survey_question_id),
    FOREIGN KEY (survey_question_sub_question_id) REFERENCES survey_question_sub_question(id)
);

CREATE TABLE survey_question_sub_question (
    id text,
    survey_id text,
    survey_question_id text,
    data_type_id text,
    parent_question_id text,
    question_type_id text,
    scale_type_id text,
    caption text,
    data_label text,
    hidden text,
    languages text,
    max_value text,
    min_value text,
    order_number text,
    page_number text,
    question_number text,
    required text,
    use_sentiment_score text,
    PRIMARY KEY (id, survey_id, survey_question_id),
    FOREIGN KEY (survey_id) REFERENCES survey_question(survey_id),
    FOREIGN KEY (survey_question_id) REFERENCES survey_question(id),
    FOREIGN KEY (data_type_id) REFERENCES lookup_data_type(id),
    FOREIGN KEY (parent_question_id) REFERENCES survey_question(id),
    FOREIGN KEY (question_type_id) REFERENCES lookup_question_type(id),
    FOREIGN KEY (scale_type_id) REFERENCES lookup_scale_type(id)
);

CREATE TABLE survey_question_response (
    id text,
    survey_id text,
    survey_question_id text,
    caption text,
    hidden text,
    not_applicable text,
    orders text,
    other text,
    scale_value text,
    "value" text,
    PRIMARY KEY (id, survey_id, survey_question_id),
    FOREIGN KEY (survey_id) REFERENCES survey_question(survey_id),
    FOREIGN KEY (survey_question_id) REFERENCES survey_question(id)
);

CREATE TABLE survey_question (
    id text,
    survey_id text,
    data_type_id text,
    parent_question_id text,
    question_type_id text,
    scale_type_id text,
    caption text,
    data_label text,
    hidden text,
    languages text,
    max_value text,
    min_value text,
    order_number text,
    page_number text,
    question_number text,
    required text,
    use_sentiment_score text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (data_type_id) REFERENCES lookup_data_type(id),
    FOREIGN KEY (parent_question_id) REFERENCES survey_question(id),
    FOREIGN KEY (question_type_id) REFERENCES lookup_question_type(id),
    FOREIGN KEY (scale_type_id) REFERENCES lookup_scale_type(id)
);

CREATE TABLE lookup_browser (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_respondent_status (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_optout_source (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup_country (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_language (
    languages text,
    survey_id text,
    PRIMARY KEY (languages, survey_id),
    FOREIGN KEY (languages) REFERENCES lookup_survey_language(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey_respondent_visibility (
    _fivetran_id text,
    survey_id text,
    show_contact_id text,
    show_email text,
    show_firstname text,
    show_lastname text,
    show_panelist_status text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    survey_status_id text,
    allow_editing_responses text,
    allow_multiple_submissions text,
    anonymous_panel text,
    client_ref text,
    cooldown_in_days_after_invitation text,
    cooldown_in_days_after_response text,
    create_date text,
    created_by text,
    default_lang text,
    end_date text,
    is_trial text,
    last_modify_date timestamp,
    maximum_completes text,
    maximum_respondents text,
    score_max text,
    show_question_numbering text,
    start_date text,
    survey_folder_id text,
    title text,
    via_email_is_active text,
    via_kiosk_is_active text,
    via_panel_provider_is_active text,
    via_paper_is_active text,
    via_sms_is_active text,
    via_telephone_is_active text,
    via_web_is_active text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (survey_status_id) REFERENCES lookup_survey_status(id)
);

CREATE TABLE lookup_survey_status (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
