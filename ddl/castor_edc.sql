CREATE TABLE participant (
    id text,
    study_id text,
    created_by text,
    site_id text,
    updated_by text,
    archived text,
    archived_reason text,
    ccr_patient_id text,
    created_on_date text,
    created_on_timezone text,
    created_on_timezone_type text,
    deleted text,
    last_opened_step text,
    locked text,
    participant_status_id text,
    participant_status_name text,
    progress text,
    randomization_group text,
    randomization_group_name text,
    randomized_id text,
    randomized_on_date text,
    randomized_on_timezone text,
    randomized_on_timezone_type text,
    "status" text,
    updated_on_date text,
    updated_on_timezone text,
    updated_on_timezone_type text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (created_by) REFERENCES study_user(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (updated_by) REFERENCES study_user(id)
);

CREATE TABLE repeating_data_instance_data_point (
    field_id text,
    participant_id text,
    repeating_data_instance_id text,
    study_id text,
    field_value text,
    repeating_data_instance_name text,
    updated_on text,
    PRIMARY KEY (field_id, participant_id, repeating_data_instance_id, study_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (repeating_data_instance_id) REFERENCES repeating_data_instance(id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE institute_permission (
    institute_id text,
    study_user_id text,
    add text,
    decrypt text,
    "delete" text,
    edit text,
    email_addresses text,
    encrypts text,
    export text,
    lock text,
    query text,
    randomization_read text,
    randomization_write text,
    "role" text,
    sdv text,
    sign text,
    survey_send text,
    survey_view text,
    televisit text,
    "view" text,
    PRIMARY KEY (institute_id, study_user_id),
    FOREIGN KEY (institute_id) REFERENCES study_statistics_institute(institute_id),
    FOREIGN KEY (study_user_id) REFERENCES study_user(id)
);

CREATE TABLE study_user (
    id text,
    study_id text,
    department text,
    email_address text,
    full_name text,
    institute text,
    last_login text,
    manage_permissions_manage_encryption text,
    manage_permissions_manage_form text,
    manage_permissions_manage_records text,
    manage_permissions_manage_settings text,
    manage_permissions_manage_users text,
    name_first text,
    name_last text,
    name_middle text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE study (
    id text,
    created_by text,
    main_contact text,
    created_on text,
    domain text,
    duration text,
    expected_centers text,
    expected_records text,
    gcp_enabled text,
    live text,
    "name" text,
    premium_support_enabled text,
    randomization_enabled text,
    slug text,
    surveys_enabled text,
    trial_registry_id text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES study_user(id),
    FOREIGN KEY (main_contact) REFERENCES study_user(id)
);

CREATE TABLE "role" (
    "name" text,
    study_id text,
    description text,
    PRIMARY KEY ("name", study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE country (
    id text,
    country_cca_2 text,
    country_cca_3 text,
    country_name text,
    country_tld text,
    PRIMARY KEY (id)
);

CREATE TABLE field_dependency (
    id text,
    study_id text,
    parent_id text,
    child_id text,
    description text,
    field_dependency_type text,
    operator text,
    "value" text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (parent_id) REFERENCES field_dependency(id)
);

CREATE TABLE repeating_data (
    id text,
    study_id text,
    description text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE study_statistics_institute (
    institute_id text,
    study_statistics_study_id text,
    institute_name text,
    record_count text,
    PRIMARY KEY (institute_id, study_statistics_study_id),
    FOREIGN KEY (study_statistics_study_id) REFERENCES study_statistics(study_id)
);

CREATE TABLE study_statistics (
    study_id text,
    records_total_count text,
    PRIMARY KEY (study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE field_option (
    id text,
    field_option_group_id text,
    group_order text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, field_option_group_id),
    FOREIGN KEY (field_option_group_id) REFERENCES field_option_group(id)
);

CREATE TABLE field_option_group (
    id text,
    study_id text,
    description text,
    layout text,
    "name" text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE participant_progress_form (
    form_id text,
    participant_progress_participant_id text,
    participant_progress_study_id text,
    complete text,
    locked text,
    progress text,
    sdv text,
    signed text,
    PRIMARY KEY (form_id, participant_progress_participant_id, participant_progress_study_id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (participant_progress_participant_id) REFERENCES participant(id),
    FOREIGN KEY (participant_progress_study_id) REFERENCES study(id)
);

CREATE TABLE repeating_data_form (
    id text,
    study_id text,
    repeating_data_id text,
    repeating_data_form_description text,
    repeating_data_form_name text,
    repeating_data_form_number text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (repeating_data_id) REFERENCES repeating_data(id)
);

CREATE TABLE site (
    id text,
    study_id text,
    country_id text,
    abbreviation text,
    code text,
    date_format text,
    deleted text,
    "name" text,
    orders text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE survey_instance (
    id text,
    study_id text,
    field_id text,
    field_value text,
    participant_id text,
    survey_name text,
    updated_on text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (id) REFERENCES participant(id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE form (
    id text,
    study_id text,
    visit_id text,
    form_description text,
    form_name text,
    form_order text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (visit_id) REFERENCES visit(id)
);

CREATE TABLE survey_package_instance_survey_instance (
    id text,
    survey_package_instance_id text,
    survey_id text,
    progress text,
    progress_total_fields text,
    progress_total_fields_not_empty text,
    PRIMARY KEY (id, survey_package_instance_id),
    FOREIGN KEY (survey_package_instance_id) REFERENCES survey_package_instance(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey_package_instance (
    id text,
    study_id text,
    parent_id text,
    participant_id text,
    site_id text,
    survey_package_id text,
    all_fields_filled_on_date text,
    all_fields_filled_on_timezone text,
    all_fields_filled_on_timezone_type text,
    archived text,
    auto_lock_on_finish text,
    auto_send text,
    available_from_date text,
    available_from_timezone text,
    available_from_timezone_type text,
    created_by text,
    created_on_date text,
    created_on_timezone text,
    created_on_timezone_type text,
    expire_on_date text,
    expire_on_timezone text,
    expire_on_timezone_type text,
    finished_on_date text,
    finished_on_timezone text,
    finished_on_timezone_type text,
    first_opened_on_date text,
    first_opened_on_timezone text,
    first_opened_on_timezone_type text,
    invitation_content text,
    invitation_subject text,
    locked text,
    parent_type text,
    progress text,
    received_on_date text,
    received_on_timezone text,
    received_on_timezone_type text,
    sent_on_date text,
    sent_on_timezone text,
    sent_on_timezone_type text,
    site_name text,
    started_on_date text,
    started_on_timezone text,
    started_on_timezone_type text,
    survey_package_instance_id text,
    survey_package_name text,
    survey_reminders_send_ondate text,
    survey_reminders_send_ontimezone text,
    survey_reminders_send_ontimezone_type text,
    survey_remindersid text,
    survey_remindersmessage text,
    survey_reminderssubject text,
    survey_url_string text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (parent_id) REFERENCES survey_package_instance(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (survey_package_id) REFERENCES survey_package(id)
);

CREATE TABLE meta_data (
    id text,
    field_id text,
    parent_id text,
    _embedded_metadata_type_description text,
    _embedded_metadata_type_id text,
    _embedded_metadata_type_name text,
    description text,
    "value" text,
    PRIMARY KEY (id, field_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (parent_id) REFERENCES meta_data(id)
);

CREATE TABLE field_field_option_group (
    field_id text,
    id text,
    PRIMARY KEY (field_id, id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (id) REFERENCES field_option_group(id)
);

CREATE TABLE field_field_validation (
    field_id text,
    id text,
    PRIMARY KEY (field_id, id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (id) REFERENCES field_validation(id)
);

CREATE TABLE field (
    id text,
    study_id text,
    parent_id text,
    additional_config text,
    dependency_children jsonb,
    dependency_parents jsonb,
    exclude_on_data_export text,
    field_enforce_decimals text,
    field_hidden text,
    field_image text,
    field_info text,
    field_label text,
    field_length text,
    field_max text,
    field_max_label text,
    field_min text,
    field_min_label text,
    field_number text,
    field_required text,
    field_slider_step text,
    field_slider_step_value text,
    field_summary_template text,
    field_type text,
    field_units text,
    field_variable_name text,
    randomize_option_order text,
    report_id text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (parent_id) REFERENCES field(id)
);

CREATE TABLE survey_form (
    id text,
    study_id text,
    survey_id text,
    field_alignment text,
    form_numbering text,
    label_bold_if_required text,
    survey_form_description text,
    survey_form_name text,
    survey_form_number text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey_survey_form (
    id text,
    survey_id text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (id) REFERENCES survey_form(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    study_id text,
    description text,
    intro_text text,
    "name" text,
    outro_text text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE repeating_data_instance (
    id text,
    study_id text,
    created_by text,
    parent_id text,
    participant_id text,
    repeating_data_id text,
    archived text,
    created_on text,
    "name" text,
    parent_type text,
    repeating_data_name text,
    "status" text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (created_by) REFERENCES study_user(id),
    FOREIGN KEY (parent_id) REFERENCES repeating_data_instance(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (repeating_data_id) REFERENCES repeating_data(id)
);

CREATE TABLE study_data_entry (
    field_id text,
    participant_id text,
    study_id text,
    field_variable_name text,
    updated_on text,
    "value" text,
    PRIMARY KEY (field_id, participant_id, study_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE randomization (
    randomized_id text,
    participant_id text,
    study_id text,
    randomization_group text,
    randomization_group_name text,
    randomized_on_date text,
    randomized_on_timezone text,
    randomized_on_timezone_type text,
    PRIMARY KEY (randomized_id, participant_id, study_id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE visit (
    id text,
    study_id text,
    visit_description text,
    visit_duration text,
    visit_name text,
    visit_order text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE query_remark (
    id text,
    query_id text,
    created_by text,
    created_on_date text,
    created_on_timezone text,
    created_on_timezone_type text,
    description text,
    title text,
    PRIMARY KEY (id, query_id),
    FOREIGN KEY (query_id) REFERENCES query(id),
    FOREIGN KEY (created_by) REFERENCES study_user(id)
);

CREATE TABLE query (
    id text,
    study_id text,
    created_by text,
    participant_id text,
    updated_by text,
    created_on_date text,
    created_on_timezone text,
    created_on_timezone_type text,
    field_id text,
    first_query_remark text,
    record_id text,
    "status" text,
    updated_on_date text,
    updated_on_timezone text,
    updated_on_timezone_type text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (created_by) REFERENCES study_user(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (updated_by) REFERENCES study_user(id)
);

CREATE TABLE survey_package_survey (
    id text,
    survey_package_id text,
    PRIMARY KEY (id, survey_package_id),
    FOREIGN KEY (id) REFERENCES survey(id),
    FOREIGN KEY (survey_package_id) REFERENCES survey_package(id)
);

CREATE TABLE survey_package (
    id text,
    study_id text,
    allow_open_survey_link text,
    allow_step_navigation text,
    as_needed text,
    auto_lock_on_finish text,
    auto_send text,
    default_invitation text,
    default_invitation_subject text,
    description text,
    expire_after_hours text,
    field_pagination text,
    finish_url text,
    intro_text text,
    is_mobile text,
    is_repeatable text,
    is_resumable text,
    is_training text,
    "name" text,
    outro_text text,
    sender_email text,
    sender_name text,
    show_step_navigator text,
    survey_package_id text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id)
);

CREATE TABLE field_validation (
    id text,
    study_id text,
    field_id text,
    operator text,
    text text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (field_id) REFERENCES field(id)
);

CREATE TABLE verification (
    id text,
    study_id text,
    parent_id text,
    changed_field text,
    dropped_by text,
    dropped_on_date text,
    dropped_on_timezone text,
    dropped_on_timezone_type text,
    entity_id text,
    entity_type text,
    record_id text,
    "status" text,
    verification_type_id text,
    verification_type_is_sdv text,
    verification_type_name text,
    verified_by text,
    verified_on_date text,
    verified_on_timezone text,
    verified_on_timezone_type text,
    PRIMARY KEY (id, study_id),
    FOREIGN KEY (study_id) REFERENCES study(id),
    FOREIGN KEY (parent_id) REFERENCES verification(id)
);
