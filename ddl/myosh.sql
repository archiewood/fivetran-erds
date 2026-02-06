CREATE TABLE record_read_access_role (
    "index" text,
    record_id text,
    "role" text,
    PRIMARY KEY ("index", record_id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record_schedule (
    "index" text,
    record_id text,
    day_of_month text,
    hour_of_day text,
    schedule_type text,
    PRIMARY KEY ("index", record_id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record_field_trigger (
    field_id text,
    record_id text,
    first_occurence text,
    repeat_every text,
    PRIMARY KEY (field_id, record_id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record_fields_to_question_with_answer (
    "index" text,
    record_id text,
    answer_id text,
    file text,
    image text,
    int_value text,
    linked_record_id text,
    observation text,
    question_id text,
    PRIMARY KEY ("index", record_id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record (
    id text,
    form_id text,
    module_id text,
    archived_step text,
    complete text,
    creation_date text,
    deleted text,
    display_text text,
    fields_to_additional_values jsonb,
    fields_to_values jsonb,
    form_version text,
    has_normal_reverse_record text,
    important text,
    important_doc_no text,
    invitation jsonb,
    last_modified timestamp,
    link_url text,
    location_lat text,
    location_lon text,
    persisted_since_last_edit text,
    record jsonb,
    scheduled_record_default_setting text,
    scheduled_record_name text,
    scheduled_record_work_flow_step text,
    source_id text,
    version_state text,
    workflow_step_histories text,
    workflow_step_history jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (module_id) REFERENCES module(id)
);

CREATE TABLE "role" (
    id text,
    manager_locale_id text,
    "admin" text,
    layout_admin text,
    manager_email text,
    manager_locale_date_format text,
    manager_locale_language_tag text,
    restrict_create_individual_tab text,
    visible_in_ui text,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_locale_id) REFERENCES locale(id)
);

CREATE TABLE risk_matrix (
    id text,
    consequence_description text,
    consequence_descriptions_en_au text,
    consequence_id text,
    consequence_name text,
    consequence_names_en_au text,
    consequence_position text,
    likelihood_description text,
    likelihood_id text,
    likelihood_name text,
    likelihood_names_en_au text,
    likelihood_position text,
    rating text,
    risk_level_background_color text,
    risk_level_category text,
    risk_level_color text,
    risk_level_descripations_en_au text,
    risk_level_id text,
    risk_level_name text,
    risk_level_names_en_au text,
    PRIMARY KEY (id)
);

CREATE TABLE competency (
    id text,
    archived text,
    author text,
    cost text,
    "name" text,
    proficiency text,
    training_time text,
    PRIMARY KEY (id)
);

CREATE TABLE site_area (
    "index" text,
    site_id text,
    area text,
    PRIMARY KEY ("index", site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_supervisor (
    "index" text,
    site_id text,
    supervisor text,
    PRIMARY KEY ("index", site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_accountable (
    "index" text,
    site_id text,
    accountable text,
    PRIMARY KEY ("index", site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    archived text,
    country text,
    last_modified text,
    site text,
    soft_deleted text,
    unid text,
    PRIMARY KEY (id)
);

CREATE TABLE form_field_group_field (
    "index" text,
    form_field_group_index text,
    form_id text,
    allow_new_value text,
    default_value text,
    field_label text,
    field_name text,
    field_type text,
    help text,
    hint text,
    metadata text,
    "position" text,
    required text,
    search_full text,
    "source" jsonb,
    summary_field text,
    target_form_id text,
    target_module_id text,
    validation jsonb,
    visibility_conditions jsonb,
    -- custom_field_label_names_* (dynamic column),
    PRIMARY KEY ("index", form_field_group_index, form_id),
    FOREIGN KEY (form_field_group_index) REFERENCES form_field_group("index"),
    FOREIGN KEY (form_id) REFERENCES form_field_group(form_id)
);

CREATE TABLE form_field_group (
    "index" text,
    form_id text,
    field_group_name text,
    parent_key text,
    visibility_condition text,
    -- custom_field_group_name_* (dynamic column),
    PRIMARY KEY ("index", form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form_next_step (
    "index" text,
    form_id text,
    form_workflow_step_id text,
    button_label text,
    close_on_save text,
    "condition" jsonb,
    next_step text,
    prompt_before_advance text,
    skip_mandatory_field_validation text,
    -- custom_button_label_name_* (dynamic column),
    PRIMARY KEY ("index", form_id, form_workflow_step_id),
    FOREIGN KEY (form_id) REFERENCES form_workflow_step(form_id),
    FOREIGN KEY (form_workflow_step_id) REFERENCES form_workflow_step(id)
);

CREATE TABLE form_field_group_read (
    "index" text,
    form_id text,
    form_workflow_step_id text,
    field_groups_read text,
    PRIMARY KEY ("index", form_id, form_workflow_step_id),
    FOREIGN KEY (form_id) REFERENCES form_workflow_step(form_id),
    FOREIGN KEY (form_workflow_step_id) REFERENCES form_workflow_step(id)
);

CREATE TABLE form_field_group_edit (
    "index" text,
    form_id text,
    form_workflow_step_id text,
    field_groups_edit text,
    PRIMARY KEY ("index", form_id, form_workflow_step_id),
    FOREIGN KEY (form_id) REFERENCES form_workflow_step(form_id),
    FOREIGN KEY (form_workflow_step_id) REFERENCES form_workflow_step(id)
);

CREATE TABLE form_workflow_step (
    id text,
    form_id text,
    background_color text,
    edit_role jsonb,
    is_archived_step text,
    is_draft text,
    is_progress text,
    is_record_read text,
    progress_user_field text,
    read_role jsonb,
    record_readable_field text,
    record_readable_field_by_manager text,
    record_readable_keyword text,
    record_readable_keyword_by_manager text,
    status_label text,
    -- custom_status_label_name_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form (
    id text,
    module_id text,
    autopopulate_from_user_hierarchy text,
    autopopulate_hierarchy_person_field text,
    create_record text,
    default_display_option text,
    default_form text,
    delete_record text,
    edit_record text,
    enabled_for_mobile text,
    form_name text,
    full_name_field text,
    hierarchy_access_restriction_ignore_mode text,
    hierarchy_hidden_in_read_mode text,
    ignore_hierarchy_access text,
    important_conditions_enabled text,
    initial_form_type text,
    last_modified text,
    module_icon text,
    module_name text,
    module_visibility text,
    new_record_button_visible text,
    not_display_in_forms text,
    not_display_in_home_page text,
    read_record text,
    removed text,
    show_records_for text,
    sign_in_step text,
    sign_in_type text,
    sign_out_step text,
    sync_all_records text,
    version text,
    version_type text,
    visitor_form text,
    workflow_initialstep text,
    -- custom_form_name_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (module_id) REFERENCES module(id)
);

CREATE TABLE module (
    id text,
    display_in_mobile text,
    icon text,
    module_name text,
    source_url text,
    "type" text,
    view_id text,
    -- custom_module_names_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE locale (
    id text,
    date_format text,
    language_tag text,
    PRIMARY KEY (id)
);

CREATE TABLE occupation_role (
    "index" text,
    occupation_id text,
    "role" text,
    PRIMARY KEY ("index", occupation_id),
    FOREIGN KEY (occupation_id) REFERENCES occupation(id)
);

CREATE TABLE occupation_hierarchy_field_access (
    "index" text,
    occupation_id text,
    hierarchy_field text,
    "value" text,
    PRIMARY KEY ("index", occupation_id),
    FOREIGN KEY (occupation_id) REFERENCES occupation(id),
    FOREIGN KEY (hierarchy_field) REFERENCES hierarchy("name")
);

CREATE TABLE occupation (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE users_role (
    "index" text,
    users_id text,
    "role" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    locale_id text,
    doc_number text,
    email text,
    fields_to_values_affiliation text,
    fields_to_values_archived text,
    fields_to_values_email text,
    fields_to_values_employee_id text,
    fields_to_values_external_user text,
    fields_to_values_external_user_active text,
    fields_to_values_first_name text,
    fields_to_values_last_name text,
    fields_to_values_ldap_super_user text,
    fields_to_values_login_required text,
    fields_to_values_manager text,
    fields_to_values_manager_id text,
    fields_to_values_occupation text,
    fields_to_values_password text,
    fields_to_values_phone text,
    fields_to_values_retype_password text,
    fields_to_values_secondary_occupation text,
    fields_to_values_super_user text,
    fields_to_values_unid_domino_key text,
    fields_to_values_username text,
    first_name text,
    full_name text,
    last_modified timestamp,
    last_name text,
    pref_name text,
    preferred_language text,
    read_access_roles jsonb,
    start_date text,
    unid text,
    virtual_super_user text,
    PRIMARY KEY (id),
    FOREIGN KEY (locale_id) REFERENCES locale(id)
);

CREATE TABLE users_hierarchy (
    _fivetran_id text,
    hierarchy_field text,
    users_id text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (hierarchy_field) REFERENCES hierarchy("name"),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE hierarchy (
    id text,
    "name" text,
    weight text,
    PRIMARY KEY (id)
);

CREATE TABLE hierarchy_entity (
    id text,
    hierarchy_id text,
    archived text,
    geofence_enabled text,
    geofence_radius text,
    is_geofence_enabled text,
    last_modified text,
    latitude text,
    longitude text,
    "name" text,
    names_en_au text,
    parent_value_id text,
    "type" text,
    PRIMARY KEY (id, hierarchy_id),
    FOREIGN KEY (hierarchy_id) REFERENCES hierarchy(id)
);
