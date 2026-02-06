CREATE TABLE partial_submission_data (
    "index" text,
    partial_submission_id text,
    field text,
    "value" text,
    PRIMARY KEY ("index", partial_submission_id),
    FOREIGN KEY (partial_submission_id) REFERENCES partial_submission(id),
    FOREIGN KEY (field) REFERENCES form_field(id)
);

CREATE TABLE partial_submission (
    id text,
    form_id text,
    date_timestamp text,
    latitude text,
    longitude text,
    remote_addr text,
    user_agent text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form_field (
    id text,
    form_id text,
    default_value text,
    description text,
    hidden text,
    hide_label text,
    label text,
    "name" text,
    options jsonb,
    read_only text,
    required text,
    show_initial text,
    show_middle text,
    show_prefix text,
    show_suffix text,
    text_size text,
    "type" text,
    uniq text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form (
    id text,
    folder_id text,
    last_submission_id text,
    can_access_1_q_feature text,
    can_edit text,
    created text,
    data_url text,
    db text,
    deleted text,
    edit_url text,
    encrypted text,
    has_approvers text,
    html text,
    inactive text,
    is_workflow_form text,
    is_workflow_published text,
    javascript text,
    language_code text,
    last_submission_time text,
    "name" text,
    num_columns text,
    permission text,
    progress_meter text,
    should_display_one_question_at_a_time text,
    submissions_today text,
    submissions_unread text,
    submit_button_title text,
    summary_url text,
    thumbnail_url text,
    timezone text,
    updated text,
    url text,
    v_4_html text,
    version text,
    view_key text,
    views text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (last_submission_id) REFERENCES form_submission(id)
);

CREATE TABLE form_submission_data (
    field text,
    submission_id text,
    "value" text,
    PRIMARY KEY (field, submission_id),
    FOREIGN KEY (field) REFERENCES form_field(id),
    FOREIGN KEY (submission_id) REFERENCES form_submission(id)
);

CREATE TABLE form_submission (
    id text,
    form_id text,
    approval_status text,
    date_timestamp text,
    latitude text,
    longitude text,
    payment_status text,
    portal_form_name text,
    portal_name text,
    portal_participant_email text,
    pretty_field_id text,
    "read" text,
    remote_addr text,
    user_agent text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE sub_folder (
    id text,
    parent_id text,
    "name" text,
    permission text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    parent_id text,
    "name" text,
    permission text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES folder(id)
);
