CREATE TABLE logic_action_history (
    _fivetran_id text,
    form_id text,
    logic_fivetran_id text,
    "action" text,
    detail_target_type text,
    detail_target_value text,
    detail_to_type text,
    detail_to_value text,
    detail_value_type text,
    detail_value_value text,
    PRIMARY KEY (_fivetran_id, form_id, logic_fivetran_id),
    FOREIGN KEY (logic_fivetran_id) REFERENCES form_logic_history(form_id)
);

CREATE TABLE form_logic_history (
    _fivetran_id text,
    field_ref text,
    form_id text,
    "type" text,
    PRIMARY KEY (_fivetran_id, field_ref, form_id),
    FOREIGN KEY (field_ref) REFERENCES form_field_history(form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE form_insight (
    platform text,
    form_id text,
    average_time bigint,
    completion_rate double precision,
    responses_count bigint,
    total_visits bigint,
    unique_visits bigint,
    PRIMARY KEY (platform, form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE response_answer (
    form_id text,
    field_id text,
    response_id text,
    boolean boolean,
    "date" text,
    email text,
    file_url text,
    number double precision,
    payment_amount text,
    payment_last_4 text,
    payment_name text,
    phone_number text,
    text text,
    "type" text,
    url text,
    PRIMARY KEY (form_id, field_id, response_id),
    FOREIGN KEY (field_id) REFERENCES form_field_history(form_id),
    FOREIGN KEY (response_id) REFERENCES response(form_id)
);

CREATE TABLE form_history (
    id text,
    theme_id text,
    workspace_id text,
    _language text,
    cui_setting_avatar text,
    cui_setting_is_typing_emulation_disabled boolean,
    cui_setting_typing_emulation_speed text,
    last_updated_at timestamp,
    title text,
    "type" text,
    variable_price text,
    variable_score integer,
    PRIMARY KEY (id),
    FOREIGN KEY (theme_id) REFERENCES theme(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE form_custom_message (
    form_id text,
    block_dropdown_hint text,
    block_dropdown_placeholder text,
    block_dropdown_placeholder_touch text,
    block_file_upload_choose text,
    block_file_upload_drag text,
    block_file_upload_uploading_progress text,
    block_legal_accept text,
    block_legal_reject text,
    block_longtext_hint text,
    block_multiple_choice_hint text,
    block_multiple_choice_other text,
    block_short_text_placeholder text,
    label_action_share text,
    label_button_ok text,
    label_button_review text,
    label_button_submit text,
    label_error_email_address text,
    label_error_expiry_month_title text,
    label_error_expiry_year_title text,
    label_error_incomplete_form text,
    label_error_max_length text,
    label_error_max_value text,
    label_error_min_value text,
    label_error_must_accept text,
    label_error_must_enter text,
    label_error_must_select text,
    label_error_range text,
    label_error_required text,
    label_error_server text,
    label_error_size_limit text,
    label_error_url text,
    label_hint_key text,
    label_no_default text,
    label_no_shortcut text,
    label_preview text,
    label_progress_percent text,
    label_progress_proportion text,
    label_warning_fallback_alert text,
    label_warning_form_unavailable text,
    label_warning_success text,
    label_yes_default text,
    label_yes_shortcut text,
    PRIMARY KEY (form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE response (
    id text,
    form_id text,
    calculated_score text,
    landed_at timestamp,
    landing_id text,
    response_type text,
    staged_at timestamp,
    submitted_at timestamp,
    token text,
    -- metadata_* (dynamic column),
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE response_answer_choice (
    choice_id text,
    field_id text,
    response_id text,
    choice_text text,
    ranking bigint,
    PRIMARY KEY (choice_id, field_id, response_id),
    FOREIGN KEY (response_id) REFERENCES response(form_id)
);

CREATE TABLE response_variable (
    "index" integer,
    response_id text,
    "key" text,
    number double precision,
    text text,
    "type" text,
    PRIMARY KEY ("index", response_id),
    FOREIGN KEY (response_id) REFERENCES response(form_id)
);

CREATE TABLE self_notification (
    recipient text,
    notification_fivetran_id text,
    PRIMARY KEY (recipient, notification_fivetran_id),
    FOREIGN KEY (notification_fivetran_id) REFERENCES setting_notification(form_id)
);

CREATE TABLE setting_notification (
    _fivetran_id text,
    form_id text,
    -- respondent_* (dynamic column),
    -- self_* (dynamic column),
    PRIMARY KEY (_fivetran_id, form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE form_field_history (
    id text,
    form_id text,
    form_parent_field_id text,
    layout_attachment_href text,
    layout_attachment_property_brightness text,
    layout_attachment_property_description text,
    layout_attachment_property_focal_point_x text,
    layout_attachment_property_focal_point_y text,
    layout_attachment_scale text,
    layout_attachment_type text,
    layout_placement text,
    layout_type text,
    ref text,
    title text,
    "type" text,
    -- property_* (dynamic column),
    -- validation_* (dynamic column),
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id),
    FOREIGN KEY (form_parent_field_id) REFERENCES form_field_history(form_id)
);

CREATE TABLE workspace_member (
    email text,
    workspace_id text,
    "name" text,
    "role" text,
    PRIMARY KEY (email, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE form_hidden_field_history (
    field text,
    form_id text,
    PRIMARY KEY (field, form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE theme (
    id text,
    background_brightness text,
    background_href text,
    background_layout text,
    field_alignment text,
    field_font_size text,
    font text,
    has_transparent_button boolean,
    "name" text,
    screen_alignment text,
    screen_font_size text,
    visibility text,
    -- color_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE form_field_choice_history (
    form_id text,
    id text,
    field_id text,
    attachment_href text,
    attachment_property_description text,
    attachment_type text,
    label text,
    ref text,
    PRIMARY KEY (form_id, id, field_id),
    FOREIGN KEY (field_id) REFERENCES form_field_history(form_id)
);

CREATE TABLE logic_action_condition_history (
    _fivetran_id text,
    form_id text,
    logic_action_fivetran_id text,
    op text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id, form_id, logic_action_fivetran_id),
    FOREIGN KEY (logic_action_fivetran_id) REFERENCES logic_action_history(form_id)
);

CREATE TABLE response_tag (
    "name" text,
    response_id text,
    PRIMARY KEY ("name", response_id),
    FOREIGN KEY (response_id) REFERENCES response(form_id)
);

CREATE TABLE form_setting (
    form_id text,
    _language text,
    are_uploads_public boolean,
    facebook_pixel text,
    google_analytics text,
    google_tag_manager text,
    hide_navigation boolean,
    is_public boolean,
    is_trial boolean,
    progress_bar text,
    redirect_after_submit_url text,
    show_progress_bar boolean,
    show_time_to_complete boolean,
    show_typeform_branding boolean,
    -- meta_* (dynamic column),
    PRIMARY KEY (form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE form_field_insight (
    id text,
    form_id text,
    dropoffs bigint,
    label text,
    ref text,
    title text,
    "type" text,
    views bigint,
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form_history(id)
);

CREATE TABLE respondent_notification (
    reply_to text,
    notification_fivetran_id text,
    PRIMARY KEY (reply_to, notification_fivetran_id),
    FOREIGN KEY (notification_fivetran_id) REFERENCES setting_notification(form_id)
);

CREATE TABLE workspace (
    id text,
    account_id text,
    "default" boolean,
    "name" text,
    shared boolean,
    PRIMARY KEY (id)
);
