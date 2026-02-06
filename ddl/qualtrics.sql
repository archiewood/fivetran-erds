-- recipient_mailing_list_id can point to either
-- CORE_MAILING_LIST.id
-- or DIRECTORY_MAILING_LIST.id
-- recipient_contact_id can point to either
-- CORE_CONTACT.id
-- or DIRECTORY_CONTACT.id
-- recipient_sample_list_id can point to either
-- CORE_SAMPLE.id
-- or DIRECTORY_SAMPLE.id

-- QUICK START DATA MODELS
-- | Table | Description |
-- |--------|--------------|
-- | qualtrics__contact | Detailed view of all contacts (from both the XM Directory and Research Core contact endpoints), enhanced with response and mailing list metrics. |
-- | qualtrics__daily_breakdown | Daily breakdown of activities related to surveys and distribution in your Qualtrics instance. |
-- | qualtrics__directory | A directory is an address book for the entire brand and contains all of the contacts that have been added by your users. This model provides a detailed view of each directory, enhanced with metrics regarding contacts, survey distribution, and engagement. |
-- | qualtrics__distribution | Table of each survey's distribution (method of reaching out to XM directory contacts) enhanced with survey response and status metrics. |
-- | qualtrics__response | Breakdown of responses to individual questions (and their sub-questions). Enhanced with information regarding the survey-level response and the survey. |
-- | qualtrics__survey | Detailed view of all surveys created, enhanced with distribution and response metrics. |

-- XM Directory Lite and Standard Users
CREATE TABLE distribution_contact (
    contact_id text,
    contact_lookup_id text,
    distribution_id text,
    response_id text,
    contact_frequency_rule_id text,
    opened_at timestamp,
    response_completed_at timestamp,
    response_started_at timestamp,
    sent_at timestamp,
    "status" text,
    survey_link text,
    survey_session_id text,
    PRIMARY KEY (contact_id, contact_lookup_id, distribution_id),
    FOREIGN KEY (response_id) REFERENCES survey_response(id)
);

