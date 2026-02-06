CREATE TABLE course_progress (
    course_id text,
    user_id text,
    completed_at text,
    completed_lessons text,
    completion_expiry_date text,
    due_at text,
    opened_at text,
    progress_percent text,
    score text,
    total_lessons text,
    user_external_id text,
    PRIMARY KEY (course_id, user_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE incident_category_item (
    id text,
    incident_category_id text,
    question_id text,
    is_disabled text,
    is_mandatory text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, incident_category_id),
    FOREIGN KEY (incident_category_id) REFERENCES incident_category(id),
    FOREIGN KEY (question_id) REFERENCES incident_question(question_id)
);

CREATE TABLE incident_category (
    id text,
    description text,
    display_order text,
    is_visible text,
    "key" text,
    label text,
    use_category_access_whitelist text,
    PRIMARY KEY (id)
);

CREATE TABLE response (
    id text,
    response_set_id text,
    label text,
    short_label text,
    PRIMARY KEY (id, response_set_id),
    FOREIGN KEY (response_set_id) REFERENCES response_set(id)
);

CREATE TABLE response_set (
    id text,
    created_at text,
    modified_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    active text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    last_seen_at text,
    organisation_id text,
    seat_type text,
    PRIMARY KEY (id)
);

CREATE TABLE folder_ancestor (
    folder_id text,
    id text,
    PRIMARY KEY (folder_id, id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    created_at text,
    creator_id text,
    deleted text,
    folder_members_count text,
    has_children text,
    members_count text,
    meta_label text,
    modified_at timestamp,
    "name" text,
    org_id text,
    PRIMARY KEY (id)
);

CREATE TABLE template_item_children (
    id text,
    template_id text,
    template_item_id text,
    children jsonb,
    label text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, template_id, template_item_id),
    FOREIGN KEY (template_id) REFERENCES template_item(template_id),
    FOREIGN KEY (template_item_id) REFERENCES template_item(id)
);

CREATE TABLE template_item (
    id text,
    template_id text,
    label text,
    "section" jsonb,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_response (
    response_id text,
    color text,
    is_grs text,
    label text,
    response_set_id text,
    score text,
    score_enabled text,
    template_id text,
    PRIMARY KEY (response_id)
);

CREATE TABLE template_title_rule (
    "index" text,
    template_id text,
    rule text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_media (
    id text,
    template_id text,
    filename text,
    media_type text,
    token text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    access_level text,
    added_at text,
    archived text,
    author_id text,
    created_at text,
    date_draft_modified text,
    description text,
    draft_author_name text,
    global_response_set jsonb,
    is_locked_from_shared_library text,
    last_used text,
    mandatory_mark_as_complete text,
    metadata_image_filename text,
    metadata_image_id text,
    metadata_image_media_type text,
    metadata_image_token text,
    modified_at text,
    "name" text,
    origin_information text,
    owner_id text,
    revision_id text,
    revision_key text,
    support_site_as_question_type text,
    translation_id text,
    PRIMARY KEY (id)
);

CREATE TABLE template_permission (
    id text,
    template_id text,
    permission text,
    "type" text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE schedule_item_reminder (
    "index" text,
    schedule_item_id text,
    duration text,
    event text,
    PRIMARY KEY ("index", schedule_item_id),
    FOREIGN KEY (schedule_item_id) REFERENCES schedule_item(id)
);

CREATE TABLE schedule_item_assignee (
    id text,
    schedule_item_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, schedule_item_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (schedule_item_id) REFERENCES schedule_item(id)
);

CREATE TABLE schedule_item (
    id text,
    asset_id text,
    creator_id text,
    can_late_submit text,
    created_at text,
    description text,
    document_id text,
    document_name text,
    document_type text,
    duration text,
    from_date text,
    location_id text,
    modified_at text,
    must_complete text,
    next_occurrence_due text,
    next_occurrence_start text,
    recurrence text,
    site_based_assignment_enabled text,
    start_time_hour text,
    start_time_minute text,
    "status" text,
    timezone text,
    to_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE incident_question_choice (
    id text,
    incident_id text,
    question_id text,
    text text,
    PRIMARY KEY (id, incident_id, question_id),
    FOREIGN KEY (incident_id) REFERENCES incident_question(incident_id),
    FOREIGN KEY (question_id) REFERENCES incident_question(question_id)
);

CREATE TABLE incident_question_answer (
    answer_id text,
    incident_id text,
    question_id text,
    choice_id text,
    answered_at text,
    text text,
    PRIMARY KEY (answer_id, incident_id, question_id),
    FOREIGN KEY (incident_id) REFERENCES incident_question(incident_id),
    FOREIGN KEY (question_id) REFERENCES incident_question(question_id),
    FOREIGN KEY (choice_id) REFERENCES incident_question_choice(id)
);

CREATE TABLE incident_question (
    question_id text,
    incident_id text,
    is_answered text,
    is_mandatory text,
    text text,
    "type" text,
    PRIMARY KEY (question_id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE inspection_answer (
    inspection_id text,
    question_id text,
    address_answer text,
    asset_answer text,
    calculation_answer jsonb,
    checkbox_answer text,
    datetime_answer text,
    drawing_answer jsonb,
    dynamicfield_answer jsonb,
    list_answer jsonb,
    location jsonb,
    media_answer jsonb,
    modified_at text,
    question_answer jsonb,
    signature_answer jsonb,
    site_answer jsonb,
    slider_answer jsonb,
    switch_answer text,
    temperature_answer jsonb,
    text_answer text,
    PRIMARY KEY (inspection_id, question_id)
);

CREATE TABLE course (
    id text,
    branding_image_url text,
    created_datetime text,
    description text,
    due_by text,
    duration text,
    external_id text,
    is_mandatory text,
    is_published text,
    lesson_count text,
    locale text,
    logo_url text,
    modified_datetime text,
    "status" text,
    thumbnail_url text,
    title text,
    translation_original_course_external_id text,
    translation_original_course_id text,
    PRIMARY KEY (id)
);

CREATE TABLE group_member (
    groups_id text,
    user_id text,
    PRIMARY KEY (groups_id, user_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    description text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE site (
    id text,
    creator_id text,
    deleted text,
    meta_label text,
    "name" text,
    organisation_id text,
    parent_id text,
    site_uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE asset_media (
    id text,
    asset_id text,
    filename text,
    media_type text,
    token text,
    PRIMARY KEY (id, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_field (
    field_id text,
    asset_id text,
    currency_code text,
    currency_nanos text,
    currency_unit text,
    custom_id text,
    field_type text,
    id text,
    "name" text,
    string_value text,
    timestamp_value text,
    value_type text,
    visible text,
    PRIMARY KEY (field_id, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset (
    id text,
    code text,
    created_at text,
    custom_id text,
    inspected_at text,
    modified_at timestamp,
    "name" text,
    profile_image_filename text,
    profile_image_id text,
    profile_image_media_type text,
    profile_image_token text,
    site_id text,
    site_name text,
    sourced_from_external_system text,
    "state" text,
    "type" text,
    type_id text,
    PRIMARY KEY (id)
);

CREATE TABLE incident_collaborator (
    id text,
    incident_id text,
    contributor_id text,
    user_id text,
    assigned_role text,
    external_user_email text,
    external_user_id text,
    group_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (contributor_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE incident_reference (
    id text,
    incident_id text,
    "type" text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_label (
    label_id text,
    incident_id text,
    PRIMARY KEY (label_id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_media (
    id text,
    incident_id text,
    filename text,
    media_type text,
    token text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident (
    id text,
    asset_id text,
    category_id text,
    creator_id text,
    inspection_id text,
    template_id text,
    administrative_area text,
    completed_at text,
    country text,
    created_at text,
    description text,
    due_at text,
    iso_country_code text,
    locality text,
    modified_at timestamp,
    "name" text,
    occurred_at text,
    postal_code text,
    priority_id text,
    site_area text,
    site_id text,
    site_name text,
    site_region text,
    status_display_order text,
    status_id text,
    status_key text,
    status_label text,
    sub_administrative_area text,
    sub_locality text,
    sub_thoroughfare text,
    thoroughfare text,
    title text,
    "type" text,
    unique_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (category_id) REFERENCES incident_category(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (inspection_id) REFERENCES inspection(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE schedule_occurrence (
    id text,
    audit_id text,
    template_id text,
    assignee_status text,
    completed_at timestamp,
    due_time timestamp,
    miss_time timestamp,
    note text,
    occurrence_id text,
    occurrence_status text,
    organisation_id text,
    schedule_id text,
    start_time timestamp,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (audit_id) REFERENCES inspection(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE "action" (
    id text,
    assignee_id text,
    action_id text,
    modified_at text,
    "name" text,
    organisation_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE inspection (
    id text,
    asset_id text,
    template_id text,
    archived text,
    author_id text,
    author_name text,
    client_site text,
    conducted_on text,
    created_at text,
    date_completed text,
    date_modified text,
    date_started text,
    document_no text,
    duration text,
    latitude text,
    location text,
    longitude text,
    max_score text,
    modified_at text,
    "name" text,
    organisation_id text,
    owner_id text,
    owner_name text,
    personnel text,
    prepared_by text,
    score text,
    score_percentage text,
    site_id text,
    template_author text,
    template_name text,
    web_report_link text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE inspection_items (
    id text,
    audit_id text,
    template_id text,
    category text,
    category_id text,
    combined_max_score text,
    combined_score text,
    combined_score_percentage text,
    "comment" text,
    created_at timestamp,
    inactive text,
    is_failed_response text,
    item_id text,
    item_index text,
    label text,
    location_latitude text,
    location_longitude text,
    mandatory text,
    max_score text,
    media_files text,
    media_hypertext_reference text,
    media_ids text,
    modified_at timestamp,
    organisation_id text,
    parent_id text,
    primeelement_id text,
    primeelement_index text,
    response text,
    response_id text,
    response_set_id text,
    score text,
    score_percentage text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (audit_id) REFERENCES inspection(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);
