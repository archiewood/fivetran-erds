CREATE TABLE legal_hold (
    id text,
    identifier_id text,
    created_at timestamp,
    request_count text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (identifier_id) REFERENCES identifier(id)
);

CREATE TABLE data_flow_datapoint (
    consent_manager_id text,
    data_flow_id text,
    "index" text,
    description text,
    employee_description text,
    "name" text,
    reference text,
    subjective_path text,
    title text,
    PRIMARY KEY (consent_manager_id, data_flow_id, "index")
);

CREATE TABLE data_flow_user (
    consent_manager_id text,
    data_flow_id text,
    user_id text,
    PRIMARY KEY (consent_manager_id, data_flow_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE data_flow (
    id text,
    consent_manager_id text,
    created_at timestamp,
    description text,
    frequency text,
    integration_name text,
    is_junk text,
    last_discovered_at text,
    logo text,
    logo_square text,
    service_description text,
    service_id text,
    "source" text,
    "status" text,
    table_name text,
    title text,
    "type" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id, consent_manager_id),
    FOREIGN KEY (consent_manager_id) REFERENCES consent_manager(id)
);

CREATE TABLE data_flow_encounter (
    consent_manager_id text,
    data_flow_id text,
    "index" text,
    encounter text,
    PRIMARY KEY (consent_manager_id, data_flow_id, "index")
);

CREATE TABLE data_flow_action (
    consent_manager_id text,
    data_flow_id text,
    "index" text,
    "action" text,
    PRIMARY KEY (consent_manager_id, data_flow_id, "index")
);

CREATE TABLE data_flow_team (
    consent_manager_id text,
    data_flow_id text,
    team_id text,
    PRIMARY KEY (consent_manager_id, data_flow_id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE data_flow_attribute_value (
    consent_manager_id text,
    data_flow_id text,
    attribute_value_id text,
    PRIMARY KEY (consent_manager_id, data_flow_id, attribute_value_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id)
);

CREATE TABLE data_flow_purpose (
    consent_manager_id text,
    data_flow_id text,
    purpose_id text,
    PRIMARY KEY (consent_manager_id, data_flow_id, purpose_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id)
);

CREATE TABLE data_flow_service_recipient (
    consent_manager_id text,
    data_flow_id text,
    id text,
    title text,
    PRIMARY KEY (consent_manager_id, data_flow_id, id)
);

CREATE TABLE activity (
    id text,
    communication_user_id text,
    data_point_id text,
    data_silo_id text,
    request_id text,
    user_id text,
    code text,
    communication_id text,
    communication_is_attachment_can_toggle_is_read text,
    communication_is_attachment_filenames text,
    communication_is_avatar_url text,
    communication_is_bcc text,
    communication_is_bounced text,
    communication_is_created_at text,
    communication_is_encrypted text,
    communication_is_from text,
    communication_is_read text,
    communication_is_template text,
    communication_is_to text,
    communication_request_data_silo_id text,
    communication_subject text,
    communication_type text,
    created_at text,
    error text,
    profile_id text,
    profile_type text,
    request_enricher_id text,
    request_file_id text,
    request_identifier_id text,
    request_identifier_request_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (communication_user_id) REFERENCES users(id),
    FOREIGN KEY (data_point_id) REFERENCES datapoint(id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE vendor_business (
    id text,
    vendor_id text,
    address text,
    created_at text,
    description text,
    headquarter_country text,
    headquarter_sub_division text,
    officer_email text,
    officer_name text,
    title text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_data_silo (
    data_silo_id text,
    vendor_id text,
    PRIMARY KEY (data_silo_id, vendor_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_data_subcategory (
    data_subcategory_id text,
    vendor_id text,
    PRIMARY KEY (data_subcategory_id, vendor_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_process_purpose (
    process_purpose_id text,
    vendor_id text,
    PRIMARY KEY (process_purpose_id, vendor_id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_attribute_value (
    attribute_value_id text,
    vendor_id text,
    PRIMARY KEY (attribute_value_id, vendor_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_user (
    user_id text,
    vendor_id text,
    PRIMARY KEY (user_id, vendor_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_team (
    team_id text,
    vendor_id text,
    PRIMARY KEY (team_id, vendor_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_catalog_recipient (
    id text,
    vendor_id text,
    title text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    address text,
    agreement_link text,
    agreement_status text,
    controllership jsonb,
    country text,
    created_at timestamp,
    description text,
    email text,
    "name" text,
    phone text,
    sub_division text,
    title text,
    website_url text,
    PRIMARY KEY (id)
);

CREATE TABLE privacy_center_locale (
    "index" text,
    privacy_center_id text,
    locale text,
    PRIMARY KEY ("index", privacy_center_id),
    FOREIGN KEY (privacy_center_id) REFERENCES privacy_center(id)
);

CREATE TABLE privacy_center_page (
    "index" text,
    privacy_center_id text,
    "type" text,
    PRIMARY KEY ("index", privacy_center_id),
    FOREIGN KEY (privacy_center_id) REFERENCES privacy_center(id)
);

CREATE TABLE privacy_center_consent_manager (
    consent_manager_id text,
    privacy_center_id text,
    PRIMARY KEY (consent_manager_id, privacy_center_id),
    FOREIGN KEY (consent_manager_id) REFERENCES consent_manager(id),
    FOREIGN KEY (privacy_center_id) REFERENCES privacy_center(id)
);

CREATE TABLE privacy_center (
    id text,
    organization_id text,
    custom_subdomain text,
    default_locale text,
    email_prefix text,
    hosted_domain text,
    is_disabled text,
    reply_to_email text,
    show_consent_manager text,
    show_cookie text,
    show_data_flow text,
    show_policie text,
    show_privacy_request_button text,
    show_tracking_technology text,
    support_email text,
    theme_str text,
    transform_access_report text,
    "type" text,
    url text,
    use_custom_email_domain text,
    use_reply_email_address text,
    -- home_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE team_user (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE link_team (
    link_team_id text,
    team_id text,
    PRIMARY KEY (link_team_id, team_id),
    FOREIGN KEY (link_team_id) REFERENCES team(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_data_silo (
    data_silo_id text,
    team_id text,
    PRIMARY KEY (data_silo_id, team_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_scope (
    id text,
    team_id text,
    color text,
    description text,
    "name" text,
    title text,
    "type" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    description text,
    "name" text,
    parent_team_id text,
    sso_department text,
    sso_group text,
    sso_title text,
    PRIMARY KEY (id)
);

CREATE TABLE sombra_ip_address (
    "index" text,
    sombra_id text,
    ip_address text,
    PRIMARY KEY ("index", sombra_id),
    FOREIGN KEY (sombra_id) REFERENCES sombra(id)
);

CREATE TABLE sombra_data_silo (
    data_silo_id text,
    sombra_id text,
    PRIMARY KEY (data_silo_id, sombra_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (sombra_id) REFERENCES sombra(id)
);

CREATE TABLE data_subject_authentication_method (
    "index" text,
    sombra_id text,
    method text,
    PRIMARY KEY ("index", sombra_id),
    FOREIGN KEY (sombra_id) REFERENCES sombra(id)
);

CREATE TABLE employee_authentication_method (
    "index" text,
    sombra_id text,
    method text,
    PRIMARY KEY ("index", sombra_id),
    FOREIGN KEY (sombra_id) REFERENCES sombra(id)
);

CREATE TABLE sombra (
    id text,
    audience text,
    changelog jsonb,
    customer_url text,
    hosted_method text,
    is_primary_sombra text,
    most_recent_sombra text,
    public_key_ecdh text,
    tenant_parameters_allow_employee_access text,
    tenant_parameters_organization_uri text,
    url text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE airgap_bundle (
    _fivetran_id text,
    af_zz text,
    ar_ae text,
    bg_bg text,
    core text,
    core_config text,
    created_at text,
    cs_cz text,
    da_dk text,
    de_de text,
    el_gr text,
    en text,
    es_419 text,
    es_es text,
    explorer text,
    fi_fi text,
    fr_fr text,
    he_il text,
    hi_in text,
    hr_hr text,
    hu_hu text,
    id_id text,
    it_it text,
    ja_jp text,
    ko_kr text,
    lt_lt text,
    meta_data text,
    mr_in text,
    ms_my text,
    nb_ni text,
    nl_nl text,
    pl_pl text,
    pt_br text,
    ro_ro text,
    ru_ru text,
    sr_latn_rs text,
    style_sheet text,
    sv_se text,
    sync text,
    ta_in text,
    tcf_en text,
    tcf_style_sheet text,
    tcf_ui text,
    th_th text,
    tr_tr text,
    ui text,
    uk_ua text,
    user_script text,
    vi_vn text,
    xdi text,
    zh_cn text,
    zh_hk text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE assessment_form_comment (
    id text,
    author_id text,
    assessment_event_id text,
    content text,
    created_at text,
    form_status text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE assessment_question_select_option (
    id text,
    additional_context text,
    PRIMARY KEY (id)
);

CREATE TABLE user_team (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_data_silo (
    data_silo_id text,
    user_id text,
    PRIMARY KEY (data_silo_id, user_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_scope (
    id text,
    user_id text,
    color text,
    description text,
    "name" text,
    title text,
    "type" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_at timestamp,
    email text,
    is_admin text,
    is_invited text,
    login_method text,
    "name" text,
    onboarded text,
    profile_picture text,
    reveal_sombra_secret text,
    PRIMARY KEY (id)
);

CREATE TABLE cookie_team (
    consent_manager_id text,
    cookie_id text,
    team_id text,
    PRIMARY KEY (consent_manager_id, cookie_id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE cookie_datapoint (
    consent_manager_id text,
    cookie_id text,
    "index" text,
    description text,
    employee_description text,
    "name" text,
    reference text,
    subjective_path text,
    title text,
    PRIMARY KEY (consent_manager_id, cookie_id, "index")
);

CREATE TABLE cookie_domain (
    consent_manager_id text,
    cookie_id text,
    id text,
    domain text,
    last_discovered_at text,
    PRIMARY KEY (consent_manager_id, cookie_id, id)
);

CREATE TABLE cookie_encounter (
    consent_manager_id text,
    cookie_id text,
    "index" text,
    encounter text,
    PRIMARY KEY (consent_manager_id, cookie_id, "index")
);

CREATE TABLE cookie (
    id text,
    consent_manager_id text,
    created_at timestamp,
    description text,
    frequency text,
    integration_name text,
    is_junk text,
    is_regex text,
    last_discovered_at text,
    logo text,
    logo_square text,
    "name" text,
    service_description text,
    service_id text,
    "source" text,
    "status" text,
    table_name text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id, consent_manager_id),
    FOREIGN KEY (consent_manager_id) REFERENCES consent_manager(id)
);

CREATE TABLE cookie_action (
    consent_manager_id text,
    cookie_id text,
    "index" text,
    "action" text,
    PRIMARY KEY (consent_manager_id, cookie_id, "index")
);

CREATE TABLE cookie_attribute_value (
    consent_manager_id text,
    cookie_id text,
    attribute_value_id text,
    PRIMARY KEY (consent_manager_id, cookie_id, attribute_value_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id)
);

CREATE TABLE cookie_user (
    consent_manager_id text,
    cookie_id text,
    user_id text,
    PRIMARY KEY (consent_manager_id, cookie_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cookie_service_recipient (
    consent_manager_id text,
    cookie_id text,
    id text,
    title text,
    PRIMARY KEY (consent_manager_id, cookie_id, id)
);

CREATE TABLE cookie_purpose (
    consent_manager_id text,
    cookie_id text,
    purpose_id text,
    PRIMARY KEY (consent_manager_id, cookie_id, purpose_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id)
);

CREATE TABLE assessment_question_answer_option (
    id text,
    assessment_question_id text,
    "index" text,
    is_user_created text,
    presigned_url text,
    "value" text,
    PRIMARY KEY (id, assessment_question_id),
    FOREIGN KEY (assessment_question_id) REFERENCES assessment_question(id)
);

CREATE TABLE assessment_question_selected_answer (
    id text,
    assessment_question_id text,
    additional_context text,
    "index" text,
    is_user_created text,
    presigned_url text,
    "value" text,
    PRIMARY KEY (id, assessment_question_id),
    FOREIGN KEY (assessment_question_id) REFERENCES assessment_question(id)
);

CREATE TABLE assessment_question_comment (
    id text,
    assessment_question_id text,
    author_id text,
    content text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id, assessment_question_id),
    FOREIGN KEY (assessment_question_id) REFERENCES assessment_question(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE assessment_question_previous_submission_answer (
    id text,
    assessment_question_id text,
    assessment_question_previous_submission_id text,
    additional_context text,
    "index" text,
    is_user_created text,
    presigned_url text,
    "value" text,
    PRIMARY KEY (id, assessment_question_id, assessment_question_previous_submission_id),
    FOREIGN KEY (assessment_question_id) REFERENCES assessment_question_previous_submission(assessment_question_id),
    FOREIGN KEY (assessment_question_previous_submission_id) REFERENCES assessment_question_previous_submission(id)
);

CREATE TABLE assessment_question_previous_submission (
    id text,
    assessment_question_id text,
    updated_at text,
    PRIMARY KEY (id, assessment_question_id),
    FOREIGN KEY (assessment_question_id) REFERENCES assessment_question(id)
);

CREATE TABLE assessment_question (
    id text,
    attribute_key_id text,
    allow_select_other text,
    allowed_mime_types text,
    description text,
    display_logic text,
    external_respondent_email text,
    "index" text,
    is_required text,
    placeholder text,
    presigned_risk_file_url text,
    reference_id text,
    require_risk_evaluation text,
    require_risk_matrix_evaluation text,
    respondent_id text,
    reviewer_risk_level_id text,
    risk_category jsonb,
    risk_framework_id text,
    risk_level_from_risk_matrix_color text,
    risk_level_from_risk_matrix_id text,
    risk_level_from_risk_matrix_title text,
    risk_level_id text,
    risk_logic text,
    sub_type text,
    sync_column text,
    sync_model text,
    sync_override text,
    sync_row_ids jsonb,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_key_id) REFERENCES attribute_key(id)
);

CREATE TABLE api_key_data_silo (
    api_key_id text,
    data_silo_id text,
    PRIMARY KEY (api_key_id, data_silo_id),
    FOREIGN KEY (api_key_id) REFERENCES api_key(id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id)
);

CREATE TABLE api_key_scope (
    id text,
    api_key_id text,
    color text,
    description text,
    "name" text,
    title text,
    "type" text,
    PRIMARY KEY (id, api_key_id),
    FOREIGN KEY (api_key_id) REFERENCES api_key(id)
);

CREATE TABLE api_key (
    id text,
    user_id text,
    age text,
    created_at timestamp,
    last_used_at text,
    preview text,
    "status" text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE assessment_section_comment (
    id text,
    author_id text,
    assessment_section_id text,
    content text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE action_integration (
    id text,
    action_id text,
    description text,
    link text,
    logo text,
    title text,
    "type" text,
    PRIMARY KEY (id, action_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id)
);

CREATE TABLE action_form (
    id text,
    action_id text,
    subject_id text,
    auto_complete text,
    disabled text,
    format text,
    info text,
    initial_value text,
    is_plain_text text,
    is_required text,
    min_length text,
    mode text,
    multiline text,
    "name" text,
    "option" text,
    parse_new_line text,
    send_unencrypted text,
    snippet text,
    "type" text,
    validator text,
    "value" text,
    -- label_* (dynamic column),
    -- placeholder_* (dynamic column),
    PRIMARY KEY (id, action_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE action_data_silo (
    action_id text,
    data_silo_id text,
    PRIMARY KEY (action_id, data_silo_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id)
);

CREATE TABLE action_user (
    action_id text,
    user_id text,
    PRIMARY KEY (action_id, user_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE action_step (
    "index" text,
    action_id text,
    description text,
    icon text,
    id text,
    "status" text,
    "time" text,
    title text,
    PRIMARY KEY ("index", action_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id)
);

CREATE TABLE "action" (
    id text,
    admin_title text,
    allow_post_compile_choice text,
    can_resolve text,
    datapoint_count text,
    delay_preview_action text,
    delay_time text,
    download_availability_duration text,
    icon text,
    integration_count text,
    open_request_count text,
    post_compile_status text,
    region jsonb,
    region_detection_method text,
    requires_review text,
    requires_secondary_review text,
    send_receipt_email text,
    skip_downloadable_step text,
    skip_secondary_if_no_file text,
    successful_request_count text,
    "type" text,
    waiting_period text,
    -- description_* (dynamic column),
    -- notfound_template_* (dynamic column),
    -- receipt_template_* (dynamic column),
    -- secondary_* (dynamic column),
    -- secondary_template_* (dynamic column),
    -- success_template_* (dynamic column),
    -- title_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE identifier_subject (
    identifier_id text,
    subject_id text,
    PRIMARY KEY (identifier_id, subject_id),
    FOREIGN KEY (identifier_id) REFERENCES identifier(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE identifier_data_silo (
    data_silo_id text,
    identifier_id text,
    PRIMARY KEY (data_silo_id, identifier_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (identifier_id) REFERENCES identifier(id)
);

CREATE TABLE identifier (
    id text,
    can_resolve text,
    is_communication_model text,
    is_required text,
    logo text,
    "name" text,
    place_holder text,
    privacy_center_visibility jsonb,
    regex text,
    select_option jsonb,
    "type" text,
    -- display_description_* (dynamic column),
    -- display_title_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE enricher_dependent (
    id text,
    enricher_id text,
    PRIMARY KEY (id, enricher_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id)
);

CREATE TABLE enricher_header (
    "index" text,
    enricher_id text,
    is_secret text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", enricher_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id)
);

CREATE TABLE enricher_user (
    enricher_id text,
    user_id text,
    PRIMARY KEY (enricher_id, user_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE enricher_identifier (
    enricher_id text,
    identifier_id text,
    PRIMARY KEY (enricher_id, identifier_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id),
    FOREIGN KEY (identifier_id) REFERENCES identifier(id)
);

CREATE TABLE enricher_data_silo (
    data_silo_id text,
    enricher_id text,
    PRIMARY KEY (data_silo_id, enricher_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id)
);

CREATE TABLE enricher_subject (
    enricher_id text,
    subject_id text,
    PRIMARY KEY (enricher_id, subject_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE enricher_action (
    "index" text,
    enricher_id text,
    "action" text,
    PRIMARY KEY ("index", enricher_id),
    FOREIGN KEY (enricher_id) REFERENCES enricher(id)
);

CREATE TABLE enricher (
    id text,
    identifier_id text,
    description text,
    error_count text,
    expiration_duration text,
    logo text,
    looker_query_title text,
    phone_numbers jsonb,
    region_list jsonb,
    test_regex text,
    title text,
    transition_status text,
    "type" text,
    url text,
    -- continuation_template_* (dynamic column),
    -- template_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (identifier_id) REFERENCES identifier(id)
);

CREATE TABLE data_report (
    id text,
    creator_id text,
    filter text,
    hidden_column text,
    tables text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE datapoint_integration (
    id text,
    datapoint_id text,
    query text,
    request_type text,
    suggested_query text,
    PRIMARY KEY (id, datapoint_id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id)
);

CREATE TABLE datapoint_reference (
    "index" text,
    datapoint_id text,
    reference text,
    PRIMARY KEY ("index", datapoint_id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id)
);

CREATE TABLE datapoint_data_subcategory (
    data_subcategory_id text,
    datapoint_id text,
    PRIMARY KEY (data_subcategory_id, datapoint_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id)
);

CREATE TABLE datapoint_action_setting (
    "index" text,
    datapoint_id text,
    active text,
    allowed text,
    "type" text,
    PRIMARY KEY ("index", datapoint_id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id)
);

CREATE TABLE datapoint_team (
    datapoint_id text,
    team_id text,
    PRIMARY KEY (datapoint_id, team_id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE datapoint_user (
    datapoint_id text,
    user_id text,
    PRIMARY KEY (datapoint_id, user_id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE datapoint (
    id text,
    data_silo_id text,
    access_request_visibility_count text,
    can_delete text,
    collection_id text,
    collection_logo text,
    collection_static_type text,
    collection_visual_id text,
    confirmed_personal_data_count text,
    data_count_high text,
    data_count_low text,
    data_count_medium text,
    employee_description text,
    erasure_redaction_method text,
    erasure_request_redaction_count text,
    export_mode text,
    "name" text,
    "path" jsonb,
    scanned_description text,
    subjective_path text,
    -- description_* (dynamic column),
    -- title_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id)
);

CREATE TABLE organization_sombra (
    organization_id text,
    sombra_id text,
    PRIMARY KEY (organization_id, sombra_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (sombra_id) REFERENCES sombra(id)
);

CREATE TABLE organization (
    id text,
    parent_id text,
    created_at text,
    default_email_alias text,
    deployed_privacy_center_url text,
    domain text,
    favicon_alt jsonb,
    favicon_id text,
    favicon_key text,
    favicon_mime_type text,
    favicon_size text,
    favicon_src text,
    hosted_domain text,
    logo_alt jsonb,
    logo_id text,
    logo_key text,
    logo_mime_type text,
    logo_size text,
    logo_src text,
    "name" text,
    tier text,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES organization(id)
);

CREATE TABLE subject_action (
    action_id text,
    subject_id text,
    PRIMARY KEY (action_id, subject_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE subject_team (
    subject_id text,
    team_id text,
    PRIMARY KEY (subject_id, team_id),
    FOREIGN KEY (subject_id) REFERENCES subject(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE subject_user (
    subject_id text,
    user_id text,
    PRIMARY KEY (subject_id, user_id),
    FOREIGN KEY (subject_id) REFERENCES subject(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE subject (
    id text,
    active text,
    fulfill_request_count text,
    icon text,
    login_instruction_default_message text,
    login_instruction_description text,
    login_instruction_id text,
    open_request_count text,
    response_type text,
    silent_mode text,
    subject_class text,
    title_default_message text,
    title_description text,
    title_id text,
    "type" text,
    -- disable_instruction_* (dynamic column),
    -- redirect_url_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE experience_region (
    "index" text,
    experience_id text,
    country text,
    country_sub_division text,
    PRIMARY KEY ("index", experience_id),
    FOREIGN KEY (experience_id) REFERENCES experience(id)
);

CREATE TABLE browser_language (
    "index" text,
    experience_id text,
    languages text,
    PRIMARY KEY ("index", experience_id),
    FOREIGN KEY (experience_id) REFERENCES experience(id)
);

CREATE TABLE experience_opt_out_purpose (
    experience_id text,
    purpose_id text,
    PRIMARY KEY (experience_id, purpose_id),
    FOREIGN KEY (experience_id) REFERENCES experience(id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id)
);

CREATE TABLE experience_purpose (
    experience_id text,
    purpose_id text,
    PRIMARY KEY (experience_id, purpose_id),
    FOREIGN KEY (experience_id) REFERENCES experience(id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id)
);

CREATE TABLE experience (
    id text,
    browser_time_zones jsonb,
    display_name text,
    display_priority text,
    "name" text,
    operator text,
    view_state text,
    PRIMARY KEY (id)
);

CREATE TABLE assessment_form_assignee (
    assessment_form_id text,
    id text,
    PRIMARY KEY (assessment_form_id, id),
    FOREIGN KEY (assessment_form_id) REFERENCES assessment_form(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE assessment_form_external_assignee (
    id text,
    assessment_form_id text,
    email text,
    is_form_creator text,
    is_form_creator_assigned text,
    PRIMARY KEY (id, assessment_form_id),
    FOREIGN KEY (assessment_form_id) REFERENCES assessment_form(id)
);

CREATE TABLE assessment_form_reviewer (
    assessment_form_id text,
    id text,
    PRIMARY KEY (assessment_form_id, id),
    FOREIGN KEY (assessment_form_id) REFERENCES assessment_form(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE assessment_form_section_question (
    assessment_form_id text,
    assessment_form_section_id text,
    id text,
    PRIMARY KEY (assessment_form_id, assessment_form_section_id, id),
    FOREIGN KEY (assessment_form_id) REFERENCES assessment_form_section(assessment_form_id),
    FOREIGN KEY (assessment_form_section_id) REFERENCES assessment_form_section(id),
    FOREIGN KEY (id) REFERENCES assessment_question(id)
);

CREATE TABLE assessment_form_section (
    id text,
    assessment_form_id text,
    "index" text,
    is_reviewed text,
    "status" text,
    title text,
    PRIMARY KEY (id, assessment_form_id),
    FOREIGN KEY (assessment_form_id) REFERENCES assessment_form(id)
);

CREATE TABLE assessment_form_attribute_value (
    assessment_form_id text,
    id text,
    PRIMARY KEY (assessment_form_id, id),
    FOREIGN KEY (assessment_form_id) REFERENCES assessment_form(id),
    FOREIGN KEY (id) REFERENCES attribute_value(id)
);

CREATE TABLE assessment_form (
    id text,
    assessment_group_id text,
    creator_id text,
    last_editor_id text,
    approved_at text,
    assigned_at text,
    created_at text,
    description text,
    due_date text,
    is_archived text,
    is_externally_created text,
    is_locked text,
    latest_event_id text,
    latest_event_status text,
    latest_event_updated_at text,
    rejected_at text,
    resource jsonb,
    retention_schedule_id text,
    "status" text,
    submitted_at text,
    synced_row jsonb,
    title text,
    title_is_internal text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assessment_group_id) REFERENCES assessment_group(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (last_editor_id) REFERENCES users(id)
);

CREATE TABLE data_sub_attribute_value (
    attribute_value_id text,
    data_subcategory_id text,
    PRIMARY KEY (attribute_value_id, data_subcategory_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id)
);

CREATE TABLE data_subcategory_team (
    data_subcategory_id text,
    team_id text,
    PRIMARY KEY (data_subcategory_id, team_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE data_subcategory_user (
    data_subcategory_id text,
    user_id text,
    PRIMARY KEY (data_subcategory_id, user_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE data_sub_retention_schedule (
    schedule text,
    data_subcategory_id text,
    PRIMARY KEY (schedule, data_subcategory_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id)
);

CREATE TABLE data_sub_catalog_recipient (
    id text,
    data_subcategory_id text,
    title text,
    PRIMARY KEY (id, data_subcategory_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id)
);

CREATE TABLE data_subcategory (
    id text,
    category text,
    datapoint_count text,
    description text,
    is_default text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE data_silo_discover (
    id text,
    data_silo_id text,
    connection_state text,
    deleted_at text,
    description text,
    external_id text,
    is_live text,
    last_connected_at text,
    last_enabled_at text,
    plugin_id text,
    title text,
    "type" text,
    url text,
    PRIMARY KEY (id, data_silo_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id)
);

CREATE TABLE data_silo_header (
    "index" text,
    data_silo_id text,
    is_secret text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", data_silo_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id)
);

CREATE TABLE data_silo_user (
    data_silo_id text,
    user_id text,
    PRIMARY KEY (data_silo_id, user_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE data_silo_team (
    data_silo_id text,
    team_id text,
    PRIMARY KEY (data_silo_id, team_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE data_silo_subject (
    data_silo_id text,
    subject_id text,
    PRIMARY KEY (data_silo_id, subject_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE data_silo_block_subject (
    data_silo_id text,
    subject_id text,
    PRIMARY KEY (data_silo_id, subject_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE data_silo_attribute_value (
    attribute_value_id text,
    data_silo_id text,
    PRIMARY KEY (attribute_value_id, data_silo_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id)
);

CREATE TABLE data_silo_identifier (
    data_silo_id text,
    identifier_id text,
    PRIMARY KEY (data_silo_id, identifier_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (identifier_id) REFERENCES identifier(id)
);

CREATE TABLE data_silo_data_subcategory (
    data_silo_id text,
    data_subcategory_id text,
    PRIMARY KEY (data_silo_id, data_subcategory_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id)
);

CREATE TABLE data_silo_process_purpose (
    data_silo_id text,
    process_purpose_id text,
    PRIMARY KEY (data_silo_id, process_purpose_id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id)
);

CREATE TABLE data_silo (
    id text,
    catalog_id text,
    connection_state text,
    contact_email text,
    contact_name text,
    controllership jsonb,
    country text,
    country_sub_division text,
    data_process_agreement_link text,
    data_process_agreement_status text,
    data_retention_note text,
    default_access_request_visibility text,
    deleted_at timestamp,
    deprecation_state text,
    description text,
    email_completion_link_type text,
    email_include_identifiers_attachment text,
    email_send_frequency text,
    email_send_type text,
    error_count text,
    external_id text,
    has_email_enabled text,
    has_personal_data text,
    is_live text,
    last_connected_at text,
    last_enabled_at text,
    link text,
    manual_work_retry_frequency text,
    notes text,
    notify_email_address text,
    notify_webhook_url text,
    plugin_id text,
    receiver_data_silos jsonb,
    recommended_for_consent text,
    recommended_for_privacy text,
    silo_discover jsonb,
    sub_datapoint_count text,
    subdomain text,
    title text,
    "type" text,
    url text,
    vendor text,
    website_url text,
    -- cookie_count_* (dynamic column),
    -- data_flow_count_* (dynamic column),
    -- prompt_email_template_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (catalog_id) REFERENCES cookie(id)
);

CREATE TABLE attribute_key (
    id text,
    assessment_template_id text,
    description text,
    is_custom text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE audit_event_user (
    audit_event_id text,
    user_id text,
    PRIMARY KEY (audit_event_id, user_id),
    FOREIGN KEY (audit_event_id) REFERENCES audit_event(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE audit_event (
    id text,
    data_silo_id text,
    data_subcategory_id text,
    process_purpose_id text,
    sub_datapoint_id text,
    action_item_id text,
    additional_context text,
    after_state text,
    before_state text,
    code text,
    created_at text,
    transaction_uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id),
    FOREIGN KEY (sub_datapoint_id) REFERENCES sub_datapoint(id)
);

CREATE TABLE request_team (
    request_id text,
    team_id text,
    PRIMARY KEY (request_id, team_id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE request_user (
    request_id text,
    user_id text,
    PRIMARY KEY (request_id, user_id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE request_attribute_value (
    attribute_value_id text,
    request_id text,
    PRIMARY KEY (attribute_value_id, request_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request_report (
    id text,
    request_id text,
    subject text,
    template text,
    title text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request_step (
    "index" text,
    request_id text,
    description text,
    icon text,
    id text,
    "status" text,
    "time" text,
    title text,
    PRIMARY KEY ("index", request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request (
    id text,
    action_id text,
    open_child_request_id text,
    parent_request_id text,
    subject_id text,
    active_type text,
    bounced text,
    can_download text,
    can_revoke text,
    can_view_by_data_subject text,
    completion_duration text,
    core_identifier text,
    country text,
    country_sub_division text,
    created_at timestamp,
    current_step text,
    data_silo_connection_status text,
    days_remaining text,
    details text,
    email text,
    is_active text,
    is_active_data_subject text,
    is_archived text,
    is_closed text,
    is_context_expired text,
    is_opened text,
    is_silent text,
    is_test text,
    link text,
    locale text,
    origin text,
    overdue_percentage text,
    overdue_time text,
    post_compile_status text,
    reply_to_email_addresses jsonb,
    report_opened_time text,
    secondary_report_send_time text,
    secondary_start_time text,
    "status" text,
    step_status text,
    subject_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (open_child_request_id) REFERENCES request(id),
    FOREIGN KEY (parent_request_id) REFERENCES request(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE opt_out_signal (
    signal text,
    purpose_id text,
    PRIMARY KEY (signal, purpose_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id)
);

CREATE TABLE purpose (
    id text,
    configurable text,
    default_consent text,
    description text,
    essential text,
    "name" text,
    show_consent_manager text,
    tracking_type text,
    PRIMARY KEY (id)
);

CREATE TABLE assessment_group_reviewer (
    assessment_group_id text,
    id text,
    PRIMARY KEY (assessment_group_id, id),
    FOREIGN KEY (assessment_group_id) REFERENCES assessment_group(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE assessment_group_attribute_value (
    assessment_group_id text,
    id text,
    PRIMARY KEY (assessment_group_id, id),
    FOREIGN KEY (assessment_group_id) REFERENCES assessment_group(id),
    FOREIGN KEY (id) REFERENCES attribute_value(id)
);

CREATE TABLE assessment_group (
    id text,
    assessment_form_template_id text,
    creator_id text,
    last_editor_id text,
    created_at text,
    description text,
    due_date text,
    external_email_domain jsonb,
    is_archived text,
    share_link text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (assessment_form_template_id) REFERENCES assessment_form_template(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (last_editor_id) REFERENCES users(id)
);

CREATE TABLE consent_manager_domain (
    domain text,
    consent_manager_id text,
    PRIMARY KEY (domain, consent_manager_id),
    FOREIGN KEY (consent_manager_id) REFERENCES consent_manager(id)
);

CREATE TABLE consent_manager (
    id text,
    bundle_url text,
    can_update_version text,
    configuration_backend_sync text,
    configuration_backend_sync_endpoint text,
    configuration_consent_precedence text,
    configuration_csp text,
    configuration_partitions text,
    configuration_signed_iab_agreement text,
    configuration_strategy text,
    configuration_sync_endpoint text,
    configuration_sync_group text,
    configuration_telemetry_partitioning text,
    configuration_unknown_cookie_policy text,
    configuration_unknown_request_policy text,
    configuration_use_default_tcf_settings text,
    configuration_usp_api text,
    deploy_error text,
    is_transcend_hosted text,
    last_deployed_at text,
    "name" text,
    offs text,
    onboarding_status text,
    partition_id text,
    partition_name text,
    partitions text,
    "state" text,
    tcf_ui_bundle_url text,
    test_bundle_url text,
    use_default_tcf_setting text,
    use_iab_framework text,
    use_modules text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE assessment_form_template_section_question (
    id text,
    assessment_form_template_id text,
    assessment_form_template_section_id text,
    PRIMARY KEY (id, assessment_form_template_id, assessment_form_template_section_id),
    FOREIGN KEY (assessment_form_template_id) REFERENCES assessment_form_template_section(assessment_form_template_id),
    FOREIGN KEY (assessment_form_template_section_id) REFERENCES assessment_form_template_section(id)
);

CREATE TABLE assessment_form_template_section_assignee (
    id text,
    assessment_form_template_id text,
    assessment_form_template_section_id text,
    PRIMARY KEY (id, assessment_form_template_id, assessment_form_template_section_id),
    FOREIGN KEY (assessment_form_template_id) REFERENCES assessment_form_template_section(assessment_form_template_id),
    FOREIGN KEY (assessment_form_template_section_id) REFERENCES assessment_form_template_section(id)
);

CREATE TABLE assessment_form_template_section_external_assignee (
    id text,
    assessment_form_template_id text,
    assessment_form_template_section_id text,
    email text,
    PRIMARY KEY (id, assessment_form_template_id, assessment_form_template_section_id),
    FOREIGN KEY (assessment_form_template_id) REFERENCES assessment_form_template_section(assessment_form_template_id),
    FOREIGN KEY (assessment_form_template_section_id) REFERENCES assessment_form_template_section(id)
);

CREATE TABLE assessment_form_template_section (
    id text,
    assessment_form_template_id text,
    "index" text,
    is_reviewed text,
    "status" text,
    title text,
    PRIMARY KEY (id, assessment_form_template_id),
    FOREIGN KEY (assessment_form_template_id) REFERENCES assessment_form_template(id)
);

CREATE TABLE assessment_form_template_attribute_key (
    assessment_form_template_id text,
    id text,
    PRIMARY KEY (assessment_form_template_id, id),
    FOREIGN KEY (assessment_form_template_id) REFERENCES assessment_form_template(id),
    FOREIGN KEY (id) REFERENCES attribute_key(id)
);

CREATE TABLE assessment_form_template (
    id text,
    creator_id text,
    last_editor_id text,
    assessment_email_set_id text,
    created_at text,
    description text,
    is_archived text,
    is_locked text,
    parent_id text,
    retention_schedule_id text,
    "source" text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (last_editor_id) REFERENCES users(id)
);

CREATE TABLE process_purpose_attribute_value (
    attribute_value_id text,
    process_purpose_id text,
    PRIMARY KEY (attribute_value_id, process_purpose_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id)
);

CREATE TABLE process_purpose_team (
    process_purpose_id text,
    team_id text,
    PRIMARY KEY (process_purpose_id, team_id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE process_purpose_user (
    process_purpose_id text,
    user_id text,
    PRIMARY KEY (process_purpose_id, user_id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE process_purpose_data_subcategory (
    data_subcategory_id text,
    process_purpose_id text,
    id text,
    PRIMARY KEY (data_subcategory_id, process_purpose_id),
    FOREIGN KEY (process_purpose_id) REFERENCES process_purpose(id),
    FOREIGN KEY (id) REFERENCES data_subcategory(id)
);

CREATE TABLE process_purpose (
    id text,
    description text,
    is_default text,
    "name" text,
    purpose text,
    PRIMARY KEY (id)
);

CREATE TABLE sub_datapoint_subcategory (
    data_subcategory_id text,
    sub_datapoint_id text,
    PRIMARY KEY (data_subcategory_id, sub_datapoint_id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id),
    FOREIGN KEY (sub_datapoint_id) REFERENCES sub_datapoint(id)
);

CREATE TABLE sub_datapoint_category (
    id text,
    sub_datapoint_id text,
    data_subcategory_id text,
    classifier_version text,
    confidence text,
    "status" text,
    PRIMARY KEY (id, sub_datapoint_id),
    FOREIGN KEY (sub_datapoint_id) REFERENCES sub_datapoint(id),
    FOREIGN KEY (data_subcategory_id) REFERENCES data_subcategory(id)
);

CREATE TABLE sub_datapoint_subject (
    sub_datapoint_id text,
    subject_id text,
    PRIMARY KEY (sub_datapoint_id, subject_id),
    FOREIGN KEY (sub_datapoint_id) REFERENCES sub_datapoint(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);

CREATE TABLE sub_datapoint_purpose (
    purpose_id text,
    sub_datapoint_id text,
    PRIMARY KEY (purpose_id, sub_datapoint_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(id),
    FOREIGN KEY (sub_datapoint_id) REFERENCES sub_datapoint(id)
);

CREATE TABLE sub_datapoint_attribute_value (
    attribute_value_id text,
    sub_datapoint_id text,
    PRIMARY KEY (attribute_value_id, sub_datapoint_id),
    FOREIGN KEY (attribute_value_id) REFERENCES attribute_value(id),
    FOREIGN KEY (sub_datapoint_id) REFERENCES sub_datapoint(id)
);

CREATE TABLE sub_datapoint (
    id text,
    data_silo_id text,
    datapoint_id text,
    access_request_visibility_enabled text,
    can_refetch_sample text,
    content_classification_status text,
    controllership text,
    created_at text,
    description text,
    erasure_request_redaction_enabled text,
    last_classified_at text,
    "name" text,
    retention_period text,
    retention_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_silo_id) REFERENCES data_silo(id),
    FOREIGN KEY (datapoint_id) REFERENCES datapoint(id)
);

CREATE TABLE attribute_value (
    id text,
    attribute_key_id text,
    assessment_id text,
    assessment_type text,
    can_delete text,
    color text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_key_id) REFERENCES attribute_key(id)
);