CREATE TABLE sms_distribution (
    id text,
    message_library_id text,
    message_message_id text,
    owner_id text,
    recipient_library_id text,
    recipient_transaction_batch_id text,
    recipient_transaction_id text,
    survey_id text,
    message_message_type text,
    "name" text,
    organization_id text,
    recipient_contact_id text,
    recipient_mailing_list_id text,
    recipient_sample_id text,
    request_status text,
    request_type text,
    send_date timestamp,
    survey_link_expiration_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (message_library_id) REFERENCES library(id),
    FOREIGN KEY (message_message_id) REFERENCES library_message(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (recipient_library_id) REFERENCES library(id),
    FOREIGN KEY (recipient_transaction_batch_id) REFERENCES transaction_batch(directory_id),
    FOREIGN KEY (recipient_transaction_id) REFERENCES contact_transaction(directory_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- XM Directory Users
CREATE TABLE frequency_rule (
    id text,
    directory_id text,
    always_send boolean,
    days_between integer,
    email_type text,
    num_messages integer,
    period text,
    target_type text,
    PRIMARY KEY (id, directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id)
);

-- XM Directory Lite Users
CREATE TABLE question (
    id text,
    survey_id text,
    data_export_tag text,
    data_visibility_hidden boolean,
    data_visibility_private boolean,
    next_answer_id integer,
    next_choice_id integer,
    question_description text,
    question_description_option text,
    question_text text,
    question_text_unsafe text,
    question_type text,
    selector text,
    sub_selector text,
    validation_setting_force_response text,
    validation_setting_force_response_type text,
    validation_setting_type text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- XM Directory Users
CREATE TABLE directory_contact (
    id text,
    directory_id text,
    creation_date timestamp,
    directory_unsubscribe_date timestamp,
    directory_unsubscribed boolean,
    email text,
    email_domain text,
    ext_ref text,
    first_name text,
    language text,
    last_modified timestamp,
    last_name text,
    phone text,
    write_blanks boolean,
    PRIMARY KEY (id, directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id)
);

-- XM Directory Lite Users
CREATE TABLE quota_group (
    id text,
    survey_id text,
    multi_match text,
    "name" text,
    public boolean,
    selected boolean,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- XM Directory Users
CREATE TABLE contact_transaction (
    id text,
    directory_id text,
    contact_id text,
    mailing_list_id text,
    transaction_date timestamp,
    PRIMARY KEY (id, directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id),
    FOREIGN KEY (contact_id) REFERENCES directory_contact(directory_id),
    FOREIGN KEY (mailing_list_id) REFERENCES directory_mailing_list(directory_id)
);

-- XM Directory Users
CREATE TABLE contact_mailing_list_membership (
    contact_lookup_id text,
    contact_id text,
    directory_id text,
    mailing_list_id text,
    owner_id text,
    "name" text,
    unsubscribe_date timestamp,
    unsubscribed boolean,
    PRIMARY KEY (contact_lookup_id),
    FOREIGN KEY (contact_id) REFERENCES directory_contact(directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id),
    FOREIGN KEY (mailing_list_id) REFERENCES directory_mailing_list(directory_id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

-- XM Directory Lite and Standard Users
CREATE TABLE directory_sample (
    id text,
    directory_id text,
    creator_id text,
    owner_id text,
    category text,
    creation_logic jsonb,
    description text,
    frozen boolean,
    hidden boolean,
    "name" text,
    parent_group_id text,
    PRIMARY KEY (id, directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE library_survey (
    folder_name text,
    library_survey_id text,
    library_id text,
    survey_name text,
    PRIMARY KEY (folder_name, library_survey_id, library_id),
    FOREIGN KEY (library_id) REFERENCES library(id)
);

-- XM Directory Lite and Standard Users
CREATE TABLE sms_distribution_contact (
    contact_id text,
    contact_lookup_id text,
    distribution_id text,
    response_id text,
    contact_frequency_rule_id text,
    opened_at timestamp,
    response_completed_at timestamp,
    response_started_at timestamp,
    sent_at timestamp,
    "status" text,
    survey_link text,
    survey_session_id text,
    PRIMARY KEY (contact_id, contact_lookup_id, distribution_id),
    FOREIGN KEY (response_id) REFERENCES survey_response(id)
);

-- XM Directory Users
CREATE TABLE batch_transaction_membership (
    batch_id text,
    directory_id text,
    transaction_id text,
    date_added_to_batch timestamp,
    PRIMARY KEY (batch_id, directory_id, transaction_id),
    FOREIGN KEY (batch_id) REFERENCES transaction_batch(directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id),
    FOREIGN KEY (transaction_id) REFERENCES contact_transaction(directory_id)
);

CREATE TABLE distribution (
    id text,
    message_library_id text,
    message_message_id text,
    owner_id text,
    recipient_library_id text,
    survey_link_survey_id text,
    created_date timestamp,
    message_message_text text,
    modified_date timestamp,
    organization_id text,
    parent_distribution_id text,
    recipient_contact_id text,
    recipient_mailing_list_id text,
    recipient_sample_id text,
    request_status text,
    request_type text,
    send_date timestamp,
    survey_link_expiration_date timestamp,
    survey_link_link_type text,
    -- header_* (dynamic column),
    -- stats_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (message_library_id) REFERENCES library(id),
    FOREIGN KEY (message_message_id) REFERENCES library_message(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (recipient_library_id) REFERENCES library(id),
    FOREIGN KEY (survey_link_survey_id) REFERENCES survey(id)
);

-- XM Directory Lite and Standard Users
CREATE TABLE directory_mailing_list (
    id text,
    directory_id text,
    owner_id text,
    creation_date timestamp,
    last_modified_date timestamp,
    "name" text,
    PRIMARY KEY (id, directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE "user" (
    id text,
    account_creation_date timestamp,
    account_expiration_date timestamp,
    account_status text,
    division_id text,
    email text,
    first_name text,
    language text,
    last_login_date timestamp,
    last_name text,
    organization_id text,
    password_expiration_date timestamp,
    password_last_changed_date timestamp,
    response_count_auditable integer,
    response_count_deleted integer,
    response_count_generated integer,
    time_zone text,
    unsubscribed boolean,
    user_type text,
    username text,
    PRIMARY KEY (id)
);

-- XM Directory Users
CREATE TABLE transaction_batch (
    id text,
    directory_id text,
    creation_date timestamp,
    PRIMARY KEY (id, directory_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id)
);

CREATE TABLE library_message (
    id text,
    library_id text,
    category text,
    description text,
    PRIMARY KEY (id, library_id),
    FOREIGN KEY (library_id) REFERENCES library(id)
);

-- XM Directory Lite Users
CREATE TABLE block_question (
    block_id text,
    question_id text,
    survey_id text,
    PRIMARY KEY (block_id, question_id, survey_id),
    FOREIGN KEY (block_id) REFERENCES block(survey_id),
    FOREIGN KEY (question_id) REFERENCES question(survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- Non-XM Directory Users
CREATE TABLE core_sample (
    id text,
    mailing_list_id text,
    "name" text,
    PRIMARY KEY (id, mailing_list_id),
    FOREIGN KEY (mailing_list_id) REFERENCES core_mailing_list(id)
);

-- Non-XM Directory Users
CREATE TABLE core_mailing_list (
    id text,
    library_id text,
    category text,
    folder text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (library_id) REFERENCES library(id)
);

-- XM Directory Lite Users
CREATE TABLE question_option (
    "key" text,
    question_id text,
    survey_id text,
    recode_value text,
    text text,
    PRIMARY KEY ("key", question_id, survey_id),
    FOREIGN KEY (question_id) REFERENCES question(survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- XM Directory Lite Users
CREATE TABLE question_response (
    _fivetran_id text,
    question_id text,
    question_option_key text,
    response_id text,
    sub_question_key text,
    label text,
    loop_id text,
    question text,
    sub_question_text text,
    text text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (question_id) REFERENCES question(survey_id),
    FOREIGN KEY (question_option_key) REFERENCES question_option(survey_id),
    FOREIGN KEY (response_id) REFERENCES survey_response(id),
    FOREIGN KEY (sub_question_key) REFERENCES sub_question(survey_id)
);

-- XM Directory Lite Users
CREATE TABLE survey (
    id text,
    owner_id text,
    auto_scoring_category text,
    brand_base_url text,
    brand_id text,
    bundle_short_name text,
    composition_type text,
    creator_id text,
    default_scoring_category text,
    division_id text,
    is_active boolean,
    last_accessed timestamp,
    last_activated timestamp,
    last_modified timestamp,
    project_category text,
    project_type text,
    registry_sha text,
    registry_version text,
    schema_version text,
    scoring_summary_after_questions boolean,
    scoring_summary_after_survey boolean,
    scoring_summary_category text,
    survey_name text,
    survey_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE ticket (
    id text,
    source_id text,
    survey_response_id text,
    closed_at timestamp,
    created_at timestamp,
    data jsonb,
    first_time_entered jsonb,
    first_time_left jsonb,
    follow_up_details jsonb,
    most_recent_time_entered jsonb,
    most_recent_time_left jsonb,
    "name" text,
    owner_name text,
    priority text,
    root_cause text,
    source_type text,
    "status" text,
    team_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (source_id) REFERENCES survey(id),
    FOREIGN KEY (survey_response_id) REFERENCES survey_response(id)
);

-- XM Directory Lite Users
CREATE TABLE survey_response (
    id text,
    survey_id text,
    distribution_channel text,
    duration_in_seconds text,
    end_date timestamp,
    external_reference text,
    finished text,
    ip_address text,
    location_latitude text,
    location_longitude text,
    participant_email text,
    participant_name text,
    progress text,
    recipient_email text,
    recipient_first_name text,
    recipient_last_name text,
    recorded_date timestamp,
    start_date timestamp,
    "status" text,
    user_language text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- XM Directory Lite Users
CREATE TABLE sub_question (
    "key" text,
    question_id text,
    survey_id text,
    choice_data_export_tag text,
    text text,
    PRIMARY KEY ("key", question_id, survey_id),
    FOREIGN KEY (question_id) REFERENCES question(survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- XM Directory Users
CREATE TABLE frequency_rule_target (
    target_id text,
    directory_id text,
    rule_id text,
    PRIMARY KEY (target_id, directory_id, rule_id),
    FOREIGN KEY (directory_id) REFERENCES directory(id),
    FOREIGN KEY (rule_id) REFERENCES frequency_rule(directory_id)
);

CREATE TABLE library (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

-- XM Directory Lite Users
CREATE TABLE group_quota_membership (
    quota_group_id text,
    quota_id text,
    PRIMARY KEY (quota_group_id, quota_id),
    FOREIGN KEY (quota_group_id) REFERENCES quota_group(survey_id),
    FOREIGN KEY (quota_id) REFERENCES quota(survey_id)
);

-- XM Directory Lite Users
CREATE TABLE survey_version (
    id text,
    survey_id text,
    user_id text,
    creation_date timestamp,
    description text,
    published boolean,
    version_number integer,
    was_published boolean,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE survey_version_publish_event (
    "date" timestamp,
    survey_id text,
    user_id text,
    version_id text,
    PRIMARY KEY ("date", survey_id, user_id, version_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (version_id) REFERENCES survey_version(survey_id)
);

-- XM Directory Lite Users
CREATE TABLE quota (
    id text,
    survey_id text,
    count integer,
    count_for_undo integer,
    logic_type text,
    "name" text,
    occurrences bigint,
    perform_action_on_user boolean,
    quota_action text,
    quota_realm text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE library_question (
    folder_name text,
    library_question_id text,
    library_id text,
    question_name text,
    PRIMARY KEY (folder_name, library_question_id, library_id),
    FOREIGN KEY (library_id) REFERENCES library(id)
);

-- XM Directory Lite Users
CREATE TABLE block (
    id text,
    survey_id text,
    block_locking text,
    block_visibility text,
    description text,
    randomize_questions text,
    "type" text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

-- Non-XM Directory Users
CREATE TABLE core_contact (
    id text,
    mailing_list_id text,
    email text,
    external_data_reference text,
    first_name text,
    language text,
    last_name text,
    unsubscribed boolean,
    PRIMARY KEY (id, mailing_list_id),
    FOREIGN KEY (mailing_list_id) REFERENCES core_mailing_list(id)
);

-- XM Directory Users
CREATE TABLE directory (
    id text,
    is_default boolean,
    "name" text,
    PRIMARY KEY (id)
);

-- XM Directory Lite Users
CREATE TABLE survey_embedded_data (
    import_id text,
    "key" text,
    response_id text,
    "value" text,
    PRIMARY KEY (import_id, "key", response_id),
    FOREIGN KEY (response_id) REFERENCES survey_response(id)
);

CREATE TABLE library_block (
    folder_name text,
    library_block_id text,
    library_id text,
    block_name text,
    PRIMARY KEY (folder_name, library_block_id, library_id),
    FOREIGN KEY (library_id) REFERENCES library(id)
);
