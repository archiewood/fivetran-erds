CREATE TABLE calendar_availability (
    "index" text,
    calendar_id text,
    "date" text,
    deleted text,
    hours jsonb,
    PRIMARY KEY ("index", calendar_id),
    FOREIGN KEY (calendar_id) REFERENCES calendar(id)
);

CREATE TABLE calendar_location_configuration (
    meeting_id text,
    calendar_id text,
    kind text,
    location text,
    PRIMARY KEY (meeting_id, calendar_id),
    FOREIGN KEY (calendar_id) REFERENCES calendar(id)
);

CREATE TABLE calendar_team_member_location_configuration (
    meeting_id text,
    calendar_id text,
    calendar_team_member_id text,
    kind text,
    location text,
    PRIMARY KEY (meeting_id, calendar_id, calendar_team_member_id),
    FOREIGN KEY (calendar_id) REFERENCES calendar_team_member(calendar_id),
    FOREIGN KEY (calendar_team_member_id) REFERENCES calendar_team_member(id)
);

CREATE TABLE calendar_team_member (
    id text,
    calendar_id text,
    is_primary text,
    priority text,
    PRIMARY KEY (id, calendar_id),
    FOREIGN KEY (calendar_id) REFERENCES calendar(id)
);

CREATE TABLE calendar (
    id text,
    form_id text,
    alert_email text,
    allow_booking_after text,
    allow_booking_after_unit text,
    allow_booking_for text,
    allow_booking_for_unit text,
    allow_cancellation text,
    allow_reschedule text,
    appointment_per_day text,
    appointment_per_slot text,
    auto_confirm text,
    availability_type text,
    calendar_cover_image text,
    calendar_type text,
    consent_label text,
    description text,
    enable_recurring text,
    event_color text,
    event_title text,
    event_type text,
    form_submit_redirect_url text,
    form_submit_thanks_message text,
    form_submit_type text,
    google_invitation_emails text,
    group_id text,
    guest_type text,
    is_active text,
    is_live_payment_mode text,
    location_id text,
    look_busy_config_default_value text,
    look_busy_config_enabled text,
    look_busy_config_percentage text,
    "name" text,
    notes text,
    open_hour jsonb,
    pixel_id text,
    pre_buffer text,
    pre_buffer_unit text,
    recurring_booking_option text,
    recurring_booking_overlap_default_status text,
    recurring_count text,
    recurring_freq text,
    should_assign_contact_to_team_member text,
    should_send_alert_emails_to_assigned_member text,
    should_skip_assigning_contact_for_existing text,
    slot_buffer_unit text,
    slot_duration text,
    slot_duration_unit text,
    slot_interval text,
    slug text,
    sticky_contact text,
    widget_slug text,
    widget_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE note (
    id text,
    contact_id text,
    body text,
    date_added timestamp,
    user_id text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE calendar_event_user (
    id text,
    calendar_event_id text,
    PRIMARY KEY (id, calendar_event_id),
    FOREIGN KEY (calendar_event_id) REFERENCES calendar_event(id)
);

CREATE TABLE calendar_event (
    id text,
    calendar_id text,
    contact_id text,
    address text,
    appointment_status text,
    assigned_resources jsonb,
    assigned_user_id text,
    created_by_source text,
    created_by_user_id text,
    date_added timestamp,
    date_updated timestamp,
    description text,
    end_time timestamp,
    group_id text,
    is_recurring text,
    location_id text,
    master_event_id text,
    note text,
    rrule text,
    start_time timestamp,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (calendar_id) REFERENCES calendar(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE funnel (
    id text,
    date_added timestamp,
    date_updated timestamp,
    deleted text,
    domain_id text,
    fav_icon_url text,
    global_sections_path text,
    global_sections_url text,
    is_store_active text,
    location_id text,
    "name" text,
    order_form_version text,
    origin_id text,
    steps jsonb,
    tracking_code_body text,
    tracking_code_head text,
    "type" text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE opportunity_task (
    id text,
    opportunity_id text,
    body text,
    business_id text,
    completed text,
    created_at timestamp,
    created_by_channel text,
    created_by_source text,
    created_by_source_id text,
    date_added timestamp,
    date_updated timestamp,
    description text,
    due_date timestamp,
    last_updated_by_channel text,
    last_updated_by_source text,
    last_updated_by_source_id text,
    location_id text,
    recurring_task_id text,
    relations jsonb,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_note (
    id text,
    opportunity_id text,
    body text,
    body_text text,
    company_id text,
    created_by_channel text,
    created_by_source text,
    created_by_time_stamp text,
    created_by_user_id text,
    date_added timestamp,
    date_updated timestamp,
    deleted text,
    last_updated_by_channel text,
    last_updated_by_source text,
    last_updated_by_time_stamp text,
    last_updated_by_user_id text,
    location_id text,
    relations jsonb,
    updated_at text,
    user_id text,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_relation (
    "index" text,
    opportunity_id text,
    association_id text,
    attributed text,
    company_name text,
    contact_name text,
    email text,
    full_name text,
    is_primary text,
    object_key text,
    phone text,
    record_id text,
    relation_id text,
    tags jsonb,
    PRIMARY KEY ("index", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_custom_field (
    id text,
    opportunity_id text,
    field_value jsonb,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity (
    id text,
    contact_id text,
    pipeline_id text,
    assigned_to text,
    attributions jsonb,
    calendar jsonb,
    contact_name text,
    contact_score jsonb,
    created_at timestamp,
    followers jsonb,
    index_version text,
    last_action_date timestamp,
    last_stage_change_at timestamp,
    last_status_change_at timestamp,
    location_id text,
    lost_reason_id text,
    monetary_value text,
    "name" text,
    pipeline_stage_id text,
    pipeline_stage_uid text,
    "source" text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_stage (
    id text,
    pipeline_id text,
    "name" text,
    "position" text,
    show_in_funnel text,
    show_in_pie_chart text,
    PRIMARY KEY (id, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline (
    id text,
    date_added timestamp,
    date_updated timestamp,
    location_id text,
    "name" text,
    show_in_funnel text,
    show_in_pie_chart text,
    PRIMARY KEY (id)
);

CREATE TABLE task (
    id text,
    contact_id text,
    assigned_to text,
    body text,
    completed text,
    due_date timestamp,
    title text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE form (
    id text,
    location_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_custom_field (
    id text,
    contact_id text,
    "value" jsonb,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    additional_email jsonb,
    additional_phones jsonb,
    address text,
    assigned_to text,
    business_id text,
    business_name text,
    city text,
    company_name text,
    country text,
    date_added timestamp,
    date_of_birth text,
    date_updated timestamp,
    dnd text,
    dnd_setting jsonb,
    email text,
    first_name text,
    followers jsonb,
    last_name text,
    location_id text,
    phone text,
    phone_label text,
    postal_code text,
    "source" text,
    "state" text,
    tags jsonb,
    "type" text,
    valid_email text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE submission (
    id text,
    contact_id text,
    form_id text,
    created_at timestamp,
    email text,
    location_id text,
    "name" text,
    others jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE conversation (
    id text,
    contact_id text,
    attributed text,
    company_name text,
    contact_name text,
    date_added timestamp,
    date_updated timestamp,
    email text,
    followers jsonb,
    full_name text,
    is_last_message_internal_comment text,
    last_message_body text,
    last_message_date timestamp,
    last_message_type text,
    location_id text,
    phone text,
    profile_photo text,
    scoring jsonb,
    tags jsonb,
    "type" text,
    unread_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);
